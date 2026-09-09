Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3193033D6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978661; cv=none; b=XH7f9zTYkt7CQT5ahEP+u4lFajyvQxzevbPoY40gLUUE55A1i/kUfrUDRQwjQh0rqP9CadcgWs2TnCtJCmlX3SJIfAs3H/PJgZXi06HVj1GIXTl3o9D3Rw9920Z4aNVNJbYKR/DEKmNQOMGJpmh0zfQP9DsUd88TJ4kD9HISKso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978661; c=relaxed/simple;
	bh=tYk8UUa/ZgTqD0CT9vVm0TZ2uXiT2KxkmRqOOXowsYQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FOH/4afMtLebXHbknvAyYvM6kUHdCAnQBvYllZsdXatHGFtiCQMtsy/lt0NGzovoaiBXhsA/w4F68UG5/KnqPsXnonegiHFwXEpjzX8fRBdXwR/yymz4bTce80sw8oY2fFgFbPwSrL2dkefbVjxYZumxsAWyY7uHZ9Ra+hF7ztY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGgQnoVc; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGgQnoVc"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4c18e5e9745so266018b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788978659; x=1789583459; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ZORYc3+x0OjlYW5Oa+mInYkoWpL4Uoxgu6dqAXL3dY=;
        b=XGgQnoVcoCfWDQc6aCbVg67EYB5KGcGPCFDJ9kzqVwCaRPV/iHchxdKd5z+p8CKJef
         /n5AVVK0mwyu5zTjOGFwsowJvzwa2Tg2UcqUTaLeTf7JCU+a8g6zvvSJX+fiSMrVM4D6
         r4PUTzZnttRrCHbpR4ORFAeyXhoFX1GbJ2oSNvABH4Dex667ab80wu57ie0Ga2WVz6Ib
         +BR3egxS218H1wEpLtebmZvAk+cHfEWFEXxi8KFIye6q+xFOhld6rgdLFfW1Jrq+sH73
         AFg/s4mE+BTG5FIbAZ64Vis63KK1mKJXu8j2tJ8IgwhRjL+kK8VjIt4+5gEdtJxJwpZE
         HtjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978659; x=1789583459;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZORYc3+x0OjlYW5Oa+mInYkoWpL4Uoxgu6dqAXL3dY=;
        b=ouiofTCNn00Wfblo8SvUowLc4lMODl2pQXsshsB7DkDcxN7VoZ3YSrtrKy6vyTpThn
         9NF4XNTX1eKKlM/T/bXBZUVXEjr+bql2UONuW+4nImwwiIDyQf5dCkbAtqrg6plDrhuM
         1Mikmodo3CPltOPj2seetlVAmJ34Dv/5sn6EIisl0iAyH5HByRebQ8VYKxCZQa6rHkxC
         4xw7Ov+zcRXOTSigGmrmBuJepxoNc9gUlWEeIu6rDDvPaECbPv4nWGrYiWssepnk0V7Y
         lwKO4gmc2RjzvjppSD8w8gYO+SzlvRG5SbLMB2WJlxA2IT+a8ypFAZpfmJJhh/wT+Eef
         JfHA==
X-Forwarded-Encrypted: i=1; AKwUvBzTGzFDipGzXfwFeYlmDR8IhMbsd9nqoh0QTFXaTjHr/rEwP1QYfNcyD6SUyHodYJbM9/K7iiadZJRVALU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7OmcCi4wDjTfX06I+JWCN2iqnoixcQ5tqhKG6V/fdb0TFP6+W
	QUXRr8eK+K94XTycqe55mFwLWUWo4EAvl3aV9wfyCpyrK//oDWUzlhYE
