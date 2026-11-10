Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299276;
	b=1Li/J+snFB3oTCR1SxVWH49fk62UMvDqPcBUj4ShYpFyugl+QfIgxYFJkZaEqBK6gnWf
	 ZseC87AEQY0GEgO/BBiQksfw5b+kjivF3z12VMHzobKqtx4uIn3oHgk2Cf42/PPWEKctv
	 EaKjZmAwxblRUCHjq5cRgT4ei9xsoiqE6UPThndhABq7EpRIvRCBmePSxWRdeD+XrnICn
	 onyfxhFDprl680Z9g9ySafSJmMuV4K4eh50cW97jd9TsleF+MMcOJhpZFOOIYWZO86h28
	 uUWyLClZzaTzYwfpYkEDnYCoi2js2Z42iNCWhEazYI1Ph5FkmtzKlyS9mVKeffCUgIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299276;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QVG84ywnvvvo4mhvznhN8Apw+WrF5iBUfJxBCISwA4g=;
	b=0lHaWf2bzxpYsr2I6vxcrKVP67QFIJt/ISxvLhIOxBESD19JZDpAHgAOygPsP3BRwPR5
	 MH/qYsiwrtnTMScQt/Vnab8HMqktxERM5ZiRGZ74vPlLZMc2Sc+EGKSHjPmBUlFr+cTqy
	 KX4xKv3Q8yvAtRy3whOF6jsc95vHFijerVwpSSQqiygZKWfWtAIDRFjmPXZ3ovN5xgjyl
	 YNJiywHqBSZLCcwdXOYvPHrEpgbg/SDw3qaCVtZc1HemnzkhpXGbP8MJMcWloaRlYyZhK
	 lvReu8E6q070Mvh76kO30N0JKLWARn50jcwA3Sd9bXItbWe4sesOg52/bf1PhF1hgHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sc3N4wsY;
	arc=none smtp.remote-ip=91.218.175.195
Received: from mta0.migadu.com (out-195.mta0.migadu.com [91.218.175.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9848E606A33E
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:27:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9848E606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=sc3N4wsY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/s2vkEvJeQPZcd9B+wkgpvWUhoTDAmhxYherM65EMfc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794299273; v=1; x=1794904073;
 b=sc3N4wsYqvfA8Zc/1gkRKERt/kqFqyIZ2+9kifSVGgwL/aY5vHq8yiK9Ksy/Os0CNLPMSVY4
 KCNvwRlXDRa1TKJ7CLuqpILesIVJmIt7kPqnyQs/0UgTr35fqin+sZ6oKq4pgeqsg7657x7aBpI
 iVMRCQMo/uWRo4HYUC19lTuM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id f3e52e94e0089280;
	Tue, 10 Nov 2026 08:27:53 +0000
X-Mizu-Trace-ID: f3e52e94e0089280
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 16:27:41 +0800
From: Hangbin Liu <hangbin.liu@linux.dev>
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, dsahern@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Andrea Parri <parri.andrea@gmail.com>,
	Stanislav Fomichev <sdf.kernel@gmail.com>,
	Nikolaos Gkarlis <nickgarlis@gmail.com>,
	Willem de Bruijn <willemb@google.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] rtnetlink: return EMSGSIZE when first dump entry
 does not fit
Message-ID: <avLVfWQEtsLH4BUA@fedora>
References: <20261109012115.11898-1-stephen@networkplumber.org>
 <20261109012115.11898-2-stephen@networkplumber.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261109012115.11898-2-stephen@networkplumber.org>

Hi Stephen,
On Sun, Nov 08, 2026 at 05:13:12PM -0800, Stephen Hemminger wrote:
> If a route entry is too large for the dump skb, the dump is silently
> truncated and no error is returned.
> 
> For handlers with RTNL_FLAG_DUMP_SPLIT_NLM_DONE, rtnl_dumpit() drops
> -EMSGSIZE and returns skb->len. With an empty skb this is 0, so the
> dump ends with NLMSG_DONE and status 0, and the remaining entries are
> lost.
> 
> The first dump skb is allocated from __netlink_dump_start() while
> max_recvmsg_len is still 0, so it is only NLMSG_GOODSIZE. On a 4K page
> kernel that is under 4000 bytes, and a 500 way multipath route does not
> fit:
> 
>   ip link add dummy0 type dummy
>   ip link set dummy0 up
>   ip route add 198.51.100.0/24 table 100 \
> 	$(for i in $(seq 500); do echo -n "nexthop dev dummy0 "; done)
>   ip route show table 100
> 
> The dump prints nothing and exits 0, although "ip route get
> 198.51.100.1 table 100" still shows the route.

One question. AFAIK, `ip route get` doesn't support "table" parameter. No?

Thanks
Hangbin
