Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793214242;
	b=qTSd7rBZ+JZWbhzbPkVtiGQkZUiUIijzxj1lhlLvK7g8S7kceOGER6XoORgDFdqNleZS
	 gBCH5Urhn+FTrVcdsA9g8+tKKLtyRLrH2drucHHYUw2MZ0rI/uvvt+RiV9IqIp8hy/oIJ
	 2WDz3caASnwyz73Fnb7k2FvzgcaEA0VeZXqEz0goil7PkOtNxbGkVPoc1tMnJ/SOtlXJ9
	 TghpNsjQ5xhs9veC2LUfMUvOBAteTlD6DMJBwd3/jvuFvH4MD67WtjqRIyK8xgi3YyQ9q
	 Twz1czbYOo1P9/26VpEHhNHdzR61SVpO3750+t+ncPuSmiEw38R0oeTH6GYYEHsHleg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793214242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O9/B5lF6u9GNtEi9e232diGEwQ+Oj3apNpXMoqj8NjY=;
	b=WCNjjZAWi79EwXRywa6DiZl8wMS08BfMMrb3RvX7vwhuZOmwqCU0ZkNiC5ws0/5BNIRu
	 9kwHsG3d+GOsyykHchBBxtoH/rzpoeCn1h/h74aQwm/siz9h3n/Akr069zZADZYAMx7ok
	 CL2lfCmmLlJLv0kl8pcbHprHqSThkIBwxbjiYMNnOXkeadKrwersPH1ckD1AR7K/ibITc
	 Sc8+bwzniNDcnKBrOZjsV5yTHa40xAwINdUMKzbLNL7fcIOBSUxOprIKWgsQMCCejtSGy
	 G3GfTuaVy6M0G8ktbP8S6HY65TD8Z/VanZKqaM+xPf7ajeb85LR3f/Pfa8fi57bxvkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGZSSwR;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6142B60A263D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6142B60A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGZSSwR
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso12447545e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793214241; x=1793819041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O9/B5lF6u9GNtEi9e232diGEwQ+Oj3apNpXMoqj8NjY=;
        b=QlGZSSwRN9Ir0wj1Yu6CVDKeAPqhbpY0J/iZ2PGJYz4DwcmoxDJ54Jp/74TitKPMKb
         kNy6ln+VKEk4wZaIKNF3x7MU8LpJ5G9aXWX6dLKIzRyx3XjDVFR9nESTO1ctd2We2vre
         z1pVvdqgFXk4k9K82PO/6wYHC9XpQIB2nkqOWDSpm/ZT8E0TTLmmLAS1iCLK0Bt/mGui
         jgz87eCjjHl3soAbI8Mje16UWh9Vw3tdosUbiJnSMuaFpx1clioe8Q6Dddwsn4/hZm17
         ZDJYBNbPqXzpGPVh4CjLolquj+lzHI2WpaYsgOf9XTg0OvvyZ8cxxgLHMxHP5V7o+NJ/
         277A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214241; x=1793819041;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O9/B5lF6u9GNtEi9e232diGEwQ+Oj3apNpXMoqj8NjY=;
        b=RJoZgcW3Q/TAsVh3I1kDyRJg9ytoSwdJiHJDWARI8I6oGknl0jt/juAtYeUscjruEM
         NsJNRJk2TBf1+/TxZvaXQtvk1+iG21XwrEY/8HciA0dAXjbjVjSQ87QyCGt2/QNcfTPn
         rlV0QZEPGyK5QzyJbo4/YZ1NIpK0GjFhshYq3ycBK/Jhbvdphn9uiErXEc7BeX7jDIY5
         XSOWyCHR/g7VkJZ8iYJRz1KRUirjlkLWm0hbzIWurgykX8JEsuy+JNsEaAdteDJdLkSQ
         fQUIABhudbv8PtPvWZoKo/xwSdt5ZfwC9nC01zw048gsB+MsQ3FZzn+F1GsdsdlNdKt+
         O4tA==
X-Forwarded-Encrypted: i=1; AKwUvBxwQs0j0jN/BUBj96pXhdfx+Dv/1BBRdGXUwsDWfkY71guFjoVi7CiKmB9dEp19Y4I++dUIGZ+U7QTewGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzl7r3AbpwH0zG5zzY5GOEcfTxAFIiZWxWkVdUGWL2r7RB1hWu
	WJU2IPc2eYyUrf0AwZDAJcMnLKktroj9i6sxWC/SxVPMTH2V/D9t9v3e
X-Gm-Gg: AYBFou395c/D+4MBD/BdzZs9nABUo1Zn7E9ZZYBVHde3OzXT570w3j4UdA5tVdw/lOE
	+ZaLO8/FDUCQocyKHybyKs4Sa0Pu8JZ8kiYeLJ0SL9HwKJ95iWjViQb5YId2HeWkSiHl+lvuBTU
	x3jmJq4ExB6j26NHSQFG+4aHlCGwExAxH4lKdZoPDhNnisXyk3TuYbwIHlZACL9qP1yvm9kv/n6
	G7/Jba4kX2khZbsQNPvTyGI7XlVhlpjCjZmlVYN8eJXZn6Lg+aJ37Ol/xftmthddNVcSvq+V+7U
	PLw5aX/uS8JlWGC+iAisRuX4pMCWmffmZkiypWTCfZhoXJIzc4yUskaTDPuYtbJPr29XIeutkah
	/uoNog15EeQClaAxMQZY376gLUMSR6nBaC+IJ2vXQYlOUQ18mh619YUsVUD/8YnaMFZti6Sssk6
	DvuYZYGEOexukFKbepNQ0zAsNyiSRQOq4NIRrIRbW0ONvVRFTssg9YV2X82pSDHGMDChsdbhdhe
	d4I0Lh6dRNvoTl6TzMde1ZeJ1WVtRaB2yOA/3p4Nwu9aTx2ilrjl6eDaJYUXizMPseFRSAJkn6B
	VcD+Q3jTkD/5HMEjLpctx5i24NEXTFA1xqvMgULR4mUSAjWRlec1tHLC54V6jcXXciXI95UZci8
	9ZdNv4Q9MENq5caJ9pMVqqJqAARv4gjW5CTTZ0Uyub0YY29GhFkf/VT4=
