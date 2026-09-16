Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0F399011
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789539849; cv=pass; b=acCtRGbbmNCAQeGXcUYbsE2t3SRVWYQlSAtCthAefInN+Gsq/KhSxqkYJpyYg9K+Qv/pXBOBWk4Lz6TcSPyNiTyNW6hcEPPuCLR6wm9mxGiB7EKIDdJqyvdM3jzq2uBsbvQTolHWAztmCoFsIyUL0T1IYcLrphjPcumSHh7cnCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789539849; c=relaxed/simple;
	bh=mAIrKBvRrMomGH0iYWEN1Ps+5CGaEFImVIbj9hUuyyk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=alyzC4HfKm/JVyvzH66BswRT8GJqMDXnQw7ybGnkvrkSZe4UQZ88NI81kMVyWWjexvjUfSJ41Osesm9cDQrrBn/SorS9WPkjJf3i3Zf4LcsTmkADtsiNuG3LCfHrQLmbpF/i8EaOeTso0MfwB7MPDSd+3YETjpLBlY14+g+YNL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OSx2qtBc; arc=pass smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OSx2qtBc"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so2645295e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789539846; cv=none;
        d=google.com; s=arc-20260327;
        b=k1ruDqkqEOjAxlOnmQ0da++CS0GsUdmojQV7LR1RI9u3zOYcuQxFzqCW6YWJHtjFKR
         Wb2CrmVFcP5P+tQue30sueqw6/Ea0FDJV/g5oBpYuRij+x++IXJNrk1RnqXubddu7IVR
         IoTWtc6pYZmJ4NTlj4mwk+BpuzsFwn3AUzTIToxIlcI9N+fefkcwGXLgJ8IomugB+68o
         NVD4FgC0TnDiqhpN9onPy3Y+i4XeNP214rID1ecK5I6ypxFOD8Kyb7sAApp9te2Y53CW
         1CfVUJ3ZNH6CbpcEsG87t8tfGbKLbLIx/m79zxClOLzVw/xzc3PW1M/9RPttjVfNv4ai
         eppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mAIrKBvRrMomGH0iYWEN1Ps+5CGaEFImVIbj9hUuyyk=;
        fh=dfFO4lWGEzbcM/XPiGHJPM/DR7EBvQ3g9kiZ54j+aWE=;
        b=qxD0a8e+zKbaUVwDxsYxGXsMNFKIZg3R/MtGNIo0NUe6hfDQ4G/7rZCeJx9QBAW+u/
         EfEPoUh/ficwfJA2ej4PRG5u2qsqRuY16ezJTs4HRCmjH3NNvNXUjT41UZIEvY193ABY
         INSeeLgX0b6vRJB4lTlovitMfxUVMrWs2NJgW6hO/BJKgCo8KQvhgBbfxGVzCS8vCkMg
         OY4V3AnegMt1byI1kZhAbFSmIVkHW44Y9zmegF0TzY8PKYsjf/OMCNOrTOUlzxQM2yf9
         bUTRQPUlwex4YxmRzMC0Vac3/7mMW3kUh/DlDuq2mnKawc5MrhvqvZjc2pXutXEbDV1K
         nc/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789539846; x=1790144646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mAIrKBvRrMomGH0iYWEN1Ps+5CGaEFImVIbj9hUuyyk=;
        b=OSx2qtBc/r+rHIFwZ8pNBLz9gbhv8ovncxqro4LoO2+CywqM5P+sHaSnSPArsmph5v
         Y7SV8y5Fb5FVe1atPoJ51khAuqQknd++N2RwmUE4Ex00XWej+hMwgoMBEGg9DPTS+OCp
         g/Thw9AVDhEcqv0cR3dBkir49sAtuXkDPCLa2lM7futROTtprJ94/XkDn1lpwfK5NQok
         GCwU1C3Nu8M2NwyrV2e7Tb9dUnPchCFuJkafpyNJTzZ0WtPglS9mFZNYIBv3/PrQVFh4
         OVkO4Uetw5N5pyGAXFcONnCZhI74EF/fOhUqYN34WKeoyWsjFl30af8yYMvaOeZq/6w4
         ywIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789539846; x=1790144646;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mAIrKBvRrMomGH0iYWEN1Ps+5CGaEFImVIbj9hUuyyk=;
        b=wOxR/rwsYDd5nFi4lWvvb6yF8ebVeaDrV0nbOYFbLZz7sYTyym+j2FAtEiD9xlTHtP
         L1yU/dBaetQFsw+HkZiMRIykqCSuIdfsSS2LbpEvylC8mAdaIVW4JGMLTdBE3TKwVjMK
         480L0JQ+i3Od6ZnolU26FFE5iEB8NuUKuSvNbhB1PcG99In7bfj4dVGq/fFlY3DKAhem
         3+W8ltMTZTVMXsGRQFzF9bFOwimthi7zyq86OqkZzjSNazHo6qBMKtuzbUvKb++/nu69
         jTipfL3pWsc06nyH07Wm5pfCxY20HDNtapEtDtVLiAgMZohPbDCMhTbxZD9Lq5kU1mZU
         vZQg==
