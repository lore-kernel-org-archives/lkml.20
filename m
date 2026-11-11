Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794394691;
	b=TUzLge4cdyLvFNheyfwNLObPsPWztXwOF+2behHCoxXTDbr+yRilwSANNnWv4uQxznTw
	 AFav3zf+nNdlV/Ql9maMJGtioqudcn1mHv21QP+sfZk+Q8u4DD7c6FzUHQTqXW22dRUPN
	 3IHdvEMMyPV9RGdv8IPGFwvOWp9s1DcG/UL+o/lsGaCufaKWiUQnry3N3x2Kk1cxdw2NC
	 ajmORjuBzikSMBDaPXb95zJUw4DvVNTBhbN8Qjs5yZnLWfv3eT2d+7fZ6tPo3AxqDaOD6
	 rmDKQ/TlG1K3uWVlrMFTRtfYCg3LlAQNohqk0Qsindxt5e4te1WUlhQaDj0PuACtpQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=615FE0Yy7cA+8xh/VFmWU1n2MI6ldY7bFg+t+YyDgZw=;
	b=X0a5f6OkaART0/wWOoaTCClRR5ZdCuQur+5VjR8MR5WZglVpUVnn+9EdsGVC0IMs/c/B
	 6Q9w4/Grs0zt7WTDTEkbpqvMY7T3FCOwmJ1ibC31kLxqLcd1MFLl57UqzJ0JaA/hjtDwi
	 XoRfUgyKkFFkgZydBPsX9RAPysl1F/I+x+nYVT+UbMvZ+09zyIV20dCqh/aMJUqrQnqjJ
	 GxgdbqeszJZMuqbPf6AHlJUGET2VzxJzQNwXug3V2eTX9rtPfQtF57kGiQEv1Dv/DkaQv
	 8Xya9DtGghl9ZSdK4OXjHcfk7JErrbI1sdkG8gP9ykeAR5fY2HhwkhTZAAg2Rch8LLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEZKTX1I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D9D606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8D9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEZKTX1I
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-37198ed3727so3766208eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:58:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794394690; cv=none;
        d=google.com; s=arc-20260327;
        b=LFPT/c3Jkw2dWHrYxhcnKhDURfPm2nQ6V7s2EpTqY+QsMXXIc1isBrqwW0SlK0YTiI
         QR9vkHtAtYRCNTDjMLrFEkQ2Iifn+qDCq39TLNFQloxvVftDGGmT/Q3HS+0N8Wv4oCTW
         V3FHsCrrV2jVhylCCspDTUyRrRLiw9c0vStRiUkaGnaJdv9TBbBTEN/0TajhJNvzxqk9
         qMap5c38aSigy32HpMUzPLt19xTqASBMUWnqglGhmzNR1jOpQ44NUfhkuQyfoicE8a+t
         sQZTE0/H3gbE28g6f2Dg60z5kMB0rauRjFn2b7BLyRAc5tRyrTGKzkzvDlvqNtFfqlpu
         X1og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=615FE0Yy7cA+8xh/VFmWU1n2MI6ldY7bFg+t+YyDgZw=;
        fh=NI2Ls7LYAEC9Jzez9S+vQdupaBBoGbWGiW/DLOwsxtw=;
        b=baM7k4mOzyrEXDB+4Ux55DrvhMGBrdO5+JaLKlCCATOcf1aJFHs9iF7cXLUODEW8sK
         mpA+Ip4+NKYP6XBFwzfF6IUR+804BNymeAY0xMfBCm9sbioQq5If7k9LklWUeuCm+7rU
         wMoW+kvWtLj07BYZYh73exH+GNVjFF0Aflw/x1vb2frGcRTSzHaj1hAsPURs8x+CmPU3
         SR+5SmP3pCVZnj0b9hrasHIVHhGZDvI0G1A5UJXk6dD1BCwhF8kg9d9LaQi8PqBaE5lc
         P126D+wRCbF01dm+7vW9/cXlh8ttxhwZ2lYoU3TC2tgicq23CjFxVNwKavNlVqQXBrs6
         jVEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794394690; x=1794999490; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=615FE0Yy7cA+8xh/VFmWU1n2MI6ldY7bFg+t+YyDgZw=;
        b=BEZKTX1IIGOMPjsWHaXoJ3kp/OsyoYBWEjtBi4CHamphNSa+3Yryyi6n98XAWEV/Cg
         rokF1ZUwWWGXFA9Oy7/UqX1rQqHBv/jiPK/SWHpI+qg0MNUBXeiq2XFznQAexFkIwCay
         1ZyxA7s6frelLfdun6d+/fK4Mf1RD3UJZnZXCVy7FN+3ZeZFtvAIDqfYG3OwSh8eeHPQ
         HpxIhO7n7QbAbuz7n/TO16Y+cQU8Lj1GXbE0RF8nPdN9BMgsSA/69cmX393Utex1fEPg
         z4syHLwpeGJHGJpsp21bZn6aQvVu+SBIxIxg6Mr5CkR9/UUI/qxqSWxA6Fj0A6K5UMZW
         baAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394690; x=1794999490;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=615FE0Yy7cA+8xh/VFmWU1n2MI6ldY7bFg+t+YyDgZw=;
        b=t6L7+eWXZkWz4U3NvBNrkGLiwzSKBmUECzJGZ3QSBGzpRDALc8nkE0LRYnc46zr88I
         743va65siRpQrgpIf/I8ntCtZGtmerrgYBlQlr+tWAloAmYP/ebTvJTtz92lISxkV3Yr
         i/6GI9RPGyRI1+vGt8h6kIgPeMb6vZELR88A4oVdGt3oNo4TgU/2RgYGnLctC8dP8Due
         wj1eyarPJUx1cAKPv7puAe89lC+uqWjCXXC7u4qF3YXDRaSglvYO/iCWa/RhQb0PgTlI
         l85AzZcWxOKXpMfm9fPMT7Eh+82ctDhz7n/h7j8jxF4A9nue5H6g6IlLYpdV+4beS3JL
         15Nw==
