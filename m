Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9477A4A1387
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856063; cv=pass; b=ica94BcM6wBBUSrjVdN/sUlhouqn37pX0ZumheVWmxCWxlaXNi+DY1i5xCsqQCjtcJOQ/FyKR6jdk5HYQ1IJMtN1+soR0yl5/sUNrENHPsiUcBMW45cwSaQ264av47Eaysf8LK1D7Ly+wo6wzzHA+y8mWac69L0CbCITkB05Rk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856063; c=relaxed/simple;
	bh=XHXEc3lb89R5K4e6zCupjYllWsi9Y8mBxV+FdAQWd9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jm3G/mpIfJqz5lfUKxTGTLxDMW/JXkTN1KAtUeCBq13J2NOicR6twJU5gvLzGGvihWt3QocQG1NVhHD1/KZGxzrijZGWDss7sA4LznMlR3SxUfaFtU6wJ/wqzmPTIQuuWyPNiZrr8yDW5QYyucDiha3IEsXqZGnnjcxr4Ufkgy0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP7sqGcj; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP7sqGcj"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-66c9995ca60so2521914d50.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787856061; cv=none;
        d=google.com; s=arc-20260327;
        b=mb2HVR74Id1CFGEkBXy/lJm3TrSrkH4pggxeic/5HcuHiiX8RZIqfMOo5Wlw0POqk7
         oT6dPDgZEXEITD+Xp5OZuCXzERLG4g5oaO1ID0iTC6jIMMTdY+E7eAYBYEAD8lyrIlSM
         uTRkg0UjoIsFqekkMxkr376MM0zEsgFgIbu9dosMK84OQ0R2Regmso5fhnAcgYVFB6k2
         ZFdVtWtXoyDMgcHIDFFxzhG9WWhYAVNQeRPqCLVle5HGJNh4ETW64tQV3+KzQQ77A0Pe
         fuKu8VQI5KPRqDJAKp4cGbcxmxOH3d1gA+nWO1OFq/1zt5jGbQIdwwwnGKriQyY4T6fU
         yCtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XHXEc3lb89R5K4e6zCupjYllWsi9Y8mBxV+FdAQWd9w=;
        fh=wZfhuZhr/cPUGH/ZHTLi3ZqjjOmUCI80sFvv18vRvgI=;
        b=bqOamHQtyU2OEsyLp8tU3+zCP24fQWFj5Bpb6QGfgYtfa7EIj9/RQx4gcBiSAG5Vn4
         yyEDMQ+Bc/ZB+wGIWZArLMMdik+Go65QWVCwR/7BZTcR1x5q/mflnKc0qPJWSn7udh8Z
         AAzzln12bjm1BdD5mLdg9Pd51VGKY2B7xJSUW1JDMafrPhY4LnpU2decsCEdWt3v+b09
         Tjo6jS08vuGaGgDSHtECS+oH9DvNcTTLAa+OdFsMguGpIsymi692xIBNH9/PO//O/M8t
         4jS6ViwSGGXYcy7h+t+BTysOHziHToaR8k5qjnrk9HWMLSnK5GPcA9lDSy5oGxr37z33
         yKGw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787856061; x=1788460861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XHXEc3lb89R5K4e6zCupjYllWsi9Y8mBxV+FdAQWd9w=;
        b=aP7sqGcj439UJKA3d4tx9f6AUO0zB72lMqJbP8XzQ2qeH2vByNECsPXtZnV+w4g9Z1
         C+28ulztqIIPNa/6e77Mv0UFuUI7UAi2mBRW8IWGJqwjNTKIOb+9subHvpCPqsmkEV5s
         0HDG74cAwmus1ysxRCZ9UGz6+EiPy7WeMt8gL77RFI+s4IkW/hYD5vW+9dmL2OFMnCwx
         x2MG9lUBo/eVaWjpfbg0dhgSN4qctVMtO87/S6lvpxe8/iWr6lJCeUoAo7AWE3p6sVNl
         BjVDGBBvMvhLNQo2fscJiGiS+jC/XZD4QTNviiR5G2FGGjsODyuFSQjyVXYoopt2MWB6
         wN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856061; x=1788460861;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XHXEc3lb89R5K4e6zCupjYllWsi9Y8mBxV+FdAQWd9w=;
        b=L5c2XDvTDRzaH/zTfNPbL7Lng7GS4LXz9msfAaMnHJgprce3r0OAxX026RwmcK+s21
         QIF19FAIJ7rDRcEstJx7znYCKW2Y4gxk0ZMhhPuovBGce/U39aBvR7Nk/mi6HlZtF15V
         K95SNvmdAjxoJP31swUr8t04XIo/0iCzN5QY84IHRuC07aa0NLJp68J9wYBKiz6wi4mK
         QpYJ7DAOASgRrgZSZHmXBCWJWeeokcwKpSTAN3a3MJWCkV+luY0LENLIeuPv+VbiHpQ/
         sYkWYdKG0UacJtLEvC4mf6DmJmE13Olbu+HjU5Zom/8zP+0t5IuScmOK9Hb1OBU/wkcF
         yrKg==
