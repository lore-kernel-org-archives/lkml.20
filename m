Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482815;
	b=X2iMp+nQnUudcf7+0AQCn60UwC6w30LTB0rwNpn9Mwm4lzlQWMPOmHcxDBtp96O3xTKp
	 vYmLi9xZ6ISldADDccx0xd9DbN1ftE7hFZ7MKqJMnKMQQFjBAdz6tQwwE9RxjGDLbfCLY
	 TYxt3xps1xqozFIUm6qbIqcP4ufDkt8K2qJefFII49/2WWXT+8NuFZeFy+pSTqtvLm1xH
	 PIOuB8mpsXl9toaJFW/zHXLZkyJGRfaSbpCZHCoZ/oRPqqGEVhDJQzW9AzX0dScWrcnWC
	 fJGAVXGLZpXdZyDo+jY6Y1sgUjRZHdguAdJ+De8tQc951KWWLLTHLWqbxh2KppXODQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482815;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=pxwntV3ax7d8ghlUHrSTVkv7b/WcoXHrf0AVg/hqyUo=;
	b=b++1qrRlYiPshHTMYvPIm6SQC/3iOHY04VwfF1rwUuMaJs1K8Wir9NQfwdzE6NQDSS9g
	 EU5zHz38Wv3xk9kqW978bwK/hffCjpypAv4m3tyJwXO6NIxxW3HrGW99SGq2CrFiRA1M4
	 pDoLfmG/wLTv7se3vF0sZaK7d4LfJlWrUCf4laL4S4Tf0EN/LcpYOKQIyFWj2Tm3jH+EM
	 dgTMX22e1I4msj5OzEsC1/PpiJJeUlQdj1hvngmvsPlNXU87yJk6ZGiLWewTsJyEqEPh7
	 luMFqC2B+OtwXPaQE3YwsfLsnd0wt3qijBl+acpF6naXaeNZzgJov708GJEGizxq5Ww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hRSOhJ1U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7051606A893
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hRSOhJ1U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80DB1F00A07;
	Thu, 12 Nov 2026 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482815;
	bh=pxwntV3ax7d8ghlUHrSTVkv7b/WcoXHrf0AVg/hqyUo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=hRSOhJ1UQfb123JzAtD9k716frj9o6HyPgxZFGPA3vj9ebbWjbV1ErBd2aXGbU7lN
	 M9rge3X+C5n94qtfAE14Sa7varsBnXqLo6YNAfEOlcokAChylNnf2IyLfK7r/ON7dQ
	 J/sE4YNl98e9rJF0AaCkNi+dFEa8W3O5wxqiNNqdzMgOhTx2C+IMzon8cceuZSJInP
	 ZRcavHzAFnj+aIqpFOsB2xtDOL5aQEmIrrytl+hs/cnfK/WoWA50e6Bp4KzhxqMh6r
	 +xnbI17vFoXpgAdGZJ77AYj8W4eyG1nLTJ+A9JZN1BnyeAXZs2lx2Jy6F1EHQuxXXu
	 1+hywFg8Ul7pg==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
References: <1792036787-37927-1-git-send-email-shawn.lin@rock-chips.com>
Subject: Re: [PATCH] phy: rockchip: naneng-combphy: Fix overwritten PLL SSC
 control bit
Message-Id: <179448281355.507383.5760526379124804602.b4-ty@kernel.org>
Date: Thu, 12 Nov 2026 16:56:53 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 15 Oct 2026 11:59:47 +0800, Shawn Lin wrote:
> rk_combphy_common_cfg_ssc() first sets RK3568_PHYREG33_PLL_SSC_CTRL on the
> RK3588 and RK3576 SoCs, then, for PCIe at 24MHz, programs the PLL KVCO
> adjust field. The latter used a plain writel() of the FIELD_PREP() value,
> which cleared all the other bits of RK3568_PHYREG33, including the
> PLL_SSC_CTRL bit that had just been set a few lines above.
> 
> Use rockchip_combphy_updatel() so that only the KVCO field is updated and
> the SSC control bit is preserved, as the comment and the pre-consolidation
> code intended.
> 
> [...]

Applied, thanks!

[1/1] phy: rockchip: naneng-combphy: Fix overwritten PLL SSC control bit
      commit: 96246dc6c16a5e5a6b4b9fde8f4ab9cdeb201088

Best regards,
-- 
~Vinod


