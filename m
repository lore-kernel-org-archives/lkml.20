Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601581;
	b=jLmJAp2e08EZ0KJrqiOhgirBw0eJAFWH0G2buAsqa1I8UcUq61GN04Kipug7glZ1y/KH
	 dWCcadLzNT0/xhkawMk28MzBfaJ36l5Xwzb5rYvH2dqv70CmHiDJdd1y/+Lt8AWJVxLj6
	 JrTSXzuXLLDPnby5uxDQnpxXbH2cmPskUfZ2CYLL0khMj/lrHU9ShLmFlZUF+iaT5uqAX
	 ycZds0QFzYoVi5mLD/VGED31pVUPDMGxFQMUeRJYz6Hco0QWFAfZ2/Zzeyg9MnDCUc104
	 IW1BSR1Tdi9wGPwX3gplGUUVXKT13sBlOwgvZrLKQ6xNdxTfku0tF/TKM+XUCnFYjDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
	b=OTQ6ngYrYEItrjnQf8O52N5HsH1TINNf3C6xE+G/2up5Pg14AJht/KVeb9FKiL7tZHHj
	 uNw7BRNbynN5hOzqTzGZfuC4o4bWMW7/lR5laLX1i19klFP2/PtOOv2x1s8ewvk41pY5c
	 OdWBc8p/EpFYjmlvfX9gs3JG+vziqe6/2lXW+N14JN2WcOVTX4+ZfHfdKdK//wbKW2lGQ
	 lUE/XcqJ+h5ssp1qW0cZX6w3cAbkp75X1XOMV4psVOGwJDE3NubXFl0MWKlSvLo6IM2iP
	 IVrVZuurrn+LnrAppWGM0CbKSybGnslQP4FJlFxFoxg0+CS+uCACoG5erCUdgjhbX3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAWZhUlj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC3606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DCC3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xAWZhUlj
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-94958650b09so107169385a.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601580; cv=none;
        d=google.com; s=arc-20260327;
        b=rg5pP/oacCgZtktCT1igzSjbyv3ObiQQzyrQuiINQ2lDE7bRqN5A0zM9Yy2f7A2Psh
         Zk1YMV8KaHs6e4Tl5AMs0tGmECRNfdehGAK92gsjze8z2+S0qFpYr3KnFhyeDTWEE769
         DfZFLrtVEadVqwWaWtW3QbjVpjA7Ru01j12+e2QCCtU0ZDORBUXb5ZBIpFjCd9f4Kg2g
         YJzgANG/WBvCkoH1CM89WqU+KII0HJI/U4g5cWLc6rYvrbs//06t6soOAVpdV37A9dUE
         K4T2/FEj0e8YxKMnhzZxXQu8AnXEhZ11W5DE8vUn5WCkExow/kDKeirTui19jNaACFEy
         5QJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
        fh=v+HZw16uSqEe/oEGve8eupeyjnuFdqpyYfFNOP07mF0=;
        b=Kf34xMXHjNSnpTj7WohdfzI+Qssrt1AwYGYiK72QEMzPkSsbt6ieDI8AMu21i10leL
         Ltw6/uN5rPBnwkEtpcRUP4+8Qia5CQPAJ5yUsD7A4pahPv1eTYDCMGyuVIwOqYMrHjDV
         ERhHqKRaHr9nJ4D9HIMXso2gRZ03rumxxnqIK8lQ+dgyXHjPZPDz8/wgjD71kjWp8mo/
         SWQiKWJTzvKZytls5cVPBbCNhwxcnc2kdiM56c/62XJlZrq/GCaKpBV6hiZF59ZHV5fY
         OUS/ZosXVMELFVyiK0kQsbs04Hc/pcnLSo83tntdN9wzKKzaW52TfQFrWppm+XlFHvcw
         HXtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601580; x=1795206380; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
        b=xAWZhUljpSj4GwEG5edXxo6lINEjsx85vjIUzWJhw/LQW+vjQFg+VQZpnvBlLnAT0K
         7t3cmzjH5jUHNzUfWx4PDsIwPZpYxYCA5w1os/pb5TNthu8XeIB0xjgf3B7ZhI5ReVH2
         bOPigVWTzSjcjbnh/6w2cBFJIdF+tp64QXr9nPDhy/rhIAYlpzNo7oc0HRCGEzg86v3/
         qxB+Te0DMVATtMQzWt/dJ71BmmiA0GOF072vtHmRm6ujw/2T9eyf8mKPT9EZt4wDhW82
         /61/dguUNKOHnb5rEdnRfzzyumKudLkEaH90yzaKusaIQYnQzBQC7awjusAsdK9kcM3z
         7nmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601580; x=1795206380;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmaNayS+Wbe5Uay0lJ3vEuq20YAhkZy/1G9M7ssRoVg=;
        b=lu3nzSvAQW5LHoz3FdUqdtcjCubTITt9BO428XOuhfBG0fQfWmQ1naIzM1yTCTSipk
         Gof6kUYOGBxLrVOS3slEJFkbr9szFT/kkfYiwyp+xZFOeZJjgJMbWahqFYPYiHS83DTl
         zhxFK8nCe6i9X+0U40idKXA8o8PqFDpXiqz+tdlt3fIOyaw56F0wS3Gp64NFkhiiisVm
         r/L1u3IQhC8ufNAmXdG2SjHg2yFP66XW7K1uB8AuEo0NYAd9rwyd1T1eIIqEPmPXM95E
         VT+3ROhO1wsgH3upokJsgIg+OuFRWxsCq7wKGHLfbz8Ma0Uo7stOYOyMi4EeEKNPLiGi
         468Q==
