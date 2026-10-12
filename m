Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961434A840E;
	Mon, 12 Oct 2026 15:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819770; cv=none; b=m6ZPM+oFFJ8jTw8SzNUd0JxuOtX5ERL8fn0A9vtWeDkvd7cQb8EpC34KRxNrpd3gwbFrbreb7GADKBm+4gIae/zi30NT/MZgPmntRcIu5Ai1PA8wz8DJitqbMFemXDWEZfnV4IEzKMAUvWIQ1RDfcUCME5E3TgPc2cftXcyC5VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819770; c=relaxed/simple;
	bh=BGGlCmXSJ9dc9pT6uMdwXBc9H2tpB4yFNU8GFLb6ywo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFWkZl5Q13XdFuzrERrnwmP1XA6wDyrDHg+h+axJKziYSgWTI89bPAzCKdl+9C3XjKC0KKHl3SrgHil+UYhRve3KWIUA8KIBnOFcO0I1HYwc0ZioagNDJX380DZ1r2RafmbRZuzPoJxCqOzR9rBTw6KipdYPdvzvoMKHJAiyluY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R7dAvg7i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R7dAvg7i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E495C1F0089C;
	Mon, 12 Oct 2026 15:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791819769;
	bh=SyHM0rJpa0i6/JQi3L2s4V3dPDYMlVLe2JZQsMF0C/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=R7dAvg7iyUGmIBekAWeOAmUXAljLV/GroY44/lp6nL99leW7X4yFzRaKKYaYFwdW8
	 WcdwUvnLQY+Lgqt8DVmyBt3qYG+t0X14lhcZ/iILBobtCSngmJ+WjaGlLw7clzrhkC
	 eleCv4qDQtHX2t491MSa6g+MEkSdOp40qKUbovojRYbiDrZr45Jw4zo9u/h9TAqkkS
	 iHud9xSDjJ31VeT/TBTQwQYhmGzVDqAz14dVqVDqzPwW/2qHcxJKvKAUAsWHvZyEDT
	 u5xG8hrvJQwvbnQxJsESuFRcmVQ1wtU7uIDHdPHrFC7KyWwQg+atAwr0U9WcLzeGkY
	 Nq2yr6KRVzg/w==
Date: Mon, 12 Oct 2026 21:12:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen
 regulator vote for QCS8300 and SA8775p PHY
Message-ID: <asz_4F1zUeTlMVvG@debian>
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>

On Wed, Sep 16, 2026 at 06:20:21PM +0800, Ziyue Zhang wrote:
> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
> and SA8775p PCIe PHY configurations. This avoids modifying
> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
> 
> These supplies were missing from the original driver, which was found
> to be the root cause of occasional system crashes observed on QCS8300
> and SA8775p platforms. Without voting for these supplies, the PCIe PHY
> lacks stable reference clock and voltage, so the PHY never becomes
> ready and initialization times out:
> 
>   [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
>   [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
> 
> Note that due to a hardware issue, QREF actually depends on refgen3
> rather than refgen2 as documented; refgen3 is therefore voted manually
> via the refgen supply as a workaround.
> 
> Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
> Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
