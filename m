Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870795;
	b=RRoYh9Uk3NpQkmNWpqCe6TIb1yqpZRlCnD/frt7CVMy4APGuV0gg4kUqMZo0mASi17O+
	 Z89gAMxNG58N7XyT54R4dF0Js0PoLBokP+x44v0xayAP71XeLtNdxeujZJpuzg9ufsqXw
	 cJAisj/HrRxHi1ocqHAnFERwsCAvIvw8i/B7HY36lFW/oN14nxn/EQknXnNtly3kxqC8s
	 4KQzyzOwSaLG3ws/77tbE4u2Aw1i5k52WJNhmFd+MMi7jKdaNn4tJ0VEnY8FIs+LSDJ5D
	 Q/477FpEDxY2pd4kM9JTx7i94nkcENT1IJ/J5X0TJ43aZLKu6Z1AZJOEgkM08rGsQjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870795;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=62FjuaSv/CoY2DJG0NpGvFb8HNRjYJTClGUN+rIzhJs=;
	b=oNe9+iCz7YcnPmEeg/Qyx6teDtLayJAPrujzNl9lbQeQseRE0zsM/ZjgYOa/UjhfgjZf
	 irWrxvTZ/RzqzJU2l8ltFqR2gk6r9IAKt9muhUyK6eXJ+3paKCe9hh8S8mCpTlRiDdFqI
	 z8HwxbKIDBjTz1nTdsgMj+OJJouT8aD9gacTx3nFP/RvVQ8/qk5Zkgtx8LPn6kza/uldA
	 Gpmi7o0KxZ6i5i/arlvRN8wSJ4n2IV0VEsUDVCYZG5CRsd2xD5RwU/iHr0HpMYm9tLmJY
	 Va3Q265TnNQymVQd/eEweZJEJSjkLXcLhdRCvZkuvxJTmPKv3OoPN6Sj+HuZp0xIT/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0cLesoi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEB3606A329;
	Mon, 16 Nov 2026 23:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M0cLesoi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBC081F000C5;
	Mon, 16 Nov 2026 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870795;
	bh=62FjuaSv/CoY2DJG0NpGvFb8HNRjYJTClGUN+rIzhJs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=M0cLesoi15YLfiYuGWXkPxGO+ZBjBj9H4ZjGC+b9tIJN+Ncfi83VAl7ROHI4uKOS1
	 jWJsjAq+yr2ql5c91IhCqisC01fKzSSzRDuNEBRsPkbh5l6NYiOMgA0OY/NGHXqb+r
	 UTisOhw4m+zbhkCqUUEd3+K1IVL/BWAc/HfKUKsi75V1CPb9pXMxoSRWp0NcZblQye
	 FaQPj50gyng0c2Rq26FNiYMZR4jrqAnkE29jHedzjdbUEOHalRdynO4D4fap2V3olh
	 +C2kW+qhLOfO6681koxS8xSE1CW7erR2uQgNp80FBkOUYF/CXcr1Kich/w/fD1CNcR
	 EIMZwLRCazstg==
Date: Mon, 16 Nov 2026 15:13:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Qiliang Yuan <qiliang.yuan@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, Nikolay Aleksandrov <razor@blackwall.org>, Kuniyuki
 Iwashima <kuniyu@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 3/4] nexthop: flush cached routes when a
 nexthop leaves a group
Message-ID: <20261116151314.3f567536@kernel.org>
In-Reply-To: <20261109-bug-net-netns-move-rcu-barrier-v3-3-6084b02610b3@linux.dev>
References: <20261109-bug-net-netns-move-rcu-barrier-v3-0-6084b02610b3@linux.dev>
	<20261109-bug-net-netns-move-rcu-barrier-v3-3-6084b02610b3@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 09 Nov 2026 03:18:14 -0500 Qiliang Yuan wrote:
> @@ -2109,6 +2109,9 @@ remove_nh_grp_entry(struct net *net, struct nh_grp_entry *nhge,
>  	return false;
>  }
>  
> +static void nh_rt_cache_flush(struct net *net, struct nexthop *nh,
> +			      struct nexthop *replaced_nh);

Nit: is the fwd declaration unavoidable? Can you just re-order 
the functions?
