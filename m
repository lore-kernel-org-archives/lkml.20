Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847002;
	b=5gWQbDO3ZHvP/8zGx0nQ2hpIqiwcXgvBHAccAQElfxU+zt64ZND9THdkQ9oEEvqYGq5a
	 a2S0HN3YciRtFVWrg61NGXqF5GMPNSSmbzLGLvSXtrWhO19X/nTjv+o28/1pPWi7V/ghb
	 gE+IcuyeYMYf4BEK9O4X4Mqxz+4STVwSX1LZTbFCV1pHLUQFIfyT0PC2ikCevjF3Rq0/w
	 w531JEqXu7JD+XfQRHXxud6cdrkoRnrEsCItKznxkUlMMNWh46F3h+xhnjMQ09F+jjlvl
	 OsEXuK0IcaYhaX8jHhzO+cXgJft/h+AG8og6W4fMQSwrYk/f6Lit7f3NSwa6sTfBcOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
	b=FGbk2aKz+ZaGTgz0lYMReCgqbB7+aBO7e1eiVQXuqBly1rVJjnWDW8rhiyNozBYzRqpQ
	 t5FW10rq809wnS9pcskvhK80Qy7e0XeqPcAcnFLHYqRj6VpznejeMJ2LsCiIyEgH12S4o
	 QvfWR8OjL5OgSDCak7StqDh71XkxoXt+3CDv/D6kg5CkL/zwc/qmJ6xpgxK/j0JegMxZ0
	 uYqB3SmCNSDvQ/2w0Spndz3+62EkCm6K8QUWvyZkZd8wqs3P8bHDdubQvwgdrZIAGLJyB
	 ueSrl/w13vKS9pz1ORvxfuUeWnk62p3OlMcYpobC2YvSApnbEVlos2o04AW+BGP3dOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn8ar1Yi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B8B606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:36:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2B8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jn8ar1Yi
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso585068266b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:36:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847000; cv=none;
        d=google.com; s=arc-20260327;
        b=O+V6iEpx90v8TeSzwTzzTplJG2eJiE5+3kX9VyiXzr7zNtdK5j8SGSbOBTwu96Bo5C
         +KmWvZTzSCqt4jDWitA9AoMjRI2ctj8BiwOzVCvJdGZEOsa9gi/nTkBIrWSkeOudaAqp
         WydUy7iXN6n76drPZNuNMER3MnWjoFagDBxksw19Ulggd0cnY23fJ3zLEcDQjIXz5Bk5
         bIkiia5dASRw+6uDne2SH7u8Ugg5nKip0l+Lqfv07Ek7ns51NTCTCFEJRcEZfWRTWrNQ
         ab41G1U3Gdjm+Q3Rs627+e8PmaOs8zrZowmTrypakx5cETLl/zyTUVdS3cpEBdJ3rIpH
         yPeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
        fh=4LfkmdTPqK+mOYyP12q0BpptzjrQZ6liRSexwNhzUEY=;
        b=fwqdnLyO8Pa+TeeVqma9Eaj/9gAGw+37WbL0EIphP7wFHY58Uke5EZktOcTL6LPdD2
         FxvWd3P3zzZwzGyBD48ie11ha+BRNs1s6SbqRjP/4/qQAqPCQXsSJ2hHEP88cqstu3zj
         MJi5lxPfCo1KSh/XXM6tj44T7PwyyrxRnwjNo7lh4Vmd/Ta2qkT+H8uhRGy1Dx9iH85E
         2m6/pP3xfHg5AZM7OZv4zfnoCnrX5LQD07PAe1i+DYL5pT70vycq78ZwZ0qsz8A1aulv
         iTdqNzTJwW+pLVjwtlyla9b1kayfmEgLWLXuyjMvOYdKtBJBicH5wTTtQOLUrK+qdW/+
         ntaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847000; x=1795451800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
        b=Jn8ar1YivSQcH87J+OnEM75qtqq0sLVQnwHekt3WVBx/jd1dPNAPe/LHK0kwmmrF4x
         DPiB/59oC7Ew4qxMdr9hYYh+6NpwThWWc8VjMnG4WCTaWKcDd8DdUryIy3Qv+/OjsvFd
         eAhqm+hMkrnenGI3mbucI/i5AVVPeMYxhp/vSvoZJFAIIlsju80tzzwMpxo2rx8dTC7t
         S7nYU+ZqAgL9cjqI42QrRjZbE14UOEv86XTDWLKXbpUJEcpPMV1AYnm+boLpkZebpCmh
         uCoHXfU5pMPu3RCkVaLFIrzM2lohPTf27w1n2sPofvTx7VZ23HRMD/SFy9rPniHTctxJ
         QKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847000; x=1795451800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFDPbu01PjjV/nM7xHQeqVmy8LYarSe5Gqy53VK5FjY=;
        b=fqME6uU2jfD6WRe8mzCawpSmFBYu2ePfE2JtGSmILmDzix1gyx0BZq3GxCaCv5XV0T
         Qv9Gz+kXd1IMJpzh1FZWVv0V0lCP6krsq8a/bUtFjeN1J6CqWXiXbSUeEymz2ZOypxjL
         F8ebtj28UCKbDjlGkwPs0yTl1Vv4hYBbeuCR8/97UC9D9JKI6zqrtaj8UVOeqxf1/onV
         JGqU9rrQrqKpyIutCTmJ5+elecTgIugML8QmZ7w/HJbxajPiq1m8fKVDQJhPsSRpJTKq
         Y7LY0xoF7s3JRNueP4M96CNsvwXdiLYnMLr+/bCe8SD4XtgBdh8zRzFSJ9FUMw0q/DX+
         aW4g==
