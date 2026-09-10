Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C73453A5E;
	Thu, 10 Sep 2026 14:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050788; cv=fail; b=fnWrzcJsAwwtgG86tnIXlzI7mrrDDXB6nJlbWJscTG1aF0yPtQDkc3gynGL19Kj4unvsPPtZewp7wCohz4wzwL7q6F5I0D80f8QZ+LFVCE+IBce8RfGdk1vXy6IwFQq4c2wIeudo1jNJOnDKBrXtSG8upqbzOvP9aJoCdLS6dnk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050788; c=relaxed/simple;
	bh=YtUMvUw99o8HyFLY/L1RIj8upuZCD7glIdliHoe8YYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rqa0xwo/mER/TJN5O03ShtJYVAenvz5lElIlNq1qA5la86SZy9ofXZN56gMy1ge/WxeRNkUTjM5DpO1jCvIkRIAzQ1ruurk+hz3cdx60KhOYzkxF0VAJkAs+n/uFxZwDxY0V6CZemA+F/kSbdZKt1TfcaMEjCvhXb7c3Njy/31A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=W7GvoqE/; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=IjO2mzPd; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="W7GvoqE/";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="IjO2mzPd"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ACAFrJ3318079;
	Thu, 10 Sep 2026 09:32:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=O5CI3k4rKzsclwYAQ8QiLKm8zr/rRVDwCqyBTEle2
	3I=; b=W7GvoqE/dZZ+yVCkWCm86Zc/lKA3lOl2aTleuTmb3eXeqPXdakXe1hKPP
	xoqE83ucoe37bOagAbZxOyA6JFZWlFH3GWuamFlowBBeix28CoDL+rkwdm8VfOi7
	pADSJJ9qlg8fCrRdw/Z4iqVm2qi2SoC9FoGH91gsumFSyRkug+JfKciTXwFybgcW
	H5/lOswW0VfduekFwKxqUHoINAt5uWotX1gZGHJH6Vv9C4+hMENfRW/v22g+dWvT
	tg8lsWZZ/iCc1nO9W0vZhhLMhr1vytVbCT3ZvdfS7l/qtvbznrc9B/NOmWKQxLXU
	39uULvyuEehOaVjP7EjamaC/QwI6g==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gkcxg66wk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 10 Sep 2026 09:32:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dluJxQ+v2npo6HHVJxoWWJCmceWj+hoHaNZNBH3epTgCLa05dqbw1wukGR7gDJQ8UlprpxccQVIoEdNPnzO1MTVR1ivHKKIYCMjlFHrXLaPzZfKcq7u6FNkIFwNXkJbncsN5r7iYsjTt+KN1AhGKNpvyagkZdFGHkpOwRw5+w8BaVQa57mwpXlcDg+oH6bahsaIrLuWfqCEah0X8JEGcP82zc0yqWdlpxBwcCaDluUOqpDmTbbCyyZ0jrA3Rns5f0kzpZjL+S+ER5isL4tB5urUoqGfXtt7Z5BYF1W2BiOhrAKLyK0htotRbE2j8r5SXuhS/4ZaPZUVxcohM0IEM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5CI3k4rKzsclwYAQ8QiLKm8zr/rRVDwCqyBTEle23I=;
 b=kBSdQdVZXJydckgD0wSK+dKAYcVfuiTYvqduEHoKJ4WCtijUd/ank32mpvaGnDWyftAQwOOfzK+Iq14AfSkvRAAbDO1FVQzvnQq5DFEE9526zThtxynnCKjOqAVhDjRW1YlFwwXV7175xgO46RPvjpt1SgT7nlrDmrQ4LGifIgIT4S1vv4fjaGf4LUwzyEoR8QP0bVRDbnnQjMd3m5HFZPaH5wk09HrRDfNr4Nb8hg2TnUKnzAcfvBnjJh/7WDSHcAChlQxz9EVWIs32aTGVJ4CVh/1l7Md4dixcEX/fuRTJeyQIgnNd9cBP+T0327YT0HFyYEvbADsu6N5gjB8slg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5CI3k4rKzsclwYAQ8QiLKm8zr/rRVDwCqyBTEle23I=;
 b=IjO2mzPdLa2jtqrmV+3+QmJuMeCyUSGCedja3O53mbxV1OKjiMUvEHzs9jRSNIqGsTFd0R2btAqacgEki5NiGrGNy5g/XeR2ugSExsDH2lwr9Q08FHXZ53PH0XUvtWRRatj4FBOJmwcCJtyWhC3EEto57KqAD7FLJcKW4LOWwQw=
