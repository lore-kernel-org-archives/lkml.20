Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F32511193
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788862967; cv=fail; b=THfoQKnH74HO1d2v3CnYzkh891dABDURtGtJADolNwUBEDI0bViGV9BBWOV8vLZwF1rYAJvEWBagtEWhVAo4rXf/ehPg+7X3ZzMhF5oL663we1bWac9BTBvL4nrjl67sA3mVGz7KqnOoPZj3G2Jd89vNXebrkzG8oFVD3a35efw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788862967; c=relaxed/simple;
	bh=mN5DQRaLrcAPQwVanx60dJd1pJiZXNSN5mv3+uqixmM=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqxG9HRAHenizMCeZO8n2VwyAgiQlMDl+7bXmHYFQr0+Ze8qRpfzd1ajO0jPErqAdmSr6vKrI8pFhWwxooWJqFCfXelAoEml8cK5CYAtWWbf9/GBGMcCxpSVTc+VDbY4A/FloXP4FoJd6r+VXSx2yMtqp4XSqc+7bJqVJe7YsTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=agzzyLB0; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FVV0M+6s; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="agzzyLB0";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FVV0M+6s"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688AD9SR1690418;
	Tue, 8 Sep 2026 05:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=pfa/qE64Ztz0JsC
	vEQpVzwmwZTFqW+vSrfEQl1xK9oo=; b=agzzyLB0qcl9vDfQRm+N1R3X1I8pZ7m
	C0zT6flV+FocVFiaJ+V6bD0XR9FYfbyiqT0KP5Y2I/qd9z86e99oVr+zvDfFSCzR
	zEg8+fQsvmHxoFx6k/gDbb7CO4UmTu/uQQBZxDb7j0CyjcfnNmxIAkY8mL/r0x4g
	iso3wHCIqmN6s7ajrR7QFi65KNIeSzOz34samV1/qdg7NTQKelEkkFIpgGz9xcKz
	uzyqoZqOun+0O7LXCDp1DZs87AL2LbayI+npKEQlwL0nBmzL9hArg+osb43Rzs4o
	xlGoDvLga3Boc4pMHXRUYppvbNjWyMK7Lbi2jmkfxuohXHQxGM5epiA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010015.outbound.protection.outlook.com [52.101.193.15])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gj93qacjf-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 05:22:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=we24aLq9i0eFnFmH50wHN4Xd8woQB7CSRVehPtk0+iq/5UXwsONdcljhwLTxFNaYwEb+bLXhrI7FLuHGZNBqqXy+YEv3H9PAMtDqVr/lSNRX/NPyrr+LqugbnCdWq0EXDP7jFRncEBkE9B5gSX7HQQM+oo0BB4CyfEjkjg0A7kyjhZkAX/h0BnvgScoh9nbmAM9q9YPkI7l9xjFb2GFdES+TYM3Xy947OF824qpdg8Bvxa+rKdAH7q1q0wKaOIMRuHBq5PJGyqEzs+otZTGSqx2WLcTAi8srxOKYN5wxG72SbZCcgIAUtD3tkP3bYOQnX6nfuAZilkq13wcNjg19Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfa/qE64Ztz0JsCvEQpVzwmwZTFqW+vSrfEQl1xK9oo=;
 b=Wk6ddcpqRuvUc8GSkD4aP5iA0MtkKWX5Mq+2bQ98H7fOibSLjeK869CXz3ahynadpzm38THjE5rrV804bLu2nFkTG2HOQvuraDczssw7aZ5aAYGU2PTuJNvAobbZdjrs1MhvsWLa4Cv9Z3eJm68qk8fgZHnv5g8fP1shrtPBYtt1i+BtSxCAMbRC5V9mrq+ORuqXshQiMO41M5wt/o3MntIRCSQpqODAIp/0UePu5hpJ6831lTQAFfHr7+aXEL/BTQaYYH9fYuMDhV0k+mVfUbb/ypFplF1fnSn+2j4lGBUO0NwvbAdANfZmkbLdxce/0Xeufzf4ggUO3IhTsAuOKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfa/qE64Ztz0JsCvEQpVzwmwZTFqW+vSrfEQl1xK9oo=;
 b=FVV0M+6sFVQQyHYxR2ov2PPZBIIBgYXoKzCwqzQOVaGp/ZkqUVyLDPLUj/Tpe9P9QYSLwZP6ZZA6NtjXEiicFHtHi4iE2lJokNO4nTeIo/kG49eJeofesShrEIh+4tpn6szSrgIhCRdqX4MPF2YZAK0yPl8HgULwO6gLxvmqIIQ=
