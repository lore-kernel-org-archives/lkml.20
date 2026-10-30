Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348559;
	b=XbAd90zu0nxVaZpUvC8T7wPGETOHRDMsNIz0e2OTqmYdj/PVORie+cSfJOBQZkYcNwjL
	 PrsRDCj0qTNwJwcMPXbHpHgAO9Jc/KlLXGnU+BsJcw1cL7lU8C5Gh/ZRi/SF3ZMN50ScC
	 JpLDPq2rZSMK2k8BWHjlAPTb2TZtYybKMtfNp00QJoqrieJEZF4umqKn6NAHKAqQEwGOT
	 Fm9eccgfmiRZ25qpMgcGhiDuunqauYac0cPKwzoBn1mPewDPkqIf/Jk4rCHCBtqeCv69Q
	 Ub43ArLVMweXI6ReM21O+CauPdhPaTOuiYXjzaJ8VpkDOqEpRq3d5XKFoPxvyH3+yZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=v92GAJjZbomnBYNnJfUXzhExe9lvts+O0oV7sTd25Fc=;
	b=GxqIntu1aWJdp0j2F9A/vfgfXpm1ZIMM2On1qHzRktWcmcT46LDeOcjpezZD+z4/2zcq
	 EEYvL+stNxxFqOnuV8P11plBJZiA9WnoDDddu6qDbk8rqFr6e5B3lZeR5jcxbDboVwJaE
	 T4F440Q8gW7AT5OEB4vHaXZKEt2+POdHof39No/7don6OR+/RAyt9EPwyw3npkE9oH/Po
	 k6NdDH91zgxeXndQwRR5n6HxRjD3qflkHhxHiYFb3UblHv3wv2r3Q1ohzVsrKAld8fdsU
	 SR4keTIuyBvocv/HCORewfYJ9r3nOcFIsZOpcqBvs+4ZRuJ9Q8OlU5iuw9KOwOLDWew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=CqKLbhic;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF11606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAF11606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=CqKLbhic
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso393376f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1793348557; x=1793953357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v92GAJjZbomnBYNnJfUXzhExe9lvts+O0oV7sTd25Fc=;
        b=CqKLbhicYDHaXCZRwL3p04ldrDIvLGZvyz8To7GnYLehyD1KBe48fJ5J8okkQuweg1
         xq6TRrsSXnOkToaOr5M/TaxfEX52N3jFJ3/F9ZxsiwGFa3lASuQPS+RkOhOKneDtbaLE
         LCAkvHRIkB4QtWolLc2RuHzeTOc+2fvGdY3mrfGFhEjQ3PvmMhoer40y+zfWC69lKhpp
         y/uYCkyabqWd9k82czHpVqvtlMy8lG78ScTRmaSpBDtZ79Vmr4Jc1P53PCkHIQVOc5ZB
         OFP9CoSCDKu+fmTvDfDeGOopMl6suY9bl6LBfyMPRG4InFqp/qAuPqwsF0DSYjBINDUs
         KFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348557; x=1793953357;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v92GAJjZbomnBYNnJfUXzhExe9lvts+O0oV7sTd25Fc=;
        b=gRWiEKnnEroI+EhoRePZ4dkpMmvWHj0wrGJJe3mMo3yzMH5fUK6eTSkU6Scvl0ZQb1
         aqC2s6iElaS0T4m3HY4NFOFxnRvAiQlkeOSTKAGMN5h/FacXMCQFuSNzyE/GaykKEZtm
         I2Xe+pYxEcGqzuMdeFK+dzqDgPQn62o0xk6CqEYt4eoJJvqn031BS1sBIyc9VL33WYve
         vQTMWAavzhyKbWh+b7JaiaGxBGCYI7hLMSTbPOJMXWZDV5r7NnD7c7qgHm/4jUrFUa7/
         qSdMsJIQ5gB6Km+gdZZdA7/OQHQM216vWwKuPMA3OQHgFBESNy65x9cqjwMacievqnpH
         iKAA==
X-Forwarded-Encrypted: i=1; AKwUvBx4KXK+kWEHlfr/fn7MKM4SE+eT3hxiaTdQ50ZSSFBghxFRwQEPVH7KUB0rxFjJsB8t+ibSztkJSqX9duU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhKhCv4xjxztZcKEkmcml+pz3FQou9PMr8Virwt+DH7wX++bQA
	4VGbcnEz4UZe5WvLK2WZjjXeGixNYWGeNXw4INlBj6PgsqI2wfQgZ5V4EbUKw81agds=
