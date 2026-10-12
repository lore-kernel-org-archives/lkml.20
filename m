Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581B4451996
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794072; cv=none; b=SoFkeztueixmGLQk5/EGRHI1vHx/ackug8R3ZxvsA+hbsuDYL8K5vhKBJe2Jg8HsgAvKqt/eU6ciTNd92sH6CFuH41pyTAqc3iawDTGSiIXlNN4Xiy/xUvkbNE3imqLUrY4qmKlJV1eR7eS89jr4q4tE8Gh7QoPpzxOO8ogY2uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794072; c=relaxed/simple;
	bh=x/pVy5iv6pkKCODTQWrEjvHqaXtp8U2mXH9axWGSQwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJukD7W3F/3kLe0IEyrlLH0WKFVaq9ef90N+nhJhRwQ0kraCjhy3Ht+mrSro/NHbp+gXqWHv2B1MQV/GNJuGqnk2yZZGA2iVTFj9Ulqo5qRsxG5mQNk6kR71tBxnKMpkBCVIgW+jH0fg3oLb9OGSBmDv87pc9ERacykXCXYx42E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFCDtOGw; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFCDtOGw"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so923636a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791794070; x=1792398870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lpzhDm950D3WodhvZMeQKGiGTZ9bQ7TVv/mvg3cXh7I=;
        b=iFCDtOGws3lYLKaLyvsbIWA8RR13VVTIEMa23CHoRZBgGeAT6zk4wl6UzXPQvd5G3N
         e/uL+78+t4O2LkCxkEjL004abZbYmtbQ3bUBlZMKgW+oLhEq1dNdxY0/oJS1X4do7BhC
         GqI67eNessWDOdG5Y6O/gjca9MLxMnWRx9bjRI5Gc0WED2q0ymVqZJbe1Ri+GFUrnPKr
         UBqR9szpxUXQ5CwXTkhXCcyyMIQ4lydzgxp225MyDRTFn+zOGmPfQKuDNCPY7IvUShqH
         4BxW36+hNlpux+C77TFq42Poy+9Z/sKPU3gC2vz7LddgXRhBd2qk11RLghGaPIwUcG9+
         znqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794070; x=1792398870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lpzhDm950D3WodhvZMeQKGiGTZ9bQ7TVv/mvg3cXh7I=;
        b=LFVtia/iLKfnY/IKoA/2KN3poZkqpl1I4RO7H3EqGdbQ6qJCgpixcfzTLkrRjzCjqI
         wREtShR9thq2rqnf/me1lSpom1S9Dts/lMr1lepB+DgOD1XVUyDLHkjpPo4BwZZsrQcb
         vP7MVWmkG/7sDXKBhONw4JmfRlTT1QjdhGLSREFbx7f1nANvTPf1WzCkYnUQ7puPB69o
         7c7NV4eOsA10jmBiKdBXxPeF6QRbaFPe9LSXRJqZa8xLGfA3goJxJs3UlkVg/XY9H+bp
         RSZuOHb+1XAzxS495F9k7wzV3sTOAJR846DyHACHOO5daXXerVmvSbIT+EUf5Nl9Ohs5
         RhgA==
X-Forwarded-Encrypted: i=1; AKwUvBxO5fA8HcclBOUVjNLP9uNxsdWCeu3FgAFjJ9r8eA4k5AmF+FaGSoForYvQ2xvNdcaAUAIl3sj5Bj/Lo+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr76UcXS+xuUTDvJhAXKZeZVWU80sOGf7weQBWl8aEDKQo5sCl
	KmRXW8rduSmFbKDEAR6Ztps3i1D6PP7DeQ5C00l1DU65CbkPzRNVzp82
X-Gm-Gg: AYBFou0zDAMjak6H3L5z6fsKahxPu2hccDcCdeTXWFSsOS8ghvqzTc/pwaUogONPUMJ
	O2Tr/kPmWjkDh2WrNvlRVIVTBDnsEBoO8ejMXqTprF7X0xdMWsMVSCs/Uk4zeZskO6qcwzYS45Q
	ZJnRSQx3f9J0S9DFUTp6S4Mg2TrCqhfyxxjQOmDeZOO9vceiZL+tIUUoYWzzuejrPhudyfVHDv9
	ZOn8i52qOLo3EG5/j+i2gsgO4RgtkidTcJqZfEvMS72Hm7/JNnONrOVK7kRLleHE2a0hxVxz24m
	K6HLJeS3pT62N6Kr/jhB43rupMyq7EZI38u1HKJ08PwJqgQA3gzRvfwOiJN6ITC9a8Ar4cJMkT2
	gODgwLdHS/J6vQbdT/m8iqmnf0Yndo5Lf0NcUoGX6Coj9/xrdVXH0/O6pO4OAgTcBH7Pl2a6p3T
	yC17LhNqM7tiHyalbhTuJEJWWfq69fDnYwGS7YWKd+VkUzb32+gE//ogqCc8rXb/F5LUf1txW9S
	K1l3O7Cjf5b8FeVDRCwV+PSieEkB4EzMgW0
