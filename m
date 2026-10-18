Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB84E35F5E3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365843; cv=pass; b=vEG9lfi+uU3OF3Bb+tWpTTyNDTQGc8AfYQEtJa91NxpW/zCp+4NqIz+yLpY6YGSOuYxT3/hRXPSStIKRX495pGU2PVo0ZgGJaylwELTHHCchuaPe5h8s4NklOXZWVzuKsBht2BOgwkXDfwk4puLYm1WzOcRkVsOMm62DqIPt5B0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365843; c=relaxed/simple;
	bh=KShYi/fVTCBKlya3MspTCdR63OOWBWaD8wBUta4wq2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISyACcNXENLK/Q+I31QCGh1WjR9h322XLZ1MbiWJWkqAlD0P7zdZxE4PHXFKncP5x7Mo9IFuwpvcgXP62Quyx+KHagQzC1NxDXpUS1ZBmJXyyvKQYpXXihSASR16nhE+Ifg+Klqx9X3TIZvHCxFiVO4rrk0+VVWOHZnoIngEhww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APplhDZk; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APplhDZk"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c423b145922so106675166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:24:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792365840; cv=none;
        d=google.com; s=arc-20260327;
        b=cGEusqvhrIN6ojhuR1ErV5RsxTXBApGqVDEnvJlqczAU6rOAAkVlZu8ht3dNueqhg6
         3+fNXMWHEBhiC9/fj3s5Nm5mlCj1D54JWw//eZY9z4vkkAyFVeWKrta6T3PK5HrbkcA0
         Z9Yf2YzBVOfm0nF9VXkNIEwxMN3KY8fP41r6wlZl/2vC2iZXudjgrp25iBHOa/FQGv4u
         xLo62Ihzo/qQmige0S7nKksSFK5sHr+CgSncCICPud1MQnQzoZ8Vo/1ap3hzEoqrv4Uw
         N5vXBrxP6cjxsMSas9DeMcJEglllmSpO0WYlTu2F8w37xcqdtKVkVaDutH1Orymjw1Wi
         /khA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/y5Ibz7qqr2/Gn8YzXISVGzkygivhG6/sV2wNe5WmBg=;
        fh=hyHVjSRUQnlGkJTFIgban9YlgM+gTVoafzcQw/j1BFA=;
        b=N/KKwJwRIallK8HDDCY3BH+iCQjOPVNv2CxpBgcVDYmUlOjY2Fa1JLEu4f3QQImoCk
         Syzo8TU7gTvgxbim2yErVC+7qye/iPNDYvIQHIVw1CfHs0MfcbQE6qn3d0jioYVGahBM
         oM/7LXQFGvM5go+s2Ktb7XocWOzQz5N57D19Hi1knWK1BiKp4eMfS5cOE8dfdlNA7Xfx
         xUIgOrTF7f70xQeqZTn1tPjE8RG6dF1hlQEqzH/3JA/F36ctae1N46XEyg0hXoKWZ4D1
         kGIDI9qiIGP7cXuswkUJnncjdaWOV591XSyoUHHq2+Ez0xFO0ET+c2iNrYuEEgddiEzc
         kEcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792365840; x=1792970640; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/y5Ibz7qqr2/Gn8YzXISVGzkygivhG6/sV2wNe5WmBg=;
        b=APplhDZk6qkbaqfQMmY9eNroeCxtaDtrZCBZ/z5o2brtuI8FpfZtg2HKujxuOhesb3
         ZJlFAZagyF4MvoStRG+b4BNqj9OxBRw65AJZyoo5/kYuZn/Qu3+t3m+IcIW3U1M4abLR
         CR9K8Tl26v6XwALKB2P9aiFfCWl4g108Y63oDDtLnDZlwpQxIp2UGMTsNcHe+RTSnt10
         nKKIliHnSIpKc44uOihkm8V6xyoowaH1JDe+kYCxnDEyHb/qdRrJphnBruAw1qTePFho
         Pgg4O2yLvP5X2UjTf/fhs/lSo7oyVWQENOJx8czEaKZRj6i8kioZL2FKHzXIxHWbCtv0
         Jypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365840; x=1792970640;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/y5Ibz7qqr2/Gn8YzXISVGzkygivhG6/sV2wNe5WmBg=;
        b=FGcDKgKPvbDm0X+Z4VGnsBDenIMDHT2EWoTzmCGaBgWAgYtvYlyTVxMTZm9cIePuZX
         M/lUnShvw/nHz0GzZNPWpScV3rwqBYboyxHD0Ec5q66odddT93jKD40g2kkiVooGmdcn
         sMSlyGBBfsF5FEIFu9Kl6/2ftrqKLaAp1LE7rb/rSoaYAqeBQhslYB0bNJVHCHeej4km
         sYyjGfroqQ1Ah+qjdcvNrLOg0/B25d8Z96A4ePv5vDaqdcxfBD070bFMQE38JkzuKHtk
         VSCUpIdR33luGKOyJS8VNGmlgHxQGPBTaJog5kglytOAHA0xyNOC2bqi1M4RAnmYNWHC
         uQ6w==
