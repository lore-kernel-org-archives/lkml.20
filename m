Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210855;
	b=nO2mmpsvpHbJ9zO1s2lcOTLzbQveIiG2kg9IF+/1hlWmz7g0r1kxVOIX93hTe+qbPSwS
	 +TruoNW2pkqVwA04I1BHf4JACzdQnZlOhFaROfNVJ63YDcmyuAhrrprEukI2VfMd23aM+
	 OssSuNDJGASwkgSKFsEWSQlc4e1/DA0LIZSA4qaCLg5uvPliNjl1+4iRDsoEWQpMuBwR3
	 ZzMQDR3NezmYt2dpzA7RVfJbbyeJIrNpjvqnDZbKcMPHFiGyv/Q9qaNm4JqcBHXLc9dtC
	 aNY1sHjFPAuUuYU5zjudXwsil2/GQ2Nde599qiZJ5ImzOK7FzxdFB0r+3lSO70QVh3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210855;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=2OL11FRKL8kHfKZ5ZhNZS3nh+yPIRxt+OMgWHODiXUA=;
	b=qBJ6w/Nf1OhbvBLFXRSvzQ7lwfN6VFYg5MshjX60zdfCXDVy38cOR3cusbhUyIPNpXyd
	 sfNyENNLM0c/vVwllJ2VemLLKPKcUT7A6RAj/mFnk5bwgYARkGYXmGBhYZdk7TmG+/MYJ
	 TWY035U3e1dFvaVclp03S+NRPUyaSw3gX2WUdyOvabVk5vDTmg55jb/LLM5BdaTNP0cCc
	 nRg/GBV2vPXUL0HB6xsFYvBhWuw07RHdOG4RNeNmxONTFq7vG+zUB4BXk9ZgzMW34fWxh
	 he4TNTMdSnfqQzikLeR2oP8JC2l3EwejroEtdNQ8OJhMaVhE684gSEc14D79IDZlm5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dV4VSp1S;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C896606A331
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C896606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dV4VSp1S
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c49b431f022so198080566b.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793210853; x=1793815653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2OL11FRKL8kHfKZ5ZhNZS3nh+yPIRxt+OMgWHODiXUA=;
        b=dV4VSp1SPDVPe0ga/si07+VoR33MajaUOVkEvYA6dEpx7jlrDMriVDFIVcYynrUHMH
         sHKbf3zT9awIOicfd+9ZFSRyBTPNaohJ2L1oMjIDnLyNEdi2gzJ1x5AHtlQdkd3tXDp8
         gGKBHpj9dDeaGrA2SKbAYpassyZRVQtsLQa+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793210853; x=1793815653;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OL11FRKL8kHfKZ5ZhNZS3nh+yPIRxt+OMgWHODiXUA=;
        b=gd3DdTyTWGBCXbefg8x7DmN681J6dTNDriAYasO8nZVexmuSIdUb7xyeZiKm7nhHZq
         Qkdzf++k7KwIlhTedLeI4TLv8Rv0Zzs9k9LxQhvDTaXYM2U4PREEVygoBRZhTccKrZss
         Rr1+JiGxpN85HDw3GzGznicOzQkr94a4WEhL7xogr7v4nLPrxJPmG+VWTyjlXDVWAYmf
         ugPt8DfpLRn2EnQr5f/q6SeyY4sy+z0i2NJKL4TbmNcSrYcaPqz7UJfBFQM5eYips/nj
         XkkUsvcDPbyegJ8jecK7TWMTk/ndjxryrtIoRNgTgSURcCsbmEkkpPL35ttsnaG/czcH
         4bIA==
X-Gm-Message-State: AFq9FYLtZe5/fARAXco7yNwsbJ+rcLFtxVX/6kiA2IxWnOr1Guho8WpZ
	sG+ky3IeaceyCtLZ+VsWpoAyxj4wuDZcxonUE/PNm/TTnN1BkB72G8kMfcUAu0yl3oJ6lS8TLsF
	qnEgk+n8=
