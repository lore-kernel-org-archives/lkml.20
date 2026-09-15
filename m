Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1600D429CEE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465662; cv=none; b=PwJP0Ia9v7MCp1wZFAzFDpcsDL7ucLzbKXoUDL2gSWSa6IZpYw7cbtWGSTEYyswcfFzmf6p4C58kOFTthSIV+LokbdEiOCC5NR2l/8bL8lwUVE3fdS1uX8YhcjgvovbH0nXAzE9kenhJNia3/wYs+21J7PUsrjtwkxrxyNidDkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465662; c=relaxed/simple;
	bh=skfTdMptS4ZL+2/wPwGapYUZqUFhhidkoXgLmyorqww=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txee9PtIkAeitjuaDwnP3rIZikDqK3gR9Uik7RDbaMxv2szg7Nxj36IyGyPUm9QeThSoguyD3uYvu2ZNiJroUX2EksJ9JTwA6h9YlaYVJDdrO5j/CtEmyTgPN9RDaZH9SpD+SRlalWd5BnErd/KkiPzzbQ7o4lswi4QfbNREjkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXr+Xfj3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXr+Xfj3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995D61F00893
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789465660;
	bh=skfTdMptS4ZL+2/wPwGapYUZqUFhhidkoXgLmyorqww=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WXr+Xfj31rdG0UcaEspgbNurtK5vPmZ/fW+HFGAyahEZoqKAj6PaPTIeY2aJUsiY2
	 2e36V7CUnRKShpRzRBadEvjvTY+mXZCBWg7qUoLyoULztWwadbT+gUxOkgRNiuCSUW
	 7miYofF7xHOlL3Qm3uRoVn+2pAmLnmVaCDzTvnvGx4Qiio+U5y1nIJSCa4ZMyyQ/If
	 FvEDPpfwWV/L3KkpMhSMX+gWPt5/v8vzKTy2KvjYtxU8BDtVz0WU2Bl3qBFLixsG2R
	 1hqxY+JuCfBRD+nnE2YEkRXK4N80Mo0AkMhxubkvQ9AruM0PabRcIK1K5ioOZIAB38
	 ThCt+gLkRfw+A==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5d4688decso716771fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwQfwnyV8wCH9vofwBZPPgOFQyDatg9Q91trtA+9jv8w4OZ+pamiACzOeNGHyogf9uxKJg09WbvPyInWpM=@vger.kernel.org
X-Gm-Message-State: AFuF++meenfYA8Fzo2FCvoPGOClmIakEHWsptpw1z6uUiobDB39lnQTS
	0omzVc2kquh7TF7J4JjqiQd5NBWzha59PRNOTqhKwTNh2sRlc3zzEa2TvCYBB7ENzNIO76LRas5
	0dMMhU+dvNxXnGwDZJL9dys1J8s6VuUXa3kw/pB8YCA==
X-Received: by 2002:a05:651c:15c9:20b0:3a3:7682:49a8 with SMTP id
 38308e7fff4ca-3a5d857a474mr564851fa.29.1789465659280; Tue, 15 Sep 2026
 02:47:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:47:38 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Sep 2026 05:47:38 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915092518.1868587-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMRc=Mc3Gu129N9w67NzcPjK=EGgrB76922JiC3bg5NP9yzrTA@mail.gmail.com>
 <20260915092518.1868587-1-vulab@iscas.ac.cn>
Date: Tue, 15 Sep 2026 05:47:38 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdzjvFovn5_QCtLQr5zGR4zjJraPXCaXNe3hxSVY39uYg@mail.gmail.com>
X-Gm-Features: AcwNN1VqxaWK1cHzn5JnVgZlXU3qMnSpPRRe8usydb5HcbbuLI2Q5VH8NGJ5BjU
Message-ID: <CAMRc=MdzjvFovn5_QCtLQr5zGR4zjJraPXCaXNe3hxSVY39uYg@mail.gmail.com>
Subject: Re: [PATCH 4/6] clocksource/drivers/davinci: Fix clock reference leak
 in of_davinci_timer_register
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: daniel.lezcano@kernel.org, tglx@kernel.org, linux-kernel@vger.kernel.org, 
	brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 11:25:18 +0200, Wentao Liang <vulab@iscas.ac.cn> said:
> On Tue, 15 Sep 2026 07:55:06 +0200, Bartosz Golaszewski <brgl@kernel.org> said:
>> I'm not following. If we keep the clock enabled, we must keep the reference. We
>> just never disable it anywhere, so you correctly don't see the clk_put() in
>> success path.
>
> Hi Bart,
>
> Thanks for taking a look. Let me clarify the point about ownership:
> prepare/enable state is tracked on struct clk_core and is orthogonal to
> the consumer reference. clk_put() merely unlinks the consumer and drops
> the kref on the core clock (see __clk_put() in drivers/clk/clk.c) -- it
> neither disables nor unprepares the clock. So releasing the reference
> does not change the clock's state; the timer clock stays enabled for the
> lifetime of the system either way. This is the same reasoning used by
> callers that enable a clock and then put the consumer handle.
>
> That said, I do understand the convention for these early boot timers
> that are never disabled -- dw_apb_timer_of, timer-owl and asm9260_timer
> also keep (or simply never put) the reference on success. If you consider
> the reference intentionally retained as a subsystem convention, I'm fine
> with dropping this patch; alternatively I could send a version that only
> adds a comment documenting the intent. Please let me know which you
> prefer.
>

Can you test it on real hardware? I still have a davinci board somewhere but
I haven't booted it in years. If you can test it, I'm fine with it, otherwise,
I'd leave it as is just to be sure.

Bartosz
