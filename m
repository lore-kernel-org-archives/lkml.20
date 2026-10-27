Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078760;
	b=YNGWUFj9JHzsksVHBagT9cG+BqzNdO3+Zxw1FftnXAKj0KyeXKlxR7DuuTAB5M0ffiEF
	 sOtSIQ5aQKiGYgNJC2CJUzftYnfG640ZVptKO/0vFLeMkzEgLwsXWVLpiPjrwZfqQP7mn
	 5wpd5DCjemEa2frt/PL7hj9UpY1/4eJBC/gemTZWAZhn/zCcC3eN+Mm5evjqCUZ4YBSDH
	 +3VKti8Zcd1DFYKaKLNHIAF1B4nApx//RXq+afHOdG6YQsLCwt0d6Fut4YgOYsox1iSXi
	 Bn43LJJZrvI/4GzUkkUWs/S5ToraKKdwgSN1S24HatOy5VkQtYWgTkbwsKMmf/HmJ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Pk2xdMK10hT40KD5CUAdEEdDpEBTBps9sOPk5PNQLsU=;
	b=PRj1rkT/EziCM7iyz1+2KnOrd+mgUp+JXJOfuqwllPDT74zsizFe9cVlEIBAjTrCqIdk
	 HGFL5Uv4W3lUuwLy0uX8hisMKeqa+uHQYjwTXSDRi7ONhyZcnj3zIy4XtfV6OLw0oR0Wj
	 UtoJvOvi3T2OPS19kgHRlEMF/rzRQFuXCxeNvU1hfUG3y4Xo4KGE8+8ZF9ZTtplLwJPbo
	 2+6Dq2BzI+hDxLbq+kYDWhZK39eeWMZRwjUqEXh/NiK/yE1AmQDNFw7DKDGsPUd6KU+jQ
	 MfhKr8JWRXEjtWvcEQ4z0LR/KHWOpv/1FNNXuTIMPrWdnsQ8JuulsSSX1NnPC9VM2Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=It2b7Pud;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33ED0606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33ED0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=It2b7Pud
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so2311696b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793078759; x=1793683559; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pk2xdMK10hT40KD5CUAdEEdDpEBTBps9sOPk5PNQLsU=;
        b=It2b7PudilbfTsxsLmxjKMc9ZlRpn2F3mIsvVt3rAIdZMPBYEg2ge/6H9h5zS/WOt+
         f/6FvW6nO7+nFqAIzmbaLmfkC9aT32BTcAYChDiomoOJs/vool4o8RtMPxcZoqHNAb+t
         EB+lOka7Iwq7n1zNbyE9tFQD2VBooyBkI8REqZuVMQefWmdBGuL3sExse32oZIkUUnCz
         R3l/pqR1iXAAmIK2wA03jXZAFXxuZVdclEV1DyJWHKz6KVVEyZwenwf/U5nq1/dwT3nD
         f4c0bNM2FgihF+2oWLwv7r9xMtJO3PNCF2mJoHNtTsoF2fSXadpAlcZZJab2j4AQYgIS
         9RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078759; x=1793683559;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pk2xdMK10hT40KD5CUAdEEdDpEBTBps9sOPk5PNQLsU=;
        b=KVTR7EhwjJ1PrUFbILkMP7Fbu698mXFJ9Da/Bb3gVY3YJ728NIy458BzMJjiNkLwxz
         8MaF2tj8ABPjLqtOB4Hwz1p1H5yQMOozRU7m5f4pM5iIt+rmX7Y7erfjTlpK4RWHK9zS
         73fbxXdTFS8fPtjzJQDXDAE6HeipZEqTl61USkuQL3Ak2UuFsuen6wHRLIpO54IfZpLE
         kOYugT+vsqnkorwvpoNtD0pWSOmDW3QJYajU/vlm6iy2tC5sdEnt+6I7RExyw/vjoika
         S169H288G4oukUQWLXPMwHx6yGmPQxyPk8xEonJvxgqiUzSBbEi/cgqhCMao2Wr+Cbto
         gUzg==
