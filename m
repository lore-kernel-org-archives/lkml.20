Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840248;
	b=C2+1t1IyGKDGGp6r4VSEPYKdNTBZbi9C9mhd8C12ZfsyzTdYp3OzI4fcFHBdJTMTAU3e
	 3vEs7o2un0UlRZ+2tlH38wc94uAl9kaFEH6kIAcxh29sB2CsfPQ2BxdMZ4ggFWoYLf9xE
	 +hbda8L8ZuCGLSR7Hy91JWwbXYXSzV+gJDEqVVDtpHJfyXaFDInf2DaU9ys9TpR3Hf3t5
	 IN6UHoHvDAmAvh0MWWlOXFVBXPGNbYGlvM3LBZI9BWBaD7idfJRrUfn21Awi5lw/+gewg
	 aweOxL/H7hsweTH0ZRfiGEun7rHT5oHqhA9wMG7WWNGGx9+jEKTMoIBBzS2p30+v/fQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
	b=jfbzfVjL033+8IYKkKkwrSDwbO1cnrh/1cG5YVP9Eu0lMC4kKWRrnLjQUoBU5Y4vW2Sb
	 6f4tCsEogm9n52/ya8xw5cpGgyLaSajLYu9uvUOa+e2tD70R5iHCU0s2R1BJH4E+0fLSw
	 MiK3jeSlM2BZRuGqGYSjb36Gkc3hVsaVDUhxZ0OOCTE+McDESZqAZTLhq2QIQtjdRY1lv
	 7KYGW8KOwG826pOBpcr8QDXBqxp3gdGoaWugV9bCG1AS7UsBeUMDPct0BEMnn+kuAbvJC
	 +Rpwq28ENZGu1qCYO69eiQ/7D1O8m1fBd7i4KbH2d9jNB2soRh3Fd4P+mrSUqJ+IYkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dDxqpyPl;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CDD606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CDD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=dDxqpyPl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so3113208f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794840246; x=1795445046; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=dDxqpyPlhMnIDKOOdulSkH3iBLaI7M1xknBBwRKdP9D2bShvNZtuYOTZbP+x+jb85C
         m2RQswzPfF2sa+1yR7MRuq+5hy8Nkr/t+OiOkWG+UFljGlXmU0Yq/Djb4egwgEMto8Ac
         vBOxUT94VgsA5Sn6iKR2/bBsvTIFyfUaxwHemT0zsBrGe5xYT6LiwbUAUdDJcJoXE20v
         iwQ6RZFEQdGNf+Emso/3is0/Q7QtOjBLJyi4C2WTxm4YIThFPP6x81jLFCg6HaoJWR30
         6Xi2Ds6WP2qIygmRujvMmqNMej8DmyzoSwyOlhkNMdWcVV3Jon5bLQqT/i2QFJ9j3UB0
         R0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794840246; x=1795445046;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EiBM1lw6jtHc4Msd9f0+IoWSCWSW1EA52TQ2PRTxuNc=;
        b=egPG5ttbTf4fNVDfb5L/kyk+zc4bejSJyhEyK4YVM3dKhA7i/v4H7P5WxOatXxEttn
         llBXSXrMIHc0EFtSWCzd1IqHYHB8i5RWF2PPkQpt68ULTKAlweio49QLptgRfEBGqOZk
         hH8THntmT5Xmvc3EZRqo8l0aKtrN5bFjdw+Z21fkt+yX362PDo+O+yY9eJL5XwAbRMw0
         yZGWzCdAQfkTRgs0EUFmiYvMdBeSWTsm/63QkKKPSj1Tojw6nXmyhRO1islYDUb6m8AA
         TW7RfRzeAxDI7gX9tJNiUSVUZIXtoQ9VSnaYA2sM5zZu4cy7uXOANcOgQcHSYdZUByQJ
         YaSg==
