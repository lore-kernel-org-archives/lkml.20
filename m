Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792603197;
	b=dUrv4B2FUtuDGWcE+6rJfsCBatLIkssZ7iy5PxzycBpRGLY7yLNkSQbNI7sIp6umU6XH
	 vjVdfb1k+HwfYeB+tKq4VsHTs2Ei7Mf8pDupTRQQs1yRED+1wZBDIpDvHzbTFlhIaxgUy
	 Wa+Z9X9HDStk2Ycw6dLS9HvAg3dKTSrm1kw17YZHJlGa7xBrQIAj+82+gdYcZIW4sXH17
	 O/ZS123Tmn8MtkTs0J318M+lxkIc9bSYBQo5mxsqV4ZYa2DZdbcjOHvUB5P5qWWZWEcDs
	 g+vhldFEDVeQFkUKzcBWQ6ZBkP7pD8OQWwpk6gCM07Q8ainKG86kNTBNfkSTOshr/GA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
	b=J+/Ch6Uxn7DMutiZgKyNdocNBPlwjPT/WBcZ/Yk4a7PXsAHpMR017DPBgQfsjzVcU61K
	 jXZ6FcdcBF/1XRPvQjZJ804K9gmljuiUPkbrPdyVqEUPfNCIuxIuCT/i33HYy4QHz4ob5
	 y4+9H3qgms4caatWSgDMGF7Ps/vylX49rcZmgCJukVOdExyNcyKzOff0es6OsCS8PEI6K
	 J8HgLyeF+ch4VSFDR5ohAsy9PJ9zFC0up/XZsSTW8L+yhPPMZcZoWsTQQjtKe+qqmbFQB
	 R/BD8zfzk0h4q8Xo5GaciVzKEBDWvIDvVecdK32JgdnjkvEQpLWCGclyua7c5creRmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSpIgQU7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E102D606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E102D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XSpIgQU7
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso1245090a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:19:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792603195; cv=none;
        d=google.com; s=arc-20260327;
        b=LCBz69AvB9kSxiuDOCHCLTN8gMuQazYVJ3nIdNxi80tgSKCH/7LO9CYKVzbdYPrT96
         tcCuV6aGYYswIBfhJkVf0NWXyWqCoY/dJUc9iN4tl88EqTf6dRMKl8uOrQ/9qoJ29w/c
         XAHkVdDkZJeD+I7C21vp/ilcEgOdnu/L4OZwt0SSGBSKLBovOTbFn+JH6GaH/QgxpS1L
         ov/+dc77Yt0HE/3jhQlguI5TaLrKxqJxru/Q61FBD6L1Ed3JKP+D3iKgI2WnyrBeQUKg
         XGoLh5gDilzsPY5Xl7huCxKSxsyIc7lnxMp0BDA9q/oDo8lrLUoRPLoErq0ZwXFH6RKm
         P45w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
        fh=e/N//FWknFY/YHjnBl/jbREOHD9IQF6qMce0O6sLuKU=;
        b=dSW1UQ/58N5bxNvRHkVl5iq2b3ZrZhlUnzCPjnVmP6Zl2KjucKDtsa+667oB9UuMUd
         U42tzsGRajfTXMXYxQjbWxZHgRMn01POz/b0mtZ3oMFW7PyBbpT037+X+Y/HWAn72ILJ
         VZyj7TDFGX0CQeI1jBS+839KvXSC4tHDfQPky6ihpT8b/d0oo4iDT3PTnsqyCofGXvYr
         QiqQJY994pfell8hVwdPjS0EW9RmpD36v7pryLR10R4OBlxut0zkw06M3MQVYUOaj8fY
         d9VBbakqRbcp1oavX1Bg0G1H/12AzHZGCywvrod6JY6yN5Wpnx1Cesdpcpyd1/ESXO0H
         tuIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603195; x=1793207995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
        b=XSpIgQU7hdU09fMazwObHvogjqjSZ3OIyskS8UtvDxFMdtvT7cnYhWTK74yniPSKCB
         th4IsORL+04tF8Xg3GoDhta4j3+wnGrBrzV5LuTAp7AUNW2kSwcyEUF5FLBQ2E/5+lmm
         YFIUQamVMHHT6txLJtspFXcPdnuDHgpIRHoQ2rMboVvj/EwMV08S8mg3ZvfpFKTE3FJG
         hwffc+EnciHUtEWGehG0eF3pKBamN/o0fXrWUnX4JklWidrjJ4FQHctP+hLjKq47wCIz
         jsvXSoWJTVOvGwN1Azf2c7bkl6BnjXkHQyYNJ9e6RaYQpU+w9OvjokRCkpvtKf3bA+ch
         LNuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603195; x=1793207995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZQSCO0jmNqdpTMGpjF3fAr9OJPsW9sB18ZGiGPGBrg=;
        b=fmuB8/wC10EPm3FC45OdJUALQDi6lZqBN84VUG2dYbvnsEnhWAmAthw4YZLgSZ6+wu
         wLV0LR81LNw3QjWCkl/oyaEJadkYCHzXtnV5vh4sOyVUwIQ3V4FGkvS1OZApv0wnEGce
         whOaXcgPXiZfZ2T9VpC2HwSvOOQOYIMN17ymk8xRsLg+A9q/kGpxg7WbGcUC5E51FQVx
         ro7Dx59w4dXLabsoifOX2dWzKd2dpN9KW86WgE3dtli1air2QVd1FOgZnjnseuwHYc3V
         J/Txk4wh7TSM99cmydJpElPJGKqhdlPRiCbJBCe5JcDwJqjCHZEq5176afD7McNMsc76
         TxRA==
