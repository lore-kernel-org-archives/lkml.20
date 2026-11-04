Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800223;
	b=NG5/01EokkPseohpPb41grGuk1S+OSzTujY65GuYT0u28Qn/n5VNRYjCJBtSbEAqWOOL
	 CYmSPaTnq/3Rr+E1pULP5PL3TxNUxuA17LE2TY9st5BOty4gUyfB7uvM8rDk1xCKxFxr3
	 /u7Y3LEwCJHHQjp7Sa4bt/lkEtb6jsaubsuuOH3Zo4aG2YW9vBcK07FAmqn7DNPXl2hl0
	 pB2i2GwR8DBlEiX0Jga3QgVBUEbam57G/Jh/8wRkm92pJWz1A4EHd9ac0yU1hSTplPz4j
	 F5d+w8abPl+kQxugCgnMjrCXH9OwlRHZW3tdhWM+SwYof0BInvY3VTlAjALkAksF2ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800223;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qGJYREng6mP0a84Z/i9sYR/1pkROGCrxvOWyOcTMik4=;
	b=yKKT8jXenP40MPCU7qn2JPUuLbS7HOZhBjfvsOq1CVUoW983LnHRf6kkiVZhpuGcfu5l
	 H9BSmIkJHV++qUyUPYrB8Q0OJnq/fhuHCmQtTL3cH7Si0dJMXamWJ1C24wJre09fbYurF
	 97/f9HVSJHCQAJQOqdnRkDXNAO9lkeTIzeNwVYfn8Q1oY2S0h5v8l8VMyzdVFrqZ66a9D
	 Le2nhLgG8ScY6vSgZsMayUJgVlj4QiVXjqNtTFV82DJ1upUXu3rPfH6rMbQVVmqGWieJT
	 ytrzsNiZgo3JVGnHGY8FPlgnGGuAQkmVzMQNWYVgC8m8ZTxm9kzRuezPKrWXqECKeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKqQayPk;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A346B606A335
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A346B606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yKqQayPk
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c5358fc28so657240f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800221; x=1794405021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qGJYREng6mP0a84Z/i9sYR/1pkROGCrxvOWyOcTMik4=;
        b=yKqQayPkJUWw6J7hqazH+ozjYPN/i0P0GqigVVPrJAZRF4u+eyK095IDxuiUayrkRP
         yUk/QTlnEcXJTgCsLAdfjnsElyqiwTTIh/49tnKCOsRv979Kqih7xugL461Riubzg4ny
         RU1nM887SxNpjTWk1g/EsKYHJVgyeyRo+EK1BNdiHJZOSyI2WIJeiE65mJuXKHM2YkTe
         QDiiUxGSuAoArceeYBO5nJgyIe3JtjvtAFmyP09tHpZhHGHNFzDpsD6G82xvZDeCGuMO
         LKPBGXk2RJdnCAXLfZQvCOVh402qXIO5YvuRGa8yKcIg94Ieov59KJCGllMnlD7uya3r
         +P6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800221; x=1794405021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qGJYREng6mP0a84Z/i9sYR/1pkROGCrxvOWyOcTMik4=;
        b=mme3sNyCIxRA2JW/fqIjyg2I5bE0tWwLQD72oOs0Kx/PT5sj+SxpUDw18Q9xmLtQ5H
         Uu4mlOEJ/j3FVkVPePfqwOT3K5GkcIJ0JkqhVcMjmMlmY5KD+IeIX92T2JMOGxE+kCe7
         dEK1k/a2cCXIulQJQRdM+2Z4GiebD19tm6GdasGv0H5SPX3vrfepd8oo4/Ym90YT8ZEw
         M+N/5EXSFAKpcJVOE7pIdkn3flyqYoGGjwmuChZeXfdlgZ8zIJA9MQ5qSDAVUciisLFU
         PMtyyLXo55iJFI+HoQ2sNAW4xaltS9FQ3o/tnv4bIQFtty4LDr7y1GBSTGkNRGS+VH4X
         CgFA==
