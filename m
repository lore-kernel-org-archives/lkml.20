Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C87F463B8C;
	Mon, 12 Oct 2026 08:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793358; cv=none; b=VgCRT038sL438gqYjvmdZL75VBWhKkyEPliay6yfm8102roRnv9Q1ru2Msf18VRTpoi9wpiNuA+kdR6yII+lf9HEMwXM+pA2fAlZTJbqdn1xRnEbj2KDF3AvO4TvwVxEO5ENInB3LRm3qPy4BiNYdsGn32N76vyjKkQd0kNL6l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793358; c=relaxed/simple;
	bh=iOSB6wjilIIKVuY8f8g9M9GFBxKj8OxJeu2LohLMZW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEWSx8Ybzvh8aKhFSU+B1dj3S2nNL3ViQ5gBAdMBDPNtsM3NmpCNiroXhNg+0u+32TuboGEdKChSs0Y009lOJ3xF/BQq9uiy+GAj+SEpKGY+Quy1L/O99s/DNEyH7bGYibLtBiIWWoAZCiVzBmlady3Nt6eZ0yyvEGMZv/6omzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLWpAxOm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLWpAxOm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A221F0089B;
	Mon, 12 Oct 2026 08:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791793357;
	bh=vunSHVVpIXlUPA0r1OVxx9a4QP94XTJFw2lWyEhg7I8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WLWpAxOmlbGixZkqHyeCcVaN+IMjaXmaX/HMvqbQMNyMmH/2+tcTzsZ9yxjqUpbaL
	 psvZvsVdsh8RxEBhskQODt83Plvmm1iM3/fKrn8x08lJs1t05hZ2ZIl9dbiE6eROGF
	 /uz/wOXY/GZ5RLDSZ2ziXdC0UPZFulspUgODFvsSQArTGYbCVwW4y4QjZ9FE4AW3Y/
	 55bCHm/2aeQXAhyz/YchjYJ2cWuAU1fbgVjAkJzF4Xg+Y4kifU5RT3+DbAqtU+pKjT
	 ROZ3FfP8OgHmZIxgujZ/4e1f6rra+z0jAPnflFYBhwhBCz723demqnF1RscXcuYqqc
	 q/+cLnfnx/lWQ==
Date: Mon, 12 Oct 2026 13:52:26 +0530
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
Subject: Re: [PATCH 08/10] phy: qcom-ipq806x-usb: support the MSM8974 SS PHY
 parameters
Message-ID: <asyYiFWP2n7JjBc6@debian>
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260810-msm8974-usb3-v1-8-1a47e1185524@oss.qualcomm.com>

On Mon, Aug 10, 2026 at 02:42:38PM +0300, Dmitry Baryshkov wrote:
> For the MSM8974 SS PHY instance the vendor kernels program analog
> parameters different from those used for IPQ806x.  With the IPQ806x
> values the masked write-readback of PHY_PARAM_CTRL1 fails and the lane
> runs with wrong launch amplitudes.
> 
> Add platform data for the MSM8974 compatible.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
