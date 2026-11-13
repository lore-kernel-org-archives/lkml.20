Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530524;
	b=rRG7+fDdibnllcD5iMLeVQbbTVMOsExgueQNXTfmE37jxRmwLzPmY8iqXx3QMPqJdBMi
	 ckASPirHP2bbBGhPsM0/tVjgmYXCxPP+a8VD4l7E7xKfH/GOFv9Dsf/xPKH/36BpLsCHK
	 wx9tM65Gg52EJO8QSxy+jPT/BEGJ2Kgw/PL9DTX3giUz3G9SDEuUpkBo1xYFRxTrZJL6r
	 YwmvCQXGj2rlHKLpZ+Ln1cXKx8WzC9jNsxGqSeNdtwWlopmhMveLhaPTfrpYnfNZNfysY
	 Khf5GPp9LCne0HAJJ0DJyuVi/k6cjXW2MOGms9rCeDEKU+4PUZphLy2ICrGq6EDUKVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YL7HdvRgoulMVBDaE6Qg6DwUJJA2vnGhioXYaH02k4E=;
	b=Wag9Udxsa4vlJiKq2FSUa1XT5EicH6NDGyVF2JAFsMtzSnGeClpjyigfVO9EyktleQMY
	 LoX0cmegjGhah2jv1VH0Shsii2A4j3/13OQ6gnZgwqwMv97b47tJT/AtpVASk9E3ED1/1
	 /LKKHlGuaW/u4a+EpMyrOSXPzC7oc5OZFbQN+2T8Wp5JLUTEZYyiw3G7fi0gVl17cjGAb
	 vI4pmgc9VKcPp3wfPFqYpv7TPGhNk54ThxN8RAnqDbu29RkYeQyTR+djx0vQ1H4SuMKQ8
	 DIim9OsgDPyB+Gud0Sntq7JO9bjQ+bXbY0jc4PRB8+/iINnipET9FfUfDMviEvw3gQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpPKohat;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDF4606A884
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BDF4606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CpPKohat
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-13985f8229aso348545c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530523; x=1795135323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YL7HdvRgoulMVBDaE6Qg6DwUJJA2vnGhioXYaH02k4E=;
        b=CpPKohatRHUTPl7O81pyX2Luk3+nxdLDH5mJo9iWEa1Bx0FmTZKMPI6bYU8rQZIjfM
         QtNO28jJeIk3YxGGcvQNS/N1b6tpN22FMqkzkvMOq4SqEs/wWa0ILnCdZ/RU7Ffdr9q6
         dW9TJVKj319GiULCAe+jPzAcHOyc18nBMJk4R3aUXjnmKXFaQwznf9D6ZqfLmHfeJugP
         4k5Jha7vcEEyHDb8kMZCbIsYvo8fL2+jLMFb45RLPA+jjKvGQtHQf+cUXWEJo9DxNquX
         INOk2dI0LwnL7/4hno/XcRSIgrqNO4WvDUYmGi0f4m4yKbysema+KXFZPAtMyKBc7uKW
         fGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530523; x=1795135323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YL7HdvRgoulMVBDaE6Qg6DwUJJA2vnGhioXYaH02k4E=;
        b=yR51T6ymyHvicgg2IByi0aHMPfqJ3tFFYQFLQh1ybZYWDNACdHe7DQYjAsCE/+fx1d
         Q3ndGjruX9pg4VPS0+aO2xuV1hk/YpK8Y9g3s/+d9/K5fVt1lnjL/xZ6a2VFi6y0JthQ
         fxuia+t9U5cuMYy78CfpXnW1M/s9mZE9EdupWzNcnFDIWQRVCdr8i+/0vQGrxHhf5KdS
         yKwBsfU+kZpBS9aZDyJY4VdyPtjau/sZ4xmyd3g77VfunueWSrqNDRMLAes43cWr8O5m
         PJRavVDbAMhzDDBSm35PjepN+GBF8xH9el6StLdVjbseyK3zIBvhswGrTNA0RTgIv1tn
         T4Gw==
X-Forwarded-Encrypted: i=1; AL+hErFzi90VVXDX1OqX3VzOeUGQ+jDyDhlwC0jhIKNCh2zcYRnQeZKUDYZGIpF72idYe/kZ7A6WciL/cYb6XLI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Juno6pffeKr7bgJwPPIbDbmcq6BwNqCYRgSfjAAXLIutGkah2
	TzglsE8f4hxkQB8Nk/Zo0XSWzxV7usGlij9JWLprQHOP9aZkmuOSlfFB
X-Gm-Gg: AYBFou12LVKM88HTlrLq0zNgtibr2grsBgDNrSZ+mTN+ipoy9UD+ctX4K+3x7bbCsXl
	BtyTd4AGXCRsAsdsVXmfQKfLMXmi2HJyLhK4DHXUAqO7cM5L7zFVVn4TSHX24W7gwioB5D10ILN
	LxWqG0bwKjMkYSbsVeNmBdlJDK9TQX4PM3DVlXEErYdKbIMvXtULSDghtU7TJq4CW9op7Sg5Fp6
	7L6H2P6wj94/tlHL7sYl0eOcpFqP1jYuUOtjEpoorY4Dy93Oax7o3B6H959iickNYpptpall3hO
	QyHz1srR/fz5bW+IN1z9g910mltRHPkjhy3aI7Q9c2SwAcpHhUjnnJwYKC4f9zjOw7Ma9gyAn0C
	CZ+dIL31+ifC2FRWmaotn8/SyFNIB2mOy17pmgIf4WootKyyddAgtIm6SNf16TggvFWryu3Ftb/
	PF3I0YCpIaJAsMNZddeVkuzy8FDHpub9pCLDWYmp0ZBNzUFv/e7F6uewUbnvuF8dS0uEHPCOCyW
	6roZ8P612uPjGpvw587XoBAkJPTRdR+4RZ7/0ePtgqmGvKpkvRiU8LI5W5p4NK2F+uoQJ+wvVlX
	ThKDUtb4wBv2MJBe4D2a9Nc=
