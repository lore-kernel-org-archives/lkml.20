Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0043AAF45
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788271762; cv=none; b=Rg84TEE+kmz5HDwDi9u5Ok9i+XguIlripq3NYbLfg/Lal7GCDQSS2VKLQtks+K5US/N7t808AJhMa7FXP2eyX45Rt2uoVtWOHT+cBXfxcX9qRhuCQ3MGAbmnXJhrRrywCrHchzoKazSzequQ5F8LxylyDovYJ4gkD+BLBeMuGpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788271762; c=relaxed/simple;
	bh=C66dzNAiLxzxkCBjY2wVJtqAWhkFkdYcJ7WYBjNLEpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d3WdonbZX1aTWFGsyAIiSQC1xQU02gzPnB9/dlfedMp7xiujq9J3nc8akVur8tl+slDvnBcJCHtob/E4I1u/hHc6ugsAFgJS3qnnpeC3/7V61vCN7V9+JgV7xTHe2jr/x8CIVSDE8ciyuem7C1oZcX/FzV1Qnx2ucSX8b5+NFRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q5xmEhXu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BopPNEK+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q5xmEhXu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BopPNEK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788271760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b9vPZOgd6NLyUWZKoe/EId/qc/H8rWYiebMVzAAsIXQ=;
	b=Q5xmEhXutroOHSzcEjR0QYykCz/SfOR08DtTLZPrX61bkb/6RtAwCWM2jRpF9Y9bKNPUUG
	+do2uW0c1SKg6DC5pD98LYHKrxxKbO3hnd8f34+OKldwwXaTZC/FAwEetnOKCYnf4rERku
	CR/fShanNxR1NnrhincM0S3FQ16U4gU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-wk0Z48u7POGFrelorclIcg-1; Tue, 01 Sept 2026 10:09:18 -0400
X-MC-Unique: wk0Z48u7POGFrelorclIcg-1
X-Mimecast-MFC-AGG-ID: wk0Z48u7POGFrelorclIcg_1788271757
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48437090e74so694617f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788271756; x=1788876556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b9vPZOgd6NLyUWZKoe/EId/qc/H8rWYiebMVzAAsIXQ=;
        b=BopPNEK++3LrXfga1P0W4nfBfXFX6Zxm3PM47dNqocx9KcUS5wP6prNE4xjqj9SzXX
         sjhm6SbmacAG1O05bvGk0UIJ4Fsm3N963sCaAuOKGimrp9DRZBc3ipoVQAlkAGjHagjX
         j/ok3qHanjyEksnLfGNVhZuWOR8eOt8XdJhxe5dZIBG2TWi2dCN2/SvfTbtcGmrIvLMI
         5CutvFIu+1wtS14CRr3mxGffSdc32djGh+hgCL2QMvGxXAosHBnfFVFRUmrrbjztyvJ8
         iEYMay4CxFENuNIdyqsVcuR/Aly0sw24dp+TrBxJ0mJfgOjKMMgJ0fkK3JSDzYIYwNzP
         XGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788271756; x=1788876556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b9vPZOgd6NLyUWZKoe/EId/qc/H8rWYiebMVzAAsIXQ=;
        b=GxcX58JXn566TdkpH0xhWHVpo5an884sxbDBPIj9/hA20EeXnXmgHxTrGnqpXak9T4
         6xpTXmd7HCIAYE2WAcjRaVHjj5S8fDykNxBXsfkr0SsdNotWpq2H4lCmrUkhgvZAgsd7
         KNMDQ3pq0gsoZTLJEiRBOc40oXbmyM0QHtOwEQBgNlfCz8cg7SoBBvRuH8jqpLC0xJe5
         OWnND3alldGGy/i/nPDmR32WtBiHRK5/PVOFluHy2L//yVVoN3gImDT2rHdmjwXhTSzL
         Ga5uDxPlYjFhmMU/2ojEeOAILWJP1+gl8vmFx0GnkmSx2OdXjnAxjfZJ+4giq4veFZcQ
         lmMA==
X-Forwarded-Encrypted: i=1; AKwUvByQcTkZfQX/o1WzhnMUH+Gs+FLUz391X+GOI1JGT3l1V6LJFAixgeq/aeiCSgwQ9UZJXAilURcCW7H0+OE=@vger.kernel.org
X-Gm-Message-State: AFuF++kRnE/7M2Z/kNCB+ZlD/gClgvtMPqttHET1SXi9hNFXfIYlzQwJ
	ohuQS9vhQQ3OkUqW8uxGqgK9wmWwYOwiq8YfBtbWHY/lsKdKM4hr5jPKa5RxcXHo/CkkA+EVsoY
	9BxZbl8cWf94AhZ1kCUCIWBIxRZqA565uc+CE4+GYPWnswXvwaoe2mioWuWxTwvFsRQ==
