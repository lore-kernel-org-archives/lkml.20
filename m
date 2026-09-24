Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6C3A5E87
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242552; cv=pass; b=G25clGsWkg2upNdIIElHEKWz0iHTlIIEQgBVVPcz9v2kDJ1LpLJudR00GmRpjNVHwE9/dXxWLqXt7Ahu3tu5toN/qCtkEu7yW8ldysW4qez6ZbvOHA1vTgbbJqQcUmD7gUV8bDvHSQlPeDALD6eii+nzBSl+pY6yqs5uvsjnrl4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242552; c=relaxed/simple;
	bh=nWVJkgh6v0OqckNbFT0DrWjVwyF8kZpU9defMGtQRv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sG7Ur/DY9ccKkBrhP666pJu1+i3w97dWHhKxkwr96K12qPLjFnor8URxID+o7/BOkri04YcukoJuNPNYxisO8WLcBwdqtPMM99lHOPD8IiogpR23lDhcHbXwtembj3n/P0Z3j8yWaEaR7/07goTZSJmVdV9B+2RdYrwYX41ObfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pgw3UzkS; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pgw3UzkS"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530d8a00bcdso12401731cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:35:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790242549; cv=none;
        d=google.com; s=arc-20260327;
        b=TkkRP7zJO716sGefNzGten739LWlJ90oFJKAFAZRY3n+1/Z2DfdSuEgSiSx318cu62
         dDVT037w0pT5WPr1VEiuNRv8/FGLz/K0hlcOUw3Hb5/V64c9uPXCHd+8Par/jSUaZ/ja
         7aCr3DQf0vVv/uUC/PIVeo9oNyFkFDiru4YB4f87mfSShXF1WhvpkXAt6k5PtYYwH0uw
         E/XtoEH7sH2xvc080HaRsRN11Ky+IomTPRoEhm0fv9MjDL3QytSjA9f/KzV+lYlTLj0K
         T9y8CyYW3WsttSARTpA8w+JH1mE3bqrBxRI0wPFTKllWVVR9Ozia5qJrMNM/wOtByA7u
         Tidg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dObnSyq7Q524W//2DcmkBmFSB16ZHOQqAqIVcmv+gqs=;
        fh=Lk+TfCIZ3fb6ieNJqepbX3gel/Oooc5NIQEWcQTuntE=;
        b=gGA0CuLSwEWOiRSVAMesK0mCONjZ1aaweiBKsmt1tAqLw3pSZi0JFJc+VvJn4MQkHA
         30Z2jsz5qpd3Dll0uf6iCMvPSPVFFynxH58IXG6fMvtyTtFg6txa61m38zpflPlc1VGU
         VwfNaKMzJBqQiBImEwBJ6gK+craj66fhkklkzFLoBJy+TTSBSOHDxl2VXigprX/QbX3X
         pJ0jD0TxiYbi3OoeeLuFK9XJ9sAlwpQpL32MmDF3VuKTeLg5E4dWArS9u/Nobgvn7Qce
         nlmCUp7v2ApiUcO3EZSiQf47iH9QEZNvdTqwQ5yBYURwPiKL4FJXZMUSt3eAKNaReLro
         ag6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790242549; x=1790847349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dObnSyq7Q524W//2DcmkBmFSB16ZHOQqAqIVcmv+gqs=;
        b=Pgw3UzkSS5G509XDtJqprYWpMHuzkjGDqg5X7dxV3Dp+WSB8ESX59+UK7d2SHIYtK9
         HImH8TuzIeP4jOMVt8K1+R7goL2juDW53mGSZI1DwLU5TJD+gHRhbLU6wROxDO7DBZoh
         9ocuP577Znz1WXMC6p1Nmm2WNnR40JrRtTpIUduOiPYMwri/OBunGV9jZ6Rd9kF/Yxzj
         Oo+1LUdUwJLqcgrjIectGJDSH7l+yJ6B12ijGQTDAZjFAU0DDXpZIUzI9rnsSP51D4wQ
         tWqPwpQTPcEJIMFVgixtq0D5hhQfGg9Gk7a0VPJ1+ND/cDxyLZiKwCkq9tW1mnF49zdz
         MkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242549; x=1790847349;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dObnSyq7Q524W//2DcmkBmFSB16ZHOQqAqIVcmv+gqs=;
        b=k2o/E91BUTOJX05n/q/PScaqd61ZOmkPIiE8Hvu0sQ4bsjz4n1ihKdLNoeKjWh+Fxy
         m5XVybwvCSDVNt1NTMvbo17WfHWKRQBi5yvAk7/EadjpKOlEKHcRz9Yf0JePot2SaYk+
         IGJJhctQ3BOoUdRi0YYaEQZEQA6oUCZytybSgPg/zanTbmbkKJ+hlpZAbPfQf+kBMRn9
         pige8i2T4OTteYZc6Qpt2kIZcFKYZljatGjuBL93MVEu8dTzBRpcfhIE2bTSwMUK3l2i
         dx72WW0CuIxyQMotk0Baw7Qtf5F0WyEmSuq8fDOmomqTwzqOmBjVK4a4hpHx3VOInPii
         orGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcQWyUppoEdzJdrD3xngE1BfUgHSACn/uNX6obhlBLEuLmaG12jAugaB78+C0EyCba4QFiaGQ3iEsHPe8=@vger.kernel.org
