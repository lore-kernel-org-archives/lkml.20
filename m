Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793459878;
	b=dmuVtXfVzCSdMYGnE4XasN4SwNvjS4T45fD1qCRIQjP7SfD6JWefgJbzckD3Od6S6TdF
	 dnUBov8FYgziV1E3Ysk4BfgdLtfTLE6brsHZXkGMDEOgnPIX3f0gP35BcIbdZm4xJ034/
	 p4ZgIoyIIjG2WZtRB/neKFZ9kyr3Tt6sywUoXl/Jda5LQQ19yIzfLvni902KoRROqYwYf
	 QOduNg17r8AjJ0gM/a50iIxH9hJnpXP3wVF1tXH2R1I8Pdt5H5jVfSVRe9etHBJKtNMB3
	 H9w6+csnwcr9ZzQGeTI0oZJuZ8AERoJnvHCgxWEQ0WfKkQD6kmApDOCPTx9datAoxVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793459878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dN72lJ/VYEAZ0crc14RL+WcfO3wLnaLimkA5461AVno=;
	b=Qfr/lk/BG+DnoO3pk7ErST5O2FWOYtBK+YKUw0NPPOpu7STom9m0mrbVU+GbPDuf8I91
	 GTnsWUNH9HLVE7SybjCIiDGYNf39fAr/+2PsGkQWpUgxh50LS9KW2iXANn5i6w7HLr1O2
	 pLWFycp1nSwpeZYxueVEgdzIxuuAadpmawn5PBj3Zerun3n27Jt2UAvWUS4XbsE40L8KY
	 QeG+7t/u8vGql8XYddf0i5aYaqI9LurIQWUOuWx5Z3swxG8JbI8MjOWxOw+BpT4kDbCUW
	 6pCFXTYGq8QwMR+1cC8n9ly8gJuSwaVAIWew5KTTjstNMC3BUEKsfHyWdAclYlq4LRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyH20fuy;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C00606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 15:17:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6C00606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uyH20fuy
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99061e2171cso364659241.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 08:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793459876; x=1794064676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dN72lJ/VYEAZ0crc14RL+WcfO3wLnaLimkA5461AVno=;
        b=uyH20fuyJrWkxeehR17ywV/R46gVGwq6Be66FbNIfTUj+WmJrjp9wOZVAsN89rGKDG
         hSoN5+J957cQonI4yORUn0OLdIeV7GnvEKXJsO2frsQ3QnfyCSwgHI2urODtPB5NvjNP
         8TSa8EBicESS7EACUcId0UsmjSyoT/uuAv8wZNIATG7AvFGvmkbkihR339fJwka7YNmo
         fK+p6kZ8nIzTJ/+tGYseljESvvfvsCb+1+mr0xO72waKBnslTmI4M/7s4DYYV0fVA9uf
         +Ad4wT4NF+vIDw4xqVXsJSDczWmvRdnaWJgXiwo1aKxoCL9/6EVFbQGlJ8Xn4g5sYPoV
         LLHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793459876; x=1794064676;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dN72lJ/VYEAZ0crc14RL+WcfO3wLnaLimkA5461AVno=;
        b=tqDgAlQOsXUx5CmGbtptX5hxNr9ELiGq+6W7xkDRpRMseSs8K0nxlHfL58N/oDz2Vj
         h6Eus99VPVkjPjE45AU1JvCWJImm5AUxTIKpxRRO31C/7L9yN4j8GBlBvOLKHTRojzg1
         qEt4hZUmeMYvaQyrp1G56ovorHw53n0S0C1PJ4E/ln5MkNkGULvj0PB1LKJb74eePZ6r
         H2AWla2S/8xzaY0siX5DdkvwCvkeTMAiasNFosDZRyyy4K7Ma1j4Wt+m9IHTACjhSXnM
         jOEbow8/4vJC4fIv+KWKwVc76GcRo3qPvjfdASGs26TZPWDoSEVVH42/7WMceSXe9fNP
         8mYw==
X-Forwarded-Encrypted: i=1; AKwUvBxspAx8ngj/yL7AlmyMk7CgWkyY5C9Lhk/xuZFFx6lp30OjMiH0RTcKXpJ5wr01yaJqIMwh9Sg4ZhR3MzA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpiP68hEVWy9t6a8BddVCae0WCF6AsEI9WfAl+tV+0G54uDYdU
	cRRQJ/+RJNcA/oRiyqvxcrf5VN6JRFNH0y8aBh4wAuAx4lrudw9hr/Cn
