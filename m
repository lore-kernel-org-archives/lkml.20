Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793078649;
	b=QynatCFF80tA2pYxRs/0ePrmaQcs2TDOPch7nhkxNFPOzpLtA/s9YAsY6TMUL3OHE3fI
	 60q3yByBDcBro1O+1i1yNd5xxHVaUJ5RoCVFK3Mfk3ru2qSqt0pj5ymK6Meb5xGx/pDfA
	 fYycWE3VR1BRFdipH1MPz3w6kb5puPlh9o5HJdZTWejQkW7H12+VJpyLiQj0ZfYeeZC4V
	 dYLVBkOTaCYSH1iep6107Rhs3BjmNKDm7y5pCqSIXd4SK5aQN1TrTYJsIkzoYSCFugSMc
	 tkE1lkGSlzEpnMFn44e9xm5RKX/rG3oXmArDz/9gEdkJXiSAR3pZDk/x8rSMjvcWDsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793078649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xeAWkq5Alu/mHalNdE2utUYKbLobeFhJLDwphT45bWA=;
	b=K6L2iYwBQg6puqQdUoSWRxDsX2vxuucoU8fSiQjRWBQe1aELjYx+91gePDsuEVsNTKUr
	 55/Toy6J6a7Fi5MVG8KZKksdzkhS6FC4dUavXSzuwIYb+QQnwac4cLonydbbn0befRrCH
	 ooVxm1kArjza0C7lG7CfUWlnBAWkA8/6bU/L8iUBs395YJ2aARSEINwsHwPjIMhazv8Dl
	 gk2uVkiSab/jJaUWWThvGyiztQTQhy5kr0gPWvGrKM9N60OTO7jCiD1TJix/4oJL+09m5
	 aVoWODwiDptdtOHzmczaVolkz56iN+q0+hM+BJrXmorKaqc8tMuKAcO+JgBKgv0aZWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=inGQFwot;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFBD606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFBD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=inGQFwot
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a06bc723b1so5216685b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793078648; x=1793683448; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xeAWkq5Alu/mHalNdE2utUYKbLobeFhJLDwphT45bWA=;
        b=inGQFwotqiHq2ADO4+3dmA7bfRluyd9vzegM7W2t7gIbd+cXyAJPjhLJjE6nPaVRuW
         nPqOWHqOfvuQu/uzHfR9J38/tTPz+G6Na3w2es2SD0WhaxYK6jngtdfN8pjnQc00DYh/
         LEXrayfwniWJ3NGj+Lp08Z2QWux+8Oqf36J9mKkNslcvmklL7IHQ6Leyft5dB6EHKmSj
         jQuFL9Tk7pxI0cQXq1JZeDojrDUwgSMVu1P5RnMVc5JqnGWEkfOn8lvapeOVil8frBsv
         gf4GLTkDgGuW0fGxy/IDcDRgv3G0znwCXmNcRl4/YxfK9nwNEDnOwW2r6vjv3Q2eQGdQ
         BT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793078648; x=1793683448;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xeAWkq5Alu/mHalNdE2utUYKbLobeFhJLDwphT45bWA=;
        b=OpSf1/YAitwLAndE19gq2Tjn1IfPRN+pY52tmyUmoZJlJvqMDBibd5fNAPJIrSy/tU
         qaJmjQ8eM0Z5uuU7pAPJumRKA911uJ5aVIZrZSvgtwR+hGoESqI/oCMHnN4LoFSksmh1
         S5EPVYhAKqHUY/HK50VYwnQyHKC56aPO3peIxEOBL8Mmm4h5O1jhSwuI5HPWQ/bwU6Pq
         b4UbF/A6WA/iqtbeDl5FFPggubmKOjl3NTnNK6q+RBWFzXUqqJmgZC+BJWpHSYILdcTC
         XGdivqJ63gCK3vGePRC4QUt1giiPg5N53UrazQ5xHKp111otYS1eJzodgnx/E1HI03y6
         sNjw==
X-Forwarded-Encrypted: i=1; AKwUvByx6JsPBbvKX6lfSs3FtUlHcltRALbURTsoD0GpmJK0x3NWkB28Wa9GNnRlK/3+Ts3iY8KFulkSy7TC7mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsSrnmIPTW1is1IF97yzdGFen+qdh4Q1EazVz4vWqO8YspS0w5
	pqxu7r1fIfY3x8yDiS/BaEYmAgu2AWNaT0bJmpiQ1dBkG9jBjY/Wl8hlB3tuB0ScNFIgZDehKGp
	xo+D6nQ==
