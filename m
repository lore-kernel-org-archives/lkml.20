Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800769;
	b=l9veY4vatC1vf3boCCs/tU1Jf6LjkCFkNE87jWZ2pDGKm//syqegkDpFUVzQx6wK2LYU
	 jDX975XZoVQKYLtEsJmzEJYLYvSPYdgKt/vdFi5aeGgkKd/riZMnIxGnSS1zQn9e9MGuE
	 1+KpjaGdmwuI7cDyxShsDTweJf6a3VrqEh2W6kZYiQoPjwl1CdOqhJ8g2HGiHnmeZqITh
	 JlzCIJLCWrSKko1N4A+wV23ZJxjnsn5xOoTUP/P3PeSSDLQJSoPxEhe7HUfMX5XdlqVEt
	 GmKYvv7fzv6KNWBFeStemSBjFkpTphHrzWvcJYQnamaG61qCJguFMlH1LkxjyCqXViw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800769;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 From:To:Cc:References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VitNQKxHFPSqCciOhPtQD8YBHIUjMmipC+sy8DGH1Vw=;
	b=Y+392/GMYyziCGSfbhP5zG0m4uXIHdd8PJPcwqgI6TjQ+iuyLl4BfhPYb0hw6g3Rqz80
	 PKAAblzaUjSePaR8/PJY71Yr5K4pM80FCJRDWiHKje09xy7g/ietyn5OC1B2xYah96xPG
	 QS1SeX4qXl3Ff6k72n0eKOA0qmeUsWzkMvbKCe2BtCZ9KGhFR0ZmZPMkvgRYx/lJT7Xul
	 gmt/wXvB763Y68ontA8SxSXilsltiO0zQvdwSee+5K4z6ebD/6JM3H4smg8v15mKGxJ8K
	 km1GbH+2CgPozmd8fFIIJUZX+GwRGbKoyXFkaeP0d4vjtjTmpVWi8fhjtAlkX2ftnww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AkYxIiZ8;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kiFgX3ZP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B419D606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B419D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=AkYxIiZ8;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=kiFgX3ZP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793800767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VitNQKxHFPSqCciOhPtQD8YBHIUjMmipC+sy8DGH1Vw=;
	b=AkYxIiZ8K4yHjcsUdyNwqZEmRCoF1qZFia/Sf6yH123V2RPrQ2EVPqkI4AV9c5E67Rzym2
	3LJSB6p8+VrxL9MbCIbcZlzQ1V1BIFyrTRLQ9ldNNOPfearImzM2HAiAiXpZqvHuuYfYU2
	LJ5nPtNcLFOdCWANGyvnbxeNjRMhtrU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-45p12f4XPX2L404R214hQA-1; Wed, 04 Nov 2026 08:59:24 -0500
X-MC-Unique: 45p12f4XPX2L404R214hQA-1
X-Mimecast-MFC-AGG-ID: 45p12f4XPX2L404R214hQA_1793800763
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso9318735e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:59:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793800763; x=1794405563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VitNQKxHFPSqCciOhPtQD8YBHIUjMmipC+sy8DGH1Vw=;
        b=kiFgX3ZPwleCiXANgJQF52HNkTjpwqD45mhBHeACrXNLq67VC1XEeJlYEKK+LrmPKz
         /5oPjO4x6Gicj6JAdjPvykT32qaNgCJSOMTcU+SQQS64a02Bef3SHScZPT8G153Kf5fn
         P7jhcZXwyyPALYXCrFlkmW4T9/s3H+zj78GigsNc6E7hFHj6qNta7/10UaRCPgz2YUnk
         xom5rV2FcCi1vp/EyR3OhPakymWd1/5nhZFe2LdhDO4PXp+Q7CturvyN1/jrGzdLCfEp
         jolsL9UZkVIYfl1FcMqPRiC/xxFkN5hcFOUtIz5OJD9iMG3tEGu6HmqUB9BvFySKEHgt
         PhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800763; x=1794405563;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VitNQKxHFPSqCciOhPtQD8YBHIUjMmipC+sy8DGH1Vw=;
        b=0BEy5Eqoxy/klCBAiZXZd5F3lEIMrf2KGmbHY7Wv+VI8V9ocmO27ikNXDJKND4+joy
         QI+Q0RUI34pQF9pcSpU9/Xa/jgFdiMmV4oGSO0m2sB2S2Y7FxZAEIBtfAj1/OyEpYSHR
         hdfp4MAhupLi/ZE/iUVvGNdf8e/zaKcm89GSjz/dsRAxyvgAWdns4gKnFGqDjMbAa+YJ
         9AiADL10jPGtel+RynD+aTm6+kKNYH8aIwMKTfo9EK3RypSntdE4GgJvUMb/QmJpLY4Y
         kRC4fEEPJ9HCyxMoz9CpeKCSkcd4HKbBGEpm+eKERNXH3Ym46wO4ejBpJMxF3EFh9ThJ
         AdsQ==
