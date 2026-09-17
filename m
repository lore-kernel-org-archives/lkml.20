Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C57B299A82;
	Thu, 17 Sep 2026 06:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789625911; cv=none; b=tjg16Z6R4s954jsItRjQQU9yquwhrBSr7rhXTOF5sbC7vRPBJd6VCGARubDrhG4SqoNtwF60va/Z2Jzckig6x1GzAml/KVizS8kn5ZfBoM8v62URl0yWALDFIFxrct9n6AQsV9Zny9v6UEX6hDvhZ5NbhT05ZHmDu7RtqKBMQsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789625911; c=relaxed/simple;
	bh=y7O26wX2q7o0Uu6xp2XUCZicLzRVqOhSPHPFpiGgWRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F4ryduZN4lqcwYcfRWJndkRo3mUMweZs+lPmsCvkeVPLkOhMVg8dyi1K8pksBZOW03zJQM+ap2Qx1ZkewAGlANky9VltKIW+ctjeGaP4uFeSPIAO1gCJPxql3Oaooo5aMbIamt7JDZQQpsi7XvWXcEaqq+QaXUe8kbI3bTdAct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDvTuihE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDvTuihE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 405491F000FF;
	Thu, 17 Sep 2026 06:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789625909;
	bh=FNHA/zbG6zwjI2DywQHpJyLTUMHZc4DXRGOAOoHWjvw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=WDvTuihESGPH2aYy4srm9bjIJEMnvuJehmWcY720t1owGFYplyOJBz9Z62huqGjwR
	 vbdiUuFuVCR+p3GM8Ypn0Uu6yXZynqWJXufm62G7Xq2w15mrIhu1AViP0vdIOnMM7x
	 0u9nNOuZarEPk5lWwjOU+MqjhrlqWOh+VGqxi13v2o22P2lic4fL3qjpan+whnTMoC
	 dkjW41csaOJVOdDFqkmtWMzTw4Dn57OB0Zdr822QlM6lWhCxgzqSLTLROvvZd5zkSL
	 zZxXT7KxfLrExa6I4GiI3fNC/fVGFBhTsUPDgtLRiDg+JmwUopf5uZwI3SOfG5dC94
	 8YWgTu+gyldDw==
Message-ID: <f20daf57-88cf-44e1-a2af-8769d3500176@kernel.org>
Date: Thu, 17 Sep 2026 08:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Richard Leitner <richard.leitner@linux.dev>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll> <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org> <aqpYqrtKTY20IW_0@bombadil>
 <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
 <20260916165244.GB191870@killaraus.ideasonboard.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260916165244.GB191870@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2026 18:52, Laurent Pinchart wrote:
> On Wed, Sep 16, 2026 at 03:41:16PM +0200, Krzysztof Kozlowski wrote:
>> On 16/09/2026 11:01, Richard Leitner wrote:
>>> On Wed, Sep 16, 2026 at 10:35:22AM +0200, Krzysztof Kozlowski wrote:
>>>> On 16/09/2026 09:33, Richard Leitner wrote:
>>>>> Hi Krzysztof,
>>>>>
>>>>> thanks for the review!
>>>>>
>>>>> On Wed, Sep 16, 2026 at 09:00:46AM +0200, Krzysztof Kozlowski wrote:
>>>>>> On Tue, Sep 15, 2026 at 10:20:24PM +0200, Richard Leitner wrote:
>>>>>>> Add bindings for the Vision Components MIPI Camera Module Controller.
>>>>>>>
>>>>>>> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
>>>>>>> ---
>>>>>>>  .../vision-components,mipi-module-controller.yaml  | 92 ++++++++++++++++++++++
>>>>>>>  MAINTAINERS                                        |  7 ++
>>>>>>>  2 files changed, 99 insertions(+)
>>>>>>
>>>>>> This fails tests, so a very brief review / a few comments:
>>>>>
>>>>> Mea culpa, I simply failed to run the dtb check before submitting. Sorry.
>>>>> Will not happen again.
>>>>>
>>>>>>
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
>>>>>>> new file mode 100644
>>>>>>> index 0000000000000..2a031aea68457
>>>>>>> --- /dev/null
>>>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
>>>>>>> @@ -0,0 +1,92 @@
>>>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>>>> +%YAML 1.2
>>>>>>> +---
>>>>>>> +$id: http://devicetree.org/schemas/media/i2c/vision-components,mipi-module-controller.yaml#
>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>> +
>>>>>>> +title: Vision Components MIPI Camera Module Controller
>>>>>>> +
>>>>>>> +maintainers:
>>>>>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>>>> +  - Richard Leitner <richard.leitner@linux.dev>
>>>>>>> +
>>>>>>> +description: |-
>>>>>>> +  The MIPI camera module controller is an FPGA-based, I2C-accessible system
>>>>>>> +  controller found on MIPI camera modules from Vision Components. It abstracts
>>>>>>> +  the camera sensor behind a unified register interface, and controls and
>>>>>>> +  sequences the on-board power supplies and clocks.
>>>>>>> +
>>>>>>> +  The camera sensor abstraction is optional. The controller exposes a tunneled
>>>>>>> +  downstream I2C bus used by the attached image sensor. The controller node
>>>>>>> +  acts as the upstream device on the host bus, while child node below the
>>>>>>> +  controller represent the sensor device reachable through the tunnel.
>>>>>>> +
>>>>>>> +properties:
>>>>>>> +  compatible:
>>>>>>> +    const: vision-components,mipi-module-controller
>>>>>>
>>>>>> There is no model name, no version, nothing identifying it better?
>>>>>> Compatible must be specific to the device (see also writing bindings).
>>>>>
>>>>> There is one FPGA implemenation for all Vision Components MIPI camera
>>>>> modules AFAICT. So I have no idea how it could be more specific, TBH...
>>>>>
>>>>> Adding the FPGA hardware model/type is wrong IMHO as it depends on its
>>>>> configuration/firmware, not the hw.
>>>>>
>>>>> There are different versions of the configuration/firmware. But I think
>>>>> this is also not the correct way to distinguish those, or is it?
>>>>>
>>>>> According to their homepage the vendor calls those modules simply
>>>>> "VC MIPI" modules, which implies this FPGA controller is available on it.
>>>>> So maybe "vision-components,vc-mipi-controller" would be a better fit?
>>>>>
>>>>> Do you have any ideas/feedback on how improve this name?
>>>>
>>>> So there are different modules? I see several different names on:
>>>> https://www.mipi-modules.com/en/mipi-camera-modules/
>>>
>>> Yes, there are different modules, but all feature the same controller.
>>> Which this is basically the device driver binding for. So the idea is to
>>> describe the controller independently from the sensor which is "behind"
>>> it.
>>>
>>> This works because the controller "soft-core" should be the same on all
>>> modules. A downstream implemenation (which I haven't studied in detail)
>>> is available at https://github.com/VC-MIPI-modules/vc_mipi_core if that
>>> helps?
>>>
>>>>>>> +
>>>>>>> +  reg:
>>>>>>> +    maxItems: 1
>>>>>>> +
>>>>>>> +  '#clock-cells':
>>>>>>> +    const: 0
>>>>>>> +
>>>>>>> +  clock-frequency:
>>>>>>> +    description: Frequency of the sensor clock provided by the module
>>>>>>
>>>>>> Drop, implied by the compatible
>>>>>>
>>>>>
>>>>> Do you mean dropping the whole property, or just the "description"?
>>>>
>>>> I meant entire property, but we keep discussing in Laurent's reply.
>>>>
>>>>>>> +
>>>>>>> +  vcc-supply:
>>>>>>> +    description: Power supply of the module (3.3V)
>>>>>>> +
>>>>>>> +  '#address-cells':
>>>>>>> +    const: 1
>>>>>>> +
>>>>>>> +  '#size-cells':
>>>>>>> +    const: 0
>>>>>>
>>>>>> No children allowed, so why these two?
>>>>>
>>>>> Based on your and the bot feedback I would suggest for v2 to change this
>>>>> "generic i2c bus" to a simple "i2c-tunnel" property which has
>>>>> "$ref: /schemas/i2c/i2c-controller.yaml".
>>>>>
>>>>> This would better reflect the actual hardware, as there is only this one,
>>>>> in firmware hard-coded I2C downstream bus.
>>>>>
>>>>> Would this be a sane approach?
>>>>
>>>> If the underlying I2C bus and sensor are important, then yes. But I have
>>>> doubts that you need to describe the sensor if it is truly
>>>> unadressable/invisible to the OS.
> 
> To be clear, the sensor *is* addressable from the OS. The FPGA sits in
> the middle on the I2C bus instead of being a separate I2C device on the
> same bus as the sensor, but it forwards all I2C writes addressed to the
> sensor onto the backend I2C bus. This is why the DT binding is modelled
> with a child I2C bus. The sensor DT node is located on that node, and
> uses the regular DT bindings for the sensor.

Thanks, this should be explained in the description of the binding. It
does mention "the sensor device reachable through the tunnel" but the
rest about optionality of the sensor feels confusing in this case.

> 
>>> Yes, the I2C bus and sensor is important. The device driver of the sensor
>>> talks (via the tunneled I2C interface) directly to the sensor.
>>>
>>> The separate I2C controller/bus description is necessary as the tunneled
>>> I2C bus has some quirks unfortunately. Those need to be addressed as 
>>> otherwise the sensor drivers do not work.
>>>
>>> So the idea is to not have a vc-mipi module binding per "sensor variant"
>>> of the camera modules, but provide a common controller driver which
>>> provides the I2C bus for the sensor driver.
>>
>> Bindings must accurately describe the device and so far - based on the
>> website - there is no device as mipi-module-controller alone.
>>
>> I don't get why you assume that all of the variants are exactly
>> identical, thus sensor variant is not applicable.
>>
>> If they are identical in all aspects, then why clock-frequency property?
>> That's obviously rhetorical question, because they are not identical in
>> all aspects and must produce different clock at least.
> 
> The FPGA has an input clock whose frequency depends on the module. It

There is no "clocks" property in the binding. If there is input, then
there is a "clocks".

Then we never describe external oscillators with "clock-frequency"
property. ACPI does, but not DT.


> uses it for internal purpose, and also to provide a clock to the sensor.
> Very roughly speaking, and ignoring power supplies as we focus on the
> clocks, the camera module is architectured this way:
> 
> Connector
>    ||                                       +--------+
>    || <------------ MIPI CSI-2 ------------ |        |
>    ||               +-------+               |        |
>    || <--- I2C ---> |       | <--- I2C ---> | Sensor |
>    ||               | FPGA  |               |        |
>    ||               |       | --- Clock --> |        |
>    ||               +-------+               +--------+
>                         ^
>                         |
>                     +-------+
>                     | Clock |
>                     | Osc.  |
>                     +-------+
> 
> The frequency of the external clock oscillator is what the
> clock-frequency models.
> 
>>>>>>> +
>>>>>>> +required:
>>>>>>> +  - compatible
>>>>>>> +  - reg
>>>>>>> +  - '#clock-cells'
>>>>>>> +  - clock-frequency
>>>>>>> +  - vcc-supply
>>>>>>> +  - '#address-cells'
>>>>>>> +  - '#size-cells'
>>>>>>> +
>>>>>>> +unevaluatedProperties: false
>>>>>>
>>>>>> additionalProperties instead, see writing bindings or writing schema.
>>>>>> Unless you miss here some other schema $ref.
>>>>>>
>>>>>>> +
>>>>>>> +examples:
>>>>>>> +  - |
>>>>>>> +    i2c {
>>>>>>> +        #address-cells = <1>;
>>>>>>> +        #size-cells = <0>;
>>>>>>> +
>>>>>>> +        vc_mipi_ctrl: controller@10 {
>>>>>>> +            compatible = "vision-components,mipi-module-controller";
>>>>>>> +            reg = <0x10>;
>>>>>>> +            #clock-cells = <0>;
>>>>>>> +            clock-frequency = <37125000>;
>>>>>>> +            vcc-supply = <&cam_3v3>;
>>>>>>> +
>>>>>>> +            #address-cells = <1>;
>>>>>>> +            #size-cells = <0>;
>>>>>>> +
>>>>>>> +            i2c@0 {
>>>>>>> +                #address-cells = <1>;
>>>>>>> +                #size-cells = <0>;
>>>>>>> +
>>>>>>> +                vc_mipi_sensor: camera@60 {
>>>>>>> +                    compatible = "ovti,ov9281";
>>>>>>> +                    reg = <0x60>;
>>>>>>
>>>>>> Why having the child abstraction if it is completely abstracted? I don't
>>>>>> fully get the explanation from description. Completely optional means no
>>>>>> benefits, no point in it, no?
>>>>>
>>>>> I will try to improve the description. The idea behind this device
>>>>> driver/devicetree node is to not rely on the sensor abstraction from
>>>>> vision components, but to use the upstream sensor specific driver.
>>>>
>>>> You can use driver even without these nodes... but fine, let's assume
>>>> you have them, so driver will talk with OV9281 sensor for example?
>>>
>>> The vc-mipi driver does not talk to sensor at all. This is done by the
>>> dedicated sensor driver. The vc-mipi driver is only controlling the
>>> regulator, clock, etc. as described and sets up the "quirk aware"
>>> tunneled i2c interface.
>>
>> I meant, driver for the sensor. So who controls sensor supplies? Not the
>> sensor driver? It tells something how the hardware is managed, no?
> 
> Power supplies are managed in a similar way as the clock in the above
> diagram. There's one input supply to the camera module on the connector.
> Individual supplies for the sensor are generated from that main supply,
> and are controlled by the FPGA which exposes a register over I2C to
> enable/disable the supplies from the host (there's a single bit to
> enable/disable them all, they can't be controlled individually).
> 

Thanks, I see this also shown in the example DTS. I think the sensor
node is redundant here, but removing it would require moving all of this
to swnodes, so not that much better either. It's fine to keep the sensor
subnode for me.

Best regards,
Krzysztof
