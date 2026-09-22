Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39754343896
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 01:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790039443; cv=pass; b=LQEapLvhTZFAzOYjFIScT4blnDyz138toDFhIawAM2ZSg4QZBo3KbS7gJNE2+mbQszBZn5FTy+KGZIBQRwvzHK2p4j67Kwkr4CbuWm9pvjVv77XCL0cuyIi+HIESgRNP8dRiPOFDLTbzNpsNr4xybt4Jx02XpfgywCTknpylwcg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790039443; c=relaxed/simple;
	bh=rDphcxVK0cLwUUna1tpHZp2v6qK6oFhLgiPUmxWlUKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0lLfGGE0BHRVRMpiAysvadCturrbwwWSLlHR3EtIsfZfmNPnuUoaAnY6ZxCtW6jM2aOmSg6m10aNV5xf8PzQpKYARsUPJ1Q9VvROiS93wcXgnmNvuVk1xZDkMSYhqE584Fj2iHYT9Yt0zd4AVEyJ1eLaSF3wr2TRRKVIB6QF9k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pwdcy2NN; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pwdcy2NN"
Received: by mail-qk2-f41.google.com with SMTP id d75a77b69052e-532d63f434fso11765921cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:10:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790039440; cv=none;
        d=google.com; s=arc-20260327;
        b=LoVKQTk49h8oR26/EnC8OLAgIvq/2P42IC6YeVTk/Uc6G3aHTCIqXJlOiaf4LUio7k
         ioSOoSqI8h0WH1RQ0x3PUfO1JaDjKM8kZg0EwkP3pBxV8KRyFKRPS9Df7N6EFubg1lX8
         PHMj7RR30XtJImSMNgw448h7YWb5bMcy2Scs0kNYo+kHlWkPuoe/1ZhSpCqsck6Nl3hf
         +Rjli0FR0f1FoFNTgCBm2fEssyXfgJmDtS9PKyCZCUNuAnemOO11r/pHYNceFSuyBCYu
         4UUn28B8Zg7QlHTyw9MTcXFSsqApnPJQmjbb10WwwDTK6EEpq8kGICSmvSlYzjns+Qke
         VnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u6Z2U4vAuJb/VjzAk0+RtK9FDIXwMhOB79JAT2yh+ek=;
        fh=kmjGLDX8xQjzbEvQnJtD+/BTpeMfnjc47Gwt4x0/euM=;
        b=qk69i8XvvK3jDxgm8IELYa9rYmy4DpY7J/Nnuhsu1UX0VDdgDsTgsGC9YwEQuSN/9S
         ru325oellyTFq3nd5SvDQBVVt662f4fAQVq1WAqUlmtuvqKJfx7Yo9ngxfx5DfPLyYfv
         kDd0oc7uVgUlF0dhTzPg+BmI2ATotdP26vWyvO8HyymX4r1ZSyZr+t5fDt/bDaq9Io/y
         Ip1VEDNzD6Z30MLbN5alg2ZJMquFu315yfUuARSOETV2R1KECkT9qqT3GtAia5rSGA2x
         l4sfWD+PkIcrTQsl2T6ag0oZ4MDq11kSx+R+4vRQu5+oz5rSgvw7tM/1B/fqB1AzVV3Q
         CGTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790039440; x=1790644240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u6Z2U4vAuJb/VjzAk0+RtK9FDIXwMhOB79JAT2yh+ek=;
        b=Pwdcy2NNDsW68Ziqg7g4ty/PdMAiuuHbk/aIZAm6lGfMCPaFAtMh+U0mlB1CLqDdRV
         W6MgrQYDcRCm+uvFXHNVE5iXZbLUzUkQQITRAeu+ZromRa9bO2Cu5+jPqGmIMc3fs9cV
         f3f0vr6CPkQeFtlnyhKRUjDzg/TPdffJo8NMCAeRoYd/bXMBqh6NXjg9ShOkiZS9Iyb2
         LFDaKICi8PC5x6qK90BcIUstjzncpvf/P6Jm1Rbdh8IWwlDL5HoCTmDfTUy3FA33XPvd
         oT9K6jAIJpz3hF6049rnJUNLS1gGDoByMrLue2SYByZzHwXU60k0jcnEZjovkUCq2Mki
         WjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790039440; x=1790644240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u6Z2U4vAuJb/VjzAk0+RtK9FDIXwMhOB79JAT2yh+ek=;
        b=DrObQClUOMzpJ+Jx9CVScNBqY67kQUhoyfcWWto0+5hHoVvV02SC3jG9z5LQT4clmp
         hszM+hgLkq6CHmpDuBKYI+qF9B4YT/ERTKOw7wKUkG7tciOoLPIzeJ0TCKJS9h2THPJT
         rgibBm0yDrkWQnrAroB6wut5nrfE+XKF2hY7iMfDGgDMddF3Av4jCXlcWCGhH/g1cb0a
         OIrAYTMyUV/+SXlCQFahXVVcY1+NWxoQ9TXuE/JjVGl4B/END8s6NLDkBEVjot0B+bvi
         30hL3D1IN6sDOAmoRtvz5+nule3zCpa/MlPzwpb5SSk/bqEI0F3Di89NA4HPailzMsAF
         Y+8A==
