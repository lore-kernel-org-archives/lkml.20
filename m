Received: from mail.nozomi.space (mail.nozomi.space [139.162.184.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898331F938;
	Sat,  3 Oct 2026 19:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=139.162.184.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791055876; cv=none; b=QCE82KkrwFIn5QOsR+vQOJ11GjHVAUGk3jIvVsFWoQ+0c1AXVvSE+8aoaV35SoXsKPSX5yvvB0gg/FXOZ8AUpqiGOEdKB5xexbOwyVLuG8iKcjqpnYp5qnLO3kIinTk7nRdQto1LqasixIBlDt4PpkE0CBG7J/PkvvCWpCMrWO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791055876; c=relaxed/simple;
	bh=vA7HAWPUavj6FIbDMt2ILnzd8dsgaPqRyi/3WYRnJF4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r3py7K/mdR91lQXmVJwL7FlCDnwYPmgzvfujcsBQGHras/T6vGepu5SbwaCfzZ4s0YJ3YnqI9N6GbDmicUZT1yN4amKI+cStG7IVG4OsZf7mFiAigRGpUdl1BtJRqPqXbHBnE9FdGqjzSgqhzkS+4hF6DFDA7aF+eQ/x4Y4PyWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space; spf=pass smtp.mailfrom=nozomi.space; dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b=n07RX+EV; arc=none smtp.client-ip=139.162.184.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nozomi.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nozomi.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nozomi.space header.i=@nozomi.space header.b="n07RX+EV"
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1791055872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xJ9KSHknag2gDAaw8qLAHoLRC7r7kSMR52AYAhpMLLU=;
	b=n07RX+EVKuWHsRjsaX4eWbgeYSzn9qujxFCMaCJH23olVCAiFq4xdRxcAGHbd+j3j4HRZL
	nnkEXepYDHpzN5BDnUNJ6GS8Z4+f+BAaJ5WMntZNTBWdv6kt7y5kQQnppv4NEJLv91vPgL
	GAel/RXZ/4Le7gByXBsQbDVqPI3klGakh462uMQ71pDiiJ4TVsIdkNtxvLYpls3Mi3xuey
	bKyob7XFy0EfWh2mzNAOaoO06CfUK6cYYVA5+U2M8NgocgQw3MkZkTqc1b0N8ZbyLnkG+S
	KmZ9L9exSxIgedN9N/87NjefVOWroqS6foRN4NQ6AVO7b0r1/9etWI/KblSo7g==
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fei Shao <fshao@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal@nozomi.space>
Subject: [PATCH 1/3] arm64: dts: mediatek: mt8188-geralt: Reserve SCP dual-core memory region
Date: Sat,  3 Oct 2026 21:31:06 +0200
Message-ID: <20261003193108.789939-2-michal@nozomi.space>
In-Reply-To: <20261003193108.789939-1-michal@nozomi.space>
References: <20261003193108.789939-1-michal@nozomi.space>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The trusted firmware on MT8188 protects 0x70000000-0x79ffffff (the SCP
core1 DRAM region) in the EMI MPU. Only the application processor and
the SCP may access it; accesses from other bus masters, including the
GPU, are silently dropped on write and return zeros on read.

The region is not reserved in the device tree, so Linux hands it out as
ordinary memory. Under memory pressure, GPU buffers and GPU page tables
end up there, which causes silent loss of GPU writes, translation
faults on page-table entries that are valid from the CPU's point of
view, and the GPU resets that follow.

Reserve the region, as the ChromeOS device tree does. No driver uses
it, so describe it as a plain no-map reservation.

Fixes: 5e6af7f54189 ("arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri")
Signed-off-by: Michał Kopeć <michal@nozomi.space>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 801eee735afe6..d8edbde6ee4ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -197,6 +197,11 @@ adsp_dma_mem: memory@61000000 {
 			reg = <0 0x61000000 0 0x100000>;
 			no-map;
 		};
+
+		scp_dual_mem: memory@70000000 {
+			reg = <0 0x70000000 0 0xa000000>;
+			no-map;
+		};
 	};
 };
 
-- 
2.55.0