Received: from DS7P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::14) by
 MW5PR10MB5874.namprd10.prod.outlook.com (2603:10b6:303:19c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 10:22:24 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:8:25c:cafe::4) by DS7P221CA0028.outlook.office365.com
 (2603:10b6:8:25c::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 10:22:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 10:22:23 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 05:21:48 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 8 Sep
 2026 05:21:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 8 Sep 2026 05:21:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 688ALmVB2276813;
	Tue, 8 Sep 2026 05:21:48 -0500
Date: Tue, 8 Sep 2026 05:21:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Hemanth Selam <hemanth.selam@gmail.com>
CC: Santosh Shilimkar <ssantosh@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] soc: ti: fix typo "accomodate" in comment
Message-ID: <20260908102148.l3w2yusfpb2djvqn@manicure>
References: <20260907062247.9994-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260907062247.9994-1-hemanth.selam@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|MW5PR10MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dcb8742-c520-4b9a-7c63-08df0d93128a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|13003099007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	qi7FHAbSIKhV9Fnurnx/sBts+dijCEmZt3nnnmX0THCHARFVirGtjHjaCJ4ylYUSCxZZuoSAp0YZOwaqZr7zpblT6ThIrvBfO9GHTFZi+aSWukdjrVxhn4fJ4pmcHbmM9ZUzVD+hZm92wXWSntSMDsKNM/oW0L4GeAuM8Jx6eVcyLbGBX0vVBmXnwPpWnGoSchsMQdTXFb1Pf8kkbK9z0YgM37F2nCv/bOd2Lyoz+O9QT7pFTkikpT1mCSqyvRWjGtJxK8uC5YnkLFwoyAWcyIznERaon2W8mABK9pkTIuB8Ly1LqyfiM+v2bDklhfxiBYeKy+gRNzXugBRd9oGcQDnoFP1ONnI5NVKmj2TDu/itwzcsJ4mnOcqfxDXc/R0s9MA06yeRkb9pCIlubTvOy3TMiBFEOIkPSBFTaYNzts41JIhG+QgKGdaneMAbdZgDXGm+FruALKGTZ4sEt8trg44xCi4dfAqu+n/HOp6HdBmcus3GDWHFlPtQ0eCNLdj4J5x5Lj3MfYE4Sz6YdekjRfKQviZuJfkjCzaN2I7fRLE5LJp7xN4DoZJjhdFLB6OLZu4LzbX6CMTFaJHmF/nOfiEVFI06/vSA6HgECtL08rOqXvt9RYMqEI4e4iOv8bwj7w7JXRI9krIZB8Qto1n5xOrqSx3XOKHL42QXRAz3a9jG79UG5+rPOIaOA7aVmv7HfUV38oOR16f9iAbaElU1DA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jFsqMav6JMP5u6fN3GRBVYqf2+IKN+PLDEumJVay0lfLAhlEEW5dm27Qx8pvtTzatp9N1Ai7Tr8wJc4s4VnWtqtesI1ZTTMaNYpsIs2Ae0JSGL/hbicqgZLxcv3fTxUGkIM4Pm3h/KnPqiCLkjNgEcLLAGaYO95KJ4FzZ+UUm6EuEHyrCsfSfJe+T5uedzhriGUi9No0YaQRBuYWzqdiJibW5jM2gbXm0yO+c7lm2iHKbBd95yNRAh5SLkNjIhTm3KpEJuJ3dAbWAP2lA0IZPFyKznvXkRKqBHYyKNfaBl0eWXz8hnYURJanHXMlqEptcvsdx2r8rtaYcOsfgNL7OqcxAUf1SSbyfClbRNTE+YtcljZ9Q4Y+9DIgqjRpuPdTwKSAOjCon0aG8HVGxwFTTC0V/M5b7NGj9k6me+40qFePXn2qr2pwfzPm3PilaW2X
X-Exchange-RoutingPolicyChecked:
	uWxie3vzQ4gLCn3ouiCveUg8JGmobY/vc96wkSuWDrZOjlD7MU8Y3RZ6pKzlKKahwVYkBCRVaup0RsiH0qHIqM6k3TJIYk1V3WPlmJchsSW7m44Hbx9jYS4CouFUeMgX1JdwsakRCM/1QWbTZQ/gZoQ+IBnE+aPwOeGO9MNt9+bBVTAx79wGFwb8rHBzZzhdGM5sLuKfKzt6cPCVplMbb8p6yW3YX+Br5WtGzJHjETyn5vyPW00cH2If281R9QC3+9pl3jV2OAKLf8YA+6LhcqWV4wuOnNi7TM4gabCIzfa5bj4Wo1/0pOcMJxHdfZTwYAjMnMAwADxugqZ+XEIiQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 10:22:23.1360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dcb8742-c520-4b9a-7c63-08df0d93128a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5874
