Received: from mail-qk2-f38.google.com (mail-qk2-f38.google.com [74.125.230.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66CD4915B9
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.230
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767314; cv=pass; b=Bjp8mvtNFfLGH13oSOoDsDruaMv8vNkkCVPNVVC8TEnGM1dYqxOMVX+eS/e6J5fV6E3djQZD9PsSqWCdoyGRUGuLyCmTlU+VtaUlkdbVqL2zQyWR0cr2Ljjx6RJ6K4VIoG/pfALCI9fIRpww42f+5CNpGwiwf16BhAZsh/UqSzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767314; c=relaxed/simple;
	bh=nDG4cmfEbSlkfCKB3UpP5C6IJQLVyHZ+Tm6WTD0xZDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qsDBda37aMCCdU4zqu1UAQSmpgQz7w3HKDEFggh1odIPVwH2VH1JhwzeaQPrhrwJe/9odIVdxr+jT33qpZ9EDAGci8b11zfkQMAmYg+DxoUyT4bTZn3RajYMHw75LybsAkYlicGsmu7GYjO12NSOmck8xfXoELEG5rqPU8N2nqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wb6SqNIN; arc=pass smtp.client-ip=74.125.230.230
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wb6SqNIN"
Received: by mail-qk2-f38.google.com with SMTP id d75a77b69052e-5333729ca3dso37771991cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790767311; cv=none;
        d=google.com; s=arc-20260327;
        b=VmIlo41wd8w8T4S9UvPnlhAr4gJqQfA+VCzOTz1jkonCSOtON2OWY/8oaA2BjSPr9e
         MLqlCj171Z4vMPnESVA+ZOJx5Bu5HzwnqbLf+2OfPZO4cs1RPgoxf1GDimOr9b8q/QHt
         xurQd/jncnmQ8RW/mIocCUEeAxV1cyeOzk2UIoueBA3Ep7I/ehYrj30EVKWYcggNKrUP
         bn0UyDxHOMDCw6vjkH1LVVD+AKCSeV5hqm3X4zT0seVincSd2LO5O0PbBmJYdgVqkBwh
         J1MV94EpDvnRmkn1nKX1MZ+UUJoKSmodns/X39UpPVyci+9+6TlKQD9xNkAnQFTqdRK6
         n5iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZfpGJXYUt+pqZqeEvkxMBx7LIO0yq5hTEhvmFChh8bc=;
        fh=rDd+dpcOIY7ANvddZsg8u82zk0LJ4wKI0EtB/upU+ps=;
        b=iDLMR9fqJHKw1L8MvEEP1gYeFjzTqkicrytiYJfELKoIVrtnbR+m7GO4svPrR2q7OX
         zQh/U0FKqatDHkR350Pv4d+5YiPJVvkEhExGzZCEmjOz0iQl0Eq5Ha0O0z6YX4qDYew/
         XyxDY6B8b84KpZThxRPYyPZCzybe0hijRKn0HxKtFfF6EEUnn1KHtZOHWzBX8qW43P2Y
         PIjAp1p6fzQTzyEET6boOZduVk3vdyP37G3BZBiBzWnN932GfEr0XTkoHULfFNJW364L
         Vf0xuqJR+Gn4jMO20hju1+xxqhL5RioKo144s84WYthBSqjc2hGBPtpwsMhRQQ/PmiIX
         P21g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790767311; x=1791372111; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZfpGJXYUt+pqZqeEvkxMBx7LIO0yq5hTEhvmFChh8bc=;
        b=Wb6SqNINtqLZ8SBCO1EFhtCGRmjq83Qqs4k4VOB/55N3pFqah9bOxrYRMwnImUmskG
         KCpE2vzmcduVXdZ6wkmPQ/c/32fA+/lZe8fmJc8uER1Djf4VoFwbB5j4b+ycnBEWdTC1
         nsofptYgx/RQsbjpD/Qm6JK/8hPU/2RmdjvUSuVwottldGc4lY4hJLbCSKWkNyfob2W8
         JuEABsXW/B34D5LvcWFzTEUCVXAORe44vgF/i+IV4EnPQtAUTN9wsYQj2CAFOcxsdMHa
         lwcpK1z6ymXpapgDBeGVADrtEwQ9xr/3rQm8JMV2XmS572xVfq5NMz705lZVdKNba7uQ
         OABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767311; x=1791372111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZfpGJXYUt+pqZqeEvkxMBx7LIO0yq5hTEhvmFChh8bc=;
        b=yRBMo9NQ47BdJSj5xRd48PfFfm8zx+gbMJtOEA6zJTAO5TW0WND/z+U7A5jpl8hQCN
         9h2MX63rhoEHUsO5xUMNEpL7c/fJLN5gLz1PQ+kwtDgTBuzrywS/zIXbwwuOvM0FySR1
         Bv4Cn4zyjF1ausZipXFC2cXrkJ3Zb9M3y2sW9KaxVLu0Tvo+r9jyGBCKmQMGJwAM1rHe
         r4l3wIj1IFa+FUbD+TWtv4N0VFqHFZb6m+93amIvz3lO2bIg5ksXvkt1neEL9AArNhZB
         9ynFMfZXCWmKSF6xi6mLoYydfckFI5TogoY+eqx6ltL/dGZL9NY/s+9EPe6blUMnykdz
         eiCw==
X-Forwarded-Encrypted: i=1; AKwUvBw/Pj6LU5GJ14ii7/1tGg8kyylEibWPLeOz9i3XphMV4oJoW0XOk/TY+P7ac4LdtNYWu5VIaivGzGy+XBs=@vger.kernel.org
X-Gm-Message-State: AFuF++keLWmOdbMiD//N/i4wMIHWdlcUCqM8OI4u+UwnxCKji1/UzTie
	v89BH67S/wGP+m/dhySV3GdiRBn7CzMr4nFruUkUyfYR+UdmSsCkNVhg7VUkO/QmSyQviKn+jim
	cfPF/ggDae74HZ6zC2HFOI343gBw1SVFjbcm2Mlxn
X-Gm-Gg: AYBFou3htyu0BYLgGBAy64qKsqxdBejAu3MvRwr1yEsQS7akgt/yWb2hM3io53nsRYb
	ZTCgX3DdDfoqSwBuqiDxWT89SIdLG31TBOPxIFQMlpE4QHNiyznbW5m74G/as9zI8TkK1sIZfZT
	nuuzW2i2OfQCYTGmFpa4Y4ikN/jSjkfUVFkVTQ1x7tupoMaTcn3HAVSVdEMAYRLXGjJvMm3hKqH
	Q4V/j/Z6COLL7ZRGwDpfUjibz4xTm4KlpGtzctyG0rLSZWmxwYdrfXLUbT72xwliP64R0X5QNPo
	p8KUgL1jyhldyWc50QoWUsOs1Ki6WtKrQ3ovNYd/tsBt+0YeX95sfQ1YJd/5ghTC6gpMfCfLyWa
	77NnB7f9Fm5EQb9e2xs1415zE43lDNWjxsGMKo1v4G2rg4eQi0zUrKjyKhK0CvKJj9STK
X-Received: by 2002:a05:622a:1443:b0:533:4b39:4e28 with SMTP id
 d75a77b69052e-53374d85b1emr19082141cf.33.1790767310634; Wed, 30 Sep 2026
 04:21:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930100937.206377-1-jiayuan.chen@linux.dev> <20260930100937.206377-4-jiayuan.chen@linux.dev>
In-Reply-To: <20260930100937.206377-4-jiayuan.chen@linux.dev>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 30 Sep 2026 13:21:39 +0200
X-Gm-Features: AclHuK8zNCR_V-ToSw-vF65D2n_UEp7o3edqp2vCKW91KoxifKRbepto8X6oeW4
Message-ID: <CANn89iLwivMvNWC0oDgmQgTcKjrj_Ar8deh7Bc2jqyRXwv52tQ@mail.gmail.com>
Subject: Re: [PATCH net-next 3/3] tcp_cubic: fix divide by zero and endless
 loop on bad module params
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 12:10=E2=80=AFPM Jiayuan Chen <jiayuan.chen@linux.d=
ev> wrote:
>
> beta_scale and cube_factor are computed once at module init, and they
> need 1024 - beta and bic_scale * 10 to be positive: beta =3D=3D 1024 or
> bic_scale =3D=3D 0 crash right there, beta > 1024 or a negative bic_scale
> gives garbage or wraps to 0. Negative beta can also make beta_scale 0.
> Reject them.
>
> A small beta also gives a small beta_scale, and (cwnd * scale) >> 3
> truncates to 0 for a tiny cwnd (e.g. 2), so the TCP friendliness loop
> never ends. Clamp delta to 1.
>
> Fixes: df3271f3361b ("[TCP] BIC: CUBIC window growth (2.0)")
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
> Target net-next since it is not a big problem.
> ---
>  net/ipv4/tcp_cubic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/tcp_cubic.c b/net/ipv4/tcp_cubic.c
> index 119bf8cbb007c..2f04dca5be095 100644
> --- a/net/ipv4/tcp_cubic.c
> +++ b/net/ipv4/tcp_cubic.c
> @@ -298,7 +298,7 @@ static inline void bictcp_update(struct bictcp *ca, u=
32 cwnd, u32 acked)
>         if (tcp_friendliness) {
>                 u32 scale =3D beta_scale;
>
> -               delta =3D (cwnd * scale) >> 3;

I would prefer not adding a test in the fast path to work around
silly module parameters.

beta_scale is computed once at module init, we can make sure it is >=3D 8
there. tcp_snd_cwnd() is >=3D 1, so delta would be >=3D 1.

With the integer divisions, beta_scale >=3D 8 iff beta >=3D 512,
so the default beta (717 -> beta_scale =3D 15) is not affected.


> +               delta =3D max((cwnd * scale) >> 3, 1U);
>                 while (ca->ack_cnt > delta) {           /* update tcp cwn=
d */
>                         ca->ack_cnt -=3D delta;
>                         ca->tcp_cwnd++;
> @@ -504,6 +504,11 @@ static int __init cubictcp_register(void)
>
>         BUILD_BUG_ON(sizeof(struct bictcp) > ICSK_CA_PRIV_SIZE);
>
> +       if (beta < 0 || beta >=3D BICTCP_BETA_SCALE || bic_scale <=3D 0) =
{

bic_scale * 10 can overflow if bic_scale > INT_MAX / 10

> +               pr_err("tcp_cubic: invalid beta %d or bic_scale %d\n", be=
ta, bic_scale);
> +               return -EINVAL;
> +       }
> +

Something like this (untested) :

if (beta < 0 || beta >=3D BICTCP_BETA_SCALE ||
   bic_scale <=3D 0 || bic_scale > INT_MAX / 10) {
    pr_err("tcp_cubic: invalid beta %d or bic_scale %d\n",
      beta, bic_scale);
    return -EINVAL;
}
/* Precompute a bunch of the scaling factors that are used per-packet
* based on SRTT of 100ms
*/
beta_scale =3D 8*(BICTCP_BETA_SCALE+beta) / 3
/ (BICTCP_BETA_SCALE - beta);
/* bictcp_update() needs (cwnd * beta_scale) >> 3 to be >=3D 1 */
beta_scale =3D max(beta_scale, 8U);

Thanks.
