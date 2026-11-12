Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500816;
	b=LmFSDdp9RkOtBOXs9SI68SAwVIYAJoGJtSXwcbMFD5/RwEtE/67bYbM5zO1qANHeamuf
	 O5347vMLlclk32dqZ9jmlZ5b11WGbjLQ93XYQFzf79HC2pYintJY0GPJ+ojFCN27Xp/LZ
	 pYyjxCci2k5CNcKd7Q0HFKPV/+mtI6jWiM+x3fvqspwuZEZ1uuA7IemPv3VJ/ypTRWHVT
	 bkYW1LSbzhMzisWW+EIbwMZWfYKQ4wj1R/RhbZ92lpAC7fPuWJHg0y5SOxGCKbcTxGocL
	 PQD14Eq/c2nLEpoXlP8iZi3Xerwx73nAucw6RKwpfLj3Tnb5FscBn6hHQW6BjmsE4Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
	b=lch7W70fWcTai79HVeguC8JQxTfA8truS6poLxplg2oIyPqclFOGpSOiOmg4BG7FaeNi
	 F8u1IguywF3R27p9CWls4f6Su9y9Eefky80BtVJUlWIrmGe8aD7gxzgm79X81wsbnIcHI
	 aGs2iLktKGgIgtM7C/0zu5D2aAiP/xJEo2e5dohNeZfh3F2v2V03/R0nEPq8HTJMAAzMK
	 EUG5oKrI3TBPaV1gns2kKscTz/A+THKJ4xmknWphGi16V20B5y/ZhWHSmExvn2ZXF88SN
	 WrVbK3+cZ4m+sNVmvzsjZdnJMbg5AOlICQMTcLyrAqjyfCMRehW/KTKVRCzMp7SqurA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b="EtFg/kC9";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91A0606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91A0606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=EtFg/kC9
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a59ffacb51so2859825e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794500814; x=1795105614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
        b=EtFg/kC9y1DirVvA9yLbTRagqhSjkLk6ziYDwHAP1xD7Xmb6LsmwWC8mOetg+tDeZh
         xWqqP6oEWPZigH9h1x3dDWabH29oHWXXy8GyR9+grcWK9NGsuRdMLxx+2jW5MXAnBZ+b
         H/lsp0vaUjFdhS/GF2SD93gAx8GKeho3HqXqonlGauq2eoZZ/MrWpHCfCZ3KE4KEYOUt
         fqiTFrUhHUh8TyyYD+ozgnb4Vl8qqidvow3BWLG4cR49WWZCTr/lQPU+eMqBNf3k50R3
         sT9Nx29c5j6NPlP/T/8cZnAXmYTOw+p/EfAeODvgcT6FR3gbNvbFp0tzEYIJwXmERdqj
         v7Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794500814; x=1795105614;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQ/3quzm4feLEDq5prptw7Btjz+8je4ZUZGF6TJco1M=;
        b=MGVM74DK6UjZUkEbE6Dby8iABcX1Vou9dEm8TPIiaLfzsiGYic6uSpFJXIIZ6uuPYk
         Giprt2wm80ha08PK3FeqtKpYvOuTSFv9qwTh+WaLW2uHCR/QDWGNpA1H4j91fOjYYU/7
         STnTT/pnuc6q3NEQc2w3B/ayLKa359SYpVq+Wzdk4nnLVNOR0PZ2ESrzDoeBK40uSb7t
         tUIxqDrSXhTafJz10hD8EgBfS0uFHuippauKN5KbdISqVl2W/sKYtrmdTS48+Aes6thk
         oH6v9O+PprPRjuR61DYU6xaQl5BfyHCE6NIhBB9fRxdN9Y5rfE9FKjQlDO9fgLwGNPhi
         zXeA==
