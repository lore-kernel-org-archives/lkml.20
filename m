Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793296325;
	b=BX7LGsDaVGnKFKiOyWbyxSIaW9TkjddtAKpjoih5MEqcGh0htduQAgrJ9ZR+wBsx4xvH
	 Plsz7daCWH0t5d3FC1gTibJ9spX714FZ5ys/zLE+nCabrPmEXtKPxgUIZRzL5ImE0zA8K
	 Kc2D7z4AfDelRo2MyH5Q3AAwD1fBlDQjn0BgcI2X4yIdIVqmpmUMTCH4By2zr5QhD8fLd
	 JjeC58Ad+6eOmEE7xmdB35LLdf2uIywC+l+u4hf97qhCc/1YOZC8U1fqbIGABR/nl4EJu
	 4GAkiXQNBlZPGJTD8ULP8YirgxcPr6DXgO9IgfDzOhbgcv+EoJ8ZSuAO2BCS8gBRsGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296325;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rEshQZn7SJLvca0nP/osVTnelosdezvhYeo5YQQTRcs=;
	b=mjZvy34rwtSTREMyRb6b+tihBnRwapYvxehY85zI8b3pXeaJDHG7k6Lm3O7H7XiaVylZ
	 fu4xrZXtJq32D3cMUxmhVk9LTwpnrI4l/qxH6CRFHXy2vlDFQ9oXws/eQRKy7l/c6N+OS
	 hYy9pO+nDFs9mVjSbjyvuZw+ZexfKgsiW3Hi7lD5AQqK0vORNOndHj5zFtPG2sYqyIk3t
	 OXga373N4pCZmw0orFRqxn+3DMPVapnS+1rH5BQNzTjk7oPKPonTtxSffN6P01xnfWou7
	 +AusIMtAhsm3W+ZIuv4MVSTSajcaRK6tp11Gv7ybvclYO9JT2VSD3bDyBUcV9rhyUSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dzo2GD33;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.15
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010015.outbound.protection.outlook.com [52.101.229.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2485606A31A;
	Thu, 29 Oct 2026 17:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2485606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=dzo2GD33
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vl94/VPs20oFuHiOvq0ber10cp4E7kTHXbGmmPhsUMbf4tJBS8Mewa8aTI4VIBnJ20/0drKkvSsdyu8F873wKuzHi6EEsEg+Xormj8XpK4kdOTzGjLdZDaGz3ZVmQ+n9OU6ziGhdIWhzJ0QdIUwdGK3OkJzaoLDcawQf2M7laKiJH19udBMSra0F4BWy2UeHOwYRoPjK5+MpIZhK4Bt0jSanOg8C9N+MiBwbKL8yHl0SOdzvsLXiBomow+/gANlk2ZPgEPX0LvOIipMMTwt2v7L/9mFt0wVn/h5mSJUy0KkFO+FQF3AtBR/jdY7mE6etViOTiuH0nOYvWHseLiWogQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rEshQZn7SJLvca0nP/osVTnelosdezvhYeo5YQQTRcs=;
 b=eY/KZzkmjSVWAnKAtAsVJpmoB75oAx9CT9rUtf7jM39a+Rl8kEN9O0UyDbqK9B9GIclwP9qPFVV2Uy4haxBpPq5S0S5BkLuF8gY0W8DjwWp3Ne+ls7y1mJvSsPgB0CEtLiAa4bAKJAW7dqaNMwsBlPCHOtTkQGd2MNhivGEK4MPrTACXsGZCClwPjkEhZ2t2LhNzgghMIG4HC/Uv7IEIHS98C2ssNSmWAxMAVb1bkf5so15WyBupbBA7BNpIVbFG+6TKJ0Jk5vQl3MS3eahz0oT2y+6lKyrhBOJ5h1ciXQdI+h6eF4qRJ7nHWcuRU2VDq6Y9IoNxMjHEs6Gg96ltkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=glider.be smtp.mailfrom=renesas.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=renesas.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rEshQZn7SJLvca0nP/osVTnelosdezvhYeo5YQQTRcs=;
 b=dzo2GD334Gt5hqqlKAWssbTbSau0EJpxtX2L5QE20bH1p5XB/9dtea2YaLhmdZGub6RPoVRyqWsY4tORi9Z2Er6E/lpbu/Q+/FBhXtSwKc7JO0jOsL+oWoukCN9aahqMBuraL2uQJqQXtSXOVzVIMRwN08oUG9gKg7i2mve9XzA=
Received: from TY4P301CA0007.JPNP301.PROD.OUTLOOK.COM (2603:1096:405:26f::6)
 by TY4PR01MB14367.jpnprd01.prod.outlook.com (2603:1096:405:23d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Thu, 29 Oct
 2026 17:52:01 +0000
Received: from TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26f:cafe::89) by TY4P301CA0007.outlook.office365.com
 (2603:1096:405:26f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.9 via Frontend Transport; Thu, 29
 Oct 2026 17:52:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 8.62.32.50) smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay005p.adwin.renesas.com; pr=E
Received: from ejcrelay005p.adwin.renesas.com (8.62.32.50) by
 TY1PEPF0000BAD7.mail.protection.outlook.com (10.167.240.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Thu, 29 Oct 2026 17:51:59 +0000
Received: from [192.168.1.82] (unknown [10.226.92.72])
	by ejcrelay005p.adwin.renesas.com (Postfix) with ESMTP id 0D909300026F;
	Fri, 30 Oct 2026 02:51:57 +0900 (JST)
From: Diogo Ivo <diogo.ivo.sx@renesas.com>
Date: Thu, 29 Oct 2026 17:51:56 +0000
Subject: [PATCH] soc: renesas: rz-sysc: Remove SYS_I3C_CFG register
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
Message-Id: <20261029-divo-ssgrlpcsrc-2966-i3c-anf-v1-1-a5d2ff9b1367@renesas.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORvYqi3OXxEPMc1mRLqR6BDG/
 t2qx3d5K7iYisOpWcFkUdepVHS7BvhGZRTUXA2hDalrQ49ZlwndR3vM7MYY+pRQ94xUBjzGfCC
 iHGNkqMVsMuj7158vf/vrehd+fk/Ytg+KSSrBgAAAAA==
X-Change-ID: 20261029-divo-ssgrlpcsrc-2966-i3c-anf-85d4aaad555c
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Ivo <diogo.ivo.sx@renesas.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793296317; l=1921;
 i=diogo.ivo.sx@renesas.com; s=20240529; h=from:subject:message-id;
 bh=xqpClTgmZ3VbxMooevTkCoHi6ZfO/Q6XUU3sQxydcDM=;
 b=KSoHi7jRjgq/7eo8xLFIt05nfiHvWAs21WhqRpkTpYR8cp9GmyqATfwOhzEEDHF64reTB8/ZP
 SY4jfolagD7CRc1Gp2+Ny152chtltQ44gElCIrH+p1h8DXLcY+ajCoq
X-Developer-Key: i=diogo.ivo.sx@renesas.com; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PEPF0000BAD7:EE_|TY4PR01MB14367:EE_
X-MS-Office365-Filtering-Correlation-Id: 62106402-de30-4cf5-7cf9-08df35e55507
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|11063799006|56012099006|261026121527099003|261009223027099003|261021123027099003|261021121427099003|261009221227099003|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	AwKvZcxzbxntHV//ywIEIqOfhYyfN2PSs+NIjM22hTStJY/SZeqJzPDdOSLHwTYMA7OvCzB+U2oyN4EiodA3ScrIsa9XxF55PyrGZnjGpMt2HHAl4Wwp6aLLzTtUt4HpqouyLcgNHCTMdaQhlJ9ZQ4/sL8NAl2gb0747pG6je4qzw4Vgdobs0AHfI683FGvOh7MKktztlkVez3Hl1JDxs5K2w9c8o44Dg48T3ocqHZKvrdEmxzxox2ZuIaCBjVCscIrstUg9ubPQ2nF6v2EjPVQnj0L8KHN6pTkLN1dNvQNkAzR+1N8TSWvIMcaWexvidy7J+Cm0EH+6o+JwvVb1+JTqAgWbyIrOr3Ot7QUaMZawB8HKU3MA8Gzj0BVk58CrOd5tTV8n2y3AJYNcpUlaMhF653u3eoJGdEFFR0o8hQIa13CYAWS2gD0RasFx4VzubT7rEUk4y6RukJF0xq0BYTMQ7hAoRonromqeiVnJ/A8F63plUn16Ns0npRjRaFEhSiQtJFSdWA1b0UxvzKG2Mh5TbNZp9AZRQPISitw+5EfGUd6BK6Da9zbL0uO8IG7KQI1smUO1bz18Wlb3eJUr6Uz/RYZT6kMaVEdWqUXysVLJhoEMWwiONXR4KrBABEuqfaFigrs0GLLqT3f342CiQ6SpFIF+eFSWIs55eRM0/O30nwsPw9o9fMNi5jiuRJWqnmVI3qMuWIGvdlaFv6iXxw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay005p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(11063799006)(56012099006)(261026121527099003)(261009223027099003)(261021123027099003)(261021121427099003)(261009221227099003)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qpjFsk0TrYGkEJsYFBF4TPXhcRyXhuAz87ZV0FN2gREMErgM1tTBikGO57ryC44H2630lFDIviPSAs1vmmBvji3R3GA0MMIMwfkdqbTsRepgoWgYbIhmKlAkjv6tliH1L5wljMLrRfOes/diVDPN7Cn9adVm5yfRbM5EMHr9RypZ5zqeDSe5w40feuITyEbVk3MP/2RC1Ye0yhxkSHwfzZX4CFEZpB9B4lCA0fa/HvWheoR7H/9VSZhgbPlxcb8brEtAyfKwASlqs0DV/bJlf/gSNz7ss8UQb1s0FBbqnQ30SDw8XZsOWXC51RyGWpHmpB5cABY9whdXyzqdEtHXPLc9zYSplsYjbU6jurjW8hmfwTrR1r3tV51/KG+KWzMcd4IUPS8UgGZiwi3B8yKg8t1J9rYrLkV2KToTwpFCmr72NU95vCovbJgIGPeGihOa
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 17:51:59.9721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62106402-de30-4cf5-7cf9-08df35e55507
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay005p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY1PEPF0000BAD7.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14367

As per the Renesas HW team this register was unintentionally left
in the HW manual of both the RZ/G3S and RZ/G3L and should be removed
from the code, so do it. No functional changes intended.

Signed-off-by: Diogo Ivo <diogo.ivo.sx@renesas.com>
---
 drivers/soc/renesas/r9a08g045-sysc.c | 2 --
 drivers/soc/renesas/r9a08g046-sysc.c | 2 --
 2 files changed, 4 deletions(-)

diff --git a/drivers/soc/renesas/r9a08g045-sysc.c b/drivers/soc/renesas/r9a08g045-sysc.c
index 63e4aa6a7cd0..be263c675a24 100644
--- a/drivers/soc/renesas/r9a08g045-sysc.c
+++ b/drivers/soc/renesas/r9a08g045-sysc.c
@@ -25,7 +25,6 @@
 #define SYS_I2C1_CFG			0x410
 #define SYS_I2C2_CFG			0x420
 #define SYS_I2C3_CFG			0x430
-#define SYS_I3C_CFG			0x440
 #define SYS_USB_PWRRDY			0xd70
 #define SYS_PCIE_RST_RSM_B		0xd74
 
@@ -50,7 +49,6 @@ static bool rzg3s_regmap_readable_writeable_reg(unsigned int reg)
 	case SYS_I2C1_CFG:
 	case SYS_I2C2_CFG:
 	case SYS_I2C3_CFG:
-	case SYS_I3C_CFG:
 	case SYS_USB_PWRRDY:
 	case SYS_PCIE_RST_RSM_B:
 		return true;
diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
index cd129c727461..679700dde2f8 100644
--- a/drivers/soc/renesas/r9a08g046-sysc.c
+++ b/drivers/soc/renesas/r9a08g046-sysc.c
@@ -24,7 +24,6 @@
 #define SYS_I2C1_CFG			0x410
 #define SYS_I2C2_CFG			0x420
 #define SYS_I2C3_CFG			0x430
-#define SYS_I3C_CFG			0x440
 #define SYS_PWRRDY_N			0xd70
 #define SYS_IPCONT_SEL_CLONECH		0xe2c
 
@@ -41,7 +40,6 @@ static bool rzg3l_regmap_readable_writeable_reg(unsigned int reg)
 	case SYS_I2C1_CFG:
 	case SYS_I2C2_CFG:
 	case SYS_I2C3_CFG:
-	case SYS_I3C_CFG:
 	case SYS_PWRRDY_N:
 	case SYS_IPCONT_SEL_CLONECH:
 		return true;

---
base-commit: 9ef27a3fd1e6674e1c7e18ffbf30349463fc5a86
change-id: 20261029-divo-ssgrlpcsrc-2966-i3c-anf-85d4aaad555c

Best regards,
--  
Diogo Ivo <diogo.ivo.sx@renesas.com>

