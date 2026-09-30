Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAEB4EA39A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790780714; cv=fail; b=SuhmpKohKnhy8pFt9XQKZKw2vOLryd9appAL+r/i3uLhQUsip3Img6bdNFZv/I6fuBLGzzrTQVSVuq5rBemr4VkraEgFxDLTIDQ2nE3RbFCtLXQ+47ZLLoItCujBACtWQuSdrjQhGr9UO0rejVZhASKi5s/IVx1i3oQl2lf/BL0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790780714; c=relaxed/simple;
	bh=gXodzmEkXfM34Y58w4DUdjF+m3zvGXZZy+7cA8ys7ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=GhY2HpYXPPV4n+BplE8ZNDrEdz4Vx66uecYbPHaxjJHzDZaEQbyvLgUVcl8GRd9Tp+xKyL8+je5QayB49Vb4j2C7Obivt99rTAFvKd7xFJ99KJN+gcJ5BMU6Pq915s3p2M7GH/xwdtM4tsOxS/2LnjJuwyIhtnax/Chs8mAsFW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=b1HwrC63; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=PyHTLQdK; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="b1HwrC63";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="PyHTLQdK"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UE1V3u3890152;
	Wed, 30 Sep 2026 10:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Ba86riKrMy3lgmhBPNMZF/R6oHh87DHA3usdFj+RU
	hY=; b=b1HwrC63dN/d3zay5U8cjY7LXy/as3Lso95mjWj32ozIpaaexHHL/D/qq
	DfukEmP5N65Us4WVpyhAuxV+31aWgRJgA/RAakee+unbW3xPzpplV19doR3ZIlXT
	/DAeIR2cLH8gghIiWnXtpkSdF8iRb2tbbIaM3AWsNxlAYkPjbz9gjbA46CVaveP1
	nxoab8vB6Z9h0hfnqiUbKwh4GyWVkDyGzeEgF8hiMVguMJ6Fv3L05Ek7chMtzO3M
	MVzlRk+4Xdof7j5dJtKmU/yYk+DW0DPpNAfd/BlTjw3JJD5xNgjHMRA0crJ2jwGR
	c9sxQEKPm9FjGK5CwlJd6eJDwjGqw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013036.outbound.protection.outlook.com [40.93.201.36])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s21kb6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 10:05:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cp5BfNp/t8J7LA7zj+82zmi5LbO6qaL60R8SU0WOAAsYM2SG4uzCSUdfPGM7vJ2Xb6A5xpfSUsbgAoM8p/g5VndFc5WwW8hJ130UMw2wpV3+6eQ1UdQ8p/zoB4JXmxr/+G65AtK4kPJLT72TUvHaiOUp8jeNGcQ3SQuhWhgSy7rWMxvBvcPv8/Yx7mIO6wEZaiu1VrgtWEUC52VZMqYjepQ2s14+jGfbXyGI1sUAMPHMfR2848e3dRBi85BYFO+A+vNxAeXidRjnM9OYsDFoEVfLAVri0uER5Bz4KblLRh1aDiECefUeTb0EmtjKGbdHSFeVQ38PhhZscHtEtyoUsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ba86riKrMy3lgmhBPNMZF/R6oHh87DHA3usdFj+RUhY=;
 b=JnmLMwH+45QPCXrLz6Ke8QYGTxTLcJw6wMJymWs7eE4ZoA0ArLntabDgVvsF2yBhi+XP+zgy+JkOudSazo82EDj1JtiP8yhl4W76PxC0ph9FG3yFqvZ4Ywclmo17bJi4hcPls2GMhF6VDkUnKh0T6n7JUVHqDW9u2Botw2PiW82aeMdJ8eZq5vXG4lyLM+V/fa64uWDyy4ia4HP4pkBdfCLoY2skGasiSDiuuSXpncwZqLTAuDATtVMsY0rhKwk7fqJmFV/mIcQPaAATHuhkXJ+ACVfvGXrwcE40bEnv3PyYzBn4+QeW+rDS6h2wFMDjfevtJiE+Re9SLWaUDcY/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ba86riKrMy3lgmhBPNMZF/R6oHh87DHA3usdFj+RUhY=;
 b=PyHTLQdKPGm9J8v2hP/nIyoaAwwHGbd/sO7mpwKiN2A+jDTdN698XJn7LofdkR+QAhGPGaKI/1DVzRR4rex2O+/nrBGD0rlLZMk0IQBXapRLGtBPr7eBWw50S1TcZN2oLzhxdeFpFQXTeaANAkul+zqaY01aMPI/URuAB7GSxZA=
