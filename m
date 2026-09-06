Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855CE3195FE
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 15:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788708090; cv=pass; b=JXaqU4iKb1RWgCkCQ5tfgkztGVu/T1XlWgoowVneVKgd7GQtNW6MXyvyGUplDthy7kMsrQlr4iKmqZ8+SDSwJd1dfatgbP4v2PGU2orCMq5L/nci8XNaiGboGKfi4SrZHodBEumi3HquT4pwDgWzU9D6ZhDkjBSzV3/kWOshK2g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788708090; c=relaxed/simple;
	bh=LFOwrLkyPBKyNRbuTjUWsGqIJC+VDeAwPu6b+AJEr+o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5+xkwG+htKY+bhsNr9J1lNyDNdueb/GBVTQQv+k8RGGJ7ByTKuylJ5vpHWOdrVThfJA1NJb+7Ti/3GeBUH6PW0DOJTAC5UbYYeQUB8qJRe0eWP4vV1Vxu8Eq+AbAhv7q+bWE097im88zDg95DSHKnBGY7d7Yi+rf6C/6xo22UQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MLaCtnwn; arc=pass smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MLaCtnwn"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-53016020b2fso49179981cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 08:21:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788708087; cv=none;
        d=google.com; s=arc-20260327;
        b=i18Mtcg8uslmMgR1tx8v8tAsCq0+xGFc252LVTNvJcNQV0+rmv5RTMb3KZtRoZkHSX
         0Idzdygm/gW7htrpPTWseraIYSnd6x/xr3EQYtXdEspZBncSC4PpWLZMfKAGk93FM28E
         mV3zQF1gZcNgeFhwtx4nYIVrJDcidAJ/5Gloft+yutIBaU5rd++bbU54d4FSkvx+0yGH
         RGYYxHvy1ZFdqSp/DRVHdLpGVRX1UPx2dtd67wn9MXYYHEZo1EeCHHRHbJfOtEkloz1H
         GSRnRTzPHYTvnEe4oS02AA6eMkp1zbpH9P8eLlOXNHR/5RHZTETBwjc3K0zLDt+pilkZ
         glQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fs6XUMvGp+baARz1Qk60hvLbKLNjQnZThXQfdcJnmLw=;
        fh=otgPr6vqpT3kF5KdSx+QxvT3pr7r3MMXaHEIDO16kFQ=;
        b=b+1RoITGCE9js+OS5SezdK0ZV1EohcTp6BJG0sJKyEH+gzUsSr9quBItTx/GNUU9R9
         LcmKwPZcGuOxC/WpIIoyyf7VGHF0ia5noi7nOlSXysXxMTG0wIKY+3Z4DOd0MbKhAtiO
         45ksKGdxPsMWBrTo3TW1V4vWqjVGeMci/Rf31+4YqFwwudiyuF1gx3wtRetHLYVS3RFD
         X3JL7JlAwdYw/8Uo8G86++LhG9EHaZpAo7CDu0BEsdMjJg2DvzBFbW43mfjDkvbbG3Ld
         YT7FX1aF9CqWNB+m1Zf1SMGufXdtmgJ1m4G0Vzi6AujLMoiREzshHjasU2VRMIou2+Ev
         iz9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788708087; x=1789312887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fs6XUMvGp+baARz1Qk60hvLbKLNjQnZThXQfdcJnmLw=;
        b=MLaCtnwnqOmU6GacYdE+OkbSaZdxo5b9/wpp5UWKAd78Fbje14If7g35Dm2JpZfFzN
         icdVYFnbj1Ig0/mNt5cClzj8p7BYyMX3KYLgBx5l7x9QtOs1fNHVwil2FkbMitF+c7cK
         9H3q31BgZotWB4s/qgt5KN0sZyFb5mKHs2/DX/l8zk0gd+wRulYdyHV30YpmHtG3tGXq
         W6O6TcRLCRZEicRRDbfqhg7FEHrh0zbG5Rgknb6MijiyaMdlUjEG05XCaXF0iagU5Ru0
         I08F9JS518I3//gmvEAQwPxvL7RUZI8IeJvPfmjSZAt2lFdFLXRnPKnV82qcassUvl6U
         zu1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788708087; x=1789312887;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fs6XUMvGp+baARz1Qk60hvLbKLNjQnZThXQfdcJnmLw=;
        b=oEGJ6as/d1teQM4rnLTTkxMjkoDhHpDqsoKrX4lxajN5HXpBIfUyph6GB/mgxpEOjv
         5KB2PlBrqxCgAA87vQIVgG6Xul7xUz7LfP0S7FITsu35TivSp/yhlHN3pXTprSlHidN2
         ou0HEJ10ukAnysJcAtzWwH3ko3bazSiZG5XIZkL6OQCcXMUNVQPbq5PYyfA5qkyAjELw
         EnsndtNi5lSn6oM5dhzP7XuyPnt5titl16xlU6EftnPgsoRyVt8ZEPX7cAgrIJ4orC3q
         mApXnnjhArh2KdftkT1DoZqL+XXsLrEdMZdJKxcmu+eDm0erHHwQoJbIDpmzX/aEKk4J
         Vm1g==
