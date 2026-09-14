Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BF0329E44
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353984; cv=pass; b=QRRDungA5x1E6jYZM5esQSHBilbGOEpX+lNNNME50kEW716J6bKdZDHuBTUxSDz7BHAlRph5ffPaZ/Vbw7WKCzVCgCU+0NWqIU0soeD/apSkw9V7pyKwTtVS9OrWQ67Nxl2sXW8gqRDYsB+2K6lSyJXY0/Ah86QoV+YkU7v9qsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353984; c=relaxed/simple;
	bh=pdLJmeXyTQ9rHJgZF5UazEIfFtz1igLOQKfDmJfXugw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GhzNWB5F6dFMrsjbTTLAjJqwy8FMIxwx4Qq4JfTv3unChCfddeT823dzLkyTV5RoN0Z5tu86l+j9kY1lg5j734VhjDWQwz5SLKBqP8eYb1ilD9bGIjuDJiLSc22BNdAkHPOKg+OHAPkh4V7aVFkN3FLIfjrWIG/e76UGiCPsCSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHRNT0YN; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHRNT0YN"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a20367cf82so22176231fa.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 19:46:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789353981; cv=none;
        d=google.com; s=arc-20260327;
        b=NfJpSGtS/aWQ7aMu4nxzvseuF617a9amZ1am5xQ351C/HlT+yGWjVYPuMgmZZQjcYw
         CRiZmSBCIAgjCzQnOCoTJEZhFw36XoBotC7jj6XsbLAze0XAmT5X47Yz16lOuLSTJ4kE
         j4XFz2CFBc8R2w+HZvv5JK/N4bxcrijo/JSlIZH+r6v+oXWkfi//K4ds8vApIyiJ7ifh
         fqnsMjDwHfNDRr2Gl/SwlOdLF5Oy2utQY4+gbS9z/0EUqNGjpZhqDcAchCaiYUjfDhNn
         oUc3xaL4QiI/Rc+ejPX8YXY4nmF2G29BMlT9URwVPd7Xc8De+OGS39fs4KwrHjtmuAXP
         21jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1FuJzn/2R5Scc5m2lJpVpNzaSeSlPcbk/PD0ZHGJTnI=;
        fh=OiAi+amVT+lj9SIzdbnDDFrkKh6Zq+aDkzztaaR+Vzk=;
        b=FXFeqxEI+CX0FPIPeCike+SWv8gFTUbyzkMkm7CECApcYmREAXgzbiHk0BhEy8KTid
         Rox0pqFS2zMUOdpywV5p5Rom92S2xvDa+BSN3/Scl5XRX7PB8Ku8+T+sZ2eidoIAEA7I
         6n3azsAUsnxNaoY2W9xcOIghXtBIqvcGSaBqz7uUxuQ55uhcX+gzfVrUZti6Rz5uTv/P
         rG5pe2Z8zzZVhH4tn6IIVmhYwzbHerA2Wr2HxtT/4qlBCnIqb+oTOLL0RxWtaXpdlNh1
         AGTw9z6MSI3nOfLMJ5ezgZj7gjMZwBjAjAvy5y9bZ7uCIo/J6+Ia9ujLepLxc40QfgOA
         qDhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789353981; x=1789958781; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1FuJzn/2R5Scc5m2lJpVpNzaSeSlPcbk/PD0ZHGJTnI=;
        b=lHRNT0YN1yxjkrlAM1lPdc2WLMf399E6idNIwxJWsrTL6PTkAVQcvlyPCvl5nFYBK3
         AcyPn13QqKVVRrL1zipwxIuzpUn+hZQyrfLwU8vfxMlO1Sg+/Wc/b8ssKZIBikPTpW3o
         Qfhv5VYeyTDS4rgr3Y1crm9tbApDt3VgOUSmg4HGowYFcg2iQD6Atwm+T8mrtuzpDzdI
         FplW7jJahMK8c5NcaherFUGtK7yxNILDMASgehGniR15Q0fSqZ94oqBaNSuxDJMRDdPq
         P/0+TRgkg5jJVzXDicJjiIXLH2dlZUYYr2nDCwskIOBgCIztS2v9Y18IRTjj+Bd2PmH6
         vHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789353981; x=1789958781;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FuJzn/2R5Scc5m2lJpVpNzaSeSlPcbk/PD0ZHGJTnI=;
        b=DLG8ReifWRtwrnqGGFScfVhTpLXdZHVTvWNt7bbHzL8IqFrAYN1fgtyuQVsa9bGyzi
         P16Dp48wM7wFbwX9Owclz6cuMY2nnbiFhXpMRxluVD+9oweP0ZErlRc+ftLfxsP4C4hO
         tzb8u/6KA1X8aWECA55WrqkJjt2M1PRkdnsWnkI65KxR9aHtPBMFjexWZS6H7TWm21k/
         sRf2rz7QF3dmAgKaJDGXvTlKWzCCWW/sVvdyENNAgPId6KCuaEDu8Wk9Zz+SxxcVHt60
         ukGRVHhZzDAAduajWzM6EquA5K+lFGOIuJAbDsUOvQXZ4Je7o4sHprH6DQyWaa3rL9vo
         CUVw==
