Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041835;
	b=se98PeMkh9LVn3lG9JhRi90zkOHAYQMi/KrlySY+y2RS3lTZnyIWhQTfBkd7Nq3c+fcg
	 zE/sAocND5AZ2k3oB46h2qnVpud9CdSvp3D1jLGharRT+N9AeZzZZ4Ybfq0VyeB96aNXh
	 pUVnfReL+Zij9OjEgYine4cG6385aYpfcRoqREpEijXrdTa2PBOzJWJJjaT+eEOdZT46g
	 F3lppqEeqHr7Cx6GhK7gPzmZR6dW7wYC1Ozl7ef2jU4y1asOaQ16Dq5jaDnMQVDcgj4WG
	 TqTZ2rQluUojDYL1p9lBKq1ua9pH6WhUfjf2pFSwXDOFwrSUifLmba6eNid0LDcNmrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=bIE3He9LeKSpIs1Rd+jCIaq8Jt5h1E3mzpq41bLxV0Y=;
	b=p53kRVnfSp04fJAwNgs+KXj5FHdkNmdXQEwOxzW5phe6+bXIc2vr/uTQEINvmA0RY8yj
	 6nm+SME+4oaHApSfnBWPiI4yKFIYbpUhPbAjsHAxTdCGuefIobf0JmfcaStCIvQzCP8zR
	 t9NtQy2UhxKLcyU9iU4LzC0Cu3imqjb/RMov/r9fRNjR3IGTsam2tN7TfN5ZCe7EZaWr7
	 nbCX3hzjnjKwkmTmWwnvJEn0IOUP4mmzCRyHW03NXKFGDpLiGmFC0o+VCyCuOf1Esshtm
	 CggNXOQIM9NNO72D1etU0nl3VFzQkfR6QxV7MVk3oFhZuv+ves8QJed2TAXCsuf5H/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EkTmKzjk;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE76606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CE76606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=EkTmKzjk
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c40e02b2ebaso520310766b.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793041833; x=1793646633; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bIE3He9LeKSpIs1Rd+jCIaq8Jt5h1E3mzpq41bLxV0Y=;
        b=EkTmKzjk4oSAaXC5Zevyy7xdB0cSdeQteFYiT5ukDqD09UAxJQ+Shug7+oJb6BoM/r
         dKSvsJJWptmaMbM4hcLp5O//K6waT55PMNmK5PCFEfwCJJdXJ6Pwl5PCfSfD72tjiyyJ
         0if2DVcoArKDx3ruWBQNfxNbVcQQ8qgn2E9kc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793041833; x=1793646633;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bIE3He9LeKSpIs1Rd+jCIaq8Jt5h1E3mzpq41bLxV0Y=;
        b=Ld0fN7Fea51zoWP2ynY3Bl7ImyW2QjBcv32F+buEX5Wnt2SG2FKwUKjtVmY31wA7x7
         6+tVUUVKpY+z+ALkNbx8EOclt+EePLAOJjCbX2BWulPoap/3EDuXUIVVbc32UsCI2K/S
         bk1FhIUq8WmmIEnHHB1v0IAzZrpOWANMFzygiVFaJvxBqT3petbP7gmvlJj2HwWAMCSO
         mRlSQFPDXJdfintp4BrfMr/yEUWcwA6AZvcScm0Xqw+RohA0aNT9nuBlJFtnzE8ieWgk
         Z65w5sJm5ykyAtfqE0z/V5APR7OrXv14ZSslVod1vzwp8RgcSNcBCnnD4kEdoFnrrNtX
         BW4w==
X-Gm-Message-State: AFq9FYI514W/t3bP7SwktNhf0O2bvKQImktK9ZKYRXox9F6s+8oipx5V
	mK4EpwHF1yOQ/0DUPn5/rinzdMnMMZ1k2HvvvyZGb3r1iJL+BWQuefGtwFX9OeSr/atXVXVRDlP
	j0JIIlkE=
