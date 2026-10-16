Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280DA4DDB48
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792168049; cv=pass; b=gmzfcBv2/r0cNr8wodZ/MBd42HLGAWUij1HuQaTyb4bYLDIB6rnrHl8SUpv0QVnJpZz758+8ONleGzf0FABfr+F3b+Qu0r0l8J8bEWFQ/BkulkcF+IL8jPVn8+3450v7qniue7BhyUXH+QoNKteUPGXhu0zG5HUGdLYieTJpY8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792168049; c=relaxed/simple;
	bh=7EREj28Pt4d+3/OFjKBkGafNy9R17eDiUOr72tTJcIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T1YuwM23vp889Q/lSbZqywL9mlHGrhfl0V9fkOSK/bpuNmLSKU2JT1Rw3s1B+MtVDk/MQkw6L3+JT7DtJVIpND/SeM6PYbHkPRAa2z7nZH31y2rH7jAdluDAT/jO7IfuzL7PSsyYlh69qv/zg2LPa/3N+MQzJOZYTJjdB7Q6yqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kA0p/dGu; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kA0p/dGu"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-17bc533fda3so62128c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792168044; cv=none;
        d=google.com; s=arc-20260327;
        b=ciyw9XqPjSeZr1CDZ7+GrRdaBgCn8JPdsrwhcKe+kczFpjmhRAPcQnCfl+HLc+6FVM
         as1o305KEujKRF+8rwVKezySQ4nLQt7Xig3Ab9Q70nAaJqkQeZyDfnAn8w/upGd4N1L9
         lPZg0CCDY3c0kVvOzLhJwLlRT304C+RPSGDb6gZjzcFaxjcYoMl6clzvVDytWQdavVdG
         gChu8MbukXYyEeUqo7sTShs/LHT3O+/ktDQlw1aD5VFECkxK9vIYYRskmMe5Sb0Q1rPa
         dJoX81R4/bfbNriHx9Zx7oqi2vdRkNmzszpW9tEbAk6aaDtmo5sqQN2kb1VUgzhKZ3n1
         stJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        fh=LuFY1aeqYCYj0Um9aiQb1SXhgpEAOtG4eB0A2d9bgkw=;
        b=BphpxZUFkYUHt3UjVSZnNiodQnJncKBm8FS+x8TNvh/TXfjLf95k1wwZfLFr6zY8Ma
         Wvi2w8SV1Nc9tbcIq8qqHOwCB12Qy/Nd00x1D++mhNhzsfbxHfkgcjAG9DVpkxVttOYm
         fdnCRx5H35nFV2ubt378CBWzMJTSDW/8jIveSJ9ns1UtiwDXHf2C05fjuQTlTaSt81Po
         6FCbJq2SmUiMqfhbdAdqUOeoqHHI5R7T7XIb6bDwbDP6M/CgQj5tGOOFw0Ff/tc6jgxg
         1sW4GC+IivcFGapJ7pMTBQiGRd8d5wk5kWOkHI1men8Uonjzb1i9TKhzaewqjWtKWArY
         +egw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792168044; x=1792772844; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=kA0p/dGunHRVQFYJZxY63SPffce00jnFtWKw6dFU1c8T+ICC30awMa4fiXZ8fEQV6p
         HfgIC/dD3PFkzcNQcaQ0EYk88IfXgQVWM7eGmWAL/MxrY+vkkmunKb2U3d8Qv8sDBS1A
         EFpQmv3q895Nvzo0g0Jdt50ZFVu4JdyiWv8iQotFzCHnkyEMMdQn8zV8zsWVwwL4wykn
         lNEx+RHNCeoiS22qfZFwDSUY3QmmF3LjiKmYnmqajqHDsnTyySLBUTVoujBgCArX9N/l
         IiInZQ5ZRG3tSwm6LJC4rO7snD4fp20OR24P0zUWrFa2Vy06kopeGhUoVIfu6iMEgonV
         uWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792168044; x=1792772844;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FKkA/I1J3TnOXc1SCotCtaDkPFS5TVcFw8DzsF8Du/M=;
        b=Ohd8FmzCizcFQ0sLgqTsE3Wn528QlfD8BVzZmMdV0AIadoV8GBhKHFV8TJ0wJLdkm7
         pybu37luuFGPHMapy4JypCeA6Qqc9Wcc97J4UNHNhgdOZXJk3k0AOXYLWfTyYbYsyT5n
         BDlb5DxbgvfAwx3EQMA4Qhr9BzFckfdvNMEZRQ67Q89lMri07AXr+ZUJK27lDkq6Kn4b
         v2MQ3P6SJtxk68XYYOQ7wbAJpCd9wy3DB81t6VnHUAT82Lsd1daGeuQP6IJEwcnvrQDa
         9TcDjcNET6IvACGbCKduRF5VVXtwUHcBLMcFwZwObnrDRMQpjcJn4e/M5NLTdS1rhmxi
         40Kg==
