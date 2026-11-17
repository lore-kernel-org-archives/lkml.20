Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899377;
	b=qoiwJxItYupKk9l+ojM5+AFC+3LFpseYMpEHe7DUNi7UfnCxVamTM10vJ+VhPzvrF/My
	 Js5MKHsgIGxQ64U5LTiAI9oUyArd+gTZEZj4KjhsmTczJpDQ9LX4ZztQawdhVzefNGhW8
	 tEZ99P1LREExvRa5NS7LJsYCZeLbRPQtls+e5Y7CGuCsyOrKci8EHfidfX9U9S8N2Ty7e
	 gq23JM4YLRbAKFxLqBuCuoJQ+/e3TXLdqGQsEW24xZILBC1B0zYABJAzCSzhPENg/6OKG
	 phs6MqJ+J2k6PAmL4+v4YuQi7HF2LX+OXGpQ847uzoHj9IMVCopmvnF8232mBZk8rJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnR+cG1zrK99ABssRDEAQLG69JFukBqigLZq1PXp1Q0=;
	b=2yB3a7e6fRDnnWc0kVPnamppckZo5QhQVTsF1sUjp+tPtrkIuW1ONsdysE3IXjmfVcca
	 x+edPHWFtT+MoBiC5V9E4jgwggSAjZk97Ubci0qVqYtNJtGWJE5Nyl9QtwwK3Q5v+itsv
	 MbrPcC2Ncg+fa90qtXWrWw37ktDLA/7nKenrDtahguJ7aBal5Zchsr2QBJo0QbsyUSA+g
	 U3nvrFImrVnLz8XcOnJaCuC/ExbGB2TBKJS2S3aETnHZWbPGz+dnWWUBeFnAh3gbeNO29
	 NBkbUfGZFYt+8tes1L7s919s970afSGRkxcWljeW3oxdZvO+cUZAR8mByBW2S4Bb//w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shopee.com;
	spf=pass smtp.mailfrom=shopee.com;
	dkim=pass header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=CTcpkO4P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AEE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76AEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=shopee.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shopee.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shopee.com header.i=@shopee.com header.a=rsa-sha256 header.s=shopee.com header.b=CTcpkO4P
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-37071c0f42aso6404484eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 23:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794899377; cv=none;
        d=google.com; s=arc-20260327;
        b=B75RPBoO9gMAZ3fJ/uJooE+88DLaslVD/qMSCOSm+JY3P7FdlJoQYZ3bULipS28l0C
         MNa08U5pQGEFZinOgLnzEPsGqhvizJy1f+1R/6h82PabZu6I+QdkDUFLDaOhNPx4NoMJ
         UnzLP7GdQyHfRDPXaQ6GZg4JYrjlI8XWxY630+x36SPOpDdWc36JTVbHbSADgjWq5fWv
         bT8ALPahji+KRy9n30cgH5E6SNRbHIM5zSbMI/0XhFGy6Yn3jOIKK7eHPe8v2ct3GCPA
         w4Rd0rL5b74ZCDypq4QwTFO+5CiHOHANDR2ptcJVumT4kIMwAbjRsiqEsWh5wUuOBffx
         RnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnR+cG1zrK99ABssRDEAQLG69JFukBqigLZq1PXp1Q0=;
        fh=jAW3srTNV67rxzq+k0a5ZzoxF6ZYsXk4ohqSC1CTuHw=;
        b=rAhyDA4rhxhr5xxNacNfyR2oEuA3WPuzgDSwn9KjffF++47BKv7UkicSxlUcgildxE
         EqvIP2jqVxhZcuowXJbSwe+b8NwNtv6zskpEuPx9CwSyeGjpgrRnJWKvC516y3DtElw4
         4MQLEpKSrMJJBOFJJqi5uvT5Ou45zracC29M8nflSOR1oK467ravH1pU9BsOIOsgNows
         Gn0UDVsO+zRTOcdKKW1wH4ojkfQc+3SGztUwznnpQ1U1IhPs3D5LF9VjpQKy7O0Hd0py
         l0or4vxlCuvEEleKMqU/ckYEM/hJRbvWfqrauJsRAm8DTtegDx2DSaKEdGwP9N6qkZzN
         Hzxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com; t=1794899377; x=1795504177; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnR+cG1zrK99ABssRDEAQLG69JFukBqigLZq1PXp1Q0=;
        b=CTcpkO4PLCpBqPK8o80jLKsvFQ7xoxL6FJfwDu1B++lsZ2e8LKBao0dTLIBjOVXc5G
         1MtSy3XS+Q78u6mk9/LeVoJR3RgH1uihf0LZg7ooTscb6j/7W7kCVNveoWF9URiYpaRu
         O7cWDNVZMt44ArumJKf5LKdGeY+ZmL6hhEy49tNx1R7FAiQ3efC7KJSy32cmAt8pKU/O
         HYo6/8b1DnQorFswbjMHlgrn6+wPAA5bNcg5IzLIPtB3+ykbWdjS7jlPPsnl69B3X3YE
         zihJh9dSKzipTtcb5nYz9bI/WTJXzaIdJrGXlPC9Ki98kDRbccd5lKeedywjQHyof27W
         42cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794899377; x=1795504177;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnR+cG1zrK99ABssRDEAQLG69JFukBqigLZq1PXp1Q0=;
        b=WxZuD/GyGMUvLVFMiPtIuF3rQqs0/sVPg+Tzm0pzR6ZeCFEZWGL0iNx+zJ+wUtoQzR
         M/I2YGHsyRTHr1JubGxGidc+4yFWsb34pukMQbvyLiS7ihJ5mtxuDvUZGZ6OTgVaqdvd
         kjeXm3iVTY7Ck/wKepDUBLi9mcrcxYigFeBFtlN/Yp4U4ncVUJaK81Va9CEs6dCr3Ldu
         XExns5qjw+c/W7cagJ0DxdXa3IAZWJIeU8j4mmgVymI/Wt+q96L3/MQkzjxbcitrMopB
         QBlNgw4zB0mL0RaTfvLqjhtkbPsSCGOC4uFmAUQr69uKUppgwKfBFGkZ/+/kBuDzpDRL
         +CHg==
