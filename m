Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A344C36F8F2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 17:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616034; cv=fail; b=CSTtwjtqIyRNm0vzRumtoSM5y9nAGG3jBgsc+V87G2AHoDOZ1UezpR1h2ro4PqpvqsL9XhtIE5TbdNUovUigUESEtuLmWtC1pSYEh5z6DZlTgKecUBfG4MDqI2cWdbtg1Pn/vBmuXl8+pL4uiFn/Q0HGU0NzZ6VLhPAITQFni9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616034; c=relaxed/simple;
	bh=P3hidHTkL1oA0EK+owNSnIjpKdqr1EJ5GrET0YNEu4Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aSbtNdPAbsmVfUScuYb8/U/pZMWnqqjJ1vReMxII4+zBoSYTm38yGtUb3VeoRCz6oXh1s6beTWa4gR5bucyYWRiGVcGaePuMyDb4LscPOCThHvZ6b7NFBf7G0Hx3DPSw6+EzeA7yjM4gao4MA7WXC2RwU5NhTWknsrNEPWMXJTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=jt9fQuoz; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=MIlHQ+vV; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="jt9fQuoz";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="MIlHQ+vV"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68SFJt092094619;
	Mon, 28 Sep 2026 12:20:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=3PP353EvVC6ceKL4DH8Dwkp1b8xYpyk0pG6XUaZEQ
	xk=; b=jt9fQuozDFquGm8fKIyHjbhDgb3z7e5yYDYd51WmiQHXN9n087NPoMumL
	lR+Z+ni/SrQ2QTkffgFkrdq1x6LWWXDVyKnPrzARxVvgm+kgoOXQQoZEI9UjC1dd
	RnUjb6Ova9ezT4TFURWCGiCgd/lHuny1hXPKGwHZputrj0bJ+w/0DNGDgDRumKAg
	8SjrXyXrRAjPgqbZCD1Dj4a40qwjrOsQTwpuuRNS6d+vQZQSmey6SNrObbp7TryQ
	p5AhDUlNM8myj04TuhrXIRnvxvEWW6yqXYanCqzs5XU97IVcXZUgG5BbG6enIlQQ
	cW8rDes7Bt3iapDzGu8z/7PMogWcw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gxy2nqd3n-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:20:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDRXJq+KBklAe3gp22oGe/NU34poa0Y2PMGiaDpE4HlKS69cxR2woVj1HjTiXf8TWKITaJjru1yH7UciV4ZL0xyhV+klKIeYywg8ptQD3z6XRlgVqN5dd0SvK4nEisww/XeVnMHKspSphZFZ2oYecPatuDRUWqKm0nf5Wvqz+U0E1OgtnyObI7MIIJn/PnZ6aoQOvy+QRMPao66OCr1RgxyF8QzMMNeGDRvyt9dTRK5UiGnHDsRNifPSvdb5QwifiX9vbU2h4FfwRJtOzO3hcCVo93LEENKcIqmsq6QA2yilpPXLsF0beZ0XTSxFg6S9khOLtPU7mYpmL8mTQSvM2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PP353EvVC6ceKL4DH8Dwkp1b8xYpyk0pG6XUaZEQxk=;
 b=Il2i86bfEjkxlzKSYME0ctCVrqz5eTQ1Ukf5K6m0zffjI9RT3+Bj63UyLdY7twiqyp0AC4cySVG4CdhDH3Xu33ECyZOBLbBmXb4RYXu+Abc+g2gUnujrySsVreY2rXyb2tdJAjG1XGIl0u5C6DII1o9ddYgL9030tXh0tunONcFO7hAtMvCYipxhCX+j0KLlFFPeuw3620GYM7kp9F3it+IVWGRBdeQr53qvSAEFUVcjLblMW1FMJl5OYmuTog6GH2z+tfmC0JMuMJRIkNKBo28xzR3CAWzXFeXm42QBIHFRjl6XnCHv/8G3dVhWwmF1NHNQM3tLS0UL4CAwuFlQtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PP353EvVC6ceKL4DH8Dwkp1b8xYpyk0pG6XUaZEQxk=;
 b=MIlHQ+vVMoPc6+05v3YBh6DMOWY/0QUK4sPed3QtYrRZqT+sXGn7+xGV67+k5rVMDYzYLcBO0WDHEVhhiykyX6wbXxH5lXqE/dlra1kqNan+Ry7Ga8vlNRtyEC8oyplIRtNrPOp8MiDID0bLeQ1l/D0rdT1Ux+1gym1EPbbv8wE=
