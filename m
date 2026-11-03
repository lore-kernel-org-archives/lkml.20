Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793674781;
	b=eLHse/bdyqQKCmI3nx/UEtBI6DGUCw/UCIaN+djdk6OToUn7V4lNHFLb5Pq5UaSXzWmS
	 EYdToIbzglGNThiiEbdDh+fBDwnNRcSvmBJeK6qnMmY5/nw3lG5D2JrqFzpK7YJxRBEH0
	 OvGJJSxLLaco7KV2aLotVGKSlwLDjWuvSe19bEYrcXtC9NpXtDNRBsHgg1bXbUYFx6rDy
	 etwOs+EZo8bJkzDb1GWCY+Te8034Uwf6JLmlhktYskOwNLxU3mk5ukrqZS/Q+7w82F032
	 Hyz5if52ww1IodDBR4jHY4r/cIUuJccAzuGR/AE3KL4NRGOYKv166l+1DaOE9N1M8YQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
	b=WSuET0kCR1m6EoFYCSHrs+ZcbbPTb01Zp2/1JP8yx2pkH5l9IU/8gr/6ecuc/7vI6it8
	 5SiMV6To75jeeDQUXdx+uNPLEpun/pDYh5dZcSLSCeFodx9MrX3ou6JI9pO2ORmMeSl3W
	 F0d4V/QHPOz5Fv8DWXxAUSflmh5jmd8esbKTj2s9Wtodl+iEuYLjmnKPeimz0xTUJzDLX
	 jL0rILbQa5yPJHm+tM0WtoBTWdn+n1jFZ6G/9Vlp3qRVFX/NpipUoyzfqqRRseWb8qhmu
	 C+ER/QeL5Lda9MVj5WC0qapUkrvfwIh1X8+vtnDgGhUfN5eaIQJV3+Sn2wSu+FsUxaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxfVsNTi;
	arc=fail smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6C8606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC6C8606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hxfVsNTi
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ccfb88e4dso7242426d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793674780; cv=none;
        d=google.com; s=arc-20260327;
        b=dD4ROkBhmqXSzkq0L6grYQ6oC1CWfWP8Dt/yS0XmYw/uYc9PX7SI1rJLd6+0vUQJbi
         UsNtMryv7yfwTpwJX3XYBcvPJPbfClE7wtZsRHONHwjJ7/xtU6bADWTBCqiZ+ntmIKW3
         3xgr1akcofsfVDRpntO3dAA1KbEXz6Cnm10rg0xzjnnllUh+3HJzgwOqaA9NXojwHZOl
         XAqoSYgOUGsAOIfJfcgz7btut/dSYK+XEvd/faSTPHQtDkQ6dbI2LTEjCg3LKoMTl91U
         bWHBZdRni9GpTHWiNF+h8hrcmTXipd7yPNVrG0e/wEjvxACA1bcDQPwpRsMSdchLTYqX
         ZgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
        fh=AADUGVLbtB4qddpjVBTl5ZxDi3lFZ4J6cg7BXGHmg4g=;
        b=kNON+rbN9JKVkXR6496lqUIY9DxliHReZuxNA+4KbPXS11GZ3H+zQ/KAtYHnpaSuld
         r87JEtIgP9lOTQUvMbQWYVYptXM5GbVnb4Ha8FhYNrRuQ06ZF2ffZBLZR0i5yDuX2ysD
         5PTAHpJT2vBmvvSeU8lsbMJ2NOhmvX089sR9xUsbONRIMnEvoBa78/6iBxIee6ScJwYy
         moYSY2KoqtCXbGYAcGWyeaM4oZl21XAUe3VgK/+aqVoiB79KXIxrk22xmpueBiH1nG4Q
         BifRsreLVCp7dXn5k+CS1dPa1l5MI3kjZeAKMuYDbyerW/IpvTQ2tGSKkidG3aJSYBSt
         0HyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793674780; x=1794279580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
        b=hxfVsNTidTjsBGtP6601CST1oHitZN2nus7W9dblSW/c82gBLKVzny1zTKlxjdlj9/
         m8N2iJc2oJI4l1LFRNbTR2KScqiO5Lzr7fHU1uye+r7vVy2rDY7MDFMuEALSXmvt2X4V
         NXi15GhQeCfqvQr51CSoXuegUit+9hns7fE1lNw+2ywywWNCtqHBtwvKIN2wc0YJJZHG
         9J5N+o15i5nLIJpgXcqTzgSVfeRPWaOBYEU2lS3U1zjlnRiEfThGOvo/OTDOW9IpLyET
         q/xzhOUlDcyjSboZiEcnBTdIGduxNWOllpYVqJ+wA90DPFwm1MePufmhpYjhGt3FuRGn
         eCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793674780; x=1794279580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1uUuSvMRnkFxlmy9rAla3J0cmXxmvqRTXVShxUzTKz8=;
        b=vaZNXHr/1GiXktz2jkMaFQ9QpdlGVmY6uE6mzZCICbCllZE7sPj+rwmbtsW7B+RUn+
         wV60SVGMxtTI1dZoRwfe6640Yxui/5OOnboz94F6ZSG0c7GDEUs6vvdiZ745hJIJb5kL
         EkEZhRcuMwfJx3eSFSdSqY2RVdTae+vTSuxZeSQmc8P5NdDy1eWsz8i//+WDe/yY0enb
         u/nXW0b2Cd8ZcrllSnIxtcahTgvImEOlkXb0DNu/QXgn4t/I5v+NcjDyCzA87XejTbRp
         mkhdFhpvouR4NS1Z5fi7xBMQ9ZaN38MirntJ7MPHHvq1p0D5Uv2xj2QXpvvb5raw1ayS
         qFtg==
