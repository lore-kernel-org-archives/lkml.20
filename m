Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794897857;
	b=Pe286QT8FYL+/vzlr17/b0+lzdYEznF4eWRHcbG5jNoJGeqfGy3ol+emZ6X6Ynne+F4g
	 F91MTZumPEXL2j5KdGHbP/ee59xKTh4b/PXxdaT+Rh47Wl1db/rpB0jS9hD3B9Ko370RO
	 92kAR+XuvcVLwVfGZmX63Lsm9TH7pHyr4jtwWKxl3K/86ix1ZTpc+p791miemv6GAiWY2
	 c94uMUJVK4wDa07Po/VhLsQnL8gQf/X7rpywlNaB69L9W/rOagqJ6/kul76tt8jL3VMdr
	 sxIsiNEPVu9IxhzFMmxP2kbcckDPP55eYnW7F1xovCuTGlI2L+LLarE3VWENT7TPK1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
	b=pQbBeRQ5zwjC1Nqw9XNCWnoSvzg5zMIdwBORY+ALAXY2cNpZEajxlPI3HorY2rKQA14q
	 UQbvDKY9LG9t5ufFfAYP6FbzwZB+UhFA8zWmHCaQ2d5gmx34sHq2FqHo+EfRRhD2IULG0
	 O+Wv4dxITPJYPFZCTVyUB60hZB6FCsQzMLhzFzjcdZPswFK2qPR9hlKIN5RT2N7Yhjw/J
	 KX9AFNEGBYs9sTmAOHA5w8wwQ7wE9sIAIy2jU2RsHubbmzIOTTeOjWQ5hi6k/l/FjEScd
	 GBZPpYxwEg4CN2WCILRP6ZTahVS1SsjruubXGbdly4ZDR95tBueLLSpiUHEmafdQRvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EigEqq1B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AAD606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AAD606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EigEqq1B
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2370656f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 22:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794897856; cv=none;
        d=google.com; s=arc-20260327;
        b=bSSU8i2R/+vFHRYgs8UDJN1I/GWX7rn/7g6tI50Un75zyoiS00pYhItgyRoLWJBCwD
         fLv8bp8nCnQ8uaEAhoM2OH+RciBLdlaAB7vZFak9pQ5kj4ytlf17io2dxpM1QIj3bpJI
         bspGxOmWlk2wNjc32i3oALTDTUK3+vAp8J4wsgGTyV2io9jI+vW8mpwGQV4s7MqZmXVS
         uG+LW+J6P/a/LR+lPteYxJIla1SH1I3nRcHHtBjGwRsxHQ14HWPpUeOhktOPAtCqBQL6
         zoSfloSZwW4MlyDQyXu7XNRx9k5w6hG0oY1Pg2fN8jPWuenA/Vs6esYIGwvtQdhAOwcq
         cpKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
        fh=XKTCr1pMhVQI/tUOkYVjuHOjt5zfcjnVfKwqN35cbuc=;
        b=BXFTXMPP741+1pbTWXA/D3i6SXpF65mRntPu2kLfeJH2pNJnh/HExYSXbtKhjBiowF
         7tE+arwsx/CYexk93ZRvThFU36zvmWi0QKSYKccxU4xiNyCXk75c0dEUe+ENVWjvDAHD
         /jPK2AkOmil7ixUOif7U0N4JTDQTo24VCjOpOXhyBdauqygHUuJf5Agg5tufA+e5bn2e
         q1OTiG+3JqNUvIkYbQwhhKS53kMh7DgUUtze8Afs3Nen/RWAeu/INMo5UtAczWfyLw7d
         tnUtOtwJValolwPwgW36YCIvbAsNTlD2wZbJHjihTZt9hbv+oCgCFZopkNpThXukZ+Nc
         OZBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794897856; x=1795502656; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
        b=EigEqq1BqBN+1gG+Pzt7egI1ia+zosHBuobd0OTg3LEvkZEyLJBWCExu4SBVE0XC1j
         ZENn3LOFmqaPL5hSsyTNg6Dr10Wg6f2hkK6zEQL3HmgohJ9uGw9Aes+r6y+h+cSScQaf
         NKvTfCo/A9xlg6c+Zy6REo76/tw8Cs6eMBsfF9lorLWTnCqEgiaLCJLcfBI0lWSHJoFl
         KOzYPiljOmoswMFpvgTnWRc3YoG6fpMajE32qVdW9bSNyIFFq6tu+ycqyxwcVyw4C6G2
         NUjFC/cJ/qkq0cq3+Wbm65Pz8m50SxV4he8Lt3VfoplUy7IswyTDnUJdYJX7oh59wgu6
         bFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897856; x=1795502656;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wD5UM1UlPQVzAfEMtJ8hB5L44EGsjcHAnWbquriq9h0=;
        b=oEQkZe42ia6VTeOIod1gY3+N0TAd8c8X4uddIxfVFHeINZ5+pwN9kAG25g401Tg69+
         7WimO2bQVPIFdPIJvy0FQ1R97yrKYAm0rlpPlILkNauY/b0YWl0LUHEJbv/1nj3fFQrx
         czyiuyI21VzYucg/m4gra7MgUyavtrA9ux2hFhcDgS+rXy7AybmzcMNyu+7U4qM2O3Kg
         K3xBlQlCIbdHiVcfLNO9mVmoxS74EG3blpz9GXHGiZVdIvmwtv94lkRuyI8BqEeWhaUZ
         EpAbTZ3O1KvsGOcwHrG5qAIvlva7fKrj80hFOWWJuVTan7aeEhrL5YdwSwOtNy8KH7LH
         CsqQ==
