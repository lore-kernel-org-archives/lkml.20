Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958AC3839A3;
	Tue, 29 Sep 2026 18:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707142; cv=none; b=XJztqLeYECUqG60ScVF61coMpQeAhlR8uhrUTvLSickKO8DikAdB/JYmfynWaS5nOX70Mq2NceF0Ioy09p4PqIL36mv6ZhO6Y8dSkBHTjCiuNeIQeNXjvt83avKgs5+AX8SupmHzQR9kYQ7aqW97JmvYUekYIOA5HmhNh8DNFQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707142; c=relaxed/simple;
	bh=PtbCrSco5yzG1FGo+RyooD+inB125yls+7pZArHYHF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H6OCX5NZDI5EUvVyM8d2oQe37T25QfJPIC7ttu/I7/giCaU11xGgfT0850aZ6F9pMk/Otk2IppnwbWoPBgKQdbOBIFtnTHxsnDv7aLO6zDNB54J+80C2Xqui/lq95qUyihQxMOv9DBS5jFse5/rd858F3KwEStacol87xrGej+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=VZGtWy+T; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="VZGtWy+T"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF779106CA0;
	Tue, 29 Sep 2026 20:38:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790707133;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+mz+DR/cNP0US6qM+V0NJZZkwyCBeScDtMfTKHVJnik=;
	b=VZGtWy+TnRRjNQTbwO2hS2qxQNoSfigFgLQtQ6lSy8wTUxCm1pSlqzLhf6Hmf2ySNOMvI4
	1nXo68OLK7P+vcD/tS9Z75jRByo2YGJ0Ckh8JCy4jbC4gaJjheDrs6+XjLJLXVbOCOvZjK
	aFWhTXRZy7dR7vD4exC2woOXd5Nuv3nnW+ZbL5vUzqYXKwlCDmj1AViVQCugILH2uaogI8
	S8rMDr/EKcMVwMwQM72JxK/GjZlIqIst8zJPbjFczbIxUY2qCCwRyG3lWdSUZp/jHN5OxJ
	8H9A8lYrbJBq3UqTsnptbFDlO7P8rqj8fK5GP5leIJeQewqlebMFSvL6Kru3Zw==
Message-ID: <0a65ca90-2b0f-4f58-94bb-11fa2737519a@nabladev.com>
Date: Tue, 29 Sep 2026 20:38:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 linux-phy@lists.infradead.org, Manivannan Sadhasivam <mani@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
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
> On 9/2/26 16:13, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
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
Is there anything left to do with this series ?

Thank you for your help !