X-Gm-Gg: AYBFou1XBKFGJwu6+OGV0BwVN/1RruIZFKKVddrCYCPDgnLt1AsbanjuTQC7VJq8McT
	sG9qQTr/lMdZ57ryq9PgZfsIzCvizorTzagI3BuhHO93tzBXZxjPJvpDqD7/rP87Tb0d3jo39N1
	0aHbhPBiYJakjUnIGWmuwuHyez282MKTX9N9HY/pDyDHyC5EeRsGWmm41TP2Fivzo8JCjColhkF
	8aCC9JphVNIOMksR1Sdl9Yvn8/u7gcEqBW9e7JXjsUnCK4h26/tGeoIPlzo/gpRw1d6JzpeEi3U
	rIjHAb4QD9HB1WqNGdMnXG/osqDCR9ymsso1XpPTgYHzwLifcXZH7hm0CW8q+R9pQwXyPyHSsLy
	E5juefnVzsLd1/Mah7HNb6nAb3JR8gvdMizl46ncqSqtNT2b9dwvm2LVSGKcphWkFlbBaYI7Yhc
	Yhz+EW2Ife66EZe3XMvC6MNX8OPBEsdybrD2+VomPAuCLNWPfRH+mPvtlV4fpma3f4wSYAbeo1Y
	Dzq8AVqMEzQoLsqc0y3UlCOgFsupcmTWsCLACY+O5uT6OnMEDDqWE2OOIgdFHepb0XGYV2MS8dA
	z28LgIAjZpdAoaES0/Y8oBGP5xtB9g==
X-Received: by 2002:a17:907:a909:b0:c41:44f2:f7d2 with SMTP id a640c23a62f3a-c46bde5469bmr871633466b.24.1793041832544;
        Mon, 26 Oct 2026 12:10:32 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd79eb05sm350573966b.79.2026.10.26.12.10.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:10:32 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso520529566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:10:32 -0700 (PDT)
X-Received: by 2002:a17:907:3e08:b0:c41:64c1:cc2e with SMTP id
 a640c23a62f3a-c46bdfdd37fmr907356766b.46.1793041831784; Mon, 26 Oct 2026
 12:10:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026152012.GD2195460@google.com>
In-Reply-To: <20261026152012.GD2195460@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Oct 2026 09:10:15 -1000
X-Gmail-Original-Message-ID: <CAHk-=wgdJOTies4qhrDKFERAYdGS_=6SiGu_onr19qftqKvfrg@mail.gmail.com>
X-Gm-Features: AclHuK_CTE7Xq7Ts6pbcNQ_EPNlLZ7rTpxUFYXs94rFqYikAWFfPNBdyVuUb14w
Message-ID: <CAHk-=wgdJOTies4qhrDKFERAYdGS_=6SiGu_onr19qftqKvfrg@mail.gmail.com>
Subject: Re: [GIT PULL] LEDs for v7.4
To: Lee Jones <lee@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Machek <pavel@ucw.cz>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 05:20, Lee Jones <lee@kernel.org> wrote:
>
> Good afternoon Linus,

Lee,
 your pull requests are already fairly unreadable because they aren't
exactly summaries, they are long lists of details.

But darn it to heck, that is *not* made better by then repeating the
same long list of details *twice* for no apparent reason.

> LEDs for v7.4
>
> - New Support & Features
>   - Core: Add `led_trigger_notify_hw_control_changed()` to allow drivers to notify the
>     core of autonomous hardware control transitions
>   - Core: Add the `hw_offloaded()` trigger callback and [...]
[...]
> - New Support & Features
>   - Core: Add `led_trigger_notify_hw_control_changed()` to allow drivers to notify the
>     core of autonomous hardware control transitions
>   - Core: Add the `hw_offloaded()` trigger callback and [...]

Please try to make your pull requests more readable. Make them
explanations of what the pull brings in - highlighting important parts
but at the same time *summarizing* thg contents, not just listign
every single detail. Much less twice.

The goal of the pull request message should be to explain why I should
pull it, but also act as documentation for what has been going on.

The *details* are in the individual commits. Nobody wants the details
repeated, people want the highlevel "what's up, what's interesting,
what is this bringing to the kernel".

And the merge message is there as documentation for others to read, to
get an overview of what is going on - both if things work well, but
also if some merge ends up causing problems. That's when people look
at merge messages - for people do a "git bisect --first-parent" to do
a rough "which merge caused this problem", but also for people who
aren't experts on some particular subsystem but still want to get an
idea of what has happened.

A suggestion I've given other maintainers is to treat the pull request
not just as a "let Linus know", but also think of it as the thing that
sites like linuxnewbies and phoronix woudl be able to use to then let
people know about what is going on in new kernel versions. So yes, the
email is for me to know what I'm merging, but it's *also* for those
kinds of third parties (the third parties may be kernel developers
too, who just are working on other parts of the kernel but want to see
what is going on elsewhere - again, not interested in individual
commits, but in the "big picture")

And yes, when an already not very easily readable version then shows
up twice, that is just annoying.

                Linus
