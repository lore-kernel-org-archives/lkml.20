Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB32C125AA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791418063; cv=none; b=eXlrwlHfIfbaj3k+08UvnKIpLwp7Pf8jEhK2iSAQouCx9lenqgYbZefF8o5NR5sOnf52LDTH3wrhEYz6mEetYt9JP3HMLAc3k7EtxpJjsUQxGFCdfQDABQzlHrEov8cLH1qqts8Evg4Jep6B7sRYP1YXBiXesjVvNhOmn/62l2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791418063; c=relaxed/simple;
	bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=acMZJQBFA7jS6CFMtuFGCUQDltCQmDLnn4a0TakCXBCx6L7gZTuCY29+8SFUXRVhMPsXQOqsE+NpsT7EoitI8NucqGueq0+La9BUoq6AFMP3YTZd/XiE2eTt9vy0UHmxZ21+AFz1Sb6iV4RYHApDhej/ehYWUcZ1WAqSIzrE2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG57klW+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG57klW+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-486e70f2457so2084494f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791418059; x=1792022859; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=iG57klW+wzwbJiwL9z7I3Vw0Gb4EvVA84WWSsEKl51G/4OL5Ia4iOj2mF18kKc7baJ
         O9O8d3fTKBxnm4duBRTdAIsxowZnA6lMNGRiFG5RpKITA5k7iPb+YaGkV6QRwZw74Ael
         yL/3hWfWMjnMVVRyPRTz7jOEN34pEvl7OFRBBcRzOM+lr+GYKaz2Qx9Ul8rjaD5aSOZR
         9Q4qFrnTBW4mcU6KOvM1gEvLuEvhpaO/beq+PIHhYvuC1ptPJTcHPY5TTbB0CRQkNQeL
         zzs0qGWHVlYC7jq2o7qxrA0dx2flDaKHfFy51Qbs0HxrWWjFGHr04LBN3DoFtYzzt7gg
         JVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791418059; x=1792022859;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=izMm3ub5pHWSzU9B5+I9vrWo+LdhgWZ+NZKCaQYUlMA=;
        b=DbEXfXfU8z4q3a+zGFJqy6DKNcSlXLkln7zbYiYW+NlBbXjIcWHsoFcydR+wTftDAW
         UyHSM7Uq62+xatYNdWHrPiBMThC8AjFQ8Vz1RLnBxENSouNjboq4/taywdzbQHjbKXOz
         w+gApDhpwKvKZQVpQGtw4L2ogcHWc5zL9ry0P4PrBVkST4ofYd9dNCvvYDtMMUTFTXRN
         F+5oPJsP7fcHgcGTVTo+d6NCluCvRRy57SsNvleOxORij/Epv76hFsNP4frGMftNuAIN
         K2kB9Q0gtHRapOHxVW6+VGr02vS3YNboD3bucmJNJDbtgdXz9GRGSZfqZ71H9xTtihbr
         QxRg==
X-Forwarded-Encrypted: i=1; AKwUvBzZselCwTbuDDEkcTXoL7cpYzsRQpJsY7f4VOXElFx09FKI5bE/0L2tMSDE2t1yUFYkB5sRvKUmm9p9Kw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYITFe3+RmcaqbUAOSjzoFuReR9cO9M0Kv69lGW5hEMuGF1cUnyB
	gje56irDddeU04rOmikTKZeA4RJH/Kkx4jBdOo0jUN1Xa6yM2Y4rBd7J
