Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39A651A6836;
	Sun, 27 Sep 2026 05:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790485841; cv=fail; b=dxHCO5hwU8b42eCLkjBBEGHdLWtw5pCOlLw2qwFb6kUIl4hWCVQ2K7PjUm+HvZCl6n7kHXwxF54yIG0pQRpESTwzyxpDB/Ri+97ki8UKhtqh5iYqv8xY6k4g8Dc3CIiol3B9VKsUq+XHNmqy2VICWc6r1rNcnjs4uvqB0qweD7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790485841; c=relaxed/simple;
	bh=cikB2m6I62SoL8T23gsC9Suk3V1H6LcbO5RGR7GfAuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bFFiGpISvlxlAsFPciVyggx0Dn1eCssUoz/8SZdbPpXCWg9Btxyp4SZeN+h2GXKtQKC4bViRiINY7VjivNRxw0IvlyDZ8MWluI82RtKlaJeWxYW7fxDZup7vpH5C28W0obA9I9PPqZbS4DBuwnuf7xNHb9QYwISY83RlRWrYzX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=BwEmS3qV; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=KNGQWtaY; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="BwEmS3qV";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="KNGQWtaY"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QH0Z9s1434644;
	Sun, 27 Sep 2026 00:10:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=PopuBr7+t4OCrbGUwHTGtnB4+qGIpmviqVJGU9x2g
	CE=; b=BwEmS3qVVikq5olwAK+zj3zlRAe7mhWSMoeJSBzJ2VMvn0LzTgFfVSVls
	rl+OXKWlnGVcsX1TO0XekQ5aZpqlsCZjN9hDA7R/qDV91okMLsQAtijV59HKSWiy
	mcMdoLIy2OkU0bMVmv5OW3e5j3Abgf+A2j29O/VgOkfuZ+KtWFy1jUofdrUcasSe
	Vr9ZSb1UVCsDohAPmzeXjwmdCgqVezs81esZcAAZgn+RPt5xjlIlNM2t7fIQ5A+/
	4xIk9rKIxJqZK+CNl0CBpPtfc2gJqgsA5J+LMBGvezl8WIS78tzNg134W8sjPiuG
	3aA2/QmSEMQllRtCSI9os+eLiB6iw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013023.outbound.protection.outlook.com [40.93.201.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gxd0tavcx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 27 Sep 2026 00:10:18 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ70+rqgtsV+SMoaK/FNWjWbThp2pnGtjJ2meaDduKXj1Xn9sCF5PciXgCAbDsYWb5XG6TFMvq0A+kHSpleI9f/KNzcqfzbFrHGwb23FoL+Eeuk3/1WPv9YLAQnVzlTUNHucrvMwwCJ6IFBldpWW1HmSKiT0oCkXgOescxL1eyIHPBY8e2L3jyw9VcYpqo3ZYL5d6ZgKN8pI3CVQxGGeB25YDLUgtKTzljWYd0p6gJk07DIViJGOZqIvgjIpsYzzXSZ5uwEFzWCYfsDqFlE63O1FAGfrFaQo2Jt+P9cBxGLZDzZBbx67um1FPaTKeOBiGpl12YEzclcVKaAsdFYOvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PopuBr7+t4OCrbGUwHTGtnB4+qGIpmviqVJGU9x2gCE=;
 b=ZQZ8+d+Rta4v6A0GCZg6VmEZGQqSkhEBOct3972vBf1nVHYf6D0kShcS1abUtk4pNJnlqVfvdCsqdJ4CuDegKNM8pUJVityDlaQcQaa5KU4ZSUQi2KXMUDLMWRixyemZivltPFHyh7+TRUHYR7va146K1ffCRjsbRbcO3aIskbp764MJAn++6WtmnCMMfnvEfE2iMbq3QMGiJYxvUpRt5tLyzCxsaMREzMIe6lh+a5qr7lWljHmVv0huxXfAeGKfYkBKdHeqdFTl9kihiNuCCZuqGvK31JckighjCFocS62Ey4WkH0RAnHz0MoZyEyoHCdXw5thBQHTd8uDzIjOviw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=nxp.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PopuBr7+t4OCrbGUwHTGtnB4+qGIpmviqVJGU9x2gCE=;
 b=KNGQWtaYLsNG5e53Lwx+Eb/ZHF7adY4ghpCXccfIe/GlgN+KgbjUNxSFoNj0ajrJ2LMSUzKTuheZi+emMeqX1myBOb4I+rCorn/8nGy6HpOVTVub76q+NsOCUjXUf7nb0do+TlSaFMJwM2pt7v8CXN1atv92DwDMhRipka2Onds=
Received: from PH8P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:2db::32)
 by CH0PR10MB4860.namprd10.prod.outlook.com (2603:10b6:610:db::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Sun, 27 Sep
 2026 05:10:15 +0000
Received: from SN1PEPF000397B1.namprd05.prod.outlook.com
 (2603:10b6:510:2db:cafe::46) by PH8P223CA0001.outlook.office365.com
 (2603:10b6:510:2db::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Sun,
 27 Sep 2026 05:10:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SN1PEPF000397B1.mail.protection.outlook.com (10.167.248.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 27 Sep 2026 05:10:13 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:09:39 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 27 Sep
 2026 00:09:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 27 Sep 2026 00:09:39 -0500
Received: from [10.24.52.125] (ws.dhcp.ti.com [10.24.52.125])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68R59XXC1577469;
	Sun, 27 Sep 2026 00:09:34 -0500
Message-ID: <ba364364-04dc-4bf0-87fc-090799a6eac4@ti.com>
Date: Sun, 27 Sep 2026 10:39:33 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <jai.luthra@ideasonboard.com>, <devarsht@ti.com>,
        <y-abhilashchandra@ti.com>, <mirela.rabulea@nxp.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
 <arfW_sncBRNsyP4L@kekkonen.localdomain>
 <20260926144058.GB764757@killaraus.ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <20260926144058.GB764757@killaraus.ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B1:EE_|CH0PR10MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df54331-9dfb-494a-de30-08df1c559caf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|82310400026|1800799024|36860700016|3023799007|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0SLNoHw4Dt0cQn0lvDJbQQ3x8dWnCuUMenWAhwGx4na1bxK4UXtgvb1saF6ssqdgQPe34ZrVN3etxup67ugYTVZgIyxSIvWqhzHJtmJkm1vtUMsSf0qnlEt9AHG2coOqJLtITkQmGCBS/gogXW5ouT1RJ8rWD8qN6DgyvnWnAXgoYN11NqxRnzHUjEjKIjCqAhLLRO6YK/vskxhhFQtSAaxw6ZkHUa6WRGiiCLrEg6atwitbDlv1gDZj3eyqCW06mPstXGZnI5C0K1QuKBZ8zyrSWhblL+GNBPPBVoB4oAYTKJq1LGTgJRUhWV6beCc49CSpZczSkyrs5y7LEtfTXWFPDcFmCj3pw24yBh+YJuYMWzkVk3jlgOjezGbUv4qZzxBGk6VokqHxUb2N63sYWDUNjr2n7m2FXO4b61ludhAkxNItm0sa4zrADjOr3j/H4z2Z+64AWVX80MrkTe5fsv/NIZ2oxZdiV021TXu9sQ8O73/XxQg/jUxID57rQkpItFqQyNvFFlCRrbuh7kSNKYby2LPD9wj9RM1YmZpsUpo65JKQUUOfXeNuhwHHSBJn8mbCoY3uZ59yNKN8AwaWNxQley58ad8OksYOqjANY6FSHT8SAOpySQL1juf+Sq3lstRcDUb6pbGhSuqV8F0M4Uf7Yf0USFHUKLo6ZWDqfAy4viSk0jbbtcRKsnTVlpJvH1QbLmPX19Dr09N+xISKyA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(82310400026)(1800799024)(36860700016)(3023799007)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	w+qiXzyFxB4+HkogJbY8eDVTgiXslGffv5vgirY/iZSYFjHfpTG85Imvevmh0tvqu/kjVDxVJ8Gf70yvbBDg0gV2tm0nBbl0XYpXR+YgRyu7GupHMpE9MS2bX6O/SdbPLg/WSCVYDSxgDTQ1zeAntPCkFfxdqfllQfXHeorKajZF8aJIggOW5UZ5nqEMq82KuUxTkihevqRx/W+nxr04bzQ1N9C+CkhxzJDUaxdk5/EOtVDS8NYWXw/kzpxxF6GHIkV4x8BbkZozkmWAcjk4aY8rjsX7XZFSabj81SxQ3WwWcaK9J0n64CD6DCXxfxFUzAqNbhaYMzCXGl/zctgFYKg7ly4i/1lH9fZ8rRs3Qn+rHJokMAb+0YaZvn5bySfK1uOj6UHQvwYwm+xj8qdVuJ1abIhXHL79Oy7J0t5QmUVNoqTz6krvpwreHViiF/To
X-Exchange-RoutingPolicyChecked:
	hAAaN9QD2U633RVWSZaA/h17OzfTZWNURR9HsMiIOfB3QLC1GiBH/v6kiCTX+I6Y/cvQeUsgw3wL1WHiIQJL9yWJuBAJ5y2zYJRN58DIapVP0dcEl+fmcsWjzk+JNf1uif6GqgI9DY5tFJ4V5qyh3JxHXQAwhnT5EMKs8x9UCWQdxjcrNj5WkY+0q06tMbAISNEgW4y1G8ww/OKpqrVJtg7annQI2GR5RwrLhRGhDFvib+2BYCJcJ37X+AWnKZLTQck9w9qkVRrSBzJCPJoa8XDcFkOWeXDPhrwC2fzF7xfRg0Wtb5UXA1A8ehY95snJ7mvGGAIGCUlpYWH2uPp3qg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 05:10:13.5820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df54331-9dfb-494a-de30-08df1c559caf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4860
X-Proofpoint-ORIG-GUID: p9SgUQmBiM4fTSKLRHOp8Aqujq7pv7pc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAyMCBTYWx0ZWRfX78IUwHOKGmbZ
 gFxBQSwLMdB0lpjULf9KbgQIH3fqyAhN0DjzIF4dCSYKRYphkfZ46ailjiDU7XPJdhMobYDs5hG
 MRBG4ePuWdDFQLli0boHmpoWb4r6Q8opAu4qwhNloymvoLzslbbm2RGvt9aO0nusDf3W8ZVReof
 +tpoTjQDn2V/W2SMzRGcuiCnstISYe68k2JrJz4sd8fC5HBcHdKivBhKEy01A0dau2Xic6WTuH8
 FT4CTu3vBJSBuTElZT1cA3+cFjW7Dz5nq74GGec/rjZAi+9V96mHkLfogVLAs2xfZngpE+YYtPt
 bwMjyM0WraeV0rXDNyAIR6fiXN8NY+h+xErtFS2MAqI7AyNGbLNKj+NT47QqzPoYm6E1f8dm1mu
 mdC9PuA5xLImWaRmhkBWm/mhLowvWpe16D6VXMuToQje7HjV0K1ykkEKPlCG2NXMvioU3W8JreV
 Vvj144epxI5h3XnZvCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAyMCBTYWx0ZWRfX2jGAKdbW8Lel
 MTTDFzu2NKUevGVrplmx7bww70prBYN3KSIepjRcMunD0HvPqaOky47XlvbPEdDVPvfDEUNHD2D
 QqhOqhkp3qmH2YuItHda75pC3eyp2eY=
X-Authority-Analysis: v=2.4 cv=PflqFShd c=1 sm=1 tr=0 ts=6ab8a53a cx=c_pps
 a=lrInUZDIVE0OTqvzw4499w==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=xq3W2uTSAAAA:8 a=sozttTNsAAAA:8
 a=YkQ1tcVKKs45h_TW7hsA:9 a=QEXdDO2ut3YA:10 a=P5L7wpMTXyg1GfFA3Gwx:22
X-Proofpoint-GUID: p9SgUQmBiM4fTSKLRHOp8Aqujq7pv7pc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609270020



On 26/09/26 20:10, Laurent Pinchart wrote:
> On Sat, Sep 26, 2026 at 05:30:22PM +0300, Sakari Ailus wrote:
>> Hi Rishikesh,
>>
>> On Fri, Sep 25, 2026 at 06:59:55PM +0530, Rishikesh Donadkar wrote:
>>> From: Jai Luthra <j-luthra@ti.com>
>>>
>>> Some camera sensors now use an expanded CFA pattern to capture near-IR
>>> light along with the visible spectrum (R,G,B). This allows capturing
>>> light in both low-light and day-light scenarios using the same sensor.
>>>
>>> Instead of having a 2x2 repetition of B,G,R like in older bayer formats,
>>> here we have a 4x4 repetition of B,G,R,Ir where the number of G pixels
>>> are the same, but half the B and R pixels are replaced with Ir. Thus
>>> instead of having 4 total phases, we now have 8 total phases or
>>> re-arrangements of this pattern.
>>>
>>> Co-developed-by: Rahul T R <r-ravikumar@ti.com>
>>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
>>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>>
>> I think we need to use the common raw mbus and pixel formats for the
>> patterns that have IR pixels. See
>> <URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>.
> 
> That's right, we shouldn't add new CFA-specific media bus codes. They
> just don't scale.

Okay

> 
>> That's mostly pending on userspace support now.
>>
>> Can the sensor output Bayer pattern as well?
> 

