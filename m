Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792553425;
	b=tngp0TnRrdsYPJUw4l0IQFleU2BJ/oaRohEEI+9wYUPWUdsrX5vYvx8dOO8osx8+BD7j
	 VmYI89lZe6XMPJyaidi6tZkFt/GFarSy82Yw6NrzqEPCShQK2TwHoy07esVehRCWr1vgh
	 8yehrJW5LU3c5VAuhKE8edlDVF1z6wLjwfBlnnWqH4mm3ckoQ0xL2rtFecexaez+TWyyb
	 YfoL09uy/aPzyKGGxn8S2j99yqspxxWqt19qk/e3zSswdfOyFiXBugffhXuTb48gewPnY
	 Ick33oTuPvoUifFhdpU9d7eSpSSibmJ01mLdrZZAewQihn0UYu37Zfk5qkgFQ6O1Fxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792553425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vecFCOQHROmeXH4sokveMTWRACIiaiI2LhMKJ0dafGo=;
	b=lddxuXV5JWnXPSocs0UXHgxxBj6PyPBaJlYFHvF0Y7jNxeQE3/5VLoXjA+UMKrs2j/bv
	 rP5bXXN6cOGiYTn83HbQSqaFxVrG128c7Isc+w8U0vUOS5CokAkykOQ3cWy+CPoCEiVw4
	 iZcAukGf97yWSJN6uP0tRQCsiA9S97PFFp/xMcsa6rm6MzyebD8wa5kWujvIlSaskX3H2
	 Bw/LD93kf38WXqtdtmQa+9n9nB9RbKNN1CCnIJD41vwYthcfAfZxvxFKTNlkyBKLCNUpW
	 4S/Qqw19Brwv3v3EVZXMdN4Q+/XqKen6PTkxSjnhayctmLF6uavLL8mPAhrMlcaf94g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJrfkMPo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF0E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF0E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CJrfkMPo
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfa2fdcfaeso83676e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:30:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792553423; cv=none;
        d=google.com; s=arc-20260327;
        b=dh/w8lndXr+RS/wf/tBxhaev1qJW9DLqI/At38HIT5rG+KarApcaa6sMZiaQH7r/nN
         i+5Ig0J2RY3Ok8fbMyKce7cdBjpPBBd0b4hrJ9v/n54dK6B+4e1BL4jrqkHuTIUKK2oG
         lA/pROCUKSp+0ZRjpje5ge1LcBreyBF+wkkdHsYRD8V9q6gM1cpGegSMGBsAwcshn7rB
         Sfh9ciY48ox4pgr0xcdYYxYquuHLYQLD7DAe+t0UAHTdnCHkTLBmkKMWdmDs3ufqpM4A
         KuM6BQfFGq+/AFrVP21h1+sXxB9vR/UUXHN8GYT1eHsxS89CYn9+PPfO8iSHzI8Er/kD
         SiXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vecFCOQHROmeXH4sokveMTWRACIiaiI2LhMKJ0dafGo=;
        fh=OTc1olS4MLLwY/Q0H8Q2Mx6iQDN5lOUYryZzC2x6zVs=;
        b=Ip+wwpWBsxP12GMIsOvZ5Q5T6wMX8kdLxwuXKBWgqPqsZ3M7T5XYepWkX6L6eqFBpH
         PpLmC9rlPRl5D+9BRi19QqJl1MzjlJxh+ajykc6o/qfWGC2/K56oysWHOb9zO9CHZkDG
         diRfJ4rsWd7wHf63Ag3vJBlSdusC+16beBpx0lVYBaSz0fHLXE1vYcJVcthdWKOHiuO5
         XWeEb6c17OXAw2Jgr7cCyiTzTzb6GphJDrcZpGLFTh8O03DsXrvPuLGQChz3t4OUvsPp
         B6jfDwNOEIGF9OQ1ofNvkUWKxfSRg6svSo2k5Y+CUGVbe77P4AVCNydm3Tue/0/BkyOb
         E0ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792553423; x=1793158223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vecFCOQHROmeXH4sokveMTWRACIiaiI2LhMKJ0dafGo=;
        b=CJrfkMPoLGIsWAVgPF+fNHyzJN0umzx5lrJcqUDCBjx43r4JbeRF33G1JlzON/jlrz
         JETZtdepjzA7jk6SFh0nFHowQMV6m1+wQ5Oxh8UlMUxeLUnaEZUB4unCojOJbS9l5IW7
         VvG71LA7nnylqG6ybAbEc6s/LVHQaw961PcIIw2/13F2oyo1XyeO9bCUrE3lDQh9OfCA
         7F5kNMsQxrK708wpA0zc6tXFAAuHh6SpaA2+pHz8vEaI0oWP+AfY+FaQhgBJlP6cx1lV
         kpU2mR3QLeFyNtsuVsXl/OOiQJdl4fIJTerLNXmdGJZ7pjh79ID2IcVUg/Ydc1v+1pnm
         nyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792553423; x=1793158223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vecFCOQHROmeXH4sokveMTWRACIiaiI2LhMKJ0dafGo=;
        b=xmlsJs9m06a/s+JO1Bq7KJ0P3a+0hPZdJUm6AVeciQdpzFkHJ79LOyUlpYnAxzMn2M
         PIWO4DoWf4uAE3X/XH5HKWa/nowzMjo3xpIuOKItKZTLktRa1u7hH7fR25+k4DKeb2AY
         UfB1UfzFwGeFzgxHyT6EiYzR3R85YVw1bkJxL6pOCDvZfzDi9YcFOWR+86+2uel8/6es
         VKyzke26tBfGQwAN2xw0J1SeGMETHuh+j8qC0ksz8CiuTx/1Fc8oXBWIAnkWsIA/lFC2
         q/vV5li+rnEpypPP9DulZam6R+pXZJmj6ijHfKthJYxQI1H8Fv8JyZUyRpwzN7Xl+YUq
         Xg3A==
