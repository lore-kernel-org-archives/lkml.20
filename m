Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974112;
	b=pkp3yqwACG20zPp17iSlK/tNtoOz6N9vUIRkM5KQreiTa7jNvEKF7W2bPLDkE9fcWlOf
	 rVLND9vCkwcuQFVSI6/U9xWC5hiCwU9YQVkzDC6rnT/VsUoIwuKuveKJZVI1WaOh8GjCb
	 2v8Ejv+7VK3oXM4674tvts/wxJDe2NjDZB5iLRfpA/k4VgnO8M/W75wYndJVB+o0KdSy/
	 svDidn3rWBHi2mtpLtSgD1DL1nvs0zFMwevbvQ5eVKOhQ1/tNItmQR0EhUIVdw29Umj6M
	 Zu0WqrYhb8tg3BUm3y08TOW6UDhTH52GCObgcWdkLMWUOZAHhg88N6gh6zVcg0GnQ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974112;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-MBO-RS-ID:X-MBO-RS-META;
	bh=Wr0kFOMxYl9pteGhZNqQSKrR/oMCTxgBwG40hen/ECY=;
	b=xx1ZsBKgfsdHU8iLUXxzSkO+8l0C6OP6VgN+dyo2vRRrp94JTFxg0UVmeH7OflFKcYYB
	 LFuw65mOP9vUiCOAqN1xEKTV738IsPh/FOjiUfIscvJ0ON1wTDnUXN2SkEptIiEdtfL0G
	 hpknxMB3m+Dn60NZxs8efyjqp9ZES1hjeXil/P2WHP9LrPShGTKQX0h9D/KzZxwwu7f4Q
	 vdlHwZA+mKPQsCJGd9RLuAQ8LEOjthKN9sV+p/iPDQDC4RJlIQoY1e1klX71NTbRYDCZV
	 fz5hJag68vQ22MOOt1LUzXljgluDQ7yJ53iAafDieY3ZS89v4YzT+xB3rGw0Ndd0+dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=W0pjgows;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8FE606A329;
	Mon, 26 Oct 2026 00:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD8FE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=W0pjgows
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jCZ795nlXzMlLg;
	Mon, 26 Oct 2026 01:21:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792974101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wr0kFOMxYl9pteGhZNqQSKrR/oMCTxgBwG40hen/ECY=;
	b=W0pjgowsa19X+yxHDoKEjSezGjQsIi0oMxWMJvMU87WOwYrlD0u0aT4ji32aW8aRqll2Gc
	OUhUFBufvWO0Owy0fPlMd9lh2c42Ni63JZ7Ciy1nmpHQLGtR/rBM7hh7ANfvIIWmMYsYPh
	NfVJyMDK7rPEcVYbAGE4zd38pgQYCY7wRxqJpcECREZ1tYUI0VWes9gWJuEA3TLxA52TlZ
	/YWGYyJiO8++utmS8YrmvRwA6BPJhKxhFuMRajG6UAPdexfZLsqQPkuxucO/SgGRz//LdD
	IrlrWF5n1+SpXSebcSMBr194ijNKNBYwtwsbooZu3AXr/I6BGaOQ7InAKvHenw==
Message-ID: <be205518-ba8d-486f-b603-1d52321edc1a@mailbox.org>
Date: Mon, 26 Oct 2026 01:21:39 +0100
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
Subject: Re: [PATCH v7 2/2] usb: dwc3: dwc3-generic-plat: Add Renesas R-Car
 Gen5 DWC3 xHCI USB controller glue
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Thanh Quan <thanh.quan.xn@renesas.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20260903213031.314473-1-marek.vasut+renesas@mailbox.org>
 <20260903213031.314473-2-marek.vasut+renesas@mailbox.org>
 <aptP39nVZPFLgekY@vbox>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aptP39nVZPFLgekY@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 52bd3d68fc0077169a6
X-MBO-RS-META: 38abrunqgixa6dfgajjwr5tpxqwfm8xk

On 9/5/26 1:10 AM, Thinh Nguyen wrote:
> On Thu, Sep 03, 2026, Marek Vasut wrote:
>> From: Thanh Quan <thanh.quan.xn@renesas.com>
>>
>> The Renesas R-Car Gen5 SoC contains multiple instances of DWC3 USB
>> controller with glue logic wrapper around them. Extend the generic
>> DWC3 platform driver with Renesas R-Car Gen5 glue logic specifics.
>>
>> Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
>> Co-developed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

[...]

>>   static const struct of_device_id dwc3_generic_of_match[] = {
>>   	{ .compatible = "spacemit,k1-dwc3", &spacemit_k1_dwc3},
>>   	{ .compatible = "spacemit,k3-dwc3", },
>>   	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
>>   	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
>> +	{ .compatible = "renesas,rcar-gen5-dwc3", &renesas_rcar_gen5_dwc3},
>>   	{ .compatible = "starfive,jhb100-dwc3", },
>>   	{ /* sentinel */ }
>>   };
>> -- 
>> 2.53.0
>>
> 
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Hello everyone,

could these two patches possibly be picked up ? They should have all the 
necessary RB tags for about a month now.

Thank you !

(yes, I know everyone is flooded by emails recently, I apologize for 
making this worse for you)
