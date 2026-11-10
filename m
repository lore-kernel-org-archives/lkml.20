Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317141;
	b=wvW5hLP4ijdk1rU4unncTkhAKQ/UIqic/02S2Hojj96JuzXlQ1Gf4jQQhzj+jGWjZEkm
	 jBymnlbPBbBIp1qteIFFNl9SWnwNFw1qhO0BUba8jw9/re7DPIdXDL3UOJNpwzs/GXS/+
	 dEMwQEfwTHWhr/ZQhHzy3CFXnGwnS/klbS03XXXYsveG6SA2QyBVvPQUetV2yu8suBLpD
	 8ppZyS0XeTsOoCuWujUMqO0Q9TR2u4MekuNW/Oj566mjK3O8qM/pDv2V+40LX0jK8JZXa
	 NQ9JiMVOpTTARm6iCxCr1te++kBwlqYZDVU2s2YDI05pJU8ZoAJ7yZU5V+SK9ilkdcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=60bvnn5EEmm7amBiboedAhK+TLPffs/DuoYwNr6iHtA=;
	b=cLSh0A6ErMh8bd6kh3DiQpkLxrtQR1sMR6RaEgUdbfIrBHqkWk27kdFWljjz7TwmYG9E
	 /i4KAUQPQ+WITHrCki7Kp7tg77XcDHws6T/luxnGb5KDO2jLGHBUSJb1Tpy3jJisepYUh
	 1weP+UbJvBtKRxgO9wQUm5cE1bR2+eCVItjr3N5y7sB7OPZA5Js7AyVAfkBLB5wk7RXt9
	 s2rEuBjBWxsg8PEGrou608cOBQsWY8DYLp2RHFTxZOPp3N25Q8s3OxMWHNBjQfgRnyAMc
	 THlqmx1Xuldyhn3vbDbuU+PvbwiC6m7LPuN/S0+BetaMU3sR+nT14nNDdHBdkiiH30g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYyaExNf;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC0C60727AD
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC0C60727AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bYyaExNf
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so27092115e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794317140; x=1794921940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60bvnn5EEmm7amBiboedAhK+TLPffs/DuoYwNr6iHtA=;
        b=bYyaExNfjtXSGx8zvflaPTXSKwUgHeA1irmjxLgIGHCmsNIhanOiujCfUUbBvKblnk
         JFbzFUmFzL5ocx8XDztez35fshkuYb+4rXZuYo0Ra+/UXDbzknpugukQxqRnt2tIWPA1
         vRkSYn1O2GjTLfAgeez5vvnt7HKDFt/LFG492he+ZSKQCx2116t17o8rAHLL8BKbdwgQ
         4+RhIbSNrWzalCnFbUdbNR/O66tM9VjtYNjlcFsVkNtxfj+lELpDn6VJ8shePsb+gXuD
         iI99JFGRDNfJoCxMOc3HdHK5xDUfLAAX/Z2+259g6rInbVzin18Xzeg+HmXmVqN1FPld
         rOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317140; x=1794921940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=60bvnn5EEmm7amBiboedAhK+TLPffs/DuoYwNr6iHtA=;
        b=hT3WLUrjGq1LS5Fxt56mYVZhztYvGOk0g97uIPdjFk5+PSLXToseBJDwiEUPkXZPHr
         CFbRP+1PZ+6kfjLdxSN/dSWhu7J7zYB0Plu9Atr5GkrsBdPSWRLPAthdtEROh6ljoA8r
         I8R+fsJX8PF7/qfvPhk0oCmfSt1yxgR7KJyJfSvjTFD52Klt2M96mJ7eS3fcyoPIVexJ
         IOrYrfJwKRxovVgGRfDkzWVn12XERvl1/GWeOuWE6/fNCtOWphvJmq+/aS4BAjaHVah2
         6D/kevZnVx1jVDyH/Xwg8P0D5iRE/e961wAeF8RN4ex2oQzdOquDcxW80oV0RyzbPxUc
         cnVg==
