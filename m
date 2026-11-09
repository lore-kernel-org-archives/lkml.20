Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226840;
	b=BBEhXd3t5NdQDjtQYxI+uWrF4LDXXAnCk3IzUaVeh56sDdCnsVjlGobioys5f1zhq6tf
	 J5rUQZeGtIQkrbzHF4HeAZduD2hS4o4o0Ama+q6BPdu1lziULKA6A+pXFx7dunS4uX5hA
	 H3Q/qR1dCTytBsCrT83ZS9lDL8G0dIzZMaUp1V3ZYX743DiZy6EUvkk+wV8pYQLqBKNUP
	 yHzPG8/BOb1J0lat5jdmbCTWfOA6rZF7T7yxdwb1ofRcYw+oCXVltKL5MkQHP9cHSRHyq
	 qsVe8BE3Eg3+3WcXxbs03+uAbEXKixyc1XcP5MOCPI3/sDU4wSB7+q3enW58MZXJh6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226840;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=ze+YCmI59m/yVO+iXLz5VO5YTj0KOc9jwUZZU33amMs=;
	b=dMdoqLb2UJiE/aKSzpvoMMRPmD8AGjUQ/nH2vaHA4k1jIrhmhNAH6tK2YVefzQZDyVDb
	 5YOu6umxzaG+QUFPsnSE9W+NzbYUp+fVykN1E7bwwHIXTEDKA8A8alwsrC5F+OAZyIkvQ
	 05ALo1K9FnobvVdRPH+B71eFqyUTI/N36RcBVFHRpv0LWxy5aPr3KxztdF324DLqKdtba
	 38TNuPLxraHNCZQlAStXD7DCxtmogaNvbnR9ZGGApFpJi/7BSbjPJvVjBCZyLOFAwFnCS
	 1kdoGCZPrWFM1pt5hdzwNFbA3rowR3WpMs8fbF8BlnE1Br7TUtNh3VLPH3YiCRkIpBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtYcHYNK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B20606A325;
	Mon,  9 Nov 2026 12:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CtYcHYNK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CA4F1F008A3;
	Mon,  9 Nov 2026 12:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794226839;
	bh=ze+YCmI59m/yVO+iXLz5VO5YTj0KOc9jwUZZU33amMs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=CtYcHYNKlbOAZIWjhtvy1EYM1Zsqq14b2LPf+B0uyB7LyHOKI8xFt5D52a6RiEwZM
	 2jtkN0lya9J/RpPnmQ7d/9jdwsmOOQeEdFubViJQRzkqbDfftBwkYwdP/Ki+xkXJQL
	 Q/pNN7Hs8W5PuWjAOzi3g+1xrVeJAWEyLx2w/9ONXawi5IZ41fZFsXMD6e6Josu6NH
	 vb+QwpDLf414qKb+tP8PbMU3S7gCgI/VvxeIf6p+wkbLXLGWly9/Rwwd5O1zerZnlw
	 5f9AYB6rq7hTPDrBjaeBUI39cY1FEWG87ZgAbOuP0HVliOPVr+dhu0q3i1U35GfvJl
	 Vhlwcyi4LAuJA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>, 
 Chenna Kesava Raju <quic_chennak@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
 Mahima Bhattaram <mbhattar@qti.qualcomm.com>, 
 Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
References: <20261016-glymur-dtfix-v5-0-f56a8b94b4a9@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 0/2] arm64: dts: qcom: glymur: Fix fastrpc
 compute-cb reg values for cdsp
Message-Id: <179422683634.26830.384008413177707013.b4-ty@kernel.org>
Date: Mon, 09 Nov 2026 12:20:36 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 16 Oct 2026 12:06:45 +0530, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower nibble
> of its IOMMU stream ID) it is associated with. In the cdsp fastrpc node
> of the Glymur SoC, three compute-cb nodes had incorrect reg values that
> did not match their SIDs, leading to SMMU translation errors.
> 
> The fix renames the nodes to use correct lowercase hex unit addresses
> (per DTS convention) and corrects the reg values. Since the fastrpc
> binding's patternProperties only allowed decimal digits in node names,
> a binding update is included first to allow hex digits.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: misc: qcom,fastrpc: Allow hex digits in compute-cb node names
      commit: 05c781dfb322b07d803fedc18b752e7ae2bbdc4b

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>

