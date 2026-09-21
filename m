Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E6A437448
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995224; cv=pass; b=gOgCW7cey1sbIAk+hvs1DlOrPcRhHGzDjd76nwKDb7qyUaQqbVzXFuDFAoET3raIKd5kSEqnRpME8bOV5O4dZlmFtUYxiQ7Lqh9Dt6fkX8fnsrThH3iwAgBo0mvIdkP5euJa51kdC5d2XL49pHbyPnSrLSMmHcwpoLwag2ntGCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995224; c=relaxed/simple;
	bh=K4B5FxCtXwkBIRjmKyegvjxSrKxmltPU/9UHdRZnXfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EU6sEZvciFs0XdyBfnrkEwkqql078oJIj2OwcMYtKt35BhnILWv7cX9vbP6ftuSphfNroplkIJorT7ltgV7QcbVJpePLTWgh7TnMLqT5pF0hwGJxReQznFDkgVnqf6fL3wYh2KMwYatX97G/IamDEu0tmAn2152qlfgbNqoj4AI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VGApFe44; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VGApFe44"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ec395so25412991cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789995222; cv=none;
        d=google.com; s=arc-20260327;
        b=N3qNusegY0zGM/KAN5tHvzPy7DoE6D31OjKj3vTxsjtrk4SG8JQe+VfWZxCdF8Cb3O
         JxYTA5O8IE5IV8uqtByE33l91QjJB7+fN2up41enS8eKefnSLaUCdS4BMVYo3+mUjbTZ
         82wKL6YFLJSvC7lTOjlcd+RewgXAVpqCSFFkySPigw2T98VDcpZ3YYEEOBM7LCrCL/gq
         /NG9UOa4G4hMV0iuF/pBQXK4PmizNtLZ7mLd96+lAdkwavcXoxqRr3EyCU5outRaLQb3
         FwTNhxNF+evOt/tBvQq0dAbhPI2XOrEU9Cyrqw7Ta9oB1/v/RoZlTmToCDvgxAiXcn4u
         IGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4PDmOLAc0V7K9wrJbGlsSxIG4ufpRZcawnbZOqhCO34=;
        fh=aOPJf+rA+YeOvM/WcJ8DINYcAQWxUDSf/oC2gkaWNvE=;
        b=FP6fFfnygwNjFLrRwhmUp4aj/9oqapZocL73IRtwz+knjXBsGgJSqTiato2oLX2/Q7
         Ji8Rl7NUL40W3Ts5E3VBR8XnDVskf5tGqLJuvmp5qjtzrOuv6XKjCdBD648lUXzMQcU+
         8tbeAkyCbP/flAvjI078Qr2YyDnwoeSOHK4DnM8d4xH55EOoEW9079Q3voe8gluiUCP2
         F9Q3jZSS/IAoI1n0Mhj8VjmBPAE5oQqoippPEhLx6Dt0IYK4Bcg8Yu/3+nljT6sBVldy
         5kIh1Ll08PttvYKYyI0RyuK2bQVRrl5wT0jFmD2PnKJOz8n192QToY/4T+HHHHcw3C2z
         GdEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789995222; x=1790600022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4PDmOLAc0V7K9wrJbGlsSxIG4ufpRZcawnbZOqhCO34=;
        b=VGApFe449kZ5dDn1YYacxDm7ebegCuUwjDVXuxkI32VDXNGWQGvjNGLdgaj37C/q0X
         IvLxos7lFuJecjehpOKV335xcnhHYaIfRpQZYzpjeLI6PED3JotZsuP+0puHvXnNf3SW
         mCqeS7PxgnkWEsRTm3N+ykxuOtif10Dv9jK6GIpCa/Avwz094eAfNk3se/2SxY1Vx+x+
         m5aEoxBwEkfBG+j7CTFN64S//NpRip5UKRMWShaybnRu+zS50amavi/rfU+DSUavh/x1
         an8EpGLIhfbHAhcCSKNu3uV73h9l8wN6WCrD2KPTlATL5y/TFaBrW1/geCADY87s3+jK
         hbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995222; x=1790600022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4PDmOLAc0V7K9wrJbGlsSxIG4ufpRZcawnbZOqhCO34=;
        b=wm1eEMLQwv4oUUu1Lq3nTKRvlDQFf5PXFudp2eKPUgmK3mZiuYQHCu7DUsdLG5Jxg8
         BbA7MGWuWijl1gAcSi38e1uYt8aJTEa1NwAu21FWljxe5/ioBBVYyXbWRNzZu6dSShv4
         us4Z2Q+s3sUgMolESMM6eICpQ0L97jwFX/w4A5joJ6Vt0wjv5A1TuDhSV8HaUMs6bHGU
         ZHHCx6ivK+sKJbIVzlPkIK5R/h4bEHHJyFPCc3rzacmjWug/oJ74HG8b4JgyfC7OA2EW
         /MC4Wk2CwDMs46AV1bC/c6Ega6d8hq+bN0QjE+U4G+IvTT+9CPJipG9ke6mLkWVUDiQT
         HISQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMLj+eHR5HBjTJrh6joZh1h07oWaSqQAD4ar0/BSmOOyCgk/+k3flyqxI33Nltad0B4tZCSB+8Gj3s2I0=@vger.kernel.org
