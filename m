Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745821;
	b=tgwVDizooVADfdNlp0MLwgjELBXoSBuYsInyrJed3YRvv0Cnc8Wfq3XvzwB/RdRdHv4H
	 2Sh6VCAzOG1WN/9GupuAIGRr2wbJpIljIlmSlivMNe/keX1F0OYXnRSB8EwoHTcd4AfRi
	 oYy97jWfkpeZBAEwHz4DyU7lfL/O4GstW+YRyD+BVGsbL5HRrcrkmakYHmHx1KeV4iT1Z
	 1ySJ5vAnFHjAWDVKmrh4Y9D9CI9YXlvixMCkZe7V+9Qx8LFEGaUh4LMnMhrxbk2fLUjIW
	 T1EtVIhfTcziIS0H764Q+148f5f66REqBTl4zRopjyNP0vBu72cRJofBrhUHh/94JQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745821;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pSX9ZEKMZwAkn/hCnfPGUTygE8W+cQbUvjzhzK///rY=;
	b=gl2fEIrklVEciiIjKvH1fSV3kDgxfXrsIKJFLWJ3PAtgMTGcV6kUfKmuzSuph/2QSu5o
	 yE1RjZNj013aFnLaUNXF/Ih++UNcftXJG2Ec9XcQ5MjHfgR9ku5iTq+3CUbvEmQ3jnnKE
	 kaiNtC1h+Re44OcyltKeN8lbAoa5qqRNvHCn2ZXbz+Nja6IVgEBzs23l7OBRJWN4pnsi+
	 /SR19xunufva5DvrjgAYUivJd3iZpai+aSRlvhq5AXO/d3+j14Tz5el9u5NPRbkYphVCF
	 AdXK1NGcft2jCh5q6lEk7DFxNr0ea9L3zDgvKzGxWpbbux/56+AUJBFtgmOVPL/v9VQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbKXYRVS;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D44606D813
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:43:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6D44606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UbKXYRVS
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-369f126a526so40682eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745820; x=1794350620; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pSX9ZEKMZwAkn/hCnfPGUTygE8W+cQbUvjzhzK///rY=;
        b=UbKXYRVSlINnceEmcBZLntGOFm5h1Y6u19ZCL2iuz461uXDs/lkJ8Ft30u1wsxAckh
         0uArEiGHC5YoyKR6MHxSYmrVtUC4+Mc1jZ1wwXud8JXvPGzW9ZHJ7prEerFWXDG+yIEj
         IBdNNyX9BSdIbvaK2lILsfriI6VNcCRfcQZQuW+Id0c12gRA712+V2iEWSv40j9PRl8z
         exVtEELSOcZTiT1DYYir9r6Jo54p+p+N43N0fl5xjwnpJFMgnpC9ymb694sKrU4cDrJN
         dKKSv2VeDdj7NsDmG6DRrPslPYterr51oKQ8QU1ZkP9VZzA2kvNguuvVNGUjoY49y2dq
         42zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745820; x=1794350620;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSX9ZEKMZwAkn/hCnfPGUTygE8W+cQbUvjzhzK///rY=;
        b=iSysegcgMm/c5/9GzDFtwaQs0tT9JU9qNMnh5ysO/pKezgIPBBi36vwjWkEB/mWsaJ
         g2oIt1msETf2JGpMQf1iWKkKG2CIYfKCHZwEcrAWJg/5Uv4hdht1XcXqdKZeQ0QvJnXC
         XCBKrBVWAj8p4ShR+tRUgfT1t6jUKl0I4EXu4mVYRHaHZ//MsV51G2F8nL8rfsHIsqef
         7H0CcXrrc8mxDe3U7GNNCYCAzwBVYq7j8RIbITHre41bmpIfairo5q2+lMi3bYPEajPM
         Myo2dbI1L4nLRUriTul21+e8QS7wqlCecDh+BlmW9CsAYXTdF+viioVOx21JV5Ct5M32
         LCVw==
