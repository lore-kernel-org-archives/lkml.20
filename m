Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931585172E7
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784469; cv=fail; b=tdoXQUPgtwTElfShvhLldDL/AlhFOtw4Xum72v/2vs2JCb+95ofcicTr1C8Q1qFznpUO46I+blEvKkYULVMhMAuVdbWcssg1A3Gu0/X4fWziyB7HVbGLOdE8tA0//JVcifqd1pzE2aXSOUma56k/eIyHaLhnsosC9fASNwSKdp8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784469; c=relaxed/simple;
	bh=iLPK2SxzAS2veYtHzR4gxIdFEWMJXqbcrIpfZpiD02A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jKpecRW/qwn2WiRvINoGj4lnTd2fUGhger7/ba3REfxOAtNtmy5dJg/zCgVfU+47hI0Jet+Jc1+l8n8nRXv0WeN+hKpKYONfd7nJVJBWaAI0oReaCpUIhUrHbfhYj2GqGxMZFYJXzPfljxZuAlv7qKP1yFW14HnGA+Lx4hexKmc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=UB1ii5Br; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Saf1Ep4f; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="UB1ii5Br";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Saf1Ep4f"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1Jwe3057440;
	Wed, 30 Sep 2026 11:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2M5b3MdYTCiI0ruSUJ/RjoowOws/TJYcftQtD7RPW
	xU=; b=UB1ii5BrWVTo8XiAwgImivHQ37skE98jI5XC7NLnGTpmto5Zl4zSxbhgJ
	B9GukUQg+PdXAYvz4uIM919O/jvbYBtg8hJzbQnDu6oqQTIbzqIybmtYL0ibwxoj
	bFuZtfLB7OW46xG3/amkQMKMWNCkFzTmHNKo6QnoyjcptE1zGHSjichSdg94sxo2
	J+NP0TocDVk5d20t1U3UOfhpG2sqCVhBbOoCdgr8WDXghebF0pMQ7scCZBDe8ScW
	7RgyXshsXMJX2UWvK0gMmeKEQUVZUMXNhTo+GA04mQzDY4gZ6dfscYiMSfv9Q/ti
	gMrFQgtI3oSikJFu3TwDBJuSnDRnQ==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010064.outbound.protection.outlook.com [40.93.198.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0m9fehwk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WC9JOc14oI/TzMrJfYKVpgtrCAYykZUZZsmScWKo4MH86IwG4c2vWr1Oza0Vu5zxp5ScfLZyOMX9XOe4HTBV2CSUHW+sDiQ/8c9Uy8ts39eg0vwdfNS3LwSjDvIZw7TA/pfo4CCpooycbNPZlUQZ+68NAb0eMV/i6h+cSoWrtVdVsKetEDD8Ntw8A1nyXkakyiIv6ifi9G9dnZDUr0t8Pe2b4s7kAc8gubQkykb1sAGaxPme5GdFp+9CpLezYJ/zDIftlOLlg0NeBEmDqHSFBcPWhIr0MjICnHhRQTfYJ+qSlkjiamzacok/Ea3+Rxd1bEdKsYNDu+K1AMtbztzCTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M5b3MdYTCiI0ruSUJ/RjoowOws/TJYcftQtD7RPWxU=;
 b=Dk5yAK3a6gBDuv/V3TqcuO6PtwBHzGDLKc/jhVxLeO7aLvdy0uJdimVZMslbmeeedpBEtAwg7tkLhJjICZBdHmJLqjCxk8ZatW7uuX7BxPVHDeLFzbmACzWNr9gzgQ/WmLUtofJYN2tZUolF3wwjKxQ1tGZhNgZLfeVikMuW5o6v///iAgLu6Wy80g9hRex2DgA24ZHfaiba8gttcjkk4NbgZHm9koS0SpG9Tcr7cpeVQGTJpJse/1GdT6dD8vJnZDc1sVbUHi2hloRWBGtz50Ibhls38sMt8Vk6t0995MIm84Fk8oQuqunlHy6iiTroxZCfrtDsGm71Fb1nxWOSFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M5b3MdYTCiI0ruSUJ/RjoowOws/TJYcftQtD7RPWxU=;
 b=Saf1Ep4fDx5KvzbLe2Q/yd8awVjGdDJvtPDu9TnUBF9+UYKVKpac/mpSi0OopxpHc+ls8y9/se20584X/9ozB7ZXKNT7weTqQ2FrQSRngOf6oMImcXanM+Kn7uT8J6eQPsg5ESXIipBPPuLgvF77kusr3vR8SrmsTa6C4VrfcK8=
Received: from CH5PR02CA0001.namprd02.prod.outlook.com (2603:10b6:610:1ed::17)
 by BL3PR10MB6210.namprd10.prod.outlook.com (2603:10b6:208:3be::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 16:07:25 +0000
Received: from BN3PEPF0000B36E.namprd21.prod.outlook.com
 (2603:10b6:610:1ed:cafe::5d) by CH5PR02CA0001.outlook.office365.com
 (2603:10b6:610:1ed::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:07:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36E.mail.protection.outlook.com (10.167.243.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.3 via Frontend Transport; Wed, 30 Sep 2026 16:07:21 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:30 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:30 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:30 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68W93425232;
	Wed, 30 Sep 2026 11:06:27 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 06/22] firmware: ti_sci: Handle xfer cleanup inside ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 21:35:51 +0530
Message-ID: <20260930160607.2674980-7-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930160607.2674980-1-b-padhi@ti.com>
References: <20260930160607.2674980-1-b-padhi@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36E:EE_|BL3PR10MB6210:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d86b4c1-b776-4161-067a-08df1f0ce8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|10067099003|3023799007|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	W2lqFXqzUdF8hkyNwm3JuUWspHsO+ujXUh2dkyHQZfHOfqeoYzJuK6opPhz1/YP4RTyCyfU7KkFFvVrCl1YIkzr8uhG3ADLnzvnQ2qKXkdFScSV5qYZjUdogvRaRaqMpIxiNEh83KPWyMgwiFKJWn2tmw+8M5ghEcJe/vQM9k+1NhiO319T+/k/GgL/ZZR4vOGZU0HB+w8tlnA0rWU8WIK7Sn+Qh1mGuDzg5g/wFXzWWFh0dqlU9+jQ2b+ECxOdVgNrAiMR6Gyfj6vuD5XigpECViEZLwRdVI66C9ZHSgJOZc03OiYGizM7pL7+RaTBAd2ephK8aVEPYQlegreuD8I8XxBHetAi9Q6VS+gRWqg4kyjKb3C/EsQjFMjPvSZ8xnwwOeFsOAN151kxbdFpvL3K55pDhDZN+ooTKZVicJ+AWZSAtOXYwQM6ARyHE96t5v+qt4sNK6Kcndmm29Tn3cbJzyqz2qLfkquR0VFWq+UxLd0Qj0tHO2rKazDyAZ2BEA6Ac8Pgij+Iuc8vre+8th85qf/ZWmuBwM+mueIXOvzr+fmkMjUukUSTu4Kg2I1pV3zD6s4C7QPP1WpmHqvj3AA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(10067099003)(3023799007)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	s2CeY3itMEyyht/Tyx1GsIEXgS2EOnj80YUoQjbVpzDBWFOXsYoU+991rILATj2BNE3W1ex/mPQTIjiaI/H+zjCiT9TMoYdW/a97fLcpCMEWRUi36CEBlA5rlSGGWALsuL8JeV1GUXnMRHU+ZVvi9jQCrpRFlajshXXiVIassdWitUQYDrHQ00qXXyWp17o3S1FWMiX9cQlY7sDD2lUDijMRnxe4Oikh6OXxr0ewyetlLbyecVa60KRQBNQZhDSP2WGcAE3PaC2KBqVmB9IhXb1Il19i2JdUFAEGpdnuhm+7KPdYcllK2L5NTx+W9pq0Oa1thH5A6GPf9kHHsNNE0kXlmc2+i192g0EXUOEaCjjiGaw1jhjhFhNoINDiLKO7TSWpwGkl+U7RqaHiJMQotbCi8FfKJxkIolNyoqlTOaW6SK9X5YR846A+TO8Imt41
X-Exchange-RoutingPolicyChecked:
	3Tea/Xf8tqS8Pu6RR2HvscjeLaDHLiejUy4BFl4kG0nhVBkHXgb2QrGtVPJS0tc7yp1gLOOH9il+9y5UgxNOZoij8aw/eWnEucX/4VnGFhrtAflOSPmurLBlbF/Ap4CZrX/XqdublB5MlB1RnYaSUSOKKcyE+gqMFEYOATfL0UfCyDc8rw/HWcRSMzc3qVbp39fPvKCOX/eTr6sMbTQJqSrWnskSrEbSSaskBRfRkS54O6ydfbdWck3kzw6OqyDBlhG3iqDjwABrE6dnQZPQRhy9P3emyC7gvOryhw+5Bxoe8nK9fuX0PTWQ8nkKLWCPexrQh8gItWp7toy1+eagRQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:21.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d86b4c1-b776-4161-067a-08df1f0ce8fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6210
X-Authority-Analysis: v=2.4 cv=VfRir1p9 c=1 sm=1 tr=0 ts=6abd33c1 cx=c_pps
 a=NRkibxwGrRsmaa9wFTKTPQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=U3diLxmOwd7Fp4-x424A:9
X-Proofpoint-GUID: nA3jOPl5ij_mbsYht6VeYtVVGR6An-Ua
X-Proofpoint-ORIG-GUID: nA3jOPl5ij_mbsYht6VeYtVVGR6An-Ua
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX1eR3xecUj2Oq
 A19r7EW+p7tCYkAa0NrASWSklmzi0J5cfvEOwmsXaI5UfZw3SmCMP+4PkuPcu5+QCqroBfJe0hF
 jQBrnhSkrqv//2i1wwjBlvhodhAMwqFeEV42g90sZK7/Gg9f5nSpMcH6BryFSDP9e7gn17XQoQo
 GAa8x0yYOHchTd4ozxCwnmGFCQSy7AIH1L7YZPO8GEp1w5rCuPs6bhXRV20dsqR3KMbcPDkWX+m
 QsJ85B5fEYIcivpe2SMvdOm7FCE1CVY2YjuFFS+GtkpTw9aCZ7THIInLY/A3y6KYZOG2w1ALmHa
 A8p9WV6rAuLJhkEWrdIfQyVGau+zm8SFodVW+XrwJf89IpP2rlfZpBnDmlmCIIiT1npP0SI7cTL
 6qBZcJAFgR+sADB8i140sb5BnsVf2JABlWtdVqBjFSrem1hoFVZuMvdWWSQWxy2WqTwO6BQIOSf
 +7i2zIawgdpC2g1bBXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX9jOX9DXPo0UO
 4/CBn2Vkma4y9416zW1lZEsoEk0dYHhoy6wJFZ5AZ3UUyFnxHRgddW0Przt9aRQLnKPvnV3IGBO
 bq2sJuer7+Zg3kVSU4mRXejvX7ZcSB4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

Pass the response struct to ti_sci_do_xfer() and have it fill it
when a response is received. This makes the xfer struct no longer needed
after this point and so it can be cleaned up after the transfer. This
prevents accidentally not freeing the xfer by the caller and after a
follow up patch makes allocation and free of xfers handled entirely
inside the ti_sci_do_xfer() function.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-7-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 471 +++++++++++++++-----------------------
 1 file changed, 179 insertions(+), 292 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 9081288bd133c..c1f783bc67353 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,6 +43,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
+ * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
  *		Since we work with request-ACK protocol, we can
@@ -52,6 +53,7 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
+	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
 	struct completion done;
@@ -298,6 +300,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
  * @msg_type:	Message type
  * @msg_flags:	Flag to set for the message
  * @tx_message_size: transmit message size
+ * @rx_message: receive message storage location
  * @rx_message_size: receive message size
  *
  * Helper function which is used by various command functions that are
@@ -312,7 +315,7 @@ static void ti_sci_rx_callback(struct mbox_client *cl, void *m)
 static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 					       u16 msg_type, u32 msg_flags,
 					       size_t tx_message_size,
-					       size_t rx_message_size)
+					       void *rx_message, size_t rx_message_size)
 {
 	struct ti_sci_xfers_info *minfo = &info->minfo;
 	struct device *dev = info->dev;
@@ -368,6 +371,7 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
+	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
 	reinit_completion(&xfer->done);
@@ -447,7 +451,7 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
-		return ret;
+		goto fail;
 	}
 
 	ret = 0;
@@ -489,9 +493,14 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 			dev_warn(dev, "Message response not acknowledged (caller: %pS)\n",
 				 (void *)_RET_IP_);
 			ret = -ENODEV;
+		} else {
+			memcpy(xfer->rx_buf, xfer->xfer_buf, xfer->rx_len);
 		}
 	}
 
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
 	return ret;
 }
 
