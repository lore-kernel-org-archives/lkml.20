Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908102;
	b=I95jfXBcROCNTDYy+qAp4iktD6jMIphON90nr81f5ulPyfRNQYHdXXYwQ9Ef48NDzWJK
	 Ku6U3jeB+hkeelD0HCMC4d57DZDL88N+AtaQ90Ghu6pcV5FegaSYrxQLHsOkdnmBVsHGc
	 Mnjpmv0eUXh7Xhxqb8TuDx6Sfl+2Urn6VtPRBlFddZQw47R0/wGRukiaFHr74SECbidAx
	 H22dOAj8dqAI02OSjr9+DiFwwxH+YpvrzHB0pk7rDTSWo0CtTLU1hRxAgHcGESsY2VpT8
	 D5fHCkqcEizmkD71p4V9lfhp/OmRy90t5ogdai4sxZHiMZNPnm/uADZDxYxMFtFM4Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
	b=s7i3dlli1UgKnvdUs1SSaYCu/IacVrmyfSgMVZMpwXeXa57DjNthEMkdbXffFgXyHFRI
	 to7dFhCVse9+lyycxAGEU1BuwXyCVump+7b5+VZTO14CbDGfR6/gDzDBtV9prCzc+dJwD
	 R33ovks26xhpbEG/tTf/v9i6X8pD/ffBbs68eJRyZfnyvBI5AINqyGFF1t+BOIruIJcPQ
	 Br4ddT6jytGuCg26NtNhptOJ7LnTtf+Zi7YvrhPuLit6XCJt7vrwaE2u4v+VNghan5LxM
	 5ejoKuRYa8MuWDfAH6TD0QEpMzJIutM39Rk85t5q2dnnZXTGW7LkPpBHC0wfqwF4ceg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOBf4hu+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14206606A32C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14206606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QOBf4hu+
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-170135e43c7so7057456c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:35:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794908101; cv=none;
        d=google.com; s=arc-20260327;
        b=S2C/hO45UMlf2phHZfz0BT+qMGAfvjuOjNkrnyNkaF0qOVzHQ3ho3TfUO3Hv/85lPg
         /ZB0+/GcA6tH8mSmTKzCQfH0+1uMMIOAAPaDSr/Idetz2L4hOhDUfS81UKmeD6KlCOP0
         5zvAHTx5qyV5g8O28VdvhQ5shranRVnngVfjcKmaTL7JsUaTlE0GsqPV/GYdakujCyU1
         XZtxOW5si6BU1AfpZTonIXM8lfzcXp0gvm8/oR8RmKZK6ltvkQ8Iiu9CyhgRX6jTOBf3
         SpOKuwoSviEs1wvF5WxAIpGDzZDAm799AQa1z0gAC8r/8ATURKrbiy3mwsdcZwrr7c5m
         sW2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
        fh=dreV/SWnGl6XRInR3kIA0ZXe12bzalCafBjdtaWryQs=;
        b=Pw5s6tjFpqNgXZQLvLkhVl9c7bQyZayLJv+AiGzuJsMDZ5MpEolhwowwgTjUBTlml2
         wCnHnP4ZlqEXSmYpU9ZKvz5WP5W81B9bgFcp6xncwP4kpRg1XvusOf2FcyiJ3cbY25R1
         LXPu46eMQbwVbZNJT1nRcqzk+YH/AbaQwGQnMe3PZ0cXwMXWyZykMksoVcHL5DMymSVJ
         0Wbsz/qhRYltXZV0xAiAPPJ6yakPsZmJ4qkw7H+bSBKW4LIT6yyQZLLuvBlsTDVJKTCT
         v/KJaDkf2cweBEJ6C9aKn9R8Mfsxs1gCtxIAAuAwhi9QKznqtIJxzc/BVU/mXDopP/qZ
         KSVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794908101; x=1795512901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
        b=QOBf4hu+e9P7Tj0w9vSuBeMPpOphD6LpjtcGj1L/uNVodpZ/F5Y9N78nPLRRMAuCEH
         gkDJ2f3/TF3vY/4zLaT/jlJxAldC+6SH23dYTMfq/sv6IpCNB0jDR4vwz7QE3TYQHvg7
         sQsLEJ6da1vKC3PazmpxeXhFh/1q24M58jpc4DmCl8NNnAKDk2Hy5+e+mh9nwUjTFpca
         BusYl7ltL8rCRM79KoWi16IKedQ5KMVcrGXpkAFFNPt2+roB34rX5nD/x2Xes67LmwPP
         NOUwoGYdafEGrCj0KmT6hM8f29woMERR7R8gG3aYEjAoiUKpawViwgFZBqFMAVEDuojr
         EDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908101; x=1795512901;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k43+4NXoe93Lu6IXLeFrYJXGLcVxquToj/t7KJWYnQw=;
        b=W2sDHgfTph3aJT9Ct/OmXwvDCVJzSh9iamfn6ajcAP/L5LypzJW9Bsfo5PXVBNfWRO
         krIlezA+nEKDFMYsrW0un2mpffd349MImbKLZTZ88qogNLwhhoc/PvY5ZeN4f4pES+TD
         hfg+GR06dXr0jn7r9W2VU2s76fW+3BmJrdQWf1an6Br2X4Rk3Iq00J6sd+xP7mwgq7a8
         Go3l9ZhiUh57wVEjXioh4NrSURQhukf6LjmLC+TTgrcduS6CE8rZ0fpx6/xQcg//xJ+y
         U/mGCSb7ZkKBuKZIUXWKJN8iZ/M1kKCCnJvXGyxQmhn6hQH8mn3VASgwtYGHIBbLaLm0
         jAGA==
