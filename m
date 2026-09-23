Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0CE40855
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131809; cv=pass; b=Q9lZHsA70jSuIQ2s8SGrIAba76lDKpPkxyigL9Tqxhq1pmVuhGWgsFZD59JPJQ5FjyRwaTDogxNFLw9sYo+RWobTJCrXoiLgLlqISX5QikVyzz96APdTr9G+ANMggyWjH1HowDkmnMIWEmvfGiVQsNCLFvTLXXeQbMQ+s1V3TEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131809; c=relaxed/simple;
	bh=IQ0cWZy/746zABNsy89D7JUk8iViS8IpcEBRF9VtPgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qCy+wqkfJiPAEFXtUkgsTKeKymC4KqTCkgp+bROaKSWqhPYa+jnbwokIS2WVOUPJwUZhoeRgcVpSlOrpn6BkYYqG8/6a8uRLS9AENrnaQayGTGDqKAtdwlWZUqdSlOqUTSq1/oBodM1JyC0N6R/1ie0vhSc7urXRIwBulQz622c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lVmftrtf; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lVmftrtf"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a222edc62so57348485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:50:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790131803; cv=none;
        d=google.com; s=arc-20260327;
        b=TcOJLFH9t58JuU/AhO4oclUUf6BLqcKVKuMAqEq70Gob7QBhNRPtQJHWh93qeTwKAn
         SsvYDhaFWW9uqFWa/8RXEXkKYaWIuYFMkhW4BaSs7y+SSPAjywAZ8avT/Fvo5P7dcuO0
         3f+flzIY0SAIQr/lipB/zkwHZLCsWwXV8BYgOqJ67uHkPZq2g5QfqfcqV49yXS8HF3Jk
         7dLgjZPxS26sM99oITZEVF+JdUlnEW9E7j19UxJjzWKRrn96QzZt2e2OREf5hZEK0hz3
         Ms95oCYsN7LVsAqZu93URJVLTx49HLVAObw7hZ2Y3djDfeDc/Oo1p9WQFfl2MlKtaHAu
         at2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ahITcPEdMmOc3JJPiaBSyLZY2TFXiiI2wkSsmdMgbb8=;
        fh=y8rItT8+7o3EZH+Tla/wxDuLmY2Ycj+QPdhzev9bFPk=;
        b=bmGyHWCH0fa70FWssBwMWMmX75SAtfa/n+KKE4z4nPyt5gan0ah5xAGbkTatY+S0oA
         Sj4Sg19Z0ubKiR/wSxtbmbdL34Qms/lFpQDyj7MDHCp+GrCs79kIegHc3ssYXttLLls7
         cUC8DQWu+NpRRFGUdN4x0t8wQRzQG+9HcOZx3CSCUYhOFMOEmgnAzPNxJonwnm95BQ1p
         y44vge6/R5wz+6XOSdij7xPB2PRks/wriLYA8YCSOPd4eG/sOrFHoICmKeA6rogui7mG
         tqXtxRStZJ+F96EAE2NmS3OOHpN73s+oFuvSsLiPqwDCOLJ3mFx17CJ53wJFmMNgHRWY
         Cwyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790131803; x=1790736603; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ahITcPEdMmOc3JJPiaBSyLZY2TFXiiI2wkSsmdMgbb8=;
        b=lVmftrtfC4InQbSKF0dKG6HT6gdetPWktq6q6x63Fo2HmmkRjvOChE5fr7HlTEiCe6
         Wfp82L4bhyigwGqpNCix4wgJ8lz1n5odhA3mDVvUYFaykXf9NAZJ1NEfD0OI6vB9Gw3X
         xejTLYsG+sIxyOYQc/8Cn39/gG7zCrc3nCid5AvTEo914xDbqpD8KUNrvbE+NFoHuirB
         r7zXQ95YQ6+OoAPPguRmOQ2gcrlOI+yYN1f4RzCg4h3l/fWqoyFOcXDS55WqP1SN3aSo
         HkdgiWxItYDKh5J85fZYIfwMhznCjC6v17lYyEzwk5nnysZCAcCkHrweGwyaAbF8/Xx3
         /NhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131803; x=1790736603;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ahITcPEdMmOc3JJPiaBSyLZY2TFXiiI2wkSsmdMgbb8=;
        b=t4ph/FYzd/kZLSL4e/8xsOCRAziKz2+BUHHLotcRhlN59ZmN2/elEKJU8iBQ1jxSHJ
         NeMIRoTFG38s4DzYFSaAdJVVReUQ0cUmIXTHzSrHUyJ2HZQ2HpSxkcX8BRYLG3k4PW1i
         sadOsQCgPY992z17EphwGxeGIlZ+GkC6Bceh2ExRlF5lLr02gbmkCJwSCiXVrz4jDh/R
         SZKyu8b77Zj6HxSMF4rS+FM4Oy32FPfCFTTEh9KXYGsgxiUpWks00XqALrPBMfCMGh8m
         kFQMuthWr7tQx4haE2BYRpAPBfPdCEKQAgwCmmf4T8j5Kybb240mdanm4XFgro7ATjcd
         B2sw==