X-Forwarded-Encrypted: i=1; AL+hErERR9mFx8aFJZ1JTVwmr5sOlJ3u7jmtgsLzANvuTs+/RB+mQw6oVqn6/9TPVNuM0XVDxJKpcurlNP6N+94=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XSrdR1JMcgc0O68rv1MtBSzd/kixvQ1lYqYmOzAdRPSWVNThZ
	KbdnfZ3ER/AVXwTtuZdbvfumCUoboB3dosTfK84JHoEkrkylI7wKxo6U68F7UTZnUPDYN8oYygq
	gg8GqTSMIYHUsdky2/bQ+OA1fJEiSIws=
X-Gm-Gg: AZFdTZd+4fhRyghVusjKN206a0YRvfrNWZVnOuU8DTJrf010yMURsxxM4Dw/xNWa09c
	w+sZDsrDTYn/roLjYAr3MsuyPDmstf+FoNFpbE+H4Bf6H9t7QZW2eEvUxpOkV7ZlqZ8Myw7pqi9
	DZ3VBTP1kwbSEYkpjQ/yx3SCPviSaN1RIzJWbBAFhMwDzMkwObGIk6w5iAULvFuS5avYgovAxcq
	LbbkE7bpL1Njcudj28bZBqIPRhcp9xyTak+bs7Nf2reoDyJuSzkR28Pm+MX0fypUukHzzObLKLX
	yqVQDMgnYT6qeyQxtVPEl0zBaMhtibUKXt5utc0WE8pszPmfcu9EkBDbJL+CCQcsXX/OYa0PFrC
	DQ0c6O67Os7GevBXxct4OAAx9bgtnhbZRpWvp
X-Received: by 2002:a05:6000:4213:b0:493:8c32:94 with SMTP id
 ffacd0b85a97d-49c726db093mr25624978f8f.38.1794897855591; Mon, 16 Nov 2026
 22:44:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Michael Coppola <m18coppola@gmail.com>
Date: Tue, 17 Nov 2026 01:44:04 -0500
X-Gm-Features: Aa3M54rZvG_hjBAGbc245IRPke91uDHwnm-RbxPY2q3kxJVoy6ojn3PTwbrEgDU
Message-ID: <CANWVVqiK1i8aduXKxEihCUNhNgw=OsPEP1MNAzpRpKhvgqa7og@mail.gmail.com>
Subject: [BUG] ASoC: tas2783-sdw: 3-field vs 4-field firmware filename
 mismatch on HP OmniBook (8EA1-8EA8, etc.)
To: Baojun Xu <baojun.xu@ti.com>, Mark Brown <broonie@kernel.org>, 
	Niranjan H Y <niranjanhy@ti.com>, Kevin Lu <kevin-lu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Baojun, Mark, and all,

I am testing an HP OmniBook X Flip Laptop 14-kb0xxx (Intel Core Ultra
Series 3 / Panther Lake, PCI 8086:e428, subsystem 103c:8ea4), which has
two TI TAS2783 smart amplifiers on SoundWire link 2 (UIDs 0x9 and 0xC)
and a Realtek RT712-VB on SoundWire link 3.

In sound/soc/codecs/tas2783-sdw.c, tas_generate_fw_name() formats a
3-field firmware filename:

    scnprintf(name, size, "%04X-%1X-%s%1X.bin",
              pci->subsystem_device, bus->link_id,
              fw_uid_prefix, unique_id);

On 103c:8ea4 (link 2, UIDs 0x9 and 0xC), the driver requests:
  - 8EA4-2-0x9.bin (fallback: 8EA4-2-9.bin)
  - 8EA4-2-0xC.bin (fallback: 8EA4-2-C.bin)

However, linux-firmware (commit 43cc9de7, "linux-firmware: Add firmware
for new soundwire projects") ships 4-field filenames that include a
speaker vendor ID field (<SSID>-<spk_id>-<link>-0x<uid>.bin):
  - ti/audio/tas2783/8EA4-0-2-0x9.bin
  - ti/audio/tas2783/8EA4-0-2-0xC.bin
  - ti/audio/tas2783/8EA4-1-2-0x9.bin
  - ti/audio/tas2783/8EA4-1-2-0xC.bin
(and similarly for 8EA1, 8EA2, 8EA5, 8EA6, 8EA7, 8EA8, 1954, 1964, 1994,
1AC4, 1AD4, 1B04, 1B94, 9013, 9014, 9015, 9026).

As a result, request_firmware_nowait() fails with -ENOENT out of the box
on all of these boards unless the user manually creates symlinks in
/lib/firmware (e.g. 8EA4-2-0x{9,C}.bin ->
ti/audio/tas2783/8EA4-0-2-0x{9,C}.bin).

On HP systems, the speaker ID (0 = AAC, 1 = FG) is stored in the UEFI
variable HPSpeakerID-c49593a4-d099-419b-a2c3-67e980e61d1e (as ASCII '0'
or '1'). Should tas_generate_fw_name() read HPSpeakerID (or fall back to
"%04X-0-%1X-0x%1X.bin" when the 3-field binary is not present), or how is
the 4-field filename intended to be resolved upstream? I would be happy to
send and test a patch for this on 8EA4.

Thanks,
Michael Coppola
