Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F1F37B032
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 18:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789066613; cv=pass; b=kQS3KvWa0Z9O0D+hnviS6uPmWt5nLxsyFle1a0x+dl3kNAJxhhnCqvb4hn3J2xWW04ddOlsR+awcPhUFzmA6OYtTM729rOsk+xCqaXEKA0LkLwDAE3YHHP5qkPbYv8sQVOhV/EfWeynpPYjOVizgaSTayFMpRCBDeZN0GzR8oZk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789066613; c=relaxed/simple;
	bh=KYzmAlHaz7Clc/Y0Jls+1V6fGOjaYyOAWFoPDWex4WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S58EhQgGLvAAyBJFBhVeiJcJlSIelke6peezAUa4WOk5Fs/hTbGjeQVYj67BdOd5ZWq4wTxQCzPmsVmEqnmDOKMzqxOHAVgF2sVwhdUZ017iwO7+mq57erBPutf8D4/WC3+cslLc5okW8K1FlCxlyuBlsjjHhawW/F9w7sRO5gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhyIEhiy; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhyIEhiy"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2946dc8dbfso20795366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789066611; cv=none;
        d=google.com; s=arc-20260327;
        b=K6rdd52Lbvgaf7sJ8mH8HUA59gHrv2OAfkuk0Px2GEhsvxidJ7Tl2el0+6PkIj8ntS
         lBiFFK1UqoEgJ5AXwC6KJMuu34ua6vbRymjV4EPLpDzL+VL6utNEPSx8vSMFVXieFaRn
         oVZ3dvR4L3F5aWeuvcyI2KoP9sTVZwYs4fvUp0VgIg6NalfMJSI/zcqWOmaKoHvB/idl
         8cTsNB+IE7I2qCgHGdo4h2ixGqzvtnaWIzGYCi1EqVtFSyb6J8EXYlxRq+KbhCAa4PpP
         02BGLthfPCVhJW/48ZE/tzgdTCIzA7xce/KsfftbN/1YFqztrZvYkXFlQaMOMVcmaQYj
         AsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        fh=2rujaqw6K1/dP+w9VY+x8JuJY4lwj4c2H5aN7WMelEU=;
        b=k6rjzQYQEUiK3ZyFO33uUZQhvNuIUf0cslk5qK/WZTR4k4NXgACIlh272RM3TDac4d
         e4xDh6L9ZctdTOxmKqDD1s6459q536L427blJCOfUZN/rTpeCjdrQ6380qh8UEqvwHwz
         7+OriEzkjYpw5c2tRjU06ECD/ESJmtjCbTEESb3QBOCo+zeG2UMq681rvqH68niw/yLE
         6c0FD/D8nDRtp5zDjiIXFyYu0UTI7W96ZryWRa0m6iDkUE5DStbSQVD6Oh0cIIkpS10m
         0IHVO/9jJ5IzbhnC1zyTp82d5hYLe79zk3W59XOMcW+mXbT6g7c0muE2g82HUN7RV6DU
         QzuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789066611; x=1789671411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        b=XhyIEhiye/PryYCft1Q3UIsTvAEO/LDR3QJ0eXsVi5VGaVLXWYjVlMWVpcK0oj/BFI
         T6UyeHHGz1UXty4xmtJCOwR4arM5KdrXuanUmEgWPOL6Dnc5fkQ4ZIcvKt6PemcpCPQT
         1BuhoaEkqYNm/UZbYQPW1HWbXWAznI3Z99eiM3HWb6/T83hbjggR0OaQB9pLpDoqpNz2
         7VBlzw7X+OUekiMmhbkk1WMAvFxnSBOtKuNcgsETgBS3AT+/qYr7u+rlq4WivoI0efUd
         R6HKGfLteQbO9v8p2nKLFwxDVE4d8TE3MnweXQFLCQDfR+SZ+sWDU9dEmRGehNVsHQB1
         ZMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789066611; x=1789671411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TxLFoqvsaen+/s4fMM/RLCX3g5k4dxrg7lkZo5p2w6c=;
        b=IEHhKsVcuJd55Uf9ccZChkh98augzAEHkGhDLOdckU7PjPyVMzhsmcEaervqYA4yCH
         AaorPTED8tH9lJ3lY2ZtgQ8OzQikXMyC35gYaLWotEjxDqZ14qo3Nt8l6sVuqClQRI5f
         yVm6z/20CkmXADd/44zj2EPvn+0hEOq9zX/op1rPnYjroxThlr4HlqFJv96P9KcPQzq+
         gaFf2o6E3zXZ3QDcBzak+4zN0eBVSf76YpCHT6IUof8E+3y8RCs0vFn3pZy/M1KTzGSI
         dFL6E8V0OGtIknA+/jD2nRJZjG+qqfoRn5dwxkDCHXJNPHQQNBNuMKc4f1KsFDPG8Grf
         ILKA==
