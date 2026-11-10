Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794300010;
	b=xh5M2d1DwjjqzFcMi0C6DEXxL6nx/VuFv9DXIsYkS+lrDlPjiYxvSrM3LTPkhGBBeq8p
	 IcvAoPw1hMDDt1JZr0FGNt9mcR5pA1KcDudpnYR3Lj9x2MgHTQuWvhNCRnRU/OojXlydM
	 g9WfKpP/JZl6EZP4bfCMi2QyjXCQ8rDirWkfKuUftS1uYB+bm5gdnK9pjXnPXdfPdq1K/
	 jQphYgVN3zay52U35pI/ObUor9D/SwiDMJ9ytNz72+9xBKsHXPSoaDHLA/wS/7ueacXRb
	 0IaMobWl86e8ReiCZuH3rmOGkCWewB/tQDQmft57SdEVRnlMszRx+B8kI5/WpNsoYHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300010;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
	b=uor5jW6ceiXWE4sH0/BkHWOI/t180P66HDE/gKdva3pL+uRXE/0MB/jNKRmYjHFbKsBT
	 V+M6jkNMHsydeZEuj9ZXTnyh00iOAvPB3hf6IwSJL13Xej6nTPiRtGgTYmLs32StoVuxs
	 UVdBQB8McgyM5usPVgMWlp5poquasdnv/ZwzRON+yFnBrSyuoAsOBwKu/4cCuGA2jG4DK
	 Pb7wXkRCHbe1QhBLeFmlfKLpCF+Tskj/ZzDcU34+wO8w1CeQ3HLqkdlwvQTuhURk2inIj
	 m6d5Ib+9QyTNnCOEKyboe31p+eHv9kqPfLdPebmb+SEo45kdjhaOiGdShVM7QHVpfmg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erqMJc61;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4375B606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4375B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=erqMJc61
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso1479923e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:40:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794300008; cv=none;
        d=google.com; s=arc-20260327;
        b=qtrUQWoi52/RJLBLNTWh7RvTK7RCZUz5slrxGz5AlEaZIF3CUtEz03y5pNqURczdht
         Qe1xHNRxRC12uM1ZgC6lJNXgdwTrYWaisHdaoJFFRHwsWtgQjXfnmOAfe4kvxi8LPwxN
         dbkYCajtwfQSS2SksGo+WvfOBm/aCDI7EKxq2ZSeSAYCk14L8p+lllV4KH2Hl0e1kcd9
         /GQvEvLCOtZjDVurv0O8QtAxoqL6Q42FerctAqN6PgkV3g5JEW14YFJGSKetZwpRl+1O
         i4P8LqRUh6GQokALxGe6kK4b9M6yC6CVryRNFl37MIi2PxSUatTOtRGJEJTFgFJoEvKS
         PuDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        fh=7WC/V6Q9STIn1Nm00pnbmGev+nFmmEfYtD5GaF5I+bg=;
        b=PFhrIcDY76SfBzYXBfuWUL892OAaoUhymXtxilusjQySbup9BtGGd6KJ3yN293MRXm
         jOwjw8QXR3lE2nwi60BgsRiocyXRfZCpIWeHfIaxQaMI6FouFODzg8WGMXM83g9xxyAP
         s6vHsam4cj3z2D136tz4tqMTj7im08g1A4zeNXkiYXhb4cBxHArUyA5RYze3VR9D3sUI
         yxFX+gDXozmZAUxg7lDcNcUbiY5SaJgp3a78+SiIghyIFsKhOG9H/6XcbooG3NtFgKL/
         CMwkL5jYS+a2mSR7JhSnDf3ByyIwlSrtgkMqFpzksanKBihzSDZN42cRPRaiKEcR58Rs
         gBMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794300008; x=1794904808; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        b=erqMJc61ecf7vlG4d2tdf2CJFIC2b07UE/t1Hn8pPjq0Vch3Q3SA7exnP5cF4AT4Yc
         dJtDL+h/rB28g2pKXnInKB819XzQLiCkmE2xOSc5SC2tcGr79wdf7AGtX7qMlMDDLeS7
         YYRUCyA6U6zclh9KAk3319qyCV3E+CxNrRuttwjSJ7u/7YOnFskrYT1r2A7Dv5SE474h
         QAy62Ib9cTCs4KdAJ/UltPLBPQ5TqFBhgdJp+dhQaDU1DS1plgG/FkiXTg7FbugqFqr5
         0alUNHmUGIzCXKNyBBobL+TFPAKGftnsPnRHrxQHimZBQd1KEVCaAL8Wc8UfR+2jfNXA
         ACvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794300008; x=1794904808;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vbdtEbm5LIRul3kqOHVd2p7iN83nh9BlOv0Le65cRbo=;
        b=VZRMcVAwKj+JOuhmW0qYl+PGC69B1rNB8J5t65lZBeSM2rRXvDZplpFY1LULZSICTd
         R3SGV6zHGLDIt6qaT3JuChhUR2TOT/Fmd65GrW891rBhHZCRHmnXI6mJOEcMhBDvORGh
         ZDGXl81PKLWW0P1A+L4rOIrJi5hFhPMWWqMcV/IAghL12vojbtvYOFDvPSvdhUQ+wYXn
         HsuX/4GrITRzDyHF1BBQVUqlVl5HnJtndwHrFCD8rO9GnSHWmoQW4Gqg3nPdmSIZMnJE
         BlGP7LsO+HdWWiVCjuYvIo360p6Cp57R+trKttUHR2IPiBMlTyX7fPusMeInHnMYClzu
         0aSg==
