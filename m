Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EB857C712
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 14:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653790; cv=pass; b=oi8RxsNt7W/T5Z0XO9XD7Cm0sKaxqeMDUJ9tJJMI1Mv6TQ6R8Fcv7K2/2QcFfmXotQ3aAz3e8gvzTcua1OtemJF5i6GTHEUYa1Zr27y7Dp/n64Vp+/aRlAcsq5j88c83T0v6GX/x0tEPWZiVj9OuVYO8AZc2Bk0eoLOMQbyf2/c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653790; c=relaxed/simple;
	bh=UtTJJanmQzheGMJ41aA/C7B0yFNClZGJuo4FszPmjp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oVSqYA3WGppqUORG+gpruvINKWL8x9k0PXDInLKq0UBTVNxgnMBqohQvwTsweZM4eGOBOTejytLKqOlGWdfZE5ucwM8+d1mfLOW6a018ZwMz8/axiQ4mm+PtJPPAnl9hCjEnrvBHLhaMq/3fggJDbV7Uy6sv+yEkoFhr8EstI1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nQuKLsHv; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nQuKLsHv"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so134248066b.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789653786; cv=none;
        d=google.com; s=arc-20260327;
        b=cFGWtLQoD2b5AntXPdsNpnoWl0zKGRypCvmj9ZsXAc+GZf/A6/ZjPnkGEj8907f3fz
         XkE4kctbZObd/EF2K1tNqAtqYFWIJekdq1WCMRK+5A19S/9Dbxxww9Nkh66QNPzkzsUI
         GOnWewVKRZ0S1waYJVAZ3LLVO6XbZE7rvaM1W52snct8FtDC8o0ZBpRSmLW6g1K5UjBh
         ZXUYu9ZNvGEoK4H0CEvA+OfMduJ/yixBtyWtM0AMcm6BX+LixoYjRggy4Zr7qA7EXxEa
         l40KLAbgGyAV76iGdKnmOt00QNyfbSDF3EY1ZYbQoOZDuQfLSFiMsFuTtP1NojS1Gl4A
         nZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrVDz6jqbkOD1WpHXK4R+n2LTDs6My6pX0kqqy9uN6c=;
        fh=ilx1t9YIlJxiK/w4q2Mtoz8dazVYlpN3yRv/pda9vWg=;
        b=dvUhYLWzYWSYDVaeCOjwsCgfyYh6qUoyDC68dpb0m1q4sZsGOdJ68gskYdzK/1+9BC
         QyymrLsDhz8NJERvBG0E536BDByV3+4cwMG0IgLMLcDezhHD1xxML/v5CJVK+S/7kSF3
         M+K6dlfNwUNJMqgyITEm2k3A6cTL2jJSF2HoNVgIVEaDg25oWgwQ6dxDAgRM9v8oed8T
         1eHrsYxj2P8TQH+meF/1YSuxYhJms23aUsPNoMf1L9N4KsMoIU+WpDEk0qRGey7HIKRl
         EEPZPWvArdjWcm6vQ7FBPYHO+S4JjfsiNyZfrNKUZ7hXPCReuBcNEgQHcny22PuUJMcu
         oySA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789653786; x=1790258586; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrVDz6jqbkOD1WpHXK4R+n2LTDs6My6pX0kqqy9uN6c=;
        b=nQuKLsHvlligHDoPS6Ie5gtDQBiE+Se/t2mX6N8wbZFHVUCmi6Qx3lhZQyOrO6WS3H
         KfHvWI8vnNUkaj85l7H5eDnWsjzrN1B6h5h+sZSHVrAp39sk231g3oB9r4NBJq4MFAtj
         KjC9M5n2T/D7sreZLr95oWScy+OtxK+0+5g33a8RhbYkZEcT5uxlw9gjZRPnCHUHgBGf
         ookveVQEg2syqkKZ+aAjwDhi2geTDq4XX/wPy5P4/JfNSPK9Vy7xmji8thuyeB9Hv+bh
         /iDx2qKRewc5Dm/ScgjRG8Fu4wFQ8AqYkL0WTbzkOzHct4oEiR6wafJ9sNL3sylI2WW4
         uy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653786; x=1790258586;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrVDz6jqbkOD1WpHXK4R+n2LTDs6My6pX0kqqy9uN6c=;
        b=DubbkBjtDbwtWVm+T9w2wJ8G3tmTLh6tyVFM395bETtwYrSCVavTmg3T24NUmTf5tk
         4f6lj0IILaAgksPeB6q/fhU9b4MxGnjIfQh3ggD5b0BcitIPl2B8ghN86I+jPGjINYK7
         YKSMxG5Bf1qXt8gjGk1uC1uH0GsGcdwuh+364SrLRBCQ6htTb6PihS4Y49H+Z3650J9w
         7GFY7SO/I3rz2J2QHwYdFONulKp4lTwWn+rkbMwjUaxZUegABucVo9elqMS2lza/6RJQ
         9TO5ZWR2MpRw1YUWjcDwfo7DnrmjVgIHefMF10y9vSv0IpU0IT5Nkz+ZOXQ36QFrPxbh
         9hwA==
