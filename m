Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810346;
	b=NARdVIzAdxpL7FqGdyORXZrh2OdYumvmoLoArKq6ZMnXc14yOxllENnmGWscKbIU239Q
	 uyb0A8Ng/xQVl6wKyf17fJ5z7IcoQlWj2QInZ8PVQpnl/QELq4zkgUWOQ3WALsIZu7Q9s
	 Do5nVH6aw7GAL8XRWmqdXpovJqKmEd/H/B324SziTfbldrDH1DisQEZJbvNVsRTlq3Qpf
	 a0WpiS9jqUlObd/RLFIiCrPxv8E+27ZENvDu8xSQHW9XLFXxMz8ovsw+V7WR89oHTfgf6
	 RQxcdj1qapWkQtJIRdvLnWzBXpNVu89uxJ+GURe4aDtQiHyDaguDFBh7zLc8rr093KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
	b=j8zhe5HPDfVidSzOzw/cgpdJ3lclVfI8P6uUJqUo4mrMiMr/VUJDSJCfhu3evgtkIF3d
	 ZpzdOLWxC3QplwOFZlA+46T9Te3Nf7V391NoThTqIbhfp4iHX2AmvrIdMWHaoN/qcdf9d
	 Q64zhVETuN2gUCBApy2HdH2arm/RCqiDelwyj8rC0h5GIDj0FP6Twt6cBuNBZx8hjl1xR
	 QBlr1TSJhfJfEUn4fjkBFCWAHhZ8094y49xQbGN76MPKfseitZZQGBr4fZt0U6gAaagxv
	 Q4ueVURhgvhXHHH1h2Yrj+f57xCrSSRD6jjrPFSzJg7cGruVBvQi2BisHIyZYgR3LgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oufns9FU;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC46606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DC46606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oufns9FU
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49412eb1474so1399903f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810345; x=1795415145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
        b=Oufns9FU7gTCAnvw/5Ne3qibyioMzC2ROoGKC9dhHe/MbsoqGf36w9lbEYv9qtD9tR
         lAkeIVMfLH1U41xdEO68gPhFFCWY7J+XL5Ngmlh3iFnCRCUWTvrEbD297nBp9900r6wU
         KFPo0XxG1PGnywRc7ddO4j76ubXFlC95ajAeCrCkTI7l+nPEzVMgZo5sq6+oOIcE5pRu
         96mEBfc2/n6xibkVjEO7O+2aKvgqeY1HeLE3ndbjQX1dxG4sNh9m1Llr/HWvmS3Y+EAd
         nmuWoW5+9gAUqbXBiEgAg7eVtHCgjp7zbVSNMxFouwsHxi0hu7FWElkBa5c5IPdyXkLZ
         Q+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810345; x=1795415145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
        b=1IaYiI3J4FnO8aZF0liJyYfIpL1sJPhC21+z8Qh+ar6tQKOGusFncy+m+SbU4FFb/G
         +R9kuI5Y0XyhgHQpPihdt6COrJ0bRTG/dNddxiRjlHrnzqAGbsT56IfvZqccHMtwn6/g
         rSYCcwdHEJ+iJbcjmwBYd5n+GlJVbDjZkTSamwZ/VoKdcqoaI2wy40KmqvLkNqTNgjkP
         tL6wffkqmiwhB2q90kxGDe1/FtuipKppZHXB0WIjrlAhs1c9nxRfMpIogKuv/iIpbysL
         hygc0XJHgrV8buD+oLBZa0ttF7yUy/UrBAqoH1LCvOc+VVHLV97dd3E6Uuf13qxo+q8b
         M80Q==
X-Forwarded-Encrypted: i=1; AL+hErHC/3XqU9UNuMdu1XngsiEZyK6N8J3INNN5vBb4EcDnv26h7nxlkc/hD0wYmK6Rqu1qJkYYyt/WLBT34X0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KiSSIxKvMQ0D/eTm2vtcoI2GEdODfgGMrIsUOHO//fh8FKDnR
	pSvL4GBomOo3nBono8UUkPA04EWDR3OvERn8CY+0kDtI7wY7PW9z+LL7
X-Gm-Gg: AYBFou2PiAQr6/SLjN0rdsAAcvlaqf5pByFq4pbsAiTtSLkGyBzzmW8f+aUyIEe/iaj
	DOvHHa+i+F0lck69IhYNo/yVULwyu2wstAeiAdkuOFEq33BasXjeIOWIEid9B1nQxTfl4WhDqOi
	O2YzI9U8DR96wGh6L8AEfNxLrb5UqnyWjGzrG2cRiHdQRLtB5saWBVJDmPD+9NgdfpbZZBht/ol
	+cyUcKLEA/X2xxpJjeWsf43nQxzkWznBki0hA7j2kof6/98FvC7Ys2pe23Twy/LlSk62K0Lba4q
	Z2mFVInjp3voxAK18zWQr8bMYu58g/KC82flKOdbw2Jw3yxTRFV9PzJOokqKSflrAsEzY6bioVv
	ATxR0vWGPJKcfERFldsSx7ZPaFw4+kkA3qKA1hizoPKUs4Vv5Bekfyf6PRP/7YJLLIPalKgtNGr
	5zOE5L3kLv9v++sC05+mMuPdmerwHgfZAJNJH3b5QAiIDP42RCt8d9WdJm+rZkkS2WtC6Cy+7/f
	nNjQXFyHojvJLIRHdSbeYNW8UZISpRYM2NFOOhl0FtWNxYUoxk3rOYkFAUIaLt2ysoMQNckx+/a
	YhSIv/MJ7OekKIo0
