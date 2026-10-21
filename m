Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792553194;
	b=yZOt7PlpIvrbFqm+D+lP2bPasHkDCnU754urg9gYvCmHiAoiOg8gICNqSaziuG8PuOmE
	 E0oLraN4jRq5F22esJsC1pzwx0axmBrbvakdKhGTui5MU23ItyrA6P95aBIsrBC7rsMiI
	 ENLIqfrGFTKx0vOFV670a6KENyNx+VrLmPGkvNWDYdgIxmaQL40L/fSdHfvXjR79RLO/0
	 3vFF/eGqvbaZ5w5DWSragBha8gY+AbEySwCLql9/a5lqKmvoivyaP2slizrO2F5Zb27ue
	 S8lRMjyTVSZV1s4pGhubInOeBCV0EbhIwSXRLjMSM0iV0hYeJM14e721Or4c73zn9eg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553194;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
	b=EgNmxU/jKA1jGzJWTh9QdoHz/T+MvMXJuCa4hb+t2ctWEmk13I3jsOSCJ1qHdJZNqDyE
	 G9hwVSuhABahYuH1dQhgy/CIFU63j7UHfa93fDBxKuvFFL7YQfIORcXhuQrW9zVVmfybV
	 SmHd+y21VLdOke2YZtEmGyclir5zdlGfm5jkNNUXmyx2Ect3iWqW5oJsZswzyss0RtVF4
	 gp3DAUEH22FCTr28N5t94V9V9PMHu3T9caJYzyYN5r+O1ypxTdQOMtJAdvUOsIsQeVVuL
	 i1V9tAAwtWn9psokZIbh3x+5AR//LKspLzJik7vEWaPo4TXSvZH3QdO8t983EAhPLoQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lOcwEeEx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76988607155F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76988607155F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lOcwEeEx
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so1362805ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792553193; cv=none;
        d=google.com; s=arc-20260327;
        b=opKHxC2BfnBFH09GaHkhWKDadok1fXxBZKGBJI8Be9hh4461FYHEq66vckTLomdrgV
         I9STh3gFotfsTvumGYwCLPPz9hf7A9rMq6ue7VSPehFKAxX95SkUb0r2gdLMyVqHmeSf
         RDAxuqkEfKozrt44mcLmEsnLTBKQtJIJvB2k4VoThwnHrVX7pfPGDa+69waXe1hsk1Cf
         JqnPCJAJKvZEuNgYfHULQsXP8WIHBXJzytXr9jSm8E3CDGhGkYEDLFPFGmiZjfjJawEK
         HaubCfWCuSGZNo+zhCNMztdFH+RH3DuexpwfypZoqjMaxPZOg4/cHDYt0LYqDq5BSPWT
         Ff/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        fh=IZLtIG1U0F6wfI0q6iUJlgSyjLE1/nCp6H8Tsx2F/bE=;
        b=FILOOY0eQaliP2RbxaXlO0wRrAMOrVfAtlsq+ccGNQIpA5fVQMOCvD7RpMP4usebId
         Ro9v0pdhm6nBqpV7Hy8jAUofd2xZ/7BJJzrRHzEvLAmd75NIMod/j6YPXucZ8J7ygnOG
         HHw4gKEuOu8uMpkoQcoaqrj8VMOKUoOuDTFCzlkoHQhlvjxY2yLWcoQHXk9UTKFrGDz6
         W6KWeQtdXPfIWZFtY4n624E8DgqPShvUZuCIQalCi8U3Dt5ESz5zy5p73gcEmu4vaCQO
         U6xhQegDSoyfSzD3n9ikihukGvw3gdq+x1YsIDZFe4nWGFMRgUM+tcym+vWYJgt1KWPo
         2VYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792553193; x=1793157993; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        b=lOcwEeExZVAEIy9usLkBIV4yuk0sku3m9Y82hmVTKbhLuOlYNdNr17teoxDu7qO6jB
         vncGvDKOBjWc5ulwevD8mnmYQ2x8K8t0rq2y6zLbe6kYaiiWMJPeraxA7reUgy6xVaDv
         xeItrhLgGBJE7C6Poj6JHlXIoHybbwYTvWcdf4HP/SNJcyz57TyuM6+JeAMxLfg6TZ/w
         zCy82mTslfSCqC3LlbnLdYIshuKwVFTmvLlY3v39amL7q2aJ+XR54vm1Vi6ctJd8rlFU
         G/zqjdmmL4cK/C03NQ1yAR+lNgSDdkNIQHHLbQ2JSbviH5oApWaqCfRw2CssNQLoR+Qo
         om0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553193; x=1793157993;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gt9eQr8sy7P6ypBBj7y/ENXtRPX2gFlUutM8nimRFxY=;
        b=NsPiSWc/NcGdol8GOuDHIKWH+mf4ENzONQQj/gA0BuNVC2sLeJlh7rFBgZ2v+VZ4vF
         hSmSW4+AqAukjMJhfJDPK/J7d8tSUFoEnV7gZeWo9hFNQWNuvAqiIE6tDYefjElwY/y4
         gPF3AVYNzNswBra9FlsFC65kcbVW+4RPvR8u5hdedJdBZhqRp+YWjzd9OgW1OojUc7jF
         moXUrBnxoqToOh2arEtR2dzex23Pm9Js/KciwzIgDtRn0AxBE8sWIVm/Mqd6KjEYAurT
         smhXwYjF2CwO6DKj5V9uPtaC7CplN/QXo9Ecx7QaOZJ83ing1dcnSu6M4AYTOsOBtAcr
         93bg==
