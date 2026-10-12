Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604449B45E
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791840554; cv=none; b=PUYjFNlXHekM6e4n2euC/NvNRyQIZm5xW3aqT0dLpz7AjqdKHqvrDyab9FgYGO7jQPGQye+9wBv2CCLf/oxP3giOVs3A3fe+cBBQmoYu3FsxogeeQMWBxcUIlJS5nL2gJzsiWJiEhBKw3yeNgO05kbbEjyY4k9S/iWsGTIk5Ops=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791840554; c=relaxed/simple;
	bh=tzs5CD2tSnlyGalWGG9z7ThJaIEC0CKx/vNEZpG175o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j2zoOw/BTNxGx0VwNpjX6UfoW5/kOyV/sYXm96qYCO9440KpUaxje8ehKBtVXuQlTvozLDFaEV1SqL8Y69qWVfdzRDECS/H1EfhgfXtAoXCq50Kq69JySbddfzbcFZC4jFVIs/z17Q/eiIGcuRXbvvvccDx0WPkYxEAS08/ByLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Wv3m4O8S; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Wv3m4O8S"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso1062678a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:29:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791840552; x=1792445352;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jv8RLmh+BBN7OwXpsRNHyPmSqTvyEIgD1ZiumdDwpGs=;
        b=k27mVlrwpvWtAY7pUNU8ap5ud0Qn19yFPysOCk4SNCME4koTa9hsmEdX/dKUK5u/3O
         czI8U/urOLS+QXbQNQFl+MItt++1FDKsN1HpxC2k+wQIfVFuWEKcxN7Jl0+gqoudNpgQ
         d4l6RT1gJ+nZa2ERqVQgoHiPj5xXaiA9IuZOgAxbwR0I/vFs1+IW4qeWoSRRwk6EenZT
         P56NS2fmcIehUGvPghpRueSr5Bm0jAxwxl4wx3NKdJ6G/AvXrt2OfPJFVkmIH84mt/WA
         SNNH6DH3n+hK8ooR+5v39vPOO9iu2M3P4+PiXthpt00zUuHH32dgJ0/o5p2mK1ibFMEH
         NWUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQOjE+k6d+Gmz85+579ATLGdFLnS5wgF6Cn/1EAEDgYJXHSZLVQ7/kRWLN8t+PI4S0H0klHzq3qIBD0WI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJAk8mxdsdwU33gFNRQp6LkXx3Snma5V+pKhHfshm7uj+sD/s7
	CiTdltX57yAiaqc6qxYLDMxr3cSWFcBJtwpw5uVvKOIM1MYJqVswQ9F3Jk6s5U7tnJWhFjJ1GWG
	IurjfQpwB3N9VlTfaOfTtamPTlbOWDIC7uv0RCiskEGTeZHtNankxSd/3DoD7l+obTHyXxQFuH3
	4kP8upvVnwaDKjUAdS29kjBBK317HSLAjG21o3FJ3vot4ljOmcQMi4tEW9orGE+QE+wpo8oljW3
	jlHbiScG7SXJ4Vrp7I0fLgZ
X-Gm-Gg: AYBFou2zswt/9imVn9TdhuMQwIQKfXjwvRVW5DN4Wq6sKXFREREGRTr+E6bCAVfOAXX
	AvhpLgw4moPy9ky+SZQN0eQs3lyfvTxoedX3AZUQpxcaAnqJwTwfrlP4SDO96pl8AdGpDiucd+L
	Mz9cUcjKBKabjicO9KR4zDMkwYeWq0P/LeU3OIujp6mnWIOAQKeA13Cia3AFtxYFoG1I9lhw9OC
	5WTK+hYAWm2R4kKN+rzigg9FzwpXx9JQJDzpl9t68SPIqexXRkabXC9D1+jnVyMCquZJozLd+GO
	zYwEF7wQNBrMAEiEfBhKeI707jfsx+xSYioEowjpUkz5U4xqSnsRVnOmQSB9mcyCRtzEA72HWmy
	XIrPIaOHkUY50S3LgO6MtevvrLq6oPyRYpyniv8s4CNfPwbU8JWmA629iQ5yBA8nYp2AxqwotCe
	WKKLAcX+lKvXd+W4U9St7JxJN81ATcxCVe9ZCYSc9IThM=
X-Received: by 2002:a17:90b:3143:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3ab3ac95141mr9820500a91.56.1791840552003;
        Mon, 12 Oct 2026 14:29:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab3780aac3sm6324690a91.3.2026.10.12.14.29.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:29:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3515266f6eeso4365088eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791840550; x=1792445350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jv8RLmh+BBN7OwXpsRNHyPmSqTvyEIgD1ZiumdDwpGs=;
        b=Wv3m4O8SYjvndQwSS2npIyxJB0bzneyOMWoPKzU75iELUIgc7gtKlm7CbYddbXJsa5
         oGgrdhCjvJy/vPyL/JsCRM8JGnR26VszJnEuYdv2YwN4LIVyAvO0E/vaJ8cvUy+Go7b/
         cv2L8Bz4Ev8FvV45DCQ5ZTH/1ZGJxAEWwWtv8=
X-Forwarded-Encrypted: i=1; AKwUvBzXhAVXvkahn2wgqXMV4B/me0tF6DB3NrjdyF1mch6AZhOmofQST7sVvK1xPS05C5xfPe4GfUDUSpIDy2w=@vger.kernel.org
X-Received: by 2002:a05:7301:fd8a:b0:351:5151:95d9 with SMTP id 5a478bee46e88-3537de0069emr13002065eec.3.1791840550018;
        Mon, 12 Oct 2026 14:29:10 -0700 (PDT)
X-Received: by 2002:a05:7301:fd8a:b0:351:5151:95d9 with SMTP id 5a478bee46e88-3537de0069emr13002027eec.3.1791840549169;
        Mon, 12 Oct 2026 14:29:09 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb2fd33sm35639959eec.28.2026.10.12.14.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 14:29:08 -0700 (PDT)
Message-ID: <51db5a29-c3c0-429b-b067-8762e683a8ef@broadcom.com>
Date: Mon, 12 Oct 2026 14:29:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/8] net: bcmgenet: ring the doorbell when the
 last frame of a batch is dropped
To: Nicolai Buchwitz <nb@tipi-net.de>, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Justin Chen <justin.chen@broadcom.com>,
 Pierre-Marin Leclercq <pierremarinleclercq88@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>
References: <20261012-nb-genet-mtu-nn-v2-v4-0-2e2e3bfaf8cc@tipi-net.de>
 <20261012-nb-genet-mtu-nn-v2-v4-1-2e2e3bfaf8cc@tipi-net.de>
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
In-Reply-To: <20261012-nb-genet-mtu-nn-v2-v4-1-2e2e3bfaf8cc@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 10/12/26 02:00, Nicolai Buchwitz wrote:
> bcmgenet_xmit() only writes the producer index at the end of a batch. The
> error exits return before that write. If the dropped frame was the last of
> an xmit_more batch, the frames queued before it stay in the ring until the
> next transmit. The queue is still running, so the watchdog does not fire.
> 
> Found by a sashiko review, not by a bug report. The existing exits only
> trigger on an allocation or DMA mapping failure, and the padding in a later
> patch adds three more.
> 
> Write the producer index on those exits too.
> 
> Fixes: ddd0ca5d60b3 ("net: bcmgenet: add support for xmit_more")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
