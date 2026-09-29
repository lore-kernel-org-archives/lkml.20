Received: from mail-ed2-f34.google.com (mail-ed2-f34.google.com [74.125.228.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE0D3A9605
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790685756; cv=pass; b=hR5Cxit7hhbC2pZMTmacmZ0Y8Z44c4HkslGzk+kbNC6Y15NJaElVwPHXNg7KFzQluAc+3ZpyWVnz6AHPq0gelBdRe7PEweuFkYN+oyRS/YqST2N+epgfJoczhcwFjbbYQPPByrCF0II+I1OvTPQC9idfbDu7KnNtskCkspwDF50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790685756; c=relaxed/simple;
	bh=iq3GbAK47H30JK1jVq1SeyMIDhRJ3YWEUcfYw18Hn+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KO00X34kmXrOhPMavPbL4syxEGziSc0yct5zHdzATJdc5Q4ruD63NAVcGcHZNOV1spT0kMTjBGN3IJOxWQA1370+VQtApfBqg0/TcpeGGncZXG9QbkIEKRlGS1ZE7887XgH2+NswTyoMUENIVgtL2jSYnCabmbLpC/tYHHLjB8U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hVg9Xk6V; arc=pass smtp.client-ip=74.125.228.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hVg9Xk6V"
Received: by mail-ed2-f34.google.com with SMTP id 4fb4d7f45d1cf-6aae359e2c0so6146642a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:42:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790685752; cv=none;
        d=google.com; s=arc-20260327;
        b=ZVRLHrHWKbHPjiIRF0n+Coq6Rm2FbMBtyxtvbTJE40wQwGZBGszKOsNi7j1xpWg5Ox
         uFn8f6TP3M50E1hgL+TkKfSVipKtZSk4YftQbTTFDTV1kF3zq0pAHZqyvalAsnsLmgjx
         3qouO8aXPQVhF6MrTe4ZV+CbP0BU+r7CVFD35rMP5zknOBorZ8SxXYYfwkcaF8qEwM+l
         l29pz/RyPUIBRdFN59AdUN2P66Zbq3zBild4mWFUbHeCojQYmSvNgxYki8WJgh7fHL2/
         N/R7mwwnEma2gmp7SjSimI+oQ6apOzmW1rKmxatXhQttrxzdh5HjAw2tAdRD6CjvikI5
         xjIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sZ9HAdMHdCGAdirZA5ny7SnQw/sDx70uomcyeoC8sHA=;
        fh=krNeUuXQCE3RVzcoUYv7tBQJsAmFWT+hI6gFBfYrWWQ=;
        b=a3vkB6d/SsvNB3S0RWYG1WpvOXxsaQr1UHE0yU7sqTsaE8OogPwsKUw6xsKaOrX9vh
         +17OGCfdw4VgOqs1pOuzD8FcwFAEF3zWT+uSvYCqJnniiwCNgMyq35AvDEMN1aXrjbI0
         6FGS64X0xCoJtUZNWauJr2+RyciYhztsmrpTfEo8xtxmFQkE8BBbfTLX86J1w67+qm0Z
         tWU5rtnOf+XZE+kQ8P5vdCejdlX42Chd8yhR2sRVYX1ks0UJ85Zf8svpaEOAizPlVU2A
         803Q7aNgil1jDOArPpHR95FlToh2T05QC3ZG2uPEKrNQJWhQHE/L/RB50NYMc3JxF6UZ
         nKpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790685752; x=1791290552; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sZ9HAdMHdCGAdirZA5ny7SnQw/sDx70uomcyeoC8sHA=;
        b=hVg9Xk6V+R0rYO3xgsEtgeKmjEZ90r1n9pgm+SPdqOTW+0z3GXYZfLyVy06ObVNQzf
         szhBeOcjWbCs+4Vcq1HCCmQR8KHt9rI9vXeQFZNe81WlSQ7DelwaYzUDd83zDKHlC0gt
         YrsR1/L64NpHU/3pOsseT1X2gNSeANFo3OIFQz3h7JP4tkUChBGZlLY3nSxqGi+BRMCf
         r3TfHknGG7oZxWO13mzlURkTAdlIoctXULLgajwKvrN0TgENCSmoQdfoHvSuYAbRYs4+
         1uXzAgKoSkcZdl8zt7iDzuy+SFDMsqV/LMQI/KalImgT3rD0Quj/FhSHyLnDZ62+KjZr
         xC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790685752; x=1791290552;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sZ9HAdMHdCGAdirZA5ny7SnQw/sDx70uomcyeoC8sHA=;
        b=WAkWUxMLKvtIKVxLURPbuZuLcXDcN9cf8yWLl7yHaXt442Ah/zp0iYGo7H+b05hwog
         lTjq+ynYuUPPOJOZVQ7DHO8rzeSumB6BFhFtYVtve23EGkCN85g/k1toyFcRHtzukfvY
         J5kF/P8zlBACxy+MW+lcJ+Z6jjHj2zxjx+/Q4ZnjtrcQGxzu8lIyig+1xCnwsEnQ/EZ2
         4EN0VDvUVtsxgoL7x4LEPd81US/Aceo8+J1gVMf4122KHf6O1VIKa17JOsp4Zhzmm4x+
         aKiOIcqr7CgXYcq1LxfWNrzHmOXsD6CmuPveTCextb4evHTOCNCI51TlbqBn/qM6/HRx
         hLbA==
X-Forwarded-Encrypted: i=1; AKwUvBwSFPZpVPS8Txh4TY7Ky4ROX75aMXgHhDxyO4V4mlvHn7chmlGqPLkKsEKRHRPAHxB9sLQ5R82nT/BKTBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOU1Vl1eChMc5eARx6JRdKq8jOg4p05LfaDXoYyLLBCOccP39w
	FRI71RUj4jNsEeTLZeSaTtHjLtJks6Duvy5QPdvBCGwDFz6TblsOdbF2K7rEElpwNPwS/FigVgY
	erkqMj7JW4VbJVDIS9lbsM3fXeH8EH53WsopQrdjr5g==
X-Gm-Gg: AYBFou1W9+VA0/Yc+mOYtxgUNJ9sY8yHJG+Sgf0ImOrlxVprGjenHRrj9YuAnauLB5v
	ictFplQEQ5b7Vpw2ZyLLFHort4QCkHeVHWanv8wDIau90zM0uh90zqXfrMF/390nLUvcTpIADEM
	b0wI0tm2aO1Tz8l4ohdwXAavgHEvf/O9/bwd/aFlzatMF2oO6LTYEHumz4bg7qHSAdznNd121Y8
	1bT3oJ3lbTZec5Wux7Hx9Oi9ZGRYvmPl2KklENnIm78HuoM7bbOUdYARVWKDlXNHLzYTZl/MqBg
	7PQ0bb8QJewI7UFZLVVA99LKhogLHqIfyc3tcTN1JbnVVn1JkicrepJIhGvQ1UczR10NyVvfRRG
	/CX8Sq5G84taC
X-Received: by 2002:a05:6402:4551:b0:6aa:fd94:4e61 with SMTP id
 4fb4d7f45d1cf-6aafd945156mr6626649a12.42.1790685752363; Tue, 29 Sep 2026
 05:42:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAKfTPtBAhMVa02Z23=nNZkx7Qum0x=U_KDCn=Gr6Pnf-SG4N5Q@mail.gmail.com>
 <20260927074523.14558-1-kayracizmeci@gmail.com>
In-Reply-To: <20260927074523.14558-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 29 Sep 2026 14:42:19 +0200
X-Gm-Features: AclHuK99krqbLsQUNGGdR09oHfnv0p3X8gPykqTe2kwbPQPcgUONaOnaO5vOsOM
Message-ID: <CAKfTPtCyZRjjDWQxoHjG-SdJueTXBCZ4HesjPT0sPikb_dQtEw@mail.gmail.com>
Subject: Re: [PATCH 8/8] sched/eevdf: Add min slice check when selecting CPU
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, qyousef@layalina.io, 
	rostedt@goodmis.org, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 27 Sept 2026 at 09:45, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> Hi Vincent,
>
> > > > Add a new level for selecting CPU when select_task_rq_fair() fails to find
> > > > an idle CPU. This last level will compare the slice to select a CPU where
> > > > the task could run 1st.
> > > > This helps a waking task to select a CPU where a longer slice runs
> > > > instead of one where a task with the same or shorter slice already runs.
>
> > > > +     if (sched_feat(SIS_UTIL) && sd->shared) {
> > > > +             /*
> > > > +              * Same nr_idle_scan hint as select_idle_cpu(), nr only limits
> > > > +              * the scan when not preferring an idle core.
> > > > +              */
> > > > +             nr = READ_ONCE(sd->shared->nr_idle_scan) + 1;
> > > > +             /* overloaded domain is unlikely to have idle cpu/core */
> > > > +             if (nr == 1)
> > > > +                     return -1;
> > > > +     }
>
> Ain't nr_idle_scan shows load of the system? Even the comment at top talks about
> idle CPU's, but we're not looking for a idle CPU right now.

The comment needs updating because we are no longer looking for an
idle CPU, but we are keeping the same limitation for the number of
loops.
By the way, I'm going to merge this with searching idle CPU

>
> I may be getting something wrong, so please correct me so.
>
>
> Thanks,
> Kayra
>
