Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091865;
	b=CUhNJPiCOxPopYMgVdRYddb8gMAFMVpzy9YDV8+/hksWCWT4oEY2YiFhXTbX6BeRa1sH
	 qjgXFXDk1zjdsqHDm/zisOeoO5MszpOPz28am7+n72lh4MQ9452al0TRIITMlTIhDhd8U
	 oUfEEzmLWKdTLNQfAW/DoYQ/zU1bOHPr246nefrNtqB7HTfR22T5wSN97q5s/hiP2vjYb
	 wzBqVJyH6qiYX2oStumIkSDHdJ/guhHeteHqPSuqpevD1hjwdZtN/x7YoR8wJhOYSwh/d
	 HJ4LZVKK9VveM4uj/bJe90JPNeDP+H3WcTvX38XhYf3bqDeUbqGUUflxab1wu/DuK9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IC4ICtskpaMr1BDvtcg7zj+mYWKpW8yLLny0A2JJ3ZM=;
	b=VaQ/vYY3gKp3gX9TefjJ//juEk+POx2+JBu93+GJnI8YuFEL8Y75zBth3z2N99y4tboQ
	 1++NA59do5c3PzMnsz8C47p8RCozNk8xYY/nURPhHF5MRnzhVlTVuE33y6YI9SrUa8Y5V
	 w8POIeJDa0H/Pe7xX3DCUOT5/2wP01BrSYx9KAT2NbxXxVP7nGyGuuAG3h+vbj+uZVAyn
	 Bg/xZsOpJfrBmH9f07TqPcXaJA7tR6Hb82i59iPuyGgqhBea93MgKZwzg/jVrIk1vjfGo
	 5MBzre0Gbi1JHlKk0zbiFCsjPu2z/fHQXepMShHyQZZ/gA/ZSbUxhfMPK+QRwZck4Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nuXcgjgI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0577606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:04:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0577606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=nuXcgjgI
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8ab43af5e97so8680617b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793091863; cv=none;
        d=google.com; s=arc-20260327;
        b=k84qp5U/137a3OrPOH6ZKTu83UPQ1hVhYyXONz24ms8XeO2eOmEQMd1IMFyI/FjiUn
         DFcyMtJZPoYDqRLA1Dt7oj4scQ0MkvdP5YY+3xJnDS+TDQ7ncDDR8CfIm3Epcvq3hqE5
         NabbyEpDSyVJPpxlc/+9h/9ws1zrFWMHE7OVzNEz7j79qLsnvySvGDWbnmtw94zbE17S
         dLzRx48arVKEVdX6W1aEdvvoTsI1tk+zfFfBQUIDqme8a9eV/gZeWfdZqciKWwRB7Zs2
         NFp7+Z1wG+55ZCLnA3egMrC0rEShD8QcCNEzQAge5ZMFbHTUDJE0j06BL6MpMEYYXbUj
         waTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IC4ICtskpaMr1BDvtcg7zj+mYWKpW8yLLny0A2JJ3ZM=;
        fh=86v1l+80YAef2Eci6FxrWNLYQ4n3xYCmU5byvCLWpek=;
        b=fLEfXwSaMVWcUQwgsx975b9BAoeFBxm1tO6UZZ7UxM7D1cbZW9QZzMYx8hSwNjTBIE
         c+DaxHY0mfR1c7BSeQN4fkKR+GgJCJjZEggCmxJ+HuAEa5T7GUknSq+r3+bNT3UyOq1l
         9HffQel0yb+BLkcRbWLMUFQLCoese/FrdX11zzLJNjVMbijomo+iruBobPQ2JvymGIVB
         cZbt66pohWd/F97V3mGGw1jWXiOof6xW/X1ZGsVQMeu7fBCn+OtBkvATiUekyAn7argH
         VtuaptOKZ2ilwZhbQji/XtO9sg0LV16YXuJF7LuB7Xtkok81ZuN4qJEey9WsCoiJXzBa
         0vbA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091863; x=1793696663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IC4ICtskpaMr1BDvtcg7zj+mYWKpW8yLLny0A2JJ3ZM=;
        b=nuXcgjgImRLpr33nbQdXKUCCrMD6AEqN2Xnpc+EfrpyBTbxxXk68hY0rQmm/6syrel
         u2dPxtll6lq7LM0pUYwkJWqgo/KhNVQdQkBWIwm9Yd0qB9uH6hSuqcw2p0/+CqZk6S9K
         0yQu0+Htg5AeXpEnh4Msr6+u9UGMoZj4NT8IXQZj0MCj/O6qBq0Qaz+DUTD+uq9tmE9g
         kFCUXvOVFVeRROMpTCRF+Odr833ULEPnJge1NfbZN0elhwcGdRQ7qiXcg9u1sAypjdvJ
         LCGMitjTkGnJnD8qpgZ4gxH4BhVcyKwO+bbaK92JN4UVpYBqf0+4EmgmcUkWbQ6d3ePE
         thLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091863; x=1793696663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IC4ICtskpaMr1BDvtcg7zj+mYWKpW8yLLny0A2JJ3ZM=;
        b=MWa44XEifBjN2TmspQwlBcUGdJ9S4+c7Db490mBNLXsUEqzFQGp7LmZTGdbZQyoD27
         ISVJLiYke0lL+3lU4JdWLnMt2m6IgQRl0NwX/rDmSKmjW+bW0odzuAk4/1U/AmATGq79
         631Cg/N9pgakevUshFgpEy6y027iBMUGylr3gm1v7kQFFIEmzVJIGwRBG3D6XAn3fddz
         PWGIPszQrNHr7kikFF/APxJTJw7klUuFcJEXs1KbTPESoNAmO/XgUlpKAV702hhEV6hX
         2cKBfCYXABpF0AefZ739QsUJf6kTIf+n8l+725wYpEoWIkudRd/+XMhu2EfEvCtjd43p
         U25w==
