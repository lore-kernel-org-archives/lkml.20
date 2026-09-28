Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4704DEC2D;
	Mon, 28 Sep 2026 17:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790616152; cv=fail; b=l0q0+BN9Gh2DlTTr90PXRkxN1qBuz032LhvMYlzPqB9DcyCMc9duwrhr+VKOxaTpjBKFeSAmeA1Pc99TBeNmg6yZ0I3ovmxMZFg7dWZzW9b1ORP7JEAVwOxsjHi3LJ9ncHVPMT3xoD9Lvn2tA7Y7rRmDez5aiu0vM+fXZq89fx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790616152; c=relaxed/simple;
	bh=Gh4D5HGtPU4bc3PCWTc0c90KeUX9kH9JA1UWF99mDqI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nsiTapnm3K3hj3opo9PRkn/lV2ADH2s1zUafDHQ4UQyEn6rbX8/7FAl3yL3SVUKcc5hqoWEayihXufXn6C3gNzrMgul/yb/M9LCvtSDijcAjhP0A13prscu3l5ykLB8niB1h5AFHybrDn4hLPjK9laOSnFYsogyybMPqb+wBTbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=fqTbXrX3; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=d9FsMl8p; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="fqTbXrX3";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="d9FsMl8p"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SFKD1f2327689;
	Mon, 28 Sep 2026 12:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Yxmen8PixAFlDa35Z0yzdpUE4VTnAT++pg6qSqebu
	HY=; b=fqTbXrX3regbrc+JSI4ba+kFf8WQ8lPHg2Fvui/5l5GxvcJS8faDpSYz6
	m/x44xmoItd0fZ2ObFr0Os/ukMt1oRF2A2axgEDW2rEaGpBka3Tna/Jp04ZLb2Cw
	FLi9kfOPNuFvftgcq8ehvcOiIRHCXg+arrRsnoQKBkbi1JdbeIiYXrFLydz8/xv0
	p8EJprMrSNNHq9cpKiIJHb+OJy3hUiQlFoTTN5fhNWFX2as3BD7sO2fca5C3Gxar
	AgMGvOb42ty0UYgnj8HvQyahsB8KzFhKS5Hv5yu8v3s7mwU+WoVKUOw2GbqRwZcF
	UGZ/QfGNEypyxALRAMwm4Rngc8x2w==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010039.outbound.protection.outlook.com [40.93.198.39])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxwe5qpp9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 28 Sep 2026 12:22:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JWo+6T9Mi8HPyBZy+0hjCg+p3+Rwzx+k/DdnSF3IcN8RTMdDsrCieoUyQYLLECrv1jUzmBI32D/AFp5piznjcafevOByFkWLGlzfyWnAbRQlVUcE2fPMb8PqypuO5JQ8saLlz8XM69z2WShbJE7JWK7CCvlq3GvhOfACWbkX+jj63qRWpGzodKhhdqwwX+mtn9137Wk9enhg0xhs88/uax0X3yk6e9NhdXSW6Gh/GOtdr/9BOon5U6z5CMLAxRREwCY+CMlNSPMDeR7iX4AG9itAjMHtYmLzhQjcqsEjgZc90A6CE41wdcwSknitXvsKXCuLVlcca+NcQ6kzOKKd4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yxmen8PixAFlDa35Z0yzdpUE4VTnAT++pg6qSqebuHY=;
 b=uZUoapDq4NfJXb9vLcMpca2ZrAJl/71w198i81O1I0ZL3AAwCYVowFdrJBppTHVqHMsIdGZ2GWpguKhRFVWBk2e5rv3HXRHcuQXEUBHBWDPKs4CMBABH+yfuKNXaYRSB6BIYWWOnpulAV1EOJ04UeLTFa9ifYwReFBnufBSYR+M0jtqaJ5b1CaCHFqzjdVxxS+v1cJEMF0KNGdGOKra/XNsjFxmAfMFIfVc2DH6ehw+9b7MDM4lltu2MuFeXTttAZKYAM6f0FUYqmlBLWCeycmYqwZq0pYLFPocPPdi9qvYIrvLWcCIQ4iv6k6Tlvv8HLKPuoWUZqu6ghK9oakFwCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yxmen8PixAFlDa35Z0yzdpUE4VTnAT++pg6qSqebuHY=;
 b=d9FsMl8pGthRySsYcRUcd/eurg8yZto3gKGjfB5kHms7937fk9jTyYHLgYEsVx2CqUkkynbLUQkY3D7Xg0Mi0Out+pBGN8hB23YvPPeGJg7LeZrRWpgMWNccVMBzcPHw0ex/zmRDkXZ83fRKQIX0pqUS2DYEcDfQ15hCCXWnPzo=