X-Received: by 2002:a05:600c:8b38:b0:4a3:5a91:5f61 with SMTP id 5b1f17b1804b1-4a966c4062fmr75242105e9.14.1793214240486;
        Wed, 28 Oct 2026 12:04:00 -0700 (PDT)
Received: from shift.daheim (p200300d5ff07190050f496fffe46beef.dip0.t-ipconnect.de. [2003:d5:ff07:1900:50f4:96ff:fe46:beef])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a9ead8aa0fsm18317935e9.4.2026.10.28.12.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:03:59 -0700 (PDT)
Received: from localhost ([127.0.0.1])
	by shift.daheim with esmtp (Exim 4.100.1)
	(envelope-from <chunkeey@gmail.com>)
	id 1xM8wG-000000014l8-30th;
	Wed, 28 Oct 2026 20:03:58 +0100
Message-ID: <5cecf4d8-d16d-4004-aaba-6a2c7c77ea10@gmail.com>
Date: Wed, 28 Oct 2026 20:03:58 +0100
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
Subject: Re: [PATCH v2 wireless 3/3] wifi: p54: replace open-coded IE search
 with cfg80211_find_ie()
To: Tristan Madani <tristmd@gmail.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Ivo van Doorn <ivdoorn@gmail.com>, Kees Cook <kees@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 tristan@talencesecurity.com
References: <20261026223222.2093813-1-tristan@talencesecurity.com>
Content-Language: de-DE
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <20261026223222.2093813-1-tristan@talencesecurity.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/26 11:32 PM, Tristan Madani wrote:
> Replace the hand-rolled p54_find_ie() with cfg80211_find_ie() at both
> call sites.  The old function had a buggy short-frame guard
> (sizeof(mgmt) compares against pointer size, not struct size) and
> open-coded the IE iteration that cfg80211_find_ie() already provides
> correctly.
> 
> Add a pre-subtraction length guard at both call sites to prevent an
> unsigned underflow when computing the IE area length from a truncated
> beacon frame.
> 
> In p54_beacon_format_ie_tim() the returned pointer is cast to non-const
> u8 * because the caller modifies the buffer via memmove(); this matches
> existing in-tree precedent (ath10k, wlcore, cw1200, nxpwifi).

Acked-by: Christian Lamparter <chunkeey@gmail.com>

> 
> Fixes: e5ea92a7528d ("p54: AP & Ad-hoc testing")
> Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
> ---
>   drivers/net/wireless/intersil/p54/lmac.h |  3 ---
>   drivers/net/wireless/intersil/p54/main.c | 30 ++++++------------------
>   drivers/net/wireless/intersil/p54/txrx.c | 12 +++++++---
>   3 files changed, 16 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/net/wireless/intersil/p54/lmac.h b/drivers/net/wireless/intersil/p54/lmac.h
> index 8adde6ba35ab8..d9cbffb74a265 100644
> --- a/drivers/net/wireless/intersil/p54/lmac.h
> +++ b/drivers/net/wireless/intersil/p54/lmac.h
> @@ -553,7 +553,4 @@ int p54_download_eeprom(struct p54_common *priv, void *buf,
>   			u16 offset, u16 len);
>   struct p54_rssi_db_entry *p54_rssi_find(struct p54_common *p, const u16 freq);
>   
> -/* utility */
> -u8 *p54_find_ie(struct sk_buff *skb, u8 ie);
> -
>   #endif /* LMAC_H */
> diff --git a/drivers/net/wireless/intersil/p54/main.c b/drivers/net/wireless/intersil/p54/main.c
> index 57a62108cbc35..30f235d470bb4 100644
> --- a/drivers/net/wireless/intersil/p54/main.c
> +++ b/drivers/net/wireless/intersil/p54/main.c
> @@ -100,12 +78,18 @@ static int p54_beacon_format_ie_tim(struct sk_buff *skb)
>   	 * The dummy TIM MUST be at the end of the beacon frame,
>   	 * because it'll be overwritten!
>   	 */
> +	struct ieee80211_mgmt *mgmt = (void *)skb->data;
> +	size_t ie_start = offsetof(struct ieee80211_mgmt, u.beacon.variable);
>   	u8 *tim;
>   	u8 dtim_len;
>   	u8 dtim_period;
>   	u8 *next;
>   
> -	tim = p54_find_ie(skb, WLAN_EID_TIM);
> +	if (skb->len < ie_start)
> +		return 0;
> +
> +	tim = (u8 *)cfg80211_find_ie(WLAN_EID_TIM, mgmt->u.beacon.variable,
> +				    skb->len - ie_start);

casting (const u8*) to (u8 *). Oh well... If the checkers are fine with it.
Then sure.


>   	if (!tim)
>   		return 0;
>   