X-Gm-Message-State: AFuF++kBPOEqnxu4JZh3tCNWQeIyUev+5a8YqcLc9Ropd1ErqhDBKXDR
	RwpWXPutkbB3MAD2lNPvZIserjTPUUOoPJlrz3TzTxaEwefqHNHkzVi1WOgMnX4oRTNe4fMCzgB
	uh7FqgiuXVd7e3KAJ82vmEbCY/DJAE2ceSEgI1Fg2
X-Gm-Gg: AYBFou3Ivq/LJiQRfwXJYMHmxGFXKdzUuWgLEuYX/WAzLi22AMO7sXrHFQGxX0PkEH+
	8DJ/g6S4yk+SSjg6pKrbVorELyYixe+5yaZfX8c3ENL/qGJIB2kluGQDyY5/wFANTTjisLrXYuy
	7WfWGHBFFQMHFod09fK0CytfeGilx4Aeq0tQBTphPHcOhRzqsTC1opMkxjhtQNaW3WKsl6k+A2y
	CPcBz7aF5SgB1ziSXHPnsNVBiT+LxHxCKLysXmHpwouD04p/cH3j2LkIbQlFRzWmXkRXfmQmjiA
	dBTHx0nggGJ9hguVF5tYDGqnGosKR9tKldsgb8hzSQoDsXtQmUmPE/yzX8q652nTra7zAWcb5wV
	Bfo+5rSAaCAkF251ENi9TkKWbgeUV2msazy3HWhaiGIdOsTidvzj3P7kQL/rFhbj+Y4oYww==
X-Received: by 2002:a05:622a:3ce:b0:530:42e4:1b68 with SMTP id
 d75a77b69052e-532d8e359d4mr4583801cf.44.1789995221374; Mon, 21 Sep 2026
 05:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260919215236.3470714-1-benquike@gmail.com>
In-Reply-To: <20260919215236.3470714-1-benquike@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 21 Sep 2026 14:53:29 +0200
X-Gm-Features: AcwNN1UuaNK3ZL3t0L5G65CYvNKMTbVpCdbvcbXjoq6u70TWr5KPDoCcduwhOmg
Message-ID: <CANn89iK2P8CYD0xNxtynmOuwqSB1i-+TPg4m5eSh60rs4pC-aw@mail.gmail.com>
Subject: Re: [PATCH] tcp: drain out_of_order_queue and update SACKs in tcp_send_rcvq()
To: Hui Peng <benquike@gmail.com>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 19, 2026 at 11:52=E2=80=AFPM Hui Peng <benquike@gmail.com> wrot=
e:
>
> When TCP_REPAIR injects data into the receive queue via tcp_send_rcvq() a=
nd
> advances tp->copied_seq and tp->rcv_nxt, any segments already sitting in

