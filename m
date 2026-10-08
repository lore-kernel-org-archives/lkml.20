Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E00471279
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791449212; cv=pass; b=cTZy+Oa0c9D24mEH04f+qQ9WOwgtEF9eoc0uVXDxdihyRdMLysWOtSveZVjSDchYChEv2bxnxDf11I6jLYYutUAiRvVakriOsCktdham6pY0XU4CWlrbSWVLyeuca5Dht59Cw9tIMncVpg3R0CvlyTbsc3bP81OdkNfP0roY85I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791449212; c=relaxed/simple;
	bh=wnGY+XHH6HDJ4wz0G2ps9VHtwY0746+c1EU1QVcGcMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qx/GIlydGT0/s2l/Iuq0LV4digk+7HnE8KWsVfF4Au4NjCqHba/4vKEymC4NfeUOOUgQsS7nIl0dHV+Y89xxymnPjQxhhBOqThNEuo0G/eHcAlrniM4PqCAZ8JHhssEZfZGL9EuPVI6OR7CfjyTtb63QVoBH64giYOTdy7f8Wqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YN5vNcFH; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YN5vNcFH"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-81ae6aefdceso4436005a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:46:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791449209; cv=none;
        d=google.com; s=arc-20260327;
        b=BwHFqcoXdhW9cEwcvbGCveQpGHV7p7ATAWbaSc5E7rraF4iJpvAnI7aEUZPYUippb8
         iVml/05FAgANbTsNXmZLYcOqdsoVjcFkbvL7RqJogIe15OdO6/UmKmP7nFSsxTlgnDMv
         uNAjjhZtujuzD40/sYLg9aL6hhFaRGQT72IgavjfOC1s3j4q9kTXDlTqIOTBJS6gNjMa
         dEakip78W1yngH3Ean2O5Dy7p2yOpS50An0xk8jkqfo5pbtyswu/hPf6Jn8FmggdibrT
         Yj0EBhTJQo2q6BljnlNY8SmMQvZoyUnEz8dHUWmN/vtyPZ7B2uETyFGLgj5blyX/TatR
         fpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        fh=UQ/TNbzHq5EXHvOknthvitQIU4YSjqImk/7kbJpPD+s=;
        b=dUc6gP/iqkSnTbwUwsfdW21Fd0DR5FqSMB2p3Fd1nb/VQzGmfyZCY6FMHgxKKSEakz
         FGCvFC1If/Iw0m9ezGHPuGSoB5SkYfyajD1x/zfqgXQSeP7fhfmCy0o1VMty136TzKtu
         bQG3z0wiLRuo3KoyNUN4eO8wZwofU/6Xnkm4N6bORL6ziuMS6LqWTp8USoGPZmzwFCll
         OcG5YcTCFF6zZSVTiMMtCM3Oq+j45KkWqQuUAP0SPXeLOGtsgMTjWat/du5O+t9/aheN
         bLXarcsc52HDAjsWrEbEWzA1HMHM4Aqpu9rf6fm+ClHAW5oFFVmHSp3tWSKjm1pAEExC
         7F3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791449209; x=1792054009; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=YN5vNcFHN6IYyr86NzMr24Ebg3iUFLvJ54CzyveA3G5SeVCYuUKGNYTvbV+yQr1d1W
         oM0NM4r7IrvcwGAj3Mg5udBIgVygQ9g3OmJK7PXtP94IyusoXNVaX86R9xFQQX384iSg
         rdj7kWkisR8fDl3OVCq1YaQteAhLddcwSJkddwDSv0csvpNN+An7Ln9PrBOO6KRLrkLB
         YXiGZ6zR1Xqi7ortkzrvOVDogcUf6Uw+2GM/MFr2QnnC7RB16K2kqaTA/91L1VH5aLM0
         3hA4evbnop4fBkDfzGIRbRVvHl42LXVAb5fyC9AKc+7HfvZ7+S8w/uAxoJC6AOzv9usI
         /pOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791449209; x=1792054009;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhGDVCOgQLncQuplToj/mW7JvsPvLFBB1CNf9MUb7AU=;
        b=q54aE3uZwz8rMHISDJo4vqRXN/Eu+DBIj4Ob+MwPjuHqTGZbTlQ4CNcCuIIAw+Xs6s
         HAuOfwIRTAQVe3/XlCYwB+8pRBskOcjbHvtGYFdKHvylw3owzr6Hq+3OJ4CyeOFQlpzK
         4i8Ke3fRd9WOMTUHr8TL7QYCzVYl+W3PtOEcg8zW0et/Rk3WXwuhzJ7tqK+GJrXhjwUd
         AwRAIBx2TuSXHq9wQg6xKetKop33Uoyw5tOcqnEOk9ro/ncN+VzpEyBZu3v/8xSLrrKn
         t9Jan3IdtcRB78rRBvsUJOUR0AZ5Pna7El4Lv7C9ueogWIogWK7xMBdhEHnU9W0DMv/E
         QFeg==
