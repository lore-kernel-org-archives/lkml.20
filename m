Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4C24CA272
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790292; cv=pass; b=THcCBHUT/HM0B0oHwEnxWjXDYTJVHnujSwTkKByFMfA2C2m82TQ/qKPpzIvDYCot7XssR2mYeYnW36LIgx/KWoRAPIwXfOdorwwZIqSyoN3cH8BcEn3T4p7WAUt4+YijlUJiLJVgjywgHmZDV8Ddgx+x+tl5PM4NJmRuIqFUZyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790292; c=relaxed/simple;
	bh=YQcfcs+zJnOKaJQ5IHf2t2NLY66T+7nBA+9fE31khyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OhGL3sAGa8/HTMdgS2Eg+qR5FAUhmzZiiRUwFNVE8TkDOeEE2OptWMED2q3qpcRtvxXQRr0YXuFuxq8wmCYCdxcNjteErrKM/Y7hlC5SzbVzsjzRKEZyP27xkOD6jeE3AwWgqSsLmXY7k1IhxwpEBsyjxRWTuZTC2RA8StOQMmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ft7FE0rQ; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ft7FE0rQ"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-52e2d1bdbc0so22316111cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788790289; cv=none;
        d=google.com; s=arc-20260327;
        b=moDua4EYYAHAasffxPwU43g/fIRZpZ+fDQC1v3YSMHBlQDgplkwyFlLwLC01s5m8Sk
         nNZOylgA1LCDas5x0RxnUYK5FO9gLmXK7bRE5CukevS7Qr8rYZS24aBFqr8+bJPjh1x1
         MHdwb1zQ8SplFaF2tF3Yrwk6fyGn1QWxdIMl6Rwrh+aFtFqnoCz8iPRnkDxHoVnBMpgM
         7p13r7bo35sfIJ+ukc5vZKdItt0rcZejT5BiaLYmk3PqFxsKib5a2Es1r+QKo/Shkbef
         SQKbhxb9lfdP8kjYZV6yOErKa5lKgdz6GfuoZSPktzoSusojpXM94K5xOzeeGaxMRNnw
         JYCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HbWRZ7ulK/8VAdzXceDJhVzPUhV9UxTFxMw6kD/qZtY=;
        fh=ClWKhdtMCylOTBYZM9JplQdWiSmt0WpkdFevS5Fga70=;
        b=LMuji30KdXMAm8y4Ry8i2fqVKytIOrSjLNlCX20xWBscrMH/AQLRL12b+S7qz1aNvL
         4c8YTcQHd6FkPH+KPFq8X+PONi/Amci09akGwKhM6AfFfhTd4hCx3SV1GrmSYNUoWyGd
         pBbfmjazxtA6gIbbPGVpocxUbmGpzJD3nu3kGXXAgCO6eqr2o91Y6WX8MLZvBzwZ/xMX
         qZ0kUtM+OrRihb4xYCZI3xpZ8AM49NXyKcrqVzMT8lDcHFY2SrxifqXUwfl+PC1k7up9
         KD/nP/TO30Tmcgv8Am7hjnWfyhajrfh+cIXnW07RkTEZfekleVJHT/9ppA/yzw407k2O
         9GWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788790289; x=1789395089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HbWRZ7ulK/8VAdzXceDJhVzPUhV9UxTFxMw6kD/qZtY=;
        b=ft7FE0rQwpnJ5clUH/tqZtW7KHdFzDnkTmhwB2rfJGSQbeySO4db3HkkabIHaTvw2m
         UaXTYLGQNPdFOpsUDpQdmYAtmD2Ft8u8AuyPgFwgkqYOyduLPdLYzSP1FAKYWXatKUKI
         R6YFXMV1P21AJjYknM+XSaJFIBq1f1AvxnXkjHQiV00HLpBo9s+DaNOZAzEA/H/MN4F6
         +LRK9bVit/jGW+GUeq4NUoClIfSw+sdv6uO9X5cfsITp16cvsvR4MAd1WX8oqrW0oIIg
         VWbwyxwJJr90eCaXObwO5Qi3oZjOl8M4NNRoyvlwQyxvti3VlpL3x+JTrgl0W/iYKsmp
         6yuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790289; x=1789395089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HbWRZ7ulK/8VAdzXceDJhVzPUhV9UxTFxMw6kD/qZtY=;
        b=rw6be5lCvIVSufL5SibFG0W7Zq+VM3xQeUh7T2cifToweEP13K2fxaaO4uS/ADYUo7
         Pk6Z8T+VpvaWf0/Uv9jZWJkVL68W+uujJ4SdfUWI9jDeDAtD2tpwKehR83m4Sql8zuwV
         os1aOHf0rF8RermH5Ohd9aoYn6nCBiwVg4wprebhoWgdziboyv/zKI1Ka7newbsmXUuz
         A8n6VoL1pv78Dzj+tk2AQCXiu1YLxXFtD87G1gGKyrMOvbMqJMbb/hIikxCV7G5nFbO0
         m8oEPqwWfQxJQF+wVf+JF0ICTkDJq+Y1xj41zvZo+evWkXJ2yyiumIQZxqARJuDXmg1N
         nypw==
