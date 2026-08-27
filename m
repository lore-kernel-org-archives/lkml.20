Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6432848A7
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787854857; cv=none; b=dexKtRVxCGlIseYtHuSgLp0FQWB/lsjHu+9TvwtMKFHd9U85KDsXvpDe2QcrYeK1LsPUt5a4w9EHPChST5JTavru1v1uRgtUsYx8avWZAzqHyagRDKqe5CIPQmhZiv5Nawi8RxQp5Ji3wZbY5aq1YXpV2OLpNVcZhZZpmHoouAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787854857; c=relaxed/simple;
	bh=sn8PKkmYUargx3UWaIj4mgRW20AqWgV974/D0iVAajE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=klXA6LPboRbfrREBIskSukNX5/tqFl3UhEQh58YdIihExM5rn2mu5NY5Tp19ABxY7FCnD03bjRX7ziZvb/DKnqx3CHLns7s/OqVzJMBWXeltVot+absgszj2Uv7cKsUykyBBOGPsje38x8E8VUGsc1CMWm98QpVpIP2ENujEpw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezIxvf1Z; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezIxvf1Z"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495590dde14so792255e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787854853; x=1788459653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F4DQbSgdABNqiVe3S7r5aOCmnkX4rZX4nC+ko1A83rk=;
        b=ezIxvf1Z8V65O9zv1xnZh3M8+HIyEt4cF2NDDDsHBJ/TJfblWQRV0+YioV4dLeKQ9u
         QNT5qkSrc3DoNpBNP9rmKH3Q28rTgGkq4M0AycfBsf1W5WvEfXj2mhbWw3ntsl0DEwvO
         qh4txKMOButyrtAEKO4w8t+XRyKOgLsBPhS1v5p+hvTpi18MqnuUWDeKs3fvQ61mpgUB
         a+jrHvfXx4W+jTr5a6wwiZvL/7lm5aM3JV97cjJdV3lOQD4nYnumG/I6t3SqrxiXvRt3
         QI8CzN5LUbUPOp++lBoSVmOED/KPV2ypgaRYQ1IZnbV643QzV+Cel78aw8ilrP11xTYp
         XZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787854853; x=1788459653;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F4DQbSgdABNqiVe3S7r5aOCmnkX4rZX4nC+ko1A83rk=;
        b=C3scCYmjbGUUeipNv5nn2UhInOGMoLik0ka474mSUAB7MJSSvoSNC5D4A2+2Mo8X9o
         tUEG8xRzGpguWJUgDO8arnn+dum7xc4DeGz264w4GLN4f/Ujs8z5548licERUC9lDmVX
         TkcTR+QBl5jU+w9yMMDZpZy3EaVMCjX704Q9ICDFkOSHMfkRAM0TgCIjXxAWbfAHa1F5
         Nlie/YHebHtepX6W0jhTyBaUWGNR84nqbm4rdnNcFb8XoFtTPa/Rv0xajTan/bVvdGpY
         sclkdEWgHsZZinb7tFX/GLyZReNYp6kOn5Y6EQNe0ZQ4Iv1JnSRiQfDAihFTPdsuXNAQ
         VLYg==
X-Forwarded-Encrypted: i=1; AHgh+RregmScbOPPCiyUsD0bDdzNIgk/e9cqM9k2w071b/FJg4UUgIy7Kyx7wymrmKg32biBKfuiHAFVWW/I9yc=@vger.kernel.org
X-Gm-Message-State: AFuF++loSQWn4CP83jQbfx1R/ZdZdlwvbvJGS1KmnrOfzuqbn9icYuha
	msJyGkGudb/OMiQ3MiiBVssz03WPBJU2YlqjV+2IJTKzon4FmJ2d0xHxJlA+DWB5
