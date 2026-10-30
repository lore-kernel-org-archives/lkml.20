Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379684;
	b=Sq54z6VKp/g80Qen+YG5YGeIwsN/iV+MHbWE8k2NWO/uuc49tYmauCm2ig3+A05OisKv
	 qsu0m/FxaPchFy0G6gDuzy+qmSv326Y8qSFQJdZyreMT1fAEq9K5Xa4aFT8wGWinvsLfL
	 sDwQGL7I/TZLyuXYp1weKNwIr/LyabaISzcUPoETZo0gJhwYrT7qrn+nuSWKYCMaGFr+u
	 tche7CDVV99Mpyapq47B6TlxPfT7ms0+OPsCHeM0l5DQs7by2DfX62LBaGuuDVkeg3Dnh
	 /lPT2+lsSNzfzmfZgPuaGCL0wbwAOJQIj9ZxLQJ0+lfoAIV1sKZDLola03Sz4mFueXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379684;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=DNr7OLUBSCbML7hIxgDudpyYYElYAev1OqTZx9LmESE=;
	b=utkoGcnQC0/xrBjCmOzY78xEQOlPtgy00pfyBIyxUswRC4f8gDsFLLHLIu2PdpZnMxPM
	 pNUxPpEHsuSfazT2U/9JJYS7LzcVO+LkgMPsk8PAf2ix1PNJFlbww1DZxM7Han8Z6gjm2
	 0yOfOroHoKsqUi1uZQAGECpS8dig9B8/ywEMSQrLphbc4UD69XxIROQPyA8X7v6TtGlNB
	 mmeYQ72W5pLFZ6FwTfRpjYtbEQMSz8lB4HfcVy7/K0H6itCceJm7Y9AaeRCMpkshVT41W
	 vpFUWuo0UWBB5wAYd0B0wCvWGwD33cCND4m62RF5Co4unCUlzUR91hNCX5UATFqgdoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVZEjJgx;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D671606A31A;
	Fri, 30 Oct 2026 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EVZEjJgx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FD11F00A15;
	Fri, 30 Oct 2026 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793379683;
	bh=DNr7OLUBSCbML7hIxgDudpyYYElYAev1OqTZx9LmESE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=EVZEjJgxFjp77aRkeTOGzxfcthGvnE0LjQ6Wio0xTI8wgXmIl1FwXtRjVhYjMtcdz
	 vWPM0Is2dyRtX54rJSy9/NqsN5DGzUIdk8HgrhwY/yDVWGy+HBe5LDIv7CetyoxXXi
	 dEUTQx+yu/AIF/iwi95xKuG62eidslE7o5UmmLt2VBZS9N6aoD9pGR5xEcimpSmHzE
	 BlaZ1Gdo8plzyhtVY++dXYhaG4kgUuS9CikRNBaN8h8IbXJ8/E9EAKAvZavNvi+wOA
	 XC0Y65Z77gsRffE3hU6mlMx2VVankH2qR6Ph0o/Y6yiscLjmpib+LkM4DakYArx9Vk
	 hCg77b+zemkSQ==
Message-ID: <dea88756-39d3-4c61-83d9-939ddb9336fa@kernel.org>
Date: Fri, 30 Oct 2026 19:01:17 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
From: Vladimir Zapolskiy <vz@kernel.org>
In-Reply-To: <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Hangxiang.

On 10/28/26 17:20, Hangxiang Ma wrote:
> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
> which reuses the x1e80100 lane sequence, clocks and supplies but selects
> the v2.4.0 common status offset, adds Kaanapali power domain and register
> the "qcom,kaanapali-csi2-phy" compatible.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index a64242c66cf0..b0b63dd3d958 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -38,6 +38,51 @@
>   
>   static const struct parent_dev_ops vfe_parent_dev_ops;
>   
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
It makes no sense to bloat the code for no good reason, especially if
these empty tables are to be added for every new supported platform.

CSIPHYs is not a part of the CAMSS on this platform, hence resources
shall not be statically allocated for CSIPHYs in the CAMSS driver.

See also https://lore.kernel.org/linux-arm-msm/20261026224957.1115370-1-vz@kernel.org

-- 
Best wishes,
Vladimir
