Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843794;
	b=oDQG83L6zGrNzrucW1DXrP4rb4O8+bW1sNfGvcu7IufTlg/3sIvmqoPMAKSIjbL4pMI8
	 9lm4aVHj8Vdr6vtfxTDcCi1BH8a+/w8eufTYJG2kDl0t90oQAZYpyhWmtZo5MaDu5/449
	 nrdespJ1ZBfLl5E+JQahkiWL6ozFdopk2r1aSa/fQKtDGdpWH9Qz7P2OFo3nrhyABGWAj
	 qwgt5GVI9gh6C5Tao1pHw28Bb+QaDkfVgR7lEZIVqi/EDZt4a7cGknHIdQiL5MzwtdGB9
	 9+/YG61BZrQLAMMBSMg6fgyEp+3L/be55deZVKZ+eGc7uMC3e8ipkxQ5htICvH3aOpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=IJHaffMbI0latXPW/JhLxzhVe23CKe4SRtO0nvr3eEQ=;
	b=nYKnq4PSfdAGpQzXw2yUe3ZV2VBsDjWef2OJM/SHHQKQLpiC9cukSMkFPc2EebOrT2YL
	 UE5hNMYyeoshHuKJ/SG1KNUcKn5T+4hN54JWYD+feNx+DjV7hozxrm446svg2lYmsF/gf
	 WJjp9CIkRTyKwAZsNlyyLklSOaLnp/ZKAGSM52U0oKeQT+zJ9zHwXGfXC2u26veuVLHbS
	 7NU6TIFtOlMYszjM7AgKPCTqr/bzJDqusxAKX0qdVZHgcg7yadmWtka6j0JONl+BhSCJV
	 MGL7g4SAMZ4jpw+Yg9aDLl14MbQ670idxzavbCNY2niNChuOyU7JzEgOJAM8SQfDQQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIvOPpZe;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D293F606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D293F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iIvOPpZe
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so20543065e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843792; x=1795448592; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJHaffMbI0latXPW/JhLxzhVe23CKe4SRtO0nvr3eEQ=;
        b=iIvOPpZeZLBZWJF6EwF5PeDI4dDMbrbhPK0GLlfxkNxFIpqiLeXYcmd+snPJMChlQN
         S7XQmJi2+nRMlGVr0gefCmiLsnRdDuqWcNchF3t0QiyrGQE+3gyEl9ohNWXEYEKX9m8t
         8RLVLlUK7TJi2QnofN1OXTacA4+o5UGo5EKkllv8QSGwF4rQBUCAK4+twJD2lvhiVyeC
         WUKQdxqc6htoMFctdDNLBaSH7L4TxoudGGv63yEUtmBD3owZ46XNNYodOFBx7jl9/GBJ
         BHmd1AZOLinvCxrLjiHCq9D1unCCBXNrLBcG7/mS4J4GHYjcq5E+RDGWCz0oZd6a1+Br
         GQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843792; x=1795448592;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJHaffMbI0latXPW/JhLxzhVe23CKe4SRtO0nvr3eEQ=;
        b=kRAJ28lPLRBBmzRNRCoWSBdPBT5I5TI8Zn0BhRqK39ywTHZt1G2WmnrUgv0CRSAjE5
         cmpKMOcU8ZrcZ6PaOScNy3gXmBgRcFamNNmik3biM+kdGGk+UJDO1nnmUpn7qYuQYvp5
         R0inhzvKqy9ZAHf5AfQpPKgMJNDWleld2q6bGKKp4bCrrSkcP9EEj3wsbcbRPsJMWXwg
         cl95cvHk1OgLNQBwOs2nOEB8+wUVqtUkS4SU77emkiCxRD4u/+lCt19Q6t2YJoGP29JW
         aD6E72Wm4/w69G7ptmcu6ucg/L4VOJwrqx8S/DfDoavqks21cjAoM7I3gFbpo95zXjOo
         M6Pg==
X-Forwarded-Encrypted: i=1; AL+hErFy3JhJIlTedrvI6Qf+Ew0wN5rZQ352Wd5uZKx51GGiFMohGduqW4CLttxCBsHXHcXrml/a+6126SMiGOM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oKsTvzWB+W3K1CnkBnwaNFd0B5kFiWA0A6LNAldtZRRJkX6YF
	BaWmOzPNzxjn4ibt8QAZS2yX+X96RA0kGv9MELIGTbzo4VV6U+FbwvRGoIgsHw==
