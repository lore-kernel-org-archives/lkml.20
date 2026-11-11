Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794397661;
	b=YSxQPhFYZDiWPQViL2gi59rr2BKsq6rNG9EdhJKJhCilIJSrzBynXMUTJpyrZ2MTKac4
	 E0GIT1rcdVBjNShuFQlbu+sV5w0njgwzZZN3jQLnBQwD/gO6QLPDAgpLMbP/s7p3H+we6
	 2Ouim5wu/MH3scUAwfSo4+uAiE0Guaq92FETSyDowrdcRWvc5ZuhhUkOUtvEXlfr68Mu1
	 7tImMgodCRl6+al29/vzgcjjRKCws3GjOjH7RjJpPckrCn1yPkY4XXI/2FVQa+9cq00Lh
	 QQG8RsW4r+vFR4i66QoAbr9N2Wa+gg9G5a3QuTdJEUC/4fa4P+TjI3GaSng9634+GRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794397661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=o/rnBnhKYrxTv1hDtUh1mQNj/mkoeT2W1LgMSZ3xwPY=;
	b=i8fufnXg1E2+GjuY/Ly5Br3Pn5qDvuGcH0E2a+c4ezXScoZUxYlVEm5MEJhJAK0+U5/m
	 YPbasN31QAnwZWLuyeYUkT61n/pl9KjnbWbbTL2k7HB7GzPm6Rf32kqb5d7JUWr/CeHY5
	 seRZsenT68BZL3OQdIXv75hBM2p2TiCQWLXiC+r++IXqD7v2tFSwRAv4jut04im4dbLd/
	 WOJCmSALA9HTs3E22csI7EXYCwEOI0QUoJyY4lEG46eJW7dPasuTdElJ8BpzywJimeA5B
	 PY5W3hQXDUVpGbC9IlLCKyiSJcyus+ILRZbbIV8GSAjn2+IudNBxCO9vNkxkvkVYJzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mQ5y2Zjh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D24B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D24B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mQ5y2Zjh
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37628596783so2130038eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794397660; cv=none;
        d=google.com; s=arc-20260327;
        b=iuVAzPyFYGxndX0/ToQLRt+dX2G5E8o4CGlRX3ughYWAfdEKHvCR4zQPAttqt7cR47
         cwygGmyyJtFGees+S3Jx0H7520AOq4MS4S2sVOTGWT1lcjz6aRKzQ4zhpLqofyFWXLim
         /13AEr5G6b3ilPjWTiAZhOLahDKV1HEo0fA4m9870zMAxhfeexh2NglkI2XWEcxw0GZb
         hPMU3p99abVwGU68IhZrMti5JBstRqZfGJcnuNEsLAF5jNvur9zNUflg1XJdMvrHLJwf
         ykt9IGETRegx+Ujx6UlSG8PBMQY+DAaKP/eUiiiVD8lvY0Cb+G8rlsUo6EAfmC+a5fHd
         stsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=o/rnBnhKYrxTv1hDtUh1mQNj/mkoeT2W1LgMSZ3xwPY=;
        fh=uS4OwEI3W6KaQ23DrfI4CKXPoHBcUbxj+Bu1A/PgK/U=;
        b=oewj+I0Bk/Vynpu2/LdYRvgd/hwD1AfJlVgsEqbCpxZqi2UyInbYmrGdKX9W+RDeBQ
         xVAwnQlJjDsPFgXoQqpKVPQhb00mtRVDMdBfFxHuufy6nEFunjF2XRA4aiXos01DcoQg
         iiN27+kifGNCCwWdfDmerWBYXPAfRON6rueL+lszInxNd1wIOOdo50pXr+PIVd57WwIm
         wBPOFK39cF9tD7o5MML6xtQL6qV9maH7mpIvHEu0k7ckip4D3w8ZwQ05JEY4a9ZWc210
         Hv+8fmAB3SxV3bMAn2Yh9vO1u/GTKbn4jpI1jWcr5Ac3zn30S2gVxmX0rQKPh54F7Hw0
         8V4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794397660; x=1795002460; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/rnBnhKYrxTv1hDtUh1mQNj/mkoeT2W1LgMSZ3xwPY=;
        b=mQ5y2ZjhXESWE0Rjn5T7Az/q89ehJvIHpX0cNWTTIbWwqtRdBq1/nmOsxFIZik29Er
         8139A9gDHMBF+A8teMRPxZUuaSejRo4bKHPRs89G8Ov0xWkMeIHpOVUex7NHq/S1ojjW
         RUhcASAwhDMhGRiVw3DmVIRLwGnkJpK/uPtRXIpok26C4VV0CZfDAm4Dh8IPrPSL0ikx
         BdsK5HRgsxeBGhTH8xwJfM/Sfmt/SilQIV7olVOSnWwN8e9dGTrkfnzeyLTidM0cosXV
         uQ+lENX+6sPQ9kJK7i5PF8cT2Owb0ODaXP6tAf8JNwmdqnq7+lMelvguCy9p8CQ8jnoa
         mQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794397660; x=1795002460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o/rnBnhKYrxTv1hDtUh1mQNj/mkoeT2W1LgMSZ3xwPY=;
        b=nw9LLuMfBc5MFKOjKfYqWIYxyMZD2bfDOwWD9DEHPqJdBbH43yfP5zGp+yMccSaLC7
         lDZ0Td7cqH8N+Izrn9oMmPpYdNVs7Z30Vw08tcFGJA4kWyHNUnK4CflTLFxSfgZrIxOw
         xmsQxIRE/eG4ydehLytcTAWrID0xKvJATOQY6oCsJy+0yu6uRYcWealSEavyGG9qayjB
         IbfZKReAyJJHT8CDXiIfHWJhfWJUFwYotuTB6VGGe1X7vQ9Dc42QpQIHN3nT5hh72lK2
         L9T6o9SbWLCKN6jVwe4dha/hDOdl2xs0H5yAem0G7RJVxDlNhBV+v+nu6qDsWdSmyrXu
         98+w==
