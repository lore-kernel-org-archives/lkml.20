Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97234336884
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691927; cv=none; b=Zv04c+IoVkMbBIxlEVHr00Rv09cTTHF2kN5M2E4jZNDkfKXyfMgXq+UzBs8sBONrTljTFUJkkviME1UiZzdnPvtQP7JUQeOwo5KtCimACmJOKPuczVv97TbCg6LRxhiC52o/D5XA2N3U07wsLALvmCZvgLkAMmlzHgd9/JhMAms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691927; c=relaxed/simple;
	bh=E6fPwDdzy5LiQlZlar/Y+mL5JhfsBh0GO85CGQeu/vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMNbNyDNqhct4nuh6OZ4TGGyJaRUf+HV520x8/5pfRBuxbOB1TzfFANW/nquz6jvpW1luLGLmO+RtoX5B3Oyt81CFcKB14qTyONrFKT8zZKXLM5ZMV9FOMRNpbxHwGtBkp9m/PcYGuGCMiHCnLDuxWYFzw14INkeHJYWeGN98iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=UiWJ64jp; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="UiWJ64jp"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d37f94so88868a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1789691924; x=1790296724; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GhJozD00AthdOkRnEqQ3NsR2mVTBAHP+/jT0CI2Cd9Q=;
        b=UiWJ64jpGkGphARJEsNagOaQfmO5BKCaKyiGtXzplXf/vXZQmf2KuEEHTCgX+V4PCk
         NCmRwATSKiwhsHWUDtQJqWQsik9ag3hJKypMbbXYNq1mNucJn/Wm/5YrsjlR1tY1Z1UK
         d4yn5+jRA/TBKsGsmanM721FgkUXQWRoyH+jG/UJVmfGiGQ3U5gNpX0H1EyEEH2CYqfA
         BdL4berwnkKkoeqhLVOmyKX4dcG225jfXgt4aGcsNYE+jYl5jmrGVKMgco8Ygu9o3Xy3
         1nLK0/JQe3ejuVKIjMlAyN6fVv8DwA8gcbCJMF2+vLHKd/hKzXpB0FSrJyCpddAn3jQv
         9SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789691924; x=1790296724;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GhJozD00AthdOkRnEqQ3NsR2mVTBAHP+/jT0CI2Cd9Q=;
        b=hrL25wmDH/OV3CuW07pjkW92fubUZ5Q+tfUj1V+SCBqooIMp7mWxfOVbV/eqBzxHm/
         UkjnX0hC+9qBVW3m8riVhMYISA6gniTpSHlKWbchCecZ79i9UDiIcoNmb7mkkEyqR1Ic
         HaFuJGbKGwDRyI2YKZkoFVoKBImAxlVWzfuS/ymZ1ThihDCwHjJfOSItg3ol11ZApeCR
         ONwveu99TDjubgGcUo2+hPz10Gr5djy3KTPQYBgbQtwJjOQ+LKx7FUmQuB4+/2tgAxXH
         Jm8ngPz+nlGg3zbxzdE851CsZYCFXAMPqzj08ksr/v7i7aISt+S4mAbvWFDc+vY/A/02
         U/Kg==
X-Forwarded-Encrypted: i=1; AKwUvBzbOxVey+RkfJph2gBSR0CLVZ0or85vfC5PrwcoLFPAlrWYazupTiLGz7Xt3rTbk51lLKPRXobzRDNqP8A=@vger.kernel.org
X-Gm-Message-State: AFuF++lTjOyw7VGhn4TdhE4pqEqU4SQQCZfALDJGpUZ76HgjDvrIOShZ
	18K4ZFj0rK2Xk+50dFz5U0et15hhW6mZl11nu5BDob4MtWhNZz/CcCN5l+yHWZ4KPh8=
