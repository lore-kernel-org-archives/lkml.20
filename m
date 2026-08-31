Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4640E36B92D;
	Mon, 31 Aug 2026 21:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211977; cv=fail; b=lHqjRhoR3lGR4cu88cBJQETkflXuGnrBhWDRn7rjbW7j8xjzOjVWfB9biXwn+iM4mjB/MC/Moj6I/R51vTOFdAhUzx/8nR++gO5GakDCOTpD5bt8tb9GT2k3iV1GowJCIhMs04t3ftf0X1AZzFRu9PCWrGt/1CLCphqHuGzE9bc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211977; c=relaxed/simple;
	bh=KywnPdFdvRrsAz6ivg3yI4tWEBDcG60RzCr1lY6oSiU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZH36LX2AzDD4ZgPjEsijFOGXmheAsA4TDo8rJ5FZ9zteRxDpO6BXG0yxbQOqhWwyHeedhPvf7ZQnrawIFdK3qnFt0whhRfSOm/cqVuYq+1E9OKgeIiikWbDWGAk6d+1UqtyhUvajnKII3F3aeP1b05Lo3gS4m/aHr6ggzHstzY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=S/tHTmwx; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=F7Yrofa0; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="S/tHTmwx";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="F7Yrofa0"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VIS7Ku1444698;
	Mon, 31 Aug 2026 16:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Xgdw1wdrfMUK5
	IjRdaYImnafwLhvlvF+TAx9/OetOzg=; b=S/tHTmwxxTk+SOAVieaI0zK3tk21w
	r9+OZQbfyUP59QSwWAJfj51tc9bMd4m0sSTmpySTlb+IeR+uT41QfMa+wSNGOAsj
	VpfTNqyES/eJWm+UCzYSIQYyF2fzZkrwKLQKQ5OOcEZVZQ7I0iK4wD1tjSA3i1U8
	wIb5WgvTLq+cDi5SSoPrHMBS5gp4fEiPKcnjTehgFu9xRV0ESOYOwZGyw28ANz8L
	secWpsUXBSBNaIOeZgqrB/Rhk0gRJsvCdL6Km4OjLKyXrK/x9P4Dxc/YXfHEFkoT
	fuo8m7JESGW7OdqD3TIRq3KRqOhLlvy8U3sY/gYtuW07yQL/JiNsWSWpA==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gcejq0yua-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 31 Aug 2026 16:32:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y13Va8jfz7nU1IjW5qPxagRuHDVXzsH0MjpRPOJOaQTIJe9p4z4E9e48McoDl7a50eBTZmpEXF4F/Nblz36SSKm0SrdE67/GmHeIThww8PZYIdosZaDMWh/Voom8FdYZW9k1YAAL1DeaVbN+iaShUFGDmq1aiw9GOzYt0Ug4mK2Mu5ocJ+uejswZlyCX9iGnPa8bF8fVJtJmrgnT43KyYwJbn9lGb5waXK/XIRDa7WZnggp0CpEDTO9hI8P0/zxTp7FpUREDlNneXcgzDvNDhyTiUYF1O2ZNPe8NezFfvvL2O4FyLiWrajDzUdmaqD7OM6ZRJtLzRqziKy7G0fLr0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xgdw1wdrfMUK5IjRdaYImnafwLhvlvF+TAx9/OetOzg=;
 b=zUiB8yjH8CVEyki1PI/MXKkEtfURyIaId/pr/zn922AFL5DQ/JVjyGRNaKHeReloVzMi5dAxVgmbZG1K+iRXLL9Q5KMRAVZ9NOmhU8I5q8uSuZm+XpScutUnzqi/JECZC5l0oQr+NQeSvBjFILXfSS95AzCI4MnZNqWMJ56VjKsURK7o6scqK9gKym3+bf0AuBkFxv081F/nj2k+SZoGlTdnrQ+CAW3ILcbdlnasRmSg+j/BlYzvmZo+EjGDG0Jkii7R36ySpmom8tpJG+mwYwiz/Jx9k3tj7u2rn1B2jscbKkM+XG99Aa/qty4fGFeXAwblcVjQ7LfDgj1MjLA56g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xgdw1wdrfMUK5IjRdaYImnafwLhvlvF+TAx9/OetOzg=;
 b=F7Yrofa0e6bMA0isgCWrCkE9GE2XGcrzEnyfzxrq6tVvTXrdjZ+uvbmdmVVHAsuvg+oqTXu80Jpwo5FYtlCInK6Xo1eHLj0DGrVNyNBjpJf7GGTnkI4PA050X7M3wco7PCXaEQn798Ysa9CFKJ7z/Nhkck/VNhB+ZzlaZGSQNtY=
