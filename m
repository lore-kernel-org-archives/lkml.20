Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793769353;
	b=G9sF54cl2gRk5Xp8JUEcWLH3RQ5FJMrMc07keWMrr8RHQBG35ookBYKjwT/tb8W1Uxy3
	 rbc67pyeqhwABf7wQ8uwtmQXsOLaPszVnSbVC9v+jFPGHZXR2ryTwmXcVMr0qB+NRGeyk
	 e6aBs+Q8oXVIzvpnCLLyt8h5tTRmV7UyD0rOvX/zntrIKxDdq89x3yjELhQr/CaPdFILt
	 5DocN/gBgMfOhCCjZIQd6lBQ+0dcukLWmVPwC3AF1fxsNY4/ngLCYC8C/9CINb+ph7Hec
	 EJJaGjOyoxy9OEfgrcSs4lGm15jrEX5CQPPD+n8r6m1iC/EGLKFzNwpUk54zKM4xs6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793769353;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=aAyOJH+/ySUK2zDeQ1iJyBQlLl9h4Z339aF8GGL69Nc=;
	b=KQl9c1anhMf8ZVB2DMbKgjeh+Nke/cC4pwOjGHsYh5ls97MTMqW076BABZ6+E+9vMsQ0
	 6yHNXJVYTVPLqC71zG9FrwMHJWEVqSs8ioSDZidcrkYdY0iVnLAIpMHseY5u7TGqSa3T0
	 T/pVwPs5dvRod2/kbJoXpgLKjXq3sk8LEJZoIa5unLE/ATrRUYAHmJGK6bMFvgIxuoUzj
	 kV5ivaura0Ks0Idpazip+GXwmI5SDA/h+7hUL9fq0CjtW6AsGWv3vJAq5SwXqwj+/TA2c
	 k1dyDtBHXH0k4pIn1fu7vWhaCmeQSiqg0LRRJm1+z820Z1eIn5Ym7lKNgMkM+aHjJHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KPPHPiA5;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE480606A31B;
	Wed,  4 Nov 2026 05:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE480606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=KPPHPiA5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6D5010C77E;
	Wed, 04 Nov 2026 06:15:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793769346;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aAyOJH+/ySUK2zDeQ1iJyBQlLl9h4Z339aF8GGL69Nc=;
	b=KPPHPiA5pbU96CImUfhV+zlP7ollSTQxoGH0hIQmwd2QQMNQXfYSNDLPNJc2EfpSbA+ZaP
	XpZ1pXUiygayD8zxhFa1wDVUz5Y4kA/kvgS69YV76OSSJtwnJFd9ee/TJggCREGUDnzdWU
	tuZrocCnH+wD3tpjT3WYsNadZn3NqImc2LEngdeoy9rTDbYkaUwax+YUP4u4DRHsqNqcKL
	iGTQA4DAETamvoxcyGm50shyXjuxOASraMZ+XVnNGZn+qIlrTOPhkpA6ito/XAj3F9AzhW
	Fv7E6iePpOmKluAsBDeYk6qUH1rHO9qVar8Y6jt57goCfy72Bv8cmBas/NRerw==
Message-ID: <c64b91f4-3f4e-43ce-ab81-8a233211c8ea@nabladev.com>
Date: Wed, 4 Nov 2026 06:15:43 +0100
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
Subject: Re: [PATCH v5 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260902141312.649406-1-marex@nabladev.com>
 <20260902141312.649406-2-marex@nabladev.com>
 <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <bf8e7888-1917-4ddc-9a6d-20490835c742@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 9/3/26 12:19 PM, Fabrice Gasnier wrote:

Hello everyone,

>> Add USB2 PHY driver for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
> 
> Hello Marek,
> 
> I'm not sure if/how this fit with all below tags. For all the
> contributions you've made, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Would it be possible to get some review on this FemtoPHY patch?

Thank you for your help !

-- 
Best regards,
Marek Vasut
