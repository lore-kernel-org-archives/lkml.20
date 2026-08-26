Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7229545D5FE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787757633; cv=pass; b=OYRQbLHSUaNkvhBWN1owU0kSuc71SZcxL9QOw7DFFuvrbM+fePCKyQjmoYCLWbwuMVBf50wV65B8EMCwqNUtIBBMwfKxp0IPB5wMDkt535JrM1k44eAsFUbsgmrktORyZUzWT899STc6LOfcfucLYbM/hH26LLkH9PwhdyYIY98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787757633; c=relaxed/simple;
	bh=sCZYn2GfaCakpfs73hnSx6QFjMiUhnTYTcyWSrJLlxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MYZnSq9hhlWoSdOWbsT/YlN4UwtFpn7HOKRrzlZ9dwCRV8OIa8HG8GHA0Z24IBt5/1QTtBIvZP5jZYDUMkVeaKaktfU/g62+8xL2QjLnXmJZtAxViD2W5nV5WVOEsVJ/E234AL2A//etIzpzVe7ROw7roaVAl69XJ73x9aW2MSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xizp48oO; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xizp48oO"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52de50e77ffso10236591cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787757631; cv=none;
        d=google.com; s=arc-20260327;
        b=kFW1qUjhLKXGdLQFEP+ByHv8+1inXJWKo80xpI5orgTcZRCvAgvzfim8LMq6hpwCd7
         sS3635tayqqsnAXqwhwQ4gLxEL+glspXS3ckaMDLmMAIcd5bRqIrW9uda4Z+Fq5Vi8F5
         ROIIs8Fu2jxm2VbAxIqM5/8Mh0LGKbbRlT42Nad4dVWIgtAHmdH75t7gSc1rCFNy2MMf
         pH4fCEBBd9gFrA2fiSmGrYtaEBt9Slb9wdJBFge/EIa+Zlqexsu1VLi5XrSfxdEYmToi
         bfXHpuLKcDbLPMCxVrs5brCXGXr55JpSDFKoS0zRRs26/oszTLSeUmBkR/zZUuzenKaB
         PoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SfCiydN0Xlj7GfJ4cH4asf0TucQSK91D8eGGF7AZl/s=;
        fh=cG0j4xWlm8dTo+A40k2cQjpd3rFGZNNIgrzwAvDtIcg=;
        b=sJRTvNtD92Hqt1sY7t+iXRbgs57pfXNlxzoXrGrjlNbnDeHorwcmrUycU+xS2HwQwX
         uZugPFaQPGinYkImOQPGTML4Txiwha/X2UB4k6CN7UwILDHbte8QzepYoi98UkcE7/v4
         /2SJz0eomv4jeDmSmJcK7nsrdHbAmQ85RKKbyIJ6fkE7Sbthu2TcV/Ft7tXOn75uouIP
         ngdiiNcT7RNrUpbytCshv6wFfO8B1paJg61KS2FVt5POyrvm3MQSVLN/y9//BTcgYfGp
         iKmOMES8XMyvJOKTtr950IzTyn3njE5kzCohqlzJL65OXMDZfKs7BCrFhlVZSAt2ep16
         kUOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787757631; x=1788362431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SfCiydN0Xlj7GfJ4cH4asf0TucQSK91D8eGGF7AZl/s=;
        b=Xizp48oOZwW8OW2vtqjuyELwITRhqn5JJUJ75+8GwCTG6F2Ih5mwfIG5+dpImvEK3M
         B3uq7Jh62lZkIF94uEDymtrY5EKUeM0pFfjMbgRp82L6/TxWFnOQyrWf/GOy3bR6ZFzY
         FcMVTpiYfuCii0KOBxfnXt6M1DfvOyOKhqYU54ZvepKPSx33Bwkb+MREBgWW3NvikfRj
         e7X00CWQ/kH0kySInxlui0/P9N+oHaopMsiGrjgfbU+KQvsnHDXjTbJXfNU33zMsrMfy
         pdr/Bj7v8HaOezzxjK/d9dUSqFe3R64icKPTxlLeo3G2LfmvkGhXpyHwNbBFdLXZrt2f
         X+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787757631; x=1788362431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfCiydN0Xlj7GfJ4cH4asf0TucQSK91D8eGGF7AZl/s=;
        b=GrGnOCVC4VjOP2L7sVFxDzw43OuzWV7KpNaktcOjPKQEP+Mry2gRgv0upZ5TjrYYb0
         JfPnnkq7A2jFvUQMm//QDHStr4OH6zYMUlfhnV1/Dk+cKKvTCsSSdukDjYHN4slcAev7
         616jcxcso/bSN7B6ONHHL6VyQDrzeQUuN9m0dfoKAWNTd/Gm3wL/2wGqi9tEQBLnU1/a
         Ig3H7BNoyV/oKBLjm1cRRAUaOvpWVnyYTvFAAfA5oAoMqyTu+UIpJyE39bp+0RXuSRX8
         bJkxxq9JHQbYZFP5WvireEepX5nt22ErmwZMOXMyr69izl0lUv6eCACtXahXAIm5HYgc
         rBeg==
