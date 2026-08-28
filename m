Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE8B448D1F;
	Fri, 28 Aug 2026 14:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929152; cv=none; b=ck/Kl7knXXenWoWu3tBPw3CT6P6ZhCA+zAVKMwdOHfTRR5cltMcUoKtfYl1NZV4vx5svrDAnu+BCSxtvG1irw34ySdozPAZvHU06+ReMxbS0Bi47x1mis3EWs3QdkpV32IiJ0e8yU/ge50zdu21gLiwNtid0g9JS3GiS6W1uCaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929152; c=relaxed/simple;
	bh=1r8NNjpY0EJGzkm48wiuOSsSeljbIcnKOE++zoOy/00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emyy84XGLQG0vmztKYs/24gftLAvW+/31VTscdHjdL2vEKc7NXydlnO2SJ75jeAxXycZ1Bx1fsXfjeWO7KpK+7aYpDYIvBklAT+ayIHlfKoWjWxcmrseh/PYEpm8rbc+m/nU70f6nGXEpaQoY9vihM3Kn44E8zbnio/KGFM6Hzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=QHzKZYCq; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="QHzKZYCq"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 729A011C674;
	Fri, 28 Aug 2026 16:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929145;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=VKND0p5YppS4+zZvJmzMa34e+T50T2pnOg9z7xqAScY=;
	b=QHzKZYCq1jlckwEadOVIKhWg8c2QJv+notleTgKcrA9jjL0H/e2uvBAQwiMmrRFOWPMtz9
	Jc9iUPbZWUM0sjFJwusTIkf9kEtNNOcedeymZQr89pNdpUUl16og8K6F/a1zq8aiMRZ7kT
	//s+0QsaLvkiRsVJ9QHCGMVs0HlxPVFBLs65OmnmBfqFD2bod4A0TSx8WhSHvIRLsadGQU
	Taw8jMUz3IYEmdZtMXnh74DpBZnDukhVnvKDwO2bxDtJd7StKVUs4yKoTcpJGxoIlgrhSn
	6nXcP6dKNBU7gAxcf0POkiZRUs5Qq09NHmNZBwsbENVD+lhOQszAThEx3QDB+w==
Message-ID: <a61dcd6d-0c64-4d69-a565-7aa06cc4bf75@nabladev.com>
Date: Fri, 28 Aug 2026 15:44:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] dt-bindings: usb: generic-ehci: Document
 access-controllers property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Pankaj Dev <pankaj.dev@st.com>,
 Rahul Kumar <rahul.kumar05@st.com>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-4-marex@nabladev.com>
 <20260828-puzzling-shapeless-gaur-f0d737@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260828-puzzling-shapeless-gaur-f0d737@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/28/26 11:13 AM, Krzysztof Kozlowski wrote:
> On Sat, Aug 22, 2026 at 09:46:36AM +0200, Marek Vasut wrote:
>> Document the access-controllers for EHCI USB controllers in case
>> access checks need to be performed to use them.
> 
> Please mention in the commit msg which compatible/device from this
> schema actually uses such access controllers. I see your work is for
> STM, but there is no STM compatible in generic-ehci/ohci.

Let me also add required: access-controllers for the STM32MP23xx and 
25xx while at it.

> Also, please send USB patches separately from DTS and other subsystems,
> because Greg takes entire set.
All right.
