Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794474510;
	b=nZyH1nQqe/SLMSvSwm8OAt5cD9KNKbdgQ3OGmUF+b8rmvVfhqo7M2zpV3gnFhCpVFTi1
	 NsvlY1691LzBQvwc5V4HlfivBSRyM6D95LWP81uTb2PzqlhHCXCvPf/CEb/DYeAj7OFKd
	 aYxVJ6MyEclXK6WwVQkrCmA/fV1vjTakPCLm47J+n9wjMuu+JGBP5FgtsF4pxFCH/Ewan
	 Ea+u9i6f6YOps8Y0YoeUt9t/CZuSaX0XAvjXBfb37jo/pvrJ/uSa5qEqMFp9ZPNg0qobx
	 xiEcxlxbVL5SYFRfpurgKsNp74CnD1nKb45mmDFnyO0GjOzTdRfl5y5AKh/YHVGtucA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794474510;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0i4agwfKBq8+H5+Yga2/Z0hiiDNhtISeBaGFbjeiZAQ=;
	b=k5SqwfIkA46psu8KusLQTKWfxpuUezEhQraYkhFXI6kh5xqyduTlUXxjwH8Pure5oJQT
	 ygLgV64MXTj+neAWAQsF0b1rgFziYnMA9iRlCm+IjlRODJkN3/OmLuRVZ7vrYROP5RtUc
	 ZV9UyKHoL2khSlv+ySfR1zPeWHUKPohI0MRH1LU3IhAAuu0pyOVRbZRv0MwTzI21A69No
	 KhBYscLtJxavkdFQZcH1O4E3uhOtshLjoDaKBqBtLnAeVqIPhC2m21tIEd4E9hv8gxVhV
	 0/pmxW7YX4DWXABLkyAasjYQS3N1f5/GtwbMSfMWbOw7pRBKBW+oj+oO8REZ6c3IVeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TApI+AkD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B4606A32D;
	Thu, 12 Nov 2026 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TApI+AkD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0021F00A0B;
	Thu, 12 Nov 2026 09:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794474510;
	bh=0i4agwfKBq8+H5+Yga2/Z0hiiDNhtISeBaGFbjeiZAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TApI+AkDfYy5XRdGesEwlrClTYDXizjYl2aJIBPK0RjDxHlfVyoGnkiIW3eu4CTN0
	 Qq/ZVSUMnj9NRbiJc/uhzslOEZcjh2FUJ2MTe5xdngkqo5YAB2MoqMACpeDO1koN5O
	 Uo6JBgahas0EDnJUxr751d2BgPUx2JzhgamO8X/uQXyQFpXQny8rpkMDNYczVlKqqG
	 jneCBLMMlG5wZTzvXZFkAWvkZKwWY5D0ywlMaMgO/pD+KCo41aHGdctXUIebGBdHp1
	 rBADqU2fN36SqzJ8Wdu+f7rRP2YOevViE/dw5PeR7Epcd7SzQx1c83kgbWFFSBETUN
	 UNlOBbuq8kccQ==
Date: Thu, 12 Nov 2026 10:08:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, cylee12@realtek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH v16 1/3] dt-bindings: reset: Add Realtek RTD1625 reset IDs
Message-ID: <20261112-healthy-marten-of-amplitude-deecab@quoll>
References: <20261112053128.561149-1-eleanor.lin@realtek.com>
 <20261112053128.561149-2-eleanor.lin@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261112053128.561149-2-eleanor.lin@realtek.com>

On Thu, Nov 12, 2026 at 01:31:26PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add the device tree bindings header containing reset indices for the
> Realtek RTD1625 SoC.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---

Here on in changelog you explain why there is no DT binding schema for
this. Or where is it...

Best regards,
Krzysztof

