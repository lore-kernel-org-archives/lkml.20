Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794189793;
	b=Ws0CWSTyLEIO53YBJPCW8qwH81iIcH5dVQFiD1g+2C1j4HB+k9V0FzhT/BIHX0/HYXT5
	 hrkhuZ5/YAj1CS+OM0S/sCtOCkNNXj6xLxKSb1Z044VjNyPb+n0+b+SWThM251jacU3yI
	 tmzCBfNROYmIwltaTg2ylTyNQGNsfuBUGtw7qummfGchI+WK9SMMpFuqyEq6sxZDjG2tv
	 ZLrs65BsfVCN2Yz5gRDtZCDP/iqQefgtUjo3P1h3P2aWpHLWh2/HXsBRQPSz5kDd+vs0t
	 Xv/dESGFeLOiFYufSzx1JaS6127iSK43l8MV7QFg+2ndgw0+56ttxVEpcmwDquEzLfg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794189793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
	b=RldmGwgsjzgIFC2sBsR5d0tEWhbEvpFkKvjNx84z7zuq2+MYPoc7vqTrhONHxv4oZiMe
	 fj9TJED2vdN2KEch4efZRpspbtrotVsjSEdZUS8EFJXpHZOMLFTqhSpPU+HDCXOOhQX0t
	 UBO7s0XImfE//vyvoKAfYBWEhic4OnGbFJipWj2IhlJqDIYKBvh84cBT1aSIAD96wSL+5
	 gFOtkTy9YpnM/b6RAvdzRhSJMlRf0CxwgN3rdHdK0v9Ct+SV+Hz3fFRuHAMRqmv47xw1x
	 MwlQ24Pi52162hgniS7DWT4sYUceblxRYi/EoE0N5eC4C8SCxER79II18h2wUQSnsFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gU7tzgd7;
	arc=fail smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7682B606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 02:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7682B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gU7tzgd7
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14a204305so283429e87.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 18:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794189791; cv=none;
        d=google.com; s=arc-20260327;
        b=C1Pgf+py4y1EXlQUaKzl5+wjSBNOKEdc6bjw9Uk5Okwpzjt9xjmj5pBnGFiEQwzgO4
         sqGnBsdJ6rDN5WImQP+6C97WDVUe7m6RPnY7DJVsAkgssATTZJ+25HnWyf5PeIL6oYmR
         hurWM4B48aX0HQL7NS9l7Ao98MZ0NNoEW7kahbLQzCp9MX95BOushnYh6eu1j4ZYZbV3
         iY8N3idxoZVmiLElxmdWDokFhyiivbBsBgclNiGXsQj1HxAn1wnH+eUHvx2Mufg3OfnG
         zC+rnjMkOiBPfjFxIupj94w+fjppb099R51vB92q7Yy/YvX4UkGhgItGS00dYwekuZNx
         QKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        fh=6kRVF0f25vhpAsH/NbX9NUX97tNRifXJ3ZCHMgVAjx4=;
        b=AudclSfR2k52jjx4a1fh3dupBN4tlF8veJ6j9WHXve6ldPy4+s2mx/Lu7PhxHmFdUB
         kF08VjSLRR3w5MkPHs4yHg9aTiUnaCGflO/AVPIzrXCUHkbDjtC09onQUhJ3nkpJxwWD
         NqrudQQmc6AKRciXpJTSmMF+7JQDSb8nAfdo2JUZaVQAotIMViYfM7xgqK20Qc7rt/i+
         VY4pXVrTAHiXixdftaKCb3FlYjC3rFixcLdjl17I9CgDN2b98rAj1KRJX6PY0oRInOoF
         6Hf520Lt8XTdMR0VW6fEhRehqn/JcQKCk4CPDmIpijpWG1jbpmvzQzBJcD3P0u0BWwKj
         DwiA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794189791; x=1794794591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        b=gU7tzgd7MExahHiRbCCINPw5gun+4aXU1RjNEpt8Ppsbkxat0Yvq9blzj1LZyk91Yo
         v2GvsProReBVRBMqbOtskIRTtpmIml8qt9GbxKw9ivXfFXJgr4sG/RJ3Gkc1EDx1UpV1
         WIhdtbeRwOKtoz3wz6/n2N/Nw57+Jt0GWBSsInBIqwgA2q14XWc2JV85gyQSDLn5AwSw
         JOW9KBrBouqJfL0Lq5HKHvQaeZf1Uk9wbq0Iry/CIjE8RLu0PapRJ++n/SvUuI2LV4cb
         /dgXLi/EvjD6dHgznH6UtPMd5/2BFfZ9zYn1Jl3zD+X2P+TL7pNZbIB7a9XrE7opbNgu
         8IFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794189791; x=1794794591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JHVLOFSLCv9GVsq054d9bMCs6jEJnblXl1piTel5GUI=;
        b=SgT3rsLh3l7mO39Sw36oYdFq/pm+ZRuJq6VAkoE/jzsrZDaG2C5N+KHpkaGyMcFnM2
         EuNKxQWWacm1XL0Ol8XmdDK9c7MaY4blWRULQg4+ldcZ/a7mXhzAdYtVOPrHt59GCQeD
         RGq6I+W/N+fSfbyLHP/ImO/j+t1EiB24YZR4a5bbknxxUxZjEm1pNeHYRcAvVLSLetRq
         rREOHNYivHln3YC5BFecOR6Wveb3keYo8jxtvbbcNdSuLSuahVPYUkPbwACGlBTaUVFv
         s4NWJS3Sfd7QfWeQ0O8KAfEgi6d+atdZetIATYnYi1FtZxnyJ9+x4yTB0jITYWbLsiT2
         YZkw==