X-Forwarded-Encrypted: i=1; AKwUvBzmsKbq9V5T2iD5Nj5qt9KuQ62cUImyA19GYDEOfTDjLqbSvg5AZc9wNI6cE/c1uEU7YseZcy84fy8nBVY=@vger.kernel.org
X-Gm-Message-State: AFuF++mGRXgaJwqyIxTNfVCTzKohnWvCyqPqOvvSbrgGnb9zCXTCoyS8
	XNO6PCIW+SV5nd+f8PcCeRoA51Y5901mWjzTAVR+61JuOsYXHJQ3QffXhRne7VCA5YVuLirBWg2
	m0wmbp9uPhr9OA11gzx3Fh/AJ8F92wNA=
X-Gm-Gg: AYBFou2wmDiJWWtEsnOucKLWb17RPaXzizABFdD4wrCLg1hHGE653bPtLCJRiqo7uZ4
	HyJTml8qMmEQW0+/8pVCh4QICS7oXLiPCwEshF+3PHRkD4N/IEGZXz42ZbF1h27A0cwqW6FIRAM
	563SmNjqrLum/aqtIKJ/xzWhhUN6W/m6l1Q5yYUJ+VDqQTaZ4Ct9lzG6OR67MFRGhFneOLDLE4n
	2KoluaAk5yUHrTjZHZ2AY1Kwit2vvucfj/y89LNnFJEJzkUw8AJtfAbNs8FKk8ucYToP7jEQqPP
	EQc8zenqarDbqm8hQ3TlY2UsOEv6bxre7ungkEPjPjmfqREuR3xrRhb6zqyMftA7aFba2Req7RM
	zuEWgdiMajMSLBoimlVvlj3LigRnqp0l5R8Pe+lHlbg==
X-Received: by 2002:a05:6512:3042:b0:5b6:1a7c:59cc with SMTP id
 2adb3069b0e04-5b8ae69c885mr78058e87.38.1789353980592; Sun, 13 Sep 2026
 19:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715-pwm-loongson-fix-v3-0-0aab2847eaa7@gmail.com>
 <20260715-pwm-loongson-fix-v3-2-0aab2847eaa7@gmail.com> <ap6Ciw_sMALvlROd@monoceros>
 <CAJhJPsULo0S5c6GKQvRqLtVx3nixZLuqRrh7hi5yJ7C5BuwLUQ@mail.gmail.com> <aqK2R9HodI399ehb@monoceros>
In-Reply-To: <aqK2R9HodI399ehb@monoceros>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Mon, 14 Sep 2026 10:45:43 +0800
X-Gm-Features: AcwNN1UbS5KoKs3oMsJvuOYqiNKtHepxzTF7RNhGPEaA55gBaJPAbm_T3WS7wqQ
Message-ID: <CAJhJPsUpefK7CQjHY+e9BQt90jQoTEf4ki258z4f--G-ATjKkw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] pwm: loongson: Reload PWM configuration through
 counter reset
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 9:54=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Thu, Sep 10, 2026 at 07:58:12PM +0800, Keguang Zhang wrote:
> > On Mon, Sep 7, 2026 at 5:33=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@=
kernel.org> wrote:
> > > [...] I wonder if the fix is incomplete. If at driver bind time
> > > LOONGSON_PWM_CTRL_REG_RST isn't set and there are still wrong values =
in
> > > the shadowed LOW and PERIOD registers the first period will be wrong.
> > >
> > > This would need:
> > >
> > >         val =3D pwm_loongson_readl(ddata, LOONGSON_PWM_REG_CTRL);
> > > +
> > > +       /*
> > > +        * Ensure that the values of LOW and PERIOD are sampled into
> > > +        * the shadow register when the hardware starts running.
> > > +        */
> > > +       if (!(val & LOONGSON_PWM_CTRL_REG_RST))
> > > +               pwm_loongson_writel(ddata, val | LOONGSON_PWM_CTRL_RE=
G_RST, LOONGSON_PWM_REG_CTRL);
> > > +
> > >         val &=3D ~LOONGSON_PWM_CTRL_REG_RST;
> > >         val |=3D LOONGSON_PWM_CTRL_REG_EN;
> > >         pwm_loongson_writel(ddata, val, LOONGSON_PWM_REG_CTRL);
> > >
> > > I think.
> >
> > You are right that this patch doesn't handle the initial hardware
> > state when the driver binds.
> > Would you prefer that I submit a follow-up patch to address this, or
> > are you planning to fix it yourself?
>
> I don't have the hardware, so if you do that and test it, that's very
> appreciated.
>
Sure. I'll add this fix in the next version.

> Best regards
> Uwe



--=20
Best regards,

Keguang Zhang
