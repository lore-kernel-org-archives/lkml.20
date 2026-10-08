Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F68049364B
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453591; cv=pass; b=pOLhTpEZ5NfUFrERyIy2njJqy9sq7AVNC9YVszGY4GcJToyZN4rqe8wmTUWqe/J/Yom8tiUFgnSKShDpUWrLt3f9+PdO3DQoMIaBWbohueW9S/ByoqJPXVZB5h26UKYOLhbXD97ub/D9uLpdauYtfB0sJc/YondgpYfDMmkIz1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453591; c=relaxed/simple;
	bh=vGEabZlK0+CeQ/pjYwF2a58KwPzkGrqiGm4U7jtESLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEAl+S3gmPu05o6q6VVOatExFu+8xye57NFzX2hVC+ve0bOCYG5lh+2v4/IEFASadQf2/s6WsfkpHR5ufmN/LbVhjLw8eGyPELZcjKGCmABx+uZ0jL7fDuVEuE5wGda7b2dA7lV3H+Wi9yVVsmQY5KieJpgD7lx8dGCRAsEHQrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ink.fish; spf=pass smtp.mailfrom=ink.fish; dkim=pass (2048-bit key) header.d=ink.fish header.i=@ink.fish header.b=hVzizJns; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ink.fish
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ink.fish
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ink.fish header.i=@ink.fish header.b="hVzizJns"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso5211683a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 02:59:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791453585; cv=none;
        d=google.com; s=arc-20260327;
        b=AOXMSirzEVj56sDKpCD1f7M4G7jy09vnZ+5zzkYK6tHulgn0C9AB424nvqmGHu7jLw
         OVvKZD1J8JnKKlQ4DuszZfINiNY+h6w8+hHFFoFEmYTd1qJJVHyEZ9w9/4SGxOqfeoX1
         dLOeBJsy1miGdi5/NPvvDDcgj9GzAhjCgYhunbV8DtXwpryvM/uBc/y+lzvKjvyZ2DRm
         TZvHom4osWZP/C0GzXFChZFfZKoeZv2t2piKJkoSBGqbWwVNc8ewj3fG9gP/AAPBD0Hl
         f/jlZX1d4a2p9o22ggP89ro0NHRYluCxcmgDvZYninozTE7BwXvzB3owZY25Jb/9rdkS
         +EDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jJXr7SMdL2O4zud2v5umGR1pHKL3RTbPRwBEIieOT0M=;
        fh=BMK4fBzzA2s6fL0n6bXOcCG9eZBc+pcYEZNCt5xQaVM=;
        b=eIGIPIetyqykAO9IiUqdoKRgKkuwxHo4rWYW/zp3DKPOI0TG8dJ+X4Z6htXMuTXFlx
         dvPRnPz9S7RGYTdtGjrOBaMMxcW++1zr+x4kMaLnGbgqf+SVjeQu/6Z7BY5B7h4c6Z9l
         SY4l7DRZhinAdYKw3ai3Sw4ciBnNW3/s6pIIqc9usx0YDtQr7nSFcKcM2gZ/1PrRTGj6
         2/SV9iQt1pBZbchMW1S8xMjPhqEGtZkDMt/zwmeT1fsVK+N4Tvc2bo8+Ne5J9BwRg/3b
         sXXPi3UBYmH+sQS8yqLkg6GSLBQU5ldlWFTaJ9m5Cb4m1r4feMqCVAQnYT3DV8nU3aq0
         kweQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ink.fish; s=google; t=1791453585; x=1792058385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jJXr7SMdL2O4zud2v5umGR1pHKL3RTbPRwBEIieOT0M=;
        b=hVzizJnsehIoL12EupU+tym/lF4owraB7HNNDBAF9/afcvh5zDXU5lS176Z58i8orj
         TpaXfRKrbTQXHQXW00eZqmlGFgyJEhj2hk5dy/TLJ3jcg2tLPXZD0cHMVY3D5QGNdv2y
         DtY0Ew7hzDnWha2rytwUm5SUV3FUqcH02odVjqiPuZr/t8lJXVYNMK7WmHf4GRbwPSJI
         2VFwipWW4/EIsbUfZEAEtWxlBCFtywgpKSSshdWND6+HlFanJZBV37CuCtiOQ3Tt60nF
         dxHvBhB0aEupNA/bW1V2evcZ9VdR0bAdZvSqeFK75DyPO3T9JMR5r2FcVy3F7JeU6eO4
         +b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791453585; x=1792058385;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jJXr7SMdL2O4zud2v5umGR1pHKL3RTbPRwBEIieOT0M=;
        b=NLACzvibE8XrWX4765hk0wj8Sndjmc4C2Uf4mF2wYf45uWh1gujCCCmBDc0ZsqOsug
         So47/oMrkEeFnnrKveBNK5jD2bNCeOueH5zng/RjcYe03jnzxvhFNzDbKWms9H/hhwie
         4d3NX/Sxo57j7gSo/tji8+iiEltWPpl0IMjxpZQliEdWgrcV0zjXOV9C0HIG+acFuRrp
         OrYYeNKzM+1UQ//JlEixTXrGj9K5msF5ykRJ/RUT9FCGh2psbSLs0++WOzURjLPpXNkm
         M46Utqy7s3kbdgvyPgChBpv6FmwAky5JIFC+M335upthqi7qj+9erWH/Qad2RP2WVEja
         n3lA==