X-Gm-Gg: AYBFou1Zlz57X4W6CPB2vXOmezEbTwfObuUjUBBY7gF/WVmHKB3D7BlLZWHQHnEIP6T
	oWchQV1D/lEPMc4PdIGM/VJbnG3dgasZBT+eJDEk6JtxavfT4gTLjB9WuiWYWa33VftlG8Xn4OO
	PHIat9NaanIteVGF0H7Lew6Pe7ebAhrSg1w5lsRXwEGHtsu3DiS10yPnG84G5IpnN3hjzhXPsTx
	uuZ2kBCOq33PJAm57n9ey6Di8Aj+Q1B7aPPhJPRpGSCDh6FOiDi2IxOmdallKY5d5ndRy5ZPE9f
	us6fivsyOgtvZ2rtI1+z6mF08Bv4L6iXlLHAF85/E62YcxrgrfUD6xsINS4FyJHlKlt9uqh+XiI
	t6wtWL0JrjVwZ8yXJ9cYwQ0TRtIna2AshUkABfOBYBiaP3VAz6qHT9e4PWGndqm9rojFUtDSf+V
	ir13oM2LRDs8UMA0JQmGz1HWAtbNlw0+/nMKYPDRH88UQn9vzb4pDGlvQ=
X-Received: by 2002:a05:6808:13d6:b0:4b9:a829:f01c with SMTP id 5614622812f47-4ccf7debfcbmr1187229b6e.40.1789691924404;
        Thu, 17 Sep 2026 17:38:44 -0700 (PDT)