X-Forwarded-Encrypted: i=1; AKwUvBxe2uqkfw/jsGhYAIWQkXC7howXrrW9CwdnnNiy4tzkCG3ce80Ev68CSjSTS1lNsrB8yAbTVBKS+5H+gVI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKu0necNy20haoJnuyr4gharMvANt8eow+Mt0fmd6kn+EfLDrRj
	BWeUwa13HFcjH0u6RInLLglJ1HgpwDXVJ0T9hmseLheWd/OPmv5r9gAWFrvpTSeEXKO+M/h4U3k
	dl5rTNIFvoTD8ZhYwxN18GeylTfdGmSs=
X-Gm-Gg: AYBFou0c7aaIIkuZd4dFPXTKrZuifVBA+3SDqLJY7rcvc9uDxjked/AyyCgcO7+axv7
	T17DRRhRP9m0mheIMvcezZnN3H6YigITsp8AOnSBdXyO4Th1lHp/B3doBFieMCXSPIvUFrTX4sY
	G4+fmixYFzUGadgl8UUaxZWGGDK1mfSIsuV8KYqYAXuu+Wvjt0stJjs619jp2iEdQZLPK1MWeH4
	b6M+ud+gQVa5dcwo4p8o6KDlkc+FsRgQtmcfaNNyYpupS1BRMqcLwJuon7/85LgT52lgRpVTbDz
	GdPKck3ZEb9wRCM+Dy0Xlcrwbp21iNZCb27dPZoZuBXMUCP6hs/zuvu8t9JbQCEJIf4kzv7j84i
	S0pSvPB3w5jGIssbDKZNjTZxSyUGEdeKi5Rk=