X-Forwarded-Encrypted: i=1; AKwUvBx7USL2Y3kDWIdMA0WnDBCrKLayrFyBAIs7k04IDatPeKvhe3lrMgtfSoQt17L97/fyLIzKIyv3gkyY8lM=@vger.kernel.org
X-Gm-Message-State: AFuF++nTzJuv6/hwuNPaY9g+alRPjGcy6cozNBS9h0UgWTtav0OIB5u0
	A2cBq7S8cpIPF6SJw5eM4S3doYM9SlwIHj4y+GwBD1364TagYAfCy3kD/Im5AAsGK0DqqNOznFs
	ACOPF0LZiKKN9dkQGN1FugVhuT8DZsz0hW17ehHi6OTQGXKlU82Y8w+Ua45k=
X-Gm-Gg: AYBFou34AWwhDJAh7ZC7kFVNFpwUCwHG4Cbfk4YId6tilJQWyaSQB41u5UKhhDZOcd1
	ewjh9zBDkGuH0MQvydQ0oyedJ9a9GMXn1e3eiYrdi+tZF6/UxJ51Zmk4d9o7s8I5Ts/5K5dkx09
	nxXiuUkLFEg6Wud3Aj+S836j3dgtvMLYCU32eOmdrtIgI3VjcUOo9bkAbqwLUBFJV2Z5dAzS8iA
	lJCO8S2kKKMTDTtJsz22+mch0obt87ug8klzz46v7DCmLT/16cq7vkmLNOdOz2e9xT8lHFaLU8R
	gUAq9ZF4JGVX4LTkXGdn8xpViLt1j2+6Pfn+jTm33hIePe4DDlr1AhTUwUNw/nG0PO7wVwDRh66
	NB/fhY0xzy5nA3ZygaOkDekcrevwC2c63iitZaQQLoQtWpRbJ5tv5bWA0bTskQ8Zu5BgDoin2zI
	AT+1kT
X-Received: by 2002:a05:620a:4611:b0:93b:d79b:9a5d with SMTP id
 af79cd13be357-93c25244abdmr218707985a.62.1790131802567; Tue, 22 Sep 2026
 19:50:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920063419.3587332-1-yilinzhang@moonshot.ai>
In-Reply-To: <20260920063419.3587332-1-yilinzhang@moonshot.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 23 Sep 2026 04:49:51 +0200
X-Gm-Features: AcwNN1XCmdXbebRsKWuOBAvRsGS1KJ9niS--Fs8T9NLqOwSIKM7sw4SwcUvumuY
Message-ID: <CANn89iLUNiEjX4U98=SsQWg5BSV7=cV6ZzwPBiDC4Hu-6US6Lw@mail.gmail.com>
Subject: Re: [PATCH] tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()
To: Yilin Zhang <yilinzhang@moonshot.ai>, Kuniyuki Iwashima <kuniyu@google.com>
Cc: "David S. Miller" <davem@davemloft.net>, Neal Cardwell <ncardwell@google.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kimi Security Team <bug-report@moonshot.ai>, 
	Weiming Shi <shiweiming@moonshot.ai>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 20, 2026 at 8:34=E2=80=AFAM Yilin Zhang <yilinzhang@moonshot.ai=
