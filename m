Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3127F2DC765;
	Mon,  7 Sep 2026 04:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788756176; cv=fail; b=TYUL42gHXFDxa5R0ygrqCbRNXDVzcbKnbHJUbn7E6e01qE//pLvMekieYzAIvY4lTxz2nq86baFvqxmjy9htTXZde+t8riAwoT8gf5aVq3ZdWciJtMd2uEo6vYk/Lr5+4t3AmT+PkKnRqkfj3B4Rv2yHYbZEXiwF7z+oKYROrWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788756176; c=relaxed/simple;
	bh=Qrnya5ph2UyrjO7TdKIRzX6ao6mvcqNCaZFzUzIEUTA=;
	h=Message-ID:Date:MIME-Version:CC:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=rEk1Y3cOqaZtF+ZAaPA9VEq6+h88MqrS6fxFKZQ38j/xoxRxm1wGtb5qI5rxLH8fMm/EKycIfeQudmSTMeEmVmGQxMUZi6w3GKeeivX6EmIsXihmuLIBacxK67JYl4bUH0ySnM+/95Pa78YNBwA6A5HVgz2uwTNL7LqZZ5BLJns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=ohlYzTcv; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=DujRIG8T; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="ohlYzTcv";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="DujRIG8T"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6873ihfZ2218852;
	Sun, 6 Sep 2026 23:42:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=H4whdVUG/3p9Gwjlp2WXJutQcWCJ4cKea7Ml9s8Dr
	rM=; b=ohlYzTcvE1pUmfylVk3DsE1TnWg/fhKXT7SoTjdaMEEEa1tGrP2/95MKv
	8z/zxSrhAQJFbXDvXN2dEnaXWG6KYCwClpEyJq8Lp984IS73J9zIneKVRh2e749R
	M5npEJNVaSsogtAkNRuGjcmNDUQNqVU5pWY3ly+YXUV0RB0PvDlvjGaQLijrCi5C
	VRLJoj5hbzIaiUTWn7zpI4A4Z41TYBK5GXdcDvdNfs/4dvNj3XLO95qiuiCOyznk
	hNiiwnwN7Pk20S5QdNAIr8/aMRin4P59tT0TwuXIi46aHWjeH6gqfMVVI/VKuoAr
	IcWUsDbQ5hE066Kn74DUrcrhRvLlA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
	by m0380145.ppops.net (PPS) with ESMTPS id 4gh43n3c5x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 06 Sep 2026 23:42:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ip/dZuRnyuuUw0rpK994SXDX1xxiASnE9YyTcZpGxFkrJO8DdDROsq3COWpKj+vSc6rrVGQN9Z/05/GJU3nkBftIwr1THt4Y2WVkpngCiK1IyckYB4oxpMsQFfDZVTRR6S/JAUtry+jBYA8DQ6MD7hcG0wJEMW/FL1qR3Gx2YozhG9Tg8GSWOzt4pHJ0rmpvvuxe2jMuJnk7zSe15M+scHsBQy57eam+kYSDQw6kImgq1rmHKQQi3o6gpMD/CUd/pXs96BleLWAK6UXB1BAeYX51YxasN6JAcJzaA00h/5vbXrXtIBc9I0JDiQuWqF61oNpwdTQUuTwe+nER8D6cPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4whdVUG/3p9Gwjlp2WXJutQcWCJ4cKea7Ml9s8DrrM=;
 b=K18yKKNo6KnLcE17hSz+/keEFAn2XxQv7PcYL5sFcwpqHH0ySYF5tbr/vHVLyhayD2hk+AiHklBZKbNqjdBw1OR4SxBEQikcMLshhTjksDWFXwGET25lVl/ZqECWvXs6lxCAhKzLYD7PDQ3rtNXHAYuFTJ5XiDUedV0/AVnUGUac+b3BK3uBB657/cZM60cw+NWtQqEam7dYETw7Q5zV4+t0vF44q9e6n1Zjd9NXL9EeJd87rfYd9jR7DEJrfz7sj4eU6NwoNsNaRg2btumP8p61o8lTX9/Wpd7le9t7ojjv6SCFqz70h8mERJjaMPkUWgNTPEyUqXmMufLYh/QRZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.infradead.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4whdVUG/3p9Gwjlp2WXJutQcWCJ4cKea7Ml9s8DrrM=;
 b=DujRIG8TBsy2RphOAXEZBKITk//Bqk2u6Po2fgpBamoDhz51OddNVplCAkzic0bmz8OiRlR1HyWFQkUmwORh1o7BF9yPHiOsWxjdtyicsnV3RoH2qCxHOEJxHaG7bMOVjXcyml00DD2sfgsgSUxtKecMI4BhHAhM5O55Om7HEbA=
