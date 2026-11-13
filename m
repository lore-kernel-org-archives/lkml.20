Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794582118;
	b=X64cw8CKpkTHefU+fpSkDvreCpG95NSsLDcwiBuAaCd4p5hqLsgm1SCISzgStdyjAeuf
	 wg6//9oDZc+bCeOiRLNQthiUsKlJnCcZaTJbWS963kXxSsIpd9b96uM6L/a+kF/qwv1a8
	 8jFvqYI7qmUDFV0daXVI/o/8FsRFPC0uCgHeM/z2FXNC8d4MW9NKp5Vay1DlvzyzN4ZuT
	 AFjv93R5wqS6D7+j5i7c/I535yYMlf5IjEegAy2nuE32zssn5xvl8kUmjNYO8WFjVtkcv
	 pKrJacDEjU9+xybMoMmVDOY0D/KyO7UDD+oSrswy5wNZS+n9WH88LKvnDS5ru6g5pPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794582118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=UvJlDMmQ7OVL9Cq/+dUnsyd9giVT97n1C13659jaAwQ=;
	b=WVzZ7GPk5lMXyzkSYpan3vk/N68xLuyFLVyh3I92uaqCEOnFrwHAh1j/UeEmnq11DjWO
	 /hytonzGqNU5f5T9bnWG54jfvUN7n9wsIV8mJdbyCUiqhPyKDDp2TtEVKI56qvwXTnJhB
	 +30f6y07Tq3fgqM1oFa3AI8X6hd0FHpeTik/YfFH9Pjl74gajBFm0SjnkG6Poq8OuF9ID
	 EcDRlv2K5plyYKHOETTcJIDQWPP7IupkYXSSTUI+05Um7Adh7jiiVDqa1fDLxMpqt6gNO
	 TO3zROF0HCBl65xkz4HKAcRdRkdW9H9Bq40XgN3gYr6nmrf7ODgAl/yBV5H3iGnlKmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=PKFa070+;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8A606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C8A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=PKFa070+
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c506187deb9so20727966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794582116; x=1795186916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvJlDMmQ7OVL9Cq/+dUnsyd9giVT97n1C13659jaAwQ=;
        b=PKFa070+aTzP6pVNOG0/VdpwIDPRcIm2Ylvnjxn2Lni96mDSOS8KRhAyOT3B8A0oMb
         zlxeqjgHpTSAzAtk9yBMKYIH74XMJYYPODsUNwlYbTwd8vU1p5gSNa1fZKMkcuRbjfhI
         isZ5YxpwyZQh8QL+HnVl7XT7H+P75oA5sOlcHxIJVfl3T8Vpr9NBhv8Q8JjPw8A805AU
         q+6TJd9PAAoz0MT+ZmrLQfS589f16Dx46hadjGXURjOH1EFLnH1XfugtXeWB5H8ygG+I
         H1qjqZf8KmDm9AnuGLnvNu1Uyv5xzEEm15oO7ortdDZqOMv5hVqRgGGovv+kLnYb9/UR
         RVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582116; x=1795186916;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvJlDMmQ7OVL9Cq/+dUnsyd9giVT97n1C13659jaAwQ=;
        b=WNCOVKH6zs64YPA7/tzUFxpYhTNeXTIXlsraLgigof/HpFsZ2pnrtNo3H8cUNm6Fls
         /V6gny265QskZ+EHoc7diC/mhC3WiNZrfzR/7TPIwTVUIvIc+PDn51YTEZgKmumKIaSu
         dgZ5tAvfH++2fdyRndNH1fu0RrvrtWa78ms4NmLM7d6rPq8EItUoptCqEXkJvzyit/P0
         5DpIKEQxdbjkawvyPocSk7ZirF8/APBxOQD02bhiTW8nO+Up7sFpTZ2ktB/snSiReICE
         XEIJxHMfzfxENavxjR652zcKtsPm1XhSZaGTaUlpbmvQbJ4m9LI4ZY6sbXI4y65GVGYe
         hZsA==
X-Forwarded-Encrypted: i=1; AL+hErFBaYIvQjcdIRzULBIkVbumIgScuTupkQvyGrm/2VljA8tIQ5MNBDcVzSFO7PbsP88RVUUNT9PqhVjbrII=@vger.kernel.org
X-Gm-Message-State: APuU4Z86iIEryCn6qDsLgNfLVvg2+8DMB7YtXQAaKIsS/LftAj/2l/cr
	Sn2hcf/xv7xq6eWJBkh0rwOG8v5BYyVpV7hxAX+v6qzUOozOu4tmIS16fgEUlKJOFaA=