> wrote:
>
> When tcp_send_synack() replaces the cloned SYN skb at the head of the
> retransmit queue with a copy, it frees the original with
> tcp_rtx_queue_unlink_and_free() and only repairs tp->highest_sack.
> tp->retransmit_skb_hint keeps pointing at the freed
> skbuff_fclone_cache object.
>
> The dangling hint is read in tcp_verify_retransmit_hint() and used as
> the root of the rbtree walk in tcp_xmit_retransmit_queue().  An
> unprivileged TFO client (sendmsg(MSG_FASTOPEN)) can arm the hint with
> an attacker-supplied ICMP fragmentation-needed message, after which a
> simultaneous open frees the armed SYN skb:
>
>   BUG: KASAN: slab-use-after-free in tcp_mark_skb_lost (net/ipv4/tcp_inpu=
t.c:1316)
>   Read of size 4 at addr ffff88800604d928 by task swapper/1/0
>   Call Trace:
>    tcp_mark_skb_lost (net/ipv4/tcp_input.c:1316)
>    tcp_simple_retransmit (net/ipv4/tcp_input.c:3158)
>    tcp_v4_err (net/ipv4/tcp_ipv4.c:587)

Make sure to rebase your patches to latest net tree, not an old or
in-house kernel?
The context shows void tcp_send_active_reset(struct sock *sk, gfp_t
priority, at line 3694
rather than current net (line 3887, where tcp_send_active_reset()
takes enum sk_rst_reason reason).

>
> Sync the hint to the copy.
>
> Fixes: 75c119afe14f ("tcp: implement rb-tree based retransmit queue")

Seems not the right Fixes: tag to me?

c31b70c9968f (and 006f582c73f4 for the original omission) is more
historically accurate than 75c119afe14f.

> Reported-by: Kimi Security Team <bug-report@moonshot.ai>
> Tested-by: Weiming Shi <shiweiming@moonshot.ai>
> Signed-off-by: Yilin Zhang <yilinzhang@moonshot.ai>
> ---
>  net/ipv4/tcp_output.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/net/ipv4/tcp_output.c b/net/ipv4/tcp_output.c
> index 3b320ee77..498c9819a 100644
> --- a/net/ipv4/tcp_output.c
> +++ b/net/ipv4/tcp_output.c
> @@ -3694,6 +3694,7 @@ void tcp_send_active_reset(struct sock *sk, gfp_t p=
riority,
>  int tcp_send_synack(struct sock *sk)
>  {
>         struct sk_buff *skb;
> +       struct tcp_sock *tp =3D tcp_sk(sk);

RCT (Reverse Christmas Tree) violation.

>
>         skb =3D tcp_rtx_queue_head(sk);
>         if (!skb || !(TCP_SKB_CB(skb)->tcp_flags & TCPHDR_SYN)) {
> @@ -3710,6 +3711,8 @@ int tcp_send_synack(struct sock *sk)
>                         if (!nskb)
>                                 return -ENOMEM;
>                         INIT_LIST_HEAD(&nskb->tcp_tsorted_anchor);
> +                       if (skb =3D=3D tp->retransmit_skb_hint)
> +                               tp->retransmit_skb_hint =3D nskb;
>                         tcp_highest_sack_replace(sk, skb, nskb);
>                         tcp_rtx_queue_unlink_and_free(skb, sk);
> --
> 2.43.0

Patch seems legit, please make sure to CC Kuniyuki Iwashima
<kuniyu@google.com> in V2

Thanks.
