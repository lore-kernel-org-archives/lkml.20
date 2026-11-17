Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794899474;
	b=LeRRqCAHuVhxGmCeMdjZ50x3S7dWAYXx+1JQ3qx2hU3w5Tq0uZukAOdk8hod68uxCxue
	 86vXOrOP6S6daa3g5gbduZNUAKExA+S8jIWZkY9zC9kSDXpSFjMSRwNGnlvUdg1fAgkyV
	 VBp+Cd1X4WNVSXXdkh4IS1vhjEqbueBQipq21rYSUxMCTze/7xD8k0f6zteguGJPwS3dX
	 B8VDYHj8/mJLVM+Sdx5MM78fDRJEsO0IjwZJm2LR1pGQYoMX02W2NTvIz/jaaX9rJLz/I
	 xJBDzN7xsGVM842J8Q8r+aaNonG8t2KQ7++A5ochYwmms62urA/tK+fsTc9Ifnp+h2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899474;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
	b=uV4mIVTsjrV7J7+4GoyVUJ0/B6cfK/3HIEADgP8VoFdDFpxqu+ncR5JZSL4vqhPDGTRD
	 5nu+qCfRRe+FlKWGSa0dX9qiku9+Gv6WT9eNRq5xvuolQUH6UOvMloOPBFMF/L6VM512y
	 MRkR+ZU7WRKV4D1tqRHz4OWnLxyir2da8LUhbhClp34Rc7TTISeBRW/Ojy0RRedPhAsVb
	 icbZ7IxSR5P9eWWTIKHIXCpeskd1MUz/wihH6sHllH7xvaB1YS964G1JBSuPlraZrj6d+
	 Wfl4USJs7Dfy7GuA2kwq4d1gFw/zxi1JXn1YEqjm05JsPIK26pintTUtoz6lCOwzREw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=de6w3Iee;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.2
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D28606A334;
	Tue, 17 Nov 2026 07:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2D28606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=de6w3Iee
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dk1znTqEs64ZimMy0uxmoVMfzAzjjo246UAbHEB7virdN4o8uPkwEF9x2Yt7YbX95qyOHeqMSaSAdinuQT3xhxC+6tYO1u8z/tcyJxXdt0fSH0G3MDsurcQiaaD46dVf92F6+/EExE2THLjrepQSqBPckc3PKwCwQiZwus6O+BdeiP4YcUI7wheZA95UpQn3mXoKfOWOnOrHDJW0vGItc49e8rJgRiM1/v8qsFoluACj034vkkpjrPgVyUvKjkjnNbVDeyd/2+cWPlrZ4TDZ4VOxHM/odY0inJu4+xbpvgehXQoxfkfkkDyJADeuSsBHW0KOOGxwBXdfGL0SG/tRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=MHaS2uzhrIHell/6DezbcCQAMCPkeX+aSi0mzgUUKbh5+U3NOv8gmEqaiLWQh5lhVzfIrQBWG160PT3HpE8x24CRFcMH7pVxhPulXkH65SziDVFlHosx4MLFLJGFHDznpjxnOVHicSgJtYtbcgPJKu33RGrI/OgvM0GEE20JI+5OncIjRJQrmv7Du9FZwz4ROPehfAf1VbQRoeuawDj5TyIkGy6nrpSpAjGA+IX60aeBdyB2po92LKoSBpNG115kUdRBnFjpYC2kK745mCD9OMGRThPnJPcS/wXlokPgCLNX3fxveG1s/oISlpcQPKFJaG/nEE9wOsKvw3QKKEu3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iy1UXqbCNpmIvsTgL/zhHFoaBSmEE9Rqb2TUApr3hYc=;
 b=de6w3IeepJlfqAeERk553GhkNDMpazgzrOKkFhNFsAwFdfJ+jeeohWlk2tEQq0nZ46ZtTy/SP1WuRon2PU5j9/XBJxXhumdC9E4E7uFgOptB66ZOcfRM395D/S23zQxgV9oCMhjCVVtCdx7QqhcKcqwh1AUpYJ9CjrivSE1WPDk=
