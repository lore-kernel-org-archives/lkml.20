Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D0D3382F7
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788299783; cv=none; b=jTi4SdG5g/taTXmW60syPmPAyNTIimDEONsB034mcq7bTwWHXDeFVJXMykGWlQvUVX26bEOGKHJaGdo7aGqrKo0To8xJkqHqPAXJnEhsRNlQceNgW2924ItsT2W0alvoaQjwR4GqVqYiSGUUkhy30qSuDkmBEkLZdLuYoDL+xzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788299783; c=relaxed/simple;
	bh=7zwdE/Kapt8Qqtq3tLR1SvILWQwjjo+Ux/HhUXxRSfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFHUynWUi0RMjbZaJDXymLAYrvwvTieL1habKuNrbMo+oBrLt8HCK+Le2hzAfLDoSUt9d/PsImtETjCHD9u/JLsDoKEf8yGW3a/Ij8a6+9QH/xMvVB6HOt2E2wnceI6usKy1g4qdnSEwhg08vqLifOecmRhZVYeAjHAlY4SZkJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=SkUGPWlh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="SkUGPWlh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a082b3671fso515545a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1788299779; x=1788904579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcWsqk4QwV9p4HmgQz4pQ5wr52Viv20JTF3B5LxAuUY=;
        b=SkUGPWlhkd3pLgbS5mMZDl9byXyXhrlhETPQMjMt36yhsSquyzJ+5ZFH5yzQjSUTx8
         rJMwC3NYJff2uH1v7VHzd+fD17gH7Fd53DRA4kjGXqKq9CR41trJUq86F9qAJykw7iz6
         ozy89LfkrKe9YI9IvBMR16Jwi1AoKA9GeEncw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788299779; x=1788904579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FcWsqk4QwV9p4HmgQz4pQ5wr52Viv20JTF3B5LxAuUY=;
        b=WceGhzmfafMQznM++ZDzSMcqiL4J+KqvOBhZY/oVo38jKFZz7ImbEpKSMOoAmzx2iO
         iB/srBOv11mjS1zp/akFEDN7eAphfFaWZj0RLDSIQpdkQ2ihDLKCBBc5c1xwVEDtIl5H
         O6SkNR1+54TtsCfu6Ws7pcpRyrlsgr4f8p58tjs/iFIpSe0X5ZI1yoAVz2RJ2Q1GAJeH
         8vqdul632pd0Fu3t2D/g7mDVo3Q+XV5tD454tXB6OVDUqQVh8eCnirYyR/AGAYTAFJFc
         6CNda/ZInqvOkshpsH57KvlzUJsNAWQA7xKP/cl61moo0s+ILhVzWLKElXOChDn/rAt/
         FllA==
X-Forwarded-Encrypted: i=1; AKwUvBzpjVxlIXDOkCvkMnL2tOuXcWTaltrXQ/c1xi/2rr9crkvZdLb6O3ps5FAEtHgZrN0gxZLSjZl4h4oPwio=@vger.kernel.org
X-Gm-Message-State: AFuF++nGtDaVyadwBGgfDi74YE3OHb61hms2mNicNjtR+3s75AUEueF+
	1C9ynelsQqjk/ZaSOaDZqFb8oVYhMy00/xiEcX6EqmyaZpTf3rFHjGvedHmByIBQKVwWV+c5jjK
	u7Iyi284=