X-Forwarded-Encrypted: i=1; AKwUvBySi7uJzz1gdu3pkHvqsR6IqgnkZK576F8jNUr1t8SeEcIuABnGZMcXiXJXH7Ie0LwobFGttmmgw+yjaHE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OZa1Yt9HBN4r0CjAAlfa5eVwlpW1IfytMxi4nHecyUq/YZfPL
	r+gjJISnlZmi6tj9fKqBo+Nhas7gHv882Vt80HSi7BWLuF5CbmqFzoyac9+lMfLXVU7qw2if8bv
	sh4bewF1OE9X6wHBilR3KsWClaiE2P6NKhOwNjZw3JhRngd+wbCpsF9sJQWfCvpjK2A==
X-Gm-Gg: AYBFou1HGeZ2v9IRqrE01vYJbgmqVYOYSs2xzrp8DBU5bxYCiwHBVv9Q3C7ln65xYZS
	V2OOciovnTCuGsqPm/x7mALM8n+dSa5qPJXLuYj1ZyC5e9fp2NevaHoIjAlSlTbTj+Li+FRylak
	PU/LwbJVNRkRR458tl/UM47qeHzbTWpmGnmdqTiYANLNsuN60EbJj3ej9Llhr1CeQzDZlprcMIc
	42GyEnS8uj/p9yD4OSeHv0X5TxRDjHHwMpKfreeEgU2Fcoj/5pOW/TlWEpszVOeYnvuX+Cmx8eg
	qCXTOWOSdJsS8dRcSnLNwsAjnbg8UF07Efb76MaXr4ns+ete1nm+XRk3wNwaDJ84A7/g8F1gfUH
	rXjy0DsDBy9neHVrYEqs9PbWuK06RNZNHnyxSDf3MHQC5nOeHaKZmkkJJR0oJNa3NfOCM2bUvFM
	nxjpQuBDSwSe3phWpUWg00+WlSvpRZBCDTZlf79ueEoL4=
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr401889225e9.2.1793800763018;
        Wed, 04 Nov 2026 05:59:23 -0800 (PST)
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr401888685e9.2.1793800762336;
        Wed, 04 Nov 2026 05:59:22 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fece99a5dsm3927057f8f.21.2026.11.04.05.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 05:59:21 -0800 (PST)
Message-ID: <95dbd8ec-c31e-4410-a12a-e504fac36fce@redhat.com>
Date: Wed, 4 Nov 2026 14:59:20 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2] net/mlx5: macsec: free struct mlx5_fs_id after an
 RCU grace period
From: Paolo Abeni <pabeni@redhat.com>
To: Joas Antonio dos Santos <joasantonio108@gmail.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>
Cc: Cosmin Ratiu <cratiu@nvidia.com>, Boris Pismenny <borisp@nvidia.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <179313582625.87630.11382992904624255106@gmail.com>
 <c0021e03-2590-4aac-b4ee-9a8fdf26d520@redhat.com>
Content-Language: en-US
In-Reply-To: <c0021e03-2590-4aac-b4ee-9a8fdf26d520@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/26 12:39, Paolo Abeni wrote:
> On 10/27/26 22:17, Joas Antonio dos Santos wrote:
>> macsec_fs_id_del() removes a struct mlx5_fs_id from its rhashtable with
>> rhashtable_remove_fast() and then frees it with kfree() right away.
>>
>> The TX (SCI) table is read locklessly from the transmit path:
>> mlx5e_macsec_handle_tx_skb() and mlx5e_macsec_tx_build_eseg() call
>> mlx5_macsec_fs_get_fs_id_from_hashtable(), which does
>> rhashtable_lookup() under rcu_read_lock() and then reads
>> mlx5_fs_id->id. A transmit that looked the entry up just before it was
>> removed reads freed memory.
>>
>> Before commit d4ece08f4b1d ("net/mlx5: Maintain fs_id xarray per MACsec
>> device inside macsec steering") the SCI table held struct
>> mlx5e_macsec_sa directly, and mlx5e_macsec_del_txsa() freed it with
>> kfree_rcu_mightsleep(). That commit moved the table into macsec_fs.c
>> with the new struct mlx5_fs_id, but frees it with a plain kfree().
>>
>> Add an rcu_head to struct mlx5_fs_id and free it with kfree_rcu().
>>
>> The same issue was flagged by the Sashiko AI review as a pre-existing
>> problem while reviewing the HW-GRO for PSP series.
>>
>> Fixes: d4ece08f4b1d ("net/mlx5: Maintain fs_id xarray per MACsec device inside macsec steering")
>> Link: https://lore.kernel.org/all/20260909065542.4B80D1F00ACA@smtp.kernel.org/
>> Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
>> Assisted-by: Yaga Agent HackerSec Claude:claude-opus-5-5
> Waiting for an explicit ack from Mellanox.
Actually Dave already applied this one, but the bot did not catch-up.

Sorry for the noise.

/P

