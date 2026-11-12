Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794496797;
	b=xPRuNdJlG+yboKVAC3Nnwoar4kdbHGW6kkdUkm9OKVUX+yBLCqI3vLnrJTQrqdYkL+cj
	 ZYm4dBqCGloSMGdlEmT0IOnZP2GkxKiX8iq0yncEcVT5S/qyo033zGWUqmsRiePfQ3AyO
	 B+mw7ne1WdnRx54/wqXhxxlrmT+7QCAE32/+irXm6A+Tzzd81qd90rMs9QVHlUJaKqp8/
	 ZX2QjGTF4SldowpYsPD51sTpq5hajdL1kw9RNYhbAv97sjaP065H90H5CFKP7xVKXbocR
	 T2ZsLx0d/vWSWnTvZsGAozHB4vYCaYKE4OGouANq4vzVNOs2PtbZe51q464YSdH9S+A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496797;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
	b=bzCTn3KXje3Rh1/y7Uh6G/C3Xxe9LVCO6YDcDfIkcEkA1C7053QpgecGWQDI5XGdxmj2
	 o+cfAXAFcIO0vY4qwJNTwuLck4rK0oo7hGzzuyNgYB8WLt/L2UQX3ltWEJVwyrwJGtZ6y
	 tpsgbHug7yhPR51dmGNmaL8cXUmZmjoZLPKiElHpSPTJ57e1M+EWiWI2k0/RKBR+1bz1g
	 ezZazGV3rBYZ4u9yYs8khZt3zBiaEghKIndFBO+jitg6gC86KNVuCbB/ocuG+FA2mSfDu
	 JeeJqEoJMTmnB/yhpGLYMyEKy28t2zDnj0/FzEadH+BJjuhGOlQBifh+D6bSXQtLlnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7dcQg+J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7090760A382F
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7090760A382F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H7dcQg+J
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so43546105e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794496796; cv=none;
        d=google.com; s=arc-20260327;
        b=l+5vkoUwD0qzyzJvkZc3uLDiyUH3DFipaIpHWHTVg+aZgXX7Izi6fjeZtW5n7Iu3va
         X2U6UqsjLonwoP1ciQaXd15zpq+Lk5vHx+ctZWXYENvsD+hd77u7mIkfdon/BGI3/5U2
         1s8Gl1YJuqA7XOlm9udBON99dcev1k6JbI0URoOZkdfnsKmZKW9YLH+aGD+gGijdV1Di
         Z+lHvOLIZSA8GGWBmrwBnltyXywqTVmvv7tdKHZ+pWMtTOY/D/QoGLf4HreJCsSHPOxt
         gg4eG4WRRdgoFklbTAe3zsFz/1v6t+e/ggakhV/gBgetu6mYPROf5UB7WI2wO+Y9MzTS
         VSSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        fh=zUIbvs6jQSM7VzV2dBHygPnfLeGBTD/9mie7hGegD3k=;
        b=MEhLJN26bI1iVbxsLh+P3I8Llr98tTqo5ykrawzkXFcaxEWSqbrUF+tYnTzhwpo3E5
         8MqkYVX4ZRhuX8X66StOl1mIjWqnsRMbtXhPAPVwekKTqbojk7BJ4SV2jp9UsFqaJ1dh
         nl5IzX+fSf0OyGN4ofGhBW15TlSorefB0y3pnMOuxdUb4thXyJ/+yFJpB/cdZthzYKUq
         t7ROaTWvLYGNjBWTgxrnW8M70BNqke9WsGT8yDH+MAB5W4doDiUqSAKHWmjWVSiZC6Bf
         H3J99w7oLabIpID03KcZm4r0Bmpmh2CoAMwNzsSmdjsFBx2E4/U8jgCNR1Vg/XwQSTmk
         73jQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794496796; x=1795101596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        b=H7dcQg+JeXmIUtaBoHOBZEkaRVl7MEvQtQTBpyHbMB2ZB3FXidPoh0FB/5NyyB1soA
         7ZSCH98M5G6uv4ZAw1wS+1I4Dlsu0+fyL3KpPyW2aGFlpxT3AONO3MrJRpN9BcHNBp9F
         7a2CZebhKKJ53YLYTHD6GgN/Lav0R9quZPccjsWUOtDbgO0CGyNDDEHIjhm6Z1ZF9vRj
         rO2SWeDet42ODC9K78dzBKa6reZAebmBvxhzHdKr1wOggPAgohTNm10Gn09V+imLQ5RK
         RvwR+31dnwnoQWkHnqnFvpnPIiKEVimrCk3ybSxZvj16i4HCvob+y3LYB3DGJiCWw+UE
         JJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496796; x=1795101596;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCU5YMgEOGMwVe29N8gNhg5ChZqSGt6pfW7EISgqdek=;
        b=TFdll1eA8nhA0d3itWSBHPPJBZ47LbCJbNrB2BO2NK6OmP9g7Rabll5+qvJb3vDZkx
         hLSV0Q9h5P4zlMnzQaOYQiAxjMhUAKZvO0ye41FlcQfa6/Oqkutyku9IfgcNidBmeevh
         1ehs8V00ZELiuhcUmty9DmSMtDSy3g6j8d5WrQjdV/je9TygPM/zN0x1uvribnXPU+rL
         ZWtvuQtEJ0xD2KyhioN0Rt15YClnAxa4Ht43pUjm29KOESzKrl/jjnUJw+Q+Sx4D7A6G
         1/ZOm2CihZPgEBH67PYYCH2JWTFdPdkeIn6rm5dXQ/meu9H3tiuyOegLH733ABgZAVQw
         GkMg==
