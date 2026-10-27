Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126477;
	b=ZGvIpnTTJT9i608Rb9O/OzRp2OsS9sHvyYDXvKToLZ9dskyp/WSscSMYPynuT19aRCn+
	 xSogLmKZ7jTBDC78ZBlsTKq7+Xs3hEuBqBP4MmgFzbIcXwzNPR5lsYeTq6nI58AI6iyac
	 i9bhXC7tS54fe9zIFJlWZFAzDSCZN7vRPB9Ush88fLjs+2MTb+/xqmXSymmhQU2dD/vVI
	 rJKftlQ2K3JwobYNnip1HlyhUyZQkYLliTp3189cY9nvpQEP0wCTXjO/zsFPiTvDNBChE
	 9OmWeNFzMLStvZ1vWpkSj5BRMMoJE8GLqAp/tT/Ohk3lU2jGXiU9l21AaFFOP+viDGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126477;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ArcvoskceT7SzX8ayPehqAjDk7HcQG50dGsvaAvvCfQ=;
	b=iPdQC5C1uZbyORPl3ErFO1t7CJOMbuRCvz1RJqdyEswqyfb8fi2+kjJOmrWg/fu0o3UB
	 p0qhJVl/jyioHUd6SaA30/t+L/i7/TK3Fu9gkiFKYRi32QsPwZrtatPAOKz0DHQ9aGF+9
	 5SumiDfTcCvj9CDGpCAB9uR+nfbmFalHyIpay4D5S2m31SNZfKWXvIp7wvDjyBCWqTr9W
	 ZqCpoInt2l5fQplWRgE3DmBE6xBWna6WYBqAp3hGMYmnoKa4kZmvEAVH9tZnfIJXqsjcX
	 YL2xiptH8lrtzXBuWl3Tq07EGD5FZJlSVlp1THPDWBxnPCPvPphGY0Y9jXr+r+po83A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nm6IFaOy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EAD606A31D;
	Tue, 27 Oct 2026 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nm6IFaOy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 237641F01825;
	Tue, 27 Oct 2026 18:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793126476;
	bh=ArcvoskceT7SzX8ayPehqAjDk7HcQG50dGsvaAvvCfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nm6IFaOyTwANOf2bfUMbkROTvpXUF0hQ3Ofki1Z+DXodV3Y2nQyZ1gs/wxhe0+EN/
	 FOBAuXYkEmeyeqSeZOErhFJLwHUyG2BhMM0l3OmQ5r7nlj6EEfW/PG2utLthJ0So5s
	 AbDLKV4ts/NrSK2k+Q37JIE7Imn2yA3MC2dsGSbB+bijNT/JbZKPfJ2xp77hzgkcKJ
	 e5gOKTJJW7/sRzOyn/S9tJrGmHyPdlG8EYLOrVtBLHAra3BFzqcGeBgMJfPJgSEuqs
	 WGDAuIejwgB74NJZP4SFvHwRXhTSugn6KJ/8dY0zDmcW1AD0pMbrH/4KZX8lCY9qs7
	 Fs9YejBxp36kQ==
Date: Tue, 27 Oct 2026 19:41:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: qcom: Add Talos Lyra EVK board
Message-ID: <20261027-whimsical-russet-marmoset-f248ba@quoll>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
 <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>
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
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-1-658fd5a7ec99@oss.qualcomm.com>

On Tue, Oct 27, 2026 at 05:01:55PM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Add the qcom,talos-lyra-evk compatible string for the Talos Lyra EVK
> board. The Talos Lyra EVK pairs the Talos Lyra SoM with a carrier board.
> The SoM uses the same QCS615/SM6150 SoC as the existing Talos EVK, so
> qcom,talos-lyra-evk is grouped under the existing talos-evk block rather
> than introducing a SoM-specific compatible.

I do not understand this logic at all. Usage of same SoC has nothing to
do with having or not having SoM compatible. Every SoM uses same
compatible as some other device, so we should drop all SoM-compatibles
in the future?.

So if you have a SoM then it can be used with different boards, thus it
should have its own compatible.

Again, explain properly the hardware if this is the chosen design.

Best regards,
Krzysztof

