Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B6E32C027C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339060; cv=none; b=A0eeShrYs1Ur8J/imV2RQZucb8/f6S58HfLeup+mUpCx4jvW0JrROwZbtC+ewPP3maOUdCwEFjJPG2WYX2phpE+paiGuU8/zemnL72xkitbXfOYBz7i2KZ+O6UqJ6udY6691zlLrANFj/6eVna1Jc45thh7znWaI/RzkMyuar8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339060; c=relaxed/simple;
	bh=FgGxMKVkPPoO74lUXunhrepWkxwIT4CyU22xr2ZpS0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aeth23BQGONiTa1OAIvCBByqHln1HDFuE68IMdEJ0bKsLUo4KgeaydcPt4Ug0lmj8QAWapoJzhFnkUvYcZDbXWAk8mZdb3edrQCeafeDLZ4rydol3cKUVkTGLSHTYBvdwqn/XTV4F0jiOMFcu3o69xPdxSuZK7O7bMOW/+zqiZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.win
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2af3a4f193so39974466b.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339057; x=1790943857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FgGxMKVkPPoO74lUXunhrepWkxwIT4CyU22xr2ZpS0I=;
        b=gMbAezzSqDrghrW3t3W10SgcdtBVfXcztBa+njLXt/PSnEkIMoGlRIwXL6MDSZQWbf
         PS5B7jRAb/XQ7NrxQCUOjweOQSgdboMpKM7UmMHc4858iXZk823d+GrcBFvEKpwAwl/T
         mZlpCcVBHEmkyVVCTFz/i03OAWXX0y4H4F8PmVO40CQg9vzW24iFNo/SznmQiG3F8vXz
         SWfQs9jlZ6GsD9Z8IQyYREn4Riw/ut7H9wrkjpGhG6ItGjpI3M8+cAGdJoGgUN+npW2X
         9kO8fmJmlTtHIH7BgEv8S5nVd0ywyPTWX4ic+dIGJeHrYvzyARdYANPH5FpxOMLxZlIF
         T1sA==
X-Forwarded-Encrypted: i=1; AKwUvBzZrQsdgXq+BQ8WPADyURRS/wBoenYT0LzHWZuu3A9gWx5SUyHr2p3afWpH4hItbUKT/KcMNcJv8BfnzXc=@vger.kernel.org
X-Gm-Message-State: AFuF++lOLM7LgHCKPrikoJMc8Xy9cVn7Euj/pyd0g9P2FkPKSbMamJwy
	OV/+x4fAwTwM6Z/f07UOcoNLXpEBUsiadgFkQUnynO5nEUFUAeMfAyfUVELts78Clt6xW3an
X-Gm-Gg: AYBFou3Ev0r6/u3Mo01NOp2J6OksTZmh1f/tZexU4I3RJRRLFJ/16+qU/x5g7t/ogwz
	7UabAHWbP5r5yOlkARxwBLzoZpXai35ykc6uf4Jrv9Hd8+CggQiXe3JJhSHQYpPSPl2A1qE6ZPx
	7Wc4KX0Ms168DTzdFsoHJOnqFxs0Gyf/JlwTq4E6hhBQAONFrKsxd16I0EsWdwqk7ba6hGkHj52
	+RacLOBDBdi8U2MKcOeVNM66bQZnXZXkG1NtqVgfKKKccbcdTych2+VMRZDL6WgGesv0zfG9Lf0
	gOm8+JpPXa5TwuWgrOwhyw27T3TUb2NkSfOkN2MwZPxmGQ7k2zyXFI9QXFzaILzp4RQKX41drxk
	46dSO/T3ISrdu2x6AXZH/47tkA3MtiE52II/epWJN2s3NXa2PQsY/gMxYB+dfRKrteuoiSAzE1c
	6rXVgPC95tJALQpfc5x38tiDfRruDSZYM2F1IcGInGFaJZmKW8iHq54/D3mMImINYYN+4K393xc
	htzeT6kXC5my2oiRZIzP5ghWejahhSj5tSjgk+d2w==
X-Received: by 2002:a17:906:9f90:b0:c27:420b:7c90 with SMTP id a640c23a62f3a-c2ac26723ebmr506762966b.48.1790339057174;
        Fri, 25 Sep 2026 05:24:17 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae7806c47sm104170166b.55.2026.09.25.05.24.16
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:24:16 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbeso100369666b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:24:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzec9XexzyaY69TLKc0R7Z1aBGs/U9cg8CMe0hoFq7BbE25kIxKaTBoYdL4MMP2whe2CYKSlevcsMcPLxk=@vger.kernel.org
X-Received: by 2002:a17:906:99d0:b0:c26:19de:9ae8 with SMTP id
 a640c23a62f3a-c2ac25f3312mr500414166b.39.1790339055822; Fri, 25 Sep 2026
 05:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH9NdkhqTDyNbK0uNyB9tnYwTbahMGVQgSXJ9PEnVQtDU14kXw@mail.gmail.com>
In-Reply-To: <CAH9NdkhqTDyNbK0uNyB9tnYwTbahMGVQgSXJ9PEnVQtDU14kXw@mail.gmail.com>
From: Ignat Korchagin <ignat@linux.win>
Date: Fri, 25 Sep 2026 13:24:04 +0100
X-Gmail-Original-Message-ID: <CAOs+rJU7+8nWCDUuu=BOxpDBYiD=t1hT3ZrWFhoyTV5ZG4ijGg@mail.gmail.com>
X-Gm-Features: AclHuK8V4OoXn-o3NVqGD-TKDM9CI2mAJ_fDiPvSiziHHOrJRYnycd_sE9RDaBo
Message-ID: <CAOs+rJU7+8nWCDUuu=BOxpDBYiD=t1hT3ZrWFhoyTV5ZG4ijGg@mail.gmail.com>
Subject: Re: crypto: ecc - constant-time modular inversion?
To: Erwin Pawliczek <pawliczekerwin@gmail.com>
Cc: lukas@wunner.de, herbert@gondor.apana.org.au, davem@davemloft.net, 
	stefanb@linux.ibm.com, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 11:51=E2=80=AFPM Erwin Pawliczek
<pawliczekerwin@gmail.com> wrote:
>
> Hello,
>
> vli_mod_inv() in crypto/ecc.c is currently responsible for modular invers=
ion, it is currently a binary greatest common denominator loop where the it=
eration count depends on input. I'd like to replace it with a constant time=
 algorithm, this one: https://eprint.iacr.org/2019/266

Is it used outside of ECDSA signature verification (with secret
input)? If no, the replacement needs to be faster to justify the
change

> It runs a fixed number of divsteps for a given operand size, independent =
of input.
>
> I already started working on a replacement, please let me know if this is=
 something you'd be interested in.
>
> Thanks,
>
> Erwin

Ignat
