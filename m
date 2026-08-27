Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B773859D4;
	Thu, 27 Aug 2026 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850064; cv=none; b=svxc3rzFgLPfqPgsPeos82YDdAWtUkI8ddqbMXLyUgb3Ri/gKE/Db3eoXGHGDqGDR9bMxCwtmAGR5Dal5UMf1vtiAGENgyxGY7M/1ypkIMWgrn2Hofh20SXa0/NthJX3j+s3foj7fld6xhNsBetomy2RXVv0geEFGKaY+s/8ewE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850064; c=relaxed/simple;
	bh=hQk5qeUVo9BQ2yw1VhAcNzwnwAePCbrZFzJLkEp7GxM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AWoNTBbYLHqGF1tb1do4UGTCJSTG1M934q7rbysRldKyxN1rKWi0f0geydVfGUeBrRqZUauBnA3ixXIAbzYrV+ZQKyI1M44n/W2mKL72aF+6vEE7WlcTt2VB862sjf4u7hFFhsz1spiA4Iw19DGfpq8JkLCbp/ccQE6TUPJx6Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=XFaEo5+3; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="XFaEo5+3"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A81211D061;
	Thu, 27 Aug 2026 19:00:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1787850056;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=7V05cWEhDJOIL3jV+PILUA2/oARzJG7AGMv5EpJMUbc=;
	b=XFaEo5+34Mllhz+TYYXDDc5LVW3eTq3XprquZjmo3/8fJxWSMmE4YBR4beBWqKt6TeHV4Y
	y4rVMhgdN+41NJ7As+u3AvDOmkP9QxWs5o7NPlW/UEplcSobe0QbLzBI8H3Un99TuXWCbP
	/mo+iwOGSpmTaQjX7UNIV5WGhkZL3vTnMgbsIxGKXf6vuO6LFwxEwVpXWZOv4jPvEQlFps
	9DQa1jKE2wyjAHccidt3l7fwiQ0nmSqk4o4BpyprnOebRiRNpmFyB92cPKVRKKIHXs3cgX
	v6EsrWPyifrNDPtlNqvtRWXxOKzclnVl/v+7h2cgHSnTwOBFE/QPRBzh4OlPxg==
Message-ID: <0825c182-7eba-47d7-9b1c-6979aac1dd96@nabladev.com>
Date: Thu, 27 Aug 2026 18:52:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] phy: stm32: Add support for ST STM32MP25
 USB2-FEMTO PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-usb@vger.kernel.org, fabrice.gasnier@foss.st.com,
 Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
 Christian Bruel <christian.bruel@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Rosen Penev <rosenp@gmail.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260822074816.548662-1-marex@nabladev.com>
 <20260822074816.548662-3-marex@nabladev.com> <apBfHzD5TfryaEW0@vaman>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <apBfHzD5TfryaEW0@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 8/27/26 6:00 PM, Vinod Koul wrote:

[...]

>> +static int stm32_usb2phy_enable(struct stm32_usb2phy *phy_dev)
>> +{
>> +	const struct stm32mp2_usb2phy_hw_data *phy_data = phy_dev->hw_data;
>> +	unsigned int refsel;
>> +	unsigned long rate;
>> +	int ret;
>> +
>> +	/* Check if a phy is already init or clkpll in use */
>> +	if (atomic_inc_return(&phy_dev->en_refcnt) > 1)
>> +		return 0;
>> +
>> +	rate = clk_get_rate(phy_dev->phyref);
>> +	if (rate == 19200000)
>> +		refsel = 0;
>> +	else if (rate == 20000000)
>> +		refsel = 1;
>> +	else if (rate == 24000000)
>> +		refsel = 2;
>> +	else
>> +		return -EINVAL;
> 
> Would a switch not be better here?

I think here it is a matter of taste, switch would use a few more lines, 
so would a look up table. If you insist on a switch, I'll turn this into 
a switch.

[...]

>> +static int stm32_usb2phy2_init(struct phy *phy)
>> +{
>> +	struct stm32_usb2phy *phy_dev = phy_get_drvdata(phy);
>> +	int ret;
>> +
>> +	ret = stm32_usb2phy_enable(phy_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (phy_dev->mode != PHY_MODE_INVALID) {
>> +		ret = stm32_usb2phy_set_mode(phy, phy_dev->mode, USB_ROLE_NONE);
>> +		if (ret) {
>> +			stm32_usb2phy_disable(phy_dev);
>> +			return ret;
>> +		}
>> +	}
> 
> so what is the diff b/w these two phys that we need to check invalid
> only here?
For this particular case -- One PHY is connected to host-only EHCI/OHCI 
controller, so it does not do mode set. The other PHY is connected to 
DWC3 DRD controller which can do either Host/Peripheral and does mode 
set, but that can only be done if a valid mode is already configured. 
Hence the conditional here.

[...]
