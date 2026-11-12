Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794449934;
	b=xm9r0wSpwmRN9/HdC0TCS7TlGNeSo2VgQxvrZ3t6gTw2VVVMGAI7tm3u99bGdy3b3qvc
	 XnFDK9MfQtSw+muWbIU9cQkiplaVtMbV5OdOjG1WaIUDWk9Pzo2S0b1qzAfA6CJORSdQV
	 M9G4gS6irF2kM5cgghKkfsdkXuCvfumhxqVuTSpZFLxdvdtbJ0Vp5SS7DeTEafUDcQoJE
	 +ylm+b8YPwO67696br6RCZxxrT4ayf7g6JWBhbMpEsPfDYjo/ZbWWTEcxfKX44g7sNiNt
	 w4xGjpV0e89fMBEs/Ms7Fe+ArghwpPkganHgZHmL3P3hvpvgH2SK6K4Uah9oRWISJqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449934;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
	b=iJH9hHTdcmDQAJqHv2C7l3+LatEVfN+LVEkWLooflR+ElP65nPADKOIzitFjmvBPaP8R
	 74f8bYyEVEFv8ZW4plpxD38w7/bSgx2PCHtI8LpW0jQy+ro9XKjS5CaNZ2ly69nbAwuuD
	 DTlVZCe03O81krVYJle2GpzbS9qI4M7KmhwFtyWz1l6SO4iCPrAJ3OAkusoWCEQnEeqrg
	 Z4xWZxUzGdQE+pqS8t4LSTyD/Idx6uBHNrukavPRTwtL/Gj+z216CKYslGaX+T1Jp/uON
	 cNtXKmB9nye1Pi6SqIRBr6AIqdi7pNsgXh7oI5V3IYhVb+sQ4dMybgcVEQAsW6tdr4w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwU0Zm9y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D979606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D979606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DwU0Zm9y
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ec2d42231so39095866d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:18:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794449933; cv=none;
        d=google.com; s=arc-20260327;
        b=A2KtSERkP2RVHWDzab1vrnPFuOUnaZEKs+IXclx2WsPtcZ2WATJWXx1eWGPDEdl1tJ
         I0uh5T9nKz8N0/KN6JBh1hwC/XzsJwyBsnp6ndvDm5zaX5vISo/hL3nxkkXk6Z48Ec4U
         bUj8zAochpN73ixgV8/jfF8Shr5EVbqpXOafxQ3ivOmoeKg+2G9ETjI/RK8Eb3gr4b43
         U/pA/JMjcm7GjPPBfkiSRKeudJKB/ZeoBn9pfhR8NGUYQg5rkXafiEvkcIkOXpFc4U9m
         50j6R4/wOXyjbri7gIkPomLuKLFl0OcTp660KE2hDcYWD3nJV7AoT51ARGPZGns9/YPE
         FNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
        fh=cTN/aUAeRveOKm/93859iWbCqcnVk2vvRGwGlAbgf4U=;
        b=nswjPZItgRZ1ipY4mmJNqMWm+p9YoI/uN722v+Vmm++8fLQ+TfB33M2KrUWqHB2Orl
         jyAuCbsKMRIL/7QhdWUm7dExjgpEHK0C0M0iEzUX1Kn/i59FOpkPm5Aqy5qXssklYDWA
         U+pE9L/06vIJPY9RVgMkVfpC1+6lYJIwQisu01ByqY6VW0fceY7rq6XBK7NYjIbZmbLa
         3WFgXyapls48wkH6mZxQVaOr2RoRBOGQ1Ax+xU1fogyZPve2hdWFFuGjedYEpNHWapHf
         e6zppLSAi3dux6vfKDDWSQn4oKzzjUC5Niz4125xZI9JOmgkKLGqJzKBDqVAh5v3yVJV
         s2Xg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794449933; x=1795054733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
        b=DwU0Zm9yr9iyS23RGRtzUkYlxu4rjNtwEz5QIlNve8prjW1xbKwJ68IVgCZ4iDSHQV
         1UFlaRNHOnlTrQn2bbMJHxQdyNf0sN8YqaE3J7VA0Q0V8FiEyLtjMYDQXwnELgXhiv02
         lPrKe0xQHmdcgRQlNHiL51CS8fhjicmu/Hy/2IF+dr0Eywgi8JgfpbOU+nHntEftNgb0
         bdn7vZOvvAa5zQgesMHmMJjxCnVIDZvdC5rgLzLO/ehvJs2OefdRMyRu5/2cL40egyy7
         FBZNwnN8d7AevMrqODB3/n5vw0l3YpmCeMXPfkZJcXa6kJBohHdUYZi8zTbes9Kaa9Uw
         QrtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794449933; x=1795054733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uSIrkRDA93Mj/PVtKNG7+nFpfhhPf2AG8Tz5QutxZsE=;
        b=XHe9ZTb5xtIg2Le76eVlg7t6PBi5XN+TebEGUP30WRIKGzp6dHo7s2A9pTz9QA9p8u
         dW6WkHpQL12MPnP5rJTLR/IGK9wf83v8bo0VfrAAW1VXH0P9bPawQs4/9NsRRdNAzTlS
         QSjjtA9pqKyqLxwIhjpZLX30fV3JuBMSP4roaCA9tu0IPxzwHt62okMBqT87sDz8Vmy2
         Xw/4QC0PNzWBblrXWQeXkOtKYdtpvh+2I9XJIGjohxBXSSAIUz1uWuvuU6aSf22wdWIx
         t9eRo9R4tmJpo+QkfzwOW+qRwcXur7SNCdwCOYOT12DFthDtkgiO3ltPOU1PCxWk7yWG
         i0KA==
