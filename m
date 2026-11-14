Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637498;
	b=gMDCKdnvQV7DmNT+s66nEMSp45bTDLYs6egBwDaQFdzZv12QnrI++2jeM1TZhzEZa0Xt
	 KQ3b6D1Bf3BiQ/4NrqFmRVPAdYdj+a8xp6HyrkUfpj+WDFDiZX0ds6dxeDuUo3gBytiQn
	 Q+SDe2cQKlA+Yy1fRsdOn5sGrW3+Oqk7SSZVXKEIk8fXIN5D8pKGldqmeXQJJeAi3Q9qL
	 ipFEhv8du+GiTAZyZx2qpwEdVJwYDeCgxqd2RkXQDNAVxBhsRhbcFlCSePjUJeq3IC9rK
	 6IirNCeQwikwuSgqSFJtwCRAKEogSq8EMwrn2uErP4Vt5tYbPUCLlCH0Tm8q7bVmtJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nuw+0N/N3N3TgZSRfVF3OxMj+eHVfhZTZnHIUjTrdas=;
	b=tIP7636OpCHiuR/GnHSZUKF8uCA1A2ynzDG39oe6JeSJS+MKsdZggJfWQ73SQxnEN6S1
	 tNOSbw7dtrJ9HyEVcBM39Xvnq6mzWY+pFuDsVn9QmHLBgZBGmNEinlKHz/LcoJo3xqxuS
	 oEEOP3eSqZ5ZLqLVPYvHRlQXU9Udjivh7C43Z8Knw8PBRO3U2R93aeo4aMy+PIWA8+oja
	 I8PTS9FsIQ8jtoVhvtqOwDn/QNLUW+KDfFHK89E7nI6lrHhJhQIr3aSNR4opnv7Sr8gBL
	 WoiIGrSiFtWn84XW34R9tCNfATxdcb4M+l2kF+9JQtNJ9cdEPidWWctcg/T1gmrZSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRtKWbpF;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22F0606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F22F0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MRtKWbpF
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36ca32a0faeso184587eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637497; x=1795242297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nuw+0N/N3N3TgZSRfVF3OxMj+eHVfhZTZnHIUjTrdas=;
        b=MRtKWbpFpiCoHMFHbjToXB1tMg9zrjZ6+Wu7wXTfDeqNTiu11McNrTmmEV7vAEwLfN
         vmG+IlsJ+rAQ94wPSyN2EmqTphjQce6tGu663BlNMVKAKIWUTVXfydWpJmWC53PS5lMV
         XgpUtN+UNbZgMDyUxgcoibm6l5SUYbRJ6i0oau23w/d1EbuNapoTGCdBnk48OrYv3R2F
         NefyaFkHxmDB47Wp19wKeP/7xjMfxWUE1ewNH7zQXSdrGTSP8xQT8Pvbz5345Xongn6c
         FDKn2u8xp7+HUhmtEp7jwMdk1QAHAdyZ1ZSBOTrbqGPNNS87gWDwFKAF5aBcvADHD8PV
         cXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637497; x=1795242297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nuw+0N/N3N3TgZSRfVF3OxMj+eHVfhZTZnHIUjTrdas=;
        b=Z2GRtmMvy32iSS05ZbXGaQRCTwZDObwQJ/hcwqBJohwrawlJUUFMGbOkZwI6ZeJlLI
         22x7xE/DdzSjUawv4yFFjJPzD7N67VXKE3yFrYZ24zrPwueydtpbbWJt6BgBfrUvR4yX
         g2J7A3218PEaN7m/2dotjbAOEUOXxxLE0hL3tJgbDgY6YUeps0Hrh6oIfEHDVjRkSc5b
         BDj/XfxS6sGUTe+fXMs4xI23vlQihSCzS7lP85faiwKSfQDuf4hNDad7PFg0rLHhvfP+
         I9PLeBgojxnZkuvRIzQ6RGvu3CCCcJLyAymbQJJ+ylN2yhYSKCLhWcgYjppDqPetbqRQ
         lIiA==
X-Forwarded-Encrypted: i=1; AL+hErFVNhmyyhvMAI2cZTrnCIRx/U5w/aLAzd4tIstJVpga5soBWPOphHCGaGeoC9LTk/qo5w7ERTotIL2jE+4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bklP2wRFh7iKkXAUNjW2tFzWu/Z0IIgaAPE3DM8F5ewdbmlif
	kNs4tOAiakRlayNik7bgkMMI+iQCgnLlUONdpLRhMzyobiE2Ry4ioW6A
