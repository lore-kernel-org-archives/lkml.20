Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C8142589C;
	Mon, 12 Oct 2026 08:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793192; cv=none; b=tLDorjhurvCN8gp8e/k8Zipu4HmQOTW+2XPqaS6QSe2xhOaWNtFYX3ghMX6FZgugsDT76TJF1fPSzBQLFzGOg+6wTmC60sTDI/2gTfnfYv29QnSoV7hp4MJ4k8kAm4kx0huvqjfL+CZxtBYb6zDNWJ7H7jxwvEZVaykgc6bVkqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793192; c=relaxed/simple;
	bh=gmzjOOSF7twJel4VeHM/+0xsEa2hrSgbS2bdTCWg1Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PryTCsA5gCmgFRLARvhT0MseUppuwPuelEkYfAKGBIjLz9xqKumtKYnhqTaKNUSk8OBDqi4oLt1qmX9fNdsuzPqa5oxPRc1nYIbgZM7djuZ936T4WgsBZhF257SYW1+4hl346UXihlh1sN2nDndPKbv4Tjq4LsukfaTUqLYargU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IovvEw23; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IovvEw23"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 785E41F0089B;
	Mon, 12 Oct 2026 08:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791793191;
	bh=Pt8dgJWek7/0/LhAmTZzYWHs1dc5eBB3jyEzUfzCwPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IovvEw23o4JOxMRvlwPv5HJ/Hb2AlhEMasVk4bqSR24fsLDUuhRyAPI0AgbmBJMPc
	 +qAz7NmiPAtyG0ZsfnDymrKSQh4ehZhJabtS3NNn3aACrcYSFQBo4ZvKb0yxsQjHxF
	 LOLbsY+g2AVfDu2ZklCRbNp8KzHtSNehYfV+DkAda1sjGWqvkHAM4TMLF71ekvTvRR
	 qIuYNlm9CfvFJJndbVYYaA57HqvVdCSlbiKb/OeUD3nTgzkh305qZ8cqtBTKvLtW5K
	 dq2H5dgG/nogXHksvD+yNTlejovr9RGqWVfMYiZg6F1qEyzU1qMfQSPh/pFp5KH5zG
	 CfEgrdE714Ehw==
Date: Mon, 12 Oct 2026 13:49:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Christian Marangi <ansuelsmth@gmail.com>, Andy Gross <agross@codeaurora.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 06/10] phy: qcom-ipq806x-usb: fix the PHY_PARAM_CTRL1
 field masks
Message-ID: <asyYFw2UACD1XRzD@debian>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb3-v1-6-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:36PM +0300, Dmitry Baryshkov wrote:
> Each of the PHY_PARAM_CTRL1 field masks extends one bit below its
> documented field: TX_FULL_SWING [26:20] is coded as GENMASK(26, 19),
> TX_DEEMPH_6DB [19:14] as GENMASK(19, 13), TX_DEEMPH_3_5DB [13:8] as
> GENMASK(13, 7) and LOS_BIAS [7:3] as GENMASK(7, 2). Also, the field
> described as LOS_BIAS in reality is called LOS_LEVEL. FIELD_PREP against
> these masks places every value one bit short of its field, so the
> programmed swing/de-emphasis/LOS parameters land shifted and the
> neighbouring fields are corrupted; the masked write-readback in the SS
> PHY init reports 'write: ... to QSCRATCH: 4 FAILED'.
> 
> Align the masks with the documented field positions.
> 
> Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
