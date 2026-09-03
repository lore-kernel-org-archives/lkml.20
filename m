Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A7F2F8E86;
	Thu,  3 Sep 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444420; cv=none; b=dgKysRfYgNTNOk4rFEIlrG3GD28dDPEwNJWdF7IwY9zHI2urIYGiInV5aVKhnpCdLT5npseWZqgtbl0o94WLP6+r5veCZEsDZaYOvRQ9xHvPiFgyab0qpFfYQqt7y4rehzdvyCsnI9QbK3Vc2B6RobBbLY3pMDBHlNdFZSIBoro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444420; c=relaxed/simple;
	bh=LyHP8Bb3AiQCbPFSjeQIemdYCrjAICsf28GcYpX7sNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvEaH6Vh6rhgJBJDXgKoMTi7kcMznAyGEvzUPxnB0uQQ8B0iiJg7egjpJkNfsy5jwmN366AJwNbimWQ7BDLhd/qyi3qxum1LqoJcIc0nHHc4mpz11WLLKxRJ6/zvTM2Kcajd2kwv5zlkcqLAa8KWSyCcR3BsWwFL+xOvLk4d8vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JuG6rXQd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JuG6rXQd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 139B71F000E9;
	Thu,  3 Sep 2026 14:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444411;
	bh=4O+cFRCtbfrFkucWjIpmN/RTgFXtwZtS/9pUBY5EbdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JuG6rXQdPR+1U2yUZJGPIP7TJjo6Tsb1RmEXBpridfX9LnWb5XAwBG3NigKwZf5Fl
	 GQ2gIbhHlmb6Fjanp010CQfhmN7qLnbbVGJEdRpwx9yqDi95ge+yjdOGn6cTJGTIRg
	 Ix7WRob1bcbsKR+g3leXu/oqnn4DT+1VYG1q1NJ71jqhQ7BpFLnQLjl9oueaYLQb62
	 BGDn8Z8ouCliCVlGhg7Vxq77zfM9Bq89qTIJVMmZ0Mv2Z1ypUEk5uTd5OCulC6Dl88
	 LmPmq+Xj+6zSLwg4Iyh8SF8Z+e4jmicUp/RwJCTO7ZUnqCHywDrcYNgtjhKPIEQwFm
	 3jeITFfPq/k7A==
Date: Thu, 3 Sep 2026 09:06:47 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maulik Shah <quic_mkshah@quicinc.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: shikra: Update rpm-stats
 compatible to SoC specific
Message-ID: <apl-vKnwHWFJ8Kru@baldur>
References: <20260713-shikra_stats-v3-0-4be17121729d@oss.qualcomm.com>
 <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713-shikra_stats-v3-3-4be17121729d@oss.qualcomm.com>

On Mon, Jul 13, 2026 at 01:46:56PM +0530, Sneh Mankad wrote:
> A generic "qcom,rpm-stats" compatible only reads stats for SoC level LPM
> stats like vmin and vlow.
> 
> Shikra SoC specific compatible allows reading individual subsystem level
> LPM stats along with SoC level LPM stats. Change it.
> 
> Keep "qcom,rpm-stats" as fallback compatible.

So the fallback compatible works, but the more specific compatible gives
you additional stats?

If that interpretation is correct then this patch is correct.

But then you need to fix the binding.

Regards,
Bjorn

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..b299f316e3c61858c4b380f6211d0f36ef9fecf9 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -535,7 +535,7 @@ apss_mpm: sram@1b8 {
>  		};
>  
>  		sram@4690000 {
> -			compatible = "qcom,rpm-stats";
> +			compatible = "qcom,shikra-rpm-stats", "qcom,rpm-stats";
>  			reg = <0x0 0x04690000 0x0 0x14000>;
>  		};
>  
> 
> -- 
> 2.34.1
> 
