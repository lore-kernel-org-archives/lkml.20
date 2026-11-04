Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793828604;
	b=N30TZmRfZSN06l7Mv75byn27kA/yRGSD+OJJXUKknwghug7kkUo9R/2Zs5l0Qy2TC7ne
	 YiukOHHvRO+JYFtTo/BSPyBhP2Ex/Ir4j5et++J2HFWy7UwB4MxPNNkmXQgtHFgPvCYet
	 C2pInPVi/UhaSmyBfl7a6SNC8s6tomYKUNFUeQOKwpEsM/qhNrLAqTv9Jjov0eosp/iqn
	 8O8SKOVD+6IAlMl9NObWXmhC1/PwhjQfmfXDoaV4dlLnTbfTjwhhhdRwy2FtlQo5rz/X+
	 PIkIUaG1kpgzFCCCfiDgnrR4QDVEzwdgPsncskUf00neVzdHqNwU2cBgQUuDN15b3wA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ljl4conW2qXat+Nx28zDcnSORLisKvQT4GcICaTQzR4=;
	b=Y60YrOM77+nrsnrpkx7CpBwtzChugHSHyHjI1yNXGiMqDoL9Ay0tgHGq2HVVFpLykdoP
	 o7u8Kf8boPkm+4vI3IA8zVgq8b1CQP9lib3aJ76tSkkKY+WWIHU5czXbBXYOKttDAaRJz
	 o8XYBlFSyzI6uZv7AsqQYBepmBcc1ulGHaDRjncaCUN1l5e7ZjkPYfuDuqMTlyxH/xubS
	 EdbUkD2kusE/QoSGomygH4MggHZX0TPgYfkwbxaiYu7ZRPZpXTMV/965/bvco3xlfPz5K
	 QMg8U7UmtiVwokttlvyykZuSlg+9fVLre4l1/cL9nAiW73cn9eUpszp9cyFqHu+Q46Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0yRGyra;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED251606A331
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED251606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z0yRGyra
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-35159e0092aso123973eec.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:43:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793828603; cv=none;
        d=google.com; s=arc-20260327;
        b=DHJJvAoYHkxIOe7jeLfdL4CUMOyjrfqYKNq6cJVjMrwq62C8YoTQdOvpseRXuR28hB
         jY0yBJw8F1mODVt7iNsYYSp9EwR3fva9/Ml88dF2gh/QNolOAI0cbVvVUV5ZlbXKzjTk
         0GMZRX3ehK1iWof9fIywXERn8zps8FvKL1TkYn3ueh2S/Z8O5MeStYm7S3wvBCCuSrgY
         TktxaZgJluHoAfrJ/NjRaVbJQXVk9qeKUT2txwZ14nbvSiRrwPOTou+J67HKXEz2x1Hz
         M7B6Rmew8Pn7aI0DoiRHb/wfK47lk1VdLEFwLYsB2G90b5wDM5FQuvy4XFu3IaylwVSt
         70cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ljl4conW2qXat+Nx28zDcnSORLisKvQT4GcICaTQzR4=;
        fh=WAAuvfogrL6RzsQZonFwraene9j2bcfKUq1TPyCe0f8=;
        b=jEClMuC0jdLvRAzGCxYke/+QqdvSdQAST3NBPsNdGiCaKJhBlsNzEC6iksKOa+6v3Z
         xR76nW/XUxV/O4XtLnlig2rkJLNK1uQfFjG1vWo2798OmVw7+HKlDxO0teUa1FyvoQSN
         uk2uKuKvOGr2IHS9hEy7VtBGAd5in36+zom90sYR9is+luwZySL3OcXsJLtkTGi5B56P
         ZDRkAd9jdOdMf2Mme0B1GK6GrT0gieUDMZXXHVEccpk4I+4eHRhZrGAqkWuR7DGH7Ow3
         kCSOeR9/H4BVLqLXLxyaHr+nBaYfgR6lBDXV7aXKTKDQ4t5oxujbM79zhfDvLsbU5sPS
         R5Ew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793828603; x=1794433403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ljl4conW2qXat+Nx28zDcnSORLisKvQT4GcICaTQzR4=;
        b=Z0yRGyraJdHMewKMERkG+T9GXIPcGtvAqcvq0dB9CrMEHZDroZ5FSPpKqkSyicI0W4
         GANDTe+2Sb/NospGxzA07Xzbimt72zo4eyQpQhX6cHkMTBxgBRfckYT94/HIS+vuH28N
         OECJvHZhEH6RFIfSkltsAQIYGO4toD8KiTGR+bgFnhRhiRbae1QGmPV2pcW8wN3ObD6R
         8cu5SPEDsLKoWRAMatcxCW/QwcUJHf/ckyE/uwK5mQX2V01JZiHcjjYTbGWuwtlzTZ5c
         IANGLxowxJTqqqJJvczHc90vHKU+UjS4wsuItyU4B/OXY77S6XC4w5OY/yXtzBkvtWCt
         kvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793828603; x=1794433403;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ljl4conW2qXat+Nx28zDcnSORLisKvQT4GcICaTQzR4=;
        b=yVVKbMG0fFiYgAvLRo98JHJh6heryK/K6P9bKB77U8eyX6nl3Fq8c98M0bO2uFnXR9
         hXxiBVfpb+aHMG/GJTcqbwnD+Et9ckbggCtC7bu1udQsk1Sted+AjjAVxkcxaMRkR7Ck
         98MrJ/pVwGLZjV9rUlwpb8d0i6oBGi5iNyRbrFO5FRIuk5dmmJCsfCJMW5Joujz1f/2M
         ZbOx47ULnu6hXgbyv8+UbX976IPwBvx6mr5VoPfB1AHsGduKy6bPKC6Jf9D790Iu/ffQ
         iQnVbIr2vp4S7FIoNuM3T8Tq9CddE/bIUZdiyS7RuMpEZkmB3EbofRg3TJ6TVuBWa+nI
         FH5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzGSnmyO+iBukKadPvtg84zfB2dCZ07pLYydRkZiQSnjXsA3JOCw0bAxGOCzz2n9aDskfIleJ78MuqLfZ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tEeZRLikUYHoG/8I+hB2Dgs46v7shWwTtmUn1d3zGIHw9Qi1p
	r1/QCPl6xFf0MQ7pbDIm+j2P62xJ2U8NX8C42IoYCseDZ9YFtBZKIRXPxJpdGVuLF8csGwLN0WK
	rYvUfLrCm9UnOxvk37DPhV/DI25dmEAg=