X-Received: from pfh23.prod.google.com ([2002:a05:6a00:12d7:b0:8a0:7c0e:8263])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:8016:b0:888:2b10:e26b
 with SMTP id d2e1a72fcca58-8a36715c0dfmr7327494b3a.18.1793078647730; Mon, 26
 Oct 2026 22:24:07 -0700 (PDT)
Date: Tue, 27 Oct 2026 05:24:07 +0000
In-Reply-To: <20261023091419.167088-4-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023091419.167088-1-jiayuan.chen@linux.dev> <20261023091419.167088-4-jiayuan.chen@linux.dev>
Message-ID: <auA1EdaydKK-XgfC@google.com>
Subject: Re: [PATCH net 3/5] ipv6: restrict mld_qrv to 255
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Neal Cardwell <ncardwell@google.com>, Joel Granados <joel.granados@kernel.org>, 
	Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Wyatt Feng <bronzed_45_vested@icloud.com>, 
	Yung Chih Su <yuuchihsu@gmail.com>, Flavio Leitner <fbl@redhat.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, 23 Oct 2026 17:13:29 +0800, Jiayuan Chen wrote:
> net.ipv6.mld_qrv only has a lower bound, but ipv6_mc_reset() stores it
> into the u8 inet6_dev::mc_qrv, and every MLD retransmit counter derived
> from it (mca_crcount, sf_crcount, mc_ifc_count, mc_dad_count) is u8 as
> well. Anything above 255 silently wraps: 256 becomes 0, so no state
> change report is ever retransmitted, and the first MLDv2 Query received
> on the interface then trips the WARN_ON() in mld_update_qrv():
> 
> 	WARN_ON(idev->mc_qrv == 0);
> 
> A plain bridge with mcast_querier enabled on the link is enough:
> 
>   WARNING: net/ipv6/mcast.c:1327 at mld_query_work+0x1fd2/0x2cb0, CPU#3: kworker/3:1/2688
>   Workqueue: mld mld_query_work
>   RIP: 0010:mld_query_work+0x1fd2/0x2cb0
>   Call Trace:
>    <TASK>
>    process_one_work+0x93a/0x1b20
>    worker_thread+0x6d0/0x11d0
>    kthread+0x358/0x470
>    ret_from_fork+0x5b3/0x820
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
> 
> Cap the sysctl at U8_MAX, the largest value mc_qrv can actually hold.
> 
> Fixes: 2f711939d2ea ("ipv6: add sysctl_mld_qrv to configure query robustness variable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>
> ---
>  net/ipv6/sysctl_net_ipv6.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/net/ipv6/sysctl_net_ipv6.c b/net/ipv6/sysctl_net_ipv6.c
> index 1a0a36dcdabc..05a384680332 100644
> --- a/net/ipv6/sysctl_net_ipv6.c
> +++ b/net/ipv6/sysctl_net_ipv6.c
> @@ -29,6 +29,7 @@ static u32 rt6_multipath_hash_fields_all_mask =
>  	FIB_MULTIPATH_HASH_FIELD_ALL_MASK;
>  static u32 ioam6_id_max = IOAM6_DEFAULT_ID;
>  static u64 ioam6_id_wide_max = IOAM6_DEFAULT_ID_WIDE;
> +static int mld_qrv_max = U8_MAX;
>  
>  static int proc_rt6_multipath_hash_policy(const struct ctl_table *table, int write,
>  					  void *buffer, size_t *lenp, loff_t *ppos)
> @@ -229,7 +230,8 @@ static struct ctl_table ipv6_rotable[] = {
>  		.maxlen		= sizeof(int),
>  		.mode		= 0644,
>  		.proc_handler	= proc_dointvec_minmax,

inet6_dev.mc_qrv is u8, you can simply use proc_dou8vec_minmax()
instead of adding extra2.


> -		.extra1		= SYSCTL_ONE
> +		.extra1		= SYSCTL_ONE,
> +		.extra2		= &mld_qrv_max,
>  	},
>  #ifdef CONFIG_NETLABEL
>  	{
> -- 
> 2.43.0
> 
