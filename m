Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9765B2CCC5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792390617; cv=pass; b=gD9EHEiHDZW3VCsKQR/wGwS1B/VNj8nOtWVF2GDpEGRjHXY8vqR17GhkZHWEjVlDHaLiU2RXM1MjXJe6b69znWKNNvgq3rpAV3Af7ZRs7Mg5357ic2dWvc7D4E+ly9bhGsKqnyAa/cuNhQFmaNPJHe8jgJI/zOzwHzbaQvjqMVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792390617; c=relaxed/simple;
	bh=56VLJGyj4HRq49g17vyuCFw8M8iHtKkH/49z2epuspM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr5I7NPccFV4enHlQXBwjvIHKZluvSW5FfPdpH2D6NmSzrbZ2GTQoxBSWInwWX2YrjDPZHLitoRw8JBmAzQrK6eP+l/8svzU1fAHfWRCBN7vS7H9Cngppg2xeXBun68BM+O0D9dRean75Lo2wcLp+XjdrI0eUqcQekn6R/QRXEI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VnCrp3DX; arc=pass smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VnCrp3DX"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93e4c00d71aso172643185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:16:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792390614; cv=none;
        d=google.com; s=arc-20260327;
        b=LZ9TmGfsghMZprAQXu85QFO0qeG+HPugIHNmV9IrR52s35v3uCbnQW6uMLED/AJBfU
         eLTsVVQY0DWMobVqdiE53nnARzsGuTTwQL3vpxmRv0DpJkIw0sNoo6hk4+UGsc5JVnku
         w9fAbxxzYeExWvIqanVRkEhAhH3onGh2r1RghljpG1nqfbVXLpgc13+tBziSR9Fdpg+O
         ZDvGshb10H0P92Ah4MZlSzCePpCLdEvfYqztLuXjw+iIKucQwkqq/OrOFfmbUMg+74AP
         XS8zwmw/RfkZAM/1NhlDOo5X0YUNO8yCnnxl96vBBsRo0POLezcQTIGm+RBCr1Wy9pzb
         3q1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+SoDEgWuDO2UaFHoXMQDGdm5XGPms2KMR5N2P7Ri3fI=;
        fh=nJAyVgIrYAX+41I+eTLEhWO6Fh+0iWD/6vhNcmL4Uws=;
        b=igpmkc4x3eA8G3tN069rnHsXRzEDKYkLvdLk6YMW6/T+Jx/CEXhDb/Fs41RtBjUzhD
         HXiNs3aEySXvo2Mup8eQT68AyHf0foTU8/ZtUcOa5Yil+hu72UDsfCVYLpc7nfqlbsGt
         mrkQzm99bY1GzRANWzMIXVhWwnLH3019JOyaeJ7TizBqyLpgs0MGkD28kusQmyalv4bb
         vF2h0xuq0Q36QdOJBKIVWVBWuh3oev0DHb4mwPIGJJ+xIviwUY0FY/CVCGGsySlJZAnJ
         EmtPz/xdgSJwsK72zwsjmasgPihfi5kmJ/zs4Yip2WS+duFOEy17EfavStlV+xtgdVDw
         9j3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792390614; x=1792995414; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+SoDEgWuDO2UaFHoXMQDGdm5XGPms2KMR5N2P7Ri3fI=;
        b=VnCrp3DXy/p6Pw7Fud89j7Gd2M/jEO8+T+X1yvhN3p99tJpfF6rX2iHwAj9lGFtxXi
         Aw1OdITz2/UHxJOloSZZsbBtEqBOSEZibuWZzfsQmpLMZd680hwNbcQCa9qY6P3A965f
         k89kIgXi9FSykOOg7Or7C7zdAYHC/fmVjwsarc5QmllbwRbo0x7qgRKFVZgDa+UYlzqu
         ZV7OlNpY785Rm6QERtLW4XGek175jPqCdfPkeh8zTsHlNL1ZSWmquXk0OLIBVTZhDCVa
         0be6bjtyoSvQaPpYS3pTfbMnXmuvVRknS5gxRSSn1ra6vyX3XVorLYrnOubW4waGMBXT
         kAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792390614; x=1792995414;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+SoDEgWuDO2UaFHoXMQDGdm5XGPms2KMR5N2P7Ri3fI=;
        b=IdUex2MuPKeyEjFBkCxYvna8l1qYkFE5b73QMSqazUq19T+ssu6t6j52ZYfzbzFn7t
         Y/aLsizUwUWTru7B00LT1fx18CgvtEH3Shv+2SZYgvc4Qmzvs+6jAldE8pw8lWcWpBrZ
         QfvdX58oL94htyk41Bbo5rpCDkvMTYcTavjeJUWO4t2rcuqLLgcPDzbkoDq8bCNBH+7I
         P+6eYaLWOHTgd0Zp42PrUxEM4fQr+VtAt0pZokagkW26M0qlcoesz/OXY25sZj/xjMfe
         2lyxukY0lrGoOH15Q3XU05V9IwmPP9xaedBNQNhLNuZ+ajmuTqEcwFvxSr45D60SwZS+
         /Adg==