X-Received: by 2002:a17:90b:43:b0:3ab:330d:6e47 with SMTP id 98e67ed59e1d1-3ab3a9528fbmr5159947a91.10.1791794070567;
        Mon, 12 Oct 2026 01:34:30 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21e8::1189? ([2620:10d:c090:400::5:b3cd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm18191720a91.11.2026.10.12.01.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:34:27 -0700 (PDT)
Message-ID: <d6fe0569-ecf2-4c63-b507-b70f7c7cdb0e@gmail.com>
Date: Mon, 12 Oct 2026 01:34:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3 5/5] eth: fbnic: bound the XDP Tx completion head
 to the ring
To: Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
 Alexander Duyck <alexanderduyck@fb.com>, Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org
Cc: kernel-team@meta.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Dimitri Daskalakis <daskald@meta.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>,
 Daniel Zahka <daniel.zahka@gmail.com>, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1791775409.git.yhlee@isslab.korea.ac.kr>
 <99790c3eceac9ac0bc9afbd90e8adb9789a08c50.1791775409.git.yhlee@isslab.korea.ac.kr>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <99790c3eceac9ac0bc9afbd90e8adb9789a08c50.1791775409.git.yhlee@isslab.korea.ac.kr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/11/26 9:16 PM, Yehyeong Lee wrote:
> fbnic_clean_twq1() walks tx_buf[] from ring->head to the head the device
> reports in the Tx completion (FBNIC_TCD_TYPE0_HEAD1_MASK, a 16-bit
> field). head is masked to the ring, the device head is not, so a head
> outside the 1024-entry ring is never reached and the loop does not
> terminate; it keeps releasing the same buffers to the page pool. A head
> that is inside the ring but past the posted tail walks over descriptors
> from an earlier wrap and releases their pages a second time.
> 
> Return without cleaning if the device head is outside the ring or outside
> the posted window, the way fbnic_clean_bdq() already guards its head.
> fbnic_clean_twq0() masks the head difference to the ring and is finite;
> twq1 did not, which this brings in line. A head equal to the tail is
> accepted, as fbnic_nv_flush() passes the tail to drain the whole ring.
> 
>    Oops: general protection fault, probably for non-canonical address
>    0xfbd59c000000002b: 0000 [#1] SMP KASAN NOPTI
>    KASAN: maybe wild-memory-access in range
>    [0xdead000000000158-0xdead00000000015f]
>    RIP: 0010:page_pool_return_netmem+0x2a/0x3f0
>    Call Trace:
>     <TASK>
>     fbnic_clean_twq1.isra.0+0x20c/0x410 [fbnic]
> 
> The loop was exercised by passing a crafted completion head to
> fbnic_clean_twq1() under KASAN; no hardware is involved. On a kernel
> without soft-lockup detection the repeated release trips a page_pool
> use-after-free before the loop is otherwise noticed.
> 
> Fixes: cf4facfb132a ("eth: fbnic: Add support for XDP queues")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
> ---
>   drivers/net/ethernet/meta/fbnic/fbnic_txrx.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> index 7a9bd91bcc41c..3a148eb4e560f 100644
> --- a/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> +++ b/drivers/net/ethernet/meta/fbnic/fbnic_txrx.c
> @@ -661,6 +661,12 @@ static void fbnic_clean_twq1(struct fbnic_napi_vector *nv, bool pp_allow_direct,
>   	u64 total_bytes = 0, total_packets = 0;
>   	unsigned int head = ring->head;
>   
> +	/* bound the device head to the ring; see fbnic_clean_twq0() */
> +	if (unlikely(hw_head > ring->size_mask ||
> +		     ((hw_head - head) & ring->size_mask) >
> +		     fbnic_desc_used(ring)))
> +		return;
> +
>   	while (hw_head != head) {
>   		struct page *page;
>   		u64 twd;

The device can only consume descriptors up to the tail published by the 
driver. A completion head outside the ring violates that contract which 
can be hardening but not a bug fix. IMHO such a defensive hardening may 
not be a good idea.
