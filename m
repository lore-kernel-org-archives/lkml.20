Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794370486;
	b=qaAXI9+oewotFXi1VK+tfYFeguiiY/9zE4xm6QrYw1j1JlatcsRPcWwbhBzvusRbQPms
	 oX6CANx3rj2/ClZPmDzggNAqdpsc46Wy8Y2FkUdIFcyJLu/3BGBgt5gLKaLdSDDEI1pAz
	 YvXD7/dEk6iiCQHCEcbQ83RNr831YsQcKC7TwyV3ZKxwqtB6v2qiMpOvnWMGWqBA2u32V
	 9bgXgG6YsqJkJaRQSbB/rEmdKLr1eiBqO0u/Bd+dj97W6ZSpu9LRCEpP3GMRTHN1hDfzg
	 9uFQUa9KGb8bb6IT0XhyDOrcjyxN93X/pJCiEqM65U1dMIVbTM3v38w+JZNwTy/sNnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794370486;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=Bka+P1SKn7+o7710EoziSWAmGI6ixZAyxquFEjs1PAs=;
	b=H8vtm9aczBJD4tq2p2CSwyoaSyq216avJkbAsvxGUO9XW0+l5DrAZmiIFJY+3W0kgOPm
	 va9XWIUaeRM28r9b3MrFavWOTaMQ0I2gzoSR5lp5Jsdc6jzIpo2vNVFiLxg0DqwmQPFZb
	 Lqr52YtEYADuU8f7uTKs8xT84CQ7EwUq7dqL1JJp3iEwRyQO+5LcdA83f9z20XYnLAIkY
	 9pMaAbQwYCjKTJZoQV2cdIWlAGNm3i4dyKu/r/ak4382E67C/ydeUVfl2bwi61kIFYPof
	 giM0m64/unICzxGltgCTNjvkJsWBqoQvm5CYa5EcChixtuGWDE0j1qfOQQUQNHcCPNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Sc6fSMSq;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CA606A31C;
	Wed, 11 Nov 2026 04:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61CA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=Sc6fSMSq
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 24FC410DD83;
	Wed, 11 Nov 2026 05:14:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794370480;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Bka+P1SKn7+o7710EoziSWAmGI6ixZAyxquFEjs1PAs=;
	b=Sc6fSMSquBBcfsDHjtLo5bB5J7aopkltjJTi9XygiXTqObpYtwnCoIaEWwubIqF9Dg5esX
	stboBY5p3f1nt2Lt6QNF1bd+2n9NLY98oj9ejH3UF09a1bbCnOMu+6/6RMbYaU6Z3/7f/z
	o45+dbX++pyipfFfta+I+cddBceOuULLpMl6cYgao1QMmeE32E7tEQS9ClpHBwqmnASXhq
	NdO7N8gVgguw/1aG+cB8MjCk5Rz8cr+oKG/cSwaGnSK7pYNcFePgswpHdIdX3Pgdx6fmkX
	t0oVJ2p6tcdq37rCk5s/KWlqLf+/FeMU1cZj1hG6F2T1Tt+0LApWj8I/fTKBEg==
Message-ID: <58f2ae35-c310-491a-a4c2-ead854ad10e8@nabladev.com>
Date: Wed, 11 Nov 2026 03:41:01 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: usb: generic-ehci: Restrict
 access-controllers to ST STM32MP2 SoC
To: linux-arm-kernel@lists.infradead.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-usb@vger.kernel.org
References: <20260907161203.713424-1-marex@nabladev.com>
 <20260907161203.713424-2-marex@nabladev.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260907161203.713424-2-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/7/26 6:11 PM, Marek Vasut wrote:
> Tighten the access-controllers DT property availability, restrict it
> only to ST STM32MP2 SoC, which is currently the only known user of it.
> Once more users start using access-controllers, the restriction can be
> losened here.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-usb@vger.kernel.org
> ---
>   Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index 908b02d9175e0..9f5130a0e784c 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -217,6 +217,9 @@ allOf:
>         required:
>           - access-controllers
>           - clocks
> +    else:
> +      properties:
> +        access-controllers: false
>   
>   unevaluatedProperties: false
>   

How can we proceed with these patches ?

Thank you for your help !
