Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B23C108D;
	Mon, 28 Sep 2026 21:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790629989; cv=none; b=TOK+rLYnBMfBYkZgsZklp6L69TCaunWDQv0BCblkniTLCSW7rLnOMye4Mvd63ZVRHxsaibxTMI8iRcqQslb+Og1npXosc/uTV+qEddqgO/AXBTi6kZKMIlmCgmOYq+eGnN8iZ0uNWG52sljM/1vk7YZtQT35lY4iuxhz/gVk4ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790629989; c=relaxed/simple;
	bh=9mgfBsCklFR0b7W6MQF8zGu8JAsZPXBZzq9CsI8K8jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ra9SKcZdkPgWUjRmJWQ9AVtUt3hTsvQ9NxLlcDVG/fYKcciAH/OzKT1a8/UriIvq0wHUgeLggrH1a6h8AQAhjVz6m2NHdkDYE9Sc4+j3h0oaTn2FRQ3nkyISEuudu9lPTBepTg6Rv5qCrvXJuDUxQbVpwx6Xu+CtNORybTcZBj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fnfu9rKa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fnfu9rKa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB861F000FF;
	Mon, 28 Sep 2026 21:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790629988;
	bh=xaJu5fo1lJzivcw+q42yBIGQzy9Uf/GVkH6qsjtoSRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fnfu9rKahUhMUSSrQOzMLd7FqvPYFG65Hi1uAIWYBqgTdZEJh2aT+vjywr0Mh7Id1
	 rTQ+KZP4d2j9U4LPRn6qDSdJFPaGbcNLOqE5hOaiqP6pQwlopuSKU56KDXgHPV/ERV
	 aqm6D+pXti9z/wMoLUI/b6pQbOKcFr3B6aVarm0E7fU3rM+VDSuo+1PC4357coAyR0
	 McNWhQlDiES+aH5tVrivdqfNO8A5R7E0xnBpSma0qISTaYWD4IyDF5rnX1EGs8Ke2a
	 hG6pqU7gwF517pxB58ruY3Vh1KJubqlvd+1iYHYJtyoEB815d/OoXLNPtEuuUwQ0ji
	 G/noZGr6t8KYg==
Date: Mon, 28 Sep 2026 16:13:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: add Lenovo ThinkPad T14s
 Gen 7 (Mahua)
Message-ID: <179062998524.647678.5887982776018133738.robh@kernel.org>
References: <20260928145122.1337186-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260928145122.1337186-2-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928145122.1337186-2-srinivas.kandagatla@oss.qualcomm.com>


On Mon, 28 Sep 2026 15:51:20 +0100, Srinivas Kandagatla wrote:
> Add lenovo,thinkpad-t14s-gen7 as a board compatible under qcom,mahua.
> The T14s Gen 7 uses the Mahua SoC (a 12-core variant of Glymur with
> cluster2 / cpu12-cpu17 fused off) rather than Glymur proper, matching
> what the platform's ACPI MADT dump reports (12 enabled + 6 disabled
> processors).
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

