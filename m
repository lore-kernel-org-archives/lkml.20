Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.108.3.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793852108;
	b=Xw7rKrdV5k+OhZE9T++7BwNc/AfZIF07VWOVyXYZPdp7CHaYXkuU9GwDxzNQSYEDZ9NR
	 5jPjY26yKSOKo1BHD2XDRgzzyF35xjPiYvA0mjri5k2ZbymAZ1caHF0LU9fPSA6+sGnst
	 K2yw9Hb1UuuWdXWMvZUvw3ref42JO4fLtpfD+a7iLPgZdvZ1ADRsNyp2f+rtzyuK+Mb4Q
	 hG2gDEu+VKAT1IaTNkobQmYCXyi4rh9JVoHi55MyfMqK68QxQ2GgqX9Z/7ubEnDps4KrU
	 AcwxslRdYc1BZQvx299sehgQtdQVxgl9SLxas+6HwxMnarHoi3gZgdGXBPakoIM1BBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793852108;
	h=DMARC-Filter:DKIM-Signature:X-SMAIL-HELO:Received:X-Sender:X-Auth-ID:
	 X-SMAIL-MID:X-SMAIL-UIID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=I70JP2SqokASsJErmH/yPweM9if0dk4HKlTSDOwI09E=;
	b=aCDgGS+0MUJwXbkhaMBZGCwTDjRAt9+v+ZmY62wqOWipSv/Tn3lWnR3kaZdzwGvnGpkP
	 Wlm94Pd011ljVl7kSwI+keg/CTlWI9XrsFi+uU+Jz+UCq6AU8VQfMdh/Bo9JveJRMmxjU
	 PIwy+sVvcgipadMnkbg093f38/6NuyEUyNGc5wgNGA2R5KvvJaQRTXmWQ7MiSKTfuWtBn
	 kMEd4hUoQcp7+t4XpW2t8LEwQFko5lNmauqPVUajBiMfK7pEiu9M6KStcM2eJ2kvNR8p3
	 6dpMD321MzxULageN4V68Bl8dHhaEnijx6+PFQHis0WBFwb+d1Ik5PTP9RcH+Ks2SfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sina.com;
	spf=pass smtp.mailfrom=sina.com;
	dkim=pass header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=dd+wWpym;
	arc=none smtp.remote-ip=202.108.3.164
Received: from mail3-164.sinamail.sina.com.cn (mail3-164.sinamail.sina.com.cn [202.108.3.164])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53598606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53598606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=sina.com header.i=@sina.com header.a=rsa-sha256 header.s=201208 header.b=dd+wWpym
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1793852105;
	bh=I70JP2SqokASsJErmH/yPweM9if0dk4HKlTSDOwI09E=;
	h=From:Subject:Date:Message-ID;
	b=dd+wWpymyVzAKs5EMjriS7Jh5yDuTr7q4O0W4UF+OQjv396SfE/ydTdq52cSCWyh+
	 HSLA6ocKfsWPVzuI8HlmZWj4+QyfnfE5ePYgVKoLxcgJHX828MdTK1NdVqLstLbiCl
	 3vnfZrrfVso/9sV2nlJZZW3hoZa7dQ+QLqdpO/Vo=
X-SMAIL-HELO: lxu-pcd
Received: from unknown (HELO lxu-pcd)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AEC02B6000003F6; Thu, 5 Nov 2026 12:14:48 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 6194074457038
X-SMAIL-UIID: 9A5FDA986C1D4943BA931602A231C7D6-20261105-121448-1
From: Edward Adam Davis <eadavis@sina.com>
To: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	sumit.semwal@linaro.org,
	christian.koenig@amd.com,
	phasta@kernel.org,
	robin.clark@oss.qualcomm.com
Subject: [PATCH] dma-buf/sw_sync: Optimize the retrieval of fence reference counts
Date: Thu,  5 Nov 2026 12:14:46 +0800
Message-ID: <20261105041446.51979-1-eadavis@sina.com>
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

There is a race condition between closing a sync file and the SW_SYNC_IOC_INC
operation on a sync obj. When a fence is created via SW_SYNC_IOC_CREATE_FENCE,
its reference count is initialized to 1. When the sync file is closed, the
fence's reference count drops to 0. A race occurs if SW_SYNC_IOC_INC accesses
the fence whose ref count has already reached 0 before dma_fence_release()
calls timeline_fence_release() to erase the corresponding pt_tree node from
the sync object, potentially hitting:

refcount_t: addition on 0; use-after-free.
------------[ cut here ]------------
kernel BUG at lib/refcount.c:34!
Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
Call Trace:
 kref_get include/linux/kref.h:45 [inline]
 dma_fence_get include/linux/dma-fence.h:323 [inline]
 sync_timeline_signal+0x6d9/0x8a0 drivers/dma-buf/sw_sync.c:224
 sw_sync_ioctl_inc drivers/dma-buf/sw_sync.c:405 [inline]
 sw_sync_ioctl+0x7b4/0x13f0 drivers/dma-buf/sw_sync.c:470

Use kref_get_unless_zero() to optimize dma_get_fence(), in order to avoid
acquiring an object with a reference count of 0.

Fixes: e531fdb5cd5e ("dma-buf/sw_sync: Avoid recursive lock during fence signal")
Reported-by: syzbot+cba1a1f459230395a076@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=cba1a1f459230395a076
Signed-off-by: Edward Adam Davis <eadavis@sina.com>
---
 drivers/dma-buf/sw_sync.c | 3 ++-
 include/linux/dma-fence.h | 5 +++--
 2 files changed, 5 insertions(+), 3 deletions(-)

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
-- 
2.43.0

