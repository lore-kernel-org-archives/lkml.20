Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E944E13E9;
	Wed, 16 Sep 2026 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789563890; cv=none; b=YpbT3QuxmKW6TSAi3z3McO/N7MdkHXu7/5ZiP2ocoMr17EpBrN7RuMwnSh7KuhQ5cn13CYtHLKjqKPn7n0+3b8OOhlvkQLJPXe5oWxi46tJDG3dKuNyjHFLkA8F15R0ixOdgDXURWugyfJRqe21voWn7VSXT1o6bwnr4xOdS9bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789563890; c=relaxed/simple;
	bh=tzgn5QzvgAOKeLXGf261rOeljkROqctlS7y9i8NT/c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NTOW8ObG3fiL1YDZ5eOoMw7MVC7AoHdHBOkhV7+9M81Qa83c+y379/HiuKD1ne69vFvqSxJPGGtj5qIFQBH1mwvjDcUf7Sp0TEgFoRNFxpGubuAhNFobAsLuJRaHYGS9qz+GV2kzi5r8piId+dcD37u3OZ42+Dt+PCry3yi0qcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Gpe3jnNv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Gpe3jnNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789563887;
	bh=tzgn5QzvgAOKeLXGf261rOeljkROqctlS7y9i8NT/c8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Gpe3jnNvfWdB77XGJ+zQTMyb9U/czO40qvphwhB+wioEsWLYZWZ/HmULQ4ZTOK5i5
	 JpAMDQXgHsYOHaESuuPrwFAAYn8uLUOUlgro+o9/TnkowC1XqxIDYy8gq/56Kag1QV
	 GgQOIc0xw7WDGIIDKMSoiQisBjurKEhZxgKA/GRJ29u5+I/SD0mR5TztecOivACHNd
	 TmkfB5VofSsofq/h++GUCB6jqghVMHy1AgIftZIISS4F8YN18pvHUxUXxTldUvctjT
	 WfveNFlqLDIMopZUDF6O6Ih/x858NBUKh5hXuI9Tauz9GobM2TiTBgKPKTHZNioLJt
	 xSedt0Ty0KIMw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E70617E03B6;
	Wed, 16 Sep 2026 15:04:47 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Icenowy Zheng <zhengxingda@iscas.ac.cn>, YoungJoon Lee <getfeus@gmail.com>
In-Reply-To: <20260916035953.3111607-1-wenst@chromium.org>
References: <20260916035953.3111607-1-wenst@chromium.org>
Subject: Re: [PATCH RESEND v4 1/2] arm64: dts: mediatek: mt8173: Fix
 MFG_ASYNC power domain clock
Message-Id: <178956388732.116277.1060079303641396273.b4-ty@b4>
Date: Wed, 16 Sep 2026 15:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Wed, 16 Sep 2026 11:59:51 +0800, Chen-Yu Tsai wrote:
> The MFG_ASYNC domain, which is likely associated to the whole MFG block,
> currently specifies clk26m as its domain clock. This is bogus, since the
> clock is an external crystal with no controls. Also, the MFG block has
> a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
> diagram, gates access to the hardware registers. Having this one as the
> domain clock makes much more sense. This also fixes access to the MFGTOP
> registers.
> 
> [...]

Applied to v7.3-next/dts64, thanks!

[1/2] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
      commit: c9b3c82c9f1f86cdb2449d47e4ca66a19159ee12
[2/2] arm64: dts: mediatek: mt8173: Add GPU device nodes
      commit: f0d8c2b05e2d384c0162b41d3728433c1bb23972

Cheers,
Angelo


