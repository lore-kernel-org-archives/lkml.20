Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793619127;
	b=1kci5ogBmXdX3OU7pca6+TBoWiKEfFi2v9CZusm58sMNIV1Bgd7acN4MFtvTVRP0Cwy9
	 XMAmBPIKKihNFyN2XfluPYfNsvufmMkxfEqM8WoxC5SayFZ1EISkKGfVWbL2Uzj3P+0lb
	 ifKdmqqYlIK4MNrRIw9V3r8FFsEr+9rYKGxx7+0jfGGeM7RyHsndV99+sEto9nx9rYqFa
	 sPZXcF5156xxs+Ku9SOVv6bLuODEJUbONfIHaPinqQLSW4vPVDSUOthhtXM1HwxAU32nV
	 gVCuQeuvVVd1tb/Cd1e0AyfUreOltqVRfJ0qCDjKaLpQ9XKZrNgiPWvDg9wnZc9aEmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793619127;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=BnnMTjL+IBBOUZBpzoaEzP/pmGlIxPAFzPCd5/LDnRc=;
	b=06jAGZttYn7jCEwJhZqzfkFszXveYDQmroZf2HuCOtqNbWzq0x8GWuluLM8qh6LJpmKw
	 XlKl138oLCHSmjnQbIbISLP3iBKMlS2gHsCdqGADpQPwhNqAe+yq1CmH3yWkdnoEoEhFG
	 42ZPqc2IYmICXkOBBUBwkHem/Uegu5Yst7MiZoZ68Shi9RAcuxoVCEEm+2vpV1xCdsdCe
	 yCgwA3qVX4fAJ9RtvOaeslYsvV2o+eA8505Pe+Oe0N5V2pnoykzn4ypXQ0quhFv9IcGAQ
	 jRm9c827AXyi9DNOtwqcfawy4LJXI954bG5sTcDoeR9lQLmJWoet26pdwdrn2rYIJfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwbSMHdH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D70606A32D;
	Mon,  2 Nov 2026 11:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZwbSMHdH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4F01F00A17;
	Mon,  2 Nov 2026 11:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793619127;
	bh=BnnMTjL+IBBOUZBpzoaEzP/pmGlIxPAFzPCd5/LDnRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZwbSMHdHTG+UhCMQHTY5QNWWyVf3VpuNYFUpeBJecKBnXhuiyDWPUsSd5S7Cz0JM5
	 T8eealXr0El5k8WZCaImP+M9Y8rCPsatmC0j0BN/De15no70xmW2wfQiEiBkc3lGC+
	 KVScZoQgY7SHqMxvWthTACWQKuFFH+B7Nugw1doFgKM0xG9BxpHtzGzVX3nrajwpdi
	 0D4PlsEO17T5rruQ9jSiyWc4b8AWOGJJhccn2d4AoAM8Z+N+jrT8g6om4RndxfzNrS
	 HQcSkxi7da5vV4iroOCATvTTVZnoHqmvgzpcvPSV/Zx+dBSTsMdOngId6R6wBk8rK2
	 9KPzpgQwLnutw==
Date: Mon, 2 Nov 2026 12:32:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dsi-controller-main: Add
 SM7250
Message-ID: <20261102-opalescent-pragmatic-wren-34d6bd@quoll>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-1-159f403ec405@brar.si>
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
In-Reply-To: <20261031-dpu-sm7250-v1-1-159f403ec405@brar.si>

On Sat, Oct 31, 2026 at 01:23:37PM +0530, Ishu Brar wrote:
> The SM7250 DSI controller is the same 6.x hardware as the SM8250 one,
> with the same six clocks, so add its compatible next to its SM7150 and
> SM8250 siblings in both the compatible list and the six-clock if/then
> block. No driver change is needed, the controller is matched through the
> generic qcom,mdss-dsi-ctrl fallback.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

