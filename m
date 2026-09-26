Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764CB3672AF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790399353; cv=none; b=KMbipgnynXf+GaRVd4WHPr8Muxf3ufryBkY7qPW2Pb86cAOqLi+7Ry4Xmt1t5HY1j/rv/6ov8z9OIiE+BBJENPPk2VTGb2hpGgCBZbfPv0/DxhPgGiYJDnxzOLIpXpSt9BRPq0OB3qltIJC1zsKcvwEHu4l/7RxfTaInQKAyiiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790399353; c=relaxed/simple;
	bh=YQjCsKG7Lv/rROv8rmmW43ewdfFsE18PtcmkfP9YEdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HLNr93JVhPW88HqItZV89CMM4BKao+ExKPMaulmGjV4FRDNNcXeuj9jLYkH6g9nMZO06VglBL8ygFAbG9m8WNSX0+AmZfWMyigJxxlxVMqOKXU3gSpHPqtb19H+qj/ZCTAJ4J8a0oVdBpKsgU0UkVbiaSln5I8xbwmEYdNKFhmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mks3qAiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mks3qAiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F871F000FF;
	Sat, 26 Sep 2026 05:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790399352;
	bh=cwcHuq8u8FHk1FhGe1zoIDQ4d8vQB2fIMXLhU4nJyvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mks3qAiBGR93ufgz/Xo+BYSXDzczpPlBZniZYq2OgkBMacrDNz9Oe8AFi0IMCxL3r
	 2xYo9pX2hPtn15inzJWMZkLli0QEFcQSajWd44u/rkVfXW4eHmiqqU1dfGu2dapBN7
	 50m0clm7/lE7QZnHRwX2G5wUzdU8r8di00MpJCclyGUsitXn9eKOZGuhEE0r0FHcCR
	 KEh6vwQEo7VfL83jDqCnRwWyt8hdQgK8GFXGf8nZWhHSUaQai7TK+vQReuWr/a4PeW
	 JDLtMfmphMbkHalT76BUVKvCEtFPQHB4sccXEAen0/2N2YnkEPv5J9puAyB4U+rfx7
	 Qeo909NLQX3qA==
Date: Sat, 26 Sep 2026 07:08:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 03/11] phy: rockchip: usbdp: Re-init the PHY on
 orientation change
Message-ID: <5rmluc5rcni32h2f4yv63xvcfnavzfckibj3vls2spt5nnxynh@3bjtgsqhvm4j>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-3-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-3-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:06PM +0200, Sebastian Reichel wrote:
> Changing the cable orientation reconfigures the lane muxing, which
> requires re-initializing the PHY. Without this DP functionality
> breaks, if the cable is re-plugged with swapped orientation.
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
