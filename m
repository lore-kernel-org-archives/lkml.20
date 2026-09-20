Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11012069.outbound.protection.outlook.com [40.107.168.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFB42668B;
	Sun, 20 Sep 2026 18:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789929726; cv=fail; b=n7zJ3LPQBu6BWgOoDlLX0dfQvwyk9YbtBbHRDRUBQwPRhZABnTRMJt/WhowacyitUayD1H1vroc/+Tz2XVOBDZB7u5tpDy41ld2Z/3aaqkc6MxLPhflcxngQoIYnwVwEGBRjnqFrR5JE0uz1qdWvFhX4QoUttbLF/uZJaYbdHIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789929726; c=relaxed/simple;
	bh=d7+Woc6CRT4GBWQkJ737lR4XrH2LI5fcv3aDnk1xhk0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=FtRtaaCZokgo39WvREpimnHiwlicHqUG+HVYdO38WYNuQ2K5NC3o7kAlEGbO0hGXTlsh/5fwNi2DrJaiiZd4AhbpJvQG1dbRUck06WAfree0mKnk0MyJgtEeMYYLjTqNBcPPY2q7FRUWXv5C5phhKvQn3mC28sQ2Bf7jA0Iw7uQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=F3PdH51q; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=F3PdH51q; arc=fail smtp.client-ip=40.107.168.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="F3PdH51q";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="F3PdH51q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PwaCUqtCL8lIO0oDjJcP8I+8brVlOK+Sr6VifH7dJQW05oOUXe0sgrJIluaujhGhRFSvFM2tbQ+eSNczIv264wNxS9O6UQwnDym6Sk57Hr8x4jpD11+yPXX30P7/X1EjU2n6a1CsqltNdjCUaqOUFhuF59Sj2EEL0i4rffxXUU8lao1qF6QtwbfDKBzxFRgWjLatJnfFyn6a3D6gqpYbJzU5MC/wBoTeLiLc6P7B+doOJsq3W6twJTftxwzM6lWPZCNYcNGYDit0+8v5u0I76PhcSk92b+PjSBSd3H9yKnmHt+YJ5gFCB+PEy046iTS9cq47yZ5cCtXtF0SZ4cIgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PdwteoLOfssQV6h0tqVKpVEmiidoaJ3Omv/rpq+uOk=;
 b=K89ImGKKnqp3jvybPzSwNz21AGZJ2KfkFqw9T38p9ujm1hU4D0XZaL/dX9PpqOt+wS5BAJg/VIYISIA0x1aKn6l7eJ7IeHRUVxEbiCtlBkjuSyde22Xkf0al7Ryi0dUkm4ekU7P0UYu04k61YMwDOMgl2YFLbF11e+yY5Iz0tNvVz6UmOrZY4nQojh643xeOQX8FJvB/kAyzBY8D7SbYWX5QI5lNo2sIN7yOvVAX7ZPXIGW0Fpi1K3OUkAtKtAZf3d3L63vyvpd149CEddTmu6XiiOgrQpmZCW32Tq2roULlJ8mvx0KtldHRcfp77BQNr0DsPnlYjHhQpRuL/1TrsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 20.208.138.155) smtp.rcpttodomain=kernel.org smtp.mailfrom=cern.ch;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=cern.ch;
 dkim=pass (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PdwteoLOfssQV6h0tqVKpVEmiidoaJ3Omv/rpq+uOk=;
 b=F3PdH51qeue1ROU0BUONSsx+jBflBrMuNWlk3lMM3Sl/YrnW6/HjCGHwgfKrLWCdqn3Y5IPTfW34MIjVitfddg6kMSJF+FGuDZNtJQOOBifH86dLPxZzF1O1B9iyd6q8zUW3zwTwrSSHSCN7CldH5x7FBaMMbwqkm+sftL7GuhE=
Received: from DUZPR01CA0090.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::8) by ZR1P278MB1755.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:9b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:41:59 +0000
Received: from MAD0EPF000008AB.eurprd04.prod.outlook.com
 (2603:10a6:10:46a:cafe::2) by DUZPR01CA0090.outlook.office365.com
 (2603:10a6:10:46a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Sun,
 20 Sep 2026 18:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.208.138.155)
 smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 20.208.138.155 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.208.138.155; helo=mx3.crn.activeguard.cloud; pr=C
