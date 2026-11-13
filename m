Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556196;
	b=dWJB+Jix5oqm0xGlrraWF29oupiSAa6I6d29q1xvjolmRT4ETSwu6urpxVX/rjLvH9Jv
	 TLPFRnVcX5DDmfbXIrN1jdM7nqt/E5aGSqM7KVf9m6NtA5e67Dd+iTppW9K7fM4UCR6mP
	 yNSX78AbmM/4/qHS2YDMoYtT3gbmvROG0L5pJNTy+En52skNguu+QPD3h8GFX0jeO2YJC
	 0c45rpb3kyZ1ekp1ct7LCCTI5Sc2KmH5KoTw/C1PJsZSA6kiUUd63ek3Iukl5H3GQ8JK/
	 K0IfsZhWp2UrAcsM/kFymDa1rh8iiRLa6N1jI55F/npJiFKMi2v4vT1mWvg4TFdWI2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556196;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=/UGO+TUxlocXzADNZ4hhNDhS1UF9RKNge9oTGNXBIBk=;
	b=M80CR+9Tjbtbo3vi3AiQ+uEM92bi9bd2q5jz28KrDTAcMePP7pO9KzIZ6/qoLeu6lfpj
	 49eNJGOQPz4EM5PwmrPnVhlK8lCjb30ZRFPpL4lIOACcVelDubDitsK3VAKbZ1+E9qrwR
	 Jfe1g74WgxcXyhWSPyr70RZ2V4Tq3ZQ8sLKYvf2NjXKvNP/JeJdZubFIrvvb78nRRTAMA
	 mDrSa4H9cIGPBOckYeD0HFtY1pICdQANRwMgenLEP0xuZ1fmKTF1eo/ENbcBQStbUd9Ld
	 vx+9XJjhA56/mwYBbkSITbe1OETKrxM13/KfxECMKUSAEmlaWdajq/3zfr+2B6/hANA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZPoSME/R";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8A4606A31C;
	Fri, 13 Nov 2026 07:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPoSME/R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4191F000C4;
	Fri, 13 Nov 2026 07:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556196;
	bh=/UGO+TUxlocXzADNZ4hhNDhS1UF9RKNge9oTGNXBIBk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ZPoSME/R7NAQTwd025SGMaQtwQBgiQ8PP8D2HkjqxpCyEZ3igd1/c93XGbzARTrVW
	 npdDjvzLZAkj8C3BA55JwNbbSa2geYbEgOOp6Cf+R9jNjQ+3YSl9ctWKv4MrP1gT66
	 /OEt9xWN3htNtg4CKq6sRhwbMlpkwt1y3j6VGnhpp9zjwFqaOwJA6h6fdIm6Ql7LMc
	 AUWroW4EI3JxfaRFl3KDIXMpF9xjPjsnWFRl6F/GlnP2CzsA8W4GhPg2s/Qy8w7KZX
	 Q239bKC0NPQoOAbZIQ3CsXgjJUTA0cfzhI1Ya8AgJb774qU6NbpIvJ21vJiC4YnjiC
	 R4u/jBllLicsQ==
Message-ID: <6f256993-24e5-457e-bcba-7bad2defc9ee@kernel.org>
Date: Fri, 13 Nov 2026 08:49:48 +0100
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
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Add Novatek NT37802
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jayant Shekhar <jshekhar@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261109-jshekhar-nt37802-v2-0-a8e9efdcabd7@oss.qualcomm.com>
 <20261109-jshekhar-nt37802-v2-1-a8e9efdcabd7@oss.qualcomm.com>
 <9b05fd08-7bfc-462b-81b8-a560350f4235@kernel.org>
 <c19f662d-8d04-47c9-a458-838e46521f2d@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <c19f662d-8d04-47c9-a458-838e46521f2d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/11/2026 10:37, Jayant Shekhar wrote:
> 
> On 09-11-2026 18:48, Krzysztof Kozlowski wrote:
>> On 09/11/2026 07:27, Jayant Shekhar wrote:
>>> Document the Novatek NT37802 AMOLED DSI command-mode panel.
>>>
>>> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
>>> ---
>>>   .../bindings/display/panel/novatek,nt37801.yaml    | 49 ++++++++++++++++++++--
>>>   1 file changed, 45 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>>> index 1b38c1d0af68..be318cc84d52 100644
>>> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>>> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37801.yaml
>>> @@ -4,26 +4,30 @@
>>>   $id: http://devicetree.org/schemas/display/panel/novatek,nt37801.yaml#
>>>   $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>   
>>> -title: Novatek NT37801 AMOLED DSI Panel
>>> +title: Novatek NT37801 and NT37802 AMOLED DSI Panels
>>>   
>>>   maintainers:
>>>     - Krzysztof Kozlowski <krzk@kernel.org>
>>>   
>>>   description:
>>> -  Naming is inconclusive and different sources claim this is either Novatek
>>> -  NT37801 or NT37810 AMOLED DSI Panel.
>>> +  Naming is inconclusive and different sources claim the NT37801 panel is
>>> +  either Novatek NT37801 or NT37810. The NT37802 panel uses the same common
>>> +  DSI interface and regulator supplies, and additionally requires EXVDD.
>> What is EXVDD supply? The example DTS suggests it is something fake.
> 
> 
> Its not fake, it would be something like below:

OK, how is the pin named on NT37802 side?

> 
>      display_panel_vdd: regulator-display-panel-vdd {
>          compatible = "regulator-fixed";
>          regulator-name = "display-panel-vdd";
>          regulator-min-microvolt = <1100000>;
>          regulator-max-microvolt = <1100000>;
>          startup-delay-us = <233>;
>          gpio = <&pmd8028_e1_gpios 2 GPIO_ACTIVE_HIGH>;
>          enable-active-high;
>          regulator-boot-on;
>          pinctrl-0 = <&sde_disp0_vdd_active>;
>          pinctrl-names = "default";

Looks like something for backlight honestly.

Best regards,
Krzysztof
