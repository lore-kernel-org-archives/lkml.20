Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF133AC0C1;
	Wed, 30 Sep 2026 07:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753563; cv=none; b=KLpW475RBr9IgWw39ANZ/GFvwgujMzQhTfJNTlJjq/rlHOZYkBNT3zJn4GjQUSL3WLaGp7wdGEllBYXAEwHyuDXfiMjDcYo6rWvq1qs+5D6fCXz7zQt3DXSsR/BDaD65gppqBrj4GrFeQB6x7GEeVMDMB9zND4SeEcJg2PdS4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753563; c=relaxed/simple;
	bh=XgZM57SLWF6tNhqiua/wmbRdox2xmPSiYXlMd7aq/Cs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RBs+J2CAQJKy5nWScmrerdNiPvObhiSxjseozzcsWBNDItEIoh/2VA3sfVJLLM1HSvvZvXuF+jBaw7L+6h4/ENq3FiHP0tw8D3ey7WOooo6DxSCV0JGkM+y4Ez8vxskPG3Uw8Vw0L/CZGeEzo+WJpr2Vse6Nf9yAW7TGgvkT/ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=tp3o3wI/; arc=none smtp.client-ip=113.46.200.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="tp3o3wI/"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iwOmrtb0OIOXZyVquKTR9hTqNjDTiyWg6esvAcvSlvA=;
	b=tp3o3wI/EHwCgzTqVMWLrYQUL6wr0VLhJzq62th4hx2aiyESgl47osIoI3liEtJ/JG6/HMuKi
	hABnTFoxnedelcC0z1fY4u9BcZT8pywWV1DPbRus7U1BCN1N7m4NTzRt3jmo56/efodQgspHk9Q
	6CB5VFGCw9WyEnV4vAdsqf8=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4hvmfs68j1zcb46;
	Wed, 30 Sep 2026 15:20:53 +0800 (CST)
Received: from whupemp100012.china.huawei.com (unknown [7.152.185.135])
	by mail.maildlp.com (Postfix) with ESMTPS id BC816203D1;
	Wed, 30 Sep 2026 15:32:30 +0800 (CST)
Received: from huawei.com (10.67.174.121) by whupemp100012.china.huawei.com
 (7.152.185.135) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:32:29 +0800
From: Yao Yiqi <yaoyiqi3@huawei.com>
To: Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>
CC: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] misc: fastrpc: Fix double free and races in fastrpc_req_mmap() error path
Date: Wed, 30 Sep 2026 07:13:40 +0000
Message-ID: <20260930071340.2969948-1-yaoyiqi3@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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

Fix this by adding the buffer to fl->mmaps only after copy_to_user() has
succeeded, so the buffer is not visible to a concurrent unmap while the
response is still being copied. If unmapping the buffer fails on the
error path, fastrpc_buf_free() is not called, so re-add the buffer to
fl->mmaps to keep it tracked and let fastrpc_user_free() reclaim it on
release instead of leaking the DMA allocation.

Fixes: 6102ceb4eab8 ("misc: fastrpc: Remove buffer from list prior to unmap operation")
Cc: stable@vger.kernel.org
Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
Changes in v3:
 - Re-add the buffer to fl->mmaps if unmapping it on the error path
   fails, since fastrpc_buf_free() is not called in that case and the
   DMA allocation would otherwise be leaked.

Changes in v2:
 - Link the buffer into fl->mmaps only after copy_to_user() succeeds.
   Besides fixing the double free, this also closes the concurrent
   FASTRPC_IOCTL_MUNMAP race, where a partially written user buffer let
   another thread unmap and free the buffer while fastrpc_req_mmap() was
   still using it.

 drivers/misc/fastrpc.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d4fac2caca86..917a5dfe3774 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2153,22 +2153,26 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
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

