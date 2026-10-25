Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792959959;
	b=RtWA8Ow2AgqloidFhoblbOlM9QxpRNuHCcKQcFo51Kl9iJC++MoJ49Gu1YoPDIibKl4D
	 1XYE8bLkLMiZjnJ47FQeGssvN+4amvzFJ8liWYWBmyxXNuVEKEE+llb9V3DT/V0VILk2N
	 EYOIeMIJPB0CK3JB2s/lov2ZhpJxvCOdx0Q/n3sRSfvF8ApZyVdHWCSmKuldRLbxjTWob
	 bOaJ96A8rmh1p89wgtKREAJRpDBWvTtogqlseP+q+z/4X8bZXn7xZ3cXJzADCwxrVu1BF
	 z2MtjPrTw/pqCRjUS5lUUDlzZkpUPQKxG5rMdt6K0xLKAnNG5xXl+XU13HIJGMJLhPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959959;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
	b=dkyypgdUdqGBAYEx5y1ftrAUi3jY7xacCEDh/KmPlYZE3ylcfOKABytBg+OJFDyeJB3d
	 dfoEM9bF/Tpehb3W73YiIxqrFJZiu0Rad25nmhv+XQbCsX0Wf7TjQBeyPxqQeg+tCsAl/
	 oev+3ewjq5gtawW4UmxUoMY3Yy396ned2EezwplhaSz2hQTH5+fA33MimUeDQZUJ+89MH
	 6BKKhLUX+3aNOyqOrY6fkeXiUXcySFi6nQpwrpDzuj4lIO8ydgeX8gUL3xsLNY6OFsMaS
	 qUA67biMmAjqjKB6+Si6z9BlbFC1YOQW3e6lFHx7sah8PGRnF4i2a7qhfDHXH4b+CUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ch7l0h8g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.42
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB65606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:25:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB65606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ch7l0h8g
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-77bf892b496so728450137.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792959957; cv=none;
        d=google.com; s=arc-20260327;
        b=RBpNFti8hDVzXjfK7rFLwnazdbeTUmNt0jAGbHsXHDZR3HxhCHwlR8bogsfdGQOsk+
         SiZL1gYvQD55QjtfHyfyvFqVPh1+K8LsAYax3fB/5wUzyUo8s187eBb449T8A8CwVaZY
         ix9/H7rc1wxLjf/l5DPopAZV5Naf6fb1FPovOKy2g1nzYbCF233fhgpxb65BovWzcof1
         W5fU4qFB1bdqYqLveaC/hodpOx2FuPSUnC8s83VI7do/fAgCPZX6zphXfOgubNkfMB+C
         3iKfScq/i+/z1DsPGzGqqIP1wuCYJqiMgm7emGqCFFDDZuGW1wWjxLjCuWC76cEioDcg
         6t1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        fh=9yWVBiKpEBqSjmpNzfsRKOONkJSYAa1eMhpgohjQnFE=;
        b=mt+yxiwGPyrfkT5UP+KbYVAwle4YVCbBAqsHQbcGRNpS/VIIp2hnDnHD80Bc9GdRV0
         B6wy2J4Nu6GnwoCHd5teT/1Bb4ezj+vUlrFss1a9uNB5CHklyA0//88lWJ9cBQQtCZE0
         o9iJpW8edpUr9AEXNhgmMdcl1hAtS7G7UrCnpF+ie5ueJw59z3kJiDjo/fPu3NR0naj+
         iCD7EPuS0EAMd8zHS0XTfmqZJmQ9Y9PdJO1wVSpRWEsTvHua4xJu933LNvmH8+p5Yr6l
         4dkjMQPGJInFRvHrXWmHAoS9yqzVCGuiN+RuoCEzgZ8ItXlQg1VIEhBZVgs6OZle05fz
         quZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792959957; x=1793564757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        b=Ch7l0h8gZZLQtaVyD/x/SnDeFWAhlvqHNhtw91SY7a670GgzUlF43VyYylVlpdMXUb
         bJCz5CQ3mLM6o0F9NfkZr4VNj189ngdFRsj/RmUx4NEXPBcUWii7+nkRHa6oSLWKHlmY
         rGcnL6UcCygRCwmSWn3nb+LNdcCjBKT7V8FYrf7xgA0IofiNJAdBfBRXQshvaIHsG3qN
         2nrj8RlqHwDWtowWp8seSIQj7BOUx3TcvO9ZorLYUQ5zaVFU+a1y9xmSjD+H61SSDSa4
         Z7qQYY1ynxcv1uIlTtP5ixYdJ2NX8yN3Te5Gc0ZaCeryz3nK2ZFKQ0xOeLgSybbpWkLr
         ZU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792959957; x=1793564757;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/RThAUA8B7cnZs887BkMxa6IkSw9Jpa0pELDADdrhA=;
        b=VGD97Ro/VVLhHNJi4zhQEiidSxgZCz7b0WFgqHGTu1Gt8xPtCLj4NLszH46FJ/xcAX
         hfmv1H2Qv//kkI2CKmD/GHuierWuuzvoWkmxHwRBiS27lzHTQGMWWr1w39DsbCs2OS1m
         YwSeQGhuyAh2++6nbPgO2ZD3TSLsOfcSIb0p80MZEoxvVATKAVKpbKGnVefO0DeeUii+
         mLcD9s4bG3OUtlWSY5xXqJ2lFS4r2p91KFLMBJnJBlmFIruqfom224ydwEvTJSR3Bz/j
         Ceku5lcN14au/TtcgVP+TZd2fteKfqegAdUyDwQ1SGTY6DhrwU+uiReUxP1tMxkAZmbW
         F1xQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5MnGoOJwa/355EtUACBz/mZpaJkDtQtuF68zYBo6dvXKu4AUnJOEyd1TY6wBRXqtixUX4Edv9YGfBLr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoHNdSZoYTKILe9XQgWVClTMQ4baTRcAOmYnaSCUYOPGKbE4oh
	wt6PVFtgmyJ4pciii3sQDdieJJGZS/YhiR2RP4REfiorvudN1/7QTLqSVeDpnjG+F2qi74gnf5B
	iE4Z18jvM8fN7E+RqdRikIcU5/8d8D9A=
