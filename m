Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236753932D9;
	Mon, 12 Oct 2026 08:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795185; cv=none; b=GHTqFKerGN4eHoAWKhCTb+ODA8ze21TGg5AU93B1p0r/ruMQQIVfyaqfb/6IemHaEJjpWLm1zioY1mNZ1pott4QXDN0gw916E7rWhUC4aNLdyu10NAa1Z8Y6hZqLK1oYD09SQosuWufHdHN8rHDjqaTDxHFowQzFCSOTpJUvPdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795185; c=relaxed/simple;
	bh=v1m7DxeoCBUGurGnKzZxpUTAHzi2cPy4QD8HqIzD7VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lFEfRVaWxmTMWJnrAIfOT6NE6xUQJNS/Nx5xevj8InECoSd9QLA0kc3xFNt8/leXAwVRDQLoW/39Ir/RxGRRtd7jMqwYGnzYDF6Y95NFzardRhjMxzYS12un2yK7oyHSn4kYb4sdVK54zG2guhsLl6badVKW3etAdapayOH0NWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOTmSrlc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOTmSrlc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DCB1F0089B;
	Mon, 12 Oct 2026 08:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791795183;
	bh=45YrvmMDQ6QVG161kTArk+3NDJg159pe8dpu5wmApkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kOTmSrlcBdrAmyMqCKn7Ia8fP1pHCxHhIqw6G3Zl7oI9By7NbC5DitpZbnNZotBb/
	 tHsIUmZ5Y55XUdlAhy5OIBRMXUVeR0D7L0RaUqufrqAQph8fzJToht1vfjzx5BjQ9O
	 4SuscqM1083vgDwu3nsbPyIL3Gq8HoCV1jxZPLc99IL1sTtSOPWV8lGOfoDMXLscjG
	 PXEH3R8R2GF07CW4kzPCBkYcmTxIdj/JgNxSjW2o9pStiHYVAak0rtpJkyvmKyNCbJ
	 lHA1g+r0gNzmkv06ngePIy1/EmTK+4omLetk24TQv9dac6Bt85wOQ1siq04QkKk/cf
	 GJ+0dpfhBX8WQ==
Date: Mon, 12 Oct 2026 14:22:56 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom: m31: propagate reset errors
Message-ID: <asyfzmoj6xlLKUhD@debian>
References: <20260830131442.3025-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260830131442.3025-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 09:14:42PM +0800, Pengpeng Hou wrote:
> m31usb_phy_init() enables the regulator and clock, then performs an
> unchecked
> reset pulse before reporting that the PHY powered on.
> 
> Return reset-controller errors and release the clock and regulator that
> were
> enabled for the failed power-on attempt.
> 
> Fixes: 08e49af50701 ("phy: qcom: Introduce M31 USB PHY driver")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
