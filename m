Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955433AD515
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790248593; cv=none; b=P0Z/P1BwUWDPMldAIW++I26MSev1rvVn/ExV+Zp0syZkyqp2d8675Suv+x80EEOChJgJea07AdTXBejtYL2i7ayVEmpz2GsGo76UHhTrOVvSNUG+INoJ5ww4F1LhVr7QmX7s0FubbIvz9XsMO1+KHti1ujM6sH23iKe0/9KNbCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790248593; c=relaxed/simple;
	bh=FJGWHnmnuLJlBsVROinNPEPrqoUo3IhcpCsvsUGsco8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hSTlQ5c+Cd8qgdphfluu99gpdmgY12BLSCI3+eu8DvRtWIkF9Q1afXCEjBK2ggS3jWRc5BIa9JZaPBizrwNvR2E9Z5gl3DmD8NCUu0eWMsh7HYK0F9U/fTH/FzxUrr9aCfmmpvuPFDhpgHm/FUwKaDd1hbB8waZU3DM3ELnvTak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eC2LMFB7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iUPeFaVl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eC2LMFB7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iUPeFaVl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790248588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l0t7HoSTYV0NRHicOnVIwfgcJA3kZ3Cdj7YgFvfak6E=;
	b=eC2LMFB73RPE5iYXI+3VK4RzY9qfZTJsnJPckB/UFjDmRnl43nvMBfncVw/g2G4Cd8n7EN
	tpCWZxExsi1kxF1LP3ib3/DBv3y54ORMPPopoGq11qNjn01e4Hbdr6LHiUX4MZDz315ZG5
	G3lt1uDXYLd9y0NuOItg8Zp3VOZYj+E=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-472-4o5506EcOm-pJCwTV7OU1A-1; Thu, 24 Sep 2026 07:16:27 -0400
X-MC-Unique: 4o5506EcOm-pJCwTV7OU1A-1
X-Mimecast-MFC-AGG-ID: 4o5506EcOm-pJCwTV7OU1A_1790248586
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49cdc4080ddso4625215e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790248586; x=1790853386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0t7HoSTYV0NRHicOnVIwfgcJA3kZ3Cdj7YgFvfak6E=;
        b=iUPeFaVlK6831J0Zrv+5sIDBpc0in9xBM6XmsBWzJQPMtfXKZ6lXMYbLuU0Qy5+QU0
         PrFwDIPtIb/PcQM3eajCmXbXkD6eVuMYcRtfc47oZSOJm1N03lfQRE7Bl23FzCzvhtql
         +3w/JmltXR0ZJB7pBu2GNnY7egY6gwkScI1FpvrlS2Eiru0rwZDyZt3H3vLNTBCdd/52
         yE2MpOxJeE8J1KoCopyf45AWvVskELeqKjHF3zrhabvFN3dX6JRFPHuKEEp+A9pvCAug
         NbZXviipl28xlj/wIMywNaHjMQToLJRRiYnJiYnRq4DACqs5B6FTrs8ax6/OenyIqFyV
         QT0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790248586; x=1790853386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l0t7HoSTYV0NRHicOnVIwfgcJA3kZ3Cdj7YgFvfak6E=;
        b=EBbKm3XGwRU+5f2BXXY5WCFYvigSg1KAt4sXed/hAlOvlrQrQeZX5AvKbAOaGwrZ3/
         ag4ZVn8lpBFY22J3aOC7L177Fpkph6vPZlJV9PFpA0WYegt50SutpzJCHwLXGCAV6ssp
         3g0oeQMtNlssylC1irCtHRbDZKwHZsJS54OLExqsmPSE27AwE/4zifG1ETaNEWjqF41w
         gl3YpoOUzg6wHjtlTNoIyp/w94CZSDKlkDBGXpDFz87tvfKNNlORcCy6krhi8oPvPFku
         /QzWhMEp12k23oB/npo/7VlHTiKwRFjG0I4ldzNucL9HX8EfIXMN0V6eakG/4ulCX3/B
         hm4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzFoa4v6/FyMFPcgyvk3mMBkncjcIiyACJXLc+vb+bOZPRHDObUT8wunFsyHvIgPMXkukqibJYX5l5JIs=@vger.kernel.org
