Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613DF509EFF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784447; cv=fail; b=EmC96QPX7P5fYDxNQTcpki1GO38e+ggMSM6+JLU7W6Ed9j2/ViuA7QQbCxFflQMVTf7bRFplJLar4AlQbabsjdYkd57jXqePGbKPlCDMVFZAMNCIvCZEdVxgXyxr/XHyZwJQ4mOc5Ce/PEFsC/wxmo7Es0LS5SpBPu5qHBkW4fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784447; c=relaxed/simple;
	bh=z7/fli1ax2J+Ljp0Zkpiob8k/SqUX2lyo8M/DQ8NAqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UQXyBnwB2Gu+mVEUXEvYz4bgE/Oo5PpBRZCQzlUmeJ/OncqgESt8m0MwYi456Z+FmlOPXm4lz68H2KAktvbNB+AGA3x5Z4pI5oX4eGAJNnHeoR1Lkdz2wL7VtRFQuC20NIkI3Pw1n3FWEd+t5dcQHi66ufIdY5emDXqoOx7nja8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Gguv7usK; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=loq+j5bh; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Gguv7usK";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="loq+j5bh"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1VdC3890161;
	Wed, 30 Sep 2026 11:07:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JJOdpxYr2YSSpwbRyNbCPXqlvQLx4LYRXHJ/gTiLz
	sE=; b=Gguv7usKl6qF+BaujrjjoahpWy7fHn4YXkqRIWGJQjKXvaAAVTEuX1Pzw
	uoZBeYxYwvQSuoa0VXFsCEeoSOazGuMF2MfApcx0aTr4qszQn4rDvfGHDU/VV3oS
	DMN5zwljnd+2FQs2kvs6eRjviQTZtm1SSZP9Vok3aOfulX+azTSITLTb/JxfAHSG
	ybNObywUDRmtNtp0hDmLJStDuWFXrKXzUbJK9ou0QPHwscylAKrILEUXKPz6y32r
	7ljS2GYQnVKAb6kvKZlZdktLw90SFoylm+1nchaRVz8GH+5xoTKhsHgA3GaDKfmH
	6J1pIBQI1D7CCgti1YwsTV9ZcFrhw==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012070.outbound.protection.outlook.com [52.101.43.70])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21y1r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:07:17 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAo2vMQtHgEcTn1KZPYHSnpS34VcjsoFM0ATil79Izh5tAZEKhZtOYpd6HxqlGx6+IwFArDzZsdBrGs6VzWHVaB7nVx4KjNBpDxg96IZ5HrJk6Jyr8SzkqAen0EVaoKfDb/fIaKOIPyWKdvAhlsnDUvt+rEVn0vKBB3W6VrUb+KLe8h2VXKXwRyiPx0HNFJY65Pgn1l9YhAOzeliTi0FOaeTWWAeg0ZmHdfm+rNumPceiC/2YyuvqM3KeL1DEkhTFynGkVFKg2TKgzGtcg7tlLzd4+k38Q8flkxR/XpyF8GgwDiktUmRZyMxDBEcAcYXRXKKDyyqAlFC8Tme667hxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJOdpxYr2YSSpwbRyNbCPXqlvQLx4LYRXHJ/gTiLzsE=;
 b=RhZW1GPRCIswOwlN6rsgoFOjMVx7czE9tO14tknU4GF+abUSRNfNY501+DvZ4rsMtFrRBXj4Tulc2UASxriBOFtNhf7XsGXf0xIKDBTL+R0XzxuQlFhFe3H0dwTXHW9P0AnssTpSeLXVtsQltQEXXUNEv4SKn4v1S3TLyZTmpT44phbVsoVsKj3FHUucRYc4cF0uZDX/Z7sEvOIYSJ69mY6hUnTFcdykLirFkXoTc4fvn0Q9IH7JrOlBBEzp65HWV97oJe1qHk5NMYYm2oxu2w39VYVRoQOi4MBWyNRXnF5KM6zOyDzZQ1nfYIPIgC2TBMlv9p19hecvnSys3ruqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJOdpxYr2YSSpwbRyNbCPXqlvQLx4LYRXHJ/gTiLzsE=;
 b=loq+j5bhKDPIqHxWS3VLmWkCjDS8XFFRrXep9mF0HV4bAWt22sXfEd+SkbA9bfavqFg8SguXFl2cFHK8jp4UYby3Aag9SYa2uZsTMTI2BbWtC+IvA8tdAJmJitq41rFrFKU0SnTRg+skInS4DZ6eoOD6My1r7ObyfZxH0cmBgUE=
Received: from SJ0PR03CA0142.namprd03.prod.outlook.com (2603:10b6:a03:33c::27)
 by SJ5PPF912A858AF.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7b9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:07:14 +0000