Received: from BN1PR12CA0009.namprd12.prod.outlook.com (2603:10b6:408:e1::14)
 by CO6PR10MB5650.namprd10.prod.outlook.com (2603:10b6:303:14f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 15:04:58 +0000
Received: from BN6PEPF00000071.namprd03.prod.outlook.com
 (2603:10b6:408:e1:cafe::6a) by BN1PR12CA0009.outlook.office365.com
 (2603:10b6:408:e1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Wed,
 30 Sep 2026 15:04:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN6PEPF00000071.mail.protection.outlook.com (10.167.248.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 15:04:56 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:04:03 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 10:04:03 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 10:04:03 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UF43T9092155;
	Wed, 30 Sep 2026 10:04:03 -0500
Message-ID: <6ccdd04f-884a-484d-8b56-21dfd07c691a@ti.com>
Date: Wed, 30 Sep 2026 10:04:02 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mailbox: ti-msgmgr: Read exact number of trailing
 message bytes
To: "Padhi, Beleswar" <b-padhi@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>
CC: <u-kumar1@ti.com>, <nm@ti.com>
References: <20260929200159.4033010-1-b-padhi@ti.com>
 <20260929200159.4033010-3-b-padhi@ti.com>
 <170f362f-b64c-4b6f-9f74-ccfc4cce7d9e@ti.com>
 <de6aa05f-2226-4d7d-ae95-4da24135fee4@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <de6aa05f-2226-4d7d-ae95-4da24135fee4@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000071:EE_|CO6PR10MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: ba308fde-0805-400a-1921-08df1f043082
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|22082099003|18002099003|6133799003|10067099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	gS7S6DSjyVNNV8in8NSXUul6Ku6xJ//+ztgHUpOfJkkHIkpqFiUXjo7pS2dob0H9eIvV13x2z/m1va02RgHQArc5ruhCRkTM3pZr7DN9qtW2sxr9tlOdwIUJQ8qxroj2s5q6knl7ilO+BpLDkYsqMeLEkMG5RT2PMlfvI0JPaUeSsBEruI/uLXv1Set04U/2kAwbbV7Nvom0m0oX20tJP3qdUGcDEcSjF/b0zLz4bW8tpDxjFIKPNMkyfE0Z2NtOycU8NJlVxVGnUWey0PZ2LrpYQRIn56KnbzKZOe+6D//c0LfCucrNU01knnUT9+WSAxK9TMSlEuJvmagzVEOdaiMgcaS675jJlLLrlHSInxUwrhVqvEcm0ZV91YWgTAOl3Y11hdKOE/TRly6zuxlNfUy+QNtIH0ZMkFSVn+5zTlm8pIsy4F/vMdPoq4x9F/79/mHM9cxP3VlOBUOzkg1M5LpkPE+VxOtfOz9ry1WtOM25oMxo7xW0Iv0MrDJnGwasJU3qWkXo9KP0cxPm4Fo5C+FUnVQa3Ryj3aXgHPhiJF9K29s4TgJRWJSrQB8lBcHop74G5CmLF3FTCjtoTeGPPqU7K+BUbLrjoxtksrBV4/10cQ/coWSMsivFV7EDoJ0NDSlajTA3hWw4urfPS8Jjm////O7JvGMYDvWdER3JCKyJM5d3IVF08ary4g9RoG89CCp5aAvtu84YqYZJ40UWag==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(22082099003)(18002099003)(6133799003)(10067099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9mGTvhzyAWS3YXzlPbSz1drYtHX66/0e0xHDrEYfwQH2zvmAOU414e3FyxT4ng/jHqI5cSp0FYftWG4rxyTYXmh7KS1NWpffQ2QJeiTj+mz7xJE77ZnKiRonOo9bUS0r2/86sE9vlS5yX0sgdhjaDhmukPIIvLQOoNcXaEmiU0hZNG+p8F5Se++qVXaVhF2uelqeZDIxQCksf6fKnqyc+XLQJufPX2RcP8YQ0jB9y4H9uHRaXWvvg/WScuvN/uvODOFZBG0B9oLtpZzspkBScD4QkgWzo6shpTGU7p138PZ9Io+tsz76g2peZjYPi6Z9NMqgyQhCYUm6Cf1w9N7XnjtEMFx9ON3vPQyL238cZzN5XQdqTp6Tk5+E+jhaft9ZGzKwp48+X1ckgF1dW+i2Oux03Q7wsJRs+6YEoeTHXqyDYCzsWePFWevyZmSBNk+M
X-Exchange-RoutingPolicyChecked:
	GMwYuPQkksgvYGr7m/4N/Kjx2aCSzvX1bt2mD5YFpVjVIYHZ0IkRJAV9Gg9BcS4HZbq+dNYYvKj/AVSEeM7i1DoWPMG2jsD7MXmqU7/+fq2IkJp0I+QIysiD5oJ7Q6hwUCpnqXPuZF4Qp91oTWbjRJNDl0h3LMsM1i042KcEWTBuIMSXJPhVZla4RUMwjVzUyP3YT0+fRo1t+OkXFkbtUg1BlP9n1ENTHBfpRQRhlYCLyOeauIOSar2rz5XhoAfCJcREB86JBA0WT1O/2jdZUIoGt+pMIMk33JFlWcoaTpeGpUO7ew9zjZmjO2vVM6lLBMwJaKpXEXkaBHtk/+V3IA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:04:56.2843
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba308fde-0805-400a-1921-08df1f043082
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN6PEPF00000071.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5650
X-Proofpoint-GUID: D1bAvLDM-3t2SZtm8rIWg6CdJklkMcdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX8BQI6j8iMDWy
 RqeMC91hg+sjijMrPPttAciU7HPcoiUGla1OREUurNRzv/5Fk2Q3KbmaJZOf/oJk5dWppJQSkuc
 Ui2PGqDgAw7q8i8bdDXzkACdmIQf0PMWiVXIK+ITY/Vd9TSkX2ejJ0dJeY2ZqBGRNDB+dMSNtlU
 M+zB8iu5UGL2KOrjvel6Zb9uijmFnX4Q/mrxhABU6qGEF0FST8MKYFGw9CTLkrzupYqPTDAeb4P
 arRp+jE3QdTLAGA067MjCt7/lC7R1ZLYnU/ZAFGjcNQ3w2J+bdWVJeMMdRFIFLSGrnqMW19LMMi
 pAJuiAhOZIdHqS0p+BSabRfy+mMe00gZpnHV1uCU5xxOUl7vukkNNzPcxNGZ/JSpCOcmI1g6ylc
 QRdo0ffzGpLyiDSnhhR4ETB+WYn9ofMRzQauSlKIZQCAhZQUQqeYj/O84AUlA71cbitKAk7nIRK
 ArHIUAmBRKkZXKAwBeg==
X-Proofpoint-ORIG-GUID: D1bAvLDM-3t2SZtm8rIWg6CdJklkMcdG
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd251c cx=c_pps
 a=5gC0q5i1d38FX/YauR05nw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=BHPe2QjLWJqeo3uSyC4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX0gtuqYoRFKO8
 w6JBa682l4ao9sf88x8oU34GcYzBP7mycfZ7WyU66AUmDwSodVohVs6Z+y3xMLsVx/8j+/NG7iM
 amJpGLM5IQxxLHHd6lmy3QsX8gOdc5c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

On 9/30/26 1:37 AM, Padhi, Beleswar wrote:
> 
> On 9/30/2026 9:43 AM, Vignesh Raghavendra wrote:
>>
>> On 30/09/26 01:31, Beleswar Padhi wrote:
>>> ti_msgmgr_send_data() copies the message to the data registers in u32
>>> units. This has been harmless so far because the clients (TI-SCI)
>>> always passed its preallocated message buffer, which is sized to the
>>> maximum message size (60 or 64 bytes, a multiple of 4), so the extra
>>> bytes read were still within the buffer. But, with a later TI-SCI
>>> update, the message size can be varying now and not guaranteed to be a
>>> multiple of 4, which would trigger KASAN out-of-bounds reports.
>>>
>>> Therefore, Build the trailing word by reading one byte at a time, only
>>> up to the message length. The value written to the register is
>>> unchanged.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> This looks like a bug fixes and needs a Fixes: tag?
> 
> 
> All mbox clients of ti-msgmgr currently send 60/64 byte sized messages. So this
> is not a bug today. It is only a preparatory patch for future mbox clients which
> can send message sizes like 19 bytes etc.
> 

It's still a bug, even if no one happened to run into it yet.
Probably good to add the Fixes tag anyway, just in case something
else every gets backported also that needs the non-4-byte aligned
reads.

Andrew

> Thanks,
> Beleswar
> 
>>
>>> ---
>>>   drivers/mailbox/ti-msgmgr.c | 16 ++++++++++++----
>>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/mailbox/ti-msgmgr.c b/drivers/mailbox/ti-msgmgr.c
>>> index 425d5f9d9d0e3..44457a896510f 100644
>>> --- a/drivers/mailbox/ti-msgmgr.c
>>> +++ b/drivers/mailbox/ti-msgmgr.c
>>> @@ -425,10 +425,18 @@ static int ti_msgmgr_send_data(struct mbox_chan *chan, void *data)
>>>       trail_bytes = message->len % sizeof(u32);
>>>       if (trail_bytes) {
>>> -        u32 data_trail = *word_data;
>>> -
>>> -        /* Ensure all unused data is 0 */
>>> -        data_trail &= 0xFFFFFFFF >> (8 * (sizeof(u32) - trail_bytes));
>>> +        /*
>>> +         * Read the trailing bytes one at a time instead of as a full
>>> +         * u32, as the message buffer may end right after them and a
>>> +         * u32 read would go past the end of it. This also leaves all
>>> +         * unused data as 0.
>>> +         */
>>> +        u8 *byte_data = (u8 *)word_data;
>>> +        u32 data_trail = 0;
>>> +        int i;
>>> +
>>> +        for (i = 0; i < trail_bytes; i++)
>>> +            data_trail |= byte_data[i] << (8 * i);
>>>           writel(data_trail, data_reg);
>>>           data_reg += sizeof(u32);
>>>       }

