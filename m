Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756B227EA7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 05:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790400337; cv=none; b=L9hJ9yCFw/D4hU7Cgm+xIEVstFUPDts9ciJ1zmVynoia6H/zK4+JFHX865Sn/4s4XJZ1zgmPZVld+KAm00s77vw44nSNKWL92GqsCoHk2318AOmHyDkEwwfdAyTq/Qxe2ve+DkesSwhQPkCuBAdgFCgV74OzCJZ+iEFnrOe5VrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790400337; c=relaxed/simple;
	bh=4AL7OlIQsMK5qMXftisPJseQHNNMubr/9pbFPIbHU0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBdlF0oA7TLUAg346a2GHoCr5pjFvsRw+H38c6GvsA0FHPw8Jsm5J+wUITU/qEMD5fu7TFCiWPu42zo2pbIAQIJLvc36LT7UVWRUlVyDQ6wNovWu10CRC8GrGYQCi0XsYxURO3CJRgvewj8Pzo0/Vb+j8wogvxF6/1xE0geZJOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEnjdFuF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEnjdFuF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C761F000FF;
	Sat, 26 Sep 2026 05:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790400335;
	bh=frP9cwfXZdz8eO3e4ZwyLEzkE+nCZQAWARGxvCfxCYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AEnjdFuF1jOT+nx6DQR7j+yh9ZBD9x33dJhOUVZ+2Vv7b2hN3K9x2Rc60hWHNAId3
	 MOHJFl4LjpzhffKJFtq2pGWEqcLwkFdknomuAU+EPhsMmnDOtvC2k93Saw/EzaOHV1
	 OpeDv30tnY2kdM+AxbBDUbmhr8DM2zfzHWMhGoQbtPOCJ4crHB9QsDk4St7TLv8Pi1
	 JTofkmFzpsaxdrjDBEcscjGJEdqKwa4SztC27jXr/q5X9TcDl9ESPciXJPVSGCm6hu
	 Rn9y/ork87F0LuB9KsdAA7slFpm7rqaDbcyy1VFkKHm1WHr0c1DWGAJddBgIaleQbm
	 2BPQnt5eZipAA==
Date: Sat, 26 Sep 2026 07:25:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Zhang Yubing <yubing.zhang@rock-chips.com>, Frank Wang <frank.wang@rock-chips.com>, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@collabora.com, 
	Sashiko <sashiko-bot@kernel.org>, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v15 11/11] phy: rockchip: usbdp: Only enable USB3 when
 not in high-speed mode
Message-ID: <h7rddelztl3m3abqplfeir6irsctem2gqq4tl67gobpwa3upxg@uutr75zkg73h>
References: <20260915-rockchip-usbdp-cleanup-part2-v15-0-8d507cb1174f@collabora.com>
 <20260915-rockchip-usbdp-cleanup-part2-v15-11-8d507cb1174f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260915-rockchip-usbdp-cleanup-part2-v15-11-8d507cb1174f@collabora.com>

On Tue, Sep 15, 2026 at 05:06:14PM +0200, Sebastian Reichel wrote:
> Ensure that USB3 mode is not accidently enabled during PHY re-init
> for systems that are configured as high-speed only via DT.
> 
> Fixes: 2f70bbddeb45 ("phy: rockchip: add usbdp combo phy driver")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260626212424.C215E1F000E9%40smtp.kernel.org
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
