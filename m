Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F429476046
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931867; cv=none; b=qfNZZzqWBZqPuhuTE7hiY6XS0drgE0FjbhVSi2BTy1bicgEj5jzl9JssmaCxz2QtHQt6bx2r/rvvxm7475TVIGLTs12+am8ySnA06IQJ56fHeyQ9u3emjiXZ87Ck/ke9wAazyFshtpp9XcqChdv38eS3CD1v2c8UnhMuy4LTvAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931867; c=relaxed/simple;
	bh=ilYrMoTlsg1Y4InXOxpgZzEiE2/mJCDjKnkWIYMjQ0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdfUDFvlPTTGcgBVEd5GtGk8bozx1fu9b/D/kW7QZN/sdax635eSRMSKWq5ykM0N7svNLeY2HG85L8w2+HmmW0rNJdVWHNZRU3ThJt0ZhWS8O0ymzBsuVLHcnKmBybSwAZ82xptF2qNg0ZhhxCFgVwoeviZYqEQBFO2gIceiH1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FxS5s9VD; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FxS5s9VD"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3a706146559so2116008a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931865; x=1792536665;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=szv27faHJlz2tiNM/SyqJqxcXqx67aJHGdSyBn7hfgA=;
        b=nd+zonzM0/1z1v+ubLd21grHte93WNjqnN+/D2jY8XvyOM7JTJS7C3LeyzfNDwFoin
         QDe/GQoDNjVpbOFTkRyhd0efQGivdZOAHM0Z8PWKZBWKuOxGJdu121+Rx9qdXpDhsvsv
         orRK6c4ats4eR+xFDgwsMdAaFwbwNlBvVO0jmFxbsHO9g0ayq0e5wcGafMJMcsE/oMYW
         +2mVbma2GZ5nNGm3R+jSZQIRC6c+g13gAQQkJ3ID4rQ3QuSWTIbblY+mYZg0KNao/5Wy
         NxrKuO9W5n2iL9OybHvMx4AJgsTRiJp3kXf+99asPQrNusgTwxpGVLvym4oGYwIEJc3z
         SeLQ==
X-Forwarded-Encrypted: i=1; AKwUvBy29rYBs90ddjWz54T6yQfKMw7ZMW5ppr+bOM35r+kalxNsEyYuow1brKkynMc1Dzi2GzKC2MDNIRt3gcU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLch8AtENf3KqgzFDj+iq2ZrPmP8zWzFmVqPsGp427WmvNyDr3l
	JVBa4s8gmlD0BmLlusRR45aj9KssR8PlWcU1ZcZrriy0ctVub31PYGaJ73HE432pAbh0ngbZCEV
	QaLAPZWfNThlUMikHecQYEgs8kL0842VwpS5x6V7v3qseHEU+1h5b66m9glZevKioOxfDNmYXHt
	Rv5YVNqInsA11Djvdc7UER/k7qVAhkZUrBPp0poSvDFDn3Do20NMBLVKl4+Fs+e77DdDopSyGjY
	q3QPf0U/26qpPnA0YOpvjga
X-Gm-Gg: AYBFou1QErVGthVsFgWr/mpNq+Vk/zAfu8tpGVYS4WQ6of1k2QqLOFlyOHhA6OLmMLi
	IfaL/d0ayF/2+hIrszPJ2Vh69vPutEH7mnrQ6Aui/B2kwPjj64D0eGFWqSWBMW+97VVfZH1XgQD
	F197dIRMSvHkzB+P2XogWKIzULugREH7LieoB1Nojm7gBBJft55q4osqA3KiyJ398OMoD2qsapY
	TKjtvJR2xPY8VSKmz8vdXDgbGZxIS4vy0c9YClvhY0byDREhOILkwfK/7VEAq3OCc8zT4tbb5fW
	N55eX7o1FZbSmZZbGkqe4I0Io/nvDKhJIN8zumyFM9saxzsJALnw0XqiWhTu8/TwKoSvNuVIeFz
	N0xBdYHpdiXAj91i8igCXAt6QKLEg0KISvfDAa+vdytlbEL4dfQdhyTAPxHlFDDV0uMsGG6P0BD
	hVlp4UeasW/va4Rs8EnnfIZvGbcpWXqOExtkP37ioogSw=
