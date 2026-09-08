Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9394AF17E;
	Tue,  8 Sep 2026 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857602; cv=fail; b=EdmCwIfHJUo7GaGDB5PZGA49h/iax1wf/gKqoueV9z1EDRVe7Z2sf04pNXx0zdWx3CHuKceDHH+qJplz5BxdqIMYDB4dtXkeAJ42JVzYYRWI57p2VGKBwlUfUySoSYC34Q0+mcHjzApM2BADdxf495fabrEGub0J9pfmj0th2Qc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857602; c=relaxed/simple;
	bh=VQgBn9GaPqeyhE08fH8KVG5lWbgt/9WN/M0N99BPnms=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WN4yg0bFvm/YfEfsXKQtgOWmN5q96rd03tMBxsSSbMiclgczM+02DPFxK6QflJLGKIl+zZqtsFvWHTw3Ss2pfyiQAMy2rwsmbi2VN/tzjsHH6oQxDJuxwqzvEfbXYSJp3FtGxNEGwWsLNLqnuamUEGnOlncswXHN2Y5o1gG8lhs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=hrBQUcSM; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="hrBQUcSM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2CfXqpoDX7d48+lIpMLjNQtmE/ZrNVEuMl3cqoO7UwH/lsWnG++6S2nN5DLiEM1kj8uA3cSztBh6K8+cxB38e3Cev240/1shzkbEl3MvgC+XAV/uvWKMDM61JpLQGTiMGptq/uqtpAWqQgZhLdQl0wiSXGI5uRZjkbCRCaZr+bRR63trZrHw02YQCip5xqUz9RNmKXEM136I/Ld5x+N3DuCVPLxg/Stll81RtUhRfO7ZgTEadR8M1Xi9w3eZ+9hZH4rlWaCUUwOVWabWZtaDDJjgTS4qrBDWvejtt/tUTiSzrW/tMEzCSNocUPUqc5y4NvPieDYo/N43k9n3u35lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VQgBn9GaPqeyhE08fH8KVG5lWbgt/9WN/M0N99BPnms=;
 b=yqUF49KvOO40y1uW06z1AOdS1gA7KCcz1iESv1TyRTVzzd2d7+5SmpHvOsZSzAWKRjA/KTfEl+5FUAY48VhBBRg3eHWHZedQeorsBIxa0Cx40+polS4vcvVg4EvtGX+YRic94TL8iENMexg5qY3kizAaPNRn38hyV3JaLRRJnQEdHvg80sjszFhgYRalmM9CZjaXv3tO23mLaq03MZr57o3noCDuC4mxDhaj8+Xgk0z4WXb9zxEIgSwyYzfoc2O7a4ct221In0sFfML1GBw7UVQbGiJ/fTjrZeFmBIb6ARUAUKRFq2u/RDiemd0rTcCOqM6bw96E16v1+x2cdXvPMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=posteo.net smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VQgBn9GaPqeyhE08fH8KVG5lWbgt/9WN/M0N99BPnms=;
 b=hrBQUcSMQM30+xYJ0yVksd4Aei8wHNrGHujV8N37X5ZfEOgaVEm/K+RyBaT5lflpLYzOpVnuXi30a2zLPtoUKeJadUMF98DlHKIvk0YEsy/IhHf7WUhZ1/28rEyznj2on9JLJT2XBC8mu0HO368OEN6QeV1qZvixybceNUm8Esw78ygML+x9wtK62xeUzMHUMhjUEOcYuEjGfiCb6uWl1jV1thjNDVL0KoyiE/lRTO55sL8O8/NWQjBzjt6JwMDZeSInyHg9xEm1OSfFyeTqFcJhXDzfM5ezy7butsTBHiRDyqgHQv5Ca/84HyuFaXtDEoS2iZ4mcl+bEJqaFtBStw==
Received: from ZRAP278CA0002.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::12)
 by DU0PR10MB6608.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:403::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 08:52:57 +0000
