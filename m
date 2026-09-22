Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771885540AD;
	Tue, 22 Sep 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087022; cv=fail; b=fGH3Od0Y90c/PWTvjMFVMMLcfgtaHsbrO7HHBbL1KO8hAFk4eaFa2PVU9o2NhyUaUs9ux7JW+mIVrjvrmzv1t7VrXVoZ3DRIU2z3xvfcQQxiq+JukNNR9h9NSemdEziAh4FK/u08JXMY4kESQfPAdkeTBoSVDdLQK6pegMNfkd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087022; c=relaxed/simple;
	bh=niPr0wfS/dq554od30IBnmQz5UDTZ79WlvoJ2KNGHfQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rRYiUPQPyunRKPuUhfr+UVxg9gin3iYNMmZtX3l7ym8qgdu7PWCMvSHwCOEIdOtXHMsLfgDXOzwWWnqjKydH3qHhTsATqPouNX9BDqUP7nHqSpZ8Kdg1vDGZddNCKSLwkB4c3qqGOzmj3BkB8WyzFD//Y39P14SOVRUcw/qjhLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=FBK5WEL9; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VKLpaZjN; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="FBK5WEL9";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VKLpaZjN"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MBPj3Q2560678;
	Tue, 22 Sep 2026 09:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=N7tHLSKM0wOMsgGm7wiKbcc7NuDf3MY3SXi6QZgv0
	yo=; b=FBK5WEL98Pi45IWDBuNDQ0kluN5+lMbuXW/bgmwkU7S5IMkgT9nB3clqL
	ALb8UQwcEwEL8dDbZ+oShgX29S9FaKyikkCxc8O3nh7ghS16G3WhBsSBtesb4CHF
	lmx3o1348+bYfoqVpUuAiRoXwb5cWEJXTx73cE+oft7HJU0DoDZcxBwUAYKHhy4r
	3ECnD6eodElqKKnfwTwqUjuHRq1gQS8xPuR4FroF6VHwrEqCH9cLBtJSPinhSIdV
	VfwAqqd5XzLng81qQT0aFfmlVxvSxpyxf2QoWFjLPwDJQGQQpSTThSZa/uH2xCYG
	MBtOqgbnU6oSUiDeu+7LLuDYKHduQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010008.outbound.protection.outlook.com [52.101.85.8])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gugcsuqkb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:23:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CAvY++Du99UGpgCVMRPm4s2GD6WX0BQpdv7B+cXHCBiRbWpSgHpOgIVCOlu3JeHPYEAapzDIiZyz5jAekijFc4IqXkr3RmdziXyLUnogGARfd4EDT2gOV9Wgz9Pf/GpR/cpVuDWhE7PGjH4nLV8va4T1q+pjUoemk1AwH/6jB6rlO8nK4VdsuL+k/AG8GyK97MIrw555ez204w1pGlrcnWdsmXkoS6tu/V3/JRSMNd/AKs6WinLZJBL06ZAGErChsXwLpkagmCDxCtJPfaRU2503kjDkmr1KU3M9QRYGRYCJSQEMWLwrMmpcmJEptVmyrYl2VZl45mAIPXFXGsYbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N7tHLSKM0wOMsgGm7wiKbcc7NuDf3MY3SXi6QZgv0yo=;
 b=lFpe4Bym0vkQ5RYILDpINvzHgTx+Fcz4X7Qy/2ZNs4Mb0nabiJ7whbEriTnO7gJqop2dEdIpjgI069Q0KinYKkm5SvekSz/fZ+GTDoraPMRSzM6hXT9hzLT6pZC7OLF+30A0BQJ4sZ7+qG5tdzRyx1WG1YvZKAFxiVAi0hYmVB3TjsoERnOo9s8sr9kbLC7A6CmqAIeU+ZvbaP2oAqZYQtk2d/k27jesu7khL0jFBr1xXFAelcLeel678DFv5AaJiJnrrDooFtr9M2cMuhI+5isIl/xG2Vafifq+6BWkmrQfBOOB3wufHVpmzZN5VLxdnpWZLaKTSkfoPpp2qhmzVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7tHLSKM0wOMsgGm7wiKbcc7NuDf3MY3SXi6QZgv0yo=;
 b=VKLpaZjN+Y8V3j030cFKZd51I/LDkwHufkjp4jBMr1+jnMxxvaXflZf64wi9A2ubTCIwjXcGMUfTtL6SxO/E95xlYcFD1o3E8UTgynE38y4xleDQQ/dIleIjPEtEiaXdR89YC+dDXyxsVeD3RXSEoqCfsETTeRjeiN0G0ejbfbE=
