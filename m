Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794786264;
	b=sVu3Z3dFm8G8NW1CepC6eJhM91V48R8a7oZ8TSiYpKz98DlZbl83vTrv5S8eNdKzNzwx
	 AvBYj4AVB8s/qVDnNEa6Pdd/dcG5OfgHjWy14ayTgbltBpApX8jXvd/y9fpZWFNoQGTH9
	 dT8UwyfgTw4+70nkF9N0nAFfao9859XmrE3FkammgxfsLJE5bpQN2iAm9mpIbCmwdUxca
	 7ESd6rx1wKgKfp0uAAlBXfH16xcUWTZFnKxi02NpCq0nIi27xQ6FbvAU+h3U0f7gAMLGi
	 wLyt47o5gpAJvnUrMhtCk7+a7+ckhF79mqSkXfPutvEfu6ZkSau1t9ECasEq0OCriPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794786264;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
	b=zokj3XShmvJIddrUC07wQOipGuEYw8rhieowIkSLZB1Bms+x25pWl2FrysotEYPhP74S
	 w8ymqvKlnK3+lg6YuGz4dhk3Jg0TaacW2O+W3Tn4cWsVpUWmp92JtRGy1awwY4RSm0xpj
	 F/x0moKiKxWdSODABWloKV7f113fcYaBqALjuSrN29DK6k01vr7yg+7uqdgA3qQ5Uph6u
	 o/75l4+OLg6zINqlm9aQeUUQmxOQjroJmwWz+jC1uNY5sAw5Zem7XgcyQOmQxkWUCNCuq
	 sfABXDhy6RssH/v1IU7A2vGLhEEIi2nzGLcQcyle6kL8b6XhdLd07bp4nno71OGrnrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="KmKhF/c2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200F9606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 200F9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmKhF/c2
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so3329155e0c.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:44:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794786263; cv=none;
        d=google.com; s=arc-20260327;
        b=RFWCmERXPt5Dzq0m6GTzxqoKmblt8cUkrxLkaQkkVEMXoZsdr/MHV8nnc3/V5b932R
         rdP1kKjswH3IEyWr4bMVs/+mS30bpSy2XWHy2VMDw8bQ8vSam9rJerkNN3FrVAfzKp/K
         rLaZAe7DBhdaCnxpird6nVpnhxaF3QrqrS14smxIj0TWlTcInBf3jpgguxeTHLcHAxTZ
         c8QSMhzYL2UjldS+eRWFFyJFolZl/iMqNUefxPzVhIYrHUkfKcHkvny4VZoUNEeDzSFb
         eQ7px6G39FpGu+C7F/bnSEqftB6shfGZ8SHQd+0Z66vEl4+UZR5o6rsOAC6HtE5tHQGH
         gNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        fh=AxZgWdEMGxb5w30H1/n4dLba1YLn4qHTX+VClF+IFY8=;
        b=o8CQfjU8WGhirUazeWj19H+SrOUlAAWJbFeeXjHJA3j7VTsRDYfkPifgzkckNwmviO
         OLxJc/HbDpjv9DTuNmhmH8k3TRpH/rS126mdgWrmIyh0RSAHiFsyu7RVQ2qc6hj+gKS0
         fJq5BMIDNWws9o6rhdbAIdcQ7dxPT7x1wgwLMvso6in/QQeJbQsQQKsDCnyJhHtOxcLe
         p83yRLN3NPy+IDfxe1OwFN9jyQYhbxNPjY/5IdScDg0K3wGzq3laBbQNb+czbRaAeJfi
         8G1uqrl3hEXo8Iq4zuuLFPMVBLiODK8bI72lLMwIh3AThftcxeY1b1QRVmWuqeXZr45l
         g3qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794786263; x=1795391063; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=KmKhF/c2nsVjsMO6JaYs+Tmvz0Q5rQed7sqC0weLcOzMxB/w8ZeyHiJfcbiqPVgQJJ
         reXBPdJXfqwXIy4335GuDtevMZKs4tVoOQ8K1tPxIQ1GCTKcKCAMZToHPA0dmr5hrYM3
         R7uXTMKqbGlxFjfaYPtGyrX/dDLIE9TiTSVN6jYhHQUl/30RF9pmYfG4KokyniJqHVwq
         s9IdfBncQ1G/QokaIhbu8vHkhgOQiAMQxufe7yqRRxgGoUXaAoyuB16G7fHFcupbbyS8
         2CK/bkJs0fT5qH3eUCi3XTpIvg6tfA6hUFQOOFhq9l3a9gEsFgrDOS1rfcoBDccfvIeo
         DhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794786263; x=1795391063;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auof1BOxZI/hueJ3qT4KAJwQ5fheSgQUSxA+iFOzg5I=;
        b=H7aDc4Vu7pAtaE/iKEInjdOzGjDg3/ZiErR1REHYmm1v8aO/u+CIU+PjGdv65vf/rI
         w/IEJu0oGgzhLZErolnUX+MDLYpq3VLGahIkjL8tZFUXyZznDq1Ey9Vie7pSiElBb5E8
         Ba6PE70GT09ZJIF2hH3wSRK5vKoe17oL1kz91kyu3vQfXHKauIublASEsyCf5Z47byDA
         yoBWvxQwyvM1UIzlwkFMvxR/5khpfT2DnW/QFwxPVtEE02YA9mWvSXS7LYs2owk/1nI7
         qprwcKJki8yrT3WKLp1ybzSRzPRSu9NidDf76/kD2rE051KNjTGFvqmJlqgfcC2mhwnq
         fbZQ==
