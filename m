Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B323BCED;
	Mon, 19 Oct 2026 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394387; cv=none; b=Fs4JkeEosFXb4FnDlzpxDMNc+ZtxJH31LgVuIqcgh9LSIpO8uDodTDlIYu2mXs+cjQ5gY7N8DHH6O9f2P5H8aogOEehsZMXXCgsPpd/LPxtItdI+coT2wss3GZ1MqizKTUpAFRqDxyYumUifG7/Qq45lrVfSIxHeFL2me1Ioj4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394387; c=relaxed/simple;
	bh=i/5yQg6J/Qrk6FFuLt5g64lVVnhIWQwuYeP1fA/mtF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxFzXyVM6Z0ZfZseHpnNGDicwQ34BxY8qdzSRsoloiOhhedJ7o0mnYps9zseEpWpX1U4Dyv084tTxGPIZ8Sug2Y3Fg49j6zS2/980Y1Mk8qBZV0GSZALJYtVy4yVp5+x+6GewoIeuzaIZTfMbxawFjsmNvHcpauzl/9oFTUaaTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=isXXnYUu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="isXXnYUu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57401F000C4;
	Mon, 19 Oct 2026 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792394386;
	bh=s0Wnoav/C/2euhA91XqCk8d4XBb2ZZW0lDhI5no6CQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=isXXnYUu1A25YFRh2Q2+ZRDGWo4DLyWZJSBXzsCTHa4qQAq0uYyJK8Z9JxQMxvHQB
	 4FZJScSZqb5gQiqGVywB4UFjNfvbrZ0JFII041jN/KH0XIlbXl8QlavH+Df9SCBoEe
	 ln9p7gRNfHnHvOs60/T5/HrpD1W7ROK7hSMM4HS0OW33vk+9vamlOUBZlv8aI9ZdFz
	 zZ4W9dQkQiB3RP1WKRvWKlaYRmOCWqmUdr35O+2W9S7CiIIkaubhe1DllRlohnWkm7
	 APbXdBzssNIvnkSiOznAgJyfQAmabogF0Gze2ZRmO6Q6ZPi/lT8AxEKWkUOfNYqQLA
	 jy36/gPXFqtTA==
Date: Mon, 19 Oct 2026 09:19:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Cc: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	gjorgji.rosikopulos@oss.qualcomm.com, hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com, 
	jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com, vladimir.zapolskiy@linaro.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] dt-bindings: phy: qcom: Add qcom,sc7280-csi2-phy
 schema
Message-ID: <20261019-idealistic-silent-ladybug-783cda@quoll>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <20261016235502.2274268-7-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261016235502.2274268-7-anusha.nandi@oss.qualcomm.com>

On Fri, Oct 16, 2026 at 04:55:01PM -0700, Anusha Arun Nandi wrote:
> Add a device-tree binding for the Qualcomm SC7280 
> MIPI CSI2 D-PHY, modelled as a standalone generic-PHY
> provider like the existing qcom,x1e80100-csi2-phy and
> qcom,sa8775p-csi2-phy schemas.
> 
> Follows the same ports/port@0 data-lanes shape and mandatory
> operating-points-v2/power-domains as qcom,sa8775p-csi2-phy. SC7280's
> CSIPHY has a single power-domain, the Titan Top GDSC, matching
> camss.c's sc7280_resources.pd_name = "top" and kodiak.dtsi's existing
> camss node. Two clocks only (core, timer) -- SC7280 has no shared
> CSID-RX clock in the legacy driver's clock table. The core/timer
> naming matches x1e80100's and sa8775p's clock-names convention for
> this pair of clocks.
> 
> Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>


Basically same comments.

Best regards,
Krzysztof

