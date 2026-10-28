Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207202;
	b=SlL2+wu+unzIHvluVyGs+NlQFgFyA7IlA7GEBfh88xgPiV9UliXpxZYHr4Jr4Fc4CyWs
	 b92BA55Jw0STK3nBGK6OmWsAy++JkD+wOsShSIEmbICCb1n2WG5l3cDtBATtKBNq5EO8p
	 jdZfphRSXIahcYB5Z5UmaCXGhXp7rMrLC8d8FP6SVclDr9zRuvw9AMsT6GKJ5+6vE2Uc+
	 0T+IdV5WqsS4pCMpgZOrKG4fyvJE+6DNNyx8xCr//hxLKR8JlqrSFER6mKBfI3cByKkqS
	 HjpyPkZqbKvyXYQFA284p5ycnGdcJNPWajO0YIrJQm12yf3Dyvhxvl5oFVC4CD9PFDQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207202;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=r8YE+O9LVJXedkn0qfcAwD7vBT8ublO6FJuPd17zie8=;
	b=cDK+cRQl2phzwA3nf9lhNICGoVLRbB8RncgI+Zvg00m1vONTsR0lCM/Z5y6VLDk1TOhc
	 KQcpIx3cQYS21wRLXgqDD9M9IrcmSLDWoNFZ3C4j/WcLjDjiULj1Ka1DnJKpmJF+5ODBz
	 4OVALqBmw+b0D3inFGrFNECg12AGscHwmZQTx+t3Ua+Re01aRcrtvwi14LB/GpN1VI2AW
	 Utq9D0giOnw9h0syDeorNDoweb3GCl7QrwnibaBG5bcKJy+Czd4l3gTAYlo2qT0KnmFJR
	 VC3XmXemsc+k9SjFwybYYl/VrErmlYu6BeJ2aTt5dqrnOmiHjd3Skz2MmXoTzuw8hoA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlWD3h8C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E93606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E93606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IlWD3h8C
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6dd059478dcso942992eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:06:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207201; cv=none;
        d=google.com; s=arc-20260327;
        b=sKSaH0rN6xKHlCk/5jhzGImtuwpjsfD+Izbt9zdlPZi3fMhxKQbwaG2S9Whts2/su2
         Av/lJb1aINIw4D7jxHszaoT6WKmXb7skQzVtm1UZouM/n9iDo8y7bqjvwdMPpTfeCWmC
         Cm/kBPV1+W4wiZ4YOLYjMluA8Ibg0TgaH4bXPoyz7U2i9Hc2gu+gecCw4TA+p9GYi+RN
         5WsTOuOUIDEA8Ntm9Ka4VyU1YSYdopGt6f25cn/Y7XO56me3vBXp8U58sos0IULTy6Fl
         BCWI5m7RNMn2AvUoBNSNOb9cbmfaLMxlqHSfcOffoQeHMqLENYCOsjPCmsve55G/tXo7
         CoAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r8YE+O9LVJXedkn0qfcAwD7vBT8ublO6FJuPd17zie8=;
        fh=QMWd+bN4LwSInWYA6qMgkkKKzb/0WrdjQxezR+kCPHM=;
        b=CHOua6gA2HfZRRYTqde/Swlfa4bohLP7QLsU94w/2Hp7zZR46EKvR1WNMlfzHUNLGQ
         26qdaCTRZUhYfqR/fRhPSxb2ecl5bJUKVN/GLiXFQGjAKegXCatLqpc288L9X/UI9h13
         65D+ovC111NeaqCJq8/HdeBUt7d4cBeXi2eW5ppCKU9H9Rh03GqA5iQ/CPjAgr9z3UaB
         ZYbo1CZOt6vq9z+3aQ8kNl4zv6X20Y1MWhZx9cKCHkTZsal10z0IYW9vlgBITlFbfgGp
         DdasIdnxAt1zOo3xKXOOTSSmGcvV0Q6voJkaWF6tIrgUZsbu5SXvsVbaL4T3a6GPKJAU
         x8HA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793207201; x=1793812001; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r8YE+O9LVJXedkn0qfcAwD7vBT8ublO6FJuPd17zie8=;
        b=IlWD3h8C28xeU2MGjteRvVYneEpyZdsvTSCtLKlhmf93hO6cJDu6+R04aiFp5maTmc
         7WkXndyvLB+Bp1GKVyEivY8azTxyhLERtDpZ0/TuwB047pvuXSuV4RdNvrrvDrGOk0/c
         dxObJBWHum3kDH90vCEskncHmfbUnMy3qNG6Q3QiwtKEA5mf+0IF2kIvkIf2X1aCik3H
         exMwLXMyvjXNa+lQJwQByKQazLO2J+RFyoqiVl3Ozcpm9qZ2qcs8+ghnZVc0zgWQ0kC6
         5oG0ix1fJHUcvEOGm9zMm+zMuqGp+anSkwWbhlAkXW1yZqaeJX8M2ZOAXTkWNWY7jlVW
         IDmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207201; x=1793812001;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8YE+O9LVJXedkn0qfcAwD7vBT8ublO6FJuPd17zie8=;
        b=Sd8t/r6rZSNwHD35YMdCXPIMwNlfWKwRBqjgFNyITQV10p7PDpT/1TwXMfgLGt89C/
         4Jtr/7liOpJTp/oBpfYg4y2m5J8gmCaKXva7cBA3fqkDuyYZmGNOEHUIyG1xJJqqDZow
         qoT4tKZvT4OWIySlVklaPUBlz9Z/7twYO6c4Ia+laBKsvgA6CDtu2q9Bh24tMwm6a6/Z
         sidawW+m2cid2kWvZX+Kcn1FhZHKFvn/tAmZlBayaRhxghA3mhDRp6lpJrHSmx9G0g5h
         n//hnBmX27uU2SFic1/syGJSp8FvOfLFOHvAgIlHcUKsI2RElZGyyYXu/x3qLE7fHdhP
         xTsA==