Received: from BN9PR03CA0239.namprd03.prod.outlook.com (2603:10b6:408:f8::34)
 by LVWPR10MB997838.namprd10.prod.outlook.com (2603:10b6:408:3c0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Mon, 28 Sep
 2026 17:22:01 +0000
Received: from BN7PEPF00000093.namprd03.prod.outlook.com
 (2603:10b6:408:f8:cafe::6a) by BN9PR03CA0239.outlook.office365.com
 (2603:10b6:408:f8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 17:22:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN7PEPF00000093.mail.protection.outlook.com (10.167.245.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 17:22:00 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:21:43 -0500
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:21:43 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 28 Sep 2026 12:21:43 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68SHLhNh3572508;
	Mon, 28 Sep 2026 12:21:43 -0500
From: Nishanth Menon <nm@ti.com>
To: <krzk+dt@kernel.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <bmasney@redhat.com>, Moteen Shah <m-shah@ti.com>
CC: Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <gehariprasath@ti.com>, <y-abhilashchandra@ti.com>,
        <sen@ti.com>
Subject: Re: [PATCH RESEND v7 0/2] Enable audio support for J721S2 EVM
Date: Mon, 28 Sep 2026 12:21:41 -0500
Message-ID: <179061609498.2961708.2765647430941967292.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260923111604.4040417-1-m-shah@ti.com>
References: <20260923111604.4040417-1-m-shah@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN7PEPF00000093:EE_|LVWPR10MB997838:EE_
X-MS-Office365-Filtering-Correlation-Id: fb7ac9bc-0a5b-4ba1-0f0f-08df1d8501ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|376014|82310400026|1800799024|23010399003|56012099006|10067099003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	XvE7jzlLdYHNcVXc9RFU9m7vpsdWLITG7tSavcgBeMO+g20N28slBEgEhr45CJf/nZQbYYrRuqoUgf1ZklgAL1Ii7LAc3tvh4g3cDyWcKus9IDTmdKXzylaLwisQVMrsQKt7IV5dn/9A1Log2udhg7VtLQEQSYxTSWy9b1ng77jYB3mek0M+TKu0RBDmqHXghxUuk/oCSvmPf0f9jYi7qxp+SAhRj8Rg1lGBn2alMDGWqK5PqayibpXvDd7LA7awuatdc10aLU7nPY7fy/XZeHPshJ6IGJ+OvtPdbxw6WJkpp3aEuSzqoEvlvfs6Tre2p0RfOsqWjeQZ1m9nGNWDKR/RUqkYiy/0TmFgbKy5p5r8oSoMD5q361DvINHJP5FxUWfwUVyBHK2RKt/j82boAvn1JkeWYpjmt7RqDrAfWMC0EwD/vwWAWwDPQ+gEQeU/2Jn3enNbO1HNjZ/IxmnkP3ogx2GCc4/dfuPlwwFrLlOi8wlJuX2Rkrg8nkPQcrEML8jLg/DsSlZQlaYuF5GpUZJO8s7VP9pMyg+uCVR5ZiQ9QcyMncofPE2wsipe7w03HAdJ4z6nunqTLw7UqrY1U51Sr6uWxkCQNhocl/7rg39NrQ6xdkl+PFFWBWePzvSQceZSYM0wywv2Q0x7SSPgfw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(376014)(82310400026)(1800799024)(23010399003)(56012099006)(10067099003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PpcN7RIEOknHCn5b3BoagoXtJsLMFdrXR4uI3qHnZ+RMojDBIgljRslIOVsD6SJs71zWFbzXxvMqgUkqO+vinvtDdtLe5q7x51Y6PbUzm6nNughqx4Z5AnPWpNc0M+AHtgrlYW4L2RA4Qt3c1Zy4xYTUstNtEo+1mc0ok2RcvhRSoFvW4KP/qlBOupUpFj+S9PT3utUfJLrk4iS85RqmD/MeU3YRwVxoIFZUOfOGCJmetGZhFiJGxCqPdF7ZHsDUtPiBdbadYY9YQZdGyemfme20ktxGyh9nqSMztKp3CTM1nvekmqdEAjaX+U/XdhdmTcMsUAZnrazpPB/nEX86yGimVDx3SC5wX7ysFJq/G5V5OucYXO5aGfFLVpvbG/Zy0ylnTXPZhiwRtIFm7l9ohHR6WO4aBicXNrFxHelR5Jielvn0AWV5a7qfAPaCjiz7
X-Exchange-RoutingPolicyChecked:
	gnmwrJaQu6tIFym0x/0GzZ73kpViIf8B4sB1rpV2AM1gkbpF/JOoD0CkQl7FWLMt6mPexPN9fqY5Utbe0t8lmg9HkKcpBL2Z6CNG0INiE6LSYLvcKYrXinuR+r9P8hp2tHCsU4/fs2yCYYhyqYta2QioplUUay0PErQKWgVAwigkMABZU1ExzXyW2MOn9KUpVuIEC7fhHjAxhJDDlxHcbeskxB35WWOFCkk8f/b+4MljHQWXBlN6/bwu5t5gn+WXID4lU7O4BBqoAja3ME/F1gYmnPhhctaTdlKkpP7yvsm+WSgdNRb7USsdQkPGZaw7QP86QNUqJD84JYo7Du0Dew==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 17:22:00.8963
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb7ac9bc-0a5b-4ba1-0f0f-08df1d8501ee
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF00000093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVWPR10MB997838
X-Authority-Analysis: v=2.4 cv=aeP0Dhot c=1 sm=1 tr=0 ts=6abaa23b cx=c_pps
 a=WWBLjRe7FI6dQUFhva+Khw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX079vZ5gkMT6e
 mnMZmfrhFSSIZzXeoba4QLu83gUZobFC32BlmNTnDUgP6VevPO2vPQ4Yx/ZwkqGz+dY/SEYTLeA
 fcYOkgcYOVIOVunlDL9JBcf9F6Wsujx+3kRdmU38riEROSeR+ebcTy/zwqJCAwqGEUv+PGGEXY1
 P249dCwRw7CIOCK7rQHVuG0O2TY2M0w6Q0GmI7ud0MsJoFMPbqaGRUW0ESBq93WI32FXsCxaUpI
 8gS7XD3DSdAifCooXsk2cecJx3KbJfJcPwMd65awN8/qsWfC0why4KmNaUV1Hq7clMb+t7He2J/
 Q5xIdAwbn46UsF2GsMk2dTzJEgTJAqdQBa1NJOgaro7l6HCYBKAfblpYxhOHwsZMKvuOjRlsVJU
 DsX8Yu66kdfCqbOl2Tdl+zww3Yp1BxrPGttS39yjvj+xwoDlBiZ4Bq/yqp9IqIRjDaK14MZBW3T
 T1SerHyLvyWzsrCPxFg==
X-Proofpoint-ORIG-GUID: 6HwjARNKmHGQ6neL80MOv-rV6Fx96oB5
X-Proofpoint-GUID: 6HwjARNKmHGQ6neL80MOv-rV6Fx96oB5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2OSBTYWx0ZWRfX95mhXuEYd6Lx
 dAvp5H133P1pEe2X9ioDQfMWB+ss0bOLi2yWbuDx6asq318JfZ5VJiCIPsrVqSHrsLYxGdxQYX0
 7wj2yWs0FM943InDPxg1Kq6okkUmrZI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280069

Hi Moteen Shah,

On Wed, 23 Sep 2026 16:46:02 +0530, Moteen Shah wrote:
> Earlier version of the patchset sent upstream[0] was rejected as
> its dependency[1], which resolves the DTBS check errors introduced
> by [0] also got rejected on the grounds of ABI breakage.
> 
> Another solution to fix the DTBS check errors introduced by [0] is
> to modify the ti,j721e-system-controller.yaml binding to allow
> audio-refclk as clock-controller child. This is done in the first
> patch of this series.
> 
> [...]

I have applied the following to branch ti-k3-dts-next on [1].
Thank you!

[1/2] dt-bindings: ti: Update audio-refclk binding and j721e system controller
      commit: c62fa7c2b8b186a4e319f9a51f981604c46ff627
[2/2] arm64: dts: ti: Add audio overlay for k3-j721s2-evm
      commit: e9591ff0ce7c83b68e4ddb285927415714030f4d

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

