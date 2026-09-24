Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E8D32D0EE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239470; cv=none; b=h+5n0N3HDYor+hzapoqAwRDb+oeZ69zr+QCa8kVRXT6zDCGf08sx9+VZqRx1alTh8CykdfTPWROZ+HLYSXpRXx9XnC8KUBBF6tPWq+fUhaKXOXE8NTGtvwUGI3KWDjBtu3URkmk04hfuBa89setL+xMqXTOenkRxerzgPFD65nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239470; c=relaxed/simple;
	bh=ZXVYss8RjCXDsXP59Md75rlLQ7LGVyizQouhuPgXmCs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F0H4V3yuAe3HaU+pilUFnKGEwzp/ddA07XsoWGEEM8mOp/Pn9CpX3ur33DVSzQadrC2BcfeBq+tarPEIOmAQFoiXTLDMOD3SPnIRDg3+d2NeQErkT8nMeIKpo0Q1w7PLuQo149QWHUdAOeuUsiSNK0brJ6vQoq9oo2Vrd6VLDXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KP7unPYw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=nFfcyHtO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KP7unPYw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="nFfcyHtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790239468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ihCaIXxNrufdB165FFQLuKNHzdKzMm2Q3bT5iLKUB2w=;
	b=KP7unPYwdxlu/h0BecjbPiMpk9oz1ZOWiEAboZKVcrf3YjuBIT3U+wfcPM6VouGo1bxMr3
	sOW53SFCQ/2AwWUd+6IxRNzWdw+gdjz3Q6nJf0CoZMFlwCnurYf7y3/lLcpbsbm65Q8oE2
	06o3CW1VKcwjo+W7233LT0r0Zr0Ao8A=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-fVjQP1-IPCixM4it4jsD0g-1; Thu, 24 Sep 2026 04:44:26 -0400
X-MC-Unique: fVjQP1-IPCixM4it4jsD0g-1
X-Mimecast-MFC-AGG-ID: fVjQP1-IPCixM4it4jsD0g_1790239465
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c294ae16922so218272766b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790239465; x=1790844265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ihCaIXxNrufdB165FFQLuKNHzdKzMm2Q3bT5iLKUB2w=;
        b=nFfcyHtOKa7PzslzqKymdG88WbiVUIcViAJyjTbP5vQkWCgZJTs+QQZ1cBbKUm4xxM
         GYn1N0U43T7nAbEAD6YkdEVngY2BvFs0xy3qst6RU6mi8NZzJDRZhja/c0y5hVYR4oyA
         qjafU/estZFPa44h2XYbIZwIkIlQLIl0Z3xcO7gZQ3iphU03TUEHZ/uUURyQbxKC9QFr
         zPaEB1nJ0NoO9yGZQhMWUDmQ65aGBjPHGQDtf5t2YtiPQnuKSOgGcn0cURerFOYfuKUE
         hBvLnzdLX8utW/wywmM3El1FImzAcxWuxMS++GNSqAqlY0nSoQw22z7jqFDs+QBLR8/K
         Kj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239465; x=1790844265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ihCaIXxNrufdB165FFQLuKNHzdKzMm2Q3bT5iLKUB2w=;
        b=b7cdhYSP7PKp6Bh/jE+cqzSoo89pIQkekqMQDy197IwISyyK03V/3hkxY8FnKfn2dR
         jkPtwE15IEZF/s3yWRoCQOkFEscFQ/IjoMfBHrDefT6JZTTEA3sqN5j17CSngzQg/dOm
         bslYw6X8n2kSeBI+lg9U+FYTx7LkY7AeIePl99/wzkEWOYTvQNR8whIJZ7x7WzzLcI0q
         0FdGmxrKXp+Eofprq4YK5AeUnvaaJZGDR+qiEBgZQ4/jFRUCGGtnU3kM1aidtbM1tJ2L
         J0oYED0OxtUbY0vVeeJ/2eBwDgAVeIfp07LEpdYRBplzZq4hb4+0VQRZis6RyhcUUzuQ
         lTmw==
X-Forwarded-Encrypted: i=1; AKwUvByMQnYNUIChPh3IhG3jqzruqVBjZUuUtqEtigtWQwbCU5aj2ro4xEac91Eivhl2igGkMUlGpUnhhyzOCvU=@vger.kernel.org
X-Gm-Message-State: AFuF++nTdYdM9jptQm7y8yu8Hp95shtCt4aSPFDdm/AtIMOo7LhCTQRa
	KThAqxtSKTEuPbbfdVJImvOPRsq2ulwl+cStU5NpkC8DO+RK49XGNP//gsGD3vsSsAGqcf3VA1Q
	sbwADwqaUm5HmONFB8wWr41K+kwitMUamyT7qbQQE3pzimBvAwn5/McQRGaxgLl5X7A==
X-Gm-Gg: AYBFou31MP7I1j2euUeJioCLBk3jp6La09fCAqarkvuD6qmgxtpmBCPxIP40qv/xBDW
	t0cwJ53hj5k/iKBo3t6QrZOLDSSC2V9Z930MsUC4zAIcqLHqrc8XgmKAvro5I4Wd9pmc0wAy8gY
	GdDcJqAtvW/v5SpffmMpvuBskbQZ2nvmtKB5TgO7aRqN3aKA0bC+NSWG2yXiOzf/jqysVnS+Rci
	5UCRc+9pnr19kBsA/2dRGBeZ/jF+eLi5LmPtv8qiGu9laETqaLblQuvBgzhkSH/Ei1tiwAG/ZDl
	/g1s9zve2Y1PShvUevRNbrenpuQV1lTqqufiRNzK9TfPQwIDqfdDLbIjFAtmBJ0M7Z8N+LxwqQ2
	+4iOlk81UTxUUVK6DtgxyLE3vCSkUfcY88dox98rjoTQmEE3r1r6ZTIlKGTwZ6yjv5lL06zJSpw
	==
X-Received: by 2002:a05:6402:20d1:20b0:6aa:d223:8040 with SMTP id 4fb4d7f45d1cf-6aad223808bmr435020a12.6.1790239464892;
        Thu, 24 Sep 2026 01:44:24 -0700 (PDT)
X-Received: by 2002:a05:6402:20d1:20b0:6aa:d223:8040 with SMTP id 4fb4d7f45d1cf-6aad223808bmr434996a12.6.1790239464479;
        Thu, 24 Sep 2026 01:44:24 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab3883141sm3191412a12.15.2026.09.24.01.44.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 01:44:23 -0700 (PDT)
Message-ID: <77c78712-d320-4a79-89e0-cfe11a33842f@redhat.com>
Date: Thu, 24 Sep 2026 10:44:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: Setup TBS only if HW supports it
To: netdev-bot+sashiko@kernel.org,
 muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: netdev@vger.kernel.org, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, kuba@kernel.org, edumazet@google.com,
 davem@davemloft.net, alexandre.torgue@foss.st.com,
 mcoquelin.stm32@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org
References: <20260918023530.31971-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <179004548784.2160803.5129187589966240478@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179004548784.2160803.5129187589966240478@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/22/26 04:51, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 (1) · Medium: 2 (1) · Low: 0 (1)
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch is a bug fix (it prevents a descriptor-format
>    mismatch where the Tx ring is laid out with the 32-byte `struct…
> - [Medium] The new gate in stmmac_setup_dma_desc() (stmmac_main.c:4128)
>    only checks the chip-wide capability bit `priv->dma_cap.tbssel`; it…

I think this patch should stay on net-next with no fixes tag, but the other
reported issue looks worth to be addressed.

/P

