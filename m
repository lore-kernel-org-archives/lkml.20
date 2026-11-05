Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.251.158.245
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841929;
	b=yPoHlXImeufvN8NQSOJ3R8KvaeBfgd6tfK5gEFfxaSi6h6CHYHTLTGec0zThpnrnyTmS
	 ec1aEguTNVWu9KKvUHp/DhhLjqBkpJTNodntCbweadOwLe/nI153JNWoFuigM9qbT9paY
	 x/38fTXcC3ZaJPfuGYTT5aE2XMRJTNnrxowkGlZxbJZ9+z/QeODOvkpr9ZFHZoGOCnLSa
	 4kUIdQzOnBj4iBm7WgA1bVfDlJg0Jdlm+2Lv2zrxW+6XKtXfx6/RszsnqJto1i72tRdZv
	 CHpS4iUbpVFl2v6YNmjdtzQKTFjVR7jT9xCFB048JbxjQsldMGpy/ypUj9pzf/9OZ3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841929;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=47pBX+XIRrJ0Jv29ifqJcO1ihQ9vYRFpgynj99Xgx+U=;
	b=G9VsGYjvXORGuiRD3tE0GdufF04mVx+NTpAHfGBCRvaiXCRQ9dBWS9cMQMoJALD1BrtH
	 Dpv20gUbWsi8sxIt+7nkmOApLZ/U1qU5mwIId20QkrptwBGJSzdI0r47I0hSdyvbChjOa
	 IUbN4SMCAgq+76eoi/hVAB2i7uARrOZSJyBGNu0QdlZCfOYUgib3M35ccAYPcd3jLXsbM
	 26pg21Xn8voMz+QUJV1Y0wdaN3jdsKibK1jTzLGFN9CYhCYxp6NVg2SFi6O3geZXay//t
	 k+PWw2ipdNDeLFDWNrftDKCzliuzWgKCWQcgZypfAwl5XJJFThe+15WwxutgiQxuLzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rock-chips.com;
	spf=pass smtp.mailfrom=rock-chips.com;
	dkim=pass header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Jke6lpX2;
	arc=none smtp.remote-ip=47.251.158.245
