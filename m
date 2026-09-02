Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171B34CFD0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788335473; cv=pass; b=IBBpLMANqVvt6MlsMVaHa48LQdWSTribLIAMKEffiHgipMlWyq7DatzeVNz4pTjEAV1x9fzzhUDtWZ/Ud0XR6UqeS+AlZIwz94uMnIPwJqIB/txWCNzU85ugkq9m9enH5ubW8kdvcuA181yG/nVzuSPgQwEQvytdI0wRekplt8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788335473; c=relaxed/simple;
	bh=rM7qgsXqJrjfU1zB9wCetpM9b1jjkKWvMBpIbuQxQ48=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWHKFnRLaMi3YT0Smt0rgCIYyq9BH10ok/rtI4YmunQptCzsuSIoDbfZ36K03pAHL0rDup6geQfyTUKgaSw1r1D6BL/gJEH4X6B5ZG6xuGGGs5UWnikM5nVgJm5xq7ASmwbGsLo3IMXBfK2N1JxB6Uuk9JwGnzLLNf4NmMY3TgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T5kwj20T; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T5kwj20T"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-52d5bfa4bafso7724741cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 00:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788335470; cv=none;
        d=google.com; s=arc-20260327;
        b=Xews5nWzjPFeJfpoytWlDGUthkc601ynEEhAU6vg9mLTUMsBWfOLAXU1I0rVPl+Y5q
         ThDXxs3pMh8khGmhkN/sdDYQym8TKieo0GEnloqgysESeEa9k5wjcl3vDPEWr2M1ZfGf
         hVfqml9rs4JgVRygpumHnMUWyJSMszyVMJuK/ORDcU4WNjWkidXayUln/2knVBEvhLA2
         AWVgHqHfXy7FTh7iHGJodByrnA7Dpv9WSrkd1TXupaFW7MbR+V9yvQnWKfU+Hlblu9Re
         z+zW5Dr+FzeNwl0AEtv/LaiIUVFuVV5hfJ0jBefHsh7q7yoU4Jx7lwn0EAjD853GKyBY
         oc7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/6EqtbHhJWvHC684npzEjTJ8zJmtURSOlMpn6WZ7NE0=;
        fh=1k4wcJFNEltmF55BoFuYOpYIxxIDvbv/E3ABmU/EuYQ=;
        b=UqsxmKeXLXrPHhnE/qWFU3Cey2Wr/y2LOrQF4oA87dL87d0PrSTRaxNAykWqtrm5YS
         pqPkgjnpVt+UB//YPNiyTdO0aX4NYpgryOsonpfFMIUjSY3SQSHv8Q/+6ZegzJDCxojQ
         sUDVLaiSgZQjYsiFO5lYv8aYrgEmguQn3+AAyQoe+bW5eLxvYBICpHKQatfQIeFOjNbE
         e0DY2XNLKAzrZkR3oqXnqeWaGcOn6rA3oPZrXcHgzEY6EP1vfLvZvqXP0Fdzqs5Ax087
         je4SFuGmPOuzbBh0TjETqMV+yn4zJzsg1gblbXTzFsk04ukRDWazPjZKgPrByA9b8rVp
         ba0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788335470; x=1788940270; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/6EqtbHhJWvHC684npzEjTJ8zJmtURSOlMpn6WZ7NE0=;
        b=T5kwj20TQIZXhUAc9gfIyCMmCYSzDRgXz/Ja+2Vy1Sbjrgnud2JMjkcgyep6s3XJ7U
         /jDUmeTXDNfkujKXpQijBHRY4FNGmAEXxG4Px3gylj6xDAv6j/lIa7LauKCxZifGwtrl
         7zGmHqz9bDDUhxZTu+ZtJhBz/6W3b9rX6LRuU+dyNBh5jVAj9UYWHsaO4T7Ev820tNj0
         LRvI5X/WF7Ei/Som++cSXSaSSwhVCbLe5wIen05VebYw1tTXsrLQyB9CAF4RCnsrFPmk
         2FvdjjCmSOeWi7ZjRPIKE4DpJZ006jQZYq8UacAxSgvZLXWiW2FksS6XsOvj1CZ3ekHA
         OlDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788335470; x=1788940270;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6EqtbHhJWvHC684npzEjTJ8zJmtURSOlMpn6WZ7NE0=;
        b=MODEyC39g1eul4uXB2m4TjWj2kNlFkn6YFZkHUIe4RyVomaKJztn3pZydFoYqw7+r0
         gEd/gCElmYt514ugKwCZxlvzylj/9KEFT4GpBXvDXAtWuEmaH35AoweoCcVZxG+O1NPR
         5e+8euwby1sfugckH/j9U5SOBwX1teiwHktrwUaYOE4YGm6rAQk7Ms5OvUpQB50XLun3
         iWHg34J1oc+Yw8QTwDq6a4dbDKAvsWBwpdgFnxa8LNaM+C7uyAz3PzC0q5BgPNWIrd+t
         JStsUJ5h+8G53RAAjtuM4ADTP+FXmBSc3KMrt6yG9x4oXXTU0s5NguWka/dJ5w/pCGdH
         hV6g==