X-Gm-Message-State: AFuF++mqZ8QgDF2A3wfDmdUrjds9cnGGDoJ2Fsst3b+KUCMSkYlZJGFY
	AwWSDYnxvnxNYzz1HoKDS2s3yEddAl90jllbZn5z7CuFHBLxNmZ0Taz+wNVcvcgFHC8HVzTsGb5
	ZA7s6Yzy/FyE9ZHQZWQR94ZBExrQdZISqqrahTnFb
X-Gm-Gg: AYBFou3znqAYW8cvK2qsaiHOhqFAonvaJ4FqZuYZqe8wrVGC9bJE+G2Zuay6slmmxKA
	7pB+k7u3pptJKXtE5EhLdE8AwxishSIa0Inm+X/S/MvhyhDoHT24XNdSHVL143rCQO30uJ7Mk3D
	Dcze/vFFXCoNTaLVwAsFbpR7xNEWFMdUHBG7ChLi+Ypvxl224mddZOV07iQ4fxgo0GvQ/JcsFKH
	RPNFeLXEbO7/VP7qcoeXW8gM8rpmkhgoixEAZFzv47F27kP4VRrVFhEGeTmmiYr50hUZGhzisKc
	mQVDR9Atz3rcBjGgtfWCdBZJUszRRmGW5fzOWoSJp8ENCQZggvBVmEncPPbYVASXr7PAhWYx8K0
	v6t8w7cRLXfkDEc5t4VaBCujD/0C+Wz+u5TX6NHVvlYY0TNGXLjc8LqI9qb4I9/uWTuoD
X-Received: by 2002:ac8:5e4e:0:b0:532:ddf9:c668 with SMTP id
 d75a77b69052e-532feb25f4fmr13958811cf.53.1790242548221; Thu, 24 Sep 2026
 02:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260920063419.3587332-1-yilinzhang@moonshot.ai> <8a9dff4063a2745653b7e88ceb745d75efa16e68.1790224474.git.yilinzhang@moonshot.ai>
In-Reply-To: <8a9dff4063a2745653b7e88ceb745d75efa16e68.1790224474.git.yilinzhang@moonshot.ai>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 24 Sep 2026 11:35:37 +0200
X-Gm-Features: AclHuK-rRRv07fF_euLQdzkSjhzPwlSUWaftcxHkR9xtjqpGBEK49dFgtxnRZ_k
Message-ID: <CANn89iLaofHpg9J8to+H7Z=Xs-rZfseziNN0vXBkE8zJ8DQcsw@mail.gmail.com>
Subject: Re: [PATCH v2] tcp: fix use-after-free of retransmit_skb_hint in tcp_send_synack()
To: Yilin Zhang <yilinzhang@moonshot.ai>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kimi Security Team <bug-report@moonshot.ai>, Weiming Shi <shiweiming@moonshot.ai>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 6:49=E2=80=AFAM Yilin Zhang <yilinzhang@moonshot.ai=
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
>
> Sync the hint to the copy.
>
> Fixes: c31b70c9968f ("tcp: Add logic to check for SYN w/ data in tcp_simp=
le_retransmit")
> Reported-by: Kimi Security Team <bug-report@moonshot.ai>
> Tested-by: Weiming Shi <shiweiming@moonshot.ai>
> Signed-off-by: Yilin Zhang <yilinzhang@moonshot.ai>
> ---
> Changes in v2:
> - Correct the Fixes: tag (Eric Dumazet).
> ---

Thanks for the fix.

Reviewed-by: Eric Dumazet <edumazet@google.com>
