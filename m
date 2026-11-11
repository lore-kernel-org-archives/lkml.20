Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405711;
	b=0W3Wh5ikRX0cQ2sVxOSj7szIV4V2NLP0b+5Nyqb+GDKx1/oKBtvB0bMsfjFAzdGdHXzs
	 mMx/6W3kt/hSXd9lE6ot3CzMzkn8RGf5eE0Lj2KAxy0Xu0oiwLKnb4HxjL6PL8UL7bSrg
	 NQ4ngZ4RuSKqqFaby17Y2Xx1SD+0PQajd1ecg1MLWYGu3Rv0ZLWZFScU+DD4JkCFcKIPQ
	 ANyvonVZlFNviDQ6rxrz3fGXbGXNZZgmW1hSSWZHlWp0ETMoasSEt3AqtkKWxDALcZJcV
	 9BRyKbL64Y2nWb6VUKDcNmD8ejKIeh8WVyEzLf7pWfyYYX+uEHX2sspe4/UHdbwg61g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=O8NgyjtDYz4pyha39rltZunf2bBWHEXRkohajtNJskA=;
	b=V8kNiL51yXy3psdB7FUQlHNdU8enBM0uPqw4Cj8B1gC535Hmhces0JE3d8pJfvL0C2HN
	 SBWceVT4ePZJ+Cb87iUMgdE/iN85fBX7L5Ri+YhUd5dG/PmfQo0K28eiYTbyKBd5r9srY
	 j5n/M7QYvWk5FeZw8M0vB+7owPMc/cbIGJFDwZFojVo3a31tKrxCTMY9QcQTfudSBJJQG
	 8N/DFoPEkflvt1SgdXJ/Z9zpqdeCvU5FoGjc3QAE0mk6gjPaBC3bldGL6qa7Ll2oD4R7j
	 5M5xzMMJ2zNrw9/1t+OMeOxUbcNDV1GaEZ4yUi2yWiCVeMUKYWhdRUsmMBDylNDCJTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Wl5idHGG;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25857606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25857606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=Wl5idHGG
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b3acec6677so4906532c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1794405710; x=1795010510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O8NgyjtDYz4pyha39rltZunf2bBWHEXRkohajtNJskA=;
        b=Wl5idHGG8+6GNQnjX94s0EZTSeshK00S72EEWd+SxHRyCQwBWnP8p+VmT0VkT1q31x
         Tdo1IFOqKdaT3o9I+rw5p40TBXTbPCOMWdKAlgJBNKNy6R6EFWfN7Ra9O//tp7AOpuwK
         7IGP9NhjK7O4hh4C5alKlt7KTJArDAT9AveXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405710; x=1795010510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O8NgyjtDYz4pyha39rltZunf2bBWHEXRkohajtNJskA=;
        b=ZJvMswQaMKHufGAwLHR0kYn7msOrqczk5sA5kp9Y7QIxkKD4SK8o8KrFdt+bbleuE6
         tPUKrjzfLiRhNB7PUZc7vbBSe1YzRahlAILqBSCqhF/j/QoI4E6ImqI1jS8cima9H7zK
         i+d4/oX3TuM6jobcYxlWGeSGHz5zSeMC+GhfY5mbJ/uaJDuOLwjQd5kUzKhG7JhmIzeB
         xGbEKWef1xu/qvON4RAe4/Os2S6FCAqwPaqSf2Yqs72nFNsHhjANnIlrY3d/Retnxp47
         4ZTrO3Wp03fH4YWlOV05ihXzy/fm75ojuPFm6nVO4AD+gY4bF2PjgtPMz5v535+U/qh4
         QGDg==
X-Gm-Message-State: APuU4Z+1alZM7dMHECHLjsLou9ayrJ3L6X3p1FuNy/TTwRIGgNdmEYLw
	X5JRo9Hq0KIZHLL5ayifgLSAEibuPSKnA73RVDLwFf54ltvlR2FtKNDgB0cPzIKkDg==
X-Gm-Gg: AYBFou0qj5wUq8L6mA6QtK2x6tBrDu6s0XiSaNjPS2oXcrv6+ocZGw8gAk0tZQgDgEG
	myegISt9Jw/WmtdG2zrd9BOhWdA5oKWfHica+idrSBkP9OFg+GyqtK+fIOGDCOck9Zie4MJplUh
	u2cZW8BQCj2PEMzoKwTJFfeajnTgnB7pHCkIAG6x5zjbrp4I1t39zcDJ91xI5pLgKFms5kQVnY+
	SE+HL/WzJiPDHq08ayLvooinR84fWdK9nxGWPJYS2g9F6rhHTwe8PxmBKKkENRdc/0Y5nNFXFcS
	UxTspVuLKAOPO7xVOqP7FgBH8FJIUJEo4O/ZCAb+WuniEoyefJ1hFY62lfWThhypSvfNZZjBZ0M
	w9lJ/TaemjcGt344NxcbRTYkESe4E+X17bFrm59xXTpUpdr1SOi9amH8q5E/uJsok661rUk8ovU
	F4wJAe40ZK/NBRtB2GhAyK05Ec6ZEgid7HIhGsJGLhgGJA+pSnG2dVRMEmACPJfv/hoxtpJPfkM
	PZyUBTI12ZOH9/UiRKOjuVH/GWfmfisZVIp/3xYTdwkb3NbyE2+el0tzCxYrraOebjPp3lo7Htf
	pg2i4ehIYcn/ZShJennRyiFUapgNYfOpZv+jiQ8=