X-Gm-Gg: AYBFou27nBV+tmBFYWcco+nDdsulCjS+pDZnrRpu0VZTVAJLUkvZ2zYD0ajPTMeHRvJ
	Pn2K34wps8kbEx8XInN1qEJ1d7aD4+TegT4swCbv65V66VDlWdHX3k0CB8subWGqjgwK8kwPJxc
	Fe30odMp3aNJqdTf+bw7QYojRlwp8PD8UObNrvTHSeuLyipANQK1aVahVgLkeXJqdWVleowgI+M
	ZUrT6YNDAM3X078FXCwh0XtZlVCE1qmCp3LHRqEpxPHHP/RYlOHRnEces0BGJO/BicYpUMZDm27
	VIW93xJScHcBZpfF3jH/NJXOuNuePggy+nQtBBE72LbDVRS9stLbbfZNw1kdGqlUbnzTk1mYwxQ
	zMI9zBydIKKn72LkIIYcswX5fiJ/yFOUoNXjBgkNNtZFqWv9PH5Ceu4dUmy+0UvkR6p9D72xYmL
	avTKtErrgbcIcqCIx6VOs0ZuBAfFn4gTTOsQGWjSP4uVw3aBVDwFogTINUFlExNCpbO8ur38bdl
	3+VQ/pNkycerW9SZGZ3/qryc6Lfzzm0vfQ03OHtw6QxGYsdMTRS9pukmx87wY5kLM7rlvk0kjYU
	iIO/OgJLsmW7dI6dTPpNmB8E9RiSw92OHeM9f8BoBNUv6LySJBQfrWLeAenfh1tf89iDe/xAmBJ
	2io44KlzVRYy5IDfbP/MyRpY8
X-Received: by 2002:a17:906:4fcb:b0:c3f:98d4:dfe2 with SMTP id a640c23a62f3a-c49bdf00daamr297150966b.18.1793210852637;
        Wed, 28 Oct 2026 11:07:32 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4e89dbsm627173866b.18.2026.10.28.11.07.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 11:07:32 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c34bff61551so193910666b.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:07:32 -0700 (PDT)
X-Received: by 2002:a17:907:9489:b0:c3e:e677:563a with SMTP id
 a640c23a62f3a-c49bdf8c4e2mr280067566b.47.1793210851782; Wed, 28 Oct 2026
 11:07:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <pdx86-pr-20261028113441-148823082@linux.intel.com>
In-Reply-To: <pdx86-pr-20261028113441-148823082@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 28 Oct 2026 08:07:14 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
X-Gm-Features: AclHuK9F2Tw59uoogHDfU2jp4E90qH2bThLgxFDfqQXF6CsV40i-lIh8iIXt2xY
Message-ID: <CAHk-=wjk2f+Vu656fEa7FOyHHaFe+-M-GEwUQPXykaYoor6A7g@mail.gmail.com>
Subject: Re: [GIT PULL] platform-drivers-x86 for v7.4-1
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Armin Wolf <W_Armin@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Oct 2026 at 23:59, Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Highlights:

Please, people - give a *summary*.

Not 150 lines that just re-organizes the shortlog with some editing.

It's not a "Highlight" if it just repeats every small detail. That's
just a "list". And it certainly isn't informative.

I - and others who read merge commits - want to know the big picture.
Not every driver detail. If I wanted to know the exact details of what
happened in some particular driver, I would be reading the commits for
that driver. That's not what the merge is about. The merge is about
bigger issues than to see things like this:

    - intel/pmt:
       - Block mmap when read_telem() callback is present

and that's just one example of a *lot* of "this is not a big picture
issue, it's a small detail in one particular driver".

I suspect one thing that is actually a "bigger picture" issue is that

 - ACPI: video: Remove CONFIG_X86 dependency as WMI now supports non-X86
               archs

which is something that people might find interesting in general.

On the whole, I think 90% of that list should have been written along
the lines of

 "Usual updates for laptop quirks from HP, ASUS, Acer and Dell:
    - new model names and recent CPU support
    - more special button / function key handling
    - battery and hardware monitoring quirks"

or something.

Please *help* me write usable merge messages that are actually
informative and not just a "data dump". For the data dump, we have the
details in the git history.

                Linus