X-Gm-Message-State: AFuF++mtKadxRC05UZmJH9stTT0A+nPbdGulr3Kb+DCH32KmaaxdZuxH
	so0VpH9FdVvEbw+lUvlmSipfikFScKbOhtDCQzg1/IwwFKlTZUrVwdYFov4hzXBc+VxplkSCO8T
	BZOYYTxOtNtXYEANWDzDeMg8/sS9sTeP6PoOSBVNj
X-Gm-Gg: AYBFou3osYQ6UeGd3QvtRhZGbTPfKh6dlPImGwju4NHpceH4a5kD6fPZrZOox4VztnO
	rJD700Lr4p1+UeMJGFbF6BuQBzE5SeEdIABbXD1F8YB7dA/keQ8nNvXj5p1Mg2yIQOy0OuskJl/
	nGkVFZbaTG/shhpW7VqzKWSNi1w5YVNDBrANNoYD9TIbrVOLsFnzbdR4fkpuy9F374OQZ5BdKzp
	jdebrOM9CVMlbtQH9361BQCAFKuAdAtpXYRRpK7eFWG2Vx10fNRLJddQ11disNV7IITf1PNHPlb
	K4Ht+OKPpEO8936wbOkehRs4/fAxeM+3XOvmQ+2o3twnCYWr33Ra1HTVR6mDdfQzo6RQiZPmOx3
	GLVrq8vpZ7znmXVklFxxST+aBQxW2HtTeE4tzaZBlTgrABuu8Xojrco2i+p1dyQzoylvAnA==
X-Received: by 2002:a05:622a:2287:b0:52e:8ef:5960 with SMTP id
 d75a77b69052e-532d8e32ebfmr30057471cf.33.1790039439462; Mon, 21 Sep 2026
 18:10:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914164400.2738350-1-edumazet@google.com>
In-Reply-To: <20260914164400.2738350-1-edumazet@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Sep 2026 03:10:27 +0200
X-Gm-Features: AcwNN1XENI3C6DJEuWKSVfu123kER72zrEHAvPUuiU4gn9CTQlz-0sfrY4BfkQw
Message-ID: <CANn89i+HYuqNO_ifR7XgpZO89r9ZRWk8MOVzezmDff5KfLMp7g@mail.gmail.com>
Subject: Re: [PATCH] dlm: fix send buffer backpressure handling
To: Alexander Aring <aahringo@redhat.com>, David Teigland <teigland@redhat.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, gfs2@lists.linux.dev, 
	Eric Dumazet <eric.dumazet@gmail.com>, netdev@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 6:44=E2=80=AFPM Eric Dumazet <edumazet@google.com> =
