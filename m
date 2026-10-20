Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792478126;
	b=H3yW+gqvtIf6KmVlwaj/GfG+i1jcc00LaepHcpQoDzlqhK8mP32a51kusDEPLKR5764E
	 cj9t8zbjxYgAuRC7FgzfCZvB8aUWESlDP93n6p4Wg52ASj8Kc35p4PtW/PxZI7V8k53Et
	 ehG6lXgsnhTxtatES9u2R45yv/+2+phh1+7yrNlVJ9jozCJijwSj9N3yyMhgmPnSrE/24
	 Y59vFTXjRngKg61HuaNVhVEVrvUelWRtBWpc//YXxxVUCBPKsAukZhlTVP3NmlAtwk3Kw
	 9HYh+oOvOI/XKGk3/L496UzSi0BAQgJZDhjpSVYkZauzU/cwTC9AKAWT0UcZXzVl1rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792478126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OQoTQKp69zwalft8c0xKATXGQMtLqX55wVubm4cBdtk=;
	b=m9Ou3NwC3oLvaPNpf5ypOUzO7m5LqB7IqTh5M5voG683Q0ybdyoCMsq+b0iVHVtgZWM+
	 Vkc/KEI7uEGz8FgOfixMhoyImRjnSQa+YGY0TITgsMAf6Jsq0YalRmhvJknaSq+nr4lkp
	 bj4zEG38GrMmxTH+s1Fde4nd0YOu2WO1Jm/x0qlcDfUyLfyIKKf8lhiH8JrXPCQbUGr3k
	 cGXu3g6obN/ik0ZDWWI5y8twJ/VOUXI5Nkv3clExd+B15KYT/D7GyI0rfXLDsDYpYaNqn
	 WyVQN9l7ybTAeJoOAkFuwnlhLmnFPCkESvnptqZdzJxnM8wqYgfkbERhuzMUXREebRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JZ74QMfw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6B6C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JZ74QMfw
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bccecba199so2691695e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:35:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792478124; cv=none;
        d=google.com; s=arc-20260327;
        b=OIehUzTxLFtEOS00EJ+UFLANHRTkafzxk9LWJvLwnS+vkJcyNTVH01fPw1y/sWTt6D
         yWzqf39jTY+ipWKXAbipXt9TJUyHkkVAakbYdQPGuECj0oOtUZAqJ5WHT4hKRX445JGm
         Dwrw7YhTPUa8IpCIT1xJZA/QcMPHacvE1YbNkQtAPqPWlaHdNFhKz7/TKZif3HSjWPpj
         OPI0oRTW0T+2BoWlm3iU6adfWabbvMc459fitmY5ogPa6TdTwN+YWesEi3NVbzcE0+/A
         mEWAFq9RuQCYjv3DorXwlwzd82p7ihyEe65ri8iEXsurc3lh7ThWjUb+f0riBAIBRpUb
         XICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQoTQKp69zwalft8c0xKATXGQMtLqX55wVubm4cBdtk=;
        fh=XTBzUWRxGa9NO9zi62B6ZZ3aHn+Hz5pvaqKZoZWMTTg=;
        b=MuGN7LKeQrFpbLY1YhcLQP7nRgN/mIvHtIqHoZrXKVETjwAHK/OxL1yo/QL/9JrPI1
         OSGO8a4yzfnooLTVBdj76ztGnQqRl4IpP6On1XowhHJp5aR9S6WKYSv5nEMBWYw6heeN
         2p3bEdjXy+S+2G1iUUZVdrAve8uU9ck2i2fU/vYo/fMmKyU3XjUz+BeABl/BLMacSeuq
         BA5xZyD7WJB7ND8aSgD+cilIfxQjzHtqGCCl3vWnQAg+HDZPtHGaGhv3Qjj/YeQDpQNy
         SPSzkNUXBR08xBsb4Isjfsvoy4ByFRHGmac6JP4LdLzd4Ptyqs8z82hfbP9eCCmNY+aV
         G3Vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792478124; x=1793082924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OQoTQKp69zwalft8c0xKATXGQMtLqX55wVubm4cBdtk=;
        b=JZ74QMfwflYx2KrfRKL8OB86rBTNIBBLbD5SeLzYwVnY8gnkr1s9daBAnTD3CO0m+S
         QUxp96nRchqvrU+TnMXPan2qGkVvlBeNZETERxhm5D9pvIYSNBNOcmGhgEzJad1ljQHX
         jilHJYy3udvhIwIzqDh6KELFoCDGXpLiF6/g2Qt19tPUHBArURe1TO04cfiX39/v5PC3
         gB9I61/aRSvenkimYYwEl+eyu7lBgrr6VRUBV7JFVIX/8UGASPGsy3ub4a0cSfareBOj
         HGs156cv5HWcQBmySBMPg/ZxNC/uOKeNheJr2yi8qhdDVQT7pZ1/x6Uot+nkz2y8ltxc
         PIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792478124; x=1793082924;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OQoTQKp69zwalft8c0xKATXGQMtLqX55wVubm4cBdtk=;
        b=a3WRSK3ldsOKIWzQ/MdeDUpXrQLGT+LMvQenS0FKSrBvH6TQrOXz3rJWktDjaa14O7
         igO8Lv1wGcfSyYP2Yz39/TAq6LTCIFPmIQiCH++xIKSvFu3NibesFDp/sqVkp3f+iWrU
         Fm10bfFgEW73ZFS+amO1w1oUEwomkVJsVrCFgIBRBqg/TF8qQ2Vxqo9QHANfRT+RH644
         Oe2DHHkUEANXRIajIsYe7tNWv0jxMylShFiDOwNooNlwQKVfhJKc7DxkjsgqK5CAeGS+
         TlgBDkJMaZiwW3TaUbqJCAbAkEEUq3RPVjSHCsQR+2WnEZR2EkrFQvoJhwvgmmqPJSWq
         e0wA==
