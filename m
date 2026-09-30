Received: from ZR1P278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazon11012001.outbound.protection.outlook.com [40.107.168.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C01841A502;
	Wed, 30 Sep 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.168.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790803479; cv=fail; b=FM+jI6mB0CTgqsZfzfi8igJloz1Ck+uMt8qf0Ww3eR77nl9KZOMy8zC/3upFAngVQNaO/c/1oyDFc1s01pnXZ+RRbxk8u8X3QaaU6dBF33rpkkjKdySIf34JlVm7mpqT96F26Aj1sght1EkMQXw2dpFg95bABaWonFyFFe4K5s0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790803479; c=relaxed/simple;
	bh=MXKa0YI59bmhQ2ycxsF7b940tBTHrCTAt/pvI4xtZso=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ntchsgJ6Drav0gIZp6uQVSwoT3zemhcPXHhv8w3QZFu8AZZa8vdP+a2G2lxJ5JdJ8GmE/vm+sJNT0eQq6HZEAKjM2bFIUpHQmJw/r3EgdJ2nJPFMvHlyb4YCtSS5WBk0CRtj+YNBVGqno1cLFlz+GS+lYkEGk8j3GrAPHMvunjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch; spf=pass smtp.mailfrom=cern.ch; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=xKyPHf2e; dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b=xKyPHf2e; arc=fail smtp.client-ip=40.107.168.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cern.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cern.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="xKyPHf2e";
	dkim=pass (1024-bit key) header.d=cern.ch header.i=@cern.ch header.b="xKyPHf2e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p2b+G86PWG+PBIiI0Lm1gmG/E8K58ohf3Atl0db5WOrNrE94h30nJIyGejSbZlKGC35BQ6XdY8INSZctPKaADIvToZLDvAqjBRZcWhqIrTIq/KEIcXFwiTETpi6WFZhQqCSpug3/8EVODJKVHm4YC0Rgu+okOwSXUwoaIK80FsoVVF4jIVOSERPtevZiUuWK+vX5tHuGlqdy+IUNpoecF94ZuJetNNwj/xIKNpNZdPGrmxbph6r1uCWKgjf8xDDuXzPavMqU/bqYcqtJpK9AhElMerkR827TBXbPlkJG1LGUISpbliKPOsVSvLXyf1N18s/y6RmdzCvo2Sds1zTA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJisgJQ3U9DuqAnKLPBPU2Ou1o3MOOt3eSHjBE6Kijo=;
 b=zD/t11+ctZOaNZPR4/1XFeVGwyYrtOPGNprdiI/6RxVe/X9JYTQRa85j87CIElm3QC3u29B6jmt8x3+NnpYTmTsSyyR7xE/Ug4jt0kFqisLbubU2jhGtCWj+qMDX7/MdCQaqQYGzGMfMXO07sX84rP6zTqIV323vcfVespNrE3W/FmtajMGjEiEMRl+Me51rac81i1qZy4+2buBVGAiwu2EqnpKKzTijQMFpw59fWYtAhok66wU53RotQw7fTI1VL3I2Hl+kTt99sGhR2LetUqdQI0MTUjtugqt/5WsIn5B5HRw8HCL8pHudRU7tjyO6z+9xwuQioq6pZJ3L0t6Zog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 51.107.2.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=cern.ch; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=cern.ch; dkim=pass
 (signature was verified) header.d=cern.ch; arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJisgJQ3U9DuqAnKLPBPU2Ou1o3MOOt3eSHjBE6Kijo=;
 b=xKyPHf2eN/fYt/+uLhhAYU/gpQ7EeG2TXy/sCUDs4ffOwEe2gGTRQu98VXcUjpNKhMS3ZydzCwrAtWrKpK+zaF2S+FZNrW4n2BH2VHXygJa4SBraKcdgFBXw8xLuGua/s49Rb1OpGF90adk9ycxnUgffQPyG+uHOVDxy1NqxCmY=
Received: from AS4P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::29)
 by GV0P278MB1066.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:4e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 21:24:31 +0000
Received: from AM1PEPF000C1ADA.eurprd02.prod.outlook.com
 (2603:10a6:20b:658:cafe::64) by AS4P192CA0036.outlook.office365.com
 (2603:10a6:20b:658::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 21:24:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 51.107.2.244) smtp.mailfrom=cern.ch; dkim=pass (signature was verified)
 header.d=cern.ch;dmarc=pass action=none header.from=cern.ch;
Received-SPF: Pass (protection.outlook.com: domain of cern.ch designates
 51.107.2.244 as permitted sender) receiver=protection.outlook.com;
 client-ip=51.107.2.244; helo=mx2.crn.activeguard.cloud; pr=C
Received: from mx2.crn.activeguard.cloud (51.107.2.244) by
 AM1PEPF000C1ADA.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Wed, 30 Sep 2026 21:24:31 +0000
Authentication-Results-Original: auth.opendkim.xorlab.com;	dkim=pass (1024-bit
 key; unprotected) header.d=cern.ch header.i=@cern.ch header.a=rsa-sha256
 header.s=selector1 header.b=xKyPHf2e