X-Forwarded-Encrypted: i=1; AL+hErHZMUcZBKuNJ0mz0B1Rb9lSti6YEK9exKjpZKGq9DYRhCGJU1cXlt85D59hXLrF7uS5PV1W9uX9EQUO6Fc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/feYUo0oBIlrH7Rw8YGU+SVZyNREoEy5Rdjht7eMBTuDHcFxmG
	xg6EsEp9DsbzvaKGoxE0q04LC4jY8caou1WdQb68qwDWNLheqo6KJISExvT54xyBdIMyQa5e/Wj
	koV4sioCA5v95vy3/M9XGgc+DZak6HjY=
X-Gm-Gg: AYBFou0lDuSiWaXGkb3O6BWoVOUvA1AoffXkqS9WLOE6mLWN6+hDbhJjFW6y9wBgtDl
	K6xldySJCV7NdEW7v2F5eOjzKtggh5fbaHjrnRFMqPXLETXOrUu/FnU0supLdbuWspeL0V5uYKG
	i2FZ7+RZN5MTRXK6K8QcfXcFwKq+hSrONmjueLc1fgjNp4Fi+7eJG1iFXdmP4nKccp5oPv1TUf9
	RQlOOt7fBB0xewXQpZIpKvdd37Ev+zoz/o49W81QtHCtIq6sChBIa0tOSk9oUbVNWfWeZCLwhTj
	Nw6XCEPwPQhddPlhGTv2r9o91WoZ0RQi6OoyAvjbwW8Gp/6+CT8zSFb+zxOa9Tr6ntVJ8uCRh7a
	l8kIwnEJlSQpZ7puVssaPXpK/ZV0+OhYywDlR
X-Received: by 2002:a05:6214:6112:b0:91f:12f9:fc6e with SMTP id
 6a1803df08f44-91f12f9fe1fmr26500366d6.31.1794449933323; Wed, 11 Nov 2026
 18:18:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109134506.2794160-1-zxyan0222@gmail.com> <179423231463.488859.16977464890948797360@kernel.org>
 <20261111152012.3506cf35@kernel.org>
In-Reply-To: <20261111152012.3506cf35@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 12 Nov 2026 10:18:41 +0800
X-Gm-Features: AclHuK8QI62ccttn1Xw-oY6fIZrapeK5u9UcITSCWeJbJUttr5lLmZTnCyZA2Bs
Message-ID: <CAP7veT+buHRMu6f3o5RaKFdv3fABkWKgkO6KFn5js4PEeB8b0w@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, rmk+kernel@armlinux.org.uk, 
	o.rempel@pengutronix.de, wojciech.drewek@intel.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jakub,

On Thu, Nov 12, 2026 at 7:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 09 Nov 2026 13:51:54 +0000 netdev-bot+sinfo@kernel.org wrote:
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
> >
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
>
> You are at v10 and still getting these automated emails.
> What's going on?

As for what is going on: I answered the bot's full questionnaire once,
in a direct reply at v7 [1], and since v10 the same facts are
described in the cover letter.  The bot, maybe, evaluates the
individual commit messages, where I never put the information,
assuming the reply and the cover letter would count.  They do not,
so the emails kept coming.  I will fold the tested-on and
found-by-inspection statements into the commit messages with the
next revision, which should settle it.
