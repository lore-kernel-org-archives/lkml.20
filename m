Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504157;
	b=U/06IMLxcmVDJItGp22IqoUdXro6D3EqRfV5HsKBbLZWpKKeKAPl5H8bCHLP0lnQljoA
	 kDXYpzUpec5KHH/4AXnfnePcO5C9rP3C6ry73hl6Gfb4GOOuYD7Xfabnwo9GyfLHtf+I4
	 gkl4TEmExTGAVZCVFIydtcDSHhNFTVa6z7N4yTddvtmhVl+DAY2I9Vu78WLfLKIaVh0QJ
	 18vF5QSOmkXQcvKqizL/Cce01MFo6K59vGd8z6Eo7QKitIpLGHD26i0IMuufjHUnH0+UW
	 yjFb+n5zMxRTQ+/VUCXt6A5WI7g9JOn5ipVbhHygF82WZc1Iao5xWiN95VANgboKGog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504157;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Vx5pn8LfJKkYukkBFBaIEiQbK6iX6OqWjqt7DXKords=;
	b=IUnfB3CQVZmkTEgNihnI6iXEHPR2W7h3c+ouVf79YsnF7oYQQ9Nb5UrM2dvXqwpMrMTo
	 eyP2uN3hpP48SehEkWmQQGImDI3QD1ZaBTC8p0xyTMsKZ96ZRLdcaZOjPIafws/vcd7ca
	 nBXT4LyM6+uQPX8392SDRI+sDl7zLWN17UF70Qmx7TxnF6tNsxOhvgS/e+TtcbrqH3Xah
	 4hv/8cisLzf1i2U03IkRyYp/qrqUBJmQOjBLkDGjBWBQTlVKnzS1ITuPUQgtV7jDIEeW7
	 VBPk1M0g8rqHgMB9+ETR+i1u6VLM9i5C9KKjZ4DpGmxqNP/f9d/0D9nzVuag/syZ1Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qQpRgCIB;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFF8606AB1F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:49:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AFF8606AB1F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qQpRgCIB
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eadef147ffso430655e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504156; x=1793108956; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Vx5pn8LfJKkYukkBFBaIEiQbK6iX6OqWjqt7DXKords=;
        b=qQpRgCIBv2HcEljAYpQ+GyAMm/ETVu+Ak1bTpWnkvkKdb8jiTNswmqyaTjMjBRv1QO
         3VajOtVYiY66DUePelWveibiWhlWIsbPgFZTDKsW6Ue0sr/DN9zRI1qkrCxwRwpHhUL6
         zLQGIQV3eRzcgdcqh238UBSZRoiq9jaZBZmDQSpj5SVBM/60GBQ6qFzkL+e2jJnPsI5v
         7opj3f5RPUzi2OpBbRu9NxkVzJfMQNr9Fcy+SBNXorNmhV01hSbKprI3dB0pPOx05jD5
         VroN/7WtsFq8dYET0gfsDloqDlNb/EavO14inXf9P1CETV70e7tE8sCs9MJfkoGoLo+k
         EoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504156; x=1793108956;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vx5pn8LfJKkYukkBFBaIEiQbK6iX6OqWjqt7DXKords=;
        b=KjXXAwXXaoGpmVdVsS4doGAn5kGoSyhBvvuCkR86uTWl6pUBfwVSGXTHlt2b7WcN4x
         9ljmVm5RF46Vefsc07SYAZetKStCLpolPbG/xWi7bvVzNM8zFz4ma7dahuwgnCOaTl7p
         NZKEmDPDFKRDsQH5KnOXwoMcCQQfbsBnK7h/VxK4sibjmoS9Dmvcln0Wtey+7YGhjJlp
         302JwDRtwpmq+fR+9SPvyaD125P75sVArflCDdWl28jxgLrsQji4OQojlq2yzHzqcBI4
         O+cijb2RKIoQl0VAl6rWju9E3lugqWaJB1ddjUbb6WygGj2HgYc1hnx5eLa7cKimCJuW
         bBDg==
