Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1703F4DC7
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792103369; cv=pass; b=nUbi+13m+jwbxCZGK/JRAZ6B2A/ZxtW6cvAZl80GLjw//htYwsLWTjmvUIe3zRYsEOtNsMsL8n5mVw/lyTDOkEDo6EsA1bnXFtkbGoBhKiAJ9LJjT1SPf4mSTNYSfeeiJ2CguzVxYPS7eNGEQ169pyAnKL4Gb2QErlNgAJ7ZI6Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792103369; c=relaxed/simple;
	bh=AXRRS22uutXkOu3guPUe2GbkmsWxR1BXKHyZbsJzLy4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWT562wexlkLOLVi/xKODlDntsalpRiKfavLz3sM4IHi86jgl0yEZBQoijd4J0SeZOjtkAedGjulrwzZJx9pjAyMsZNbprljsJr1+jKOKsr3W3jmFUcJEh/jDOA8uJYIyLpOnz0DpWSa/4HxyUo2msgImt8dSNQrd3ZE+5lErR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NRVAjXEt; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NRVAjXEt"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535f598d126so53561cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792103367; cv=none;
        d=google.com; s=arc-20260327;
        b=rFs+mJDjA4MP1sptV/5CRC2x5xZiYkdthxeldeHmKrbAC2i5tphcOeDPKVP2dGViD1
         t3v45HRC+g5D/Tb/8VzojwKwe+pk9GzIgih+1p3zQoL/pQzmrrN16KEaGzGsOukik4Cn
         4LkGWJ1Qpb1Pb+DvLwzH/t5DMWRHIYQlZHcAfJgndb9LrC2ezrKxK1bGE8CNoQgKuteK
         bmwhMxQr3EW3QKopU3x99zM1eCLpWmeaCslUYvaDoCAKIfOy0JdrxyBtc92Yu7J2KqRw
         rUBGdpQA8Ca2/BniUmcWgb845u1R3XXiAV4wdSk9lLCDB870gT5XzKJDyIfS50s8yYJ2
         1kHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fx0meqXkpmqmZ+T0ZUXv6LFbVHDOrz59U8bjk3O4KlE=;
        fh=dezZwRKMM2I4XL1aOuyabO+bvFDN2BzI37E1KpIy9RQ=;
        b=OmtQ35JADYAm81ml9ZRTK/bsksHO4UdYpb+e3nUsFXZYbYQGsyeYANWA68ben8ZQ/Q
         Vjy47M88I/gUSu5iwUuR7V76JWdBjZjTknLbz03bChknuQxkX4FcTiTNspC3J9au5/DN
         fQDsd2uaKrb5XZaBqtuwaWVosKXgaR1UU6TxxloqIP+36hsLAzz9PUzrazeI9hOJuPO7
         x85OeH6vKG5ny/5Gr3PF74vb4UZif3lACmqVO8sLPG6NYnfYXLIT2eynb7wjPAfAL7Ma
         EqIccqZ3eIqSbbIzHnM3Nwncb1gnoIxieD/0b0H5ANZp0PSgNspI1WjwfP0FsZjifa1K
         VMmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792103367; x=1792708167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fx0meqXkpmqmZ+T0ZUXv6LFbVHDOrz59U8bjk3O4KlE=;
        b=NRVAjXEt20dCgTC1AdDpGbOXmNtHTqK3ykULgg9QQmKY3yCKHMT8KPw2ao7Ln27DBR
         Usl+Y3wt2Y7k8Z8uCzEoetaxmOLL0n+g8rrjsfVsJKFzRVYCxZIDLHRTnMkNJtSydYxt
         fCESTcbCsNXnZ92hd1VUi5dPtA1i8Fz0vcM9tsGzkJ/HKu/4gr7IElT9ybmcdhSFirj8
         s6Tx+j3LWwMODjwNeKBx2JLnVi3H7JT2FacHoYXd5/jwj8tQyrm5tYxTvrNrs1jFekNI
         hpHBcfHiXfMf5jqLLoT8gAmtkjsXSHJFXTQWtLz9Mut6QpoYOieEhcyn9fBoN6juG3oL
         zNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792103367; x=1792708167;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fx0meqXkpmqmZ+T0ZUXv6LFbVHDOrz59U8bjk3O4KlE=;
        b=rDKGhyJ57o/HQJByqfje54AwIaaOswWcv04T9/EtqVgTZGSMIKDBWocKx+kPVDz+Sh
         CuDhjYyFj4bCmaxKKhMsaAUn6aCJOCVdCytsu82Xypc1s3qjesvMGTgQyvUNFHLiDzGE
         lyLkWdi1xVzFGBASkXmxZDAAHATqHHm2Im0LepkAw+86QJTPS97w1cx3RUulrcwdm5A5
         0D0WjAUKblGRYgLsuemtf42HEvf9F/VDj6GnNPnqmiuoK8kiChIFq52/K7+kBDvHngTP
         PEDc+h+NqyExwp3lpt5wXsaVsnzxwo6rbKrDfyWjkeOMqoH6++yxYZtHeuOAGH0CDnXn
         WSkQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFWulpqzurHdjVWX18ytYqC6CXSNerqIDvom5RBWOBiZdMK1Nb4Ab4+YnmOutuaVZCEgbnkoHUsp7STPI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2sRo0yGHX/UTpGEOJ8JT5fNSW1U4DHPj1BWc/Jfao+d3RRPjE
	fr3+Dcqd9N5JJDlwxl7DuZUTO0NXcvdD3xkk5xP2LlO0n/upvlDfCNDe6w6nS3NIIP1LQ/cvgVf
	zYbkkQZU/uGtboqZnFWPN/xhjbuSI/B3saG0Zd6Jl
