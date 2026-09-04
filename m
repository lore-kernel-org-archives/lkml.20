Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D03C5856;
	Fri,  4 Sep 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537629; cv=fail; b=bEZVxkpzxsFG4fwB0pF43UWj0DLz72pqvMX2NAfkZ5JCMQs8VdH2O5O/DSdEvfvnEnGUDfE3d52s/zTzT5DgYi1cMQR1HslUnxiwLXc3dIVkp9ym94QUooyRtr6uyDn32FxCt3LlqP6fciz5PJAt0l0u574+iy7gawUg5se/qXQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537629; c=relaxed/simple;
	bh=0keP9G2C7HYlcSSm5ZGovc4Y8rU+4BrCr34kPweUaTY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e/YvMEZPsNT5sBolcPfqtcg/FHX6Vxg9GiqSkMnU58oAWzsoHGrYQQouPp182XHSFq+WwijeVwEcUsSzopQF3eCqcsRIYpGg7sV/U0w0V4cCWmCH9HY9EqEVs3YEb5f0RhKzkxEAzT0Wvxt8faHjxbTGb1cm/F59PnkTSlYdJ88=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=hYj78/WX; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=euY+y/pf; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="hYj78/WX";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="euY+y/pf"
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684Ftpvt3921868;
	Fri, 4 Sep 2026 11:00:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0pFhoRam8KwzPA2o0IqfU/PC6jFKp/MhTwt0g/4id
	lA=; b=hYj78/WXR+zmA+S6ZtTClpSKlLs+fqDIcIcESq0t7vleC3wifBoWEsQFl
	u2Fs2dhOUBG/x/kNXdQejxr+S7TY2WUlmbwhT5z00hIASwiCtV43DvSoCqmuix+3
	GeQKKuMO9s3l6UY6Cq50YF8/fXGzgdsYC5nzR+ZIlQE3F1mXHQ6ETg8XPeg0yTwj
	h9aNMpTshjwTU31ffQ92dnc9Wicl6b2CHd987onVRGT9oDxZLxId/SAAHlEnH/VW
	sz4/kxza50ertrS5zPBn5OCGkZF+fL5PTirMcPOl3Vg3WtssjesenZy0IpAX4EbU
	9PCcStx+eIA7FRIg24ENJfA+UeLMg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gfyyq0mpg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 04 Sep 2026 11:00:03 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhWi8kz6bfiYbYNu0pNT6ZFdf+nAFhgvxl+b87P0ptIeyttetwPVf46hy3kDDcmEFdvd8qqFvQ7MYNhp4nYxhQGARjY2R1zt858tqBgD3FW3Gehz3YZTBx+8hspCLnUlLx7cJrACwavcIK7C3W6oeHMkKySKnMMMXzx5AbKesEVng5BFVH/H6ixZ6k49UVOLiZKIUHfv7ftwNXpdve7vPzc72FNQk1F/HUDln5cwIps4KnV7vxSZgZAKMFt6lgb0EdFQw+YBQNbndurXg1jdRvu1S8FBkw75ZOYSeEz4E4LQzrX0ymMpua1axQ2Y2HeRWeqpVTnAM+ArnCZOfMrgPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pFhoRam8KwzPA2o0IqfU/PC6jFKp/MhTwt0g/4idlA=;
 b=O38oOtLR67z+H5arG1EiQ2lTqSYVj5sNoutZJHVO7t0fgOqKfHUsMvCVVjS6S5cy7UAZFhv4J6Lf3MEsj0j4n4MsIg1Dzm2qRsATGjT2cN7UskSScBi/02VBgtQmn7THOcdSt8s7U3DUjzsrBKMQgFLZ9WjGShljVgO6lk/w1QHjnE1w9OEq9xckPxh2bOiV01eBsno+G7lElO/xwHJCHrj3eFx5KJezlh7YF5/oaseF5hNerAVaP12Iy9044hp/EJz1pDCCbXCMGS7C9tGXINZE29WqhmQQQc66c/D8G5Uu+TBYEr14zt9NPmW5U/HCE7koi3FPjlcWbwJD6l6Ggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0pFhoRam8KwzPA2o0IqfU/PC6jFKp/MhTwt0g/4idlA=;
 b=euY+y/pfaJbpFZ7aotpOS2+cm2JPfQ3o9r3aunTtEAsMiJ4N///K83jG59i1gc1GZsQ+qjljpKohroz55uh/f7nbiTtowggvg4nqbnqglvHNvRVKvbEA+uuDT0RWNp1LP3c5XLM/zY1dnlR+/t1zKdYODH0z1AATSuHOSvrTvDk=
