Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15A84A014D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537777; cv=fail; b=TrsaWlzWWBnhLJ5B24CjgPnXIcXRaqa/jTtZnwP2ohh7LpIo9N2fUVz2PsS9iUs5fAX2Fjea+E36tN/uRGNnJptidjHRssRXyZMv9Y3JawD6DflobwSQ/H6luw/hK+oV8zGZfyu9glTky29HWJLVlLPcmIWzLhGTocYp8Ka5xnQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537777; c=relaxed/simple;
	bh=p1x8tsetdSC8b12melPRzw/pvP+Y3s+iOUMJqJgzDIk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u5cRDlA5fM42LlkLkBDTbTn0f8mHu58etM9EyXzsmV6/QG3vMuhB2cuIjlbc3DKrF/XOMgtEpMchalndE+umNIfq2rZgscv2dpgqWqqNgKhkgI8UxaQAVS06Uff0zJLSO82IUhTd2yyTiif5IPTdsofc89zE5l1CB9Ulqy/qA6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Yy7hcshS; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TX4qhFhZ; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Yy7hcshS";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TX4qhFhZ"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 684Fttcf2590498;
	Fri, 4 Sep 2026 11:02:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=v4FeUuXbrS4bs1nL0LIOp8Bd9ANw+fquD33UWgySP
	g0=; b=Yy7hcshSmRhcuI8kF+5PtsNV4VcBog80NElZQjs336heS/a4Bz0y1Carv
	BoLdL2jcnR304cKGR4TDCGBQ2XNp0PjFovpAbVj2CQrjd2SiZNl2L9BmKrEaQkfH
	l8BzcbzFmHPaXLuFj4swblp24WDNHpk3N9n0w7F2UiGjgCu/2zh0VUtjHNFNCaEc
	B2ms0OCRfjZJTo0N7/AO8dZmp9ZQ/jRL5kdLJdaaBse7jgFuzrI17H0Nmk3S1G9l
	VA9mHl64SJ05vVSb1V4Xv3bObGPT1yLuZBdBfDc9m8R8i/KOVSdXJ966mnqm6s3L
	GlSPUsR1DsquctEKxSQvJfgPLKpoQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013063.outbound.protection.outlook.com [40.93.196.63])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gfyx7rn4j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:02:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hxcoQF9nDr/OqBec6ZiGdHAqb/MlqBT3aAXBhbvSvlR/5Hu0P3iRVhCTUFI7mkKI7yfwg9Kxg1MtV1BKgOVKOA4703qd8hf29ImbVoyJvg2v/Z5HXAgEGL+9Vk3WxQRnxLRsjT4d9lba6vfgqt9EnsZqOTuK6u8HPKymQFl/XqJd3z0jwCG7ixXQAmR6Bo8QvdR+ZovAwpvIRrzlSLJa+mpfnFzEsD6pVDe8efDnyqjOukc6V0a3BNYSBBfc+4f6lcymleVKpFeM6EvvbarV3DJZ+Rs+k0YPRm6CRgbqxETsqpuDB+ukYlr9QNFSu2PoGjgz1Fmat2VOL4ZiM3Y4Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4FeUuXbrS4bs1nL0LIOp8Bd9ANw+fquD33UWgySPg0=;
 b=N6sLkQKBrMgZgwCvkHOMpqf3p7HAsPgZ07GXRTOGnXv4sSlVbfeTcXV6Jh0gVZ2NmMKVz3D0jzVml8hZvU/QM0v8fnno8bmagKlCu3z8Lcfh4YG9srwmxFWOf1S2DlDl2bqh29K08kXAhzrLq2qY67Y9Za8ZUS4BWHj0vU/bVMZ2b4vTqZzw97XEKQMybClxisDLN7CrTuYvQcbNR827LvcLVARPME0/nxcV/2zPlJjfDYFgBRcdBeTMe7jc0U5qqWQ8GCDAL+MgYwPBDbLV2fogoSjLVVXU5AZSLKa2MqIiKJe9UHQF6FVVv69RAFNtEhs4kQHRKQim/4BCvHNZfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v4FeUuXbrS4bs1nL0LIOp8Bd9ANw+fquD33UWgySPg0=;
 b=TX4qhFhZuYg6+oBi0l+lpXr3A1cbOTAOUqpNlOT7C8YlTn0SxTl4ugd8rJtvPDloxRg8ogAWYrO4fKzkoC1JJrMyGOs816he8MceUuAytryd3ZLN/PBDkCmrpitVzn9EbL+F2sverAzA6g6Ktvn0XTidcgVii6F07Jij5iCprpo=
