Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB440928D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838154; cv=none; b=evkEOk+5qT9VCWg36znBCT1d6IuFO8ElfmyZKUgZ8SSvK8YwRmX9J6IjulnFpQWq53iGxsKK3lA/2MjqnmrldA3cjrxkoKHLF5g1112VmFAZ0FIH67r+vC6G93II8/G1tm41pOA3D0nF7Tbvkz6aRxI28OXfDqffbp19xvQm6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838154; c=relaxed/simple;
	bh=Jnsta+rzeP4pRDS9BbJWgQj9SR1Ch/rWz4YgMi4AxB0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RzqCI2xsVlTb6qysqXDGhPlMzsFzRDx8oxATCsJ6LARqSDW39CyylgxCK2ATTiX5Lj0XIU6M3eWdSJPceRm4ngHKb6PSH6knJPN81Z2duqwBIcv1fQkENCPQUnXQ+Q1rZHWbQb1QtJAjhUfI6wG15U0Pcv8rxf1JO0RyLxFjHpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GVcKXMkq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KV5R70wM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GVcKXMkq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KV5R70wM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787838152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lAk+QMGNNJtgvFGVN0ymbgGSoDsKOby2WpfQYyiXVyM=;
	b=GVcKXMkqY0qM5f+J5aUCVJL6M8U3TSLT9bEqsBDtX+j1ABfA1EhTvZt2nYnGM51w84tTh5
	kTKo89QKQmFcOcRbCwFT5eH7NMHGxEZmXDaxDDhYBWjser9xBm9PqviWt1D3gkzcOAS8g1
	VcGo/5ELyVNDeen3WiQCZelXhgA0fzg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-650-qJs6FsSCOgiI5e50IoeSfQ-1; Thu, 27 Aug 2026 09:42:28 -0400
X-MC-Unique: qJs6FsSCOgiI5e50IoeSfQ-1
X-Mimecast-MFC-AGG-ID: qJs6FsSCOgiI5e50IoeSfQ_1787838147
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49991beee7aso6701795e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787838147; x=1788442947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAk+QMGNNJtgvFGVN0ymbgGSoDsKOby2WpfQYyiXVyM=;
        b=KV5R70wM+ov76+p5f2kalpHwpxX4ZmriNQvvtZ0XaM/GlbHhe4B8ZlMGMVzPEWSXCj
         HLhHBnd0MlvHPw+AfsfLFXJ2FH5LLlZxRPflcn4qwwkZc0XyeZLbXsxYA/L59+NOtk7K
         JIYoH2F9MYy4ydLDBSzB0QdhZ3nN4Zpl1mnk7Wr+gGFudLGi+OsUFEJ2utEmAWLrz4pJ
         v1bfxHqz7/4Sh/TbSUpXgA9dVAj3t0tY4xeBwVV/SGHhAtyaH3L9ZpTHpfdha7bN7Evi
         lnK4+o94SllnACSvCgN+jIlHfTO/sI8XuwZJGEOip4Kog/ckGPn6aZqIyCYHWeVz1fhw
         8g8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838147; x=1788442947;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAk+QMGNNJtgvFGVN0ymbgGSoDsKOby2WpfQYyiXVyM=;
        b=Nt3d78jHzTQMTYHdVd514p5tlK19GNcFUqN57djdLnZGNKY1OH/XxXqsXDb3Uyn2ug
         w3/8kRuHTw7T3NCdFJg233Hcqp22qYxLN8PmfdZlt+NpY0iVg5jm0vkdabj11eqFBQBH
         HPtbzGDMiPKwabYh1u4ShzqF5ifZmjB2e40/v+y9SJ7M57bwM0cmLQOt7NKX85Czc5IZ
         JFYA7JArnuMApgdY0rrOQYBFPFtS72FJ5JHbkSdRpONg77efGxYLkfwY+46CBofApKGW
         xpH1yxHaCtT02zz5JcLMUY9iNBc0SwCNn5S9kLJ5nV1at+GoHXia8nWjKC9Jyf4DWZNA
         ECZQ==
X-Forwarded-Encrypted: i=1; AHgh+RoLCR0b1wD0bLkCUBig+kzT/iNGeVXt+RQTNUAOIC78hI7+kRWjqmi25IAgE08m6POUoePeXPnxNcDg38o=@vger.kernel.org
X-Gm-Message-State: AFuF++nceaixEONwKVvPhN3HTWMsx/VUuz2lNs7gKTVrxA6qOW/8zvjX
	1CbUNAlFUPkdstV7JtgSkxZR4ZpW16fy0mcyXec2MOPWuQ8mf/5zuawy6V64yW4pg3x8R1EBZNq
	Ro+3gj3D6jRM3gY8BZagU/E0hyZH6GCWuLOi0XlixiOVBIlLPPgA2pWPVbNQQIHtRYA==
X-Gm-Gg: AR+sD13QtRq+M6UPcK2fv0wjafx8G362JH6tX3ndBzoTN+F4uwS+mOR6sonRck2zy90
	jgKvU2VGKoGWvjZehY5cAdYsHn7lXaqteCIZmSESrahYgshNczBvGvs//X3xhpPHplAfDAXISTs
	gzGfl0QKQ/wD0+kCFUC7AGfherx2GKoeYVQvWJ0/2J6Q4Dmvf0sWBZUwuVhtUMrGmPL5YFWZpOe
	rgiHragLVAP1qrGq7bVhZEIAL/++xLueDp4b+C+TfP7mdesKvFLLbIj5S9gIscvz5cB9Qe3WLRB
	ilPM8pgqnA76AmS3THJ10uscjYRF8tjA4IQh4NeWcn6R3Dx6JFYy9vuQd16stKazwH37K47cgDw
	nz4r3oRKhSJ6H52BU7SJXg1cV8aDTCjDkURWlkBuq+/9Kfftux6aFs/a0YaDfCGE+PacPcgQ=
