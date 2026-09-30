Received: from canpmsgout10.his.huawei.com (canpmsgout10.his.huawei.com [113.46.200.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5842B742;
	Wed, 30 Sep 2026 06:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751404; cv=none; b=jimMYJwCYurb2dTpJNlOZAx4dc7naJqOh9ls8SxvuI8wgVjqcFqAyQHbDdbhhz2Ca1bbipdTlut0zGbzd3SOGOoKuGb5+cGRgTNq2WeRK9X7Rwe/TTVYbkbhsPRAwIfv7Nqu0hBcxTM/Cm69KWmryjaN3tlieMW6MTeETrAkYR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751404; c=relaxed/simple;
	bh=icn74DL/Ofo1kzXbnNiU16sfb2pnKci1cF6fjW7T0Ws=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qvwuZykNzITnUtMTt0/xPKIXG7S8s2YKCgZR7N2+zziHZqSYfZ3ik584LIIi6pcGAUKDAWJgvc8VV9y+EQWtnkcXE/21swWh32vnviXS/irjOI4xhS4m7gBw7oRx8cs2tWvhWb57EcSVazLkdjMM5SQx+HnCdzbp2Kf9WjpJl1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=fsYLfzJZ; arc=none smtp.client-ip=113.46.200.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="fsYLfzJZ"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5caGH9k7TL80R+qXb9t1DYezqkEskhcX0AOfIPmFAqg=;
	b=fsYLfzJZdVvDWaNZFt8u5SH+8BkYuLadD/ILsGWILjhgTuNioKKfrvOFCrSNSWLw1AFVYXfN3
	NZWc6cCNigXsWd9SbKMg3/Nk5MPQWiJrdD/EpqMAfRDNVgfg+inCrVzPh7uB6kk7X1QT3z4Gsi/
	4jYFMG4mXvUrpI4td8dQ9h8=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4hvlrh12jCz1K96s;
	Wed, 30 Sep 2026 14:44:20 +0800 (CST)
Received: from whupemp100012.china.huawei.com (unknown [7.152.185.135])
	by mail.maildlp.com (Postfix) with ESMTPS id E47C94057A;
	Wed, 30 Sep 2026 14:56:29 +0800 (CST)
Received: from huawei.com (10.67.174.121) by whupemp100012.china.huawei.com
 (7.152.185.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:56:28 +0800
From: Yao Yiqi <yaoyiqi3@huawei.com>
To: Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] misc: fastrpc: Fix race and double free in fastrpc_req_mmap() error path
Date: Wed, 30 Sep 2026 06:37:38 +0000
Message-ID: <20260930063738.2966346-1-yaoyiqi3@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemp100012.china.huawei.com (7.152.185.135)

fastrpc_req_mmap() links the newly allocated buffer into fl->mmaps before
copying the response back to userspace. If copy_to_user() fails, the
err_assign path calls fastrpc_req_munmap_impl() to unmap the buffer from
the DSP and, on success, to free it.

Since commit 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior
to unmap operation"), fastrpc_req_munmap_impl() no longer removes the
buffer from fl->mmaps, as that is now the responsibility of the caller.
fastrpc_req_mmap() was not updated accordingly, so the buffer is freed
while still linked in the list. The fl->mmaps cleanup in
fastrpc_user_free() then calls list_del() and fastrpc_buf_free() on the
already freed buffer, resulting in a use-after-free and a double free.

Publishing the buffer before copy_to_user() returns is also racy:
another thread of the same process can read the DSP address from the
partially written user buffer (or via userfaultfd) and issue
FASTRPC_IOCTL_MUNMAP, which unlinks and frees the buffer while
fastrpc_req_mmap() is still using it.

Fix both issues by adding the buffer to fl->mmaps only after
copy_to_user() has succeeded. The error path then never has the buffer
linked, so it does not need to unlink it before unmapping.

Fixes: 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior to unmap operation")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
Changes in v2:
 - Link the buffer into fl->mmaps only after copy_to_user() succeeds.
   Besides fixing the double free, this also closes the concurrent
   FASTRPC_IOCTL_MUNMAP race reported against v1, where a partially
   written user buffer let another thread unmap and free the buffer
   while fastrpc_req_mmap() was still using it.

 drivers/misc/fastrpc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..d2c09bffd0af 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2153,15 +2153,15 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		}
 	}
 
-	spin_lock(&fl->lock);
-	list_add_tail(&buf->node, &fl->mmaps);
-	spin_unlock(&fl->lock);
-
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
 		goto err_assign;
 	}
 
+	spin_lock(&fl->lock);
+	list_add_tail(&buf->node, &fl->mmaps);
+	spin_unlock(&fl->lock);
+
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 		buf->raddr, buf->size);
 
-- 
2.34.1