Received: from CH0PR03CA0256.namprd03.prod.outlook.com (2603:10b6:610:e5::21)
 by BY5PR12MB4132.namprd12.prod.outlook.com (2603:10b6:a03:209::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Tue, 17 Nov
 2026 07:11:10 +0000
Received: from CH3PEPF0002457B.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::5d) by CH0PR03CA0256.outlook.office365.com
 (2603:10b6:610:e5::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 07:11:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0002457B.mail.protection.outlook.com (10.167.252.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 07:11:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:07 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 01:11:07 -0600
Received: from amd-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57
 via Frontend Transport; Tue, 17 Nov 2026 01:11:03 -0600
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <vkoul@kernel.org>
CC: <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
	<Basavaraj.Hiregoudar@amd.com>, <Sunil-kumar.Dommati@amd.com>,
	<venkataprasad.potturu@amd.com>, <Syed.SabaKareem@amd.com>,
	<Mario.Limonciello@amd.com>, <Richard.Gong@amd.com>, <Poojitha.N@amd.com>,
	<lee@kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: [PATCH v6 11/23] soundwire: amd: assert msg_lock is held in amd_sdw_read_ping_status()
Date: Tue, 17 Nov 2026 12:35:46 +0530
Message-ID: <20261117070906.803139-12-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
References: <20261117070906.803139-1-Vijendar.Mukunda@amd.com>
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
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0002457B:EE_|BY5PR12MB4132:EE_
X-MS-Office365-Filtering-Correlation-Id: 166f1c6f-8cb0-4b4f-7e29-08df4479f4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|56012099006|11063799006|261021121427099003|261026121527099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+LWmycyLPxFf6Ua2IPbeD7EJHZ+OgK7FyDfr8pK/pBQsU3Dgx3nAjtxkqNCTQi9BGpd+lbVz5uhpFZo24m5okAuOHw7S4pJWKaf/altJn8iFsXX42/ZrDJ//nWRZOPiLc1ccgqZVuNqg+2vP6R49lx3A3eTSVzoG2HztvXv6NbS0FdcuoA98EMDqb0pMvMVDRfKOdXTlTXg8eMj4iP3TnWjo+fuLnTEf0ac87qGRhKrvtqSZaGThVfIFurVS9pZHCnIGO9SEkOg8eIKnK3ZtzalNc5OlVqLj3MIrMHzD+wDaM/0EAn+5sbd/7l3XdQy1gk1MYvaYILBElW16cZhSixhqFOj/kGetH81KRRCul0Y3gwIcbGajvcPeKI/b8QWVj6PLTWsCXEOEgmJM//v3JLbEsFQOgtvgIUJ6efbMc1XVTdCckkcd98yIT8AGON41UWR3cQdes7Oz/5tcsgh1LDkrE0vrkg1hy8TwWEstd1E6mKYGYepvYcKbiuqzsP3ykqZ6+e4Mzm65uWfrYPhEDoTVt++CjnFaZbuDZ8Lhp/3nusf3KFN4a5sQOt1DIgUuLIqYKi2JRyhsiYEHRs0oOUO3iaMCl1XDoa0RHlbhwi2VM44rdNDD+QMfvkGd1SzLcHpJll2/g1iLTtqQpYyT+phYR0ATNW6s0tqT704o6kh7Sa4D9gf3QK0wjPUNrlYCm+v9XqSVxgT+lePLLff9AA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(56012099006)(11063799006)(261021121427099003)(261026121527099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dcEP1U6+2C1d1dc73Nn8KwCfkILPmSn/NZWnmSwAGXpkUzran/nbCeMqklqfqfMCA+BUTyEHizsjNVScCSNS66dNhwetZXOyCXsx/56FkskdVo6DFHQHeXgYF0wu7gfuS3fhe9Sqr8GUHPNdS7z38ItGg3LLPN11e6tvYGL+v++wb+3Rp6LK5HEpmv+GpY9NKtnZ1pXRN1e9AEI0U3CZWlxycCP0mCCOK0BajZrPLimTazceFqDWcydbN+FPgWM2MvQU1akZdLeF9S9EW2eJVZB2tTjMBvhe8FdfjOsdb6TwCM3Q2IKrdA6TyeWoKTXOKzOivjZQ0gkItDTtxLKg5UpIgMrTHcvGHI1g2HiNbf87AtqUe9c+grMivceT85FbRIbrjkuzNls9oakWTlXSfmXP7cBHNGBFhQv6NfThDco+DFaszL6+xjQhtIr363vD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 07:11:09.8740
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 166f1c6f-8cb0-4b4f-7e29-08df4479f4d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0002457B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4132

amd_sdw_read_ping_status() is always called from sdw_show_ping_status()
which holds bus->msg_lock. Add lockdep_assert_held() to document this
locking requirement and catch any future callers that omit the lock.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 drivers/soundwire/amd_manager.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soundwire/amd_manager.c b/drivers/soundwire/amd_manager.c
index 7b1aa2a87a32..3a97c12b45e8 100644
--- a/drivers/soundwire/amd_manager.c
+++ b/drivers/soundwire/amd_manager.c
@@ -562,6 +562,7 @@ static u32 amd_sdw_read_ping_status(struct sdw_bus *bus)
 	u64 response;
 	u32 slave_stat;
 
+	lockdep_assert_held(&bus->msg_lock);
 	if (amd_sdw_send_cmd_get_resp(amd_manager, 0, 0, &response))
 		return amd_manager->ping_slave_stat == U32_MAX ? 0 : amd_manager->ping_slave_stat;
 	/* slave status from ping response */
-- 
2.53.0

