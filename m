Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.59
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794375658;
	b=5dGQoY2Vs/VqFPuacFjBOjSq5qGzx4lkZskLmHNHkmh0v8FkRDbgUaJ5XDRHy/wcdaZD
	 1aDDDX8qOXKzJddR/edSnIG3AgkrZTIrGkBacq80+qE338Os4vtfBomVwHO6obo8C7dFK
	 cWK/4kOCiKz0NISJD9zi+XbP3+Ee/WFVz02tcl1y1lU5mCRylCncEPet2KzL6eAtcyAo3
	 CZavjLJ6LDSM1D/PRT9kUBrHztCCK1iPFRbrzlewNo+Ogjmo2nDOLgthrPbIDD4HFCrUb
	 y51Y3/QMJF0fR8AdEtFEXkyu0vPSaBjJyS51IZnWDf5/Nz/kl2seTg6PXkSlmkNb5KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794375658;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
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
	bh=gTguVT4zSr8jNllAuAmIR5Xl0iNqVMnvTRDE42p9UCs=;
	b=hsclozPzKBfWqy2b8KsqK3eshf7VA0cgexeNG/nM1xsKFqgJTNPUi8Um5a9MoWttWD9u
	 1GhtXJiL8J8MblW3S3bIg0BihrwqTJz7j4mEu8oUhL9mh6uDtrhHUaIxjoOM+ru3sgtfj
	 QlkDPTLnpy9/Vh+FBiM1VurHnFXiQZUwO95otcXzHCb5JzQmxYH7xfz19rWfZGozfzTDf
	 91PMfPTVmVkCNBbb9MhFVt8DM6y2YhOJxcypHFp/Fw8Sq2U5dKtOotzXYF3S7DMz9CaxB
	 rRuVGWFPs9/tJzhew28mrykxsmSr7rPpKaprN7o+T2JNSLLg2e4ep7v0AL5of0fbibA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VKYXCzl9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.57.59
Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011059.outbound.protection.outlook.com [52.101.57.59])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8721606A31C;
	Wed, 11 Nov 2026 05:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8721606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=VKYXCzl9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xtN9uO57rrmQiZWpWYkJihjdWnKLyDJU+hkXuMXnTZxSs7MWZabErJDIDbFIYBtxH+CiHkTh0gHyjZEBwi6tZmy6hq5OkWz7kJmTUKpt1KZ07yfHYb4E6L9HU+Baum1/33P9OldBJSSrpPDpgnjLUjQ9hL8CDOy9vhJFDr8C7UyjeX77lOCmehKBOoUlgj1Y1QeGsi9wpKyw3XRa41mcOHc2PaZeyI+Ov5O0tZKgtTT3uW2YYvxf5M8x6SWGEo4GrhzgJ7PrZSnd0cPpg624ApVVaKrARrp+TqJlBZpB7BX3MbRtW8SaPxRgtut7eDyWxv/uVnqXgPC8pOqTkCqxvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTguVT4zSr8jNllAuAmIR5Xl0iNqVMnvTRDE42p9UCs=;
 b=NV6ApvKKd4JbQesL7mgX0LKQBkB5edZYXmB6NbOWYwXaDZtdfyRYXic8hCXLdAuoKn9YO5yzAiXe2XvFhXiqaIRNqikNKDxFPHXEsArfGB60qdjz1MNk1t71ebswRA/tN2TLMtoMZEsW0RLKkLwDADeojJYPWGUYYJ0XR4RtxiSPxGynuHVHHtnMV4e2ELh6FCCbrffoKI4Qx9bQU5269b3uriDGR+95b/kAlim4jLlwQrTS+MWCk7b3PSG0eSWwjWZoW1fVb+npusKner0hIgX7JEVvkuXYyQXwQoVexBkbCjvR0k00e5HBnpTI9kPOvG9/hzQzWrjTDE4R6mbT0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTguVT4zSr8jNllAuAmIR5Xl0iNqVMnvTRDE42p9UCs=;
 b=VKYXCzl94YgSf2cyMMP9M4XOZT2NlZglbTIkcqXD8TdONAhBL6FAp+CP6yfwjjD/aTzb+TYTD9gM9mkqBmIihk8NkDGqRX+UwaXJbQZs6KrEc34sNZFcRPDAzmqwSLMKsC1OMU0nI8gte15pYHe3ORQ9WOElWlwiFh0+4Yq3Kbo=