X-Forwarded-Encrypted: i=1; AKwUvBxM6kmqDNApsREIZ2mGZYIwTrP3miC9phFpYsP8717Mqf+1SUq+gfua3teZN0F2kfGyTsvj8P9taUYIa58=@vger.kernel.org
X-Gm-Message-State: AFq9FYLezZKpuHq7lzUHDlXb99PbxjP3/2Kzln0dWq4f+Z9YvLh8QR1q
	VrMZ/I1QHUmF4D4sbGSHw7An+sGSptMwHV57WNmwwR0/et0TZC0mzHZYW5j0GLLnggjNlbB6+j6
	r2TOJ+xz23wEFXXekTC6JN9NX/vzMRQOTREmQKBK7
X-Gm-Gg: AYBFou24FazvyVK7D9krB28UVYnZcqJSV8bKKTn4P5Nect3Y2EIqAu7z7jMDlffmg7h
	AyKmw8ztmQliLb0gaDWXi9ZWMUA/8E40o0MjttAJkWF9eC+ItbeIx2wFyLgGS7N4EJYeYIiNjeX
	LMl0q/ShFJ4s77spmaKDucxmN4iqBwARtQNe712rSq3p05k/AOy0LtwUVkM9zswpOZrr0hxoQgu
	SjRPPD3+o7ao/unUYmO3Ll8rNS7kYdcBgyg4zB1CiqJFK9z4J73GV9p3OX8Hoy4yBTn9Z4hagQa
	Nc6QuqKO3DIrLyNnWt3TpPUWRbDeym/lLdUnN1KhkbBx0/z6/v3BZozg6g==
X-Received: by 2002:a05:620a:439b:b0:93e:e1fd:b87f with SMTP id
 af79cd13be357-93f29e17275mr1076091885a.83.1792390613736; Sun, 18 Oct 2026
 23:16:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917043339.2093426-1-suleiman@google.com> <20260917043339.2093426-3-suleiman@google.com>
 <20260917153831.GL4121339@noisy.programming.kicks-ass.net>
 <CABCjUKD60kEn0BZo0r3zie6QE8wFh-0V=V6OG3nfa3b1evjVKQ@mail.gmail.com>
 <644b5845-4a3c-4f49-abfa-edb4fa6ed89c@amd.com> <CABCjUKB9ntxrEzJQcd45j8dUde+91i--MCSW49RWR2Zr40QTCg@mail.gmail.com>
 <067742df-adf5-43dc-b939-ef5530001614@amd.com>
