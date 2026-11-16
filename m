Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819872;
	b=GJPY47kJ8LaMTMKwya9ZNcwNZfEIkcDboO1eBd0QGUz/Ram0e0j2NQ2zN6/j9o7W50fa
	 jUV1Ydul6VtgeroliOSSXQHSUl/RQKNMzalWw5bjBdYGgmeOCk4Uvrx0LcEraD5dMGr7U
	 1TON78DCuy3N88tgrouVOONPTiL0p9waH2uHSHB5CrH9kzPsLZJ99XTRIyS0p7l/Zx2xe
	 mAMtBZ4PM5Y+sdfiBAROWnI3cgKI2/EYn+t0kK5xTmNPqd4/e89olDl7clMH33HfJN+bM
	 puID+bIKFwPYBUoyHTCLSomE0aTgCVT4JC04he4O1uMvtcavZuoSWUvJRRnJaAh6TKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=WyPsK1iObrDROZAGJ0P1ZBjLWJj9SOCV8oqzrE6Bv9Y=;
	b=brgLryRRPhJG/b5qZ10aWbeIxTdioBP5DPQhV4hO2ohiDPZqLOS2KqZNbc2+U6mMA+3y
	 3nsTqYbbD/OcLXvQSZYouvZ3EFfE3+OeC74OBgCc2m/Ud4/U/xbAEYES+ItcaULkW+jmH
	 4pxmhXphztMDKx//qMGHdzK40O8/kkZNcgqwMujPFNY6/+a70WBZP5cEZy8dmfL6sRWIg
	 CvNG5S4sA8wNtOgK72hL4XvS6acrigyNpk3kP5dtg6mo5+Il2sj40BZXNnpnmyBIO90WP
	 MjPHXuZiSDrEz+vL/VxfVsr5R0ME+i5hdlZ6WtGrXEhr+fTTcu1b8q6J5n3I3vn1iYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=XHJL8met;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CE8606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74CE8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=XHJL8met
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a73fdd2966so2413145e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 01:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794819870; x=1795424670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WyPsK1iObrDROZAGJ0P1ZBjLWJj9SOCV8oqzrE6Bv9Y=;
        b=XHJL8metE6vh0GlQjKnJHCFZZ9z6Lxjc+BBbYYp5w7ESej30ltDmvr2FydmuA+ZvRu
         s559RPBEhiNjyJP0RbryivsvgdcKgUi6FT1NFwTrynpqvHnnnAbK9NaaNVqEIdwAXE39
         4yI/bQhxd1IrUU9PHK81XwOyLpz1jSJARFnxnxla9NlrCTM/W0bTUxQOktLuugi4HIJQ
         RPT0cz7fq4K/4FGEHS3zWZdi2j5MvAZ5wdTo6/lP+qNLY7BvH8mj+ipVKXw+VsYpAXyM
         OMdMWrMCQbcR1tGx0GCVoSYm7RCrx3k4Cf0C/k8chEx12ZJic6P9bhXmJI0jCQPCNN/m
         r6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819870; x=1795424670;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyPsK1iObrDROZAGJ0P1ZBjLWJj9SOCV8oqzrE6Bv9Y=;
        b=uYZIvGgC3+cBLswfWftpGZ3tknQmBqJCdax0eMIOhwty9GZLXGFcAd25Q/PAlhkWsD
         UHrTyiPO2zLQoUcf41BNT+o6KK4gsljCacgQSrkLNFPSDHOF7059p1jLqrt3QjjJSI6v
         bulF/l7Q/O4pId10afk/D1hZb9DLlU7wa40eD8aCVpzZebas9Mc/xWSVKMcGsYrWKiLy
         M2mVN7cthYrZ/lB545scnlTUwUsi1sm7ggUOLyKY2OcK3kHvhITPSks2jkYACSoL3gdS
         msWu1COk6mS1o/zGKI/ckOwRZ2Ihrr1ILGxTJAJSOtFsRmT4lLcrW9/LhYp3CcR8K01U
         GuMA==