Received: from mail-m158245.netease.com (mail-m158245.netease.com [47.251.158.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54BED606A326;
	Thu,  5 Nov 2026 01:25:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54BED606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=Jke6lpX2
Received: from [192.168.10.59] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 538ad90f8;
	Thu, 5 Nov 2026 09:25:14 +0800 (GMT+08:00)
Message-ID: <b7a8d79a-e7aa-47fd-8e13-fcab3c569f3d@rock-chips.com>
Date: Thu, 5 Nov 2026 09:25:14 +0800
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
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: rk3308-codec: describe
 detection and ADC routing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: broonie@kernel.org, heiko@sntech.de, linux-sound@vger.kernel.org,
 luca.ceresoli@bootlin.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 huangtao@rock-chips.com, sugar.zhang@rock-chips.com, lxt@rock-chips.com,
 xing.zheng@rock-chips.com
References: <20261101040125.1864141-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-1-zhengxing@rock-chips.com>
 <20261101044149.2018744-2-zhengxing@rock-chips.com>
 <20261104-russet-stingray-of-penetration-fef32e@quoll>
Content-Language: en-US
From: Xing Zheng <zhengxing@rock-chips.com>
In-Reply-To: <20261104-russet-stingray-of-penetration-fef32e@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1a94f62d503a8kunm3302c1553a4f86
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaGUlLVkIeTE5DSEJLTh8YHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=Jke6lpX2hUcGBQW1uErFR7KPQfm1ZK26Tvfeft14fFOY+YOyR9WysNPgbUfvBBcCjye0a7+VabPo7cPaOqAIXAMF6SBhy/HScjGv77ILivjZ+Xyn0hHa/ItBbISUtyQ15qhOP2qnhMuSji9ndwVqdavDGA/wDAmGYjWwUhriFWw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=47pBX+XIRrJ0Jv29ifqJcO1ihQ9vYRFpgynj99Xgx+U=;
	h=date:mime-version:subject:message-id:from;

Hi Krzysztof,

On 11/4/26 21:10, Krzysztof Kozlowski wrote:
> On Sun, Nov 01, 2026 at 12:41:47PM +0800, Xing Zheng wrote:
>> Describe the optional detect-GRF phandle and named interrupt resources
>> used by the B/C headphone detector. Retain the legacy interrupt order
>> and index-based lookup when names are absent. Document the detector
>> disable and reversed-jack properties and their resource dependencies.
>>
>> Describe the ADC stereo-group routing consumed by the codec driver.
>> Require four unique group IDs in the range 0-3, in I2S2 SDI order,
>> matching the driver's validation. Leave GRF routing unchanged when
>> the property is absent.
>>
>> Extend the example with headphone-detection resources and ADC routing.
>> Keep machine-driver amplifier GPIOs and debug interfaces outside this
>> codec binding.
>>
>> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
>> ---
>> Changes in v2:
>> - Retain the original detection descriptions and legacy IRQ ordering.
>> - Keep the binding change in its own patch before the codec change.
>>
>>   .../bindings/sound/rockchip,rk3308-codec.yaml | 55 +++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
>> index 2cf229a076f0..60c6140dc5df 100644
>> --- a/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
>> +++ b/Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.yaml
>> @@ -36,6 +36,49 @@ properties:
>>       description:
>>         Phandle to the General Register Files (GRF)
>>   
>> +  rockchip,detect-grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to the detection GRF used for headphone insertion and
>> +      removal interrupts on codec revisions B and C.
>> +
>> +  interrupts:
>> +    description:
>> +      Keep the legacy interrupt order. If interrupt-names is omitted,
> What is legacy interrupt order? There are no interrupts here, so how
> could there be anything legacy?
You are right. This ordering came from the downstream BSP, not from
an existing upstream binding. There is no upstream compatibility
requirement for it, and calling it "legacy" here was misleading.
>> +      the driver uses the second interrupt for B/C headphone detection.
>> +    items:
>> +      - description: Legacy codec headphone detection interrupt
>> +      - description: Detection GRF headphone interrupt for revisions B and C
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: codec
>> +      - const: hpdet
> Why same device has both GRF to detect headphones and interrupts?
In the proposed B/C detector implementation, the detect-GRF phandle
provides access to the detector's configuration, status and interrupt
acknowledgement registers. The hpdet IRQ notifies the driver of an
event, after which it reads and acknowledges the status through that
regmap. These are register access and event notification for the same
detector, rather than two independent detection mechanisms.

Separately, the two-interrupt layout was copied from the downstream
DT. The proposed driver only requests hpdet (or index 1 without names)
and skips detector setup on revision A; it does not use the first
"codec" IRQ. Retaining that layout merely for downstream index
compatibility was not a sufficient justification for a new binding.
>> +
>> +  rockchip,no-hp-det:
>> +    type: boolean
>> +    description: Disable the internal headphone detector.
>> +
>> +  rockchip,hp-jack-reversed:
>> +    type: boolean
>> +    description: Reverse the headphone detection polarity.
>> +
>> +  rockchip,adc-grps-route:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +    description: |
>> +      ADC stereo-group mapping to the four I2S2 SDI inputs. Each entry
>> +      selects the ADC group connected to the corresponding SDI input,
>> +      in SDI0 through SDI3 order. Group IDs 0 through 3 represent
>> +      MIC1/MIC2, MIC3/MIC4, MIC5/MIC6 and MIC7/MIC8 respectively.
>> +      All four groups must appear exactly once. For example, <1 2 3 0>
>> +      connects groups 1, 2, 3 and 0 to SDI0, SDI1, SDI2 and SDI3.
>> +      If omitted, the GRF routing is left unchanged.
>> +    minItems: 4
>> +    maxItems: 4
>> +    uniqueItems: true
>> +    items:
>> +      enum: [ 0, 1, 2, 3 ]
> Why are all the rockchip properties before clocks, not next to other
> rockchip properties? What logic drives this placement?
There was no good reason for that placement. The vendor properties
should be grouped consistently with the other rockchip properties,
with the standard interrupt properties kept separate.
>> +
>>     clocks:
>>       items:
>>         - description: clock for TX
>> @@ -72,6 +115,12 @@ properties:
>>   
>>       enum: [ 50, 55, 60, 65, 70, 75, 80, 85 ]
> Best regards,
> Krzysztof
>
I am putting this series on hold while I investigate playback and
capture problems observed on our EVB with upstream codec changes
backported to our downstream 6.12 kernel.

Before these backports, sound/soc/codecs/rk3308_codec.c and .h matched
the upstream versions at 2ba2d17170f9 ("ASoC: codecs: rk3308: fix
building without CONFIG_OF"). On top of that codec baseline, I applied
the following upstream commits:

   2d8a091725e6 ASoC: codecs: rk3308: convert to snd_soc_dapm_xxx()
   0c55552b5f5e ASoC: codecs: rk33*: use .auto_selectable_formats
   157f7cba77a9 ASoC: codecs: rk3308: add support for codec revision B

I also backported a1c99b6097af ("ASoC: soc-component: add
snd_soc_component_to_dapm()") for the DAPM accessor used by the
converted driver. These are upstream commit IDs; the rest of the
kernel remains based on downstream 6.12.

I have not yet determined whether the playback and capture issues
are in the upstream driver or in the backport/integration.

I will rework any necessary changes against the current upstream base
and validate playback and capture on the EVB before resubmitting.
Depending on the remaining scope, I will send either a revised v3 of
this series or a separate, focused patch or series. In either case,
the submission will start a new thread and reference the earlier
series where relevant.

Any binding changes retained in a future submission will address your
comments above and include the relevant hardware justification.

Thanks again for your time.

Best Regards
Xing Zheng

