Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4622D4F4D19
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790675012; cv=none; b=aM+xKVsaoxBQk77POFi1fcdNUE/4EG1AGW82ECtgZfZ2LpiGKHS9HRiHdbSvEf/O1/PVNpBFFzrvfMYgwAXRT0daU0MOq6+rYDQINqvXMVO4wdEiUI4ocsVAczLPiv2Af4VUaNeR6FKIZfIbsXvYMUM8pBaSOsedpMvzNKYHg88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790675012; c=relaxed/simple;
	bh=L1AdscmmjabczMNove8aEhWMWmu6H/q9PXdFA6ymPno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=spl9K3iZF84WY9RJFSY3/NQ7BYzIu/P+tri63CScNClleRXsvmpViwH9wAbBJrDaAV+Snf8c7OSQ6V8p2LGG9eF3zneDDZPi0NZYGtqcBGtimkqG2ajkcz7DrADMuORlmdZPuQTq/IkhraYE4yjyLOvcTgH8puQRiUqE7wOBB1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Di/jrLNv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Luw2kGq9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Di/jrLNv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Luw2kGq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790675009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wiA3Xu9LxzZqP1eoQvwYJ+7I3bF3ztXGgSwubSHNcA8=;
	b=Di/jrLNvrLhuWyREXdNRt2EByw44z9MEUZJVEPsDfgG9DIQztjw9t/5mSoKVFGYSFRTLKy
	ayF2iMKZE/Pk/mbftwU6cMUTEYkvMJUf47SOu7csJYXdlJ7mg7eI/vceAcLolFZJFgZXjm
	OoXalWPKW9w97qNEdd7H1i746qSyaT4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-ObIVnSa7NN274b0LyhKEmw-1; Tue, 29 Sep 2026 05:43:27 -0400
X-MC-Unique: ObIVnSa7NN274b0LyhKEmw-1
X-Mimecast-MFC-AGG-ID: ObIVnSa7NN274b0LyhKEmw_1790675006
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48889db9974so2335914f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790675006; x=1791279806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wiA3Xu9LxzZqP1eoQvwYJ+7I3bF3ztXGgSwubSHNcA8=;
        b=Luw2kGq9+I2j39qKA0TA9B064etkAUVotH7oHkyqDVZpFcg4fKdAKVt+FIX4GYsgDg
         PIKDjQZ0XvxUU6xZkCYPSxB653fh4zaD6GcUNLFI+wW43KKjCODwNOx1j6rfoGphbLWv
         D3byRlcCi+kciRb6oh2ZDkj79NP4akxk4ubkPJkJadtLYa8s6jD1fkL4VHOrBduTAwTQ
         oZJeG26yUtcujiDziin7R/SEXxHaqW+9o3VHYo5b+5mqOvh1I5rr5K1iTKuEiHKC41A/
         nyHGcx1TI+OuG+QOLU8RvQZwMMJhV+y3GH6GtqsEd8iQ1xa8wpgCehVkcyUpmZ3vC7C7
         GJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790675006; x=1791279806;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wiA3Xu9LxzZqP1eoQvwYJ+7I3bF3ztXGgSwubSHNcA8=;
        b=CTKHXWSr0+x7e+JRrgJpiwC2PQg5X8zz3mkppJ9eHwHjTtXfaTxnfSWFOREUXreMPv
         BUC7MmkwC1VR6DcNi0l9i40m8gOhOMAExPelLuTax9Gp2swl/j1bdyia4uH0o+uT9ZjE
         LM8BTF7A0gt5EaUHMyULJIQaRn/+sdmHiZWlxauFRIME1s8fDRKl700XDAuv60ORf/e8
         xCklCLjZrZ/GXepRuq44ELgRJlWlDmj4lsXwCHN40DEk4QqlZ0G+uvi4oP1dOl1OoNqM
         TRLQ4Xh1xTjOrrtxSH8aXCMuHAR7JwVzaaXvh0BqrQZZP2WLFvkaDo/8BW8V/MaNDutX
         0Nhw==