X-Forwarded-Encrypted: i=1; AL+hErH+4uGtdETec4TKLdDfu+dFMa6QFCpPKCv9oQpJXICTYCALZG7kJvSKTSJNsL9eS/s6T9RsR29jsPLJ4og=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Sasm91N4PDQaLRSWwszDwY0RF/XlcrJ2sP2Ez0OVY3S/x+x0+
	x2jtC79+/G4rltYUQKFxRJ4ox3rKdOfWtGaWr+D6xEJ1Prgj6Mma/Ih1gSq2hPefo32yb/2Zvbm
	hsQbvXLFxY6+JXCwuH30bBfMZLF4rDx4=
X-Gm-Gg: AYBFou29nm/f+U9vOn2EcrOFAi4lxMLjuHI7TOuaTdPowoSfo0nRjjXsONySBpW5uGP
	JNNtzUePJdikHZfCDbibFjVy8+C+TWBxWIudzOuJk76f3lAVwSMjIWJvOb8dmpdBfN8CrU2CA1M
	PCndS8vYv0PTLXfJVGEDt//no2u+WiusAeAAtzrowpOVOcqMBJg4pB8fWo1dRu3Da6St8bL9gW4
	dBr6KgsGZOf0V7WnDOvqoZdOuOsvPhxAvgu+TTpxAZGSsggEG9hFnMavB1Z6GTDkPOJ5zvuUxuc
	W4arnEeG7mugZn4RCdu7oX11IUbvqXALBZl7lCk7dGEq+5yeQRMZg5Ggr9FH6Mm5nqfArlwMmQe
	HFlPMOQfB7s3JZVbPvSFZclNThoYaoh7lagDv
X-Received: by 2002:a05:620a:450b:b0:93c:5f3c:f485 with SMTP id
 af79cd13be357-9494bc63eabmr628029685a.53.1794601580206; Fri, 13 Nov 2026
 12:26:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028155005.174417-1-mbkchelofficialdev@gmail.com> <CA+YDrKBAPZ9MHB46wVSsD4Vd-R8L1Kkz=Vp-F32+WyfJ5FDaoQ@mail.gmail.com>
In-Reply-To: <CA+YDrKBAPZ9MHB46wVSsD4Vd-R8L1Kkz=Vp-F32+WyfJ5FDaoQ@mail.gmail.com>
From: MBKCHEL <mbkchelofficialdev@gmail.com>
Date: Fri, 13 Nov 2026 22:26:08 +0200
X-Gm-Features: AclHuK-nt_pkf71fgXmv9aasF6EhY7Hz67dSrcbsHeSkY4RsXRic0A5k2swbL1c
Message-ID: <CA+YDrKDyME4fAYMCRvz2Nau78nKJp1H8W4C0yLFp550GwRjvSw@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: document emit_base in ModInfoBuilder
To: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Friendly ping on this patch.

Thanks,
Ivan

=D1=87=D1=82, 29 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 15:33, MBK=
CHEL <mbkchelofficialdev@gmail.com>:
>
> Hi,
>
> Please note that I made a typo in my last name in the "From" and
> "Signed-off-by" lines. My correct name is "Ivan Tverdokhleb".
>
> If the patch is accepted, could you please apply it with the corrected na=
me?
>
> Thanks,
> Ivan
>
> =D1=81=D1=80, 28 =D0=BE=D0=BA=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 17:50, I=
van Tverdohleb <mbkchelofficialdev@gmail.com>:
> >
> > Add documentation for the emit_base method within the ModInfoBuilder
> > struct. Explain its role in formatting metadata strings, handling the
> > differentiation between built-in and loadable modules, and managing
> > linker sections and conditional compilation.
> >
> > Signed-off-by: Ivan Tverdohleb <mbkchelofficialdev@gmail.com>
> > ---
> >  rust/macros/module.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/macros/module.rs b/rust/macros/module.rs
> > index 0a7b9e24c..6f361013f 100644
> > --- a/rust/macros/module.rs
> > +++ b/rust/macros/module.rs
> > @@ -49,6 +49,16 @@ fn new(module: &'a str) -> Self {
> >          }
> >      }
> >
> > +    /// Emits a single metadata entry into the module information tabl=
e.
> > +    ///
> > +    /// This method formats a `field=3Dcontent\0` byte string and plac=
es it into the
> > +    /// `.modinfo` linker section. For built-in modules (`builtin =3D=
=3D true`), the string
> > +    /// is prefixed with the module name (`module.field=3Dcontent\0`) =
to avoid naming
> > +    /// collisions in the final monolithic kernel binary.
> > +    ///
> > +    /// It automatically generates a unique static identifier using an=
 internal counter
> > +    /// and applies appropriate conditional compilation attributes (`#=
[cfg(MODULE)]` or
> > +    /// `#[cfg(not(MODULE))]`) based on the target type.
> >      fn emit_base(&mut self, field: &str, content: &str, builtin: bool,=
 param: bool) {
> >          let string =3D if builtin {
> >              // Built-in modules prefix their modinfo strings by `modul=
e.`.
> > --
> > 2.56.0
> >