X-Gm-Gg: AYBFou0CWwl7GAgQezSTAfqvU5y/bMuQ+pbzTWZDEpmciEZgFeYyX83CMWvgXah2rMQ
	lVL5mJBVH0WiwFuL4qznAer3bo9arp2/jJjCN3Ksm8k0DZTSlmCHPucwC9YAfzoXGCbf0xTbHQi
	CrnVQihsHN0zYG1lllmx6x5O4UUAgd4XMH2YNxQdNwcYXc4E3XdwmvEAosAC5OCfjs5OdJoHVg7
	CBre4E0+FMzSra55Xvm03uTwvkKIbSQAmE7wvdxnomJpUPR+xQchjEOr9Lzu4HoI1d/2zO+7RxR
	aLffxYZzLjd9JyTXfkmIkw7XZ8M48FHhKYsMVGZkDvhcII+ANnHG9Qv80O+MiJQF6pXWNExMxZ+
	kvgL6JDs+s7dOiAlbIi4W+YueszfekvJ7wllX4u03lR5a4HBGFdJlm0xtvpX5wPrau4gTEcOD4e
	IkpRt1U9a4msKm9T0qn5L1e7k3gBwkUkRzAku48TASRX64t+Kn8Gl2Vk3A/k/A5lzYdZj0eoBUP
	8oqrrYtdC/DcupFUnz/fUam6LQa17GnhEqQkMlOo2W8haYsr55KuAnK6Z6uwFl32XpGjcdPBGd4
	eW+s8l1EEce1YxSZCO5a4wnTvzsJyCUHr+uahSmGdr32kIdwml0a1uEr+l9wn4NOqpGhB6F2d0N
	SAB26qyfRIJFc0pfxRnDK1Z7B
X-Received: by 2002:a05:7301:a0a:b0:36c:a1bc:6114 with SMTP id 5a478bee46e88-3796038259fmr6483300eec.0.1794637496941;
        Fri, 13 Nov 2026 22:24:56 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm13564777eec.7.2026.11.13.22.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:24:56 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Donald Robson <donald.robson@imgtec.com>
Cc: Matt Coster <opensource@mtcoster.net>,
	Sarah Walker <sarah.walker@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/imagination: Flush the MMU caches after unmaps done by a map
Date: Sat, 14 Nov 2026 15:24:48 +0900
Message-ID: <20261114062448.1513-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

pvr_mmu_op_context_destroy() flushes the MMU caches right away for
unmap operations, but defers the flush for map operations, which it
tells apart by op_ctx->map.sgt being set.

A DRM_IOCTL_PVR_VM_MAP over a range that overlaps existing mappings
unmaps those through the gpuva unmap and remap callbacks, with the op
context of the map operation. The flush for these unmaps is then
deferred like for a plain map, although the page tables that the
unmaps emptied are freed in pvr_mmu_op_context_destroy(), and a mapping
that is replaced entirely no longer holds a reference to its BO. Until
the next call to pvr_mmu_flush_exec(), the MMU caches can still refer
to the freed page tables and to the pages that were mapped there.

Record in the op context that pvr_mmu_unmap() was called with it, and
flush the caches right away in that case as well, before the emptied
page tables are freed, as is already done for unmap operations and as
the comment of pvr_mmu_flush_exec() requires for unmaps.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. It has not been reproduced, and the change
has only been compile-tested.

Fixes: ff5f643de0bf ("drm/imagination: Add GEM and VM related code")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
This is about the existing DRM_IOCTL_PVR_VM_MAP path. Gyeyoung Baek's
VM_BIND series reworks how map and unmap use the op context, and this
patch does not depend on it. The sashiko review of 5/6 there raises a
related question for the new asynchronous path (BO pages freed before
the MMU flush):
https://lore.kernel.org/r/20261108-pvr-vm-bind-v2-0-730103d2cc9a@gmail.com

 drivers/gpu/drm/imagination/pvr_mmu.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_mmu.c b/drivers/gpu/drm/imagination/pvr_mmu.c
index 67e73d7d5d0e..84a58ab2ab75 100644
--- a/drivers/gpu/drm/imagination/pvr_mmu.c
+++ b/drivers/gpu/drm/imagination/pvr_mmu.c
@@ -1444,6 +1444,13 @@ struct pvr_mmu_op_context {
 		 * ops. Linked list empty at creation.
 		 */
 		struct pvr_page_table_l0 *l0_free_tables;
+
+		/**
+		 * @unmap.unmapped: Set once pvr_mmu_unmap() has been called
+		 * with this op context, which also happens in a map operation
+		 * that replaces existing mappings.
+		 */
+		bool unmapped;
 	} unmap;
 
 	/**
@@ -2293,8 +2300,12 @@ void pvr_mmu_op_context_destroy(struct pvr_mmu_op_context *op_ctx)
 
 	pvr_mmu_op_context_sync(op_ctx);
 
-	/* Unmaps should be flushed immediately. Map flushes can be deferred. */
-	if (flush_caches && !op_ctx->map.sgt)
+	/*
+	 * Unmaps should be flushed immediately, and that includes the ones done
+	 * by a map operation that replaces existing mappings: the page tables
+	 * they emptied are freed below. Map flushes can be deferred.
+	 */
+	if ((flush_caches && !op_ctx->map.sgt) || op_ctx->unmap.unmapped)
 		pvr_mmu_flush_exec(op_ctx->mmu_ctx->pvr_dev, true);
 
 	while (op_ctx->map.l0_prealloc_tables) {
@@ -2486,6 +2497,8 @@ int pvr_mmu_unmap(struct pvr_mmu_op_context *op_ctx, u64 device_addr, u64 size)
 	if (err)
 		return err;
 
+	op_ctx->unmap.unmapped = true;
+
 	return pvr_mmu_op_context_unmap_curr_page(op_ctx,
 						  size >> PVR_DEVICE_PAGE_SHIFT);
 }

base-commit: d48ea86919434695da12d280dccab72b094397e1
-- 
2.43.0

