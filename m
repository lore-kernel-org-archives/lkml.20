Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394931;
	b=UVpgrYaFAPC66nXO5rzbv5yH50s0CuGJr1L5hfR8oxtRYxtFtGztyU/7RmKzvP/YnM3u
	 Q0uvOVyV0BU0zV14+Pnq2HlhiamElZp3a5HIRjptWyF3X1Rti1o7kVD3slSksgkpDaOCW
	 vz4+IF9dn2ruqN9jhcJfMUdv3lCjS/m9FPfwA7dH2vinzYyVLU+QNz2hFGSh4tlXZglIE
	 4/ewJvMhcgX1U2t+WW52kqcLYkTc3c0EkEt2QOLeujcSPqimnq6vaCK8B9gri/GqIzGoB
	 JaWlMTR0qneT/UK02ZdXJ1I9Fht5KZ9fIhdz7aKZuSG8fELbbiaNbjkwr8bNjuyEKlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394931;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-Mailer;
	bh=vx06wP7sOtawrWt780eGmmqhNLqmiCDx1ykk7VKYMck=;
	b=gqkiXI8cmloumFw1NMyp0UkBJYKx2y/lGy30kK5W6eLLDd2Jcz4VXed1OEHhjRAAyWaf
	 dVgmEyfs6ZIQEhLEIhuIWAHdxiN7tO7yyP/fIvOYpLPHQF0gRuziguyOe5LUv2tRGGoyJ
	 kx0x2yaR5uF5PiJMPv4NW1aGE6CbQBboWkC2oeojIN8VhVp9uidV3mmQpi44XCjBcq8x0
	 ctC4Ue9PfepIUg28zxnwyBSCt7PNlwB+r48WaUOhyAl8GR9Kiqb7tvaLxQY1JVaJlPubh
	 0lgAtYqWrk9tnxyjs5E2+GdQkfTLiZU4T/3DNX7AM9ka6XAAByrY8KMvu/IXt5/ksuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4BB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E4BB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso20668135e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394929; x=1794999729;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vx06wP7sOtawrWt780eGmmqhNLqmiCDx1ykk7VKYMck=;
        b=KbF7ioS5GA+miy1oS9NO7qUvHZ5QyFXMTSqHSKpUbfhSWNHA/HPr4S/36bYFeivSvy
         Md6bXTMEfAT1CLyhFv/kBBKgqgAO1Gcyi4RNPyw95+nwy6v6zWjaSlf0+2W1kiY7T9xu
         Qrr5zACe17Al7QxOjxuS+1DpHgqFSL8hZeO4adsm3fffU/bXW41ymx3EWyWCkp/FtP7h
         9Q1hYywD8ZrmIjlmEGjpfQwJH5nKdf+cMmQTxzrr2gEltw1M2wZ/P9u0wEhVQ3XxLMBI
         hvfv7ymj2NiFOgkGPOZPi5YlGMl0FgioL60u+KkKXRrJaJZEkUAbEQ2xq6mWZeldZyLp
         TLpA==
X-Forwarded-Encrypted: i=1; AL+hErHISg1LvEfsne4jKPnFxYskBW/TqjXnONPO6OLGRlPPdhh4x84f0LChU+DZhzeuwSZO3hpQ5RUSmcf8u8s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EvKqBE/hadqVWQmguRCytE3tChImpQfFARtjasTvdOOsXun8n
	II3hV+goPqbsz3+qfouzKRCClXiv2lYNCvm/qCDVS03M++YcmNCGSVa7
X-Gm-Gg: AYBFou2W5+udaY6g564+Ck710w8O71IHJiHx/k52E0/O1y/noRporHf4fBWQs4L9X/3
	LxhhzkmBFvmscLYccpSXleVkg8eaH4Lp1fG48ImoyyGiPRUhCxtPRsjm2+0JN57hog7bK7xzesW
	SXK3uPuJ7MAcIt19E8FdvtX8PifNchnrqCqbp8s0yq6Sz1bpku8sZe0GhOiB/jGgaKzAi2QTg9R
	vvXwQauIVG2N2QiCdU3yALlD5xT/zWzUHYiM8XnUJnPhrhSpWYiw0DmN9qimL7LdXJBBIt5HUxB
	c6AtAivma4LtPag45aqjlsRZsODdBhfviWat4LbNcPGyCY2/6jf6Q1dJ4suUUTilNVfw4ZcpSp/
	Bc2np5ntBnwGgHmBUDhfIcIfbQZl4LX5d5XQbB9uArNt568gB1fX1wlhcmrBfthX0LgAqbTgroI
	c3IdKsncu+dkADRrLj0v0due44env6AlWMnq4opbsEtRt7X+Tca8TW4H74JytULDlGdNzaTYZRW
	hD/jealKncK2w6QBsYosFCO+CZ34kfsfavsPOu5m3VXef18v5zd/Xk7AiTbqcxrb1CLjE/e3LsY
	mkoe4XuPyAMLwVGIVXlZ1icm9xcH2+IhQnT4zhK+UF98ethfCGdt8Mw2gzOVx0w29Tba2pgr8G2
	uZklM7o58UkfQPYmsphA0yXSctuSAjJoG0YWZbUJ/nauy6xopaZBiz88a6iG0bIzyxE2L3jhc4P
	O5djZKKictPA==