X-Forwarded-Encrypted: i=1; AL+hErH0OIWfinoDATLmQco1fkz3Dof29gY1EIxqPdHuGYNjFglLnN/LQAoI3KdfajSUJGzxQfrBAZjH79aPdEc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8mKI5Z9Kp+7wpuSnySpCsMhuck+ukhVYMXwadF6S/h1hpzcnYV
	L65yGSJtFj9ldP3dHxzjCRrv/xeEP7g8CGdGWVJRMnwpwcPjPma779jQn0wJxbcB5iZQD2Y04QH
	qjmjHOtenDVS4+tRKOlhPu013aLhZnBw=
X-Gm-Gg: AYBFou2Q9LfWX5zrzTQV79bNN/DchjmnIstSuBgnmaYztgyOqqrFPKy5fgpd61pqnTy
	3S0NvmEl7vQ3W1aodEYQLw6D8uSz/tz94+rXMHTqsqhQdVCf8GU/oXZpJFERx0hh0G3nsJGZUPs
	ydJIxkq4S81JY515hdouO1YCEnBQ7+q5Jc0KHMZOl7auOnuGo6RpelaHdCdbiJ/Sbr7Ax5/sbst
	sV8AHqKjWTL3ihx1PB5HaJRasyyPWQYUFNXh5SlGyjdZiwT6YYhlT+dq0G9xUWZrBWsfZil0yDl
	4p2CEM7hH3kh9qAcvWvZFDJ6+WpPIeZI3sFZyGh0zudGUHFbp1dZne5EgEbrzAkKM/5sgluNEs3
	uqs36ivNraNovPTYBYPAQ33An5yd7GxjePBdQGA==
X-Received: by 2002:a05:600c:4f84:b0:4a1:e92b:ae4a with SMTP id
 5b1f17b1804b1-4ba093b9a3cmr106590855e9.21.1794496795435; Thu, 12 Nov 2026
 07:19:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-tas2781-v1-nocrc-fix-v1-1-a769c27f21ce@gmail.com>
 <7cd4c010f13ee085e3aa4396705b6b06ed58f7e1.camel@irl.hu> <504167422048bb8197a1ca3fac079cec9dea1ae7.camel@irl.hu>
 <CAN6p6iiFz-JXOt9iFUPa3x4Aqu2c96=ERf0AMZ6pPVWspd=jLw@mail.gmail.com>
In-Reply-To: <CAN6p6iiFz-JXOt9iFUPa3x4Aqu2c96=ERf0AMZ6pPVWspd=jLw@mail.gmail.com>
From: Mohamed Yassine JEBABLI <med.jebabli@gmail.com>
Date: Thu, 12 Nov 2026 16:19:43 +0100
X-Gm-Features: AclHuK-U1bKsRdqloiglORwVbHTYD3ELvn-XYZ_Olj9JVapFRVasjDHISUDa0vE
Message-ID: <CAN6p6ihogRNOPM4siK=QykMk_XDD_Essf04OW8d5Q52vORNA4A@mail.gmail.com>
Subject: Re: [PATCH] ALSA: hda/tas2781: Only accept CRC-less V1 data if all
 entries are valid
