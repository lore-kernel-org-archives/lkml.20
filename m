Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189874;
	b=WEhkFWPLZXISgitMtGi3MuXPFLGdBgGgSEPvZbriPX/f0WOfd0jWVk4idCHozDrXzQMI
	 b9lDmV+IKm09VymrYt5bcQlMPqdLRBnEW5qLOFDYaLDsHHLI4ZL8JyFCpUpvYZmHAEfFR
	 0WIzE90rwYddUKXYrabaGnVNwrxDr/S68KRJkcZGbl+Wsd8irVPjDgBqz6DteDQ3E0PZ+
	 EGtap0x1IhVGrL5z0y4FVGw3kwYsKRMN6kDxhxWq3WFwRNXfe4g7Y2fB7fLeJ3053TOlu
	 zrr914S2paMR6Kz0CY5aINHm/oproEzvSuXd2cv6kkmfzPs0UIFyrM3LBtJomUSFxtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189874;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=R9mbGdHGMwpMhNox9aTC4SWc+oNvjA2nA08LY5OnD6w=;
	b=tJuZh/4kd8bdNN7xwQmJisBGU2j86VMljxMNFpYTopKAB5/jBRmK+Vt5ySO9C++dGMp0
	 cZnEL+CIpXhUD78ovHsyFieN3LQzYWoXHuY1Tie14u9ycYaPev6Fqv8TL3clBx+tWRg17
	 gC5Tged4fd4wLPESdnSuCXq3NRLu8xGyRVbbZFu0XE4+VPQHCHmHMthyUflFHCs28Ot9e
	 l2fyzlLCaAK0uQHgfXetpJZ94QgP8t/W4EywIfXAQXQaX/v+CUvL3fcFXiE1VTVKAFDbp
	 toM4RNQlRJ3m9VxFgiJuT49LCjAb0eQxXXGys3Ile/YvpJQxm1GxneYXRhZ9CowcjiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nvBJUt6O;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1EB606A31A;
	Wed, 28 Oct 2026 12:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nvBJUt6O
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2911C1F01825;
	Wed, 28 Oct 2026 12:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189873;
	bh=R9mbGdHGMwpMhNox9aTC4SWc+oNvjA2nA08LY5OnD6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nvBJUt6O5IFk0J8V4iw8AObcENqckNNYFnp3oxP2hTqyhJ6hD35Mx95tSlWe/dUDe
	 ekWZKsXwGWDRjPSfKEz4s+TFqlwCUj+LrxuV63Dol8FmZTNwaxyCVIZ8x7zma1AFa6
	 TT8jxbKRwFRksLAdgOTft6xbeB291wWqjaxfebrT4zyDwmhtycfJS3sZxhJ1vPhVQM
	 IzadHdVQY9kNYAX60WLes52uD0YFmPFHiqvzYpf+oddolx+BbHNutKCyKXvqTPTNZe
	 QpN6GASqk1ERgxEVwhzBuuynhpcb9/DIy92v4GBmYhwck3rIwiYl8ZvoK1xZdCm2mP
	 ovYcknAuMzPtA==
Date: Wed, 28 Oct 2026 13:17:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: qcom: Document Microsoft
 Surface Laptop 8th Edition
Message-ID: <20261028-busy-alligator-from-saturn-8b96c5@quoll>
References: <20261027-mahua-surface-laptop-v2-0-7dd903a12d22@oss.qualcomm.com>
 <20261027-mahua-surface-laptop-v2-1-7dd903a12d22@oss.qualcomm.com>
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
In-Reply-To: <20261027-mahua-surface-laptop-v2-1-7dd903a12d22@oss.qualcomm.com>

On Tue, Oct 27, 2026 at 12:33:33AM -0700, Gopikrishna Garmidi wrote:
> Document the Mahua-based Microsoft Surface Laptop 13.8" 8th Edition.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