X-Forwarded-Encrypted: i=1; AL+hErGuyDfTdtIIuL2urQJZTMDgquQuxk0NSkLiMPj7pHMusPCct+PONgmGHviIOq7WSJEe961CXxBtZHcCRl0=@vger.kernel.org
X-Gm-Message-State: APuU4Z87J/GALZ2z1Vy5XBgbsNDiwgUIJvwuul9AMhMQkf3VZ8MeisTf
	gIiG1+gdmn7mpg/8c5uSH7Cov3NgkMvUzx7xfrwXDF1R+ml07/lwBbH1
X-Gm-Gg: AYBFou1AbJxgu+h38xkPSiKEfRli8Nw/88x9fMcCnL3VZR/ibj+pWY8urCyOQrA9hYh
	qz/BtDh7pyLpaCiwg0ZBE2B3pcnoD4nUrVGi0mqBeq2Q3bAvYklX4vddxVARobKwKJrFZExsTAi
	M/t7aMVlcNoaUorWSl1P6hk2jWch0KM8LTLe9yUp42Vsbq18F6GvXUW8y264FtI3LKrNHcKX6w5
	5vi7oPuqaoWocoPfxnYizK6CWI3qRbxKKlyrLI3uPCl0F6aDFb6W1rcpoaSc2hVpFmny3DOwx3P
	ElWGEVgkMhFhUI1/Phkv+WEclZKFVTfmb405oKRV67A7JwjJl+JJb6AC1jxEKRSVqMgrGNJk0gy
	RmnXzKb5KmsesX1QZHdlP0XI3n+iRANBT7RLGP5+hES8Av0GSRGp55YFjMWD1A8CCPyb8ITqdUj
	Y7QV1wnUF0Uyij6On5rYkS9mjfPc1TsVMu6uSImnHlnJDFf0g75hVIISCSXO+mfpW6F2LB5L3rd
	4XefQkq5/g/WgVuKO086zNmeke1ZtcCwHh9i/Ik4iQXV8xJyHUudRQdXM0uda3Kz2LwhqWSp0F2
	okrI4LNvv/uEoRuZ0ALQ9VYY
X-Received: by 2002:a05:600c:1c0c:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0233e877mr48531535e9.13.1794317139210;
        Tue, 10 Nov 2026 05:25:39 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a76esm55864295e9.3.2026.11.10.05.25.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 05:25:38 -0800 (PST)
Message-ID: <057dc7a4-cdf6-48dd-b326-49c92a936b9b@gmail.com>
Date: Tue, 10 Nov 2026 14:25:37 +0100
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
Subject: Re: [PATCH v2] mm, vmscan: make kswapd unreserve highatomic
 pageblocks
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>,
 David Hildenbrand <david@kernel.org>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Lorenzo Stoakes <ljs@kernel.org>,
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, JP Kobryn
 <jp.kobryn@linux.dev>, Frank van der Linden <fvdl@google.com>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261109-kswapd-highatomic-unreserve-v2-1-6587ca75c77f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261109-kswapd-highatomic-unreserve-v2-1-6587ca75c77f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 11:20 AM, Vlastimil Babka (SUSE) wrote:
[snip]

> Hook this highatomic unreserve to the moment we exit the loop in
> balance_pgdat() due to exhausting reclaim priority, which means pgdat
> was not balanced and the last kswapd_shrink_node() attempt returned
> false or failed to reclaim anything. Even if that last attempt made the
> pgdat balanced, kswapd was struggling enough, so unreserving is far from
> premature. This should be a more conservative variant of when direct
> reclaim failure triggers the unreserving. Pass force as true to make
> sure repeated failures fully unreserve everything. Also make sure we
> don't count kswapd failures until then. Don't restart immediately as
> the kswapd() loop will call balance_pgdat() again if the unreserve does
> not lead to a balanced pgdat.
> 

the lowest priority gating looks good to me.

however, sashiko found some concerns [1].

[1]:
https://sashiko.dev/#/patchset/20261109-kswapd-highatomic-unreserve-v2-1-6587ca75c77f%40kernel.org

-- 
cheers,
jose a. p-a