X-Forwarded-Encrypted: i=1; AKwUvBwZxtEtvupjOWKOpjULuoOm53ysEiUMx06W0kshhf114oyhrX9ATMv3Xqz0BkPQT8fPQ6s0EHAxM8VmcZ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIRNe/mz37oflKSg6HT6jNStObf4iQd1tu7EwjUIOWcNV0do6wj
	EuBR4iZBL45p7D8GthU6V2Bhs5WIXnhiQwn7uNGLy5W2eUzQtEeiEtOvBEIfDSlVEH48Mv84tJo
	inwn1q71aoJ3zPTDeB8Fw9XJLGTz3ksc=
X-Gm-Gg: AYBFou3EscKD89B1TcvmIIjDcOIujiJoxEx1rLH0FLJk0HrZvE+sJgqMRv+SDIYAZDc
	buHB9eer1KmBdjdvH/UBEKAJi5lGWI9UNoXBXkLAOBHl+yUvrGPTwXQDTKhFPRSBdvPIimvYsVw
	j53Z/a/W9a4uMb+TG6H8TE3vpMMwRzI+XN88pMiu9Bfquy4Qb915jwvRj3JYnn80Lu00wcA1C8x
	RRUTravqkPY86JO1RNAPSa8K6iqXRm97yxEHYLTG1gBPX1C+/HmWF+yYanrgPjR2LvtMbKXNS7g
	8RHdlxQGRnN7Z/6WTyBXK8BNujrbgJ2h+5qlrNQiVouZKK6ua/x/+XPxWxLXVav39CrdPeH/5UO
	uZ05ZxP78QgDo
X-Received: by 2002:a05:693c:638d:20b0:35b:cb8a:8d0e with SMTP id
 5a478bee46e88-361a18634c7mr341911eec.16.1792168043963; Fri, 16 Oct 2026
 09:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013180933.487013-1-clamor95@gmail.com> <20261013180933.487013-3-clamor95@gmail.com>
 <atJDFRXmgZ37GrCE@aspen.lan>
In-Reply-To: <atJDFRXmgZ37GrCE@aspen.lan>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 16 Oct 2026 19:27:10 +0300
X-Gm-Features: AclHuK965ULDwrtLzaPZLgAMgTCNPq5g0it--pZ3MwPKJFECiLPJTV2LEV8Gatw
Message-ID: <CAPVz0n1RVDz0MsMBccanpynh=Qn4x6Ar7rXRUVitav88i-hWYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mfd: aat2870: Derive brightness steps from max current
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 16 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 18:3=
0 Daniel Thompson <danielt@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 13, 2026 at 09:09:31PM +0300, Svyatoslav Ryhel wrote:
> > @@ -69,10 +57,11 @@ static int aat2870_bl_update_status(struct backligh=
t_device *bd)
> >       dev_dbg(&bd->dev, "brightness=3D%d, power=3D%d, state=3D%d\n",
> >                bd->props.brightness, bd->props.power, bd->props.state);
> >
> > -     ret =3D aat2870->write(aat2870, AAT2870_BLM,
> > -                          (u8)aat2870_brightness(aat2870_bl, brightnes=
s));
> > -     if (ret < 0)
> > -             return ret;
> > +     if (brightness) {
> > +             ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightne=
ss - 1);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> >
> >       if (brightness =3D=3D 0) {
>
> I think this could be spelled "else" ;-)
>
> However, other than this this looks good. With that change applied:
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>

Patch cuts part of code, this is the full context

if ((brightness < 0) || (bd->props.max_brightness < brightness)) {
        dev_err(&bd->dev, "invalid brightness, %d\n", brightness);
        return -EINVAL;
}

if (brightness) {
        ret =3D aat2870->write(aat2870, AAT2870_BLM, (u8)brightness - 1);
        if (ret < 0)
                return ret;
}

if (brightness =3D=3D 0) {
        ret =3D aat2870_bl_disable(aat2870_bl);
        if (ret < 0)
                return ret;
} else if (aat2870_bl->brightness =3D=3D 0) {
        ret =3D aat2870_bl_enable(aat2870_bl);
        if (ret < 0)
                return ret;
}

aat2870 cannot read main backlight register nor channel enable
register to check prev backlight status. Hence this logic is used. If
new brightness > 0, update main bl register; if brightness =3D=3D 0,
disable all active channels, if it was 0 and now is >0 enable
supported channels.

>
> Daniel
