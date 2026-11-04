Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790255;
	b=WHoPiucKWWq0eN+97dddo0ipgMa9jzvqVqK63h3ItmjJPilFy/smdvlA2EqAhHdiEAt7
	 Dfd5dEMjxYF8vZusHYtU1mzu+vzd3G/BmSUdf2gkjtMZHp9Alvl0dcguGlvQQ4DZnZYZK
	 bYNKZhyigXLfvoXFvzO5r8LQhtUZuGd1AQwb8Dvf+JwCSrxzwp2AY9btTflYUEJ9pSI/O
	 GlCqDOQX+STjUjIO/BGdjP5UVwydGk4WKinOTPOAGiNZ84CCSrQpcmZVCGsSqSyTACM2J
	 qbX3Di5eZJevXwtuuCdzVgYJ6+pqdsQ3rMgSsSo2g4cO6W76VflOx99tBpl9zkxA0+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790255;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:Content-Language:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=di6PXeHB5ao9aED5rnI+MTd/fUST/3nbmo+6wj6cYKc=;
	b=s+Ujy9SE4vdliwBpNlAb1RfVVG7GJwCnSC5GU5s7bGUlLmWBie8vl5clTqnYKB2y1kJI
	 DNve2oKNVzZpsJIdz2Vic6edk5Jd2V+TlmRpEqfJC9h+wrNlh+gO9ztKH6rpCSaV13f5v
	 m6K7HstwtK2E76iZfIiryvPyhsxOeqlJ1YvgRGzWc5+H0SYYF+iVcoQzQUXHLOXTFeLjD
	 1CxdSloz+4ET5qJoNkStqla9wkoI2WLeF25vKrM1QPJp99b+Gdf3gRX2rA/K5Tq2llvii
	 dTvgCD1hpbWnQ8JU32bUkAseCpwFDqQOPwB8RXVSZirSERxT7xqMTTgu0PrBEsvY5yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RN68OluP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE08606A333;
	Wed,  4 Nov 2026 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RN68OluP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836381F000C1;
	Wed,  4 Nov 2026 11:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793790255;
	bh=di6PXeHB5ao9aED5rnI+MTd/fUST/3nbmo+6wj6cYKc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=RN68OluPXZoITcxHSrLsbOtsG8Ly5//ASQqc92i7xUl439vTmX5vX/nLHS2JUDixb
	 XBAAJCFj3HR1LJLIYT35y+wfcZ+kztwTZkMIjBpBgU6GDc7GpSyD1wow6zjgaVhlXc
	 VO/mxBFb01zcyIGsMgWZFJx4Pl+ieqn7dKV8ef2YYWy3REAV1Ivb7isYDdrD/944Oq
	 jcnBmWe2dhoZI7d/WfBQe/I9YSCD77PQkLUTea2ciL3rwJSRGA7Q5xmUDV5u9aG6wP
	 sfp+EhNE+XCtCYmg3yJKjMb7/TPhO8GeWraaTMqCX8xs0joCsRik1yzfAwWLZE0qPc
	 NXGm3Rei7+HpQ==
Message-ID: <02bde189-8ab3-4a39-8abf-0c61298f406d@kernel.org>
Date: Wed, 4 Nov 2026 12:04:04 +0100
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
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: cs42l42: Allow referenced
 dai-common properties
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261104-strict-precise-mouflon-85cbad@quoll>
 <f25646e3-d80e-4b26-b869-42608c89e665@kernel.org>
 <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <dD3cbQkjQr2lqk83ChC6wQ@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/11/2026 11:58, James Calligeros wrote:
> On Wednesday, 4 November 2026 8:52:38 pm Australian Eastern Standard Time 
> Krzysztof Kozlowski wrote:
>> On 04/11/2026 11:49, Krzysztof Kozlowski wrote:
>>> On Tue, Nov 03, 2026 at 05:39:50PM +1000, James Calligeros wrote:
>>>> We may need to define both #sound-dai-cells and sound-name-prefix on some
>>>> machines where this codec is part of a simple DAI. Allow this by
>>>> refrencing
>>>> dai-common.yaml and allowing its properties to be used.
>>>>
>>>> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>>>> ---
>>>>
>>>>  Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml | 5 ++++-
>>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
>>>> b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml index
>>>> ab4c7d22dc0e..4ac0af34c464 100644
>>>> --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l42.yaml
>>>> @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L42 audio CODEC
>>>>
>>>>  maintainers:
>>>>    - patches@opensource.cirrus.com
>>>>
>>>> +allOf:
>>>> +  - $ref: dai-common.yaml#
>>>> +
>>>>
>>>>  description:
>>>>    The CS42L42 is a low-power audio codec designed for portable
>>>>    applications.
>>>>    It provides a high-dynamic range, stereo DAC for audio playback and a
>>>>    mono
>>>>
>>>> @@ -193,7 +196,7 @@ required:
>>>>    - VL-supply
>>>>    - VA-supply
>>>
>>> Missing dai-cells constraint
>>
>> Heh, I already asked for this two weeks ago.
>>
>> I do not see how you responded to my comment, dropping everything from
>> DT patchwork.
>>
>> Best regards,
>> Krzysztof
> 
> Given that the binding did not have a constraint for this originally, it
> was my impression that adding one would best go in another patch unrelated
> to this series. If you think it's fine to add here then I can simply fix this
> for v5.

Can be separate patch preceding this one, because adding constraint
later would be an ABI break/impact.


Best regards,
Krzysztof
