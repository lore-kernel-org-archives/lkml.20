Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792587457;
	b=M7h23pTnAJ513/aEw1R3bSRDI0N2v2fGhIuJLNASaQegRJuHq25fk+6Ty5hV9+AxJe4D
	 1Wr1qkc/btnUGAA/9E0xwfDjo6TZy6LdKQIXXGXnSxHnIRaDhc8KgLFVPKn6GgmsmwVV1
	 BDHHzdTsPf9em7LyRLh52yyyXIPZW8UKM91vi8cmLr6wub4ZLf+r8q/qv74y6t6yeurEW
	 //vcRFqrAslXbetgLdFq1bkR5UF6csQsdi9LotQUQBz2Op1vbyj8YxTPdFKNOPxst7doG
	 cmhWT82p8/4KVng+AnxcdSXjR9+4oUgXHDKe5V8S7J7BYE2X74BwH1liQnWCmIdn7ew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587457;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TE1WL8d71LEHEkOK6cOgEMeLDNeTFeVSGnhLH2PfcXs=;
	b=ycgeZyJ1xcSBZBNfItJl8wOrTsuj/m+yZPuzQjWnp348Bmhq+3+EeUkNv988KCH6++KO
	 yOOSBM+tAkX8UJLLgWMTGu6eTjubBTBz4Z3bCRO/VgduEinEzy5zTluD/qJIXvEqpG7jj
	 8kUKsu16Qvm39XwXmLAfB3gtxDC74Ol+Y2wH61Ot0U9/T8dmW90nBDvwlbSp4z1xRHFiA
	 fxHp5b0Yq8KTG/QoMKXD3pHyJnOtlWvrEnCogBDkb418bfD7qmQo/mG2ve8rJgWyQ6H2N
	 NUdS6z19ht8jZx5INPTBiZEfSkJVGH3zkA6bgjkBnyYiSqmvkDiGy7mvkkqakWPhs8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="o/YW9uik";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.35
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A02606A319;
	Wed, 21 Oct 2026 12:57:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A02606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o/YW9uik
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fuvkETpVvPhNvbmQrJG6B0cyXNa2eZ6WqVbDAJTezfVmLjVeUGOQVIv8W+NJOJWaGwSGIaIJNcA8ix+0mcboEvS05bhtFvZsG3Awz7+L0xmM0aLk3Vr6zinnl8ZqTvSUUGy0Qsw8OiTR3246uqV9rkRvFCImBf8Z5ns3KNIjGIM+XKDepgku+8mk7tJQ/ECPWJ0HNDUNPnD2reAiXqTx1IJi7lLudcjtijF3LhYfhKwLTTqiMBaMI5EVhArBFq/iltxFnHNSHpNgIyFq4r9P5lEdjrC/A6cgKVq3R+fdg/n+nelyGOzUSlJ72wjgxN/MvJ0A8M8Na+PfgabEK0tZqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TE1WL8d71LEHEkOK6cOgEMeLDNeTFeVSGnhLH2PfcXs=;
 b=S3QXsPK8yLkVR0rHYJ/WupPxM4ZAB5fEjkbJ1m5IocroRePa7fr4sLQFAGelVjnlu4QQGol3RkKkNT4hixCtdBLUJMD/qU2qwnQ8WlFLe5oYmCqQshYYGyysIkR8AaE2rbj7HchcHDk377Jwk4/NOpSiAlqpMIYEm4zbaPnFb3D1eGjRDEqOc+SrudPRrGLg0Oycal2GfLlIl6HZQBGXQPK5Gl4yTwfYkDQcDXIgGofyAD1Xu1YnnrBoBK4WRNvJVbQWlCMzWOMiviWqajQ1RvT+/8ZgoNtXYT2g+BFxeOCeLpNpkOvM3LrVfdFPZkCNZ+Aaix1dBbRmmRtlBFmeeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TE1WL8d71LEHEkOK6cOgEMeLDNeTFeVSGnhLH2PfcXs=;
 b=o/YW9uikroz3fL1m+PdZqqrRZw1xCq0jTO3QJyLkteUfy2p3yKzMJnVQD+O8ccps06wNdShgXoon3YDrYcHao6xQkTqoiZDacaAYvAjV1oSacc5n8i51OmRpPY3JAPtF9SyXy13X7B6DBdDPemfFyBV5YoyziBc3cITiTTV1M+c=
Received: from MN0P223CA0014.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::26)
 by DS5PPF5FAA0E762.namprd12.prod.outlook.com (2603:10b6:f:fc00::651) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 12:57:30 +0000