X-Gm-Gg: AYBFou0N1AsxsKEMkgrhKryCkpWFz7pcgSksox4oBy8f+q5mvq+hFX6jjovMeRK6/Aw
	CPx6rvfAUeHiZKZpSaRA9RYO7+uF+X2WbpSx3d1/8j4HmnFwA2TD0pPsSxfQ0rwly/efdnr+Epa
	CZiIFM/HzbN49MIYaWvbV0bGpah+K3hz6qFuYdJ3vi4AMwZeKVr8We2JPo1jZkTh9p2pxXGvUn+
	KnfvLcmSfNTXtT35Rz1IVY6jR1Yla/hasVGyb9pHv4gQSPH1mmhVdVWJTgZsJod58OxRgz7ZrdE
	RdE9obrqcQ6bb56YBGQiew4X/QbuQwDFLCiDLWDTvN7MMGvNgkxyYKSHMvAkaJ6zdgjKcfpvO8C
	V3r7Wlg1M7McQt1lZhEiUSw17GfOg9f/EaJk52WNiJBlArLqT2PZBHqTGrv943w9BEFGzVA5Vhl
	NrO3R/RC+oRdzcqV00WK5MZvg85rwLjRTXtFLtyaH+2nvnh43jJQGrfisVfkVPkt+fNhM+zVtz/
	pZmVKqQ5oO9zeKr4CQSp5NM+44de6qNksB+IzNUtqeqp0CJ
X-Received: by 2002:a05:6402:2552:b0:6a5:defb:c9dd with SMTP id 4fb4d7f45d1cf-6a6829af632mr406171a12.11.1788299778926;
        Tue, 01 Sep 2026 14:56:18 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm250829a12.30.2026.09.01.14.56.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 14:56:18 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c160420289bso37384366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:56:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RopxwOm48wm4nDtjMvexZgUJwHE8Zib1B+vQsV2uNJHCG5eB6e9j5gNKcRaOwHF59Mv1+6UTcooXg4VfbM=@vger.kernel.org
X-Received: by 2002:a17:906:478a:b0:c08:417e:3696 with SMTP id
 a640c23a62f3a-c25d554d729mr14971666b.20.1788299777656; Tue, 01 Sep 2026
 14:56:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bde573c1a758505339239f08be28788a34dfcb73.1786121949.git.bvanassche@acm.org>
 <20260831214437.15d6ad34@pumpkin> <a771af57-40ee-433a-be84-9b7c3e6965c5@acm.org>
 <20260901092043.7feaf5d7@pumpkin> <dca931ff-5995-444c-9f89-6d6cca4e71f3@acm.org>
 <20260901222909.05d6239f@pumpkin> <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
In-Reply-To: <1b86ccbf-4e41-4a26-9d22-8bd93bacb043@acm.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 1 Sep 2026 14:56:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
X-Gm-Features: AcwNN1WqDq3x9iOe4gCewEsDPGHQdiF_96OqaLB_A5zVlBJt2wASvl5OHOP4zFc
Message-ID: <CAHk-=wi_3xdtBrDgUxw5xtq8a=CdyRJnceo7YJg59wqqdXwiMQ@mail.gmail.com>
Subject: Re: [PATCH v2] tracing: Make is_signed_type() compatible with sparse
To: Bart Van Assche <bvanassche@acm.org>
Cc: David Laight <david.laight.linux@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 14:43, Bart Van Assche <bvanassche@acm.org> wrote:
>
> The only generic way I know of to remove the __bitwise marker is by
> using _Generic(). But that approach has been rejected by Linus.

Note that what I rejected was the "check for signedness using
_Generic()". I think that's both disgusting and fragile, because it
just lists a random number of types and then a "default: false".

IOW, that use of _Generic() is just *wrong*. It would perfectly
happily take a 'float', and say that it's not signed - no warnings
anywhere. Now, we don't have that in the kernel, but it's a random
example of why that complicated macro is garbage.

In contrast, the existing macro is *not* garbage. It just says "does
casting -1 end up being larger than casting 1". Admittedly it *should*
cast 0, but then compilers are unhappy about comparing unsigned values
against zero, so it's not great, but it's *simple*. It still gives
random results for 'bool', I guess, but is bool signed? I don't know,
I don't care. So at least it's simple and not clearly broken like the
_Generic() case is.

So I think the right thing to do is to make sparse happy with that
expression. _Generic() is *WRONG*.

This has absolutely nothing to do with "removing __bitwise". Because
__bitwise shouldn't be removed.

             Linus