X-Forwarded-Encrypted: i=1; AKwUvBwU/CfMyEszwvDdrDpufkMNHWnjcvftMwfz8Iyy5SIklu077lAfTXWxZTc+BpF20F9IkG/w4t4wDgGINyU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6mNh2a/20omfNGSh34vVppWcB8AgmEniFg+tl8O+suZRzuwKy
	T3aLK/i83bK769FZvJArYRi9qGqYs0ByU5vGaUFnJ8ylL8iohewdFXXmrHiuvAP2U+TMgDCMWyB
	+XOqGNLobCj3+OWn4COkYcDbGEhFwMY4=
X-Gm-Gg: AYBFou0KKpRyZSkSFE65yFgPyNdJi4X+UZ3Q4jQSpIQcgep2Fe1KvhSU5XdNnBEZQ5O
	suJE3fzM4tvrzYUohBGDpwEpHwkFeZMplzWPsHaviBujM2R2pm3BCahaWhgLkK5Xuo6LRdHfW5R
	uF9FUybbUpHouAphRwh3R1iXPatpJD9YdLzqmnqT5AAd2EPPEly/fpstqmWtjen0bw0P/Oh9NQQ
	ILZDvUpDFDfTj66VoPn+uo4X6NFeOaiN+eioWL0SS0r4Aq3jnDsbF5/1zGttStWyppGUgdEOBdO
	2BEvM5aFIAauVw251EAxRZtQCrYPrNmJT5NG/d3LwP+VIKtEP+5fPI/2YwkCHO6zUjQ5GXy0Vld
	VTdU+KDRvl5EdOLyUbQPlHPYgCNKSGt7FNW2jNDRZEh7RDn7bTLwHc3TrzRb2oCaRgzZKBpSQi6
	Zi825DVNC9WPgHc3+IDlorK2Kv1IwpY823hqX/vRxr5Blx5klaxTo=
X-Received: by 2002:a05:6512:3d94:b0:5be:3ed1:53cd with SMTP id
 2adb3069b0e04-5bfa1bf2ea2mr269978e87.13.1792553422723; Tue, 20 Oct 2026
 20:30:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230758.2960779-1-joshdon@google.com> <CAL+tcoBjWDwA+MrjzRapUeAom-4siL-cnXXLQrVf-A4myNRxyg@mail.gmail.com>
 <willemdebruijn.kernel.1a81a5aacc334@gmail.com>
In-Reply-To: <willemdebruijn.kernel.1a81a5aacc334@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Wed, 21 Oct 2026 11:29:45 +0800
X-Gm-Features: AclHuK-0ckKCVs6VXksrv4_b4QVPbCKzz7eCkvLnHKLwFdezkMqTMA6m3Mk0B6Q
Message-ID: <CAL+tcoDDKrJ8aKrY_d3L48P4R7TauFVhcB03bHSpxzYFScH4Qw@mail.gmail.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for udp{,_v6}_send_skb()
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Josh Don <joshdon@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 9:50=E2=80=AFPM Willem de Bruijn
<willemdebruijn.kernel@gmail.com> wrote:
>
> Jason Xing wrote:
> > On Tue, Oct 20, 2026 at 7:08=E2=80=AFAM Josh Don <joshdon@google.com> w=
rote:
> > >
> > > We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry program=
s
> > > to monitor UDP transmits. Both functions are static and have two
> > > callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
> > >
> > > After an FDO profile update, udp_v6_send_skb() is now inlined into
> > > udpv6_sendmsg(), while an out-of-line copy remains for
> > > udp_v6_push_pending_frames(). The fentry program still attaches
> > > successfully, but it is silently bypassed for all uncorked sends.
> > >
> > > To address this, make both functions noinline explicitly for tracing,
> > > as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> > > Add noinline_for_tracing annotation for tcp_drop_reason()").
> > >
> > > Assisted-by: LLM
> > > Signed-off-by: Josh Don <joshdon@google.com>
> >
> > I actually mentioned this thing a few times before. The original
> > thread was from Breno who tried to apply a similar change for tcp
> > sendmsg. The fact is until now we don't guarantee those functions
> > should be kept noinline like how uAPI works just for BPF prog. What I
> > suggested was to select a series of functions in one Doc so that we
> > could tell people those functions should be noinline or whatever else
> > just for tracing in a soft way?
> >
> > Otherwise people would argue there are more functions that should be
> > done in the same way because they internally trace it.
> >
> > Willem, Kuniyuki, any thoughts?
>
> We'll have to review hooks on a case-by-case basis for performance
> impact.
>
> If possible, it's preferable to select hooks that cannot be inlined.
> Over limiting what the compiler is allowed to do.

I will initiate a standalone discussion via the mailing list with a
list of samples/functions as you suggested.

Thanks,
Jason