X-Forwarded-Encrypted: i=1; AL+hErGBxTwbkVzdiXEM7AzSQGJ2iD/MxlKiFQHrEk/cT5J/Jdg5uQO7P4783c6s6N7HbUpEgjXmV4osA0t6cVc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BvKqfgSs7ywDN5I/kx6YZ1SwuHjQOyTkzitIPl1NZY7pig3Et
	k736OFJQZOWMpR86Djzli5mehNA9ERDGxGxIj266ZM9ngIPE1mgv29rHQzs4SsYPvYRcdWyKKL6
	XtsqlohWtqaiYv8xoJjeziQgSUjGEJSjeUIKaBEX+
X-Gm-Gg: AYBFou3z1axo0SfAsmpanVhkYvFQI5tkTAI8u/EBT7xAYOv3blSS8pDUgXIUcMz6/Ln
	m+1nCJ3eGULp/S8LYuzCCkDm3XmXqGlHLweZbaDLMoY5/9S4elxNMOek05239xivlmLtq2dHIsc
	qb+xbWepfPUqWy+k+5hL1gG6NRrH1gBItmoCHSAqUEwn/pTVG4vnXj2UxsEWxHkRpEZFC8ZjIG0
	SbLwJtWdLNjfchJjMb9sHd2r+WQ1d4dsnvnSjcyHPSNKLDmOtpDwg4oY2zvel6nY46nGwgrTVKI
	IkOxXY1yd9/4OswHFzg8DSl9yFEIs0Tckt1c/zcrJEpaCOcZfxUqqfzf4JYvjWP2InqqVHN9va5
	OHuIzO/NOILJN3V8zX2fQqOgs7LKOYeceuV1ga1yAAl012TSFLjdw8C4LaXZ3H5SRo6vD
X-Received: by 2002:a05:701b:45d8:10b0:1b2:42eb:7e11 with SMTP id
 a92af1059eb24-1b3c032ee4fmr2131772c88.26.1794397659338; Wed, 11 Nov 2026
 03:47:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <DS4PR01MB994453688E23AA8CD27C995952EA712@DS4PR01MB994453.prod.exchangelabs.com>
In-Reply-To: <DS4PR01MB994453688E23AA8CD27C995952EA712@DS4PR01MB994453.prod.exchangelabs.com>
From: Marco Elver <elver@google.com>
Date: Wed, 11 Nov 2026 12:47:02 +0100
X-Gm-Features: AclHuK_63_cH-_1YuzLfG3bAG87tvKfptxwtgXOXk11Vop7rUgn2gvKqv7uIo4c
Message-ID: <CANpmjNMvM_TCs7Fao9+gM-NNpQyBKYumSuWOt_03ZX+tLwbjWw@mail.gmail.com>
Subject: Re: [BUG] tsacct: KCSAN data race on task flags between
 acct_account_cputime() and capable()
To: "Puranam, Ananta Srikar" <srikar.puranam@wsu.edu>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "dvyukov@google.com" <dvyukov@google.com>, 
	"kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Priya, Swarn" <swarn.priya@wsu.edu>, 
	"Ammanaghatta Shivakumar, Basavesh" <basavesh.shivakumar@wsu.edu>
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 05:53, Puranam, Ananta Srikar
<srikar.puranam@wsu.edu> wrote:
>
> Hi,
>
> I'm Ananta Srikar Puranam, a PhD student at Washington State University.
> I'm reporting this bug on behalf of my team: Dr. Swarn Priya and
> Dr. Basavesh Ammanaghatta Shivakumar (both Cc'd).
>
> KCSAN reports a data race on task_struct::flags between the timer
> interrupt's task accounting and capable().  acct_account_cputime()
> reads tsk->flags to test PF_KTHREAD, while capable() sets PF_SUPERPRIV
> in the same word with a plain read-modify-write.  The read only tests
> PF_KTHREAD, which is stable for a userspace task, so the accounting
> decision is unaffected; the race is intentional but not annotated.

I'd advise you to stop reporting KCSAN reports. This is not useful.

syzbot finds 100s of data race reports, and we haven't yet enabled
KCSAN_STRICT mode.

While I appreciate the effort, the general problem is that data races
are harder to judge in terms of severity. Given current maintainer
load, now many will fix "benign" data races, where the probability of
failure is very low. I encourage you to read [1] and [2].

[1] https://lwn.net/Articles/816854/
[2] https://docs.kernel.org/dev-tools/lkmm/docs/access-marking.html

I more useful approach would be to analyze data races and understand
their severity; i.e. does the data race, under the wrong
circumstances, result in system failure (crash, corruption, etc.).
Even better would be to then generate fixes for those issues, and send
them as RFC patches. Maintainers are more likely to respond if the
analysis leads to a patch that not just fixes the data race, but also
demonstrates how it can make the system fail badly.
