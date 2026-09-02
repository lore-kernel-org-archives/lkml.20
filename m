Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98023DA7F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334349; cv=none; b=EXSuvo3kX7rQjarzw/g53BgMwHa7WD5V5qRu9zd7F1w1SJ7y5d4vnzE72nsIlIIELLYsEuIeJgsTe2CR4+A9bcbMzSzjBywO5u8xKJcWkHvj49yBjjVY5d0W3BwNUHYfxmj66VxnupZD4ebaGTT/eTsGlDerdwnBaYaxU0GOkIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334349; c=relaxed/simple;
	bh=EsFRe0/YCrGlhOuJkUDE0NMpgESaksOkFsLf5XDmJ/g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOZQvCrAkRnbfLeP098u6aSvlrN5Nex4fQtE+ouaJp/pTPBYk1CPbo0UezYaqIVmrjX+phZHIdUlGTKnx0K/X+JjpDDOrIOSwx9zKhpsq6yPKNI3aly+kyj6sEP5vpVqjsJQ1t0qiQCjF56SZmamYH+9WFNJrLgtaGyvBIkzbGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7P16hSm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7P16hSm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c250c6a6a9aso100151666b.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788334346; x=1788939146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ntYqCiUGvFKb34I7pd2sH6Ev2OxM+HRkEJ74Nxn2uc0=;
        b=L7P16hSmVyHPTvvi4vJCa5m+F69CyAwpdbBP0FxZsATEi/Z0eCsPvcv7cXSMFi2JuA
         MVKY9v28WZX1FbiMslXiK+LY9h35H2yMJASzVhC+viFK4wjxOfAxw3a1J+7Urry5fCJH
         fRgPQLdyIBRAqJ4GtZdEuCJHgBTfqFReHJCNq1qWbFZlTfggPPoYP8B7+C0BuNwta5k8
         CSsJMdfmpz9cym3NCYow7+/tTyOj6aRTkm5JxLiqYr+JGOs9/EFC4p/GEh1z/AAa6Tm1
         Nh/ycPhuI1RzzsNa6cVeT53BljLLAHBFl7mo6oAJaESIkaUZ4JyuNLMhdjkjh0tf6khg
         GGBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788334346; x=1788939146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntYqCiUGvFKb34I7pd2sH6Ev2OxM+HRkEJ74Nxn2uc0=;
        b=IHcl+pk0AIFbJvyOucLquL3JkRZw44NPta/kwLzGjRvhH46m4TlHNeWqHGcafxi6lR
         CWRJEk7lwO30yN7LATyNzKsXuP2awyo2zG05HtnBIoIeMkYFRdpmDo0kZpUjP16oV4/3
         +xv4B5lIaHz06dAYA6mNB0WpQ5oKbrHtv7iUyw2SRdPJj276hsHJwlpQkl8lK/9fj/YC
         betuF62mKJFPbeFUQkFO8AEGVdV+6+6TJMEM9dQAaOGJP3EttBS42J5enA8/8jE6wmIp
         GiF/7dVbAtH1//Lgu4bpPdVMm+AhIRkVIhQq1ogElr7tH+6bROJwnJjHz6Jf0Qi3Tlei
         qXzA==
X-Forwarded-Encrypted: i=1; AKwUvBxnO7bLlq6H+bc7ppuQYoLVhuLlkTkJB3pp6zWUzOVG6JHBjJ0obLS3It8e6HO1lzu6P8jIj/wRpDFVha4=@vger.kernel.org
X-Gm-Message-State: AFuF++lf+NzfHaJ4kBcPQ/hX/BDjEvUO2cwWqiXHFNIqtwU4glqFxOB+
	s9hC44QixdoLDxxPKJBphFc72MydUsVqhSuGo2LXugT2kOWO954N/uEc
X-Gm-Gg: AYBFou2n2hVucgEkReID9x3c3hhc7hBSqMng8v2OxHy0PdgjR3hlsI/8d9aC+LTK+yv
	kl0J9mguDYeBJSI5Osra9CXYSFYDo9ixuC5LnZ7Br1rHupr6Xh7+o94HmktAHZc9gCmVKvaMEUQ
	pDHW3hzaWa224sdH1DDXX6Yx2znzEX2WE81NlWmiWLOQ6+bCig+MVX4QSDXE3BlDLuQvbYf7Pgg
	qU0XaxUNeJJLbefdbSeae5eiQhBcUO9J1ULM9gjezfTccuShkTkZH/Rnc+ICWAA1FlVEJw2GvjH
	RTkde9ILof1n8ioJXqCmJlqSIHGypH0DC/m8zlwsUoxNnSXVXEtxrCLD+qYxemmSOIrCI61toRT
	F7tPbEtlX5SFz7qvCEC0vDkw6/bfq21aDMnUIfbkON9J3SHysRcAdy6jOFO86HbRIBUSH03JXLU
	P9h6CrFbldbxRimCwPR1G9N3nQFIaLn2NcRNL4GZggv3BBpPj5/5PNi4DSicU7u1Vs4GqrwDcff
	emEoko7NVEYjLtk3ai9/rEA5s0sFGf8tEZL+Z6uX3Q+h+QtyDTT71KRPKcd
