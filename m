Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84A8647254B;
	Fri, 28 Aug 2026 14:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929148; cv=none; b=AIUT8yjL1Nqzfjx7jwHlQAjo/5gCMi4eIClCYpqyDcAqPi+M7133g4eXMD9RtGs//1kQTdfRLo/0CQSiOgWt0fLRVNcixV7UDCtCFn8q8ykXxFLvWyCMeYqNLRlpbHWfNVWHOtnx7Tf3P7bDF4FIyHkjqzSJmJOFYQ3oQD7MPqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929148; c=relaxed/simple;
	bh=mnQooKYMLOZHLETIwP6VUnvGzdNDZhZ7NJn7ueBXhkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YS9A0eCEg8r1DowB93MErxFxu7a3R0V0abtNVIKjJZQPLrCbvmjbw73yR77thdnl4EXxsp3zoZ92AyksxpxzwhBCfwffKnrCotGQD94AVWyHDyI8ciV+F525GsJrtm5GHJQwpHjKIhS6riTDWvsCUy+DwwoEPPy17h0t+iAL+H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XqLoC7Jg; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XqLoC7Jg"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7485E11BF2A;
	Fri, 28 Aug 2026 16:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787929140;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=gWcirtnE4uDumZP9/67ZFWrDNIg5Dw/DiSxWsTPXR2M=;
	b=XqLoC7JgsFzdFUgssNqhfzVLUmYOC5RCZ1t6okz+Y21f0IuelwW9oEPd9b58KckRre8eUB
	AuN5DJ3tcANd75GqgVNeJL4pzeH6KoOVSDS8NfshPXE8ZaVnqhld/P3n65fG04uWwMzfTY
	wy/3RFFXO61FCKPSPPGcLeW0vkV3G2e3ulwLUK5qF94AltCAfYArFkgnmCVq8rvZBNDI4O
	YzH7tMwq23u7qtlLilxNHh8goVYrmaQjlsS50OFQ4Z6/VC1RRK6F6dzogjWeTC3uwdRgas
	WiF8M9GGeFb1iB4nZgCx6HVVnAKZYD2Q7oVIF3GnXtbWVhddMyyi0RX/vOKvxQ==
Message-ID: <de23791b-0464-43c4-b0bc-cf3763956dd2@nabladev.com>
Date: Fri, 28 Aug 2026 15:11:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-2-marex@nabladev.com>
 <20260828-sepia-vulture-of-glamour-ef861f@quoll>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260828-sepia-vulture-of-glamour-ef861f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/28/26 11:11 AM, Krzysztof Kozlowski wrote:
> On Sat, Aug 22, 2026 at 09:46:34AM +0200, Marek Vasut wrote:
>> +  resets:
>> +    maxItems: 1
>> +
>> +  vdd33-supply:
>> +    description: Phandle to regulator providing 3V3 power supply to the USB2 HS PHY
>> +
>> +required:
>> +  - compatible
>> +  - "#clock-cells"
>> +  - "#phy-cells"
> 
> reg should be required, usually. If it is not, please explain why in the
> commit msg.
Fixed in V4, thanks !
