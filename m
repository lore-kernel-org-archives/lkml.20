Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD353976A0;
	Tue,  8 Sep 2026 07:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788851564; cv=none; b=mSTzHMEjnGUR9z4CIF8z8LwtsTp6+4sBfAcFU1B1TiKe7nIxqIDXlCDBRj4d0AMeUk5oIsup9dkHDabzhqHs9oR3eHF704HLTli8OLVR5Q6AzNSRH2yPOBy9eL2bjE95b0nHviBYpwcYZMPKmKAXBIZIwOZ+CbnNt7kT/2pWrLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788851564; c=relaxed/simple;
	bh=daxllI3Nm3NoXGMZW8Gj9EOQy4qBvKg3QVIwlZY19/I=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qkR/kOVpNWmt8VMyVuLctGI7Urea8WauoaQfMzGwvRhAtTCVNl1acmsRJ9/wpgM8jWhjVmwqFpjKD5Q8uuuZYZyiK1Qzjdbq73eERMmwe+Xiye3sWdefcAo77buZDGvyvAoZktToFIVuzz/GC525prolvR9fb+M8oRhnSdByn84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=GOnZIyq+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="GOnZIyq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788851561;
	bh=daxllI3Nm3NoXGMZW8Gj9EOQy4qBvKg3QVIwlZY19/I=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GOnZIyq+PdpMkKc5k9z8DneyxdrbVpG3EMtBtaI+hXqIZJjLJOBVwFh65uK1tkQBr
	 GuVamnf9hQ1qPi48dqNcLfqOJCzGdp6g1Y++PIM/tBu1aoayYSiwRh77nfKgswTw8Y
	 CqQuIr/4K/n006UJd7o3jmcSrn+srHlFzn1pyWUueR1PmjdIequNdSxI6mKmbsEcZA
	 s5QGsRxHmaa7Vkke6mkpaIgqJcy9JFe9jx8gV1Yg/cPwa9v9WdliBCwY7xz6PmCkTC
	 1eMBTehGAl95ahYMM8ruOnEXlIDZMv6QtL865vtpCMBl5/EMCMgBPNxvFtpgvjzcXY
	 x1kodxHg5WXkg==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB0C417E0D0F;
	Tue, 08 Sep 2026 09:12:40 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829193910.107418-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173: Replace spaces
 indentation with tabs
Message-Id: <178885156081.9724.2549176710128041306.b4-ty@b4>
Date: Tue, 08 Sep 2026 09:12:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Sat, 29 Aug 2026 21:39:11 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8173: Replace spaces indentation with tabs
      commit: 41891a30aed15910e1157b218f7f0397fa33ea4b

Cheers,
Angelo


