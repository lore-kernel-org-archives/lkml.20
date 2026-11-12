Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794466892;
	b=HCET3PZQHWzjv3RVeaH3TA5YgGmoh2LNujlExHt2NhLEr30PsviQ55y/bZ9yUIzXW24R
	 rHE4Lkb1u1nzs4zg1RLwKCimncHKbn/VD/7i64TyRosFx2oZJNe/IVuJltU5nfSJeM0TD
	 v2P5I2zMWCB6Va2cp+Ai3ZVvFjiDtPbxO/Uglk1+soKw3MWxOwPZFDYBKUMI22m50Jrjz
	 J0kagQqe4i75YsgpgG0JkV86hCoOGVshPmvcLvmr8xhb7cjiV4F9QLCx/MbXJntPwBJT/
	 VdZXE+73YOF+zLxm86xSdq+uZS82/zc0Bev+AD5fdyCjBHTQH+X+oGuRFO16jPfap+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794466892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MSgj+o0QjwP2h00l2eEN+Ttef4mTAsT4O3zROWvRIfE=;
	b=FdVnVBYhKWc85zIrt9jSm0C+YkBWX3SNUqP89sX30Fp9h3IOfxaWJYJcMJtxHgvPY9XC
	 B4R2NgPVu+5URZBLcrKK6BhyyKgEG9jkEzqp7iMLuoLD3F13OnxOA/YPgpY3wi8on4I91
	 5DbGE7A6UQx5PJ9y4lx+yZqQl7BZRtP4g2YPiduQOIRls3jLRYNxFSNlwVF0lCLwfUzsU
	 +AAtWo+P1tNzPnCYFWvoIiqR4xG3/OeRbRZpY0eZouE/xUa3mcP1GyM0pAA+MtYauMj+3
	 xzSQAB2Hi8vib4sVWdB0tpqIm9Xh5VtgLTW7j1lH1ICWBRYu83JnJFcOyvDA1E24APw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rmS+WN59;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCD3606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FCD3606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rmS+WN59
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b750e40ce2so601141a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794466891; cv=none;
        d=google.com; s=arc-20260327;
        b=GcKBu7OsBAx3Ru9cZnBkPr2+X13LujKkqgoY3MLKE85vahizyIcSWa26MDzVp5dFZU
         QzXNB4APi/Vq3b4JE0SCuEvGBtv6ikWHjKirkcPjd+hguhahQ24BFHCHNstSIRJyyZA9
         uY9320NBluhj3sqqwwA6KYFZLmWITwP01I+lJVB+CbG1IGTcbv+Fb0fojozWhCYLPTOD
         hKF3/B5jQeaBHnfGYQ+NWsy0CXf4bu0XBaOcQWVGOVan7x2mvo9oSK7OyQa3DpgiL5xo
         7DMfXQkWaT6UMBJOcIDOcHnNK33Fyt0CoLkB6lWSqxV1JuoYTsTubtWpTwLYOItCFtD0
         sw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MSgj+o0QjwP2h00l2eEN+Ttef4mTAsT4O3zROWvRIfE=;
        fh=sCh5cTePk49gP/rpCaC2+q4DPpSdq8BcXF6Ox3VA7v8=;
        b=e1MYkaiA/vXeh2vT3TXb2coO9/E5P2KRnHCU01iP0dyPUPlWVuaS3jnSTGToDndVVw
         bx6V/s4h0Orqf/ClV/bd+VKGmspsbmMg/q2K46Xbs/6C19u/tQ7z/+5viwggX2p4H9qC
         oA3Jp7dCaw87zX0N5orBpYm1jNVwNw4dEMG/hXCHzasnmvtv19deDcAHCkX1sHV6RHcu
         0Fn97q4JykyBDAJ6NC9Fn6orDoVV84mPLLJ/pM4N5N1QaxGr+lJOhyKYxGzuH9SJ+pDq
         bcMlR85Yhn+ZU5ghhbh2kqgzZcsNoQmglnTrl4BD7VCFFY5+CchC1qmSg3ePhshRuBvy
         ludg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794466891; x=1795071691; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSgj+o0QjwP2h00l2eEN+Ttef4mTAsT4O3zROWvRIfE=;
        b=rmS+WN59pRfu3zA88Ph9vwJg/f1cxiHLZyCa6G6ikfkSc77VhNYJeKMsXE1tupusLq
         bCz4LUKrMGwryaY4QUT32wE7dSIyFG82glovFDyMk+VrHj+fzLvK0o0e38esqbmYORbE
         Ea2COIULhz+egmEIIFJmvYVhKhSWLoDBWHtOnSDP8+VrDlO0uubcTBg5FC875tRyWzKj
         Pplp0az6Ilcy1phPVzdYpE+0d+intL2Y1bpujSVtTUCGF1PTXOiwu9JW8hcjIJDaFT5c
         8uey6h23M2rMzyPEspzGOhwzdOqW81oDbmGeLuA1K/0v43cZfSQ+f5lpyMEnRVkcDTgZ
         GEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794466891; x=1795071691;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MSgj+o0QjwP2h00l2eEN+Ttef4mTAsT4O3zROWvRIfE=;
        b=PxvVpMGY6EdpUoDzShnjF2i3nbLmokOu0G+vpqqrNNyBDxoytQ3e2wg/LFDtho6wJM
         HJ/4ELxWd1NvAr6GfGD3JPa44PRLnZAFVBSEvkso1hyapYnxTe7z8551fqrPNhyOo2Im
         Atk+FTIa7wwGMRGendwbqljcWJXitSnkTAYVstQHlAzqIWyFI0QD1zGglVak5vwU30z3
         ge2Oe/2OTbcfGyC0T5JgK99ePgqNnujuPJRanIsNK+30cmlzeWgsvQaEhZqB/RZDlvYH
         FwEjm7QIKQGtZMLefR7m1hxZ2RXtRDMCEqw9rAcek1xQ4Kv/WGPLloBbs04wD5YlCEiG
         rRmA==
