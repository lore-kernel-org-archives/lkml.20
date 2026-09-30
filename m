Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0AC4BB28A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 10:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765852; cv=none; b=ZbvkoZWHmdJCreTRAPXIONpoblZ/TEtm0iSTdbLLWCW3xfqVylQVrhEBP/5m82CegCLj1sO75rh+TppCXbQ1OmJX9+imWn/DwfNVMGnXcGuhm4YjM8Kk83UrSv1gLb6cc17JPfPQe1goBR5RCig6hOcIhYu2B7YYMfKqdA3NoS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765852; c=relaxed/simple;
	bh=3Ps7OVPCUls+dQh+qEqi79V2MQpSrrvFi3h1eo/2FTc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WrMHbpcmrSpuK9jaHgMmJvd2zKXlprncYbE7MFFe00l8rOJseHQRFv/KZI43Aaq+Ii9effniZVGFgxYGMnmarI6laByRwiigNywTikjeuCiQLeCzprn1CnkrKmxqJ7J2hglFuApvk80UDw1Iwbnq5t3zgOe8ZZD7iHmQa0bRB1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fBOFQ/vi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBOFQ/vi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso116292f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790765841; x=1791370641; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=;
        b=fBOFQ/viZwFRT3jU1y1jt5R5cq0pV2fPtBHSaoJX20WnIEARAEJVxp34q7Mul03YPg
         6cymSSMy7H1/UEObu41D3p1gzb5nuXvQ52EpYXBlr0uqablWLC96lUg0A3GlL6fCG3LN
         /eJCisKGiwMeOmCEe8LzTXD2R1MbmfsCJCMT1kUY4yqmRQU6bMO1VXNuReBnXlZCzEGC
         /dpgrSoYVWcm8H5ZrfJFo6sXst2fYtTRwKsvpwvpaF9D+cDH2sNGy5qS3ktDws7U079Y
         poPoEyBVw6LfY0ZLqeiXSoStDMo6uBuHDGmi0UPBfC1Sz5jXEf8GHUPFTcW6l3GC0/i/
         dyQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790765841; x=1791370641;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wLis0s98ZuwFHTL90Zcm9u7pqE377mGnvWwB/RoEQu8=;
        b=hbGklWzdgyBdFThl7aXnUH2KKiJe+C1nWZ0oOsPSouNfBT5elAwEleTsTcxi+6LieC
         zp0SDpewMAjKUMWPQnVwDtPq6VG7O6+md2rQbVgNuRe/NJWk0BB4JK8bUfUN9e6DgdZN
         nWhpWYVrogmkag7KXxwXmZ5v5+xIOHZMucSebEsKIWLhH36ED9JCwFaNjdpTfSncgUdA
         suv5QNzvAbY7l2Y4OpXIWHvQXF7PlDs07VdIsdSBNDY+ya92TuifW+CoAzblQBS8oPe3
         mPzAT8VOYT5jKFzrhXg9j1McVWsPpJZWvIdfS1ZXgOgqxhrAr3RoISDZOe0rhEZEaiRn
         IzpA==
X-Forwarded-Encrypted: i=1; AKwUvBwVtaJxKZGIpohG67ymr8F/jEaMdijRKctxod7xR+iacXUUr7O5G5li3dd8BgIL3apQQUEge6NGrHaWB4k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIr4lqCaMvVMoIoZCEHXiMHyjAXHEol5pjRE/N7DQjcdhQHtYq
	OHxXsd8Daxv1MfItpoBpwTVnGJp3xnAgL/I3tMbB9QTi+bnP9boP1bLx
X-Gm-Gg: AYBFou0UcutMkEFzdlcjsYxUMw8skW3U7M4ut4A7/fpZW+N03pwV1lbjlCIOpJ6DN/S
	XumftEFEahkVjWCb2nMLqdCW8s1xNbq+Iwpy7wKwQuCcTyvADHLePIHp0yVm9OC5ziuDPMfO9mW
	Kl3fZsK9e05VIKDtVrb6Pwd+URhpiPVDjs/66/+O+rIIpZK2kyhfAD2s1xDUo7FRmAMarIR0NDA
	45y7KUHwIL2lr6EztaPXrnG2VvAa0l4nS88FORJSCUfu4M8R73GzhtcRSoWMiYF5oOduUgxosEJ
	+JhNOMEkhlVqEdF9Ys7qETAN+zXaDpUeJPjyt0pSyjT1vkDi9KaodLV9ZwdVqu7xAMfdArWVBLC
	dx90YIqitHnB8kgQTtRtMETxC9hOrimOtDrtBTe1G8F0SDGB0/7ewrXxweMIP+s7t9JO9UAmlVL
	jSWgNJf0EdO1Ojx30U6PJWm/IdBEpjW+B/zqbJ/yqasG3jqa8XsWoO0Fhb09iKQU3qZsBK5tDNa
	z9upOfhg8tqGFOU3tzTOoOeXnX04ZP4EYWKt0KQ7ww=
X-Received: by 2002:a05:6000:41cb:b0:488:8aa5:b4a1 with SMTP id ffacd0b85a97d-48b024b4a4emr2192936f8f.14.1790765840706;
        Wed, 30 Sep 2026 03:57:20 -0700 (PDT)
Received: from [127.0.1.1] ([92.241.26.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b02949f3asm2695384f8f.1.2026.09.30.03.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 03:57:20 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject:
 Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
In-Reply-To: <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
 <65c87e07-1722-44c2-9a08-ed9e18902058@kernel.org>
Date: Wed, 30 Sep 2026 13:57:17 +0300
Message-ID: <179076583795.3054628.14443934429806440798@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

On 30/09/2026 12:20, Krzysztof Kozlowski wrote:
> How is it different from Cortina Gemini?

Apart from the vendor, they have little in common. Gemini (SL3516/
CS3516) is a single ARMv4 FA526 with Faraday peripherals (FTINTC010,
FTTMR010, FTGPIO010, a 16550 UART) and builds for ARCH_MULTI_V4. The
CS75xx ("Goldengate G2") is an ARMv7 dual Cortex-A9 MPCore with GIC,
SCU, TWD/global timer and a PL310, and its UART, GPIO, interrupt
controller and NAND controller are different blocks from the Gemini
ones. So it cannot share mach-gemini or its drivers.

>> +machine-$(CONFIG_ARCH_CORTINA_CS75XX)	+= cortina
>
> Arch should be rather per entire family, not one SoC.

CS75xx is meant as the family (the vendor kernel covers the CS7522 and
CS7542 with one ARCH_GOLDENGATE), but I see the name reads like a
single part. Following Linus' suggestion of mach-goldengate, v2 will
use ARCH_GOLDENGATE and arch/arm/mach-goldengate for the whole family.

Thanks,
Fil

