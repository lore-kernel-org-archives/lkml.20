Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794468801;
	b=azX0eAfekeDfdQz+dutj8I9wrMGox5y/b9lUuuU8ImHh5fGDFQaxZxSupn97HlyMubn1
	 ldLYzhKPPzzwmI7xKfXWR9SGPT4VxHoVPLVNYvlMMayvKCViMhYs/1+iHlqw/IppEXe4T
	 01e944337dkVushdShttN8gYBCX6nJ459Oi2i4CybdJVWXkJ9M60LYEjd2uUcfSzdyS/1
	 wrwMwgOPrYoY5ie8m+s7dVbksdkg6FCONQ21MG0BLIP/m2Cv9oYOJ6jhvFN9S/Qtw+3f9
	 q67m73ayBZ1c/uQC94ebgX8Mn23RxjGMLQVF+G2KXqPKksLRcDkLgsT3g3vYYZfib3A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468801;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=1O8ABzkG8YTENTJXF3DXPni2PNJOE/E2+2rzStU6Ez8=;
	b=q01FpjApJtKuZzMmfYgyTIwC8A9SUHSViiS48sSEhklt4PAxryW0Lmq8cAYCppZFhcj8
	 XPvgpk+JMRETkDBJrIMZOR3U0769O6Ziz45qsNdPQYRL+N9ThND5IQ37JzugIoGxB+aB3
	 dOLPDAo6Gy+/zfsD/US/P6pt+k/QdT8g+3RIwEeoLvg6NFNjhwvVJ5oiwj4ITXy8YKMYH
	 4/FeJV5DhLXAFChdEynyPP3FD53Xc2kSGSVETFEDdq9ZZ0cFk/ED/+v+CPcDlNN/93a5p
	 HISNZ0mCIn8XOnbB5zqiPyQ7/tChSJPDf8TMEzTvsKpvc9QwDNEDYLY3yVjAkSwjq0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=amYZ82FW;
	arc=fail smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB33606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:33:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB33606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=amYZ82FW
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so795949a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794468799; cv=none;
        d=google.com; s=arc-20260327;
        b=jYXNaYBrjlTiMlw/fOo+7ebPBpRyLUA5mGf2PG+fsLJgNrkJfYGL3VwwH1UqdgPAGV
         C+cJduabxqqqvz25NCKNc+jvCdrIgVBIROe8yFpPUi1TttLyfkIf3H+sXCUMbKQG9ehl
         Zuv+Owwv5C1K5pmxO6ldeQdvk9ZnSeNOQcBRKPJm9N4YbADiO+rt1H1Xa7Y7Rvmgkzs/
         MD3lzkHlEEpHmAgtr2tuTB1UlYODVcES3UFjT32boDSMeuLUPmSCOFl+adzvFXMDfY2b
         bEj9FZBfyjOiigPoigCoUFvdJrg2B0cNt+pO8gcjxXzYFTWklmoDpv4/P5tabLJIXGPc
         82xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1O8ABzkG8YTENTJXF3DXPni2PNJOE/E2+2rzStU6Ez8=;
        fh=w0/EznwQknDc9ZjczFZqxeWXetSvZIRHytVAj8CXi5g=;
        b=caanKeSWT0omGxZQxeHIN5kB9L71LugLSC8jviNIecID5AoXHLk4wooZhrjgpdWdOI
         8m/gDn67Ro6zLf8IH5YAEt3OwOm0vGbmWQZLiTkAEuaamwEb7i0RgzZWkBH+gOF8d5VU
         +p3TGd+2+AFrrGL74T1EK5a3PH7FLFzrjUL+sLjCDPLCmNwt0PR3dH1y/0KQnX8uCi3j
         fhf209XhZUqXxsTVp2g1eE2Z2H8ofe8R9lZhS4dFV5payduuYhYheqJvweKdD2JluZGS
         05Rvr+EfWFTXU3YOkAVCLPb934JkjAd9wgAlQtuUpT787oMNv9pnYiPN4JivjTIJJOqb
         JguQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794468799; x=1795073599; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1O8ABzkG8YTENTJXF3DXPni2PNJOE/E2+2rzStU6Ez8=;
        b=amYZ82FW3o6g+B/GcoNBqV5OTDLk8i6gPvFLe5TaaVQamS+IHvnLV8zt5oNTkwR3jl
         J/K3mDVJSWLJDjfnzvNRmcJUrSZjCo0jvD/eO1DlNYzeV0cmAgz3h/lEa/qUNWqqIhIY
         kDq+f5rXK2VzB5kSYSQZBOEeQZatz0TGSSfovehcSsJ3pns0y+/SmEnwNIY+Hj2HV7z6
         WGEwyY002cYx7a5+ikVJhYi+4iU1txTjvTjqR5NZOScN7241mI42dXXOASFUrHURMGOg
         4j2xHzzd3s4IIN2WGMIMA8m9eKhtA9t3Vtp5JzSuGWrdStCwF0AiOWT/kNfRUmgHRrxw
         /H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468799; x=1795073599;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1O8ABzkG8YTENTJXF3DXPni2PNJOE/E2+2rzStU6Ez8=;
        b=iSy7MCokHMPs4axWyjtXiKBSJ7dFyMRlQPzXASULeVCBf97o96OgtCDitr2jNSI4ER
         qTmwHFanEkOcdNQmpT92Ls1A00dOkFyDCMPt5E+G1UiOXGvjQrAf1NjkhHAjzTvwukXr
         Ql3s/bWslQ4GkZoa+wkciJT0ozV+9RQ7OVumZ5mFZI11KjMHgOyovt55yKspCYLJZ2xQ
         ckm2yb81PKCMlLVftfxx/WksaWYTwzq93jg9cDNI1mIRsPuU/0pZv/749qN+JElpyV1J
         UtByWScdZISBN8k8UZE1kfJlov65kfo9Nl0Q6LG3pgAg0aUfIwIqXFGEpb2OrwzGE1W1
         v2Cw==