X-Forwarded-Encrypted: i=1; AL+hErH7qfB8GqvdqSuQhgaSdWlgQRu+Jbf0nHWVgTpYgkp1OobM1aq8fO+7rZWYWAgYT1FSb6iGTXHTIkwqOG4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+j/JS73IaYF6Ece8iqc//h+cRirvTJ759alS5XWEoOQ9iMx+bS
	6Zai4kSevh83JZwfBJdXDQ8ufz8iZwYAQTErmx/Yv2wdn5cSr/RPe4XeQh/5eyUr/aWkFeiVTtS
	lMnROH/Q=
X-Gm-Gg: AYBFou2g968Ut9oimlJHLwcuaUO81WgFuGRGCg28QmJec54ReO8KFnzJexXGCj+XtT7
	fCGqppaKgW7aGpXGOnVVWlwJEjkTO0AP4J6Ft610BETkXqbXl5AELzaZH/c2ELM/7cP2T+hqzZK
	PtH40GTwH6k6Rra/zjvfpMuZWijGXS42O4ZfsmLcHHS+HF95uO9Imqslg7+/NiXUOXE7SvF5Mxj
	EpOzgIA7SyyvhIfVcuW7osPGaYji9gI/99FP+7aCDIU1etjlxPhtFbs6azM1Mu+K3wC9Q8y0Nuu
	0vsKbcqHx8oZx0YXavNMVBwgSL7mmnCbWI6SfxAN9RedR9o7MgLI7KfisXdeOt9HsFqEoaWHS+c
	QPRKN01BzTrDXvEXPmAwwqGEvElBkIRswr75RH3HRhbDe9ZLoASsKWZmVHIkhPoW7yXDgU3XjAl
	qT1ZCI9P+LlRpy0ZBf36HI90vMGSkqxhSknARmi52FxtJUD24Fonuwl56XBdHPHmCl2U1v5hjs2
	QV+wCuejfJEZGJS6M2Y+6e3UXXCiukF9ZZ3HuEo2ZkL5hR4Oe9f7TXAacf3KezBbgdLoIoUasbU
	I5HGXKRHBlLFq2zHluw3ggOzlFPyobV4AiG51KxeStP2pMoIzKTUWo/ngLqfYnrNTwHimvzM4yj
	B2Mt4EA==
X-Received: by 2002:a05:6000:1788:b0:490:540:f95f with SMTP id ffacd0b85a97d-499c92284d1mr12368002f8f.5.1794500814316;
        Thu, 12 Nov 2026 08:26:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c607d12c4sm84484f8f.41.2026.11.12.08.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:26:53 -0800 (PST)
Message-ID: <bac47e7d-2982-47db-bf97-d8c1d832704f@6wind.com>
Date: Thu, 12 Nov 2026 17:26:53 +0100
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
Subject: Re: [PATCH net-next] ipv6: always apply all.force_forwarding to every
 interface
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261112-ipv6_always_apply-v1-1-8df846631005@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 12/11/2026 à 14:41, Gabriel Goller a écrit :
> Currently, writing to all.force_forwarding updates the interfaces
> only if the value stored in all.force_forwarding changes. Setting an
> interface to a different value and then writing the same value to all
> leaves that interface unchanged:
> 
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl -wq net.ipv6.conf.dummy1.force_forwarding=0
>   # sysctl -wq net.ipv6.conf.all.force_forwarding=1
>   # sysctl net.ipv6.conf.dummy1.force_forwarding
>   net.ipv6.conf.dummy1.force_forwarding = 0
> 
> Apply every write to all.force_forwarding to all interfaces, even when
> its stored value is unchanged, matching all.forwarding. In the example,
> the final write to all now sets dummy1.force_forwarding back to 1.
> 
> Also match forwarding's locking: take RTNL for every write and compare
> the old and new values under the lock, rather than returning early based
> on an unlocked comparison. Send netconf notifications only for actual
> value changes, including for default and per-interface writes.
> 
> Note that IPv4's forwarding does not behave like this, but we won't
> change that one and align force_forward to the IPv6 forwarding.
> 
> Fixes: f24987ef6959 ("ipv6: add `force_forwarding` sysctl to enable per-interface forwarding")
> Suggested-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