X-Received: by 2002:a05:701a:ca05:b0:1a2:fa1d:1de5 with SMTP id a92af1059eb24-1b3c2154fc8mr1737384c88.20.1794405709684;
        Wed, 11 Nov 2026 06:01:49 -0800 (PST)
Received: from ?IPV6:2804:14d:5c54:4d67::1c9d? ([2804:14d:5c54:4d67::1c9d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm16836234c88.9.2026.11.11.06.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:01:48 -0800 (PST)
Message-ID: <0c970ddc-4cfc-4ee8-b0b9-6107a8804267@mojatatu.com>
Date: Wed, 11 Nov 2026 11:01:42 -0300
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
Subject: Re: [PATCH] xfrm: avoid stale tunnel pointers in deferred input
 callbacks
To: Jun Yao <yaojun8558363@gmail.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 steffen.klassert@secunet.com, herbert@gondor.apana.org.au,
 dsahern@kernel.org, idosch@nvidia.com
References: <20261111094629.230568-1-yaojun8558363@gmail.com>
Content-Language: en-US
From: Victor Nogueira <victor@mojatatu.com>
In-Reply-To: <20261111094629.230568-1-yaojun8558363@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi!

On 11/11/2026 06:46, Jun Yao wrote:
> IP-TFS input can be deferred while its reordering queue waits for a missing
> sequence number. The VTI receive callback stores a pointer to the tunnel in
> skb->cb, and the device can be removed and freed before the callback runs.
> 
> Keep only scalar tunnel metadata in an skb extension. The VTI callbacks
> look up the device by ifindex under RCU and check its link configuration
> before using its private data. If the VTI no longer exists, drop the
> deferred packet. Use the same metadata to preserve tunnel mark handling
> and IPv6 tunnel detection, and clear it when a new XFRM receive path starts
> and after the callback completes.
> 
> Signed-off-by: Jun Yao <yaojun8558363@gmail.com>
> 
> ---
> diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> index 6787fcf6a..f97412b95 100644
> --- a/include/linux/skbuff.h
> +++ b/include/linux/skbuff.h
> @@ -5044,6 +5044,7 @@ enum skb_ext_id {
>   #endif
>   #ifdef CONFIG_XFRM
>   	SKB_EXT_SEC_PATH,
> +	SKB_EXT_XFRM_TUNNEL,
>   #endif
>   #if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
>   	TC_SKB_EXT,
> diff --git a/include/net/xfrm.h b/include/net/xfrm.h
> index 445223a8d..defdd4088 100644
> --- a/include/net/xfrm.h
> +++ b/include/net/xfrm.h
> [...]
>   
> -#define XFRM_TUNNEL_SKB_CB(__skb) ((struct xfrm_tunnel_skb_cb *)&((__skb)->cb[0]))
> +static inline struct xfrm_tunnel_info *
> +xfrm_tunnel_info_add(struct sk_buff *skb)
> +{
> +	return skb_ext_add(skb, SKB_EXT_XFRM_TUNNEL);
> +}
> +
> +static inline const struct xfrm_tunnel_info *
> +xfrm_tunnel_info(const struct sk_buff *skb)
> +{
> +	return skb_ext_find(skb, SKB_EXT_XFRM_TUNNEL);
> +}
> +
> +static inline void xfrm_tunnel_info_clear(struct sk_buff *skb)
> +{
> +	skb_ext_del(skb, SKB_EXT_XFRM_TUNNEL);
> +}

The above lines are causing build failures when XFRM is not enabled:

In file included from net/core/sock.c:134:
./include/net/xfrm.h: In function ‘xfrm_tunnel_info_add’:
./include/net/xfrm.h:777:33: error: ‘SKB_EXT_XFRM_TUNNEL’ undeclared 
(first use in this function); did you mean ‘DST_XFRM_TUNNEL’?
   777 |         return skb_ext_add(skb, SKB_EXT_XFRM_TUNNEL);
       |                                 ^~~~~~~~~~~~~~~~~~~
       |                                 DST_XFRM_TUNNEL
./include/net/xfrm.h:777:33: note: each undeclared identifier is 
reported only once for each function it appears in
./include/net/xfrm.h: In function ‘xfrm_tunnel_info’:
./include/net/xfrm.h:783:34: error: ‘SKB_EXT_XFRM_TUNNEL’ undeclared 
(first use in this function); did you mean ‘DST_XFRM_TUNNEL’?
   783 |         return skb_ext_find(skb, SKB_EXT_XFRM_TUNNEL);
       |                                  ^~~~~~~~~~~~~~~~~~~
       |                                  DST_XFRM_TUNNEL
./include/net/xfrm.h: In function ‘xfrm_tunnel_info_clear’:
./include/net/xfrm.h:788:26: error: ‘SKB_EXT_XFRM_TUNNEL’ undeclared 
(first use in this function); did you mean ‘DST_XFRM_TUNNEL’?
   788 |         skb_ext_del(skb, SKB_EXT_XFRM_TUNNEL);
       |                          ^~~~~~~~~~~~~~~~~~~
       |                          DST_XFRM_TUNNEL

---
pw-bot: cr