X-Gm-Gg: AYBFou3gHZzLjM6d2Xm24F2IJQ24CxKFJM4K9Oa6PTEyvtvTrgfjOOzY4jaHWDMqhfG
	8AW9WbUIknCdLbo6nphOUAOkvwnA5ISW4/90QN9LKpiOc5jBLHUylHJeUqRh3lXol5RFU37m4k+
	Pa6113Ymz/vPd244vb3reFU77Kd7u6jrliv5JLL5WA1p/WbDoTwemgcdJpaKpQttgyYSJQQzAym
	F4qmfVf1CZdY1N5mYBvhCM9XMNeHHf5dMt6TxSAOEsMAXOzbkLImaRUltcitv7XNgScRxzxnjOO
	nVQRY6Kn5OUJ8vJ/n3XIB1dJg7Jsr8Rzi7FR08+TZ1eWJIXSfYzxUmjrK8jHZ62/gfHJQZwsx6m
	Pehs69zXCtA==
X-Received: by 2002:a05:622a:1a89:b0:535:30a:76c7 with SMTP id
 d75a77b69052e-536297d3336mr5010261cf.3.1792103366183; Thu, 15 Oct 2026
 15:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014225811.i.852-kees@kernel.org> <20261014225818.3457479-2-kees@kernel.org>
 <2026101517-profane-opponent-4523@gregkh> <CANiq72m_iyquf4Lc8AWvbsBp++ASz4+C_MQ5iYQW-fHd_MNDxA@mail.gmail.com>
 <C46E97AC-3722-4264-B541-04EBC3091E00@kernel.org> <2026101532-fantastic-deafness-e04c@gregkh>
 <CANiq72=wS5NJyeKKaYiHKWhDq2Wjk728qkCUNq4xVoHrPEPCRw@mail.gmail.com> <2026101515-oversleep-related-e4dd@gregkh>
In-Reply-To: <2026101515-oversleep-related-e4dd@gregkh>
From: Ian Rogers <irogers@google.com>
Date: Thu, 15 Oct 2026 15:29:13 -0700
X-Gm-Features: AclHuK_bhqpBXC-6cMMrPjeFLsPs6nuRXrMV9IFwDJ4QNHEyGqQj-Q86H0SV0Zk
Message-ID: <CAP-5=fX72cGXtOVYFK0Fr-XMWtr5nfmdr0y3dwVeUcuAueW3Xg@mail.gmail.com>
Subject: Re: [PATCH 2/2] seq_file: Require explicit initialization of struct seq_operations
To: Greg KH <greg@kroah.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-fsdevel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 1:50=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> On Thu, Oct 15, 2026 at 09:47:34AM +0200, Miguel Ojeda wrote:
> > On Thu, Oct 15, 2026 at 9:11=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
> > >
> > > __must_init might be smaller?
> >
> > That sounds fine too. I like that it says that something *has* to be
> > done (like the original name did). Hmm... On the other hand, I guess
> > "must" could sound like one has to initialize the field "somehow",
> > i.e. writing:
> >
> >   struct S s =3D {};
> >
> > definitely initializes it, yet the compiler would warn. Would
> > "explicit" hint a bit more at the fact that one has to actually
> > "write" the field, even if it may have been initialized anyway?
>
> "explicit" is a description, "must" is an action that tells the reader
> what they have to do, so maybe "must" is better?
>
> Anyway, I don't care, naming is hard, either is fine with me, I'll let
> the authors of the patch here pick what they want :)

Fwiw, I like __must_init for being both short and intention revealing.
I'll hold off sending my v2 for kobject::release to avoid renaming the
attribute.

Thanks,
Ian