In-Reply-To: <067742df-adf5-43dc-b939-ef5530001614@amd.com>
From: Suleiman Souhlal <suleiman@google.com>
Date: Mon, 19 Oct 2026 15:16:41 +0900
X-Gm-Features: AclHuK9_osbYneQyvaN4POxBcLH73kq67hTw67DssGIo59LctqfLbExMRIPoxaU
Message-ID: <CABCjUKBqR6=vRKKgfBFPcVoER1EdAFc6=8N576XzoUdw+N3ECw@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] futex: Switch PI futex to use p->pi_futex_lock
 instead of p->pi_lock.
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, zhidao su <soolaugust@gmail.com>, 
	John Stultz <jstultz@google.com>, Qais Yousef <qyousef@google.com>, ssouhlal@freebsd.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:16=E2=80=AFPM K Prateek Nayak <kprateek.nayak@amd=
.com> wrote:
>
> Hello Suleiman,
>
> On 10/16/2026 11:29 AM, Suleiman Souhlal wrote:
> >>> I suppose the alternatives would be to either figure out how to
> >>> un-nest pi_lock from wait_lock in futex code or un-nesting the
> >>> blocked_on lock from pi_lock in the scheduler.
> >>
> >> So the only time we try to grab pi_lock + blocked_lock is during
> >> wakeup so I think doing that should be (theoretically) possible.
> >>
> >> The ttwu_runnable() handling is extremely painful unless we block
> >> the delayed task fully. Since we have he new p->is_blocked state,
> >> we can safely retain the p->blocked_on while running the task -
> >> it is either cleared during unlock by previosu owner or will be
> >> same as the lock on which the task blocked on.
> >>
> >>
> >> Based on John's tree at commit 06ac43db4d8e ("[ANNOTATION] =3D=3D=3D
> >> Needs confirmation of functionality past this point =3D=3D=3D") on
> >> proxy-exec-v31-7.2-rc4 branch:
> >
> > Sorry for the slow reply and thanks for the very quick patch.
> >
> > Unfortunately, it doesn't seem like this approach works in the end,
> > because there is still a pi_lock -> rq lock -> blocked_lock transitive
> > relationship, which deadlocks when trying to get the pi_lock while
> > holding the blocked_lock (when fixing up the pi_state owner in the
> > futex code). :-(
>
> Ah! So what you are saying is, since we have:
>
>   p->pi_lock
>     rq_lock /* ttwu_runnable() */
>
> and
>
>   rq_lock
>    blocked_lock /* find_proxy_task() */
>
> relations, doing a:
>
>   blocked_lock
>     p->pi_lock
>
> would cause a deadlock via rq_lock. True that.

Yes, exactly that.

>
> >
> > On the other hand, Peter's suggestion of moving the scheduler's use of
> > pi_lock to a new lock, p->sched_lock, seems to work in my testing, but
> > is kind of a scary change to me.
> >
> > Maybe an acceptable alternative would be for the new futex to use a
> > new lock (similarly to what the original patch does), but keep regular
> > PI futexes using pi_lock, at least as long as they are still based on
> > rtmutexes.
>
> I guess that should do too, yes.
>
> On a different note, why do we need the p->pi_lock/p->pi_futex_lock to
> modify the ping_state->owner in ping_state_update_owner()? Isn't
> ping_state->ping_mutex.wait_lock + owner->blocked_on locks enough?

It's because ping_states need to be on a per-task list,
task->futex.ping_state_list, so that when a task exits, we can walk
all the ping_states it might still own and unlock/free them (this also
applies to pi_states with PI futexes).
See exit_ping_state_list() in patch 5 in this series or
exit_pi_state_list() for regular PI futexes.
(owner->blocked_on lock is just wait_lock)

-- Suleiman

>
> Note: I'm still wrapping my head around the PING implementation so it
> might take me a while to appreciate the need for the pi_futex_lock.
> I'm using proxy-exec-v32-7.3-rc-tip-sched-core from John's tree at the
> moment to jump around.
>
> --
> Thanks and Regards,
> Prateek
>
