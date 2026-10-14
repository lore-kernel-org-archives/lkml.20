Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CF256C645
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 18:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002943; cv=none; b=JLZww4Go6jpZ0qa9K3uJZIEE+UBclAbTrj9vY9rBa7KoCVvNMPLOmST2nH2uY0rVLSFsCVEBdSofjCI4UDGJgfuspeIskoTnfo0SdCcymsvS3zdXB9n50jxbMDmZeiJSPPQJtCxDMXv5X5Oo6+CTP2QkwC89DRj5AKthu64uBos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002943; c=relaxed/simple;
	bh=88113piBjDKcd3BEuRd6GgwtB1S5y5KxGWl0ypNsWv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QZVpZjAB07XHBLTmrYk0rlzyxAYC8f4uIMeAPQEiRdeKRNOLhbDO0BIisBqTvY4Gr09AD4r7n7Gbsk9WT6bqhn5k8QrFx6ijP6i/hlUEMSUA6mGU1F2JIfj+bnWA72EQlksmLI0CyJdwaWiaWBVkedyLC3eY53nS7CaaqUD+dGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L589kPJx; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L589kPJx"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-81c5aac8478so3266957a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792002937; x=1792607737; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=;
        b=L589kPJxyheOJFrvFaoRURnSnMITeqEYw9FgvGBCIuMyAognpD/woXdNB1jSOy+qQn
         FU5Ad9gAE1rqDASwH0biN/TCgug7yDzfT1BLStpBPRfLpstuLSA35cJuMaoMiy4i0M5O
         t7nQ0QDMRA1sL84gpakJbRb3BIvJAGWr6l6ASdN9zv7P8VlgT34L9ek3bSO5gMhQk5Xu
         Obm03cvARQWXotvwUafLzxIA6CftKoZEvABw3gJZh/NPZy5S/3xyI7GxD4cdAf4vqYiV
         KJVuqTGPPcZszc0R0H2ANZIqC6R7akTugSI85GX1ApoYdTj8Qg4guqHzIw/rx75+2eru
         tWWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002937; x=1792607737;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ypJpkmQRRV1BQV0ur1VLkim3Ln3Ci6KGz+PKJeDImg=;
        b=CKaBJBQ/i3Ar4EkLYHrC2Dwdnvarxtxv7gg3ldYykZGG8xU5K/78Uvz3x7lWqTcj6z
         U9BX4j1TIXpQ0bEtEDTNNFAubPq0ru053sEm0PSXCFusTuqG+5F0uB+wnR08s3gKtYmd
         ca8nmldPFrJmHMIe8PYCx74lMWbHvGjyWbtMcb2pPGKCgstvt+9crV/EOvyBuKWLGg2W
         31+d7jMnca9zYab5C/tDiwiA/7GnPlip26Izt7GmxDuypyNRWX0RKMVzvWcQTLxAMaf1
         0heVfGq+ruq7OLv5OZyVXwGzGyAtfGCfH6YlaWH9Fn37vn/0aZknTi8ADB2zLsp7Fclm
         KNcA==
X-Forwarded-Encrypted: i=1; AKwUvBwIZVC3D/fvGJ4LmmDSkgC+dbiYFZAXVqVTp9xHAkUz9defZ9LNGeN30ww+ZYAXvIc+8AlgE+LapczSiEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUF8kPSOIQh+DpXQqCVvxX6Al1zb64gxOqIiHxjceJiW4OcT/Q
	qrskE3cBRPfHy1EMrIvp9XFLS8G4sc7rQ31ph5/BrMGNTJOPQoLIgKQ9
X-Gm-Gg: AYBFou3dMrvxyb9C5LzCXLsA8xWDlyoiikf+4+DEoA7WE25V1Xsgl5zRUHFfCm+VrZU
	p7GnLIoLX9egcv+RtGhEOqG+MunZ4goe5XJYJ6w7zmgGReS/DR85sk8xJ3vY7TJq8o2LbZSnt+P
	yJp/6vRoPaFyrMSb0qcVonSsGSMNI9AjINAbbe/PpDlTKJMtj/pAVw9FvG87LdcvPMBccqtf8y+
	CJVHaWRTKWjANSthRh5h32i3Ix98/s2ZRrClhuzhPVkQXhqu+Zs6HoHoY/MUJ/NmSFSuOND5EbK
	vc2Riq6L9JoEB+R05xFNXSbJxda1PCaCJlF0NMfZkIlrEPwQ6oWFru8G3ADVhuDkHlkufOcfdzT
	mhmzcUoOIa4dr3zKqbHB9p19K3OwYkYIU899Z6UXTKvg+rYVgPWYQbjcg5KaUxFZsAHSzF+2hCd
	8u4JkYlJe+CAeJxbYQ+5atLKHQ2Ozk0tmOn29oDrbBTJwO0pUUw3cGEjiPbweyQ7iEZfSkpTz2U
	xrr6+l/UzbOJyT5ICGXC9+INpgBbdLzfugi+fRbcyzfVsMbLxE9sO+DbvfC4qKRT2yH0+lduPwv
	rI6qOPZsXcmKgg==
