Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794468979;
	b=QQVapFXwB4Pe3dd+5I90M26syEAI1qoN9C/+Bb13yGaSENVilSezobYAfYxDAwruMd37
	 Rcee7Q2gkxGzhOd0dDjwWWvDqoerBNB7D84IWA3z8xXgxxjUjXiY9ud8fkriexrgZnWS8
	 nbzeZeycbq7UjhUP6tjb+zTbo8BgepsC+ja4vQquEPvCZ/Z6tCeSqnA0manonCPlxq9l5
	 IAqEYT6Rle4JKefUxuOCI2VMgN3fdxAMSKxLJwF07ufrlF7Vo1yxO/tzes6CbUcJPoI1u
	 iTyt9W3eHkzZxXrxc4FWNCjjgKpFIWz8MpgPvZB0dtwJgds1Cs7FtvuNqwf0A8YjjIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=63wXmcQtAwyCVNpBcdPY82MrHRAWOWViDW8V2M+GO/8=;
	b=lwfXhJi/lguh3asJ195AZXKfwGc9V/3tNPGZcH2yI01lMssAbqwUMnKkRSDjMZTzefhU
	 ZtXEE1s7jUw6iMlMVb2R4rcMrCLhrOnNAbZXHW0bkXomK39myw9IwGCEvdy849nacH0DG
	 h41uitbsJvyBgFHfAxhbasWzX1MXaxHV8+68/GZuXS5klZvF8DPaWq7Fzv3WCBwSW+hAI
	 Sy0e5E6ghnhAW9JiRZCO5U5N5mM/mVdWmNB4koy/Dgmjcg4arUJ3+5QpPkEbzoxyZf5mn
	 /0aDYtTQrwsX0SDSBSPb0YFzFMzrY18leG22w61rQztYkF8oKy/M6fvf18A82votbqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wxIft4T0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B2606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E68B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wxIft4T0
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c4d28f75d62so22194466b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:36:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794468977; cv=none;
        d=google.com; s=arc-20260327;
        b=GGlrEP5+4ynWwhINqR1+2MXoys5jvW/WeSbgT/gIO96XSsx0oTNVRLhv6TvX8TXrS5
         9vsU6L8BcIVKNneLpuzYf+ZSfGOch84s7u6N+tA6HPrTX9HrMjQJHYopBp1B28j2u44S
         xUwHayY1okRNyszA1Pb4PwfJpPMRk+t5DHAchahhJAx6+BObyXyBaZoAwq4tZzLfNGzT
         tM1ifOYgoC/dCjC9lRgjYKoKjPdlx/sJmEYa6+41RrXnrZs6iR076jQG6ByZmzhBvx63
         Id98gf1qtDeEddBn9zt7mcqnkYoxrrYlztO2RHwgBBNtvy1h0QaQe4yzLABBWCi0GbhN
         WhgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=63wXmcQtAwyCVNpBcdPY82MrHRAWOWViDW8V2M+GO/8=;
        fh=THLm64o9mOE73Ce/KLcmdnwf2LnaNfE82itXrG3v++I=;
        b=Ad/sTD4AuDj0EkIjKk0KiFb3iv2f2n5vsR7vlJ8I5LZrkmm2Zaf7v5LdTGvdKkoUWQ
         SMJyVnwQwm/6hXb/Dia1EBYhrQTR0JClqSbV4LkMPFyBNWiw076Zpuh7F+/vnEvvfnUA
         hlaWUuUV5EApH85IljppErXij8WahVtY0/h2+xjl44ziOOMYOytKdHPMIr7pt4VUs5Xx
         06lL7NS1T0KT2QHIm/D+4O1xRLbX9rMYy04RskZpx2quGl/WHEDyhBhDTSShs1Aqbwcd
         y+HDnLFEFLkNvfl+KQtnJ2CnSa2XIzdeXdw4B8CyloU2Be+YUThKpqRTHzTO2naHUTFN
         5EuQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794468977; x=1795073777; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=63wXmcQtAwyCVNpBcdPY82MrHRAWOWViDW8V2M+GO/8=;
        b=wxIft4T0cmv1z5/Reo2BcKlgMCIs+Q1MmV+XlUJmSYJh44Axu27u2hS9BTVUuSehHY
         Z5tcaSLA78eSNVq08hBZsuahjV5X09x7JaB5QJsYLkmyHD8pC9T3wGIeoYOXHXJKbIk7
         GIgLZjpLu5LW8TN+OlGnwW9V3YsuLKsjkvNxtp1XN4FkdnLqH45OJRAKE9mlf+sxMGay
         W6Tt4/GIExCwbsxRPOFJgve7RrmixlPLDg/aWqbY8s82ASYRueZG1vqDcnytqnQUoOoN
         BCYm4+TUHceESvwFIWXRg5Y+mILlYPtr10Yi8gxt7CS3nWz0Q0fg5PWjgkQ1A10FhU4I
         IiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468977; x=1795073777;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=63wXmcQtAwyCVNpBcdPY82MrHRAWOWViDW8V2M+GO/8=;
        b=Y+1dGq7q1xl2vdJqPowa1ihHQ9uxqd2//eB7O/tRJVecucrGuhXUQbr7M9FJ5eCMS0
         oCna+FiTZUaAjxDlUXAyF3rlXCgxcrcD0//fIp2VfYl0dNOkZadcPSHVIw+qGiTRbCI2
         knYZM2OqGVrcS35mWIMFp77mydajpiIu8hdCm+gk8QeaKg4S6zsHAR5ek5YfFjfxDVVS
         CGZezSWII/nzKeCAEAj0p+LQA+sjWFqUj3tlA/oKFwHxPVwHIycqkJiZOzgb/TouTO7p
         0CY4uk0KhR9shlvFW5azW09kkFhLLWFiHJEfStRiIUS0DY7rg9jZ7rGqazNASDsyFXFt
         oxSw==