X-Forwarded-Encrypted: i=1; AKwUvBxg+TBLz2pPFK5lC2UPSGb/y4/F4g4u0lYokplCUeWCSsBoE3xJGocl9QrDBUMw44eg+xIab2aMX7mfIfI=@vger.kernel.org
X-Gm-Message-State: AFuF++lgS1W1hWAEmLOvDe1SqIvuReyUiavU7CTtV/Hvdlj9FEdBi6nO
	7CE8/YLU7T8+HkgGzuWrDGXqDDwb7b+z+kPOi7EF1AEaTkvuiayHf7r/awbBZw3+NWFgtpDlevH
	weJU6JQBn22Pg+iuNPxeSV0314oGcFc+JpZfXyX7l
X-Gm-Gg: AYBFou217bkw+l3Bv7jhZghNDL5KD+mF01p2QGfpHYQR7AITd5XFC87NHDZ8Tp8HZ0Y
	K0q4yatTYmdPveLhcg2Lg8wmvF1YcILB3XUEwFVw+0hwlN6Zn5I8ZvNYdqXrqz3K66QwaRVJNJ8
	bus/dyzQtxkgD5/8TeBrhMfQFKmFoJd6XX1Hr9YTKgfZdOVnw7HzYMq3z9vfP7qwktt4SAU6x98
	/mgYgGX1JoddJrRVh5BjoHNeCWIp8Qd6uc8OQ8c/vTzceAIYnTx4H1mvmA805R2YpJ7H/eizOnZ
	4BtBI+tMhrxkDzvphGs50DJxHbOj5RrVlmxEb3+fMWkeezD1wkREczV3DCDYlTAi8FdCjYAJ+kj
	mL2OkvREd/9zL4EAVzdxAWOvmCxBRHhn9NaPvBthRA44uUa2xVgMaH1DLesLlu+gCQD9M
X-Received: by 2002:ac8:5fc8:0:b0:51b:ec6c:766c with SMTP id
 d75a77b69052e-530546a82admr168582461cf.12.1788708086577; Sun, 06 Sep 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il>
In-Reply-To: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il>
From: Eric Dumazet <edumazet@google.com>
Date: Sun, 6 Sep 2026 17:21:14 +0200
X-Gm-Features: AcwNN1WQXnyvmj9l2_bsUIwHuwiFXu_9bQaNcLrHVCLBPE8dwq4euhetf9-yCEQ
Message-ID: <CANn89iLLWbqTk4zCaa3cB9BJAC1MmUjVBMXXPJGgzw37u+s_Lg@mail.gmail.com>
Subject: Re: [PATCH] tcp: validate old ACKs before fast path data processing
To: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Cc: ncardwell@google.com, kuniyu@google.com, netdev@vger.kernel.org, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org, Amit Klein <amit.klein@mail.huji.ac.il>, 
	Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 2:32=E2=80=AFPM Inbal Schussheim
