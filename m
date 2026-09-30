Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD55502568
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784514; cv=fail; b=YnA08Z6A/7mOio51E+3hW8+fG7cmvME3TNDB7KNCsM+YCjSNwKtwGFOoZ84dZJm+tpYuDH307tc7onnEsQM5qotx1HUdxi2rk8VSskbn4C4br7lpwCVg6Jvd7OdtuBHZP+2qHhIZxlCqrMhKiq8B+8XB8SiWM+Z0o1tU6AmWJtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784514; c=relaxed/simple;
	bh=EsR8s8LwPqyNcA0Kiw/eV2sxScvkxdFWjZ/krl/opW4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cVLN3JweIdtrsZ09AYk2eEIWpImkJz+vafXL8Otgj4rZe/PjXAYcBm6/IzJdIZ005TEWBkFPe7YDqhvYNm2mng7NAj+AaPio7eHg8ArkJFe/46+mtdt69vTozBYI5D8b2n7Je/4U5bYeet+0gGCRijvN+3qliHWhngftDwj6sFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=U5M4H9RD; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=E5qz/y02; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="U5M4H9RD";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="E5qz/y02"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE1XMJ3555905;
	Wed, 30 Sep 2026 11:08:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=GUUJ0c6qBDA6CTNCcxKmG4wP+0sKdEINruyK77nku
	zo=; b=U5M4H9RDjENvlFeFf62qJBjuBl0tajxY724GrZpCWmfdTanmgW1Y/Cv9G
	11LVWUck8Qr7wuagi/GQ97Hatd+40C/C0F7rsNrbG7G0NC/B5DXg3BchoVgC7nk0
	TfKx/5/J3wWtjavEqjpKpOfVdAEmuvcSdiI9ZamPg/kcN0UbNkNpGbftIbzwXxOA
	hpFOFbs4bXztEP80+QmHyyoHralIwl3vk3+/ffb7O8w3xhbwNgYA8RWDAXsC5m52
	ayYO02ibivUA7pu2mCqzk5ZNStrXGj9SfrAfFY7VoXWk3KnNKvbTN01ufW5PYCMh
	84PoK40jkVSSA+EUD7PAV0JZJtBEg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012045.outbound.protection.outlook.com [52.101.48.45])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0ydvacu0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 11:08:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AImuQcAFUptfGc/fopJaNO8JZ/e5Dz/TnubyjCauXU89bc7jsrG75XPROwrsxOBqMkjvkMR/NoYp+bsa7cP70oejC/sHVam2gUpBeKGf5VJ6HRGtMPH3aWkoZHggthqpVjvuzA3koOy7ojewKIcHOgOVT6TAfzq+ZoLUZuyc7nlcNLsrGfx8RyU+XYwxTCGbnKmOqAcuveVS3I5M6pkEVej6qXAhNm/GEGwGv9FSZZWQKNXz4VT+eOX/37XNH+IoPRulD3DKwHsJCUafDvqjGmQpgL0MYVr+yXFxZRYsT1qgow6POg9rbEbcSq9V357yEg8RSZgJ53XeX+efwXGYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUUJ0c6qBDA6CTNCcxKmG4wP+0sKdEINruyK77nkuzo=;
 b=uJm+g0gjRZjgXFT8/4G6u+PUNpA2jGKJsArcze2Cit7LOwfwPGU64MlhNbNXz36TH68ZchmPuKp2ruY5VLwuZM3ALKxlA2r0NFDPU4Y2lDUM6GrwqAwrFSnmeG7Q9FQ5+ddvs+GLSkbnBOELx/M3styZLkCoNqpqcutTe+W76/ucuWoRzEDAI4XUloFwZXwgddSleKqNHnkgJYQ3JHZQmscKaoHPSKS3nBP/qfqjiK4nT8oeKVOToA+T9dlfh9Fd9HI0WlrfKzKMX5wTdQxda4/UTuQSvdbwP1UpyrhkdVS2xGmtgTHamOafc2eUl7HIJ257/HP2/bkgrSLP8NRuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUUJ0c6qBDA6CTNCcxKmG4wP+0sKdEINruyK77nkuzo=;
 b=E5qz/y02BQr+n3+GIH1Ek/E8FqYSQ5s6Yh5W2B/Y8yQjZdDPSb6s17MEeSnZxNRYPHLRve39vs+4zfKPRAIzlo6qslI4XIA5PYHFKpsLnalPEHyoeRyER/fre2Z8mr2K28IZFxOCmyhW+H5JQYUPsu4wSsa8dFALTG/ndj97IvM=