X-Forwarded-Encrypted: i=1; AKwUvBxkjDNb1s3B23n2rStVEF+uoJIJtdOS/PwX4g8npxRgbq/lmbO3VgJMax3HhICXe7tNB3Ny2xYvPtVPONM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hTH+fl00cZgBf3lv9ZJugCI0M79YvIaJBqoNG2mchj3UQ7nA6
	ncNQ0LHhxjyi7eUctPhnONMJqRhFGOXFgaXDs9TzAlVlvJBOOExraNWY
X-Gm-Gg: AYBFou2lIrPP+wZZhOuP9fPF6/IBF88I8xfVRTkfwucDTvoqeimXwVUZVdLfJBswHGg
	KdJ3ntEpVAkdoWsChQc5i+ikkVt80zO2L8lwXaQpTefI1AaHZ49NCVzQEdL+GlYbHMBhIf88lQA
	vm89tPSgqaP6YZihDjWMclcovWPCHj2ITGMpBc6e8eUmgYMMRw1NklOKoJchG7n8a6HQb5+e6W0
	X/Vzs5t9aZ+x9wdztrVhqc18ze18w4B+Wo7XAAGYitIWo6qegpDvPBUZdKM6soFBrnGDVjDy1iQ
	3J2lfLmtJAFCel1puaE392Q6zI1QyUXiCX45d8kHUv8Da6hUNkR2StDTKvGQxuthLxaHPBSWLX+
	AaFJie1XXILpx2ykzoiFHGJy++4YW10Q2LJqxDGbT2bLr8KG/GD0LydVbc+u/YjTc3SDUdPhgjE
	F8gxiTvuG+RrsoWQhKFBY2JRhEbXZau2gVk1aM7C+D9b/FZD99PwpWrBD+UaWbzU/XA9nUvutw0
	yDr3IPp39XfQmdShIWLpN6E4YmG8UEv8wl1CPuRrOxjshRSvEcHVStN8RAJkLcQNk7xeaLveIWQ
	fRLGbv55v+zBkn6YYB5ktprFFT91LWlyMrLaX4nTi0L5JEmxdjW2L/iz/lm1N+X3nabyS0+znAB
	s0Q==
X-Received: by 2002:a05:6000:184b:b0:48d:deaa:4dbb with SMTP id ffacd0b85a97d-48e6e2fc210mr35662505f8f.40.1793800220819;
        Wed, 04 Nov 2026 05:50:20 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm3701024f8f.58.2026.11.04.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:50:19 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: chancel.liu@nxp.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 3/3] ASoC: fsl_xcvr: select BITREVERSE
Date: Wed,  4 Nov 2026 14:50:00 +0100
Message-ID: <20261104135000.3723017-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
References: <20261104135000.3723017-1-jude.gyimah87@gmail.com>
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

SND_SOC_FSL_SPDIF, a few stanzas up in the same file, already selects
BITREVERSE for the same reason.  SND_SOC_FSL_XCVR is missing it.

fsl_xcvr calls byte_rev_table, which lib/bitrev.c provides under
BITREVERSE.

  fsl_xcvr.c:(.text+0x1634): undefined reference to `byte_rev_table'

The driver can be built into vmlinux while GENERIC_BITREVERSE is a module,
in which case the symbol is not there at link time.

Select rather than depend on: BITREVERSE has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_SOC_FSL_XCVR unselectable.

BITREVERSE is the symbol to select rather than GENERIC_BITREVERSE: it
selects GENERIC_BITREVERSE only where the architecture has no native
implementation, so this stays correct on the architectures that do.

Reproduced on v7.3, x86_64, with CONFIG_SND_SOC_FSL_XCVR=y and
CONFIG_GENERIC_BITREVERSE=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 28564486866f ("ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/fsl/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 2f58a1a51afd..21b0509da76d 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -104,6 +104,7 @@ config SND_SOC_FSL_EASRC
 
 config SND_SOC_FSL_XCVR
 	tristate "NXP Audio Transceiver (XCVR) module support"
+	select BITREVERSE
 	select REGMAP_MMIO
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_GENERIC_DMAENGINE_PCM
-- 
2.43.0