X-Forwarded-Encrypted: i=1; AL+hErFoimyqPK7fVHekQpNqDU4uz0AmulsyMxqLbOYE8tprJKRqG06/0lrBdeQGZCaaFeqeOlx/JAeu7q2+yUM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kmCGmZlu6VY0qGomNyhL9RFwo1eJ1Aar7z6acdxPSCrKunZrA
	Wb7iG4qdvdSYCM9fGnGRl4H79gNYb2QTBg2haWV7G829iqG08YMI0c9VQwu02MHoRRo=
X-Gm-Gg: AZFdTZdPJsudLaXDXTKJxBklaMloxr38SkjvXWId87pucHqKJlMemrCON9o2+i912i6
	2TD2VCWJin2GMYxTiralr7xUmPgQM6Y92Y8kCtIkpf/NwPRNyG49jILsJvcasabWiXdduNZy8HQ
	kolCw/V+nvsRRWeouPkPb6Kra0LgIHoWiUymbv5FXy40grIUqPE0Gzyp/ldFdEx+AOTFL7sTXr6
	uQl0ZTfjQwHTjFJbJPRy8fqihy62Mx73I6Usv3f4jz+OSXK8qAX+67n2PR8vLSW8gqJ+GXPq4oX
	bbROCohsr0sfGzHS3XhC4BaEOMR0U09Yg1rt13JDgwfRVgGoDmY9dpacrGJdyaYdQEckf3k8wDp
	Jr4Pu2iiUsTEUo9gZilBuv5WTgGvtSiz7LoAnwHdlvgxJKZCwzWlaPeDvUAh8sE8I0gnUYVb7qf
	VLbENosbJYBRGKTgIgfNzeSui5BWdSKlk5oXIooYBMmEUQ6WBei7YDBJVZIs60yirBSCO4d2DMz
	eXN/NWns6vqw1xMVjVT4XoTYNFIdInXI3EtLuX6U9E3dO82ubQBMTiyRd2L6khMf/XjKGjA9JCl
	2Om+8qZk1ZbKI4TMQRe7MStUpmdiZ/pqxsblpCFbx+Kmw2bi78hdiTnNj1aymg0t
X-Received: by 2002:a05:6000:46db:b0:492:7d9c:fcf8 with SMTP id ffacd0b85a97d-49c73350e60mr16833660f8f.49.1794840245956;
        Mon, 16 Nov 2026 06:44:05 -0800 (PST)
Received: from localhost ([2001:861:80:deb0:b65e:146c:107f:26ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm24003588f8f.52.2026.11.16.06.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:44:02 -0800 (PST)
From: Julien Masson <jmasson@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: <linux-mediatek@lists.infradead.org>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>,
 <wenst@chromium.org>, Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
In-Reply-To: <afc3ec2a-90b5-440d-9710-2b3892b01b6c@collabora.com>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <179239867012.642420.15110854236483587234.b4-review@b4>
Date: Mon, 16 Nov 2026 15:44:01 +0100
Message-ID: <8733t0ygy6.fsf@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Hi Angelo,

The SPMI sub-device series has been merged and is part of v7.4-rc1:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=10c833da4dde3d9bb19e2092a33abafdaa16a341

Would you be able to send it in the coming weeks ?
We have customers waiting on MT6363 support for the Genio Pro 5100,
and we'd be happy to test it on our boards or help with the remaining
review comments if that's useful.

On Tue 20 Oct 2026 at 11:07, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> On 10/19/26 10:31, Alexandre Mergnat wrote:
>> Hi Angelo,
>> 
>> I'm working on mainline support for the MT6363 MFD PMIC.
>> 
>> Are you planning to send a new revision addressing the review feedback
>> on v12? If you don't have time to pick it up again, I'd be happy to
>> help address the remaining comments and prepare a new revision,
>> if that works for you.
>> 
>> Thanks for your work on this!
>> 
>> Cheers,
>> Alexandre
>> 
> 
> Yes, I do have a new version locally which didn't get sent because of the SPMI
> series (introducing the new helpers) that didn't get picked yet.
> 
> Cheers,
> Angelo
> 

-- 
Julien Masson