@@ -507,32 +516,28 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
-	struct ti_sci_msg_resp_version *resp;
+	struct ti_sci_msg_resp_version resp;
 	struct ti_sci_xfer *xfer;
 	int ret;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_VERSION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
+		return ret;
 
-	ver->abi_major = resp->abi_major;
-	ver->abi_minor = resp->abi_minor;
-	ver->firmware_revision = resp->firmware_revision;
-	strscpy(ver->firmware_description, resp->firmware_description,
+	ver->abi_major = resp.abi_major;
+	ver->abi_minor = resp.abi_minor;
+	ver->firmware_revision = resp.firmware_revision;
+	strscpy(ver->firmware_description, resp.firmware_description,
 		sizeof(ver->firmware_description));
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-	return ret;
+	return 0;
 }
 
 /**
@@ -549,7 +554,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_state *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -562,7 +567,7 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -572,12 +577,9 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -597,7 +599,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_device_state *req;
-	struct ti_sci_msg_resp_get_device_state *resp;
+	struct ti_sci_msg_resp_get_device_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -613,7 +615,7 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -622,22 +624,18 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
+		return ret;
 
 	if (clcnt)
-		*clcnt = resp->context_loss_count;
+		*clcnt = resp.context_loss_count;
 	if (resets)
-		*resets = resp->resets;
+		*resets = resp.resets;
 	if (p_state)
-		*p_state = resp->programmed_state;
+		*p_state = resp.programmed_state;
 	if (c_state)
-		*c_state = resp->current_state;
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*c_state = resp.current_state;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -892,7 +890,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_device_resets *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -905,7 +903,7 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -915,12 +913,9 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -957,7 +952,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_state *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -970,7 +965,7 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -986,12 +981,9 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1012,7 +1004,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_state *req;
-	struct ti_sci_msg_resp_get_clock_state *resp;
+	struct ti_sci_msg_resp_get_clock_state resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1028,7 +1020,7 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1043,19 +1035,14 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
+		return ret;
 
 	if (programmed_state)
-		*programmed_state = resp->programmed_state;
+		*programmed_state = resp.programmed_state;
 	if (current_state)
-		*current_state = resp->current_state;
+		*current_state = resp.current_state;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1235,7 +1222,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_parent *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1248,7 +1235,7 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1269,12 +1256,9 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1293,7 +1277,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_parent *req;
-	struct ti_sci_msg_resp_get_clock_parent *resp;
+	struct ti_sci_msg_resp_get_clock_parent resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1306,7 +1290,7 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1321,19 +1305,14 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
+		return ret;
 
-	if (resp->parent_id < 255)
-		*parent_id = resp->parent_id;
+	if (resp.parent_id < 255)
+		*parent_id = resp.parent_id;
 	else
-		*parent_id = resp->parent_id_32;
+		*parent_id = resp.parent_id_32;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1353,7 +1332,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_num_parents *req;
-	struct ti_sci_msg_resp_get_clock_num_parents *resp;
+	struct ti_sci_msg_resp_get_clock_num_parents resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1366,7 +1345,7 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1381,19 +1360,14 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
+		return ret;
 
-	if (resp->num_parents < 255)
-		*num_parents = resp->num_parents;
+	if (resp.num_parents < 255)
+		*num_parents = resp.num_parents;
 	else
-		*num_parents = resp->num_parents_32;
+		*num_parents = resp.num_parents_32;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1422,7 +1396,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_query_clock_freq *req;
-	struct ti_sci_msg_resp_query_clock_freq *resp;
+	struct ti_sci_msg_resp_query_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1435,7 +1409,7 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1453,16 +1427,11 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
-
-	*match_freq = resp->freq_hz;
+		return ret;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+	*match_freq = resp.freq_hz;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1489,7 +1458,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_clock_freq *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1502,7 +1471,7 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1520,12 +1489,9 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1544,7 +1510,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_get_clock_freq *req;
-	struct ti_sci_msg_resp_get_clock_freq *resp;
+	struct ti_sci_msg_resp_get_clock_freq resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1557,7 +1523,7 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1572,16 +1538,11 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
-
-	*freq = resp->freq_hz;
+		return ret;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+	*freq = resp.freq_hz;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1602,7 +1563,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 			TI_SCI_FLAG_REQ_ACK_ON_PROCESSED;
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1617,7 +1578,7 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
 				   msg_flags,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1630,13 +1591,10 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to prepare sleep\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1655,7 +1613,7 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct ti_sci_msg_resp_query_fw_caps *resp;
+	struct ti_sci_msg_resp_query_fw_caps resp;
 	struct device *dev;
 	int ret = 0;
 
@@ -1670,25 +1628,20 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_FW_CAPS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to get capabilities\n");
-		goto fail;
+		return ret;
 	}
 
-	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
-
 	if (fw_caps)
-		*fw_caps = resp->fw_caps;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*fw_caps = resp.fw_caps;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1703,7 +1656,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_set_io_isolation *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1718,7 +1671,7 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_IO_ISOLATION,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1728,13 +1681,10 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set IO isolation\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1752,7 +1702,7 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct ti_sci_msg_resp_lpm_wake_reason *resp;
+	struct ti_sci_msg_resp_lpm_wake_reason resp;
 	struct device *dev;
 	int ret = 0;
 
@@ -1767,31 +1717,26 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_WAKE_REASON,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(struct ti_sci_msg_hdr),
-				   sizeof(*resp));
+				   &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to get wake reason\n");
-		goto fail;
+		return ret;
 	}
 
-	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
-
 	if (source)
-		*source = resp->wake_source;
+		*source = resp.wake_source;
 	if (timestamp)
-		*timestamp = resp->wake_timestamp;
+		*timestamp = resp.wake_timestamp;
 	if (pin)
-		*pin = resp->wake_pin;
+		*pin = resp.wake_pin;
 	if (mode)
-		*mode = resp->mode;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		*mode = resp.mode;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1807,7 +1752,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_device_constraint *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1822,7 +1767,7 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_DEVICE_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1833,13 +1778,10 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1855,7 +1797,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_lpm_set_latency_constraint *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct device *dev;
 	int ret = 0;
@@ -1870,7 +1812,7 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_SET_LATENCY_CONSTRAINT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1881,13 +1823,10 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
 		dev_err(dev, "Failed to set device constraint\n");
-		goto fail;
+		return ret;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /**
@@ -1900,13 +1839,13 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 {
 	struct ti_sci_info *info = dev_get_drvdata(dev);
 	struct ti_sci_msg_hdr *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_LPM_ABORT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1914,19 +1853,16 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_reboot *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
 
@@ -1939,7 +1875,7 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1947,12 +1883,9 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -1973,7 +1906,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 				     u32 dev_id, u8 subtype, u8 s_host,
 				     struct ti_sci_resource_desc *desc)
 {
-	struct ti_sci_msg_resp_get_resource_range *resp;
+	struct ti_sci_msg_resp_get_resource_range resp;
 	struct ti_sci_msg_req_get_resource_range *req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
@@ -1988,7 +1921,7 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -1999,23 +1932,18 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
+		return ret;
 
-	if (!resp->range_num && !resp->range_num_sec) {
+	if (!resp.range_num && !resp.range_num_sec) {
 		/* Neither of the two resource range is valid */
 		ret = -ENODEV;
 	} else {
-		desc->start = resp->range_start;
-		desc->num = resp->range_num;
-		desc->start_sec = resp->range_start_sec;
-		desc->num_sec = resp->range_num_sec;
+		desc->start = resp.range_start;
+		desc->num = resp.range_num;
+		desc->start_sec = resp.range_start_sec;
+		desc->num_sec = resp.range_num_sec;
 	}
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
 	return ret;
 }
 