X-Forwarded-Encrypted: i=1; AKwUvBxSMmL5/tkZW2Jd8bvIp3NRTuiMFXCHfKnsOEg+wSUCgj8ECuZSuKX50ggUYAIgFH4pwrGh7ngrlFvzibA=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1Uzhd+vAPFwFrmABk/dIKu88Qrhgm8Lej09YgFnsFx0HmZFPp
	pVQK8ennVJ/p9H87+g4vt54i4fzPsICIdg8T638VJot4Kq1ON0YL3ideu2dcr+RZ826sxUwGaJh
	q6/EiCe6l6mjZAfskIX90IAXfj9d1BlU=
X-Gm-Gg: AYBFou1yzdRhADrqiGm/GGJ5+cUn0mgxS0JZ8NDHAsI7pi6QULUuiwNd9n2BT3uE9Wp
	OvNTN5XdspPzFB8d8jXI7L5hD1N578oQZp02npxAHGF7pg0PcwNSYigJ2kPefuBkHr6X3FIZJNb
	1llIGuLPDrLNWM4TdKqEqK1z1P/5MWqNAEt3QurGCmuP0Jw7rGqQiaReg6HCKMkp5ZAK4vLyzX9
	A8aiUmTbaeowL8gw5gMpDHXNQgSt/SRktB4KWm1ngFYTSFu75VQqcPYUahKy1WogpTMFyi91w79
	K3oHVh30jE2DsfgXEJnC/rccNGdJkdClzAKiMOiDosJA8vhP8oX6RY1mLgejoGUq8mMZYlwak1x
	Pw/wYc4DPPMtLU/yEt6BPcirxtRuUkKXfJooFQ+aN07MsBR6TWS/pEh3DFCglC6Pir0KXElmt9F
	jZ07mvTFOayfo2dbcmDjFW+rRILVh5L7tS83QK15NKkcn6XjEC3uXEO1nwEcHaH9+lxuVWBzGqL
	d3DaLEkVb1UHm2uh0wCxKBxmw==
X-Received: by 2002:a05:620a:6845:b0:93e:c12c:9b6f with SMTP id
 af79cd13be357-944217f95e1mr1933054885a.74.1793674779845; Mon, 02 Nov 2026
 18:59:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031143216.70219-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261031143216.70219-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 2 Nov 2026 23:59:28 -0300
X-Gm-Features: AclHuK8h87ta7bqm7ozuVZ0AIAHgpaG1kuMoeC0yrlnTQ5hMVApU96qRCBz3KkI
Message-ID: <CAMAsx6cYSKDhNeOcvQVfiPestU+F44u2yXd3JDhTnLCX3fp-ZA@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: add init troubleshooting guide
To: ic.gabrielribeiro@gmail.com
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 11:32 AM, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> wrote:
>
Hi Gabriel,

The commit message has no body. Could you add one?

> +2) **O bin=C3=A1rio init n=C3=A3o existe no sistema de arquivos raiz**: =
Certifique-se de
> + que o tipo do sistema de arquivos raiz est=C3=A1 correto (e de que o pa=
r=C3=A2metro
> + do kernel ``root=3D`` aponta para a parti=C3=A7=C3=A3o correta) e de qu=
e os drivers
> + necess=C3=A1rios =E2=80=94 como os de hardware de armazenamento (por ex=
emplo, SCSI ou
> + USB!) e os de sistema de arquivos (ext3, jffs2 etc.) =E2=80=94 s=C3=A3o=
 compilados no

The original has no dashes here, only commas and parentheses.

> +carregar o bin=C3=A1rio init =C3=A9 uma etapa de transi=C3=A7=C3=A3o CR=
=C3=8DTICA e dif=C3=ADcil, que deve ser
> +t=C3=A3o tranquila quanto poss=C3=ADvel); em seguida, envie um patch =C3=
=A0 LKML.

"painless" became "tranquila", which reads a bit loose. Maybe "o mais
simples poss=C3=ADvel"?

Thanks,
Daniel
