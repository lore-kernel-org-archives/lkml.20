Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606764;
	b=uKOob+YckaQEeIrS5Z8mNeIYNz8QOQYbSiGzyIPwvhueNU72Uzc1xvNSlVhQGcbCGq6A
	 Nllg8PmwGPxAeMNMH6PYqAig3SWQKOSGq9CuTSKCslEim/A91E9qeBAQA2rQj0s+eyjFg
	 Rb9POAabDemF6roybVuIQgTry0wuuitLGeDbCGm59/QxJRRQbPdvoN+5Ip8WkdR7+DObk
	 eSoKTrrEvVfqjpuoGzOdvwKPX4jR6dxvInUF7KYjD6kSCCvTFULC/W3U3sWRUQwBi2xO/
	 OSX+FHCi8XW/az3npzKXq4S6e3ryD+6X2kBxEHlXYxTO+lxzRI8qczAk8PUGLcjQ4sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
	b=LMRU6P8waEKr9RRUbmixGRkgbYunGUCIKiSC04+1k/m38pDVPjog6r8uWXweqoArXPbK
	 V+23jMKoohVNj2+UItQ21fqRNaUzQZL5rqnjByNYwGeXhVFboWfTL4vsRfGURTWwZWGdR
	 dwjBUtkHh6gQMuoZ38Y70gStGkFv0YqRLnrkMZy5/1rfQtoYYuXN5RRu+G6lKTsbbCp8e
	 rSubOMRGCigREIWKzr428B+nOkTurf2cFeHSiAF8ZBUIqhQDM5dAk3zVwg1ePyG0ZF0ip
	 Ge885QFQ++X9znMpMDnKLZoZQx+VjS1UgZXtePdAsdrvLIcLGhGrEI1+GK6UbeAoCPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRzdrfDm;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56589606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:52:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56589606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NRzdrfDm
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3282db206d3so4244233eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606762; x=1795211562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
        b=NRzdrfDmke6+7URTy6cA/bYqVIwAsHCBYZRdEPsPoxiZBgtPoIol4ds1aDg5PEBrCZ
         0N2UA/seMm7ZsPAE/DvaOwbrtMdUAzFlxbt2vO/G3sDDiQhU2ruhK6Sl63qghZ//1Rdf
         RO+JRPW/RIc4fyTFq2uXz6lwysk9jP9nkLhAGyJxxf0BAmWs4osKNnHJq1b7WUUVKJMQ
         PTFgy9LU2XoQNOY5YhQ9dfXAEfHK2mKs09I7owAbB0ydXmGzL+pWbpFmvga7LAMGPMz9
         mG7U6Odb5qOvTA2xLi8Bh/ZAq8DqjFswbVI08K0cba/B1A8rQ1ULSDqRj4+OdiTS2u4t
         Qwhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606762; x=1795211562;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4aTwoA3JVNFzNecITbnhpCA3ymHcrWrY5aiKQKruUmg=;
        b=YsO+N+Q//nGcdU4gZscecCVR2UBqwPnXyQFHXoMMM287cRUo2uztAD1XmTXbmaQIax
         ZGUWR2lIi/4o4PGWG5pXvJ6y1KAEla5hGhjvOmxj26JKwGVJ5FGkRvFMeyeUUfW9k88G
         56/m1Skiu+LmmqouTEgycevcE8bBPYEF2HzokyRMVSr8IVLjfLEXKYtqJ9mS/emBTCBG
         VzkaQAGLeYWH5EmEIg6RIWcB2lZ87v+od5qhMcmNNVKYS0KoIHl+3p6Pi2bnvBb+ovXl
         FVUhm+sYmy9+cZWv55Rp2H7oDc+7/DVpOy30rD1vogIQgowtS3EfPu9oW8zq0tqu3WBR
         CNmw==
X-Forwarded-Encrypted: i=1; AL+hErHEZt6nMtg80M5rjZfDtNglvtMA7JIFn1vte7xQyceRfrekYR8UjelO7xa9TTd81awWwOy0BX/npdvCaAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qzoDrQ9oVp6QCLVxS2xYQsm6ZWVnUpq7aRKy/xRZxP+mPQLen
	C37rdA48ZjrUWcjRqRjVkrit2bMH86ZOPUZpjDPkIdmzBMnpWQuoO69K
X-Gm-Gg: AYBFou0AFbF0kEUqj9B7b0JeGRWRjgE03grCtsI7RP/9wWA768NB2xB/SvSFC04KqzY
	lGdrV76ZDTZAFme9CA9zoQPw44Rjf1QUMVQJNFzrXEpbp8/kgqbTlk7ThLDL4+nwqiPrpKhFtYg
	tScfg5CLywiBlLPuN5o7tC7VXhjWbXF/94oPfnEBK3+Zt28n4MDXYKEVRxDTXmEhfNM6VXff8OO
	7vxIoy4odyhNnIuTMNs0eGk9344mwamkp7JPJp+1K573MF1RD+kQ17RLeB0GKsd0U6bJp88MWhv
	J6PDcK8CsXtbvuVAv6nLVmHS941RrirbXnHI15Gw5jYDD7TCT47cvvWmUFvajYkK6GzJKXh0FD+
	rzUQzCLm1AMoBnZf20b9PRuS4W2utcCbf7/6mKwVUDZeziZ0TERsIiuPCuibLN6R/H5pCKUxiDT
	kL/4AuE7u37pcA7nJlzIX0dbsqGh64saZ0yYXL49Nxh3L5EHS0HXe9lDUUFuhW7U2hEAyRAM94u
	qcypDa04ORAjQ1GcbTsEHi3mVZdgaswHEYLmGr9mAgpNPz7NWwRV53RVWHH+OVCpK17TeZoMnHA
	mgo9NW8Nmi8z46wCZI9pQDYrNSjumcrEGvmCu7ZgM4LI6mK0hENsFJZm
X-Received: by 2002:a05:693c:6384:20b0:36a:1709:458 with SMTP id 5a478bee46e88-379675fc98cmr3524667eec.27.1794606762096;
        Fri, 13 Nov 2026 13:52:42 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm11022781eec.28.2026.11.13.13.52.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 13:52:41 -0800 (PST)
Message-ID: <bf28da39-23ae-4d17-af17-fe46177d8c80@gmail.com>
Date: Fri, 13 Nov 2026 13:52:40 -0800
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
Subject: Re: (subset) [PATCH v6 0/4] MIPS: CI20: Enable SMP with two CPUs
To: Brian Masney <masneyb@kernel.org>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, hns@goldelico.com, paul@boddie.org.uk
References: <20261113190836.470937-1-f.fainelli@gmail.com>
 <179460306211.1364508.5876481329838567672.b4-ty@b4>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179460306211.1364508.5876481329838567672.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 12:51, Brian Masney wrote:
> 
> On Fri, 13 Nov 2026 11:08:32 -0800, Florian Fainelli wrote:
>> MIPS: CI20: Enable SMP with two CPUs
>>
>> This patch series resurrects SMP support for the CI20 board. This was
>> submitted back in 2020 by Zhou Yanjie.
>>
>> Changes in v6:
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/4] clk: ingenic: Poll JZ4780 CPU1 power status atomically
>        https://git.kernel.org/clk/linux/c/2c45b7e1e2f7
> 
> Best regards,

Thanks Brian, I will remove that patch from future submissions.
-- 
Florian
