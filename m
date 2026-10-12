Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A6A45198A;
	Mon, 12 Oct 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795363; cv=none; b=BD+TIRs5bBDr6/nAdN5sv6tXsIwzKa8bu6zBhpQvw6JzWW8DOtmxBylYfIC7kLBRrbnYFfnMSRcDhI0qkUOFcZlrNNFXpUsQcYZALOUaaMchDZG6BYGE77w2i/JcK7EPSarWSQ5pcFVJ391LAEbQcX7K4x2lTi6VhvmS0CL8KB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795363; c=relaxed/simple;
	bh=9P7XXqTWqkj8DOves+uakItKENAArtxRrENA95ZYYkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJ46TGRuU6qz2DjVCdQvWhxqLJeWZyY6FsIbQAecHYYw7U1+4pVjbbHhovVAYY6LJP6Y9OnojImGohFHI1qKEZnXTfrlrbsry16klNBTdB1H+VKWWr+kfJ0WGvomtsP4h2VRfQvv3aXbBduxLn6aIDtR2+CucjtsXabb+AeuSNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ME51KbxM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ME51KbxM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137E71F0089B;
	Mon, 12 Oct 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795362;
	bh=X6lNe2RmuHX5NISOUi9IFEz0sbex5xlvxvCryta/tds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ME51KbxM66N5jJnpcjn40lI7a4b8iZVOkRD0YU5poBgxbs4l/F+D5I1Nq0gqlnhId
	 OzS1zoi4rVdabngnRzhI8QKux/8keL2rYCbcQnPpzdDel7p9YLBrXhLK8jbN2b05a+
	 0WR9aARxKOtmFXCFcdLkTC0SAjONwZnitA239Tm0VxdKnvUER4E55UXz/jqfYl6nb1
	 k2/4bTCkeDw9yX6O1ur0W3R8NHPHuZqkBsEv2Q1j7AHZTsvuvbx4IXXeorDc7CCqMj
	 BcXYvwkr+9fYfewZuqByNd6imYzxj/E2gluwqpUXw6FzhVdOe2F6MslsBabHbi1Iuj
	 Df5ECdrQxJ2WA==
Date: Mon, 12 Oct 2026 14:25:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Iskren Chernev <me@iskren.info>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/5] phy: qcom-qusb2: Fix SM6115 init sequence
Message-ID: <asygiJawldi3vzoM@debian>
References: <20260903-topic-8996_61x5_qusb2phy-v2-0-4c3f980a4560@oss.qualcomm.com>
 <20260903-topic-8996_61x5_qusb2phy-v2-2-4c3f980a4560@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260903-topic-8996_61x5_qusb2phy-v2-2-4c3f980a4560@oss.qualcomm.com>

On Thu, Sep 03, 2026 at 04:25:29PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> I don't know where the existing one came from, but it's apparently
> wrong, according to both docs and a downstream DT [1]. Fix it up.
> 
> The updated values also happen to match SM6125, which will allow us
> to fix that platform too.
> 
> [1] https://android.googlesource.com/kernel/msm-extra/devicetree/+/refs/heads/android-msm-bramble-4.19-android11-qpr1/qcom/bengal-usb.dtsi#145
> 
> Fixes: 7756f1d6369e ("phy: qcom-qusb2: Add configuration for SM4250 and SM6115")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
