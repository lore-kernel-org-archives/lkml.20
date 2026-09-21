Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690342E542C
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790027990; cv=none; b=DWWgIoM5M6NYr4ZOHZEDdeOGsVv1Cmmn5WWHys2Fa2cuA8KOkq3lqMTXCpjZiPR/4w7SNPZTAg/GMZ6N/msGQpj8CPrGoMqhDdxEpf5hyVNZLU5zQTq/RF8WY3dek13O/lcu4qE6JzwGpsIFC5XfRc1OkcDIQAqUrvTYrB8EADI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790027990; c=relaxed/simple;
	bh=5y1C1HMAJ8SKcITEA3lkNHPiYq4pBhGi2fZgxuDx3aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eWwj9Z4PWwTNMGXJIrFCA56rU2HLSO1kJRGiii/lJkI1XZcBFmtmZxYIhuZ4gLgqG95KC2Ze/wmB5lvjsM+qJYG5pYRDCJcqGEU3lRGeC+7IB9E1ibVCEtyYjo4Q3YYIhc4J9mwRTNPcsAcHVkG3DbpMH57K3KsZFbQJlShAx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBSlB3uq; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBSlB3uq"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a9a2b95b72so5664719a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790027987; x=1790632787; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSlFAvdvk76O8etMUCMxW34HuIJRKYdAfu//0LmiLks=;
        b=jBSlB3uqmKDNy6mfQH1hfrG67LIAUWRcLgmj6It3v3UNp0f+8mCN7kkxIP8/rCdapD
         9e0R/KHT/9xBJ/f4gmogfuYfNU3CJbaYUI1yv7uBVYVBTyJHUAUWGYW1b2/YqZ7oZ8ZR
         9dP2la7Tpej45XsSi8Mp8Ljm/fHOMWulfPmYhIP1ulaAWw4qzX4RktNWXOQiqRNXtv0T
         Nxxfv+SAcBItgnvBubfy6POG4FAjFFt3Mtg2vLyvAzEU9Ad0kjLJz/ZW00tdeYwp2Pox
         kUDRm47NirkxRanC3PhSBIfxGhb6Bxw5cURtQizpx5msZ4VkTXgj9nRmtqjENDvd45I1
         L/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790027987; x=1790632787;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hSlFAvdvk76O8etMUCMxW34HuIJRKYdAfu//0LmiLks=;
        b=IY+m2N6DzvKEqnqVL9Wke+E8DOU9yipdx9KoDulZ8BBZqdSTzYnia715nY6ej7+kVp
         tUKQU/vtqySxqb4UDXCacQz4bBfNA5V4HGc3R91HpA+tFSSyY0PKR0tDlBLEch646HrB
         RQFaCLA2hnl9dd9kyjPAJgPjr7zgxAMXI2d8HQdIEgzyf8ejNf9lQ3CsDIE14Vymr0hV
         BKfwJSY7kS2+oavXJhOycOpDV8YhtImPR5ejjon6JmzxsNT2+y6TtPuPpO49YBvRPjCp
         TaBvCCFZmAXNiWu95clc/fY4N4iZ19gWW10UWUxSplYwaTOq6MMaqvJPrTADY0Rx7Vix
         fblw==
X-Forwarded-Encrypted: i=1; AKwUvByR8kbPT2tZ9USYBb3DbgwY635fJKdB+tu8tJz73tUPMKA95+y7tNyEMPKzwPCnYGU+6EZoabWCks2DeWg=@vger.kernel.org
X-Gm-Message-State: AFuF++liCAfpaQLvV2siqyTeIzsZMmL4nIEn3w7zIyUgKryVe66AX//z
	R1xuEQb4LyCAjRO5rqeFlx3OiQX5Yp2CkEh9j6vAHjflaoItpLV19mMV
X-Gm-Gg: AYBFou0/JtcTVPI/IUmVoTWgKbJraoFbbuKWziRpBLO6AWU39WaclXKnN699Nwc4wCs
	A3KCu0LmVKgkJRCJal+7tfAIPntvYW956MVMiqkohG3bxM44HarGdLWZvGcMIXO87O9EervvwR+
	L8mcLDPr06/y4evW8zWILOnjMJkgvfJUuvWpseW0ZJKvm1OsS6+txKkSF2A9TFgySPOtJG9Qd0W
	NhtdsYlL4rih0sj7HJAzrrAXfNYCpLEt/Ko61ad2rhH0jrFqmAD2NpF6Cb5X9Q9vTX54wc/cD75
	XEbWlGntJrqTw707bCOGVrFRAl5MZ1Gm/X87gYELgROw0BUfsJBH7bFDQ6cQH91rOPH2Vq993DB
	XtLrzvxyq78cJcyHnOgmg9U7WRrtjrnK7yJjwZLpz9LuguBieYIirplDIZw8LWxdV4/eOSg+bbh
	HahF+CaVuEi1bCbM9ltCDYrS8fuD477tnR2DZU1VQyflW2oNAIphS71zlr6dXUImBEQA0pa5zbj
	0FFDrnCN2HCzolDtDvi6eUVYXDQ3kiMbcioRulr4pvq/qGhrBzei2Nza+6RtgQ=
