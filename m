Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFFE3C09E5;
	Tue, 22 Sep 2026 14:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087319; cv=fail; b=Pe/cLm9Bd/MTrkgKKXjW/kwMw6lR2RGk3/2dkzush8JLDM5h/of9zqjHzFUbkec3CQlKqO+5DU+0Wd2UQySWioPgC5i+4TlCdhyDgW5ZlUsyw6MxPXZhkETUrTJ7O9eNx7NY6jhdIKQMJchchPiezhyrx/Zh2/nXLTSX01D9TcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087319; c=relaxed/simple;
	bh=2MRJYlwlmoRnONita3QXyuBRQMYt/S84+VVLdgb/dxk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SG3J1acCOVS71eUqwmRuzfbQw/+J6fvFwhvBkM37CzFelS9cEM7UPq7eO1QIZv0u7/nqh0/kHIVoe2ovZvTpSKeJ7XmOma8VUySRvEh+GxSm+04Su0lXGEDbmtcx27bJTacI0xiFjeH4HI54TbJGsLrQWPk1umV6Cov42iVmBGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=qzXP5ckd; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jCB07Q+g; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="qzXP5ckd";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jCB07Q+g"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68MBOtjT3446411;
	Tue, 22 Sep 2026 09:28:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=UNIzcj5vfVZRvU6JkhMlR6N6GoYntuJtwQTINmGcP
	kQ=; b=qzXP5ckdg4KP8tthkByp4OEGSfaYlqygGakxtf/okMxdUh8TESXtCB15x
	3PXQfOZxFRx/14va65eKf8aa05da63kgJLbO1fLANxA/L109FlFsfuvLoR0JwPQJ
	L8wj9TtSM7eyjh+pku2aFDMYjaKfNu2Nq8BqIOn+0p4bYiZcDhCry4Q8x22tnpiI
	gkI8bMeseI/Q81nQqTuMgFYk+6zxwsOMXchrf5xldusDMf5hxMu121dX2qDUsYWH
	fngLIsVvPRx0NKLB9tnlvAOUw7gYs6fidWL7V8ST0czIPjR4MGx16c3TrwJhPsIH
	2HEu5jlsDOiJQZXlqiszbX8PD0hGQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010014.outbound.protection.outlook.com [52.101.56.14])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gupea1t5h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 22 Sep 2026 09:28:23 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J/TPzpZWZXMR/KNrWpGCD5cWLHdwkjKzmeBxfeyn2mluea07Xp1QD6Kf9gxhgULvJ9Ql6b8LkXQfllh7wyY2xfGsYRQKapZ5QXcgNN1VnMU53U3AM90H02Uf8ytkivOOfcoGiP/eQ7wl0v8EmiMKGqSD4/kVaShQyWaxdReNPdmJES0UqHF49nNe3p4HLoXx2BZAOVs88Rj/zsya3cPwM/ecF3vJMTuUeWEFTS29xC656mM0A9yEo5Lk2Tktbq90qPCys5j3E/0Hmr9irzGcfV6IqZeQUVpQAbb37E2B3i++SYLKHDWSUxReH7TaYr8xmjsa40ULheNmBoh5ak5N6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNIzcj5vfVZRvU6JkhMlR6N6GoYntuJtwQTINmGcPkQ=;
 b=SyESKgOd8omKN2HHa7+Hf1V5x1s5ygCz5BLPc8MyfPDhLTYH+TNBcL15eXGdBj+NEfAfcU4e5osBcZ1Kyb45rs1nwrU/LPlurhl3Z/5PUPV/cxv4yZZU9cM6AAoX6OV5R6+IkhLruNp3bMBy7/MfqpztBJjc2ALEBDOaXG73BVcsPWxtbhULMD3Y+xJYzelu36zkxdhVC9NZL2OrvlnpIZD85w+FvKxt1W7fPLikbEKc2Om69pgH2DbOKJtic9iBaeQhKrEwWNE9bKl/KM51ND7oK+87ucf37ZZogERq/OSb4pzaLZpg11qN7aOlWwqb762f2eHs5pF51y156WfsHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNIzcj5vfVZRvU6JkhMlR6N6GoYntuJtwQTINmGcPkQ=;
 b=jCB07Q+g+uURKxvvAnGeso36Rf4gxFx/91j7iThVWOZKJH8PbEyKihRPA3kqBBFoDHVLBbfYDFKOv7/WxvCOv5tvN41gxjjCzZ+7KVpIapwVTw+yfqufOFlfhMo4fGNFj9q+V2JY2YwaVNXAvECEeeStDVvg+H8DPH51O19p8Ik=