X-Received: by 2002:a17:90b:2889:b0:3ac:eeb:e0ed with SMTP id 98e67ed59e1d1-3ac0eebecf5mr5298832a91.36.1791931865368;
        Tue, 13 Oct 2026 15:51:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ac5f1ee024sm529068a91.0.2026.10.13.15.51.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:51:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-535f9dbae1fso13957671cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791931864; x=1792536664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=szv27faHJlz2tiNM/SyqJqxcXqx67aJHGdSyBn7hfgA=;
        b=FxS5s9VDMYqTPrRA4dvgx5h6tgSmwOD39t2o9gfw3XO/s+oreFrETMXhc2noBg2xHS
         i+7aAu7ohQPEsx/Tee0Pdgmt9sw34HIlwPxTnOKwXOfnoXzlUmjjB5tKui5ixpVyocdS
         ohkYyg3XC5JuTGOONnt2CpsACBkTodqLEJjKQ=
X-Forwarded-Encrypted: i=1; AKwUvBzgqIDjUFpoEQoMgH9uJSssjoChecVzq6mdurTPv4FD/rvOuOPyoC3u2rlA04hYDY3A1fwCyHI8CodWIV4=@vger.kernel.org
X-Received: by 2002:a05:622a:e155:20b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-535fc0e45demr17287721cf.59.1791931864177;
        Tue, 13 Oct 2026 15:51:04 -0700 (PDT)
X-Received: by 2002:a05:622a:e155:20b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-535fc0e45demr17287541cf.59.1791931863745;
        Tue, 13 Oct 2026 15:51:03 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b38700sm37093986d6.11.2026.10.13.15.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 15:51:03 -0700 (PDT)
Message-ID: <e0f1afe8-2470-4f76-b612-fa141a2d21e5@broadcom.com>
Date: Tue, 13 Oct 2026 15:51:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: bcmgenet: unshare the skb before writing the
 control block
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261009-nb-genet-shared-skb-net-v1-1-c6d0a841977d@tipi-net.de>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20261009-nb-genet-shared-skb-net-v1-1-c6d0a841977d@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/9/26 03:10, Nicolai Buchwitz wrote:
> bcmgenet stores first_cb, last_cb and bytes_sent in the skb control
> block and reads them back on completion to free the skb and credit BQL.
> ether_setup() leaves IFF_TX_SKB_SHARING set, so the stack can resubmit
> a shared skb that is still in the ring. The next transmit overwrites
> last_cb, so the earlier slots complete without crediting their bytes
> and BQL stalls the queue until the watchdog resets it.
> 
> Unshare the skb before writing the control block.
> 
> Reproduce with pktgen in clone_skb mode, which hands the driver the same
> skb while earlier copies are still in the ring:
> 
>    modprobe pktgen
>    pg=/proc/net/pktgen
>    echo "add_device eth0" > $pg/kpktgend_0
>    echo "dst_mac AA:BB:CC:DD:EE:FF" > $pg/eth0
>    echo "dst 192.0.2.1" > $pg/eth0
>    echo "clone_skb 8" > $pg/eth0
>    echo "count 0" > $pg/eth0
>    echo start > $pg/pgctrl &
>    sleep 5
>    echo stop > $pg/pgctrl
>    wait
>    cat /sys/class/net/eth0/queues/tx-0/byte_queue_limits/inflight
> 
> inflight stays nonzero on the now idle queue. clone_skb 0 leaves it at
> zero.
> 
> Fixes: f48bed16a756 ("net: bcmgenet: Free skb after last Tx frag")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