X-Gm-Gg: AYBFou1QiU+L+SUhcf46SlTjxhHc85HAno6l6sFs6yVcP14SSzhR2uQVoGgXafgdYXe
	DA56MjTB13eQje2RX+gBRt9i3wUSBR0IIhaz9c5fmgS/4sAyOj06QzIyy/yRMFpZwywDdGOVGUp
	nETLh/g4nz49nFCvWbDpNJarV/etApeCUZecySS5ij5+pmjd0JahYJipXZL5evxpmia9Z9EIQm5
	KTSLv4a9Z63A7aBb6qmp7Xa55i8G4gtgjayb1LCLyseeLpDmH2DjnMfh9m+41JTaKfcdokS7QMT
	NdgaSKcpB75Mb2UoMGjCEKf/VxvupKznahHm9JcD2yspqZVEQCh2OqwrOXFx79uiUvJqlcK6QFb
	9R086u0Yv+7b+iEgZXSyvGSgi4lqjOYMGX4YN7aRGRasgQT2fpcI/n3ugaNSUPXUvQlHESaYnto
	jn9t9nab+okwIkfTRW6w8GXRGgs8RTRH/Eu4A6PKvNtqbmLtErZPpIptI5kVXlkSuHkfLRcUeht
	StvbPU/cYE2Cuq4SdD8sLifSW130mGCDj4uq40AjA5rwGSZYqC0wJTztqM8+28UA/DBaQIRVuto
	5bymZpyRx2NR9O96+iW1pVB6gqEvTmwqkQt7FMZ8Y8gM6pFUamtHQebw0Ozue0xmsg/MH6IpDQq
	jJJ5ikw==
X-Received: by 2002:a17:906:16c8:b0:c34:db91:aa1e with SMTP id a640c23a62f3a-c509634b915mr210215366b.4.1794582116183;
        Fri, 13 Nov 2026 07:01:56 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm5593279f8f.36.2026.11.13.07.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:01:55 -0800 (PST)
Message-ID: <1c93558a-ae19-4987-a625-4fba82867762@6wind.com>
Date: Fri, 13 Nov 2026 16:01:54 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v2] ipv4: igmp: report IFA_TARGET_NETNSID in
 multicast address dumps
To: Wenbo Sun <sunwenbo@cmss.chinamobile.com>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Hangbin Liu <hangbin.liu@linux.dev>,
 Yuyang Huang <yuyanghuang@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 1342116488@qq.com
References: <20261112082352.152338-1-sunwenbo@cmss.chinamobile.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261112082352.152338-1-sunwenbo@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 12/11/2026 à 09:23, Wenbo Sun a écrit :
> Commit eb4e17a1d915 ("netlink: support dumping IPv4 multicast addresses")
> extended RTM_GETMULTICAST to dump IPv4 multicast addresses by reusing
> inet_valid_dump_ifaddr_req(), which already accepts IFA_TARGET_NETNSID
> and switches to the target network namespace. However,
> inet_fill_ifmcaddr() does not include IFA_TARGET_NETNSID in the dump
> replies yet.
> 
> In contrast, IPv4 unicast dumps (inet_fill_ifaddr()), IPv6 multicast
> dumps (inet6_fill_ifmcaddr()), and AF_PACKET multicast dumps
> (dev_mc_fill_addr()) all report IFA_TARGET_NETNSID when a netns id is
> specified. Adding the same behavior to IPv4 multicast dumps aligns
> reporting across address families and helps userspace consistently
> identify target-netns replies.
> 
> Emit IFA_TARGET_NETNSID in inet_fill_ifmcaddr() when args->netnsid >= 0,
> and initialize fillargs.netnsid = -1 in inet_ifmcaddr_notify() so that
> multicast join/leave notifications do not include IFA_TARGET_NETNSID or
> exceed their preallocated skb size.
> 
> This alignment was identified with the assistance of an LLM-based code
> review tool, confirmed in a User-Mode Linux (UML) environment where AF_INET
> RTM_GETMULTICAST dumps with IFA_TARGET_NETNSID omitted the attribute while
> AF_INET6 included it, and verified in UML that AF_INET multicast dumps
> now report IFA_TARGET_NETNSID, regular dumps without netnsid continue to
> work, and multicast join/leave notifications succeed without warning.
> 
> Signed-off-by: Wenbo Sun <sunwenbo@cmss.chinamobile.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