X-Received: by 2002:a05:6402:23d1:b0:6a9:a2b9:5907 with SMTP id 4fb4d7f45d1cf-6aa577f5832mr9055442a12.4.1790027987286;
        Mon, 21 Sep 2026 14:59:47 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:a75e:9a00:f474:15bf:74b7:bee4? ([2a02:a03f:a75e:9a00:f474:15bf:74b7:bee4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa124f636sm250182a12.12.2026.09.21.14.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 14:59:47 -0700 (PDT)
Message-ID: <206467ff-9afc-42e0-a0ff-e861f67ced89@gmail.com>
Date: Mon, 21 Sep 2026 23:59:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v3] net: ipv6: keep room for the mac header in
 dst_dev_overhead()
To: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
 Andrea Mayer <andrea.mayer@uniroma2.it>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922-seg6-maclen-headroom-v3-1-7b2f982ef79d@gmail.com>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20260922-seg6-maclen-headroom-v3-1-7b2f982ef79d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/21/26 22:49, Yuya Kusakabe wrote:
> The seg6, ioam6 and rpl lwtunnels size their skb_cow_head() request
> as the length they are about to push plus dst_dev_overhead(), then
> push the new headers and rebuild the mac header below them with 
> skb_mac_header_rebuild().  That rebuild needs skb->mac_len of
> headroom, but dst_dev_overhead() leaves LL_RESERVED_SPACE() of the
> egress device, 16 bytes for plain Ethernet.
> 
> Where the mac header is longer than that, as it is on ingress
> through a VLAN device with reorder_hdr off, the rebuild runs out of
> room: skb_set_mac_header(skb, -skb->mac_len) computes a negative
> offset, stores it unchecked in the u16 skb->mac_header, and the
> memmove that follows writes skb->mac_len bytes about 64 KB past skb-
> >head. Forwarding plain ping6 traffic through such a device
> reproduces it on all five seg6 encapsulation modes and on the rpl
> and ioam6 inline paths; skb->mac_header comes back as 65534 on a 704-
> byte head.
> 
> Return the larger of the two.  The helper already returns skb-
> >mac_len when it has no dst, so this only makes the other branch
> agree, and it covers every caller rather than each call site in
> turn.
> 
> Fixes: 40475b63761a ("net: ipv6: seg6_iptunnel: mitigate 2-realloc
> issue") Fixes: dce525185bc9 ("net: ipv6: ioam6_iptunnel: mitigate 2-
> realloc issue") Fixes: 985ec6f5e623 ("net: ipv6: rpl_iptunnel:
> mitigate 2-realloc issue") Suggested-by: Andrea Mayer
> <andrea.mayer@uniroma2.it> Assisted-by: LLM Signed-off-by: Yuya
> Kusakabe <yuya.kusakabe@gmail.com> --- Changes in v3: - Fix
> dst_dev_overhead() itself rather than each of its callers [Andrea] -
> Drop Justin's Reviewed-by from v2, which was given for the per-
> caller version; the patch no longer touches the files he reviewed -
> Link to v2: https://lore.kernel.org/r/20260918-seg6-maclen-headroom-
> v2-1-4d370af55b2e@gmail.com
> 
> Changes in v2: - Use max_t(unsigned int, ...) rather than max()
> [Justin] - Make the same change in ioam6_iptunnel and rpl_iptunnel
> [Justin] - Reproduce and verify the fix on those two as well:
> unpatched, rpl underflows in 12 of 16 probed configurations and
> ioam6 in 3 of 13, both reaching about 64 KB past a 320-byte head;
> patched, neither underflows in 18 - Rewrap the requests so they no
> longer exceed 80 columns - Retitle for net: ipv6, now that the
> change spans three files - Link to v1: https://lore.kernel.org/
> r/20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com --- 
> include/net/dst.h | 3 ++- 1 file changed, 2 insertions(+), 1
> deletion(-)
> 
> diff --git a/include/net/dst.h b/include/net/dst.h index
> 307073eae7f8..dbedfe72e1fd 100644 --- a/include/net/dst.h +++ b/
> include/net/dst.h @@ -455,7 +455,8 @@ static inline unsigned int
> dst_dev_overhead(struct dst_entry *dst, struct sk_buff *skb) { if
> (likely(dst)) -		return LL_RESERVED_SPACE(dst->dev); +		return
> max_t(unsigned int, skb->mac_len, +			     LL_RESERVED_SPACE(dst-
> >dev));
> 
> return skb->mac_len; }
> 

Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