X-Forwarded-Encrypted: i=1; AKwUvBzymODlMMuQQ84hLor1OwrA+W5TbS1tGRUSqLWWksOnaMNurtb8ojtvZ0A7VPWLBoZeb27r782O1KTwrk0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwsVFqDvZwB8H11n+CtSlMRqxB3qnXgoDaZHJKnPYn8Mw6MkA0
	Oaa8OK1SOx7sOze67dTM+0yttN0q4nQi4Z7UBONkA7Ju5gy5a29SkDHi/l34E/LPG+N16TojjgZ
	zEIBXqIa1X3kuWvgY1x96NNepJ973JJQ=
X-Gm-Gg: AYBFou3RDhIbuUrOI573Gg0k+8zqWuRxDlJu3CDNlK2fZm7vAnfBCqKhKx0umKxgLPA
	8d/KKNbAttuiDvdMQxDw6vBr7lR+tKDgDGn6nusddGtVsARoS5FSgMgOlbQwqy8TxqmbDXPLJj9
	3sWhMKHqStq3qiwThbxeOy5lkQzNQsfS7ZuU2i+iEq8NTVB0sT8yB9owbirOcDLbi30UAnFJING
	IMkx7auGu1XXz6VmuHBBBxkQw61EXUiG4y5BXztqCDwQI3ZsTF6vG5fo400OKyUF0oP/59o19pO
	h2Ka9PbPyLl1Rb9/bIBLwkJbZy4VLsyCscaosdUDjMdzfGXT1/OFCN2UTncz5f9rd+3D05mZPrS
	+dpRFzNUKeorrCneglYj7MQtB2ethUMqCxFLr
X-Received: by 2002:a05:6820:1689:b0:713:e4f1:9b6b with SMTP id
 006d021491bc7-713ed6c153cmr1700322eaf.16.1793207200763; Wed, 28 Oct 2026
 10:06:40 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CALf2hKveij_sHgANY9Aktm1dPa4wfKjKNkHyp9yPbjORWFXagA@mail.gmail.com>
 <auIbEZv5macfZ4aq@kernel.org>
In-Reply-To: <auIbEZv5macfZ4aq@kernel.org>
From: Zhiyu Zhang <zhiyuzhang999@gmail.com>
Date: Thu, 29 Oct 2026 01:06:28 +0800
X-Gm-Features: AclHuK9LCfZ7Sw7e1tkChniRiLi7m_rwAqFg95luAluDfEL8misebeHJhLl0MGs
Message-ID: <CALf2hKty86GatQ01C30j20oa+TeVdJRvbX=a_+0Rga33woJ6Lw@mail.gmail.com>
Subject: Re: [BUG] watch_queue: RCU/info_id overlap leaks kernel stack
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: brauner@kernel.org, dhowells@redhat.com, keyrings@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org, edumazet@kernel.org, 
	ncardwell@google.com, lyutoon@gmail.com, tpluszz77@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jarkko,

Sorry for disturbing, and thank you for the concrete suggestion.
We have now reduced the watch_queue issue to a shell + keyctl reproducer
using watch_session, watch_add and timeout.

We will send the reproducers (including the complete exp for lpe) to you
and the relevant maintainers privately. I understand your point that a
similar reproducer can likely be recreated with a few LLM prompts.
Nevertheless, Documentation/process/security-bugs.rst says not to
publish a reproducer for an AI-assisted finding, so we are keeping it off-l=
ist.
The same guidance says that AI-assisted findings must be treated as public,
which is why the report was posted publicly.

We have also prepared the fix and verified locally that it prevents the
issue. We sent the report first so that the patch commit can carry the
stable lore URL in its Closes: trailer. We will post the patch for review a=
sap.

Best,
Zhiyu

Jarkko Sakkinen <jarkko@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8828=E6=
=97=A5=E5=91=A8=E4=B8=89 23:56=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 28, 2026 at 11:41:35PM +0800, Zhiyu Zhang wrote:
> > We have a short source reproducer, exact config and QEMU results. In
> > accordance with the kernel policy, we are not posting the reproducer pu=
blicly.
> > We can provide it privately if a maintainer requests it. On the vulnera=
ble
> > baseline it normally reports the canary, stack/task pointers and two ag=
reeing
> > KASLR anchors within a few seconds.
>
> This is public nobody cares. Likely I could make the reproducec with a
> couple of prompts.
>
> What if you instead spent some time with your "short reproducer" and figu=
re
> out how to make equal reproducer with bash and keyctl? It's a good
> habbit and helps to check the relevance because you have to think things
> through.
>
> This announcement is just total waste of time and energy anyhow.
>
> Br, Jarkko
>
>