X-Forwarded-Encrypted: i=1; AKwUvByuEx/hpu6u5wjp6W/gAYnpf/nsGIHsb+uCSIday2Wat/LIVSTaHbNM68wETuz5FNfTdKsKKM2Ud55t/rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z87RoAnjDqfrUbxPG010Ayh97rw4r7p9/a/SrZoXrhrG/oH4Fx9
	RYz7ASCP5C/cFPVkNZ3Fr6q0e8sPEw9wBLHNSjj13AxKvDwFQcjAmJ8v
X-Gm-Gg: AYBFou2D+Hte+JI2TmbiWZvRjxEQHvNYYKelr8s7uW6yBktZcpxDg3F47HAsH9jEJfk
	F0U5E/rzj+q7L40DLY31hlhkqLXRWO+fGbfAzWyuzK2v4b8Hf2jqxTQZPVyAzPPvBWRSoxX3Vxq
	KLkwbEQrd06AeIB1T6S2ghrelxGf943wCMl7AN2TpdOeAI1Ngq33CyJr4ejZgOuVLIF2nsPga2i
	VV9iPU7IrFoNmQzVegQprO7rYwmwiCw0R9IF4qOJpKffxAzDRouUqe250tyniGYvl7IJE4P2OOb
	6efxE5m/mdFgNX+sPi0PuVrhy65ERrTZInqnR6Cn+bVkHRUZWpZA4VTJ7UiIUyi0X1BVrlCuEwR
	d8UT1SE47oCKaH+2P8bqZqbO/N+6LPyFVjfNd73C2pNK3/sVKmkJ+Y1w5wlBEpLO+xOiOU9mZpw
	XbF6jVipBWkgAQWsnxPoDNpOE4+6V7azWnPimkxv4YhuPyXOtLp5tEdIZIt1WlT2oLqHn4bywX7
	U71OLXlLWuDLK4HPUa2WRADd8TSDnCozi0lYaIdPxaWTrTU/45ff/b6x41cumlT0SORHPUuivyJ
	fMkXjjq0FGRXzhRVyOA7Ow==
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr21867108eec.3.1793745819838;
        Tue, 03 Nov 2026 14:43:39 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:6a::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3966daasm1484975eec.23.2026.11.03.14.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:43:39 -0800 (PST)
Date: Tue, 3 Nov 2026 14:43:31 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Mina Almasry <almasrymina@google.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Willem de Bruijn <willemb@google.com>, 
	Eric Dumazet <edumazet@kernel.org>, Kaiyuan Zhang <kaiyuanz@google.com>, io-uring@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, 
	"David S. Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>
Subject: Re: [PATCH net-next v2 3/4] net: add skb_frags_can_coalesce() helper
Message-ID: <aupjezBugEQe_OSC@devvm16445.scu0.facebook.com>
References: <20261102231827.4088254-1-almasrymina@google.com>
 <20261102231827.4088254-4-almasrymina@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102231827.4088254-4-almasrymina@google.com>

On 11/02, Mina Almasry wrote:
> Add skb_has_net_iovs(skb), assuming skb->unreadable and net_iov-backed
> frags are equivalent for now (with a comment noting the two can be
> decoupled in the future if readable net_iovs are introduced).
> 
> Also add skb_mem_provider_compat() and skb_frags_can_coalesce() so all
> multi-skb coalescing, shifting, and GRO paths can share a single check
> across pp_recycle, skb_zcopy(), and fragment memory providers:
> - empty 0-length skbs are compatible without mixing readable payload
> - page vs net_iov is rejected via skb_has_net_iovs() (0 pointer chases)
> - page vs page is allowed via !skb_has_net_iovs() (0 pointer chases)
> - net_iov vs net_iov compares mp_priv (walking frag_list if nr_frags is 0)

Maybe squash this and patch #4? Otherwise hard to follow :-(
