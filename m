Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728457;
	b=eVpvc4Ci8fmnYXMMr3v3fuZ7Xdlkg9d1LQRX5UVzCyl8+FhwJaMIISaTP+FXhwRLsiVj
	 Hxnkg1baVwsQj5mX3T7j4nlKZ4lCzb671S/aadbOfMnhA2m6ESxOCyJBdfgAgeu94FNJh
	 PRL7g5Ad8rKlySnIglLLk/mzkbZ+WicGNbzeG4JboYyNUHI4MWjwu6lKGBVnKarWmnBz3
	 XhsXyLDLa9ksQAwWnJ7sOAssgLPAHIdUiweKGlbEYN+X1Hy0Mv1DW4+eCyHbP8xzz3pNc
	 cIOmlxmL1eyR4/YuIOaSdWPh/zSM0AsvXdteiaB9Ce6xnite+hyj+sb8cT53DjOe/4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:To:Cc:
	 References:From:Content-Language:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=85wjufSf+6sVt0aWaqOMowwqAb9EC24ZQGUWyBhLDRM=;
	b=q3UQRYsE+1XS6uhv5cXQW1DjhuQ9kr+PyVDv9T7lq3tlzMvHQoP2s6B6Qwx0ljaGVfUJ
	 cchzitADqn7vSBh8LglYNtPnG3AzM62AdlU6YSouif32Y1P4ZWlCJ0Stfc6Y/PHrEDn/O
	 A89OR5NM4zbksLddHf53eRl9qjtM0Ska/TYhoG9S8TFIdBeBP9306Arkso3Pwi9hM9dWg
	 evexZhnXss3IcI4MiAXcEHfaIBkXN5OqrD3CkFLQknyId/3TFqgqaCuCAhBgIwwWJAs18
	 2K8BJtRIcF+QRD3UIj+5QlSxmu/07BajqHKYuDWRadm34X5GkXwMO2H3IAB4YOyF6Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=EqvEIbDt;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0207606A33C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:54:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0207606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=EqvEIbDt
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ae34ad9bb6so5748855e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1793728455; x=1794333255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=85wjufSf+6sVt0aWaqOMowwqAb9EC24ZQGUWyBhLDRM=;
        b=EqvEIbDtoaLkmh0g0ZZRkF68+My/5IiSsJOZRHN58fGqhvIEXf3L0HfCEWkFhhvCY4
         mHNp9oZekCSqzVzUXrsMEh3mGAGMbKf63lESjAXLnI2PXZq2nSNqrc36Hohy1MQoUYI5
         R7c+3JHFf0iwwKu5Cv7DsonVoY21BJtXQlCBGIv0MOi+H6XFJlIPLvL00NgbkpmB1CS2
         LVeek2Rxu2rb832KPwICZS1nLParVhhUrTLeX7q+bOroHDJeUU8+7YBn7QzjV6soJbSK
         9bkddTzwd6yuenriuKsLkrZuEqd05giHXja8KKHZCUb7FPq/5CAUBKXHOpzVHPPDD+V7
         VQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728455; x=1794333255;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=85wjufSf+6sVt0aWaqOMowwqAb9EC24ZQGUWyBhLDRM=;
        b=PgnnhUuiQ32aKE68iDZFGoDhk6nBsjcSZbHm8d14fQpZhnH5GiNoSKaqIf1Isk2qzx
         wfAWpPEesBiI/BpSTmWMBkALqt3FXYDoC8OcoQKFRxhCRYS2Fwuxlv0EqJ7O27qrAFmo
         W8eKoZNRYeHGpSaLjALmjgaYF5l6/moUjU7WQ/5iLrVFqqpWXvU3d/xYLgxtsw7vRd6f
         u3N9e23bpeKoSUpdhjQEr5zBEqLvX0yCN4RhP8NqEYprjkaDw3CDIuVl54jfduBlLtVt
         g5Gb3bmLXxAdPIDh/oD628xpyRkQwSy+63CZDQ/hSstVwpfA2Wu9eYKu3oOZt4O/qDLA
         xGlg==