X-Gm-Gg: AYBFou2Huai1J1+G4ECpCugOzes8EW/TXMW3Hn3mI9GpYj4IucB9u1ZQekUvCvY749R
	pEB/M4Sv2GlBoi2fMytPAuBf9KIbolxr69d8PD1WA6hlDa7msqv0gi4MbN/pWc5U38mP0v9Ees/
	yI1AqMyjLXcVfMP0oxbI16nMkCBdDZ/scKDjswooqxPO4BCwQI+h1k6bXHecMe/l3gveDpmTDax
	/lG6ky0eoEXTsfL56v2UmXD17deCK8IrQR4NkiGrFbmBfOzwfsdwXj979z8Ur6QUDwIiVnmjKbN
	HS/aHrZmYcUL0syF2XDdKhR68wye4pgmP2JtFO6r+0kxqfNd1b0LwFM0+I8NaGd8xIbLsEj7yxv
	DzmiS3qkOav+ri9LdHybEanWT4Tv4oTJkwEyIpZ/WejVIW48HMpmy8XXWemKKfnthFqQcAF8gAw
	==
X-Received: by 2002:a5d:5e01:0:b0:482:e2f2:19c9 with SMTP id ffacd0b85a97d-482f7987c40mr51900096f8f.2.1788271756594;
        Tue, 01 Sep 2026 07:09:16 -0700 (PDT)
X-Received: by 2002:a5d:5e01:0:b0:482:e2f2:19c9 with SMTP id ffacd0b85a97d-482f7987c40mr51899930f8f.2.1788271756069;
        Tue, 01 Sep 2026 07:09:16 -0700 (PDT)
Received: from [192.168.188.218] (ip245-45-231-195.pool-bba.aruba.it. [195.231.45.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d7ec2esm5063012f8f.37.2026.09.01.07.09.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:09:14 -0700 (PDT)
Message-ID: <a86aa34a-8bea-46d2-a785-6c423ac00b1d@redhat.com>
Date: Tue, 1 Sep 2026 16:09:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] udp: revalidate socket family before publishing an
 IPv6 cork
To: Daehyeon Ko <4ncienth@gmail.com>, netdev@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Vladislav Yasevich <vyasevic@redhat.com>, linux-kernel@vger.kernel.org
References: <20260829132125.1160893-1-4ncienth@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260829132125.1160893-1-4ncienth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/29/26 3:21 PM, Daehyeon Ko wrote:
> udpv6_sendmsg() prepares the IPv6 flow and route before taking the socket
> lock when a datagram is corked.  IPV6_ADDRFORM takes the same lock, but it
> can convert the socket to AF_INET while the send path is doing that
> lockless preparation because no cork has been published yet.
> 
> If the conversion wins the race, udpv6_sendmsg() later publishes an
> AF_INET6 cork on an AF_INET socket.  Uncorking through the IPv4 socket
> operations then interprets the IPv6 cork as IPv4 state.  The IPv4
> finalizer writes a 20-byte IPv4 header into the 40-byte IPv6 header
> reservation while the retained IPv6 dst routes the skb through
> ip6_output().  ip6_finish_output2() consequently consumes the unwritten
> 20-byte tail.
> 
> An unprivileged reproducer triggered the mixed state on 12 of 10,000
> sockets.  KMSAN reported an uninitialized-value read in
> ip6_finish_output2() on three fresh boots, with the allocation origin in
> __alloc_skb() through __ip6_append_data().  The same process recovered the
> 20-byte region from the TX timestamp error queue; one of three fresh boots
> contained recognizable stale heap data.
> 
> The route prepared by the racing send is not published in the socket dst
> cache.  An implicit send on the IPv4-mapped peer required by ADDRFORM
> delegates to udp_sendmsg() before the IPv6 lookup.  An explicit native IPv6
> destination reaches the lookup, but leaves connected false and therefore
> cannot call ip6_sk_dst_store_flow().  Conversely, a native connected send
> can publish an IPv6 dst, but ADDRFORM rejects that peer with EADDRNOTAVAIL.
> The same reasoning covers the non-corking explicit send path.
> 
> After taking the lock, revalidate that IPV6_ADDRFORM has not changed the
> socket family before publishing the cork.  The existing error path releases
> the invocation's prepared dst, flowlabel, and transmit-option references;
> there is no socket dst cache entry from this send to reset.  With this
> change, the serialized controls retain their existing results and the
> forbidden mixed state occurred zero times across 20,000 sockets.

I understand that with the above you intend address sashiko concerns
WRT cached dst:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260829132125.1160893-1-4ncienth%40gmail.com

but I tend to agree with sashiko that the race is still present.

/P

