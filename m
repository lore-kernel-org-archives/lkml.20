Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F028D599A24
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889595; cv=pass; b=G6QC6TTu5oFQqmR0OK8kCGTd1jwwFEM5K4fE23n6PHC5iBHC3wtCq2g4qdfyVTkUoVCKFNV5jdHsUCtMvaIBOWb23zr1imuySOJQ+dh6tw+zKodxbGzCh9yEAWB0FKZpqAWGMDbkQ1uQtPGIk1CNLAsa8VGo8m2rvajGvcAccWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889595; c=relaxed/simple;
	bh=zTx949XbmqR6qpQKYtG5ZH3ZNyvLQjleLfr40Xjf4KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyTXngF07GT2VBOKx//wbPh3gKLmK+r3JqpcFNarrYLIuaGB3wcmiHQDBXRHoHpD6JEU/oiJpAWbCOD8Zuk1Jhs27kYm5NqF9pyie01DfWyUKGVdtsgKUh0RJUN2FTFFPm3Jx9VodRWt59X3Yk6REpMWPPDx00CKRGBmqgQGet0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=usOiAwxI; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="usOiAwxI"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97ca74bd6e0so1112690241.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788889591; cv=none;
        d=google.com; s=arc-20260327;
        b=DWYcIBxDby8KP+dnyVMMpTnVPX/T/yx4/bAjxRlFez7s9RU3YctjVJ7fymNmDkT6H5
         OrfVSPGXqdiNzQcGgy/tnlJHhTA0KIaARcP4XlIXWc9Qa6K19/nupusqGGPEOfJWxShd
         SN/7Kqw7fyIKBXeFCy22jzQibD18FujfxPAZgIG6b6qkAOgjTolnn+PCbyeH/Y0t3CKt
         +zhHNV3Luxbipwftf3EGA7QyanqzfV7W9/miXwqSFd7B5qQvP8rUgFkZiZrkeo0ojZiU
         Qi/G+NdKBwBmeSiyIq28q0/KIfyupGMBjzmWWVY81sRiJP2wgFPndadPZuo+SWzf3OGF
         SHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kPCalDfao8jKIEIfhb4jRSIfu+lDsUxUD97zK/Glsx8=;
        fh=5NqdeifqmYDJVBfSVtif1AGmrYkTPbSS2Vk3oQH43T4=;
        b=K6fQtL70f+Tyxg428LJC09gg97iJov3saBKyAmcW2pn8ofO+UwHiUEmE4pkWfPlH5Y
         DapsH1ysqW/vXhskIQH599bUPIMkhmlw6aY1RObnKZDa8BhPjyeKBtwLoHeK9Wpar6oc
         hWT8ZidRsiVo62saSj4WbfAEJGyYNrCZZP9ruI1aRIMeqzf034RTuzHYdYkX06sqzvDJ
         jy0EGm1j4FN8Me37+f/YE9HDpnY51/cGPTMpunFjpdUEp85nymYBOD0jiiVHm5wZHv9m
         s1wvuEQ58ar5KInKe/R3o+pVV1FCVXx9R18mriuPl8ccUnZcQu0idQ9oJ1+mLrhBBlVw
         oHVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788889591; x=1789494391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kPCalDfao8jKIEIfhb4jRSIfu+lDsUxUD97zK/Glsx8=;
        b=usOiAwxIcKVDfxxsI8dHEYGBhs6wsV6REhmyLZq5AdYKr1wmhF0sBkQ0UBHT0+b4Ca
         BybG9G/nreQh6GwQRO+ZzzlWU9hrEx0RmBs10o5tFBOjy2PgOCkbulrr2CvCAi0Ar3NP
         33osY2D9+ZI+ai/c8aeGWf2dk0T/Cp4l7GKWeFCNgTGIGi4Q1g1tSfFaT1XyzanSR2mB
         w8jR1ZQFE2/kpNCbBCWM2dgWnI8uQfh/7b+gU3OdEQUlRhtlyLRG6Oyh5MqqG5Aptvw3
         JmwoaMkSLvLJd2Rtjklxq5unDK3A8wmzs43RchupQsQuFpOljL+VQUbhlXu428uuh+CN
         ct0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889591; x=1789494391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPCalDfao8jKIEIfhb4jRSIfu+lDsUxUD97zK/Glsx8=;
        b=pFQHgZXZwa2MKgyr0EBVxt6H0GX5RbPRQVTqtilkLtAw+RO/xZE+GLTIPwZKzg5I48
         lEKVR2ynJJ2KMx3TBndxmFwVvObXYLjWus3GQGYXsc9c7nLZicKC1/i9QycwkmhGv9PJ
         azi81kQkuV2RdpLzixDTUD0BXlAyTDJ5/M+3vUuTLN3FBsGTYvNdtj1O+6S1bNiN14c9
         Y+2EjfI85zCKbw1GX8sLrW3QSUQT175SdI/nfErbVNMf+5f5ux7bvhrthNXEUDNDAjAc
         JD6YhQiSgN27id02qZOko0W5UlyLFMywQlM25qljGBnmvoXHCsq07jGB6QM5D4t+iWwT
         rOrw==