X-Gm-Gg: AYBFou1HQEY2nM2v9cQ9Y81mAIGoiHm2IWWg8ow53NkHoWgj77PyFZ6gLxxk5NhnnyW
	QWXulaVbB92Wukq5akgTFveI2xLIwWRodIO5AVHT2KAALct6qaBcrPeku2jWCd5ARfZ/lqApk/P
	ZVrJDPlIt6QfN6EU8ovtTcaVySCulJ1zK4lvK9hxBVS1gqeYpeJW5TxXyRCwkFv2OdBRIcD8bxS
	3i9WiYRz56GczQBccmAFuJJij2IVIXyYLrWgQPTcEm0wX+EJVuTPi+ZwXTDfrvo7NQ0oWEFAixi
	LvXW4JzgaF+2Yj8HiA8QZ00b+tmM32RMOOZt/vY89d/YYAUyMIOpFJotJpynLPlM1TgSv5rOH6v
	P9ZU9upzLlvG9UJ0Xit85aNpkxns/YfF0CC8gNDMSOEzYXFKL4lBZZcIy3c1L7b14XTAkbOorF/
	AoR2JNG6ZZ01CQBIyykVx3AfECZU/2q+Yoqc2YGJpVyLFfzleg+0W4uJTIwhnR+MMh85p3B3rGt
	DgF40daDFZMmpTgZLgGrZpK/1UdeNLheDXkCqGCVEb+PoBvKoYWnTL84gr9f43FjCo/FYSRba2Y
	muZDb5kDgtPHzGcLn6/OjOUrimP5Se9J7EFWG42v7SWL+bJlznm8qVaJSXM=
X-Received: by 2002:a5d:5d09:0:b0:48e:64e2:4883 with SMTP id ffacd0b85a97d-48e6e2dbb76mr3748074f8f.8.1793348556634;
        Fri, 30 Oct 2026 01:22:36 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80306sm2116937f8f.33.2026.10.30.01.22.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:22:36 -0700 (PDT)
Message-ID: <788c84fa-12a4-4282-9afc-438d3206f21c@blackwall.org>
Date: Fri, 30 Oct 2026 10:22:35 +0200
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
Subject: Re: [PATCH net] net: bridge: mcast: release the EHT host budget for
 zero-address hosts
Content-Language: en-US, bg
To: Cheng Yongkang <teel4res@gmail.com>, Ido Schimmel <idosch@nvidia.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 bridge@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179328314076.648427.17991367257682028617@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <179328314076.648427.17991367257682028617@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/10/2026 16:12, Cheng Yongkang wrote:
> __eht_del_set_entry() decrements eht_host->num_entries only when the set
> entry's host address is non-zero.  A report sent from the unspecified
> source address 0.0.0.0 (or in6addr_any for MLDv2) creates an EHT host
> with h_addr == 0, while the set entries created for its sources have
> non-zero source addresses and are counted against PG_SRC_ENT_LIMIT.
> Deleting those sources never releases the host's budget; after 32 counted
> sources the host stays at num_entries == 32 and every later counted set
> entry is refused.  The same sequence with a non-zero report source
> releases the budget normally:
> 
>    host 0.0.0.0:  IS_EXC/ALLOW1/BLOCK/ALLOW2 = 32/0/32/32
>    host 10.9.9.9: IS_EXC/ALLOW1/BLOCK/ALLOW2 = 32/0/32/0
> 
> Only set entries created for a non-zero source address are counted:
> br_multicast_create_eht_set_entry() rejects a zero source when
> allow_zero_src is false, and __eht_lookup_create_set_entry() increments
> num_entries only for those entries.  The auto-created wildcard entry for
> a zero host uses allow_zero_src == true and is not counted.  Release the
> budget based on eht_set->src_addr instead of h_addr, so counted entries
> decrement for zero-address hosts as well.  The uncounted wildcard entry
> no longer decrements the counter, which also removes the converse
> mismatch for non-zero hosts.
> 
> Fixes: baa74d39ca39 ("net: bridge: multicast: add EHT source set handling functions")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>   net/bridge/br_multicast_eht.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/net/bridge/br_multicast_eht.c b/net/bridge/br_multicast_eht.c
> index 18eaf9c..548ad78 100644
> --- a/net/bridge/br_multicast_eht.c
> +++ b/net/bridge/br_multicast_eht.c
> @@ -167,7 +167,14 @@ static void __eht_del_set_entry(struct net_bridge_group_eht_set_entry *set_h)
>   	RB_CLEAR_NODE(&set_h->rb_node);
>   	hlist_del_init(&set_h->host_list);
>   	memset(&zero_addr, 0, sizeof(zero_addr));
> -	if (memcmp(&set_h->h_addr, &zero_addr, sizeof(zero_addr)))
> +	/* Only set entries created for a non-zero source address are counted
> +	 * towards the host's budget, the auto-created zero source entry is
> +	 * not (see __eht_lookup_create_set_entry()).  Check the set's source
> +	 * address and not the host address: the host address can be zero as
> +	 * well (IGMPv3/MLDv2 allow an unspecified report source address), but
> +	 * its real source entries are still counted.
> +	 */
> +	if (memcmp(&set_h->eht_set->src_addr, &zero_addr, sizeof(zero_addr)))
>   		eht_host->num_entries--;
>   	hlist_add_head(&set_h->mcast_gc.gc_node, &set_h->br->mcast_gc_list);
>   	queue_work(system_long_wq, &set_h->br->mcast_gc_work);

I don't think this is a -net fix, it can target net-next when it opens up.
You can also trim the comment, it is way too verbose for something so simple.

Thanks,
  Nik