X-Gm-Gg: AYBFou0WQ2HpQRsgvFjdL/vQ3BhhEl9s8PuxzNdHm6/9GmD8S2fErYSXiyTMxN6nrp7
	TVk8ujblfFz/VJAKM1MVXFG0IS2WSJ1uaAmuYDtyNrFRGkwBIz2JWUZNknMmaTySvjUNDM5s/is
	ecOYqgBIgu1ryF6teFkGvPzoYBLXKFIY+L+io2wDGhn0YZFJtoj1Qy8w/ME30ApKeeZxcgH4DcJ
	uw6iJmcEBy4H5Zgsc90EyRDD0Gsc5Mu/4i0L4EXEmxk189ETs60dz82avMIq23f9JbYyRnjqBXa
	WZp2e+LSonf6govcp/lXrIkwhi1uqfPzbso5x6nqi2G3ZWqoDWkWHCNdFQBHEI0bFFXFiWfYOyV
	Rtv8s3UbhhJTsIPABpdihMi0Bx01m1FRXRkw2zr6RSwTz85B6ioEE2RoDwYmy0iweLHX2izYSSG
	GA+F3cYG6Qx76WEmFI3SSw4gwhyZ31vJhSeApoQe2CB2sPwjyihDCrMw4AtbcKMi4f0I5aZNdDq
	+nT7JqOfQfeSi/SOu1RvQm5unDt+YdgpBSDRFVeFbriKElLHxpi3DY8h68wEVLPqm/UsVNcCfP8
	d4ty0no6G/r4jP0L6Z03sqs6B5lckdXtq3M/xUKxsY7ug+zPpJU0cXOFI6/Fq9hNi1d7UDQMgfG
	v7JW4We3YlV4PaKvhHDSk78IqEMWR+HF+bncSnKU+1mt5lUHBaJYt9QjTvVA4rK4oFGqVf+SKOO
	0Dcp8+Cg9wcCz1HKWTHX3P9ZBMD1XkYMvuhBwFtp9eoSS4e97qkN9YY6PbB4SR4ogGyQcdVVwL8
	2V3GeDeUt/u0Wu4E6mF7xgn4IMrJ66GdPSfRRf6Iz9CEEiawm/M6vZ+yRn8
X-Received: by 2002:a05:600c:3487:b0:4a2:526b:d410 with SMTP id 5b1f17b1804b1-4bb55a4f1b4mr237565075e9.13.1794843792030;
        Mon, 16 Nov 2026 07:43:12 -0800 (PST)
Received: from jernej-laptop.localnet (95-143-148-21.dynamic.telemach.net. [95.143.148.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm116544885e9.2.2026.11.16.07.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:43:11 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: axp20x-pek - support the AXP313A power key
Date: Mon, 16 Nov 2026 16:43:10 +0100
Message-ID: <0au3zkKrQ_KG8TbI4m_Fyg@gmail.com>
In-Reply-To: <9639a3578bf1cae847b4b0cdddd1a0e0@gmail.com>
References:
 <20261115150903.16855-1-jernej.skrabec@gmail.com>
 <9639a3578bf1cae847b4b0cdddd1a0e0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 16. november 2026 ob 08:39:21 Srednjeevropski standardni =
=C4=8Das je Dmitry Torokhov napisal(a):
> Hi Jernej,
>=20
> On Sun, Nov 15, 2026 at 04:09:03PM +0100, Jernej Skrabec wrote:
> > The AXP313A MFD cell is registered as "axp313a-pek", which this driver
> > doesn't match, so the power key doesn't work on boards with this PMIC.
> ...
> > +/* The AXP313A has no AXP20X_PEK_KEY register, so no timing controls. =
*/
> > +static const struct axp20x_info axp313a_info =3D { };
> > +
> >  static ssize_t axp20x_show_attr(struct device *dev,
> >  				const struct axp20x_time *time,
> >  				unsigned int mask, char *buf)
> > @@ -193,7 +196,26 @@ static struct attribute *axp20x_attrs[] =3D {
> >  	&dev_attr_shutdown.attr,
> >  	NULL,
> >  };
> > -ATTRIBUTE_GROUPS(axp20x);
> > +
> > +static umode_t axp20x_attr_is_visible(struct kobject *kobj,
> > +				      struct attribute *attr, int n)
> > +{
> > +	struct axp20x_pek *axp20x_pek =3D dev_get_drvdata(kobj_to_dev(kobj));
> > +
> > +	if (attr =3D=3D &dev_attr_startup.attr && !axp20x_pek->info->startup_=
time)
> > +		return 0;
> > +
> > +	if (attr =3D=3D &dev_attr_shutdown.attr && !axp20x_pek->info->shutdow=
n_time)
> > +		return 0;
> > +
> > +	return attr->mode;
> > +}
>=20
> axp20x_pek->info is only used by the startup and shutdown sysfs
> attributes, and we do not have variants that support only one of them.
> Can we drop the empty axp313a_info structure (leaving driver_data as 0
> for "axp313a-pek") and simplify this to:
>=20
> 	return axp20x_pek->info ? attr->mode : 0;
>=20
> ?
>=20
> Thanks.
>=20
>=20

Makes sense, will do.

Best regards,
Jernej



