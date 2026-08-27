Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B95941DED8;
	Thu, 27 Aug 2026 10:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787825146; cv=none; b=KByDR43nf7OhnaMM/YhWgQwn+GaOW/oLaCd/RhXS42AfHiYXIshQdMfvrgwoZ9LLNayleIeHB9Bm9iA/YK0uQDuPuZWPS45D7eHsXIPDiXWhmg0ApqN3zWncv5XT+KyRGvhhkC3RivrNg6TR6GAeySpeiIowL26lV+QTU3KP2zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787825146; c=relaxed/simple;
	bh=Zg+xzYqsJDz4GvbzB5MfmE4qx6NC0uREgdC6HS42Whw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMyGQ16WhNjDNrvBNJdKGBOdRYjQbXo21zcMz3O1UVqkKAYokcAQZmWtuE58jP0tbjO8QVATbnUQCG/w2kzshsEeQpUbGtfkLUOlZD5B/xOFoF22zdoVkZVUJCMVhr4Rnh2A/6H9rI5neqQFlGzvPktwijOD714nBPHv50lIu9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Duc8GFbu; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Duc8GFbu"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hVxwT4swpz8v3Q;
	Thu, 27 Aug 2026 12:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1787825129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rT9jGsnzQt8jVZd0P1GTYtlT1Q4XIEZ5DAw0yokRbVQ=;
	b=Duc8GFbu4jJZNviW5hgQdoxnTUItbmRaO1crVK9mry4f9EICjviTDG1pbEvfZbiKNEr6RQ
	1+zJ9LyrNaw5vhjKf1F2/e3wRd/4HGpiRDoz5kgmyMIWOP2CV9YZbeUCwV5w4Z2VuR/0i6
	9nLx0XoTXmOCdbqiSRfAJYlJq/PR+7vKxDXEqWoSyNBicDEmTpsPUx22FUbo4L6VULgkV4
	go5TVUnrYRK1t69u5nIqbBBxImOyGrNN1rRXSX0C61lJ1CWPVkoYp0FU8vLJIOUj3HJaEM
	/yvU0k06tApRrf8VHLDX4g5Ys1/y5jzaREhRppY9gbk5y4HdKFpMI97Cy6Q4yw==
Message-ID: <8d10ebf5-bd75-4566-96f9-b34aa1104ee5@mailbox.org>
Date: Thu, 27 Aug 2026 12:05:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260819050109.681890-1-marek.vasut+renesas@mailbox.org>
 <20260819050109.681890-2-marek.vasut+renesas@mailbox.org>
 <ao4yJCNXAHDYm8Bf@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <ao4yJCNXAHDYm8Bf@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: k1ipuhbrr43ak4uwm7d3zmaqpnjrxb6z
X-MBO-RS-ID: ebb8eb120446e72f90e

On 8/26/26 2:35 AM, Thinh Nguyen wrote:

Hello Thinh,

>> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
>> +{
>> +	struct device *dev = dwc3g->dev;
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	enum usb_device_speed speed = usb_get_maximum_speed(dev);
>> +	bool usb2only = false;
>> +	void __iomem *glue;
>> +
>> +	/* Wireless USB is not supported */
>> +	if (speed == USB_SPEED_WIRELESS)
>> +		return dev_err_probe(dev, -EINVAL, "Wireless USB not supported\n");
>> +
>> +	/* No USB 3 PHY in DT means this is surely USB 2 controller */
>> +	if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
>> +		usb2only = true;
>> +
>> +	/*
>> +	 * Controller can be limited to USB 2 via optional maximum-speed DT
>> +	 * property. If the DT property is not present, default to maximum
>> +	 * controller capabilities.
>> +	 */
> 
> Minor nit: This comment does not give any new info than what's
> documented in the maximum-speed property, do we need to repeat it here?
> 
>> +	if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
>> +		usb2only = true;
> 
> We don't support low speed or wireless, just check for speed <=
> USB_SPEED_HIGH should be sufficient. The rest looks fine.
I will fix that in V5 and submit it shortly, thanks !