Received: from CH0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:610:b1::20)
 by DS0PR10MB7065.namprd10.prod.outlook.com (2603:10b6:8:143::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.4; Fri, 4 Sep 2026
 15:59:57 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::75) by CH0PR13CA0015.outlook.office365.com
 (2603:10b6:610:b1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Fri, 4
 Sep 2026 15:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Fri, 4 Sep 2026 15:59:57 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:59:41 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 4 Sep
 2026 10:59:41 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 4 Sep 2026 10:59:41 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 684FxeKx3780170;
	Fri, 4 Sep 2026 10:59:40 -0500
From: Nishanth Menon <nm@ti.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Ivan
 Khoronzhuk" <ivan.khoronzhuk@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Bhargav Joshi <j.bhargav.u@gmail.com>
CC: Nishanth Menon <nm@ti.com>, <mfd@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <goledhruva@gmail.com>, <m-chawdhry@ti.com>, <daniel.baluta@gmail.com>,
        <simona.toaca@nxp.com>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: (subset) [PATCH v4 0/2] ti,keystone-devctrl: Convert to DT schema and DTS cleanups
Date: Fri, 4 Sep 2026 10:59:38 -0500
Message-ID: <178853756367.2995941.13597621016722983915.b4-ty@b4>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|DS0PR10MB7065:EE_
X-MS-Office365-Filtering-Correlation-Id: 721e8005-de97-4f48-89f0-08df0a9d9133
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|23010399003|82310400026|13003099007|3023799007|10067099003|18002099003|56012099006|22082099003;
X-Microsoft-Antispam-Message-Info:
	+eLim5gzWhMBCQIoNqtTzVcnTdSAT0ruQpqjb5+DKsdyX6VKmgx4ZwXhrjirqT0ivkXPnLy6zwMFmmC8BsgH1I55ppWSHDGzvj6OShhhsocmTmgMiCEkXDMjnIBGAh2aYh7gFUgvEh9wP3wEyS5zowLbp9AGZCTfpB/8UhDcx91Ykt3lFa5a+Q8qHAmdCuaKq0wG1tb/OzYcfSe+KPqhFoM1UUpxvFV/1K5BEK7iRcGfgkwhrxeNIJU8q1VtC69OYA5tMAZcy7rtPs+aVvLfBsz6+KEy+mlK4gtfV0BBnx830tHf9Q8TFz2YfFll8xCwNuvqurp3qDDwGeWP/xZg+eYNcsTw9eIsCQ7T1uHVLGGzZfbw6p43JI4rR3U+NZ786SAoG5c+0UmXecJ9qvY9XSxT1dV4BjWEU1T0tYqXxjwwCwXahL+aqf3Fo6CC7QQxR0dGelOeFlfiNT9oyogI60pR1VXDeg9SNsVQqDDXgQsXmaKxdvNOHNM2OrlSAZG8H4nyy5VrG0b9FQrmApOx1d/+y1/IFV/APPtsbndzLLWTKj1QZKdRM+lXeomgJ0zikedcY1S4N90r5BRdfHNwYIJuPkcLzJgkXxqSAfsIJRtEpzfShirwCtS1OYnsZoyHNphKO9VUq44Wr4SgQbgJtKgeqF+oYDoDIWEUP2KMBB9DaCpQvEJlICTXAun/LZdvOpYaWR8nf8/hpbqPxLQmHw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(23010399003)(82310400026)(13003099007)(3023799007)(10067099003)(18002099003)(56012099006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	j9kUkbURadOsGpN9FVinb63riFbbaeHxIYoAZ+ldyakY3cPTOvYeh3r1PdXqMIqJkftPRw9uEmnaES5rwDxBQgt3np4ZwixC3wxrsbY3Y6HrOu2qCE12aFxaY/kfP5ZtGh2H91qzn9XMelraau2cd2AW4qUUC28wOsQa0itHXsmu5PVGak13Sj3+HREwXIIWN5ro8YkLSApsQzM8hzvKtSOuVC79r2OaFox1rU7mysbXY2v4468MGgTKdRIQPzQ1yLHMyj599oJxMGW6ukiwpZMVi3PZ4msDiOHFME5Tfudu1whZFCS1ZoouRzLN8JuwzknI005h1eAuzX9IR3P/3uP4j6XRbtQiAVosPB4z+sXRfQPeCFC0BQ0B8nbEEJ10tG3kNatuI98ak2ErsFSAzs43TFfBVR0x0X3r7F3nBi8N4wt5zHvfO3aMr3VgIOyp
X-Exchange-RoutingPolicyChecked:
	BVUWK1eGsNyqdcDuf+Hs09UErTNng3cHpwLylOnltdLpOBNPi67IbDdzhK0pXeaTE7zwos5nitjMwhR8Yurv8FplBQsxdCpnxPpAEeUnHcLVGXf60rBQBMsSrVPKVn1PbxXuHgdvNhN9uqNxsR5gzv7j8SXuZ25f+uOBBBGxuEcg5VSLDprF786Ibkmn4mGhtEd6keoPdP5PNEU7YYoGwm2XIQickr4I7v0Ak0ai5h9XCpRhVYKhcLpYavqW8JHLfpuNj6PB3CYDaubHsKXWtPcRshP+I8lmtAlNzAPBflqGVr4Xz0CS/vJREHGhQeUu5nf9i9d/0VZanxY7j4cQ+w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 15:59:57.1114
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 721e8005-de97-4f48-89f0-08df0a9d9133
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7065
X-Authority-Analysis: v=2.4 cv=AfqB2XXG c=1 sm=1 tr=0 ts=6a9aeb03 cx=c_pps
 a=qHW1pi9L+1RZ0SKNcL3CYw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=o1kACPpZKAZCWsj7fAYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: -w1zkFLYejLZVMPTzZHZplQsWfcjFbYp
X-Proofpoint-GUID: -w1zkFLYejLZVMPTzZHZplQsWfcjFbYp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfX8b1lwlWPfD3/
 iEFLtjkqSLZb9/if+UVUyOvFc/kcAWlcFazzh1rLzF0Mk/r2d61zYVSv0iRYEFKCsbtQzSNXQY4
 Jghsmx+jFh8BBuHJqBy29AMZC/0E/z40J1eFoXNCLQ8QUK1GE/AlbFRrd9wihOTv0fHScq2eo14
 gTXFGrZzrl1Xl582+L2Vg2a5M9aZ5dAtuiFCJsz1LVxTC+lEg10V0zgt2sWA8AvGftT5zPzrw7m
 03lqUNWFNTUS/Mi+BCC1/WfMC+TqDIszbV7oJbEh4DWp6RDT38Eg5zB5PGlEOb/JnACv3Vyu/TQ
 YP7QK5057Tgc/hpVEBRQEGTqeESo320A2tFotgXAyTtcACJ9t+Re3Z3skDTQwTqUTi/s0+idsUj
 Tf4tjEFtpV7AnqgZVBekDQDKFbn9InhVHKaPXacY5wBNfHTI6amLPmFHVW6fCa5VE8jlhWj5BiF
 boEWeXrJEc+wxIZ7vnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NCBTYWx0ZWRfXwOtjPZ/lZQiv
 w+1oFRLlcpJtkfbyCqOfDb81Ps9/EOQsNWbSrUXCYMru0YLtMBup4OK3zWCLYqaQBJ/lHKrMcn7
 MBl4DkDy5ZuwSueoRiVUHNXK1JOflHg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1011 adultscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040144

Hi Bhargav Joshi,

On Tue, 01 Sep 2026 05:08:11 +0530, Bhargav Joshi wrote:
> Series converts Texas Instruments Keystone Device State Control binding
> to DT schema  and aligns the existing dt files with standard naming
> conventions.
> 
> Patch 1 aligns the legacy child node names with standard names.
> Patch 2 converts the ti,keystone-devctrl binding to YAML schema.
> 
> [...]

Please note: Bindings need to go through appropriate maintainers.

I have applied the following to branch ti-keystone-dts-next on [1].
Thank you!

[1/2] ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      commit: 386cccc12a856a376da20ac9e93827ecd49352e7

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

