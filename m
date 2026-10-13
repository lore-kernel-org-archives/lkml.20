Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F85B3FC5A5;
	Tue, 13 Oct 2026 10:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886890; cv=none; b=bEgj31G7V95UczB0M+1WnwyNAZUWe1NqQWrPVtqiy01yLhT3xeG7uPKr/KtWkSx95MVUh4u9JME/8ypw2BW4HZ3EMZNBfa9LNcBJX2pDvsu0d44+oxORqJMB/M1/RjuumT7KJuKtiDEqfR1/oZGiOdJfHwyghYQLGtkLA+b9jD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886890; c=relaxed/simple;
	bh=osJ1peGPbLMwCs9cQfspS5sCiI02TKIU/UTXsG1stLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOo6sUKfOJQ9qda1byF1YD4eaHzV3jXVxQ5g8wlsTd20cXuBiAKH69LVwv0j5H25RJVEzk8dDjyuLl+0UGH4Bxptt2CxjIX9/ItO1QyJCAodUMenPBY4YlECNkRei2gIHfLcyuiE/Ji0KLlrPiiE02U/PTVxiUIW9JfKcikGWEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hn/wZWmj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hn/wZWmj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5369C4AF0D;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791886889;
	bh=osJ1peGPbLMwCs9cQfspS5sCiI02TKIU/UTXsG1stLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hn/wZWmjh25EZbYbN/FF5nR2LqJo9EiavyiQSIAzsN0M/09vNu3+RKCuF/GZaZnOd
	 RqwvRCeEJve2OowL2azfy9P0mABbN/s2BhKbBGhi+8vkjgfBUjpOXQNQrh2wTcR6rf
	 RHqYtK78JRP4eDddHKlH1tTIUIDhuyTCiqcB2NA/VQlHan7JzmHd2r13JZG4JhKAbH
	 LHVsMwSFPJJQQsMzAKE4CpbTnrDZuOm2/j7yg6oJyYM2juvFihr0xd7g95BJImzSts
	 BuZCj7isf2/f3ALttnC4OyES0K4jCwpRp9DaffJAmlUtkuTXLX3WZ458/l+pFAazf4
	 gG2TRSzDO5/9w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CAACC6B0F;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Tue, 13 Oct 2026 18:21:28 +0800
Subject: [PATCH v3 4/7] dt-bindings: timer: Add UltraRISC DP1000 CLINT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ultrarisc-dts-v3-4-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
In-Reply-To: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886887; l=964;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=Z9HpEOPqPlxYpb5kKZuGAd2wMxf9yxcI9pY25EMF9zG8Gh7F+13d38i7zQfTyQLsE3L5h72pk
 KeBMHRd7AsGAinPoSTX3G+v2GwXwbYC8CUP+uId/TRbZUSxq8k5K95F
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add compatible string for UltraRISC DP1000 CLINT.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..878f267d089b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - starfive,jh8100-clint   # StarFive JH8100
               - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
+              - ultrarisc,dp1000-clint  # UltraRISC DP1000
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1


