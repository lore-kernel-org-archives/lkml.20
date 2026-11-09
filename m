Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794245705;
	b=FVJ3fiNy1xgDagR2/FWaUKFx2ZO2QrW1iObNNYkgdtwJLqJ2F9CyY6B+76mu4zz6hD+D
	 tT1FC6aNynl9YlcfvGJoNbA958j25EcK4c9l37d/GxmEmIDk+gZjx9wAOpajZU7aB7Zbn
	 Y4wrtDxelT5HQ6qxw2NraY0qS9Cl+QLvVj2UpO7Dw9ICZzedQqJXg4+sVHf7w2pwzfRB2
	 QMEMEKwawD6t7bo8LosyI/MoxvzaB2DW6ua1vS5o2tBmwPYst6rLT8SY7bgjKfptwjmGb
	 M73VN/Tcbco54quXnrQYLMMT6yemqIDePpL6j4g60DF2Cqdh4Wz/n4yLgXIAyWWy6GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794245705;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=YWyZaiNe5GxohF5WpdTcbObCq/5yd0L96m7mUMGnuk0=;
	b=s4QkfB/wcXfrXOEDIDfMLcnftnirwq70RF7O4D4dymNMNI1JFyD/9tov+7qegCT0x3yW
	 yHnSeDjSJZCtrakBpAOdoA3KEXKdN10PYf64jlTeEeMD7x2kfvGmRyUC0ilzsRXLUlQWh
	 SXeoLCEp98kfvaPUqdcGEmcsAvqHRXAHiyPDtTJPvbuxNpk9RZhR7wl1SDC8vjCoOPKms
	 cIVVgqj7LZQHljjudXZxY6HPdXOGoop0ROgFir1isgZrPUJt+DWhpl/s4Xa8qx4iMsAYF
	 JBowkC786heMgsS/i5BHc51jlxGG6t81rsI6lojoei6otaFQ51ALoNqCi5pRo7cIjFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMq7DEim;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B5606A326;
	Mon,  9 Nov 2026 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mMq7DEim
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E561F0089F;
	Mon,  9 Nov 2026 17:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794245704;
	bh=YWyZaiNe5GxohF5WpdTcbObCq/5yd0L96m7mUMGnuk0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mMq7DEimjcUCIphKWzE6JxeOF01ABa/MvIAqjE9icP6aPUTsIz3PQC6apWI+V8P7a
	 dYZqfTJKygv48p6R0/+OAmXAxOY0xfc43X+ttiABghQOi5pkPQ8zaY1BVp2S6zdfM/
	 y3n7ulkWe3bvIEYqowOhCaSDu3rGs16PrHexI++6DrSddtOokoC/ui2b7aLhyAn5l1
	 oHM/VIJvWSU0fkWtV7dD5B0lVPLwCbCBSLFixB4qHqmBj5JgzqgVVZl4/VH+w7Goz8
	 jNU733/imcACns0SgZCL8EFIf++D5RTDpR9bwOdUfjcrdEyP4LYo/9xuZAGnEhsH73
	 ev/f5aXIVoOYg==
Message-ID: <65707815-7510-4f85-ba95-ec71b78fb6b2@kernel.org>
Date: Mon, 9 Nov 2026 18:35:00 +0100
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
Subject: Re: [PATCH 1/4] thunderbolt: add platform nhi driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-2-chunfeng.yun@mediatek.com>
 <179407827117.165429.11777170722243752189.b4-review@b4>
 <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <747061c1-def6-44ed-af18-18c4b7c2df09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/9/26 14:56, Konrad Dybcio wrote:
> On 11/7/26 8:04 PM, Sven Peter wrote:
>>> Add a new file plat.c to register platform NHI driver for MediaTek
>>> mt8901/mt8992 SoCs.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>>
>> [...]
>>
>>> +
>>> +static void nhi_plat_shutdown(struct platform_device *pdev)
>>> +{
>>> +	nhi_plat_do_remove(pdev, true);
>>> +}
>>> +
>>> +
>>> +#ifdef CONFIG_OF
>>> +static const struct of_device_id nhi_plat_of_match[] = {
>>> +	{ .compatible = "thunderbolt-platform" },
>> Do you already have hardware that probes via device tree? You'll have to
>> write bindings and get them reviewed before adding any compatible here.
>> Generic ones like you used here aren't usually allowed.
>>
>> If you don't have a dts based platform I'd probably drop this, not much of
>> this code here is e.g. re-usable for Apple since they like to think very
>> different, see my series in [1] that I can pick up again now that we
>> made progress on how to represent connections between the NHI and the
>> protocol adapters.
>>
>> Not sure about qualcom since I haven't seen a series for the NHI yet but
>> I'm sure Konrad can comment there. I kinda expect that it won't have
>> much shared code either.
> We're in the same boat regarding thinking different. This driver is
fun!

> for implementations where the underlying hardware is abstracted away
> (be it through architecture or intermediate firmware) and the TBT
> layer writes are enough to e.g. power sequence the connected buses,
> just like on Intel.
>
> For the OF compatible, we definitely do need bindings and I too would
> like to know if this is actually exercised - if not, we should cut it
> out and trivially bring it back when/if the need comes around.
Yeah, agreed, and ideally directly with a vendor,XXXX-thunderbolt 
compatible (or similar) only with the generic one (assuming the dt 
maintainers agree) as a fallback.



Sven

