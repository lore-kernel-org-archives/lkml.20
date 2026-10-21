Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792590719;
	b=su34pW/sgG+x+PwrsIXYxKwGyOg5U2DeNLhz9IFI2QOvqjFlVwODrjOo/TjLVuo0Esqt
	 DzAVx/ZrKLrafyp0a7TOcEU/wbVbau4+Eeqt0ffS5npYEvveCh+Euo3L57agYbOaK2VPT
	 lOJgFwL7IIFIRHmVKVGaDtoZT20yknMDilzpL0/TrCOxhIHhpfFIkWI0wQm2kDADRM423
	 8yf22WdU5uWO/gh/mUgLFmHAhx8cQEDfLWkOYrq1IqPvZuvz9/nuiAUCNFFSmZ+ybbKgs
	 tXQ0xaBnN20x1y//ljpC6S6weNxG/XAJejYYgpKneO0sq820W6ZOF5OylFuk2JsEsow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=5afhtd3cTwW6HTlFrbfLSEsRMBvqB11pORiv38t1qGs=;
	b=gQ7uoCOwnqwr6vnhhicK9bK2HcnS/SeZ/Ue8uHxBnIq4BYF/21IwSwdPYSqijuv4fagp
	 nInJOPZfZqu6pilyv8ebSo/ZNu3/7WT9IkO24pUIY/vuukLs47HrZCqPeAP5fH5TZTkc9
	 SY/O+vMwSZepnCyYq3tSS8CpMmN95bV0HmcONb2O1OuGIPvV5wPI+ReYw616+KVtRKqAk
	 wW/06zarn8z3dcyan7U7voedOd4joVCwSs8oQbP820gbFljP84V4ZZLAQQBpNNtwVWG4S
	 vjMSNDf0vT+pKBye4wK77bgKqAqyTsAVNVo9uLu6ParTYz3n/1aFPKJBhJArljC/oJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=plzFiKZE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41821606A327
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41821606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=plzFiKZE
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93f22a8515eso68439285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:51:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792590718; cv=none;
        d=google.com; s=arc-20260327;
        b=kTbYiBQBh68741Atr1Z/hFusraID2iLd39tjYsFPA3Q6v+kHLM/2RoW0YcfqABWgcP
         Z3h/93yUTMVXqGi7xAEhDfp8ex8nCQ/b9lUluLe51AIo1QXauKoNra1M0+MhyoGEXvlZ
         hXNmDBzL5nChjXDGnxEbePD4I95YLeDzpLaT7hplRmLZJU+THE/AF/Ddf7uJ4tqbcEp/
         PWcuGuMjpcHXt4ZDJzDJY3MuwwXJSLau9TgcVG1oNM+3kohtjEaoocVQUCBvFylnDK8c
         5fsWFLjFtlCx2jTrHNWjrryuqbockU6IC6cF0V3xOdObVzn5YlgsLoRcwXoBpG0iMpup
         7YNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5afhtd3cTwW6HTlFrbfLSEsRMBvqB11pORiv38t1qGs=;
        fh=zTCpn7WBgtfCSFM19w1KpL0CCDIuudVGqgChl2IGbR4=;
        b=KVasfmUmfl/9S9ta1tqF6D9jXhehoiwMjG4VHXVg4oHQ67jx4vxxEhEpWHt7yRkCNV
         OzfOujg8hk7COtrTEj3GiO+hxOSUvFAXcgRRc7hs/HDfNgZBypgbxN3rZjmSQgkoJekK
         M7lFZRQQTD9g4EH6AkoqQNqxJEBHarFQvSBQsEtdi3H18HNf7FogVpodrzx19WF+lpEF
         QZjyNvoq464nLyvO0Q9bBJZtKqvoXfvckW28xGCceWUiwgp91yRodahYYbxECclSIppW
         qCeHAIWKkqq2cVg5xeuoqN39jGD2WAuUVuTNH7IWL0cTR+EPzns+8DEpFf/iEYQZ20dv
         NoTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792590718; x=1793195518; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5afhtd3cTwW6HTlFrbfLSEsRMBvqB11pORiv38t1qGs=;
        b=plzFiKZEAk/A6gGdDujp2MG45A4vmRkax+a6cu6RGVsfF+zV/yScg//6ECFikkLMmC
         0X6fSAtlIUJR+I/GP/ibGlM0eBQvH1e3+UCEUQVmSGICgls/DW9L6ogTZOnbEzvzEtLo
         7x1zHWNC8q8xNzzG+2hIeaeRHDenx32okWqWeJ92LCcqvXYZzwNZF9AC5t+hRW/CtMkF
         Ien7XL6Vgh21Sl3pB8NUHyg33gB/nGs+SJlm18DBbm6+sqVOhL6d7MjpnMegHqnOCqM9
         +Q7Noh2p8m0GNLEcQ05vzWJPASESxUVwWjl6hsWXGHZ8SVpl1WBFkzHG7C6sO7EM4Bn1
         xXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792590718; x=1793195518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5afhtd3cTwW6HTlFrbfLSEsRMBvqB11pORiv38t1qGs=;
        b=UaGvp5QAI/cBp6EyiI73eSrIxLFkn3M83uljvB1EfdvAegQkezTGXr9gTFYEAvPy63
         M+uQc389XWVi3CG9BEFaT//1Td2j1Mdi0FY+LhRWSbmAxMDQBOCt4HHpgsioY0UhHclA
         lk+V+P9441/5QaslTqs9dvNbWo0Rnyh8RKYW6eTnGsE0kkq6ShOqy9xNCVhnKwkK4CV1
         lFr28aTjF8fnr1fERebPrNb2z7DpRiKcfEd7xDKns+7bDRiY5HxUoSPrBpTpYc97cMCZ
         o7Ykp5bj3CAhGDUZ7RP8QNXMYz4ry/xQyciMqNCkwKVOb9ecJve98hP+JrjdlfBb0z/n
         Kf2g==
