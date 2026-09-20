Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73B83F411B;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899907; cv=none; b=hauN+KpW6T9uNcZbNqUsIlpvtF+sKma+IFu8Fk9bLVgZ4k8Ud0OfHhEu8T7M91kv8zS+vPd9YAodPswMKv5cwBe4lNntOn/7WOxsEmMDdmdRKqpjjB3ZZUEuuWERfVrDob4Nb+XbknbFu34XnLrhxs0FzL/9VbgjEfI/hKHT9KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899907; c=relaxed/simple;
	bh=d9gRokGuXMnRj4EGFfmt+XQXkpFvGjH7tDqGf3GPJhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqGfqoxW3hNQY2g7S+BOxn7rkXMpAUjrjGMPgFjilDM93DFUt+JSxpN+uVJUURxx547p9oG4do8iueOr9FZJ9t4n2SG4Hi3k2JA9oi8xo9pvaGOJPEdUYqcxiGePDeVeuLYKEJDOj6EF4oFxQJAx+81qDXtMGYM+OrEL6UWKUxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJ3yoCy9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qJ3yoCy9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AE21C2BCF5;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789899907;
	bh=d9gRokGuXMnRj4EGFfmt+XQXkpFvGjH7tDqGf3GPJhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qJ3yoCy9F2Vv4a14SVSscKCA0W3kUjhMPmxd0WD7xLYsTRuE+obdFWi+CIkhLH/AB
	 yYbEXdXelq6ynQBPaaLYFXfdayvb/ejNxuK+w18BpLa0R+4vdvGU9tv/V93MYcEl4D
	 lmnoEthALBAPDTMjuq1u3+40i6r80IoF1UmboOoGfQrHMe7EUnrGJWrb5ZLVDVUuHo
	 VAzIAUv8qiWFZZJuHM5SHjEA2PEIBmjbzdICYfkY6lwiJhS6y8r/nuu3sj6egWFhRI
	 WNyYSlJcDkge+eH9n48Dz/lf/2aJICZHwo+1kTEyKqyUpq9K0ZAiAaaJK4rJdjCzQq
	 ty0FIqQ552Y2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880E0C982E6;
	Sun, 20 Sep 2026 10:25:07 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Sun, 20 Sep 2026 18:25:12 +0800
Subject: [PATCH v2 10/12] arm64: dts: amlogic: s7d: Add clk-measure
 controller node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-more-socs-to-support-clk_measure-v2-10-224382a429e8@amlogic.com>
References: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
In-Reply-To: <20260920-more-socs-to-support-clk_measure-v2-0-224382a429e8@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789899904; l=732;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=pLxRAmolmQ/S413sGcYNxtsPZfazg1P2W2c2iMu9cJc=;
 b=TQ6NQqP5UAgcMtDONzEg6xT4hV2z3fvgX89dDV3L/AwBLiTDhEbr70Pt24QgZaQdBf0F4sOy6
 m+agroZtVmxC/WyXdM98dNhN1aD4NXNodjxup09W+e3TEu/rDyd651Z
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
Reply-To: chuan.liu@amlogic.com

From: Chuan Liu <chuan.liu@amlogic.com>

Add the clk-measure controller node for S7D SoC family.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
index 0c4417bcd682..5593ff9e07eb 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7d.dtsi
@@ -212,6 +212,11 @@ ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			clk_msr: clock-measure@48000 {
+				compatible = "amlogic,s7d-clk-measure";
+				reg = <0x0 0x48000 0x0 0x1c>;
+			};
 		};
 	};
 };

-- 
2.42.0


