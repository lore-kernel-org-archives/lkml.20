Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616037;
	b=3B6jbbUtN81UxuQxjCEomOymeb+05uE5pMbONb+DIpQmHzDY/+jPybqzvHQbUcOELKjE
	 NAtLzeF/55GA2MLtWvAJesO5dI+BhRw33xvDeBjNT9Arh0fbZA9vAsFvUfkPhdd7oCBx0
	 BDI4022bmRbX2jRjeh+EZeZMnyZRk761LlRxEsNNAtxy4PJ6t/95eTgMtYyGuBUC1ld00
	 jaEIQTjXb7KNZEuQm0x66a1MdLeL0Ju7142kMsusQ+S9tTtbUsZ2FfEyDPxzyPwQ4Vyo2
	 wJPxQNlVYo17BVSMI9yB9VmXNc1EMotM+i6aAMt20ar3qqZ+7sZ4VTSvZjn0FK23jYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616037;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=m8Zd07W5ko8vL6vXMZiw88HvjDUoYcYKtgwpjS6Nsy8=;
	b=r4MIDOsOqgIwgKEmicGVKtlHDfd10ONfVwzzkY9eF2ooxlmhMWlMQnNMqwECl120F6b8
	 BG847fLnp+pZyqp6VTx2+ZODa6pRsqXkSJ12VYxvdGavXLhG4aN1iJuNBQMMkFY8Jawl0
	 XtLWSIkpqRus5ZXLioXrAULrV9lTJ5IrAFDrvDLgDFs5C1oyZdsHb1JyAIsEGc5+H1DH3
	 iyLOviVelVJ9RClHRsONs1IKpOaCm6LHUKv1AmNJ82AH1+r4QM4rOkruC9u9WqjaJmxYc
	 MNPYGGypBQHdoC5jQL0e8E4BwF85df6yj9iBj8g95R8MgjLF7w1HwyBEF1vNNEzS4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e8XAS8GW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E776606A324;
	Mon,  2 Nov 2026 10:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e8XAS8GW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BCB91F00919;
	Mon,  2 Nov 2026 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793616036;
	bh=m8Zd07W5ko8vL6vXMZiw88HvjDUoYcYKtgwpjS6Nsy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e8XAS8GWJ0DLAn5ldQQtBFkaNU2+nW4DJpMdgdq9zdXNH+W5kaRagklNdGwhvINPc
	 TH0lGRVhb1GQTBBkNQMMHmfpwVOQ1rbcgFREGrZ01o4ymNVyWkLNFlf3vsOKsqeLQQ
	 wKl1G3RO/+x24bE0KjxMbJp3tl81UH9fBc2iGi0SEZlo+dEbrBd7ZtTJrkDS2JU+6Q
	 M6QY73zBSKwyLq2Yd4S1IsqcebR+tUq1qVpn6J8gaF5Qz84CTv/mECz8oWNTZ2TWD4
	 Vd/hXLmoQl51D6q+bZIRSLVF+eELSvlP3BH+/KWZF6lollK2ntC9auvegJHzwfH9ex
	 zrPcMOiMw0XCA==
Date: Mon, 2 Nov 2026 11:40:33 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ajit Singh <blfizzyy@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Vicharak Axon Pro
Message-ID: <20261102-romantic-ginger-turkey-0198d1@quoll>
References: <20261030074404.33517-1-blfizzyy@gmail.com>
 <20261030074404.33517-2-blfizzyy@gmail.com>
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
In-Reply-To: <20261030074404.33517-2-blfizzyy@gmail.com>

On Fri, Oct 30, 2026 at 01:14:03PM +0530, Ajit Singh wrote:
> Add the compatible string for the Vicharak Axon Pro SBC based on
> the Qualcomm QCS9075 platform.
> 
> Signed-off-by: Ajit Singh <blfizzyy@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