X-Gm-Gg: AYBFou1At/KCe74+tF4sW4shujOuNiwWSWmTk4acpgiJq6c774avlb8/F4+UKrc211E
	na9RaXupIg91Q5aav6gEnfsHawIM/gnO1UqnO2p2G58sUrHC9qhnB2UpSG2qcTzoaU/DeKjDw2u
	7GHoxPQBMTmqYRF1glqRaFEe6efsyNHA/6KYPXDrJCm8WLTd9Es2PIzm7IlsHzfoDMcM6Upn7dw
	YDNQHd/h1kbtubdQVKPTjShou1Jtp7TaQH6xRi2TVpkVGZ6NL8Papi1t6/+/2Won3a3OFXdQqAh
	RorUC6RTCHA0dk5FQV2xOgDVE2jOnaHQp8uNeWqpricdaUlB9nqIyStIzyAiaT/eNwVE8h0yCpo
	188+x5dlcUwIz+joWWfY0euiEjvhsxlrVZBH2b5aooZs4yWqSOBLFeCo71jTdtJOWcz05kcseMn
	ENFp9Xx75aEohDzOC3Pz0m/HJchLqZ/Yh8vqGPA0BNgGt3I3wemxGN8SCQRN1BL9CyNQWLnFCqM
	5VxnIHlLLpKeSW6mbHlJcYfoX2mKh3buORBDpe8/ac9Cjx5tJ2aLtPyaQvOaifukJH8xjwepZlO
	7fv3szNbzfGmr7Kj1FF0KoklhAvGYbFOq/HyjE1gcdpwzRBxEshQhKkjGRKq6qZTLbSLlcjI6DX
	yijxEka8MBdmhF+mnZqEeLHAO6MnUCSekCYkvYdPDzh/2RXdkcPCIYvjkqO36FYKVhqTzDIV4ml
	XsMYtbwfFsDb6xzg==
X-Received: by 2002:a05:6102:6058:b0:7c3:91f5:26f1 with SMTP id ada2fe7eead31-7d072bb31f6mr2253019137.6.1793459876557;
        Sat, 31 Oct 2026 08:17:56 -0700 (PDT)
Received: from gmail.com (111.46.245.35.bc.googleusercontent.com. [35.245.46.111])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d08f6bef24sm2625869137.0.2026.10.31.08.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 08:17:55 -0700 (PDT)
Date: Sat, 31 Oct 2026 11:17:55 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Ahmad AG <ahmadag1001@gmail.com>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: kuba@kernel.org, 
 davem@davemloft.net, 
 edumazet@kernel.org, 
 pabeni@redhat.com, 
 horms@kernel.org, 
 netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 stable+noautosel@kernel.org, 
 Ahmad AG <ahmadag1001@gmail.com>