X-Forwarded-Encrypted: i=1; AHgh+RokyvZ+Lh8/5LawTJaz1AD+uVEoWygq3EKzuV//kS4qhDDp1RMab0Q1POPqrs8BAbCWWyAVCeOlE9HF8dQ=@vger.kernel.org
X-Gm-Message-State: AFuF++m6GGOvT6Mm9HJkK1VU5akDweud/EoVdKc0RFd8pMEALIZbYCo0
	o79npn6t/uNEcO+7oKDGphWE59Ty+3i1sPdVrJISCBrHY2FoNqzUaZzy3okZkB+RWhJSLW4mRSr
	8ve5m1BqX8rlWzK88j306w3ULha7dYFRCWcbh9Wm3
X-Gm-Gg: AR+sD10LTwFQsXCv1VeiuuK6Co3h/5WrrSmeLdbWHeYD3ChfA4q3DKaqP0bszJuNM2r
	RWUS8i2DSkobnFvXw1FO25XlXfQB1opxjfu06yfPInRZPvlrv/6dyhyNHmRSYa1oSTuSOXUH9L3
	hr5ABZA2KMOkDsl56XfRyM/wFnu9MybfQtLbTMMJwJo+Y+ZFtS7AcZOTanlKVGX1USgOmOXAkIA
	KjdL9FLEEqtA1VBsPUgs9T2+F18LfpwHb2SPriNdvlwVpUAN/o/tSMZFOgAXSBcrsu1BQfNXCVd
	mb1ptubfmXfnf3STg1YQkwdfiVqK4imwrPrCd42OMktc8Sm/skX2WOaMlmAmPKdklkJcU7DcBkr
	7ksbZdX+HiCE9GyZmi6+BDXf2Ftn1kwdvL0a1+PQ3wRNKjrYNsA8I525o1w==
X-Received: by 2002:ac8:7fcd:0:b0:52f:4cd:13f6 with SMTP id
 d75a77b69052e-53036bd4ca4mr26722281cf.12.1788335458266; Wed, 02 Sep 2026
 00:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902071900.395567-1-ruanjinjie@huawei.com>
In-Reply-To: <20260902071900.395567-1-ruanjinjie@huawei.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 2 Sep 2026 09:50:46 +0200
X-Gm-Features: AcwNN1VS4Ys1X8Nn9iYxHLdlNe4U2Ir54BIpZqJLNxyaWNxqdLeIIbBPDo0rEuI
Message-ID: <CANn89iJ2ppM6+MZhLP0Lu5k1Yka2qXqMvBMVL1ZzEK3nHx0iBA@mail.gmail.com>
Subject: Re: [PATCH net-next v3] soreuseport: publish num_socks with acquire/release
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: kuniyu@google.com, pabeni@redhat.com, willemb@google.com, 
	davem@davemloft.net, kuba@kernel.org, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 9:18=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com> =