X-Forwarded-Encrypted: i=1; AKwUvBzdJ4iRyiSgWPE/x2lUap+VB3IhMiuH/cHBj+hwBT16Hbtq809LGM1UP2G6nX2/Kzp2weQageBP1MtoVU0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLNENwcd7HVZBJexf6WZJAc2mdMRZvx7xolVtzUA3wllqJx8GT
	cOd/iCce4dQ22F2XHZHsu81t84Dtbjwm2zpsdIv74C5+aeOXzEXMJmqVjcyZAeGQsa5vCqVXBWy
	EQf5j4Ou7gTz8H4Qb5Yk4+J5v0rhymon4Nxef
X-Gm-Gg: AYBFou0Vo2TDYkKTi2jRbIE2gbe8MjP/bi+9VnN8ibWbARCxXIaIpl83I/gwRvngEDn
	0TGOUIgEy5PvoO2UBklwwu8RwCk+K1uSEMa5xF4KWmTw+ToVqMaPIcOJnX5biHMBsIl3a9cAf+9
	Q+QNH3rzcWjhtGlsZNdxFNJ3+dJUkn4eX2Wwu3o88j4SPQrETIvm9ZY9UCwIf/WpMVoktPwCuJE
	T29/BP58AFgCWjyBR8srY27Lamojg4Co2uTQFiB+YHf8xHrD6qibQUmhuc4Cl9q0QJRClvDLylG
	1cp49ABFEFpOmJo2IrezQ5WXxVh4Laucz9otwZrdFNFAxT8ZAH7PU6ilF8v4AHMYI2sUuCbNtzU
	a44SqH+OlWJPa2Z477Ah81Sgjbhob2iVN5bHOZBoCycR249GxaY3Pvc2nIimzCUkD7lZu5A==
