Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9B41A921
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791800528; cv=none; b=Di1IcKVQly5DVRCvTrksHOuI3OJAZvdDE+I9I22axjqPJdvBDtvqgXHFroW+x/9t2/gfXT8qI/LquF6I5qCFcSaLxzNRM6Ddgz04m+2XOOa4/I8dZs9/8CzB82yXrLISf8K5rPkLtNs/zH39AC7Fwqd3pi0agu6O62FZYOZjUe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791800528; c=relaxed/simple;
	bh=nbmzk645K2Au1Vo+vbmjqut/AfbSCiLc8qQw/5saqHM=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=WJwjpkBWYjbJTgXWElHq7SfjFI+edXWdORHv99jKwuujZB7LKHSgfdA+t6dzeBkrpCv/8MMkHae+/AKbgjYXfqdtfjoc0TyW73eFQzmExKPJeAivLnhSSHa0zWhn1UEcSVhjJyqSr5HQwff4P82X4nv4FyI2YR3X6obYa8N8E7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BW57GVym; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BW57GVym"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so11205085e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791800513; x=1792405313; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J/fGl7AngFu8xJcaPBlF37wwBTAGepjU2CFhZRheH0Y=;
        b=BW57GVymKoBnEW3gNW1YAHOtJQxHCekiXGEUcaP9CRFTfw35EDNiyk8Xw6JAIctSVz
         2OffkoTf+io5p6ghVOEDNHSceyjOS6otJEqNXlaCrZadBEu7qTsWeWtgh2QniTOC2DRp
         aJbOJJRi7imLWqx6AtRkfxcbTURXp0Ph3SB1trP24VE+lrv4CrSiZU9k7QQd+6h+7wvl
         Mf6K6m9rumCJ1Ru4SWqyocBls03Oifd9ugAd7bsVWx931lb48xsvGiVr/Mhbz+ojccHS
         z4NhDGS/BA3De3skIIQdNIZ5i8gdjwmd5vjB8O86um+QGi1vwnTn3l0D+DWtkTjTMKTj
         h6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791800513; x=1792405313;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J/fGl7AngFu8xJcaPBlF37wwBTAGepjU2CFhZRheH0Y=;
        b=lCncz3hL+y4Y7KivJ/y4UZVPGpN4s0nFqmF4/Vse9rVfcuI91ovjf8nkkH5G9kjpGg
         qVUOsnS1DqVW3y+Zir6kRN9P3cPcFCz/ZKvlHixuP/Y/8tnyD+4bOzUVqGpdb744XiTN
         WwwCpVAMnvRhXEzR2QM4XS14uvxOnXDefa9YvMXBFF4+GbG52fAVDP2PtaPjYTpY8QL5
         bWx97mR5s7t0mfoFt2LVPhLKa9cixJ8jvUpdOowM4aDXqylogpVFvSq5JNocgixZ0x8e
         E4XM77KcXpJ7izZzATHHaTnx31/6ZRvrisipse1ew7HR6A5bTEbiKQTArv+J9AgVcL1B
         A+yw==
X-Forwarded-Encrypted: i=1; AKwUvBz08E7/4pTbxB+TPddYp0PfvPygXnuAVfdX+nw0Nenj4n7BcvwFAkpTs2jatQFAgBAyuvSxEcZsFYfeZwU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIb3DVOSkMqEHsY+Y/QDlJSYxihBgxACB+oCJ3g7EAP5JnxF1NY
	umcgTil3/yz5PHHsFtcr8e1zkpzP+O46euMPbB7RNRZx7pPl/hcu494jlO4AlanMlVs=
X-Gm-Gg: AYBFou1RQuXcQbPsJrztb+kt42wwiradbTHQTh1EfnflRw+f6W3MGDUfSnEnxoWV2qU
	Gbbr3or9R+ptxtvWtJLhv4L1oMGazRY0kegWY5bkzTsnx8kZmFfb18ZUEWxz6APtcAU6x+QFkrR
	4KxzNMHF7QzQWwD6fyjwxjX26S5Bi4+TK0gesPUK9mWv3215jDZ3+1IypurmGodJg0KOwafFSqS
	7cdmOj202UFrcmaKldd3Eeb4ZT1/w1PRxvGy8L6kKXINSo0zb+WfXPNE8TcXTWT4CR8mLYZrb/7
	IdeIt0b4FXZXFf59Wt4Ll8n+7rNWQ0KgcRu62AxpVQ9yoOiT7yotNRjg/IlHa6dXvb+xtaYqBrZ
	aRI5ss2nXrcg89TNSBLd2NKoaRy/BIX3Xiy6FaLAy71KKudlSa/ULXfYv2wnflyuJuyXuy3TVxu
	ddsUaFgN5z48NO822bqZxjGnSLxf9RLsBJ0HqVREx1+aO6wXQyh30MVlded0NFa7AKPWZSbD/GS
	g1ZAmNgPKg0GP8fXw==
X-Received: by 2002:a05:600c:3b08:b0:4a0:da23:e06d with SMTP id 5b1f17b1804b1-4a18e4a380bmr173177745e9.10.1791800512977;
        Mon, 12 Oct 2026 03:21:52 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18dd15659sm184807835e9.4.2026.10.12.03.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:21:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Date: Mon, 12 Oct 2026 12:21:47 +0200
Message-Id: <179180050741.66744.3459927533880490879.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=nbmzk645K2Au1Vo+vbmjqut/AfbSCiLc8qQw/5saqHM=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlntuwvSIosDtrlc1xK6mV2g+n6gmepGRNYf61rumds7
 tB3utKuo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPRymH4Z/RhEnNj7FvtSQbP
 mZs2dG3k5Q4K5X7qHdzINI+9vMr1LCPDW97JkxguTwtoivefJlDweaXjmrAbkR7PGc2V/qdefHC
 GAwA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> subsystems:

Nothing really forces you to send them all together.

In the future, could you try to send one CRG driver at a time ?

It is fine to send big RFC to give context but after that, if you
can make you series smaller, it is generally a good idea to do so.

This helps us iterate on the series faster and then you can fold our
feedback in following series (instead of repeating the same comments
on multiple instances of the same thing) Thanks.

Also your series does not apply on clk-next or -rc1 and no pre-requisite
are mentioned in this cover letter. Consider using b4 to point out
your pre-requisite if any

-- 
Jerome