X-Forwarded-Encrypted: i=1; AKwUvBxxbcrsWqdnqJZlP5oLHXqAARcUIcqUDTKhZj12Qcwvq/l5W9Aj6HUclhmyhaKMxjg0vcDx6VJiRD7VFAI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtYN21ceKUC1fPdeoK0RUqWB0ne4l+NJ9iYaqGFG9ylT8UKLZv
	eSD7iyrJ/747Wt/Ouh4chcRFC7XolXij832ewLoS2y4NhvdaT41E5ff5amjv2p0elk0eNKqPnMe
	RBYZptZXd1Jiqqh4nDIcnenSTiu1mfu1cHaTog6loZg==
X-Gm-Gg: AYBFou3aSLIlIaw7Lv+4q9ptkq2wSpu5KKRBhwKqhi6aF+iE/WGRM1crI8vaHliIA1+
	HVut79ZYXumOXjvSkG7qGUooOto5A86CKY4jkmOx/AXAcbaf0oofxZAZtme1tqWFt43PHtJ7AwA
	AJy94Xv0EqHgeg4AyqEqJZTgTMA0IFv0s3A+I1hfdZD7WYxal0aTV5wgXTUMnRizJUaFGdO+KRx
	xTD6dvf3b6DZroOyAaNs+Azfmnq6L+jcjbclHaFA1MyRityqPupUh3fXu4fMvYXPGmDWDSYIkY6
	eJdcWeh4129oRkTxniK8fGwDa0DJjCjFcJyzBrVIUi7Tt/CqHBTCUz1L+MT7IYPiQeljUR0/BHO
	ZLkvCW53sYjdb4/FU8+nF2ZRpT94sVrDVrStv8I082MznOmpWdlyZlpR7I9loDfUOPLHkHanynw
	==
X-Received: by 2002:a05:6402:21cc:b0:6af:9d70:6d5c with SMTP id
 4fb4d7f45d1cf-6aff458b1edmr3946654a12.23.1791453585259; Thu, 08 Oct 2026
 02:59:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008095231.103186-1-rameshkumar.t@phytecembedded.in>
In-Reply-To: <20261008095231.103186-1-rameshkumar.t@phytecembedded.in>
From: Petar Sakic <petar.sakic@ink.fish>
Date: Thu, 8 Oct 2026 11:59:33 +0200
X-Gm-Features: AclHuK_4uVXrewIIMOoGuldSrX8m4_JXXpcFPLw8nKMC2Hd5ZtIFNc6jpiCVS68
Message-ID: <CAFPPu1ivuG_z9Ko8VUq8Ke4Qh4vWkr4xXGZMdeouKf75qf_bpA@mail.gmail.com>
Subject: Re: [PATCH] mptcp: push queued data on passive TFO subflows becoming established
To: T S Rameshkumar <rameshsv06@gmail.com>
Cc: Matthieu Baerts <matttbe@kernel.org>, Mat Martineau <martineau@kernel.org>, 
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org, mptcp@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	T S Rameshkumar <rameshkumar.t@phytecembedded.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi T S,

