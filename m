Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793989034;
	b=RhlNbEZaLr052xBjFQOEA/4LVWxlidBtL+vePfw2DiI+gktWJwbJxRt6KwJYbSGGYchM
	 I7Xdo1uMGZrqS4n8iornVsRK076J4UVFBX6JaQ0WH/5NmCTRLk2TNGZwmic+StVfaU4iN
	 tA5CCoqfH0TSOSHmT4ecU1ZfpdaN+bw9eNZD457MB1AjwzZUVjibTQ+v83JhHACzJUZmw
	 +Y5xrGF+LnLtmMZPq0oL03PMdZcHHX1qb+JH4odQl0hl6RNiritolCl8Y3hCPsuJECa5D
	 1g1asYjnY6M7fdMdEAcfOT4qloBZxW98b/sVkWJk3LUG0bALGWNJogq0n9ff/qefFbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
	b=PcUtvVqSOnTiGEIR8ZGEj+tWDp+g2OSNLYYOBgbb5E/PsWu0N4ZRPjPVUg+5+xZt4zy1
	 bZZu+qMHn0KaRjL7uw3/gyk6DqB+ARaK0vG4GpkjplMA5vnAVAvA04KNW+b+FsNPmhybu
	 j0sORAJcttdVglJeXgMUHwyxqHnJDbwaH5rVhulwYkHehpWJzg6T7kD8RlKMSmXLPiSaU
	 QrHTQepb0ETGajoXuj9qrYTBgAKUQ9j7/MFw8G8vPkP927T8nsjXzedacAf8Uf82wKdq3
	 JPUtMe3svZ2kh0P0F/A1uv+F2u9O3jib+Pb+erlB2D5iW2aS6ws7W3TaJ1DJi6sMwBw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dv+v6Zg9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C87606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20C87606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Dv+v6Zg9
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49134c8509fso840302f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:17:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793989032; cv=none;
        d=google.com; s=arc-20260327;
        b=limVs2KkfgpRfaC+xbHAxVWp6B3sJjSRsYfTPk67guTegn+4cyQ4161phej/FMjPTK
         Fph6QF5w2JAx+YIrw/fbN1mQwf2k3RlbDMV01qhpIxHCOp05pcYIM9sshatge1tT8LpB
         B5Qf3mgs6cslZ6DxJVGv11Jw/jm4b+jRPJU83SDyrHEJ93vBVREi43k/oDXyM23w6PS2
         T/2B4HJnAk/ELPcvLYWvzoHXGW7dU70sGXA5uDLA0obWvz0K8wrL2z+PmjNsP5bVV5sF
         XOP+6aJQ6GI9DgyPtBCUBT4xbAjGqa7PMCtSh+v86RyC+l/disnFr+f/q+Il2LJLDPf0
         tULA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        fh=ts3bJDVriHdeqSGpUmQQMS0ybmmZjDEDb+YLIIaYu5Y=;
        b=DUkFB4L13rbrDDvqz/w+kzsKmSS9zvqb1oNmww4aDa1Y6kBG40ZsGrTWOZMAcbOiqz
         6A9TyaxjTQQcX39+JytSlwcUzgUD8Goub4ulKeybl1bfL+PoU+iI1Nvlx72yxy1d9Ynn
         5N9FolE3sOLkM9cAc7NO7QvPORc3KrBRuFoPKAF+KJ69jSvMla2EjIZz2SB7goaKAYi9
         pmFyawoahZL4hUFo2Drj5rYaX9BfL+mpvC+K9LQ+7rG4OWL3WBeDn0mLWbc7mfRlW/Y7
         nu4V+MGBKmIfL2VxvpXY+mltPp2Fcc4xXogdyxYbppETMJsGOmza6X5gvKE79l3wnNfU
         t+2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989032; x=1794593832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        b=Dv+v6Zg99UqcGdUbBKIP2EUBV/hqcwAN+w/VtCw6nSc1ol7nBmVa87Yz27QCn8Z1hj
         VMhyEjyvCJqw01Mb1VwcqwPLFlHTN849J6pS/XVmqKAt5Yg0qOadOWN6djYCQMCsFtYr
         S+LjhNcFZ5pOiMllseM5lYHHJuHYAeCt5LhuVhh9hycajomSzlr/GeTGmbmVZe9E/k1G
         honjrTkqHAx3UUKSmNxHaQ3vJaQzW7i0k4gILWLcLxPOXBK4ZWUGmJSjK93SpOYn1WPg
         taW+nhs9O0pDWuur28yxFYrBQSGx2mmtXbSD388n9obfFaCPUmD0Eg0sAT7x+nxSayTy
         N35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989032; x=1794593832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iO2JEAydHDgBReyWjoaKwK3iFfajRHjkVPraMabJC1Y=;
        b=DVxkJXE4aB7POnj/KMzCQ9t6A+TrocGp5mWGMJ8Utc0l+TXsoo2FWPMo5kYhVD5bQB
         xI253TYeB47GxJkK+nyPawUudJUycGHq0iZTStJ8Px+sSjp0ENhTNMzhhh+sOH5YBv9t
         6qZgsrO939O2JaA4uS3O+5RbcYxRxf9veogJ5qgSPNeZ+eutGkxAMAMy0aOQQI5P8xey
         7UUcHrA/t5+UIO05r2VznaKrvbJYelMhRpLz4Uo4nZo4Hq5kfNWLYt4o0JRVYxKecr30
         B5ETcGVWgdrrF+I8DHEDMyxaM/2SoyeFXhqQKqazIDQLNXca3GTg5jGEhGts7CaqJDry
         waCQ==
