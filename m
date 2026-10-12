Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE034A4850;
	Mon, 12 Oct 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820256; cv=none; b=Dz6HNfuBwpg+Gox1oPcL3MOiX6mXyxFNQLMyPp5vA/q4y1u9yVzX9tvWrugIL1CUiVXiEq8uaOWSs7YhZD25O5VF8DFotmtc8U8GvNHgYeNRKRner8Mf5VVhglafgPdYGHcVLEZWr5WD2bzwFQdYqJmoW9+5hcUX3VbKH0QoE7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820256; c=relaxed/simple;
	bh=/VB/0oILGCe9ka5bBzppqURQ/Jr9fOM/c8Hw8yQpu4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hzdOZh4B/jug6R+P8vbTJ62Cnh2vigydwtS4+rgZCQMU8ACIZ0koR4ciMnTqbJ7UNDt7thvBdLTJM24aFX/wTID/bDghFAyG3BBqmHaOgSS08D/xJfdM29gqpRFSJdAQsCi1HW3jovSgWmW/3nGUZO+cHtAiYw9aVpdcUv39p3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mTFNcYaT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mTFNcYaT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711241F0089B;
	Mon, 12 Oct 2026 15:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791820254;
	bh=jgr67/or1a1c/B3+4YJbHGtTvO+rIAQEWqELo95zqOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mTFNcYaTXDOUPmO3VtBoWVl9qEBJOxF1xBcrWIztIQ/Iu+w04nhCyKV/NRDh7Pu/4
	 p455s5/yOh3M63dlV0VA4jNIEkYt6I0zsFvAfMAK0t3CWjRkW3d4340VRea7pODRrL
	 acOjGKuZ4DLpUP/IhUm3W1cAAGzZKSLSumY1MvDkFD7apQW/3j0zzsh2iDjNNWknsA
	 mKw6CDhxLuuS3RGi3Db7/bPHmA4yo0CdLuVu8+UlJgVCD4n7CFqDqjKJ5syJ1dZ/kh
	 n17gQAXG/nnNAI98TXOQirLWo6AwLxCMltp3+IeQ2Lf9vKuF6suCY4Y23UmFxeQM5N
	 2F6UqDed9AKWQ==
Date: Mon, 12 Oct 2026 21:20:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qualcomm: phy-qcom-eusb2-repeater: Fix SMB Power
 leakage issue
Message-ID: <as0BPGd_BJivizEW@debian>
References: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917-smb-repeater-power-leakage-v1-1-6d7311c3c03e@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 03:10:09PM +0530, Krishna Kurapati wrote:
> On Glymur, it is observed that although the exit call is done, there is a
> power leakage seen on SMB2370 charger (which embeds the eUSB2 module as
> well). As per recommendation of HW team, disable the repeater during the
> exit call to prevent this power leakage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
> RB tag from Konrad received on an internal reivew.
> ---
>  drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> index efeec4709a15..7db2fbff6163 100644
> --- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> +++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
> @@ -229,7 +229,10 @@ static int eusb2_repeater_set_mode(struct phy *phy,
>  static int eusb2_repeater_exit(struct phy *phy)
>  {
>  	struct eusb2_repeater *rptr = phy_get_drvdata(phy);
> +	struct regmap *regmap = rptr->regmap;
> +	u32 base = rptr->base;
>  
> +	regmap_write(regmap, base + EUSB2_EN_CTL1, 0);

Can you safely write 0 to this register? Since init() just sets EUSB2_RPTR_EN,
wondering if you need to clear that bit only.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
