Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC8A3F4DDD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788814498; cv=none; b=l18V+B3MQr9DyC/r2J++EnzaWGCD2bhCh1LVvzfEHlAXjH9JeVWazypCV3llHxbJfXbVKxKcbzEEe0u7aF2XGuenYUDemhfwwMTJMKPHIRxNafBuhhTEnggXRwaxuGDBwPOqYHrDm+luQW8sLndxlsnva96xgs94osrC8GzhZBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788814498; c=relaxed/simple;
	bh=xlEiKlyOo3VtmXINq73OeZAEyRmPjOZq3/6db0qS0EE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G1Cdl7WTReVwy1gFPhrie3YnTpa3XnFBN6QtzuY8+HgWkOc2CL+yc9/H0QjabTS2cKzjum7qwUj/zqVcWyx5vXreah5YsuT2O2YLk2PdcXsmolCZbCBxHvpM7N5syOscT1U0+WO2/2UkaffcfC3EcM/PFdgoJW1VKUyijw2x30w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ny1MpYS7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ny1MpYS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF971F00A3A;
	Mon,  7 Sep 2026 20:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788814497;
	bh=DszcB6B2Baeds68gqqmdhNYLmUsAE/lCLovJMtCHvsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ny1MpYS7/xWLiXnWpMkW6Ga0kN0e25oxyFxaYR4yOIaJZYBE0FLmRpJ+YrZUEFPPu
	 keSFF6Lp6rXH5mjypNursTBCQfZL5SdNy5oHcY/SZK00Rl3TcENgaDJlAt0Oaa/V47
	 Ysw+QOy1Fp1hYlt7rTIySPjhxQP5cbpJ0hUgDx4G17EWdYd3YoeoIrApEkcPt2YIIM
	 dItz4WlBeldhaZBTyhDy2DCwrs122/4BJNuI7u1XG2rfNclatEfpLCSWcY4WfGq1aJ
	 92fXl0WzUMM3PI1fXEcvbxtiQLT1reFAUQyujn1HIGKOSDoERmTF3jFQEPcoG4Ja8k
	 ksNfjD8YJkNsA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Vincent Jardin <vjardin@free.fr>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: fsl-mc: set dma_mask for the DPRC devices
Date: Mon,  7 Sep 2026 22:54:37 +0200
Message-ID: <178881446329.32908.11212951412522310651.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731-for-upstream-fsl-mc-dprc-dma-mask-v2-1-ea7058b90f06@free.fr>
References: <20260731-for-upstream-fsl-mc-dprc-dma-mask-v2-1-ea7058b90f06@free.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=560; i=chleroy@kernel.org; h=from:subject:message-id; bh=M9/sCvI6UDN5RnwxgdqjKii4Rlg+88q5sddKIwzSa/Q=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTNV5nKllvA/PYFtzJHopqMcpTBzkRhkVlv1u6tbeGbc 3HaipK9HaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAiJ+Yy/OFcdfr0ii0/nVIY xM+Vd9vGqxxsO7NMJm27jPSacwe7me0Y/in6LPn49XLYu7Rs53rzZd5r+Pw99fN4lm9Y7pC140h BOy8A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Fri, 31 Jul 2026 22:13:49 +0200, Vincent Jardin wrote:
> On Layerscape platforms when SMMU is disabled by ATF, the root DPRC probes
> with its dma_mask pointer unset which leads to a notification:
>   "DMA mask not set"
> so the device is left with a zero DMA mask instead of a sane default.
> 
> Let's seed the masks for all cases.
> 
> [...]

Applied, thanks!

[1/1] bus: fsl-mc: set dma_mask for the DPRC devices
      commit: f85e5ec18eb104574433caec67f452dd6e02d5de

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
