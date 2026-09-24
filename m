Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7EE381E92;
	Thu, 24 Sep 2026 04:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790223236; cv=none; b=MU/6jf0o6m3voNMmGHxhS67mfqrJC0pjdYFVNIDay2B5kVSv2BDU4GmT1y/NOpdEUemCe09RoIyc/tdDgddaGpu0KRr8/5HntDSydT3rprJT2ZuFhcdGVqY9D0/roQKIrHG7vQKflmg9Dqpa3gyjjKDVVgaW8jpTSV4AVHEmY+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790223236; c=relaxed/simple;
	bh=xFS2DQH8a+QkjPOVxW75pwg7w718ejXKHRThOGnb0zk=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=fxfzsxbVgmMxs4GJZLGqMOT2/gcz9e5zMnsC2M+Ub/oFueh42oGtE+KJcC0t4dhNvWGVQro0URMpuF91Kgeop99TZ0gHqtta2QXOUjar76hDemwtMuvcqPSP22v4heR3rMalijt5+t+OCeyQgJ+hegSbqEKZvcnYhgJv+NBYKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=YDrJG1bm; arc=none smtp.client-ip=113.46.200.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="YDrJG1bm"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=81yO6Car8MHwRf3Bvrj4RVRvosAl9GnpSah8DBIW3BA=;
	b=YDrJG1bmelTa/8xqp49tYwTc49N49nkEI5yfp4SaDFakdoz5bMBzAdDPO2Do05y1Nnq8q3RdY
	XavZJxvPKSi1DUB9PfwUgZ2GmK2QsgwMA9E0TJ/0h9Bgb3mxJwCeWvejuw10x/E4RNQPN/JOCBx
	pj+gIug/GaImyUF9rQ4f6FQ=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4hr0Wj4CVgzmV98;
	Thu, 24 Sep 2026 12:01:37 +0800 (CST)
Received: from kwepemk200006.china.huawei.com (unknown [7.202.194.72])
	by mail.maildlp.com (Postfix) with ESMTPS id A1B334055B;
	Thu, 24 Sep 2026 12:13:42 +0800 (CST)
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemk200006.china.huawei.com (7.202.194.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 24 Sep 2026 12:13:42 +0800
Message-ID: <6AB4A375.2050004@hisilicon.com>
Date: Thu, 24 Sep 2026 12:13:41 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: hisilicon: Add HIP05 CPLD
References: <20260921232540.3128596-1-robh@kernel.org> <20260922-cheer-reference-c31fc6fb946d@spud> <20260923150409.GD27237-robh@kernel.org>
In-Reply-To: <20260923150409.GD27237-robh@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200006.china.huawei.com (7.202.194.72)

Hi Rob,

On 2026/9/23 23:04, Rob Herring wrote:
> On Tue, Sep 22, 2026 at 07:06:02PM +0100, Conor Dooley wrote:
>> On Mon, Sep 21, 2026 at 06:25:39PM -0500, Rob Herring (Arm) wrote:
>>> Add schema for the hisilicon,hip05-cpld node on the HIP05 D02 board. The
>>> node only contains the compatible string and one register window on the
>>> local bus.
>>>
>>> Assisted-by: LLM
>>
>> Guidance to the LLM should probably include including the reason that
>> this is being added to the commit message.
> 
> Not sure what you are looking for... I told it to convert all the .txt 
> bindings to schema. Then I told it fix all the errors. Then I fixed some 
> things throughout the 900 commit branch upstreaming things bit by bit.  
> Then it mostly sat for a year and I told a new model to review them and 
> fix these common problems a, b and c. Then I said fix all the 
> dtbs_checks warnings on arm64. Then I said there's still warnings, do it 
> again. Repeated that ~10 times. Now I'm going thru to weed out all the 
> wrong and sometimes unnecessary changes.
> 
> So LLM did all the easy parts and I did everything that requires any 
> judgement. The hardest part is typically just figuring out the 
> correct maintainers...
> 
>>> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>>> ---
>>>  .../soc/hisilicon/hisilicon,hip05-cpld.yaml   | 35 +++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
>>> new file mode 100644
>>> index 000000000000..f9d48b871a4b
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/soc/hisilicon/hisilicon,hip05-cpld.yaml
>>> @@ -0,0 +1,35 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/soc/hisilicon/hisilicon,hip05-cpld.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: HiSilicon HIP05 CPLD registers
>>> +
>>> +maintainers:
>>> +  - Wei Xu <xuwei5@hisilicon.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: hisilicon,hip05-cpld
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    local-bus {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <1>;
>>> +
>>> +        cpld@100000000 {
>>> +            compatible = "hisilicon,hip05-cpld";
>>> +            reg = <1 0x0 0x100>;
>>
>> Also what's with this example? 1 0x0 0x100 should be 0x1 0x0 0x100?
> 
> Shrug. Sure. Honestly, I think the example can just be dropped.
> 
> I'm converting all the crap no one cares enough about to convert. That's 
> pretty much all of the HiSilicon stuff. Mediatek needs some renewed 
> public shaming too. I only care about getting arm64 down to no warnings.

My bad for the warnings!
Thanks for working on this schema cleanup!

Best Regards,
Wei

> 
> Rob
> .
> 
