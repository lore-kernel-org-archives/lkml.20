Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2509A47D92B;
	Tue,  1 Sep 2026 12:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264943; cv=none; b=jQh/KPVCDEyGfjy6D/NsdVCjsLoDY+thiO9ylNvPu1GD93OAGTDglHNExQZgAh7N8XXiP1tVgtBxjGBSdI8KEIeak7EiH4qZat+EmPxHjiszSNtHXtCklcyhIRJ0qDEuNorsh+NULBb345uQqBNbE5nXRX5n8hbTHUfU0Am57ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264943; c=relaxed/simple;
	bh=JBzgO46ZJ+ojd+2K6OHgmQUhukdPoy2vAFnVtYq6r2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qyAl4aPQU3oAgPqsvrEVex1E7w7FJS6t/idX8yc8ZNLeV4+yL16ZVcpXVvYUCSs2azOxF/097v8razmPhgJ4enE3AoPikYelAOh8Fxify8J2MnXES+m5FUqcDG6yGQ3Jkzt7q4MaKAT3mqrYwKvij5O6K36AAPs2+MZAP1Y72oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCgQzPot; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCgQzPot"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE0CFC4AF09;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788264943;
	bh=JBzgO46ZJ+ojd+2K6OHgmQUhukdPoy2vAFnVtYq6r2s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jCgQzPotaGpNncdfI/3nARnEWCYZmOORzSumSEt58dVRu93wAECO2ps+W4muCagEM
	 2hBxUEqAyhXvpTE8SSzF4zYaRvz3r/mmg2qh4va2Q3OloCBQn02BKnvDPWO+3bCFeh
	 7QKR/EoQfSBPCRRIE4iBZn5XiyPmwiX/45AYep2qslOcvMgVkmBhNlxNvB01JoIFCK
	 gYq/dlTt2di8rg304LfHU8zM9ZWC3sdF9Kob2nJgHUTJD0tHiAaonC/eds4A3Gtl9u
	 t5II8c6QIIPYuYCX8TuJS3Uto6rIbuw2w7IAGb0MaokAd1OiWX7G3QUxtLywaIiZcx
	 xpH/A7HUSR5bQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA568C61DD3;
	Tue,  1 Sep 2026 12:15:42 +0000 (UTC)
From: Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Date: Tue, 01 Sep 2026 20:15:21 +0800
Subject: [PATCH v7 06/11] ARM: dts: aspeed: anacapa: Align PDB fan GPIO
 numbering
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-anacapa-devlop-phase-devicetree-v7-6-0bd71d2e0105@gmail.com>
References: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
In-Reply-To: <20260901-anacapa-devlop-phase-devicetree-v7-0-0bd71d2e0105@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Billy Tsai <billy_tsai@aspeedtech.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>, 
 Rex Fu <rex.fu.amd@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788264931; l=1809;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=nItmbKUGTjp2PKloSxDWx74Eq/xSt6JRiDFfFn87dgs=;
 b=2ee2Hsh/ABUYcrJfkM2OLOifYsSh3wdjNMETF8NHTkQ0alUwAQ8QPwZ2cvAJoRf9ZQ+utz/5O
 0TfzqG0/XoJCEmU3qNmajZ6m7NBgkREOWWgCP/QXWWU1Seg+uox+2ZS
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-Endpoint-Received: by B4 Relay for u8813345@gmail.com/20260202 with
 auth_id=761
X-Original-From: Colin Huang <u8813345@gmail.com>
Reply-To: u8813345@gmail.com

From: Rex Fu <rex.fu.amd@gmail.com>

Update the LPDB and RPDB fan GPIO line names to align with the platform
fan numbering scheme.

The LPDB fan GPIOs are named FAN0 through FAN4, while the RPDB fan GPIOs
are named FAN5 through FAN8. This keeps the GPIO line names consistent
with the fan inventory and platform-level fan numbering.

Signed-off-by: Rex Fu <rex.fu.amd@gmail.com>
---
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi   | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
index ed46a53aab24..83b3b99ceccb 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-anacapa-evt2.dtsi
@@ -3,6 +3,40 @@
 /dts-v1/;
 #include "aspeed-bmc-facebook-anacapa-evt1.dtsi"
 
+// MB - PDB
+&i2c8 {
+	i2c-mux@72 {
+		i2c@0 {
+			gpio@24 {
+				gpio-line-names =
+					"RPDB_EAM2_PRSNT_MOS_N_R", "RPDB_EAM3_PRSNT_MOS_N_R",
+					"RPDB_PWRGD_P50V_HSC4_SYS_R",
+					"RPDB_PWRGD_P50V_STBY_SYS_BUF_R",
+					"RPDB_P50V_FAN5_R2_PG", "RPDB_P50V_FAN6_R2_PG",
+					"RPDB_P50V_FAN7_R2_PG", "RPDB_P50V_FAN8_R2_PG",
+					"", "RPDB_FAN5_PRSNT_N_R",
+					"", "RPDB_FAN6_PRSNT_N_R",
+					"RPDB_FAN7_PRSNT_N_R", "RPDB_FAN8_PRSNT_N_R",
+					"", "";
+			};
+		};
+
+		i2c@1 {
+			gpio@24 {
+				gpio-line-names =
+					"LPDB_P50V_FAN0_R2_PG","LPDB_P50V_FAN1_R2_PG",
+					"LPDB_P50V_FAN2_R2_PG","LPDB_P50V_FAN3_R2_PG",
+					"LPDB_P50V_FAN4_R2_PG","LPDB_FAN0_PRSNT_N_R",
+					"LPDB_FAN1_PRSNT_N_R","LPDB_FAN2_PRSNT_N_R",
+					"LPDB_FAN3_PRSNT_N_R","LPDB_FAN4_PRSNT_N_R",
+					"","",
+					"","",
+					"","";
+			};
+		};
+	};
+};
+
 // SCM
 &i2c9 {
 	// SCM FRU

-- 
2.34.1


