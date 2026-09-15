Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B244C7538
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789499360; cv=none; b=luOKoXjrcEQqhpMTAj45YlJAfY0r66S0z/UCMfd3diMrTG7RZxZTb2TaLc90NF+GFgPNen/OxmL1jdLGVd9Q4WFav22Xs1y1jHJkPqNNprK9zi14xvrjFyqnDwpiVMMLLAxsoXFfRZQpgfp+tL+SyF3klya4d0iQFK+NUrmpiQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789499360; c=relaxed/simple;
	bh=AGk4y8oFpNibhByHKIxcRS7KnQx6z20Q8VC6dFl1tNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnIAgyP1zJWwMh+oASX7eBNLG2/uXWWdbsJ3eWkPmftfkCcgZ2LdPrlJ+L63lYr/96dpt5Ap2H1iwqcqmox3XRJ2x17anLsmoaQadw2fIafBZ9aAdqAuedwbPFSqMa/FDibQka4yomUPIKUwHGnqbNivGhuHVozmesnQbGJsH7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=baTWZZT4; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="baTWZZT4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so28235366b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789499356; x=1790104156; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=baTWZZT41Mv8fDUUIY4M4JQ+wtO0Rab8v2A0NMhMTLiJ4v6n/hoXUwlpLEMx0TDvb6
         Bt+bbrXfbbYG9SMuWIH2KBKPQvqc5jGOvVog52rTdBAdksZR8BAcUhDfKTgECzvoeNaL
         JEcnR4jlud/KFQ6Todj+LBBhx6jDH35va1Njg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789499356; x=1790104156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XFFk9jJtDswBQpA8QWIooO6lLG4HdlvPT/LqykRjG+U=;
        b=UlQ6WhVa1poErgt79wx6mOKAbj39z7jhHw/55jhOLKSmJSSW5EpijMC3uNIg8I242o
         Yx10rot9nyusQlcT9rZVHMrKfO1CiP6Ms7ZT/559aLWGwkZU//pJZ9MAmtziCkCgkgI4
         2Mu86RLnYKFXiLlbJSe9rmyb7H421R3mlxiM1SKKl6Votkj4xWG3c2EP7N8HmyDhxdB6
         PsiFsF/z8VUJWlcQcwuFau278+lgpg0QUc++Uv32+wrE9nK3Z2T0ol61ddE8ifii7c/m
         CxR5k6b2bp4veSpL1mQ/wNLaz9SWhL1I3FRnjoHr8hb6YNBaDECyIRbKuygYaXxbzizG
         M5zA==
X-Forwarded-Encrypted: i=1; AKwUvBwud0l3GxFLnV20rdbvih2zFs0VjmvOlm6iX1RnTQSCGMzEgDs4cUxuMJjujwcuz1rIIXfZBV6B2iBDOJE=@vger.kernel.org
X-Gm-Message-State: AFuF++mHsTbOZIqxbfGkBzt/Auv912ybIbCRLjL4Wt46FVVcgYDvZ78h
	PMJJftWI1w0RCJ8INqZK7bcqrVTejM/YLjabgVyJbY8RNVNh2bLTKxm6Da48Ov7foT4viChZVuB
	80zpi3uM=
X-Gm-Gg: AYBFou2aKK0hQSn5LRxxRe0lg6YtSw6R8F9KF85b/GX6FsQVFaIZuYQ0ujadwrNjrRS
	nBN39XtYY23/9t5Bt2Mmg5TZ48QQDxkD1n20WpT021O6neBRqdloSpn/T0YiOrMieuMeDdxpjlw
	74y1vyejRy6U4bLaEHvvfLmFOpohMa0vj0UGEBpMkOV9aUClkBbdWb5EzVCnPhNWPIB2YyTuEvq
	DPHOWsEihWWs67QBypDNWkJ4MqldTSWBq25nBweV8dqTI1IOSpvBfMMoqMNkuQ3ubhibfpk84p1
	eXGu/PI1SeQ46pBYH9QfamLT/fazX4JXOSP+5rSmPqgakn2U8xe8yNM9Wg7Ni1qv23oOc6fHT4+
	QsShuJBIcvj5zhbYw8+xXIpzp9gvmxFJ5Xp9uuM+0MYglK7tj1QqAbTeMCTH7ArP00G1soiYNO5
	4KJhji9l4KtAei3EkF4l3nwd4OwWZS3dZ0CJiYPoeWYinuWUdSCd+bUwCj6j6bKSNysyl2PDejj
	0e3H6obAeATflUl/2O8vA+UCU7JxDB2/Ab6KRchhIsr77qh8Q==
X-Received: by 2002:a17:907:728d:b0:c20:9447:bd5e with SMTP id a640c23a62f3a-c29b84d72b1mr1061819466b.9.1789499356042;
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5ead34sm15537466b.45.2026.09.15.12.09.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 12:09:16 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254fa663c1so28573566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 12:09:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzIakFdrwDyRfoTeFC41ZVKdmE3+brH8cSfbuFaTI+ckq7f4+tYySQF5ytnoMDnej+NifRR4ohI7bkBfDU=@vger.kernel.org
X-Received: by 2002:a17:906:7309:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29b839a057mr1176039766b.2.1789499355710; Tue, 15 Sep 2026
 12:09:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
In-Reply-To: <CAG48ez1RsdT=O=-0city3vjgWhDvY424KtTmrCJntWy5ds3HBQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Sep 2026 12:08:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
X-Gm-Features: AcwNN1VCm0LMG7z3Jned014oJh6WBcf4uOx0OBk98_hrtHKbrhcQiMMJ_A-fmB0
Message-ID: <CAHk-=wi3Kkqgfg6zUTHpQoZNL2VOB4vYqpi6RX0WNO++29UtyQ@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Jann Horn <jannh@google.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org, 
	netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org, 
	David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev, kvm@vger.kernel.org, 
	kexec@lists.infradead.org, linux-hyperv@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sept 2026 at 10:52, Jann Horn <jannh@google.com> wrote:
>
> Is this mainly about stuff like "we installed a file descriptor and
> then the following put_user() failed"? Because if so, I think a nicer
> fix would be to have a policy of "if userspace provides unwritable
> memory to a syscall, just keep going and pretend the access worked",
> and maybe have a sysctl that kills the process when this happens to
> emphasize that userspace should not be doing this.

We've done that before, where we just ignore put_user() errors and the
user gets whatever the user gets.

It is maybe not optimal, but it's fine. You can find quite a lot of
unchecked put_user() calls with a pattern like

        git grep '^[[:space:]]*put_user(.*);'

and some of them are in core code - see the two in kernel/fork.c, for example.

One of them says "if userspace has not set up a proper pointer then
tough luck". The other one doesn't even bother with a comment.

The scheduler has two cases too, although one of them is admittedly
for another error case.

So yes, saying "if you pass bogus arguments, you get what you get" is
a valid model. It's perhaps not the *preferred* model, but it's not
wrong.

It *would* be wrong to take code that already has error handling and
remove the error handling, though.

                  Linus