X-Forwarded-Encrypted: i=1; AKwUvBwjVzyAmi8atb9eVLRHYCGDH+SUP1WnAgiEkIDzj03scL51IwaSF2QueW0bjFDNgy+r/avhanFKrj7hVy0=@vger.kernel.org
X-Gm-Message-State: AFuF++mecypqW5QEKZbegcjsLKRGKOqYfw6tP8jDdiwMXKuNw297TYhC
	OWMsNKgPh37CfHs2EjQMnYegWxsdmCI2ir6LRT7EoapkJ+e3xBfjEtj2meB/2LCG7cItX1dKVDx
	eYmVYSdEw974Z4rVWAiTs5cwYHbbT9p8=
X-Gm-Gg: AYBFou3KTrzUkBDsvrLre7TznsgU1y29SL7PJThxDmH8sdmnnL7Ev4kCYgZ0RMssE5U
	c7dTUqtESTYfkHfI+aAKvO61egqSAhlsN7V6ALs3Yx6KOkub6jaXbv+9nHt3FVuVzt4dOS6eFRH
	O/c3jghpI7NQWgiW59bf/6YLFOo3caRd71Ngbke+6/BPXNOgd2h7ARUKIplpYiXNZCrcL42W94k
	XA3u7XlsSdz8ejToRB9WRzXf0Qo+KaXJp5hFeL7yLXeue772bWJocgliHVX3Hx4vSpTJSovXYEt
	GjfZHlu/AHeuNi4D7NyMk2mC1dQ0IcZ9N6gm68G991lS4PtAF7PEt7R1HTxTJp9Co+bZVj9RVvP
	PEdIM4+2mMyA6IjGxJkZ7rteJRWULKwIJL55Jg48KvD+w6ch4E7UMR5tcBq2sSTkTNgjo+iegdJ
	5gzME95j8+lsdWFXWrLw0rWxrEdtVo25vylw0PRbVfeUS3PE7lYOs=
X-Received: by 2002:a05:6808:2e43:b0:4f3:36ff:e521 with SMTP id
 5614622812f47-4fc46c92bc4mr4767586b6e.58.1791449209535; Thu, 08 Oct 2026
 01:46:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-11-7b47ed6335a8@gmail.com> <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
In-Reply-To: <31d91f44-3f16-4a4c-916c-f4d8107d371e@oss.qualcomm.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 8 Oct 2026 18:46:37 +1000
X-Gm-Features: AclHuK9CHquST79ZWASmiEF-eCVAGlz1SqIt2DEtZen9lPzYSl_ASrQBijUe-o4
Message-ID: <CAHgNfTy-h8m-XBBzW6jSNBz0dVe=vXL6nJ3VOqgMjCbsK_t6gA@mail.gmail.com>
Subject: Re: [PATCH v2 11/21] arm64: dts: apple: t8103-j313: Add
 speaker/headset jack nodes
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	=?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 4:33=E2=80=AFAM Ajay Kumar Nandam
<ajay.nandam@oss.qualcomm.com> wrote:
>
>
>
> On 10/4/2026 11:33 AM, James Calligeros wrote:
> > +&i2c3 {
> > +     status =3D "okay";
> > +
> > +     speaker_right: codec@34 {
> > +             compatible =3D "ti,tas5770l";
> > +             reg =3D <0x34>;
> > +             interrupts-extended =3D <&pinctrl_ap 182 IRQ_TYPE_LEVEL_L=
OW>;
> > +             shutdown-gpios =3D <&pinctrl_ap 181 GPIO_ACTIVE_HIGH>;
> > +             #sound-dai-cells =3D <0>;
>
> Both speaker codec nodes reference the same shutdown GPIO. Is that
> intentional for this board?
>
> The TAS2770 driver requests 'shutdown-gpios' per codec instance, and
> GPIO requests are exclusive by default. So I would expect only one codec
> instance to own this line, while the other appears to fall back to the
> register-only path after the GPIO request fails.
>
> If GPIO181 is a shared physical shutdown line for both amps, how is the
> power/reset ordering expected to work across probe, suspend, and resume
> when only one of the two codec driver instances controls that line?

We use the new(ish) shared GPIO proxy stuff[1] and it all Just Works.

[1] https://lore.kernel.org/asahi/20260831-apple-shared-gpio-v1-0-e855b12e1=
8ce@gmail.com/
