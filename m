Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433936;
	b=FFrMggC7MyLBZGSYzfxo5V225EqQyFCIccneB2sPdPyMLnDLCJc4yOHyiU8Np4WcaoUe
	 bk9Elc3GcRLshhqTF0KojmHKY/sgtKI1zusWM1flxspGyFzhRjA8L6EmYk6nXHL7pd0LE
	 nOhP4ZnDUZV1i37wmKzCc6I0GhpDEn7EqwznmN7+MQJMs5DaQe9wnQRAej/TW6NxO+1da
	 Ed3E6g/WS8PqD76uxtxN/Oh2ngCthhl1LujDNYkpOV8Z0j0l+sWtm7jrtw/kSQja/Ynci
	 KqSXCW4pDTaOHz1VXNp6pEv7WPaNbBN0fkP16715vVKojSwG8a6j5cWPwn9WoIK/OPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433936;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
	b=gxfy2/SlanJjEgdedyWeDRj3dTkP4AP0lSISXAvZDyg6hh3pzbfLgFFeiSLfA+uhX0al
	 y7c/8ZrkuSq+9lwJNH5Pcuup25MGgAtj2TC5jOADjHQUOfFd8alPzKeGi14fw7sZCuywf
	 ewRW3Oxk2VJfnf4hrc9DJ6AKmxttEY6IVOlfJqJbTrgF4kW9Tdww+vU5fkVazKYye5WMd
	 YeausCTvqb+BHbmbbrePXKbJzQbPHZTNhaK5O+BLVUTfMeRQeMZJVA3Ar48Io33UiC2ZH
	 fZKM7scKd5vOQZQiSJtVQ2tJzIF4XeqA0Ale+ORXrJGqm9wOfDAujNAf++ITY4lLYgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVadYj45;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10149606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10149606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LVadYj45
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so1801809eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433935; x=1795038735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
        b=LVadYj452qYWKXqudUfJYP4vTIXJJ1dd3U7RzKuzs6NI9h1XPCVOlLH2NMyOw/fSpE
         a88EhfciP9x3tgYLLbGHfZo127HjqFmkiin6KdIsTfgtrTwkMzRTwMGranMmPEkRP4af
         1fgYgf7SIEfRGRKqH/+rnq1nmaqMdDGChDU/8bSAhmdWZvQmWYxe9hk/nKnyh+hUXQpS
         RuZz/rfJupbQipvOUhYUOt4z/uqT3MMyj4Fxlml3BRqUtntjB8kfTsiEqHI2gsRKou6J
         mzatv8neNrpup03S/lOw+mLiQnIi5+xiU0V2Sh/BMvr0RUOSPeWmUcV0x7Pv860pKpje
         f9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433935; x=1795038735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gi11Qvl77A7lJFoMQdONv82mizaQFstGPpmtJnQoYZ4=;
        b=od6ISOmwFHyyBT1FApCD12Frx6Hbc99a7xHGP36/taFcGLsh3/JXHAL9SUPXtnQs4R
         5jJjZQ86cit3mCDxdMhpLFhJY2Kg87WLqd7y0Sycw4iPouGr/qE9MXkC6a7nQrlAIR7y
         sZZn9AyrOyroOmEuSN0qMnvrIcv8yqxB9+Gr0XVCJ3WWkhedSQLwu1mguAEmgpC+bNNi
         YAUcZdHNW2EvmowLW3LGsbR4evgptcL+j5Y/RsO+XY4wf6GrK3I5aFQ93BkyZcEmJtGX
         5Vsu8BZKLEIhrJApuPUlu3tlJcv+NYfkRlEWEzTjwT3YI/T5ECLYy6sKZ3/dxUF9kAdi
         lghA==