X-Received: by 2002:a05:600c:3513:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-499dc82c0d7mr177474405e9.12.1787838147117;
        Thu, 27 Aug 2026 06:42:27 -0700 (PDT)
X-Received: by 2002:a05:600c:3513:b0:496:bbce:fc with SMTP id 5b1f17b1804b1-499dc82c0d7mr177473885e9.12.1787838146709;
        Thu, 27 Aug 2026 06:42:26 -0700 (PDT)
Received: from [192.168.188.103] (ip46-47-231-195.pool-bba.aruba.it. [195.231.47.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499e7170b72sm107302285e9.0.2026.08.27.06.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 06:42:25 -0700 (PDT)
Message-ID: <d045bf04-be89-41ad-bd0a-b62fe4de8dfe@redhat.com>
Date: Thu, 27 Aug 2026 15:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v5 2/2] bonding: fix u32 overflow in compute_gap()
To: Hangbin Liu <hangbin.liu@linux.dev>, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Nikolay Aleksandrov <razor@blackwall.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Hangbin Liu <liuhangbin@kylinos.cn>
References: <20260825-bond_overflow-v5-0-7a800de133f1@kylinos.cn>
 <20260825-bond_overflow-v5-2-7a800de133f1@kylinos.cn>
From: Paolo Abeni <pabeni@redhat.com>
Content-Language: en-US
In-Reply-To: <20260825-bond_overflow-v5-2-7a800de133f1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/25/26 3:01 AM, Hangbin Liu wrote:
> From: Hangbin Liu <liuhangbin@kylinos.cn>
> 
> The TLB load-tracking fields tx_bytes, load_history, load, and
> unbalanced_load are all u32. At sustained throughput above ~3.2 Gbit/s
> over the 10-second rebalance interval the byte counters wrap, causing
> compute_gap() to produce incorrect gap values and mis-select slaves.
> Such speeds are common on modern NICs under heavy traffic.
> 
> Widen these fields to u64. Use u64_stats_sync to protect the per-cpu
> unbalanced_load_stats against tearing on 32-bit architectures, and
> div_u64() for the 64-bit divisions. The tx_bytes and load_history
> are protected in spin_lock. Also protect the slave load writing in
> bond_alb_monitor() with spin_lock in case of tear on 32-bit.
> 
> Rework compute_gap() to use s64 arithmetic throughout. Return LLONG_MIN
> when the speed is unknown.
> 
> Detected by AI code review.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
> ---
>  drivers/net/bonding/bond_alb.c | 52 ++++++++++++++++++++++++++++++------------
>  include/net/bond_alb.h         | 11 +++++----
>  2 files changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/bonding/bond_alb.c b/drivers/net/bonding/bond_alb.c
> index 0afed2c39231..9a43a1f47893 100644
> --- a/drivers/net/bonding/bond_alb.c
> +++ b/drivers/net/bonding/bond_alb.c
> @@ -6,6 +6,7 @@
>  #include <linux/skbuff.h>
>  #include <linux/netdevice.h>
>  #include <linux/etherdevice.h>
> +#include <linux/ethtool.h>
>  #include <linux/pkt_sched.h>
>  #include <linux/spinlock.h>
>  #include <linux/slab.h>
> @@ -74,8 +75,8 @@ static inline u8 _simple_hash(const u8 *hash_start, int hash_size)
>  static inline void tlb_init_table_entry(struct tlb_client_info *entry, int save_load)
>  {
>  	if (save_load) {
> -		entry->load_history = 1 + entry->tx_bytes /
> -				      BOND_TLB_REBALANCE_INTERVAL;
> +		entry->load_history = 1 + div_u64(entry->tx_bytes,
> +				      BOND_TLB_REBALANCE_INTERVAL);
>  		entry->tx_bytes = 0;
>  	}
>  
> @@ -133,7 +134,7 @@ static int tlb_initialize(struct bonding *bond)
>  	if (!new_hashtbl)
>  		return -ENOMEM;
>  
> -	bond_info->unbalanced_load = alloc_percpu(struct unbalanced_load_stats);
> +	bond_info->unbalanced_load = netdev_alloc_pcpu_stats(struct unbalanced_load_stats);
>  	if (!bond_info->unbalanced_load)
>  		goto out;
>  
> @@ -170,8 +171,14 @@ static void tlb_deinitialize(struct bonding *bond)
>  
>  static long long compute_gap(struct slave *slave)
>  {
> -	return (s64) (slave->speed << 20) - /* Convert to Megabit per sec */
> -	       (s64) (SLAVE_TLB_INFO(slave).load << 3); /* Bytes to bits */
> +	u32 raw_speed = READ_ONCE(slave->speed);
> +
> +	/* It's meaningless to compare gap on unknown speed NIC */
> +	if (raw_speed == (u32)SPEED_UNKNOWN)
> +		return LLONG_MIN;

Sashiko noted the above could entirely disable:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260825-bond_overflow-v5-0-7a800de133f1%40kylinos.cn

I think the v2 code for the above should be fine.

All other comments look noise to me.

/P

