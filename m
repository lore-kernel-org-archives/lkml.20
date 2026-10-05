Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E43B4825AB;
	Mon,  5 Oct 2026 12:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791204646; cv=fail; b=pZyaQBx8siwphgwoajsUPfuecoxm4f+RSWqLmIdek0AZB+Z3uoSRHGrYZATyTcLJygE+wyh/0y/eItpNm676dS823m+wcNKfOZyN2uOYvx6a09LFxlABXFtpka4lifiqy8Doqm9VCsYCkqu/e/CXVSYk/i7cgA0+OLxmUIC/3wI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791204646; c=relaxed/simple;
	bh=LtrtnzLLv/1o5y8k4DfD9es2SceOL3UmQUtZZ8SesjM=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u15vp86Cb4hE4H9z2T2cKsDwxR3geRUF+zN4vfJ+2Fp/n46qMpW75OeJumQiR5Je9BgAvJg0LbbMYQ9l0PHENjUfFuZBy8HvcTQlniacAxa/Hqt5w2s71X20hwFYmoDt2wjQTupZfQgg9tIuegaJXbw8d1NN4pvF/66CnX5Y7c4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lSJAeNZb; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=pQrvMU7w; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lSJAeNZb";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="pQrvMU7w"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 695CIijo4053043;
	Mon, 5 Oct 2026 07:50:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=Bf44tq8RkmBfHbxNd7EbIxBv+z7wX1GPKQGyxpaWE
	II=; b=lSJAeNZbAzWPI/TVJijfNQueq6+gjjJZaHU/hA255CHsXRKOewGgIR1FQ
	oyU0Z9PnXQG36/9CS32Zrzts3EG+Nt2wrBvj/gD9HJN/WWeDNrAlLNt7ZwsNnj4O
	dqbeDa8fxLSDVWuEr71KMP7DIZvC24oiQJKrBrzGHOIpTeE/ceenveXnAMqedBFO
	67+jM/J0N2LQUiptMQdAZRF/Yi3DEiyciq6/QFkQDcU0HohfNKXX8AWOg9/yqkyl
	jY/jtcMrvnsjTJsb76f5PlNsa6wQ3ZcuuKLbV7DkzYyaNHsj546qbB7mdHu2JKew
	9ca4G3VKZygTenS9tmpMwdGgPK39Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h3knnn0xw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:50:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gH2AKaWPW2jhR6gSSdAIJeWH4488wVAdIMt4xmBoH8l6ObB0O5SlPLxiC43db5Bd7MYt/qCUuHO1k3cqlo+ca/cI4SWMi0G7P64YwE4vuKJ0/PyzEN4F5iRZh0AScnBJ8HsvkYZNaPE4kgNbTOlL8hPbrBYrbT/ydAlxdTAPXtQnxddsR9HL2MpDfBaIgx3B9ivH3VKzpQ/vRSltMYZCQyLUu+QBpNMKQVhncl3T3WAulIfCvxktjw9L7oYVcmQWDtxbFdZJpLhC5EGgNPDwKxV115m+jEDyvbiKetpCWLclPoq2Ze/+c/lpXrTw4PxEsY5zkTJ/aOvBv5zdzmFqrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bf44tq8RkmBfHbxNd7EbIxBv+z7wX1GPKQGyxpaWEII=;
 b=ua2WyzVKfCHHcMe3zC/cV+0qlmctzUEERBIYQ3zoOMFSiQIpk0+NNpshdteGWv/MYA3dXe+d5h4fgGjFa3g0X6wFvO4bLRGrr9bqwd5BrbCkupFIvSZjO2kE6ReHqYsnkoMkUMktX/ibovu2zJYFQCFVwhoMXvxGIC3mBr2nORpRTiMFpjX7t7E9fUi0wZC3KtBIlNP2jJgyRXZhoztBi7ao7nA1oAshYKbgZKQKQrRXZAKIIv3nOFT4PmkAuof0sSZmuFgxwV9jhbf1VYUUkLDg4Ixxw4JB4SZKTIpKITAFEMy1eTolDUKf25G++MeWqw3SL0YXRgbZpou17Uz6Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=kernel.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bf44tq8RkmBfHbxNd7EbIxBv+z7wX1GPKQGyxpaWEII=;
 b=pQrvMU7wSOi58Pr9CvBSdd13ZiIU0dlRu+bQbRZJtRFLy9lMCHhgby+4wpkon49uQZtrd/QAAvEg6Q7BzjdVyL+moqDYmcYm3e0jLHEIn7Rm19FYtE+r/SvFYRTJHGKRwWoovtjQ2zjcy0Fut38XK0Y2VwfjC834bs/WIhWc5iY=
