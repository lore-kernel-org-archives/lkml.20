Received: from canpmsgout11.his.huawei.com (canpmsgout11.his.huawei.com [113.46.200.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A94637755C;
	Wed, 30 Sep 2026 03:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790739564; cv=none; b=DRAlI8W9VzxoIzZIEg/1H+QO/TK61HU/XQ2BhizmX85SZRmcksFZFcsK4Dt/6ndBUgLsygn6DlXdarOLGH0oERyq6nabPtanELGZbnsoNqiMISU6XMWFVOcqc0RukImYA82DvZi4qZB6lSG5s1W2s+r/iTTOI+YHApCa4r3LnYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790739564; c=relaxed/simple;
	bh=NcV/PCYHQQ52eenZNEWwM67Cm7ohHgM2YVmMYxH91JU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Tgi4ZBgIy/bruh99s6u7utmKZi53d5/Ar6Xfgcc14wnl328RfiM5u0Fn3JLZsZfFVD3PlcxNv9TFWEkWNaM5adTTh5eaeOdWOih4b/Adz7DnhSzyLr+aDrcT4RifNIncC7pnyUjCROuU1em8skgU6gKXCjcOW8e0QqnIlP4/utY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=P0H08ec0; arc=none smtp.client-ip=113.46.200.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="P0H08ec0"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=SLIutbINyUxfzgpbpK82+SP/EDyFgkRQjDSgLC3GrNY=;
	b=P0H08ec0XYwH2E8bKrGzERzeS8i/YFQa0lBQ/QLRfwL1A8EmHEDms0Wpim1IBxsSpzwNOBdng
	jM2KoKyBF642eiOts7rC8GPPK6W7sR/XzAGg2pUVIFWMFIOk/dYJ0nwsm5gFy3ZVouXz5zIUKD6
	Lx8ehgTtC4dHvEOt4yCOiVU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hvgT06CLgzKm8V;
	Wed, 30 Sep 2026 11:27:00 +0800 (CST)
Received: from whupemp100012.china.huawei.com (unknown [7.152.185.135])
	by mail.maildlp.com (Postfix) with ESMTPS id BC78A4048B;
	Wed, 30 Sep 2026 11:39:13 +0800 (CST)
Received: from huawei.com (10.67.174.121) by whupemp100012.china.huawei.com
 (7.152.185.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:39:12 +0800
From: Yao Yiqi <yaoyiqi3@huawei.com>
To: Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] misc: fastrpc: Fix double free in fastrpc_req_mmap() error path
Date: Wed, 30 Sep 2026 03:20:22 +0000
Message-ID: <20260930032022.2957082-1-yaoyiqi3@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 whupemp100012.china.huawei.com (7.152.185.135)

fastrpc_req_mmap() adds the newly allocated buffer to fl->mmaps before
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

Remove the buffer from fl->mmaps before unmapping it and re-add it if the
unmap fails, matching the pattern now used in fastrpc_req_munmap().

Fixes: 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior to unmap operation")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
 drivers/misc/fastrpc.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..bc78ec07ab9b 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2159,6 +2159,9 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
+		spin_lock(&fl->lock);
+		list_del(&buf->node);
+		spin_unlock(&fl->lock);
 		goto err_assign;
 	}
 
@@ -2168,7 +2171,11 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 
 err_assign:
-	fastrpc_req_munmap_impl(fl, buf);
+	if (fastrpc_req_munmap_impl(fl, buf)) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
 
 	return err;
 }
-- 
2.34.1