X-Forwarded-Encrypted: i=1; AKwUvBzF2ijkr3l4ScWFlmGl1kSYxCf2pAlrHAUU9tOFlbIFop0RFxNpumA1ZktL0dGnRY7pbQw3KV0C645A+EY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtllSN95LRvIYDliHLR5N+tpYBGWtU3NxfSMjyPO2NIamQyZCj
	EF8Zo71BwSKEpKnWVWqj7D+scNpAXeb3XFyA+XS13XTzxU55t+6yAG9k+8dE+VnQs08xEI8DQIN
	ptk9QVsYx/b8rhvg+piokntSnkF8lguhj2g==
X-Gm-Gg: AYBFou32vMrPrIslOjmu6zzEK76IBKDSBvB1oCP/wYG2G4pI/hk9y+zbkFSYFzLc0nJ
	lM69OuEmJeyg4DspNGQBJ+MapfrvhECnbQh6aeaSSqODLOi2CVRYRqVhc7Y23PlwYQ3DDI1s6sy
	gc+KiDeTBpk8jpgwHvP8dNq3H67ThYH84wrM7lIMEvqVGzcX2jeGrnSojjsLvfgcyJx7FzGEjew
	fW+pUDKx52xnEqRtG12kJ6+VKE4V3pRB9U10vIY1ZNub/jla3qR8rPsENFeAv1zFJ8cNm6xJAi9
	/lStS4+LKp4n6n/o7QV7tyx899orEaE4KbJ2VR3lbx3wrowGLRm8hML9qWoTnvBvRCiw40wMvrv
	ISpfc4nYzrkMa/Un4fdfem40UXryjDi7VnnZ3NBYj641mUfoeOW6Ihg/AtAqO1PQxEDDp1tA=
X-Received: by 2002:a17:902:e74a:b0:2df:4dc5:e12e with SMTP id
 d9443c01a7336-2ea43d88783mr5847285ad.27.1792553192737; Tue, 20 Oct 2026
 20:26:32 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20250511204427.327558-1-lkml@antheas.dev> <20260803221614.59324-1-derekjohn.clark@gmail.com>
 <20260803221614.59324-2-derekjohn.clark@gmail.com> <f8b2c85a-2800-c9a3-4e56-7af4c53823e5@linux.intel.com>
 <58a9c644-98c2-47ee-b083-0d5b19fa5053@roeck-us.net> <CAGwozwGdwhE6Sm6oa2uxx_sHfFNQ6fHYnAhYHkEPQcp_Yb=Z6w@mail.gmail.com>
 <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
In-Reply-To: <CAGwozwFUTagam+dr0SXyziAMz1MJKcYMYUgrogFcmvEaE1X0UQ@mail.gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Tue, 20 Oct 2026 20:26:20 -0700
X-Gm-Features: AclHuK8Xs091-vKVT7bOvhDjoq3_nWge5aBpQnq0586E9aA_45l3eZeGSIpucN0
Message-ID: <CAFqHKTmQ2R-UAP9rAZzoxe=p-T1_JKPU1NaQ2ijrVg0RXZEHUA@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: msi-wmi-platform: Move guard out of
 switch in platform_write()
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	W_Armin@gmx.de, corbet@lwn.net, jdelvare@suse.com, kuurtb@gmail.com, 
	linux-doc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 2:53=E2=80=AFPM Antheas Kapenekakis <lkml@antheas.d=
