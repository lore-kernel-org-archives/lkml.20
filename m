Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6956C3C9888
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929254; cv=pass; b=TOHwnykI/7LteFc+RH64aZVdFj5kYCiUC1iWBBeAvpBg8owHlw9ibcHFfEeFS2uPZkx1lic4HUXBhHPlL8VCatfNHtAKlOTbvvozFR9+yfhKyhwyWWtIyUP6SWxKDOiUHBCxPgtYetAcNSILTTxhfRtrztPBGX4H7565tFmxmeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929254; c=relaxed/simple;
	bh=SQV2oiqKeznGQCDrUMB6LypdK9wv6yvcWGpy0dftZ94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IpwmSRfh+SS7FcA+71gkkjbYe6DhXAeFKpeYbw9jANJpF2M99F5t5/KGZPUCivxZTplibCTq54vsF5malzgWI7sJTb0H8Knuztibr/laJqASf6dAs8kvjltPDx43HCBTQoJ7afdxM3P+OZ605vZSkmd20xeEB882KjGc1Zop9Dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in; spf=pass smtp.mailfrom=thechris.in; dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b=Sj07iJpt; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thechris.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thechris.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thechris.in header.i=@thechris.in header.b="Sj07iJpt"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d43daa8f4so14249927b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:34:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789929252; cv=none;
        d=google.com; s=arc-20260327;
        b=BuK3V5acYyaR9hVLuurBgJxdzPKT9S3RG+fuVkm/jx8gXHZwedIYEAc22af0oZDph4
         6PwZzEdb2UQHf98S5GzQLi8D5GKMHjBGiXl6qQI0qvOoCn9ccXyPpcLKWgjU1A3/sGOb
         RX2YXijSOA8xUXro15/ogbNO9skNqu8iLP+kfaunFelgDdAu2TM/axmp1Mwh+KD0+m2l
         4C8bxyTeneA3ZN0y2GZzKMkUKyAPfVcLuzyS56czNl9EkGauM5RDO9O8fX16iw4HBb0l
         8zeXZ6B8IHC4RpgE/qhPmxy1mRLrmVgLuEfslw6tfk4U3zraN1+M1cXLEGizmJeJVqai
         1COQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        fh=lp8wwDyJwmAI9IAfk4Q0aehL8MPEI2Ku6opN8K4dnIk=;
        b=jjr6PLpjqvjtruQELy3RBwOiBOG4CGa305yVbA9jI5G7UdMYIM99/TS9X8VGHu04wq
         tSzzyJIWDudSXwyXsPL5m0CVhQVDg1bfhaAOfuUcbGtVnX9yLM1SOPP6VVqqF4R1xJo5
         l9SkVn+tk2HOS9fj464eZT2LFZGmx7KsWHRWJ2xrn+iarxMm4uKA1sayXbmSLf6/snv2
         sndP1ItY5ZR3DszwGi9jyo2xn0APFxnxRHUvZQ4d4Dm0kb4iNFHr2O+zo5050cicoej1
         eLnthPUvJkALmaznjK3C7alO2skMA5egeI09xqh7KZuRi7LTHe04g6cDpGpYFzuYnH+u
         FmDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thechris.in; s=google; t=1789929252; x=1790534052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        b=Sj07iJptjYW8qKFc/08x5ub65l25vVtHqoI+CR8z9LsUDmPjoN8/2EXarewV41e1Bl
         q68CyVjFpIOnB/A5gcrmAueL0oGsOIsTD3lu+/v8+kRL0TGCaYXLwxUwxskvl5N/XYGW
         4kewGu7KT3bRwkXgo2Ehlv+Sd6uzpgBCOAlVhhqIO+lUVM3FmwtbobQL4p3eZ5AamqfX
         7ok+pLcHPlQl3Q+atfW/W6VrWeRtTlo5gwWWPGPXBFOfGj1zs2Pms3zO9KCWZ/M39JB8
         VDPknJRFzSJBAuMTEgWw9fBsNWpyO+WQBWnLGMqg7NSdPwV+yaKyYxm53bCHDV98oBSr
         9XLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789929252; x=1790534052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxPbHcmjqdMbT/W0TK75dgYdyLTxWsOSVmrzLuv05+Y=;
        b=jG2/7d9urBzAOuupe1cjVO50S7lGshCW4vHky9SXvPbNvdL1XBi4VgqJ31hMp0zxiJ
         /xkqbQnoTrAYSyTr1ImOps5dhtvRcj1dnTYzj+NbawQ0IXYPQ7Ed0g6hj2lUfe1qa8dt
         baud6k2r6vDlodPFHmYflYJS1Sp0Ky7F6LREVPU5PNLdWTUHIo00VFeGLBBsqFf2MUis
         ASIFZeT6nuUCOa+ykNO4r90hSGziBrdHa3VXtp0jIZJJue6pmrB2Ocu3/VPS4lpGtYtB
         taZ++d7XoytLEqBT6Ilo3okudD66ZWHwJWZxpEYAYH+o3WO5ZqEyQog26YYHyBlKvOOk
         QdDA==
X-Forwarded-Encrypted: i=1; AKwUvBwAxsZLHm7Mz77rABwS02EWCBXnsABB3sc3PLY6SWD5V7bH5KeP/oMuItzA10kbSeYYMDhYNhbIGoa97Mc=@vger.kernel.org
X-Gm-Message-State: AFuF++n8awLiXIf5bOtKvOo2XtdA5xlyKlLl5NDpCzlUih60TdICtYit
	aaS+OWF8fmkITt61NZUmXLJ2rbRkukAQspsSEo973VM/NMAQ74gEzc/lSc8PuBcWaYSljXy5Nth
	innOXSxw0gChI1cz7v+5tDQtxmRN0vdvzWey8i09OIL8=