X-Forwarded-Encrypted: i=1; AL+hErEkJX/Se/1cEUfaeQU2tVvDgMfx67oD+ekoZqoehEXFpSlB+JTos4kTSgECpx0tdvISALD/wGwEPmJvAe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Nyckbc/FTB3Ee7i/auaz1nDoPy4PQrYVctDNJYqwPTDYmuWrI
	DHg5zxojqO2ZdjAmyW/gV69xd+a1KGZ+gcd9kJ7wHg6hzAQk80t5fgYoSFKbBb3vLRmc9BpedSd
	s0s1uf8gtXpUFcK5tYBZezrtBEly2qf94RoCPcjSyuQ==
X-Gm-Gg: AYBFou2eLyIxFrEeFZrIunCKZVR5wU1/1bljiFmTz0cA7lcP+ewa1vtvY1+5ZSCG7ap
	Sc45x6vncu5F/PqVX4z+vFhdwbJizKAWQ83Wt5/EexXtVSzvwh19ZI9eMl0XCh11rOODik8AKm7
	2jHR5JqiZxo05g3hNR/+uRoTGam/B7Ay5kI+K4crY0LSdCy9AK/t5C4/Pmw8VLS/0Yz7wP/s9i+
	rBQAtLrJT021Z1EeEcKM9wJiYT47ISRwvuLQoRcJ7DcleUHEN3qcRdItuPg41PpGFkkhJFj97lm
	mM14+2xDx4L8SUMhxxN8AGPvQjyDBTLxj/tHQCCpRU/Tj5KHccuGMEFymV+GT0WdTxis0S28Ifj
	8rsS3ro5W0fXS5rNanfRcDLsth+56M7Rz+7Hr48sMjotAObfAFK0uftB7W3OHTqXM8TVJFcxUG0
	ww63Wxq5YpOy/3J2g=
X-Received: by 2002:aa7:c606:0:b0:6b5:94d9:10f8 with SMTP id
 4fb4d7f45d1cf-6b7773f5a18mr2509828a12.21.1794466889315; Wed, 11 Nov 2026
 23:01:29 -0800 (PST)
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
 <CAKfTPtA-nrgGQGcBPqNoPk4atOHakyZK9Fk-4AsrHBrnvPXTLQ@mail.gmail.com> <20261111090155.GF2668564@noisy.programming.kicks-ass.net>
In-Reply-To: <20261111090155.GF2668564@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 08:01:17 +0100
X-Gm-Features: AclHuK8UVt3x6vMPLZS8pSfeYTsVIPRoQvrz41V51tB_Ja3VDFaTVes1TsX82JE
Message-ID: <CAKfTPtBfQd5nD9jNdayGbEW_P2bDMvOm=GZ3Q-gu+O6KkQmKbA@mail.gmail.com>
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

On Wed, 11 Nov 2026 at 10:02, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, Nov 09, 2026 at 05:14:39PM +0100, Vincent Guittot wrote:
> > On Mon, 9 Nov 2026 at 16:54, Peter Zijlstra <peterz@infradead.org> wrote:
>
> > > Can't we add the 'p->nr_cpus_allowed > 1' condition to rq->cfs_tasks and
> > > use that, rather than adding yet another list? I mean, its used for
> > > migration, so excluding all pinned tasks actually makes sense.
> >
> > rq->cfs_tasks can be quite large (we even take a breath during LB)
> > whereas this list should be 1 task most of the time (except during
> > wakeup)
>
> Like in the other email; detach_one_task() is also just one task :-)

but in some case I want to do more than one like the case described in patch 20

>
> > > Also, I'm still not sure why we need a plist. The rq->cfs_tasks list is
> > > MRU per set_next_task_fair() moving the current task to the front.
> >
> > The plist was only to reuse struct plist_node pushable_tasks; in
> > struct task that is already there for RT
>
> So while plist makes sense for RT, it doesn't make sense for fair or DL.
> Notably for DL we keep pushable tasks in a RB tree.

I can use a rb tree as well my gaol was only to reuse the
pushable_tasks as those pushable list are exclusive

>
> > > So reserve iterating rq->cfs_tasks, skipping blocked and current and
> > > such, should get you much the same over-all.
> >
> > Yes but I was afraid by the overhead of iterating this list which can
> > be very long; We have already seen email about bug with thousands of
> > tasks queued on the rq
>
> Right, so just take one of the tail and stop there.

I don't want to take any random task from the rq but only one that is
meaningful. Why do you think having a dedicated pushable list like rt
and deadline isn't worthwhile?
