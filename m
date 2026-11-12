Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478230;
	b=yNKPqTjRK/0j0XqHaa5zCJ/GKuZ5mGob3+Ph2HsMEIGVWPOFmK+9MIrkLRCRiYtmGq6X
	 NXDdXQp5SPUs4C1G9jEPsjwHqce/8wf3e2h7geySJWh3ksFmChJ/TZ3urUTr/FEfwnUHR
	 arWNAZnpSZAsC1bgk53tl9FoaoEoubfq6IFGlWeduWPXHD4PDxX5Mpbni5EigCWT1+PUG
	 lZyW34M/tf7APHpHw6+Y55lCNNZc4VIL/s12J6h17dQ1JNSimgdzztFUh2X4RvN4Z2t9p
	 1Rw/zIyL+NT4ViVBIzvt6ICvSvt8MXhjlD6bUboPpgKPfNF1DuzdKCNvUHz/y+Vkw3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=y/zLthRnX7yTRnf7egHecMWGCTPbyrEFlzgjpwL5G5M=;
	b=IcrNHz0+zzchOfYRN/xmNdHkEq2aPb6JigMvY4z3b/9JvkmjVtOYL5BovLwRJNsAaPWw
	 ZSe9XRSgkMm3X0YXZQCB9s0zaGDzBNFTvLnQ1a+R1UbYG9m8KH7wayNhTFUi4UEycNVy9
	 mei7QDU3ENZ/A7rAvp6yIKQvtGIMTTF27ehMXGf2D1zJtV/ze+LUv3hSHNu07SoH6zoo4
	 te1E7nBh5tosPK6isjTVPlVm/wrMKS7R+zuCKW3pbIjMn8wrcK/jldnpVJksf54i35JzB
	 QZmBmNej98hcBR3FhR/k789p2b+eaH1pyB8DmArr8Q61rLtPRculKg8aP7If3cY7sFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvaqGJzC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 5BD41606A336;
	Thu, 12 Nov 2026 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IvaqGJzC
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 565901F00A08;
	Thu, 12 Nov 2026 10:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794478230;
	bh=y/zLthRnX7yTRnf7egHecMWGCTPbyrEFlzgjpwL5G5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IvaqGJzCAbRI3QdbxVDEL6+UooLRW6llzafBpOAyS9uTctdlc36PcBzQfwK/St4QY
	 BLuo3t+G8dHcruUoSDqkQq37NPCdsh9DbJ6EhTm4oUD8HKvP7wAwt7AxGPr7I+lRvo
	 pHtDQJx3VlqdT0Ym06fjxfhXNkRJAo6imEAO0b8p5f9p9TXOpFNSGoxM4DiAaD8tM8
	 6Y8x1MTUcnh23P9TCEcxmis1aWw+5W/Wx3zwbjSOlYTDP8+n8ibY68853eE4pDbD81
	 PHsjRxGsbrTwd5PraW4BYYPhBUb1YRlYPBknWxrRMZ5XWs3SjhDy+Wt70rsEP87Zv+
	 5jvttrJCM2OIA==
Date: Thu, 12 Nov 2026 11:10:26 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tengfei Fan <quic_tengfan@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Ling Xu <quic_lxu5@quicinc.com>, Bharath Kumar <quic_bkumar@quicinc.com>, 
	Chenna Kesava Raju <quic_chennak@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: lemans: Remove secure FastRPC context
 bank
Message-ID: <qhttib7t7zpd4w6cbbolsderbrjs3ucmujz6efuuksgaxqprhl@oic5yvb6xqva>
References: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>
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
In-Reply-To: <20261111-lemanscb10-v1-1-7164700b7be6@oss.qualcomm.com>

On Wed, Nov 11, 2026 at 10:18:32PM +0530, Ekansh Gupta wrote:
> FastRPC context bank 10 is reserved for the secure PD feature available
> in downstream. The secure PD feature is not supported upstream and the
> context bank must not be used by any other PD.
> 
> Using this context bank for a non-secure PD results in an SMMU
> non-secure global fault.
> 
> Remove the context bank from the upstream device tree to prevent it from
> being assigned to an unsupported PD.
> 
> Fixes: df54dcb34ff2 ("arm64: dts: qcom: sa8775p: add ADSP, CDSP and GPDSP nodes")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
