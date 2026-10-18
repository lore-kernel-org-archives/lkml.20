Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9934941D628
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792360247; cv=pass; b=aGqsUCIaCCFO2VW+CX57eiXn88waMuLl81XMbFuMjkotfvBe+DUcpX+xGhs4IEd2PQUrLw1eLs3CqGH8dpQIN/0SHJko/srEWruOebtkE1nri8YlKD9QYzVhCoI79pOOHEq2DPjcAudknRKKiZ/ckSDTekrgUXGNetdyGE+d4Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792360247; c=relaxed/simple;
	bh=JsApNxqREUvCCfWYG4AGYT7TQ/2LL6l0vjt9rZikPwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWeWpjpUSOKqbbLNtTIoIfp13xJ7OTIr/oMULI/zJVC+tx/iwQZNvDbbQDlvKss7k9EVSvcR09+JyW+x7SjTAPPP2CWU9W2pCHUNR0XvaY7VHJRsUPoZGqPi6VAPW3CCK8q5lzitNHIRYz86TXgfKsOZ4UT7QwJ0H8gorEy6GiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o6ywAr6b; arc=pass smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6ywAr6b"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8ab43af5e97so14374317b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792360245; cv=none;
        d=google.com; s=arc-20260327;
        b=OpO4xg21RSTNJXv5nYW/GwIXm7b0Ei+9MgBjqxhw0bWWJ1PhEjDV+9UiA4l62a6Rm9
         mgGVpi1HpAN0v579FuS2NfeL/0lpkcn435IYNy6En8PEIwLchj0ZudBmyPKta0dlA9s/
         pZt4KqVvGXz1YLQhE9ouGTWJI8N93SXS7AgLw6ylrifxjiOZNTP73TgZgjoHBttx8dwM
         6r4MGIAJGGZq0d05MN0+mQ6oyaF8nHKSUq/GZuo+p78SsdFS+3VEY1ouPYJrJqEh6rdj
         746Ybnoj8es+aSlOnOVL2VNUgdMneIQkCyYmJPMTUUXamz+8J9s86wOP2nQSZ+hX7+qH
         llpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yi4OcEVBleuTF2zelBND0PJXNDFdIaerPT1ALBRVIDA=;
        fh=WDsQ+e08f1r3Clp173gGOCgK3NmHWFxCI+O1/W0wgno=;
        b=S2c8s0P4bkNb3hpAAKaaY0qUp5BgqAdgm1I9U3IcYJbyIJmZl8Ytj+KgglFyyfrLbi
         /2M70NNkaecxTQB53UKKBo4pQsJuVLFpudD7rwsAbk8/bYZevuvEKeVlG4BU2DDrnkPa
         KmylBdpbm41G97T4trsgVz9AFKELuEkTPFS076zmzydMtU6BnYi1OgSUpmAYdTz4YKn3
         YV/nvtECX8wtSiJXFTy+ulqXRWDeNyVPqX75Dg6P05dG+E0EnEY3jFfnEGf/EY9eYiUv
         RrF4qM8LnCm4QDGYlgJblUZLv/agkWUewRvJHS2GrVxNUHaL7Kx75hj4KiGVMAr9E7qE
         YGZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792360245; x=1792965045; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yi4OcEVBleuTF2zelBND0PJXNDFdIaerPT1ALBRVIDA=;
        b=o6ywAr6bBKcGxnHovZwY1obvhUfAELAPHL1XSZ4k8zuwz5XWvWzry/XtxDpz5mvNk+
         rhnVl+6+B+I/0yWzWQ+1Cj3anzCHboxaLCtN2dQF+Epw41zevM7BazZvqkYP6z4xAhhf
         tx4IIGtFcJVKNc30f9qW3u/XZrr180GjcvwDdCANNo52j3GR8kTGeM6FANcm2SzlLrS7
         FrE55G30Y6NRjVorMYzYcGQbZK4DEntN30rVHnXwulWi9KCcC6Msv6vA5Ckhz/lZv1NM
         +L02qdSeM65lnpp+0xumguf/UYge2C+9ibmeGyA4svvgXAVg0mMDWZ7rNuw2MM1feZ0p
         yVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792360245; x=1792965045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yi4OcEVBleuTF2zelBND0PJXNDFdIaerPT1ALBRVIDA=;
        b=kTR+FXacQycB4Ee3qBN5d8wz5ORQEBuXz76jiwyQiN3iZqcF9CJEV72piNa+ygMqdH
         X7mwbpLQZNUVRFwVkIyCPNMfwrq57sljicLyBhUyOBtGOSgyFcrvJ3Sl8qkSkE91cBn6
         s7JlTg5zEfV5vPyuQQSkCrso9WZ80nR/mIpmFLBdwemhZ/t5Nf9aQ3HihZXY+/lefq9+
         pCosWIQmdkzFShyiO/qdDx6q6afsKesapxu7fxqCTpoR1sWuzz9SCU/KpM88rZKvQQ/I
         sToGHnd9OkIrP8T7PwtgpTEaBNB/LhA0wjinCnd5F4n+CfAZTaiv3hr2XQxl1FV7UVSg
         Vz2g==
