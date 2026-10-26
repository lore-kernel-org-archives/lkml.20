Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793012531;
	b=rgZ/ShTSEjZEYKEdKRyUQSWYf3vwzhR5jSpKl4eynKy3Jz7230oA8lkYIT7OgsCqycRn
	 VDYm0CO0/2/aXM9Eexx/ywHIYA4NvmCz1Xts92F7wsRfcA397K6eGwIRvhr/7yn1KqQEQ
	 NIO7GyI/h/m84bDuYzloLDoXMo9eChuE2fdPG4Ek1OpnjcPQmI338N5UsIuFzSnmkw2D2
	 Z7X5BMT5NX3zzdHC6h4MwEIxdzSrufVHn6w390aphHHcMmkZVlm3pxZKc33okg5Ib6eE/
	 JnVmp67Qve/8oS6SMo4dtVM/JAxpw/9jg7dGftJUS0cN+IuPPyYRnI38asaJzQCuHKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793012531;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=IosdQzjCXHKd6sP0mmtnu1KHk5WLDHA5y9noFJXIIHg=;
	b=dP7XCv5g7ghqH2y89dRj3B9pHR1nMHKoR0KQDB6cMFfGHN/myr2onim1K6t5NDVaKBGT
	 IXrL3+HF91aP1AHS2t9ywJC6Rm53N1Vi8c/z8MxvIu9dJ/Bhfwjk1dCDgALUxH4Jrg8Vq
	 cxqlnXbSb+y5yMamhk0m5+EGnILX4shaTUqdrvEjlYP6Eoq6WVJVqV3dC5ugXzTmn+Yxf
	 Vd058mXxhRR3+VPxdBXf6qsfdmovTj6P02Ba4+pTM6/5Xy3ueSedibpk8jxx3/uEJ3WKw
	 D3g1j+6NQLoThHy+ApdO296/DsgrqeTZVVGeWPB3D7M+M/i0dPAtzR6PcKoAKDTjyRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blFztxwL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03201606A31B;
	Mon, 26 Oct 2026 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=blFztxwL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B46B41F01825;
	Mon, 26 Oct 2026 11:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793012530;
	bh=IosdQzjCXHKd6sP0mmtnu1KHk5WLDHA5y9noFJXIIHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=blFztxwLJmp165Tj99WaYJtX4SnZRAvTWHOKCdctfIfdjHiaaGswd5XPBDTmqsJNO
	 RJqpa70xPlJiGT7DPlK7TSyopCyTefUY2Vai82Nuez5ht5jnd+i0vOUth3829ONkKk
	 ZMJ0AMx5h93nhysXmiccVseXi6+4emok6x1DdVueSmx7tNrL+VVK+7dRrLvonoRW6/
	 CEkljiDfpVe/xBip0EQ2jISxySNZKDln20l5I5vMBgCrHeFKQUWD4Rt7ftlv4NTznV
	 7QFQl9siAK5wDw1zdL1A7SnqTGLLmtrYqKMcvbAgUqZWVnku+hS005G8boPFcrxKut
	 F1C4tkBbV8j4A==
Date: Mon, 26 Oct 2026 12:02:07 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jeff Roach <jeff.roach0@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add HP OmniBook X 16-cp1
Message-ID: <20261026-adorable-taupe-peacock-5bcee7@quoll>
References: <20261024044650.9936-1-jeff.roach0@gmail.com>
 <20261024044650.9936-2-jeff.roach0@gmail.com>
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
In-Reply-To: <20261024044650.9936-2-jeff.roach0@gmail.com>

On Fri, Oct 23, 2026 at 11:46:49PM -0500, Jeff Roach wrote:
> Document the HP OmniBook X 16-cp1 laptop, based on the Qualcomm Mahua
> (Snapdragon X2 Elite, 12 cores) SoC.
> 
> Assisted-by: Claude Opus 5.5

Please read the docs how this is supposed to be constructed. Then run
the checkpatch...

Best regards,
Krzysztof