X-Forwarded-Encrypted: i=1; AKwUvBy+UKb+rszGz8myYOXZHZvZyRQu9mJI8zgSG53WbWOsFyr+YW0vkYAFU26/yvlZv8Cq0fj3avFJ1cvbuYY=@vger.kernel.org
X-Gm-Message-State: AFuF++mJFg/49O3B+JJmnfPUnNXQk3Xzbgjl/3adQcQWYGaU3hSnquIY
	CHOzn2foWjU3gtQuFzxwb/3TNGBwm24tlAZxb6yRwGYSsbbLvH+wUi+unNnwZTy4AtPvyQxflv2
	JN8kPvLLG+7ZrGjbwUmZfbYZg7RVgWRlXnIMdbcg=
X-Gm-Gg: AYBFou0HDlrr84xg7Gk9D6FIuQWjh+Uw5LzMj09HpHyhPZUEa8CB1GeLdw9L0JxzlI4
	3IqrIwT/jQP9LEo6BJw0wMHe/jZwkz8McYein2lEdmGplGRklruX91XaiqOI/sfatAkIMSzB2z/
	/LJiXKoXa70yfVKeL9OUhIFnBcnSvlt49Y14RAVRubk8EvCiMjZtU/3RytAz/hhrCRYnc7Q1Tzw
	ndKaTYkvSnjHGjp/QJSc2y4QSgeBJvlgJI6MTeKPF06hKYpZ64dCe6+PN0A10cq34O7L70VXY9b
	e7WXs7w1RkbHkO58e+m9+I7XzK6TfRXjujT0jj99U8qTRDsH4bNuS+6NjOyITnmT+/Z2tPKGaR7
	Lv8gIw/dGPh1bAdaOGZ4v22ZDpYRn+mFJxXJcbwOejXguUbE9ITWdhYzG0K8+bA3J7eVeTmM/a3
	2Au5v0yd9Bog22RhqxeA==
X-Received: by 2002:a05:600c:34c3:b0:49e:65ac:eb5f with SMTP id
 5b1f17b1804b1-49eb7328a3fmr26373395e9.10.1789539845298; Tue, 15 Sep 2026
 23:24:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826062901.2137-1-kprateek.nayak@amd.com> <CANDhNCpEYgckCPYhjL8oQGYv9r8joP_1tBps4bGQFD3vWDCetA@mail.gmail.com>
 <a367d70f-a095-419f-83e8-5d7458204f3d@amd.com>
In-Reply-To: <a367d70f-a095-419f-83e8-5d7458204f3d@amd.com>
From: John Stultz <jstultz@google.com>
Date: Tue, 15 Sep 2026 23:23:51 -0700
X-Gm-Features: AcwNN1XqzRtFKZVAE5Q7sPJSncMNWqmLUccb5egv6CwKSNa89CMp9K55SIsYzoU
Message-ID: <CANDhNCo4EHNXY9zWhE3ngzHN_7eHpjP9v2MrBkrS8vHpTD7jWw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/16][PoC] sched/core: Alternate approach to
 sleeping-owner handling in PROXY_EXEC
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Suleiman Souhlal <suleiman@google.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Andrea Righi <arighi@nvidia.com>, linux-kernel@vger.kernel.org, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 11:10=E2=80=AFPM K Prateek Nayak <kprateek.nayak@am=
d.com> wrote:
> On 9/16/2026 10:52 AM, John Stultz wrote:
> > On Tue, Aug 25, 2026 at 11:29=E2=80=AFPM K Prateek Nayak <kprateek.naya=
k@amd.com> wrote:
> > Again, it definitely is interesting and appears to be more integrated
> > into the scheduler logic, so I'd expect that will give us better
> > results then my maybe more isolated and tacked on activation logic.
> >
> > Have you gotten a sense of what Peter thinks of it?
>
> I think Peter is slowly getting through the more stable stuff first
> and may arrive at this at some point but I'll try to get a word in
> at LPC if he is planning on attending.
>
> That said, knowing Peter, I have a hunch he might like your approach
> better since it handles delayed tasks too (tasks may be eligible at the
> time of chain-wakeup), does not add stuff into ttwu_runnable(), and does
> not have the insane (DEQUEUE_SLEEP | DEQUEUE_MIGRATING) behavior which
> has larger implications for PELT tracking and SCHED_DEADLINE.
>
> I sent out the RFC since it makes for an interesting discussion but I
> have a feeling lot more things need ironing out if w go this way but
> I can always do it later after the stuff from you and Suleiman lands
> once I can prove some benefit.
>

Ok. I'd like to try to make more progress moving the sleeping owner
enqueuing upstream as soon as possible, so deciding to push forward
with my big patch or migrate to focusing on your set would be a good
call to make quickly here.

Your lock nesting optimization at the end seems like it might still be
applicable with my patch, no? Maybe we can pull that in at least?

I'm also wondering if trying to refactor the is_linked bits in after
my change might make sense, though I suspect that will require the
_MIGRATING flag dependencies?

thanks
-john
