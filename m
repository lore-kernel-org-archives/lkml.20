Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792749433;
	b=VKt7vtJS6pMzdfo7Nl64sELK2S6CI7hrYPgcY8PPw85ET8JmVp0FkzIK1sA6rwYlH2us
	 5FsPvMee0myddTeCqpqhxdUwDqLCvdtx2C2OZkLhziZKrhC3KLaLYwlLF5sEtIOD7E46Q
	 XiSmbn4enn9DuTPEbnrPC7dPh7boCki3SrPN1W2rWyHCZm//29D+WIajkeO/d3MDKUyjz
	 frcsUdTPSJnAt0MQyBa74rxSfQ8oqZGodXa68it9bpKxHVWESUtnkhuI08QGRW532evqN
	 0UwFFnB8MD2luqydSc8Sg7mAFp3tVpVGi/YKYIrruiMBVWLGRRpQQwAwCPNV/35Ikhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792749433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5zYKXoFoRrW/rjS0dALsJeII0OIOKVqHguJNCNYo2aI=;
	b=zuloro0zet5mO2bzsZ5JsoApZWoCEPzqgF/3Chy3oTW2F4dOs0cAN9yId+jvB1DCYhQF
	 Xag8AS5EH7RJZL5vCg47wae8nKUrJAWqUmvgtxQrwhXQpjccKkmydrE3tSMKb8yx1d/0t
	 E54HKdxBaU6qAMtNUW3NlHEJqBTbNuIdFypvLDMxYGaSCc2xyvh15gCE1h7cS9xTRQuwh
	 BNSQ9vdKDwrpnzwkuCFw7wYSemZSRfsfuup5BpCREo0TULGKBUYE47wpy3tbsiQYUDnwA
	 X8+pVEW3xvLCM+M816yxhH52O6idV17kfocKhKZBTWnstPb+rn6sR+szvEaiipP8x5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=lPUKPWt6;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FE9606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6FE9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=lPUKPWt6
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso481320f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1792749430; x=1793354230; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5zYKXoFoRrW/rjS0dALsJeII0OIOKVqHguJNCNYo2aI=;
        b=lPUKPWt6Hycmbn6IYRhAtJBMMMtFtAg/QHyTDYFareIA8qANZBrOnuKO2bsyCcqKz7
         oL8bBFvkG2pzR6UHOK+06X1Jmc+eQZHAN7xBZ7oxRiY1YDz8I6iBZElzHNpqMo7SzBOn
         y/pjgu4kvTWCLlty4gU7xrkC8OberYR6zMo/xyFl2vIntUlRQ1cZe2rn7BnJd9QGe7eu
         Xorjiy6tTIA32RMvxo5zit8lBYdKS+2WXjfHkpmOOcxnAItWJlnF3dOBp+EcMlTlgbIb
         D1PRW5TFNhg/6OWYNCrEFxkelp/LmO8i9RlhzWtP5YDBu3PgzaMwZIge/afmkAxr1S5x
         Pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792749430; x=1793354230;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5zYKXoFoRrW/rjS0dALsJeII0OIOKVqHguJNCNYo2aI=;
        b=HGbKSgkFN6+IYIO6J2VCTbxfAo5QkwQnzXBSr4fz+yACGDHNhToLSH/dHU2+tIQL6o
         oA8nW4InhnWf4n0V9z1b7kzeYFe2AAyBpD6wc94kf9flu3X+NpySLVFDtQEU/S/nrOSJ
         ssYb790nzPIyK0NVOcyLa6aX+6x2+P4taEU/f/OtiNaNkDfTC+hSIaf12QA/fzgVGY9w
         DEfX3iRpmsGJ1yLOrHQUUcfC0i7//ifrVjx9IneWkkHm8hxtV+utaak5o8BAGAN5lH6f
         Fa8dcnF/fZuTVC1vIXhClwVcl31STbtOPu5TZXuOHk7TvzoiTg8PXh4HSZBE6cvOvlc2
         T0nw==
X-Forwarded-Encrypted: i=1; AKwUvBwKM15PAuGQ3jlg2dkCKacDbTi4kW0zbSdcP7VDfJUNtKnReiHG/wvzJATAztsCHCQ7uOxXMNav+fWyiCY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/zpFrvHAOALEU6YjWkwpt/wo1LkQaH1vdAp+wLULXfDK/FI1i
	nUEbP10xHMTHm8wGLFnTmXt4lWuWAqO4UUYBHIjO3oJLysesC89XKrCDgRa4c+ko9Os=