Received: from CH5PR03CA0023.namprd03.prod.outlook.com (2603:10b6:610:1f1::21)
 by SA1PR10MB6565.namprd10.prod.outlook.com (2603:10b6:806:2bd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 14:28:20 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:610:1f1:cafe::60) by CH5PR03CA0023.outlook.office365.com
 (2603:10b6:610:1f1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Tue,
 22 Sep 2026 14:28:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:28:18 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:27:42 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 22 Sep
 2026 09:27:41 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 22 Sep 2026 09:27:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68MERf8o1036384;
	Tue, 22 Sep 2026 09:27:41 -0500
From: Nishanth Menon <nm@ti.com>
To: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Francesco Dolcini <francesco@dolcini.it>
CC: Nishanth Menon <nm@ti.com>,
        Francesco Dolcini
	<francesco.dolcini@toradex.com>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: ti: k3-am69-aquila: fix AQUILA_B73 gpio-line-names typo
Date: Tue, 22 Sep 2026 09:27:40 -0500
Message-ID: <179008725257.4044704.14805580657078277155.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260914183516.28865-1-francesco@dolcini.it>
References: <20260914183516.28865-1-francesco@dolcini.it>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|SA1PR10MB6565:EE_
X-MS-Office365-Filtering-Correlation-Id: d885ca41-9a5f-4a04-7d57-08df18b5beef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|10067099003|56012099006|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	YVJ69MnuYbPzqAru8uDXKuHK75B7Bxevi5mIwMFVkZaPicxMARYh/xy870xlKagfbE/xzVeZLs7LF3I3zjg0BQuj55/iN0Y+Luh6v5JZQYGJS/zYIERXZLOg71FKJCzROLoOHWAz/R3moKfHW1zfKCpb7SWSeywIH38iREsW3UYkMhx1/14iAZ6OBrY9EeaJZZWmgmGp57m+MCUTBzDAEqQUpFCxzVt+p5CVi4i2I8LwVnUSowRPUN8J/hCOV8kfVbkQeQXeYLyTpiJEwYdo6WLdv7DUJWN+8cLR/jKTF0VE1xDu8vmnXyzja1lE8/BVIechjFAGr0p1PuI3LJoaG0sPQvXCiayk6VNnohr+9hr5Qi2oOqhNX44qu0AyvV2Mfr6edpLfaV3L324FJ/FTy+F54ZXp1OvKAY5qkZUlhUWt2zCi4ReqV4qEXXhCB6YclkeqVJImDgyKIJjxldY2KPpouEwpirzA8yJzlJPNYcpTTe5sULpyVH8rBEX14UXRHhb/tdtEu6Eohhg43kZp9eBHnb3gPLBByhA7/bnjrhBRos3I1pdLzjarJYGyBf9NaRo7ZbC+gNeWvBlUH8KGjKsM/RqAxk1+VkC+GDVbkhT+ATzTauiG9osbsofspvMQZLu85snKoogiccPA7n8koU7SssmOzvBRBSNfjAkSf5M8TLMfViyVDqMd0LXdkMFG6mJor/rGsOKayXqOcpK41Q==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(10067099003)(56012099006)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	24IhfW6juiAt9nvaJoe//SlEdG4vbKbQqjeoZtyz602/a6fsr3UJ/TlqeKAeqOc5Sfo+B7eGvhzZiFDg/vic4zn7GhVNSf6FfA1QmArmB1L8rtjWykqy3vrCsBtD4X9Vg/BoYFIP27z3lpB5mseC4hJGkEedlXj+Y4ttXQVNfeRAuWQNCTcobI02Mj8mDuYrPpeRmkj+8G3tOTSZv8hhZKJkRQKVV320nvZoPN/I3vIqUSAgGTNSpiJuXRWbvQRXhTxH4Ihu9GJZRwTR5RsfDZaVLYETfYETEGxuZ5DTRCAj5KQ97gRs+nOkQez4yyPPFf+5hy4lkVxxxHk+tuZMQ6wdKj3LBGJz2pGVUaVHY3E/QtH1BF/W0mVieHI4KJy3U/Ct3ckj2sYfrIi0a35nRYmawV6O9suCt1R6n+99Z/i2QclLJtBOVqwyY/h2vibR
X-Exchange-RoutingPolicyChecked:
	sVE5XKpLjQPqzWih9G3ypZcN+HjQmkb0nOVz+HG02vA10gaUFCsPvei7WQhigcoiY0IPdCeGQtZXlHdq08nvVZEzcstyyMVjUNhQFkW/xrS29eEsvio2N6auMC784NwujQvn5ISYNmNTMuk6J5iWxEkfnLkoUubd04opP6b6j++Rxxd0F+Ua2NAmHviK/R0smxEvxWoyTyBvZgaPK56TXpTdaSVnT3gXBQy+UHba+VPHERa6c/xkWwrY5axpOWnN+fn2QCM8EiURhB4ZQ5Fh0H6fQajJsBJTAMJ52eGkGqR29FJ3zBaZ3/6R9lNPWGycUsmlSjMG5HgRDJIODlxggw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:28:18.0230
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d885ca41-9a5f-4a04-7d57-08df18b5beef
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6565
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX5Qbi2LVHgh7f
 PjeEVFpNzdvrxmKNVK4yCZDTXlS8CB2vvqH3Z0d4TFfmxhLg+EFgk3HqAcT0PuQJBsNW2yFN3va
 eJXAul8LBCA8CNEf0k7rV9hbs/gaRK456tqjXMgIwzCUPnPlpljVSg3JLwwV3oNWNssDpvXNpr/
 skUGSGGZOu4xjUYQjrsWjKOEv6vwJ38/drMPGdq+QaU6gVOuTP5QoTbaeFeqeHpMXxZ3Xx++Xtw
 dxPYlyWvL+4kOY/DHTVHIIYPK0WHYZP86vGsPqTJs4CMULzYT5Cb1ZQ0y1B4lCMdIxB9+2vpnwj
 +7eB4JN9YMrVTEE+SJY4CwmZjzGo+dQXKWH/AzDBh+1NDg+oBCgSzzjaSM4zsdaiVngJqTnb48I
 HQ1B5q3YCmL9pkDFe9KMixLf9GRryLv+x6NU6N4sgUCjz71WeyBFej4QEe/RMG0uIXlxnYLmnIj
 rwTJ369Ne8XAHZs5WzA==
X-Proofpoint-ORIG-GUID: TAmmU89-Y0p6GtzLVdlAc4ng-J_Dq5ij
X-Proofpoint-GUID: TAmmU89-Y0p6GtzLVdlAc4ng-J_Dq5ij
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxMCBTYWx0ZWRfX7PkF/qjnRHM9
 HhHYY1Z21SM0tc/Wxi3+Gpze1E+dLf8+R0mx3KBYwgDmEDhBbmspO7gRtREeZvS68PTaCIVrjfO
 rdL55Np/YZEgAGB03uOtmasUzQIU1j8=
X-Authority-Analysis: v=2.4 cv=Mdz5KJ/f c=1 sm=1 tr=0 ts=6ab29087 cx=c_pps
 a=A0MaZ9OvLBUdx9ibaoeqQQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609220210

Hi Francesco Dolcini,

On Mon, 14 Sep 2026 20:35:15 +0200, Francesco Dolcini wrote:
> wkup_gpio0's gpio-line-names has "AQUILC_B73" instead of "AQUILA_B73",
> inconsistent with every other entry in the array.

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/1] arm64: dts: ti: k3-am69-aquila: fix AQUILA_B73 gpio-line-names typo
      commit: 558c01ff1d9dc1961e0e0a91e5d4bc07eb081d56

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

