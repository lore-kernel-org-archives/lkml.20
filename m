Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881952;
	b=CkNYI3VsRkIM6hhTf8aDcqIn1n9Nds+fNyi9nv+eJZ0/GkVoyByybhNvcgicpkspcBfd
	 86ktj8m77Z4WIp5+chCPCrcqgGulvJRaOgNBYJsYgOsPu8FwGh8aZeydytu8iH+ObEAfu
	 atmye3eXZB1+owYIlgCXsU3pMSxJacYluN/YwvhDswISRbVG13htAn6wIeOAC8MGpLFOq
	 zcsdGvDrLnfxqgg073Vjzaz/rRPBeYSMGJdBxabupNk3OwnkIp8IhGxO+ElEzZYhQKN6C
	 51KJlOUP9K360NMy198Tb9x9nR/A4pbZl+Ns29uNL5LkKBH31DRapZp7YD4ytf8tiww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881952;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
	b=wRjcJDE3lcU4H8OcUpybgl0TIlr9bHNqh5JiZi7CHFwgPNF4fi79uEQa8dxB+yUOpFa4
	 vPJ86iHF++hYV4gAEKrhGHSxxNG0IiMx0wV4go0C6mX7mD9E7+tK3CvnqpmBiOSZnaYB8
	 tViWkdCt3TMoTx2vNVMfSMyse0TCVdVks/O+nE5LnXDCQmcH0TbVoSikrChV8yzQIrrJO
	 b971WV0fON0m3T+rHhmEpgb/qQof/+V8Ru33M0vnWZGWRlHiLJlJjh3d1A4eTKaeq5B2w
	 PNecra3Oh1C2ySUOaz2raJk5VxU9Muggdvvu3Aw81j2/OsJY6r6yE0Y5WBIj8WRhqyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtYGf1W9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KTr4haOe;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF62606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF62606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XtYGf1W9;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KTr4haOe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793881950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
	b=XtYGf1W9bBNUiNdVGmgGcmGQd/CTx7I8my0rflxtHeV7EGFnucp4eF0bEgyeh//ywQ3nso
	rIoXEtrOADru9g6pwvyamQXkUKdLjFfFInIsKjgjF0taWEz8mDoD0FxN/QDO8cdG/obUOx
	E0akaBWUNiS4uxuYmqT7joMpOi7RvlE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-YcNFwX_WM3amDQ4gQA5bFw-1; Thu, 05 Nov 2026 07:32:29 -0500
X-MC-Unique: YcNFwX_WM3amDQ4gQA5bFw-1
X-Mimecast-MFC-AGG-ID: YcNFwX_WM3amDQ4gQA5bFw_1793881948
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so23092325e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793881948; x=1794486748; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
        b=KTr4haOegaA3Jpyzhjf04TmHcXImXFzzrfo1/QXl3+rSGpcMj9LXnWc7qzQxL2wk56
         KDb/jWbyRyRQpeGb0T5Z6e7Wjd9R2RztyJDxexRdL+JS7W7bz/R6uHNn3YEQYNXAvC/t
         B4VNYfKb4EkNJj5FOA3Mh9cCveZOpvpUfecOwYudFRYg0x8YX2Nv6S7eCFLJVUbvSKuw
         RxLL5pyERNblWFAq4ptYqEZaDpdv7xyVYYNkFn8Cgi6auLyinBUaX1MN/1kzW16gI/Ar
         iGA2Kqek0dRvXbJ6brTsBW2k9HeNFmeBkNZII8ST/RwxCFoIK2fxDP71bxO6CibSliOL
         kuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881948; x=1794486748;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhW8bgTEwMPwLTiCb1KEBA42lBnDT9eGZiSGg8XBodg=;
        b=BhwfA9+3V9atS90FZl35uML16viIqw7ysN96ZNblyZ42g9X+H5G9E9YTmoYE8TsOgR
         VDGBLcqKc3FIHMZPdbULNttKzYfWMCoDjfTI33qQc+GXFs/JUXVGiLwNo0ZquUn8iwNy
         To9JQnbXcUZxHZjCqnepOwxdwpE/UuPuOTauC8Y7dOjcpAIYKwKkbvXRgmFhUSM6Y6Fw
         ouXTrnd2DItOXdahvwTmgDWNcSNs5bW1X1ytRVvsAsV22gXxgF18sb7BGU2jdwSfn3op
         uSl2j+Rq94ir9Ha7GxPCYL/qNJ+lMhYyrjPW7Dkwsx8owzldSHrZD/CdklX2HNc9kY+D
         pBuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMPcVYbB71sLXhO48g1hFFrPKFMLwHtmaEh3WE8SC6WM5uLqQdbzgvjwa+UPExF8SsSRhNE4nDI2IZd2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z8MTHVZYd5dAxthr7SZ6PzN5zJ5+fj1+ZrrlKHdO2DaCPZvLrwd
	qTMN2mosXpmf0PbXSScJkiMin1hJjOY8NNulnfvbIzuWS/yNvrlg8TaDUT7aPmwVQipPhY/FiUq
	4fTE7jRvYIS94De8XUPlza/szcfpfKWUIvxyzxnxIUk9CvDn7nIN82zORYumoRmaerg==