wrote:
>
> lowcomms.c tests and clears SOCKWQ_ASYNC_NOSPACE in con->sock->flags,
> but this bit has not been stored there for ten years.
>
> Commit 9cd3e072b0be ("net: rename SOCK_ASYNC_NOSPACE and
> SOCK_ASYNC_WAITDATA") mechanically renamed the two dlm users, then
> commit ceb5d58b2170 ("net: fix sock_wake_async() rcu protection") moved
> the bit from socket->flags to the RCU protected socket_wq->flags, where
> it is reachable only through sk_set_bit() and sk_clear_bit(), and is
> only maintained for sockets having SOCK_FASYNC set.  dlm uses kernel
> sockets, which never have SOCK_FASYNC set, and never sets the bit
> itself, so the test in send_to_sock() has been false ever since.
>
> The consequence is that when sock_sendmsg() returns -EAGAIN because the
> socket send buffer is full, dlm no longer sets CF_APP_LIMITED, does not
> increment sk_write_pending, and does not return DLM_IO_END to wait for
> lowcomms_write_space().  It returns DLM_IO_RESCHED instead, and
> process_send_sockets() immediately requeues the send work.  A connection
> to a peer that is slow to drain thus keeps cycling through
> sock_sendmsg() and -EAGAIN, burning CPU, instead of sleeping until TCP
> reports that space is available again.
>
> Test SOCK_NOSPACE instead.  This is the bit that lives in socket->flags,
> that TCP sets whenever sendmsg() returns -EAGAIN for lack of send buffer
> space (tcp_sendmsg_locked() and sk_stream_wait_memory()), and that
> lowcomms_write_space() already clears.  This restores the semantics dlm
> had before the bit moved.
>
> Also remove the clear_bit() of SOCKWQ_ASYNC_NOSPACE from
> lowcomms_write_space(), for the same reason.
>
> SCTP connections are deliberately left as they are.  SCTP does not set
> SOCK_NOSPACE, and it never calls sk->sk_write_space(): sctp_wfree() ends
> up in sctp_wake_up_waiters(), which calls sctp_write_space() directly.
> lowcomms_write_space() is thus never invoked for an SCTP connection, and
> the test added here stays false, so send_to_sock() keeps returning
> DLM_IO_RESCHED as it does today.  This is the only safe behavior, as
> returning DLM_IO_END would wait for a callback that never comes.
>
> Fixes: ceb5d58b2170 ("net: fix sock_wake_async() rcu protection")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> ---
>  fs/dlm/lowcomms.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/fs/dlm/lowcomms.c b/fs/dlm/lowcomms.c
> index 2aff1c7c17de..abe9ae4c643f 100644
> --- a/fs/dlm/lowcomms.c
> +++ b/fs/dlm/lowcomms.c
> @@ -522,10 +522,8 @@ static void lowcomms_write_space(struct sock *sk)
>         clear_bit(SOCK_NOSPACE, &con->sock->flags);
>
>         spin_lock_bh(&con->writequeue_lock);
> -       if (test_and_clear_bit(CF_APP_LIMITED, &con->flags)) {
> +       if (test_and_clear_bit(CF_APP_LIMITED, &con->flags))
>                 con->sock->sk->sk_write_pending--;
> -               clear_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags);
> -       }
>
>         lowcomms_queue_swork(con);
>         spin_unlock_bh(&con->writequeue_lock);
> @@ -1391,7 +1389,7 @@ static int send_to_sock(struct connection *con)
>         if (ret =3D=3D -EAGAIN || ret =3D=3D 0) {
>                 lock_sock(con->sock->sk);
>                 spin_lock_bh(&con->writequeue_lock);
> -               if (test_bit(SOCKWQ_ASYNC_NOSPACE, &con->sock->flags) &&
> +               if (test_bit(SOCK_NOSPACE, &con->sock->flags) &&
>                     !test_and_set_bit(CF_APP_LIMITED, &con->flags)) {
>                         /* Notify TCP that we're limited by the
>                          * application window size.
> --
> 2.55.0.1007.g17ff1f9808-goog
>

Gentle ping ?

I have an ongoing series for net-next removing one cache line miss in
TCP sendmsg() and ACK processing,
blocked by this patch.

If you prefer, I can insert this patch into my net-next series.

Thanks.
