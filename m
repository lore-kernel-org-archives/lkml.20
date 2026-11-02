Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793622177;
	b=JI+XFf3+uh3LhoANXbbIvaTftVRog14UF2v8iGFGgRZq4Hm+S78Z9DaV1kUJSJZn2kNq
	 8BhF8bAHxS1BXL0tm0UdhuWjdYQUoRfkD0eMk1AjO5PXVwsPhrGajlgKXbI598EjfD9eK
	 VQiXjtErRPP7619FN7xYGiZxCJnGDXApr0sEgsmC6hJeI6UceR84WV8KM1ncL7Oe7JO8V
	 GbRcMlRljEdAcIaK2/jw320RAk1am1V1ELOliHfgxzJOuP2pBFujSsJUoTtrdC1B+fuGF
	 8Ka6nWm0RKyPdCnPgN1VCD9MYJPjbljRZufLWBVYMwg46trozsZgADkPz/YwRhkYCRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793622177;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=abibISRiUwSvMFecqGaDadoCAJ+Fmjo80Pp9RI6LfO8=;
	b=YtH2djK9Lc9cVTzKZgGRdc+NGFbM1IkA54X1hSuXwG2qx5WYZ60c14DhObT8n8O86jc8
	 cti3ClzSuOa+X4X5cb+pXjfZ9pYLic30XH6CzgJeDZbChWNfueW/Bk6sZN2RX4THLmZzW
	 u1IQRm6z9xSSDVFcjt9tZsTMBmRSG31GCxIvybsTzKzKmul2ChR/hNrR3nC5UXJR5R8xJ
	 URt5Wo/Qh3tidDmpc9/grY0lN2iqhE2Xs9FuXme4WSchXD/ao14DTj9Cd/959KRAJ27IJ
	 akUyfMq9WSTFprg7/CYDspRZjgLW6o3aNkB7qmBTxjY/Ebuku7ceCbll5CmCF4cXamw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewVK5FsW;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA4BA60A260C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA4BA60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ewVK5FsW
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so25728305e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793622175; x=1794226975; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=abibISRiUwSvMFecqGaDadoCAJ+Fmjo80Pp9RI6LfO8=;
        b=ewVK5FsWNqs67XMFEWCR81dLwkdrViWaR1Mpa9sViu6UqFO7qZb8ZIKdPkTqiyR1ll
         AmsdzeWBsRHeyVELcdHZ4+FLGKGrb3JbHEj/Zw+oygRFTpSjz5c+a29ARFitt2XTtMVU
         l0bzH3XiH0K1MaeKOuvjPlO6SRzzr/f9Slsvg/yYo1uvqaaNK6wnNdJMGsViwgk7hnGS
         FAKFE0zKQom/9NcpMpWgYX8xy4vW2BfKkLa65iZhIqotW/ArrhwfMadqBG5IwFXHAXQY
         s3fEUFM8+sGRlAu+tfJfI20Cs8CLCjLCJJArM/cd3tAmC3IitCnbc8fj3vqlUFf9+XCr
         HSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793622175; x=1794226975;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=abibISRiUwSvMFecqGaDadoCAJ+Fmjo80Pp9RI6LfO8=;
        b=PTsJG5nLr6Xsx8AYnKNZNabz9oXu9jbYgIZ3UE5RcjOPGHdzui3CTZcir/czNcJjkm
         d9zQZgR9ltqvoTXqkAaeUWV8SwNwapLeWPrkb/ZugWdAvNGpWQsqv5GcabGkIjrFCqYH
         KnZFpZ/Fk87rbdvX5PAk9mwg1mt7tAszWDHX8pM3dDKeTrC6v3KPz0AKCXN3sGDRm0hE
         oNUPrr6Tcfy0lgGDPJEgMeuw+Fr/ZOy3nGwV/LY1WEsROkVnJfJK+/tsADtR0aPvmt9I
         Cwx3WW/AsAj2toCE7i9RM3X7vzJ4K4oJSJIy8uK6frpUiMLThnHLkAGkrEsBI6a9vl3q
         xVGQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8tOHpgFnwQQ2SqfNL4w4N8uKToM9vMvo8slvttLSNVsx2XoViOxTrCnj4gX1s82kL03UZrN+uEoNewFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSo31kA80cNcz6PIhwjHP4+jqctXgThIv4Qc8fRqh3vTymm+KC
	xvedv5H8ZZenCxNggR2xaydFyhJTTWhJ2HD3gSFv3LswOtnOEKtgGeHm
