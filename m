Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794770895;
	b=KVd1mBpzl2nJMBixcCMsJZ1eeAHzEtqe+Rd4XrCR78eeVOjmDEr1yy6KsLspDi5irX6F
	 UpFCw6q//og5ItnSxc/cRuMDhqF5Un67Giz6vBxVlG3jIyq4yhknbOVQ30qW1y40tTtle
	 2gv45AHSLLYKoLZFM5lDozPDf9u0xtgV+xAjdTZj/ju5sVjQYqj8BruNKdNt1anFKs2ua
	 IE31tfiUrN0t9SzpPffDp8DCgUD/iX7H+4iRsRo3/9KtbUGQOEtLdyYxulm8MJy/ILDnV
	 SeWLvy/ZLrf2jjcAGJxFThHSyBGaQBN4ftAPJ8lXLbW+dxkkkFfnzSzl8QijgoVoAlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770895;
	h=Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8vXUwT5n2Ez9H80tnR2LUwnWnU9RLKteDWZxZYsi4Ms=;
	b=kEgs6T5YbTp27IEBSveEbL9jhxkQWN4MzDnONCEOr2cZ9WSlExh5KvdWpv48vf5KcGv7
	 KiE+DgUSVt07ia11ZuXlVUsKrspWQAvaXWiv3USplzDNTFTBYG8dYYZmb9OSuiBg7C9xi
	 lfOizVoWJJjQ1XF9MEGwkYAreEk2rEngbl1XlYcexrUpihqBLpbY5qWuJbMkDc166VmQD
	 pGIQvhof6Teg50ZRdf6wKDtyhZBdEhiEAjE/3loAGJ0Uns30tXkhFrZRZoRCzguj2YVZL
	 jr2/Da1yxUa6gD2MemsUC4TbUPY2albjNhEZlVpCEyK/Pty3ba7Po0rGrTOUCPQBdxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4369606A890;
	Sun, 15 Nov 2026 19:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D29B1F000C4;
	Sun, 15 Nov 2026 19:28:10 +0000 (UTC)
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
Subject: Re: [PATCH v2 1/1] phy: qualcomm: m31-eusb2: Add register
 XCFGI_159_152 for SE0 recovery
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Elson Serrao <elson.serrao@oss.qualcomm.com>, 
 Ronak Raheja <ronak.raheja@oss.qualcomm.com>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Udipto Goswami <udipto.goswami@oss.qualcomm.com>, 
 Jack Pham <jack.pham@oss.qualcomm.com>, 
 Pratham Pratap <pratham.pratap@oss.qualcomm.com>, 
 Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
References: <20261027015545.2758784-1-peter.chen@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 11:28:07 -0800
Message-Id: <179477088797.132702.6764909412562148256.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2666;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=CkVV2Z6n887sHlq0y6Nrzi6ogW1akCFY6515LpCrso8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq+gfKPwG9ryOEGXLeuMHwXxU0JzlEI+Op9xvr5
 o02zWKbG2mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCavoHygAKCRBVnxHm/pHO
 9QiBB/9d1C+xOeJntv2ZEA4qL+U2A8rvd+Qi2LaeOrgEaGIBehuvRlFrcfPHZssTYRG5/F+8Iee
 6wIrplH/Z3ZZWtOOn6Gf/KshKcKRiZ30b7XPDQSB5sRFmy+TZMdlMYjrDl06cMFdtIkN0xNv6SF
 IkghtKBRGiE118GbO2J2cyCEzSJmXUqzWyiLxo1+aAvi6ScZYlRiO18XQihDkRwpzkyEoyGzFfM
 42jv6Ilu57qGbzBkw9P3UjQuIIjrnaXxwc8SNwdR7LdVhX82mYdUEKrl4iR8mdvZRoYwgtmsOZh
 zURmrMqkN8YbQH3BHK6EKFxvXS+7RVk/kfu/2OhkxUNVqi6E
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-26 18:55 -0700, Peter Chen wrote:
> From: Elson Serrao <elson.serrao@oss.qualcomm.com>
> 
> This patch introduces support for the XCFGI_159_152 register to enable a

Avoid using 'This patch'. Once a patch gets merged, it will become a commit.

> hardware-based SE0 recovery mechanism in the M31 PHY when operating in
> host mode.
> 
> During PHY initialization, spurious pulses from external devices can
> interfere with speed negotiation, potentially leading to abnormal
> behavior. To mitigate this, the M31 PHY provides a fail-safe mechanism
> controlled by bit 159 of the XCFGI register.
> 
> When XCFG_SE0_TIMEOUT_EN (bit 159) is set, a hardware counter is
> activated to monitor the SE0 state. If SE0 persists for more than 2.5 ms
> before entering L0 mode, the PHY interprets this as bus inactivity and
> resets the state machine to its default state. After transitioning to
> L0, the PHY resumes normal operation in accordance with the eUSB
> specification.
> 

Please rewrite the commit message in imperative tone.

> Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---
> Changes for v2:
> - Add Fixes and Reviewed-by tags
> - Link to v1: https://lore.kernel.org/all/20261020061811.3127511-1-peter.chen@oss.qualcomm.com/
> 
>  drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> index 275df38256de..8d954e772585 100644
> --- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
> @@ -56,6 +56,9 @@
>  #define USB_PHY_XCFGI_7_0		(0x15c)
>  #define PLL_LOCK_TIME			GENMASK(1, 0)
>  
> +#define USB_PHY_XCFGI_159_152		(0x1a8)
> +#define SE0_TIMEOUT_EN			BIT(7)
> +
>  #define M31_EUSB_PHY_INIT_CFG(o, b, v)	\
>  {				\
>  	.off = o,		\
> @@ -88,6 +91,13 @@ static const struct m31_phy_tbl_entry m31_eusb2_setup_tbl[] = {
>  };
>  
>  static const struct m31_phy_tbl_entry m31_eusb_phy_override_tbl[] = {
> +	/*
> +	 * Set XCFGI[159] to enable SE0 timeout mechanism in M31.
> +	 * This enables a counter which will assume bus inactive if
> +	 * SE0 is more than 2.5ms and reset the state machine to default
> +	 * state.
> +	 */

Any reason on not making use of 80columns for comments?

With these fixed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