X-Forwarded-Encrypted: i=1; AKwUvBx+tJ5yrB3+rg41InWaN1pGpIE//odLga8KbYnVJk1oG7Q4k/igdMMTIGmnMWGelaOnUwAF60hK0NpWBAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdVLMV0Yz+JAiyg3BNkA2oNSleOeKxS24VRTBHnbLPqY56WaHX
	UQf9a/HRw9eX2NdmH92WFBALLF+ciDFU2oM4jzY91T4gDDfbJ+UNC/Ou
X-Gm-Gg: AYBFou0GmqkRSTgowXvIsr0aptB5SN7VjemFtBjxq4OjOFXv24UE/eqhEqJCJ6gL9nG
	g9jqFq+R89Ls3nYltAq50NNF8HMb5OhQSypBUoBoOgXWeW2NSOhnxIuG62yJoe8/b0ZFBy2D8va
	KLL2KlIkq999LDRM4d7a+sWRtL+GWpANHzSN1YHvLyiiyes0S80FA30ddenIWiDtiXbXWEruDiG
	UNb/yU4cfTs7aaGVRRNE5OB+6JbeHTQytiikcJ49ud896wJ5G3tuUaVZEBd74TP0rpLY9IHcudA
	uNLHsiW/2A6CTt3X6e7EqD9j3dqDWUKyTnACEgAjBYU1sPjA/EDftLmV15hj23Yy3VG5f4cCjYv
	Q78ahNz/1E+P8rYtZ6NUonqEZun8ZQgeVQ3GcteFGTKMfbUDbcznRIBTbmHoF5a+oGbDEaMRymU
	+Kxc3FH+bOlQzsJ61Cmu7sWSAMKiTGPYTGs/tFQLu2xzFLcTazzWEE8tVrZAVC78hXwyDp05sz7
	F/ED2hdVgXntoW1IxhocXELcWrQUlQf5rnUAq92g3uCbj6oyM30/IDgh7lWPzTmn6DSgM780YY5
	AVbETXkV1CtnUPFSS0GiBL8eKm+Mdzn1+9j0k0/WJOwyu1xiXPZO8vWDiTdvbHVQMtKe4UfzC4J
	U7nNXZwiQQsOzhJPJ+uW/
X-Received: by 2002:a05:6122:1d05:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5eae05230d8mr360440e0c.9.1792504156234;
        Tue, 20 Oct 2026 06:49:16 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b518bc8sm12525922e0c.11.2026.10.20.06.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:49:15 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:49:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Kuniyuki Iwashima <kuniyu@google.com>, 
 Josh Don <joshdon@google.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.1d24f2bb46330@gmail.com>
In-Reply-To: <atbsxDZecXYSDBqH@google.com>
References: <20261019230758.2960779-1-joshdon@google.com>
 <atbsxDZecXYSDBqH@google.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for
 udp{,_v6}_send_skb()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Kuniyuki Iwashima wrote:
> On Mon, 19 Oct 2026 23:07:58 +0000, Josh Don wrote:
> > We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry programs
> > to monitor UDP transmits. Both functions are static and have two
> > callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
> > 
> > After an FDO profile update, udp_v6_send_skb() is now inlined into
> > udpv6_sendmsg(), while an out-of-line copy remains for
> > udp_v6_push_pending_frames(). The fentry program still attaches
> > successfully, but it is silently bypassed for all uncorked sends.
> > 
> > To address this, make both functions noinline explicitly for tracing,
> > as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> > Add noinline_for_tracing annotation for tcp_drop_reason()").
> 
> Unlike tcp_drop_reason(), udp_send_skb() is a hot function as
> inlined by FDO.
> 
> Did you see how this change affects to udp_rr performance ?

Yes, maybe I was a bit too fast in assuming that this does not
meaningfully affect performance. A tcp_rr is worthwhile.

Or, since these functions call ip(6)_send_skb, which cannot be
inlined, perhaps a robust obviously free path is to attach BPF
hooks to that (and filter on sk_type and sk_protocol).