Received: from CH3P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::25)
 by DS0PR10MB7936.namprd10.prod.outlook.com (2603:10b6:8:1b6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Thu, 10 Sep
 2026 14:32:47 +0000
Received: from BN2PEPF0000A990.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::9c) by CH3P221CA0002.outlook.office365.com
 (2603:10b6:610:1e7::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Thu, 10
 Sep 2026 14:32:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000A990.mail.protection.outlook.com (10.167.248.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 14:32:45 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 09:32:12 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 10 Sep
 2026 09:32:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 10 Sep 2026 09:32:12 -0500
Received: from [128.247.81.105] (hpz2.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68AEWCoI2502797;
	Thu, 10 Sep 2026 09:32:12 -0500
Message-ID: <0110ed3d-64da-4678-ab17-3a42a9274a95@ti.com>
Date: Thu, 10 Sep 2026 09:32:12 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: nvmem: uniphier-efuse: Add
 ti,am62p-efuse compatible
To: Conor Dooley <conor@kernel.org>
CC: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu
	<mhiramat@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260902222759.736124-1-jm@ti.com>
 <20260902222759.736124-2-jm@ti.com>
 <20260903-sandfish-likewise-820d64daae2b@spud>
 <9e72a269-1b19-4c60-a32d-8f93c499f205@ti.com> <aqEuyLac2OGkSYX7@squawk>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <aqEuyLac2OGkSYX7@squawk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A990:EE_|DS0PR10MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: fdbd2298-47f3-471a-dc07-08df0f486186
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700016|1800799024|82310400026|376014|23010399003|10067099003|4143699003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ARivwz57vDy3u2ohmsKZamDOQcptCrhjagsAXA8ghje5Mdl/uTxItdqFq2Qb2dQZPHPI3ofacnIRWnktPPm4BBqJrdG4DA3YB3LLmEzgnAE4uBN6yTeLSD/0VLnzUjyI1nRAehyLfNrdPOr5AV9KhDRpGB2MhGlG9yIgq+A7xAMum2V9oby9CWgWrNIMVdAIWbiwiALDXK3ckdZdqFng5t5XGKvYmAge9Qkq9x9gt2HOGJhyFEUzHWOzgAuIlxTq6oFNx8fiHx1a0RrayCeNePn4N/q/PDAzA4+v0R0oZ6m5y/oA3ecmVKeEi1oDBv4ljpo7ztHbH5wvCBiQWF7Rxe4CuQs/lJtKbNGWtNHGpfe35sNFHgAxOzlDJtW2PWlmBA7iMXB/TLQEPJxQwky31pn7v0XruRFRodnPeUR6J6ZBw0/ef1itWuzc92dcZEx7p4HXTrm34ggqITRTBBjy1s5F0snbEx9obwa9xSJLWMYuWbH275eu6WMZoahmYrLB2fOJ32W9qqzBVIYZ7WAuCgo1J9eLspgf8z9eUQEQ79sig7oCVLliAIlIQXL5Q8e0WI8lbMT5kpokdsy3gdCtsYrng9YO/+SDr2SdEhgadTC2oIEY02hfIqCt6oVPHHIZFPpnceQK0xH/ecG/Vs61j8DiV1DuNp2DQfXfaZuaGIDHu87DxlCcahGmnCZysHYmh2epsW+s5ZkfH5GiBoZUBw==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(10067099003)(4143699003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pUBMuU0bVObV1MhYujcqXoXaRjQkzV/T+lO6rjWfkhrt963fnPUSg2sa2LOBtZY3T9xu0jFnl/htP+OvD8lU0AUvEVRdKx2vr3pgSUZkQkqGgdif2IaTZE02wRjofafw3P9eyqrJwoA8XsSsZUj8F3MURry+l532x75nvZyaiMV38ija8leBw7JTMlPIFGXUxxixW+GedBHmVDyzAmGE1liMLt+8YeEtmUgSFYbgeu+4+YPDuqSWEKD1YgLmbktWNaTUJFX0/S/2c6w+naW4Chh0ddR7fqzM1alcjOBMEEg70ApMz7YS+gatXx2iboeHb+kH9BNPZ3a0vUF+sinLDlwvUSdIs+BrPsWTKUMFxqDqevVzr4P7LeTEe928FHpQNflgmkK1rsqXikAB9gMQLioE/IT1G4LgdEko17xl92SAZu+hcQgjA34sbkHljBjP
X-Exchange-RoutingPolicyChecked:
	emdgrN6wU019dxJ6uZmDG0oA7W+PUdhMcQB/j1BmdzYedZ6rYuROA9B7u5HBPcD1414IWz/E5PPSq44zZR9kg+nEWTLr376DuiSp5hlFuL7Px57TP4MMqiZn7B1MyT32HT8ac7742pPk+LzU0qF9FcsJQEcw4ja1jhGNX+wAKIHGWPgp79KfBm7aLrC7dbF31mm6N/HPMq3gCwdClYU89C1Y7jz27zm35kRs8EsN6Yk1DgQfg3pZHy63FSPtu8gVp5KSuUPy+lfqCQBItOWwmr4OdxRA5imUrja3WeT1ABZ9RNehJ12V+VvWegJdXjZhzMNcm/C5gEA9mJ74pzME/w==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 14:32:45.6950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fdbd2298-47f3-471a-dc07-08df0f486186
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000A990.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7936
X-Authority-Analysis: v=2.4 cv=MpPHeGae c=1 sm=1 tr=0 ts=6aa2bf92 cx=c_pps
 a=jknTlamspUmmG4HRyne6iw==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=99zGibtj3RmflKBrfCsA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rdMQJ1YPT1ipskV9IbnQb6mxucMf_YWj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3NSBTYWx0ZWRfXxWsLRoakxdij
 EHJgqnA5CuoJfJxcqYvnHNfRHOWnHY09ok2ER7h9h6yIfi/nH/rwECvquxQGu2buAxiDkTbPyv7
 CzhPEywFxt3u8tOvq1ekbt2DIz+As6s=
X-Proofpoint-GUID: rdMQJ1YPT1ipskV9IbnQb6mxucMf_YWj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3NSBTYWx0ZWRfX/dRXlLXEuoKA
 uGBw88/9JYWkpdJfYsBjdG/+VnyoiNHUHP2XQUU0eunJxHMQ7INnJOuv9+Gld0LnfElAW88mFvb
 fOY/ledRQU8yxBdFH/F9ph7TpN9RGNf3sjIyBTk8F490XivgrLs/uJClr4QX7jnCT7LH/8wAtpB
 jX4lUy5r0Alm6jZqO68T1n8GYqUZGR0aqGVdlUnyRNvJXQAndkXek6KgViu+4UO1cZkeKvuEW8g
 tLko8pSe3PFD14eTfqY7Joeih7ysjLroV5FgMLr5IkcIMy9Txv/xjvsK/X3BT6PuoE20heT9Ed4
 3oJhZx/y1HZhjMxgImAAd+vRe82/sMVXQOKNWlix4HySqlz5tSerjCCDTRDQmjyOQIDRhRcMCI1
 xEcdmx51Ly/go2zwMW70PrF8f4ZTYzzkWrTq3Nw2/QioCkMpXbG5krg9nq9ySdWRRJVRRhTPVUh
 Ys/UDN1MyD8Mkno1Qtw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100175

Hi Conor,

On 9/9/26 05:02, Conor Dooley wrote:
> On Tue, Sep 08, 2026 at 03:28:47PM -0500, Judith Mendez wrote:
>> Hi Conor,
>>
>> On 9/3/26 13:00, Conor Dooley wrote:
>>> On Wed, Sep 02, 2026 at 05:27:57PM -0500, Judith Mendez wrote:
>>>> Add ti,am62p-efuse as a compatible string to the uniphier-efuse binding.
>>>> The uniphier-efuse driver can be used to read AM62P efuse registers as
>>>> well for GP_SW silicon revision detection.
>>>>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>
>>> Why is a fallback compatible not suitable here?
>>> Either it is, and you should add one, or you need to explain in hte
>>> commit message why it is not.
>>
>> Do you mean the following? :
>>
>> compatible:
>>      oneOf:
>>          - const: socionext,uniphier-efuse
>>          - items:
>>              - const: ti,am62p-efuse
>>              - const: socionext,uniphier-efuse
> 
> Correct.

Ok, will implement. thanks.

~ Judith
