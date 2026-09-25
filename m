Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CB73CC330;
	Fri, 25 Sep 2026 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790360209; cv=none; b=GsIjcKn8tKlS1S3xXxiCmtt3PHKuIR1yMfxxDHfjYMQjc6dGLqNHGK3kCwEwam55mgDxxqsDqmOO3Kw2vY/DxMPeVQTG9h+grf4EwE/9rPeAokX71I5UU1SJ7ZM/QIGcp6HFxkN5dlvFy5kjgSL5iqA2EmUXliDrlqPLPONVioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790360209; c=relaxed/simple;
	bh=e7YcTSG3JNePysFqDol3WEbcUqdGmOQ4IkGhWY86vEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lr1gQcMMwXf1eBvLZUpeOmOjkP/oKG04+YnroGB2DXKBxEXnQwmVY/YdI3acsmdYeXW8dvFE9k41V9xH+Ysx2uaJcpLm9mbYQhzaOlUdanpHs9qCg6aNmHEyGoRP+9Re1Bg/xV5f4ClHgi2Jm9g093ndQW4aoSFNyFqqgmQLExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nHGh2WDq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nHGh2WDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 884521F000FF;
	Fri, 25 Sep 2026 18:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790360203;
	bh=C10OfJrTYrQwW2kHvp4SQjJlJjZdUq9RgN2NQu4kbDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nHGh2WDqjA05pVPtQb61qOpaXARQXuvnjw2U4K0vg7GZOk6Egj4XnxYBi9XranQ9z
	 5t9zkIUq7EkPt2XNrNAo3twzZvovyQb5D6ZdQ7azyAIfssZFAT/SX6+FhqL7wDZc0n
	 gIxH8o5UUIeuFBIF8BWIrMYqydhsTZyQPossDC7jkwA2vb5xRwJlVnsWwb/KdU4yKT
	 QvMKACnDJMHYAmV+0drmdjSwKtAKMcRu5NE1yWmgynB2NRePPQ4okicudL0aMBJb8U
	 YcNP28Y+J8/Mla8ZJLcl+rpiUYlqvHY4+K5J0T1yDXPC3qS5DvDSzPIlmC2DtWdDUS
	 iN2cB0/7isbmA==
Date: Fri, 25 Sep 2026 13:16:40 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Bharath Kumar <quic_bkumar@quicinc.com>, 
	Chenna Kesava Raju <quic_chennak@quicinc.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahima Bhattaram <mbhattar@qti.qualcomm.com>, Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Fix fastrpc compute-cb reg
 values for cdsp
Message-ID: <ara6DbubyajRiJ51@zenbook>
References: <20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923-glymur-dtfix-v2-1-a4b1928e0c72@oss.qualcomm.com>

On Wed, Sep 23, 2026 at 09:29:39AM +0530, Ekansh Gupta wrote:
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
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Change unit adress to hex.
> - Link to v1: https://lore.kernel.org/r/20260922-glymur-dtfix-v1-1-159da6b0eed9@oss.qualcomm.com
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

This looks better, but it's not allowed by the fastrpc binding. Please
resubmit this together with adequate dt-binding updates; and please run
dtbs_check when you're patching DeviceTree files.

Thanks,
Bjorn

>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <10>;
> +						reg = <12>;
>  
>  						iommus = <&apps_smmu 0x240c 0x440>,
>  							 <&apps_smmu 0x196c 0x0>,
> @@ -8481,9 +8481,9 @@ compute-cb@10 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@11 {
> +					compute-cb@d {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <11>;
> +						reg = <13>;
>  
>  						iommus = <&apps_smmu 0x240d 0x440>,
>  							 <&apps_smmu 0x196d 0x0>,
> @@ -8491,9 +8491,9 @@ compute-cb@11 {
>  						dma-coherent;
>  					};
>  
> -					compute-cb@12 {
> +					compute-cb@e {
>  						compatible = "qcom,fastrpc-compute-cb";
> -						reg = <12>;
> +						reg = <14>;
>  
>  						iommus = <&apps_smmu 0x240e 0x440>,
>  							 <&apps_smmu 0x196e 0x0>,
> 
> ---
> base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
> change-id: 20260922-glymur-dtfix-6314526b4b02
> 
> Best regards,
> -- 
> Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