X-Forwarded-Encrypted: i=1; AL+hErFe3a7KaxhepNjw63Z7na4zVPLT1ut5aH4KLN9NMjqvAgqtATAD0GgPKm1nJN/QC5j1Y31q/d3qQFfDF4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8REW/gO8+PccIShY1qNclZvQc7yMKSkOUeclniv8QXT5L0wgcY
	NvGPbqET63or/B7aDZBfnMX8FmG6ByuE1lp0mZzxPZI/CUcVaEd1CKOvq9EoDEJdPo2Tdn76PVo
	H8h648OCnttsmikpdCYIigmeqz1OBbqNGvQNoWf03Pw==
X-Gm-Gg: AYBFou1LPCEEsn4rUVe4MdYtTxd8G2AgwTYY81Cfoo3Z5SvWwRBB5U7ViZWJjlLuNjq
	VofcutGvJ3MihZpjddECSKxeVJlIgNdUB2TlEVRaRFaPKOlIGhqcm64of8kLYygEAU1ikmNN6vK
	4Ct2AXrE67ne6iHHzkSdsYR7Uz89Rqrg6hONFO8kTvo9G79Bgfz+s1QwzENafGv0UCU0UfEGxY0
	YQArAqGQXGkztz1XrnyfLZHFv8KikrNH/iwTrUT3+SN9Xr9u4A7RLd2sFv/gq9dF5pBdG0O+UO9
	P+1xaImwOdvFAKhG6Gr1AoeN/Rd65E3TMNfMlVY3XHNyr19Jq7ksVCpvGUE1kqPbEDcKvYgrRVj
	AAKfmxxN8LCvUaX8mNqHaIMaW9Xe2Rrv6O+EtxZDlnWjhB6CGLSramj4z9Ex4e7u5DXdHbA==
X-Received: by 2002:a17:906:c14f:b0:c2d:bd87:7fa7 with SMTP id
 a640c23a62f3a-c5066aeaa78mr354986666b.24.1794468977239; Wed, 11 Nov 2026
 23:36:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-9-vincent.guittot@linaro.org> <20261109155418.GL1779021@noisy.programming.kicks-ass.net>
 <CAKfTPtA-nrgGQGcBPqNoPk4atOHakyZK9Fk-4AsrHBrnvPXTLQ@mail.gmail.com>
 <20261111090155.GF2668564@noisy.programming.kicks-ass.net> <CAKfTPtBfQd5nD9jNdayGbEW_P2bDMvOm=GZ3Q-gu+O6KkQmKbA@mail.gmail.com>
In-Reply-To: <CAKfTPtBfQd5nD9jNdayGbEW_P2bDMvOm=GZ3Q-gu+O6KkQmKbA@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 08:36:05 +0100
X-Gm-Features: AclHuK9R2Yb38ySYLoMWNSvC_iqj6wysaQZeAeLf45aT6e-W3q4IhehrciXpto0
Message-ID: <CAKfTPtDfxesgZJ=ttSs3fqKwaWY8yt0CNnB31g2oS5j5zm5dKw@mail.gmail.com>
Subject: Re: [PATCH 08/20 v3] sched/fair: Add push task mechanism for fair
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, lukasz.luba@arm.com, 
	rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, kayracizmeci@gmail.com, 
	tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 08:01, Vincent Guittot
<vincent.guittot@linaro.org> wrote:
>
> On Wed, 11 Nov 2026 at 10:02, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, Nov 09, 2026 at 05:14:39PM +0100, Vincent Guittot wrote:
> > > On Mon, 9 Nov 2026 at 16:54, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > > > Can't we add the 'p->nr_cpus_allowed > 1' condition to rq->cfs_tasks and
> > > > use that, rather than adding yet another list? I mean, its used for
> > > > migration, so excluding all pinned tasks actually makes sense.
> > >
> > > rq->cfs_tasks can be quite large (we even take a breath during LB)
> > > whereas this list should be 1 task most of the time (except during
> > > wakeup)
> >
> > Like in the other email; detach_one_task() is also just one task :-)
>
> but in some case I want to do more than one like the case described in patch 20
>
> >
> > > > Also, I'm still not sure why we need a plist. The rq->cfs_tasks list is
> > > > MRU per set_next_task_fair() moving the current task to the front.
> > >
> > > The plist was only to reuse struct plist_node pushable_tasks; in
> > > struct task that is already there for RT
> >
> > So while plist makes sense for RT, it doesn't make sense for fair or DL.
> > Notably for DL we keep pushable tasks in a RB tree.

I wanted to add tasks srted by slice in a future step but i can add it
to the next version

>
> I can use a rb tree as well my gaol was only to reuse the
> pushable_tasks as those pushable list are exclusive
>
> >
> > > > So reserve iterating rq->cfs_tasks, skipping blocked and current and
> > > > such, should get you much the same over-all.
> > >
> > > Yes but I was afraid by the overhead of iterating this list which can
> > > be very long; We have already seen email about bug with thousands of
> > > tasks queued on the rq
> >
> > Right, so just take one of the tail and stop there.
>
> I don't want to take any random task from the rq but only one that is
> meaningful. Why do you think having a dedicated pushable list like rt
> and deadline isn't worthwhile?
