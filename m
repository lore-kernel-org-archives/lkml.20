Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893854AA1EC;
	Thu, 10 Sep 2026 15:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789055788; cv=none; b=Sg5TrfYBbBw7A+KLwufAwUhCyoW4dZEPVllMjiYrKewEbJmI4HxNx8RF/+t3I5YiGPqZQxkXsNX/Ay0bbAnhDJ7jd6rh+tlmiM7VqX+z0+D+bnZnpV59viS81ldVHz13ieG9PI8aZFoG6Hidry5DlC1PH1e2CvsAhAL3v8CqQkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789055788; c=relaxed/simple;
	bh=0wPBQuAwEqrykF9+xWfNkfzPr9buu9dW1edQKRxbT+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KtpRO7lIG4kIdwPQ3gDfC3E/a6aokoQgSCS2u0qk/dbCTPgGcU4dkv0a8Q4J0KiHeGKDjA+SUsIpPsP5Skzf5XLeK5Bv4QGMQbpNi+vmC57VuxTjs3ykvRhYJ+Zl+ActdBhMYz9y34UFsEpSfF1oXYpFRvKd4Ehw2YgIju2QaYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WN2nasbJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WN2nasbJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0C61F000FF;
	Thu, 10 Sep 2026 15:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789055787;
	bh=T0xOV2XeqOE1Qmp8JpFgC8m+9TTqK0Rb0vPMhfpsMmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WN2nasbJLrjKzbp+V4Q2gFjZkZhqtUqNA7JzY923WT4+pC5Rhy+8o2AuHb+IsLVl7
	 lDYnNgSi6F3XJmcFQzAYmkrZb2Q7YRDuUnnX78xhExdNPPbtwpXlAWwD0Sr/jVAyCp
	 Alzfpxd6rG/5Ds7PKIBzASRgs9055rLevso2px4hdX5C2nFbgm1/8HnnxwmFjh0AeJ
	 AKmnBfMuSd3eEBbznDUOAerlRsSixpnU8uT68PE2fYauSuxL6VTRDiq2nkYTnwno2Q
	 h+4ilMZfvJlFaFCem+gD5IolN+DELILMltgM8Xl/xAAqtL1/0k4Fry6jEFCXJ0dV0M
	 PBqtxn9dttPrA==
Date: Thu, 10 Sep 2026 17:56:18 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 4/5] phy: qcom: m31-eusb2: Set phy type to EUSB2
Message-ID: <zog5ubweep57jr6dokjuzr6eupd5uj3yb6pjyextx72bls2dbo@v2j4nwuigixt>
References: <20260905-eusb2-interrupt-v7-v7-0-820cf5377a70@oss.qualcomm.com>
 <20260905-eusb2-interrupt-v7-v7-4-820cf5377a70@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260905-eusb2-interrupt-v7-v7-4-820cf5377a70@oss.qualcomm.com>

On Sat, Sep 05, 2026 at 08:59:08PM +0530, Krishna Kurapati wrote:
> USB controllers like DWC3 are agnostic of the kind of phy (USB2/eUSB2)
> connected to it. Set the phy type to EUSB2 to let the controller know
> the phy type when queried during its probe.
> 
> Reviewed-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
