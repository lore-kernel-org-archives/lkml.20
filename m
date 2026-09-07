Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053A93C3F70;
	Mon,  7 Sep 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788777483; cv=fail; b=LcWPwA7PLru1L7bx/7QAtggnGEW+q11TKtaQAeZs1eFBuwZtit2BL2KWl+GgMdb5s9Y1cKJ2UKBF7hRTxeQNRj/eILMYFJe4Zc6nZNV8xKeInbfPBUNMeZ4QW1mujCwvqGX2SxKN6WS6SOOJKHNuXylXWUCWO8hicDr5o4lkXko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788777483; c=relaxed/simple;
	bh=nA9LhkO4QY057lnlgThWf5UonLVcRoKz1rBUilV7JL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8rEd1eOgXk5F4hdKrpnGvPWegoQIndUEQzDXO0uZkAmg/tQvk+rcS9H+aKQy3Rj4KGa/crnjQo/N+iT7t6chZQQPByjODjsl/ATV8IaSNMEvoMhWTslUZYbQ865jT1uKg7zdyc7w9sM2ER9CHOa0nv0Q3gRgckaOg+kQWDXz6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=boftHoeA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=bC7Eqegu; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="boftHoeA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="bC7Eqegu"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6872KmRF3945280;
	Mon, 7 Sep 2026 05:37:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=dUBgG+4L5Yc2kEb2nA
	JHkVdowUFl6e+TOUlNUgYSW/A=; b=boftHoeAWczxkPXZxCi1MfCd73ZkrIOP78
	Z/FciU7N5twn1FFSaaG4qFgN1yfBa5U3GsDENpFlqFILDwcS7odZQj1+0QqKRn5G
	5BhtescGCpsbRrV8+r2++ydacnjUgS0LDCtKsyWklPidGW6BOHvK8Oo5Uj1OgVcK
	NkeWhMh/gj0hIDwGpwlaKnuMc+RW4NVDI6y1VDRV3IFjGA8Jt2vBqldUTrXxsqmU
	BiAe+vUVT4yeZumrwMSPGxJUDwk6iYWtf7TbDjGYhWl6ocbLY7WQ9oaATBH48yg7
	t7kmMwmEpEs2dIldvUvWJDI9mZnJrkOYQ0px+H0sAZ2RW+r7Z5pw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazhn15013061.outbound.protection.outlook.com [52.102.133.61])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjsut7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 05:37:51 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eIpmnJn+SRGa3jlkDdUCQejte62ZMgKqgvkWQRZL0xBML+itKs18FwGp/iUpdXCPbsx7Ds8r6Kv6FGt/av7oR6DGV7dpdeWf1EE95nxlnhRZ8W+I3fUTwLGq6snMo9CRsvBSsbezolqwUTn1MmLeZucaYT+9whx3KCcdKm7Xg6ATB2MOb7mQLRDWwOgjOJzm3R6Aqk2820Z6NS6lB7GAkmnVkMjEmgz783l7XBvwfULNcvDKnpCbX2Aiuo2fX+h4ndQkp9y8BoCITX/ApSqeXFd3gFvIslbSPnZQm5gk77W1g/H+0h+kFojZ4Ogr4ByqHGUuj5OgmHUAx9D57vCb0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUBgG+4L5Yc2kEb2nAJHkVdowUFl6e+TOUlNUgYSW/A=;
 b=ULV8g8fnOPjb8XSX/yYIKnFb6vwI6TyoOM6uzBukTKbNtimETpEw82H6KyfDTDM+x4vsielRAWRRAYBbK0Y62AkAuqCUPZc2oEXMb2iHoT3AVmT04loCnZ/pZIK9OeVz5KAcH9IXscgzPoCkUtL0E3UWw+mA1pqNCr+NQV3cMSNj28GH3psnyUtk12kljVYrOyRdyNk8oF2Qz0D3NsBjN9VFoP60yYVDm6wGS47RiTwUwSYV3Nn9Dn7gfu7XnB2hx6ugXZgHyMYnJLYcBmTUllSfmyC8rqni575KpqvhzoO0FPiA/tyQx44k0ON28j0siL+YcfHm6GRh4b3OWum0og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUBgG+4L5Yc2kEb2nAJHkVdowUFl6e+TOUlNUgYSW/A=;
 b=bC7EqeguZsYIp0x4itTQEoRgICuQ2EAAblNdJNkfADevmM92B4mfQs8HYReJNBGFsYawx+e1C6LR7SOAYlRpQFfeUuNcsW7kRkJolPLVF4EjZTQtCOCKIpUY6SwW8/5XWUosXReRG8SlTvAG2viP+u/jnQMBVdC8cKB5SfjbxO0=