Received: from MN0P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:52b::7)
 by SJ0PR10MB5857.namprd10.prod.outlook.com (2603:10b6:a03:3ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Mon, 7 Sep 2026
 04:42:38 +0000
Received: from BN3PEPF00022BC2.namprd05.prod.outlook.com
 (2603:10b6:208:52b:cafe::1a) by MN0P223CA0009.outlook.office365.com
 (2603:10b6:208:52b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 04:42:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF00022BC2.mail.protection.outlook.com (10.167.248.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Mon, 7 Sep 2026 04:42:36 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 23:42:02 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sun, 6 Sep
 2026 23:42:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sun, 6 Sep 2026 23:42:01 -0500
Received: from [10.24.68.110] (uda0492258.dhcp.ti.com [10.24.68.110])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6874fv8K4001206;
	Sun, 6 Sep 2026 23:41:58 -0500
Message-ID: <6cc21f60-45a9-4342-86e3-5257128b8989@ti.com>
Date: Mon, 7 Sep 2026 10:15:39 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
CC: Francesco Dolcini <francesco@dolcini.it>, <nm@ti.com>, <vigneshr@ti.com>,
        <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH 2/4] arm64: dts: ti: k3-j7200-common-proc-board: Add
 ethernet alias
To: Hari Prasath G E <gehariprasath@ti.com>, "Kumar, Udit" <u-kumar1@ti.com>
References: <20260811061351.2538688-1-s-vadapalli@ti.com>
 <20260811061351.2538688-3-s-vadapalli@ti.com>
 <b7147489-00bc-4f55-bfe5-2c9cb675c7ec@ti.com>
 <a935ba6a-3623-4fb5-a31b-fc58ea9dda21@ti.com>
 <5a62aa0d-c829-422b-b1eb-2b64f20e42d3@ti.com>
 <f849a5f9-e027-4203-a684-1bf15d032a9b@ti.com>
Content-Language: en-US
From: Siddharth Vadapalli <s-vadapalli@ti.com>
In-Reply-To: <f849a5f9-e027-4203-a684-1bf15d032a9b@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC2:EE_|SJ0PR10MB5857:EE_
X-MS-Office365-Filtering-Correlation-Id: 29a7535f-9e9a-4346-555d-08df0c9a709b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|1800799024|376014|36860700016|10067099003|56012099006|4143699003|18002099003|22082099003|13003099007;
X-Microsoft-Antispam-Message-Info:
	au6QcuIIqvyb+dZMZK/WBrDogLh4jeNs/Uz3QXIgzJPIC4OR9s4cImI9hJ4BT+on9vSN0KU5xNasAEF7o4HGrMFpWtsLJggvt6dSyFK1rShdEvXIVL0Pu+KQTPyKwd9kUFbXR9Xuo5kOQ1PJhtgpYvynXnM4rA/u+bfFtrAh7Vxt9Q6kGhizSomLfS6NfbzOIhtleLUKuPNDXAabQECTOpMwwWF0K0Rbrega6dEvP/X9X4//ADmH5/kcOrngFRCPXke6BvG81YYFzqkLSAvp5HDBXuqJVN71UykqvOD7jWvTRIokHGAp4jWsQtNSkMLCIQoaLewI8I3CYYC3aBVspTwc7yMIA8ioALYpjWF4PLmcFOrvO6Tw8or1JdzlWixDPZEtG4y3N+cy9prfGKKDV7j647vDiWcQlk1vKWkvZJcYkP77OyJX+cg5YSBxyiCX7P/Sta/oaTagwXteeSPIf5KY5BSOtOaoipPbGoNMRrdoXrut1fW+eA84inj3impF+dFzIIsxmmEZoo3zVkzOx5+YD4dZxNypdogFecxS0o64dyssD9IiE5EuBZh2T1hyZaTf2vH8JRE1mkExbVx1D3h+IHC1QTXjPBwS3Jsbf+/QfegVD/7byx3sE9ogtcvGsFlGeSrPWhZTn8sQTK6P4sSDVyGKYcyqiiFuDln522E=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(1800799024)(376014)(36860700016)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4VczYaiijIdZiPDdtlrC0BILtEtE1aoAC9dAtbID0S16E4lNOJQ4GiG9LleQvyol8BdXjW8iKDl7GKFPCwGaUgIixEkyEtjp/ZlPqNDVXLx+jPSGwqlb+M+S+gphDItR3948OMyIJOiVtaemUro+7u5Yz/mV+H9jxXxgb8rSz1ChuUizZ9P623wG9WnqeohwBXZvbz993VgI6E3cKGHyguOmTb9PN1WMkv5Nc/DdFwjQbKQnuINF5ABiHsG8L9SSPt4uYjRqwVaReagauNeVVgpATIHFZcdolIy6i+Q/8HUlPZgec8dgSKIYLiJw9gVKviLbY6pMkSSqyWODHJk5+ObZEg0EPNcRlSXM0eG90WhgwckMuDdeztryKTmSpp5/c/9knXVNlSkJLuvXNgiRmA2rd2MA0Uil035r+vSBYw4mnhVNsZByVVmu44CuFVpE
X-Exchange-RoutingPolicyChecked:
	KNpCdgdU+2WCkYvtqmG2xiz9x9V7uDt/lbX7JFpQnRnGm40Ec77G6xkixjL5pWDqBtc1V001wS/2Oq0vC+ZSi6GIwwRW8WWpJXUPabuD3HQIXN/tJ79PSIk4G4FHG0Z9vsxVXi6gowhA3KEr4hWGBaSMinYmK3IjlcW8EmS6Q7Whb3mY0dS/WCqNEl/IlwiMi7xmrt7TWWMBogZipiWtVqw4hebAP11ssHT6GdthEj+3+GNnTdvtMd5gPRW+Ab9mTI6xE7GZN8yXLz3gqNM2Oyfp7Wrb4B2QzhivZS98jGMGVsj+ScaH3A7y5mL8vvc3Uhzq77uaPIjfIyhLKK5lrA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 04:42:36.2379
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29a7535f-9e9a-4346-555d-08df0c9a709b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF00022BC2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5857
X-Proofpoint-GUID: Pp8mVs_daGPUO9viq7wnYg7H7VeVSWqJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NyBTYWx0ZWRfX0s+b/GtIUNI8
 2eRCzZlfzjbSZdkVXoeA58X4D0/B9WYrlqvVI92xyVlkH79Jz4Iwiy6sS2631LdfX6E9YceMNLV
 AWqMn5wRkOALz/i1sZccyZHm5fULb8You9RQoORfBxxAWAbrNBQ2g0e+QOnNSsLVjKzQB8zeX3n
 btnabBt9UIuwBce63U9D2Q8KrMcYuugiKoxWIoIsFuqZijwOc9SJZbHLzaCAL1Xwe5C6AjvTfgO
 Y8+XDUhN/yGtwv4TnNiXjjZNfh/XyhUpp2DOVxwxAg4T3h3VDLsXFSWjTMvQm1aGWfqnQYV8mTD
 UKC+RZBHHkQn5oO+PVbaBLF8uw3Qoz0sPieDfl1ZAtb7MN7P+9ZXms4JsEKxh8CniAz0bTPBmJQ
 B3Gpvgc6BvwPSUq8iBryd8Dhan6+Xe2oETg0jmcrQzEM6bX43JQ5GnzkbOGnVrf2AyXYGDSKHfE
 MtmK0DwoTqODzgtj4kQ==
X-Proofpoint-ORIG-GUID: Pp8mVs_daGPUO9viq7wnYg7H7VeVSWqJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NyBTYWx0ZWRfX8GhgGuE/cKjx
 6TwhW7SAKY6hXqRYY7d3jIbECVfP1m/2MzGtSoejvPqD/wj2vqlH29sUxRNFmjaDjFrrIWpGziZ
 Dv8zG6S/LQ3PqkVEDZckncB1mXf4uPE=
X-Authority-Analysis: v=2.4 cv=JdSMa0KV c=1 sm=1 tr=0 ts=6a9e40c0 cx=c_pps
 a=8P36fUQdMjs6HQlwNDQNwg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=g6uenJG-XOQvrU9AoM0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070047

On 06/09/26 20:58, Hari Prasath G E wrote:
> Hello Udit,
> 
> On 9/6/2026 7:34 PM, Kumar, Udit wrote:
>>
>>
>> On 9/6/2026 5:48 PM, Hari Prasath G E wrote:
>>> Hello Udit,
>>>
>>> On 9/6/2026 11:13 AM, Kumar, Udit wrote:
>>>>
>>>>
>>>> On 8/11/2026 11:43 AM, Siddharth Vadapalli wrote:
>>>>> Add the 'ethernet0' alias for the Ethernet interface corresponding to
>>>>> the
>>>>> MCU CPSW2G instance of the CPSW Ethernet Switch on the J7200 Common
>>>>> Processor Board.
>>>>>
>>>>> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts b/
>>>>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>>>> index 54dea36b153b..ac1c1ffe40b7 100644
>>>>> --- a/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>>>> +++ b/arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dts
>>>>> @@ -24,6 +24,7 @@ aliases {
>>>>>            serial5 = &main_uart3;
>>>>>            mmc0 = &main_sdhci0;
>>>>>            mmc1 = &main_sdhci1;
>>>>> +        ethernet0 = &cpsw_port1;
>>>>
>>>> Hello Siddharth,
>>>> As default only 1 cpsw port is enabled for all boards in this series.
>>>> So ethernet0 will be cpsw_port1 always, In case you want to enable more
>>>> port in default config then having aliasing will help.
>>>>
>>>> otherwise, you can consider to add aliasing in overlays where you enable
>>>> more than 1 port.
>>>>
>>>
>>> The first patch in the series for k3-am62a7-sk has two ports enabled by
>>> default, so there it's fine to add alias. Also, there are many other TI
>>
>> May be I am missing something, but i don't see two port are enabled for
>> am62a7
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/ 
>> arch/arm64/boot/dts/ti/k3-am62a7-sk.dts#n796
>>
>>
> 
> Apologies, I mistakenly looked at the TI vendor kernel where it's enabled 
> on both ports. I think still the below reasoning is valid to take this 
> patch series in. Let's wait for Siddharth to come back with this comments.

Despite the board having a single Ethernet port enabled, there are two 
reasons for this patch/series:
1. For consistency - keeping these boards on-par with the rest of the K3 
boards (some of which also have a single Ethernet port)
2. As Francesco pointed out at:
https://lore.kernel.org/r/20260906153114.GA3576@francesco-nb/
if PCIe-Ethernet Adapters OR even USB-Ethernet Adapters are used (both of 
which are possible on J7200-Common-Processor-Board which has PCIe and USB 
connectors), we need to specify which of them is 'ethernet0'. For NFS 
(Network File System), if 'ethernet0' isn't specified in the device-tree, 
it is possible that the wrong network interface is used by Linux (despite 
eth0 passed in the Kernel Command Line for NFS) with PCIe/USB Ethernet 
Adapters connected to the board.

Regards,
Siddharth.