X-Forwarded-Encrypted: i=1; AL+hErEl3kG5+IjgFwOh9DyB2kQ1hRzWYKkzP88yi68eurJUuFNazNzxl3iJPAd46s9Zi+Nw9B+DGBhHCIz2qe4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gSOyU2vWjvD1d6XVx8sm0UzdrAuun3N8CVWrTre3pyZ5mVppk
	V7ze7X+pocP84rrSPlIK9zzOmCJ3WZ09X6CfqJYM1MVuwmK604B6FtSvxeNIL57IvD0BNWt3YkL
	fLXJL7ZRY6HhW72KjvVeNCz8c+df6TUm9BQcN3+IJdQ==
X-Gm-Gg: AYBFou2wOv6airj2xyZqUilII/0Ba66WvtO1CqHNCa1MDZmrroXVqEcppRTYcwPxG6t
	mnojz8ES/8WWa+UfISDiO1JUXF3MNJtoyplAXzOkR747cLZewDkfrXyANXs2tRTVDg/L0PGAayC
	m8y+6QwXffQxW7J1F02VsENIXRR6fanznxJEu117uVT63D3TP0vIvO+exSTdLAA6c0UgxEi3CmF
	Yewkp2E7ICjYl5tZvsVFuRnzN5VzEp3MiCzIMbFDkBA6gKIZYorVSBdxqg9hlOGM2Lz8zwPJSiA
	YW9he+GZRpW47aVARVCNFmgVtpGrtNNCvOdhEJTepwB09DSpnu+4y0QsRHh9yhZmy3Yag+Ojaqx
	Ip/LI3MA8/3IyzJbeg5n2K3XAh1Q4W4PCfX9W7LIQ7RI/YGJTGIg585U+Zfx0HX7d8S3zJy+Ykx
	k1eESGYqqDqlK+DBE=
X-Received: by 2002:a05:6402:1514:b0:6b5:e088:eb92 with SMTP id
 4fb4d7f45d1cf-6b7777064a4mr2609898a12.34.1794468798919; Wed, 11 Nov 2026
 23:33:18 -0800 (PST)
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
 <20261106151947.3991524-3-vincent.guittot@linaro.org> <f0bdf36b-4453-4d2f-b82c-85d1d62c5f78@amd.com>
In-Reply-To: <f0bdf36b-4453-4d2f-b82c-85d1d62c5f78@amd.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 12 Nov 2026 08:33:05 +0100
X-Gm-Features: AclHuK92tODV1WML6aevk1idgLovQjoH53-Z16DSkLaGxCj8dkYMqR5c5OIoS3U
Message-ID: <CAKfTPtBT1anicEwxsFRNbO4FAmfmpAWT0q-EyHqW2EHgJeORUA@mail.gmail.com>
Subject: Re: [PATCH 02/20 v3] sched/eevdf: Reset lag at wakeup when prev CPU
 has been idle
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, 
	tj@kernel.org, void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, kayracizmeci@gmail.com, 
	tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 11:04, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> Hello Vincent,
>
> On 11/6/2026 8:49 PM, Vincent Guittot wrote:
> > @@ -8376,6 +8383,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
> >
> >       dequeue_hierarchy(p, flags);
> >
> > +     if (!(flags & DEQUEUE_SAVE) && !cfs_rq->h_nr_queued)
>
> Should this also consider DEQUEUE_CLASS which will move the task out
> of fair class and leave the rq idle? setscheduler just adds it with
> DEQUEUE_SAVE when moving classes.

Yes you're right, we have to update idle_seq when
DEQUEUE_SLEEP or DEQUEUE_CLASS

>
> > +             cfs_rq->idle_seq++;
> > +
> >       if (sched_feat(PLACE_REL_DEADLINE) && !task_sleep) {
> >               se->deadline -= se->vruntime;
> >               se->rel_deadline = 1;
>
> --
> Thanks and Regards,
> Prateek
>
