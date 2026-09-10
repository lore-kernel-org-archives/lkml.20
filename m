Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6043CFF62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789026074; cv=none; b=pcCUOIBn4/9gFpjB6JIdKR79rU4a6iIMx6ivr7b76XYjrbLB50rJKJy7+va63bQwSqeeGBOyn8ZrsUBkDYesLQN5sykx1390yR4IoYZHexxrFMY5yW73EjnvaX9PAUJiIGt1ETgzW04wxK5kUmw49B/5f8pcPZZC1ryeuCxDr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789026074; c=relaxed/simple;
	bh=/mUIqen27iTJQ+qGVZdilGkl+ZjxfZXaVc7xvPeqU0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gu5iiHHD8FHLYfzXeaZLqUjtEsDiLHR40QrLN4MW5NW35Ns5H4FWl9rLgO/vgxW3EtzD+FnhgLcU+lakoAf5g/5DWRXnjp5kt1hCL1F2yZpww0HC8x4Fzx3meY5ryaIrIoui7Y1GUcvP3SprRQ7+Fmee5FuvIkHojZmn005jlis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=fG1tpQfz; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="fG1tpQfz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789026068;
	bh=/mUIqen27iTJQ+qGVZdilGkl+ZjxfZXaVc7xvPeqU0E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fG1tpQfzOnpcLFK8cOiDMMwPNoA6/CjjE4fbPt5eercMMoY9Rmlm81hIoP5mGSMD1
	 yrHgLK/Ol/sfgiB1qQomOQU2mk0H0XIUlNPmGubz4jNo4gfHURH5Ybr8RrGosuwM6I
	 LMMa+GriOtWXQFt5F6pd2MzUOErkRFp40P7dcCaI9w5DKNr0n+eq2j5Gzu5KkTaBp1
	 PWsWyYpGVbp/dtYHNy6ntZYYBRuRUGIJVqn0ZByzvFBmfdMFIJN74wB9zPr5KibdAQ
	 4UzS+L6+7LX+ANNewUBxBFd+/x2RAngBw/WWkiEYOxlHO0FMMWwukv1AE6+bfCGBee
	 PXJ4oTPoW8Uww==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C4B717E0785;
	Thu, 10 Sep 2026 09:41:08 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Justin Yeh <justin.yeh@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260903062142.1025443-1-justin.yeh@mediatek.com>
References: <20260903062142.1025443-1-justin.yeh@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-regulator-coupler: Add support for
 MT8189
Message-Id: <178902606853.11258.8562228346904746355.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:41:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Thu, 03 Sep 2026 14:21:24 +0800, Justin Yeh wrote:
> MT8189 couples its GPU supply (buck_vgpu) with the GPU SRAM supply
> (ldo_sram_gpu), which is exactly the GPU<->SRAM relationship this
> coupler already handles for MT8183, MT8186, MT8188 and MT8192.
> 
> Register the coupler on MT8189 as well so that both supplies stay
> voltage-balanced.
> 
> [...]

Applied to v7.3-next/soc, thanks!

[1/1] soc: mediatek: mtk-regulator-coupler: Add support for MT8189
      commit: 6c5388154299ee0b5ab2c654d5f3631bafd524a7

Cheers,
Angelo