X-Received: by 2002:a5d:5d04:0:b0:492:7f3b:8cc3 with SMTP id ffacd0b85a97d-49c725e555bmr17386069f8f.29.1794810344684;
        Sun, 15 Nov 2026 22:25:44 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21676892f8f.45.2026.11.15.22.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:25:44 -0800 (PST)
From: Adil Tepe <tadilhusrev@gmail.com>
X-Google-Original-From: Adil Tepe <adil.tepe@basarsoft.com.tr>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] nfc: s3fwrn5: support the S3NRN4V variant
Date: Mon, 16 Nov 2026 09:25:40 +0300
Message-ID: <20261116062542.275485-1-adil.tepe@basarsoft.com.tr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Hi Jorijn,

I tested this series on a Samsung Galaxy XCover5 (Exynos850), which has
an S3NRN4V wired to the same lines, so I could exercise the new variant
path with real hardware and a tag. Patches 1-4 are fine here (separate
mail). On this patch I hit a hardware-dependent problem with the fixed
clock-speed byte.

> +/* S3NRN4V single-byte FW_CFG payload; 0x11 selects the 19.2 MHz reference. */
> +#define NCI_PROP_FW_CFG_CLK_SPEED	0x11
[...]
> +int s3fwrn5_nci_clk_cfg(struct s3fwrn5_info *info)
> +{
> +	u8 clk_speed = NCI_PROP_FW_CFG_CLK_SPEED;
> +
> +	return nci_prop_cmd(info->ndev, NCI_PROP_FW_CFG, 1, &clk_speed);
> +}

The XCover5 feeds the S3NRN4V a 26 MHz reference (PMU CLKOUT0 -> TCXO),
not 19.2 MHz. With the byte hardcoded to 0x11 the chip ACKs FW_CFG with
status 0 -- there is no "failed to configure the reference clock" error --
but the RF front end is then off-frequency and the reader never sees a
tag. The failure is completely invisible to host-side polling; only a
physical tag exposes it.

A/B on the XCover5, same tag held on the antenna, 12 s initiator poll per
run (NFC_EVENT_TARGETS_FOUND over the netlink 'events' group):

  FW_CFG 0x11 (19.2 MHz, this patch as posted) : no target in 12 s
  FW_CFG 0x12 (26 MHz, only that byte changed)  : TARGETS_FOUND in ~0.1 s,
                                                  ISO14443-A, proto 0x10

So the single byte is purely board-dependent: 0x11 is correct for a
19.2 MHz part like the FP6, 0x12 for a 26 MHz board like this one, and a
hardcoded value breaks whichever board it does not match.

The driver already holds the reference clock (phy->clk, "failed to get
clock" in this same patch), so the byte can be derived instead of fixed.
Something like:

	unsigned long rate = info->phy ? clk_get_rate(phy->clk) : 0;
	u8 clk_speed;

	switch (rate) {
	case 19200000: clk_speed = 0x11; break;
	case 26000000: clk_speed = 0x12; break;
	default:
		/* keep the posted default when the rate is unknown */
		clk_speed = 0x11;
		break;
	}

(exact plumbing of the clk handle into s3fwrn5_nci_clk_cfg() is yours to
decide; the point is the value must follow clk_get_rate(), not a #define).

With that change the XCover5 reads tags reliably, so I'm happy to give a
Tested-by on a v6 that derives the byte from the clock rate. I did not
Tested-by this patch as posted because it does not bring up NFC on a
26 MHz board.

Two smaller observations on this board, neither a blocker:
 - A prop notification 6F-3F arrives during polling and logs
   "nci_ntf_packet: unsupported ntf opcode 0xf3f" on every poll. A no-op
   handler would silence it.
 - RF calibration blobs: the driver looks for samsung/s3nrn4v/{hwreg,
   swreg}.bin; the stock XCover5 firmware ships them as
   sec_s3nrn4v_{hwreg,swreg}.bin. Just a note for linux-firmware naming;
   NFC works without them here ("RF calibration data update failed: -2"
   is non-fatal).

This was tested on 7.4-rc1 (s3fwrn5 sources at
7.4.0-rc1-00023-gdcb8b91fb779) with patches 1-5 applied, built as
out-of-tree modules and bound to the S3NRN4V via a runtime DT overlay
(compatible = "samsung,s3nrn4v", en/wake GPIOs, pvdd 1.8 V, 26 MHz clk).

The clock-rate finding was located with the help of an AI coding
assistant (Claude Code, Anthropic) during XCover5 mainline bring-up; I
reviewed, reproduced and verified it on hardware myself.

Thanks for doing this series -- it is most of the way to working on a
second board.

Assisted-by: LLM
-- Adil Hüsrev Tepe
