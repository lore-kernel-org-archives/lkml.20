Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901393;
	b=lbKDGnXQzAzOEb7Dzakdqd9YKS16L6+NbWgYvdzMIwAJBtZFkLNTj/5xSD8oCaabLJSr
	 XVbXBnMsJfSWLJ2ptAMTYg3VmlgTpzQxiO9aztRVrk0fDn5LQCKuoAi2M6HULzncr9ItU
	 SjoQjQdp1WMW5a0kjnd/e4wNSc3h0eRBeirNx2VQddIVemgg2SGL5zjtcAJMpbIkBz1lW
	 3dtkEMJZYAkH6G1fSXD0D5mWVmiqMYZIzdbwC+Okj5ho4ruzu6d9QLoQaubQ9QdQZ/JYh
	 N4Ukk3KHw83+JidNWod8vvgUEeGY7oG1Kr431su/AcDrmR0e7Pc93iW0rFbjBYjxS0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
	b=B/x+Y+dzJelIEl1WmEzu5wM1dAr4mHk+88Zo7+1ilcwGpHnijwfK9x9IHGRtSGxGTvzs
	 Ndv5XOwQSpZYVxIq4scLsJhND6swzaYo5ghXv2sEQi+1FmLeECnmmB8ALYwkQWEwH2crN
	 VOe4iKNFMISqHKjsUWv0SL2ELYTbYNieINL6LF4vomq4PpLUpS/0M6N7g11qxW8RYwMlF
	 +STed+0UO/XhDrbhmffH5OawdiAkFqlERukBRa8yHHHu4VxI60xW7AN1ONAYvkbhj+GLT
	 k2O8BkZYwvta3mLgXyL5yIN05KdIERD8CO8vXS5jbLcV6DsDnwQunNyFSmf/bQdwWDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJmY0Cwu;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425F606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 17:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C425F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJmY0Cwu
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-49d05d51553so14439855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793901386; x=1794506186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=cJmY0Cwu6TtDV5WiAgmzfVBCQQqvnYouHSNh33AexNqrfhXucHbCLb2aHz0C2naaKk
         LbEQYg5ofq5mnI0ljzuQdwNpRV+N4pzjJZJCAJGJ2fm091j/m0HFPhMOnnGowywWBVqD
         3TJNNjZGtudxjg6KP3q0qXNlbrJbiu3dN6QV1bwAnWNhoPYOrkqky8xQgCFPaW8Jl/51
         v9Q26N6upYf1KVIAi/2sNeNDQQA37q51GaHUWwfa8qpddNDzvosiKZZYtRKvFTQiYLeV
         hKXG2cWxXy7eNwIssKCuojY6ezcgcbqe5GKzn2Nnh7vJE5PHduxqZny0AjsJfRmpuWPS
         SYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901386; x=1794506186;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcH6tkHTL24evFghlRPkmxW8tDFnCzFpfv744zRs954=;
        b=NzxP1f/mgf/8qU3Fdaao6wx5JTxjR5t3faGwDp7c3H7ek96rGJT4BTixcB7/Hfc/8m
         pGjP0Ih1JGIlYw7WjZCoTWOgaMwjx2tpWnyfHcLV1qLtkaL5THQcjDk+isZnZEBebo9n
         fW3MMpExS51r1xwSAp3oa8iptuUkaGpuRh0M1Q1CgSwRK0ul2XIwOjXhhsYlKw8a5kJr
         RYT/N48kH6YEgt9ikWTjaYAtRKyqB7h25Y7fwuq0VhWuMfvtEu+Wv078qN+sstpC0Sq2
         QgIUVc1OeRObIOlrNb9jm8VAnkIHKNuacpWG7xSapw1GzjJhgq6PqQLb8B7gpO9l0z3U
         P6lA==
X-Forwarded-Encrypted: i=1; AKwUvBzISwI6C3er3d4gpX/2/9Eu6IjLwFPq5aGFXPMOQepRSri/qBwULQZpziab2sEHAsxQSmYBwuK0T0D3oZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z91W3o6Zcrowa4KqMRH6WQSZbtvkc7UvbNxuA2L57blWfdfT9ks
	ixcDquLTsnJ5745nOoSmWpyVmYb6q88lNcJzYps/GfqlHS/7NHjHmiJq
X-Gm-Gg: AYBFou1mJMOWdYnyIqE2U2uYN9Il9TALUjrDvibsw1AsHyu+yiiHq3y3GrUnd861c8c
	uQ+miW5EMV8nAwrfNhRlAtVhd5Sg5Pz4xorFCVURpttzcugzq8qVxJ6Ax93ocdxMs5f60kYHWnt
	Z0Uz8WS/6QCSTSrOUg1Bg3Az8ocJ2WcpO+bkdZIH7ttoanxx8qWyScP46eQm5IsIQxDvGWdjGJp
	o+1fxOcGUBVcuvnT4iHStRlJDVAsRBwZ0dfnUqLk/3r4mtSXkda/bBbIz/Vtsq6bEXYZYrpxLgr
	bZlr9CwjUPGfY60wtJmgV5l2s6abQ6iP+y+uU15XF/99nKfapgAqnQVgPILQRD2zLB1r0tW2VBe
	4PdKzSpOk/4HKDCNvIw8ZNxKo7HZh81x061NT/0HuSptQfPOzNOMGnXrSCJvG5EuiAJUdXTuWf3
	/L1hLQh9XhwoC4yQXSskZZech6DNe0vgEGFWz0o2Ze45owKV8wtw/nWaJYw6TLoEPN2mYp9QA/3
	QA9Mp2MyeIq45y3j3UidsQc3IKRtSz7DVsmeVI5Y/bpbjaokcan+JGsBqjiuYqN+z2poapzBWPB
	hrai3WaUSoflscRfZFaDhE5PPqAlV7EB2ubUOCV73D2fWKnWJ2YBuUxY+oxXzmynKjRyVAe21Kh
	N3gpJjY0rczGjLE/Th44TYz/8MLEmmO0sMF7om2SoF0/S/3pBAe3db+I9L+BZaxt4IZjgy3XhL1
	gBsIg6
X-Received: by 2002:a05:600c:540f:b0:4a3:18ca:806 with SMTP id 5b1f17b1804b1-4ac17d1a1f1mr456154495e9.20.1793901386029;
        Thu, 05 Nov 2026 09:56:26 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56e58fcb8sm77678635e9.1.2026.11.05.09.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:56:25 -0800 (PST)
Date: Thu, 5 Nov 2026 18:56:23 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Nate.D@variscite.com, Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v1 1/1] arm64: dts: freescale: Move Variscite Ethernet
 LEDs to carrier boards
Message-ID: <auzDR5B5k5GR9SRc@Lord-Beerus.station>
References: <20261105101739.10614-1-stefano.r@variscite.com>
 <auy-OW_td7N8oHK_@SMW015318>
 <auzAh7404GAsY-U0@Lord-Beerus.station>
 <auzCs1MXC8gWXtu8@SMW015318>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auzCs1MXC8gWXtu8@SMW015318>

On Thu, Nov 05, 2026 at 11:53:55AM -0600, Frank Li wrote:
> 
> If not impact for current user, needn't fix tags to back port it.
> 
> Frank
> 

Understood. Would you prefer a v2 without the Fixes tags, or can you drop
them when applying the patch?

Best Regards,
Stefano