X-Forwarded-Encrypted: i=1; AL+hErFe7zkiQ8IKeKpq1TUjesYcIzV+AWoeVDlYi6ShM9fVrkmd/wQOKysxeNNwgQjVFpWi6nzt+z67feH6De0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BkIGl+LVeZoYI8oBfJCG1oiyDLmGDUEIZePfak/FZHrbfJobC
	ONR1ajRrW2za/V+x6tY1wc6UpjtZ+NG/JBcFtdncmvthxPf0n3PLXlp2BofbEgo5V8Ra9GMPgXO
	E8+iMAT/k3qV/GyEaj3nP/N9ghqxOrpk=
X-Gm-Gg: AYBFou2DJYJwDeH9H6mL7evTWp5pCTmamRkUK4XV8AnVPnS7NLUyzwY0/O73x4dbAzY
	lFf1+LmgneRqw9ZO4Sx2lec97EB3zqIR4apgDkMnxCFn7F+G6YDK6gTRoFFqdCu1/9sAcXqJtQH
	HdJ/z8qjoGIYYzei3hiTbCiuMHweqrseZlwZqKKmRfLQjQazQtbuBwOf1gEJ16GiSqIWrwSYHvI
	3ji62eviBHd69Kcf/Z9q86oL5UlKcdTAjpy4Bdgq2JvCYB+WzLLef4yfe2ucc7TYqTry/b6iBmI
	asP4oX2zHjBqsRacwuAtO9K7/QkAE9vy97hT7hu3/y1RffhgVD6yrKp/BnCHm2PmAmVNkjHXel9
	vjXyiRfSo9cyYpOgoEOB5HioOw7OTMNp405IfbuU=
X-Received: by 2002:a05:6512:1090:b0:5bf:c5e8:7451 with SMTP id
 2adb3069b0e04-5c156ef6a9amr561697e87.65.1794300008049; Tue, 10 Nov 2026
 00:40:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ventura2-dts-update-v1-0-b085ece9bf57@gmail.com> <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
In-Reply-To: <245d0e9d4043c0957716a6a32985b6ea5a8cb9ef.camel@codeconstruct.com.au>
From: Kyle Hsieh <kylehsieh1995@gmail.com>
Date: Tue, 10 Nov 2026 16:44:35 +0800
X-Gm-Features: AclHuK_YmaCFjS3fljYs9klvoSNNKJV2oWD2Es6eIsNEQSomFv3bnXQjY-fu8gk
Message-ID: <CAF7HswPYb3hOWA7P-d1zASvd1XzaVeuBkoqz5nXHuDeEAXDhrA@mail.gmail.com>
Subject: Re: [PATCH 0/3] ARM: dts: aspeed: ventura2: Add LTC2305 ADCs and GPIO
 line names
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:41=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
> On Fri, 2026-11-06 at 11:08 +0800, Kyle Hsieh wrote:
> > The LTC2305 ADCs use their internal 4.096V reference, so no vref-supply
> > is described. Patch 1 therefore depends on "dt-bindings: iio: adc:
> > ltc2497: Make vref-supply optional for LTC2305/LTC2309"; without it,
> > dtbs_check reports a missing vref-supply for the LTC2305 nodes.
>
> Can you provide a link to this patch? I am yet to find it on lore.

Sorry, I should have sent it before this series. It is now posted at:
https://lore.kernel.org/linux-iio/20261110-ltc2497-vref-optional-v1-1-35c96=
57f3c0f@gmail.com/

> In my opinion what you write here should identify broad patterns across
> the patch series (perhaps how you've grouped the patches and why, if
> necessary) and not rehash the commit messages.

Understood, thanks. I'll rework the cover letter in v2 to describe the
series as a whole instead of repeating the commit messages.

Kyle Hsieh
