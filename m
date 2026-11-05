Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=61.135.153.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793849688;
	b=ex3CkhQlJE66ZQaRTYFzSbkiaDhCHlVk44lSiL3OJRmV+NdkTYGf4dsEglkFv405k9DA
	 5x4q51Rr6kcfLZTTPFq/6+NUaYQEn26wDjWvVLvveByX+cBCx2+6AjeITPBvi1FQXajwL
	 c3157Xtykz6H/UAAvahE4bFPgPZPaeYJeTOdgcjpqSpemKWx+jkA3udXi61JY/bKRyM+H
	 qcbO/tPVdnBJNcfabyvnqcsufKEBw7VuuZvUnNGUKalNY6HRWkQnjNy7jQvLsQ6ButoCA
	 wAADCosW6eqlzTYIA0zaENNf/nX5V/IPIpAfpRgqR5iVmG/bO5qlfr5FkLEJREkQTxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793849688;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kSUqYVXd3fleCuc82dAmdXpBBmDiMLE5sH3ebajdc/s=;
	b=e8GUS5ulA9zmUnM3UnPhg8Yc/7KPWWvtWvw7fZKW4hdZBoHUNC496We677eTWHKFGS2T
	 AV9UrPXwB0N5VtLBYNFn2i0vByVQD+hI7gIWlFgDsIaxY4tAGmqpFxaaj7nVbCfnAFMNB
	 6F2vn7/YVUQ03yNO2Im3NbUOx/bqYCxg46SiMhpG5Zmf22h7cClKlIGw/a1aIpziZI5vE
	 hCVPqFFZyf231XFW8eUZZM/uyoSuF1sGDo9vy+fTW+Qi8F7JwIJH4VQ0UvY+3UG080+O9
	 hUQeQNo79tCqKf2p3SslxcSEmsr/Y/WsE0IP6JQkz9MFRN3z8+lOu9/pkH45WYfrtQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b="s/ONanSP";
	arc=none smtp.remote-ip=61.135.153.170
Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D894606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D894606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=s/ONanSP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793849683;
	bh=kSUqYVXd3fleCuc82dAmdXpBBmDiMLE5sH3ebajdc/s=;
	h=From:Subject:Date:Message-ID;
	b=s/ONanSPdo7LBG7puX6z8b1yTPQpeiTOAw3KDNhQzGyKz5fjYHwiZKK9Xmh+XAWHo
	 uhTwe/Y2beF5305rAbORLBX3AswmTd/cql2KUzTfLtfoc2nRsEPPPZT11VAl/2WxKM
	 70HTx4RfaghW8yslnXswM6W7AVh3MY9x5RleqA4Y=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.34) with ESMTP
	id 6AEBF94800005DA8; Thu, 5 Nov 2026 11:34:34 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 5622856292137
X-SMAIL-UIID: 8F42547E8B814353B99A1B6BAEBA918B-20261105-113434-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [media?] [dri?] kernel BUG in sync_timeline_signal
Date: Thu,  5 Nov 2026 11:34:31 +0800
Message-ID: <20261105033431.42266-1-eadavis@sina.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
References: <6aead2eb.3c6f2eba.20048d.0000.GAE@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6628e7d4c6b2

diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index dd07d128adc3..4d885c8e1d4f 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -320,8 +320,9 @@ static inline void dma_fence_put(struct dma_fence *fence)
 static inline struct dma_fence *dma_fence_get(struct dma_fence *fence)
 {
 	if (fence)
-		kref_get(&fence->refcount);
-	return fence;
+		if (kref_get_unless_zero(&fence->refcount))
+			return fence;
+	return NULL;
 }
 
 /**
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 8df20b0218a9..ad60ad5e5cd9 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -221,7 +221,8 @@ static void sync_timeline_signal(struct sync_timeline *obj, unsigned int inc)
 		if (!timeline_fence_signaled(&pt->base))
 			break;
 
-		dma_fence_get(&pt->base);
+		if (!dma_fence_get(&pt->base))
+			continue;
 
 		list_move_tail(&pt->link, &signalled);
 		rb_erase(&pt->node, &obj->pt_tree);