Received: from CH0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:610:e5::30)
 by SJ5PPFE1CCE93FE.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7d8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 12:50:33 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:e5:cafe::25) by CH0PR03CA0265.outlook.office365.com
 (2603:10b6:610:e5::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:50:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:50:32 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:57 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:49:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:49:56 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695Cnurv1159199;
	Mon, 5 Oct 2026 07:49:56 -0500
Date: Mon, 5 Oct 2026 07:49:56 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Tony Lindgren
	<tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
Subject: [GIT PULL 5/5] ARM: dts: ti: keystone: Updates for v7.4
Message-ID: <20261005124956.rybyowcs7spjp6pu@sandstorm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qrrcfho4ksgezlkq"
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|SJ5PPFE1CCE93FE:EE_
X-MS-Office365-Filtering-Correlation-Id: ef04cec5-d9fc-4d98-5cf9-08df22df3df5
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|23010399003|10067099003|56012099006|3023799007|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info:
	Gy9J6CVZVBusN0mMp08SVS+Um9zXxe25jt5mYRw1Yv4KhIE2+HQ/pGmp/ArJx/Jk3zAqJPrQz/yOTrc3Tl+pDZ4Pvevz1Fwbv0UnxOx9hpNnGQdBzQvlGY9Tcctt0NgNCMmhRVAde73Jwm/5UgeJVpOf4s8bJ71ShZgozVnAL7A+QWn0HaFKTfOv8HWC7wfiduavH4pWuYWpodbgdwyVZaWN4HbDi7paiVScWDUtCGiC/6AtlYjYEExBfDZGB3ROJGMlv6G26aft4mGrjcn6OTwdArpB0XtFVNPcAQGj5dQX0YdIiDJInwQb1tKoNtdRHH1d5MrLEZ3iYoZubpPVu9XOndGGgY/HvfMdTTosoev67J9mK4h+9+aYWD8vwbaYdWkMYGvrlbyLZkRD8NeFLKzX9kZvA8eak1cx6JrJHhamjMvq4kwTqzjO7MMaTq/iCEZB8/P8rxdmhavirIGklJx4u4MEM9qOhK8+GXLCpfwV2LLu01Ic967j94Rc3fPXo/voDR+9jEa3uASOr4AFno46fZMD21qf7UIJVFgU9OpwukFFNu7HPJ2UsIBPnbkETj6b+1w3pYy5w5riMmzvzkRhylyIQvdhGLcZGetRcuJaXlDwXIoxy0P0kCYbrDHOqHfv9Go/+Hwb0VybAZP3uA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(23010399003)(10067099003)(56012099006)(3023799007)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IjWFG6Edt9QNQgH3+8VLxwjSYSZ02kEwIFtrMT9E71tOk630QTmJGagPOmWLAWoffz68WdMbNhY/yf6vMKhjQm8jj2t6/o4UKTGGObiI/+emPjHQrRJ4llFsjvabkBgB68uVk83pY5dng/3Zj9WcZwKpFmahX5yslPu5MsdFnC05SvqooPhHmKEF33aCHd4NXOSgpl0HOIbVSo4+9e5S6eQvvFT30L7xzKvYM0QTMhj8RqwAnYoDn1GXbCDUvo+O9MBfIZXsAj9LFoFOP9lK8vyDikKZs6cbP5KHz3QVvciPXFondfYgracwBNfxtfYGcs/994YiuP8dyoSO01D9AIiO2uhijHJ8S37l2OgTOhNCmTpTx/F5UCcPvQ3dI38R/J7t1CBGyRK7KWafX8mGsT6alNv3GS4XYSUFeAN7kZ6L+w+gN9bFm4eU0bBAAIXL
X-Exchange-RoutingPolicyChecked:
	IihshyGlJQssY6+YqLfMFOok3tR5HnH6fzBxIzFEfoRZ976FdQ2oHa3TdJ5+wB5T3Q0eMTyPNoFC+MSUuBAs+Ra/8qTm1WSgwqf07dU/kOGLiPXPyphl5WEmz7t/8Dxp4m7hnleALTYiBgsyE+ELuogQfiTZgIXIel+3MKuFeb4QNm9fXal7RmqgQFJoxT50rUJyglz0NUmzHUnV90hGZ5ExjOWN+0pNScHxcWqiCdb9jLWIzQKSl3gD5FxjpNA3E63TjbsQ22z1A4rna3aW+o1sASQYhJbWuyLdGlXk4S9NZ9qlJzuxAyQcZ7fC03P8b5asjQ3yEuRWfCb+nOzqZQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:50:32.1514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef04cec5-d9fc-4d98-5cf9-08df22df3df5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFE1CCE93FE
X-Authority-Analysis: v=2.4 cv=I/7w19gg c=1 sm=1 tr=0 ts=6ac39d1d cx=c_pps
 a=EtrKi/+kAVY73poqiPL3VQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=VSLd3VEdXvNr1voP5pYA:9 a=CjuIK1q_8ugA:10
 a=nFV6k4lRAcizbXRfF7cA:9 a=FfaGCDsud1wA:10
X-Proofpoint-GUID: 4zBHCEJfieEfRfVPUiDULagIvcmmISpO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfXxA4PLRdR80Qs
 robp+TRoDTddh5a5TzfZrWlEH3PuCy4oyzsC3UwiLfg0ohc42/bA2iSgiMUR9TE3lVTS0uZegmT
 SOvog9ZH65sHYaX0/2VuZMrBXdi3AhWLwHDaDOi5Z3dqGpTgReQnuLMjl6cMILP+lkx8lFSmQPb
 +Bi33Wh7vcyK/c950wR9SLfy8bHktK4lUw/jSvi4PPL4Gf4sbD25A6aUUifeIG2AVw2/O6yZntw
 N2VBGnkakT1hQ7GlzJNzTxTsWTobN9E3NBXnhhT3whEsbZlKIC1AU5rtb0ecWHMWVF4hCV4Ij6Z
 QzK7C5/noErwQpv7XsBRT0e0eWcHQARITgHOK4UwvjXOEOCztt0cM4d88VX7e11AT4+B0ZCQd3y
 G5Ir+sIE8WRlNwS1qx3W328aDz0rlSETHVw4M4E4Tb8JweGPvFMFgX/ba87WIM8iq/uUnZHzV4q
 KnmgEY3rcUIYcBXsR0A==
X-Proofpoint-ORIG-GUID: 4zBHCEJfieEfRfVPUiDULagIvcmmISpO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OSBTYWx0ZWRfX6uqneYAITkn3
 EceSPR/9EMLK/aIdhYgeQm0rSObKPLM/Lj1KzFUQlYVTZiWLXVzWn7kn6u2C0bXaZHWb8VdXwWU
 6rwxjXCG5rx0DyOL1EoMJM8rFpXm35o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050049

--qrrcfho4ksgezlkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-keys=
tone-dt-for-v7.4

for you to fetch changes up to 483872c9385c9726b056428adbaaf213623ab5a3:

  ARM: dts: ti: keystone: k2g: Move usb-phy nodes out of simple-bus (2026-0=
9-22 09:03:53 -0500)

----------------------------------------------------------------
TI Keystone device tree updates for v7.4

Generic Fixups/Cleanups:
* Correct white-space style across the Keystone DTSI files
* Align devctrl child node names with dtschema naming requirements

SoC Specific Fixes:
K2G:
* Add the required #phy-cells property to the usb-nop-xceiv nodes
* Move the usb-phy nodes out of simple-bus, as they have no MMIO address
  (dtbs_check fixes)

K2L:
* Rename the deprecated ti,davinci-spi-num-cs property to the standard
  num-cs (dtbs_check fix)

----------------------------------------------------------------
Bhargav Joshi (4):
      ARM: dts: ti: keystone: k2l: Rename ti,davinci-spi-num-cs to num-cs
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      ARM: dts: ti: keystone: k2g: Add required #phy-cells to usb-nop-xceiv=
 nodes
      ARM: dts: ti: keystone: k2g: Move usb-phy nodes out of simple-bus

Krzysztof Kozlowski (1):
      ARM: dts: ti: keystone: Correct white-space style

 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi  |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi  | 28 ++++++++++----------=
----
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi | 16 +++++++-------
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi  | 16 +++++++-------
 arch/arm/boot/dts/ti/keystone/keystone.dtsi      |  4 ++--
 5 files changed, 30 insertions(+), 36 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--qrrcfho4ksgezlkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmrDnO4ACgkQ3bWEnRc2
JJ2PNA//a/qzy5dssbRVdToj96CjPrfYDaPPzfAI8enO74RPekYzoKyUz60mXKhH
pUyA51zmnT84R0RMqFXrBlAFBB9wttPMCZ8Zr62N2eBGtndNfVIEl5mLYHIRUwRk
CcKDwWAR8GBOe7/6RoHQMGOLmPNKYqprKJQVupvxLQ6TcjTN3Kcsw/iENC1eSsKZ
Gfwp+wM6WrZbOItGkKJY+MPBoJ1p4Gy0vZ4ZQMsKNHs1+YyukF1tuecKVo63oQPy
hCk+cQ8v9E/1snZIJS7vWX+lsCtJptVZQNQd4gy4psoVsUAR2DqAm0Zc7zQImjN+
AB5rmOHXapzYzpCAAgkXNklg+dIBsKg/lzjW3GYt+NcrtGfLIF8tP0l7vqFSijmR
9c6XuzL0HILC19c6G8KoVVQ5IQYsLd4A9gyDwuGnPJBR8bUVXRpd+IcYTfYckqat
3JEXaPtIzcSJrg+pqW8XL7AVx2TMnXqibQWrnG06iCMm9oHarjQWsOKNSbvTRgX8
LTp3Wi/7daRehH6WF29Iye4kpDbqEh3QaN0U4evOqKFsz306sC3cagRZ5uC8mg5l
cdEEwFeUjRe4quDRWaGdRjFgSWWY1p4GJ8LRaR8A1jKa6QBh3HU0cE2YHvg6VlJB
g2qXvV/aCOkJTxwn08vatOW0T2qklbpxE0Mw7WPkHg6xqHfwFe0=
=ziET
-----END PGP SIGNATURE-----

--qrrcfho4ksgezlkq--