Received: from CH2PR03CA0014.namprd03.prod.outlook.com (2603:10b6:610:59::24)
 by CO1PR10MB4641.namprd10.prod.outlook.com (2603:10b6:303:6d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Mon, 31 Aug
 2026 21:32:47 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com (2603:10b6:610:59::4)
 by CH2PR03CA0014.outlook.office365.com (2603:10b6:610:59::24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.13
 via Frontend Transport; Mon, 31 Aug 2026 21:32:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Mon, 31 Aug 2026 21:32:46 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:32:37 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 31 Aug
 2026 16:32:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 31 Aug 2026 16:32:37 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67VLWbYa1545515;
	Mon, 31 Aug 2026 16:32:37 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <devarsht@ti.com>, <mchehab@kernel.org>, <hverkuil@kernel.org>,
        <sebastian.fricke@collabora.com>, <benjamin.gaignard@collabora.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: Brandon Brnich <b-brnich@ti.com>
Subject: [PATCH v4 0/4] E5010 Probe Cleanup and Adding autosuspend
Date: Mon, 31 Aug 2026 16:32:27 -0500
Message-ID: <20260831213231.2125544-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CO1PR10MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c377ae-c55b-42a5-fc7f-08df07a76645
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|23010399003|376014|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	AhNhFpcuD13AWqrvQnvEBYn6d8NNGjYUhbS/7T/vlqUIHwJRgbjiilR0vQNZHhf+QRPiTNyVcExqRYszeWJcT8QU15ZKrASLTpL2dMVlMVgwYNjYpUzricrFjo6pnAIo6wnccyBsOIT5Im8Uvht8fsX4jDRM47O8TA0e2zDasxozU1SHXlxsKCFNLiAjhrENYO/RaqVfQxp3HC0m4AuUrGMwCz0VFuevd+2/K5DYudc4wC7AzL5B8im3wmwd/uZXTyIxH+xW9w0Dqvc+Yzn7/8VpgUHYQJmmE9x8PYWB0KfLx3IU8YqGaEDk7MJXdfh4Yhjp6oakdORdhsr+6mpqWMjBxFul5fllO8gwYReg79UokJPkgMkZrKOGyw7GcGG++fnJhMvbSRZcXn9xHbLDLQ/HTeer2G5KP2gRgmiZToDSS2VqNVHBMQbBK4aTFSg0M48E82PIkR3Yugk7ub9T0XZqqfRLgg4hr31rJcLGatOMvHEc3iDL2Wiz8K7wZzaNHtkWOAsW5+RszGjagUIE6ORSCtMb03mkBfIpjJ3xNUpjs1Y0r4KSeRb+UeMHrEbLQ4YVTRRd+sJgYPV2ZT7tkjD7OhEI1V+OP43cd965FFrkEs+xDT4gDSUaciy5sALHO7UIYckyFLRAs2LzkeOWhHb+AoXBoLgoTc3J78fxDAWn0TE8u9lDIF38PSat5ZOirr6LwL4eo4eEYSiaTN0a1A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(23010399003)(376014)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+PM4Ndf6RS8hWGMAHD0/Wkvz3szIJCuNTVc5tUWRE5HjNnR0L1nPlTexbE/zmUvrNjoEylQcpZdXcLCZ9ZJ9ZAKPO+sOzcNUdhHISZa+zIZ4t+MGeWOa2iyrfjYKT8PyWxZLhK5rYj1zhh7k7vaTUFL350t+mzsNEFHVY+mCt+zvXQP3IAjIeTcKf2X/1FiMPtyrRf6MRmIPT35D0FCa20NNvcUNY681uvbzbnyM5npUg45tnwNKVFsyVM3uSKmPLZ3n1PyDznpWCgWaKPF3zxxeqTpNNs1fXGaM0F4PkgYz/9sBQF5HsIUP3xf11qRIOI1WFjd1Bs+b+Vny7qqrbkDVEABrt9wQTxEAVD97eBDBBxiLwN/AwIbIAvlZe9Sxy32U6Kq/SAWb9pxz0jsHIx0W+fnGq8hiNspubwH4YMDCs+mst+GphuPBwjRtiVDk
X-Exchange-RoutingPolicyChecked:
	Ha3vKmomMfF9+OM9OErGRmAHaE5HPiB5a3cj410wbwVaam8HIPpNX+jJtCBSAZ3rf15BPIsfN2P/+XXHgdxtbuBUWIoxWKBTc+kfZDxyJ2JUt4OORIV8i+398IDtQZFvsJKYjC0AQOMuGLejusMxoaByIGtm56wWCMblTHuQ7z6DMIxKukP7ypsCZHo8ygVm2ctRaeGvOanhatKiT4UnR1O/a+cgy1bTZlY9SJL1G8Ob2DT8VHx5tn9RNstuZg5VKk2SGaeLskKpQ2+KO6xCTIXGbTUeHKWUp/HWLQPd8ahX3FU8OF7i8/iVsyonE5l/9fxIRlRA+djgNdZxHvQ//Q==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 21:32:46.5817
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c377ae-c55b-42a5-fc7f-08df07a76645
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4641
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDE4NiBTYWx0ZWRfXyzbY4a/LyKTE
 etrhxVP4aJ0vJ7L7+/aiwcvXtHBKy4CLwkua58FvYY+8uLBmyXKzdNFtk9H7mnBSE7wbq5Ba8Zf
 GNaJCDxDyWVSf+Ix2kWTXnmcu2zwapI=
X-Authority-Analysis: v=2.4 cv=b6eCJNGx c=1 sm=1 tr=0 ts=6a95f302 cx=c_pps
 a=bI4C2FY7jnHyvFZ3dxthkg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=1li7n1QKThE6xcX4AvsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDE4NiBTYWx0ZWRfX9UgRGKsnTASQ
 uAeugPpd3qi2vAKqRO7s4CtvoXiz2keP5RzGAfbjb3qJDTJ9QIYnPaw4RTCpZWmq4Zfj3OxYvJM
 mAE8LTN37JA79uVG84IiSj0Qtl1NhhVp6K/qgZpJ5jKT/5e1Z66P7IgHJrJ1r5lRrSvN0g1OQo0
 QhqcPfHc7VHM+rTfFI3yiLcW0aqAryaQmFvUCYzz9IKCaTZRmzcm17ZK4Wq/c+/JtefK3LJ6JaY
 nv4PtW91j5B6gquK80v2+sxA4MSsTkHKJY5NVQVJSHba66zz748jjBVB4MqxnnY60GswwJHA+Lo
 KwjvwNJMZDFS05cgtD8XQ7gqG69Mr2ngrOgRcMNwfXpD88cRX9O8nLBmWDOgmNu0ucNsHK2HxPt
 iisucf1JEK/QSo9GYwrJD7f//y67XnShrl13OhPrZp7WY4WRQ3HpoPifLrrwxTNWrYCzSG3Y/9S
 ev3jiFaLDD1VsG++hZA==
X-Proofpoint-ORIG-GUID: dMpyyTyF52AQkU84ASiaOMF8u6Wm8fTD
X-Proofpoint-GUID: dMpyyTyF52AQkU84ASiaOMF8u6Wm8fTD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_06,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310186

Hello all,

This series has changed a bit since v3 so thought it was appropriate to
add in a cover letter.

I noticed a report from the intel bot[0] which pointed out a valid issue
with the driver never calling e5010_init_device unless CONFIG_PM was
enabled. That has now been addressed in v4 by moving the call to probe.

While looking at probe though, I noticed that the clk_enable was never
properly called. That has now been fixed with a proper remove path as
well.

Lastly, I cleaned up the goto jumps in probe to fix an issue where the
m2m_dev wasn't being freed.

Changes since v3:

  - patches 1 and 2 are new in v4
  - patch 3 remains unchanged
  - patch 4
      > updated goto to match changes in patch 1
      > update PM calls in probe

Best,
Brandon

[0]: https://lore.kernel.org/oe-kbuild-all/202608140323.qyc8mKlp-lkp@intel.com/

Brandon Brnich (4):
  media: imagination: e5010: Properly Release m2m_dev if probe fails
  media: imagination: e5010: Fix clk never enabled without CONFIG_PM
  media: imagination: e5010: Move e5010_init_device to Runtime Resume
    Hook
  media: imagination: e5010: Enable autosuspend for runtime PM

 .../platform/imagination/e5010-jpeg-enc.c     | 76 +++++++++++--------
 1 file changed, 44 insertions(+), 32 deletions(-)

-- 
2.43.0