X-Forwarded-Encrypted: i=1; AL+hErH44jxl14bjL2y8IdFjWxp3ZFoJAT/bUDQRvmDNXZM/n6MqBLcyykYVAiW+XcoADEZt64OlNXVY9XTbz9I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UiXgaS6iwxjWTRg0wYnnxqoA/Hbzv2s+ib75augbW2xyD+Pmd
	aD+1O4jFN5hL/uXM4YBJR6gYrOlgPCL5Ab7/D28A1d2ta7tKnyDz20YbwI7GLDS9oUisKm3usC7
	KdyxZ/4jQMn3cnyNci7FlyruJ1umIFlI=
X-Gm-Gg: AYBFou2UWZqvfeRcLxxSaZtwY+8/APPrWLF4Zw3+FMHjGz2lApPX7vTfHWM7UmH9Fl9
	8Dud3crWz0pU26YA/telcA+9XXBLFWzh0IgUg/QSA2CUha7eQRded8kXNbevgCUJYbNdtChaBcS
	qzC6IWxM5gaigeXBay28lUROB7ll5SeFSXSUnbcpBwsaNKWK7wEjTKY43sWkEHUXrwZ72UHSQaJ
	NK8qCFIbxf0DgBnEwxehMB/UruRolqMgVJBtNDPq5bZMwEjwkH3zBqm28CuDBVtSeCOHgKPN/SD
	ZfqaKnjovAQejtkKZXPgZ2E966VQoO9M2531B9yH0NQtjZiHSF8E0w+ceKa07JE4wajBcp3KeBA
	VytOSNj1xaMRlNU82jvmNSzGsTNj94OMNKOdYsA==
X-Received: by 2002:a17:907:8e08:b0:c24:6985:d7a1 with SMTP id
 a640c23a62f3a-c50961104demr817704066b.7.1794846999932; Mon, 16 Nov 2026
 08:36:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-topic-8750_llcc-v1-1-6536cb46d7fe@oss.qualcomm.com>
 <DMTYT7CTC6JP.2UXJ6MWGKPX49@fairphone.com> <CAB63uaF3kB5AAW_FNXu93pyF4YS4XP3zzLtLt12r=XMK8E5kDA@mail.gmail.com>
In-Reply-To: <CAB63uaF3kB5AAW_FNXu93pyF4YS4XP3zzLtLt12r=XMK8E5kDA@mail.gmail.com>
From: yzddMr6 <yzddmr6@gmail.com>
Date: Tue, 17 Nov 2026 00:36:28 +0800
X-Gm-Features: AclHuK8R7d_cGEXXPrjH8PM8Odn5LsGhXmg_ElS1vdImCrIJeC5fTDG7nWnQUn8
Message-ID: <CAB63uaEVR494r2vj54vpvV379U6nHTxEM49xhu_uEygU4g0_1Q@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: llcc-qcom Fix SM8750 settings
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Melody Olvera <melody.olvera@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resending as plain text; the lists rejected the first copy as HTML.)

On Fri, Nov 13, 2026 at 10:01:27AM +0100, Konrad Dybcio wrote:
> Bring the settings in line with the with the recommendations (and also
> with the downstream kernel).

Thanks for doing this. With it applied, sm8750_data matches sun_data
in the downstream kernel [1] in every field of the upstream struct, for
all 32 slices; before, 8 of them differed.

Of these changes, only the ISLAND1 one has a known symptom, the reset
in system suspend described in my patch [2], which is why that one has
Cc: stable. Would you consider taking it as a separate patch, such as
mine, with this one on top? Then the fix can go to stable without the
changes to the camera, video decoder and CVP slices. If you prefer a
single patch, could you mention the reset in the commit message and
add Cc: stable@vger.kernel.org?

Nit: "with the" is doubled in the first line.