X-Gm-Gg: AR+sD12GL555ViKbljmigtEwOhysGvaVLDO0vCjY2yx/1Uhq9gf5yK97XZdDaiR8YML
	4mX9RVwuYkIV1R6x/tQkRKzw/1kIHG0DEUo3N7pqN9PozjwEeq9wNPIbH5X/H8d6CUfAJmc8yrj
	H1/I3SSyPL63vJektcccbObPldRo4gdoMsKxJppXxJu1ZUz6lKoChxvjm0Ps0Sa5nfOGX5ZBqnC
	K5gTnro5BPKYqaYVxMuNVxf1ecFnYyCVRhmbJvWXbcHqb2agx8rDLplEE/b6Gt/0Mb8G2t8Slrr
	VSkgjTL/gSmQwZGE1pydJlU5f5lP4SjyWeOJ5SuHxlXB0FHsDk+j9geGwnw/moTPmEQa6Z7hGNe
	a/frXPPn5aBt76bWCM9eoD8eBW+EJfiT0M8Qjq6BlWNsh/VaL/DnpmUReHnVUxOAoooPapqgQaK
	d82Gosf6IdUfk7YzjLk0t9o1Wa5iYfbkQr7YHrCNIYOfAiDKmU1VSd3OzrsABj+PcEg7dj8JK59
	X96oAZlNwZiKirmK0loCZQerQ==
X-Received: by 2002:a05:600c:8885:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b91c4884amr11871875e9.10.1787854853193;
        Thu, 27 Aug 2026 11:20:53 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91ca11d0sm4826485e9.1.2026.08.27.11.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 11:20:52 -0700 (PDT)
Date: Thu, 27 Aug 2026 19:20:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Nikolay Aleksandrov
 <razor@blackwall.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Hangbin Liu <liuhangbin@kylinos.cn>
Subject: Re: [PATCH net v5 2/2] bonding: fix u32 overflow in compute_gap()
Message-ID: <20260827192048.39ea95e6@pumpkin>
In-Reply-To: <20260825-bond_overflow-v5-2-7a800de133f1@kylinos.cn>
References: <20260825-bond_overflow-v5-0-7a800de133f1@kylinos.cn>
	<20260825-bond_overflow-v5-2-7a800de133f1@kylinos.cn>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 25 Aug 2026 09:01:30 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

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

How about changing the rebalance interval to either 8 or 16 seconds
to avoid the expensive divide?
Alternatively multiply the other side of the comparisons by the interval,
replacing the expensive divide with a cheap multiply.