X-Received: by 2002:a17:906:6a03:b0:c24:d6f0:1223 with SMTP id a640c23a62f3a-c25d5474dfdmr140879566b.12.1788334345387;
        Wed, 02 Sep 2026 00:32:25 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d041d286sm78078466b.55.2026.09.02.00.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 00:32:24 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	George Zhang <george.zhang@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION 7.3] drm/amd/display: single-frame scanout corruption on DCN32 at 120 Hz since a637a140ab86
Date: Wed,  2 Sep 2026 12:32:22 +0500
Message-ID: <20260902073222.206801-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260829010525.29935-1-mikhail.v.gavrilov@gmail.com>
References: <20260829010525.29935-1-mikhail.v.gavrilov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have to correct my own report.

The 90x figure I gave for a637a140ab86 does not hold up.  Since sending it
I have measured five more sessions, and the rate turns out to be controlled
by something other than the kernel.  Please do not spend time on the commit
on the strength of that number.

What the artefact actually does is sit in one of two states, and the state
changes during a session.  All figures are events per 1000 eligible frames,
where an eligible frame is one the detector could have judged - the method
is unchanged from my first mail.

  60 Hz                       0.0000   0.0045   0.0252
  120 Hz, quiet state         0.0308   0.0372   0.0400
  120 Hz, excited state       0.5208   0.5739   0.7115   1.3027   1.9153

The three groups are about a decade apart from each other, and the kernel
does not sort them.  0.0308 is the run on the kernel with a637a140ab86
reverted; 0.0372 and 0.0400 are runs on unreverted kernels in the quiet
state.  Those three are the same measurement.  My original pair simply
caught one kernel quiet and the other excited.

Worse, every kernel comparison I made began with a reboot, and a reboot
resets the state.  So the bisect was measuring how soon after boot I
happened to load the machine.  I no longer consider the attribution to
a637a140ab86 supported, and I cannot say from my data whether this is a
7.3 regression at all.


The two transitions
-------------------

I can now move the artefact in both directions, but only as bundles of
variables - I have not separated what inside each bundle does the work.

Excited by: a long session of a heavy 3D game (Dying Light: The Beast).
Measured twice on the same kernel and refresh rate: 0.0372 -> 1.3027 (35x)
and 0.0400 -> 0.5208 (13x).  The effect outlasts the game by hours and
decays gradually.  That bundle contains sustained shader load, large VRAM
allocation and eviction, GTT traffic, clock and power-state churn, heating,
and fullscreen presentation.

Calmed by: about three hours spent at 60 Hz, after which returning to
120 Hz gave 1.9153 -> 0.0400 (48x), on an unreverted kernel.  That bundle
contains two modesets, three hours of elapsed time, half the pixel clock,
a different pixel encoding (this display uses YCbCr 4:2:0 at 120 Hz and
4:4:4 at 60 Hz), different watermarks, and an idle GPU.

Also calmed by: a reboot.

Which single variable in each bundle matters, I do not know.  A short
120 -> 60 -> 120 toggle would separate "a modeset" from "time at 60 Hz",
and a compute-only load would separate "GPU busy" from "memory pressure".
I am happy to run whichever of those would be most useful.


What did survive
----------------

The dependency on frame rate is unchanged and now rests on four
independent sessions: 120 Hz and 100 Hz show the artefact, 60 Hz is at
least an order of magnitude below the quiet 120 Hz state.  Forcing YCbCr
4:2:0 at 60 Hz, so that the encoding matches 120 Hz, gave 0 events in
1,290,588 eligible frames, so this is frame rate and not chroma
subsampling or link bandwidth.

Swapping the HDMI cable made no difference.

And one negative result that may be the most useful thing in this mail:
DTN snapshots taken seconds after real events in the excited state are
byte-identical to snapshots taken in the quiet state - 195 lines against
195, differing only in the scanout buffer address.  Watermarks, dcfclk,
dispclk, dppclk, fclk, HUBP and OTG underflow, vtotal and the DRR select
bits, DSC, RQ, DLG and TTU are all the same in both states, at a fifty-fold
difference in artefact rate.

So whatever holds this state is not in anything DTN exposes.  Is there
something in DMCUB, in the memory path, or in link state that could persist
across a game, decay over hours, be cleared by a reboot, and leave every
register in the DTN dump identical?  That is the question I am stuck on.

Thorsten: the regzbot entry points at a637a140ab86 on the strength of the
bisect above, which I no longer trust.  I do not know yet whether there is
a regression here at all, so I would rather not close it as invalid; please
handle it however is appropriate for an entry whose attribution has fallen
apart.

The GitLab issue has been updated with the same correction:

  https://gitlab.freedesktop.org/drm/amd/-/work_items/5714

Sorry for the noise on the first pass.

-- 
Thanks,
Mikhail Gavrilov