X-Forwarded-Encrypted: i=1; AL+hErHyXNP9Jpo2USa2WXAcvofX0m60P1t12JUn8/M9LCiAXD3Fbrltz93pLXvuzgqsDIohB7s4GOvSCXlullg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6Uomp6tgzn0zgHsbqn6jldhY62PuMGBq0PGeZs4+a6vL8CaeE
	Oh+BV5jv+KcgzRX3eeEEWVC9pxCEZKNcWmiU5svgH5ovhLKTLYQlLpVs
X-Gm-Gg: AYBFou3WUc//rQSnx2Qs3iBEgtTAwN2x3uyh+VpiNXSqhS0YwaCNrCLKo5l/qa99a5t
	Q+sz/h53bfFHcE6vFo8kbxEGtGDG5iTkKez5OManHKz0qXw/q6ScBIzFjcQ/j+ggP3ccnm5BaHC
	r/LdAaQx+b44E+hOZv2EJfI4R8rbVQYnss3ZGlF0qpmyHOgmCFEDAxeQJw3cg6g4YLOcUSIfaXz
	xMWqnREi5B+PHa/ejArOtxPcaC2dKi3qFHyojZKAQaI+Qpix/KctH/nJypXZmCDOwe6cs07knGI
	jqMJXJreUHygZlvHH8Zy6RGXdpB/t3lW1CUBNGVEpx7OcKkVrEkCtF1b4OwgEaVsI257yidEguo
	jVHY3jhzCUBXPYtOlFbErcgBdyrCoFERNv8jIsukb7CbI5Scp/vyDPtg05gJBilPswPtyqEqgkI
	zzKfZs3YMjL0678Q43WUff1DuHABbj1j1n4VJZpXtT/1+apuQZ2sLFbjFj0U2ziDfDi5qc3abRT
	leOFRWfpJFfMEFpj74iHizzDi4RA3zqFGmcpMk4kQx101GUWyjXvKStGiCdYsolzX9+CmPseH2j
	xGJ4MBus4TvhxNW/I8qUobM=
X-Received: by 2002:a05:693c:894c:20b0:36d:5102:9974 with SMTP id 5a478bee46e88-3768327e7ccmr4031936eec.2.1794433934007;
        Wed, 11 Nov 2026 13:52:14 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:44::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm38761082eec.16.2026.11.11.13.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:52:13 -0800 (PST)
Date: Wed, 11 Nov 2026 13:50:20 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	michael.chan@broadcom.com, pavan.chebbi@broadcom.com, saeedm@nvidia.com, tariqt@nvidia.com, 
	mbloch@nvidia.com, alexanderduyck@fb.com, kernel-team@meta.com, sdf@fomichev.me, 
	dimitri.daskalakis1@gmail.com, almasrymina@google.com, dtatulea@nvidia.com, 
	bobbyeshleman@meta.com, asml.silence@gmail.com, daniel@iogearbox.net, 
	razor@blackwall.org, leitao@debian.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	leon@kernel.org, narcisav.kernel@gmail.com
Subject: Re: [PATCH net-next v3 4/9] net: devmem: add a per-device netmem TX
 frag size limit
Message-ID: <avTiZVzjvMLQjnJ1@devvm16445.scu0.facebook.com>
References: <20261105222058.944293-1-sdf@fomichev.me>
 <20261105222058.944293-5-sdf@fomichev.me>
 <20261110143615.05f9adbd@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110143615.05f9adbd@kernel.org>

On 11/10, Jakub Kicinski wrote:
> On Thu,  5 Nov 2026 14:20:53 -0800 Stanislav Fomichev wrote:
> > Devmem TX frags are bounded only by the net_iov size, which is about
> > to grow up to 2MB, more than some devices can describe in a single TX
> > descriptor.
> 
> How is this different than normal zerocopy Tx?
> Drivers already have to deal with long frags.
> Having partially applicable limit seems like a bad idea.

Thanks for the pointers. Yes, looks like I can drop all this per-frag
enforcement. But bnxt is still broken with bigtcp, will try to hack
on something separately (queue stats/etc to make it actually run tso.py)..

CC'd Narcisa (synced offline), unless your priorities change and you get
there first (or I get carried away by something else)..