Received: from MI3PEPF0000847F.eurprd02.prod.outlook.com
 (2603:10a6:910:10:cafe::2e) by ZRAP278CA0002.outlook.office365.com
 (2603:10a6:910:10::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 08:52:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MI3PEPF0000847F.mail.protection.outlook.com (10.167.240.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 08:52:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 10:58:21 +0200
Received: from [192.168.8.15] (10.48.86.45) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 8 Sep
 2026 10:52:54 +0200
Message-ID: <7b131dede6a53c2e7f775137a7a98b7902a8487b.camel@foss.st.com>
Subject: Re: [Linux-stm32] [PATCH] arm64: dts: st: fix arm, smc-id of the
 SMC watchdog on stm32mp2
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>,
	<alexandre.torgue@foss.st.com>, <mcoquelin.stm32@gmail.com>
CC: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-kernel@vger.kernel.org>,
	<krzk+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Tue, 8 Sep 2026 10:52:53 +0200
In-Reply-To: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
References: <20260907091400.55954-1-mateusz.nowicki@posteo.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000847F:EE_|DU0PR10MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: f6d484a1-8691-4e43-716a-08df0d8693da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ziA6vmkJn6b0CDXNSSDqup1KsK8h4X/3rwjvYcLjAOc/kOCszaUvXDWFj7QjaBnPX5cwmtRdUINQtWx790bPedBuZAlrtdmXLgPChKMc6iYIw4GtbGEp9zYnHMac57UaL2MkGWXu9A6GFEG65ad2c8aRZe1GfCvdhbT2YCq2y1SAi1LT95ZlXTyVNrgrY+1UNr+tzFdRoI2fBeIMI30/gjKBZ8iQ9oyZceyuQdbJXzb2D/TxG9m4l31dhCQRW9MmaYAtR1q41LDOOUEmat9cLNuoVt8Ek5fZuMKdY0Y8HwT20BuJWBoI/WvA8IFZ83tURFOLdNS5kaA8AprWnrosCThet2xhlmEXgfbEnHToItFWsxqnySp5AX4HmsONYY01PHvPqH/vHUBkq6zC+DCy+m7fqn+LDcQX4SehiwSrDxjTrzlhrImmTjNnJ4wrSbXBtuadEtENRtNTgWY1wqI39bZWXczxEg04exsm2sM7S8lv2nUtw7bUb/X44dx31089nGtzLuTEEdADPG8vyuzAeXQTQdhzckprCoSS9LYOHdBCdNnJAzWj85vZQtIoo2V707WlO42WzQU0H7TU+kJyfrsimW9RWa3/0jxJ/m3VE4CuOfbi1APwa5ITNKdr9w7uXk7Cm+xUZu0VcfBlmukiSXIg9Fsr+JRMJuuE9PiRA1K+Ddm1+GZ1cHhwzuzNi3nTnpKd7/XJb7M6DycQHtokKw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X7rDzUDbyaAoK5mInJib896IiLKnnSq4dmuCygnDZsHIVfZ5FV5Umlg3HiQvaIm41RgHsGLIAn5HKYiTsKIjNMJ57zLSQ66t3fIXWNQqJQ4zl2f8RXDk6tcScAfdrWY57bXvxNnOaZQ/YAPsPcvLY1xjogoH8CIF2ILeElXsPHFPitKOKpkKYs2TnQDrFqnvgEg4M4qW4W9rjXhbJHaX2phDpEeeGgbgTSX/0BcvchaZm6/hcGplWSfDlvnam4G1yTgAVzRB0YsI4kIwLOqUCXzzXBe+GcDGXk3ui+QP+Dwoya97i6ywEARxZI+LccJucruzo2+jwn5qkWbDO6XJ2va6dPl0zEjLiKSVoT8IaTucOt3LV41Wa2BJMDI0iyLahoanVcLYwOdDiFFVi/YHI9rEiNikdeitDF9XX3HsbrhOv5A6mHYNZxbu2QzTru80
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 08:52:56.6402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d484a1-8691-4e43-716a-08df0d8693da
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MI3PEPF0000847F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6608

On Mon, 2026-09-07 at 09:14 +0000, Mateusz Nowicki wrote:
> OP-TEE implements the STM32MP2 watchdog SMC service with function ID
> 0xbc000000 (CFG_WDT_SM_HANDLER_ID), not 0xb200005a. With the current
> value the arm_smc_wdt probe fails with -EIO and the IWDG started by the
> bootloader is never refreshed.
>=20
> Fixes: 89fca38168c9 ("arm64: dts: st: add arm-wdt node for watchdog suppo=
rt on stm32mp251")
> Fixes: e9b03ef21386 ("arm64: dts: st: introduce stm32mp23 SoCs family")
> Signed-off-by: Mateusz Nowicki <mateusz.nowicki@posteo.net>

Reviewed-by: Antonio Borneo <antonio.borneo@foss.st.com>

Thanks,
Antonio