X-Forwarded-Encrypted: i=1; AL+hErF+DIjE6WnoCvBdlAEFGQofVzpCMNJSt24S2F7/aB3wLqiTIO/DBUUrNASD36f6jXYCEJk+ec17C4fmhoQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dUL6td7gWUWg2TrtxuxSjmj1c8LIw/qM3UXadKVCN+fQlT3jC
	Idvb1F9ei8z2zFai7F1l4EquWoP/xqHZCcGFtTxwnMLbbEn8tRg+qho3LhJ2d8a7zv2zPuMLBQX
	mt96YNd1ld0UEdJ8IY5LgslgPPXWW9c0CGWdxB74ZfAC4SCGvsXItoG45/Vo=
X-Gm-Gg: AYBFou1BwQaCPMVEbcSEpomOM9NroRS13IJWJqDEYStxTbPcs9EB8/Voe3izvGeix2Q
	+VePiJek3gyWe7P109GRQCbnoBr+2hjJVN0rakD6mYop8AH4icDaPo0Pn/TJE0dqxBWvT221Ibj
	55IE94ZBDrVEkbdqyZHZvU9md3R5kB6zZjqqFPHrhAOU2mJzk+wOSI7Bka7jtzH/IyBPjkUzz0s
	RG+TevV15XgpPvENjmQo4EPQB9lSIL37a9zrTWaiBpoDqosOKfG2ZCILqyDsvEyN65addIPRe2S
	flBAfgDIhUnicqPOOarciJJeF/WdNF7d1/QuKxiPYJl7o9qpzfrlj12zXncz9KvU0kVNvxxGOYl
	p9GSRZBixYkvL7VhDWcQtJFk4WoJyYxnmLYMnnHZNlx4UO0aZaz7mEIxnZS2ir3CbQ93E
X-Received: by 2002:a05:7022:f519:b0:185:6c8c:d860 with SMTP id
 a92af1059eb24-1b3c03387damr1679768c88.5.1794394688877; Wed, 11 Nov 2026
 02:58:08 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794250850.git.bvanassche@acm.org> <30ea46a36f2985e32389067317977371e6776e27.1794250850.git.bvanassche@acm.org>
In-Reply-To: <30ea46a36f2985e32389067317977371e6776e27.1794250850.git.bvanassche@acm.org>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 11:57:32 +0100
X-Gm-Features: AclHuK9bNroTt_qmwi0N0oU48nQI8S96SP606Bmq4NBUs9gdU1xkleGdPkOjq0Q
Message-ID: <CANpmjNNxNpM0LY6Vo0RqZKKixBuay1YnphR2V4ap_z70iHwu1g@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] tracing: Disable branch profiling for
 COMPILE_TEST builds
To: Bart Van Assche <bvanassche@acm.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	linux-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 20:14, Bart Van Assche <bvanassche@acm.org> wrote:
>
> WARN_CONTEXT_ANALYSIS depends on !TRACE_BRANCH_PROFILING because branch
> profiling instruments every if-condition and obscures control flow from
> Clang's thread-safety analyzer. Make PROFILE_ANNOTATED_BRANCHES and
> PROFILE_ALL_BRANCHES depend on !COMPILE_TEST so that allmodconfig and
> allyesconfig builds do not enable TRACE_BRANCH_PROFILING and instead
> enable WARN_CONTEXT_ANALYSIS_ALL.

WARN_CONTEXT_ANALYSIS_ALL depends on !COMPILE_TEST, so allmodconfig
gets WARN_CONTEXT_ANALYSIS, not _ALL.

> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  kernel/trace/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/trace/Kconfig b/kernel/trace/Kconfig
> index 35d043b19332..afbf17099a68 100644
> --- a/kernel/trace/Kconfig
> +++ b/kernel/trace/Kconfig
> @@ -687,6 +687,7 @@ config BRANCH_PROFILE_NONE
>
>  config PROFILE_ANNOTATED_BRANCHES
>         bool "Trace likely/unlikely profiler"
> +       depends on !COMPILE_TEST
>         select TRACE_BRANCH_PROFILING
>         help
>           This tracer profiles all likely and unlikely macros
> @@ -698,7 +699,7 @@ config PROFILE_ANNOTATED_BRANCHES
>           on if you need to profile the system's use of these macros.
>
>  config PROFILE_ALL_BRANCHES
> -       bool "Profile all if conditionals" if !FORTIFY_SOURCE
> +       bool "Profile all if conditionals" if !FORTIFY_SOURCE && !COMPILE_TEST
>         select TRACE_BRANCH_PROFILING
>         help
>           This tracer profiles all branch conditions. Every if ()
