Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568678;
	b=Ni7OHjkjhIzLZm3g1EdhtlK71bhGm2G1sC68noECO2eAOlIiZOjgJN2v1f/i0GpYnVGj
	 dUogJXpjLVSIBtYlMrvgNFgwdMGHFq+aFZ7QuoqtXWAg0SEzl7rCFbNekTXqGnM0dD5lY
	 G/Le1yeFZQTF7Nqdtu9g7exp1MZjTxTKHa5K82OFxD0a9kDHLQJtGVdxnZ/diQogU3ytn
	 m2sgo+dxV0o0I34U4A44Z1ycifD3/ypK74G6raxW5GF0a4Oz/qzZumAx3MNujTu5Fy4oq
	 bzaLXaVl4McSLUQaNK5IioO7UARyIonsDjO1rrb16G59OW3mhVALLJhl/IfhcsCZzRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568678;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ozwIYES33PCuQLPleCOOcNSj6J+2uEqqj660uvok10Q=;
	b=kaoo5zJYRyVQBIUV1rihD3nYYqgyycvOZq0vLxcHCIzcJVKSQ1A1KPfvmOvKpamU19Ua
	 S5XeCFdmJKOvRQTic+4tNCh4gISPicR9o1nkrFPZ5ahn7APpdNOpnVgAMIb1kYiexx6Lw
	 KF3RgWE+5cLjwvClP+0DitevZ0G3hy+WyjmiaM778gS1y0BOU9b6brLHbj0uyJSlzmQhr
	 mML7iRajNbBW3g+/Pqo2zEIQ+UkXgXqIQc9A0PAq7YeZ3wwILcSDumnCN7TFRI2EQYiA2
	 cLAdGXvP73rsJfJwBTD2HTI56udueUmo1UuyMG9IkdAeVSv/eh9EnWO/w5ERGpYa7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0z2uSpE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C5606A333;
	Fri, 13 Nov 2026 11:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H0z2uSpE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A9B1F000C5;
	Fri, 13 Nov 2026 11:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568678;
	bh=ozwIYES33PCuQLPleCOOcNSj6J+2uEqqj660uvok10Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H0z2uSpEglM/6vvVxa7T4gFmU9ZcflJ37bcoEHUGOmzp6MxeQoJXLsSfXT8pqPg9O
	 MzqDiRQw++BNE2aZX5gvyqhtkvn/lTmnZICkJkrh6AjFkt8mrFiFpnd6mBYcg6v9Dv
	 Vt9lX3x40Hwcv/Iu688aN254Lo70x6AdGNnKEtZHltXxHBqvlOjRiGyzp+o4vUn0ln
	 yi64VoSK8Mg83XNt79RTTOj1RaIfCdmN+3owc8TFCufPx50OFpxap/75HTUVdGMXdF
	 iglBJ4+KPH67eI3Hf3K06ldnEHw5tYzuObX9ewuf42OiQGKSP6hitK2eCEVQiB9FjV
	 2M639qA5dtcdw==
Date: Fri, 13 Nov 2026 12:17:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Aditya Choudhury <mail@inferno0230.in>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: socinfo: Add SoC ID for SM7550
Message-ID: <20261113-monumental-weightless-limpet-b1ad9d@quoll>
References: <20261112-sm7550-soc-id-v1-v1-0-57299906d81a@inferno0230.in>
 <20261112-sm7550-soc-id-v1-v1-2-57299906d81a@inferno0230.in>
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
In-Reply-To: <20261112-sm7550-soc-id-v1-v1-2-57299906d81a@inferno0230.in>

On Thu, Nov 12, 2026 at 10:30:27AM +0000, Aditya Choudhury wrote:
> Add the SoC ID table entry for SM7550.
> 
> Signed-off-by: Aditya Choudhury <mail@inferno0230.in>
> ---
>  drivers/soc/qcom/socinfo.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

