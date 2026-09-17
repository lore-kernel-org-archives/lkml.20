Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E304E5358
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789675212; cv=none; b=DYBSm7g1Y7ijeNfgM0kP+8Wj3gr2NXzg/0iTSarseBAXhmKOy40kUySqDoqpA6jQvOJ73hvwi9C5iI867bydnyMMRnZlRvL8HJvco+JiidGLlMZ5wFHPj4bk7HPRER2Raqr3N9AqpPO7j2anLzfJT4OSJ/esCiXdl1Q8/H1UOF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789675212; c=relaxed/simple;
	bh=qQt4cO6gcM8mr7BbKnuuxQVqoSliQpL2hRO0tN5IJCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aMWlvaZeC0g9+sH0fXKWgx0a5G2OC8JFCM6vPiZSZwOj8oUOn6QiCvkW7Ywf/MAFeRaT2KS4HnItDv1Sm+k85ZFAw+hqoAMZIk0Aau8PEgHT/PArdaOZ3FOKKKCSLTc2IY7tYwds//FIKhMpZ6xWF6l9h4DXoSsWxM9Zjzm0qXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Le7/uLIr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Le7/uLIr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b91369d18so346075e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789675208; x=1790280008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OaaciFVIl9v1eXFkeR+gZr+bpmUH+PehdgPs/XwqD9w=;
        b=Le7/uLIrUEhNx3iTyQ3zrYKZLv3UXt0J81gccVaZ9mx7jsktm+H4/N1xkqGkWi+nSu
         URoNatSCzusME69Sx2JWL/TTZhBGXJkONwyy12s6AZ7Zr4ERsHyznQ8MgZIBE4GNicXw
         GF01wCGSxwF+icgEcNCHXhWjJJ2t+EhsB+pMzMFudnMoQ2e7wQ4USDAdeIreNtcmi85M
         /uBzseGj9PVRkJNMVbfoyV8Oo95TXh6KRyovMXX9fcMPqPH/mpofwFVZGa+/ZqjeQQis
         WhBYjDI7lPArSGqYBnvRFyheHdAXVWtCNDlTno76M2SmQTsjtsn+F9rcMIbvGF3M0Lq3
         TftQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675208; x=1790280008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OaaciFVIl9v1eXFkeR+gZr+bpmUH+PehdgPs/XwqD9w=;
        b=Hv2sH8ddNpCODKawqOYl5p96pQ8lHdty+hw717LHD5OuItMj6xPfCN8oxw1ItlLttc
         /636qvRKGDRYHBvNHNNOHX0miQNN98toGEnZON+k6oW8hYxg4/d40qolEyTktEnClMF9
         ixinlPmUNn8eE+HDfJbwE+RBnnt/NOjqoFfGkfUU5TcmwtHvll7T1Hzc3+ZNQ1KXM3q5
         WIYw5zV4hWyfcWXlTryDIBYJ+hcJ8Xc1VJt/QU1BKoMlce2U7jq23i8c/2YJmHc430HX
         9U9Cw5hTt5g2FEUnIbzJgl3e5C3LKk7nWMoAWEiSOgX4jL9a0dKqrluEQm3EJLsr7EP8
         VSxw==
X-Forwarded-Encrypted: i=1; AKwUvBz4W9/pjCGbIXWOzWfZjz4E+PyMhHYt7b78gJ/xGlBWeqm2BKlUOC66p2YPTP4LgF9RK61NdCgyeb9UBRc=@vger.kernel.org
X-Gm-Message-State: AFuF++ljUJLN8Euy6KyV1c81HBZwaxibDSYjmKFO27r2arU/3WWASLma
	ocaBJyypNGIQFenZ2cAAkQRikNG473n+QgR66uZBcxVgRtdE/VzjUBNup9PCcA==
X-Gm-Gg: AYBFou0YcipdP41jPup2zal3Oz7u2MXRJf2s46aRhWhkjcder3No2vmb8MFF0es7MlM
	1Aq3Kte3M3rP/7r3axDz7AJzR0HZ1yFcZjYzwM8aUPshot3uxxWuiSaIK4PAywfmPDKr3wdHUMN
	bh8FpQeOqZKalchAqwlWmJ0U3VZVbR8noR2XF3Np0W03GVYbJbBA259gwRmzBqUwkDoHkPef/GS
	0hE9ntF6cA9LN3AWm6yp0kFWup6O7kiQq2k/UvmwGoBJwtKy9/uIvLE3kHNwOFy3G3oX3XyQ2L+
	niQIa9WvembZMpYzSDCg0Y5NMc+iUdFtFJavlSwcwTNXvXtgN0ULL0DzV4kNI8/LItiv4sDjo8g
	L8H8+zNsGaKWPN15Dgs9IUISOq4QwyypPqzFuedT9qGRhCt+J4aunbcnSerd2JX1ic6Qsm4iXxy
	uGeh+vXqIpVuoduQICiFElxvJBIkZK2frZU8XSN51yJjHr1qzNeTAeFvRHu+yyHn/6F8b0QMi31
	DzBAcy5aF1It6p0r+rOSmGYaK6JM62o2Yl518nU6X6GSn9xrA==