X-Forwarded-Encrypted: i=1; AKwUvByGJ+RP4qK8qiRNJB1v79gXOe59GCv9T7nhbQHsI4f70LKPJeESNZVQusuh4XnwnSAv38G8ZRg6on1zAXY=@vger.kernel.org
X-Gm-Message-State: AFuF++mLF+SawPnaQzE4qqg55VJPQKlXvZR2CAwFHnYmxBWw1kMaksS2
	g9kr5w45YBYfxTaYRLcUxypFoSNcOvyEUMelE/fdKRwEVjKgvikOCIJQOzzb8igLajZbujzGdM2
	8GcbF9gJ7jiEFLTgRMzvsw8Fb+5fI4zU=
X-Gm-Gg: AYBFou0OluMCs0yafYqs0d1axKuzf7wFSi7B2FP/iJc75wdy0chceHM6AkGyuBwdJO2
	J6tGSjpDz2RjErl8Iw5GfVDslXDFfCCGG9aG9MWMjkHsxPtHpNynieTtr3ZYmFFJFmuXlBKu4c1
	GzzOfVSJfwZb620emDLp4DSTdJfLisCpOTF4/gQZhoLHKfnP6gBuIfhENGmzIW/VVyFFBod/g5Z
	pRrBBdUlVT3mtx0N1UP2/1xlqKtOBXHPoVbACLH/vPOBYIQY339YyMedpxzYB8CEHz4lz7v6jnM
	zQEDIL2g4W5YWLRYkSN3XGrALv3TzTQljcUfol7VVJgJEGJWUjE85/nfMy3PR+HBPF4yWEDZf5l
	f4COhU2SfoOCL7Uzg7aLohnflEcpUJuUoUi5Y9MUTVSMoMMv+g/cbXIRJiXeeBI6j83aVrFw065
	v8nfZBBHGkDjN9ROy8V0HBZZJASbZDQHDvt0oUfmFFD4/4BnXEwJPY+84FstnGSZ6V3g==
X-Received: by 2002:a17:907:3e87:b0:c29:386c:58df with SMTP id
 a640c23a62f3a-c296668deb5mr944166b.30.1789066610568; Thu, 10 Sep 2026
 11:56:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910001209.116465-1-rosenp@gmail.com> <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
In-Reply-To: <6a65465e-f860-434f-9dad-59d9538c97b8@broadcom.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 10 Sep 2026 11:56:39 -0700
X-Gm-Features: AcwNN1V6aaA1o2c79sKoypMBaKIL_zofsrFDIKG1O8uwY83YC9Mz1J-mEf9e4HU
Message-ID: <CAKxU2N-DJS+ZotHsgami8pc2tnC2+V3nL4JZrqgf=rpTpFHNEA@mail.gmail.com>
Subject: Re: [PATCHv2] ARM: dts: BCM5301X: AC56U: add nvram node
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:BROADCOM BCM5301X ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:46=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> On 9/9/26 17:12, Rosen Penev wrote:
> > Add it and set for gmac0, which is the only GMAC used on this board.
> >
> > nvram size found from a random bootlog online.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >   v2: fix typo.
> >   .../boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts    | 14 +++++++++++++=
+
> >   1 file changed, 14 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts b/arc=
h/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > index c80ac16ad949..9ab618a097b1 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm4708-asus-rt-ac56u.dts
> > @@ -25,6 +25,15 @@ memory@0 {
> >                     <0x88000000 0x08000000>;
> >       };
> >
> > +     nvram@1c080000 {
> > +             compatible =3D "brcm,nvram";
> > +             reg =3D <0x1c080000 0x180000>;
>
> Why is not the nvram node moved to bcm5301x.dtsi given it is common to
> all of the chips?
To avoid probe errors on hardware where sizes are unknown.
> --
> Florian