Received: from CO1PEPF000066E8.namprd05.prod.outlook.com
 (2603:10b6:a03:33c:cafe::72) by SJ0PR03CA0142.outlook.office365.com
 (2603:10b6:a03:33c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed,
 30 Sep 2026 16:07:14 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E8.mail.protection.outlook.com (10.167.249.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:07:14 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:42 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:06:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:06:42 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WD3425232;
	Wed, 30 Sep 2026 11:06:39 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 10/22] firmware: ti_sci: Use tx_message as message buffer directly
Date: Wed, 30 Sep 2026 21:35:55 +0530
Message-ID: <20260930160607.2674980-11-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E8:EE_|SJ5PPF912A858AF:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e8a84bc-3bea-4854-4e1b-08df1f0ce477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|3023799007|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	5DPznbfc+0KFkP1pdAKspXe0RW0v8ApLnGVRw2WJeT1Qxag8cq5vkT+H9mrLLObTXg4PopMtR/pyuzbDyxhWfL/BfIjjeevNEMjqqLpbZvZ6rcOCStzGvvYQd6ebjC6AHZ8RK3QeAZdX1yInUQMMBl0XYfFPM7mD2vdxDvFngZrokTEqSEJGUHjynDRFnHaRrw465t03SIJhksZkI9v+gSN3PECJVrgiPcmPTJNik5tbR3maZ8gTdc0JH8u0W48Jw0/8ORFCLlUijohB3FSyAyN2LuBOD/Qx+Xf+fq7oPZFWlx7MaTIj351r8/fwqqMWWeqRY5egisa0Zdds7LD+D/rZ+Hq8U4I5jHKEuaTktAoj1zP34g6/pJ3z0NIxMakf71gJC6y5qgYiqlvzJs4PdNE/zsLyxXWpyGvnWwPRcz2zqm+tcy7vQFMQrrWLkau7emRAVmeOY3dltB1b1VqIdDiby7/Bd55URtEvvSPm2oCt5TVnaxOP9Ydt/w8CLybP5GZpS8adVPXQApX6RbgztTtmkSEGIXb+fW7j9RTnhk6knT2M0+G7VxMCAYKUZO5rjH3v38NtDntxICuYHnCg8HVEKVRhFJ6UA1ZSQRsLuro3xGO0L390i41PPS9kbOwxhl7+x3iAj2ns2CaJXxc9+Kb0EY1NFVAjG73FVDQG3haJXDcBuXofyt8woq174+QgWu1McNRjLfPaQVbrHfj/aQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(3023799007)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6bje4TS6qoEjJM+5LJVJuKwSvYuGcWqBxo6pPb14mzEoXtGqIo08Id5bZMgyKdFQ5qQlnvozxHvw1OCYz3o2iw6eb86NiqVxDZ426iuqS+JDqFqqbavwPzyne+E9/TN3BnFvVPIO+q6lL1J2WreXFZFUzhiPSWfOI1QvwJd1ts12u9sIDuVaOLzcXxQD7j5Hus7poU/od1YjtfOHv+PrLoSQnFrzuMIOP3xcJajm/8uj5JMdOjMuRISAn4VKBRG/RjfU5oK7Ekl1E1gghIwYRfI8X9ys7c5c0cjlnBINc/aHnaEbWy8s6ii3r1JJo6vGZII9OWCLHAWrz48iRf1D14F+CbC3h/BTEDcvDW6aOPWmXgQGAGOxeOlqnAUWm95wV6AHDx9HgQjCVHajrGhLNrC2ps04AgAUHxDNYCePsv4eLVxxaeD6vDkxpoM2SL0n
X-Exchange-RoutingPolicyChecked:
	sPlfihG1obQWXdVEGagDM6nCV7C23J2vqSt0PR2RluyzNYhctSeMC5HaKr0SpFpvrfg5a6rNThC2ncJev+W4fKD97CskZhEjuvADVP+YFDtzGuw01WjLLcd3iKDwSjQTj9FUcAtzMVJcojxW1JNO729CSxP76ZOJWQM6++pcC3jbCVu/kYlo8hiY3hlZYq1NytoJdonKAhSO8wGDnSKimbMll7CGe1i28V0DfKH89YwC9MDFPks79N06UrWQw69XOvckUezGUlyw5Nz3QmsWNxUd4qMNbyRYda9peDI4rowK02BZnxU+nwfeBagwE1CFzKFxp9xAknhHF9dUe849Ng==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:07:14.1584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e8a84bc-3bea-4854-4e1b-08df1f0ce477
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF912A858AF
X-Proofpoint-GUID: rtAyUb4ADsR8MAjC_ab3EVC-92rhJHQm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX6aS9FFN1vFD7
 aP4SVvrdW1InfoU94SV9N/nN1aKzmazG1z9hjRY+LFyuUrNV2JOakKcGTQ804RCzmmRv5AtGV3+
 70AVpx7SQfTQKIEZ6AWbLAcYZEfh8qmpFpN/ewO/+mF81TzVJlf9f9vV1UTV9F7aqQu4n5zzx0C
 gunGs3jL6IVHvbWcY1d6AU6nSKxJ9YG2JlFSActf8FkklqjxeqknZ1wXsQ56xf22GwQkcWnirlN
 l5pKXRClJv35lUktTf6mK2kS4PRPBW8w0TgdkBHMrH4gosh4GBbb1pmawRlN4t/ahgmteqLZF1Q
 xGQgDB60ulaVgE+YphcVNbxLAhK4Bvz4fnVqq/QpdJaiYAJbRV/msptWHzeRnuKqtT6OTgRAuhM
 pzHJGEzD3Wra6UE9vpe6s1TZMZ4QolmGeqYjkI+YvbW3Wy0p11hLwV4/RhF6okxKsZ/3+MkoxQL
 vgYQ6sTpVo0tta4B5Dw==
X-Proofpoint-ORIG-GUID: rtAyUb4ADsR8MAjC_ab3EVC-92rhJHQm
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd33b5 cx=c_pps
 a=ZSURWCn5gGbtcgq6UapGWQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=JzeuRgn41EPwZvIwv6EA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX0XuA3AdCuY6r
 PHd58uUeQEP/5OafYc5sYpOhoMuYzmkQnKQ0K3Rrlw1EpWDs30hrQTaLwn2r+nwBQBjL7tfM70R
 81LvxkcpoKCy1Rlk7tJftjsO8SiitDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

From: Andrew Davis <afd@ti.com>

As we now have the tx_message during the whole xfer process we can use
that as our message buffer to be sent. This removes an extra copy.

Note: the mailbox framework keeps only a pointer to tx_message and may
submit it after ti_sci_do_xfer() returns if it was queued behind
other messages. But, this cannot happen in practice: messages expecting
a response are always submitted before their callers return, and the
only no-response message (PREPARE_SLEEP for Partial-IO) is sent from the
power-off handler with other CPUs stopped, after which nothing else uses
the TX channel.

Signed-off-by: Andrew Davis <afd@ti.com>
Co-developed-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-11-b-padhi@ti.com/

 drivers/firmware/ti_sci.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index dbe192142bf17..6ed67160c6a7f 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -43,18 +43,13 @@ static DEFINE_MUTEX(ti_sci_list_mutex);
 /**
  * struct ti_sci_xfer - Structure representing a message flow
  * @tx_message:	Transmit message
- * @tx_buf:	Pointer to the message to send
  * @rx_buf:	Pointer to store received message
  * @rx_len:	Receive message length
  * @xfer_buf:	Preallocated buffer to store receive message
- *		Since we work with request-ACK protocol, we can
- *		reuse the same buffer for the rx path as we
- *		use for the tx path.
  * @done:	completion event
  */
 struct ti_sci_xfer {
 	struct ti_msgmgr_message tx_message;
-	void *tx_buf;
 	void *rx_buf;
 	u8 rx_len;
 	u8 *xfer_buf;
@@ -372,16 +367,16 @@ static struct ti_sci_xfer *ti_sci_get_one_xfer(struct ti_sci_info *info,
 
 	xfer = &minfo->xfer_block[xfer_id];
 
-	hdr = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 	xfer->tx_message.len = tx_message_size;
 	xfer->tx_message.chan_rx = info->chan_rx;
 	xfer->tx_message.timeout_rx_ms = info->desc->max_rx_timeout_ms;
-	xfer->tx_buf = tx_message;
+	xfer->tx_message.buf = tx_message;
 	xfer->rx_buf = rx_message;
 	xfer->rx_len = (u8)rx_message_size;
 
 	reinit_completion(&xfer->done);
 
+	hdr = (struct ti_sci_msg_hdr *)tx_message;
 	hdr->seq = xfer_id;
 	hdr->type = msg_type;
 	hdr->host = info->host_id;
@@ -487,10 +482,6 @@ static inline int ti_sci_do_xfer(const struct ti_sci_handle *handle,
 	if (IS_ERR(xfer))
 		return PTR_ERR(xfer);
 
-	memcpy(xfer->xfer_buf + sizeof(struct ti_sci_msg_hdr),
-	       xfer->tx_buf + sizeof(struct ti_sci_msg_hdr),
-	       xfer->tx_message.len - sizeof(struct ti_sci_msg_hdr));
-
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
 	if (ret < 0) {
 		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, caller);
@@ -3396,7 +3387,6 @@ static int ti_sci_probe(struct platform_device *pdev)
 		if (!xfer->xfer_buf)
 			return -ENOMEM;
 
-		xfer->tx_message.buf = xfer->xfer_buf;
 		init_completion(&xfer->done);
 	}
 
-- 
2.34.1

