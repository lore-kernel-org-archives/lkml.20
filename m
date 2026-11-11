Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794410153;
	b=4v2ePbilyR4HiVzN2n6Ql8wI7nCNFWgcznhTdEzzS0afh8a4Xmt2v+BScnXLLACoUVIV
	 cQelVSHqn1DBFFV0k2ZdR82ZL/4Pi/gWcCHjXv8kpXpT0EvmzkPQBX+apRBpCVA8lb5sM
	 2gV7GWvXQ9Y//OpsrSjCFdpV436vHkf3Ab0I7558YKup8S5M/ps4lnjivkfiYBYwJ39HR
	 56Bi3bnk9SKmjvFDomOqHA803fUJVlOVvvY/oWw1eqOKNma1nbUxMzFfWTSC2FyrCvbUs
	 2tbz39GdSvrQ4T8BHmBgYZLATzUV6PWxyQbVhcGu5mEhVc70Kxm7L8nOKvV69oCLNUQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794410153;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=12qva3kO9NMXV3ZjsX8ymdd40I9ua49Cy0e6eRmwhRg=;
	b=JvwZSArFtsAleRtZyf/TyOUKqxzfHIBgiQ1OB+MfLVz4cj7OFro0Lne3Hh5+AejVFx9V
	 wLC3pvM/mT1E4ZIUaObdJpYLREFVTq9atxfHaO/smUxwPr/sWjR84AK5gQvl61N1csYIQ
	 lPtYmk4QTIuE+T27vKnBxAnaquZCXcgVu7pp2nfMBjclz/3LLHMFCaF8BItGtib9tNwqT
	 Y5pgApd2kljZw1SF/kedoJuprKSg0a9qQm88YniPBRT4r4jBfvpe4Ki4ojYHYRM85XSsT
	 MIE441ySskltOTW05uGQf1gQXskmGjY1rQbjBvau3QBO1ty4p1YFrFgAPy3EupouSCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MqTZa1Co;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.43
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F8606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F0F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MqTZa1Co
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6de2f213b7aso1206787eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:15:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794410152; cv=none;
        d=google.com; s=arc-20260327;
        b=qht7HuD0Hir7zbSPuxIBHy1IkRMfZ1nbEy2p3BzGhsJ+lsIG9lQXY/Z4IOKAWuD6FM
         5aJFHj33damsd0ApJGUkeHODtkYrSML1w7h038BwfgVqfcXbrKjVFQCpqSJAXDoUYmHR
         gEPEWi7Xkc+wRoOgJ8L9sMq2hirvRasNmgNLBdQBfDv8kt++4We/aTGy2oo9mR4NVOnJ
         BvoeHa327grsXS7Mnvxda1jJQ8xwWk0KXXA4496TwiYqyRc00LjXcZz7XPv8j2L/zj76
         tKOJEeTkISOlle3mVTybHL4550L9/xUOHKcWEmymVQnRAqs7eOrikXm8S6/Y/BAaS/s5
         yRsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=12qva3kO9NMXV3ZjsX8ymdd40I9ua49Cy0e6eRmwhRg=;
        fh=PiZv4RfNQfrgiVr8QIxPschBG2WHj0k/FFsNrmgwEFQ=;
        b=OzY51EAhR4RR20+wXGe0uQNbQjhfdPOU+LMjaXgz3KkPXLFz87PsMeFLkZb4o8urPP
         YHq6q/Q6/vOIvLAnZmjp0pIi8UBrK5Kfb+39f9rSvlU4n8j21nAy1Eu8YKOQKlqvPAK9
         g8OzgYLYnjV9j2KOWIC6e+AYoGB6raoah7ui51aKpqkRxYMF5lRztXlOtQctmLF5x+Pi
         PzaxsvWy57LcSA0rLTsqrTI5Tz9n8EUyDhKbZLCLGpYYSUIfGpR+abxz0IU/Aal4p4Up
         jlK4/QAWfyqffVGVpshure+7bDDxLAq7w9B+J/eWmDqMfPrrXkS3mPzuz7stG8qfPlEt
         LvTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794410152; x=1795014952; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12qva3kO9NMXV3ZjsX8ymdd40I9ua49Cy0e6eRmwhRg=;
        b=MqTZa1CoC8/Oi9lstEeTqcF692a0bT+fIapN4rv19/TQHhwrz1q0ulMKA2wMWg1mXI
         jm1bE17u6V/U05pmSrgpCLVMzWh1S8l/fk1Lmy0znbgHyB3Wq7Ya4GFh6F1uN1JlYp2U
         aFzFej0+eeLFPwQBJjbJITFPErKDXki5IkFPhMyRvEengDJJwyPy2WvhB72tqnL9Gn5w
         1XTOaHkElyQKa20nHI7EoxL+BApLl8G+POluGQBHx53OLEzZjGpcDT2UBko4iIUaiFSs
         nsoNjOMiRC5y+tmBHF4KmEc47foCT8XCWHJ6+U4peSj5GKGk8iNub6GtTUNX3F/Cydq+
         jHJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794410152; x=1795014952;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=12qva3kO9NMXV3ZjsX8ymdd40I9ua49Cy0e6eRmwhRg=;
        b=gKDlCV2WraGSwvgobY0ub0uTI3T6rPOyB1n5nY7jRsI8hNSbDe2Xf0YlRvZ2IfPRTA
         8fqZsmVoQe7bR5MprB52etVgbBO+pV8EfeYj7uV/C5262B5rHe7mxiK106JZ8nVtYDtF
         CrQ+jMeyoTSiQXOo771eqpvSjU5eQgJ+diGD/oSTguRha+B4aolAVnKsATNn7ZIappaT
         xaKdb/B4CVlD63tFOwaF9ITrpEsmaiym2v20RUsNlslJs6NFRESWuWzRWR9p3ZVtR01q
         Z5vp+msS8TqldIQ6GpDw+lKO1Qycjammbj7FWMKzAeAvfmMoYrXVI0jzc/BkzSalErl6
         l4LQ==