X-Forwarded-Encrypted: i=1; AKwUvBzRJKbWC/ag/Qj429W+Zl6aeReScKteWXKt10WoKKpbVZqiTvKcdsWegEQk0kGqaGsz8HTYxaRLr6R/Xbc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLlp76c/SgVdHDr0JETvwtHerMJR4TQeuVFuyf78XfewmKA2CD+
	DjhS82j+VU2hfILKrYk5p4BkJd4eINaHOkkySugF3gIvpSRm1jbMTd7AZYCatE5tkab8SYC6LWG
	MUqiOnaz6+9xu7VvlO8JUxPsyA/TBTTWzak4c1X9wKPuznRjGdTngI3sSDrPL9I7nwJ2JKB1PpA
	==
X-Gm-Gg: AYBFou2JJ2PuByLW183O2Q9ZGxEpI4oj2cv7D3eQaYu6DGsxSVhvI4vcWRpaZYvsUhY
	M1kFfoy06iBCXw2I7NmLpDdrIXlKDbiJ2VdCJa6ZaJH4iK4V3nAztX6mTAF7Q1rm3mXLNXG9yAm
	w6eyOj7zUQW3fnW+J+KpG0US60vjr5s3mnzJR5jRcOwrKuDaEibLvZD2lpqBcWWXVglQvdBW2Lz
	UnlB+cnLxGNlvmDVqaUcq6eG/hYT3BiaITgVgVYTndSeTb6U6WLGUOgoVGuJPfwT/p4zJuecFat
	PvNN5s/hsB/6z6ir1WpbZB+fS3Qr3TFnJTPugUSu3/Ys6fpLVB9TClEv9awjeIms80p2EllzCmO
	cL4r3HuorEb6eqPnWMTLRrYKVROYvrBKvLSCFzq9XaNjHEQH3WHfEkBYUtPTohLCFWh429WugWA
	==
X-Received: by 2002:a05:6000:2dc9:b0:48a:f5bd:3716 with SMTP id ffacd0b85a97d-48af5bd38b7mr1336831f8f.12.1790675006375;
        Tue, 29 Sep 2026 02:43:26 -0700 (PDT)
X-Received: by 2002:a05:6000:2dc9:b0:48a:f5bd:3716 with SMTP id ffacd0b85a97d-48af5bd38b7mr1336780f8f.12.1790675005916;
        Tue, 29 Sep 2026 02:43:25 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50923f0sm2750243f8f.31.2026.09.29.02.43.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 02:43:25 -0700 (PDT)
Message-ID: <85ddcc36-7e31-42d7-8e78-a3e456e13944@redhat.com>
Date: Tue, 29 Sep 2026 11:43:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 3/3] net: devmem: decode DMA addresses for TX
To: Stanislav Fomichev <sdf.kernel@gmail.com>, netdev@vger.kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 horms@kernel.org, hawk@kernel.org, ilias.apalodimas@linaro.org,
 sdf@fomichev.me, bobbyeshleman@meta.com, almasrymina@google.com,
 kaiyuanz@google.com, linux-kernel@vger.kernel.org
References: <20260925201522.254717-1-sdf@fomichev.me>
 <20260925201522.254717-4-sdf@fomichev.me>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260925201522.254717-4-sdf@fomichev.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/25/26 22:15, Stanislav Fomichev wrote:
> On 32-bit architectures where dma_addr_t is wider than unsigned long,
> page_pool_set_dma_addr_netmem() stores page-aligned DMA addresses shifted
> by PAGE_SHIFT. The net_iov branch of __skb_frag_dma_map() adds byte offsets
> to the encoded value, so the NIC is programmed with an invalid DMA address.
> This can trigger an IOMMU fault or DMA from unintended memory.
> 
> Consolidate DMA address encoding, decoding, and representability checks in
> netmem helpers. Use the common decoder from the page pool and net_iov TX
> paths so both interpret stored addresses consistently.
> 
> Fixes: bd61848900bf ("net: devmem: Implement TX path")
> Reviewed-by: Mina Almasry <almasrymina@google.com>
> Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Fixes tag for net-next patches pointing to old code are highly discouraged.
My understanding is that netem on 32 bits is mostly a theoretical thing,
i.e. no actual usage.
Would you be ok to strip the tag? No need to repost, just reply here.

Thanks,

Paolo