X-Forwarded-Encrypted: i=1; AKwUvByzGArEEHINUVbCi4AD0sxCIAodu1nWECESfe686/xi91/DV1Hz0nl+m/3qcYE0Vp0SQUT6gdTi4kpZJbE=@vger.kernel.org
X-Gm-Message-State: AFuF++mL1maKl2DM50oSZR3bI6WMpsbjsCvfchdu0Y750G7MTZK/Anzd
	y+mrxUxyDE1gBbj2212pqdcczGC9emxcMKB079O6fcWDCexmVzgKzJCFeWN3lnZOgdNK2jJXKsF
	dy+Gx+LpqrIXxKv98aqTb1my5CjDwt4L57AnXXYg=
X-Gm-Gg: AYBFou1X1hCY8frr2rlu/w0R70sNRqXMBHQaIPlHPolsgLX7QMTsJzwBQ3iCSzHQB8s
	P9lhTznphn4mzGZnRWckzI77wbzACGsBs/0kQiO7AKF7sdO4WNgQ1QU5O/SwPCfrcZOL2c0OUkp
	HmEMx9omcruAfsaimRwVJJsGSEFcxhEvvh2Yya3OBmqdCGGTlhdLNurZ1yEuyCdm2u4GTddFzfv
	suBUPNsxpNBDrE/D+dsoTaovAeLWryWuPxCNv5iT09bCz3cGc18yP64/jVvjVu7qrO9+2m9dTFR
	VLMISAEp3Jucw79tfBQWwW+G96cAlFnFfVxjkAkePUxEXK3LKLar/FwfqDrTij3d6EQF3SbiX2J
	UP/5Amh8mJMc/DDFcixrMkeLQWjEIQ4NZB6bY/Ekc1w==
X-Received: by 2002:a05:6102:5091:b0:78a:8a0:7126 with SMTP id
 ada2fe7eead31-78a4aa97d5bmr10542013137.10.1788889590772; Tue, 08 Sep 2026
 10:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823125155.1136740-1-morbo@google.com> <20260826220041.4075333-1-morbo@google.com>
 <20260826220041.4075333-2-morbo@google.com> <202609041634.6429DB8@keescook>
In-Reply-To: <202609041634.6429DB8@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 8 Sep 2026 10:46:14 -0700
X-Gm-Features: AcwNN1WQOblEmTevCorxNEjZglo0ARJzg9aPL8KCbxvHTHINPMTy-U2-vlpgOf0
Message-ID: <CAGG=3QVSnRON0Qi6ZLhiJk8E8GyQdr+Xf+HKLp1szPVQ__fgsg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] userns: Add KUnit test suite for uid_gid_map
To: Kees Cook <kees@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Christian Brauner <brauner@kernel.org>, 
	Aleksa Sarai <cyphar@cyphar.com>, Jan Kara <jack@suse.cz>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Douglas Anderson <dianders@chromium.org>, Anand Moon <linux.amoon@gmail.com>, 
	Oleg Nesterov <oleg@redhat.com>, codemender-patching+linux@google.com, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:41=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Wed, Aug 26, 2026 at 10:00:35PM +0000, Bill Wendling wrote:
> > Add a KUnit test suite to verify the insertion and sorting of mappings
> > in struct uid_gid_map. This test suite validates both base extent
> > insertion (<=3D 5 mappings) and extended extent insertion (> 5 mappings=
,
> > which triggers the allocation of the forward and reverse pointers).
> >
> > This is especially useful for verifying that the __counted_by_ptr
> > attribute added to 'forward' and 'reverse' pointers works correctly
> > without causing any runtime bounds-checking panics or traps.
> >
> > Assisted-by: Gemini:3.1-pro-preview
> > Signed-off-by: Bill Wendling <morbo@google.com>
>
> Various style nit-picks as dictated by
> Documentation/dev-tools/kunit/style.rst
>
> (We may need to teach Sashiko about KUnit style?)
>
> > kernel/user_namespace_kunit.c | 92 +++++++++++++++++++++++++++++++++++
>
> Like below's naming, this should be named after the suite, and in the
> tests/ subdir (even when #included), so it should be:
> kernel/tests/user_ns_map_kunit.c
>
> > +config USER_NAMESPACE_KUNIT_TEST
>
> The suite and Kconfig should match, so this should be
> USER_NS_MAP_KUNIT_TEST
>
> > +     bool "Test user namespace map insertion" if !KUNIT_ALL_TESTS
> > +     depends on KUNIT=3Dy
> > +     default KUNIT_ALL_TESTS
>
> I think you need a "depends on USER_NS" ?
>
> > +static struct kunit_suite user_ns_map_test_suite =3D {
> > +     .name =3D "user_ns_map",
> > +     .test_cases =3D user_ns_map_test_cases,
> > +};
>
>
"Roger that" for all of the above. I was waiting for more comments
before proceeding, but I think I'll send out the "visibility.h"
version, with the above fixes, so that we have something concrete to
discuss.

-bw