@@ -2087,7 +2015,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 			     u16 type)
 {
 	struct ti_sci_msg_req_manage_irq *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2100,7 +2028,7 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	info = handle_to_ti_sci_info(handle);
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2118,12 +2046,9 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2402,7 +2327,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 				  const struct ti_sci_msg_rm_ring_cfg *params)
 {
 	struct ti_sci_msg_rm_ring_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2414,7 +2339,7 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_RING_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2433,12 +2358,9 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2455,7 +2377,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 				   u32 nav_id, u32 src_thread, u32 dst_thread)
 {
 	struct ti_sci_msg_psil_pair *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2469,7 +2391,7 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2480,12 +2402,9 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2502,7 +2421,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 				     u32 nav_id, u32 src_thread, u32 dst_thread)
 {
 	struct ti_sci_msg_psil_unpair *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2516,7 +2435,7 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2527,12 +2446,9 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2550,7 +2466,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_tx_ch_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_tx_ch_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2562,7 +2478,7 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_TX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2590,12 +2506,9 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2613,7 +2526,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_rx_ch_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_rx_ch_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2625,7 +2538,7 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_RX_CH_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2650,12 +2563,9 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2673,7 +2583,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 			const struct ti_sci_msg_rm_udmap_flow_cfg *params)
 {
 	struct ti_sci_msg_rm_udmap_flow_cfg_req *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	int ret = 0;
@@ -2685,7 +2595,7 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2715,12 +2625,9 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2734,7 +2641,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
 	struct ti_sci_msg_req_proc_request *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2748,7 +2655,7 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2757,12 +2664,9 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2776,7 +2680,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 				   u8 proc_id)
 {
 	struct ti_sci_msg_req_proc_release *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2790,7 +2694,7 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2799,12 +2703,9 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2821,7 +2722,7 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 				    u8 proc_id, u8 host_id)
 {
 	struct ti_sci_msg_req_proc_handover *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2835,7 +2736,7 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2845,12 +2746,9 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2870,7 +2768,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 				      u32 config_flags_clear)
 {
 	struct ti_sci_msg_req_set_config *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2884,7 +2782,7 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2898,12 +2796,9 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2921,7 +2816,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 				       u32 control_flags_clear)
 {
 	struct ti_sci_msg_req_set_ctrl *req;
-	struct ti_sci_msg_hdr *resp;
+	struct ti_sci_msg_hdr resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
 	int ret = 0;
@@ -2935,7 +2830,7 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2946,12 +2841,9 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
+		return ret;
 
-	return ret;
+	return 0;
 }
 
 /**
@@ -2969,7 +2861,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 				      u8 proc_id, u64 *bv, u32 *cfg_flags,
 				      u32 *ctrl_flags, u32 *sts_flags)
 {
-	struct ti_sci_msg_resp_get_status *resp;
+	struct ti_sci_msg_resp_get_status resp;
 	struct ti_sci_msg_req_get_status *req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
@@ -2984,7 +2876,7 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-				   sizeof(*req), sizeof(*resp));
+				   sizeof(*req), &resp, sizeof(resp));
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
@@ -2993,21 +2885,16 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret)
-		goto fail;
-
-	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
+		return ret;
 
-	*bv = (resp->bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-	      (((u64)resp->bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
 	       TI_SCI_ADDR_HIGH_MASK);
-	*cfg_flags = resp->config_flags;
-	*ctrl_flags = resp->control_flags;
-	*sts_flags = resp->status_flags;
+	*cfg_flags = resp.config_flags;
+	*ctrl_flags = resp.control_flags;
+	*sts_flags = resp.status_flags;
 
-fail:
-	ti_sci_put_one_xfer(&info->minfo, xfer);
-
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.34.1

