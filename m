Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321628;
	b=M2OlHv9rMdZ+njmktUw1JPS0FSXiDStq/OHss5sshEZ5JE7qTq5LG0oK9KCxny1WfRqF
	 k8SravJEdmWJ/MBGFfAzZeSLWkStWwJ0vwFRw6q6ftczMgqo8zpU6qKb6ZIJDMfK7q3T7
	 /xsTkP2rlWV2FVsSwARNw/p6Z4koCMl1Y0mG8stGLmExf1dN9jix0UwXQOKZa6gO2nnq5
	 0rawmNUra4W1vXOG5R0soYcDic35lgzDEWLCtTCNHUrczaqBUKesLdqFqZhbaWoW3VD+3
	 aAlwwoYKnWqGswyHDsTQkbbH1VGpP4iY+L3XC6ed+cDrVjmNsUI/gpAjRJp0OBUKLQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321628;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=NdsGEmcnwDERcnYVwxnzF5K4RGP76a4vobMfRThtHus=;
	b=JxBMpQBTAhvlNWsH7Vv1M/Bqx4om8Ie/NxAckR2qfZaPB8/bz2Sov3LLC5araU01Kc6J
	 MpoYiTKTyaTdbwWm2ifSDt2GfNQm+TLoTbJINH2dWclwpiRB5BiBiJD3rJjr8ohlY5p56
	 TGMj2tcpc1idd6C4DgfYKPZJla2XS17H7j0yLDzd+NT/M/PeTBHXuv8zIEHR/LpMpCJ5c
	 aJ7+lCa/Kysp9NJv8YuM2Nnz3pGWDD8pW4RnXkG3eIRp8Ya5dmukIYjkx10PDNJRoV6FU
	 MC4KdyfoP5JDAQBvKGdCYBGqW3vvcmJxjwIrbi6VtCR5iUgp9uRryqBglAaeutzL7og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE0560A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:40:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBE0560A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2545800a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:40:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794321626; x=1794926426;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NdsGEmcnwDERcnYVwxnzF5K4RGP76a4vobMfRThtHus=;
        b=pz9zxDRgq2iNz7L6bJmWOmINafpx3N6UUExGJ6CLz6Cqnn5VBOQjxupPyPmhFyFCc5
         Rlh+YVSzLyHYupP1ERO8mQTwan87mtyLFqFWhdFAKxguoSZSulLq3WkcAoUkPmzfpJUh
         /qMcxCPIK3G6QD4frBpstsptOHM0vNkt4Rk8ssZ2BRE0udUly/kfwOQgo3S4nHhU7Mr7
         VBfghJfLuUAiN3uYFl7f/Fl8tfSsqacElKEpeeW2LGGM4RabTHg09R/4pP0TuKXd0XmX
         iGiMH/rlpBmsfNU7ZOQVAyuEqGq60S3/bWK2KYpI1icOw0FtEt9WNGPFv+pXh5p30wj9
         ugAA==
X-Forwarded-Encrypted: i=1; AL+hErEeE1pbxioq+QGMqr/rOln7zQAwo0bcQU/SIOrb/B76Ez3/Yfuq9Z7nd0xbMqxVC2rBfD6tAJaWTQ9BjLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BMXNL6aI3vsOIN+40vagWVl8apCbP+NL+LGMFYLcmvsNh0t59
	VKbm0MlZfjgjyFrcpcNLnB644POyCbS+6wSE6G6jrjeD51xxGrriZVtic7ch12mvcTs=
X-Gm-Gg: AYBFou2zrOrQbjqiobgJdIbacCDaLBb7qT7V4+/x4hkTQFG6eO4TuX1UAcnMzU+Dd3T
	OKEZCynpvRd8lrCRCEsqU0vdJbxidy22oyOraIGDm11jqhijxsCWPEHJq5logRQ58tMlWxD8bAX
	JEfyeJa5zAvPSktsgeS8KUthPWkxMFxPDV/wfJU3SHQFeEah0qa/63D7F3gsXcuHjagUpQo4olU
	plQZVeCYSmstXXAi4Qgg0Cc2ZLsEDaLpbWeuzhtiCVO6eiyEb1juuFF+3Ca0hu5RPhLdhiOyb2g
	f9EgRIFowvbKajmmBiFnpn1C+apUeqlEvQdBYBBwNxjm8OIOCOdvz2PKMzJPA5ffbbeaUm2apTd
	p0fJrN2REgdw9emY7Ye7ZiKVTQcgjapEyOPzLTXsMgrG7kkzARRuEZqpjRO5901IciNCdtflEFs
	+FgM+//1dz5d9YAJ3pUXJQiaI8BXetGJ/zlSxlpt0a64Goapu8IdIpF8Welr7YUoeEiz6Jh2EK8
	FaXFQqKbD/8KoOXjpBDbrMHx0k2KxL8q6GmVQZdNyNphTKxkyDfJyYRuAa9/Pp6q/eZ2c1o75ri
	M9aNH7Ysgwea+LO9zd/nzvWiQSyWCSlqIav70ib1+/d9MLLz8FKgujIfTcQ+xwgdh0k=
X-Received: by 2002:a05:6402:84c:b0:6b4:641:baed with SMTP id 4fb4d7f45d1cf-6b756aee301mr2321833a12.30.1794321626088;
        Tue, 10 Nov 2026 06:40:26 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm1200935a12.3.2026.11.10.06.40.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 06:40:20 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so2545609a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:40:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHrlqtm4k1+UIcMLm1v2DR5/qM4Y4fZNkMNb5N3r/qPu4gj4oqbJRzXX0fFF2C3psfeGNiQxvzA3WhEv20=@vger.kernel.org
X-Received: by 2002:aa7:d78b:0:b0:6b5:9150:edf3 with SMTP id
 4fb4d7f45d1cf-6b756b12aeemr1910612a12.43.1794321620553; Tue, 10 Nov 2026
 06:40:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261110141429.149451-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 15:40:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWOgiYZmK52--Dcuat-gHtW-GOhiQfHBoSDMcefWzUx+A@mail.gmail.com>
X-Gm-Features: AclHuK-vciKQvIOU3wexWocdK7lSDvoS7oWEizuJMJhyo6occ__o2qwUAjcDY0U
Message-ID: <CAMuHMdWOgiYZmK52--Dcuat-gHtW-GOhiQfHBoSDMcefWzUx+A@mail.gmail.com>
Subject: Re: [PATCH v3] docs: submitting-patches: Clarify partial review tags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Nov 2026 at 15:36, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
> Refactoring of driver subsystems or some core driver parts often come
> with change of the actual drivers.  If that happens within one patch,
> people giving "Reviewed-by" tag only to piece of the patch, like one
> driver, and ignoring the rest including the main concept of the patch,
> are not really reviewing "the patch".
>
> As explained in the Submitting Patches document, the "Reviewer's
> statement of oversight" is for patch as in "entire patch" meaning:
>
>   (a) I have carried out a technical review of this patch to
>       evaluate its appropriateness and readiness for inclusion into
>       the mainline kernel.
>
> The sentence is explicit, exhaustive and complete, meaning it does not
> allow implicit variations like: "this patch or part of this patch".
>
> Reviewing pieces of the patch while ignoring the main part of it, is
> much closer to Acknowledgment, thus Ack or at least "Reviewed-by" should
> be followed by '# subpart' suffix.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
> Changes in v3:
> 1. Minor commit msg adjustments
> 2. Use  Driver X author <foo@example.org> # for Driver
> 3. Tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
