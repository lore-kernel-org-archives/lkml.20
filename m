Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1160F37BE64;
	Sat, 17 Oct 2026 16:32:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792254738; cv=none; b=HRrxMtfJtvZeXjn877lk9Kgi5j9Zi3AH7FG61+qzuVyfZ7Lnr5+ajtfsTsPEFaqMI1RtW0cbE47kT86w6aX1za7tjr/ZswkGKbXoot8BLHzcWZSA3oQRXAMe+dIwlZ6VB5CqUV4Hp2MvJV+jbJB8DxYBGnJGPCj9rkOWRbSQXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792254738; c=relaxed/simple;
	bh=6aArWhdUyT7JOEHGG/p/CF2AWoy197eosIqZXtgGF0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5hilGBYr35gRmcGamCbcYDFPDmhgj+jLpL0RSlF1WJISDN0sr+cLYYq7VkIq3ueSMCslLm3gt5Xe/qEzPgQ9mCX6hDyLTQMvXVYClGvdWrOvQnu0Y2D0ziPJS3beyPQGPIlEBHig9fRUkHq5KMGywG8xVWShZHlZ7qr0oJIUWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHltJ8sm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHltJ8sm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3E71F000C5;
	Sat, 17 Oct 2026 16:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792254737;
	bh=LiCBouRtEdVUhIhRFH26iTaGqUiyrApY9i75/37ninQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WHltJ8smM5clEoJ9t9KOHhurwVsxDf6ToNDmNzaEKJh2Vx03Hzp0JNzueQJIVOjvT
	 qFxOawj4XP9WqB5ZGvHq5GY6+fcrMeId3Z0vUggXetkgJb2R/jHDsjMyOjNQfZGqHr
	 GvnAi42qvAmoAHK6El3zQZHpoumbx5x+KTOPjBUsoJ9ZEIQq5lqSTYGFxZKBGzIzV7
	 S4NRMMrC91IfNkCKIgQmYwPaYoiuvYrJ6e9OFixmErKnEt+GQ+YEebAZPawSb3UKiJ
	 8qtgKqkukIz4nTpzvlkayYMcWTUQZCAFuShCFHZ4SdlsXWrDJm+RyYZ49nmBNj+RbJ
	 f8CkQsGMiPikw==
Date: Sat, 17 Oct 2026 18:32:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: Re: [PATCH v5 7/9] ASoC: dt-bindings: qcom: Add Maili LPASS macro
 codecs
Message-ID: <20261017-vivid-chubby-chimpanzee-c31c56@quoll>
References: <20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com>
 <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-add_shikra_support_v5-v5-7-fb9f0667e613@oss.qualcomm.com>

On Wed, Oct 14, 2026 at 02:42:53PM +0530, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Add compatibles for the RX, TX and VA macro codecs found in the Low
> Power Audio SubSystem (LPASS) of the Qualcomm Maili SoC.
> 
> The Maili RX, TX and VA macros are identical to their Hawi counterparts,
> so document them with the corresponding Hawi compatible as fallback.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml | 4 ++++
>  Documentation/devicetree/bindings/sound/qcom,lpass-tx-macro.yaml | 4 ++++
>  Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml | 4 ++++
>  3 files changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> index 142955b85..41b578f83 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-rx-macro.yaml
> @@ -29,6 +29,10 @@ properties:
>                - qcom,sm8750-lpass-rx-macro
>                - qcom,x1e80100-lpass-rx-macro
>            - const: qcom,sm8550-lpass-rx-macro
> +      - items:
> +          - enum:
> +              - qcom,maili-lpass-rx-macro
> +          - const: qcom,hawi-lpass-rx-macro

h < s, thus this list should be placed before above one using sm8550
fallback.

Best regards,
Krzysztof