X-Gm-Message-State: AFuF++mVABgx1vGRB8czWd3ppautU+buRUY9Eh8Zu89CPgjM2AmFyNXC
	KFvm9s1qEjTNHZejDpRCszchg0L9twFroKihpzBw0unzpdnjNtNIEmPEgIDkIVaGqO+dUbaL8LW
	dzaAAsiWtqi21bwgS9dREYpEFDK1qQLDjiFfgR0pUo3o+O9XwaomGxjY0Xopw8zI14A==
X-Gm-Gg: AYBFou1K9yKrXbmLEZbG3de9me9i4Ugelg73vTLWBRtFphNmYhT7HN/UYy2Jk6aJK3W
	v8xU7Jfend7apugFkPj8nnmOtJ2KthUjk0sDK4oRGfvNMAU65vy17xgMlt3aFVrBrqdPBCpMrV5
	g7TC00ypx8w7LgwO4PkrK8V4PNTmhht48oSNT207C+91s5weI4SCcn+LN+TMDbHOxQSp2wNj9X8
	gbKTCrue4aZNsjvA0xHXTthSyKKTc+lqzFig7f4mk7iRhErTGUOxfaiSw8tAv1Wu0OLidULQtfe
	tH4zYpN0JxqOsW1grC58IUgmWBCj2/gqiG/9qk5YidsaV6SO30iNkILEPOmQCF2DHNlIBPftwM8
	YV9p2hgUaBJZJoX+OomBiAEs3vyhxW1laXC+lFqV0kXckC1zc8KxuYScmMgK3sHXT5KCxRJLmqg
	==
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr35442985e9.4.1790248585763;
        Thu, 24 Sep 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:a05:600c:4e53:b0:49c:e37e:4389 with SMTP id 5b1f17b1804b1-49fe66c8288mr35442695e9.4.1790248585388;
        Thu, 24 Sep 2026 04:16:25 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe0c4b51bsm110289725e9.4.2026.09.24.04.16.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 04:16:24 -0700 (PDT)
Message-ID: <dea7ccae-6da8-4ec0-b931-61f865b2ac84@redhat.com>
Date: Thu, 24 Sep 2026 13:16:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ipv6: fix payload_len inflation in ip6_xmit() when
 IPV6_RTHDRDSTOPTS is set without IPV6_RTHDR
To: Hui Peng <benquike@gmail.com>, dsahern@kernel.org, idosch@nvidia.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org
Cc: horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919210620.3029622-1-benquike@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260919210620.3029622-1-benquike@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/26 23:06, Hui Peng wrote:
> When ipv6_fixup_options() was introduced to ignore destination options
> before a routing header (opt->dst0opt) unless a routing header
> (opt->srcrt) is also present, rawv6_sendmsg(), udpv6_sendmsg(), and
> inet6_csk_xmit() were updated to normalize `opt` via
> ipv6_fixup_options(), while other callers pass `np->opt` directly into
> ip6_xmit() (such as tcp_v6_send_response(), sctp_v6_xmit(), and
> l2tp_ip6_xmit()).
> 
> In ip6_xmit(), ipv6_push_nfrag_opts() only pushes opt->dst0opt into the
> packet if opt->srcrt is non-NULL. However, ip6_xmit() unconditionally
> adds opt->opt_nflen (which still includes ipv6_optlen(opt->dst0opt) if
> __ipv6_fixup_options() was not called by the caller) to `seg_len` and
> writes `hdr->payload_len = htons(seg_len)`. This causes the transmitted
> IPv6 header's payload_len to exceed the actual packet payload by
> ipv6_optlen(opt->dst0opt), causing receivers to drop the packet as
> truncated.

Are there any in tree call site leading to the above? If so I think
we are better of calling __ipv6_fixup_options() there instead of
adding more conditionals in the fastpath.

/P