X-Gm-Gg: AYBFou10x8lSqa+Of8oNuy4rWi0gXRDeZxEOQUMQNxCr218NdDn32iqF5DbnLdaiIKR
	fOnizEL4hvHC/0khSm3eZzoTae1k3+COIpMgqSOD5xSoPslhs/y2zjEb4kJOSU0Nz5dHKr+vpl4
	I7S4oJvXrt2QESzcQaav8wTaoVcqyZM7usrvrJu7s++X62UOr6NIvzYDfnubN1Olidb3Ij5mRm1
	L+I32hMgNskgipaey2chRWhpTe7Mofns+2RoEVGfDAdpdiHA6qf7rgpKPdUpVik9RSr6uy8hlC6
	bLbKZM/mRc35E73L+MZOdpU20CbsW/rwbSi4guH2XDEOycde2ZpSsjijMiNCWwWEe1c4fzT3ANl
	KHdE2Jp67WgP60JZu9IaZT7BuYgRNhznoqPJgfgCFELuNhhg+xutCw2JDW3TR3038ZbPAghMwS0
	YgWFe9tnBBASidGgHP0S9E8bSD2Id88cGduKnTLmyfCbWV7v6FfDs4bMfBv/467cwgV98NPQGyx
	pDd/f1k//MubEugQ1Hdj/HAIR62ehLFmXpyzJiweTFZKdOwADwzZU9PDnPRaWRX/WLEDkeFYVoS
	DxQPQw3Qd3RSlvW33CqTc43htso3OFiw25FlLZJkqXNdSgi0EEOpODrYSS3zL3oerplU0ZTcnhX
	jzYOHWtmtP+NmdPxLHdkdTNhF7pcsM69L4k2hEbG1Jraw+TQpBCuF
X-Received: by 2002:a05:600c:46c8:b0:4a2:1a:a120 with SMTP id 5b1f17b1804b1-4ac16acfde1mr240738005e9.6.1793622175008;
        Mon, 02 Nov 2026 04:22:55 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b79059sm20361252f8f.30.2026.11.02.04.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:22:54 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 02 Nov 2026 13:22:51 +0100
Subject: [PATCH] drm/etnaviv: Cycle through the MMUv1 address space again
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-etna-mmuv1-iova-cycle-v1-1-1148f02da254@igalia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQqAMAxA0atIZgNphg5eRRxKTTWgVVotinh3i
 +Mb/n8gS1LJ0DUPJCmadYsVpm3Azy5OgjpWAxNbY4hRjuhwXc9iULfi0N9+EeTgSSwTBWehtnu
 SoNf/7Yf3/QBCPcBNZwAAAA==
X-Change-ID: 20261102-etna-mmuv1-iova-cycle-2fc0e6200fa6
To: Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Christian Gmeiner <cgmeiner@igalia.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

On MMUv1, all clients share one address space and the allocator
always picks the lowest free IOVA. When a process frees a range,
it can immediately be reused by another process.

The GL.FLUSH_MMU write before the next submit does not reliably
invalidate stale TLB entries for that range. The GPU may therefore
continue translating accesses to the old pages. Writes through
these stale entries are lost for the new owner and may corrupt
memory that has already been freed.

The vendor driver works around this in a similar way. It does not
return freed MMUv1 ranges to its free list until the address space
is exhausted.

Restore the address space cycling for MMUv1 that was previously
removed as no longer needed. Start searching after the last
allocation and only wrap around to the beginning before trying
to evict existing mappings. This keeps freed ranges in the
allocator but delays their reuse until the search wraps around.

MMUv2 has a proper TLB flush and keeps the current behavior.

Fixes: ccae45928fc4 ("drm/etnaviv: remove cycling through MMU address space")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_mmu.c | 21 ++++++++++++++++++++-
 drivers/gpu/drm/etnaviv/etnaviv_mmu.h |  1 +
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
index e3572461b599..c4e4dd3d4235 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.c
@@ -141,10 +141,20 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 {
 	struct etnaviv_vram_mapping *free = NULL;
 	enum drm_mm_insert_mode mode = DRM_MM_INSERT_LOW;
+	u64 start = 0;
 	int ret;
 
 	lockdep_assert_held(&context->lock);
 
+	/*
+	 * MMUv1 does not reliably drop stale TLB entries on a flush, so a
+	 * freed IOVA that is handed out again right away can still be
+	 * translated to the old pages. Cycle through the address space so
+	 * recently freed IOVAs are only reused once the search wraps around.
+	 */
+	if (context->global->version == ETNAVIV_IOMMU_V1)
+		start = context->last_iova;
+
 	while (1) {
 		struct etnaviv_vram_mapping *m, *n;
 		struct drm_mm_scan scan;
@@ -152,10 +162,16 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 		bool found;
 
 		ret = drm_mm_insert_node_in_range(&context->mm, node,
-						  size, 0, 0, 0, U64_MAX, mode);
+						  size, 0, 0, start, U64_MAX, mode);
 		if (ret != -ENOSPC)
 			break;
 
+		/* Retry from the start of the address space before evicting. */
+		if (start) {
+			start = 0;
+			continue;
+		}
+
 		/* Try to retire some entries */
 		drm_mm_scan_init(&scan, &context->mm, size, 0, 0, mode);
 
@@ -215,6 +231,9 @@ static int etnaviv_iommu_find_iova(struct etnaviv_iommu_context *context,
 		 */
 	}
 
+	if (!ret && context->global->version == ETNAVIV_IOMMU_V1)
+		context->last_iova = node->start + node->size;
+
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
index 7f8ac0178547..7fa6e3ab427a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
+++ b/drivers/gpu/drm/etnaviv/etnaviv_mmu.h
@@ -75,6 +75,7 @@ struct etnaviv_iommu_context {
 	struct list_head mappings;
 	struct drm_mm mm;
 	unsigned int flush_seq;
+	u64 last_iova;
 
 	/* Not part of the context, but needs to have the same lifetime */
 	struct etnaviv_vram_mapping cmdbuf_mapping;

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-etna-mmuv1-iova-cycle-2fc0e6200fa6

Best regards,
-- 
Christian Gmeiner <cgmeiner@igalia.com>

