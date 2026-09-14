Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0855E34A76F
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401895; cv=none; b=CUP1a6SdxfS2zl0SbfPjoB3O3BO5S81g7Ea7nE9DhwggkEZyxajzntzTwlC9F7BejivyAPWOqE6gEtoMDamv4/0O/XfbDiJ334YKMYvzN58b7H2Kh0clUX1MPWm4oJYKBMTMiF/mvDzAEv8RbOR4ixPeio66wPqGMUpd1RRyXgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401895; c=relaxed/simple;
	bh=Sgn87V/ffdQ0Mw2u0QtttnnD5720T1tTrgEBiXpaGcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pe+wtmXu4uh0NMBiuSi1g+ykc6jk+vpwRQeL93u4hsKApG7RBnHeLsnhspnOuKD3sBnZa+a+tvTZs+8udmH27bc9ONEQoLknFSY9hIvPaXseM77ot+PKEmygTnoEGOx/9OlMp3O9f8wnfGN7vmCyiQmwrBHpv4L3qNvvRVlde1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=XzkbyW0i; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="XzkbyW0i"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6af07e08so1203605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1789401891; x=1790006691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=c2e/oQkBlRuHGocwCZrcUxkwTAc0GxvFf1MGdOjknyk=;
        b=XzkbyW0iKKz9d9PcJHOTcSIob/MlbyKvGe+ZoDPvMtkwwmacU2JdDY9recjcpaOQ7h
         5pu6SGEDKVamOzoyR+0xkW8N66anfEntWbVcxiYwkM8tyJf36EwXrnJ+fqg3j1IlWu5T
         hHSyEymKM7mtizy6MSXOoBchAloasbUMrncWHzaxx5cz/+EAzDz6CHJwS9VmgKdcmKAO
         uLEqCPdAUabWxhA8fZ0JP3PxaN4Nll/7kth5HYohg+oVIlEeJ5UsmpuIWQ9sGXC3xIkL
         0dRzB1nPv4OX5eRhHsWkLbmh8YEryB41Yweu4EbesKuEwR60pHr2R9Og9BDskNmB7si3
         jAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789401891; x=1790006691;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=c2e/oQkBlRuHGocwCZrcUxkwTAc0GxvFf1MGdOjknyk=;
        b=Dx2QQtcXCQ/OM59oQ/necAydrgz81HxD5z2ztWzqmGrAjWFFTppjIpQ7XSEEHy1l5h
         aa/V8otEGnM6qQMiro7kJSRY8WxN+qmg/DhDeqYBDJxhJ5fum4aAaH1ING1gCC82VPf5
         hUSA0gGMOAcTvs9r8FrHb4+mFvju5fInP4P88RitA2MluMZKKkqYkV89N6G0AgJCcVk7
         CqCqeobN3rHlDXFdw7aJTqnxm6h5ydoi5Av2auEUlN7qeCcPoNGzoWIYEK6aRicyE7DO
         GwC5/qqwnwhmIOz8eul4YaZbrurp6xnIEXBHtSrqIJBMiVM+PZKWGMP5pg+xXTsjhkfi
         WkEw==
X-Forwarded-Encrypted: i=1; AKwUvBwmyZ1P29ojXPLLJBmsjTBf/SbJxnMDLDXDheT8kFNqrOWkL6jE3nIrTng0E+rJQ3dPXh93FLTW6HDFvmg=@vger.kernel.org
X-Gm-Message-State: AFuF++kX1gdMZRfgQMr+jZIqElNV6Kc0N/bq67gnafLLB0JW+PIw96Ya
	r1BfDq21tBnjh7Pas+YoA/gDnPAWQmJ32c8eeWwaA42AvxjzsI3izu2/nzjFv9gQUOw=
X-Gm-Gg: AYBFou1f6EX7vTbqWE5X5wAdLLkR00Vc8x2yLdid1dk1NBSbaItMS84Uz48nQknLvOY
	nWwz+RFfT/mPlKU8WQhGpEbHtawnWQqEN7yS4hvq9JLFCxkjFeLs5oRMnu9SsPyHMY/0Fr3E90Q
	EJI0jOX3pTUNhzntAWBtBLJBjg4AARuQDrqSCRj1nHGZuzvNWl187v6Dsue59WMDmy9Prya0hX3
	i0KrXkEje3tJxgx1zBxROjCxEQ4egzIPX7JL+nWaWhXJhI8vDKZ9NXYn8rgPjmMfdbkwI9prs3M
	jE23ymjJu2t8f3ZRgv8cTQOqVljhljVr50R/iKK1c2/xeQfRJ+j8PIwFCbX7T7HNxrvTDrjjM/u
	XGjbnfdine1MmLFqX5/iqqcYXyL7nYBORkipE51ZtR52YZX/EskeH+zwARghkoNoPqxCmZkzuSb
	bfymbcAWE9XhdLM2fumQwKA1Q57kcgkl95D6qkMP4G3XHtcyyLsYgJTOl+ySwbgI4mWcKUxyYqD
	79v82YSHC65wpT/9Te8rqup+eAI7R2wpSuVodDxqrgiEFSgIvaB
X-Received: by 2002:a05:600c:19cf:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49e7a6859e1mr35897685e9.1.1789401891025;
        Mon, 14 Sep 2026 09:04:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bed0sm28874405f8f.32.2026.09.14.09.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:04:50 -0700 (PDT)
Message-ID: <29afa1c3-b1db-4e98-9640-104251cdfa2e@6wind.com>
Date: Mon, 14 Sep 2026 18:04:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v5 4/4] selftests: net: test AF_PACKET multicast
 dumps
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260914014539.5015-1-sigefriedhyy@gmail.com>
 <20260914014539.5015-5-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260914014539.5015-5-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 14/09/2026 à 03:45, Yuyang Huang a écrit :
> Dump the link-layer multicast addresses of a dummy device and verify
> that ifa_index restricts the dump to that device, that the all-hosts
> address joined on link up is listed without IFA_F_GLOBAL, that an
> address added with SIOCADDMULTI is listed with IFA_F_GLOBAL and
> IFA_MC_USERS, and that IFA_TARGET_NETNSID dumps another netns. Skip
> when the kernel does not support AF_PACKET dumps.
> 
> Signed-off-by: Yuyang Huang <sigefriedhyy@gmail.com>
Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
