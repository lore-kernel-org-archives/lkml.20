Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793529455;
	b=xjCiW97Njpy3DcY85jGO4b5WoIsDGcElTab6+wPLRYj64O+SgTqQv7g5CzpyH+CXNynJ
	 MFzPM0yZmnb2fGoDoKu6oEI69+eXIrXZbXVmOICQ6HZZNw/rJ25faDKHlLtZ6k4q1XtD4
	 IfWbZoJRBXUfNyuFionUaho9LCvvEcqV6ARIF1uxh2zlJdLFuIPnh6zdzXXz/B+G49QLv
	 IptUWxINkFQ/RtmR2HPNx018OWUkQikCJgu6NIcESGkll9dVr2FeC/zlofgMGEEohVzI9
	 I04kzR+ryyW7tBeLzsHWvlultIrWJCfNK2uUJPN5mGSIhK7spzk3knrkJfdCxVUf2Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793529455;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=jHWBeLP/Q/20y/m58MMxm+0+YIuZL+2NrT3hIUTG1tU=;
	b=5t263TqG2yw5nNaCBvXMc2ySKbNIyHn98j8UOJ9xT8s3ZLYYb1rPLnp/dJ3lqK7De7JQ
	 OE4elC8mR0Mhb/pciXRFfvKhn64GubqxOMaOCZD8Pkw5N+cMu+UueWvaruGCmVW2Ci+0Q
	 mPDe+rBLL4wfKuOEnDKa4FY/7wTk9T+iT16avg6/fIffciPBWZ6/A93JOqZ+tYA2jejWm
	 WgCzCbq0MPGCzDD1OL0oX3l0+SReheBgSbJ/uB8KRzeVciGYFLOrwj4WNgLpQa6ZUUgp1
	 mzxcWmtJomJe4sgzCANpUoUUpYDrOVQAtf5iTqzkum2+xqiUPh5rurbr7CesgQV1Rng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqy5TWMW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F1E606A324;
	Sun,  1 Nov 2026 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iqy5TWMW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 061731F000C1;
	Sun,  1 Nov 2026 10:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793529454;
	bh=jHWBeLP/Q/20y/m58MMxm+0+YIuZL+2NrT3hIUTG1tU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iqy5TWMWazbPl7SxBRqAChBstT3tUuXPbTDG+WlSRHva+1JJ4mRZOpF4seTRef+bO
	 wapS/SuHBBqf3ttWyWePSwFeo/8Q4NWv9nTGK15ZFUdYujUv0cpUJ2lmZNBA+I9t6w
	 pjdzSP2AngS+SQLjhqL0W3Cq7A7JBD5r2MmYL+OzXM73pDUPStFig56zuQPaw6x7v/
	 La2KEn6gRNNsimrp7cvl9vvohuS0z8DNHzk4njqfMbwWh6KCk8HjHkJR2UF0pUOZmq
	 KpdyBeL0yZkNTKS+YLhon81q4s3GWrApWxZnNNRKlur6/wiHiaSoZE/L+AM0u4boJA
	 gf/gUgcWmdY5A==
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
Subject: Re: [PATCH v9 4/6] phy: realtek: usb2: introduce reset controller
 struct
From: Manivannan Sadhasivam <mani@kernel.org>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Stanley Chang <stanley_chang@realtek.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Zavertkin <misha.zavertkin@mail.ru>
In-Reply-To: <20261016180314.31760-5-adilov@disroot.org>
References: <20261016180314.31760-1-adilov@disroot.org>
 <20261016180314.31760-5-adilov@disroot.org>
Date: Sun, 01 Nov 2026 16:07:28 +0530
Message-Id: <179352944875.2955.10382814832002747329.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2521; i=mani@kernel.org;
 h=from:subject:message-id; bh=ZKu3n39MIK3Aq79uiN81QL3iHJlyeNqsbbmw8kK2ats=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsh6LpY92YdLcc7Jqfbhm3iC358J9uE1a957+NKx7sbQh
 1Hf5z5M7GQ0ZmFg5GKQFVNkSV/qrNXocfrGkgj16TCDWJlApjBwcQrARETZ2H8xB7wR8zb69TS2
 oGq9Rvcn7dayKL42j/z6/zJKCbtkpyZ4bPgtEbbwyssza07aTjh98jnvYrejSx93fmkqNf5aJxN
 l6bOv5d+X3uv57T6lK5zr71zbd7vh0enG8hLbxN06xz6Y+8YEihdtVlsfxKf4QHg1k4pTg431C/
 P2WR6vVvcn1SXs1m3nq/oSmH4+Lz76QUDicvdSppAl7jPyvZmC/qS8O1JzccqB1f8Fkx2Sp61x9
 tf6qr2cxX3G5OIIMa7COUEZfZnf1dwWKAmbfOVptK1aqP8qRZLVYr/iwr0dpWpKxufv1eitXGB/
 xdmu12h+abuWtcr6tcaLTOMD6qwXHL5tkVYa25x0z+cqAA==
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-16 23:03 +0500, Rustam Adilov wrote:
> In RTL9607C, there is so called "IP Enable Controller" which resemble
> reset controller with reset lines and is used for various things like
> USB, PCIE, GMAC and such.
> 
> Introduce the reset_control struct to this driver to handle deasserting
> usb2 phy reset line.
> 
> Make use of the function devm_reset_control_get_optional_exclusive()
> function to get the reset controller and since existing RTD SoCs don't
> specify the resets we can have a cleaner code.
> 
> Since the vendor usb driver developed by Realtek doesn't assert the reset
> line (or in their case clear the register bit), we can reasonably assume
> reset_control_assert is not needed here.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/phy-rtk-usb2.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index 5e483c853f02..2ddad7be7353 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -17,6 +17,7 @@
>  #include <linux/sys_soc.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> +#include <linux/reset.h>
>  #include <linux/usb.h>
>  
>  /* GUSB2PHYACCn register */
> @@ -128,6 +129,7 @@ struct rtk_phy {
>  	struct phy_cfg *phy_cfg;
>  	int num_phy;
>  	struct phy_parameter *phy_parameter;
> +	struct reset_control *phy_rst;
>  
>  	struct dentry *debug_dir;
>  };
> @@ -676,6 +678,15 @@ static int rtk_phy_init(struct phy *phy)
>  	if (!rtk_phy)
>  		return -EINVAL;
>  
> +	if (rtk_phy->phy_rst) {
> +		ret = reset_control_deassert(rtk_phy->phy_rst);
> +

Stray newline.

> +		if (ret)
> +			return ret;
> +
> +		usleep_range(5000, 6000);

Do you really need this range or a fixed msleep() will work?

> +	}
> +
>  	for (i = 0; i < rtk_phy->num_phy; i++)
>  		ret = do_rtk_phy_init(rtk_phy, i);
>  
> @@ -1055,6 +1066,11 @@ static int rtk_usb2phy_probe(struct platform_device *pdev)
>  
>  	rtk_phy->num_phy = phy_cfg->num_phy;
>  
> +	rtk_phy->phy_rst = devm_reset_control_get_optional_exclusive(dev, NULL);
> +	if (IS_ERR(rtk_phy->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(rtk_phy->phy_rst),
> +				     "usb2 phy reset is not working\n");

Error message doesn't seem right.

- Mani


