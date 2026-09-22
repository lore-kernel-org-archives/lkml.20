Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010036.outbound.protection.outlook.com [52.101.46.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27204B1D10;
	Tue, 22 Sep 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790108644; cv=fail; b=SAfZ/X+tws0y27LnTQkcWz8x+1ZuLzT3hAt17DsIyzmnSQdxFguuf6i/ZIRe/hwCB0X1HwX18lY8s4649l/iF0GKwegSf7R29nq0iLrGAgqqgFGQiSPedPIyGP5wn0jC4X7tzm6eezuxQ/0g+lrkPDqbg0Qf807WwZum5//1uH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790108644; c=relaxed/simple;
	bh=H8Oj3d+GtSSAm02QoyHJR+lA1oZpkBfytcnvfOMQ8Uw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UvbG23YY/Ilt/vepPgVvRkQVAyAM8jtzs7xSnml0iyywlZshKZ4lr5F/OetdcCTsh5dv1fDlkTYnvapYe25zT6B32UuX8d0EYsTRldxK6nFHiGpM/F2QTbdNCnBiMSs7Ure7a/nAA/Q+CzC7XUq375/KWFLSfSbJsutVM/A9tTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=s6dDcrE6; arc=fail smtp.client-ip=52.101.46.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="s6dDcrE6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5Xv1lxzcAD8y+clj5D/k4Ypc1p3AHtD4MiPePXKloGaCW7yvQFY1LfGdezGli1mT+JNRQyYboUT6vN+cqZYuFKBgNS7UAR2y1TUbCkcYO3tFBK16617YbXoNr6Um2NW5Cthcr+3aS9lrDswygtizBzHCuA4nUYCon6FNDqCL2U6gWtY8eiKQDW9/pxNGQdHqQdBPctKoJOc5UyjbGRPiU80H0sLdD4KzFFPWdEBH+2P5mGyil1KxF+pFA/cqWyBUBlx+4OGpEnDfkRUev08L3IFlhsknJjSw+WHgyBuYTHzu8u/XAmsfvo8eaDlyK5IhveUBqYXxd3nkLXktX91OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSQbc0bUlazWRmIMdlWKwSoLS89tXMoeDSYhz93ligo=;
 b=EPEEuVMXhD5W0BbQAWgoQiz1ihAARGU4gJ6M/6/e8ExYUJUZc4hzaXF+ncq1prZ20p+uoqR/47JPADNPZIOXCHtyDC8xuvsdCSNyOK51e+9yQlnC+IZWYkm7CulUP7UwATnSLDOPpNQLwu1whOPpyLz/Azej5VePg1WEZ4s6zvd2UGc7OSarJOEeSTauYIP/8YlK6avY5TeadkxikKxkLKGSZnPtBDg++v8qK0X4GuxVncgMwMyrJ5TYaEbSdzJ1eCtBD3vXOKIYHYrFeujgOpXqO1HTWBXFI2Rdc8xg/cRdumBFHzqPaBTCjJDBqFg+qk8j2jCXAMBCJXQO2+fMNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=alien8.de smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSQbc0bUlazWRmIMdlWKwSoLS89tXMoeDSYhz93ligo=;
 b=s6dDcrE6leVWt2Fj+GciF2pDNTCD4l+MC2bFr8kG57OpanT6oFzLK8Qb7ddHNAszHVsijc5lneehMd5RQec3/4lq3XvxuSusXE0zNpu0LQDxeV5qqbx9p0lrVH7y11r7s1FVzO3MyljuQSpjL02nGAhpmEdWEvJtKMb6xIWO7+U=
Received: from SJ0PR13CA0016.namprd13.prod.outlook.com (2603:10b6:a03:2c0::21)
 by SA1PR12MB7126.namprd12.prod.outlook.com (2603:10b6:806:2b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 20:23:43 +0000
Received: from SJ1PEPF000037A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::8) by SJ0PR13CA0016.outlook.office365.com
 (2603:10b6:a03:2c0::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Tue,
 22 Sep 2026 20:23:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A8.mail.protection.outlook.com (10.167.244.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 20:23:43 +0000
Received: from quartz-7b1chost.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 22 Sep
 2026 15:23:31 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
To: <bp@alien8.de>, <linux-edac@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Yazen Ghannam <yazen.ghannam@amd.com>
Subject: [PATCH v10 7/7] EDAC/amd64: Include DRAM address in output
Date: Tue, 22 Sep 2026 15:23:17 -0500
Message-ID: <20260922202318.4079080-8-yazen.ghannam@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922202318.4079080-1-yazen.ghannam@amd.com>
References: <20260922202318.4079080-1-yazen.ghannam@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A8:EE_|SA1PR12MB7126:EE_
X-MS-Office365-Filtering-Correlation-Id: 47d6c32f-00d5-4d49-46ae-08df18e765cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|11063799006|10067099003|56012099006|22082099003|18002099003|20046099003;
X-Microsoft-Antispam-Message-Info:
	wTHHJr/CnK6fs3tf1Mn558yqzYKgOLLNPtm3msQc783e33Z1EPFi3+PIOfP/nqb37zGkyla+XLw4IpM7/Yorlp4hE9V9XqrPF0HJdGjwH3h1Jb466az9HeoCvETBj4nwqPmNwda3insPnNzkZpnfcqmmMz1uvrdCgB7v/LBIIyNOtTkCOr/Kw0tS7qsIYJ8Enh7Fz+1ghN09JpMeQeQ8LX5OewEEOyNp2G3kkCiu8SNwo1bhnzYtrQU3MqvPbh6893taFmOIgWg0E+ErOUYoDmjl+kwBqRHhEEQHn1qyChN+fb6gMqC68SYXDiZYgdFn/EFXTUNd/z69UT09nybRs90FYpuDjdS8kPK1YhdRUcVsHJiPF1O3WbSP6ve6azu05LO4iQlUqKMvQiMvpPntMenmnBtKAB2RSKjpLZyFC/hRusJjK42dqNH6LPhavIgr70iUPF2N/bnzEufydPl3NNSH7boEcKvZBRlKxiaWEHu3U7kHbi3SH/vJvc5NjgCdFZrbCQ/00LqTnAnPeOVyrLEf4i3GwekWvha0+meheDc+sadEli4S1rHTL2JVtK9ul7oEptfz/8vnbHLuCqRI7QUC+lR/U8mQADvmx2cntKW4SHDSld3PDoQyz5Mv22lzLexdgDGQc+sOg4rYFwcxCOMTSeVTXsjX0Qs49aSSRQUAxmkLE4DQZ12GTtuH5XJHR5X8pCWN85wU32bYL3utfg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003)(20046099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m9rci2G86HCV2cwggvPyPweAwtWwISaXB29HpJ1teDdzu5oIUrLQ/fS5U66zace+ABHZWIASfmlee2oe70oKmHo9Z7kRotB1Yqlwj6gfr+vxcZgOVOxlRbO7Zi1Sy0g/8L5a0Pui1+7vOo+jpfJVKIxF0xXeQJVO6QwhDgwpQgB4pWpG0OuV8497QpiF9MTCEFk/AQoyz57XfqlVn1HJsp2242U4lPfHNojGpFfufsFCdNb9hQCLAQCF7YtBfWrJoHwEpTRgX5RHj/pNRUnkFcbnHsLpopa7fzWauwsNhUgHNPZ8IwyL2fG2ibaj02eUUnE9RLBeuS7ABQFf+mWTgdK61TeCwuVbpunzmSOUcOpTr1P4SKNM/c5s+CnBUPTdlhXp1Z+iUYQ+Cx71+InB1h906uBeCWA490rl9WtmVPPR3gCZab/ABzxz43GqGA+l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 20:23:43.3060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47d6c32f-00d5-4d49-46ae-08df18e765cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000037A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7126

The DRAM address of an error is used by tooling to find failure patterns,
e.g. for off-system analysis or to offline a page affected by a bad row.
Other EDAC modules (GHES and SKX) already provide it. AMD64 could not,
because the translation is system-specific.

Request the DRAM address in addition to the System Physical Address when
translating a UMC error. The SPA is required to log the error. The DRAM
address is best-effort and only added when its translation succeeds.

Add the DRAM address to the EDAC "other_detail" field, along with the
socket and IPID that tooling needs to translate it back into an SPA.

Assisted-by: LLM
Originally-by: Avadhut Naik <avadhut.naik@amd.com>
Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 drivers/edac/amd64_edac.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/amd64_edac.c b/drivers/edac/amd64_edac.c
index f428d815bff1..7d7d116dbb75 100644
--- a/drivers/edac/amd64_edac.c
+++ b/drivers/edac/amd64_edac.c
@@ -2704,11 +2704,15 @@ static int get_channel_from_ecc_syndrome(struct mem_ctl_info *mci, u16 syndrome)
 	return map_err_sym_to_channel(err_sym, pvt->ecc_sym_sz);
 }
 
+#define MSG_SIZE 256
 static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 			    u8 ecc_type)
 {
 	enum hw_event_mc_err_type err_type;
 	const char *string;
+	char s[MSG_SIZE];
+
+	s[0] = '\0';
 
 	if (ecc_type == 2)
 		err_type = HW_EVENT_ERR_CORRECTED;
@@ -2745,10 +2749,27 @@ static void __log_ecc_error(struct mem_ctl_info *mci, struct err_info *err,
 		break;
 	}
 
+	if (err->a_err.valid & ATL_OP_DA) {
+		struct atl_dram_addr *da = &err->a_err.da;
+		char *p = s, *end = p + sizeof(s);
+
+		/* Include a version prefix in case the format needs to change later. */
+		p += scnprintf(p, end - p, "[AMDv1]");
+		p += scnprintf(p, end - p, " SocketId:0x%x",   err->a_err.socket_id);
+		p += scnprintf(p, end - p, " IPID:0x%llx",     err->a_err.ipid);
+		p += scnprintf(p, end - p, " ChipSelect:0x%x", da->chip_select);
+		p += scnprintf(p, end - p, " Row:0x%x",        da->row_addr);
+		p += scnprintf(p, end - p, " Column:0x%x",     da->col_addr);
+		p += scnprintf(p, end - p, " Bank:0x%x",       da->bank_addr);
+		p += scnprintf(p, end - p, " BankGroup:0x%x",  da->bank_group);
+		p += scnprintf(p, end - p, " RankMul:0x%x",    da->rank_mul);
+		p += scnprintf(p, end - p, " SubChannel:0x%x", da->sub_ch);
+	}
+
 	edac_mc_handle_error(err_type, mci, 1,
 			     err->page, err->offset, err->syndrome,
 			     err->csrow, err->channel, -1,
-			     string, "");
+			     string, s);
 }
 
 static inline void decode_bus_error(int node_id, struct mce *m)
@@ -2844,7 +2865,7 @@ static void decode_umc_error(int node_id, struct mce *m)
 	err.a_err.addr      = m->addr;
 	err.a_err.ipid      = m->ipid;
 	err.a_err.cpu       = m->extcpu;
-	err.a_err.requested = ATL_OP_SPA;
+	err.a_err.requested = ATL_OP_SPA | ATL_OP_DA;
 
 	amd_translate_umc_mca_addr(&err.a_err);
 	if (!(err.a_err.valid & ATL_OP_SPA)) {
-- 
2.43.0

