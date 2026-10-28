Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187419;
	b=uSAcS3s356uxGhPmmW+i7SOXKsTOPLI2f4h3ni9zjjfA9jHNFqXJ8uqRA6roLyeE5SOw
	 ZfSOjhBeWo2oHbOzMXRCbCTdLK/89kqyp+mp8Y9GbrTWD6b8y5nfIr4re0J4MRNh6a/Gx
	 /c5+vUraSDx6wqFkicIJiLpxK16US8DyCJ4RabBIZaCkdRqX67tO41JZqXmdE1GIbXFQi
	 oJoD4yteoC/rJc0zxw8SfEaUz3FaJYEvRL8jk8EaFcbo17pVwhvmJw7HHVsSf8zzqxKB0
	 kHEr4CSZvdYFqM/9x59vgL+ZAUEIqCLi7KOwghr52AeTl2UnbYTAKt+12NJseAI8ebw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187419;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kfHM+Ph/Km0Aq79HeXUuCHDrcDepQgLg0imUjp9EssQ=;
	b=Ot05S9y2P2rD8Y8NnWmHP3ozOHnp4f3+FL0M+BqdyrJ5zzm17nvnpQXsAj0dojWTKvxX
	 1JjOk0yE3gx7RhXb/ZSIYWZi+2t2U13GT2IlzVEXTvvVfv7VPb2tjGu1/29UEavwunXaN
	 QhhvKv3/OGuYjZ6OC9Yc+U7U0wRIVGYBtoYzdWXihKd8EZXALnzbHJtPsHQqUBcA1SWY6
	 wKGFShQFL3Ox7QLmkkVEKBuD4RD1a2jxqUQ1ckD63NyvzfcPd900wWNUwDLNjethGrrir
	 9PAaAxlPSCqkVwnUm6m9nJTpvBE43XlVVDEURnAgYkePZoDOWd+sSbgIb1sKvStgRCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XCuM+a8Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B700606A31E;
	Wed, 28 Oct 2026 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XCuM+a8Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C09DC1F01825;
	Wed, 28 Oct 2026 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793187418;
	bh=kfHM+Ph/Km0Aq79HeXUuCHDrcDepQgLg0imUjp9EssQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XCuM+a8QFkySvyLuwDpXsfZSze5DWtYlnIu/VwcyYFveUJVJhx09AoEsqgaX9lDhJ
	 bZCvP037+kc6GHS9JqNJ3+t5zU94D2w8BeAfwvje48RoUGHgB51Obh0SQDsITbRrev
	 3BEI+k+JmFNfq4l8vgmcbx7Ql+srhbftkN4uADT/7/d/gS/GYIj69uUtWyige5l3+T
	 4TD6Uc6vpoOxbp/WpAY/RreyXTNxYWIFjseRCEJxEw9aTa2brX5G5S1u2QCEdVo5Ao
	 4Gi8//cKVZQ1pocuKfe3clRcROfoX1e8E8iOp51oT9CQyjtNy41MtCAFYXXBvuUP76
	 UO0cOEsYWkzpw==
Date: Wed, 28 Oct 2026 12:36:55 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Message-ID: <20261028-beagle-of-perfect-tranquility-1305ef@quoll>
References: <20261026154001.9323-1-jeff.roach0@gmail.com>
 <20261026154001.9323-2-jeff.roach0@gmail.com>
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
In-Reply-To: <20261026154001.9323-2-jeff.roach0@gmail.com>

On Mon, Oct 26, 2026 at 10:40:00AM -0500, Jeff Roach wrote:
> Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
> (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