X-Forwarded-Encrypted: i=1; AL+hErEkPxfr87Ak8T7sOtgCiMsc1pboE2MtW5c2ZSI/lQKx6hfdiaPXx+6EOTgVf/6uDZ3b0GtE3MVfGI2XqCY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+F5FcWsqSU23Xa6RNcaOVOPJodzVrQ8ik0HBNutyh9+7FJWn7f
	4fL1a6fPkk2mTM+J//JjStOsDG0nnZrexia+q71Twrm3YKpFmAyvGHecEfufElnpHWdFpUWN8wN
	Uujf1QDsNMQ0OtvZ3F7jnJ83kCPxHefeKyk1c
X-Gm-Gg: AYBFou025ljOAeOZJAlsqxtW7wZ4XaRu5UqwzGBgO4HJVrBNhA9T5kcxtVi3RvOfS3Z
	CPvgAUIZ/ezQmZZ13pNpJpl0zPqH/D5zBTHbExuZgGipJiU7filUr54mq/SeM+/8r5uNAY/NzVd
	ttrFpVvZeT/GKwVqwR1I6bNL0T0iigkTamc5DJ5/Jxv/pUpGmGVmXml0p2WhO5GqHRE3w+BpAiA
	ZkRUyZ9LD07shOReFJ2k+GfUDtco8luk9B4Dt9YE8c6ik6hwqmZPRXhNVs/8+Z0chqOLxNEV8gW
	OeXgaVvvoPxqt2C6LYadGEs5QUswEsl6vEANtlUxAiW++HsALxDeWio3Fw+nR+Ye0KR97JrZl0C
	RtfSDViEPIQ95TfrZHBPOxaxVqvEZkRhlqi8jlfTm6nHtQKp49otpzj9SaV3N4iD7AoDPgg==
X-Received: by 2002:a05:6122:488e:b0:5ea:bfe3:6035 with SMTP id
 71dfb90a1353d-5ee34a46807mr3122166e0c.8.1794786263045; Sun, 15 Nov 2026
 15:44:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com> <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
In-Reply-To: <CAGb2v66f5QFECs1L3K1C+1LMXS2KVCVgG_LgAnEuun9YNgHidg@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Sun, 15 Nov 2026 16:44:12 -0700
X-Gm-Features: AclHuK_c04QdNpovv9zvqchoEQGN-Z-QnqhIaD68AYr5MCT9q1wPyZvYN5agNtE
Message-ID: <CAH87RzQRJB7yndzT4fAsQX4mV5h8Q8ksiwY2ruc_zUus8e+yHQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] arm64: dts: allwinner: Support Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

On Sun, Nov 15, 2026 at 3:00=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Relay
> <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> >
> > Continue Jernej Skrabec's April 2025 series, adding the board compatibl=
e
> > and device tree for the Allwinner H6-based Orange Pi 3 LTS.
> >
> > Board testing passed SD/eMMC reads, both LEDs at drive strength 10,
> > and five Ethernet interface cycles plus three MAC driver rebinds.
> > Each network cycle reached 1 Gbps/full duplex, obtained DHCP and passed
> > ping; PHY ID and 125 MHz clock-output configuration were read back.
> > eMMC DDR52 at 50 MHz and HS200 at 150 MHz each passed 768 MiB of direct
> > reads and 256 MiB of patterned writes with verified readbacks and data
> > restoration. All reported MMC error counters were zero. Both board DTBs
> > compile and pass schema checks.
> >
> > Codex assisted with DTS updates, review analysis and build checks;
> > Cristian performed the board tests.
> >
> > ---
> > Changes in v3:
> > - Keep green as power and red as status, matching Armbian LTS roles;
> >   default green on and red off without a boot-stage sequence.
>
> The roles should match the schematics, as the hardware vendor specified.

Agreed. v4 now inherits red PL4 as power/on and green PL7 as
status/off from sun50i-h6-orangepi.dtsi, matching the schematic. I have
removed the Armbian-based rationale from the current revision description.

>
> > - Select drive strength 10 on PL4 and PL7 with per-LED pinctrl states.
> > - Move PHY reset to the MDIO bus, before discovery and outside detach.
> > - Specify the YT8531C PHY ID; MAC rebind fails with early autodetection=
.
>
> Why do you need the PHY ID if you moved the PHY reset up to the bus level
>
> ChenYu

I have dropped the explicit PHY ID in v4. Generic discovery now
passes five interface cycles and three MAC unbind/rebind cycles, both with
and without temporary PHY-ID logging. Each run reached 1 Gbps/full duplex,
obtained DHCP in all eight cycles and passed 24/24 pings. The initial ID
reads matched 4f51:e91b, and the configured 125 MHz output was retained.

>
> > - Enable 1.8 V eMMC DDR52 and HS200 after board testing; retain the
> >   existing H6 maximum frequency of 150 MHz.
> > - Shorten the descriptions and update validation status.
> > - Link to v2: https://lore.kernel.org/all/20261022-sunxi-orangepi-3-lts=
-v2-0-70b899252c6a@gmail.com/
> >
> > ---
> > Jernej Skrabec (2):
> >       dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
> >       arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
> >
> >  Documentation/devicetree/bindings/arm/sunxi.yaml   |   5 +
> >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++++++=
++++++++
> >  3 files changed, 385 insertions(+)
> > ---
> > base-commit: 4403278e4ea2f654f8130a5c03eb8b4516a0f201
> > change-id: 20261022-sunxi-orangepi-3-lts-43b92246a8ed
> >
> > Best regards,
> > --
> > Cristian Filipescu <filipescu.cristian@gmail.com>
> >
> >



Regards,
Cristian Filipescu
------------------------------------