X-Forwarded-Encrypted: i=1; AKwUvBxZ458PqRrpJmz9RBgIHkiR2hTttKE94lO9XM5SctA50HyVEK8LbZlZDUJho86H0Ks/RzjTq9WDPjekX0c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJfBUb4HS1Te9Lzxtid2lThtBEqfCQgM2U0DrbcAzf4hxXgb1Mo
	0o20B6y6V6UNX6fn9r3JmlkctsGtPsI1lj3yVAk4Ja7rbXvpiQMxynTYzmpwWhSVzuXE7Y37H6U
	MQ3uaKb6Pj0Oz6gnK6QHw19GJ5fw7lYQ=
X-Gm-Gg: AYBFou1xwm9lqInK+31mqJpUvPJO+/Bc7FArgGVLr3xQSYH0o9DK4L3fvD1ZXgQE7l5
	g1MzEPOLDPHwRXGkkAAgkDSLHzz7zWplJA5wBF72s9U0X8cO1CuyyvnuWygVg9iMZpTOB0RGb9B
	MJZR7Cp0k2bSQIujGmzZl1OPQLQOM9f/6c30s6pOPNktSR7Hk1c1lVsF3OP0YVcCjVwE1dsF3EV
	aLTYVjDjsTew1YWbnUZ5MGgSdedo5I4ALspJ+5IIc42vJGMe0EkE7pXaSChYmB/d9kjNlwunHK0
	jhrOa+G2mmrXcrfgogJwwEZlSroIqps8p0YYEiwBvWO4831t2wk3BQ2TPZF3LxtAykBBPfH9i7o
	9DFYDLcEbo21nnrzm2RwGuP0yeZCmnX7yyXumLCEzE25IFiuAAXGxHrZo0d0sYsmP/18Cz1EKKF
	1tO8TNr1EpViavfq4k7nTR8yLTtwatgUUVJNNctB2At1z+b/wnymPo7L+Ndmti7QYv/W2j21tm1
	b5o
X-Received: by 2002:a17:906:ba89:b0:c34:1ed:54d9 with SMTP id
 a640c23a62f3a-c41999720a9mr361332166b.4.1792365839724; Sun, 18 Oct 2026
 16:23:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018231348.36884-1-rosenp@gmail.com> <179236550812.3290.9443229332836486177@kernel.org>
In-Reply-To: <179236550812.3290.9443229332836486177@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Sun, 18 Oct 2026 16:23:48 -0700
X-Gm-Features: AclHuK-ZP5haimlzeCjYliwXiklfpxalvRr6YNlaNSwVnHmT-R9sguD0SlezVBA
Message-ID: <CAKxU2N8rq4bhk-5zAKd3hEWvUh-bfJtntQb9iJ-niZvXgT8rUg@mail.gmail.com>
Subject: Re: [PATCH net] net: bgmac: fix TX DMA unmapping on fragment mapping failure
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau <nbd@openwrt.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:18=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
This was found by an AI review of a related bgmac patch and confirmed by
code inspection. It has not been observed in practice; it requires a
fragment DMA mapping failure. Compile tested only; not tested on
hardware.
>
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