X-Received: by 2002:a05:690c:6387:b0:8b1:567c:e7d3 with SMTP id
 00721157ae682-8b19c7985ffmr16596757b3.7.1793091863585; Tue, 27 Oct 2026
 02:04:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027082405.1297-1-shengshilingmu97@gmail.com>
 <179309014594.3327.16979359855381839184@kernel.org> <CAGGuW1XarBs3ZD7eKeysDs7qGL3=Zgd5-vsY1ReuF57gz8aLFQ@mail.gmail.com>
In-Reply-To: <CAGGuW1XarBs3ZD7eKeysDs7qGL3=Zgd5-vsY1ReuF57gz8aLFQ@mail.gmail.com>
From: =?UTF-8?B?44K944O844K544OI44Oe44OI?= <shengshilingmu97@gmail.com>
Date: Tue, 27 Oct 2026 18:04:12 +0900
X-Gm-Features: AclHuK8kmj6WVIj8zol8TSlhzkemES5oLPxGf7X0ktRixJ_-10JdWdLfo56K8xM
Message-ID: <CAGGuW1UGKtQUGyqY5fKNhBRnmBJ5L+QggeLtbdtvXiaDo+Mmsg@mail.gmail.com>
Subject: Re: [PATCH net] sctp: account for chunk padding in sctp_init_cause()
To: netdev-bot+sinfo@kernel.org
Cc: Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, Xin Long <lucien.xin@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-sctp@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The missing tailroom was found by reading sctp_init_cause()
against the padding that sctp_addto_chunk() writes first.
AI assistance was used for that reading.

The bug was triggered, not only found by inspection. The panic
was confirmed on local virtual machines running 7.3.0-rc7 and
7.3.0-ga1c2b1da93f5 (CONFIG_KASAN unset). The symptom is a
softirq panic:

  kernel BUG at net/core/skbuff.c:214!
  Kernel panic - not syncing: Fatal exception in interrupt

skb_put() calls skb_over_panic() before the copy. The observed
pointers were tail 0x6c1 and end 0x6c0. The same panic occurred
for a listening socket, an established association, and an
unprivileged client socket.


2026=E5=B9=B410=E6=9C=8827=E6=97=A5(=E7=81=AB) 17:50 =E3=82=BD=E3=83=BC=E3=
=82=B9=E3=83=88=E3=83=9E=E3=83=88 <shengshilingmu97@gmail.com>:
>
> The missing tailroom was found by reading sctp_init_cause()
> against the padding that sctp_addto_chunk() writes first.
> AI assistance was used for that reading.
>
> The bug was triggered, not only found by inspection. The panic
> was confirmed on local virtual machines running 7.3.0-rc7 and
> 7.3.0-ga1c2b1da93f5 (CONFIG_KASAN unset). The symptom is a
> softirq panic:
>
>   kernel BUG at net/core/skbuff.c:214!
>   Kernel panic - not syncing: Fatal exception in interrupt
>
> skb_put() calls skb_over_panic() before the copy. The observed
> pointers were tail 0x6c1 and end 0x6c0. The same panic occurred
> for a listening socket, an established association, and an
> unprivileged client socket.
>
> 2026=E5=B9=B410=E6=9C=8827=E6=97=A5(=E7=81=AB) 17:35 <netdev-bot+sinfo@ke=
rnel.org>:
>>
>> Hi!
>>
>> This is an automated message. This series looks like a fix, but its
>> commit messages seem to be missing some information:
>>
>>  - How the issue was discovered, e.g. hit in production, hit during
>>    development, syzbot report, manual code inspection, LLM or static
>>    analysis tool scan.
>>
>>  - Whether the issue was actually triggered, or is only theoretical
>>    (e.g. found by code inspection). If it was triggered please include
>>    the symptoms, like the stack trace or error messages.
>>
>> Please do not repost the series just to address the above. Instead,
>> reply to this email with the missing information, so that reviewers
>> can take it into account. If the series needs another revision for
>> other reasons, please include the information in the commit messages
>> then.
>>
>> The evaluation is done by an LLM so it may be wrong, if you think
>> that is the case please reply and explain.