X-Gm-Gg: AYBFou31+6yv7hcG2HXIxSVpZkk1oJNs0d3Z5g6ovnl9Yrx5oJ1cwnjdW8/CYLJ3Eux
	9peJvvf6NAr8UCB02Lzn1SdR7HNgyQVcYkmymTUzMdlJMODGFLIvJQRpBBpUsoU1mZRHa37WWvN
	4VYg+t9iS8UI5ghvcbhG/rChNm0QYKkTmrO0Qh1R0dIwmAih7Htg/GMumLRLa9yPXmkloy/8qND
	iQldofDVDMZuBStbbmvWLHG5uDqg2Ych7V70q2bBX5+lz4uG8I8K6/Of6GVOSngDfB/vsoTeaMb
	EOfM/8HzsZwX+YJIfYsbthzLW4rIbNSuSXwKGO/JXA0MgAIX9I8YHCULuRhitLiVTrR/4KlDwCi
	djKW3jjDYOVtjvquaYflexWyBaBnLwE1OBaB5Gc4C5xRGJ+9f/YqEOmnVt+mW9x+Mne6tt76WJz
	WzKbrC0cK8iABZb+r9CarhTgwqFGYO7MvyG83bTDC6C3/I4WU7uZD5V65VxS3E0/yefisT8pfAw
	W2vPDQFc2ycNamTHofxfDJE0cXj
X-Received: by 2002:a05:6000:4818:b0:488:8751:e78e with SMTP id ffacd0b85a97d-48c72788373mr6736354f8f.16.1791418058790;
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c7fb9eda1sm1040996f8f.7.2026.10.07.17.07.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Oct 2026 17:07:38 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.3\))
Subject: Re: [PATCH] arm64: dts: amlogic: meson-sm1-odroid: let the SD card be
 powered down
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <179140715034.293470.4459182430175564610@iav.lv>
Date: Thu, 8 Oct 2026 04:07:23 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dongjin Kim <tobetter@gmail.com>,
 Eric Neulight <Eric.Neulight@linuxdev.slmail.me>,
 linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AD1E9AE8-8FA9-4CC2-AED8-AB2F455FA8E2@gmail.com>
References: <20261003-hc4-sd-power-off-v1-1-f7ffba01b348@iav.lv>
 <179100548183.3372253.2014593916926884551@iav.lv>
 <179140715034.293470.4459182430175564610@iav.lv>
To: Igor Velkov <iav@iav.lv>
X-Mailer: Apple Mail (2.3864.700.51.1.3)

> On 8 Oct 2026, at 1:05=E2=80=AFam, Igor Velkov <iav@iav.lv> wrote:
>=20
> Follow-up to the dropped patch.
>=20
> An out-of-tree restart handler [1] power-cycles the card: it drives
> TFLASH_VDD and both tf_io lines low for 100 ms, then releases them and
> the card is powered again. With the SPI flash erased, ODROID-HC4 boots
> from SD after a warm reboot 5/5 on 6.18, 7.2 and 7.3-rc5. Without the
> handler the boot stalls in the ROM or in U-Boot.
>=20
> Where should this live upstream: the mmc core on restart, =
meson-gx-mmc,
> or a board driver like this one?
>=20
> [1] =
https://github.com/armbian/build/blob/main/patch/kernel/archive/meson64-7.=
3/meson64-reboot-02-port-to-gpiod.patch

I=E2=80=99ve been doing some bring-up work on S4 support with a VIM1S =
board
and Claude initially suggested a u-boot variant of the same patch [1]
which improved but did not fully resolve the situation. I was also not
able to explain why applying the same change via the Linux device-tree
that u-boot consumes didn=E2=80=99t have the same effect as essentially =
the
same change in the u-boot dtsi file.

Claude subsequently added a second patch [2] which resulted in 100%
reliable boot. However that allowed me to move forwards with kernel
work and I haven=E2=80=99t yet circled back to u-boot to run an =
experiment
without the first patch.

[1] =
https://github.com/chewitt/u-boot/commit/0a3f5693a4ff192eb044fc4c5a434770d=
e053835
[2] =
https://github.com/chewitt/u-boot/commit/8e663632bc500ee6a83a846bcd3242231=
c33aa43

As usual both of Claude=E2=80=99s authoritatively worded descriptions =
sound
convincingly or conveniently good :)

Christian