X-Forwarded-Encrypted: i=1; AKwUvBx+DOLJvrZbn6/4KQuK/6NbtZYnW9zb6zLEzac3r1St8eXMpJinxxgFKM7h5E8oMjr8F6Be3FNF8UeChdE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxZ7kRoGg0KqIZVcd6feQN/ZTfytL7y3i/rq9oHAfkGuNtPUP6
	dsDorOnxaTXPdfQYBfy0hhP4/Z2t3u7/28HxNJd2Ys9nxG4YjuSbhgOG92T2vD0/Nn0AYQ2b8Kh
	JXdnkpvSZ1f8dFtQ1xIRJp/yeaBHqQnc=
X-Gm-Gg: AYBFou0ff9t74/oMCOaki7eTWEYyRvkJjyv923gWysy7/8qMNF5ZMORk9HlohnULi6l
	zNs/yXEVLBIrCGjhAMtn9EKzG7CINuHu4ZSPOAwWHsJSXQ/3SQmqoBQ74H3YsMle8YpahQKNaVb
	Nak2LQdTnT19MwOkoOUVkw5CsU8Tc6xESrbJKhYSKszOrrM+0HvM1n8/OYXr32X2g2btvzMHtY2
	Z0VugOeq59UzeC99eSGyVxeRxdF5JEgVkyB134MclBCpzAQ/C37zJMjicrUuLcytwD88ReZ9Fwf
	2oiSWdUmXZfrr9dMSo4GK3bUtvm80wZzEpC9Aw9+Fx+GU9/ggzXkTiJ/V1wwlBRb8o9zBuEWpxi
	kUysw+V6C51B5Dpq1MggcnJIodFBksKVepUhYywe7gutNye8HS4Ae/ItH8AB3Dzt7ucCvwf2KWM
	IULpkvZdxb+mjOT7xgkm+FJ4iosLxtC3/hQm6e0tghOeuGdDam8Cgku2FaR4KQtoFbshrCx6Knw
	EpytWr0xkDV9iYr24r0hoUor4GCPpr4+Zv/Awj7Dml3zHO55JIhyCPSpin2PfYRqdAnh3BlvU2B
	4ytTbid1SZg=
X-Received: by 2002:a05:620a:a8d4:20b0:93f:5f83:2cbb with SMTP id
 af79cd13be357-93f5f832ec8mr63850485a.7.1792590717833; Wed, 21 Oct 2026
 06:51:57 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261012132622.48550-1-jain.sm@gmail.com> <179181183946.2527009.5855837780305581870@kernel.org>
 <CA+FWx=mA0dsOSopCNBiA_8BrYSDYD7=jxMO7uLpxT1OOU-BkWw@mail.gmail.com> <20261019191351.0719a13c@kernel.org>
In-Reply-To: <20261019191351.0719a13c@kernel.org>
From: shashank Jain <jain.sm@gmail.com>
Date: Wed, 21 Oct 2026 19:21:45 +0530
X-Gm-Features: AclHuK_tJGQGHQXYH1HoqC8CgY_oDtEKoqd8_Z2JQ46FXa4s9FQglS1oEe75ov0
Message-ID: <CA+FWx==JYSLqPChB9QprBeRnxiVM0cu5cxPLhrwJNi3Afitgaw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 0/2] tcp: keep the route window metric when
 SO_RCVBUF is set before connect
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, I read it, and I understand it: the missing information should go in
a reply, not a repost, and if the series needs another revision for other
reasons, it belongs in the commit messages. v3 was posted because the fix
itself changed (the AI review of v2 found that the socket-state check
missed the TCP_SYN_SENT paths), but I left the "how it was found / how it
was tested" part only in my reply to the bot and not in the changelog.
That was my mistake. v4 will have it in the commit message of patch 1.

> Looks like AI reviewer has some comments that need addressing.

Yes. The v3 review found that the SYN cookie paths (cookie_v4_check() and
cookie_v6_check()) still use the old rule, so the window scale of the
cookie SYN-ACK and of the child can disagree; that a single bit can leave
window_clamp below the requested value when SO_RCVBUF is raised later; and
that the bit is read on the listener without READ_ONCE(). I will fix those,
add the listener / SYN-ACK and cookie cases to the selftests, and post v4
as a new thread with a link to v3.

Thanks,
Shashank

On Tue, Oct 20, 2026 at 7:43=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon, 12 Oct 2026 19:04:27 +0530 shashank Jain wrote:
> > > Please do not repost the series just to address the above. Instead,
> > > reply to this email with the missing information, so that reviewers
> > > can take it into account. If the series needs another revision for
> > > other reasons, please include the information in the commit messages
> > > then.
>
> Could you please confirm that you read and understood this paragraph.
>
> Looks like AI reviewer has some comments that need addressing.
> --
> pw-bot: cr