Received: from MW4PR04CA0162.namprd04.prod.outlook.com (2603:10b6:303:85::17)
 by IA4PR10MB8280.namprd10.prod.outlook.com (2603:10b6:208:55e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 16:08:15 +0000
Received: from SJ1PEPF0000231A.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::5d) by MW4PR04CA0162.outlook.office365.com
 (2603:10b6:303:85::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 16:08:12 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF0000231A.mail.protection.outlook.com (10.167.242.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 16:08:11 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:19 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 11:07:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 11:07:19 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UG68WP3425232;
	Wed, 30 Sep 2026 11:07:16 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH v2 22/22] firmware: ti: ti_sci_proc: Move processor ops into its own file
Date: Wed, 30 Sep 2026 21:36:07 +0530
Message-ID: <20260930160607.2674980-23-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231A:EE_|IA4PR10MB8280:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f7544c-6dbb-45af-638e-08df1f0d0675
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|22082099003|18002099003|3023799007|6133799003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	RQIaDGxaFlv3gXBgY+38hkQMpYU2VD/YT+E0zTpXURFCW0z9raZ5aP1FRcD/i4UxjaCu7NCgO+yPfpq9UKMGUI84YQZC8UdWLKL3zt6YfoB5kC1GkrYiKrtG/n7ARGZv3KijzLZftSMy3mC89YLQMUo6N/na824zRytByciEAKC3vJucRdM8/ONbk9Mm0UptKHMpzF/zFb38ZYABPDbEwtFl1E/BvwdYyO20gjpN91FiGgamkooY+4EvMk1+9zkcHlAy8Swd2Yv0W+yzv8G3btSvPrITH0i0NOSJILZBOnGOV53uFV2BEjmLOl+Xz2zLipt0vcYu8SXh8slO+gX9VnieahYEmZtQWmF3KUmfLyzEEwk1OVhvPI3A+Q0GBg1CO1EFZrsO4m3O5nvnT/1EnvUh4wD9vA85nE9bPMso0RzyUwoKN+q93zecSgZb7eTTKikwC5Jb2FmX6KtOVxsFm9eTMaYEDG4TQnwol5PKPTUqsapFcyAbMwK42U3HT8ZQ9L+uDc+EIlWy4V/krTKaZSl09t2AyyNeyNSpkKwstklowpRCGQfVuMxlTrTMlP/O5RQFJD2i+7/ckgLab4wXDT+aDzj3eJlK4v4oHf8LsEGtXguRhMchs1qkl5ArOaIwcUPVxszJBJ9y5HMStBpxRQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(22082099003)(18002099003)(3023799007)(6133799003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Nl2M6Bsa22+Eofe/Rs050FI3uKY53lI5r4rrnrvBihV7BZQ7QLxa9PC45SeYbBQcAy3MOsLx0YNzav1V3RNFP3aMPYPECGgygqofdD+ZO0ySH6j8loobFs8ALn1pIg77c8nfExouGN8tYVislIVoI704du2FgdKVv51BDnLVYVd9JAUQqwxc68uJA9YIHWtAIEJTvS+sLOpuMH+4rlD+NQN20spwumXfBHgjAoVmX2r00d6MUBYpWzbiilcZKqbMpXyeRJx0K/ugppwRy7MJt3p6ylCyi5MU1zsst7yyHQaiUWRDwNIndCatvnpF2i6pwhPiCzaEBywHTNDvImCDsbN9kVk3yPm7AbI+donVf5GiqtBNj3c7/3uu+NJD7ogb0XtrBYgJ5wbo0jSxTz1FZV1BWXUSb2JbXRNW5aiFMAscd2bnC+pOUcJ6S41KhU/d
X-Exchange-RoutingPolicyChecked:
	oZrW1V3X66ZdXJAOnmclJV2TcUuz2eT4qVu/rf1lDIjGPHMEkRIWNO+09ccDdzGsAHU6hEhF0i75KKGapzvqMzyGMuaX7UunXF/AVW0CI84Abe/0tmRCesZJs2T/S1G43G5Qn5szYsiKtQpqEwzC/HXu393pchKby5HnLbFa1Ts9Wh44fA8IpKF2PnnYEAhwsFHPJVGVVXUmBAT6pn9mCY0+7vC5wBnCWjXacwC95uPK5wugq+mqKqG9awtRpBuxBI43O48LKQR0ESoV406UZeO7023+3UT+i2+thvsN9lKYOOCcO22gL8tIJh2MYJ/1FoOfWaibljg+SSZKNHAZGA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 16:08:11.2024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f7544c-6dbb-45af-638e-08df1f0d0675
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8280
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX8FU2VPJoelv+
 1G4bWtUUxmN22+0cVMcjuTxj/9erIDPzCUpZll0DrrjPuhDNgtZAH60yz9cExGjFStD8oWaHbWD
 00l1i2i2UPGFJn6avpnUfM6D60kJ390=
X-Proofpoint-GUID: TUVmF7-SOnGS8ypaZNc26A8nfCemPjIB
X-Authority-Analysis: v=2.4 cv=TegDJhQh c=1 sm=1 tr=0 ts=6abd33f3 cx=c_pps
 a=klJJBKWT8dzIbr5yswcz1A==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=DwFzR0z2sfOMQUobDtkA:9
X-Proofpoint-ORIG-GUID: TUVmF7-SOnGS8ypaZNc26A8nfCemPjIB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfXyd+h9KIkn6+h
 n5yQAJilqv5vXMqPRPf9XAkHrBeMnjAzQbG+AXir6qtBWzMm2Lz6GFrmGbbjY8lLpCzgMKrGLMQ
 HYbHr1EMaKfUKOQXXV7BMuTt76yPbcs+1jILQUVmz8mk60LUTvgpKCGEnMu18Zx2SpuG+QGRpX/
 mLphZSDH+Nv2AqkaUrxKhZMjzH6SzQCcasx5uhoTL5OKwWapkqnnybr8BVlkW8rbD6Y2XMbp7yF
 BFAso24FGcQYY32ZNm6MU+kbXxNWZ7yZ5BMrSrFPsaqcV5F+6UXBb3PiWoKo1mcKlrufiVUQ8BR
 qKetldy9s1uLzsIWLQrVVUisA4n4NrjlxwiGYwLBHtn9q5bE/AIcpMKi+QWhsK1ikIpXgs17ihs
 +Lk1GcEP0YAJhVFKgdplfBC/rhagNUYZ2KFyoXVcQuKtggKZ9hKF7mxDhsIPbYOh7OATGWDtMBQ
 0h+BIfDnJPof1eR1dZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

Extract the processor operations related functions and services from
ti_sci_core.c into its own file. This breaks down the single large
file into smaller logical files for better readability and maintenance.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
1. None to this patch.

Link to v1:
https://lore.kernel.org/all/20260929201746.4078803-23-b-padhi@ti.com/

 drivers/firmware/ti/Makefile      |   1 +
 drivers/firmware/ti/ti_sci.h      |   1 +
 drivers/firmware/ti/ti_sci_core.c | 197 +--------------------------
 drivers/firmware/ti/ti_sci_proc.c | 214 ++++++++++++++++++++++++++++++
 4 files changed, 217 insertions(+), 196 deletions(-)
 create mode 100644 drivers/firmware/ti/ti_sci_proc.c

diff --git a/drivers/firmware/ti/Makefile b/drivers/firmware/ti/Makefile
index 7d9c2a73bf5a6..8a32cb65b6fa5 100644
--- a/drivers/firmware/ti/Makefile
+++ b/drivers/firmware/ti/Makefile
@@ -4,5 +4,6 @@ ti_sci-y			:= ti_sci_core.o
 ti_sci-y			+= ti_sci_clock.o
 ti_sci-y			+= ti_sci_device.o
 ti_sci-y			+= ti_sci_pm.o
+ti_sci-y			+= ti_sci_proc.o
 ti_sci-y			+= ti_sci_rm.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
diff --git a/drivers/firmware/ti/ti_sci.h b/drivers/firmware/ti/ti_sci.h
index e8d6589eec0e9..8f9f0b1aa767d 100644
--- a/drivers/firmware/ti/ti_sci.h
+++ b/drivers/firmware/ti/ti_sci.h
@@ -1687,5 +1687,6 @@ int ti_sci_manage_irq(const struct ti_sci_handle *handle, u32 valid_params,
 		      u16 src_id, u16 src_index, u16 dst_id, u16 dst_host_irq,
 		      u16 ia_id, u16 vint, u16 global_event, u8 vint_status_bit,
 		      u8 s_host, u16 type);
+void ti_sci_setup_proc_ops(struct ti_sci_proc_ops *pops);
 
 #endif /* __TI_SCI_H */
diff --git a/drivers/firmware/ti/ti_sci_core.c b/drivers/firmware/ti/ti_sci_core.c
index b1345e06341db..1f7484b118375 100644
--- a/drivers/firmware/ti/ti_sci_core.c
+++ b/drivers/firmware/ti/ti_sci_core.c
@@ -620,195 +620,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return 0;
 }
 
-/**
- * ti_sci_cmd_proc_request() - Command to request a physical processor control
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
-				   u8 proc_id)
-{
-	struct ti_sci_msg_req_proc_request req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_release() - Command to release a physical processor control
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
-				   u8 proc_id)
-{
-	struct ti_sci_msg_req_proc_release req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_handover() - Command to handover a physical processor
- *				control to a host in the processor's access
- *				control list.
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- * @host_id:	Host ID to get the control of the processor
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
-				    u8 proc_id, u8 host_id)
-{
-	struct ti_sci_msg_req_proc_handover req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.host_id = host_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_set_config() - Command to set the processor boot
- *				    configuration flags
- * @handle:		Pointer to TI SCI handle
- * @proc_id:		Processor ID this request is for
- * @bootvector:		Processor Boot vector (start address)
- * @config_flags_set:	Configuration flags to be set
- * @config_flags_clear:	Configuration flags to be cleared.
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
-				      u8 proc_id, u64 bootvector,
-				      u32 config_flags_set,
-				      u32 config_flags_clear)
-{
-	struct ti_sci_msg_req_set_config req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
-	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
-				TI_SCI_ADDR_HIGH_SHIFT;
-	req.config_flags_set = config_flags_set;
-	req.config_flags_clear = config_flags_clear;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_set_control() - Command to set the processor boot
- *				     control flags
- * @handle:			Pointer to TI SCI handle
- * @proc_id:			Processor ID this request is for
- * @control_flags_set:		Control flags to be set
- * @control_flags_clear:	Control flags to be cleared
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
-				       u8 proc_id, u32 control_flags_set,
-				       u32 control_flags_clear)
-{
-	struct ti_sci_msg_req_set_ctrl req;
-	struct ti_sci_msg_hdr resp;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-	req.control_flags_set = control_flags_set;
-	req.control_flags_clear = control_flags_clear;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-/**
- * ti_sci_cmd_proc_get_status() - Command to get the processor boot status
- * @handle:	Pointer to TI SCI handle
- * @proc_id:	Processor ID this request is for
- * @bv:		Processor Boot vector (start address)
- * @cfg_flags:	Processor specific configuration flags
- * @ctrl_flags:	Processor specific control flags
- * @sts_flags:	Processor specific status flags
- *
- * Return: 0 if all went well, else returns appropriate error value.
- */
-static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
-				      u8 proc_id, u64 *bv, u32 *cfg_flags,
-				      u32 *ctrl_flags, u32 *sts_flags)
-{
-	struct ti_sci_msg_resp_get_status resp;
-	struct ti_sci_msg_req_get_status req;
-	int ret = 0;
-
-	req.processor_id = proc_id;
-
-	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
-			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
-			     &req, sizeof(req),
-			     &resp, sizeof(resp));
-	if (ret)
-		return ret;
-
-	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
-	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
-	       TI_SCI_ADDR_HIGH_MASK);
-	*cfg_flags = resp.config_flags;
-	*ctrl_flags = resp.control_flags;
-	*sts_flags = resp.status_flags;
-
-	return 0;
-}
-
 /*
  * ti_sci_setup_ops() - Setup the operations structures
  * @info:	pointer to TISCI pointer
@@ -839,13 +650,7 @@ static void ti_sci_setup_ops(struct ti_sci_info *info)
 	ti_sci_setup_rm_ringacc_ops(rops);
 	ti_sci_setup_rm_psil_ops(psilops);
 	ti_sci_setup_rm_udmap_ops(udmap_ops);
-
-	pops->request = ti_sci_cmd_proc_request;
-	pops->release = ti_sci_cmd_proc_release;
-	pops->handover = ti_sci_cmd_proc_handover;
-	pops->set_config = ti_sci_cmd_proc_set_config;
-	pops->set_control = ti_sci_cmd_proc_set_control;
-	pops->get_status = ti_sci_cmd_proc_get_status;
+	ti_sci_setup_proc_ops(pops);
 }
 
 /**
diff --git a/drivers/firmware/ti/ti_sci_proc.c b/drivers/firmware/ti/ti_sci_proc.c
new file mode 100644
index 0000000000000..6c0430f7b444a
--- /dev/null
+++ b/drivers/firmware/ti/ti_sci_proc.c
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Texas Instruments System Control Interface Protocol Driver
+ *
+ * Copyright (C) 2015-2026 Texas Instruments Incorporated - https://www.ti.com/
+ *	Nishanth Menon
+ */
+
+#include <linux/soc/ti/ti_sci_protocol.h>
+
+#include "ti_sci.h"
+
+/**
+ * ti_sci_cmd_proc_request() - Command to request a physical processor control
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
+				   u8 proc_id)
+{
+	struct ti_sci_msg_req_proc_request req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_REQUEST,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_release() - Command to release a physical processor control
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
+				   u8 proc_id)
+{
+	struct ti_sci_msg_req_proc_release req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_RELEASE,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_handover() - Command to handover a physical processor
+ *				control to a host in the processor's access
+ *				control list.
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ * @host_id:	Host ID to get the control of the processor
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
+				    u8 proc_id, u8 host_id)
+{
+	struct ti_sci_msg_req_proc_handover req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.host_id = host_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_PROC_HANDOVER,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_set_config() - Command to set the processor boot
+ *				    configuration flags
+ * @handle:		Pointer to TI SCI handle
+ * @proc_id:		Processor ID this request is for
+ * @bootvector:		Processor Boot vector (start address)
+ * @config_flags_set:	Configuration flags to be set
+ * @config_flags_clear:	Configuration flags to be cleared.
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
+				      u8 proc_id, u64 bootvector,
+				      u32 config_flags_set,
+				      u32 config_flags_clear)
+{
+	struct ti_sci_msg_req_set_config req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.bootvector_low = bootvector & TI_SCI_ADDR_LOW_MASK;
+	req.bootvector_high = (bootvector & TI_SCI_ADDR_HIGH_MASK) >>
+				TI_SCI_ADDR_HIGH_SHIFT;
+	req.config_flags_set = config_flags_set;
+	req.config_flags_clear = config_flags_clear;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CONFIG,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_set_control() - Command to set the processor boot
+ *				     control flags
+ * @handle:			Pointer to TI SCI handle
+ * @proc_id:			Processor ID this request is for
+ * @control_flags_set:		Control flags to be set
+ * @control_flags_clear:	Control flags to be cleared
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
+				       u8 proc_id, u32 control_flags_set,
+				       u32 control_flags_clear)
+{
+	struct ti_sci_msg_req_set_ctrl req;
+	struct ti_sci_msg_hdr resp;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+	req.control_flags_set = control_flags_set;
+	req.control_flags_clear = control_flags_clear;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_SET_CTRL,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * ti_sci_cmd_proc_get_status() - Command to get the processor boot status
+ * @handle:	Pointer to TI SCI handle
+ * @proc_id:	Processor ID this request is for
+ * @bv:		Processor Boot vector (start address)
+ * @cfg_flags:	Processor specific configuration flags
+ * @ctrl_flags:	Processor specific control flags
+ * @sts_flags:	Processor specific status flags
+ *
+ * Return: 0 if all went well, else returns appropriate error value.
+ */
+static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
+				      u8 proc_id, u64 *bv, u32 *cfg_flags,
+				      u32 *ctrl_flags, u32 *sts_flags)
+{
+	struct ti_sci_msg_resp_get_status resp;
+	struct ti_sci_msg_req_get_status req;
+	int ret = 0;
+
+	req.processor_id = proc_id;
+
+	ret = ti_sci_do_xfer(handle, TI_SCI_MSG_GET_STATUS,
+			     TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
+			     &req, sizeof(req),
+			     &resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*bv = (resp.bootvector_low & TI_SCI_ADDR_LOW_MASK) |
+	      (((u64)resp.bootvector_high << TI_SCI_ADDR_HIGH_SHIFT) &
+	       TI_SCI_ADDR_HIGH_MASK);
+	*cfg_flags = resp.config_flags;
+	*ctrl_flags = resp.control_flags;
+	*sts_flags = resp.status_flags;
+
+	return 0;
+}
+
+/*
+ * ti_sci_setup_proc_ops() - Setup the processor operations structures
+ * @pops:	pointer to TISCI processor ops structure
+ */
+void ti_sci_setup_proc_ops(struct ti_sci_proc_ops *pops)
+{
+	pops->request = ti_sci_cmd_proc_request;
+	pops->release = ti_sci_cmd_proc_release;
+	pops->handover = ti_sci_cmd_proc_handover;
+	pops->set_config = ti_sci_cmd_proc_set_config;
+	pops->set_control = ti_sci_cmd_proc_set_control;
+	pops->get_status = ti_sci_cmd_proc_get_status;
+}
-- 
2.34.1

