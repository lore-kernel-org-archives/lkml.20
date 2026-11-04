Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793780814;
	b=g4lSPjVg3eRbmVlGJgmQ0eQ5gwmg9eiYLn7vc0jWkaDws7/9XsAtUR3PDaA7IEWgEl33
	 uoieRGAF1vfBLhZPEVapvnwRCzWCJg9A2Og8/b6vMloLDCYy+uI/EF6BK4AQIhUY7iUPv
	 GG96tZHmd68aHVqlyU3Cscg7NietN9064kRNatbNEXBaHiYY3BAFERPEmjfK4SllNm9f9
	 pT2ooj8KzrhlV9GPy8nv1+5VcY5Rl1Bqsl3GWLhDPVGHldnq+MEg3AmHqsTM7zrSWbVK+
	 vxLBrRP3y4KmkLuuy7OIwCCtw/T/P2Br1uvtppHuO9IwFxUCirinj72kR1gUvOYzEWw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793780814;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D+vnesPE4t9lKIynjQF/EgK23seabQisbWfdICSw+rI=;
	b=pATLOUJ57nKkBYd1Wgqz7yWSu2b9FFDzi79z8kMQ+Csg7KGi74WFWWe5PalzUCsVFTjO
	 XCef0nr+DLXC0INTcAdzB3SBVY48Rqs24d16KoBR/Y6Sy7dTpQs8w9syqX3SXh4Rn89sE
	 rGG0yDOf6mKo0t/QFh6CeMU7fYyPX7t3UZ4o2cTwL6ia8tGLpuPeii/4O2Jd6ucwPOhPF
	 82pb5vVmEeUwx5K2CH/ZHqXY2QquwOaMVq+Ktlx2wV7EDa2JV5iauFaGeItXnbxHNgjaC
	 WCQep2BjJDxrGIcH81ttY/M0GzPX918EpUCMDjafELz6GHQtzzP/HT8es7fGkeGpnKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=egv69oqv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B76606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88B76606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=egv69oqv
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c411e139259so44795566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:26:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793780812; cv=none;
        d=google.com; s=arc-20260327;
        b=SzFMvvIsxuXFMPB9tRiy8pfd+m6mu07I0LsXsNuywFlmNGBDts+D9zDniaTCl/txFj
         BwLiV8KDuZdm2U9AGuYhy4F4WL0N8wHL7PvPFXmHEojUOHrlUkUyynS+Nf23Mim6ouqt
         wkSXS8DlaRJA+pGsBZxrsoHL3ngSPNmg5GJi03rwJhVGdHmd92XLPS2vfA6b6N+cRf/9
         pAqvt2kmvd38t6KsSfppq1Y400GrhGPpjaF7xSvSx43UUIZcQTvWZjTzD8/crzsT0qtn
         WG/90l3vpsRrdIre/vScGgt+U04cYR6dBISjSZ/mRQoLS8PMWk6yTEK5qiTerlpCvrhC
         ND/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D+vnesPE4t9lKIynjQF/EgK23seabQisbWfdICSw+rI=;
        fh=yvEizVWiV2AWQzB5zcDkqn734dCoR0rdxn2qWXrYWYI=;
        b=PjoO8m8WeG9JEktQEwGO51INCTxqRv6XGXruijXow4QXKrlr7GFBJCg1tm2UclO1r6
         ogAi7WNxgisgfPyk9QLwOLtnbT9GwWRXCjIg5JepetgNdq1KSNMpJ+su4FPFxBy//7Fp
         0pnctMMt78pRlZpJrWFMRJ16esPw0ff1hOz1mVQh8hy/jtIAuMwgWpjnQlnoOAIKPG1f
         hyEbsn2zKiB8/oYB71kCV1rWjR2wZN4tXK8S48CupVWEiDSzn0VzJtv2TdbGiOuMnOpB
         oTzwQtFanUN6qthvxjnzUYZhwIEDNPveqSxtvW9Fzwj6gwz+tyeeqx4rej9k9nayr5U3
         t/3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1793780812; x=1794385612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D+vnesPE4t9lKIynjQF/EgK23seabQisbWfdICSw+rI=;
        b=egv69oqvcYpneqpYilpQ6uvKgAp9jW4GTNrz7YWaWOHv8GjmtlF5KZPPtwAqnbfw/m
         s08YuDBwW9kGihk/vDJlFSro06K21qE6qojoJUa14UyY2A9K/uE2DZvMsgCirsdCC7jV
         xmjVEeXdTz8Z4bk3ltAh8qWMjgflVD/7Xit8UyMdzN7jsXp4V3Y7aqSE35wMkDK6zL7f
         CIWoaOpQ9S4XzimRwbSthlAgcAVx+zyVl0GkDDzZRFu+4hM0MRE/PW6WAYGfs7JeqsHB
         L9tNxGu839UKsnyirB9eqvmFU8GLfLq48AiahckTSEiYJc8Jcm+wrlzUQc6rhMq2zXmm
         NKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793780812; x=1794385612;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D+vnesPE4t9lKIynjQF/EgK23seabQisbWfdICSw+rI=;
        b=0JYlP/zd2r03HFE5PSTTp7xVeAAP7IVzYaROMnf2CrMPiN9lPx266eONx/ZGPhWSMZ
         eWgx+vyGiWOzrMKWKJybQh5X+xqaxquSEwb2GD+PC6rbh2sbYaoE3rvQSyTMA1XbHQqG
         ciC0mdkwqfwmiLEHq1iSck/Yk30TyD0wVXqVzikxtcWgIeIGtysXHg5CWD4FU/gCqvu/
         ddrBe1UOoRhdJo8uBCWWPwEluco0732x0p75+QUT5dahjPZ+BtWdDF4uYvb/iCkS3Bg9
         xN43i4JfI1Qwr1YOsB+DEZ+9B7MMPYAyxRNWvdI0Et+quLvNp8a2K2mAC9eU3y7ScEOW
         WoJw==