X-Forwarded-Encrypted: i=1; AL+hErFlOEMxBoKBKa7sS9ku2j6F/MlTsJd55GSgUMOvZezylTGJV5US0cTyCPDGfqRKQc7XRLpTdmDx66xr0vA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+C4XFRMyKir2WSXMlUencZOqvQrS1OuqHsT1ORGKOToGaIS1Pt
	ythV+D2O2Gc+KCLj7gBy6HN2euUflplprMeeAuqI4DzCHFtk4HXixOBD8Poj/aUJFOFWYgoXE+M
	zy6DeiTXufWyIE7ZXGeLO2HvQ+oq4LM4=
X-Gm-Gg: AYBFou1BxgGSyaw0IGtTCOdTQND9Kf994UNSh1+4KCYPSyrQn5PdAR0wuNjSsLIA7As
	1J3BHs8vMG5LnpC9tbxk9wABH38HS6YV8C2Gaet4quuVuhVgwgZcHp8tx/ZnLxCvdOvmeU9P+wX
	hL9d95H9qsZJjf2J0BZCfVR72qJEUkJ5aaeRQhGC0dvqgUaMS7AbEtS6g2/zfwEk04PkvWw63+m
	hr5um1x7xQAsQzYaDR9pDKrRKID0mnvwrth+yhWMjyAC2UJ4798hwgf1oyjknduJQFDEJM3/73a
	d77TuFLwj8lqeNixyswUxpcSwfUzfuX80QFUkKWpzruQvQ68hehiAIM9vqLBlHPnUWlsKI8OMDL
	LLzhsaP1s/IWBEMMjN7zkpv7vYg/1vj9cjkSD19J0dc82j6MyX+ld2mymoO0Zdh6Mvv+3thZLEx
	ULnP3xhzvrmATlQwGMMkTVLJwrQxA=
X-Received: by 2002:a05:6512:220e:b0:5bf:bbcb:509f with SMTP id
 2adb3069b0e04-5c14c02e15emr627836e87.37.1794189790992; Sun, 08 Nov 2026
 18:03:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106090342.2601665-1-hongxing.zhu@oss.nxp.com>
 <CAOMZO5CQtcpb04Vp49Rg_+DHoozRpQthW3_YNAYQHqi=VOmpEg@mail.gmail.com> <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB120197A63428B4142714A8F148C732@GV2PR04MB12019.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 8 Nov 2026 23:02:59 -0300
X-Gm-Features: AclHuK-L3h5gzP6mZBeJdIsXpM-rka8mrZeT_p3Ww2YWyi1VobDmgIX4-64aPE0
Message-ID: <CAOMZO5BLAnXVRMQLz2pJuJfcGgDWiQcoZ+APfYkBd4UainfJrg@mail.gmail.com>
Subject: Re: [PATCH v1] PCI: imx6: Enable L1SS support when supports_clkreq is true
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: "Frank Li (OSS)" <frank.li@oss.nxp.com>, "jingoohan1@gmail.com" <jingoohan1@gmail.com>, 
	"l.stach@pengutronix.de" <l.stach@pengutronix.de>, "lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"kwilczynski@kernel.org" <kwilczynski@kernel.org>, "mani@kernel.org" <mani@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

On Sun, Nov 8, 2026 at 11:00=E2=80=AFPM Hongxing Zhu (OSS)
<hongxing.zhu@oss.nxp.com> wrote:

> How about to update the commit as below?

Yes, it looks much better. Please send a v2 with this explanation.

Thanks