X-Proofpoint-GUID: m5ytrSAVYRQ5ifYKV4RTLrGEJnYjZg1x
X-Authority-Analysis: v=2.4 cv=FvQ1OWrq c=1 sm=1 tr=0 ts=6a9fe1e3 cx=c_pps
 a=7hCjIaGjES2TrnZcIlaVSg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8
 a=Pix6zFMZXj9NgltOl64A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: m5ytrSAVYRQ5ifYKV4RTLrGEJnYjZg1x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExMCBTYWx0ZWRfX1+FutptDhiEK
 mIcd/eHD2qdgcq12MNEYuH2wTQFP3P+85WuHJ2aYzuE+cY0fdAGaw8kNDAhZgClmyjclxMIyvdr
 gn14X/fhcIi5ICVpJWATILv8HA3mn/Kilu4gI93OQYHYx3as4kFzhk86Tm/oGtlngID43YCll7J
 QsAsA+sbUDyN1EC0NCAY6ejVKItQM/mUxv/RgotEtjc84eazOyfonsh/GmAw9nHyg8fpGhNjuDV
 +xuB10ILFGTkhL54sHdlriK1kSmRhjxS6x2te9ahO8hIrkXIIYn0S1N3qlPwuO62msa3KHaGV5D
 Ngsc1mVgwhlohc0+kcNBwUKJmdsQrQNF7oV61Gdcc82BJojjrOrK5KR14UFG8+lMQB6vRL58knT
 H8wCfS+EM5z2Ku/ItFJTtWl7AwNDMTPCWXVp4OtUtMQZOaD5VeMNny88EClYHEgos/0Bw2s+X2o
 +wRDHXqEjx0MXiPYK8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExMCBTYWx0ZWRfX0e9orgJTWAOW
 4gB/f5lq9CDfTK6qcvsT1IffZiDTFoBpmowKclWDVe/K6RXRuh8+Q2Jes/A1YTFkOSXrPp6rC+D
 rOXp3r+ZlMJvmyZfYnRctEGv0IYaN7k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080110

On 11:52-20260907, Hemanth Selam wrote:
> Correct "accomodate" to "accommodate", reported by scripts/checkpatch.pl
> using the misspelling list in scripts/spelling.txt.  Only touches comments,
> no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  drivers/soc/ti/knav_qmss_queue.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks for the patch, Please:

Follow the convention for $subject per drivers/soc/ti/knav_qmss_queue.c

If there are any other fixes needed, please do them in one cleanup shot.
> 
> diff --git a/drivers/soc/ti/knav_qmss_queue.c b/drivers/soc/ti/knav_qmss_queue.c
> index 3e4041454f69..8aaf79495238 100644
> --- a/drivers/soc/ti/knav_qmss_queue.c
> +++ b/drivers/soc/ti/knav_qmss_queue.c
> @@ -805,7 +805,7 @@ void *knav_pool_create(const char *name,
>  	}
>  
>  	/* Region maintains a sorted (by region offset) list of pools
> -	 * use the first free slot which is large enough to accomodate
> +	 * use the first free slot which is large enough to accommodate
>  	 * the request
>  	 */
>  	last_offset = 0;
> -- 
> 2.48.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