Received: from BN9PR03CA0461.namprd03.prod.outlook.com (2603:10b6:408:139::16)
 by SJ4PPF83661AD16.namprd19.prod.outlook.com (2603:10b6:a0f:fc02::a39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 10:37:41 +0000
Received: from BN2PEPF000044AA.namprd04.prod.outlook.com
 (2603:10b6:408:139:cafe::af) by BN9PR03CA0461.outlook.office365.com
 (2603:10b6:408:139::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 10:37:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044AA.mail.protection.outlook.com (10.167.243.105) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 10:37:39 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 1C8CD406543;
	Mon,  7 Sep 2026 10:37:39 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 00C8E820247;
	Mon,  7 Sep 2026 10:37:39 +0000 (UTC)
Date: Mon, 7 Sep 2026 11:37:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Simon Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Lee Jones <lee@kernel.org>, patches@opensource.cirrus.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev
Subject: Re: [PATCH v2 0/3] cirrus: fix typos in comments
Message-ID: <ap6T8SysC6CFtZAe@opensource.cirrus.com>
References: <20260907045331.16932-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907045331.16932-1-hemanth.selam@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AA:EE_|SJ4PPF83661AD16:EE_
X-MS-Office365-Filtering-Correlation-Id: 090a4668-43ab-48d5-3f80-08df0ccc0aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|23010399003|34020700016|10067099003|56012099006|11063799006|16102099003|22082099003|18002099003|12100799066;
X-Microsoft-Antispam-Message-Info:
	ohWce1ABICkKLZ0k5/ZVZGrKUDizWy61Oa9UYZRIwYW7HUaEu6Vjroh9CqHMrw4+2x9EbeCgWPaWCsVEEqIhP2B4pQjhr/FzPMRVwZeTJs0kL1NM5AH+A7+cMvWU1nX4u2yepttzyVPmpilndZidWvX1W4uF2ioygs+IEGLs+gguNqZOANOwNV1C+JJ5LtCoj+W9aFRgTco6prr7izlN3R52nDlWESxrXTVAJNO8zBRBdhXiK+RvJv18KiW/X7DBQl5OJT4EKcJDvKvSr52RPB7JHM2ac8WaS3XFilRQXBVXaDR2fn/nEu7ytnPkElQKwhVXstTStMpzoFr+ySIIh4qxxMAoWcSTLEtvrx6rnIWTIcJOeqGu2iuZYkGLwUegQmPTiDa/rKlvZ/QOxFaCNvr8CPhAW/nfUKmtcyB3tpHLEgXAumftIAjKTw/V8F7mWYEJuzqzVaVdGHfrCq6FJwt2HlMbIjrKd/ICszVvOrUv6hmHsUmY7TfC96DflH8+jjFIJ2g4tIcPgvV7Mzqu3A+WE+94/1y1pQYtLPBOFqE8n+esgyYdjJJvlHp3BMAFvtuxOw06dxXEi2j5OUMyUFQC/fqmSi/TXD2s72flxhRfn6gMQoCzexzGSXkj7SX8PMu334ikir/dcNWAVIUTaDRqsb1TYb7oyUWKLco4inP4QtFAkjL7FVYq3B0p1y8z
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(23010399003)(34020700016)(10067099003)(56012099006)(11063799006)(16102099003)(22082099003)(18002099003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qt0puctyvM0HsvSsf8+pYcBKDMQhVHHZTbZyx/xL9Bk9rg7ZSVeXgq8CcMcH7knKR984DAb5aheKrwAgcojvcJMQ2atoNQyERhwK57mdDVZJFgtOzGheuIsn1m0Q+uFF4u2EMd318JEuiajwQ5SnsJNJDuFoZJ8hUahDPQNpHK+1MZdfKMKEAA8EbzMKKUsH9CfvFrVHuQips3IzjUOMS1uyXRmNO0d13FPN7ni5uiW1j1oIqbrrOwuBfcWpvXzxC2CqPgXbZeOUPh9+UbnaewS9CWH+HYE4+as3l7ZPnjL5+y85qfodM+9wGQB4n8+QnOTDsJAmrR130LY75yf9v4202//AihKk8By4fU+F4nyVHkZ4hDHWMHRUlV9Ven0MwlYDIe71zkBqJouvbSChKugx+dnmbQfuT8ziYyiXyP8WYS5KE/kZMEV02MjaGVWR
X-Exchange-RoutingPolicyChecked:
	di33O4eM8phqvjxeqy9KColU1prmN+onpsy1JCwDDodRtaeS920QbSRaBJ4SSr+OmPK1vGYDeqRZ8LVo6sRENnpGUve0eMV1gPm9dfmE43OlTLcYaHfhazcisfOza6z4SwjvcXB+ZH5bdezehuTk8EA2JekXtET/rrU0vR4NLrDLwjQ/UVGGOWcePotr7EqSF0FYj00ZiQQ9I892ll0IymPtlJMh/84uueCpxaC0eLqZ6D0cKfRyVxO3uMUNV07229+FNkfEgkA7k38HssMz+2qiB+zRJCA52f1d0g41PTNApPSIZGwfZ2YTSOMxpNtWB0a3Zx/PBgVAyukyUkFlQQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:37:39.9489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 090a4668-43ab-48d5-3f80-08df0ccc0aa9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044AA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ4PPF83661AD16
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9e93ff cx=c_pps
 a=4WU6l5yflN7M7T0Lr/s7Zg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=I2IprfKIrQqS0JPbvP4A:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfX9hvdfH6P/AqY
 qqlof84EBkxgGMzgjvrHVEZyHP6w9ikTLJtHwb8i+OxdN3CSK5JIr5FEtI0vTHPmh9A6nZF9Juj
 3n4cT5m6rAbyQTCcxKXQiLQEkOb9X38Uxs+1L5Ogwmc0BuDH+kki8nWYGWsQYbuoILf4P8tkCCL
 3jNYiaVxQHMctVuIv2XIukdyctwJ3PAPJ9lhbSzitZK7xdv7vH4sWBLRvZ81ZDKO4nhl8k1t2pG
 EUyWWsLP7IGmmcu9uk6se/iZZvCXAJMolhs7ym7LbJrtyep1NlTNbT0Sr+4HrXQ5kmAKumAC0OM
 hMTaiGa66+81h9I2zt/CybxUoDO1sYvckYkR1p+ObVjMXWo8xdfhqQGNjQweXJamOg6X+4bmUsS
 V6qnx2dk4TNAIJMEUei695A7+H+FYJXmWgn/3LcQTnVU4bziG5aPJ0y+HVjGRNHxrPghmcSUCP7
 19ejlB0Y6HUXUw/ofGg==
X-Proofpoint-ORIG-GUID: l3venaJkoTprT2JYL5BWLecEABKB5xx8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNiBTYWx0ZWRfX0CB93ht0td4b
 e2bdRh/eoIELcf4Mzex2I/y6kC7UpjYWJFhQNhkESDUb4P8HoBweH2HdlnYYsVbomZrA1oQf1hn
 UVXyTWAFa2aRzGfYcTpAw9oRte5bF9c=
X-Proofpoint-GUID: l3venaJkoTprT2JYL5BWLecEABKB5xx8
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 10:23:28AM +0530, Hemanth Selam wrote:
> This is v2 of the spelling fixes for this tree.
> 
> Changes since v1:
> The mfd patch now carries the driver name and a capitalised
> description in its subject, to match the subsystem convention.
> 
> Only comments change; no code is touched.
> 
>  drivers/firmware/cirrus/cs_dsp.c | 2 +-
>  drivers/mfd/wm831x-auxadc.c      | 2 +-
>  sound/soc/codecs/wm8962.c        | 4 ++--
>  sound/soc/codecs/wm8996.c        | 2 +-
>  sound/soc/codecs/wm_hubs.c       | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