X-Gm-Gg: AYBFou0xW8vbQoqlykvrPMRzbTbX5mllo7ILG4/4cc1cH+kHb1umOfBgSaN7ebo+JtS
	jafzwZ/h/1jOOrrr671e0F3fCeh9W9X7weZpeO5CjfG3nGnn7cg4g1/ThkYJuGgh+pJ5//yc5Xu
	do6l1LOpgtYEL11unzpu9bE8DChVguhPIMOixgotBIvhj6zXBl4PqmAajZRBtr+jOI1r26re5+J
	VON3DHTLK+sHIPHF3TWqnUzTB8fpr8wkPmAfXpT7w7gaenU5iL0FdYTpxdiOGKKg3hD26O9Cf3u
	wnBjn9aWaYy5AfuFIik90q8/InNf5WcBTKoxX55/W0nMyVxFozPglLQpBFARtyW97brzpLdSN5/
	ezJnPJFZHp3Pbim+Y0yXPWlmc/cS34vhar9DuyL8S8Ln4omQCeo3XhMQZLrg3WcOK9K2LTiBfVk
	HUZW6m6myfr9USrFxErzzuXroc
X-Received: by 2002:a05:690c:e24b:20b0:873:5bd1:98b6 with SMTP id
 00721157ae682-89736b37e64mr15478617b3.40.1789929252348; Sun, 20 Sep 2026
 11:34:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh> <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
 <aqwuWWMwdIcx3704@cashel.logfs.org> <mu82xsi6.76ee613a-07fb-48b1-9336-99e8780e8b6e@nod.at>
 <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
 <aq6gJTYTpTr8sYPj@cashel.logfs.org> <CAE2Bdm3K+ZnrfB7xzkg=2fzMs7AmJzdF3aYCpN00h90TR6FMog@mail.gmail.com>
 <aq6sd2Z3nZuAYbMG@cashel.logfs.org> <87cxu8axvh.fsf@bootlin.com> <arAHq0imD-Gm_bOc@cashel.logfs.org>
In-Reply-To: <arAHq0imD-Gm_bOc@cashel.logfs.org>
From: Chris Roy <iam@thechris.in>
Date: Mon, 21 Sep 2026 00:04:00 +0530
X-Gm-Features: AcwNN1XxQ2tTnCe51T1q51ULBvx85COBmsrgwZB0hguL-K1VAzqspcbd4FKQXzI
Message-ID: <CAE2Bdm2TpoA9ctHGhvtrDePvz11Yf3koyiw9S4WvY0jS5jZSuQ@mail.gmail.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@barelysecure.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Greg KH <gregkh@linuxfoundation.org>, 
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>, dakr@kernel.org, 
	driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com, linux-mtd@lists.infradead.org, 
	vigneshr@ti.com, Adarsh Das <adarshdas950@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz set subsystems: mtd


Regards,
- Chris

"But how could you live and have no story to tell?"

On Sun, 20 Sept 2026 at 21:50, J=C3=B6rn Engel <joern@barelysecure.org> wro=
te:
>
> Hello Miqu=C3=A8l
>
> On Sun, Sep 20, 2026 at 02:52:18PM +0200, Miquel Raynal wrote:
> >
> > Not saying this would be a bad move, it would be highly inconsistent
> > with the current code base. Every single allocation in the kernel is
> > checked. Such a change, without a documented and agreed upon method,
> > would lead to dozens fuzzing AIs sending patches to add the "missing"
> > check.
>
> If your argument is that such a change would be inappropriate for the
> patch in question, I totally agree with you.
>
> I would disagree with an argument of "we should do the wrong thing for
> the sake of consistency".  If indeed it is the wrong thing, we should
> stop doing it.  Then we can regain consistency by not doing the wrong
> thing anywhere.  In other words, consistency is irrelevant.  The only
> question should be whether such a change is right or wrong.
>
> There is also the practical consideration that changing the kmalloc
> interface will lead to thousands of changes throughout the kernel and
> requires a large time commitment from someone.  If nobody volunteers to
> be that someone, it might still be better to stick with the status quo
> for now.
>
>
> So making an entirely theoretical "if I were king for a day" kind of
> argument, I don't think GFP_KERNEL allocations should have to check for
> failure.  Neither should userspace callers to malloc.  An interface that
> frequently returns errors is pretty safe, as callers with broken error
> handling are quickly detected and fixes.  An interface that almost never
> returns errors is dangerous, as broken error handling in callers becomes
> common and will eventually lead to bizarre hard-to-reproduce failures.
>
> One of my roles in my last job was to fix userspace malloc and one of my
> fixes was to ensure it would never return an allocation failure.  If it
> returned, the caller received what it requested.  If that wasn't
> possible, the process would crash.  A crashing process isn't exactly
> desired, but it beats unpredictable behavior triggered by broken error
> handlers.  And dealing with a single error path costs significantly less
> cognitive effort than dealing with thousands of error handlers
> everywhere in the code base.
>
> Anyway, since I am not volunteering to spend a significant chunk of my
> time, this is just the opinion of someone that doesn't matter.  Feel
> free to reject it.
>
> J=C3=B6rn
>
> --
> Why do musicians compose symphonies and poets write poems?
> They do it because life wouldn't have any meaning for them if they didn't=
.
> That's why I draw cartoons.  It's my life.
> -- Charles Shultz
