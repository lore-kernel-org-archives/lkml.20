Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DD83914E4;
	Wed,  7 Oct 2026 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791405952; cv=none; b=nIGlUjNMhs1+1OfRCPf7mY5oAcOsYmIyISlfyaXAlgZSf0htZw/3jAzbktKQTFRUxduoL+QXHHny8fIe4ZX5HPKjY3+76j02+fSovSP3LWdXLJjbTZBbjCR0lBMPDi3TnWXsuS7JpjYimZCwM3hF/JV3d9JOdeNh02o9b5vhHp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791405952; c=relaxed/simple;
	bh=MgrBJLcG1Y7/zRATjmkMc5saocy+m6mW7LuU/Y2HL7A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bjRfyUKwes7EcdaZU+8tPDSLGH1rfqDG19Tl/6I8DsTJXHMwXed/MKFiTJbU1G5Y0e+HdBfFZ42j7jp5EnPaZ2Uh2EQKznC5DVCRGm17UiY1lrzfDtsO6CtD6BblBmMDKq+OGxukL5BDuNbF6+nfUhjRCHj9MNdyk3eWsfUQmTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bLc/fvJ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bLc/fvJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED571F000FF;
	Wed,  7 Oct 2026 20:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791405950;
	bh=n8l2PoE90t/H1EmocqiyivcQZJzqCYsnIlfoHjqAV3c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bLc/fvJ5f7/X/1VPu0wgiRuv/RTBT3dHKmcBjuCrcfWQI+3kfkGeqXR9Qzo0SDuMe
	 7DZO9RFdjAbNyAl+AWnFbNLh4rbTlhPEfb1Yh5WJdpKMm6oLpS5+9LHP31x/ELrGgU
	 okm39a/XfJK4FiH2F7C+UVC0LtvDt3eztrMW4KGv55n6Ib7Htk5aGMi2XgwUp67RK9
	 0ZV3TF+xDEQsIbc3rtmRhT4COakNa8tUNZdonA8hLk8DF26UlS46kCkFkmY+P5J7kj
	 DKX+kl2trvU61hudemiNRltQPzYwxL3AoVuF059EWnDYOjSHorucpjV5xVnCkL0ryH
	 bsqgJy5X6MTWg==
Date: Wed, 7 Oct 2026 15:45:49 -0500
From: Rob Herring <robh@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Bharath Kumar <quic_bkumar@quicinc.com>,
	Chenna Kesava Raju <quic_chennak@quicinc.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Mahima Bhattaram <mbhattar@qti.qualcomm.com>,
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb
 reg values for cdsp
Message-ID: <20261007204549.GA234290-robh@kernel.org>
References: <20261007-glymur-dtfix-v4-0-31f7143e759b@oss.qualcomm.com>
 <20261007-glymur-dtfix-v4-2-31f7143e759b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007-glymur-dtfix-v4-2-31f7143e759b@oss.qualcomm.com>

On Wed, Oct 07, 2026 at 03:51:18PM +0530, Ekansh Gupta wrote:
> The reg value of a compute-cb node must match the SID (the lower
> nibble of its IOMMU stream ID) it is associated with. In the cdsp
> fastrpc node, compute-cb@10, compute-cb@11 and compute-cb@12 were
> mistakenly given reg values of 10, 11 and 12 instead of 12, 13 and
> 14, which don't match their SIDs and leads to SMMU translation errors.
> Fix the reg values, and rename the nodes accordingly.
> 
> Fixes: cd1d174c75f7 ("arm64: dts: qcom: glymur: Add ADSP and CDSP for Glymur SoC")
> Co-developed-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Signed-off-by: Mahima Bhattaram <mbhattar@qti.qualcomm.com>
> Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
> index de7c395d9c35..3219603372ce 100644
> --- a/arch/arm64/boot/dts/qcom/glymur.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
> @@ -8471,9 +8471,9 @@ compute-cb@8 {
>  
>  					/* note: compute-cb@9 is secure */
>  
> -					compute-cb@10 {
> +					compute-cb@c {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> +						reg = <12>;

Normally, reg is written in hex too.

Rob