X-Forwarded-Encrypted: i=1; AL+hErE6gHGkudlJdvLe3mGp852nByeef9B3Q3ZOeO/4lnFhJ7JYXPpxdkyHAQlJYV9w5LC/Sy+vlRRE/pdQ1+0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DiIV2Dca2mI3uQEhvo+CDF9FEGkMroJiRklCgM8XS0z/gTeMt
	BFAtIRZzJUPj21R4g74mh+X9W8eyeP3HwbP+Xi0KD5tHuFB+2l3TRA5xtoGkPZnJ5H0LnzJur+v
	pEEpSHDiaBKwAKLURzbdQBhTc8LMxVGZKT2v0Bk8CZA==
X-Gm-Gg: AZFdTZdUHq+shagBltqhjfVTjX018TuPerIjAQgpQinO7z7isU+ZRQFCOG97ZnqHAju
	SDXazPFYjHHXDU5GT0LM0rbxwC7hPRx7849VEgrJVmawLcpaMNEu1HKtmGnNPpcd8DZ1BHJedPt
	9OQxogJQABl68z56AYe+UudUoXjLNXIAY5fYANBDqUFloh2h2yYBYX7So1RiFdskzKje1VdQjgI
	T9yGGLDUuElhw64HHDJsVqAP2r1N2roBtRMrD+2/E9Gdh/mARekMWOilxaWzEBPI3h9s9KEB2yu
	Pbp/G6diiEW67LDNeHmmRZwypFD+kAjue0aVEAHhan7tpFaliIZXF2tU38rlKWsYKIStFKLd0DJ
	kYNYxNCSg2WBvwnkvvvOnDgzCeejv7S8MaFDH
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id
 5a478bee46e88-379682c2053mr10636754eec.30.1794899376652; Mon, 16 Nov 2026
 23:09:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112041348.66915-1-mingyu.he@shopee.com>
In-Reply-To: <20261112041348.66915-1-mingyu.he@shopee.com>
From: Mingyu He <mingyu.he@shopee.com>
Date: Tue, 17 Nov 2026 15:09:23 +0800
X-Gm-Features: AclHuK_OdWVIh2slf7tcPI8uUm8C9Xejgxejc9Hqh6QFSCrmh8eY8O7vcMROZXY
Message-ID: <CAAoBcuTiyvYHPpKNzYsHdLTGmkQmrKUZPkJAkm1qEdOeu18hRw@mail.gmail.com>
Subject: Re: [PATCH v3] mm/bpf: Always flush memcg stats when explicitly requested
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org
Cc: Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Yosry Ahmed <yosry@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	littleswimmingwhale@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi, I wanna gently pin this email, thanks.

Runli
