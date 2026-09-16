Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D674A8FF7;
	Wed, 16 Sep 2026 13:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566096; cv=none; b=Nnyw//4BHSSrnAcQJXoh5UgDQMtZ0J1JUGpe79fSgLX7BFnxyUjwVBaRcXfp9eeMj8gszFhshghu8QG3xnf/Avhp/+OvtHz6nrRDExjKyi0MHY3LpeqhsPYEkt8GL9VNrUzScUudQ1OqN2ZVm92ZPqoZl/GTRdWx1RobrZHzbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566096; c=relaxed/simple;
	bh=Y23TEL4VWjKk050EFd+EMGfECRJpcBc/J1ICpp2a8AI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHskPlc336nG6v6816cXD+9Kj4DwJHp4QbznZRM/0pAYytbzsV8sSh2orvRI7of9R6P6wYN85kMurXXNH4puz/zGgvO02ZPL52udAITQDa3WzC5lXhPmkPUESsN6bglSYHKrMEcg3fPA/5Qymt/eFfNjZ9sW1e3c98THusfFunU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEPFaEgt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEPFaEgt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 532331F000FF;
	Wed, 16 Sep 2026 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789566083;
	bh=ty9HMdXm16jh0iP7vayc+uF466KQcdah8P1bvXP44aE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LEPFaEgt6q0wI/3g+F7g5JB59ceU28bS71D9rlo/TgyOvOPdq6tngHXVAp5PIrjfo
	 PZdeE+4F89B/p8qpwwn4iPGTVxh55iZkfso0rEPHVwYvghgRVy2rlDziRgzyjxEPRJ
	 BAS09hfxkS8bUzwoyM+Oirvz7l5CuzA0mOhCpY6HIVUNNY4FUZIzCrBeCWgIlQJjYJ
	 oUSh0WsEDReUhKFzZ1h7gCQVLpxWXu6K6M1nl5IcZJTWiV4p7NzjxjDPa4vYRhKDIF
	 ARSyizhnC9X1BjGy4CE/XgbZgzNwXJCNNXBV04IT92kX1Bhi2klOUXrVeab/5vHKsH
	 5w4MU3NXIiOLw==
Message-ID: <a46e3ea2-8a21-4b9c-a112-99d249f46e99@kernel.org>
Date: Wed, 16 Sep 2026 15:41:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: media: i2c: Add
 vision-components,mipi-module-controller
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20260915-vc-mipi-ctrl-v1-0-8a42b693d889@linux.dev>
 <20260915-vc-mipi-ctrl-v1-2-8a42b693d889@linux.dev>
 <20260916-daft-relaxed-mouse-9bfaf4@quoll> <aqpC8fxO4F3bFjF4@bombadil>
 <45fd8255-6ba8-4488-acc8-4f7fc9c85ade@kernel.org> <aqpYqrtKTY20IW_0@bombadil>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <aqpYqrtKTY20IW_0@bombadil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/09/2026 11:01, Richard Leitner wrote:
> On Wed, Sep 16, 2026 at 10:35:22AM +0200, Krzysztof Kozlowski wrote:
>> On 16/09/2026 09:33, Richard Leitner wrote:
>>> Hi Krzysztof,
>>>
>>> thanks for the review!
>>>
>>> On Wed, Sep 16, 2026 at 09:00:46AM +0200, Krzysztof Kozlowski wrote:
>>>> On Tue, Sep 15, 2026 at 10:20:24PM +0200, Richard Leitner wrote:
>>>>> Add bindings for the Vision Components MIPI Camera Module Controller.
>>>>>
>>>>> Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
>>>>> ---
>>>>>  .../vision-components,mipi-module-controller.yaml  | 92 ++++++++++++++++++++++
>>>>>  MAINTAINERS                                        |  7 ++
>>>>>  2 files changed, 99 insertions(+)
>>>>
>>>> This fails tests, so a very brief review / a few comments:
>>>
>>> Mea culpa, I simply failed to run the dtb check before submitting. Sorry.
>>> Will not happen again.
>>>
>>>>
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
>>>>> new file mode 100644
>>>>> index 0000000000000..2a031aea68457
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/media/i2c/vision-components,mipi-module-controller.yaml
>>>>> @@ -0,0 +1,92 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/media/i2c/vision-components,mipi-module-controller.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Vision Components MIPI Camera Module Controller
>>>>> +
>>>>> +maintainers:
>>>>> +  - Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>>> +  - Richard Leitner <richard.leitner@linux.dev>
>>>>> +
>>>>> +description: |-
>>>>> +  The MIPI camera module controller is an FPGA-based, I2C-accessible system
>>>>> +  controller found on MIPI camera modules from Vision Components. It abstracts
>>>>> +  the camera sensor behind a unified register interface, and controls and
>>>>> +  sequences the on-board power supplies and clocks.
>>>>> +
>>>>> +  The camera sensor abstraction is optional. The controller exposes a tunneled
>>>>> +  downstream I2C bus used by the attached image sensor. The controller node
>>>>> +  acts as the upstream device on the host bus, while child node below the
>>>>> +  controller represent the sensor device reachable through the tunnel.
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: vision-components,mipi-module-controller
>>>>
>>>> There is no model name, no version, nothing identifying it better?
>>>> Compatible must be specific to the device (see also writing bindings).
>>>
>>> There is one FPGA implemenation for all Vision Components MIPI camera
>>> modules AFAICT. So I have no idea how it could be more specific, TBH...
>>>
>>> Adding the FPGA hardware model/type is wrong IMHO as it depends on its
>>> configuration/firmware, not the hw.
>>>
>>> There are different versions of the configuration/firmware. But I think
>>> this is also not the correct way to distinguish those, or is it?
>>>
>>> According to their homepage the vendor calls those modules simply
>>> "VC MIPI" modules, which implies this FPGA controller is available on it.
>>> So maybe "vision-components,vc-mipi-controller" would be a better fit?
>>>
>>> Do you have any ideas/feedback on how improve this name?
>>
>> So there are different modules? I see several different names on:
>> https://www.mipi-modules.com/en/mipi-camera-modules/
> 
> Yes, there are different modules, but all feature the same controller.
> Which this is basically the device driver binding for. So the idea is to
> describe the controller independently from the sensor which is "behind"
> it.
> 
> This works because the controller "soft-core" should be the same on all
> modules. A downstream implemenation (which I haven't studied in detail)
> is available at https://github.com/VC-MIPI-modules/vc_mipi_core if that
> helps?
> 
>>
>>
>>>
>>>>
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  '#clock-cells':
>>>>> +    const: 0
>>>>> +
>>>>> +  clock-frequency:
>>>>> +    description: Frequency of the sensor clock provided by the module
>>>>
>>>> Drop, implied by the compatible
>>>>
>>>
>>> Do you mean dropping the whole property, or just the "description"?
>>
>> I meant entire property, but we keep discussing in Laurent's reply.
>>
>>>
>>>>> +
>>>>> +  vcc-supply:
>>>>> +    description: Power supply of the module (3.3V)
>>>>> +
>>>>> +  '#address-cells':
>>>>> +    const: 1
>>>>> +
>>>>> +  '#size-cells':
>>>>> +    const: 0
>>>>
>>>> No children allowed, so why these two?
>>>
>>> Based on your and the bot feedback I would suggest for v2 to change this
>>> "generic i2c bus" to a simple "i2c-tunnel" property which has
>>> "$ref: /schemas/i2c/i2c-controller.yaml".
>>>
>>> This would better reflect the actual hardware, as there is only this one,
>>> in firmware hard-coded I2C downstream bus.
>>>
>>> Would this be a sane approach?
>>
>> If the underlying I2C bus and sensor are important, then yes. But I have
>> doubts that you need to describe the sensor if it is truly
>> unadressable/invisible to the OS.
> 
> Yes, the I2C bus and sensor is important. The device driver of the sensor
> talks (via the tunneled I2C interface) directly to the sensor.
> 
> The separate I2C controller/bus description is necessary as the tunneled
> I2C bus has some quirks unfortunately. Those need to be addressed as 
> otherwise the sensor drivers do not work.
> 
> So the idea is to not have a vc-mipi module binding per "sensor variant"
> of the camera modules, but provide a common controller driver which
> provides the I2C bus for the sensor driver.

Bindings must accurately describe the device and so far - based on the
website - there is no device as mipi-module-controller alone.

I don't get why you assume that all of the variants are exactly
identical, thus sensor variant is not applicable.

If they are identical in all aspects, then why clock-frequency property?
That's obviously rhetorical question, because they are not identical in
all aspects and must produce different clock at least.


> 
>>
>>>
>>>>
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - '#clock-cells'
>>>>> +  - clock-frequency
>>>>> +  - vcc-supply
>>>>> +  - '#address-cells'
>>>>> +  - '#size-cells'
>>>>> +
>>>>> +unevaluatedProperties: false
>>>>
>>>> additionalProperties instead, see writing bindings or writing schema.
>>>> Unless you miss here some other schema $ref.
>>>>
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    i2c {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        vc_mipi_ctrl: controller@10 {
>>>>> +            compatible = "vision-components,mipi-module-controller";
>>>>> +            reg = <0x10>;
>>>>> +            #clock-cells = <0>;
>>>>> +            clock-frequency = <37125000>;
>>>>> +            vcc-supply = <&cam_3v3>;
>>>>> +
>>>>> +            #address-cells = <1>;
>>>>> +            #size-cells = <0>;
>>>>> +
>>>>> +            i2c@0 {
>>>>> +                #address-cells = <1>;
>>>>> +                #size-cells = <0>;
>>>>> +
>>>>> +                vc_mipi_sensor: camera@60 {
>>>>> +                    compatible = "ovti,ov9281";
>>>>> +                    reg = <0x60>;
>>>>
>>>> Why having the child abstraction if it is completely abstracted? I don't
>>>> fully get the explanation from description. Completely optional means no
>>>> benefits, no point in it, no?
>>>
>>> I will try to improve the description. The idea behind this device
>>> driver/devicetree node is to not rely on the sensor abstraction from
>>> vision components, but to use the upstream sensor specific driver.
>>
>> You can use driver even without these nodes... but fine, let's assume
>> you have them, so driver will talk with OV9281 sensor for example?
> 
> The vc-mipi driver does not talk to sensor at all. This is done by the
> dedicated sensor driver. The vc-mipi driver is only controlling the
> regulator, clock, etc. as described and sets up the "quirk aware"
> tunneled i2c interface.

I meant, driver for the sensor. So who controls sensor supplies? Not the
sensor driver? It tells something how the hardware is managed, no?
> 
Best regards,
Krzysztof