X-Forwarded-Encrypted: i=1; AHgh+RoDAbhvOlLNGNstb6ffJ7y8dobPyn6nn7FQTD8zSmzpgnA37dk//Dg5ERDW8mXeVRZLIyWiyQWZVzQ9d7I=@vger.kernel.org
X-Gm-Message-State: AFuF++n4Xogrlff7UjJRyA++ZiMHpIRTgqVd/zInDncCPc0+5CnSfCIg
	VQ1NtHwSvz6DYjCeS8rLDSBzPNPRdBrKpI/DW4/V2Pjdo0R7hWqI0+TB/pjADVH5CrWapPA0cvN
	q2D+v1UiR2thEmv+KW1Kbb615GeN4TM0=
X-Gm-Gg: AR+sD113IUM4OeYNjV7NAUr4qH2I/WSrHH2CXA6fly9k2yEFB6Su4gZddnRHpFt79iO
	kw9gaDJ0275SdQnAeBN459g4gVIptf/KaR7oxmRlpGgaXNKdXyAkhi6uoFEewkkNVWAB4bIHQ5U
	XDuAqmQjTrZcNrcYaHGsWAmbL+ijljPRiCCrIBK6RcNSn27gq44Wxq7Ui/XmY2Dk9TssOMGJTwo
	WIaRXnVV1myOwHXbDjUAQUCDvIUJ8xgQDtHFRr84zqReCiOGXCkZiv0jhlIms1eA4fNT3L1vwD7
	JknMtRLV/9KlL3Qy1lxQkQU4p6PpRWyt4km9hsSb5FmeUsHGRUMedDz3n+ebVUGFKKJxrjc+FHI
	bTvDZFDaOtKhZuZL97fh0+d0=
X-Received: by 2002:a05:690e:d86:b0:666:c4c5:7525 with SMTP id
 956f58d0204a3-66e4b916cf8mr533718d50.24.1787856061361; Thu, 27 Aug 2026
 11:41:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826-lockdep-memblock-v1-v1-0-e2db855391ec@gmail.com>
 <20260827064619.GB4121339@noisy.programming.kicks-ass.net>
 <CAJfuBxwOHiWsoQVLahW7c1+2f-=itRBLEi_4rbQGr+vtqLyBWg@mail.gmail.com> <20260827090300.GD4121339@noisy.programming.kicks-ass.net>
In-Reply-To: <20260827090300.GD4121339@noisy.programming.kicks-ass.net>
From: jim.cromie@gmail.com
Date: Thu, 27 Aug 2026 12:40:34 -0600
X-Gm-Features: AcwNN1Wo8VG8RUV4OgUypLiCBNNBoO3R9CkXL8zx5MTZCZPs0PFnpfnRuIXwxnc
Message-ID: <CAJfuBxyw6xCQTisF+srYcEhvUycZZOpTGFGhRO4DSDuwsiAp5w@mail.gmail.com>
Subject: Re: [PATCH 0/8] lockdep: change 5 graph-db arrays to AofAs, fill from
 memblock pool
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Waiman Long <longman@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 3:03=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Thu, Aug 27, 2026 at 02:54:12AM -0600, jim.cromie@gmail.com wrote:
> > On Thu, Aug 27, 2026 at 12:46=E2=80=AFAM Peter Zijlstra <peterz@infrade=
ad.org> wrote:
> > >
> > > On Wed, Aug 26, 2026 at 09:58:32PM -0600, Jim Cromie wrote:
> > > > Lockdep cannot rely upon any other subsystem that uses locks, so si=
nce
> > > > inception, its graph-db has been stored in static arrays, pinning ~=
10
> > > > MB in .bss. This is a hardcoded compromise between embedded and
> > > > enterprise hardware.
> > > >
> > > > However, if it acts early, lockdep can pre-allocate a pool of slabs
> > > > from memblock_alloc(), enough for its lifetime of anticipated workl=
oads.
> > > > Then it can allocate them as needed to provide new segments/slabs t=
o
> > > > the graph-db.
> > > >
> > >
> > > Why? I really don't understand why. Who cares about this bss stuff.
> >
> > I thought embedded folk might value 10mb less bss ?
> > Or have they stopped using lockdep already, for size or other reasons.
>
> I've never heard complaints from embedded people that this is a problem.
> Very few Linux capable machines can't spare 10mb.
>
> This is about kernel development, if you need to develop a driver (only
> case you might be tied to specific hardware) just get your developer a
> board that has a spare 10mb of memory? Your developer is probably
> served by having the most beefy board available anyway.
>
> There was a case on sparc where the bss was a problem because the kernel
> image had definite size constraints, but I don't think any 'modern'
> systems suffer that particular problem.
>

Fair points on embedded.
So the value proposition is narrow:

folks hitting "BUG: MAX_LOCKDEP_* too low!"
who cannot build, deploy a kernel with tweaked MAX_LOCKDEP constants.
They're running a distro-debug kernel.

this group might include:
Distro QA, enterprise testers, Syzbot/CI runners.
For these users, lockdep sometimes turns off permanently,
silently invalidating the rest of the test run.

if they had the lockdep_slabs=3DN knob, they might use it,
and throw more workload on the box without a possible hard-fail looming.

> > How about OOM, when kernel needs mem,
> > or lockdep debug-off, when the slabs tied up in the graph-db could be r=
eturned
>
> If you're running into OOM while doing kernel dev you're doing it wrong?

heh - not me, that was the other guy.
it was a "feature", I thought it might help the sale. :-)

 thanks
