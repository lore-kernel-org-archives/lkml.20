Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FA23905E7;
	Thu, 10 Sep 2026 07:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025987; cv=none; b=A6Mxg1/xjb0YMZkuRrymNZJTq7F13uE0EXkI7gnzbGpGhpztYj2CkvpeQOohiu899c6IiwpOai8seZwv0baHNdvmtyDlpb+rmdlXCMQI36P4vsSbRKPzfhF/dP4F1L9PpBuiImU9VhoSq0FzAmGCjupz5fZoYPLef3ae+m1+PzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025987; c=relaxed/simple;
	bh=tX6eZXyL6wR23wIOq22oMAc/5Xx3m3IlWphVaszhixw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QbfISvw0PQ/qoriQf3PUndbmgMEj9d78rdFmPis6ND9Y4GPzE05OsU6qe6HQ9x9vm7+RuCn048pKq/DRJ+qs8CGHglAEBTpzkGHm9XqPYtusXUgnFERvhXqNTqWi6T3Cbkml1dBHyqJpBIfxx3eyNmLrPGTKOHcpxC8SemZddPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OnM02PA8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OnM02PA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789025967;
	bh=tX6eZXyL6wR23wIOq22oMAc/5Xx3m3IlWphVaszhixw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OnM02PA8Q4X5YFLl4fntpBgfc6QewEsP8gvuDAqM3IIEBNlgT2voZjdBZ5eWSMzKx
	 07uN47sV6TgZM+V9ECbVecXtewsYMPzbHX95oDQ3mmxJbgIMArB5dMFQ0dyixmuKDc
	 0j1iB0vQfQh5Vxtxd5P4a6RN4HjyDlnHZO7dO5U6H8RsTRnVpW4PtiPdq9Qyvk7q+/
	 Pey1ntGjWcBYA4rPnRLSLdUlzyA714xWITtbIQHltmRBQ2Yf9hOS5PuYgZeBL9/3hV
	 uDg6pRRr6V64c7V71RXo1OrU8YKjU55/x2nsc+OT21fREUuieH3hb9ulxLL9V5jHMl
	 Bk3f5qalBtXQQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B01F717E08A1;
	Thu, 10 Sep 2026 09:39:26 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Fei Shao <fshao@chromium.org>, 
 Justin Yeh <justin.yeh@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20260824090409.203230-1-justin.yeh@mediatek.com>
References: <20260824090409.203230-1-justin.yeh@mediatek.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0
 memory region
Message-Id: <178902596657.11066.1913117561872715668.b4-ty@b4>
Date: Thu, 10 Sep 2026 09:39:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Mon, 24 Aug 2026 17:04:00 +0800, Justin Yeh wrote:
> The SCP firmware in linux-firmware for this platform
> (mediatek/mt8188/scp_c0.img) supports MDP, which the mdp3-rdma node
> drives through scp_c0. On top of the segments it loads, the firmware
> allocates a 1 MiB DMA region at 0x50800000 at run time. That lies
> outside the 8 MiB reserved for SCP core0, so Linux is free to allocate
> over memory the firmware uses.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt8188-geralt: Enlarge SCP core0 memory region
      commit: 868297e3ebcc5c9b0e7cada19c82b11068faf4bf

Cheers,
Angelo