X-Forwarded-Encrypted: i=1; AKwUvBwxMGoYRf28YXEo1HdYei/VLXBnxvIFIJ/DfWRxuSaVv78OdHfkzcCiopHJc57+he8VOtXPq3aHuCa9l+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXM2BCYx5PgIVIEJVra36xR7Hc1Iwwu5d0LbV9/XBYXXMztb8V
	1tpk2tTu1RREgHKyQ6Ee+2QwefmpUYIRkLjaETslQokoT5adWkZD1Rz8jF50zUrDFcNixT52uUR
	rQ7rKOV0aUp8unuTSTkQzv6eJIgWQDlY=
X-Gm-Gg: AYBFou2qZ/6gR1LotvupP641JdW1Howu5GIJrxVh2rSumC5pyUkEaq8xA4TpxSc6uts
	Wconv68RHMQ6+PCDEwtlU2ZRSxQipfZ3oLVIePUebPIYE/dZgANkjadDzzsz3OPc7YTF42jqHnO
	iiy4cKwuk2m9QdTFs8VH8XShp5w6uTpZT/ZksObziHnVBrFJWqdCnX5YnBxjk/SazCtywG2T/k/
	zJZFxpusO0Yrwyt647hFb50Z5LqluHr93oxU7JUlMIdqbmWm1Zo8cbinArIenVen5GKMnTheT1i
	jBb43TFSe3ZKqJSz2ZL6n0Ci3BNXWNcHBHNinPmMElXauQyCJqzFP9eGm1YpYAJkJfgWGugzpEE
	8bSkYP29EScNmrjgBwKnurdCsjB9OY3knctw8mb439tghJArj6VwEGgAUSuH6likNy23ZG50rNZ
	mwzvSrn3sPsnEcAFiEYWGHGc/xYMj3gRkwxETx4g==
X-Received: by 2002:a05:690c:60c6:b0:8b0:56e6:54ff with SMTP id
 00721157ae682-8b0f20f2b8fmr20435397b3.6.1792360245450; Sun, 18 Oct 2026
 14:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015222735.89251-1-okhuomonajayi54@gmail.com>
 <fcdee571-d94c-a5ae-5ae5-b41977f22073@inria.fr> <2026101653-repeal-deploy-2aa5@gregkh>
In-Reply-To: <2026101653-repeal-deploy-2aa5@gregkh>
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Date: Sun, 18 Oct 2026 22:50:34 +0100
X-Gm-Features: AclHuK-ckhS_4r7IKrzFrVbhZJ4prq24_eCMG7slNkkX4fQeUlsVEZ3ToJ1oygE
Message-ID: <CAFpMFfB4ssJ=YnLeDu16NUXJ2mTWK81+krJ40qzQueHOM4=GhA@mail.gmail.com>
Subject: Re: [PATCH] staging: greybus: add blank lines after struct
 definitions in gbphy.h
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, 
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:54=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Oct 15, 2026 at 10:17:35PM -0400, Julia Lawall wrote:
> >
> >
> > On Thu, 15 Oct 2026, Okhuomon Ajayi wrote:
> >
> > > Add blank lines between the structure definitions and the
> > > to_gbphy_dev() and to_gbphy_driver() macros to improve
> > > readability. This fixes the following checkpatch warning:
> >
> > Thanks for the patch.  But I suspect that the lack of a newline was
> > intentional, to show that the #define is closely associated with the
> > previous structure declaration.
>
> That is correct.
>
> thanks,


Thank you i would drop the patch now