X-Forwarded-Encrypted: i=1; AKwUvBxtAgH6ARzD2WGmOdv1oYeOWC0RNlhq/44LF/dy0g+fO/+WFErJJ6Yp1dkqSKgO5LAtEyb/2zovyZLuHrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mdu3O5DF9hFW7uvBVYO5Ndva3xVDJGEHwMoK0vfza+TlmHGvkI
	0zYSLTzVGarmugcPyuYiScQx47nKtknau5OgaRVjrAqPnWHdOCyjUbUir8fJUE6m0Zr2BjSzsJ8
	y792x4ydkZ0pwkd9DnAq6mnPqIz3y9nUOGLJXYF/L7Q==
X-Gm-Gg: AYBFou1XA1d//q1+wzEtqohQdZSdwK/Nl8I3y3t/iFufGCPGKtd4oYfHSiJiRS6DnuF
	Cl3YnBKf5gQvrPfzDptAQ2EbspGl3iVlT+kaRPQvB2nIN2nU/48ocA30NV4UCde1PWaOrTY7YqN
	/Da8q/OsxDsNRysiCx21N6QAeZCLDd8SN6zVuuIIRl+SofxvKJWRe2qwbWi7wd+Txw76tYRZDUv
	Dz98QFp2FQXj4WPaxVyFWMkRsRwD6l2HR2cpdnLoL/WlVQjjt6mjTLRDVO/H5jUbrQ8WPY1VZ7G
	JWbsUK1tZ5QzQUE6nY0TDzXsgqZoCjS4JMPwmDWABTqE3MgO/OV+ht4BkdAIc768G/57bPtrrs+
	qZd19iPnOrrhw
X-Received: by 2002:a17:907:9813:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c29e52cdd6bmr473048266b.29.1789653786468; Thu, 17 Sep 2026
 07:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916100116.701206-1-christian.loehle@arm.com>
 <20260916100116.701206-3-christian.loehle@arm.com> <08339e62-1787-e203-569c-a7fd3026395f@gentwo.org>
 <e11d588b-e597-4210-baa3-278eaeb0cf52@arm.com> <b129997a-8d49-41be-a93a-7e0343c952e3@arm.com>
In-Reply-To: <b129997a-8d49-41be-a93a-7e0343c952e3@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 17 Sep 2026 16:02:54 +0200
X-Gm-Features: AcwNN1WT0xHNq5GhPG23FjD4UG5qmwZVl4NN8bye5EHvuvLicrLC03NhlIiVW68
Message-ID: <CAKfTPtBdK6Y31_yZk=4Qgi1w8LSzDcytQF9FEdsNfcMKtS7gjA@mail.gmail.com>
Subject: Re: [PATCH 2/2] sched/fair: Randomize equally shallow slow-path candidates
To: Christian Loehle <christian.loehle@arm.com>
Cc: Shubhang <sh@gentwo.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Beata Michalska <beata.michalska@arm.com>, Elif Topuz <elif.topuz@arm.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sept 2026 at 11:58, Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 9/17/26 08:47, Christian Loehle wrote:
> > On 9/16/26 20:43, Shubhang wrote:
> >> Hi Christian,
> >>
> >> On Wed, 16 Sep 2026, Christian Loehle wrote:
> >>
> >>> +            } else if (!idle || idle->exit_latency =3D=3D min_exit_l=
atency) {
> >>> +                nr_candidates++;
> >>> +                if (nr_candidates =3D=3D 1 ||
> >>> +                    !reciprocal_scale(sched_rng(), nr_candidates))
> >>> +                    shallowest_idle_cpu =3D i;
> >>
> >> available_idle_cpu(i) ensures that this is an idle CPU, but !idle mean=
s that no active cpuidle state, meaning no exit latency is available for co=
mparison.
> >>
> >> [PATCH 1/2] treats such a CPU as a fallback i.e. it is selected only w=
hen no idle candidate has been found yet. Here it becomes an equal reservoi=
r candidate, even after selecting a CPU with the minimum known exit latency=
. That is, it is added to the random selection pool and can replace shallow=
est_idle_cpu.
> >>
> >> Is that intentional ? If not, should reservoir sampling be limited to
> >> candidates with `idle->exit_latency =3D=3D min_exit_latency`, while re=
taining the first !idle CPU only as the fallback?
> >
> > Hi Shubhang,
> >
> > Thanks for taking a look. Including !idle candidates was intentional,
> > although you're right that this changes their treatment.
> >
> > I think there's a case for giving NULL a zero ranking. With a working
> > cpuidle driver, NULL can mean the CPU is preparing for entry or finishi=
ng
> > after exit, making it a good low-latency candidate.
> > Architecture fallbacks are also reasonable candidates AFAICS.
> > In any case, I'd prefer to address that separately (perhaps through a
> > helper in the idle/cpuidle code rather than embedding those assumptions
> > in fair.c and will drop !idle CPUs competing with min_exit_latency CPUs=
,
> > the patch doesn't need it.
> Actually about the last part, I'm leaning towards sticking with v1, becau=
se
> that is actually the current upstream behaviour. !idle CPUs currently tru=
mp
> any CPU seen so far, but preserve min_exit_latency, therefore sticking it
> into the shallowest seen reservoir is consistent IMO (although we can
> certainly debate if that should be the case).
> I'd prefer sending a follow-up with an idle helper and making a properly
> defined policy there, but that's adjacent to this patch.

When a CPU idle driver is present, !idle means the CPU is entering or
leaving an idle state. A CPU entering idle could be a good candidate
but we don't want to select the one exiting its idle state, as it is
already scheduled for activity. The current version is trying to do so
with idle_stamp comparison although this is far from being robust.
That being said, a random choice might not be worse.