X-Gm-Gg: AYBFou1YNCkFwrDRpMguZCuqbnCOQyJc6PDH6877YQ0oXQiqFF/Xt4xhAilLHq24L1M
	tSatTRKo3h1qpsrhlAzpVCA0oWTVWeHHyWELaa7V53duXHeAR82QDPFyFRAopPfFaqqAVyn/jRD
	XL4ADm9cB/6d3H4qsOUEaRw3PwadmpKsPauGtnr7Kof81yOrNFl9uiOQW55FlPU6fr5ugB3uH00
	1NRuqap5JoULD/ke+ZegjMSvT759W0fVi1RqebVb1At4IGvSrhRz/+FLowlIFrG/lTBdJ+TNuLO
	R6HY18KNRSTQMTgylUZ/tOClA//NFNqbxmzOkBL34qT2lu1K7rZeQ43d3E5DxFo5iiUYvdYG+Xz
	WmBj8gSyyIxDGr4qOfmi/Rfndh6LMIsoZsDYVz8vi6waHCGEYAsXqzDPvJ4lX4hTmdhkjsnMVt4
	uMbQIODc1GhypEtGPkpfT3gB21ryVwj9w0jvJAl9+x3VwF2nIdDmqSe5ZeOz9po43m8vvlXz8z0
	l1345BaIAmDHX1uc/nZ9LPIa0PKpHz2+msyS6uuZGn4ftUI9jO7htGgPQ==
X-Received: by 2002:a05:7300:ae18:b0:36a:13fd:b5c with SMTP id
 5a478bee46e88-36a4235ceddmr35158095eec.2.1793828602922; Wed, 04 Nov 2026
 13:43:22 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ed89f1ce-cdca-d6f6-3e1-f0fa34eac4d@namei.org> <4ea0f231-eec4-4f41-bd2c-e5484c0535de@paulmck-laptop>
 <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org>
In-Reply-To: <b765a5d3-9844-fed8-4277-2a998980b33f@namei.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Nov 2026 22:43:09 +0100
X-Gm-Features: AclHuK8gOlHOslpVAosDZWNzH-O8Uhmybac6kwLa9O77gIDa-8MbeUZmJg2EQs0
Message-ID: <CANiq72kCLu8EUSitn0Z_Q=ff+gDcmw3o=aaMCLYSm-ze8Y2zvQ@mail.gmail.com>
Subject: Re: Kernel formal methods mailing list?
To: James Morris <jmorris@namei.org>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Julia Lawall <julia.lawall@inria.fr>, Greg KH <greg@kroah.com>, gmonaco@redhat.com, 
	ojeda@kernel.org, aliceryhl@google.com, gary@garyguo.net, 
	namcao@linutronix.de, sashal@kernel.org, 
	natalie.klaus@runtimeverification.com, willy@infradead.org, 
	linux-kernel@vger.kernel.org, Paul Moore <paul@paul-moore.com>, tytso@mit.edu, 
	keisuke.nishimura@inria.fr, jean-pierre.lozi@inria.fr, ejratl@gmail.com, 
	corinn_tiffany@alumni.brown.edu, kate.stewart@att.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 9:56=E2=80=AFPM James Morris <jmorris@namei.org> wro=
te:
>
> That's a possibility. Would the mm folk there would want to keep it domai=
n-focused?

I think linux-formal would be clearer, even if LKMM uses formal methods.

Especially if one subscribes to both and uses filters/tagging in their
email client and/or wants to pay more attention to one more than the
other.

Cheers,
Miguel
