Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858B43CCFB0
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323133; cv=none; b=VXaeYU5ocanOPvG90+tNVusQ1GA4wfr+d+uItkF7Hed3bQSUps6Ap4JWOIqfE1wUhfYXwn1wBSgKv5QGTtR+Dv0fLeTYYEoYwp7q76x4T4iLYGm0VQMDjNalERNYmESqE6+97rDp+6R6co1CpGXYdgx4k96y5J6prlI66eN146o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323133; c=relaxed/simple;
	bh=owvT5MkOsiDpLQIP9Fll5Zuo96WfQJpF8vjQtgKYjwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YuDgQ/QwFYlZjIY8icMC50jLOD8uW3ELR+Nh4zQREwnA6JZBx5JGPzQtxFs+n+wQ1YOmHIIlxjyZz2PUqL/kmxu+QjSBuVuVoa7eF8dObMWxXAGnWqKy8bgneN/U67W0KFpPbpd/oRnq611gPJTMVtQFZxtc2Pm+vkPPeR7Ctek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=PPA8x8C2; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="PPA8x8C2"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso242865e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 00:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790323130; x=1790927930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9n6ZKLFcFHikmLkQ5fygAPRgtfnum06DEuIZGMf2IV8=;
        b=PPA8x8C2XLa79+CsUHdNWX0I9WtnFvMaYNLFLvgRv7H10VpmHjy+vZ0d3nyw5ygb1S
         qODTZEI4R4fYUsl+wiXKXKJReVG8mPB+CgI6td5/441cENyomzIaJfM/j8axXFyUxVEb
         qZ7hORjRGGEHSNaCnGKslOzSiffUN+DmP8Ty6LUPTRdcVLuOnl1fOdQHGugI40gTtcQ1
         tGlu5X72uMFBbo8Mg1MY9viVcNE9nCBP1iLuFbIVL6zj6agscIqdZFfap73eMBZ5MxeA
         iY8ePIBGekOVWSYw1TgUV4Ujw4xpyHB6RIv2793fsbbd8tA9gxe4vI//krTNUCq2JMFD
         OUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323130; x=1790927930;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9n6ZKLFcFHikmLkQ5fygAPRgtfnum06DEuIZGMf2IV8=;
        b=HH3OvGGV/LaMpPWqnwmRN/3MYPagK4iR3IHxHcncXWQtuJzOfhxT9iviTYWpI81zNE
         FTysKCvzj+tP3IuZPgVEkQKArSZaza7fbKya0xFCgSmZlrnT/w0+lKrwIzeKkya0pgUA
         kOIQtNUSD5zbiazRmTOzBl97ByETbeFBXKhmAyx2VBG7PXf2keBi1GyfMI9EQzflVtF+
         EOeGIAy0tNhrdSM1BRIZf9WY5lbueNsTTac48v/sXOsRbCTO2fZeu3l8Ba9kzi6/4u8N
         rCcB0h8GkCTc9R14CnV1q8Ul4Cy7qkv6J/Svz0YN5bjR/3c3JRChai55CAM+7cGVxysQ
         VFAA==
X-Forwarded-Encrypted: i=1; AKwUvByPdoK0Kzbe+FO7VRDD++ZEMQClAyx+uf9FDZQnYVicTdIVCQ+puitiZjKRJD23Rufkd49JAoM9a8HCRSw=@vger.kernel.org
X-Gm-Message-State: AFuF++niHtMZj4SXWS4Q3fshCl9UyV/8KKrU3CL7NcaIbIsBaU2dFgWu
	ULX1vTlsgzFLyw1wUJtbeCfHaLrG7pGeL8Sc3eg5huswoCJdPD31reyZc1ZYz1t8pnU=
X-Gm-Gg: AYBFou2dneZ4SMkCeK6dkXpixlCA25FDArSx9boXSI9Wjnhf1sX5urJF8MpCTgGHOQx
	867/0MKZIXiCk8tXAws7NyBX1vfH5RNNC6v0Bf8MOulxJrN5JJePjvoENdFp+9uLJVRtMHGdu5F
	uADGggYYBXt7BnA85CKCzf8oIhWE1UPu5AKhcSSbs/+3dIR/ZzTJR2Ek4JRjwD6okwPoZfRR1Ds
	/8Vw3MQVi5WOeno8jDhmwavD7EUOjFyRwUp7Z01GqDoTPDLaDclcuXAtN95Bfp4ZgKA6fSGlyfw
	QTEgZAqhX8/iSjyuxtb7wmeZpojrsgd9VNQCdgd4hXyzB6qyLG4rRGskkX5KITiQKo6HUaDV1j3
	37XQANLBFXWVBhD07UbeyTiZ1/4pUiklSpKzgypDYczxzdSeq+45ZPJL+RiJIw0qI1TmMTnsem8
	ljrTgjmIGSmf4WuiF/8EJQPlLA/gXhx1T32Vqpgzlyzc4bxzFEZfGYrEhdrtJI8unYHMOOefB3c
	rJVtj+W2lt7Z6Lm76G/hyjtGY4Fr7DVHmzijtCod/94zskdnVI=
X-Received: by 2002:a05:600c:8b09:b0:49b:9241:7ff0 with SMTP id 5b1f17b1804b1-49fedce4db3mr40284195e9.0.1790323129618;
        Fri, 25 Sep 2026 00:58:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff13b3c58sm16717205e9.0.2026.09.25.00.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 00:58:49 -0700 (PDT)
Message-ID: <51d27e49-afea-4416-81ef-9ff132820066@6wind.com>
Date: Fri, 25 Sep 2026 09:58:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc
 changes
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
References: <20260924011554.3494-1-sigefriedhyy@gmail.com>
 <20260924011554.3494-3-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260924011554.3494-3-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 24/09/2026 à 03:15, Yuyang Huang a écrit :
> A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
> entries added or removed between two dump rounds can be skipped or
> repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
> stamping cb->seq from a per netns generation counter combined with
> dev_base_seq, see inet_base_seq().
> 
> Add the equivalent for the device multicast lists: a per netns counter
> bumped whenever an entry is added to or removed from any dev->mc. The
> list helpers do not know which device a list belongs to, so give
> netdev_hw_addr_list an owner set for dev->mc only and bump the counter
> of dev_net(owner) where entries are created and freed. That covers the
> dev_mc_* helpers, both lists of a sync, the hardware sync helpers
> drivers call from their rx mode callbacks or their own workers and the
> reconciliation after an asynchronous rx mode update, while snapshot
> and other lists have no owner and are not tracked. It is atomic since
> the writers only hold the address lock of their own device.

For IPv4 and IPv6, the generation counter was initially used to invalidate some
caches; that's why it is global. Here, the goal is only to check the consistency
of the netlink dump. I wonder if maintaining a counter per list would not be
more straightforward.

A helper could then manage list->count and list->genid, both evolving together.