Thanks for picking this up. One note on the Fixes tag: we reproduced
the hang on 6.8 as well as 6.12.111, 6.18.15 and 7.2.6, so it predates
e00b63056fb4 (Aug 2026). That commit is related but not the origin.

Cheers
- Petar

On Thu, Oct 8, 2026 at 11:53=E2=80=AFAM T S Rameshkumar <rameshsv06@gmail.c=
om> wrote:
>
> With TCP Fast Open on an MPTCP listener, if the server application
> writes data while the passive subflow is still in SYN_RECV (after
> consuming the client's SYN data but before the MP_CAPABLE third ACK
> arrives), __mptcp_subflow_active() refuses transmission and the data
> is queued into the msk write queue.
>
> When the MPC third ACK arrives, check_fully_established() marks the
> subflow established, but because the third ACK carries no DSS data,
> the queued bytes remain stranded until the peer sends more data.
>
> Fix this by:
> 1. Invoking __mptcp_check_push() in check_fully_established() when
>    subflow->is_mptfo is set.
> 2. Setting MPTCP_PUSH_PENDING and scheduling the MPTCP worker in
>    subflow_state_change() so that once the underlying subflow transitions
>    to TCP_ESTABLISHED, pending queued bytes are immediately flushed.
>
> Reported-by: Petar Sakic <petar.sakic@ink.fish>
> Closes: https://lore.kernel.org/netdev/CAFPPu1gU2Y-D+d4i3F0MoNkYK+e1U+=3D=
X3qf6QycjfKBw+8snPg@mail.gmail.com/
> Fixes: e00b63056fb4 ("fastopen: only mark MPTFO subflows with SYN data")
> Signed-off-by: T S Rameshkumar <rameshkumar.t@phytecembedded.in>
> ---
>  net/mptcp/options.c | 7 +++++++
>  net/mptcp/subflow.c | 5 +++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/net/mptcp/options.c b/net/mptcp/options.c
> index ce0de02f5..d5238fa11 100644
> --- a/net/mptcp/options.c
> +++ b/net/mptcp/options.c
> @@ -1042,6 +1042,13 @@ static bool check_fully_established(struct mptcp_s=
ock *msk, struct sock *ssk,
>
>         mptcp_data_lock((struct sock *)msk);
>         __mptcp_subflow_fully_established(msk, subflow, mp_opt);
> +       /* Passive TFO: the application may have written data while the
> +        * subflow was still in SYN_RECV; __mptcp_subflow_active() refuse=
d
> +        * it then and nothing else spools the msk write queue when the
> +        * MPC third ack (no DSS) arrives. Push it now.
> +        */
> +       if (subflow->is_mptfo)
> +               __mptcp_check_push((struct sock *)msk, ssk);
>         mptcp_data_unlock((struct sock *)msk);
>
>  check_notify:
> diff --git a/net/mptcp/subflow.c b/net/mptcp/subflow.c
> index f0a6725d2..f499073a6 100644
> --- a/net/mptcp/subflow.c
> +++ b/net/mptcp/subflow.c
> @@ -1894,6 +1894,11 @@ static void subflow_state_change(struct sock *sk)
>         if (subflow->resetting)
>                 return;
>
> +       if (subflow->is_mptfo) {
> +               set_bit(MPTCP_PUSH_PENDING, &mptcp_sk(parent)->cb_flags);
> +               mptcp_schedule_work(parent);
> +       }
> +
>         /* as recvmsg() does not acquire the subflow socket for ssk selec=
tion
>          * a fin packet carrying a DSS can be unnoticed if we don't trigg=
er
>          * the data available machinery here.
> --
> 2.34.1
>