X-Forwarded-Encrypted: i=1; AHgh+RqyDBodhG4uOPx1OJdP2413a5x1937bVYpFN1S5DTGtPDSUwgB8TriiAWMhdrqx6Bq5hEXf5kQRYrq3EWs=@vger.kernel.org
X-Gm-Message-State: AFuF++ml+y4jlM3YrvKPUyI4QAhTIySBqmXqIUIxGKxrqqFXjTUEqx/m
	vKMw0GFAVhLaUoJG9SLwpujoVm7Se+RLSiZEcq7mTc9qwoEIuFCEQXGue4MPepDlB6GRLvewTNE
	Lfsj12ZzagFwqck59uRtEqsGDbp2QUo/K4dSZLVRN
X-Gm-Gg: AR+sD12lbhqfsNuVU9+KUFBm2whyBhiGeSmPPBdPVcYNIyfuyMEIktu7Li7r7YG060j
	ilf+IRDOBiAjxtoWLTSImp5lJ4yalCu0Y9ukbDj9+Vds4l9nvj7ZSKDDOw+2eawwvIEBHCjo/7v
	bJCGaJTu0LQN7fn3goaU/dONfD7Uv6gHt2gAbSM38Z5xZkl7azBA4cRg82/fFA022xbQJeIIEII
	97nWhYttU/nE6QlonY82VL3EcsGOz7KMCocGmuQNWj3JXqcPO7UPYLRF//d7Q0gJA7YTHxwlhNd
	wC79UgGeSku8pU9XTjKL6Y79ul/bG+u2utNNNsrKZC0SYEpnil+HUrkBEwRM+s4hYDUadgeQ2mK
	B1JPbpVtGhZwRw3+lfTRwDpFZnJwe3QTfV3ySJa41ZyveI+xWzp20viIGLLU=
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id
 d75a77b69052e-52e423e01d9mr75971011cf.27.1787757626391; Wed, 26 Aug 2026
 08:20:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826141145.67823-1-jiayuan.chen@linux.dev>
In-Reply-To: <20260826141145.67823-1-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 26 Aug 2026 17:20:15 +0200
X-Gm-Features: AcwNN1WQYfOEPBxc7l95bDB56B-HoAnly0oktECUAuu-7YHrmEIMuUzsrsZifHk
Message-ID: <CANn89iLWF7qg+VYcao1L_-e1vXSTCKPLw9a855Gr5+gPe_yG2Q@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: fix corruption of urgent data on
 multi-segment retransmit
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Yuchung Cheng <ycheng@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 4:11=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.de=
v> wrote:
>
> On the normal xmit path, while in urgent mode we refuse to build a
> multi-segment TSO packet, so every segment gets its own urg_ptr:
>
>         /* tcp_write_xmit() */
>         limit =3D mss_now;
>         if (tso_segs > 1 && !tcp_urg_mode(tp))
>                 limit =3D tcp_mss_split_point(...);
>
> The retransmit path has no such guard. __tcp_retransmit_skb() builds a
> segs > 1 skb and hands it to the GSO layer, which only advances th->seq
> per segment and copies urg_ptr verbatim:
>
>         /* __tcp_retransmit_skb() */
>         len =3D cur_mss * segs;           /* segs > 1, no urg_mode check =
*/
>         ...
>         /* tcp_gso_segment(): bumps seq only, urg_ptr is copied */
>
> urg_ptr is an offset from the segment's own seq, so a copied value points
> at a different place on each segment. The receiver rebuilds the absolute
> urgent seq as seg.seq + urg_ptr, so it walks a moving urgent point instea=
d
> of the one OOB byte:
>
>         seg1  seq 1     urg_ptr 5001 -> urgent @ 5001   (ok)
>         seg2  seq 1001  urg_ptr 5001 -> urgent @ 6001   (wrong, +MSS)
>         seg3  seq 2001  urg_ptr 5001 -> urgent @ 7001   (wrong, +2*MSS)
>
> The real OOB byte is never pointed at, so the receiver stops splicing it
> out and delivers it as normal in-band data, corrupting the stream.
>
> Guard the retransmit length like the xmit path: keep segs =3D 1 while in
> urgent mode.
>
> Fixes: 10d3be569243 ("tcp-tso: do not split TSO packets at retransmit tim=
e")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---

Nice!
So we had a bug for 10 years.
This is a testament to the fact that urgent mode is no longer used as
advised by RFC 6093.

Reviewed-by: Eric Dumazet <edumazet@google.com>
Thanks.