X-Forwarded-Encrypted: i=1; AL+hErH+O+nbmn8Fmmw02IqROfeQTRLFZvzTRxiazWQ0FfBtZQN7nR2WweKT2UoV5IGkH7DQ+Zx3UG+lN9e0XW8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hWCzpLzQNAylcim3xl9lsP+KcYqSrdipNQpMxqclFP9Cw2J6w
	4YD2zJTTYoWmm7KrKAE6GnQ1Wvjho16XZPZkxAbWI1HdmdmRU33KdHPk/DDkjj70o7dc6u/1dts
	ifTOBoWOx474Mmrd7JICNCx1O2XhFN4EbMULqpe3N
X-Gm-Gg: AYBFou0CSQRsUpFB9dej+6emnCtoWBixe8VscNhkcG/d2NiKSlW1bbQ9TX2+YTapDiU
	Xvsptg+RUjqgluv4xsgFnsBkhUR7bGASceb+Ds5L54IIM0OttoQyH/wzhjT9j6EQ/snLSly/24F
	uIfS8oRxlc+CSaQaTMArrZSG/19pBt+CohampJraA2Ust9re77z3zzg1LSvS7/E7pzU/+MoBaWR
	xJAgtn6eGHhaW8qU6fEqsP/Po14HyjxsvvRLHf/qPZ+e+S9X7t0pLT4zPGWJB7wgUni3hVClM+i
	RDgJXQa7QAeOs9lkERbmt1bVN7H5VQAV6tPROphRCKZ6gBqp18IXGFKxsIYo8NTrOzfsc8GP6DU
	W55poTbjiWOvl9W86Xp4YzhgEPoQf78KXpMkSM87pwwfWzkjf8ij/kkuU6E+Gc3+CpaSnzG/8mV
	72o9koJKt/LGC6/rUmkvbkyXMXGnJbrsc8QaLuywDO26j7IR6JtUH2XLnqVUsABtGVpTEE7XvEx
	keT5FRUuFPJeEMqnc7/N3qMjLBxn3gZhHJjDdiAM2ee34AI+bx+oYGEPTA=
X-Received: by 2002:a05:6000:2892:b0:48d:c186:dcc6 with SMTP id
 ffacd0b85a97d-492777dbb54mr6867359f8f.57.1793989031973; Fri, 06 Nov 2026
 10:17:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
 <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com> <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
In-Reply-To: <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 6 Nov 2026 10:17:00 -0800
X-Gm-Features: AclHuK9SWyCEYtuJGMl-fJhTBaGxGHpWXefZx7LtX8R0YzDCJePA2Pf99_IEKbE
Message-ID: <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Rong Xu <xur@google.com>, Doug Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Han Wang <nesthanwang@google.com>, Snehasish Kumar <snehasishk@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> As far as I know, Profi is enabled in the Clang front-end initially. I
> remember reviewing a patch that enabled Profi for the Rust front-end,
> though it's possible that has already been merged.
>
> It seems strange that these flags diverge between C and Rust. Could we
> add a comment to indicate that Profi is currently not enabled in Rust?
>
> Rong
>
> On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > Just one thing: I think we should also have this flag for Rust so Rus=
t
> > > and c are consistent.
> >
> > Please see the commit message, which says:
> >
> > > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes becaus=
e
> > > SampleProfileUseProfi remains false by default in the LLVM backend an=
d
> > > is only enabled by the Clang driver.
> >
> > Is that incorrect?

Probably better to be explicit, rather than rely on the implicit
default value, which sounds like it may be changing over time.

> >
> > -Doug



--=20
Thanks,
~Nick Desaulniers
