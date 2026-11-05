Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793904970;
	b=tHcmZZsmUkvow1x+1JefxXuYPtBvuai7jWkOx/PtmqW+/QgKExnV7CM4XK4O/1K58JU7
	 kkqRWPChffiNC8fRl9NlMiqCrF/T6s48nVYSwyJimujGXpOvyh+TVl0iw9LuWTTaqJWkV
	 Cy3Sh2PAR3rNlPUTQIKF6fAWTss7aHMPpaB6Qc6TbrigbXdUosYke3b+lkB0h1dai0NMc
	 OZdl+rvK/ECqbhC625zdz+xowEafid0FiGH1eg3/WJmqYi0npR/BWyy+aJ8B5pOCYRhZT
	 itMRmbdW3b//OCkAa8Twz7ut6mMBWKLZnIhgAK/b9xT1D2xZjlABWMz0IPBY8+VwKow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793904970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
	b=zhlTYnNUhLwJ2V8MnYvp3Qy39ulFUomX+i6B+RbzzE20/UHKLEK5xATjJ8mCcgIg/PVD
	 B4w1F597HvBk9mpTOPF4c8QjInzY+EbC+Ds5iQKisv1MrpSRZcUkVBoWUhId4Z3IDOqj5
	 nj7B4KujJaGkLTYMM3RT8YKnNPPrydURZrnw+nvtJVDWdI9J1Ua3dlaX2Nurh3Mzp5l5C
	 q4g2l6+Qb3V4yZuM+jmuWwVabfE2hu0LJL8u49u2oV55lxspjP3WdFZVXHDUkx8n8IzGA
	 XDBWEhjqN1RA91bopAikH4IMPDZjevpcGxhTwd6YIqCs7jr5zBwsNfO2pdRxnQ23RUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2yobEQp;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72516606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 18:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72516606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2yobEQp
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493795eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=w2yobEQpUUYT1JGrWeKUrm3UIKxglKcA7pxc9LLevXSH19Znb0nLH61/0LA1itb1es
         VlDDD7cTQe4qGqLdrt2jKW98dkJBLBSvrxMyuoHS/uQRsg0dPz1DxZlNN6Hb2Pzs4G83
         9J+5If1IYcxrSyhXDXTEcEXdoVklOzPGPH3SE03RDAKBMTAjGueckVzs6delqS4Y3Qio
         PGqQU00btj4OJsQAzkIT74/iZ0iRZGOA7JQCTyyFQDTuUfgRtM9CvKw4PR38jAhSOG1H
         /36C8qwy6n73QdqPkTwYprAvRG7I6xVWjMaNjNrYgugrRq+AFSjSQzZo2w6XSNHe/gay
         YNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=VRkmUJ5V6gBrPiyGz/Y05618SAMQ2AL80imy7bCUiKmeuGpDTh1K4cKeiHS07oG4Wj
         4MP1peOb7e4pVfizZlRVAeaB4pCsF3dNJa3v0VdScBDv6VCIm1LjW6tcvcO2eFyvFfY1
         b3q4trkfkkqAO6hLXtqRbX/jTA9U1lu3NU0S3YkSSxujwfr+n8plDN3eYZubZTo0Ya9B
         cwwafys+4aCrMPzthZS1cWq/s37ODwsACbwgHo7QOscdzIMlsQUGFh1hgQULxK1u76IL
         xs+RuLibkSyX5yhjuFyclWn5pIVu7Zn0Z6Mnz0tklNArrDXDX47z2MttQYINjfAEoV0f
         XAMg==
X-Forwarded-Encrypted: i=1; AKwUvBytBSPoO4thPgWndYaOl06WRnh0B7adiFdWq9erD03Jq9FACyJV6nU6h1Ufts4M2e/lUWekE7Xjo+fTuYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Xmj4HAzCuLs8PBj11BCtkfSGJlgRNUOKKDwYi8FKxQrCQJX8Q
	HoLzyIV1f1iBXKG5HpU/QxlMBbWIRYa2+L7OlUPmUvfOJv7hlMFvrnX2
X-Gm-Gg: AYBFou1dVuXZKOaxRmOjPkncRR75Y8Ou13OPQMzvORxNujneE/Mtn+diKuQXdqLKIwe
	Sp/anEn8NwU1UlRXAhZXrnfY27AMhYFLatFYuO7Hpa7UwtWfzMpef5d0MuLXV872Nt0jANTGTqy
	7ItqDRKbjaHdnDwjuK7mGOSr2rAB1IdJigbc0wY6gMVZ0WA1IB4LJ7hY+BfmDM4c1pBH2Cqztpx
	jgjcIEupk6Jq98kaQPas+YMwIcj4ye/FBzyP8zfTJOPLyigqoEpabOMxKlfS+tzSjH1cojqONNH
	z+/Nx6r75zEO1QMcpfl0bwgqDX4KNGVspmLmL86G8UB3XzK2jsC398Y8ZFCHYfwEHVP5sS1OyGA
	V3w//QnfVC8BBzFtrzNK6uSxjHkC2XThMWIbTzugj6XaejCJd5ba8MpYA6A4LFED9GxPRopnvO8
	K139W8+X8wkxSBZCkqTC8xu2BmqdLi09YB2ytWdDk1vaBkPY993bS1POsGRUVRR45D2yl53XYAW
	i1hBYxY3ZYN2tLTWe8dsQl+q09HfKrqL+IfLitwlzVK+n8IfaJluHN38fJVt2Bj0VLY/jo4Z8xa
	9VmKKK0JoUsO/3d52eOzPq5BSLKfMa8jVfXwVJBUTyToe9WJNc6kZZtQBoaVGAPvDL3PdkxrAuK
	TkjrtpSzpPtmcmvggcseStufgbAZam7NBszgsNuXpTUFaeQeNDSYMfFq6uGTryYds7j+LBtWTyR
	CZ28J682Cp/+4Y2EAayeoNK754sQiFcXSmPFfagOEWJnN9puYo8g0X
X-Received: by 2002:a05:6820:16a9:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-716e73de6d9mr410801eaf.11.1793904968458;
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:41 -0700
Subject: [PATCH v10 25/26] dt-bindings: mtd: sunxi: Add randomized OOB flag
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
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-25-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index ccf616fabc91..4ed99054a8ab 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0