Received: from BN7PEPF000000A9.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::18) by MN0P223CA0014.outlook.office365.com
 (2603:10b6:208:52b::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.20 via Frontend Transport; Wed,
 21 Oct 2026 12:57:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN7PEPF000000A9.mail.protection.outlook.com (10.167.245.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 12:57:29 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:29 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Wed, 21 Oct
 2026 07:57:28 -0500
Received: from xhdrveggala50x.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Wed, 21 Oct 2026 07:57:25 -0500
From: Rama devi Veggalam <rama.devi.veggalam@amd.com>
To: <bp@alien8.de>, <tony.luck@intel.com>, <michal.simek@amd.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-edac@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <james.morse@arm.com>, <mchehab@kernel.org>,
	<rric@kernel.org>, <git@amd.com>, Rama devi Veggalam
	<rama.devi.veggalam@amd.com>
Subject: [PATCH v4 0/3] EDAC/versal: Add XilSEM CRAM/NPI error monitoring support
Date: Wed, 21 Oct 2026 18:27:19 +0530
Message-ID: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
X-Mailer: git-send-email 1.9.5
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF000000A9:EE_|DS5PPF5FAA0E762:EE_
X-MS-Office365-Filtering-Correlation-Id: f10cb306-e962-4b39-fdfd-08df2f72dd64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|376014|7416014|36860700016|11063799006|56012099006|261009223027099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Y98UYgzEFOXkqjLLeN11K4XVqmXE4FYbN06igRAnUv5ws5/Cp07nRxC5J4rSGlOipeHpcCUs471/ARqLqenZLGSOk2+YdaiGfjdRH9WfU/cYOlvJmqytMH9OmHGdj179CabsJyOVkYZH5XYYb9WqNbFgI6j3EfvSvZ/AluIoQ5prRbHXTQkRxAVt0BJExLiaJvK6I/RS6vau/9pi4rwxLUd+N9cqYERkpnjD8uUjEfQrKzOSDZZWo8dEXK81oc51+w/IYR1rse5hKkV4yHi36t/pnI+ssXAr6sdKs00kG/H3+lMsrM786qeWf9LqyGD1SJUcI6omSehWpjsgXGHCfMBXRlIC3dQUpA2YvTpOLEeDNqke29uv6CcPOL2o7xjNMXFgbweLQmLvvLc6QnRMeZgi8ImX8YaULv4p30Z30Q61ilTVIQgZf7mgybb8MGEsI8FqDFX2LoHtKdcR6sdyQby6d8axC7kZ9ZlPVd44nAsQtlEklIiiTA7C4+iQD/wtQqZNVEsHNf3y6Z4sv1TU5Vrv3G+MiwFJcScZobIJDKDv/3NsFNOpCMAQBjMEGzir9uDoNraesuzWTMdJ2OVIrZupKV3O+MFmdFLvMXMVH+tJoAZze8Yq30rgSq7vcykzauMz2ezjvXAIZiggmuazt13qAdPmkfwLftaRIFYf8Z5GEYVE6aThLTK6tNOviDzGlSO79yruxpuGgYAkm+77vQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(7416014)(36860700016)(11063799006)(56012099006)(261009223027099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	o0TDfxmLbhqTeGqa6xqAs3G+8SkQlBp5KukLbJ0oG7IaJf/Uwqka8ZyKzJOmDqHWjL8apbH/MeNgvVey/x1pFlTKTXDfUHonWD8aHYbDRrGS0CWAR9xge6XUATppLsO4JtGP9gmv2Piz/9/aPu7W7vjFwUQkvmDIn7w7+J/DE6xc7wVKSgYB3DiAlM5dY3UN8wGWk8yeqJoXa/5zgjU9Y/uSPjzeRFmaHTh6sPAyjD4POA6K7HmxTkZ0vx1c37AzusHYmSh30ckjz+Pll5NfUxuEpP0aRlGERAmi5YN6RSG/yqltswenmqaaG9Ijy5NTX7SwKukg6nd6hh2jcKP1SpyFcVVjnLBAeQy+hQ8WvmDdTB8Ffec0YxvzcSwxXzpcZP8tIpLn3tR4bytdtG936/s5ioOqNrBSulYRIZa6DNJ7wjKBAIdM02+8PBH6OLd1
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 12:57:29.6601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f10cb306-e962-4b39-fdfd-08df2f72dd64
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF000000A9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5FAA0E762

Add support for XilSEM (Xilinx Soft Error Mitigation) to
the existing versal_edac driver. XilSEM runs as part of the Platform
Loader and Manager (PLM) on the PMC and monitors Configuration RAM
(CRAM) and the NoC Programming Interface (NPI) for correctable and
uncorrectable errors. It is registered as a second, independent EDAC
device alongside the existing DDR memory-controller (DDRMC) device,
using a new "xlnx,versal-xilsem" compatible string on the same
driver module.

Changes in this series:
- Extend the devicetree binding with the new compatible string.
- Add the firmware (EEMI) interface and error-event node ID/
masks XilSEM uses to report status.
- Add the driver support: probe/remove, event callback, sysfs
attributes, and their ABI documentation, bundled together in one
patch so the sysfs interface and its documentation land in the same
commit.

Rama devi Veggalam (3):
  dt-bindings: edac: xlnx,versal-ddrmc: Add xlnx,versal-xilsem
    compatible
  firmware: xilinx: Add XilSEM firmware interface
  edac: xilinx: Add XilSEM CRAM/NPI error monitoring support

 .../ABI/testing/sysfs-devices-versal-edac          |  286 +++++
 .../memory-controllers/xlnx,versal-ddrmc-edac.yaml |   64 +-
 MAINTAINERS                                        |    5 +
 drivers/edac/Kconfig                               |   17 +-
 drivers/edac/versal_edac.c                         | 1276 +++++++++++++++++++-
 drivers/edac/xsem_edac.h                           |  219 ++++
 drivers/firmware/xilinx/Makefile                   |    2 +-
 drivers/firmware/xilinx/zynqmp-sem.c               |  229 ++++
 drivers/soc/xilinx/xlnx_event_manager.c            |   16 +-
 include/linux/firmware/xlnx-zynqmp-sem.h           |  196 +++
 include/linux/firmware/xlnx-zynqmp.h               |   50 +
 11 files changed, 2328 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-versal-edac
 create mode 100644 drivers/edac/xsem_edac.h
 create mode 100644 drivers/firmware/xilinx/zynqmp-sem.c
 create mode 100644 include/linux/firmware/xlnx-zynqmp-sem.h

-- 
1.9.5