X-Received: by 2002:a05:6808:6c8e:b0:4f3:e98f:fa19 with SMTP id 5614622812f47-50c57695fe4mr15959952b6e.61.1792002937206;
        Wed, 14 Oct 2026 11:35:37 -0700 (PDT)
Received: from MaquinaLab.. ([187.14.248.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-50c0c5fe7d0sm17325426b6e.2.2026.10.14.11.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 11:35:35 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Yixun Lan <dlan@gentoo.org>,
	Enzo Adriano <enzo.adriano.code@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT] pinctrl: sunxi: Fix A733 withstand programming
Date: Wed, 14 Oct 2026 15:35:16 -0300
Message-ID: <20261014183516.172060-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014001334.54dcf0b5@ryzen.lan>
References: <20261013142351.771229-1-andre.przywara@arm.com> <20261013172427.328177-1-vinicius.eduardo.pedrosa@gmail.com> <20261014001334.54dcf0b5@ryzen.lan>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On Wed, 14 Oct 2026, Andre Przywara wrote:

> So PortB has no supply of its own, instead it's always supplied by
> VCC-IO. [...] Which somewhat means that this is broken there as well?

You're right about shared VCC-IO. A523/T527 may have a similar issue:
the vendor driver maps PB/PH to the shared VCC-IO bit, while mainline
uses per-bank offsets. I haven't checked the A523 manual or observed a
failure there.

> What do you mean with "the board's SEL value"? That's not the SoC reset
> value, is it? So who programs that value, and why?

Vendor boot0 writes `0x01155550` when `0x03000024[2:0] == 1`, printing
"board gpio withstand voltage auto mode". This isn't the documented
reset value.

On my Cubie A7Z, I also measured SEL without vendor boot0 or SCP:

- Cold FEL, no SD: `0x0aaaa69a` (PC/PF in AUTO).
- Experimental SPL/TF-A/U-Boot SD boot, at the U-Boot prompt:
  `0x0aaaa6aa` (only PF in AUTO).

SID+0x210 bit 10 is set. The BootROM code uses it to select AUTO for
boot ports, although my SPL also sets PF to AUTO.

> So this means you hacked the register in the vendor kernel, for the
> sake of an experiment? [...] uses register 0x70 to switch PortF to 1.8V?

Yes, I deliberately changed SEL from U-Boot before booting vendor 5.15.
The BSP switches PF for 1.8 V UHS via `0x70` without updating SEL. The
SDR104 timeouts with fixed 3.3 V are consistent with that.

> So can you say whether you observed a real problem with either the
> current (broken) code, or with one the fixes?

No functional failure with current mainline. I found the mismatch by
chance while comparing the manual and registers. The investigation was
preventive, not prompted by a failure.

> Thanks for the confirmation, and just curious where this revB
> restriction came from, originally?

Initially, excessive caution: I only had a revB board and B-version BSP
descriptor. Further investigation shows that vendor U-Boot and Linux use
opposite `POW_VAL` polarities across silicon versions, while boot0
enables AUTO only on version B. This suggests revision-dependent
behavior, but doesn't prove SEL encoding differs.

> Did you find any recommendation? IIRC manuals for other SoCs did
> recommend one or the other method.

No explicit recommendation in the A733 manual. Its prose calls `10`
adaptive, while the encoding table identifies `01` as AUTO. Revision
differences might explain this, but that's still an inference.

Given this, I'd return to the `BIAS_VOLTAGE_NONE` approach from my
initial report for both A733 controllers, with a separate A733-R
descriptor and A523-R unchanged. This supersedes my later PB/AUTO fixups
and PL/PM programming. I wouldn't write `01` unconditionally without
evidence for other revisions.

Without vendor boot0, `GPIO_POW_VAL` indicates 1.8 V for PG/PJ/PD while
SEL remains fixed at 3.3 V. My DT doesn't use these banks, so there's no
demonstrated failure. NONE leaves that limitation in place but avoids an
unqualified write. AUTO could be version-gated if needed.

For A733-R, the separate descriptor also avoids inheriting the A523-R
`CTL_INV` path through offset `0x344`.

My mission-critical background sometimes makes me overly cautious, so
feel free to call me out when I'm complicating things.

Thanks,
Vinicius