X-Forwarded-Encrypted: i=1; AKwUvBwAsIgBc9Rp61unbmRXhW7Ogu/VxeyKqiKXZb4P77GafRG4OusjsxLYVwgU77LGDH9Wesc+wYJ5Bo5UE6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DUlENC1QKYGEsnVqZc9/DsrtB3XDdGEMUvyDZ/IxKPUOEqVk5
	sAAQxjr3epB0ziV4j5xFHZoX2nN1PwzGr4GAjo4Yt3xu+HHytbhMmo87Xr0MLYTeeEaFVtYG7dB
	5omjTyj2cZO7k4QBT0FiBRUr64xjSa3qVL5RzTBVD6Q==
X-Gm-Gg: AYBFou0Tft8jeVoaODUT2vHKY5o2QSpWWRljEDepdcW6emW81BvIy6S3gTaOJEgUv0f
	94okmiSa6+poVIeG/yvqw2vUoe6BZaeRKFPdb/jtIRatel6hBIdKWCd7AqLUUaOmLsKODUEVi8K
	NtyhuzNe0YTdMW7KXvqRS8ajHFaI41t7byn5nCOFvo/SD7PhS6vY+EJ03IUFBfPqwq0D2afJhZX
	ik6zN51azOj5vJAkN4Cqdot8o46sFH1EnR9KNouctd/PbCLyun7Uxhl46tiZYWTZjUiZwWRfM6F
	JhuriHbqCWpY1cLzBXBJdF/rD8FSmS8kF+Mjy5hCgY5xLt4Nr+JV44NIznmRpX+kSpMKjATT5uC
	niAg1RICK9Icc5xjvcyjyiP89k4aETayvq8wUVzYb2C2cNddb/nHI2DoB3m/1V0qPmQ==
X-Received: by 2002:a17:906:9f8a:b0:c3e:4f41:e2a6 with SMTP id
 a640c23a62f3a-c4ca7974a58mr1321997366b.6.1793780812002; Wed, 04 Nov 2026
 00:26:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103113711.1832834-1-max.kellermann@ionos.com>
 <20261103113711.1832834-5-max.kellermann@ionos.com> <CAGsJ_4wpd-e+xjm5KwihVziAeVnQp3XYG=+-BKmx0SVEhmyqqw@mail.gmail.com>
In-Reply-To: <CAGsJ_4wpd-e+xjm5KwihVziAeVnQp3XYG=+-BKmx0SVEhmyqqw@mail.gmail.com>
From: Max Kellermann <max.kellermann@ionos.com>
Date: Wed, 4 Nov 2026 09:26:41 +0100
X-Gm-Features: AclHuK-KpECaTGoo8CunTP9HlWbpvRsPjMgrhDBxpI0Zzac6pPc7vrwid4sHOVo
Message-ID: <CAKPOu+9textOydxZYng=Bo9Sf91Wq_7rv5r2pBrhXOfiex=qGA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mm/mglru: avoid redundant rotations of young memcgs
To: Barry Song <baohua@kernel.org>
Cc: akpm@linux-foundation.org, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, hannes@cmpxchg.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, rcu@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 6:18=E2=80=AFAM Barry Song <baohua@kernel.org> wrote=
:
> > In my micro benchmark, this increases the request rate by 36% and
> > reduces the average duration of each write request by 27%.
>
> Could you share your microbenchmark somewhere (or post it here
> if it's not too lengthy), perhaps on GitHub, so others can
> reproduce it? You could then refer to it in your changelog.

Will do.  A note of warning: it's ugly LLM slop, and if I had written
it manually, probably 99% of it could be removed because it's
pointless garbage.  The LLM wrote it for me before I had any clue
where the problem could be.  It helped me find the problem, but
uploading this garbage triggers a bit of shame in me ;-)

> I think this is a correct change. I wonder if we can
> reproduce the issue even without concurrent reclaimers.
> In other words, can a single thread running in a
> memory-limited memcg trigger it as well?

Your question is not really related to this [4/5] patch, is it?
Because this one is just an incremental optimization on top of the
real linked list scalability issue.

A single thread means there is no spinlock contention and the linked
list is only walked once.  I don't think the problem is visible then.

> One thing I noticed is that you may not need to call
> get_random_u32_below(MEMCG_NR_BINS) upfront. Could you
> defer generating the random number until you actually need
> to rotate the memcg? I wonder if this could further improve
> your microbenchmark results.

Good idea, optimization added for the v3 patch.  I don't think it
makes much of a difference, but it really makes sense.

(And I still hate that the Linux coding style requires having all
variable declarations at the top.  Code would be simpler by
declaring+initializing variables where you need them, and additionally
it opens more opportunities for compiler optimizations, but... it's
the way it is.)

> Anyway, the compiler might be able to defer it for you.
> I'm not sure, though. Could you take a look?

The compiler is not allowed to because it is not allowed to make
assumptions on what get_random_u8() does, therefore it must not
reorder the call.

(I wish C had a way to express a promise like "this function call
won't modify global state reachable by the caller's pointers", there's
just GCC's "pure" attribute which is too strong here.)

Minor note: deferring the PRNG call will move it inside spinlock
protection.  I think that's okay, but it can theoretically have a
performance impact, and I'm not expert enough on this part of the
kernel.

--=20
Max Kellermann
Principal Architect
Hosting Technology

cm4all | Im Mediapark 6a | 50670 K=C3=B6ln | Germany
General information about the company can be found here:
https://www.cm4all.com/impressum
A member of the IONOS Group
