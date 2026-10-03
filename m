Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B6346FB3;
	Sat,  3 Oct 2026 20:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791057704; cv=none; b=cIGizokDHHy42pV7pw6hDh3H09agdhimlUeRbq7MMQJplTSuC4GDW0MUHlW1otFLIdBjob9k9c1ecpi63fYUWV34pdQfwMDv7omsHrlGCCc64z6HhUrfEvyILj7s3Zf4jGU7a30dJJvOi6QyhCsQSTboAyLNZ7Qpjbs1Q5QDi7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791057704; c=relaxed/simple;
	bh=YU3NR0bo15npDt2Jb0BuPnt639T+tk2DaxLl545IF1g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8H/y8yVPAeKOeoDFo0aMzPD6WxkcjZJF1gIN8lJyOSZcSVAOQJQACMQOA/AZo99BUZyzc66HEjXccramLOFdS3gW++e0u9aQfdeL5lLU71uZtkcqhtGR8GEBgIwS9RybbXLdFTKslE8XBSvDwIwlrl5hzTgjn2p6j5M/ME04Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=oUuDmln3; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="oUuDmln3"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791057698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fDQY7iuVWorvARYB/kxbcDCgmHiMd48YCWb9KH3HF1U=;
	b=oUuDmln3hJLxmPeIVjLm1YxXDtxmICcQ/c4C0hKxW6ACLEyjeDMMe8ZHGcTHsOD3Jd2THt
	qFs7gYco51kfVj98/wHh6sN8nRvvUwdhfnw4KuQE530DNs+pSuu6zejxpqlUfkOV/spdpk
	t5sXucYqBCQoknZPtCQkP/FUpTtVLh0jF+o5kEUok7EhL63UFaUIueWYzEnNpdNQRzZydg
	Wkk8qEivD7zK4tuZaFyKkzlMr5Hvwk6Xpf3FZgmLYXYowFZ8rS4AvPHjxsrF5o19IGmsjv
	lISDVPP2VreDdW38qZzTVr5UvXDO/CWajpG5PiJZTZYXHDpOoBZ39OKTUPs6UQ==
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	=?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 3/3] arm64: dts: mediatek: mt8188: Add the MFGCFG phandle to the GPU
Date: Sat,  3 Oct 2026 22:01:32 +0200
Message-ID: <20261003200132.866240-4-michal@nozomi.space>
In-Reply-To: <20261003200132.866240-1-michal@nozomi.space>
References: <20261003200132.866240-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GPU driver needs the MFG configuration block to enable the GPU
timestamp counter, which otherwise reads zero.

Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 14a320f0c70cb..b4be89bf55bf7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2266,6 +2266,7 @@ gpu: gpu@13000000 {
 				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
 				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
 			interrupt-names = "job", "mmu", "gpu";
+			mediatek,mfgcfg = <&mfgcfg>;
 			nvmem-cells = <&gpu_speedbin>;
 			nvmem-cell-names = "speed-bin";
 			operating-points-v2 = <&gpu_opp_table>;
-- 
2.55.0