X-Forwarded-Encrypted: i=1; AL+hErG0ObtxZS+Mi7AG7MORTLOCPdP6TbUXapjWWxi9fj6CUtugRmMgfi9+JndzVDp6XCE2bJbDmcIV7bXWOPk=@vger.kernel.org
X-Gm-Message-State: APuU4Z95FsXTKtPG2Q2tQdwfZqyeKmv6IaeDNJq8PgRmKAXoZ2ggnWm+
	cIj+KDRVpjT2AgXBgHCvGpmEFeqOqQm+jjJoGFIBvye0X4CzM2LIxfBGbcWwiDr1hnE=
X-Gm-Gg: AYBFou1ozVjuS5FHd7CSWeeEUze+17DMF5PwRC76sRrtuUAWJ0UkU1k++fWFgbRb45k
	ZuQlzxW2J2erLPOjPiu7Pl4jf36KczskqoPEnoKbBcL5dR9/KfVGuzQObRRETa/aIMtiGWDM1ei
	yHY3IlDeR3CYc3vMlXAaxJVjUSCXM4DWmAKr4UYli6xlguVDiAqj5bbTchTAqTeXETJLUhW8Nk4
	V8grfxSEEZbOvget3hvfQnnYfnbQv35F0JdA6TTnpEr6dOY3KHh51CCUBYpK4NVJW43EMu0ZiOI
	iIOqdqa2R4pNRQlX0n6/PwI64ab5Bxz1zJ1nREZNgaq3ClulqSsxtWITqF96EE8Av3kbq+5HyYp
	Ev98mBEhx2g6b2WkYCVReyNuf1Yi1CT/6J4B/4AHrcsuqj9D8QhMdPm/PoWzoj65IzYCyVqUT3G
	jogHs7lYDnn1Vg2wFO9K5C5NyRT/9OVBaC+rzurAmOOlhleuv5H5neQ2+h1EX9+Zmc7HStV/ZPk
	PRNmo1H0z3sHdX/GcEIyLNaP5ancndx35Xl4bHN0opR+D2bYSPoSB2TBJgzFImBuAlKSqQGqW5Y
	uryzshjsWWHBnMLHOqS/djE7kLBZzG8IQUd7HBCujwd4N0x010c1X1POfOYD2H+gF94xNCJnNDQ
	pKsY/Jw==
X-Received: by 2002:a05:600c:6c4e:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb68eda491mr65161595e9.1.1794819869714;
        Mon, 16 Nov 2026 01:04:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm20157980f8f.4.2026.11.16.01.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:04:29 -0800 (PST)
Message-ID: <e45eaa64-08e6-4ad4-845e-f844150f3542@6wind.com>
Date: Mon, 16 Nov 2026 10:04:28 +0100
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
Subject: Re: [PATCH] net: fix uninitialized heap leak in multicast address
 dumps
To: Henry Martin <bsdhenrymartin@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Yuyang Huang <sigefriedhyy@gmail.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/11/2026 à 03:40, Henry Martin a écrit :
> __hw_addr_create() allocates entries with kmalloc() and initializes
> only addr_len bytes of ha->addr. Dump paths emit entries using the
> current dev->addr_len, which can grow after the entry was created:
> tun's TUNSETLINK changes a device from ARPHRD_NONE (addr_len 0) to
> ARPHRD_IP6GRE (addr_len 16). Both the RTM_GETMULTICAST dump and
> /proc/net/dev_mcast then emit up to 16 bytes of never-written slab
> memory per entry.
> 
> This discloses leftover kernel heap contents to anyone reading those
> interfaces.
> 
> Zero the tail of ha->addr at creation time, so dumps can only emit
> initialized bytes.
> 
> Cc: stable@vger.kernel.org
> Fixes: a748ee242681 ("net: move address list functions to a separate file")
> Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