Received: from 20HS2G4 ([2a09:bac6:bf21:3064::4d2:22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80e52361af9sm120381a34.26.2026.09.17.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 17:38:43 -0700 (PDT)
Date: Thu, 17 Sep 2026 19:38:40 -0500
From: Chris Arges <carges@cloudflare.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com,
	horms@kernel.org, idosch@nvidia.com, kernel-team@cloudflare.com,
	kuba@kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org,
	pabeni@redhat.com, shuah@kernel.org
Subject: Re: [PATCH net-next v3 0/3] net: hash uncached route lists by device
Message-ID: <aqyIEE5bRoxRyrFZ@20HS2G4>
References: <20260917-hash-bucket-route-lists-v3-0-30493a37b6eb@cloudflare.com>
 <20260917221203.1811779-1-kuniyu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917221203.1811779-1-kuniyu@google.com>

On 2026-09-17 22:10:22, Kuniyuki Iwashima wrote:
> From: Chris J Arges <carges@cloudflare.com>
> Date: Thu, 17 Sep 2026 14:38:21 -0500
> > We have observed hung tasks blocked on rtnl_mutex while network namespaces
> > were being removed. The namespaces contained many network devices, and the
> > host had accumulated a large population of entries on the global per-CPU
> > uncached route lists. A perf profile collected during one incident
> > attributed most of the cleanup worker's samples to rt_flush_dev():
> > 
> > ```
> > 99.92% kworker/u384:3-  worker_thread
> >   `-88.71% process_one_work
> >       `-81.02% cleanup_net
> >           `-81.00% unregister_netdevice_many_notify
> >               `-79.42% notifier_call_chain
> >                   `-78.05% fib_netdev_event
> >                       `-77.92% rt_flush_dev
> > ```
> > 
> > For each device, rt_flush_dev() visits every possible CPU and scans the
> > global uncached route population while its caller holds rtnl_mutex. If N is
> > the number of devices, C the number of possible CPUs, and R the number of
> > uncached routes, the cost is O(N * (C + R)).
> > 
> > During namespace cleanup, other processes that issue RTNETLINK operations
> > requiring the RTNL lock can stall until cleanup releases the lock.
> > 
> > A minimal reproducer is available here:
> > https://github.com/arges/linux-reproducers/tree/main/rtnl-flush-storm
> > 
> > This series replaces each per-CPU uncached route list with a hash table
> > using the network device as its key. Each table uses 64 buckets.
> 
> This sounds a bit overkill.  Also, this series still leaves
> O(N * C) loops.
> 
> Given unregistering a single device is less common than
> destroying netns, I think the right approach should be to
> make the route flush once in cleanup_net() + outside RTNL.
> 
> Could you try this change ? (only compile-tested)
> 
Excellent, I'll test this and report back.
Thanks,
--chris


> ---8<---
> diff --git a/include/net/net_namespace.h b/include/net/net_namespace.h
> index 46b4c67e2966..d8ce7dc0fbdc 100644
> --- a/include/net/net_namespace.h
> +++ b/include/net/net_namespace.h
> @@ -489,6 +489,7 @@ struct pernet_operations {
>  	 */
>  	int (*init)(struct net *net);
>  	void (*pre_exit)(struct net *net);
> +	void (*pre_exit_batch)(struct list_head *net_exit_list);
>  	void (*exit)(struct net *net);
>  	void (*exit_batch)(struct list_head *net_exit_list);
>  	/* Following method is called with RTNL held. */
> diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
> index da5f881fbd3b..7fc9bf45f3b6 100644
> --- a/net/core/net_namespace.c
> +++ b/net/core/net_namespace.c
> @@ -160,6 +160,9 @@ static void ops_pre_exit_list(const struct pernet_operations *ops,
>  		list_for_each_entry(net, net_exit_list, exit_list)
>  			ops->pre_exit(net);
>  	}
> +
> +	if (ops->pre_exit_batch)
> +		ops->pre_exit_batch(net_exit_list);
>  }
>  
>  static void ops_exit_rtnl_list(const struct list_head *ops_list,
> diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
> index 8a3dc04e8cac..b8d76b6279e1 100644
> --- a/net/ipv4/fib_frontend.c
> +++ b/net/ipv4/fib_frontend.c
> @@ -1685,6 +1685,11 @@ static void __net_exit fib_net_pre_exit(struct net *net)
>  	nl_fib_lookup_exit(net);
>  }
>  
> +static void __net_exit fib_net_pre_exit_batch(struct list_head *net_exit_list)
> +{
> +	rt_flush_dev(NULL);
> +}
> +
>  static void __net_exit fib_net_exit_rtnl(struct net *net,
>  					 struct list_head *dev_kill_list)
>  {
> @@ -1704,6 +1709,7 @@ static void __net_exit fib_net_exit(struct net *net)
>  static struct pernet_operations fib_net_ops = {
>  	.init = fib_net_init,
>  	.pre_exit = fib_net_pre_exit,
> +	.pre_exit_batch = fib_net_pre_exit_batch,
>  	.exit_rtnl = fib_net_exit_rtnl,
>  	.exit = fib_net_exit,
>  };
> diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> index d7da2f1acbb5..d35b66b33bbc 100644
> --- a/net/ipv4/route.c
> +++ b/net/ipv4/route.c
> @@ -1554,14 +1554,28 @@ struct uncached_list {
>  
>  static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt_uncached_list);
>  
> +static void rt_replace_uncached_list(struct rtable *rt)
> +{
> +	struct net_device *dev = dst_dev(&rt->dst);
> +
> +	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> +	netdev_ref_replace(dev, blackhole_netdev,
> +			   &rt->dst.dev_tracker, GFP_ATOMIC);
> +}
> +
>  void rt_add_uncached_list(struct rtable *rt)
>  {
>  	struct uncached_list *ul = raw_cpu_ptr(&rt_uncached_list);
>  
> -	rt->dst.rt_uncached_list = ul;
> -
>  	spin_lock_bh(&ul->lock);
> -	list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +
> +	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> +		rt_replace_uncached_list(rt);
> +	} else {
> +		rt->dst.rt_uncached_list = ul;
> +		list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +	}
> +
>  	spin_unlock_bh(&ul->lock);
>  }
>  
> @@ -1587,6 +1601,9 @@ void rt_flush_dev(struct net_device *dev)
>  	struct rtable *rt, *safe;
>  	int cpu;
>  
> +	if (dev && !check_net(dev_net(dev)))
> +		return;
> +
>  	for_each_possible_cpu(cpu) {
>  		struct uncached_list *ul = &per_cpu(rt_uncached_list, cpu);
>  
> @@ -1595,11 +1612,11 @@ void rt_flush_dev(struct net_device *dev)
>  
>  		spin_lock_bh(&ul->lock);
>  		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
> -			if (rt->dst.dev != dev)
> +			if (rt->dst.dev != dev &&
> +			    (dev || check_net(dev_net(rt->dst.dev))))
>  				continue;
> -			rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> -			netdev_ref_replace(dev, blackhole_netdev,
> -					   &rt->dst.dev_tracker, GFP_ATOMIC);
> +
> +			rt_replace_uncached_list(rt);
>  			list_del_init(&rt->dst.rt_uncached);
>  		}
>  		spin_unlock_bh(&ul->lock);
> diff --git a/net/ipv6/route.c b/net/ipv6/route.c
> index 7535b09068a0..28233197e1e1 100644
> --- a/net/ipv6/route.c
> +++ b/net/ipv6/route.c
> @@ -135,14 +135,35 @@ struct uncached_list {
>  
>  static DEFINE_PER_CPU_ALIGNED(struct uncached_list, rt6_uncached_list);
>  
> +static void rt6_uncached_list_replace(struct rt6_info *rt)
> +{
> +	struct net_device *dev = dst_dev(&rt->dst);
> +	struct inet6_dev *rt_idev = rt->rt6i_idev;
> +
> +	if (rt_idev) {
> +		rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> +		in6_dev_put(rt_idev);
> +	}
> +
> +	rcu_assign_pointer(rt->dst.dev_rcu, blackhole_netdev);
> +	netdev_ref_replace(dev, blackhole_netdev,
> +			   &rt->dst.dev_tracker,
> +			   GFP_ATOMIC);
> +}
> +
>  void rt6_uncached_list_add(struct rt6_info *rt)
>  {
>  	struct uncached_list *ul = raw_cpu_ptr(&rt6_uncached_list);
>  
> -	rt->dst.rt_uncached_list = ul;
> -
>  	spin_lock_bh(&ul->lock);
> -	list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +
> +	if (!check_net(dst_dev_net_rcu(&rt->dst))) {
> +		rt6_uncached_list_replace(rt);
> +	} else {
> +		rt->dst.rt_uncached_list = ul;
> +		list_add_tail(&rt->dst.rt_uncached, &ul->head);
> +	}
> +
>  	spin_unlock_bh(&ul->lock);
>  }
>  
> @@ -161,6 +182,9 @@ static void rt6_uncached_list_flush_dev(struct net_device *dev)
>  {
>  	int cpu;
>  
> +	if (dev && !check_net(dev_net(dev)))
> +		return;
> +
>  	for_each_possible_cpu(cpu) {
>  		struct uncached_list *ul = per_cpu_ptr(&rt6_uncached_list, cpu);
>  		struct rt6_info *rt, *safe;
> @@ -172,23 +196,17 @@ static void rt6_uncached_list_flush_dev(struct net_device *dev)
>  		list_for_each_entry_safe(rt, safe, &ul->head, dst.rt_uncached) {
>  			struct inet6_dev *rt_idev = rt->rt6i_idev;
>  			struct net_device *rt_dev = rt->dst.dev;
> -			bool handled = false;
>  
> -			if (rt_idev && rt_idev->dev == dev) {
> -				rt->rt6i_idev = in6_dev_get(blackhole_netdev);
> -				in6_dev_put(rt_idev);
> -				handled = true;
> +			if (dev) {
> +				if (rt_dev != dev &&
> +				    (!rt_idev || rt_idev->dev != dev))
> +					continue;
> +			} else if (check_net(dev_net(rt_dev))) {
> +				continue;
>  			}
>  
> -			if (rt_dev == dev) {
> -				rt->dst.dev = blackhole_netdev;
> -				netdev_ref_replace(rt_dev, blackhole_netdev,
> -						   &rt->dst.dev_tracker,
> -						   GFP_ATOMIC);
> -				handled = true;
> -			}
> -			if (handled)
> -				list_del_init(&rt->dst.rt_uncached);
> +			rt6_uncached_list_replace(rt);
> +			list_del_init(&rt->dst.rt_uncached);
>  		}
>  		spin_unlock_bh(&ul->lock);
>  	}
> @@ -6795,6 +6813,11 @@ static int __net_init ip6_route_net_init(struct net *net)
>  	goto out;
>  }
>  
> +static void __net_exit ip6_route_net_pre_exit_batch(struct list_head *net_exit_list)
> +{
> +	rt6_uncached_list_flush_dev(NULL);
> +}
> +
>  static void __net_exit ip6_route_net_exit(struct net *net)
>  {
>  	kfree(net->ipv6.fib6_null_entry);
> @@ -6833,6 +6856,7 @@ static void __net_exit ip6_route_net_exit_late(struct net *net)
>  
>  static struct pernet_operations ip6_route_net_ops = {
>  	.init = ip6_route_net_init,
> +	.pre_exit_batch = ip6_route_net_pre_exit_batch,
>  	.exit = ip6_route_net_exit,
>  };
>  
> ---8<---