X-Gm-Gg: AYBFou0fWHYR4e1fwXFu8ADCFw9ODM2ojS4p+IzZxGN0OJ3URIQzTmmHonZwRFG7rs+
	tOkKuTLpoKyAST7t6OCHFhM5b4EWT0i2/jyNbZx4Cj1+vaBY8cI0B7IvqZLZptuffhZ2xhLjrlA
	QGNPrcdp+bRkSwAmLJhxYzJ3C8hPfKBW5M9Gw9+DSD2bgv0fmgC383VTSuxRejEStfwMBQoT0Ak
	6QrFySxwMgB4r3CzbKJKiHeBRJZLVDKxyNOkDuqp+bPR7iGO6ioQ7eZxZr/wTZWtCVexapnsard
	lTJUOliAX/REE8Slc/8cbomUhXhTc+Ew55pPVkLXD81pPGAezFRhAalzGRPSlFS+ku5L1Ut21xN
	UJcShq6Yjb2a6uU71tfqI8qT4lkhNGevJ5jBrCuUqrJhN1Dp3F7d3bGFLrWWURvRONI4fruwAzf
	pEA5PGVcDKpLbN6MIITg9MpT1djP3fTLvDBYhQ1C6OOcI+EfXWOoU0OsRHgUMEU4JwId3nS6A/R
	w2XEyMzoYkNl1fL7kJCBl4olfYd8bd9QnftGFcEydqLW8psYd1D/UitXrC6bFfarpEgbOH23yU5
	q28beFNrwA==
X-Received: by 2002:a5d:4c4a:0:b0:487:27f9:842 with SMTP id ffacd0b85a97d-48e385b0220mr2207570f8f.55.1792749430068;
        Fri, 23 Oct 2026 02:57:10 -0700 (PDT)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3804872csm3994786f8f.34.2026.10.23.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 02:57:09 -0700 (PDT)
Message-ID: <cbcff85c-49f5-4920-94ee-53dc10c9ad96@blackwall.org>
Date: Fri, 23 Oct 2026 12:57:08 +0300
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
Subject: Re: [PATCH net] net: bridge: do not bypass port state for MST without
 VLAN filtering
To: Tobias Waldekranz <tobias@waldekranz.com>,
 Cheng Yongkang <teel4res@gmail.com>, Ido Schimmel <idosch@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, bridge@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <179268538303.70821.3493915601694605045@gmail.com>
 <877bj8iz0p.fsf@waldekranz.com>
Content-Language: en-US, bg
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <877bj8iz0p.fsf@waldekranz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/10/2026 11:47, Tobias Waldekranz wrote:
> 
> Hi Cheng,
> 
> On tor, okt 22, 2026 at 08:26, Cheng Yongkang <teel4res@gmail.com> wrote:
>> br_mst_is_enabled() is true when the bridge MST option is set and the
>> port has a VLAN group, and nbp_vlan_init() installs a VLAN group on
>> every port even when VLAN filtering is disabled.  While it is true,
>> ingress treats the port as forwarding and egress skips the
>> BR_STATE_FORWARDING check, so that the per-VLAN MST state is enforced
>> instead.  That state is only checked when VLAN filtering is enabled,
>> though: br_allowed_ingress() returns early otherwise, and
>> br_allowed_egress() only checks frames that were VLAN-filtered on
>> ingress.
>>
>> With MST enabled and VLAN filtering disabled, no port state is enforced
>> at all, and a port in BR_STATE_BLOCKING or BR_STATE_DISABLED still
>> forwards traffic, defeating STP and MRP loop protection.  MST can be
>> enabled in this configuration, since br_mst_set_enabled() only requires
>> that no port has a VLAN, for example with default_pvid 0.  In that setup
>> a BLOCKING port kept forwarding broadcast frames while MST was enabled,
>> and stopped when MST was disabled.
>>
>> Commit 8dca36978aa8 ("net: bridge: fix use-after-free due to MST port
>> state bypass") stopped this bypass during port deletion by also
>> requiring the port VLAN group; the bypass itself remained.
>>
>> Also require VLAN filtering in br_mst_is_enabled(), so the normal port
>> state checks apply until VLAN filtering is enabled.
>>
>> Fixes: ec7328b59176 ("net: bridge: mst: Multiple Spanning Tree (MST) mode")
>> Assisted-by: LLM
>> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
>> ---
>>   net/bridge/br_private.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
>> index ff746f036f54..85065304597e 100644
>> --- a/net/bridge/br_private.h
>> +++ b/net/bridge/br_private.h
>> @@ -1953,6 +1953,7 @@ static inline bool br_mst_is_enabled(const struct net_bridge_port *p)
>>   	/* check the port's vlan group to avoid racing with port deletion */
>>   	return static_branch_unlikely(&br_mst_used) &&
>>   	       br_opt_get(p->br, BROPT_MST_ENABLED) &&
>> +	       br_opt_get(p->br, BROPT_VLAN_ENABLED) &&
>>   	       rcu_access_pointer(p->vlgrp);
>>   }
>>   
>>
>> base-commit: f4377bf85887f57b59abb5479f7660a81ffe4449
>> -- 
>> 2.34.1
> 
> I suppose the other way to fix this issue would be to require VLAN
> filtering being enabled in order to enable MST filtering.
> 
>  From a user perspective, that seems natural since you need to associate
> packets with VLANs (i.e., have VLAN filtering enabled) in order to make
> any use of MST filtering.
> 
>  From the bridge's perspective it might be less desirable since it would
> mean that the two options would become entangled - the bridge would have
> to refuse VLAN filtering disablement while MST is enabled.

Indeed, that can break users because of new option ordering.
I'm sorry but this is a no-go.

Cheers,
  Nik