X-Received: by 2002:a05:701b:4213:20b0:1b3:b4cf:8f18 with SMTP id a92af1059eb24-1b5031a46bamr1155706c88.41.1794530523330;
        Thu, 12 Nov 2026 16:42:03 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:62::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50313d990sm2811710c88.4.2026.11.12.16.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:42:02 -0800 (PST)
Date: Thu, 12 Nov 2026 16:41:56 -0800
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, michael.chan@broadcom.com, pavan.chebbi@broadcom.com, 
	andrew+netdev@lunn.ch, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	almasrymina@google.com, sdf@fomichev.me, leitao@debian.org, dtatulea@nvidia.com, 
	asml.silence@gmail.com, bobbyeshleman@meta.com, daniel@iogearbox.net, 
	razor@blackwall.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net-next v4 0/5] net: devmem: size TX net_iovs from the
 dmabuf layout
Message-ID: <avZZ-6GGciPC0Lti@devvm16445.scu0.facebook.com>
References: <20261111224740.2744522-1-sdf@fomichev.me>
 <1b764043-2efd-4e65-adb9-a47c0136446b@redhat.com>
 <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>
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
In-Reply-To: <avZC2hp_0ODMQ4SG@devvm16445.scu0.facebook.com>

On 11/12, Stanislav Fomichev wrote:
> On 11/12, Paolo Abeni wrote:
> > Hi,
> > 
> > A few (late) questions/comments to check I'm not missing relevant
> > points,
> > 
> > On 11/11/26 23:47, Stanislav Fomichev wrote:
> > > TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> > > A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> > > 68KB, which makes BIG TCP ineffective for devmem TX.
> > 
> > ... with default .config. You could set MAX_SKB_FRAGS to 45 and reach
> > ~180K...
> > > This series picks the TX net_iov size from the dmabuf sg table instead:
> > > the largest power of 2, up to 2MB, which aligns every DMA segment. With
> > > a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> > > no UAPI change since TX addresses are dmabuf offsets.
> > 
> > ... still this option should be more effective because the limit would be
> > higher and the skb would use less cachelines for the shared_info,
> > 
> > I'm wondering if making a comparison vs MAX_SKB_FRAGS==45 would be
> > complex and if you could do that, too.
> 
> Originally I did not want to include bigtcp to keep it apples to apples:
> same tso size, just 16 frags in skb vs 1 (in ideal case).
> 
> I just tried running mlx5 with 45 frags configured and it fails to start with
> the following error:
> mlx5e_attach_netdev() warns "MLX5E: Max SQ WQEBBs firmware capability: 16, needed 23" and returns -EIO.
> 
> (fwiw quick review with llm claims that mlx5 only supports up to 20 skb frags)
> 
> What I also tried just now is `gso_max_size 524280` (on top of this series)
> and it ups single flow throughput from 200Gbps to 240Gbps (presumably
> by making the receiver go faster with 512K TSOs vs 64K TSOs) and halves
> the sender softirq..
> 
> I hope this gives you more data, not sure running with 20 frags is worth
> it (vs 16)? LMK if you disagree or want me to run something else.

Fun fact, also setting gro_max_size on the receiver gets line rate over
single flow:

I   client.c: Connected 1:cpu 39 | 1:cpu 118
client: == Source 2401:db00:255a:4a:bace::b
client:   Tx389.448 Gbps (2921248849920 bytes in 60008026 usec)
client:   Rx  0.000 Gbps (0 bytes in 60008026 usec)
client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
client:             2   125  86      2    0 15300608 10142
client:   net CPU 39: usr: 0.03% sys: 0.06% idle:67.39% iow: 0.00% irq: 5.69% sirq:26.81%
client:   app CPU 40: usr: 0.05% sys: 2.91% idle:95.67% iow: 0.00% irq: 0.21% sirq: 1.14%
client: == Target 2401:db00:255a:44:bace::b
client:   Tx  0.000 Gbps (0 bytes in 60009306 usec)
client:   Rx389.438 Gbps (2921238435008 bytes in 60009306 usec)
client:   TCP retrans reord rtt rttvar d_ce snd_wnd cwnd
client:             0     0 210    122    0  999424   10
client:   net CPU118: usr: 0.00% sys: 0.00% idle: 1.60% iow: 0.00% irq: 0.33% sirq:98.05%
client:   app CPU119: usr: 2.75% sys:77.46% idle:18.95% iow: 0.00% irq: 0.47% sirq: 0.34%

4200MTU, 32K rx-buf-len, this patch series, gso/gro_mas_size of 524280,
still the default number of frags (enough on rx to fill 512K GRO with 32K
chunks).