<inbal.lipshtat@mail.huji.ac.il> wrote:
>
> For incoming TCP segments processed in the fast path,
> Linux does not enforce the RFC5961 requirement:
>
>    The ACK value is considered acceptable only if
>    it is in the range of ((SND.UNA - MAX.SND.WND) <=3D SEG.ACK <=3D
>    SND.NXT).  All incoming segments whose ACK value doesn't satisfy the
>    above condition MUST be discarded and an ACK sent back.
>
> Meaning the ack of incoming segments is no earlier than a window back
> from the first unacknowledged sent byte.
>
> Later work showed that the condition (SND.UNA - MAX.SND.WND) <=3D SEG.ACK
> can be further tightened, eliminating some demonstrated TCP data
> injection attacks, resulting in CVE-2023-52881 assigned by Linux and
> the 2023 patch:
> Commit 3d501dd326fb1c7 ("tcp: do not accept ACK of bytes we never sent")
> that rejects ACKs for bytes so far back that were never sent.
>
> Link: https://www.cve.org/CVERecord?id=3DCVE-2023-52881
>
> Both RFC5961 and the later patch were only applied to the slow path,
> leaving the fast path vulnerable and noncompliant with RFC5961.
>
> Enforce a validation test for the SEG.ACK in the fast path, before the da=
ta
> is processed. Failure to pass the validation will result in a challenge A=
CK
> and the packet will be discarded in compliance with RFC5961.
>
> Some details:
> RFC5961 (and the 2023 patch) is enforced in tcp_ack()
> (./net/ipv4/tcp_input.c).
> Incoming segments to a socket in ESTABLISHED state are processed in
> tcp_rcv_established() (./net/ipv4/tcp_input.c).
> Consider a packet that violates RFC5961 (meaning the SEG.ACK is too early=
).
> In the slow path (starting at the label "slow_path"), tcp_ack() is invoke=
d,
> well before processing the segment data.
> A challenge ACK is sent there, tcp_ack() returns
> -SKB_DROP_REASON_TCP_TOO_OLD_ACK,
> and slow path discards the segment as expected.
> In the fast path, tcp_ack() is also called,
> but only after the data from the segment is processed.
> Furthermore, the return value from tcp_ack() is not checked.
> De-facto, the data from the segment is accepted
> (and an ACK is generated), even though the segment violates RFC5961.
>
> The following packetdrill script shows the issue at hand.
> Linux (as a server) accepts data segment processed in the fast path with
> an ack that is far too low.
>
> // BASED ON PACKETDRILL SCRIPT FROM:
> // Commit 3d501dd326fb1c7 ("tcp: do not accept ACK of bytes we never sent=
")
> 0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
> +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
> +0 bind(3, ..., ...) =3D 0
> +0 listen(3, 1024) =3D 0
>
> // ---------------- Handshake ------------------- //
> +0 < S 0:0(0) win 65535
> +0 > S. 0:0(0) ack 1 <...>
> +0 < . 1:1(0) ack 1 win 65535
> +0 accept(3, ..., ...) =3D 4
>
> // Data must be first sent/received on the socket
> // so that memory is allocated (sk_forward_alloc should be > 0)
> // and later data will be proccessed in the fast path
> +0 < P. 1:501(500) ack 1 win 65535 //valid packet forcing memory allocati=
on
> +0 > . 1:1(0) ack 501
>
> // incoming segment, ack way in the past... (101 + 2^32 - 1500000000)
> // Oops, unpatched kernels happily accept this packet
> +0 < P. 501:1501(1000) ack 2794967397 win 65535
>
> // On unpatched kernels, this ACK will match,
> // showing that the segment is accepted
> +0 > . 1:1(0) ack 1501
>
> Reported-by: Amit Klein <amit.klein@mail.huji.ac.il>
> Reported-by: Tamir Shahar <tamir.shahar1@mail.huji.ac.il>
> Reported-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
> Signed-off-by: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
> ---
>  net/ipv4/tcp_input.c | 26 +++++++++++++++++++++-----
>  1 file changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index daff93d51342..2474871e80ec 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -4272,6 +4272,17 @@ static void tcp_rack_update_reo_wnd(struct sock *s=
k, struct rate_sample *rs)
>         }
>  }
>
> +/* Validates that the ACK is older than the acceptable historical ACK wi=
ndow*/
> +static inline bool tcp_ack_too_old(const struct tcp_sock *tp, u32 ack,
> +                                  u32 snd_una)
> +{
> +       u32 max_window;
> +
> +       max_window =3D min_t(u64, tp->max_window, tp->bytes_acked);
> +
> +       return before(ack, snd_una - max_window);
> +}
> +
>  /* This routine deals with incoming acks, but not outgoing ones. */
>  static int tcp_ack(struct sock *sk, const struct sk_buff *skb, int flag)
>  {
> @@ -4303,12 +4314,8 @@ static int tcp_ack(struct sock *sk, const struct s=
k_buff *skb, int flag)
>          * then we can probably ignore it.
>          */
>         if (before(ack, prior_snd_una)) {
> -               u32 max_window;
> -
> -               /* do not accept ACK for bytes we never sent. */
> -               max_window =3D min_t(u64, tp->max_window, tp->bytes_acked=
);
>                 /* RFC 5961 5.2 [Blind Data Injection Attack].[Mitigation=
] */
> -               if (before(ack, prior_snd_una - max_window)) {
> +               if (tcp_ack_too_old(tp, ack, prior_snd_una)) {
>                         if (!(flag & FLAG_NO_CHALLENGE_ACK))
>                                 tcp_send_challenge_ack(sk, false);
>                         return -SKB_DROP_REASON_TCP_TOO_OLD_ACK;
> @@ -6614,6 +6621,15 @@ void tcp_rcv_established(struct sock *sk, struct s=
k_buff *skb)
>                         if ((int)skb->truesize > sk->sk_forward_alloc)
>                                 goto step5;
>
> +                       if (unlikely(before(TCP_SKB_CB(skb)->ack_seq, tp-=
>snd_una))) {
> +                               if (tcp_ack_too_old(tp, TCP_SKB_CB(skb)->=
ack_seq,
> +                                                   tp->snd_una)) {
> +                                       tcp_send_challenge_ack(sk, false)=
;
> +                                       reason =3D SKB_DROP_REASON_TCP_TO=
O_OLD_ACK;
> +                                       goto discard;
> +                               }
> +                       }
> +


Hi Inbal

I would suggest :

1) reduce the changelog to the problem at hand, not the old ones. You
do not have to tell a story.

2) Add a selftests (in a separate patch) instead of including it in a chang=
elog.

3) Make sure to handle pure ACK as well so that we avoid another CVE
in ~3 years, presumably from your team.

Segments with old ACKs (ack_seq < tp->snd_una) do not belong in the
fast path in the first place,
whether they carry payload or are pure ACKs.
In the pure ACK fast path, an ancient ACK would also bypass drop
accounting and update
timestamps/state before tcp_ack() returns an error.

Instead of duplicating the challenge ACK and drop logic in
tcp_rcv_established(),
we can simply tighten the header prediction check.

The so-called 'slow-path' is already taking care of this.

diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
index 0f60a1dbf927468741f6f163e8d1b07687452c39..89f9f3913b52ff468f3bd4b098c=
b5d0f3c45a9d2
100644
--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -6539,7 +6539,7 @@ void tcp_rcv_established(struct sock *sk, struct
sk_buff *skb)

        if ((tcp_flag_word(th) & TCP_HP_BITS) =3D=3D tp->pred_flags &&
            TCP_SKB_CB(skb)->seq =3D=3D tp->rcv_nxt &&
-           !after(TCP_SKB_CB(skb)->ack_seq, tp->snd_nxt)) {
+           between(TCP_SKB_CB(skb)->ack_seq, tp->snd_una, tp->snd_nxt)) {
                int tcp_header_len =3D tp->tcp_header_len;
                s32 delta =3D 0;
                int flag =3D 0;


Thanks!

pw-bot: cr
