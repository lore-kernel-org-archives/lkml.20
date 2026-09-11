Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F06845C704;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115332; cv=none; b=t50P69rh6yFapyPYqfLLdICSGRERctWEPN3a22CHB23EGsXedyknKklexZ8RLLmD6YE5O/obqJWarw2LLtjwQgigyJARQUs2utPObDgjpRsZEhscwgvOcwwZmT1d+V8S3beITHuP1Psq3ZjJ4waHDYxIXBU2CDT6n0nIaD0Bag4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115332; c=relaxed/simple;
	bh=d9gRokGuXMnRj4EGFfmt+XQXkpFvGjH7tDqGf3GPJhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZ/i1jxl3XB2007ECo4TXahjyUd+pN85W8MlKQWgJL0WyIT71Xecv0KyoTGmRNRzwOUIi+vQvQF63IRLaoHK89CzcjAWorz/hrLDdUjp7H3G7mJqjcTocVTFl9IuzqmUF5CxuOKJgE1uoQm4NTRBOexGgOsPm6a3SYu1/LYozGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBAItL4E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBAItL4E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E1F1C32786;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789115332;
	bh=d9gRokGuXMnRj4EGFfmt+XQXkpFvGjH7tDqGf3GPJhI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RBAItL4EiM2w+F3HGB/si/RZQE/CjCgEQwQ3SvOwEe4+lZ+S4rDCh+1r3C3jYq7sm
	 lP2pQVWC6pzMMm2vWJphnjwkAOXGWeZ71tR+fBb6PqaPoXJ6FrEnIZvWX3wQul+bKu
	 R82dwBiY7lJ0I25H2kQTNrLlF8ZVExBTxwAJKAFLRXkfAmoI8XDGHETOTg0q1IX1l/
	 BArOerJGVEKoZgm4DpbzlQ2LT8wHKmdygjUISKOYyio285JpDEp3wjnqTCRcHNgEJ3
	 u7EThFobH6SgMBZz4G1U0Fdx0j6Mou34oPNGpCOrHxgK1h0DQjOiEaa5QWjXwNjvmb
	 u6GhknDgOvuhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5A6C88E54;
	Fri, 11 Sep 2026 08:28:52 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 11 Sep 2026 16:28:35 +0800
Subject: [PATCH 08/10] arm64: dts: amlogic: s7d: Add clk-measure controller
 node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-more-socs-to-support-clk_measure-v1-8-940e269aa52f@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789115329; l=732;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=pLxRAmolmQ/S413sGcYNxtsPZfazg1P2W2c2iMu9cJc=;
 b=5jEF9+NW5uv6CsNF/LzrnrBni98XNjLVUd3mokEMOltHexGMhim45lH6pshmEUkWDO0hu1wnH
 UNomb5cyUyKDMFpwdox98lFHyws2wCMmz5QHTXM5dWvVD6B20XWhem6
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