David

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
> +
> +	return ((s64)raw_speed << 20) - /* Convert to bits per sec */
> +	       ((s64)SLAVE_TLB_INFO(slave).load << 3); /* Bytes to bits */
>  }
>  
>  static struct slave *tlb_get_least_loaded_slave(struct bonding *bond)
> @@ -188,7 +195,7 @@ static struct slave *tlb_get_least_loaded_slave(struct bonding *bond)
>  		if (bond_slave_can_tx(slave)) {
>  			long long gap = compute_gap(slave);
>  
> -			if (max_gap < gap) {
> +			if (!least_loaded || max_gap < gap) {
>  				least_loaded = slave;
>  				max_gap = gap;
>  			}
> @@ -1354,8 +1361,14 @@ static netdev_tx_t bond_do_alb_xmit(struct sk_buff *skb, struct bonding *bond,
>  	if (!tx_slave) {
>  		/* unbalanced or unassigned, send through primary */
>  		tx_slave = rcu_dereference(bond->curr_active_slave);
> -		if (bond->params.tlb_dynamic_lb)
> -			this_cpu_add(bond_info->unbalanced_load->tx_bytes, skb->len);
> +		if (bond->params.tlb_dynamic_lb) {
> +			struct unbalanced_load_stats *pcpu_load;
> +
> +			pcpu_load = this_cpu_ptr(bond_info->unbalanced_load);
> +			u64_stats_update_begin(&pcpu_load->syncp);
> +			u64_stats_add(&pcpu_load->tx_bytes, skb->len);
> +			u64_stats_update_end(&pcpu_load->syncp);
> +		}
>  	}
>  
>  	if (tx_slave && bond_slave_can_tx(tx_slave)) {
> @@ -1539,21 +1552,27 @@ netdev_tx_t bond_alb_xmit(struct sk_buff *skb, struct net_device *bond_dev)
>  	return bond_do_alb_xmit(skb, bond, tx_slave);
>  }
>  
> -static u32 reset_unbalanced_load(struct alb_bond_info *bond_info)
> +static u64 reset_unbalanced_load(struct alb_bond_info *bond_info)
>  {
> +	u64 delta, tx_bytes, total_bytes = 0;
>  	struct unbalanced_load_stats *p;
> -	u32 delta, total_bytes = 0;
> +	unsigned int start;
>  	int i;
>  
>  	for_each_possible_cpu(i) {
>  		p = per_cpu_ptr(bond_info->unbalanced_load, i);
> -		total_bytes += READ_ONCE(p->tx_bytes);
> +		do {
> +			start = u64_stats_fetch_begin(&p->syncp);
> +			tx_bytes = u64_stats_read(&p->tx_bytes);
> +		} while (u64_stats_fetch_retry(&p->syncp, start));
> +
> +		total_bytes += tx_bytes;
>  	}
>  
>  	delta = total_bytes - bond_info->prev_total_unbalanced;
>  	bond_info->prev_total_unbalanced = total_bytes;
>  
> -	return delta / BOND_TLB_REBALANCE_INTERVAL;
> +	return div_u64(delta, BOND_TLB_REBALANCE_INTERVAL);
>  }
>  
>  void bond_alb_monitor(struct work_struct *work)
> @@ -1597,8 +1616,13 @@ void bond_alb_monitor(struct work_struct *work)
>  	if (atomic_read(&bond_info->tx_rebalance_counter) >= BOND_TLB_REBALANCE_TICKS) {
>  		bond_for_each_slave_rcu(bond, slave, iter) {
>  			tlb_clear_slave(bond, slave, 1);
> -			if (slave == rcu_access_pointer(bond->curr_active_slave))
> -				SLAVE_TLB_INFO(slave).load = reset_unbalanced_load(bond_info);
> +			if (slave == rcu_access_pointer(bond->curr_active_slave)) {
> +				u64 new_load = reset_unbalanced_load(bond_info);
> +
> +				spin_lock_bh(&bond->mode_lock);
> +				SLAVE_TLB_INFO(slave).load = new_load;
> +				spin_unlock_bh(&bond->mode_lock);
> +			}
>  		}
>  		atomic_set(&bond_info->tx_rebalance_counter, 0);
>  	}
> diff --git a/include/net/bond_alb.h b/include/net/bond_alb.h
> index 6fb09b4fc7e2..32f1981033e4 100644
> --- a/include/net/bond_alb.h
> +++ b/include/net/bond_alb.h
> @@ -57,12 +57,12 @@ struct tlb_client_info {
>  				 * packets to a Client that the Hash function
>  				 * gave this entry index.
>  				 */
> -	u32 tx_bytes;		/* Each Client accumulates the BytesTx that
> +	u64 tx_bytes;		/* Each Client accumulates the BytesTx that
>  				 * were transmitted to it, and after each
>  				 * CallBack the LoadHistory is divided
>  				 * by the balance interval
>  				 */
> -	u32 load_history;	/* This field contains the amount of Bytes
> +	u64 load_history;	/* This field contains the amount of Bytes
>  				 * that were transmitted to this client by
>  				 * the server on the previous balance
>  				 * interval in Bps.
> @@ -118,19 +118,20 @@ struct tlb_slave_info {
>  			 * are the entries that were assigned to use this
>  			 * slave for transmit.
>  			 */
> -	u32 load;	/* Each slave sums the loadHistory of all clients
> +	u64 load;	/* Each slave sums the loadHistory of all clients
>  			 * assigned to it
>  			 */
>  };
>  
>  struct unbalanced_load_stats {
> -	u32			tx_bytes;
> +	u64_stats_t		tx_bytes;
> +	struct u64_stats_sync	syncp;
>  };
>  
>  struct alb_bond_info {
>  	struct tlb_client_info	*tx_hashtbl; /* Dynamically allocated */
>  	struct unbalanced_load_stats __percpu	*unbalanced_load;
> -	u32			prev_total_unbalanced;
> +	u64			prev_total_unbalanced;
>  	atomic_t		tx_rebalance_counter;
>  	int			lp_counter;
>  	/* -------- rlb parameters -------- */
> 

