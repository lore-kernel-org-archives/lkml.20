Received: from mta0.migadu.com (out-161.mta0.migadu.com [91.218.175.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06763B4EB2
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788494712; cv=none; b=poxzKzVUh8nOv/LfiCkZetSxJUpz3RTxJarxZ4Uv9vhRFEg++/ZSNrLZiMRrYwYE8kl2nL9K78TUrCstJ5UiZHm7/dQmhSvK8kVZuQTpsNMfos0VOq/JM8Jsc41jEQUGn4flO/Mq2NZhwuuRMPkYWlFkY0WNZVGPOqYLCQ/cEaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788494712; c=relaxed/simple;
	bh=ue4PnbHN0fEUQJXyiYl3vf1PZO/9AqEUw5hB1Q/aDAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q0IiOmT/JSCgixPGqLIcAC7JypvUJtuJKCPkkfdOVpzScculEz5O9wVH3vdCUUFfpz8x8AlCATr1hjhF7mgDWxwS18K1u4jjqj8WW1OvnGzOzZ7qZlJf2NfcsFxZT/gcZPKPXcLKiwYrTWBtntMa8hc78UmJUYo4jHthvXtp940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U4qf7bnJ; arc=none smtp.client-ip=91.218.175.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U4qf7bnJ"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ue4PnbHN0fEUQJXyiYl3vf1PZO/9AqEUw5hB1Q/aDAE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788494708; v=1; x=1789099508;
 b=U4qf7bnJOa+CTjq27DI6bmoSQkVEhcdcFA2wbsVvSPKj3/S02PjXQCEppYN5W9pUNz4ICAwk
 yaE3Hcn0weBNIpr2iWotp7dLyUU2/X9ILIIuVjCR1qw6i+9cKoSVzq+pN1UmUC00eU3oK/lC65d
 JnNt6VuScpoQsUI+w8vz4XCw=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 84c074122f8b22ba;
	Fri, 04 Sep 2026 04:04:58 +0000
X-Mizu-Trace-ID: 84c074122f8b22ba
X-Migadu-Flow: FLOW_OUT
Message-ID: <4ca21d05-87cd-4f76-ab39-0656ef372fa1@linux.dev>
Date: Fri, 4 Sep 2026 12:04:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: dropreason: add
 SKB_DROP_REASON_IP_TTL_EXCEEDED
To: Junjie Cao <junjie.cao@intel.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: David Ahern <dsahern@kernel.org>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904030112.450920-1-junjie.cao@intel.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20260904030112.450920-1-junjie.cao@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


on 9/4/26 11:01 AM, Junjie Cao wrote:
> The forwarding paths report an expired TTL or hop limit as
> SKB_DROP_REASON_IP_INHDR, the reason otherwise used for a header that is
> malformed (ip_input.c, exthdrs.c, br_netfilter). Nothing else in the drop
> path separates the two: IPSTATS_MIB_INHDRERRORS covers both, and the TTL
> check runs before NF_INET_FORWARD, so netfilter tracing stops at
> PREROUTING and never sees the drop.
>
> The Fedora bug linked below shows how that reads in practice. The
> reporter took kfree_skb(reason=IP_INHDR, loc=ip_forward) to mean the
> software header checksum check had failed, and worked through RX checksum
> offload, tc csum actions and both libvirt firewall backends before the
> drops turned out to be replies arriving with TTL 1. ip_forward() never
> verifies the header checksum; that runs earlier, in ip_rcv_core(), and
> reports IP_CSUM.
>
> TTL expiry is not a corner case -- every traceroute through a Linux
> router goes through too_many_hops.
>
> The three loopback hop limit checks in exthdrs.c drop with no reason at
> all; give them the new one.
>
> IPSTATS_MIB_INHDRERRORS stays as it is: RFC 1213 counts time-to-live
> exceeded under ipInHdrErrors. The drop reason has no such constraint.
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2517131
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

[...]

>   /**
> @@ -606,6 +607,11 @@ enum skb_drop_reason {
>   	SKB_DROP_REASON_PSP_OUTPUT,
>   	/** @SKB_DROP_REASON_RECURSION_LIMIT: Dead loop on virtual device. */
>   	SKB_DROP_REASON_RECURSION_LIMIT,
> +	/**
> +	 * @SKB_DROP_REASON_IP_TTL_EXCEEDED: IPv4 TTL or IPv6 hop limit hit
> +	 * zero (see IPSTATS_MIB_INHDRERRORS)


nit: "<= 1" would be more accurate than "hit zero".


> +	 */
> +	SKB_DROP_REASON_IP_TTL_EXCEEDED,
>   	/**
>   	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
>   	 * shouldn't be used as a real 'reason' - only for tracing code gen
>