X-Forwarded-Encrypted: i=1; AKwUvBzV9XTRAXeA+TXEbCq8lZSRRdvbrOpqCngbTHkYmYefdjsqGp1LRoky9rnroanz6u5UJepqKQaLJQrrN3o=@vger.kernel.org
X-Gm-Message-State: AFuF++kDyN3jKxWMPcmblanwo6q+fksEobo8Fbgoa2IChrqv/Moi9Js4
	KuUV3VSvd8QqVV631+yNFzeDckBGRqSMbB2qF5NOts9fyj5KJwjw/Rw5r8QlrndFtrylKy0Ik7L
	0jHy05RmOcVMzTDQ4vtC5gyv3EeZA+vknE4GHaAOZ
X-Gm-Gg: AYBFou34hXHh2oEKWYfmTooOG5yzXwUtrpon1v9v+/pzXYXGHwK6ZXFWyqZzKSOKwKG
	01p4AR7Dq5KZP9Y/WXIgS9m2R43rWshIUshzJtD8O+MFS3I2eYXjxN4JqKjdle+2+3jUdOGBnMk
	41BK3jip0EASD+G/x2phj5qfJn8upklpyDw4cnKuKGiEJwsweShtSsfGamlWLjd8LCH8cB1ka4K
	bLyUgvDRRCca+9oQjO3wFwkHPz2mEprjFg5JQO9EbZ4ztbcAosBe4mOeFaAgrlDDOdTN+W6aMMr
	pj1bQJ9Z8xVsjjsK38DDAJ8YIzkZRjdL53TkMLieS6Mm+LjQjhSXtrA8whze2iT/XLB50627KM8
	UqdQkW/+yRUC4jx7KJXkNt4qkyvXV6v035Hq+CxRfAiDHLW0UyfuGTy5S8A==
X-Received: by 2002:a05:622a:447:b0:52f:a17e:a37c with SMTP id
 d75a77b69052e-530548b37demr250752421cf.21.1788790287557; Mon, 07 Sep 2026
 07:11:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788775605.git.zihanx@nebusec.ai> <d1b0d3a224167afa0ee61db0c9f778a2d12ff9b6.1788775605.git.zihanx@nebusec.ai>
In-Reply-To: <d1b0d3a224167afa0ee61db0c9f778a2d12ff9b6.1788775605.git.zihanx@nebusec.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 7 Sep 2026 16:11:16 +0200
X-Gm-Features: AcwNN1UohThSqovfEz5VNgNu8UI12XNXXPGGypkZuhzhsenoEmI5CUiOgty9A4k
Message-ID: <CANn89iJjUL9LJPipeCZKq3F=Rjhq-gdCKwnuW0pkvvpS_ai7UQ@mail.gmail.com>
Subject: Re: [PATCH net 1/1] inet_diag: cap bytecode filter complexity
To: Zihan Xi <zihanx@nebusec.ai>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, David Ahern <dsahern@kernel.org>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, Vega <vega@nebusec.ai>, 
	Luxing Yin <root@tr0jan.top>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:53=E2=80=AFPM Zihan Xi <zihanx@nebusec.ai> wrote:
>
> inet_diag dumps run request-supplied bytecode through inet_diag_bc_sk()
> while walking TCP, UDP and MPTCP hash buckets under their bucket locks.
> The auditor currently accepts an arbitrarily long program, so a dump
> can spend unbounded time in that locked section.
>
> That fact is already present at the git epoch: tcpdiag_bc_audit() had
> no op cap, and tcpdiag_dump() ran the bytecode under the listener and
> ehash locks. Later inet_diag extraction only moved the same code.
>
> ss(8) filters only need a handful of compare/host/mark operations.
> Reject programs with more than 64 ops in inet_diag_bc_audit() so TCP,
> UDP and MPTCP dumps share the same limit. 64 is a policy cap above a
> normal ss(8) filter, not a lock-hold budget.
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reported-by: Vega <vega@nebusec.ai>
> Assisted-by: LLM
> Co-developed-by: Luxing Yin <root@tr0jan.top>
> Signed-off-by: Luxing Yin <root@tr0jan.top>
> Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
> ---
>  net/ipv4/inet_diag.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/net/ipv4/inet_diag.c b/net/ipv4/inet_diag.c
> index 34b77aa87d0a4..1ca528cd3e72b 100644
> --- a/net/ipv4/inet_diag.c
> +++ b/net/ipv4/inet_diag.c
> @@ -725,6 +725,12 @@ static bool valid_cgroupcond(const struct inet_diag_=
bc_op *op, int len,
>  }
>  #endif
>
> +/* ss(8) filters only need a handful of compare/host/mark ops.
> + * Bound the program so dump walks cannot run an arbitrarily long
> + * bytecode sequence under the socket hash bucket locks.
> + */
> +#define INET_DIAG_BC_MAX_OPS 64

This is unacceptable.

I am tempted to say that any hash bucket with more than 1000 sockets
in it is a problem, not only for inet_diag.

Since there is no soft lockup, this really looks like an attempt by AI
to break legitimate Linux uses.
(Or slow down as your prior versions did)