wrote:
>
> Replace the smp_wmb()/smp_rmb() barrier pair with
> smp_store_release()/smp_load_acquire() on reuse->num_socks.
> Writers publish socks[] updates via release before incrementing
> or decrementing the count; readers acquire the count before
> accessing socks[], ensuring they observe a consistent view.
>
> The detach path gains proper ordering between the socks[] write and
> the decrement, which was previously unordered.
>
> No functional change intended.
>
> Cc: Eric Dumazet <edumazet@google.com>
> Cc: Kuniyuki Iwashima <kuniyu@google.com>
> Cc: Paolo Abeni <pabeni@redhat.com>
> Cc: Willem de Bruijn <willemb@google.com>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Jakub Kicinski <kuba@kernel.org>
> Cc: Simon Horman <horms@kernel.org>
> Assisted-by: DeepSeek:DeepSeek-V3
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v3:
> - Split out from following patch set as Kuniyuki suggested.
> Link: https://lore.kernel.org/all/20260901024234.135119-1-ruanjinjie@huaw=
ei.com/
> ---
>  net/core/sock_reuseport.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> index 29948cb44b7d..6d3c511d1def 100644
> --- a/net/core/sock_reuseport.c
> +++ b/net/core/sock_reuseport.c
> @@ -125,9 +125,8 @@ static void __reuseport_add_sock(struct sock *sk,
>                                  struct sock_reuseport *reuse)
>  {
>         reuse->socks[reuse->num_socks] =3D sk;
> -       /* paired with smp_rmb() in reuseport_(select|migrate)_sock() */
> -       smp_wmb();
> -       reuse->num_socks++;
> +       /* paired with smp_load_acquire() in reuseport_(select|migrate)_s=
ock() */
> +       smp_store_release(&reuse->num_socks, reuse->num_socks + 1);
>         reuseport_get_incoming_cpu(sk, reuse);
>  }
>
> @@ -140,7 +139,8 @@ static bool __reuseport_detach_sock(struct sock *sk,
>                 return false;
>
>         reuse->socks[i] =3D reuse->socks[reuse->num_socks - 1];

OK, but I think we should fix these problematic accesses to reuse->socks[X]
to avoid load/store tearing before your patch?

This might avoid some KCSAN / AI-review reports.

Please squash the following parts (shown before your changes) into
your v4 patch:

I think that this could target the net tree, with
Fixes: ef456144da8e ("soreuseport: define reuseport groups")

Please wait ~24 hours before sending a V4.

Thanks.

diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
index 29948cb44b7d1a8864ff680aaeb2b4582ede5ff4..8380936fae736337b902f70f0f5=
ebc1155a3bf37
100644
--- a/net/core/sock_reuseport.c
+++ b/net/core/sock_reuseport.c
@@ -139,7 +139,7 @@ static bool __reuseport_detach_sock(struct sock *sk,
        if (i =3D=3D -1)
                return false;

-       reuse->socks[i] =3D reuse->socks[reuse->num_socks - 1];
+       WRITE_ONCE(reuse->socks[i], reuse->socks[reuse->num_socks - 1]);
        reuse->num_socks--;
        reuseport_put_incoming_cpu(sk, reuse);

@@ -521,7 +521,7 @@ static struct sock *run_bpf_filter(struct
sock_reuseport *reuse, u16 socks,
        if (index >=3D socks)
                return NULL;

-       return reuse->socks[index];
+       return READ_ONCE(reuse->socks[index]);
 }

 static struct sock *reuseport_select_sock_by_hash(struct sock_reuseport *r=
euse,
@@ -532,7 +532,7 @@ static struct sock
*reuseport_select_sock_by_hash(struct sock_reuseport *reuse,

        i =3D j =3D reciprocal_scale(hash, num_socks);
        do {
-               struct sock *sk =3D reuse->socks[i];
+               struct sock *sk =3D READ_ONCE(reuse->socks[i]);

                if (sk->sk_state !=3D TCP_ESTABLISHED) {
                        /* Paired with WRITE_ONCE() in
__reuseport_(get|put)_incoming_cpu(). */
