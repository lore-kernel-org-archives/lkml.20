Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AA6568FB2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790713131; cv=fail; b=qYGQcx+J6QvgbvMfcE/jUbTK8LiRjmDh4pRClYb4yww6tOayP1nD12JMAeccC1gWOhnOCkBfTZFUD9D09comg70uj75NLUq6WY5Fa41Syb0FWp957XdLJQtH10pDke9u9TBSpWKXGOhS45MuY3ExX6Cvvnm0S/tjRX4LzWEtLVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790713131; c=relaxed/simple;
	bh=KhAXxTiRZpb8CEAugcasoLN6Y4G4Whled8FP/nCSmKc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VJY975sOGf0TswFuiLFaqP/kylTDoaropatVryIZIcBCXnKZjVdV/03DFHLxmxQ/AFcyEZnBR9Y8Kn5xiY34obhU0StEehXa/sHVnrDLdikCHKD29x28Y4OkGvfEsBYUVOccqjITKqozoyEebTIWF3VejS9uR75k5RoQDb7kGwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OPJs7CRh; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=Q677KWc0; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OPJs7CRh";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="Q677KWc0"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TGIHTE486887;
	Tue, 29 Sep 2026 15:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v0c3I8cw6Yqv7M0JqgDp1v5JmZ0gqZw2fWt/9VFMh
	aE=; b=OPJs7CRhZF2hDOm6sZ0lhGikyn+txIvyKJpoQtfFbesN5pbl1xHi/inZ1
	vVLDMCTMHfzHOxUy6IrSc0zLLNW40Z5LkK0QfXaNF26CrS/yW33caxUXbPi6Wpis
	R6Ofe84HE+/dx3jcQ0Y/wNtiWDlTRPmdAfBYHw4Oa8pfmOMhtdNoK2BUqK/evklw
	WjvyD+sHlRpOOvh2Sv4JvHJeZbu/2+etPhLhnjkpm1x2FHsyQ4Ov+VwcvRAo0IP2
	eKowAnpSmzG85IVf2jwzq3nGPTobPxV2yorIO5v62V4rGRSHdRNFO6XlneM3pmR4
	eb7rJS8SsHZG2tTmCppxsXyJQUgYA==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011052.outbound.protection.outlook.com [52.101.57.52])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h0cpc3a02-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 29 Sep 2026 15:18:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5XcoNU96Z4nPxJw8SXGDgAJvEu4Rw+cJICJt4Yx5jSDSR/yy66CIG4ydp9cEZ1loiUidFMbzhE1e3WSePBDaHFXCGijXEURnqgbx+gWjtvITlk9wPzb4JMQqFnYNTjuqe9+ZiaRyRolCK49OgJjEzxVmImbdVayalxU9BeYwOENkjVXRVdUhLYsyy2NMpreZNfjImpv364DLE5ewkZlvHOLms5SL3O0QhFKSXKkiqCMT/bzZC4BREWGhwDea8/4szfugQjdX+DCcVkvxsKlniVW4zoui/mSHB9DLa9QiG3XN6PeKp5vCl/sNx56CTO+O1iBhONKt7NyndtuQ4Ll5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0c3I8cw6Yqv7M0JqgDp1v5JmZ0gqZw2fWt/9VFMhaE=;
 b=IGkCvVJeelezqeqk+rJw3uqxC9dL87E6FMlcl5mY2TJ0pqjGGlJjsG74FzchAAfqk5j/sGJLUVZwZrBkS3kb2i+wQhICxijiGN5sMXaw7aBxyeCZq31LBADSbBtzXm4xrMJGilGZgUQN5wwrSOBkYSlk+ZNRyLA9VXL0n5Xj88mSYJ6XcPKZiooeoecEXaJ5KBoTE+IiUK2cxlfw2/qNC/yymfcE7AmlE3Y7QZ/dgfOnQL5zPe4RWS/D4HWdK8INGZL8cIRuibpREEmEhEFVrP9zWkTpqi+wZpBckJFHvWH+c3xow0T+JngkVxoSsI6Ke25OgTB4l41PWCausyoFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0c3I8cw6Yqv7M0JqgDp1v5JmZ0gqZw2fWt/9VFMhaE=;
 b=Q677KWc0SGjB+EtcEZVP5YONPRi3oA8jij0jcrlEFRDEn6YtVtZW7WmDMLvL0N+RegvvDxA3xtyjl7qDaqK82vmpFDeXe6jRbLdWmjHh1EAyyMz0JNQRtKlWrRL0TB+LsU8Rgd03umzArC7eOTsbLdSbvHeOTJhnpm5o0oeYH1w=
