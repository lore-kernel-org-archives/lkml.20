Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8E03559D6;
	Sun, 20 Sep 2026 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929967; cv=none; b=PKYQx5opBeo4lDHqx9EEQsHtxlJqsFktRm3+QX/E6kT1ItauFgncaxjD9Y0MhOjLw6F/8rZi9Im2Fht9Eog71qfOHx6awVtySHMep3Mwoi3y8PL7uvLFh5rgT/iNyyd9qtXA7wcQAZncN5AvMZDP7beSaMAuA21B8Q2nVm8p+R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929967; c=relaxed/simple;
	bh=Q3uMs1G6z74jTt5qeS31A+mvx2NgAtq7cA44lxi9nrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJDSO/HEy9MQAh4nn5QTQuN84BKmr+hxdTDr42YVOR5BfF36iK2LAF5C7+/mzoGbRZ1zgcO7GORdF/ByndQcvJPwfqEuwSQUn90/jeh6DwyI/dsraRoJAEGScy02s5NHugKocJjtr/PlxJQ5zj5E6CtCdED7k0XVCZb91NPMtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IECg6RA8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IECg6RA8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 431801F000FF;
	Sun, 20 Sep 2026 18:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789929965;
	bh=7ynaufQVtyfTr5NQ4iLsrxfZxiHcy95lGY5BmduC6Mo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IECg6RA8t5Y5NM/O2OoL6T2FKPBTNxPWYMFFG5dVV6UPBJlyurapze0Oxk9g14wsT
	 BA6iMjkH6lhbW6ktnVI8U+D2PwRwruPh8xo/e42R0FJIibymnZmCTZuWT44yysLemY
	 RAV6b0ezBUx5FQlFEP58xX2ToCAgJSSGvhQvIAZ0CA8UWcNDfbl1Du3koLWv1dhDeL
	 LJdq+MapRumNtkV/j7xWJ/XxzbvxLeLN4D6Ua+9gV+rinWDUswdKlTUj6LYnxWqsO+
	 HRiVrUM/J9T3Bdm3VK425koantZzNKVn4Z+NLlRu3tsM9cXf0OSGU+U639KHGcTVs+
	 NWzZzI53CAtew==
Message-ID: <7074efa0-17f3-45f9-9cde-301f81c68005@kernel.org>
Date: Sun, 20 Sep 2026 20:45:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/28] dt-bindings: sound: Add Apple Macs sound
 peripherals
To: James Calligeros <jcalligeros99@gmail.com>,
 =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260920-macaudio-v1-1-741cc20a74e5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 20.09.26 06:53, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> Add binding for Apple Silicon Macs machine-level integration of sound
> peripherals.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   .../bindings/sound/apple,macaudio.yaml   | 235 +++++++++++++++++++++++++
>   1 file changed, 235 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/apple,macaudio.yaml b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> new file mode 100644
> index 000000000000..bd844c9928c9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/apple,macaudio.yaml
> @@ -0,0 +1,235 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/apple,macaudio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sound peripheral integration for Apple Silicon Macs
> +
> +description:
> +  This binding represents the overall machine-level integration of sound
> +  peripherals on Apple Silicon Macs, starting with the M1 series.
> +
> +maintainers:
> +  - James Calligeros <jcalligeros99@gmail.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - description: First-of-their-kind machines
> +        items:
> +          - enum:
> +              - apple,j180-macaudio
> +              - apple,j274-macaudio
> +              - apple,j293-macaudio
> +              - apple,j313-macaudio
> +              - apple,j314-macaudio
> +              - apple,j316-macaudio
> +              - apple,j375-macaudio
> +              - apple,j413-macaudio
> +              - apple,j415-macaudio
> +              - apple,j473-macaudio
> +              - apple,j456-macaudio
> +              - apple,j457-macaudio
> +          - const: apple,macaudio

We've had some not-so-great experiences with these generic compatibles 
in the past. I'd just drop it.



Sven