ev> wrote:
>
> On Tue, 18 Aug 2026 at 17:26, Antheas Kapenekakis <lkml@antheas.dev> wrot=
e:
> >
> > On Tue, 18 Aug 2026 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
> > >
> > > On 8/18/26 07:12, Ilpo J=C3=A4rvinen wrote:
> > > > On Mon, 3 Aug 2026, Derek J. Clark wrote:
> > > >
> > > >> The ML patch set uses a guard within a switch case that violates c=
leanup
> > > >> rules. Move the guard outside the switch so all return paths are c=
overed.
> > > >>
> > > >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > > >> ---
> > > >>   drivers/platform/x86/msi-wmi-platform.c | 2 +-
> > > >>   1 file changed, 1 insertion(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/pla=
tform/x86/msi-wmi-platform.c
> > > >> index dfb65ac8fbf6..33acd448f674 100644
> > > >> --- a/drivers/platform/x86/msi-wmi-platform.c
> > > >> +++ b/drivers/platform/x86/msi-wmi-platform.c
> > > >> @@ -675,11 +675,11 @@ static int msi_wmi_platform_write(struct dev=
ice *dev, enum hwmon_sensor_types ty
> > > >>      u8 buffer[32] =3D { };
> > > >>      int ret;
> > > >>
> > > >> +    guard(mutex)(&data->wmi_lock);
> > > >>      switch (type) {
> > > >>      case hwmon_pwm:
> > > >>              switch (attr) {
> > > >>              case hwmon_pwm_enable:
> > > >> -                    guard(mutex)(&data->wmi_lock);
> > > >
> > > > While I cannot see the code easily, one could also add braces to in=
side
> > > > the case to avoid this problem.
> > > >
> > >
> > > I don't see the code either, but wouldn't this be a use case for
> > > scoped_guard() ?
> >
> > Hi, not explicitly stated in the cover letter, but this is essentially
> > a series on top of the series I sent last year but I did not clean up
> > due to a variety of issues with MSI firmware that would have made the
> > driver unsuitable for upstreaming (to my standards at least). These
> > issues span Intel driver problems, HID controller instability, and
> > varying WMI implementations esp. in regards to PLx setting between AMD
> > / Intel variants, shift mode behavior not acting correctly, and fan
> > curve application / resetting being weird (the fan curve on off bit
> > does not seem to change whether an automatic curve is used but how
> > close the device alings to the set curve? requiring us to back up and
> > restore the original curve? half of the devices keep the curve during
> > sleep and half don't? but if the fan curve is so finicky do we really
> > want a resume handler for it? Perhaps we can kick the timing quirks to
> > userspace)
> >
> > For this reason, I focused on other manufacturers such as Ayaneo and
> > OneXPlayer. I will revisit this series per request from Derek as he
> > seems to want this for steamos and hid-msi is already queued for 7.3?
> > Although, to be honest, compared to the controller firmware issues,
> > the WMI implementation is pristine.
> >
> > So I will need to go through these issues 1 by 1 and see which can be
> > fixed and either drop certain features in the beginning.
> >
> > Particularly for the fan curves, if we say that resume handlers are
> > required to be in the kernel moving forward, I do not know how
> > realistic it is to make those reliable for this WMI device family.
>
> This driver still needs work. I am getting bug reports about
> inconsistent TDP application on the EX. A8 is broken as well. Even
> with your patches Derek. I need to grab a new version of center M and
> see what they are doing.
>
> Does this driver work in your experience? What is that SMT toggle you add=
ed

I've got a few reports of some issues, but nothing with much detail. I
have the 8 AI+, 8 EX AI+, and A8 in hand and all three had effective
TDP changes in SteamOS with these patches applied and SteamOS Manager.
I haven't done extensive testing over multiple suspends or longer
sessions myself. I'm also not aware if there have been BIOS updates
since my testing.

By SMT toggle i think you mean the STAPM toggle for the A8? It was
referenced in API_UserScenario.dll (setPowerLimit_AMDSTAMP) which I
reviewed using ILSpy. After toggling that TDP started reporting
correctly and being settable.

Hope this helps. LMK if you need anything tested or additional info.

Thanks,
Derek
> Antheas
>
> > Best,
> > Antheas
> >
> >
> > > Guenter
> > >
> > > >>
> > > >>                      buffer[0] =3D MSI_PLATFORM_AP_SUBFEATURE_FAN_=
MODE;
> > > >>                      ret =3D msi_wmi_platform_query_unlocked(
> > > >>
> > > >
> > >
> > >
>