Received: from BY3PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:217::11)
 by DM4PR10MB7426.namprd10.prod.outlook.com (2603:10b6:8:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Mon, 28 Sep
 2026 17:20:20 +0000
Received: from BY1PEPF000264B6.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::9a) by BY3PR04CA0006.outlook.office365.com
 (2603:10b6:a03:217::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 17:20:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BY1PEPF000264B6.mail.protection.outlook.com (10.167.242.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:20:19 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:19:25 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:19:25 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:19:25 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHJPS33568898;
	Mon, 28 Sep 2026 12:19:25 -0500
From: Nishanth Menon <nm@ti.com>
To: <kristo@kernel.org>, <ssantosh@kernel.org>,
        Siddharth Karanam
	<sid9.karanam@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] firmware: ti_sci: replace kcalloc with kzalloc for buffer pointer allocation
Date: Mon, 28 Sep 2026 12:19:24 -0500
Message-ID: <179061596070.2959406.14233424953619261110.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260918120839.207459-1-sid9.karanam@gmail.com>
References: <20260918120839.207459-1-sid9.karanam@gmail.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B6:EE_|DM4PR10MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: d74d13eb-0160-45c0-3747-08df1d84c5c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|36860700016|376014|56012099006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	uNuLN3rlV1syYgTCZ4Egyom0yec/T4sHpeuFUtrHgkeGutN0E7doieER4oqicTrg+vBHrkWRz5/ZtRL8JM5CAwRoS9FzF6s5iSJ+9sDQTaiTmLX6kay+4VS3QYOQfPJiH39CxLeACLnwbnbcnrCw2aBSJkB0dZzZZgAMNojKuHOL1jvOQVV78WeVFXK48m+GHVp0eN2AmhNBTeseMjXScIeNtWLNCaLzw7dGuZ1N94DgQ6nfDNMcwf5IwHpWg0UX2Qq/fcWzeVR+JOgUOL6SdnD9IRw32aH7wWR18YCC9ekP8F38tLgIM9+luo788pZpVN7w1ybR7/JwaUOk3trzVyFO+daNF+hFVlPdbCVXTU1S/egQeKRQA8I3ZqA1A+TMOdBsXSe/W/64CSkzI+bICi1y1eTkUOXKlx9YA8X9gT/cbCOdxNMoRUjxwTt/y5/0qeFIQtwzxKAy7FGliM/CzdEi/VZsgk355eTSPzQiycr3bMZ2Y8RTRtmGwxU7NiCg4wZcdXx3aKwCZyXz3rM1e9lEXBRo2dR1jxBEtlpiqBk2poCd5393uMnkWwWIsYU5b7G/UQ6TeOVSW8nxrwLgNDlQJpyb+1W8iNQwClE55pb2Z1oC8DbpUHqoMeZlAYanKED67L8my2naea8pnW3maQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(36860700016)(376014)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Di1ZDX4HrPFnP3DDXx+SVVvbxWcELUjUFIN6fcEx/cwMfTsR+jH14A2IZl09PY0bYNVzuH5Nb1wVpSRnl1uEn7rbfon0DTZUgGxATYTP9WyQqIKP9ib7qyqxibDbqb6tuWI8Jw+xRxLmUhmC3kZ1LmRVSJnfHIj5Phdv9CCBu2U7EL8C2wUExxB1SqJZSzDhxlGkaMT3fch8PB5RRaPUNUHSlTL698QIZnfLPDUVNSjqJb+s6ZFDUjl6H10h4wvjqi9oSkOM5xl5V4hMFmq8L1rh273LjnO+JBXe5ZW0SSz7FZnQnsQsJWGUSc8Jf/DQZetFWlotNobTiBtSxhuHVS4TD4puo6NUtcAac9+LDVbV2z+Uefg6JTIqUcaAvuiwVm+luflTPaPZKKjFhzel20kdZle5ckeVUnLRDN0r6z8lG8hPyJ/xi7kToZadxa3/
X-Exchange-RoutingPolicyChecked:
	HgvCcbcn2xlgXTwqnZ9BWq9Xr+Cp0SnSFv6e3ODWWBwxKt5jEiNwRr5N/oe+pqjtyItC7Olh448Vafn6vus7HnrwJ01CYJVd6P8pY5ywcRn9WSJ4L9qgMJ1IVxoB0wFFwBfBn5NQtGkQRSj+D1uTGBhrAtogJDOBEgFhqai8oTc+UnvA0uNep6p59oEk5Uxp4ILDTs5ohIhsyk6yFdVRBlc739FfiBQrkG9rxgj+fbMk3IlfPHXXRT2rY/X5AGA1brviuXPDhW63RwM5OG3Evyo26vA0mCo7+v6sj5snrdv3BIgDpr7/Crlh1ffGJMpSNIbVCGWtQp5yL8MSL7x5Bg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:20:19.9125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d74d13eb-0160-45c0-3747-08df1d84c5c0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF000264B6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7426
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfX0cUXBDQSvuuf
 Yc65mGA854QMKhijf2Y0aFUm1183bP25BMbGIG1xAUZntcxmkUGH7wu7PkhZHfOBO6VeBJJz77o
 jANFyCmrmoex/ygQwvqvqueNMWuPBsM=
X-Proofpoint-ORIG-GUID: CetDP6lGN_7EyK1NOSKXfBHS6ZzoJu1-
X-Authority-Analysis: v=2.4 cv=RLgmjIi+ c=1 sm=1 tr=0 ts=6abaa1da cx=c_pps
 a=jETFHvz8UvQZFuPXE07H+g==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: CetDP6lGN_7EyK1NOSKXfBHS6ZzoJu1-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OCBTYWx0ZWRfX8T25cDe0487b
 BoH6kn+e7Eiz0M/Ezu6R9S3nHllSzx2LOcsajS+PcZ1yIgC/bRBLT/HNPVTTZG5v5z13roaGFeB
 JOXEawc8tbEOg5f9sQtO3qlZ+xWVo0l1u1w+1BBLxG74QlghNiv03I/h546PYTj2KQjASv8jquJ
 FCICVlnyOqDm3VyQapEoI9rdbEeH1jm+3YkZrJ4yckQZ419D/C0+wUVuZkrC+9s/iBtsoTl78RM
 5w05M8RA61B5C3v7pJH9mpwHaUKEDFTUiHwVwu1dnY3X+rRrZ7gn9HB3WqU20aWWKC886RCjWba
 i6IF8deKUvWKF3TpxtYqMD6DF2HkBdIrkcuXn74DVXO6D4+7BUy44cW55lIbIng+S1NBTHhEbRv
 XhKTj6aCRO+Kl5j5gl7oduDVb+78O29/BdpheCcOhESfvTkYc0Hxq4yPYU8QfZ4W20NHefodW/8
 XLY8LI+UbY65IBjbG0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280068

Hi Siddharth Karanam,

On Fri, 18 Sep 2026 17:38:39 +0530, Siddharth Karanam wrote:
> Previously, the buffer pointer was being allocated via devm_kcalloc that
> would check for a mul overflow before allocating n * size bytes
> (size being desc->max_msg_size), but since n is 1 here, we can instead
> use devm_kzalloc that allocates the size directly.

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/1] firmware: ti_sci: replace kcalloc with kzalloc for buffer pointer allocation
      commit: 6ace5611ac85887a593b7eae2b7edec8dfeb2ffa

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