To: Gergo Koteles <soyer@irl.hu>
Cc: regressions@lists.linux.dev, 
	Cristian Castellano <cristian.castellano@icloud.com>, stable@vger.kernel.org, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gergo,

Regarding the Q27/Q31/Q58 formats: they are not from any
documentation; I inferred them from the data. Reading the first word
of each entry as Q27 gives a plausible speaker resistance (3.82 ohm on
my Legion Pro 7, 3.64 ohm on Cristian's Yoga Pro 9), and reading the
second word as Q31 gives exactly its reciprocal, within 1e-4, on both
machines. So, for a consistent entry, R0 =C3=97 InvR0 ~=3D 2^27 =C3=97 2^31=
 =3D
2^58.

The V2 dump from the ASUS ROG Xbox Ally X thread (with a valid CRC)
fits the same pattern: r0 =3D 0x3c5f7222 (~7.55 ohm in Q27) and invr0 =3D
0x10f615d5 (~0.1325 in Q31, i.e. 1/7.55).

My guess is Q5.27 and Q1.31, but I have no TI reference to confirm it.

Finally, all testing was done on my own hardware: the original patch
was tested on my Legion Pro 7 16IRX9H, and I reviewed and own the
changes.

Thanks,
Mohamed Yassine JEBABLI


Le jeu. 12 nov. 2026 =C3=A0 16:09, Mohamed Yassine JEBABLI
<med.jebabli@gmail.com> a =C3=A9crit :
>
> Hi Gergo,
>
> Regarding the Q27/Q31/Q58 formats: they are not from any documentation; I=
 inferred them from the data. Reading the first word of each entry as Q27 g=
ives a plausible speaker resistance (3.82 ohm on my Legion Pro 7, 3.64 ohm =
on Cristian's Yoga Pro 9), and reading the second word as Q31 gives exactly=
 its reciprocal, within 1e-4, on both machines. So, for a consistent entry,=
 R0 =C3=97 InvR0 ~=3D 2^27 =C3=97 2^31 =3D 2^58.
>
> The V2 dump from the ASUS ROG Xbox Ally X thread (with a valid CRC) fits =
the same pattern: r0 =3D 0x3c5f7222 (~7.55 ohm in Q27) and invr0 =3D 0x10f6=
15d5 (~0.1325 in Q31, i.e. 1/7.55).
>
> My guess is Q5.27 and Q1.31, but I have no TI reference to confirm it.
>
> Finally, all testing was done on my own hardware: the original patch was =
tested on my Legion Pro 7 16IRX9H, and I reviewed and own the changes.
>
> Thanks,
> Mohamed Yassine JEBABLI
>
>
> Le jeu. 12 nov. 2026, 15:43, Gergo Koteles <soyer@irl.hu> a =C3=A9crit :
>>
>> Hi,
>>
>> On Wed, 2026-11-04 at 16:55 +0100, Gergo Koteles wrote:
>> > Hi Mohamed,
>> >
>> > On Tue, 2026-11-03 at 10:27 +0100, Mohamed Yassine Jebabli via B4 Rela=
y
>> > wrote:
>> > > From: Mohamed Yassine Jebabli <med.jebabli@gmail.com>
>> > >
>> > > Commit 408249089c48 ("ALSA: hda/tas2781: Accept V1 calibration data
>> > > without CRC") only checked the first device entry. On machines where
>> > > the BIOS populates fewer entries than p->ndev, the remaining all-zer=
o
>> > > entries are applied and tas2781_cali_preproc() divides by zero on
>> > > playback open.
>> > >
>> > > Accept CRC-less V1 data only if every expected entry is non-zero and
>> > > self-consistent (R0 * 1/R0 close to 1.0), otherwise reject it as
>> > > before.
>> > >
>> >
>> > ...
>> >
>> > >
>> > > +/*
>> > > + * V1 data without CRC is only trusted if every expected device has=
 a
>> > > + * populated, self-consistent entry: R0 (Q27) * 1/R0 (Q31) must be
>> > > + * close to 1.0 in Q58.
>> > > + */
>> >
>> > Just out of curiosity, where do Q27, Q31, Q58 come from?
>> > I couldn't find anything about these.
>> >
>> >
>>
>> I think it would be good to be able to see which commits were generated
>> by an LLM. This way, people wouldn't have to scour the internet trying
>> to verify hallucinations. Furthermore, it would be possible to see what
>> percentage of the kernel consists of public domain/LLM code.
>>
>> Best regards,
>> Gergo