X-Gm-Gg: AYBFou2zOhgEu9sJriBVMw9l1Z4owDD7sI6+i62kr/SSJqYY1feDGQ2+Zp+DafNlOil
	ABJFH6btHni6F+QQMsnFZMlYawttucqzn6ltbaf7nhvyFNY4JgpykjMbN58tLkac4BEYjbvgFnD
	XRmrqhrdvRd4nbC+/H6Uic5AakLatzfdQUBf6Ym850GyZWnJaMdLGTld5BFmCDAmF0cHnU8n8io
	gtoELZOCO7zPlltJc/wAESa8NHK8E/i7gHlIx5ES4usAk+Eti1bLjJ7DCEK/Ma5OZWmTh/8pRzX
	pGjJl7BLlOYAeCvQ4zG3nFPOqYPxoqVVmoTzOUYdYn8YFNVN37UBp5H90shcEP60i24lnDIU4vX
	rccpJvkGi0PuDuxAyu7NGuEC3hbCXUaHPuDzhhzpjIwFWK3ZG70wrxZI9QASls7X4uSOHTDXoXB
	ahfHm3ICbZI9NjLme3ID6OYVT6uifxgR93eoTk+VZUslI=
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr427333975e9.32.1793881948070;
        Thu, 05 Nov 2026 04:32:28 -0800 (PST)
X-Received: by 2002:a05:600c:524d:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4ac18993ca7mr427333405e9.32.1793881947627;
        Thu, 05 Nov 2026 04:32:27 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm69153765e9.10.2026.11.05.04.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 04:32:27 -0800 (PST)
Message-ID: <8e63cfcc-6120-4db5-ac2f-8214db2c1fe0@redhat.com>
Date: Thu, 5 Nov 2026 13:32:26 +0100
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
Subject: Re: [PATCH net v2] ppp: remove SC_MUST_COMP
To: Qingfang Deng <qingfang.deng@linux.dev>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Tristan Madani <tristan@talencesecurity.com>,
 Norbert Szetei <norbert@doyensec.com>, Andrew Morton <akpm@osdl.org>,
 Paul Mackerras <paulus@ozlabs.org>, Matt Domsch <Matt_Domsch@dell.com>,
 Brice Goglin <Brice.Goglin@ens-lyon.org>, linux-ppp@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261103015615.2704-1-qingfang.deng@linux.dev>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261103015615.2704-1-qingfang.deng@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/26 02:56, Qingfang Deng wrote:
> SC_MUST_COMP accidentally shares the same value with SC_DC_ERROR.
> PPPIOCGFLAGS combines configuration flags with transmit and receive
> state, so userspace cannot distinguish them, and a read-modify-write
> sequence can promote a decompression error into SC_MUST_COMP.
> 
> With SC_MUST_COMP set, intentional or not, a fatal decompression error
> (SC_DC_FERROR) causes the receive path to silently drop the failed
> packet before delivering it to userspace. pppd therefore cannot detect
> the error and reset the compressor's state. Subsequent incoming IP and
> CCP packets hit the same check and are also dropped, preventing normal
> recovery.
> 
> The flag entered Linux in 2005 with commit b3f9b92a6ec1 ("[PPP]: add PPP
> MPPE encryption module"). The original patch submission [1] said pppd
> would set it when CCP came up with MPPE enabled. That intended
> integration [2] appears never to have landed upstream.
> 
> Remove the broken and unused SC_MUST_COMP from SC_MASK and SC_FLAG_BITS,
> and remove its transmit and receive drop checks. Keep the uAPI macro and
> mark it as obsolete. PPPIOCSFLAGS will discard this bit while
> PPPIOCGFLAGS can still report it as SC_DC_ERROR.
> 
> [1] https://lore.kernel.org/netdev/20050814141046.GB20944@lists.us.dell.com/
> [2] https://lore.kernel.org/netdev/20050814190529.GA26802@lists.us.dell.com/
> Fixes: b3f9b92a6ec1 ("[PPP]: add PPP MPPE encryption module")
> Signed-off-by: Qingfang Deng <qingfang.deng@linux.dev>
Given the 'broken from beginning' status and the hopefully low impact, I'm
applying this to net-next.

/P

