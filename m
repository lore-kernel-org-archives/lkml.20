Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDB3199EAD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414245; cv=none; b=P1iPxQFo5sV2A0bYjwTpfWQJ7+/1YSD2mjJSNbWKwUCICfE5HnIKvpcSUgSP8209rciP3qKdPR6IofHjsgkNEWZnD/v1eRPk4q7xdBm7oZenxztQ33lWLFsmJ4HhbhEl3N6P1Hm7A/jLshry2jSnQpju+yJnad44WAR9LGh0TvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414245; c=relaxed/simple;
	bh=cYLy3DJpZIkpJecSb6NuNNbpB32nOfHC19s//UbQywY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XFGKlpOYDTnuCZUjbHeTCpVs6rtYxed6nA4HnjvHD6oQkbLJQNPK3yvAcYEpE1utb3kac6wzPUSbDypFRMRg64gDZHDZD1HMTrWoTXvT5VOrNk8TVxzyOpxn5TU/8aS8VlednMyhDVZTUtjgCCb+fSuJRD+DhguMK5M3+LELp3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bwKezjjw; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bwKezjjw"
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-86a46577018so5547918b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789414237; x=1790019037;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Bmagr1/j8DSlMpnHTXTSoBqwKOHDTaP5cUCVYcrL4o8=;
        b=O8gsMjIRMwlJDi1XKEhX3vF1Uoe0JnOKQKGSzti6GI0nY1Hho4+CtgwFV5eAtS6nU4
         Nvfp8i87BkmL7n2cEIcqziS3XywoZ+135JqMHMa00dYW6pV5zPXpq/4i+SjfUh8xcFUw
         tyhBzhqvqXZ5TQp2hcQj5L6sjoFomstOIHgzffqORdyFrjJKTXb5880Z14wOIMW49F2M
         EbH3PwXhHre+8cf/XYuE9au3LHiNHkmEVZcCS92yNQMov0ax0Rno5xSt68OpzIvgB2oQ
         LUo794bMjb9HmcyvQFXJs/h9nqoXtrNxMjRNB6DhEuNt1yvRKaG76lLMaGin6ntjxVuj
         /PDw==
X-Forwarded-Encrypted: i=1; AKwUvBywaD0l+0H9bJwVcJRhIdSziNgwbncv9C/4mgtGe5WWvWqSymrmuG3WpOS9ivD1CtnGQZoOGGGeBcNoMhM=@vger.kernel.org
X-Gm-Message-State: AFuF++mcvWPjTXoxvR+FHOgiHDqs0i6cTe7JKmBYChCR9zDvPTW88vxX
	sNwpp2dz/wFiwLanuODHH+fufmRUyBFn+EznXfSjG5ntVBY8h3bVVRR9A8BlPZLOGfO2s/FX8AO
	bo+CZLjZcjrXCkyE+InzKtMI36s74iSrgIxzQbDAT1CQF8MSZc1uuGyDNzqMiz3tiLIES7d3knE
	fld45Td8OAvHDPcmowkVEuzWNlF291/5e6DSg9b9YqPTW/Vu/8sshmMh3etZ9QDR1xaRA9sETpn
	0ZNfN4fRfVmdLfit2ASMvpc
X-Gm-Gg: AYBFou1vfbnNmQbhnv62OrC9+ylMEumdu3wW6ECXxtDqWcuj4BMQkqJQ/ULyx0JM5WR
	Uuq4mwSH9i0ozFiA5C31tXZ9dQ9PpxKrKKQAfAN09BWAVjig1eaxF5qff/xFwI0R7DmVW6Op5MG
	g6BylrYenHx6gveGC557cKvsrGCkVejqIYxzwhfrXeOT5A3ExP/rb3GEpbmgIR2FBFKzVzxthzE
	hw+Hvi7j5KzKMiMAkLgEDjLfbKxCj3bAYoZ2MJ2VhMEUrAjdkSbnpJ6OR+3S9y6TK3RFgcnmtIe
	tlBVggo6YHZiirCizyIf56RiUoSkO7+lq2FzZAWMtJgnj5CCvClVqPXJ8qA7r1n12yHzHZV75h8
	G2I9596HLIc1/3UfbCRAk4YqC6WcSMnAKhYOUxoPZLDOrCCwBlWZr2GzEcb1bOV1yvFgpZI0dpC
	QYckGfY0IV/F0T9nKlPiv4TEUvM5qt6550fHnPgkUM
X-Received: by 2002:a05:6a20:c989:b0:3da:f969:b077 with SMTP id adf61e73a8af0-3db4051bb0fmr8834489637.11.1789414236912;
        Mon, 14 Sep 2026 12:30:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4c65a557csm4169339a12.5.2026.09.14.12.30.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:30:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-912054a1c29so43335476d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789414235; x=1790019035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bmagr1/j8DSlMpnHTXTSoBqwKOHDTaP5cUCVYcrL4o8=;
        b=bwKezjjwUiVTtxcAcmVFQwimG0EiYaDfx6l3K6Qor6OcAqINOk4iT5SVeqbOyvPpoj
         hq5/MfluYjhAR02ZtgGqVtwJQMsNrMMSX/0jjgJFRVq2By9p6GrY+BSixPuT3cvf+qnJ
         NgZvjyyA9JEZjS6LNDpTDkLjdIcbv+qRPU3Jo=
X-Forwarded-Encrypted: i=1; AKwUvBzkD7Z4CJO9caOLPbc9OiD2P4uNLae9gETBXSOSS1QXc0KmcPrjihnQzOWfTmt3ipjenNO3TNK3K0Adyes=@vger.kernel.org
X-Received: by 2002:a05:6214:4883:b0:910:3fe4:e405 with SMTP id 6a1803df08f44-9122e4ccb6cmr67098756d6.1.1789414231482;
        Mon, 14 Sep 2026 12:30:31 -0700 (PDT)
X-Received: by 2002:a05:6214:4883:b0:910:3fe4:e405 with SMTP id 6a1803df08f44-9122e4ccb6cmr67097416d6.1.1789414230798;
        Mon, 14 Sep 2026 12:30:30 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4b3dcesm102481586d6.31.2026.09.14.12.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 12:30:30 -0700 (PDT)
Message-ID: <2c901027-93d4-4db2-8cac-8b61aaa6e28d@broadcom.com>
Date: Mon, 14 Sep 2026 12:30:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: bcmgenet: restore the hardware filters on open
To: Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org
Cc: opendmb@gmail.com, justin.chen@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linux-kernel@vger.kernel.org
References: <20260913190052.939955-1-nb@tipi-net.de>
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
In-Reply-To: <20260913190052.939955-1-nb@tipi-net.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/13/26 12:00, Nicolai Buchwitz wrote:
> bcmgenet_hfb_init() runs INIT_LIST_HEAD() on priv->rxnfc_list, which drops
> every rule off the list, and bcmgenet_open() calls it on each ifup. Every
> rule the user configured is silently lost:
> 
>    # ethtool -N eth0 flow-type ether dst $MAC action 0
>    Added rule with ID 0
>    # ethtool -n eth0 | grep -c Filter:
>    1
>    # ip link set eth0 down && ip link set eth0 up
>    # ethtool -n eth0 | grep -c Filter:
>    0
> 
> Initialise the lists once at probe and restore the rules on open, as
> bcmgenet_resume() already does.
> 
> Fixes: 3e370952287c ("net: bcmgenet: add support for ethtool rxnfc flows")
> Signed-off-by: Nicolai Buchwitz <nb@tipi-net.de>

With the sashiko feedback addressed:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