Received: from BN9P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::28)
 by DS0PR10MB7150.namprd10.prod.outlook.com (2603:10b6:8:df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Tue, 29 Sep
 2026 20:18:35 +0000
Received: from BN3PEPF00022BCF.namprd03.prod.outlook.com
 (2603:10b6:408:13e:cafe::a3) by BN9P220CA0023.outlook.office365.com
 (2603:10b6:408:13e::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.22 via Frontend Transport; Tue,
 29 Sep 2026 20:18:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BCF.mail.protection.outlook.com (10.167.248.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 20:18:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:56 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 29 Sep
 2026 15:17:56 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 29 Sep 2026 15:17:56 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [10.24.50.162])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68TKHlMa1688208;
	Tue, 29 Sep 2026 15:17:54 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <nm@ti.com>, <kristo@kernel.org>, <ssantosh@kernel.org>, <afd@ti.com>,
        <vigneshr@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <b-padhi@ti.com>
Subject: [PATCH 02/22] firmware: ti_sci: Move error message handling into ti_sci_do_xfer()
Date: Wed, 30 Sep 2026 01:47:26 +0530
Message-ID: <20260929201746.4078803-3-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929201746.4078803-1-b-padhi@ti.com>
References: <20260929201746.4078803-1-b-padhi@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BCF:EE_|DS0PR10MB7150:EE_
X-MS-Office365-Filtering-Correlation-Id: 42254712-9c36-49a9-e422-08df1e66d5dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	UzzQ5kxg9lFWDTGgtPp8pJ3eovmkKozygl9B6j3mLIQWBNRXlvkaWIaM9WsR9VyS1JXCMnfWlZxeBGbGIhnH+RYKGm8OxjUBGqgeQ39DZ3kfN5DUuS0y/93nhLR2uGSXlb7aZ+wUDRHD6z4aramkQls7TVMzC0TxzrfMcJ9txLm/8UL77UX+qlg66iT6yupil8VTjqu/nw1DwDlNtGYphklE3LudxfTxEVybzqAtS9D72gcrGkjBm5x+XqLl+TkV+W5q3JEqYBvgwpE7JLwjx3eP8gWFj7boI5LPIVMpzsE31xMONC7P8THHXSi6nfChshq9KUjBkjWczZDqRra0V/heqcgfGctbzEtBW9AJrUq5W8VFNLOu0NOjY00OOw0mC2v7K43RONLQ1uSJ8e7YWpzzdkK+fs+5aFL/ZVVWgjBhKHLwAwrD0ikkH1uHmEqEu4nR4vqBo21hFGY8SpiPgq0Iul1v0UBsFjQ7QtfYH8+bNHvj4rYfMN+I8vF0040wVIeoTNxU3HIO/GWBXkj3QhKKE+/lVSRd87Dful/kmhhRfN9a6+raeSeAu0NbAx//nLmdjOAGVFhi8Tmob1BY0ExeriFUoCdb4wLNRks7B5ZaWd7qBij/Vk5tdXwbfCQYk4VEmUvnXHJ8+dz9y426wgVfnkuWynDWvRDGvlVIipovX4IBOVN8JJadm8ZKBZzTwjKSVcFkykjdfMsw/sK7fg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KLFFkKK3v2MfMGrZjqOm4qgQHacBTnOz5yzDeCM5LsQEQTWDzQoFf6ZFoJUuCFdm8g9KxZelEWKDq0CARYzFzmE/UPM1QUn3Jkfo0J32h2LbGwx+oH7bFe6L04VSxGiWQu82niLVegsvdsmKMhpWvl9ACUUHH7FppoSu/ZwUwnAFKaibD9BY8lIeuGvqZkKS3HLmkYOpVBhyzUE9prmnnFqhgQzGUK2h21OTebjL8PwdDCMvJbEtqiCxggEzaQdwCXm4svC6nQea1XxeH05r2qLkaegLNKyLQCmtAmYyt9IfcFlpUgF5Q9wTpgUTMtPA966i9tpmOJNrXFJtP/5L1LLvIVkfBGcFrQvmwdxo0RzT6qbcCtTcY9brFi2D8kKo2Rq//weiZOanTP6BRUxhWmgIXLOLE++uzXkDu6A6jqtJGq2PXnUE46nKa5UBKQP5
X-Exchange-RoutingPolicyChecked:
	fOzGqBxdMuUT5EmJDbW277wXfq7h4wlYGpqokAsm/cfigcL5jq859x3PC4ghYBbrq2yWaK54Rpge1yHsnb23tfpJKrr3VMaGRH9tttvbjUIXB0hYgdHESo2Fzh9XenFMH3Fvw2TuAJ0e0Jjx8jRhBoTz627WUxhNruISZUjDr20hlRQeBHV/NYVQpqGisrDg7t6wwX5a1lc1okIKVx3jifOG+6e55OVf8LcEaAtOUb+bU/7cjXjYArLijo43OLjF+nwb1RUeA4ZGeoGdmuH0PWmnbeAD1zToaT4KRRl0EYVDbBHEVpZP+vVk4X7wHEEeBt1yiRf9WAOteD8mOCARAg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 20:18:33.2271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42254712-9c36-49a9-e422-08df1e66d5dd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BCF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7150
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX3dPKNtSSuHUG
 C9ta8Vzf4aBOkLgtAcTIa4mZDx5xfuqoqeptpriTRJ5FH7WMD0P13kkQo1FIQi+ajPR4/3a4PcX
 QTQqaSaiGbH/UPvZHw8e/D1TR2E6zZk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4MCBTYWx0ZWRfX3MzvvmmZ3cQT
 qwfaguOAat8k61jzLCKm+hN4E3JmxLld0jc6/gUkDuY+00Jtj6Fv29wc6elWdJK4vUS2lu/Bt7G
 OqEag6wh/jjGUcu1e5CbHgAbHy552icvHk/qfFLQ3eDAcC9hWrt3Qtb1n2P6eILfsUgtlzpW0c4
 NXYgLPObhYcsQ7pErxImwQREWJQME3SwF21Oh5ijruC5EPbzrh8yTcxzKj6goz/xKdiPiJYodoi
 Go4wyxt/r+F7u/iEyqTe1Mb2F+4udsYhXNd+JyheVszMpWCL57fQFb/PUkdGUfpekbqNlkbftpW
 j3d/Yj+BoQcgASuTLZsL7uvNE29SACINrWtOLv6QBHHVdpicWyvlv5qYu8pj07/+GA+qQMxWTh4
 wRpkC/7H633r/MExTwLTS13CbpGd/HokmPruQRGj+NUJgHd1/KdmiOEheeScFyTswAH6C1AwdeK
 EZx6o2rL7s4c3X1pizg==
X-Authority-Analysis: v=2.4 cv=Y4xtIReN c=1 sm=1 tr=0 ts=6abc1d20 cx=c_pps
 a=TarwAQ2eZTQc/qcP07j9+g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=sozttTNsAAAA:8 a=KzVFh0hEau53bWtobz4A:9
X-Proofpoint-GUID: vRe7FnI5WM2dq5c-HMIY-xxnarw-WPin
X-Proofpoint-ORIG-GUID: vRe7FnI5WM2dq5c-HMIY-xxnarw-WPin
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290080

From: Andrew Davis <afd@ti.com>

This allows for more exact error message than just "Mbox send fail",
which might not even be the correct error in cases when the send works
but we timeout waiting for the response. This also removes redundant
message printing code from each call site.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 drivers/firmware/ti_sci.c | 187 ++++++++------------------------------
 1 file changed, 37 insertions(+), 150 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 5e7d04754913e..3b58fee07c257 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -431,8 +431,10 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
 	bool done_state = true;
 
 	ret = mbox_send_message(info->chan_tx, &xfer->tx_message);
-	if (ret < 0)
+	if (ret < 0) {
+		dev_err(dev, "Mbox send fail %d (caller: %pS)\n", ret, (void *)_RET_IP_);
 		return ret;
+	}
 
 	ret = 0;
 
@@ -477,7 +479,6 @@ static inline int ti_sci_do_xfer(struct ti_sci_info *info,
  */
 static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 {
-	struct device *dev = info->dev;
 	struct ti_sci_handle *handle = &info->handle;
 	struct ti_sci_version_info *ver = &handle->version;
 	struct ti_sci_msg_resp_version *rev_info;
@@ -494,10 +495,8 @@ static int ti_sci_cmd_get_revision(struct ti_sci_info *info)
 	rev_info = (struct ti_sci_msg_resp_version *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	ver->abi_major = rev_info->abi_major;
 	ver->abi_minor = rev_info->abi_minor;
@@ -539,7 +538,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_device_state *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -548,7 +546,6 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -561,10 +558,8 @@ static int ti_sci_set_device_state(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -595,7 +590,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_device_state *req;
 	struct ti_sci_msg_resp_get_device_state *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -607,7 +601,6 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_DEVICE_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -619,10 +612,8 @@ static int ti_sci_get_device_state(const struct ti_sci_handle *handle,
 	req->id = id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_device_state *)xfer->xfer_buf;
 	if (!ti_sci_is_response_ack(resp)) {
@@ -898,7 +889,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_device_resets *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -907,7 +897,6 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_DEVICE_RESETS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -920,10 +909,8 @@ static int ti_sci_cmd_set_device_resets(const struct ti_sci_handle *handle,
 	req->resets = reset_state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -971,7 +958,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_state *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -980,7 +966,6 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_STATE,
 				   flags | TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -999,10 +984,8 @@ static int ti_sci_set_clock_state(const struct ti_sci_handle *handle,
 	req->request_state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1034,7 +1017,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_state *req;
 	struct ti_sci_msg_resp_get_clock_state *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1046,7 +1028,6 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_STATE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1064,10 +1045,8 @@ static int ti_sci_cmd_get_clock_state(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_state *)xfer->xfer_buf;
 
@@ -1266,7 +1245,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_parent *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1275,7 +1253,6 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1299,10 +1276,8 @@ static int ti_sci_cmd_clk_set_parent(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1332,7 +1307,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_parent *req;
 	struct ti_sci_msg_resp_get_clock_parent *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1341,7 +1315,6 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_PARENT,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1359,10 +1332,8 @@ static int ti_sci_cmd_clk_get_parent(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_parent *)xfer->xfer_buf;
 
@@ -1400,7 +1371,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_num_parents *req;
 	struct ti_sci_msg_resp_get_clock_num_parents *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1409,7 +1379,6 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_NUM_CLOCK_PARENTS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1427,10 +1396,8 @@ static int ti_sci_cmd_clk_get_num_parents(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_num_parents *)xfer->xfer_buf;
 
@@ -1477,7 +1444,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_query_clock_freq *req;
 	struct ti_sci_msg_resp_query_clock_freq *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1486,7 +1452,6 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_QUERY_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1507,10 +1472,8 @@ static int ti_sci_cmd_clk_get_match_freq(const struct ti_sci_handle *handle,
 	req->max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_query_clock_freq *)xfer->xfer_buf;
 
@@ -1551,7 +1514,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_set_clock_freq *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1560,7 +1522,6 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1581,10 +1542,8 @@ static int ti_sci_cmd_clk_set_freq(const struct ti_sci_handle *handle,
 	req->max_freq_hz = max_freq;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1614,7 +1573,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_clock_freq *req;
 	struct ti_sci_msg_resp_get_clock_freq *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1623,7 +1581,6 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_CLOCK_FREQ,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -1641,10 +1598,8 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
 	}
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_clock_freq *)xfer->xfer_buf;
 
@@ -1703,10 +1658,8 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 	req->debug_flags = debug_flags;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	if (msg_flags == TI_SCI_FLAG_REQ_ACK_ON_PROCESSED) {
 		resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
@@ -1758,10 +1711,8 @@ static int ti_sci_msg_cmd_query_fw_caps(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_query_fw_caps *)xfer->xfer_buf;
 
@@ -1815,10 +1766,8 @@ static int ti_sci_cmd_set_io_isolation(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1868,10 +1817,8 @@ static int ti_sci_msg_cmd_lpm_wake_reason(const struct ti_sci_handle *handle,
 		return PTR_ERR(xfer);
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_lpm_wake_reason *)xfer->xfer_buf;
 
@@ -1933,10 +1880,8 @@ static int ti_sci_cmd_set_device_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -1988,10 +1933,8 @@ static int ti_sci_cmd_set_latency_constraint(const struct ti_sci_handle *handle,
 	req->state = state;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2029,10 +1972,8 @@ static int ti_sci_cmd_lpm_abort(struct device *dev)
 	req = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2051,7 +1992,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	struct ti_sci_msg_req_reboot *req;
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2060,7 +2000,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SYS_RESET,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2071,10 +2010,8 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	req = (struct ti_sci_msg_req_reboot *)xfer->xfer_buf;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2111,7 +2048,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_resource_range *req;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2120,7 +2056,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_RESOURCE_RANGE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2134,10 +2069,8 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	req->subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_resource_range *)xfer->xfer_buf;
 
@@ -2230,7 +2163,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2239,7 +2171,6 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, type, TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
 				   sizeof(*req), sizeof(*resp));
@@ -2259,10 +2190,8 @@ static int ti_sci_manage_irq(const struct ti_sci_handle *handle,
 	req->secondary_host = s_host;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 
@@ -2582,10 +2511,8 @@ static int ti_sci_cmd_rm_ring_cfg(const struct ti_sci_handle *handle,
 	req->asel = params->asel;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_RA:Mbox config send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2613,7 +2540,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2622,7 +2548,6 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_PAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2636,10 +2561,8 @@ static int ti_sci_cmd_rm_psil_pair(const struct ti_sci_handle *handle,
 	req->dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_PSIL:Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2667,7 +2590,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -2676,7 +2598,6 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_RM_PSIL_UNPAIR,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2690,10 +2611,8 @@ static int ti_sci_cmd_rm_psil_unpair(const struct ti_sci_handle *handle,
 	req->dst_thread = dst_thread;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RM_PSIL:Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2760,10 +2679,8 @@ static int ti_sci_cmd_rm_udmap_tx_ch_cfg(const struct ti_sci_handle *handle,
 	req->extended_ch_type = params->extended_ch_type;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send TX_CH_CFG fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2827,10 +2744,8 @@ static int ti_sci_cmd_rm_udmap_rx_ch_cfg(const struct ti_sci_handle *handle,
 	req->rx_burst_size = params->rx_burst_size;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send RX_CH_CFG fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2859,14 +2774,12 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
-	struct device *dev;
 	int ret = 0;
 
 	if (IS_ERR_OR_NULL(handle))
 		return -EINVAL;
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TISCI_MSG_RM_UDMAP_FLOW_CFG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2899,10 +2812,8 @@ static int ti_sci_cmd_rm_udmap_rx_flow_cfg(const struct ti_sci_handle *handle,
 	req->rx_ps_location = params->rx_ps_location;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "RX_FL_CFG: Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->xfer_buf;
 	ret = ti_sci_is_response_ack(resp) ? 0 : -EINVAL;
@@ -2927,7 +2838,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -2936,7 +2846,6 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_REQUEST,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2948,10 +2857,8 @@ static int ti_sci_cmd_proc_request(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -2977,7 +2884,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -2986,7 +2892,6 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_RELEASE,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -2998,10 +2903,8 @@ static int ti_sci_cmd_proc_release(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3030,7 +2933,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3039,7 +2941,6 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PROC_HANDOVER,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3052,10 +2953,8 @@ static int ti_sci_cmd_proc_handover(const struct ti_sci_handle *handle,
 	req->host_id = host_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3087,7 +2986,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3096,7 +2994,6 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CONFIG,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3113,10 +3010,8 @@ static int ti_sci_cmd_proc_set_config(const struct ti_sci_handle *handle,
 	req->config_flags_clear = config_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3146,7 +3041,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_hdr *resp;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3155,7 +3049,6 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_SET_CTRL,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3169,10 +3062,8 @@ static int ti_sci_cmd_proc_set_control(const struct ti_sci_handle *handle,
 	req->control_flags_clear = control_flags_clear;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_hdr *)xfer->tx_message.buf;
 
@@ -3203,7 +3094,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	struct ti_sci_msg_req_get_status *req;
 	struct ti_sci_info *info;
 	struct ti_sci_xfer *xfer;
-	struct device *dev;
 	int ret = 0;
 
 	if (!handle)
@@ -3212,7 +3102,6 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 		return PTR_ERR(handle);
 
 	info = handle_to_ti_sci_info(handle);
-	dev = info->dev;
 
 	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_GET_STATUS,
 				   TI_SCI_FLAG_REQ_ACK_ON_PROCESSED,
@@ -3224,10 +3113,8 @@ static int ti_sci_cmd_proc_get_status(const struct ti_sci_handle *handle,
 	req->processor_id = proc_id;
 
 	ret = ti_sci_do_xfer(info, xfer);
-	if (ret) {
-		dev_err(dev, "Mbox send fail %d\n", ret);
+	if (ret)
 		goto fail;
-	}
 
 	resp = (struct ti_sci_msg_resp_get_status *)xfer->tx_message.buf;
 
-- 
2.34.1

