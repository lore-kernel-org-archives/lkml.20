Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750FF26738D;
	Thu,  8 Oct 2026 22:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499107; cv=none; b=eftiPkhbb00My7RXGOej/QAapzFf7HZjOFCdgnP7B5yhUM6bmJ3GaFg0Fhl9lLAp4pYbCJsZvuKJwIZxA7MfbZVcoyacmXV18lcrOPPWfr3d7XGG1XR10vj2L5CDeOO8eBnVVt9sPqJI7VPuD/B7TtBAwvbfNC1+0r32n+BFMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499107; c=relaxed/simple;
	bh=vHlfzfzi7HO/xZAENkuTNrPPpFV+s2lLEIia1WfmRE8=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=uIA6DWQ2lXwYBNJs7N5bjtGQr8aB5jr+cyxj8RTWxKF8z3u/Mb6GTPtjdXSIYs2XeelqQ0/MXHZ+HxvZ/06LBaz17elatRPSxyJ9DmK1pZDDxA08eJGOSNlKO58JiDLgjj550b7kfcYI5kldQhPFxCW4zzju3BKhBnVZMhFgIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkYkoHCj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkYkoHCj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1FBB1F000FF;
	Thu,  8 Oct 2026 22:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791499106;
	bh=iLdTiEVPrApuA5G6QdvtoyCY6ZuzN0yU5bu5bnjyl34=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=HkYkoHCjKJanUCancrzSBhDY6TleHSKKoj5C01SWqd1Y88hj8GjRzlx5PZ2Yl2zx/
	 XTGWjJbk3PHkYh4RqJHNmCki/lOm1XU4cU54VTxKnQBTxzB6xCwV3Ci8Y0dJaHpBv6
	 CIMIqsv9geBVzwSz8LUjpNLj8QC1eB0RASzV7TAz8973n616yzo2LWBJBXZh1o9XcP
	 IqTAhFhz22XiV1S5vQ2/uidiZa2mtpujZJgXjIYEQLQKX9AYl84veQ/K4JDSDEGVJe
	 ZIwkXgu7cznL9G29nvYhBUoFZW6v5XsiRkE31KPpSHOvahJMIEOp8IRC2e3glA4wVD
	 RWhr0BojSCL0A==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v19 06/12] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
From: bod@kernel.org
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com, 
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-6-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
 <20261008-kaanapali-camss-v19-6-b2c583ef50e0@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 23:38:19 +0100
Message-Id: <179149909971.2596899.614558280262994598.b4-reply@b4>
X-Mailer: b4 0.17-dev-e5aa4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963; i=bod@kernel.org;
 h=from:subject:message-id; bh=vHlfzfzi7HO/xZAENkuTNrPPpFV+s2lLEIia1WfmRE8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqyBtb9WuW0bH40RuT9RdXay4f9684jbka9ebhW
 CnkSpi+HeuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasgbWwAKCRAicTuzoY3I
 OvhiD/4rzmQIlAkJI1Nk0Q1lJ1eFfwGbu5cr6AKR562M63TF9OCsh+n3eoWcSmKovJUYzvZS7Pf
 AzJd4mcUZpZGdAdIEcdDVyx16RMUjLGWV+P3Jv0q6ehAbJmcHaBj7CjGBbOsDqXKxmdsVzf7Q2r
 Yu7Oyh2gXiJ/4sJBazRyNgzYSe+R0aLnVuKDODjXYP+kPZjaCjqeTJ79dsHMNJkwipbdsl4SuTI
 Ty0U1bN5ZZPTSrLaIGDZWVExzEKlPuu+yAbhJJcluLX5xLkX4zNTu+xlUgX+iycbzdPVga1wxOO
 +HgjI/BGPp0zAQAKTV+GZWcC+CXzQ10jYBCpUVhsNnDyEh9fidDqtvJbxGo5soiND8JCL82a4IB
 SujVOnQb7MUjPOuAZlOEoqMfBL5tLWMQycu1c3m9IxlO8pcg5NdkZGEimnnfvOVn2eSK4JT+OaT
 wqi5EuPIO5JpXKiBa8OGxqQfSLPmpKIUjcGxJn1i/C5WOxzNHRal2z71xdSGxS6bqiMr2JLHMLE
 xeqD0+0Vg2TvWpYjwJ3TdxSr7ZVdkBntx7NyFg5SIGEdOSUmn+AGzYtOyjrAMwz796alc1qcu2E
 ojV7Abw7x94sYxzyMre/5jZ5bL09tK0K9eHBw349ORdvV4vabIu8CzNbfVHoQzenoczXC+vh7UB
 kztaJ2yd3UMEhlw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

On 2026-10-08 00:14 -0700, Hangxiang Ma wrote:
> Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
> the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
> rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
> which reuses the x1e80100 lane sequence, clocks and supplies but selects
> the v2.4.0 common status offset, adds Kaanapali power domain and register
> the "qcom,kaanapali-csi2-phy" compatible.
> 
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index fca3de214a92..eeceb79c1e86 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -38,6 +38,51 @@
>  
>  static const struct parent_dev_ops vfe_parent_dev_ops;
>  
> +static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
> +	/* CSIPHY0 */
> +	{
> +		.csiphy = {
> +			.id = 0,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY1 */
> +	{
> +		.csiphy = {
> +			.id = 1,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY2 */
> +	{
> +		.csiphy = {
> +			.id = 2,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY3 */
> +	{
> +		.csiphy = {
> +			.id = 3,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY4 */
> +	{
> +		.csiphy = {
> +			.id = 4,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +	/* CSIPHY5 */
> +	{
> +		.csiphy = {
> +			.id = 5,
> +			.formats = &csiphy_formats_sdm845
> +		},
> +	},
> +};

We should make this now very straight forward code into a macro driven enumeration.

Anyway.


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
bod