Received: from BY1P220CA0045.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59e::14)
 by CY8PR10MB7289.namprd10.prod.outlook.com (2603:10b6:930:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 4 Sep 2026
 16:02:50 +0000
Received: from SJ5PEPF000001F6.namprd05.prod.outlook.com
 (2603:10b6:a03:59e:cafe::25) by BY1P220CA0045.outlook.office365.com
 (2603:10b6:a03:59e::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.13 via Frontend Transport; Fri, 4
 Sep 2026 16:02:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001F6.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 16:02:49 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 11:02:29 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 11:02:29 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 11:02:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684G2TrN3786584;
	Fri, 4 Sep 2026 11:02:29 -0500
From: Nishanth Menon <nm@ti.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH 0/2] firmware: fix typos in comments
Date: Fri, 4 Sep 2026 11:02:27 -0500
Message-ID: <178853764688.2996273.5327005670579517135.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260904123541.38602-1-hemanth.selam@gmail.com>
References: <20260904123541.38602-1-hemanth.selam@gmail.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F6:EE_|CY8PR10MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: a121dc35-edda-4354-7a3d-08df0a9df7e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|10067099003|5023799004|22082099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	dXzsya9DNldvqd89o3HBdS+Wc7+6bGbbIKEpFMz3IgCXaM2dsy8cKq2+/4UCqaRbiTrNU+dW0ecueTD8VMBvb396HWrVJX4QWg51beH+Y8bHa1aq0HRYWCvclauQkQq44eXOKNgHp11V+6Zww6+c8ArphKXALEjT619rQjUfLRE+R5LP67e1BwkJt+693G7zeKbZwHTwOhfB99WvvpsZyziOCXsC2hCSDEVDo8u573uOQRG5XiuiViEuvBZG/szjzCRFWPgzMd4/D4pElQDqukmuqQDXq4umi/d4BolbLydi0fFcS7w5S5kaD7DSdsbZCnHekud8+lGvh3Dq+z+JZp29VxPWkYvOL6LXtzfzsOdE9TUGF6Rr2IYsv8wh+9+ETpcAvChYSGqk/M6IylVjlRLQzkMED8t5wCx7HacS1tnCq8BzboPrBkgwJUjgSor4Uv32XxYeWB8ASO0LSzpztwkrqeYh9dg93OOMqLkL1EBEqZKiL0Rp6uwuSnXOuLznrzXOKhXUNiihYNEieltCpKLiPve5bQ2HYugXYOncP+mMQLZL7CzHdToeXAQtoh0UuX+rMyxL2OVNPSvUq952dGNjw1kl+3ICarsTDDQfqXfB+xwZJyCe5YcoHZT4GqrlSgFoV3ZMxCNYFjy0dbbKvwcPxLsx/vqSD0OVw4WAL5opzjYe1DlBYec4fKcFDgDEmDZzFllNDc8PEW4nsn7ilQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(10067099003)(5023799004)(22082099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lV0D0u7h+Q/+soQxeVda7siBbOZsA7aRF4nDyXP0QOYt2BcnpTNPbJNAAJhwHaYqk87zUl2w8aXmFvY+qBb/Dkc+JRROhRA+h2drIJZxy1KG9aQ3J9QwIV/HskAr5Lu8QKrGGH2dWjgvVA5JX4cX11l1eP/FvLErsirVr4onlDA6F8z5YuBs7PZJzOXq6THCp0/A2NqtIdDl1Y5aXkX7sZHoMyKHouxQXSvvdThjNzvKay1eADOjQYrl1/ACJ5KSmO15WHMxNEmyszxbnrhzMYPkG8sjPtMVqpK9Kb0Aza0UBHPEFgA4z8BpCfMhnbTgBh/7Mb3yuvVQ+ZbKsWmnkg+9oSmQ0+OX0d9ksXMMdSC+kp/a4rpmR/VBZZKQ86V5ULI4YeWlwqh/uEAuolxVgJ/7surMgtz9fyN+pEHRcGDNa3B2pSFLMdflQO2DpkUv
X-Exchange-RoutingPolicyChecked:
	P3pRd9BJjGugZt7Y8uF1qTc8/1744l4cA1y36/iV9iBW1S+G2CLHRqCp6Cd58pylXz6Z7NMpcPnGXQXTLGK+K3q1rwCoAEfluoXtLhUpfXXGg9MLbiiuUnKhASu0s+/m3RYtmClBYVTIAhyEcYBT6SMa+54elWPfESrj04EqPCWQcWDbagCYUwEudb14A6rc5fxRthQyY+z8t0xsLz/KnFQSlEYXD+Lx3pZ+rXrG032fhoKbKYrWGScvT7SPl9MaP/inzFN+m8wCEd5BDWzD26ZOzWIHb4o+Ivdh58Y3Ib7rjDvF/0OuGsKtZzYhk5c9W+3OaEu8/xrh6lhSbY7UOQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 16:02:49.3762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a121dc35-edda-4354-7a3d-08df0a9df7e5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7289
X-Proofpoint-GUID: qmjJQnWkQLwoH7tbU49BUdwRjV2RBXKA
X-Proofpoint-ORIG-GUID: qmjJQnWkQLwoH7tbU49BUdwRjV2RBXKA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfX/yCZKBZ8hxjx
 6k1i7iJ0vbOcKzDAtmA1kg3nQtKuFcuNap+fWDUAYR9i2FLDQJR/PfeO+hlvqO1ICe37Mrb/f4z
 uHiwBjpWZefdQcggIp4hgA+vaUGJZnI=
X-Authority-Analysis: v=2.4 cv=PPM/P/qC c=1 sm=1 tr=0 ts=6a9aebac cx=c_pps
 a=VUNJaWZlx74G+l0QYBOIDQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfX7cF1yJOuZdLW
 LhT/9/THsZRWvJc5YudiLzX5kllrOBZXL5ClQTMocxkvt3/zNaNpb+mOrGkku79zHtzsU0fXiMD
 X8+wfiwKSB3eclDqfP8z7+NvsEuIgkrm/8+yFqYfo058rNtvgaQ81QHcHsZ4GlSyyFGunZ3baKI
 oCpV0YzFDpOtK7HFL70WYRSg+Hhut1/PLgo5BB8wXvBoDKbIbZzZrtp8FZvCvGR+gATWOFxLvCL
 bFRXPNRSm88v6qqIyajL5kaiiSZw8BmKN3M2c8WbcbKHtKsn1dKLsOdmeId7zu3k/ohwOdp2vXT
 yArEdBSW0sruMmN316Vjl/p9LgqIK0VZrtYkr0WsxobpVKTNLA/ocvGAfnok61TBfAiD1R9hv1Z
 KR0yxqT+aah3uOhAFBnDcICbZorD/X6HF0jfegPnz6HJVZvkBLxCmWPt895gUNcr8kLzKwJTugU
 FvqNb10KD52m1auof7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040144

Hi Hemanth Selam,

On Fri, 04 Sep 2026 18:05:37 +0530, Hemanth Selam wrote:
> This corrects 2 misspellings in comments.  Each is a separate patch so
> that any one of them can be dropped without touching the rest.
> 
> Nothing outside comments changes.  Every touched C file was checked by
> dropping its comments, replacing each string literal with a placeholder
> and collapsing whitespace; what remained was identical before and after,
> so the compiled code cannot differ.
> 
> [...]

Next time, please send the patches independently so that relevant
maintainers can pick things up. I have also fixed the $subject to be
more inline with existing commits.

I have applied the following to branch ti-drivers-soc-next on [1].
Thank you!

[1/2] firmware: fix typo "upto" in comments
      commit: 5c58f5e2d5a0088c3a8857a3d8fdea798782e1f9

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

