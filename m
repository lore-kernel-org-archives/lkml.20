Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752E639A7FD
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789297007; cv=none; b=cCpFXruozqKnPeu4Yd4V1rBJgxOIut72JAL0NnrVZqN/EwN/KHs50XNpLsslt5gS1TuxJMi2ah2RtQNtTaW4JM+tCRxvGyuWZ5zzMn9lVWnVYBwcvNFcDjSGpImDkup6E8lG8GAVc4Iq+XAa7s60o462M6YELh+PXuPh36Ohe2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789297007; c=relaxed/simple;
	bh=8q186wCuDnlUZDpGf85Wl6ogaBPkwg1I8QaA8YN6FBA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GhCUAaVQ4/YDNWKumCvBejOkuhLBPFBrK47vVnCal+4rJaN+1eFbXWO5i7llzmg0ExXMghxApqhsa/1BCEhiTPrv0v+y+NZayKDw2wWCcDjY+L0aXrFfKwWGyWs3y3Q5m63OdIhPEE/0Bz5Su90g/UFHRvs2GAZl0YCGcqB5IxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enurv+pW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enurv+pW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE231F00899;
	Sun, 13 Sep 2026 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297006;
	bh=MbCQ6U6GuK/b/cm8UVieb8vDK6L7jfo8D2f5/kdeNxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=enurv+pWoGByAYbjyNdx6lX3RraD9eJG44p3s414wjaeda6HqKuoTgK6e4mapalBu
	 69rjNYvXZBacVH3U9A4HZlDzgvBxcrhysFbgLbmfPoOERmPS0x6ZNval+hi3vQnkq3
	 +DdE8XWLxcUZ9vS0tDv7L9RntlSUFER5qDTcpyE0gegkeJuw/LSV/9PZpVqnJHjaSh
	 w0CzE3w/L6XOn8nxYSMInMgg8WbjM6OuIpWiWQyzJF9zhJDDRnDobJWJGsvegXO/AF
	 hMJyiPxvRG4qef0hw+QRpl4Ex5+8FQl9dnvLGm5pO5cC2njv6J643St5RFrpbufHkZ
	 t2GJXydrB73rQ==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Aswath Govindraju <a-govindraju@ti.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306-fix_sierra_get_parent-v2-1-cafe89ee5382@bootlin.com>
References: <20260306-fix_sierra_get_parent-v2-1-cafe89ee5382@bootlin.com>
Subject: Re: [PATCH v2] phy: cadence: Sierra: Do not modify register when
 getting parent clock
Message-Id: <178929700263.215437.1287296789549951145.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:26:42 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Fri, 06 Mar 2026 11:23:58 +0100, Gregory CLEMENT wrote:
> The get_parent() callback for the PLL_CMNLC1 clock was incorrectly
> writing to the register while determining the parent clock index. This
> unintended register access forces the PHY back into training mode. If
> the PHY is already configured, this unexpected change prevents it from
> exiting training mode.
> 
> Remove the register write operation to ensure the PHY remains stable
> during the get_parent() callback.
> 
> [...]

Applied, thanks!

[1/1] phy: cadence: Sierra: Do not modify register when getting parent clock
      commit: 02613aa974ccc84a5448573d253275baace95124

Best regards,
-- 
~Vinod


