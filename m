Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311704ABBDF;
	Thu, 17 Sep 2026 15:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659983; cv=fail; b=jyDMOvW2N5WcmROvY90by4OJCsXCy3l3TvcuIuTmDNHxobkbLgsKCDeYI1jNTGEoe3AV1lKPoKYkSIZ4Jz1Ix/fY9n0nT9WSVBJyU3gUXfaLMc4dJxDGObcPAuRa/z2z75xeWUoe71If57R+2UgN4V4w7zFFioLisLvPemGy4Wg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659983; c=relaxed/simple;
	bh=gYZHDs/upejY++JgVEyE/mRbE06ad7menaY63GOFjvo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M3+palxZ9B9sdKA5tJsalSgP8/+/VfC0kqhdqWbVtfTY83+JSL1oXOxqkasWfqV9NcKtR3vRmzhgHdhio5WPVzY/gxhP19IYj5BW9YJnvTA1BuH0l0qvDo8Q5shM9M5EMTOzkpE2NtIYiOqV4HnUwv9NNEiBDCnSGa11XY2wYss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=lHF8ly9Y; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=mZmLsPb5; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="lHF8ly9Y";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="mZmLsPb5"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68HDboXQ3152931;
	Thu, 17 Sep 2026 10:46:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=oU8LNXye//TOJgl9qi0P8o5tb2Fs9Nfpx3BFYUBRr
	5E=; b=lHF8ly9YQ944fIJGbEQVOEd1ZZAKDpAa0y8zn2t6eKp5VgPLkT1lm7G3t
	/rBj/v38m8huG5SEDAftDmh9pW76TD89VdFySmRwhAJs+dsRacg9nNaRIqBOqy8z
	T/NFELBpiSB6uK4O41GHh1i1zU5qRkAF8IwJmauQOOtcUW7PQuHNXCQzqY9VUCgV
	8HGxwQZhhATrNPFtNLr69ZU5F52Uf4ziDF2kSHSpcBC8hQhhuZcVIP+lWpEk1KJ7
	19TylbkHAh93Fx4Mq3h98meJSJSabwA5WVvO3nkN/8S1fedvtVMklOJ4rl0w5yz8
	7VOkWRU6s5c38l7Nc1P7UTxuMxuTA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010054.outbound.protection.outlook.com [52.101.61.54])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gqxfpgpk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 17 Sep 2026 10:46:04 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A+vZe2gcSmCwAn1Wlz1MQgcAQ15g3vr+gaKPIz0ZACKapJ3cdLSA1oTVzVJthwRsD2bpsI8OBowHxo5Juu7wXR6u2E9PeNaJPtV+NvJwjxMbDHs0aetNOVwECZD11zIsNWTRUHpJlc24qnAddJsFHwqDkjmGDGb4gA+UQt33BO1O5QDFb4R5A5sSp010n0L18yZkmCt89EFwADQqZzGpI4td6drV8YEIVsNsGf1Uf1X5LTlDOCUE3Y1KpqYUIzc1qql3Vgcorg13hZTvfPL5rttDMp6IjZXRhHsj8JwjvvVtGlbx76SZdtCINgT5ppUgEkES5IuN9M6AN4RzMnuyIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oU8LNXye//TOJgl9qi0P8o5tb2Fs9Nfpx3BFYUBRr5E=;
 b=YchWXgCr0AXdMgT4bknD1oAuUE/xqQOpZNoLfNyYpQm9zdantYoYXCjKDZf06IJJC5Zxr1UiSqkS67B99gNKVLjMUMUUvJxYgwCyRTKtChKsNLGHs2okzaRW1TS670dNjsQqwp1E4wnyfZLow1ligneBeO93f+9GcziNu+OaeROm+VxnPHWPEvxumlAjXzjvh5uossPhtx1tbAGEuPjOg1hNhhAYML7Iagj4gxGteNYIxW/+tfsfIEGTfONN+EuHGQxEyZLvCqdq5uWRIGIcN0jOPXG8rti2nLXmVm638j8grrfIxk9VuFuQKD5Vd1zM02UVdrLG0Y3FRZn0fqpdOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oU8LNXye//TOJgl9qi0P8o5tb2Fs9Nfpx3BFYUBRr5E=;
 b=mZmLsPb5u0SC/ZO5EPkmz3ERht3K1bLvMB2QuJOGwghi81XGxYIg87cQs7zWSw1eHbp2+mgjHcLe6u9olKOtBg7NxlPNHcvlVhkG0/lUhlZ4FuEe8UbC62T6sq0u4S0ERdg2lh4um0trsV1CO/9XNEUVaH+cdgXyLvZR+UOK6XQ=
