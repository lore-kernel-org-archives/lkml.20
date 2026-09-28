Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8440D4973BC;
	Mon, 28 Sep 2026 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790590159; cv=none; b=fkEYz4QTctM4ypLB9GqNS9OjWw86hgN0H8q1VqMEdHR+oHvbiRQN7xPs8vbz0wzyvIPvwbC5numjqKXIkVq8yFxjDBT0WmIdW68TM/pDSw5JJ8MdVVShSpJFLul60sey6MW44TP5JkpGsx2OUUP89VyXz9PQF3oFw/LcIfnQsX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790590159; c=relaxed/simple;
	bh=QOlB+Ve1lrI+PADT4WdWPnC1Y6f+DhkHn8AuMkfc9eY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=of6S1eMG60JyP1qmEzRzd/EpQJGG859JsNRx3mjGn5X5qBLc+KQM2Uj1rXGAKo2FB+3opZ8jFMJTHRu3KRu/Ot2TKazcUNFiALWdzp164vbqiataMRkxT34CFP8QdzHCRTFaF+2Dq94gSLf/eags6cC4l1o6Zh06UyiVj6KKSLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LspRJsls; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LspRJsls"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC9B51F00893;
	Mon, 28 Sep 2026 10:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790590157;
	bh=0EIf1+bsuNHuJBjWhrdwCmhvHwe0cyWOx7FyP/jog+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LspRJslsOUOdXdTZrBDB15ym4YYHKG47E9hn8YNvI7yUnTkZAIcHHFI4/FOsdO2R8
	 66aJAmyB4BoVpt8BYwaxcBq9jnLnK8O+VXZ5eK80QMGDVS+os/eOHP/Y4vIphDyFKS
	 jLH1xe/+XeuCGw2eWT+MJDZw1xTRUd9OBMIP3qHz7GBz0VkG6tKA+9Xx8pPYFAM0OE
	 TxchTHpR478F+dR3eA2rUkUarRa9m+DzSRRtSofm8O4G7r1iYx9anw/e/mb70SOwOQ
	 0BJODh50rQVnPl6SOrw5dzjSo7lkXVVXWdlzYQg45ZPbkdnKP0VZ+zDdXWA+LX/dG2
	 MUC0wRv5KRgfw==
Date: Mon, 28 Sep 2026 12:09:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, alexey.klimov@linaro.org, r.mereu@arduino.cc, srini@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for pm4124-codec
Message-ID: <20260928-ancient-boar-of-persistence-629a9e@quoll>
References: <cover.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
 <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <566b4bc1822bc86a5844cbe1b2fe91d05b5ee9e4.1790114902.git.srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 22, 2026 at 11:11:24PM +0100, Srinivas Kandagatla wrote:
> From: Alexey Klimov <alexey.klimov@linaro.org>
> 
> Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
> Audio codec has TX and RX soundwire slave devices to connect to on-chip
> soundwire master.
> 
> Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
> properties in mfd qcom,spmi-pmic schema to complete the audio codec support.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> [Srini: reworked the patch]
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/mfd/qcom,spmi-pmic.yaml        | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index f6534e9e9912..d750da31ae3f 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -148,7 +148,15 @@ patternProperties:
>  
>    "^audio-codec@[0-9a-f]+$":
>      type: object
> -    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#

This had three compatibles:

> +    properties:
> +      compatible:
> +        contains:
> +          enum:
> +            - qcom,pm4125-codec
> +            - qcom,pm8916-wcd-analog-codec

This has only one from that list (+a new one).

This must have rationale in commit msg.

Best regards,
Krzysztof