Received: from BN9PR03CA0904.namprd03.prod.outlook.com (2603:10b6:408:107::9)
 by PH7PR12MB6636.namprd12.prod.outlook.com (2603:10b6:510:212::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Wed, 11 Nov
 2026 05:40:51 +0000
Received: from BN3PEPF00022BCB.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::91) by BN9PR03CA0904.outlook.office365.com
 (2603:10b6:408:107::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Wed, 11
 Nov 2026 05:40:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF00022BCB.mail.protection.outlook.com (10.167.248.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 11 Nov 2026 05:40:51 +0000
Received: from dcsm-trdripper1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 10 Nov
 2026 23:40:47 -0600
From: Akshay Gupta <Akshay.Gupta@amd.com>
To: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
CC: <arnd@arndb.de>, <gregkh@linuxfoundation.org>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <linux@roeck-us.net>,
	<naveenkrishna.chatradhi@amd.com>, <Anand.Umarji@amd.com>, Akshay Gupta
	<Akshay.Gupta@amd.com>
Subject: [PATCH v1 0/3] misc: amd-sbi: Add TBAI trace-buffer access over I3C
Date: Wed, 11 Nov 2026 11:10:31 +0530
Message-ID: <20261111054034.2453874-1-Akshay.Gupta@amd.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCB:EE_|PH7PR12MB6636:EE_
X-MS-Office365-Filtering-Correlation-Id: d51583a9-75ed-4f0c-5871-08df3fb65881
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|82310400026|376014|18002099003|6133799003|3023799007|10067099003|261021121427099003|56012099006|11063799006|261026121527099003|261028144727099003|261102123227099003|261022105027099003|261026140227099003|261021123027099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	SMK0rd7GLQzWQfLACJ2z4jznbL1U2zTbnF8kmsSdqSSiMXCj1231+7BHqINjtxV5L8aEbWBAUs2XZBbgukv/3qcroz/0dhXR905R5E86wtVsREE9cSeDCeEfSXC9rjDD/OQYLtcff4BKR8SqRTONxo2WD8QSNA0x2BAENpS86aE3GlPkPBC2QLhYubuV8hrXmjGNq2qtQstXzjG5WFnPC9m8vufFMGXDUkNs9me3K2tDZt61HHnp/RjUxnP0NYuKW0ckNyqmVZEAptnF3f4rtewQc4fu7EtVE9h6Rba0+6RQ2kqL3YmVYL3ou6cPtKAV4qNn/jVJuxgH0U2sLqWpRSQ/dpfyF7YhYcCnxIz9DO3MINjk5gsvHAVbxAcLfNIWISvzIoCVODHOxgNUc2cxpkjhMRwSrQeSHHMuDPtclRa8L5PkaMmaCFR4nuO7iA+nG0j1wO7zACgtceqnOfubAak0uaaRzyrLNCcITJRxl/toMqhmqNoXtch8bvNp6sbEmdB1eGzsBXC4YUAP48U/zyzmXclVkmI8imMSNL2j2vQFFJAiRQMXQhaThuKyVsZt3gpgdgOuoHzgNKKMWHT0jpD5htjM3OeWYvLf+MK3/M2UhfRSvLJyManSCJtMdIIrBD9F44gjDCkG/eWMg3blVYNxsdNmbC8PJxOyoxYhupD1ZOX3EVnjc4oZuQAZ1GBEikls8jnoO6ZWYphoihIGqQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(6133799003)(3023799007)(10067099003)(261021121427099003)(56012099006)(11063799006)(261026121527099003)(261028144727099003)(261102123227099003)(261022105027099003)(261026140227099003)(261021123027099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YLfP9GJFWHRpIPJzgjlev/nkM8kDQf6PAm+QG3D2vy8YB4roufX9uZ8W3uZ338CC6YTmLU0v5mC7k+XA4z9ubOUOwRZjvsvfmmF745XeWZPkdKpmlf5GRn+wJyA7NyPSIOtUoy2AqOYfJMVvZi6HR3dNMf1e+PH2LJixbyGFsd+t8+DNQUCZzzjHaAfoZonBVKyCum4EIoAf2k5OKgkEF3vcSSQtPFgG59XylWUQm+OpQvbJnnKngoKM5HRUXwoG0zvZHbuPX0CA66giRyuVJKAhjSpzpq/1vjACGEVVjYFu+tLa5OmdEe5ecwT9EgPt8rPMXBkcgjM7FZTrSJSaKpBafhEtAHxMaX5B8IWuGuhQqj197BA3vE71NIA/tBj9A97Fr7LCmI+xJ84+zLUVwe5i9JZUPLX9752aVlT5fEv5eRdPyNPRSsxKsx5CHfgE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:40:51.0970
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d51583a9-75ed-4f0c-5871-08df3fb65881
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6636

The Trace Buffer Acquire Interface (TBAI) in the Thermal Management
(THM) block lets a Board Management Controller (BMC) read
microprocessor (MP) trace data over SB-TSI. The BMC does not program
the trace-buffer destination address space. It selects a look-up
table (LUT) index and an entry offset, and the SoC returns the
payload.

amd-sbi already exposes SB-TSI register transfers on /dev/sbtsi-* for
both I2C and I3C. TBAI is a second protocol on that same I3C target:
a 5-byte request and up to 32 bytes of read data. It is not available
over I2C. This series adds it as a new ioctl and does not change the
existing register-transfer ABI.

Userspace interface:

SBTBAI_IOCTL_CMD is

    _IOWR(SB_BASE_IOCTL_NR, 5, struct apml_tbai_msg)

on the same /dev/sbtsi-* node as SBTSI_IOCTL_REG_XFER_CMD.

- I3C only. On an I2C SB-TSI device the ioctl returns -EOPNOTSUPP.
- Acquire (command 0x31) reads 1 to 32 dwords from a LUT index and a
  16-bit entry offset. One transaction carries at most 8 dwords, so
  the driver splits a larger read and advances the offset between
  chunks.
- Flush (command 0x32) resets the TBAI logic. The acquire fields in
  the request are ignored, and the 4-byte flush status is returned
  in data_out.
- A trace-buffer target error is returned as -EPROTOTYPE. fw_ret_code
  holds the status word (AMD_SBI_TBAI_TBT_ERR*) and data_out is
  cleared. A 1-dword reply equal to one of those status values is
  always reported as an error, because it cannot be told apart from
  trace data.
- A short read returns -EMSGSIZE. The partial buffer is not copied
  back to userspace.
- logging_en and the padding bytes must be zero.
- TBAI and TSI register transfers share the device lock, so the two
  ioctls cannot interleave on the bus.

Series:

1. Name and size the I3C DMA buffers. Register access still uses
   2 transmit bytes and 1 receive byte. Both buffers stay aligned to
   ARCH_DMA_MINALIGN.
2. Add SBTBAI_IOCTL_CMD, the UAPI in include/uapi/misc/amd-apml.h, and
   grow the shared I3C buffers to 5 transmit bytes and 32 receive
   bytes.
3. Document the ioctl in Documentation/misc-devices/amd-sbi.rst.

Testing:

- Built the driver and checked that I3C SB-TSI register reads and
  writes still work after the buffer change.
- On I3C hardware: acquire, flush, short read, and a trace-buffer
  target error.
- On I2C, SBTBAI_IOCTL_CMD returns -EOPNOTSUPP.
- Built the amd-sbi documentation, including the new kernel-doc
  reference, with no new warnings.

Akshay Gupta (1):
  misc: amd-sbi: Add TBAI trace-buffer access over I3C

Prathima (2):
  misc: amd-sbi: use sized DMA-safe I3C tx/rx buffers
  docs: amd-sbi: document TBAI trace-buffer ioctl

 Documentation/misc-devices/amd-sbi.rst |  60 +++++++-
 drivers/misc/amd-sbi/tsi-core.c        | 198 ++++++++++++++++++++++++-
 drivers/misc/amd-sbi/tsi-core.h        |  15 +-
 include/uapi/misc/amd-apml.h           |  78 ++++++++++
 4 files changed, 344 insertions(+), 7 deletions(-)

-- 
2.34.1

