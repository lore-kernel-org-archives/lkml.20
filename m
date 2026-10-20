Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515149;
	b=SJnwbzrUfSvcM9EQtcwweRDDXSjiJwO9qsG56utH/SwTXWxovcVS3yFUOf8whP8bg0fI
	 e1a3iucgmI9cp/S2i4Hwxb7AAqVR+hFSFTFGDJ2ZPHQLtnxWx92DkkfsgIofSw7s4gPc2
	 DFnozERJi7DEogQEFmmL+Yplg/HBzJ4Q2qE9sWV+l+1nxK6ls4eaxBYBLtNkJBRGl5jlZ
	 SxTmfwRqGlZQEJwHqxyyHs+4l1cQ+arehLS/Bec85lHV3DhoQlim6QPzj6CjgniKbIlwc
	 16IMSJOPXUNxJNanVyYXNJy6p2khB86Jnt1uUEtR57UcwAzSkZV9Ul7OUX5+y5I0KxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=CTna/wiXP5/NUyBLzytTu4ESJYNBaE3GOT6pFR2PaGg=;
	b=HmiVYUA+sV/n4jAZzYpO5+Dt0/+TatDDj2ztePvtXnWarKZ6VJ4zuyWD1jSPP+z8zBx7
	 nRUUB829lVqpjTH0wMHNIMbI+1/B5evzQSPGbsV/S5HXmLReIOD5Mpi6BsUtAGMajZiuV
	 9ySS1LSc5iDO/TC1YKqcteEm+xkMB5VFafTpRsTXHodE/Vg/KjD4XEHNhRi/ps/T31TcF
	 EzPk6KJcZalH0EZCmSzJBhMyBPyIRPnkSZ+48oLVzjkA1Q9yO/tF97mUU/vSDUv0ZTs9Y
	 RcFoSWKQgDdKaonwc1YOJ/4PghUqbHUyx5jBRr6Ocmol18dq+i/WEvPyhQ5sXZKixiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=htQ9zVqA;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48045606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48045606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=htQ9zVqA
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd0e92d64a1so793348a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792515148; x=1793119948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CTna/wiXP5/NUyBLzytTu4ESJYNBaE3GOT6pFR2PaGg=;
        b=htQ9zVqAo9WPU86wVQfP20KbZ7MoXvrApGqlN9lwOhbXxDKE1zPEx4OJ55vUqLKFkr
         bdC+cC3vPJDmmL/KfqBMOf1D3Fx58caGP8oGNMLghzRpIB2VU7CR7+xkqcvq/pjtNBn9
         wAztO6TuGqwMzPoSgiwmMLpH8wRX+Euq1/M3gYNQ9XlcZmfuassFBEOVr2NZ0bmSm6uY
         187NgBNPQ45T0YjyENf9+hPiRyIAVdXGASqsnqL2Gq0Ll36aSQUbxsILiijufPqdZTyN
         Dmv/Dg65duHy6AmVT2QQ05VaSoTH3kfhKOjt/p0v+gHDny7yeiCVNVEkqp9lxcKZTMiR
         SjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792515148; x=1793119948;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTna/wiXP5/NUyBLzytTu4ESJYNBaE3GOT6pFR2PaGg=;
        b=v3HoYgP6nxdINH+T0VDGp96/oYHGb9hZw6fn0ozfpMnP7n7HYWH3sUHT42oy/FAs4s
         93QW8Ra+qrFprv1EjF5Vz/Vu68i2BDCOQn3ffjCwHufh/bI3IpMqbwjxiGqvxjo+nDcv
         8rp+p9vhW3Js4VuCLO4PNbBpQR2GyGrztKs/Wlh1fiy6TxKDymtJDN1LkgZecvAS59S6
         LACJkOgTei4b93HhgpKlUaYGsmIkKQYMLxIlNyjXL0qN1Ct1APsyuT21MRsPFLBzdC4s
         S4uU8P1olaaXJe+eTFFErHWzKHZcRTxigvEsZ404Pi+ZfsDH2rt4rUb6zCUOMNIc/Q+B
         fA1g==
X-Forwarded-Encrypted: i=1; AKwUvBwG30lLSqes66vCfZQ9qFTpMwExkjwVA0kPZ3mW8oe2ZvXCPCzF717p74B4j19CckkCYBnxq3DFohd5wdU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuTSr8DZwhOycX7YjuXomtjwA7tWsp5GugAnpFPLxfUOVX8Rrs
	k4Ms+dY0HMQyxl1OOvBd9NHYnnApYifL5333QxNLo6O7XWjzvVlUlTc3c0wAZfPO8H7helYlSv4
	PXYtHYg==
X-Received: from pghm19.prod.google.com ([2002:a63:f613:0:b0:cd6:1195:61cb])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:328c:b0:3e2:43f9:b56
 with SMTP id adf61e73a8af0-3e26fdcd926mr1596048637.50.1792515147352; Tue, 20
 Oct 2026 09:52:27 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:52:26 +0000
In-Reply-To: <willemdebruijn.kernel.1a81a5aacc334@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019230758.2960779-1-joshdon@google.com> <CAL+tcoBjWDwA+MrjzRapUeAom-4siL-cnXXLQrVf-A4myNRxyg@mail.gmail.com>
 <willemdebruijn.kernel.1a81a5aacc334@gmail.com>
Message-ID: <ateasbpJlRipuEmi@google.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for udp{,_v6}_send_skb()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Xing <kerneljasonxing@gmail.com>, Josh Don <joshdon@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 20 Oct 2026 09:50:32 -0400, Willem de Bruijn wrote:
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
> >=20
> > I actually mentioned this thing a few times before. The original
> > thread was from Breno who tried to apply a similar change for tcp
> > sendmsg. The fact is until now we don't guarantee those functions
> > should be kept noinline like how uAPI works just for BPF prog. What I
> > suggested was to select a series of functions in one Doc so that we
> > could tell people those functions should be noinline or whatever else
> > just for tracing in a soft way?
> >=20
> > Otherwise people would argue there are more functions that should be
> > done in the same way because they internally trace it.
> >=20
> > Willem, Kuniyuki, any thoughts?
>=20
> We'll have to review hooks on a case-by-case basis for performance
> impact.
>=20
> If possible, it's preferable to select hooks that cannot be inlined.
> Over limiting what the compiler is allowed to do.

Agreed, FDO is critical especially for UDP, e.g. udp_rr
w/ 20000 flows will gain high performance boost 14Mpps -> 21Mpps.
