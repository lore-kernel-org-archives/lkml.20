Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913DD3FB07B
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791020190; cv=none; b=SjX8uzvHC6jf1NCes5og4ZPxEn0N/izLzp68Avguu/p81W9oSrpu/ejnTJiEKsJzcOTkIjYTD/T4vIpY4HuVde4RkHzIUftfDFhpgmv4IG/xOhgF24s9Pi2qcRl65/IM5OwePwq442C1LveeG04L+6VV1eL+ivKYhHlNkucLSus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791020190; c=relaxed/simple;
	bh=X8ukNZR9Pi16VxhmglFSrOJScod9VLO1S5+5w7rXLAk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ndPm1YNXxGLrMWs8LKkpeKssuFdzG62yN2IYFGCBys6+0nCP5PF1smbnAnX7vCI9MIiiqLT9ke6i7B+kBHABlKHQw/lrJNO5agedwugSlncK4/wYAUPnCtxEPZsMzeVC148MNHrF14pJJReUWp2fu5YUTwxwHF76F+G9vWp0bN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzA2DMIs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzA2DMIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D04801F0089C;
	Sat,  3 Oct 2026 09:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791020185;
	bh=MrBYuxJRI8Q0gYPvH2mARUPM0a0QmKyyZXNcWC/6qBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=kzA2DMIs3EUtDVSj0D37/deDvrCJb8OHldkuyNuYtIzVLVnjGVEr6538nJKIb9M0i
	 XGPf2Uf/IDYVGE5zoBZbX8hbpT4O3+aj6QG/4Hsh/msjtBZ6EvSUIW6L74StrtVTty
	 wTh+Yz932o20f9ZY2jO4BQS8xXIZHaNC2RHjrEyQ1hJE0P8PbBAmyAxk2TaR5bi+eb
	 8+VY1kshFzf0cH9hD9OYt5DOhylO5OTtE/AO9zOGTXKFZWffYxAg3mCkBhlWPLP7e7
	 uerw1wJ868hHFRf1bhxEUUhhtV7W2QC/Ctm6yqKUHBf67HvkQip+HCopBTa8Vlxaoi
	 gjdBa9B8WGADA==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nikolai Burov <nikolai.burov@jolla.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nikolai Burov <nikolai.burov+review@abscue.de>
In-Reply-To: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
References: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
Subject: Re: [PATCH] phy: mediatek: xsphy: clear U2 DTM0 force bits during
 init
Message-Id: <179102018248.199361.12549208373713075681.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 11:36:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sat, 11 Jul 2026 13:34:46 +0300, Nikolai Burov wrote:
> On mobile SoCs, the USB PHY is completely powered off during bootup.
> As a result, various bits in the DTM0 register are set that prevent
> the USB 2.0 PHY from functioning. Clear them as part of the
> initialization sequence.
> 
> 

Applied, thanks!

[1/1] phy: mediatek: xsphy: clear U2 DTM0 force bits during init
      commit: 02df7fe1297d35d33c9841f345f61bf10f969300

Best regards,
-- 
~Vinod


