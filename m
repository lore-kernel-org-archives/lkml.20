Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101644;
	b=MUWb/d3bixrMePZ/GS/Es3DsZDlOMkarMLz64gqoGqhy/bGgohdSZLy5xkgtFiO3ajhY
	 6g37vGL1IUQf8MGgqwENRee8gCHz+HHX9v3jIpKcIiOmvrry1kamm/fC0yF7/ND+yH74H
	 qA5N4YtMvMcyCB4GWvn2teB/R08MXQNOx6w/Kx4eUau7Jyh3VJm/3HdRKfd/sKCNliMpM
	 ZQThC3q+2XO8cQG/hu1mR3bS41RY9cvNW2GGyuQnhVTH40EGoN+3s1NGqk+iPKZauTNtY
	 /PxwlBvWqPncYXcbEm7IdPIc7rFWyXItibQF4ka7fmzZUyGG62wDaN4WYx+SS86fL2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101644;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=EptGMtb74A/mYaHTnNKy7dyK7YA0M1mM22BC1gOfPjY=;
	b=B7ZHv2M0fJqlM/Rc2gnMHcCGGJkxBIsIX53u3YbEcfFIoOJ8OiKTcMtdbczDzOsJl7cQ
	 ac0FBT2x50qb1iu9ieioiqCZm/ehPkHsilnRahNVEnKzNheONDhUQIbexWeOXMpGAgLYu
	 Z5IfpAzm98pC35haOR6zxPsqakg15ZCU7uatXSweUfELox/3P9X+1ifQ5hN/FQ0jEN4GH
	 I68ZaRlO4ySb3akMFiKJtR70gscRWyJP/t+nVHme7nvwlRJQv8qfQO+H+7hYTMeq/8FME
	 /Siv97LiNWbV777Vp1BwMnDXJM8W+/+ThbJJWrlFvMws8Mg3o2rjn3euy9XDztzOx0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncgCrpZp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3577606A334;
	Tue, 27 Oct 2026 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncgCrpZp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C00691F01825;
	Tue, 27 Oct 2026 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793101643;
	bh=EptGMtb74A/mYaHTnNKy7dyK7YA0M1mM22BC1gOfPjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ncgCrpZp7fwQ3+o++IJz3rT+lcoRvQuwzmO55Xn5vbSIOBcLOXm+Q8wO9nG0slP44
	 j2TO5kax2aBNbEdK1LC+5ghdNWRLH7UEKgxqnAqfmES0YUuBK6Aor91wDJy0XhpWnT
	 B9RwMJf9b3wuDKDQh1UEA5hP1oQSWo8wo7nLIPx5LxZWarPqUzp/64ZAzMeDUfHMle
	 e+M1l9N6IJ4B0ujegFxD8utewhxQSp7VOIU4JBVLrS/C8Wnqf+dyZVmx6sZE/RwQay
	 IHi1OD7Pgj1UC/k8w/iDZTzAFE4f5AeBKp7mYuyx+A0yHnIYo7NkrVDryhHLzbeaYO
	 5dkuiSOwwiiUA==
Date: Tue, 27 Oct 2026 06:47:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: qcom: Fixup sorting of Eliza SoM
 entries
Message-ID: <179310163840.1081237.17811742811124384240.robh@kernel.org>
References: <20261012094843.66537-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012094843.66537-2-krzysztof.kozlowski@oss.qualcomm.com>


On Mon, 12 Oct 2026 11:48:44 +0200, Krzysztof Kozlowski wrote:
> Commit be9222a4f92c ("dt-bindings: arm: qcom: Document Eliza CQS SoM and
> its EVK board") when applying patch from the list, placed the entries
> not in alphabetically sorted position of fallback entry (the list had
> correct placement).  Fix sorting, so the code will be more readable.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