X-Forwarded-Encrypted: i=1; AL+hErHOhgCvrW0J8FHirK505sT97xNtjiEZhkqqLSIFtIOBwH4QChN/GTZRS4d9xtwrZQ/jFpwJEZ9k5dzEfdk=@vger.kernel.org
X-Gm-Message-State: APuU4Z96y3uLcf+i/SH/Rz+22+ZYV5Fzbzgq1MgvlNnAE/8eXij2aBUQ
	TMhOFzebptTXHXlP+NVGpAIOEYkd7RhLPUp5ULWoEqka7ggdn8SPW250He8FttbYJPPYP/xU/N9
	02KFMmzYLOoXuVPsbdm7szhYaQR8U+k8Pxv7LH8YD
X-Gm-Gg: AYBFou2sbj2LTQCJzkzvt7h14zjGT/5FMjHYNXL6nA9VmtBi3QSjBdGYfzi6HqbBVYW
	z3wL01G43Qdc3vMj+nVgL5jEEXLswPECzpv1ZeBsGSoX6luu5t17cO4scB8+h/4U0O6dlkRTFw+
	QAo5/A/ENud4bQ4FBVm4YB4r7JRyNT+mihDIABeu8Ei64KvB77XOAAwsDLQFTWNR1LXTUs3sc5l
	rdr9XT+ElbMYAMcCrM18prK0JNkKitMdkF0XW/HVfW/t6E84oMKflEOlECpVSWsGgSf6JQafkdZ
	SgDQnQbis+5vRH7qbyGlB3ccyRKLux1BDqMJqxMC4IyqYXaBuy6qyF5lld31g5ItxZPcLd4B/m8
	ypEsklpAmjGq+ChxorPkJUO2LvhR1+uKIipe88FosuikeXT8kIRf+ICI2aKrZX20twVqtw2aGsu
	torBTOaA==
X-Received: by 2002:a05:6820:1341:b0:6dd:1d43:8cd0 with SMTP id
 006d021491bc7-719179ad6dfmr1495859eaf.80.1794410151612; Wed, 11 Nov 2026
 07:15:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111092505.3121847-1-lee@jaeyeong.cc>
In-Reply-To: <20261111092505.3121847-1-lee@jaeyeong.cc>
From: Jacob Moroni <jmoroni@google.com>
Date: Wed, 11 Nov 2026 10:15:40 -0500
X-Gm-Features: AclHuK98LgEQHpnp7gUNAvVHjaxsZ5PsQKymcaEXqojXPpEtvDXgfkwqN8-1VGc
Message-ID: <CAHYDg1SDOd_0ukm=7AX029Cr7Oc1UKoSpmd=iBz55C3DFzv_hA@mail.gmail.com>
Subject: Re: [PATCH] RDMA/irdma: publish APBVT entries after hardware setup
To: Jaeyeong Lee <lee@jaeyeong.cc>
Cc: Tatyana Nikolova <tatyana.e.nikolova@intel.com>, linux-rdma@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Shiraz Saleem <shiraz.saleem@intel.com>, 
	Mustafa Ismail <mustafa.ismail@intel.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks. Looks good.

> +       entry = kzalloc_obj(*entry, GFP_KERNEL);
> +       if (!entry)
> +               goto out;

I think the GFP_KERNEL argument can be omitted here.

Reviewed-by: Jacob Moroni <jmoroni@google.com>
