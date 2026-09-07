Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0EC44C662
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785506; cv=none; b=S7bYHUxusCuLZIMkgKS72zvWGzanw5dp+80TpSdP2L6AziV2d2ict/XR7rSWYqh1yc9mHMRBkXMuP9IJjmq0rZ2ut2gcJQz5rf0nscTsvM8e674CEgI2g036HWRxtVLt8M9EExiVlxcN1HjSoob25dZfLX52l4wUuFewNJMb+/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785506; c=relaxed/simple;
	bh=QcG4Y12EznNeNbKOAixbdSxNwnRwj3wcEZZ8DofN3RU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn/rPE8N1JQCWklOJHw5HTc4zRQIBOL+3CgHQtuZQ5ypShgVfUH8f4uEpLm++QuyGxp19vbfftaZPVu4QFvvKbWJWq6qxVFHIQJm/XFOMe+XJxWjY6bEb/VTJU5bvqJLScLU+wQJcgBJGdjDrpkOAL9VbOmYK8sHuPUAs1p2cko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=U9OYRh4Z; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="U9OYRh4Z"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4838dbf1bbeso257962f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1788785503; x=1789390303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LNGC4xhmgAqrems8CxPUwu2p9jt91LkbKNWkt+9er04=;
        b=U9OYRh4Zm6Gs7oaMZSqZxd206ZjVVYgNMCi1qEwrzkW585k+ikrhW1kI4iNhrkB6VU
         GDskHH74Z0Oqwsjm9nBrKeP1yu5jxkfmYANQO6N1eoI+Rry19sxLI3/BlyvNIHdL0Mc8
         gr8HFX+sHNqdae20bWGqBqqEqjWCsPJeqnRwYuEP1EB+RhsYK+ENPYA1fH9TkvFrwqsQ
         iyQ7Cc3jvRj0B8E6VGXPsmf2qVXWDvP2ReAYMQeaQ5EcRTTCJj4/TvqwfQmnuOwc54ld
         tTfiuHK2n09vPqx2Yyr3O4TlyFTGgJtobc5DcYzqLmVwwQEf+aNAw1N2jfpTnPSZBUP0
         ncKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785503; x=1789390303;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LNGC4xhmgAqrems8CxPUwu2p9jt91LkbKNWkt+9er04=;
        b=kIawHRXEYBMKMc1R7u6JvH1xeeWQ/ui+b6QhNEv0W6l7cW7IrS0h8jOJFdCGfcm3ld
         b6+q/XAdNo28OHwKE+MTwDyq3OOsoJh7A0s/nyF6fvR7TtdsUIcagX5SkRuI789PgKPb
         +AkjO4Vt/o5iMCFEa3kEEENjsD4pZItVA5HUafC9Z3bRP70hKibXGb4CkNGkjXPdvZqM
         f8tSOgroYwgu/9A7UWoajZU0bXPwq2nQ/0oHBkY4lSacwJHakOupREC2RD3DSDa+7kct
         yqiU7Y8MFcdeTfpLn+MMxGb60108mKHJtn2E1MPrhFsYgOKdkfDfbR+EWuocyEmFcwJy
         FfQw==
X-Forwarded-Encrypted: i=1; AKwUvBxQhAqSJVaB5W7OKK4R6dYbapxl61T1QjO8m1guZD17P8XLZ9vbwN1l0FqwtCRSZ+YIXEcsWii9eGdkUsc=@vger.kernel.org
X-Gm-Message-State: AFuF++kMYsIny6rAGiyd8t6mZQL0//+UHiuAb6rEryphmVA/fyMNKXAn
	gFKXlW8pOaR1WSbsh7aCSlI+GiSDGiCCIVQDuAU2Y5c1dHGRlkEnfxx8qMa5cyU1QHE=
X-Gm-Gg: AYBFou0hZjBrkXiIM4l5OZky8OPlXiwzIdYSWlS5XJ95t34ke7lPoH81/NYtaUCzm5i
	UTEsFsLEjNXriK3FRVRqCvCeOXSpj2SKXMVWjwvwI2tP3GG7Ht/tuizJXvNJ0/G8Pnd44BalBuC
	Tjn0yHzw+4Oa/E4e1ug01vIEm73o6D5647vIJ+TZWZqIJWeYJwmI0XlM+TB+EVhwfvCj06wdUCk
	CHcTI/eKAsIYsBJQPNxWbS8UOT8i/OTWXLyxPjkns3Hfo27Zm7bgKrky05+plbF4WQHI8V1RDMS
	Gwu/KbI9dbaIKfwOC8hEGVx3qPsuIpxoIGN+fIUBMy0v7imR41knUi0WZpcFUWoRHGbQy/ANtgd
	99AAddmMd/pD8ekTxTGxlWQyn+RfJlQCTZcwZYASOjDS5wsWj5HxixGHO7m79+HsFFciCJBHXsc
	Pn/ViG/+pEza7zjHyNh3Q/icHSPnPCJmZ6YbDK4Xk8tYhl8w6blVh4zIh9UQKCrGKwGV7FzuxQ0
	ZOeM5WG8hZafXdDJGXGKYRrHNZKwMNHXkr2BDfH2A==
X-Received: by 2002:a05:6000:2089:b0:484:3313:4a04 with SMTP id ffacd0b85a97d-48590807e07mr13071460f8f.6.1788785503154;
        Mon, 07 Sep 2026 05:51:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm20729287f8f.20.2026.09.07.05.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:51:42 -0700 (PDT)
Message-ID: <f1e70062-943d-4521-976a-ae7c9fbc756b@6wind.com>
Date: Mon, 7 Sep 2026 14:51:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next 0/3] rtnetlink: dump link-layer multicast
 addresses
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, David Ahern
 <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>,
 Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260905093932.43726-1-sigefriedhyy@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260905093932.43726-1-sigefriedhyy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 05/09/2026 à 11:39, Yuyang Huang a écrit :
> "ip maddr show" prints three kinds of entries: link-layer, IPv4 and
> IPv6. The IPv4 and IPv6 ones can be read over netlink today: IPv6 has
> had RTM_GETMULTICAST for a long time and IPv4 got it in eb4e17a1d915
> ("netlink: support dumping IPv4 multicast addresses"), with IFA_MC_USERS
> added later so the user count no longer has to come from procfs.
> > The link-layer list is the missing piece. dev->mc, the addresses
> programmed into the device filter, is only exported via
> /proc/net/dev_mcast, so iproute2 still carries a procfs parser just for
These addresses could be listed with 'bridge fdb' (RTM_GETNEIGH on AF_BRIDGE).
Instead of having a new message to get the missing info (users), maybe it would
be better to update the current API.

> that. This series closes the gap so that "ip maddr show" can be served
> from rtnetlink alone.
> 
> Patch 1 handles RTM_GETMULTICAST dumps with ifa_family set to AF_PACKET
FWIW, AF_PACKET seems strange to me. Isn't AF_UNSPEC (like for interface, cf
rtnl_fill_ifinfo) more appropriate?

Regards,
Nicolas