Received: from ZRZP278CU001.outbound.protection.outlook.com (mail-switzerlandnorthazlp17011027.outbound.protection.outlook.com [40.93.85.27])
	by mx2.crn.activeguard.cloud (Postfix) with ESMTPS id 8AB2A7F366;
	Wed, 30 Sep 2026 23:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cern.ch; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJisgJQ3U9DuqAnKLPBPU2Ou1o3MOOt3eSHjBE6Kijo=;
 b=xKyPHf2eN/fYt/+uLhhAYU/gpQ7EeG2TXy/sCUDs4ffOwEe2gGTRQu98VXcUjpNKhMS3ZydzCwrAtWrKpK+zaF2S+FZNrW4n2BH2VHXygJa4SBraKcdgFBXw8xLuGua/s49Rb1OpGF90adk9ycxnUgffQPyG+uHOVDxy1NqxCmY=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=cern.ch;
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:5d::11)
 by ZR5P278MB2072.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 21:24:27 +0000
Received: from ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c]) by ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 ([fe80::79ac:8d79:4b56:709c%5]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 21:24:27 +0000
From: Maxim Storetvedt <mstoretv@cern.ch>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: kapenekakis@gmail.com,
	marcus@nazgul.ch,
	marijn.suijten@somainline.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	abel.vesa@oss.qualcomm.com,
	johan@kernel.org,
	konradybcio@kernel.org,
	kirill@korins.ky
Subject: [PATCH v8 0/3] Add initial DTS for Samsung Galaxy Book4 Edge
Date: Wed, 30 Sep 2026 23:24:01 +0200
Message-ID: <20260930212421.4810-1-mstoretv@cern.ch>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0214.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::9) To ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:5d::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	ZR2P278MB1053:EE_|ZR5P278MB2072:EE_|AM1PEPF000C1ADA:EE_|GV0P278MB1066:EE_
X-MS-Office365-Filtering-Correlation-Id: ba272189-378e-469d-e7dc-08df1f393789
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|376014|1800799024|7416014|786006|366016|19092799006|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 XDvp0cyMqwt7hLzlUx9hKKsR04Qnz3J2lGCO17KvfnPbu6K7y6o6Q6kAHidU4qFVTA+Bs3yTQ2M5JzTKWUqyUAehtUFpyGDwb3cF+CfZpQk+f9BIYrAAvz/yEBmpqvRL9OVu7iZQS6jIUjFVjfdf4SwuULIUSLanMZxKW5m77/QUwOI9QL+SnuErohQly7pvNxojbbX9uqK6Ikc55Z8nYQSebwt5ixFW1PFGwjEuzGZsUOi3i31E8K269MQ8gWuOfx2UnqmKGEeeoxZVHNIC4Q9w7Jot7Nhq5ak30CkM7ZzdLebe9BU2Kp1DceXAyl8NHaI+EF2VltkrYf7eHF5aicqGT5hDNBtEdpcIXtlbfAUNwvdyr4axjqr7pkiazVoH3vsfgQxwtvt0GhgOMMxRLd42DlM7Unak8QA4DQ8KWzP/Aal3OYFTeV4udGAIaTCJ4EwV3k2YMBP4OF3dwC2UHg4TgMpATUFUCZB21c7cZme1cuNT42+o+rRZ/GFGe0z8kkW6VtGL0nkyf2B24kkrQ8kfHGcqrY38pXaNuXI6br8tG97jqganYr/6Q0fWC0nu3fKKLyor5fYTu1uJ5oWGc0vBJ7CKKeeNB3Scvq4bLhniUBX3if8pB1GcN6/5GSV7hkl/bFUXPVQo7JVfAcPskTYvqn4CVUWptPVprRvjZ1Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR2P278MB1053.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(7416014)(786006)(366016)(19092799006)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 jKfzu4k46FHCtHYF7QQP7Iytc8LEKeANR92yxz34YDDGOpkqOvtqjyFxlszwJESZV5urhiGPJTM8vudTFCrIOXo9cawJ446als0k4M/oV98ie26SHYsxYWnqXk+ajqVTNVfQ8xrTffxHAQPYmK/hlQzIpN5NJBG+aJz72uwV0pAltiPHhkUJliPqyvS62E29fQrd+UIYcXLr3FjvTbSmyMoUApfOf8ZNWjIZZMHz1LheY7Dz0hTug1Nu0yEAEwecg3fyufzuxBlo8DlxOv8IgXPHetw31PdiAKRDMWuluqoJ34QYtEZL28m6bYgez3hweECKEONzuk6+xc7Cyh2poQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR5P278MB2072
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	debf9718-9798-428b-cc25-08df1f39352a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|14060799003|19092799006|7416014|1800799024|36860700016|82310400026|35042699022|786006|30052699003|11063799006|10067099003|56012099006|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	SCzoc6Z+GwkPdCcg0H4q6IIdmmbHmo8jA3ldgk4fLFNLpzEVC4pHx+bHVNyH/fwNQ+go8UcrAut8EttwyC6wVyJiW0JgWZMugnm3btE4VV4BybLtsEWAqZ7Ctz5fP/OebqKnsPWdwkWdpkXiU+PHcT/JuZQlsO+uDNc7xgzPA1E5D7ZFNiZRjMd3uvRYeYw9u4yhQonZuCGBJ3yM/tyWY1AygjcEhqfm74q71Ss3Lu3aXWjxNAKSH19whzfZXCmvPQQ5bxk/0XEG28a5DH92104vcHVR1n0AU2gFHjGRCZP/ni9Tirrv7F4TUEJPC+bfM9megSm6bdbT/CB+pyvwzvtJg/B8mlQ/JHhcfTSLFraOBB0m+utOcbjDq0wxzYTbJMKLWOtKfANUvmzDnKnzscLGtIzG7zbsLawQhFadRmfe7kH66seDz0PF4g0YMSBcpyFIKgqVfpa96CRHoJrleLN4hpu0W2QWUNe6ji2ji8+77AOSJGPfAWOel75SUrMO/WYm43DV3ajhdYYROaHVaKFMLEPF50sPmMryZSzU8pr6nKfQ94vKPuFNKaObvHkqVXgv0zYrgNdH5i95Njr19CxM8JcyJkd0v9N/EriuCOXgXvJHT6YGs0WJqjCcIzKW7ZVTuCZXEWqYF7rXc9VBeJ4ChPHpuUfRlviA4uIdA9DPkCb0EugN4FM8CYGk5y5xNm6HPJfPwiV5dGCXfC0cGQ==
X-Forefront-Antispam-Report:
	CIP:51.107.2.244;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:mx2.crn.activeguard.cloud;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(14060799003)(19092799006)(7416014)(1800799024)(36860700016)(82310400026)(35042699022)(786006)(30052699003)(11063799006)(10067099003)(56012099006)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UK8fSs2SMUGXzguu8d0JIcnUBpvJyoQTUH3XTwyoppZW3MAv+3EeUl+pCU4UmXamA8GIKSFd/A8WGVJdrTzyko3mLfhZ5kAVTi53xNlyU96PDTVP82yPR65aGfHtaRDlleJEYCA6nq7JPLMjCWESQF1RFwJWOGLz1umwM3B7YFAy624ykX/6QbkMhUkEF+ERWTGOlzG2VodRCdjc77l1L3KR4cLs2cJYWDrBjU+loaK0YPCMRhcA56YhLsKYQRDgmxeKkmW9gRAVT5vjY9lck9e2LQ5E7Un5ZP3gXAKXRqrrLG2yuwvC17w9PLEJknKBQbJiLbNaamHo9/L15zxQ3fGXwqUuzy0JI1YQVq02bKscu+nX2dhNatNRlfZFs8fmTXZMg3a6t35zfLJxoUcq+sGPbBSFdP9WN1SD/BbqVmUpguF62M2LjzFtdM/21YvO
