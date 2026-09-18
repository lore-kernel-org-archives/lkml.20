Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8529F28B4FD;
	Fri, 18 Sep 2026 14:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741023; cv=fail; b=GFFRFpXiIqrOF6Qh5m9nbsKOkPH2Ip2s8Ml2JhTD7vJFd8jhUK+6MI4TCVWz7KNyj2aQBZCGshT/cjbVojJ/+3Tsqrr1TUrv5q3LbjWxz/o/KvXbXBSSnsuas2Z/TNOm6vuGv+t1wYDtnpR6qdivYnRBA8FEv5IMtMKD/UMf0Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741023; c=relaxed/simple;
	bh=5bUAEQ+ytf/ix0RXeG7uKo34TBppArXpTXGuj7I4cHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxgNU30KfB4SYgx3I2N5vHUp4DpYhV3BEDLlqsXCrhb6lqVehX8hjOo8xyU4rINoAKnnjMD5zrbelbvKIu9OePVjnbS6TsbgFKHKvBhG+2nOGZJGEFbywseMHXTcYmt4uyWj3X1G04Jw704WNFoLdzL8NRbBy1a4XC1N9pBTPEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ZPjuyA8s; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kDgYy0yV; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZPjuyA8s";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kDgYy0yV"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IEG1nK2847333;
	Fri, 18 Sep 2026 09:16:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ORbQUfc2v1i/mZOSVe
	pru1vI9+pEQzACFSLdshNLJ9Q=; b=ZPjuyA8s0dQxmGtpz0ijGIDrkOyn/dqbU2
	NqLYnav06hzkcyTfdJLgBuyQaH+Rr8t26Gi5g9SBoaszNvuRFcqD7ZVCX4e/1tDe
	MC0NbQLAT7nxBJrO9UBq7vIX/lru/q4SOJH/VXQb/L4r5SeuzOzGmMgf7teBd7Rj
	xR+r3KhlIxqHUTQVx2jY3TbDbm4PosQ7mevpxRszxQyP2vEEsy0FwtuoBMxtJDmj
	PbYqjVx1mbkR0UWd4/LE+OSYfZBnUreng/ywP1c+QgnOFjiIwk0V6EY7YRRadfvo
	gsKxGZUeqC4/+mQHFlGuU65qkrvLibaxFCzQvw5+cIGnLu7bRhnw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020078.outbound.protection.outlook.com [52.101.46.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gregu2db7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 09:16:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFGbslgw2cU+YrSxdzZcX+TnwYqnyJMbzn0nWPzPrsEg7N+N18fX2hfcn8E3QyS9CU+/bcmRWZ3biTGYMtnAq95dhCPPndrxD74leZ5oYKLaaCYj8qc+GJWRlY4w/aZB+PFYxPG4FC2hTkNbhc6gdqD8H+/2q0A9BA210coaJKLnmsGuLnqb5PCJANM0EfcT37iZFuJoJTEogyE28rAYFVvNn7LvQG8coX2Ysn1UgP4+3iwmKKff7fBtZbCOQel6+yxxaGq4ivUuuExEvlq3R5fUZE+aRFuYdnzYxwZmg8VGMEFFTvYz0crXvHVu58C9BRUSKcET6EEfCQ90zWTfbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORbQUfc2v1i/mZOSVepru1vI9+pEQzACFSLdshNLJ9Q=;
 b=Y2WMwzy2KtRk0ez/kfPDylwVoDGDQYsscNIFC1IbgpNqanGF3mEvOb91Cj8uGa1tfhesCiggJunKFIlBAHeziFbKyz8n7Jlo3DW0J3iHMSjlSapve9qr/Z2mAmoXRt1d+wvpI+82sIZ/ER4pmQbNepsqncjiYXkKD0F0+tYzaLYjRKfiw2BpE6/x/DIu3mexdkhZnFN18hV5TQIXCumUUg9EY9sitm5MN8uccXBcZOptuvGOzJi2iJMT2lWaQl2V/pjYw9nuQLEmVR4cqiwmT5dqmqshKh69zcnfLay/TArEAar+5ObT63HEoakwiEL9vBOWWMja3r0MxA/YxpkojQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORbQUfc2v1i/mZOSVepru1vI9+pEQzACFSLdshNLJ9Q=;
 b=kDgYy0yV7GfzXYdLL9YQkbUApQ6ppaKiCcgHbS2gvQRn/nRdu++FXU64N4jALn4dfFDSoDFBCWiRJvKjFoK1xtGteVDRCoF2/t3uAxrhEKuDPkZTbZjYDuhTVbhSKinwUPFeQyE/jakxWt09tp1dwxXgV4egSzpZSdy8AB2CrMY=
Received: from BL1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:208:256::7)
 by CH2PR19MB4021.namprd19.prod.outlook.com (2603:10b6:610:a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 14:16:23 +0000
Received: from BN1PEPF00006002.namprd05.prod.outlook.com
 (2603:10b6:208:256:cafe::a2) by BL1PR13CA0002.outlook.office365.com
 (2603:10b6:208:256::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Fri, 18
 Sep 2026 14:16:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00006002.mail.protection.outlook.com (10.167.243.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Fri, 18 Sep 2026 14:16:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AB98B406542;
	Fri, 18 Sep 2026 14:16:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9953A82254B;
	Fri, 18 Sep 2026 14:16:20 +0000 (UTC)
Date: Fri, 18 Sep 2026 15:16:19 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v4 6/8] ASoC: SDCA: add
 sdca_apply_default_control_classifiers() helper
Message-ID: <aq1Hsw0se8zKVQSE@opensource.cirrus.com>
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918131914.681588-7-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006002:EE_|CH2PR19MB4021:EE_
X-MS-Office365-Filtering-Correlation-Id: de826c82-a444-4daf-5c74-08df158f6a50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|61400799027|376014|7416014|10067099003|11063799006|18002099003|22082099003|16102099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	3DZciErbivO1xZM64ohjw21cNKzTRK/U4hjsOBgvEJyZIwectW59IM+azN+8SHaJxXVtyUTaw6SfaZYqb0NXInb3S7iuXnHgp+yWIBX1rtqb55K6DzVbA0iXjBYetesb/xi4K20AXf8g4P6zxcocIm31mTuvDBebEVz5kyX0rayxEpM/m6usNFhymZW7IsJ01F9wEa8lTbUCI+5LUyJzZSh5rZXEi90NJL6FDIkfXDroGGuEBDLPSPN9MSkUg4bqdL9hjZweJ7rbjEImwuMqNewgLQcEFmMp3lCzhhkTBP/xLqAAhcu/tkVcPjxPJ5BSOmNZr7O+h9cPhdZh0b/JLhpYws4iHkYem/MbfOkfmqiugesWy46Es2U09EQzZPTuyrQmXxR0j4FG6Rhk+9XjGmkHbPt39H05nmX2KWFxEhrnU1YN7dH+GmxQ4l6isJz/tZRVxRWkgazntkwoPUHzz5L+BreowV2+EBPXtXKS5muYklPc/D89ONHGG6mqJzWlLavXE+bVurAIDuM4z9KZnuwtOBDxv1tBDOpY1WcXSSYWFqM7hcwlExAkRPHc2Z/xSY833vl4g8bHntV5+PG+EiH0uV3MDkva3TRUK386iDm4Dqqb6GKNrpXGaiTGYeEUZbDC65y45FUvUieRvBFCFQKznhVnTJdz50UFmOmKQ/vbS0lreWnPbHETs0zJ8vD2rA+hezvKAXusD9H+6w/+CA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(61400799027)(376014)(7416014)(10067099003)(11063799006)(18002099003)(22082099003)(16102099003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	+hRzgBejfzgsgLx7vUYf+Oc7fMjZEZQbDJMa3gq364W/a58DDFQhnD4i8YUGhhfh9pK0mo3R4bEmy1Cr4nYcnrYkFBh9Fa5H0qApv8/2UB6FvGlxrMluFDUK9O1opKQdhfpaK07fo8qih78ODgfsIF12z21pCZqGktNE9HWE1ElBT2hnDrWMIexCl46gNke9jiGnhTqLjRwYLs6rfOBkJrzROx8rQwEF56ZXOAnLGe/1ioiHD+xty+IF02vNZ21x0SOFdMwwUJd1MWVEfWWvZvPDmEFOUehOm0eLvZqCB7PTfOk+q6zuUl/zN/UJ7D7uP3HweKtyxAnFWxcUULweDblYefC30Skdx5dtkHUQxDAB3k8OWZ4Zbk4qdls222UUBEIjkIllaT+vW18K1JGRf0FHkAfnoGCQ+dXT5Q7G6jToBLLm5AdkiuUWCwvLt8KQ
X-Exchange-RoutingPolicyChecked:
	CKuO8tNirTcVi+lbjY8vxqXGpKZ79nWch6vOEy9by+1yBwyv5fyXTkTlZSoWTpfQQ3yKtYD3OVNstxDtt++pyzqqndCViFKDXLvW/O2xaYFu8Z/IDX8gG64UtM0O2BVE4kgKcapzjJ34k8E5w1Tr0bD3fmE/UHluXMdobXTxupbYneRBveHtky3TsDAHWw4ece3XhYXFo2NfLDnGJMp0RhZcAKUljjbuAaQhbMTJT38KPI1u5wstP6jvCqq0hej3mVJFhk5nawTDwMflbFpGEpYEaNagL7OrCQhGagT0rI3NUoUDFJ7EEz8eGlqmowChZjtPLTqYeEJsn2illyWkvg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:16:21.5921
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de826c82-a444-4daf-5c74-08df158f6a50
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00006002.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR19MB4021
X-Authority-Analysis: v=2.4 cv=f8Ddl+yM c=1 sm=1 tr=0 ts=6aad47be cx=c_pps
 a=x8fXg9NzY3hbHNzXWQS9+Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=EUspDBNiAAAA:8 a=KJta4ZX7STJMjaCngjUA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX+AT2Z2zi5QxK
 BODZOBR95jCT9IBU00UAq3cf9YoyacFPfCqcILsGtCHqGs2F7g3M89db2G/DkBQE1T1asQkl51F
 kNk28TWQLkbX2nfv1hXf+ZAfdOZ5AmE=
X-Proofpoint-GUID: owmPOtyRmnO7IGDWhUQNFkqi9ClxTkfN
X-Proofpoint-ORIG-GUID: owmPOtyRmnO7IGDWhUQNFkqi9ClxTkfN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDIwMSBTYWx0ZWRfX0wJNc+UGgiCG
 IhkaIMG+E9no2Rh8dUKSW/ruWEeMKXxUKh7IsceZCrx77rTzCOeJ827ol0H5hqDZuJ0Q2KYX0vM
 qPiNpFsNky4gdJkDAeLCaqK093tKkug1TfK7I4zPUMB/Z922nDBO7SmCxOnxXiELaNm3O1gukkH
 x3yvRBxqBsx24Dvji8cp/gOHxvDcvDc+sakcu/BucWE6sYQSy7/o0H1ItzT9SSC9HZ9mOxkks3W
 sXuQ/3BKe3OBdu1KcRVIcHqfFv0BDWAwJF2jC/QNPXIlrN8lrtUt47AQEKsbdSMKfJHirOi9YRx
 CR4cFOSCKGnWVb+9QTgHzW2ss2J0n9jmHDjOaR9mALFg2KzGKO123AQ9QE2a0YXz1a8GADjhp2E
 aaajSvQKIjUisH/4UqLADCNOLMIbBTB1wOEg87IccQMyCw0ubFS7F9w3SvDLfLeNAUuNaMel5PD
 2h6TC2p4TxZzEwJf8yQ==
X-Proofpoint-Spam-Reason: safe

On Fri, Sep 18, 2026 at 02:19:11PM +0100, Srinivas Kandagatla wrote:
> sdca_parse_function() derives is_volatile (see c7b6c6b60594) and the
> spec-defined reset value (see 02d851b46b36) from each Control's
> (entity type, selector, access mode). Codecs that ship static SDCA
> tables via populate_function skip that path, so RW1S action Controls
> end up with is_volatile=0 and get replayed on every regcache_sync.
> 
> Add sdca_apply_default_control_classifiers() to re-run those two
> classifiers over a Function. Elevate-only, so codec-set flags win.
> Call from the tail of populate_function.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> +/**
> + * sdca_apply_default_control_classifiers - apply framework-known Control fields
> + * @function: Function populated via static tables (populate_function path).
> + *
> + * Runs the same per-Control classifiers as sdca_parse_function() so both
> + * entry paths land on identical @is_volatile and @has_reset/@reset fields.
> + * Elevate-only: codec-set flags/values are preserved.
> + */
> +void sdca_apply_default_control_classifiers(struct sdca_function_data *function)
> +{
> +	int i, j;
> +
> +	for (i = 0; i < function->num_entities; i++) {
> +		struct sdca_entity *entity = &function->entities[i];
> +
> +		for (j = 0; j < entity->num_controls; j++) {
> +			struct sdca_control *control = &entity->controls[j];
> +
> +			if (!control->is_volatile)
> +				control->is_volatile =
> +					find_sdca_control_volatile(entity, control);
> +
> +			if (!control->has_reset)
> +				find_sdca_control_reset(entity, control);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL_NS(sdca_apply_default_control_classifiers, "SND_SOC_SDCA");

Just set the values correctly in the tables in the driver, I
don't really like this going back and fixing the tables up leaves
the driver tables looking slightly confusing.

Thanks,
Charles
