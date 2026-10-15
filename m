Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A59953D0CB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078953; cv=none; b=hJL65U41bmd/UVGlBQR5DqwvtDQsnVCHOj8CsiZWiiK+BtVoBd22NvKkh99pqXSBNzaNexLrSPd5Sgh4k4QRCg2Y/cAJdBAn6XkgiZ8Bh5MZaZ2j4+vEEuFW99I2XC63xzj9ffEU4yPFr34NOSKfp9RgqdM69aE2iOHAqXzs6XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078953; c=relaxed/simple;
	bh=/PrbupM46ccToCRLv+o5mLwJEPyXOMp2KRQjTagiWmI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KT1DBX+kP9KCjJMbUJH7hQOAjNsgWvB64HK87MYeqfLpaVTxya5rtSoTgcQQytBCnEy6e4Hy4/0z8K0BrPiURmU/+BxyZRISsK9fCHd6AWHp/JWaqGYzsUBzhqr7Ulhq2b+oPwunbr9SnCyBhXYzWhw0bWhSErdXirYjdv9Boqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HiCZ6Gpl; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HiCZ6Gpl"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-679a420b5afso843090d50.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792078943; x=1792683743; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/PrbupM46ccToCRLv+o5mLwJEPyXOMp2KRQjTagiWmI=;
        b=HiCZ6GplMAfXLNukGage5AHcSR5Gx13oQl+Xi6NoI/5LK8ICuwtTV4H0srxDoh1mZ7
         AjoOpI9fJUwJ9bs4HpNnOyX2eGbDQzW4Fd3EXJwsYmvy2DSXlq+/Cm2mWa3qJ1ba0T6+
         nc/uDZwBXEbx+Pze/JL2nrBDfMgsYJPVeUC7GB6xPCPsYlI0EvLxCvMfC70osQwn9vPZ
         zpDgpZswKhg0DW2sJEie5Te0DtvNXREP3Y2f42bJtCntsU7UWWeOYNEuBkx2H6zmx5yA
         edDuR+BR2M+oQ2OR8OnuqxVCW8GbXQUxoICwDP/Q0CXH4sWVANrSNyulOXBIEBjaXQas
         XStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792078943; x=1792683743;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/PrbupM46ccToCRLv+o5mLwJEPyXOMp2KRQjTagiWmI=;
        b=f24zeD7c+GtBWIBja+TWKx+ps6qsC8c8jHeXm0Hr98HxRBaE9nEVZlvVTxlQ9JE0NU
         qUmESKu0AWok8CH/QPzpNxTLhdR2NNkr56JY9JrWvyrzK3kCPYYxaMAwGaQPyuaF9v7d
         wUbSINIVbzmBsg/w385mzijh16ERFgxl3CV9cI/K6J9XzZPD/v7rKy4Kd96a5gxZvd0q
         dothA6R2rsO4Od20Ot14UUsYy57TNj3onyPMMeQLh6+W6GHJSYZgWkTv/dvPKWXQFYUS
         bKW+UbBiWKY1GoXN/d8eXK1D25KRueDsNd3/xughwNzHcqeNB9Gwq7bC6rmObrkuXMIV
         W9bg==
X-Forwarded-Encrypted: i=1; AKwUvBwlXOnkSSlFY059oQ83kdnxvydY0JB7XMhfWoD58wclvx7aqzaok+EDnpy0GA6DqAPWCUhRNJ1k48SR93g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwX+dGbqGduLrqwF73/ld/pcq90eDWi3wfBw0sz4rXN1JaFFZl
	mTVX/Cu/Ms24ElsxciIrSEMqlWTDcrm/+EBV0otVZMQ+jniA947MfO0O
X-Gm-Gg: AYBFou1hUbBlUExqKgACHkfAeFlodMzrCZDcHk3P3bc6PJ9MYPAv/4m/xgJ++lyV4qo
	2VvI/nnGYzFZlZvS+346ZrCbva1Qof8uuJ5QIr4lxBUyA43kUMpZbvmE5qduddg1+PHkLSR23Ik
	j2oRv/4C8T0t1NanuO2q6Oxf0A47DTbWP5ps332rieTFczzEyPmt655V4kknO02lxVv7yV5x0EQ
	Lc9OJXkxjFdsnB7wCgCr4CwQgy9gtmQ50jktf2AQP+LmKC1oWZmqAXkwRg/1vOfmP5Gnjjs7oC3
	6lbGQWL/LeG2Krh1TO0B/xEDOpobe4q/TPCgUvIjTATExHXLyf6dC+xIg2jWm+TJgCTgHY+DDrl
	LdeerJWdkhbNcwrZn3n003/os74NWxsTgkl/ElCPzxtUXphANvYUxHM71sMVUw1hL1S+xeCbUDH
	GD6NOA2k5iHJE61rdMDY92KO8qybrisrxqL7E3VG4fQ2YMRG819fc84ORdXDalref5UAZFW+KzK
	wRdznqZGMCRzZ5w/t0/dKwfzaNu2FQgS39lTzIFVlFUy6r7yV9gebeXxgfNl6A7eAoF5zvJUGQU
	whc=
X-Received: by 2002:a05:690e:1304:b0:678:151:5218 with SMTP id 956f58d0204a3-679362f1c23mr5974469d50.110.1792078942713;
        Thu, 15 Oct 2026 08:42:22 -0700 (PDT)
Received: from localhost ([2601:7c0:c37c:135::8803])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-679b1e11207sm162433d50.8.2026.10.15.08.42.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 08:42:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 15 Oct 2026 10:41:53 -0500
Message-Id: <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
Cc: <error27@gmail.com>, <ethantidmore06@gmail.com>,
 <dennylin0707@gmail.com>, <linux-staging@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Luka Gejak" <luka.gejak@linux.dev>, <pavankumaryalagada@gmail.com>,
 <gregkh@linuxfoundation.org>, <outreachy@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
In-Reply-To: <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>

On Thu Oct 15, 2026 at 9:11 AM CDT, Luka Gejak wrote:
> October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
>
>
>>=20
>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>=20
>> Remove redundant parentheses around the address-of operator to
>> follow kernel coding style.
>>=20
>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>> ---
>
> Hi Yalagada,
>
> I'm just letting you know that this change is no longer needed as the
> entire staging/rtl8723bs driver is being deprecated and removed.
> Support for RTL8723BS has been ported to rtw88 subsystem.

So rtl8723bs patches aren't being accepted anymore? I saw Dan reviewing
one earlier, just wondering.

>
> Best regards,
> Luka Gejak