X-OriginatorOrg: cern.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 21:24:31.4457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba272189-378e-469d-e7dc-08df1f393789
X-MS-Exchange-CrossTenant-Id: c80d3499-4a40-4a8c-986e-abce017d6b19
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=c80d3499-4a40-4a8c-986e-abce017d6b19;Ip=[51.107.2.244];Helo=[mx2.crn.activeguard.cloud]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000C1ADA.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB1066

This patch introduces devicetrees to support the hamoa Samsung Galaxy Book4
Edge, and includes the X1E80100 14-inch SKU and X1E84100 16-inch SKU.

It continues the earlier patch series started by Marcus Glocker, and the previously submitted v7 [1].

Supported:
- Keyboard
- Touchpad
- USB C (as init by firmware only)
- USB A (on 16 inch)
- Display
- HDMI
- WiFi
- Bluetooth
- ADSP / CDSP
- GPU
- UFS
- Suspend
- Touchscreen

Other features (such as camera) are also confirmed working,
but for now need patches/changes out of scope for this submission.
These are tracked downstream in the meantime [2].

Changed from v7:
- Fix sashiko warnings
- Add touchscreen
- Add proper tags

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

[1] https://lore.kernel.org/all/20260920184148.31541-1-mstoretv@cern.ch/
[2] https://github.com/zensanp/linux-book4-edge/

Maxim Storetvedt (3):
  dt-bindings: arm: Add Samsung Galaxy Book4 Edge
  firmware: qcom: scm: Allow QSEECOM on the Samsung Galaxy Book4 Edge
  arm64: dts: qcom: Add hamoa Samsung Galaxy Book4 Edge devicetrees

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    4 +
 .../qcom/x1-samsung-galaxy-book4-edge.dtsi    | 1529 +++++++++++++++++
 .../x1e80100-samsung-galaxy-book4-edge-14.dts |   28 +
 .../x1e84100-samsung-galaxy-book4-edge-16.dts |   31 +
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 6 files changed, 1600 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1-samsung-galaxy-book4-edge.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-samsung-galaxy-book4-edge-14.dts
 create mode 100644 arch/arm64/boot/dts/qcom/x1e84100-samsung-galaxy-book4-edge-16.dts


base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
-- 
2.43.0

