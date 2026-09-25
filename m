Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E93DA5A6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790323594; cv=none; b=Cv07drbhi0HrJbkuDzrnqH/BTbJqH/f8h5YXHqIKCiNMsI95jiEmv80a7s1n7R7O4+ybvbuW3EBXYpKhIGjKSQLfxX3uh2JpZYqEPDZjbLPyVoieVePsqE7idO4L6Sinm1H+f7lySPXRMnba4WHWV4Xy6B6itSF4vILI9zQ/2dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790323594; c=relaxed/simple;
	bh=XReAURkX3U0oUi5tdZi0L6LmDV6GZISC5HbZheosNnk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qEpnEtWAfjuJWcKbLmTjhnmcHLJxUwOiB3n+eDXf3iUnE2wgEctsjvsmdV6laheL3lVXUPjBdynX7I+YLa3n/2f+PcxXkHkN6BKbjhx3bzeWGXjs0lg16bRlr4kV3xIjcB0conKpE781Ii+XmJTk8XQHw60rBtYK78Tc8r8LoYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=QAUP5eAr; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="QAUP5eAr"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843971bdd0so80085f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 01:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790323591; x=1790928391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=81Fui1lfICkyCE0QjEboa6SMdzFp3BSSa/6lmz1HSnc=;
        b=QAUP5eArcKm6QXbuEw8W/CtXMPwZ9ONN7uwE5z8wkHl8H6pMmTVanojfC4ce1uXbao
         +jQNqx72KxLIhWsbZXlFRfs+0lLB0rJjFfXHvc13qx38ORDyOXO3m4agJA6ZJ7SND9Wz
         jdRjA1vs9oKyEjtlFD8kBdlEbLv19qKcP0eZu+SZtxf0vxXBE916iEv/BQebPtRpgfBS
         cuLNxza8hPeGAfjDWZSc1en9iRkOgVKydjVqrAS189lw+3BdWdzPMSlgbaJvgY4CpZ4Y
         DsJtC+djYKaEw00CfT19LgTCdReMbhx5QJDj4SC+cwfWwxydgvB8SpIjHbQWrKiLRzO+
         cJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790323591; x=1790928391;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:references:cc:to:from:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=81Fui1lfICkyCE0QjEboa6SMdzFp3BSSa/6lmz1HSnc=;
        b=rEC/tlJO1nwJNFlQXU+cjlOHVFqka8WZoJOEfGBTVQP2eXw+E9q60CI3W8V2GkTFA1
         C29Eu134UTf4KM5hiFCZbLANXcNcCkLhXIsuSS8jGjgTNos7kCMpgzZ88aJL7flW85Dd
         eQIKKgO5wdY5U7jybvXh5OgEKvlhmcXsYUxDMorBpcu6gancxzxeVJy7mOG6TewIDJu9
         d8nhmafz9qElQWlqLaihmlZF1GDASuOAHHDRt9u/4vzJ8XY1z9Az4+fjTkkbHVG98D8K
         4v4FeIOOqADPYtSmQWWDACkoZTTLre2dMwrkv3Opw7vivecmn5g3++pVg0+ohjiWkTPI
         Py0g==
X-Forwarded-Encrypted: i=1; AKwUvBw5pkurllZRrUDEXvuNm08nLAZJi1/8K7ObbOAPN2NxbrVdTyU9bsaoszBqGXtfNFJaZCs6pfV14LM28qM=@vger.kernel.org
X-Gm-Message-State: AFuF++nyn+ztERNjKqAqjCbxEuOZa+OsnkOZ/nurAUJdyk5apsB91mfg
	YWIGSeo+wga03wPSayYQRF31rL4p+yrSaSpqx3PhBxHGxRB5n3K0WOlKZBdJ4IOkgV4=
X-Gm-Gg: AYBFou2qrsiiQJiLDJCsh4sA0Z1HLIoxiiFu4ZNt+SmrDZMjLG+vZNxy1XBqR6u8XQv
	ZpfT8Qi4+iCEqzAT9TY6fyRnIt2aDxliakzozmlU9Mqp0w/LclOkVpWj7Tz01dii7lowpkxn1D9
	1AlcLJ4OmuWDy2v8ol9thhC9cmcQB2+PWcXs8a2Plz2sGDYeOLCxwlP287vT86vB0zLI7fll98Z
	XFCyO2GF6pEFoNjcO58MQCKU35bcZRB9mttgTPVqrKWQn6MkosIjumOYWkJL7JVWl9emg8WFxjQ
	yllZ2UYjvd9mGLxv7vIRp2eXouii8rNQaqmeSZqSX9s1Du9BL4gNCgkJeNNKGLU5LfaUAPNcoq7
	zg1uNTv0JCjIW2yaAyc00AQc4skpstqHXqj6q9sL181iZgra14E1ACL1OYUezbq8KWSyJJifuI4
	Ih31h9chtmThuzoTHkk+pAzhArLHrXzubP+Q/1QkX5rOYvgLEqOxd2OkEaZfnSltOsaxs9lHNJc
	TECMPxwgsYYB/VAvgKRT7zOtx4J+daTFmcMS9pJwzrtgrV+SbQ=
X-Received: by 2002:a05:600c:c490:b0:49d:1da4:511b with SMTP id 5b1f17b1804b1-49fe67bcb85mr80612935e9.1.1790323590675;
        Fri, 25 Sep 2026 01:06:30 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee6ced69sm34064615e9.0.2026.09.25.01.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:06:30 -0700 (PDT)
Message-ID: <7e0c33f4-eca0-4a68-b43a-543d9a233631@6wind.com>
Date: Fri, 25 Sep 2026 10:06:29 +0200
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
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
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
 <51d27e49-afea-4416-81ef-9ff132820066@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <51d27e49-afea-4416-81ef-9ff132820066@6wind.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 25/09/2026 à 09:58, Nicolas Dichtel a écrit :
> Le 24/09/2026 à 03:15, Yuyang Huang a écrit :
>> A multi-part RTM_GETMULTICAST dump of dev->mc resumes by position, so
>> entries added or removed between two dump rounds can be skipped or
>> repeated. The IPv4 and IPv6 dumps report that with NLM_F_DUMP_INTR by
>> stamping cb->seq from a per netns generation counter combined with
>> dev_base_seq, see inet_base_seq().
>>
>> Add the equivalent for the device multicast lists: a per netns counter
>> bumped whenever an entry is added to or removed from any dev->mc. The
>> list helpers do not know which device a list belongs to, so give
>> netdev_hw_addr_list an owner set for dev->mc only and bump the counter
>> of dev_net(owner) where entries are created and freed. That covers the
>> dev_mc_* helpers, both lists of a sync, the hardware sync helpers
>> drivers call from their rx mode callbacks or their own workers and the
>> reconciliation after an asynchronous rx mode update, while snapshot
>> and other lists have no owner and are not tracked. It is atomic since
>> the writers only hold the address lock of their own device.
> 
> For IPv4 and IPv6, the generation counter was initially used to invalidate some
> caches; that's why it is global. Here, the goal is only to check the consistency
> of the netlink dump. I wonder if maintaining a counter per list would not be
> more straightforward.
Forget, it doesn't fit in the netlink consistency framework (:
