Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEE328F5;
	Sun, 30 Aug 2026 03:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788059821; cv=none; b=H+leI4UG/SvQy++mEHfNaxNX/kw+W1URCyo49hu1ZOEEfbeCGbqb6eTXsuhzb5vCQ99vwa6s1PpHd1Aoknx6bwqfZSFq+IS/uZfyhP8TmUfRNSJulfmGpLDaSI7hPB6IzrLxkXPJjN2I2yblFG8P6glpg6lniFEw8fSFSfReBxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788059821; c=relaxed/simple;
	bh=l16+mPVq1eiU0iL8DzTEIdWHAp/QLKHaLoHykSWUMQk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=QkEc9J7G+ZQRh3byh5JECzeD6WUmGpoYMHVBTv5AwmO6dvKvpfTnYGm/yen8G2HppWFFgVjddZ7eYiPVXxe6i05G/vVTPg47m9Yaoheo6RYe6ZOx2oY5U5kzs6AajT2RrgekaEEEqneYlgcYUgL/LLnJlsjaqpFK8g7cSkU+HzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wxKkvi4Z; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wxKkvi4Z"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4hXcjY3N7rzKrl7;
	Sun, 30 Aug 2026 05:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788059809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hEn+MsA7n1n6NC548cmui5vFT2ZhSWDLUnWueOriBZ4=;
	b=wxKkvi4ZVIv/jM84ULO6Uw/isB623/YoNhR0WaCJjmzj5awVzKJvMZe7R3j70n9+kLVfJ6
	+xLkUv9aivriBS1OcPqVjt/2TDpFZyAwHeimbIMQs0Y9Uc/qB+FTG153JHWFTgvaaKv0WZ
	I6Rvf5XGL3w2Vgv7qj6AKssaF63Zbair3+PR5cCMaS2n4iZHsabssVSwkQyKEOlYNcPm0M
	3G/mLpa/WE2H+EiSPShufwD4xC8OPGD/xXhNCQiuCzZT7ue0a6oO6hqL2qQifPAeM9h6aQ
	pXRqSXWnVFp7QEo6hqe2OYLFcu83r8LuWydBXGkII919mEEyhnjuSXE/p7U6pw==
Message-ID: <df54684e-6529-4e61-bd5e-170014fc1c3d@mailbox.org>
Date: Sun, 30 Aug 2026 03:25:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [PATCH v6 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-usb@vger.kernel.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260828184212.395082-1-marek.vasut+renesas@mailbox.org>
 <20260828184212.395082-2-marek.vasut+renesas@mailbox.org>
 <d801ecb2-587f-480a-878e-8426239b7690@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d801ecb2-587f-480a-878e-8426239b7690@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: axc9cqqeykt3ds8hw8ruz38m83388xy6
X-MBO-RS-ID: 9d57e20ca3d0d6acabd

On 8/29/26 6:19 PM, Krishna Kurapati wrote:

Hi,

>> +static int dwc3_renesas_rcar_gen5_init(struct dwc3_generic *dwc3g)
>> +{
>> +    struct device *dev = dwc3g->dev;
>> +    struct platform_device *pdev = to_platform_device(dev);
>> +    enum usb_device_speed speed = usb_get_maximum_speed(dev);
>> +    bool usb2only = false;
>> +    void __iomem *glue;
>> +
>> +    /* Wireless USB is not supported */
>> +    if (speed == USB_SPEED_WIRELESS)
>> +        return dev_err_probe(dev, -EINVAL, "Wireless USB not 
>> supported\n");
>> +
>> +    /* No USB 3 PHY in DT means this is surely USB 2 controller */
>> +    if (device_property_match_string(dev, "phy-names", "usb3-phy") < 0)
>> +        usb2only = true;
>> +
> 
> Why not just set the maximum-speed property to "high-speed" instead of 
> checking for "usb3-phy". That would be more clean.

Please see 1/2, maximum-speed DT property and the presence of the 
usb3-phy are both optional, hence this code. Also, this was discussed in 
previous version 2 of this patchset already.

>> +    if (speed >= USB_SPEED_LOW && speed <= USB_SPEED_HIGH)
>> +        usb2only = true;
> 
> And this check can be removed as well if we use "maximum-speed" property 
> in DT.

Please see above.

>> +
>> +    glue = devm_platform_ioremap_resource_byname(pdev, "glue");
>> +    if (IS_ERR(glue))
>> +        return PTR_ERR(glue);
>> +
>> +    /*
>> +     * The datasheet describes initialization procedure without full
>> +     * information about the registers. Therefore, the source code is
>> +     * based on the bare metal code shared by the board team.
>> +     */
>> +    writew(0x211, glue + 0x26);
>> +
>> +    /* USB2 does need additional register programming. */
>> +    if (!usb2only)
>> +        return 0;
>> +
>> +    writew(0x11, glue + 0x81c);
>> +    writew(0x0, glue + 0x81a);
>> +    writew(0x1, glue + 0x802);
>> +
>> +    usleep_range(10000, 20000);
>> +
>> +    writew(0x0, glue + 0x802);
>> +    writew(0x1, glue + 0x2a);
>> +    writew(0x1, glue + 0x81a);
>> +
>> +    usleep_range(10000, 20000);
>> +
> 
> Use #defines for register offsets and register values like in 
> dwc3_eic7700_init.

Please see the comment above this section, it clarifies why the magic 
numbers, and it was discussed in previous version 1 of this patchset too.
