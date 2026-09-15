Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E0F3D8918;
	Tue, 15 Sep 2026 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456189; cv=none; b=HoUepJdgPHHstdfy+dQniyUaY6XCNVP5VfqkPvbXZ3ao09Jf0ICJjEwUR5x0jg5R4CigAcVqFa5+tuTazxsnNH7AY2w/d6fmv23aaKaesQoucpEH24JdCyFdvUEjX8XJwbB8wB/ZgnZcDfOL2z4T06vEqnljBovD7FxPUvOp29I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456189; c=relaxed/simple;
	bh=nfEscqhaF7B6NqUvS9RBcBrgOGsuW0ue7kkwzy5KLTg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JvD6E84lYvNmvqHKY6g4rYOFVdygaCzkNRsZIKIxXtGMDkwUZXdSv4BXwNN2FqW/+jmJPg1P2tbPsbiF7eX4wP3Y85ErEZjp+qeathD/1SXA3XzeLT6m0MvDQsej5uH74slOnjqbJd2TxLYEi5xtz9Y1nPeF2LrnZr98g0/X0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B1UzSc44; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B1UzSc44"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8541F00893;
	Tue, 15 Sep 2026 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456187;
	bh=/K27mxe9awqLXCoqsJ9jRsb86rIPPKQr7g5yuTtOxfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B1UzSc44GeHez8fe4GxW50BmLJcwpPxJ5MBOv9/9uF4lPIvzChHxfAWDPhIIOrkJa
	 YYuK9g4rNlRXLDEMetEwBg6K9T+RQvb1PQmtRBrcAZCQ7VpiBNN7SjRJSC8tDyL/Fu
	 nxs2tLQO5/rm7IZg5slYRKJwohTxOzJkCT5iBUaBXrLqZxaQdXWObhx8kpLZjMy86x
	 23ubFKkCTRg7poZNwd4p8iONlQz9v5NkWN3+K3AuvRu8Wii9MyBVgJm2K+hqr2MwT4
	 r/ilSy3cPNU629VQofgcuR0hTsOTPZs2HVNcnroJZlhOeKlPR1cpnkMTkC52aoaODe
	 aYeltPa4o9Z8A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Congcong Yao <congcong.yao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Zhengnan Chen <zhengnan.chen@mediatek.com>
In-Reply-To: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
Subject: Re: [PATCH v4 0/2] memory: mtk-smi: add MT8189 SMI support
Message-Id: <178945618368.44717.5402356332875633769.b4-ty@b4>
Date: Tue, 15 Sep 2026 09:09:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Mon, 31 Aug 2026 14:52:05 +0800, Congcong Yao wrote:
> This patchset adds MT8189 SMI support.
> 
> The series updates the MediaTek SMI bindings for MT8189 and adds the
> corresponding SMI common and LARB support in the mtk-smi driver.
> 
> Based on commit e30626823a40 ("Add linux-next specific files for 20260828")
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
      https://git.kernel.org/krzk/linux-mem-ctrl/c/605e6053de5c639abe4cba71644cd3c5fae46374
[2/2] memory: mtk-smi: Add MT8189 support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/771c036d72eefe36aa6c953ecf44bee4c000a368

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