X-Forwarded-Encrypted: i=1; AL+hErHNoGxtb2dk7L3lY42Oh+43cyJEiPGTk/DiOrATapglQ949tRRR1uHFpyDK+4+6gDDPRfnZoSJeR0CJV4s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VYER+Al1P3D7FBFDE3CzmVJuviBuV3FPs+FSY1FExT++KFPAx
	V/oNB053122ihGYhhO/e+7GJ2fuEPIUazhPrscl1s30+fxYZuZP2lmFHhP2cGFIH+UJ4rgWThY0
	xNi09b2A/4BYwTeIvHjqvXpHywzeTqeg=
X-Gm-Gg: AYBFou1DNMPHjBEr7Jab24D+Xms0oIcVm1fd5+37HbvrUL7cX6zpzPVJIOlpbNioli5
	JOV/WkJgqNAO38NSmY/dQTlyrx8b46V20YMiiii2bfUQOTL13Z6oprOy8Bh3oerNicN02vHDJ8V
	ppZsEcH+EEe/VYiSP1ZOfP5wGw04MXA/o9yG/otoHtmeftppe8s79JkDLboKlk/x+VgeKckdXqI
	HtlL2QQJZrOo/Rj3kRnxOIjFk1ldRfcy7Isib3jP4X10MwD9o11V8/OWUEiCFWpwSrteiUFQOJT
	FRsrZkAb2AgnNy9wbuzCTgA5mBJXiuY+fRCmjpKCpA11CbxYPFpnyyxgBtojATBhqsrR/eGV6l+
	J4dUUFP33tnQaZYj8iK9pdTCgeeo4V5Uqw/ikRqshD7cvlN1tBSZVK2MwcbMbisogx/KN
X-Received: by 2002:a05:7022:1583:b0:195:e4b9:d326 with SMTP id
 a92af1059eb24-1b503112a76mr12794044c88.12.1794908101016; Tue, 17 Nov 2026
 01:35:01 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117092157.85513-1-hj351016@gmail.com> <179490763326.3291.12558236650605974154@kernel.org>
In-Reply-To: <179490763326.3291.12558236650605974154@kernel.org>
From: khj <hj351016@gmail.com>
Date: Tue, 17 Nov 2026 18:34:49 +0900
X-Gm-Features: Aa3M54qHHMqn46yygTWkKBN9mkAPbQt_LCbx1KdUTLuCMqi04h-jEycpKTEF0pY
Message-ID: <CAGr5VtO-aiy-RpUsnw=dKVFP0wgvBnQ7uw-NWr-4391WHV7iHQ@mail.gmail.com>
Subject: Re: [PATCH net] l2tp: reject short IPv6 address attributes
To: netdev-bot+sinfo@kernel.org
Cc: James Chapman <jchapman@katalix.com>, Jakub Kicinski <kuba@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Chris Elston <celston@katalix.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was found by a static analysis scan (pattern rules for
NLA_BINARY attributes that are read with a fixed size, LLM-assisted),
then confirmed by reading the code.

It was triggered at runtime on 7.4-rc1 in QEMU: an unprivileged user in
its own user+net namespace creates an L2TPv3 IPv6 tunnel with a 0 or
4 byte L2TP_ATTR_IP6_DADDR, and L2TP_CMD_TUNNEL_GET returns 16 bytes,
the missing ones being stale heap data:

  sent 0 byte(s):  41 41 41 41 41 41 41 41 41 41 41 41 41 41 41 41
  sent 4 byte(s):  20 20 20 20 41 41 41 41 41 41 41 41 41 41 41 41

There is no KASAN report, since the read stays inside the skb head
allocation. The leaked bytes are non-zero only with init_on_alloc=3D0.

2026=EB=85=84 11=EC=9B=94 17=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 6:27, =
<netdev-bot+sinfo@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
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
>    (e.g. found by LLM and not proven at runtime). If it was triggered
>    please include the symptoms, like the stack trace or kernel messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account.
>
> *IMPORTANT*: If you do repost (for other reasons) - please include
> the relevant info in the cover letter or commit messages.
> --
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