Received: from BL1PR13CA0092.namprd13.prod.outlook.com (2603:10b6:208:2b9::7)
 by SA3PR10MB6969.namprd10.prod.outlook.com (2603:10b6:806:316::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 14:23:30 +0000
Received: from BN2PEPF000044AB.namprd04.prod.outlook.com
 (2603:10b6:208:2b9:cafe::6b) by BL1PR13CA0092.outlook.office365.com
 (2603:10b6:208:2b9::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.12 via Frontend Transport; Tue,
 22 Sep 2026 14:23:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000044AB.mail.protection.outlook.com (10.167.243.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:23:29 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:22:42 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:22:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:22:42 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MEMgKG123970;
	Tue, 22 Sep 2026 09:22:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/1] AM65x MMC power-off delay fix
Date: Tue, 22 Sep 2026 09:22:40 -0500
Message-ID: <179008679491.4041799.7389221802130607992.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260909173833.764103-1-jm@ti.com>
References: <20260909173833.764103-1-jm@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AB:EE_|SA3PR10MB6969:EE_
X-MS-Office365-Filtering-Correlation-Id: c5d67645-721c-4da5-a805-08df18b512e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|3023799007|6133799003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	ufX9ntl0WrLh5cViPC+PT8+zsVX0lpAMd1qaThN9MYxfclVncBou8jyWBIoqnIe6GAWJo0cWO7Yu3o51IHlHVDtWGH+O4MTFiPm/A3VxtmcNhaWORkp+IZpQeLCqn1G0+PlLFU3zzj5poghKdDw/08z6qOEQ2qWfoFaTIwrMH0oyxJqqWTeXK6oJTlgE9xRgTvqXT2GDW3Uf1YTg8z+IaibwIkj1nTtP5ywDEWY3+fOAKu6kpgBONrpA7lm7N5NEPIDes+/q2C7l0XqMpzXdPulv6dO1gzbPMDNqPuzQgaZQoXCMcI9TEwok0FfCPr94KNfiy2LgDZW/ESQjETEnc4MyECnMO+7vk+oLOl771JxRqS2yp37lrgn7YIm1w39avj6PHxTSOw0CcFzQ4MRi1TL0HKBZsF9QUSXOLF64/Smf+3OoN9EGg58ef/lT80wJRzNYKbXEwlGomiOmzm7HhJwOILGknY+KK3eCSFnvUJj200Slog+zTicNzUs/7mEhvkTmlOSepG03NUAh/TWLfr3dIDk4fjSRd6RZ9Hqjs8iZguHG4hiNYMq4L5WzOKR1/B4PVnlWV3aNOiPCFNbkuXX6tFMbz41wjHyfTFYe7XcTnb4cAUaMkyki9fOX0GRJQF7zTJO/c6JnfFXLOT9A9z+fzRsOmIbEqLSWqKhqc9+kIX4U3PA0M1svB0H/5e0xyaqR8VSPsrQZfLcLUN8KjA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(3023799007)(6133799003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	p9fr3aKS570zbMSvv2EibG7ezeVas8/Dfz6wGsvkIn+qTij1/U0GqS/4tcSgcElbI9GP7mL5fLu6OeCqBa5XB5z1WTWk3GCTw+AtTNOmKS3qyPQQeNeoH+7eTvanTv4DW4e2QiPyMGb+gNHU7OcprRgy8qHyU9chnmqLmusmVycd47SxfjfQ2QskXsYcxAptVyUEyr4LDTr1jLLDo8JHsw/jlRBoB6mp0Te+nrDSiSkbuL82ADZ/BkwKSNhJzrw92ABc035/SWaveweBswgE3s9fx7DgZEoTierSx3ft5IPsNSIrDOc9K54GGenPoJJDBDsvGLGp2CoBEIRpgOZ3iGrUR/L+vdxHCp5Y0l4lqsGBpRFgB7vpu3W2vwuaLVz8q9yiNpkxdwV4xQ8hFkIHfUWiMxKC5GIou5BnjKXg6hWp87V4iPSF+P4jin8eYxhS
X-Exchange-RoutingPolicyChecked:
	YJQEl00MQzfHHZKrgAp1nUDr2iK9j5IKGw/7HwYPWp2LUxSDq/tdBja9DPLDzE2bIYajqgHijAIeJQr/0pTO3Cpj63MImRQ2MkKzDNYn2kTqtrpBWKXV5wLPr9c+lpoHUfbt5OGO6+nT7VXsQNveyg1I8IqWgnLsIJAiJebvZsIucJgsxMEW14A5kfhtwq6OhfgxO4zwugIjGXgp1yb53SIsc5yJaIXFGbcdQgr3/wI5v0u9d/KNdtat6zvwUepAvcBPOrjC0f7YofNGmKRLZmUFJ3NWadhN6V3BtSw4S83fRA3D7rAzT8Vqzc4j4oLfgsCEuZAb5FwQAN98j6gc2w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:23:29.3707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5d67645-721c-4da5-a805-08df18b512e2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044AB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR10MB6969
X-Proofpoint-GUID: h_-M9L3ZQTP2K5UH4fzwpbkbMR6AjX69
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab28f65 cx=c_pps
 a=WNBGq+kRZA72juK154DUDw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=Ms95HSm5-DtX0BCDy7MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIwOSBTYWx0ZWRfX+cXSkV8mAHH/
 +uyhF6sXpbl9EOm+NRT4iPe64paIZWCcBFgcxNJ9Yfi9/njjR7msGqEjm1xdQJp9E21/BTV6nMJ
 fekRXCY5tBtgLrAUqu4Dr0jdpkW/xQg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIwOSBTYWx0ZWRfX2sHhhvsXgmPD
 C3R7l1vdexbZR1Zf76Z5vYIWHR0ZiR2F5L0SxnWRrlLmChqLOSC4PG1i/aRz3qGx5MBPxaE+ZtX
 9GCzNIk3LNnP+FtxyOPfqPIYyeA23ZCRnlo+KC10ffJVfmA/lcLkl2QFmr0DV3bX+wu4bGWASmw
 sWJtbfc0U/fCqUvMkNDlSv4szz9UnHtJYwLcN+DnXqVXF85gWZw4clbOPOsWuLWreTbVS1kNWS0
 DWDkJoi3gopyDI+iHSUyd5S27BbESrtLTXoRiJuTbsxXniIOMNnHLVXiQT/xXASf15yiQkaJSvu
 h4nZ0mZYoxCbQEulS9XBVYKtjUivu8lPLTcKyLylNbz4s6kSQXXqgK1rruk7Cyk+oZhP5sf3QvD
 ob6/3Xh3EMNAKgUvGCasOpjDZUumg+bEnEu9rfHAoEZdFHZBe8T410kHk6hwfMwHHd5Vo9WIhQu
 FR+KSBGr0FD2y7LKBbg==
X-Proofpoint-ORIG-GUID: h_-M9L3ZQTP2K5UH4fzwpbkbMR6AjX69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220209

Hi Judith Mendez,

On Wed, 09 Sep 2026 12:38:32 -0500, Judith Mendez wrote:
> This series adds power-off-delay-us in AM65x EVM DT to ensure proper MMC
> card power cycling during boot.
> 
> AM65x EVM VDD rail discharges slowly (~632.97ms) through RC circuit.
> Without sufficient power-off delay, SD card boot fails in bootloader stage.
> 
> AM65x SD boot failure was initially exposed by U-Boot MMC driver patch [0],
> which was correct but revealed EVM hardware limitation. There is no SD card
> boot failure in Linux yet, but proper power cycling is required regardless.
> Additionally, equivalent Linux kernel discussions for similar fix [0] are
> ongoing. Linux MMC driver now supports delay after MMC power-off [1] and
> this patch adds power-off-delay-us=650ms to AM65x EVM DT.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].

For future reference, we dont need a coverletter for a single patch..
the information can be plugged in the diffstat section.

Additionally, I see that power-off-delay-us is in next - if the patch
with commit 555bb7b7c1497accc0894423220f772f006a9584 is dropped,
please let me know so that this patch can be dropped from my tree
since that is required for dtbs_check to be clean. Picking this patch
as a valid required fix and helps users.

Thank you!

[1/1] arm64: dts: ti: k3-am654-base-board: Add power-off delay for proper MMC power cycle
      commit: 7dd4fb52749d9726302463dfa2ccf71db6bbed4c

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

