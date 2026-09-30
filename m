Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908928B4E2;
	Wed, 30 Sep 2026 09:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790760993; cv=none; b=bT2LlMikVdpXHepa4XXfnXaLfcmH8zJLZyOpxAH6aR1IbQVqfiryFLT7voBbmhlfptet+3IFtI+q3KTXodmuMb86dgq38K1dtD7vwxyqjf30aBs3sgSuqn8mfMRMnWacCpcvrui+HSq4VJJBs0t6eeglz2fbiMwTRyVj5X2WiOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790760993; c=relaxed/simple;
	bh=Hj21es+UcqC7TmNQAO/P72BaQC/M/gVmuxpUb1lSF7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DMGiObROZZFneikQmvjdSXTE8EsLHy9XMM/MALopi0INZa0XFUPK1OWtTjsjEorrDBpmEVumjkiU/ni88WhL5qRLxv6kLieCzrGShRTQXr8JUPClbFkkhZ08Lu6ttZFwedtAmIMlBnFKzmDtkC+g31GYo3AqMIxS+3yRfqhrT7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQAply3s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQAply3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6911F00893;
	Wed, 30 Sep 2026 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790760992;
	bh=hhkrzxBeBYCcN/a6bu9qI5WPt3nhoyyqP4Q8ZG32Cyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kQAply3sMV24+vQnwjMXOxtfkB5lHnc7g+9iAaV5SBojX578vU5NV0Zse4Igoz3JZ
	 EPeUINmUuydUhQ1/l5qgxOUc0+F8EijQSWEEXTFQJA455+nETf7M1PG4V5ja+f9IFA
	 is791/Ffrjnz+bLUOqzEl3Wlzmd6BHJd04C2dD8DKl5CPDOOr+bAJQMZ0VmM9GVkFr
	 BhvwAYX9DIfW7f+ZYwYo9NizW7IfY7aLucQ7jdChbQssTgm8NQfseCL7VQaO8bj1f6
	 GmgmdwPvqHLaUzLkPpFfo1UBgaGGSYOhsgPO0NvQeeBSzXDJ2mghVFKYXq+mFeZOg+
	 A5OcCIhME5hAw==
Date: Wed, 30 Sep 2026 11:36:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, Robert Chiras <robert.chiras@nxp.com>, 
	Tim Harvey <tharvey@gateworks.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH 1/8] dt-bindings: display: remove #address-cells and
 #size-cells off requires
Message-ID: <20260930-lean-benign-swan-3c04f0@quoll>
References: <20260925-cleanup_dtb_warning-v1-0-f999fafbca60@nxp.com>
 <20260925-cleanup_dtb_warning-v1-1-f999fafbca60@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925-cleanup_dtb_warning-v1-1-f999fafbca60@nxp.com>

On Fri, Sep 25, 2026 at 12:37:50PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The display panel node is not necessary located in dsi node. So remove
> these from requires list.

Would be nice if you paste here trimmed dtbs_check warning or reference
actual board showing this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