Received: from YT4PR01CA0244.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:10f::17)
 by IA3PR10MB8420.namprd10.prod.outlook.com (2603:10b6:208:579::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 15:44:54 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:b01:10f:cafe::4b) by YT4PR01CA0244.outlook.office365.com
 (2603:10b6:b01:10f::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.12 via Frontend Transport; Thu,
 17 Sep 2026 15:44:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 15:44:52 +0000
Received: from DLEE201.ent.ti.com (157.170.170.76) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 10:44:25 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 17 Sep
 2026 10:44:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 17 Sep 2026 10:44:24 -0500
Received: from [10.24.51.39] (uda1253387.dhcp.ti.com [10.24.51.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68HFiLXT4190054;
	Thu, 17 Sep 2026 10:44:22 -0500
Message-ID: <62194a7f-5b7e-419a-8235-9eb46f2f2e7d@ti.com>
Date: Thu, 17 Sep 2026 21:14:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Re: Re: [PATCH 1/2] dt-bindings: mux-controller: ti: add binding
 for event mux router
To: Conor Dooley <conor@kernel.org>
CC: <peda@lysator.liu.se>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vigneshr@ti.com>
References: <20260828100615.1700223-1-r-sharma3@ti.com>
 <20260828100615.1700223-2-r-sharma3@ti.com>
 <20260828-goes-scrawny-a5cf40c9514d@spud>
 <bacf61ea-91b1-454c-97aa-8c6e4ca07b16@ti.com>
 <20260915-shredder-liver-219bbc18dd18@spud>
Content-Language: en-US
From: rahul sharma <r-sharma3@ti.com>
In-Reply-To: <20260915-shredder-liver-219bbc18dd18@spud>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|IA3PR10MB8420:EE_
X-MS-Office365-Filtering-Correlation-Id: 63411fca-4a17-4873-ea70-08df14d29d74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|1800799024|3023799007|56012099006|4143699003|10067099003|6133799003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uBsy092aFi8tKqX+9ZfM+vjp3px//81XTjRQlox0Olfi7w4WoUlDuFe7MkIcV6lJMStJRaz/4KE1STNBcGrW3OdXj2M+fe7JI6bjoG8Q/J8nJXmabUYMYZAjhH3AscZeB4tirecxcxqCPVlUE1YAnrEqD6LpVGBnQdl0mLrr7sY+DfPi6eOA3h3QvvlV44zRJRGlBx5uvlomm6xIr6o5UgXMXYYXa50pHKV/AT1D0evwKsM/8wlC3/5egLY3c6KjYbXrvFC1egQa4UKkWlBOT39fYBuQ0fFYkG0Pp+xd01lwZLxOhfuNe5gCTMaMcZqY9TBgZKvF4t9BSO24XuHG594sgLwCg34hEMyTqbh6pzmQVzZUftP51XPns3Op72nHSyxPSA4MEyxSYjlO02UgLAJ87WweFrDoQgYWvMRXjEJkGVfp62MqtOotZ2ctOp/dkDScXQeNoW2TDy7Y3b1xF8/ANdNaXnkRvg2FvnMc6S29/XJv+9hC4XIfvIXWWhD3LsyhAsujS31cC/6fJr6dtnoSZuI6Y/SXOhNLgL1ZL0PfzTDVoyEsy/5P12ClsdJMRUJQ5ZVWhp0HouwFqlv89ckdlZb1hRIyXwIVNdqnXiWbkrynduSt0Bd2YdQqs1gwI5clnmOFeJCk8z+AQPapwQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(1800799024)(3023799007)(56012099006)(4143699003)(10067099003)(6133799003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	COW6BZ/amuMArjDjCMQPynBszImko3rrTX9Fxr8Cs3C2LeKRnjBw9YAw/Xl/rNYi1cQjXIRu/OJg5XBj8IubXXHhZ2pJQAxFvtrRoAwItcPj68TkqIu5mWlVxtUVhJp5EhpwrKDMIwR25M/Xtrft7olOz5JwBtc0Kbv5aXnDXiN2L2VLcmpxKbLr4uFqKGBGbojS1tZltTfBUtw0KndHYbN7bRJV3xTdnL3OZo6fhnyrJSA79ll7pdFperN01zZzzA/md5H1TN6wTx7B8q7lLqJ1S6P25YDDGqOx3m5G9Pl9otKGjyMARosyibGSEzpge9TArXxuq97gYAt3VGp7qpx2ZqV/q1dA1aWfaKQ42a3DYvmiUKqgiOZ8SDaQGzgqZEBIXIJS9o5bIghfanqRltQ4S43aJUEu3YqN50bZ35IXtXEon77CD34AFCAvtpCb
X-Exchange-RoutingPolicyChecked:
	M0kUFzdQha9U24GxnQmKc/tLT+QjhLp1xeR3W39R2LtBc9SlzggYvwukiMPeS+Mal0GiyLK8swC7jXN983DNdowAvuIVn5x98V/YRfkOluda/iFzvsUtZYb0T2tNoLt2jFioC+7ij97/Hz+rHB3Nd6EeWAce1EvKTx8r7xDgX5usplLIbDNlDr7hEEZ0G0IEqk0wx4sEAbdOTg/VPwV+xvNg7DgKprq+KLPOjxWeGrXvW0U1WkK2Ft4sABvAHv+ONyT7wHX967O1ZtNR9g4YtwvGj1Oin/ts9fLdHDLiYiDtvxDxUtst10lUqa0+BCSircWGen7w8clzPPa0jScB3w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:44:52.6121
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63411fca-4a17-4873-ea70-08df14d29d74
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8420
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyNCBTYWx0ZWRfX8vufUui9BCi+
 UCkZEdt0fokrZ/2ad+UMZsQDL+r1Azv7mA5qzoUKOWW1kzfKPEiv2NAyrXBAgSOBJ5RnuApwz09
 b8J+nx4oL6RlbCawqIARmdhkvM3KNYk=
X-Authority-Analysis: v=2.4 cv=HaWB3SE8 c=1 sm=1 tr=0 ts=6aac0b3c cx=c_pps
 a=64b+Fh2X7ngyiwpNPLbe6w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8
 a=gEfo2CItAAAA:8 a=NEAV23lmAAAA:8 a=NNTsO72Hueb5Pe9jtfsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 5QuXxoSyE3m-OGIDnreVgZDp6jyEBZau
X-Proofpoint-ORIG-GUID: 5QuXxoSyE3m-OGIDnreVgZDp6jyEBZau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyNCBTYWx0ZWRfXyX/dCyQfxPX6
 3Djzjwrt9rh9ixmcTIAUUh3xmgYPnZb0w+mtdAn2FvY99JbkxCPsOsg1ptPUKO1OodlBNx75Nza
 Rxo91IX0h9Egq25TjRUTLBntj8VIgyUqgzOCrSxi/zt4skrksyAkpWW7vqpnLXEpYLrAbv/HU64
 C6v7TrOou31pndMEOlJtWnVBAlgd1XO3FVFngElI7i1nQzF22u5t1x0azcReJKKHcIXzG8A3u0s
 vEddN+lfDgq4f3qcWYM8uQu2IttM1V50qkJ7oF+MZ10IrThNEDKklUnXCOOBpqAN8NFset/mNxY
 818TS3PFJsjnum1TJKs9tfiP0NkRF876TBa8rXXOXmE6G0ZErd+ez+UqSW0k0QfHCM+Mp0R5UsF
 fCpeCYXMRPGV4/Knii7fEhbvPJlRd4BXvQHJ00GeUjOZg+wHeP8VWharISp7IjCjpy6Cj6lg57e
 JkWf6wLHaxHOLbklOSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170224

Hi Conor,

On 15/09/26 19:19, Conor Dooley wrote:
> On Tue, Sep 15, 2026 at 06:10:45PM +0530, rahul sharma wrote:
>> Hi Conor,
>>
>> Thanks for reviewing.
>> Apologies for the delay in responding.
>>
>> On 28/08/26 21:57, Conor Dooley wrote:
>>> On Fri, Aug 28, 2026 at 03:36:14PM +0530, Rahul Sharma wrote:
>>>> Add binding for the event mux router of TI's K3 based SoC AM62L.
>>>>
>>>> The TI K3 mux routers which route the GPIO input events or Time-Sync
>>>> events b/w peripherals instead of routing to a CPU.
>>>>
>>>> Refer Section 10.2 and 10.2.1 of https://www.ti.com/lit/pdf/sprujb4
>>>>
>>>> Signed-off-by: Rahul Sharma <r-sharma3@ti.com>
>>>> ---
>>>>    .../mux/ti,am62l-event-mux-router.yaml        | 79 +++++++++++++++++++
>>>>    1 file changed, 79 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
>>>> new file mode 100644
>>>> index 000000000000..a5ba7f78a156
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/mux/ti,am62l-event-mux-router.yaml
>>>> @@ -0,0 +1,79 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/mux/ti,am62l-event-mux-router.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: TI Event Multiplexer on K3 SoCs
>>>> +
>>>> +maintainers:
>>>> +  - Rahul Sharma <r-sharma3@ti.com>
>>>> +
>>>> +description:
>>>> +  The TI K3 mux routers routes the GPIO input events or Time
>>>> +  Sync events between peripherals instead of routing to a CPU.
>>>> +
>>>> +allOf:
>>>> +  - $ref: mux-controller.yaml#
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: ti,am62l-event-mux-router
>>>> +
>>>> +  reg:
>>>> +    description: Register base address and size.
>>>> +    maxItems: 1
>>>> +
>>>> +  '#mux-control-cells':
>>>> +    const: 1
>>>> +    description:
>>>> +      Number of cells in a mux control specifier. This should be 1.
>>>> +      The cell specifies which mux control to use (0-based index).
>>>> +
>>>> +  ti,reg-mask-val:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>>>> +    items:
>>>> +      items:
>>>> +        - description: Register offset (relative to reg base)
>>>> +        - description: Bit mask for the mux control bits
>>>> +        - description: Value to write when mux is active (state 1)
>>>> +    minItems: 1
>>>> +    description: |
>>>> +      Array of triplets specifying register offset, mask, and value for each
>>>> +      mux control. Each triplet contains:
>>>> +      - register offset (relative to reg base)
>>>> +      - bit mask for the mux control bits
>>>> +      - value to write when mux is active (state 1)
>>>
>>> You have a device-specific compatible, why do you need this? If the
>>> active setting depends on the device or w/e, why can that not come from
>>> a mux-control-cell?
>>
>> This is a boot-time/board-fixed routing decision, not a runtime-selectable
>> mux that any driver ever calls mux_control_select() on.
> 
> 2/3 of this property appears to describe the register layout of the
> device, that's not affected by the board or some boot time decision.
> 

You are right about the mask element; I will move the mask into the 
driver since it is constant across all entries. However, the reg-offset 
must remain in the DT, as it is specific to each BCDMA channel's trigger 
line configuration. This allows the DT to define the unique routing 
offsets required for the hardware.

>>
>> Please refer below link for the IP block diagram:
>> https://github.com/lucifer-9852/linux/commit/aed1746e411a9f0ad7824f4e4a7121e6f56a4ef2
>>
>> For detailed view of IP you can refer Section 10.2 and 10.2.1 of TRM
>> https://www.ti.com/lit/pdf/sprujb4
>>
>> That's precisely why we added ti,reg-mask-val as a controller-side property
>> rather than sourcing the value from a consumer's mux-control-cell: there is
>> no runtime consumer selecting between states, so the routing has to be fully
>> described on the provider.
> 
> Why do you have #mux-control-cells if there are no consumers? I don't
> understand why the GPIO controller or the device that the interrupt is
> being routed to cannot have a mux-controls property that contains the
> "value to write when the mux is active".
> 

You are correct regarding #mux-control-cells. Since, this driver is used 
for static routing rather than runtime selection by a consumer, that 
property is unnecessary. I will remove it.

BR,
Rahul

> Confused,
> Conor.
> 
>>
>> BR,
>> Rahul
>>
>>>
>>>> +
>>>> +  idle-states:
>>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>>
>>> This is not needed, you get the type from mux-controller.yaml.
>>>
>>> pw-bot: changes-requested
>>>
>>> Thanks,
>>> Conor.
>>>
>>>> +    description: |
>>>> +      Idle state for each mux control. Each entry corresponds to a mux control:
>>>> +      - 0: clear masked bits when idle, also refers to inactive state
>>>> +      - 1: set configured value when idle, also refers to active state
>>>> +      - MUX_IDLE_AS_IS (-1): keep current state when idle
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - '#mux-control-cells'
>>>> +  - ti,reg-mask-val
>>>> +  - idle-states
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    #include <dt-bindings/mux/mux.h>
>>>> +
>>>> +    // Example 1: TI AM62L GPIO Mux Router
>>>> +    mux-controller@a00000 {
>>>> +        compatible = "ti,am62l-event-mux-router";
>>>> +        reg = <0xa00000 0x400>;
>>>> +        #mux-control-cells = <1>;
>>>> +
>>>> +        /* Mux Register addresses: 0xa00004 + (J × 4) */
>>>> +        /* GPIO0_40 -> BCDMA trigger 15 */
>>>> +        ti,reg-mask-val = <0x40 0x000ff 0x00028>;
>>>> +        idle-states = <0>;
>>>> +    };
>>>> -- 
>>>> 2.34.1
>>>>
>>