X-Received: by 2002:a05:6512:3da4:b0:5bc:d9d6:6aa8 with SMTP id
 2adb3069b0e04-5be50a49e8fmr3342745e87.23.1792478123701; Mon, 19 Oct 2026
 23:35:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019230758.2960779-1-joshdon@google.com>
In-Reply-To: <20261019230758.2960779-1-joshdon@google.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Tue, 20 Oct 2026 14:34:46 +0800
X-Gm-Features: AclHuK8Z6eedwZFjydm_QKED12xWeIvXORddk5spHPuvKLcq0T7ga9yYuVAKwaY
Message-ID: <CAL+tcoBjWDwA+MrjzRapUeAom-4siL-cnXXLQrVf-A4myNRxyg@mail.gmail.com>
Subject: Re: [PATCH] udp: Add noinline_for_tracing annotation for udp{,_v6}_send_skb()
To: Josh Don <joshdon@google.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 7:08=E2=80=AFAM Josh Don <joshdon@google.com> wrote=
:
>
> We hook udp_send_skb() and udp_v6_send_skb() using BPF fentry programs
> to monitor UDP transmits. Both functions are static and have two
> callers: udp{,v6}_sendmsg() and udp{,_v6}_push_pending_frames().
>
> After an FDO profile update, udp_v6_send_skb() is now inlined into
> udpv6_sendmsg(), while an out-of-line copy remains for
> udp_v6_push_pending_frames(). The fentry program still attaches
> successfully, but it is silently bypassed for all uncorked sends.
>
> To address this, make both functions noinline explicitly for tracing,
> as was done for tcp_drop_reason() in commit dbd5e2e79ed8 ("net: tcp:
> Add noinline_for_tracing annotation for tcp_drop_reason()").
>
> Assisted-by: LLM
> Signed-off-by: Josh Don <joshdon@google.com>

I actually mentioned this thing a few times before. The original
thread was from Breno who tried to apply a similar change for tcp
sendmsg. The fact is until now we don't guarantee those functions
should be kept noinline like how uAPI works just for BPF prog. What I
suggested was to select a series of functions in one Doc so that we
could tell people those functions should be noinline or whatever else
just for tracing in a soft way?

Otherwise people would argue there are more functions that should be
done in the same way because they internally trace it.

Willem, Kuniyuki, any thoughts?

Thanks,
Jason

> ---
>  net/ipv4/udp.c | 4 ++--
>  net/ipv6/udp.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/net/ipv4/udp.c b/net/ipv4/udp.c
> index b090bd1f59e86..487c8cc8ab206 100644
> --- a/net/ipv4/udp.c
> +++ b/net/ipv4/udp.c
> @@ -1110,8 +1110,8 @@ void udp_set_csum(bool nocheck, struct sk_buff *skb=
,
>  }
>  EXPORT_SYMBOL(udp_set_csum);
>
> -static int udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4,
> -                       struct inet_cork *cork)
> +noinline_for_tracing static int
> +udp_send_skb(struct sk_buff *skb, struct flowi4 *fl4, struct inet_cork *=
cork)
>  {
>         struct sock *sk =3D skb->sk;
>         int offset, len, datalen;
> diff --git a/net/ipv6/udp.c b/net/ipv6/udp.c
> index 93478d1ad5769..fe92538835176 100644
> --- a/net/ipv6/udp.c
> +++ b/net/ipv6/udp.c
> @@ -1366,8 +1366,8 @@ static void udp6_hwcsum_outgoing(struct sock *sk, s=
truct sk_buff *skb,
>   *     Sending
>   */
>
> -static int udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6,
> -                          struct inet_cork *cork)
> +noinline_for_tracing static int
> +udp_v6_send_skb(struct sk_buff *skb, struct flowi6 *fl6, struct inet_cor=
k *cork)
>  {
>         struct sock *sk =3D skb->sk;
>         int offset, len, datalen;
> --
> 2.56.0.212.g129ede20d9-goog
>
>
