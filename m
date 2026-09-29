Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9C73CBE8F;
	Tue, 29 Sep 2026 08:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670165; cv=none; b=RPq4zYwRGjA8pL5LnQOKQkKXgXrfKFABMHFgeUZbGuBJUfShbXGljfDD0LFKvq8/fmy0qtoKYPazoWunBz3LoqXI9tmwXq0s8IQ7lslHBrjShQrsw6DlCiq5QDp6dFKXkHq+aVQVMCVxf+/mDTyy/01m3BpPjmomdg3VAVMi+qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670165; c=relaxed/simple;
	bh=aKkdIvXeQZSBOa+VMzf2qsBs8GaO3qiegT97yYIzU2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EM+AbtP8E1OzCzA+96rx4iUrH6nkqRPLQ78+66LGzPa9LzUPOXnOMQcr/8AI0mpMi8gEGQYmvdCEQEd2bKSSjj8NejJCU0qp7UEi1fJaLqtBAV5fpPZ73IS7Hnr4a6nEZYn3vqTqhLu3UU1QsLeJOrjwik7vEVHME9m9dVTBFXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPuBDUrS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPuBDUrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD331F000FF;
	Tue, 29 Sep 2026 08:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790670163;
	bh=PsmqZe3TQMU5cZKZNwXvle0dprdwWkVMawn+HbAw/aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPuBDUrSeiaABXvDW6gpGZ1+q0GhXmn7NeNELj8DnoUF0/hf7YBUkffgOYi8nIPjI
	 6T9TFZF6CdoBGPc7oerO0e049xWhc2WSZoXK2Q04TmO1KT1S9kmq2v3YniSQjVRubb
	 4b+SmOjO37k4lgFvQUEWPGtrZsACxf5kw2Db9ze7XKad6GhBscQPTJlfQPndZEs+9n
	 VdUsw0IFz5hhMdvsrocP+S91pC5DcrV9XSNGvabpoRLXVAqhEQuh49dIevMl9Xwfc6
	 jJ2SPN4vthXZ/rP+OHOSIGVEuid0v29Lk1wJsOEv6EpYyHDW5YR1l1zeRekEmIjDBm
	 Y5N1DZxhCiaxg==
Date: Tue, 29 Sep 2026 10:22:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Maciej Strozek <mstrozek@opensource.cirrus.com>, linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v5 6/7] ASoC: dt-bindings: qcom: add Tambora WCD9378 SDCA
 codec
Message-ID: <20260929-eccentric-green-caribou-dfeb4b@quoll>
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925161049.758913-7-srinivas.kandagatla@oss.qualcomm.com>

On Fri, Sep 25, 2026 at 05:10:47PM +0100, Srinivas Kandagatla wrote:
> Describe the WCD9378 SoundWire peripheral which is SDCA compatible
> soundwire device. It provides SDCA SimpleJack for headphone playback
> headset mic capture and MBHC jack detection.
> 
> The same silicon is integrated in two ways and enumerates with the
> same SoundWire class ID:
> 
>   mobile mode: two slaves (tx, rx) on separate SoundWire masters.
> 
>   SDCA / compute mode: one aggregated slave on a multi-lane
>   master.
> 
> Note: both of them have different bus toplogies 1 device vs 2 devices.
> 
> Currently only compute mode is supported by this bindings, mobile mode
> will extend this binding as required.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,wcd9378-sdw.yaml      | 105 ++++++++++++++++++
>  1 file changed, 105 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/qcom,wcd9378-sdw.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