Message-ID: <willemdebruijn.kernel.1a3f3b65222d9@gmail.com>
In-Reply-To: <20261031084316.387533-1-ahmadag1001@gmail.com>
References: <20261031084316.387533-1-ahmadag1001@gmail.com>
Subject: Re: [PATCH net v3] net/packet: account user-triggered allocations to
 memcg
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Ahmad AG wrote:
> A packet socket allocates memory for its user that is not charged to
> the user's memory cgroup:
> 
> - PACKET_RX_RING and PACKET_TX_RING: the ring blocks themselves
>   (alloc_one_pg_vec_page(), both the page allocation and the vmalloc
>   fallback), the block array (alloc_pg_vec()), and the rx_owner_map
>   bitmap of a TPACKET_V1/V2 RX ring. The size comes from the
>   tpacket_req passed to setsockopt() and has no limit other than
>   available memory.
> - PACKET_FANOUT: the group created by fanout_add(), about 1 MB per
>   group with max_num_members = 65536 (a 512 KB array, rounded up to an
>   order-8 allocation) since commit 9c661b0b8544 ("net/packet: make
>   packet_fanout.arr size configurable up to 64K").
> - PACKET_ADD_MEMBERSHIP: one struct packet_mclist per distinct entry
>   (packet_mc_add()), with no limit on the number of entries.
> 
> A process with CAP_NET_RAW, which an unprivileged user has in its own
> user and network namespace, can therefore pin kernel memory far beyond
> the memory.max of its cgroup. With memory.max set to 16M, a test
> running as uid 1000 took 525508 KB of system memory with 64 sockets
> each mapping an 8 MB TPACKET_V2 RX ring (1 MB blocks) while
> memory.current grew by 1024 KB; 264832 KB with 256 sockets each
> creating a fanout group with max_num_members = 65536 (memory.current
> +512 KB); and 46000 KB with 100 sockets holding 2000 PACKET_MR_PROMISC
> entries each on lo (memory.current +124 KB).
> 
> Allocate these with GFP_KERNEL_ACCOUNT, as other allocations a user
> can make on demand in the networking stack already do, for example the
> AF_XDP rings since commit b0057c68df71 ("xsk: account ring allocations
> to memcg"). vzalloc() takes no gfp mask, so the vmalloc fallback becomes
> __vmalloc() with __GFP_ZERO; it also takes __GFP_NOWARN, like the page
> allocation before it and the pg_vec allocation, so that a ring that does
> not fit, in the cgroup or in the system, fails with -ENOMEM and no
> allocation warning. These
> allocations scale with sizes or counts the user chooses. The small
> fixed-size ones, the rollover state, the per-CPU TX pending counter and
> the deferred-free work of a TX ring, are left unaccounted: there is at
> most one of each per socket or ring, so the socket bounds them. skbs
> are bounded by sk_rcvbuf and sk_sndbuf and are left as they are, as is
> the per-packet zerocopy state in tpacket_snd(), which lives only as
> long as its skb. struct packet_sock itself comes from sk_alloc(), and
> the netdev_hw_addr entries that PACKET_MR_MULTICAST and
> PACKET_MR_UNICAST add through dev_mc_add() and dev_uc_add() live in
> net/core; neither is changed here.
> 
> With the change each of the three tests in the 16M cgroup is stopped
> by the cgroup's OOM killer. With memory.max at 1G the rings charge
> 525436 KB for 525536 KB of system memory used, the fanout groups
> 262400 KB for 264608 KB, and the membership entries 26880 KB for 200000
> entries. These figures are from a KASAN kernel, which inflates the small
> objects. With 8 MB blocks, which always take the vmalloc fallback, a
> 32 MB ring charges 32636 KB for 32768 KB used (1G). In the 16M cgroup
> the cgroup's OOM killer then acts; with oom_score_adj -1000, so that
> nothing can be killed, ring setup fails with -ENOMEM and no vmalloc
> allocation warning. A workload whose memory.max leaves no room for its
> rings now sees ring setup fail or the cgroup's OOM killer act.
> 
> The missing charges were found by code inspection of net/packet/ with
> the help of an LLM and then triggered with a small test program that
> creates the sockets, rings, groups and entries and reads
> memory.current; the numbers above are from that program. Tested in a
> QEMU/KVM guest on the net tree (x86_64_defconfig plus kvm_guest.config,
> KASAN, MEMCG, PACKET), running the test as uid 1000 in a cgroup v2
> memory cgroup. tools/testing/selftests/net/psock_fanout, psock_tpacket
> and psock_snd.sh pass before and after.
> 
> Reproducer, as uid 1000 in a cgroup v2 memory cgroup with memory.max
> 16M: unshare(CLONE_NEWUSER | CLONE_NEWNET), then 64 times:
> socket(AF_PACKET, SOCK_RAW, htons(ETH_P_ALL)); PACKET_VERSION
> TPACKET_V2; PACKET_RX_RING with tp_block_size 1 MB, tp_block_nr 8,
> tp_frame_size 2048, tp_frame_nr 4096; mmap the 8 MB ring and write
> one byte per block. Compare the growth of memory.current with the
> drop in MemFree. The other two tests replace the ring with one
> PACKET_FANOUT group per socket (max_num_members 65536, 256 sockets)
> or 2000 PACKET_MR_PROMISC entries on lo per socket (100 sockets).

Please trim the commit message a bit.
 
> The ring pages have never been charged to memcg, and the membership
> entries and block array not since commit a9bb7e620efd ("memcg: only
> account kmem allocations marked as __GFP_ACCOUNT"); neither has a
> culprit commit. The Fixes tag covers only the fanout array growth.
> 
> Fixes: 9c661b0b8544 ("net/packet: make packet_fanout.arr size configurable up to 64K")
> Cc: <stable+noautosel@kernel.org> # changes memcg charging of existing packet rings; not stable material
> Signed-off-by: Ahmad AG <ahmadag1001@gmail.com>
> ---
> Tool use: an LLM coding assistant (Claude Code) found the missing
> charges by code inspection, drafted the patch, the test program and this
> message, and ran the tests in the QEMU guest; I reviewed every hunk, the
> results and this message before sending.
> 
> v3:
>   - target net as Willem suggested; stable+noautosel instead of a stable Cc
>   - Fixes: 9c661b0b8544 instead of 1da177e4c3f4
>   - leave the fixed-size per-socket allocations (rollover, per-CPU pending
>     counter, deferred TX ring free) unaccounted
>   - add __GFP_NOWARN to the vmalloc fallback like the pg_vec allocation
>   - give the reproduction steps and reword the Fixes rationale
> v2: https://lore.kernel.org/netdev/20261030100504.23498-1-ahmadag1001@gmail.com/
>   - cover all user-triggered allocations in one patch; sent with git send-email
> v1: https://lore.kernel.org/netdev/CAASqGyZ-9hqZGWNJShxnrSiXDO==51SVsQW_x_mk993y1pNO8A@mail.gmail.com/
> 
>  net/packet/af_packet.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/net/packet/af_packet.c b/net/packet/af_packet.c
> index cf6429f0947..3cec23a505b 100644
> --- a/net/packet/af_packet.c
> +++ b/net/packet/af_packet.c
> @@ -1778,7 +1778,8 @@ static int fanout_add(struct sock *sk, struct fanout_args *args)
>  			/* legacy PACKET_FANOUT_MAX */
>  			args->max_num_members = 256;
>  		err = -ENOMEM;
> -		match = kvzalloc_flex(*match, arr, args->max_num_members);
> +		match = kvzalloc_flex(*match, arr, args->max_num_members,
> +				      GFP_KERNEL_ACCOUNT);

__GFP_NOWARN missing?

>  		if (!match)
>  			goto out;
>  		write_pnet(&match->net, sock_net(sk));
> @@ -3773,7 +3774,7 @@ static int packet_mc_add(struct sock *sk, struct packet_mreq_max *mreq)
>  		goto done;
>  
>  	err = -ENOBUFS;
> -	i = kmalloc_obj(*i);
> +	i = kmalloc_obj(*i, GFP_KERNEL_ACCOUNT);
>  	if (i == NULL)
>  		goto done;
>  
> @@ -4494,7 +4495,7 @@ static void packet_free_tx_ring(struct sock *sk, struct pgv *pg_vec,
>  static char *alloc_one_pg_vec_page(unsigned long order)
>  {
>  	char *buffer;
> -	gfp_t gfp_flags = GFP_KERNEL | __GFP_COMP |
> +	gfp_t gfp_flags = GFP_KERNEL_ACCOUNT | __GFP_COMP |
>  			  __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY;
>  
>  	buffer = (char *) __get_free_pages(gfp_flags, order);
> @@ -4502,7 +4503,8 @@ static char *alloc_one_pg_vec_page(unsigned long order)
>  		return buffer;
>  
>  	/* __get_free_pages failed, fall back to vmalloc */
> -	buffer = vzalloc(array_size((1 << order), PAGE_SIZE));
> +	buffer = __vmalloc(array_size((1 << order), PAGE_SIZE),
> +			   GFP_KERNEL_ACCOUNT | __GFP_ZERO | __GFP_NOWARN);

__vcalloc

>  	if (buffer)
>  		return buffer;
>  
> @@ -4523,7 +4525,8 @@ static struct pgv *alloc_pg_vec(struct tpacket_req *req, int order, bool tx_ring
>  	struct pgv *pg_vec;
>  	int i;
>  
> -	vec = kzalloc_flex(*vec, pg_vec, block_nr, GFP_KERNEL | __GFP_NOWARN);
> +	vec = kzalloc_flex(*vec, pg_vec, block_nr,
> +			   GFP_KERNEL_ACCOUNT | __GFP_NOWARN);
>  	if (unlikely(!vec))
>  		return NULL;
>  	vec->order = order;
> @@ -4648,7 +4651,8 @@ static int packet_set_ring(struct sock *sk, union tpacket_req_u *req_u,
>  		default:
>  			if (!tx_ring) {
>  				rx_owner_map = bitmap_alloc(req->tp_frame_nr,
> -					GFP_KERNEL | __GFP_NOWARN | __GFP_ZERO);
> +					GFP_KERNEL_ACCOUNT | __GFP_NOWARN |
> +					__GFP_ZERO);

bitmap_zalloc

>  				if (!rx_owner_map)
>  					goto out_free_pg_vec;
>  			}
> 
> base-commit: 7b29287b182fc50518e9e65c41f86d24a05b7205
> -- 
> 2.43.0
> 


