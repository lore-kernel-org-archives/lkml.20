Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794726433;
	b=jF/7IXlHDbM5KrEttXts0fFUxkbZAVUNeDn3SnfJol/v9BDOkN2wuC42TBlfmv+gQhGQ
	 WHP85I/jp6B/W+iIPsXaThT/aEZ8r34ORH6nAxbXbroI/uMyg5pTGgTzbnvM/lx7TQX0C
	 k3/qAwPLLLnssEPmHoRuQBcP7VSfBOoG6Ux9Uk+8mK/VF1hHdUerly8BKua1YT12/BaXz
	 m6+noCF4zVpaYxF7vxhO3SDVGUhvXI7u5TVV546noiH7G10Ld1i2RYq5PHSPhZQutSE9h
	 VbV6N5DciBtDsL9L87Wmdk1hoGxT6voYtTT2oXOzQpnvSB7q1frRzjMr7vOcKS96o5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794726433;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:Content-Type:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
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
	bh=Uw5kwI4jBTRrkjYBJhlQLGf2v/0IXkYIrzxPPgnMUXQ=;
	b=kwPrlSh2yNzgyBDAGUFJjQ4A2lgASecNVblgHXdzUjc9cm+qxlXvZe53aXUOMtNjk/Y4
	 5lihk40SmNpAN7PaWthAQ6PHY5j7nlLiY0CbCq22DI5L9xN0tNtHiwxpHj5TXcslq4Mb+
	 OqJZH6rYAvil8iFBAaBv32JRbqngK8xabG0mUqC+bONPyRkfkPlteHPoQlfb50uvmF6s1
	 BIHFht8m9+hD3jWPwGayyrL75neQMiyexWbQRojgyPMxkFfB3gy2WXEsTGXxXbTimwoDq
	 DrbDLVisqRHV2DMbSG7h0DRWtDKJBAJWMGAWiMFM5xXNwK5AWctJCBw/cwNnqA/VN3A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="o5k/jggI";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.64
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010064.outbound.protection.outlook.com [52.101.56.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D41606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:07:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D41606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=o5k/jggI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QxocIbC8yesFCP+8Hi4SUJlzN0IlfSnBrraheyaAFO17gRmwhgtYDMs9WN/SnOrS1n9IQQaF9SpsCi6/s9l3yUtta0YCQ5gY73QfzYd/bLBbwlzp7ad/kTsDcIXfZN16sINcR6VqAmOVexWlISoHyNQo0MoYDWeqHsm5i3B0waFdVKt9HB3pThodGp2CH1AjXxAIJjZe1GHlN1NH9rJj3PNNiWlvzA6PirE+aS9ilWI+uX8ETi+0HheWTRf47/lmcqzfwqx59v1wZ03U8IewZ9dor1YKPGA9FBy/NjMTLVV9j+stez+3DAGKGKtt1TIgYmP4X8ctrX6XxI2mNBYeEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uw5kwI4jBTRrkjYBJhlQLGf2v/0IXkYIrzxPPgnMUXQ=;
 b=ASd20eyVqVNZ+d2Jr1LgOWaBDspfu1P1kpSa7upvF/UnpyirS6hF8Ak0sztj7xZY8Z2k0BlMdfG+YRj/vFu2X+/mb/mqpuv83QxuXomuKwWBigz8BKJt4uymUKHqI8j/Abb1xBW3KpqUgGumIqXlzX8og4bGJv7OuuvkkclWoICzPJQVL4JTc9L2ss2ddtACPTrugqmOeqk7BkhpLdiaWNnAFkw9jDFlCX9/UMf/OAPHbOhBUS0SPLhjKGWLVAOckCGfjdlpmnCKoQ4kPMYjX9N56+SxgHxoT/RSTqluwkCCZEeI6CtWynhnTXFFErsqzhm5gW2+vhM6HPt/Bm5bow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uw5kwI4jBTRrkjYBJhlQLGf2v/0IXkYIrzxPPgnMUXQ=;
 b=o5k/jggI5HHT5Fulb1gc+Rn2/dEjWVclGYCHz62ILq3Fx2Or0hc795VXwl64TDR+rSiMU+OZV1rYn4oTMO/edHIjGZi+UruYxD2PjD13lAlNdpifCOsUsqo6+zC1ZhbwIA9uMpdY/O5DyMoSBVhv0MNRUXERbUKYUNfRi3yOgOU=
Received: from CH2PR14CA0004.namprd14.prod.outlook.com (2603:10b6:610:60::14)
 by CY1PR12MB9676.namprd12.prod.outlook.com (2603:10b6:930:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Sun, 15 Nov
 2026 07:07:09 +0000
Received: from CH2PEPF0000014A.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::24) by CH2PR14CA0004.outlook.office365.com
 (2603:10b6:610:60::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Sun,
 15 Nov 2026 07:07:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000014A.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Sun, 15 Nov 2026 07:07:09 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Sun, 15 Nov
 2026 01:07:08 -0600
Received: from wayne-dev-lnx.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Sun, 15 Nov 2026 01:07:06 -0600
From: Wayne Lin <Wayne.Lin@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: Jackie Liu <liu.yun@linux.dev>, Jackie Liu <liuyun01@kylinos.cn>,
	<harry.wentland@amd.com>, <sunpeng.li@amd.com>, <alexander.deucher@amd.com>,
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amd/display: Fix logger leak on perf trace allocation failure
Date: Sun, 15 Nov 2026 15:08:01 +0800
Message-ID: <20261115070801.1465490-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261026111047.97178-1-liu.yun@linux.dev>
References: <20261026111047.97178-1-liu.yun@linux.dev>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000014A:EE_|CY1PR12MB9676:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb4efad-b1ef-41b6-ee3f-08df42e71086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|10067099003|56012099006|11063799006|260925022911599003|260925021911599003|260925021311599003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	l1Vf256RkwJECjTl3Qis2PZcxqX956p3bBa1zO+rhB/g7ci3S9BLc651qkC3RCoFUMIsit4beg/mYhnEOqDcl+2/eeAPwoY2b6fQ3lwk8EXSZuqcS8vsVkof/qIvoG0A3HDZQTLDfyhb6RTWaKtkdWe2I7RUK5bzUhBmKhb4WUNgKRCDePTiDjW0E6oAHycna5OM9JrhQnP4kFCKc2OqtBuS+sifgCSksFIRNDc8P0vGYGNaB8qK9oaU+tOYNTsa6C6nPU9vQWJ0x7IyH91dilRQlGyq1IJ4cKnJyom1snlQ8WU5owxynZfxu2jsUOgmUWwrnm8uIk3dEaJXG2Hvy1B9jCMjlCb3hcnCeT8aRNdwqcXfYj7TwADEclFHrvLXI0zowBKV5TURmLdVd5e0gKIx3CdbxQvRDyNN8t9Fa7h8W6Skok2uiM04Vveuy5JATjk9LSWpwtmhk2Wfg1C69nVBJ3qkwPz2gTKs4OCdtY+UWqKgmgy5U5S6acH03tpsFHrD1/7zgY49c6sS6HRJqUV+GUBnjnyN+ybkwP0akBad7q2pN9+s9XvyVOUaMUnE9/AmxuQXBGLTXbAwwRICv2TUZufpzqeno/ITACXXRGkkFK1ygvqbx6EgOkLmjILpi0SXcjidSV2WqHRxWXsWnqY2d+yH5sLmU6HBA33paFCaTdHSE5ify4ee728y7X7tI0NCNKTPaIuGY0eS+QBI/A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(10067099003)(56012099006)(11063799006)(260925022911599003)(260925021911599003)(260925021311599003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1/JdrIVnHzw3L4BOExqInrH+3PVa7wjkTlDo5v6Mc1DQwdw5mEjd4P62OMfhxCiL9daev0vyTe57wLHlpTDjOAkbaHBQF4boUat2Zn0Bbv8yhIBdmeBJdjHtPeX14oU6samsSIVqEACJhOR30U1Ut8NKrS+HYe3LdruI5OIf2JqlA/H2Rp1903sDlHEJ8aQVIYkbFsOrtLyjZzwDd0WlYR64XcegN9DGGP5gc/pMgfZyOlUhMbKidcvWTlVr1KyVjsj1zeY4C4MAHX84oUFoqiNcKTwd1i57+gENHuG1fgDxmwyxuVoWSfaxjMqRHwpSRjYCK7mVDtntb8dmdxa0WVetwPzZTbuPejGECx4zhHV3u71blnI3B3vX/cOf9KxP4s04NQyRqlGYsOLZl/zJem2uIs5feJDFMV5ZyRY7/1fi5u+f/eHtHpzhQPsV/mqz
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2026 07:07:09.1743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb4efad-b1ef-41b6-ee3f-08df42e71086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000014A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9676

Reviewed-by: Wayne Lin <Wayne.Lin@amd.com>

On Mon, 26 Oct 2026 19:10:47 +0800, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
>
> dc_construct_ctx() allocates a logger and stores an alias in dc->dml.logger
> before allocating the performance trace object. If dc_perf_trace_create()
> fails, the function frees dc_ctx without releasing the logger. Since
> dc->ctx is assigned only after the trace allocation succeeds,
> dc_destruct() cannot reclaim the logger on this error path.
>
> Free the logger before discarding dc_ctx and clear dc->dml.logger to avoid
> leaving a dangling alias after the failed construction.
>
> Fixes: 5d72e247e58c ("drm/amd/display: switch DC over to the new DRM logging macros")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 1143916391e79..03179633cd036 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -1022,6 +1022,8 @@ static bool dc_construct_ctx(struct dc *dc,
>  
>  	dc_ctx->perf_trace = dc_perf_trace_create();
>  	if (!dc_ctx->perf_trace) {
> +		kfree(dc_ctx->logger);
> +		dc->dml.logger = NULL;
>  		kfree(dc_ctx);
>  		ASSERT_CRITICAL(false);
>  		return false;
> -- 
> 2.43.0
>
>