X-Gm-Gg: AYBFou1Yq/8v10EhfgnF5x808pw4FtukTnNr7fjYk9I1B8b7NATnUEwi1s77Sp0CmiC
	kN1/jTR4Re7pHIOJS2Jewx4+Un5t9jGx7yWPXXMruEuzVrj22yv5Sn7bMW8t43kMGthWtEjHbQw
	S24lvHaVD2r2Jt9LbQmFQ0OiSuMBCgeRaUTsXs/QiZ3J6U9uxpEo0x67MAYy9Ir3Ky0y6294Wef
	WFxpKfc6KbzKDfrFYrgV0A/K5XksJkfjd7TrJg70QET/VHISBtlSiYz0+pXr844pl+J02PA+x4O
	hQfNf6nRvSET44Oh+vIjkfXo4G5zwzRX3nbTEQERRiA4Ba6w10UDrbUw/X8HWfEAePRCFujqSev
	9v/WadS6xm/3zqOhsZZYhk+OcUBHiAmpg6B4mdXkpcbBJf+xQ2iHEG+e+epOCNNYST8qh75iHDz
	cHULAiWWMVC7UNVImvOR8WxbDyeWE92b5Lu2vcsrF9uJ5sWnyIemU1y/UqCn2hIPrKftpbLTpRx
	YY37Y0IMb/gtMuYwG8Iltez
X-Received: by 2002:a05:6808:23c4:b0:49b:33c8:4b75 with SMTP id 5614622812f47-4b95f22f676mr27469940b6e.5.1788978658886;
        Wed, 09 Sep 2026 11:30:58 -0700 (PDT)
Received: from smtpclient.apple ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b96eaa508asm17622378b6e.1.2026.09.09.11.30.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:30:58 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in HalBtc8723b2Ant.c
From: Fahmy Hassan <fahmymohammed@gmail.com>
In-Reply-To: <CAChV6vw0-6ZjfPCgjQ46mfEpnnJd51EGW-Dt1Wc8SWMkh+AwAg@mail.gmail.com>
Date: Wed, 9 Sep 2026 12:30:45 -0600
Cc: gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <51BC5B0F-E643-44ED-A44E-DE275DBFBE63@gmail.com>
References: <20260908025910.155625-1-fahmymohammed@gmail.com>
 <20260909123648.174428-1-b9788213@gmail.com>
 <CAChV6vw0-6ZjfPCgjQ46mfEpnnJd51EGW-Dt1Wc8SWMkh+AwAg@mail.gmail.com>
To: b9788213@gmail.com
X-Mailer: Apple Mail (2.3901.100.1.1.11)

Hi Bera,

Thanks for the suggestion, that makes sense. I will include that change =
in the next version of the patch.
Apologies for any garbled emails; I=E2=80=99m still learning this =
format.=20

Best,
Fahmy




Fahmy Hassan | C# Backend Engineer


Sent from MacOS
Please consider the environment before printing this e-mail



> On Sep 9, 2026, at 9:17=E2=80=AFAM, Fahmy Hassan =
<fahmymohammed@gmail.com> wrote:
>=20
> Hi Bera,
>=20
> Thanks for the suggestion, that makes sense. I will include that =
change in the next version of the patch.
>=20
> Best,
> Fahmy
>=20
>=20
>=20
> On Wed, Sep 9, 2026 at 6:36=E2=80=AFAM <b9788213@gmail.com> wrote:
> On Mon 7 Sep 2026 20:57:57 -0600, Fahmy Hassan wrote:
> > Address checkpatch.pl warnings listed in the driver's TODO file:
> > remove braces around single-statement if/else arms, wrap function
> > calls that exceed the 100 column limit, and move trailing comments
> > that pushed lines over the limit onto their own line above the
> > statement they document.
>=20
> ...
>=20
> > -                             if (bBtHsOn) {
> > -                             } else {
> > +                             if (bBtHsOn)
> > +                                     ;
> > +                             else
> >                                       algorithm =3D =
BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
> > -                             }
>=20
> You can use something like
>=20
> if (!bBtHsOn)
>         algorithm =3D BT_8723B_2ANT_COEX_ALGO_PANEDR_HID;
>=20
> Thanks,
> Bera