X-Received: by 2002:a05:600c:4691:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49eb733cb1amr100153915e9.25.1789675207535;
        Thu, 17 Sep 2026 13:00:07 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:a75e:9a00:5f07:c6a0:e93d:34d? ([2a02:a03f:a75e:9a00:5f07:c6a0:e93d:34d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd17051fsm102448785e9.0.2026.09.17.13.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 13:00:07 -0700 (PDT)
Message-ID: <32ef3122-2cca-4e40-93a3-2e02a4f96ae3@gmail.com>
Date: Thu, 17 Sep 2026 22:00:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] seg6: keep room for the mac header when growing the
 headroom
To: Andrea Mayer <andrea.mayer@uniroma2.it>
Cc: Yuya Kusakabe <yuya.kusakabe@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, stefano.salsano@uniroma2.it
References: <20260917-seg6-maclen-headroom-v1-1-02ccec50f096@gmail.com>
 <fd0ffc06-f1c5-42d6-ae16-b592208c6d69@gmail.com>
 <20260917182826.452d987261004173916e9722@uniroma2.it>
Content-Language: en-US
From: Justin Iurman <justin.iurman@gmail.com>
In-Reply-To: <20260917182826.452d987261004173916e9722@uniroma2.it>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/26 18:28, Andrea Mayer wrote:
> On Thu, 17 Sep 2026 12:12:11 +0200
> Justin Iurman <justin.iurman@gmail.com> wrote:
> 
>> On 9/16/26 23:38, Yuya Kusakabe wrote:
>>> [snip]
>>
>> Overall, LGTM, thanks. However, I think we'd need a v2 with the followings:
>>
>> - use max_t(unsigned int, skb->mac_len, dst_dev_overhead(cache_dst,
>> skb)) instead of max()
>> - apply the same changes to ioam6_iptunnel and rpl_iptunnel (all in one
>> patch is fine)
>>
>> Reviewed-by: Justin Iurman <justin.iurman@gmail.com>
> 
> Hi Justin,
> 
> Agreed, rpl and ioam6 inline do trigger. Single VLAN device per side,
> reorder_hdr off on the receiving one, plain ping:
> 
>    BUG: KASAN: slab-out-of-bounds in rpl_do_srh_inline.isra.0+0x3d3/0x770
>    Write of size 18 at addr ffff88810deeba7e by task ping/447
> 
>    CPU: 0 UID: 0 PID: 447 Comm: ping Not tainted 7.3.0-rc1 #364
>    Call Trace:
>     <IRQ>
>     __asan_memmove+0x38/0x60
>     rpl_do_srh_inline.isra.0+0x3d3/0x770
>     rpl_input+0xd3/0x5e0
>     lwtunnel_input+0x18d/0x420
>     ipv6_rcv+0x452/0x460
> 
>    BUG: KASAN: slab-use-after-free in ioam6_do_inline+0x2d8/0x5e0
>    Write of size 18 at addr ffff88811480fa7e by task ping/432
> 
>    CPU: 0 UID: 0 PID: 432 Comm: ping Not tainted 7.3.0-rc1 #364
>    Call Trace:
>     <IRQ>
>     __asan_memmove+0x38/0x60
>     ioam6_do_inline+0x2d8/0x5e0
>     ioam6_output+0x335/0x970
>     lwtunnel_output+0x1b0/0x440
>     ip6_forward+0x16a7/0x16f0
>     ipv6_rcv+0x452/0x460
> 
> ioam6_do_encap triggers too, with three VLAN tags via tc push:
> 
>    BUG: KASAN: use-after-free in ioam6_do_encap+0x202/0x5c0
>    Write of size 26 at addr ffff88810de227fe by task ping/453
> 
>    CPU: 0 UID: 0 PID: 453 Comm: ping Not tainted 7.3.0-rc1 #364
>    Call Trace:
>     <IRQ>
>     __asan_memmove+0x38/0x60
>     ioam6_do_encap+0x202/0x5c0
>     ioam6_output+0x3cc/0x970
>     lwtunnel_output+0x1b0/0x440
>     ip6_forward+0x16a7/0x16f0
>     ipv6_rcv+0x452/0x460
> 
> I would fix dst_dev_overhead() itself rather than patching every
> caller individually, that covers all callers at once and protects
> any future user of the helper. dst_dev_overhead() already returns
> skb->mac_len when dst is NULL, the fix would make the other branch
> consistent:
> 
> --- a/include/net/dst.h
> +++ b/include/net/dst.h
> @@ -455,7 +455,8 @@ static inline unsigned int dst_dev_overhead(struct dst_entry *dst,
>   					    struct sk_buff *skb)
>   {
>   	if (likely(dst))
> -		return LL_RESERVED_SPACE(dst->dev);
> +		return max_t(unsigned int, skb->mac_len,
> +			     LL_RESERVED_SPACE(dst->dev));
> 
>   	return skb->mac_len;
>   }

+1. That's even better, thanks!