X-Forwarded-Encrypted: i=1; AKwUvBy2056W3nMwH3+HCvg7gi4vlD4r8MFKPy+mukI4GvxjiJ98RuqFy0sCM5+AEk/QPICoXQp6IhSFULR4UAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw90oxZbz+EVyoK5ZAEE9QZ57S9rzM/+opmgFXi/1pbNKJNv1D
	Z/pyqtFHtu8PZyKLq93u551F6Z22bUshgroUfakIUjCkHAddZ9lnOpSkstSp6QwzuDbEe3PdjzN
	wjW9QeMtGK2UKnE9TBxcG+mypTcKAD0E=
X-Gm-Gg: AYBFou2Q0s8flTLmilT7FM0suEDqwEe2a3jNtaACJdCkkjaQxL2taV3KeJ6v/ZnFv+O
	HhDNMpBSr5gKetpXfhbKkFDPi9TeJrRFTzFEinTsoLAEsOOJpBEd22nzZdPZo2gEZebLoa5Eqii
	Qmfk/dQppaiotI083QK+K/LG0AW4Rd+xPuCoN+sGPLNGsPA6BYS/mVyI2yskB30B7Hn0JvnAz6U
	/Kr47eU6jfBYA3jE3Q1z38jCpej9i+9ayEJp979G/mEYUPDygN527k397MuaBVQ9Amgkal75x14
	NdfBHP0ze3JbXw0GrLJm2TaG1VrnFNkQOi+N+6PAQ0xrENrf/FjKftmImEZIovxwlCC5pOrKifC
	u+NJXc+bwFW+2O199x9H6OZ3/5BqAtjp8iJ3pduP4tA86XobuzRp0hQ7vQnLs/nqKT3c=
X-Received: by 2002:a05:6402:3244:b0:6ac:87bc:8b16 with SMTP id
 4fb4d7f45d1cf-6b408ef36dbmr1446825a12.44.1792603195214; Wed, 21 Oct 2026
 10:19:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-alpha-perf_reg_validate-v1-1-a8e8cc23ea7a@linutronix.de>
 <CA+=Fv5QWoVZqOR1uHTaE20XWBkXoVqbjTE6bF2iDvvJn6j5hfA@mail.gmail.com>
 <20261021134714-fbc85127-2188-4c7b-b472-ed719c520541@linutronix.de>
 <20261021153856.GR2823843@noisy.programming.kicks-ass.net> <20261021154346.GB409038@noisy.programming.kicks-ass.net>
In-Reply-To: <20261021154346.GB409038@noisy.programming.kicks-ass.net>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 21 Oct 2026 19:19:43 +0200
X-Gm-Features: AclHuK8PW19mk3nU8HATQHkT9wwoKx5rQe3hwQQpYZbB2M2jcT34h9RJZRWhnIg
Message-ID: <CA+=Fv5RYMAxXHYKGw_sHzhGxmPSYyFG=bTCXxo2100eDyZeh7Q@mail.gmail.com>
Subject: Re: [PATCH] alpha: add simd_enabled argument to perf_reg_validate()
To: Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

On Wed, Oct 21, 2026 at 5:43=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Wed, Oct 21, 2026 at 05:38:56PM +0200, Peter Zijlstra wrote:
> > On Wed, Oct 21, 2026 at 01:49:35PM +0200, Thomas Wei=C3=9Fschuh wrote:
> > > Hi Magnus!
> > >
> > > On Wed, Oct 21, 2026 at 12:23:55PM +0200, Magnus Lindholm wrote:
> > > > On Wed, Oct 21, 2026 at 10:18=E2=80=AFAM Thomas Wei=C3=9Fschuh
> > > > <thomas.weissschuh@linutronix.de> wrote:
> > >
> > > (...)
> > >
> > > > Thanks for catching this. I reproduced the build failure on current
> > > > mainline and confirmed your fix with GENERIC SMP and DP264 UP build=
s.
> > > > Both also passed perf register validation and sampling tests in QEM=
U.
> > > >
> > > > Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
> > > > Tested-by: Magnus Lindholm <linmag7@gmail.com>
> > >
> > > Thanks.
> > >
> > > > If you have a route for this patch upstream, please go ahead and ta=
ke it,
> > > > unless Linus would prefer to pick it up directly.
> > >
> > > I have no route upstream. I hope for Linus to pick it up.
> > > But if that does not happen, maybe you could send a PR.
> >
> > I can stick it in tip/perf/urgent if that helps :-)
>
> It should be there; please yell if I should drop it because someone else
> (alpha tree) wants it or something.

Thanks for picking this up. Going through tip/perf/urgent works for
me; I won't queue it separately in the Alpha tree.

Thanks,
Magnus