tcp_send_rcvq() does not advance tp->copied_seq. The only sequence
update comes from tcp_queue_rcv() -> tcp_rcv_nxt_update(), which touches
rcv_nxt. copied_seq of the receive queue is only written from
TCP_QUEUE_SEQ, which requires TCP_CLOSE state.


> tp->out_of_order_queue that are now covered or contiguous with rcv_nxt ar=
e
> not coalesced or removed from tp->rx_opt.num_sacks. Drain


num_sacks is a counter, nothing is "removed from" it.

> out_of_order_queue via tcp_ofo_queue(sk) and update SACK blocks via
> tcp_sack_remove(tp) after advancing rcv_nxt in tcp_send_rcvq().
>
> Fixes: 292e8d8c8538 ("tcp: Move rcvq sending to tcp_input.c")

This commit is a pure code move, it changed no behavior.

> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>

What is the bug exactly ? What is the user visible symptom ?

No repro, no syzbot report, no packetdrill test.

For the CRIU flow the out-of-order queue is empty, because TCP_QUEUE_SEQ
only lets you move rcv_nxt while the socket is in TCP_CLOSE state.

You need CAP_NET_ADMIN, and you have to enable TCP_REPAIR on a live
ESTABLISHED socket that already has segments queued out of order, to
even get there. And the state you describe is transient: the next
in-order segment hits tcp_data_queue(), which already calls
tcp_ofo_queue() and tcp_sack_remove(). tcp_fin(), tcp_prune_ofo_queue(),
tcp_disconnect() and tcp_close() all purge the rb-tree as well.

So this is a "Fixes:" tag on a 2012 commit, sending a behavior change of
a privileged path to all stable trees, for something that is not
demonstrated to be a bug.


> ---
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index 92bc60716f33..8a7c38a4b1ec 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -5589,6 +5589,11 @@ int tcp_send_rcvq(struct sock *sk, struct msghdr *=
msg, size_t size)
>                 WARN_ON_ONCE(fragstolen); /* should not happen */
>                 __kfree_skb(skb);
>         }
> +       if (!RB_EMPTY_ROOT(&tcp_sk(sk)->out_of_order_queue)) {
> +               tcp_ofo_queue(sk);

And this is actively dangerous: you are running the input path from
sendmsg().
If one of the out-of-order skbs carries a FIN and the injected bytes
close the hole, tcp_ofo_queue() calls tcp_fin(), and we get
ESTABLISHED -> CLOSE_WAIT, RCV_SHUTDOWN, SOCK_DONE,
skb_rbtree_purge(&tp->out_of_order_queue), tcp_sack_reset(),
inet_csk_schedule_ack() and the sk_state_change()/sk_wake_async()
wakeups, from a sendmsg() that still returns size to the caller.
A repair tool would see a successful write and a shut down read side.
Also, tcp_ofo_queue() computes dsack_high from tp->rcv_nxt, which you
just advanced with locally injected bytes. So we would record and later
advertise DSACK for ranges the peer never retransmitted, and feed its
undo logic. tp->rx_opt.dsack is not cleared here either, the existing
caller clears it at the beginning of tcp_data_queue().


> +               if (tcp_sk(sk)->rx_opt.num_sacks)
> +                       tcp_sack_remove(tcp_sk(sk));
> +       }
>         return size;
>
>  err_free:

And you copied two of the five steps tcp_data_queue() performs:
no ICSK_ACK_NOW, no tcp_fast_path_check(), no tcp_data_ready(), so bytes
can be moved to sk_receive_queue with no wakeup.

If you really want to address this, do not call the input path. Peer
data sitting out of order is meaningless once the receive stream is
being rewritten, so purging the rb-tree and resetting the SACK state
would be the sane thing to do. But please come with a repro or a
packetdrill test first, showing an actual problem.

pw-bot: reject