X-Received: by 2002:a05:600c:a00d:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4ba093acadfmr38447905e9.34.1794394929145;
        Wed, 11 Nov 2026 03:02:09 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08ddbe68sm85849165e9.0.2026.11.11.03.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:02:08 -0800 (PST)
Date: Wed, 11 Nov 2026 14:02:04 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Christoffer Dall <cdall@linaro.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, Karthik Bhargavan <karthik@pereq.eu>,
	=?iso-8859-1?Q?Cl=E9ment?= Blaudeau <clement@cryspen.com>
Subject: [PATCH v2] KVM: arm64: vgic: Don't truncate offsets in
 vgic_find_mmio_region()
Message-ID: <avRLLMOiudnKoSlk@stanley.mountain>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In vgic_its_has_attr_regs() and vgic_its_attr_regs_access() we take a
u64 "offset" from the user and pass it to vgic_find_mmio_region() to
find the correct region.  The problem is that vgic_find_mmio_region()
truncates the "offset" to 32 bits so we might find a region even
though really we shouldn't.

Later the untruncated offset is used to calculate "addr".

	addr = its->vgic_its_base + offset;

For example, an offset of 0x100000084 finds the 64-bit GITS_CBASER
register at 0x80, and the write reaches update_64bit_reg() with an
offset of 4 into the register and a length of 8.  It exhibits as a
UBSAN warning.

[  183.796046] UBSAN: shift-out-of-bounds in arch/arm64/kvm/vgic/vgic-mmio-v3.c:35:10
[  183.796198] shift exponent 18446744073709551584 is too large for 64-bit type 'long long unsigned int'

The GICv5 IRS code has the same problem in vgic_v5_has_attr_regs() and
vgic_v5_irs_attr_regs_access().

Make vgic_find_mmio_region() and match_region() take the offset as a
u64, so an offset of 2^32 or more no longer matches any region.  The
other callers only pass offsets which fit in 32 bits so they are not
affected.

Fortunately the effect of this bug is very minor.  The worst case is that
the VMM accesses an emulated register and sets something nonsensical
and users are already allowed to do that without the bug.

Fixes: 8331c23c28e8 ("KVM: arm64: vgic-its: Implement vgic_its_has_attr_regs and attr_regs_access")
Fixes: 71091136d145 ("KVM: arm64: gic-v5: Handle userspace accesses to IRS MMIO region")
Signed-off-by: Dan Carpenter <dan@cryspen.com>
---
v2: Change vgic_find_mmio_region() to take a u64 instead of rejecting
    large offsets in the ITS callers, as Marc suggested.  This also
    fixes the GICv5 IRS code which my previous patch didn't.  Drop the
    Cc: stable.

 arch/arm64/kvm/vgic/vgic-mmio.c | 4 ++--
 arch/arm64/kvm/vgic/vgic-mmio.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-mmio.c b/arch/arm64/kvm/vgic/vgic-mmio.c
index fddb9da0403d..59bdec495cd7 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.c
+++ b/arch/arm64/kvm/vgic/vgic-mmio.c
@@ -820,7 +820,7 @@ void vgic_write_irq_line_level_info(struct kvm_vcpu *vcpu, u32 intid,
 
 static int match_region(const void *key, const void *elt)
 {
-	const unsigned int offset = (unsigned long)key;
+	const u64 offset = (unsigned long)key;
 	const struct vgic_register_region *region = elt;
 
 	if (offset < region->reg_offset)
@@ -834,7 +834,7 @@ static int match_region(const void *key, const void *elt)
 
 const struct vgic_register_region *
 vgic_find_mmio_region(const struct vgic_register_region *regions,
-		      int nr_regions, unsigned int offset)
+		      int nr_regions, u64 offset)
 {
 	return bsearch((void *)(uintptr_t)offset, regions, nr_regions,
 		       sizeof(regions[0]), match_region);
diff --git a/arch/arm64/kvm/vgic/vgic-mmio.h b/arch/arm64/kvm/vgic/vgic-mmio.h
index 38ed730d68ac..6c3c4de6883e 100644
--- a/arch/arm64/kvm/vgic/vgic-mmio.h
+++ b/arch/arm64/kvm/vgic/vgic-mmio.h
@@ -228,6 +228,6 @@ u64 vgic_sanitise_field(u64 reg, u64 field_mask, int field_shift,
 /* Find the proper register handler entry given a certain address offset */
 const struct vgic_register_region *
 vgic_find_mmio_region(const struct vgic_register_region *regions,
-		      int nr_regions, unsigned int offset);
+		      int nr_regions, u64 offset);
 
 #endif
-- 
2.53.0