X-Forwarded-Encrypted: i=1; AKwUvBwRZBXgEWp76ZQ2QpecU0aJLv74bJmgE/fYfJLyhRTYc/QNonLB/XieOo9ENWyMQAEOrPO3nEsg744pj1w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aPmzwNjV12dWEjlS49nOvAioT0mcUgUBQ0Ncw4lR00omWcbYD
	iMRmwEh64cn5/Gtq1/WPOjdqqMFOaBDNhKvQv/ZimpDJGZkvS8Ch7t72Ru5N+egiAoI=
X-Gm-Gg: AYBFou2GpWXaNBlcr5BxFkBgctwWJ9+1HpFLmjJN2CY7ELAr+EJagvFqGVIGXivno3y
	o7+7TN5ynBDJBUQchyXdMwSa7Hv1QPsTQpAp0DV414lXGh6cTsivVd2bLDRAwUM7mQXoCnpeKpf
	VrHeSRv1uFZaX8BHtnKkA6IwnQYmrFvBow925FjEOJiqNuKqpVrAQUYoWs706c3rJJCABYdQ2Lh
	jY+6H930hhWKKsXfXcYz/DmkZodDxADlguItgI5ietLgKKAgBga+A+lN8iaemz2uryvIphUV/YD
	lzrIhuIlrGFTs/ilUO5nIse2pLzFXi/gSz9zCEF4A1pkJjMpXFYISsHq0CgEzvi33pNDqByOAIf
	XtqY7RwAwnYAbLSj1/2JXRUUvDR7riLAqjXwWydLLD5MYVpsWgOh7z+9avr2abicz4JjqoVYseI
	k44iH0nq7uEo/cg+lQH2P/mYJSe3JLrW5K8wQ+iBeBUEeuPvAMCHQZosCbRcJsVopK+BEbJdrBt
	2UDx7Np8HukSNlApVRd3ghmookTu9kbfnvS/0WITK2qgOuGfUb1B7ZT5VY0MESCPxzSDqEUTADN
	f72EjG4l+o4wZm1priZlnDlQZWJLDueZmOnfGtvJpwOPKg==
X-Received: by 2002:a05:600c:2604:b0:4a1:b027:99ef with SMTP id 5b1f17b1804b1-4ac16acfa8emr236694595e9.2.1793728455034;
        Tue, 03 Nov 2026 09:54:15 -0800 (PST)
Received: from [172.31.99.185] ([185.13.181.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a9bd5d2fsm67727415e9.14.2026.11.03.09.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 09:54:14 -0800 (PST)
Message-ID: <a62aabdc-aa69-4ee1-bf91-606539c6637e@6wind.com>
Date: Tue, 3 Nov 2026 18:54:14 +0100
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
Subject: Re: [PATCH net v4 1/2] genetlink: Reject joining multicast groups no
 family owns
To: Anil Kaushik <anilkaushikwireless@gmail.com>, netdev@vger.kernel.org
Cc: netdev-bot+sashiko@kernel.org, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Florian Westphal <fw@strlen.de>,
 Mat Martineau <martineau@kernel.org>,
 XingWang Xiang <v3rdant.xiang@gmail.com>, Alice Ryhl <aliceryhl@google.com>,
 linux-kernel@vger.kernel.org
References: <179372164269.488856.17448970060747076034@kernel.org>
 <20261103161254.56922-1-anilkaushikwireless@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261103161254.56922-1-anilkaushikwireless@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/11/2026 à 17:12, Anil Kaushik a écrit :
> Yes, this is a behaviour change, and I missed it in the commit message.
> A bind() mask with an unowned ID now fails with -ENOENT and joins
> nothing. I don't know of a program that does this.
> 
> Ido, Nicolas, is this OK to keep, or should bind() skip unowned IDs?
> I can send a new version if needed.
It's ok for me, but if a regression occurs, a fix will be needed.
I let others speak.

Nicolas