X-Gm-Gg: AYBFou2g4mG1AKBj3FINHaIcdc3aDMHdsXeK+GCU7YfpKKi/DOFVVN5FB39Z9RF+Vau
	LD7ExnctjDMdmlLQgKHIJDCq4idIYzT+VnPmgSVCGsQB3S6waCeCCPo3YXtXVtJAoAVI8KzvVXH
	reZL9kDZyW0kNwzADAf8EAx3mjdZqQo885gJ7xYY53RpRvsrkI0NmO3Qis3v4uUw5nJrMDiOJ6w
	o1Qpk1JQMxCLRYgu8td6cSYPaU60xCWZUi8ZjDEJLn2kZbf6/yxlWAGJpdsyExMqXAqc245SJp5
	Eqq9EGjm+dP/YBGGwoNSGtFJi4ElavetMOKZMiky9F4ekUzZHqz5/dw71/z0Txe0XObXt3KdYoT
	qe6qcCsK3erEzASwH644kNpczi+0pZqI7ynL9W2yyLSK5BTmXESLMgoOBhe6oGQYIxuVZY3z0/H
	0N+JxzrG1B9hz7NLZ+/j+51zvW00jlFfi18mbGZ1P9FMM+DktSLpbeDpYeWh2+D4TlPXNNuvfQN
	SB95Z8Nxadnd9Lzm+AjLsLZL4BsaQ==
X-Received: by 2002:a05:6102:a213:20b0:7ce:645a:13a4 with SMTP id
 ada2fe7eead31-7ce645a802emr619643137.20.1792959957403; Sun, 25 Oct 2026
 13:25:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-submit-serial-8250-dma-cancel-v1-v5-0-9e52968928d2@gmail.com>
 <20261024-submit-serial-8250-dma-cancel-v1-v5-2-9e52968928d2@gmail.com>
 <alpine.DEB.2.21.2610250459200.42255@angie.orcam.me.uk> <at4bw-G8czG-G7Wl@ashevche-desk.local>
In-Reply-To: <at4bw-G8czG-G7Wl@ashevche-desk.local>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 25 Oct 2026 14:25:46 -0600
X-Gm-Features: AclHuK95EKPTnWE_5NOhWBwYmgu-dizSaKFvAkW3Q_P3x_TD5WYGvbT2T9PcLnc
Message-ID: <CADvTj4psJcY2T1PG9H8_hJWjz62R7unj3PPgv3FrVquUMFVhGg@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] serial: serialize asynchronous write wakeups with
 the port lock
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Raul E Rangel <rrangel@chromium.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Tony Lindgren <tony@atomide.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	=?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Timur Tabi <timur@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 25, 2026 at 9:10=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Oct 25, 2026 at 05:10:03AM +0000, Maciej W. Rozycki wrote:
> > On Sat, 24 Oct 2026, James Hilliard wrote:
> >
> > > uart_write_wakeup() expects the UART port lock to be held. Several wo=
rker,
> > > DMA completion and interrupt paths call it without that lock, includi=
ng
> > > indirect calls from uart_handle_cts_change() and the transmit helpers=
.
> >
> >  Fair enough, and thank you for the cleanup and spotting the issue in t=
he
> > first place, however...
>
> He already issues a v6. I think the tactics against AI contributions shou=
ld be
> to not answer for a week or so until there will be a quiescent week.

At least with the workflow I've been using, a good signal for quiescence is
simply whether or not the Sashiko reviewer found issues.

I am feeding the Sashiko prompts into my local agent but it seems to
sometimes miss issues that get flagged by the public Sashiko reviewer
still.

I've been attempting to peel off independently reviewable fixes where
feasible as well to minimize the amount of patches/code during respins
as well.

> At least that's what I learn from this patch storm.

Whenever my local branch accumulates significant refactoring/changes
due to Sashiko or manual reviews I generally try and send out the new
revision fairly quickly in an attempt to avoid reviewers wasting time
reviewing code that is obsoleted by the new fixes/changes in my local
branch.

Locally I actually have far more UART related patches in an integration
tree that I've held off on sending for now since they are dependent upon
the prerequisite fixes I have already sent. My unposted patches actually
have an even larger amount of code changes than all the UART related
patches that I've posted so far, at least when measured in terms of total
lines of code changed.

The large amount of patches I ended up with seems to have mostly come
about due to the AI agent identifying most of these bugs while iterating on
and debugging new features(most of which are still largely unsent so far).

The strategy I've been using is to send small isolated fixes separately and
then reference them as needed in the larger series that depend on them.
I figure this should make the changes easier to review than having them
all in a larger series. I contributed the changes[0] to make this compatibl=
e
with the Sashiko reviewer actually.

I also use a custom AI agent controlled hardware in the loop test harness
which makes iterating/testing changes much faster since the AI agent can
autonomously test and iterate on changes far faster than is possible to do
manually. This test setup also allows much more thorough testing as a lot
of error handling or uncommonly hit code paths can then be tested using
AI generated fault injection tests on real hardware tailored to the specifi=
c
fix being validated. I manually review the final changes before sending as
well of course.

I'm constantly refining these patch development/review workflows as well
so feel free to give me any suggestions for anything I should change to
make review easier.

[0] https://github.com/sashiko-dev/sashiko/pull/389

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