X-Forwarded-Encrypted: i=1; AKwUvBwNYDi4qv5eNmvRJAikTItFoTPq+61Mtf105VFcMrevi3xk8rZOdHswiBqUqG0B+NTC618podzK1UltO0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYILtLglQBJSsqFhZwvctO49lnrbYFpQugfwKcg3Yjb6LYiirEFW
	KvkLnO5bh5iHrB0gxY5NVu744El8zZwOnn+qVeeDsbX9gx/Ncp5FuY+Qt5ZN4KHLSdwQ0RlaMrK
	FunqJwQ==
X-Received: from pfch21.prod.google.com ([2002:a05:6a00:1715:b0:88e:a52b:ec70])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9099:b0:8a0:6414:a54c
 with SMTP id d2e1a72fcca58-8a3687bab25mr7459477b3a.32.1793078758343; Mon, 26
 Oct 2026 22:25:58 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:25:57 +0000
In-Reply-To: <20261023091419.167088-5-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023091419.167088-1-jiayuan.chen@linux.dev> <20261023091419.167088-5-jiayuan.chen@linux.dev>
Message-ID: <auA1zqalNB5UrXJq@google.com>
Subject: Re: [PATCH net 4/5] ipv4: restrict igmp_qrv to 255
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Joel Granados <joel.granados@kernel.org>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Yung Chih Su <yuuchihsu@gmail.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	Petr Mladek <pmladek@suse.com>, "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 23 Oct 2026 17:13:30 +0800, Jiayuan Chen wrote:
> net.ipv4.igmp_qrv only has a lower bound, but ip_mc_reset() stores it
> into the u8 in_device::mr_qrv, and the IGMPv3 retransmit counters filled
> from it (crcount, sf_crcount) are u8 as well. Anything above 255
> silently wraps. With 256, mr_qrv becomes 0, every
> "in_dev->mr_qrv ?: sysctl_igmp_qrv" falls back to 256, which truncates
> to 0 again in crcount, and igmpv3_send_cr() never puts the state change
> records for the group into a report. The older version querier present
> timeout (mr_qrv * mr_qi + mr_qri) also collapses to just mr_qri.
> 
> Unlike MLD there is no WARN_ON() here, the reports just go missing.
> 
> Cap the sysctl at U8_MAX, the largest value mr_qrv can actually hold.
> 
> Fixes: a9fe8e29945d ("ipv4: implement igmp_qrv sysctl to tune igmp robustness variable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  net/ipv4/sysctl_net_ipv4.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv4/sysctl_net_ipv4.c b/net/ipv4/sysctl_net_ipv4.c
> index e3760daa3470..ef631a2759b0 100644
> --- a/net/ipv4/sysctl_net_ipv4.c
> +++ b/net/ipv4/sysctl_net_ipv4.c
> @@ -33,6 +33,7 @@ static int ip_privileged_port_min;
>  static int ip_privileged_port_max = 65535;
>  static int ip_ttl_min = 1;
>  static int ip_ttl_max = 255;
> +static int igmp_qrv_max __maybe_unused = U8_MAX;
>  static int tcp_syn_retries_min = 1;
>  static int tcp_syn_retries_max = MAX_TCP_SYNCNT;
>  static int tcp_syn_linear_timeouts_max = MAX_TCP_SYNCNT;
> @@ -978,7 +979,8 @@ static const struct ctl_table ipv4_net_table[] = {
>  		.maxlen		= sizeof(int),
>  		.mode		= 0644,
>  		.proc_handler	= proc_dointvec_minmax,

Same, please use proc_dou8vec_minmax().


> -		.extra1		= SYSCTL_ONE
> +		.extra1		= SYSCTL_ONE,
> +		.extra2		= &igmp_qrv_max,
>  	},
>  #endif
>  	{
> -- 
> 2.43.0
> 
