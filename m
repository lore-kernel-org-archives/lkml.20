Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAFB3B14B3;
	Thu, 27 Aug 2026 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787830503; cv=none; b=JBwUe3IMWlppAbFwe55mO3EJXpe0PhIOhnzOtThiyVEeyED0wjsjJC3pHaR/yhnYyyOpTaXTSvMR8838QPYbkWNc9xthhiJO/1cRJ7riBiW9f88ZIXebg0O7mcpyaliMI6GjDmdWs2orwUKHXZoycmfz2UI3F09DSvdEJU+eoxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787830503; c=relaxed/simple;
	bh=sxws1xGhqTzJ3NTmRsJ1qu7iXHOGzuAr13RpR3FV+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLMcVAfsAyqIOL5eIehJpJ7cANwfeTKeKRAn5kmO1u6XBuOQUencxzTtyiBKND2Oazc0dXyNiMzdo6woufuQXEdp0kdX30KGFAnX0NlmbPx40hRVwGQEYzIw/mI7TwHqrQ0IKMI5C0tndun+6PMigPhwQHm/ZxW29JkiObME4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GhXByeXE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GhXByeXE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 511F21F000E9;
	Thu, 27 Aug 2026 11:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787830502;
	bh=4ROo9sWqP/22BXJhqdtNH3KsyrFV+7psmME86OjCAc0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GhXByeXESiLBXHOMl54J7WD+z7yc1Zl45gaZW7Bt9uibQfXOo4friuTM49MMjBqk/
	 VjPi0MxIulQE3bB3xbGbynYeqYT9IKabf3nc/XHBsk5Vj5ISFpC7dGiQoIqNzM5+ah
	 hh0aIJRRMhJeuSEMKD2y0w1Jm8PcPCtJb7DesuoDw8xrgDmfnsX9zmqrsOgMXWFQdl
	 M1hNyrnFBtlm+5sjq92RKQdqi4d2aAdUwMZhuGC0oaglRgClJpuQv6dQqPN8J1ItkF
	 sbdAABQYrxH4dj3wNMv9ypMdxxIe8ftiYTcwFkApWfND2/JxAOxqKtE8a4aDUY5GYf
	 idSu7qZf7DwAg==
Date: Thu, 27 Aug 2026 13:34:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Karl Asseily <karl@asseily.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: dt-bindings: add ESS Technology ES9039Q2M
Message-ID: <20260827-nice-glaring-muskox-ca21fb@quoll>
References: <20260821043859.171871-1-karl@asseily.com>
 <20260821043859.171871-3-karl@asseily.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260821043859.171871-3-karl@asseily.com>

On Fri, Aug 21, 2026 at 07:38:57AM +0300, Karl Asseily wrote:
> Add a binding for the ES9039Q2M, a 32-bit two-channel audio DAC with an
> asynchronous sample rate converter.
> 
> The part selects between two control personalities with its MODE pin:
> hardware mode, strapped by HW0/HW1/HW2 with no control bus at all, and
> software mode over I2C or SPI. This binding describes software mode over
> I2C, which MODE = GND selects.
> 
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Karl Asseily <karl@asseily.com>
> ---
> 
> Notes:
>     v2: rename the binding to esstech,es9039q2m and update its $id and compatible
> 
>  .../bindings/sound/esstech,es9039q2m.yaml     | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/esstech,es9039q2m.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