Received: from mx3.crn.activeguard.cloud (20.208.138.155) by
 MAD0EPF000008AB.mail.protection.outlook.com (10.167.241.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Sun, 20 Sep 2026 18:41:58 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=F3PdH51q
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011025.outbound.protection.outlook.com [40.93.85.25])
	by mx3.crn.activeguard.cloud (Postfix) with ESMTPS id 352257ECAD;
	Sun, 20 Sep 2026 20:41:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PdwteoLOfssQV6h0tqVKpVEmiidoaJ3Omv/rpq+uOk=;
 b=F3PdH51qeue1ROU0BUONSsx+jBflBrMuNWlk3lMM3Sl/YrnW6/HjCGHwgfKrLWCdqn3Y5IPTfW34MIjVitfddg6kMSJF+FGuDZNtJQOOBifH86dLPxZzF1O1B9iyd6q8zUW3zwTwrSSHSCN7CldH5x7FBaMMbwqkm+sftL7GuhE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by GV0P278MB1174.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Sun, 20 Sep
 2026 18:41:55 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0428.015; Sun, 20 Sep 2026
 18:41:54 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@linaro.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v7 0/3] Add initial DTS for Samsung Galaxy Book4 Edge
Date: Sun, 20 Sep 2026 20:41:01 +0200
Message-ID: <20260920184148.31541-1-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0007.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::17) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|GV0P278MB1174:EE_|MAD0EPF000008AB:EE_|ZR1P278MB1755:EE_
X-MS-Office365-Filtering-Correlation-Id: fe643ce8-e52b-4dc9-7c95-08df1746da7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|786006|23010399003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 f2f5SQ8NJ6F7Ebgy/6yuioPXc+IcJOuEdBf0u16+Ec6BETtPBANN7s9ZdLZw9DoKU21Ejxs05OLd262uzfhK3zhm+fp7iBmzUjilvF96BN7aJ6C/gx2kThxoa8EaCp1s3uLwTXrxZkP8Qn6GciXKWdfBj9dRfGtML9fH18/y0eRXoPwZeG3lXxCIQt9/0ZtBX0/U96S6mWLm8tfu/kWCG1Q0sFYFFSUVyDk8UETtKTvTV3pzMF/JVmrvPF6pEk+Z0PBJc8lMLzszq4YQbaNcX2s4UU4b1R6ZoNMpYiCs2QS8JNLoUnnLnexupMEeyatvf5X7EmnOxxC1TagxwYc5buYH6EqESLQas9KmqNFmAXcJbzaa159594CZv9eA68e/N6yK/yEgPBEnztHw2SiHDtuKoKX14W+wmLGWf9Q9SZ8BEhirHKX5C31/FzsAYfmLSeEeaZIUtxqL+1Q0uXjvNgmQGlC1jWefhQ0c4YY6h8ml+3rNoHXSZZDK4qxtTY9jzWRd3r4E5UdI4FsOVFwlxrDCLhOKi5AHEX1VUhrGcQHtszH00mQowS/OD69wiQ/fhbolby0rlGb7ncgw5aonRMlciLT85L5a7MruaXHLJJhTS0oqsd3uavrGAcE49Zmp2nRf8fkkq2oHE1lKASfGLTnEpoR1QgDiWTUUqzvtpNM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(786006)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 5lVfFSeZO9P9WTViXzKqcpShrSJ2CbDLuoSFDKQMMx1pAUvombm9lIe+vupwP/n2VxHGTKAOnhWcpES5RgXnwNiaz+Z4wnflICKGU+lar/SBBkjo5sC9JTyHvp+OC/65tvKlLwChxEf2NKlHxQt1dwZMYaDqVYwSFbqOzTOYoEAxwYRK9YJv35l2jSgl5Vl+PXO74rd1lNcbz2nvM5lqmh9wNO7Cnsel3754mM2MKV/u+ZP3sZdtaWuM2EkS2pWKrNaHHxHVyeiar4DXMTQ9xyUBc25UmbCGlBuOkidzEcVgDy8k0rl4+yTmIFIkGYt6bNnDA86GhUwrFc0txq4LHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1174
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008AB.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b11fba53-34f7-4e03-fcb0-08df1746d7ea
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|786006|7416014|35042699022|82310400026|23010399003|19092799006|14060799003|30052699003|1800799024|36860700016|13003099007|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	j0b+lUpC5kmgMkp6069x6FCCUTiC7Yk4wKwA4QMsD4mDRmB4aBQSiyBL5cxpc7MCtnx4ovROVgPvdQ6tJ53/1EGI5hsIOi6tiAB2XPEzo2rOHwGFKym7eAZbBWcnbzTbOFOKeDpc2+iFC0lJe0iSc2mdXdZBdS2yzp7UH2bDB4cbtW/TteNWVpxWvZ7I3vB8nE0x4j8j7ejssuQ52gK6T+1hy2/Pgg4GpgZK99Pr0R9SUVPfkcRc4X/HFE8uKdBhb3Tmhw2YlcIGCUzoj8fQ8S5X1VC2yUvESILF8fMbSGsNWapcOSPCodu3r/JPEWLrBQ1fVRLH423pGTCKFkQFl7vkqCWfHV7xMyC8ZkCEqRrYr/pXQcb0kad5QWAgTzPoDtA7OEMjIRRye8A7+U64lWvmO8Bd9CdhowGkUxzO/so5FkJWt8F0uzrhql3Yro+nwTFm+kCculG/1jn7gbsXOTi0wUezuYC94oEwlYWQpNlQCSIIl4Y01NsMUqEk3N2SvDST1zZptxW7WQvXpkLHGnNa8dwii0K/ANd3QAL827k7k5t8+6wmmeylHzRoEsHXelRq3Lh2EzMUwtR1snLSB8IIV/t3Jl1mQKI9IgIL0/FbA0enVgvUKFDRwbTA60lPoK9UPCdWO1Qqzpvxln7i/YpYZ1F11tB27XKK7VSQGJ0nKFXy77GuuziGAyMUyAopyFdRcws/T/SmHU76gFfx1A==
X-Forefront-Antispam-Report:
	CIP:20.208.138.155;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx3.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(786006)(7416014)(35042699022)(82310400026)(23010399003)(19092799006)(14060799003)(30052699003)(1800799024)(36860700016)(13003099007)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HfjcI6oqDP9PQ3BI7jcG7SDj1uh1IJ0Yz1GdyysdqW/5+syItm8lXjg43+6ii94VukC48Bktvv/Zbr+JSv52LxVoXIkcZr07dUbLKE+LudGydLJPVsN5IDa5+xtd3FWoQPOqsTACiJKSjH9h2wpznVGWnYffJ8ibQxn7BNG1C5dulSPjh4Ken+AOuQf9buI9l4lSehx7wHIQCKkJyXW7EzGlET7yJe1j6L8gGEA0yJriTYw2F+9VvZT08W6t76zRcxhH784PFtDzgd8RiqawgfWPzRVZws1sigK4IcT/Lao1L9/tJmdCIzsBRelZ41Ml55TuvpqLl7GKYzopm2Mzv6FMi6/gd5XUX/NElrnafl5jRQsoft3ujoMUVNPQUJmv5ujrSLbboD0/A86wIIhJr1F9oXwYRLwhOpk/E2axKHPUfjK+74WGcTPD+hxmNf1p
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 18:41:58.9468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe643ce8-e52b-4dc9-7c95-08df1746da7c
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[20.208.138.155];Helo=[mx3.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008AB.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR1P278MB1755

This patch introduces devicetrees to support the hamoa Samsung Galaxy Book4
Edge, and includes the X1E80100 14-inch SKU and X1E84100 16-inch SKU.

It continues the earlier patch series started by Marcus Glocker, and the
previously submitted v6 [1].

Supported:
- Keyboard
- Touchpad
- USB type-c
- Display
- HDMI
- WiFi
- Bluetooth
- ADSP / CDSP
- GPU
- UFS
- Suspend

Other features (such as the camera and touchscreen) are also confirmed working,
but for now need multiple patches/changes out of scope for this submission.
These are tracked downstream in the meantime [2].

Changed from v6:
- Updated to match current linux-next
- Use 14 inch SKU as base for the dtsi

Changed from v5:
- Reworked DTS/DTSI for both 14- & 16-inch SKUs
- Added Galaxy Book4 Edge to QSEECOM
- Removed UFS node from the patch

Changed from v4:
* Fix previously missed commits:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v3:
- Improved commit messages.
- Added missing clock line for ufs.
- Removed invalid microamp lines for ufs.

Changed from v2:
- Squash Makefile patch to new DTS file patch.

Changed from v1:
- Provide the patch in the expected format.
- Added missing bindings.
- Removed sound node.
- Changed regulator syntax to be consistent.
- Changed touchscreen node comment, and removed false pin definition.
- Rename ufshc@ to ufs@.

[1] https://lore.kernel.org/all/20260322160317.424797-1-mstoretv@cern.ch/
[2] https://github.com/zensanp/linux-book4-edge/

Maxim Storetvedt (3):
  dt-bindings: arm: Add Samsung Galaxy Book4 Edge
  firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
  arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1537 +++++++++++++++++
 .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
 .../x1e84100-samsung-galaxy-book4-edge-16.dts |   31 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 6 files changed, 1606 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts


base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
-- 
2.43.0