[1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm8750/blob/6028f4=
7faddaa27700f8dd3a1d83906ea8f27170/drivers/soc/qcom/llcc-qcom.c#L479
[2] https://lore.kernel.org/r/20261111-sm8750-llcc-island1-v1-1-64055702ca3=
f@gmail.com

Thanks,
yzddMr6


6 Mr <yzddmr6@gmail.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8817=E6=97=A5=E5=91=
=A8=E4=BA=8C 00:30=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, Nov 13, 2026 at 10:01:27AM +0100, Konrad Dybcio wrote:
> > Bring the settings in line with the with the recommendations (and also
> > with the downstream kernel).
>
> Thanks for doing this. With it applied, sm8750_data matches sun_data
> in the downstream kernel [1] in every field of the upstream struct, for
> all 32 slices; before, 8 of them differed.
>
> Of these changes, only the ISLAND1 one has a known symptom, the reset
> in system suspend described in my patch [2], which is why that one has
> Cc: stable. Would you consider taking it as a separate patch, such as
> mine, with this one on top? Then the fix can go to stable without the
> changes to the camera, video decoder and CVP slices. If you prefer a
> single patch, could you mention the reset in the commit message and
> add Cc: stable@vger.kernel.org?
>
> Nit: "with the" is doubled in the first line.
>
> [1] https://github.com/OnePlusOSS/android_kernel_oneplus_sm8750/blob/6028=
f47faddaa27700f8dd3a1d83906ea8f27170/drivers/soc/qcom/llcc-qcom.c#L479
> [2] https://lore.kernel.org/r/20261111-sm8750-llcc-island1-v1-1-64055702c=
a3f@gmail.com
>
> Thanks,
> yzddMr6
>
> Luca Weiss <luca.weiss@fairphone.com> =E4=BA=8E2026=E5=B9=B411=E6=9C=8813=
=E6=97=A5=E5=91=A8=E4=BA=94 17:11=E5=86=99=E9=81=93=EF=BC=9A
>>
>> Hi Konrad,
>>
>> Missing ":" after llcc-qcom in the subject?
>>
>> Regards
>> Luca
>>
>> On Fri Nov 13, 2026 at 10:01 AM CET, Konrad Dybcio wrote:
>> > Bring the settings in line with the with the recommendations (and also
>> > with the downstream kernel).
>> >
>> > Reported-by: yzddMr6 <yzddmr6@gmail.com>
>> > Closes: https://lore.kernel.org/linux-arm-msm/20261111-sm8750-llcc-isl=
and1-v1-1-64055702ca3f@gmail.com/
>> > Fixes: 2c04e58e30ce ("soc: qcom: llcc-qcom: Add support for SM8750")
>> > Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> > ---
>> >  drivers/soc/qcom/llcc-qcom.c | 19 ++++++++++---------
>> >  1 file changed, 10 insertions(+), 9 deletions(-)
>> >
>> > diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom=
.c
>> > index d7a42a8040a16388a79c24e4d1f1e88de9c87ec0..df213548637351fdaeeb81=
b860f0ee2631f2062a 100644
>> > --- a/drivers/soc/qcom/llcc-qcom.c
>> > +++ b/drivers/soc/qcom/llcc-qcom.c
>> > @@ -3869,7 +3869,8 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .priority =3D 5,
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> > -             .vict_prio =3D true,
>> > +             .ovcap_en =3D true,
>> > +             .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_MODPE,
>> >               .slice_id =3D 29,
>> > @@ -3923,7 +3924,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .max_cap =3D 7936,
>> >               .priority =3D 7,
>> >               .fixed_size =3D true,
>> > -             .bonus_ways =3D 0x7fffffff,
>> > +             .res_ways =3D 0x7fffffff,
>> >       }, {
>> >               .usecase_id =3D LLCC_DISP_WB,
>> >               .slice_id =3D 23,
>> > @@ -3946,7 +3947,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .cache_mode =3D 2,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMOFE,
>> > @@ -3956,7 +3957,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMRTIP,
>> > @@ -3966,7 +3967,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMSRTIP,
>> > @@ -3976,17 +3977,17 @@ static const struct llcc_slice_config sm8750_d=
ata[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMRTRF,
>> >               .slice_id =3D 7,
>> >               .max_cap =3D 3584,
>> > -             .priority =3D 1,
>> > +             .priority =3D 3,
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CAMSRTRF,
>> > @@ -3996,7 +3997,7 @@ static const struct llcc_slice_config sm8750_dat=
a[] =3D {
>> >               .fixed_size =3D true,
>> >               .bonus_ways =3D 0xffffffff,
>> >               .stale_en =3D true,
>> > -             .ovcap_prio =3D true,
>> > +             .ovcap_en =3D true,
>> >               .parent_slice_id =3D 33,
>> >       }, {
>> >               .usecase_id =3D LLCC_CPUSSMPAM,
>> >
>> > ---
>> > base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
>> > change-id: 20261113-topic-8750_llcc-bd228d96b455
>> >
>> > Best regards,
>>
>>
