Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843B145D904;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=jo+HvzNtv2PsOUBX88yj8vMPx//cNxLl4MHG+SHno4+90ilLUzsvM+hQWzWne/7ipJ7/+4VW5gQhO9ZEYgdBBBH3C42SRMMW+DF5ytt3wjTq45VVvjW0OD4HWsWkgQVnK1GmWN8vHWc4mDX7kyHKz+g4N/Ke21mhn6nsznLCNhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=CVrPnrs8qwQFVuAK2JblKtBbOLQAR+miyXJpO2WE03c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uPexBhJGxgD72cEIdDiNpTxTneRCmOKKE50DNGhd2SruGluIcbIw3j2PDzr9VNWRUKOfzMJhG1dtuYGtkJaf1e6lczKav5p4/svfTmDsUyyAnG+5/OO6+naEE4OWep4B2OZ/r94ku/45QIKzswQGf4WVYqOXj/nqKIkVZbg2ikY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEYJWFyG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEYJWFyG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ABBAC2BCFB;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=CVrPnrs8qwQFVuAK2JblKtBbOLQAR+miyXJpO2WE03c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fEYJWFyGEEtcoC/BK/muvqXm9IqSbdNvHkHSbwHXLnIAdGwwvKSFxQ5KSlHalM77i
	 n/uiNVBNiFTQ46tz0g1MhkwdsiA9URYYfWn5AM6QwuMCBpdk/xKKJI85uS8nyWMIPc
	 j3OjN1eO1v8wGN52ecJ6/x6R8Y84LeGMJho0UNOSNpoUDXRYn2TgAskQkMvjwDw6s9
	 RK9LF8qFAEzvwWIpJBXeirxt3SX+3V0NudRXIu/Qrkj1fxXSHeUZS4TykkuLnA2hNd
	 l0d0lGid8TzWmrxltT9oyF/WdvoVDWvX9liNfqpzlopRMKQgeSMKrtg8lPR8rSTLbp
	 At3f25PirF+fQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D1DC88E53;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:37 +0800
Subject: [PATCH 10/10] arm64: dts: amlogic: a9: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-10-940e269aa52f@amlogic.com>
References: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
In-Reply-To: <20260911-more-socs-to-support-clk_measure-v1-0-940e269aa52f@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=796;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=4DgrEoOMoCExjYXex82UD7PxEvK6o2H5kIyRyw8MyZw=;
 b=QAIblCVinkXyTUiFlM1L93hjc1ME8nF9bCDbxdu2+xRWd81XUrv+cNkPMFLuMHCoGKOruwAxh
 DdY4BtQWr2MCHv04gvadU0BnSbG0rKJv+EfA0DQty+ZTlyNrvvKQKAZ
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for A9 SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
index b0e0fadeed82..91f4cf319b0d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi
@@ -185,6 +185,11 @@ gpio_intc: interrupt-controller@4080 {
 				amlogic,channel-interrupts =
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,a9-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 
 		gic: interrupt-controller@ff800000 {

-- 
2.42.0


