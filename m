Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579844B489A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.135.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726001; cv=fail; b=FeMnb98lvxn/vhWy3gMhPtj5BHvnIedoE1W4SC0IiPk4YdBE0pni9syl/yYp0SithVpBYJeodhUc2H13bRsaEyKwYXq4gtDLW1licdCuVFQI7i5Qe4/c/H6QORb45WzHjiaM+hA3QATqBVtG35+Mm6SlceZqIKFMPpL/jfCLbU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726001; c=relaxed/simple;
	bh=w7cs+EgHUjaNonMxMOEEk4NAJWZZxNAq21fseHRQTRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SLE2DJioxzIwKo5D104BARjenXc/pMr22PvycErFM0D61gSGKu57jlQu+k/4h4OVKU1/Q2OpZF8hu7V3t07XkNNw+GUcQbXwEiyeCVmV0aT35pfDcyMhas/NKjOvP9wdgHhpHmAnjdNrOc6HbMSy3bgr6D5rBP1Zt2WsUv8ZLak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=XS6NBiF0; arc=fail smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="XS6NBiF0"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9e1ZC1002407;
	Fri, 18 Sep 2026 06:05:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=MlGDh
	BlhOAtORhjjB55w+SGUPTYnaVLzbdP9oFaQszM=; b=XS6NBiF0zBEiJXN4Ptjxg
	3fFtrsHwQ2sRe0USqugca0Teh3M/OzGQBG0WVP4dVz7vJ1FhC+r9KR4q9gGIPJ33
	/F7cnKaV5ICLYiCS8CFa2KOlIDoLI7OrrQVtjvQk6hSww+U/Kr1+talL7Jzix2nv
	FGJR+mpJ1d46CmwD7PE+6aWEREE78U/wF2Ez9GMZqiH557HYcTGzzDmLlmQUxGgs
	UNItEVluf/P8mwDOB6FDhhIs9CfTphC/Z9R1iA5DcZ9QWiSyyVt45AX/Zm5++v2n
	P0A8baIVHyolZ0xBQ2rqBD9AXbTHZ6qb0PbtD1jltP+T97smEKPaWsQZQfgMKI0m
	A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012015.outbound.protection.outlook.com [40.107.200.15])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4grk0h4dge-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 18 Sep 2026 06:05:57 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DFKJx1Ahh3v0UX+XIcA9FDmsCCdzMi0P8gllr47ZCeIvFUUaV2NnP+sSaD0NLliDoKi3y3LzR1eZ4hPwZH2QrGVmeEkKDhmRRuK8ZkSdnn0EdMsI52nwKtteLlJkKrmWK1lorg3k5nDN7q8f9OlvoOrH6ZXuPpiyShqQCQ2gu/zx/2EHTSgM6Rm7v1sbCliHWLkfPK2iK5FjXSUjDdgolf8nJIiIypa1tIAn+sV5TPODR1Ckp0ATtoGBmDsKOxN43/Ye80ZdJJcxxoSV0uqjd+u7kKoxjWtZLLUiRnicQxa4UkpT3hioUlOvynIh76IM2RF9FnJZCGUKTA0LkhEKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MlGDhBlhOAtORhjjB55w+SGUPTYnaVLzbdP9oFaQszM=;
 b=WD20FPm0rth6KQOeZvzFkrc5ciDMEFUNYxs9m8GVB5pZyd0R8cI/c3DgSq+iXQXK6gMUtowJa1tAdWy2bHvFq+9g1+NRhkyJw6m+I5tPc8sVx7CEGTWmy4tC24R07CX9DvMEcsuiVz8WXux8DzcwQxC7BsVicrQC4ttK3rI0ss56UNKTiSIETO27rvcleJ8r3pRVxlLXJw8lNw58Y1q6z8SaYezn/7gSbGApf2gANgv3dpw9m6uuRodvwSTWFaHkLBkVWC5gaL4P+QPQBoIq7wGdEOQIXWjK+A5sxgtw3rzF6MGvMTEoau7hWm1xUTkrqasxxPYQhZjOQ6YA8mVMfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by IA3PR03MB8408.namprd03.prod.outlook.com (2603:10b6:208:546::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 10:05:55 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 10:05:55 +0000
Date: Fri, 18 Sep 2026 11:07:10 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aq0MKTz6KIx8N7ZT@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
 <aqpTO-5LTLtRXaY4@nsa>
 <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLIC1UB6I4TK.20EG74BVIVUGC@kernel.org>
X-ClientProxiedBy: MR1P264CA0066.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3e::14) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|IA3PR03MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 28294d9a-ef27-4ad5-e9fd-08df156c6d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|376014|4143699003|56012099006|11063799006|5023799004|3023799007|6133799003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	z20O6K3exUZUR7wCVrdkTNFHjTPXsHZriDG4Ivn2NChzNju1yaDMagHbc1IQ02365RyqymIDlIkPyQqMxdSrieDctUUj5P3BDbigSmg4oJAONdnKbwRHpxiEtoPt2sf/IBAEUgpIUJKNnowyjytT6wD9IJDBsd5ZctFtvLKVZ5TmOWGaAjKaPI3eD/WxuwguaGl2lUoyK6WSafUep2jlHR7FfFqHmiVHnnE7uLNaGcaFZe4UToiETeouLjMJv5XIxbX9mBngGk4hXvC3c1Co2SL2I+rodS1f/78Y/zG4RFJKix45k3Ke0ZhZ3YaqGPD2jh35yOY0Bl/EsjIRCnrfHolTEYpuYdyos7gh640BYcbY80avzLP3QxIUZ2O0KFOHfXB1astMSvOI/JvduEc0a3NtZdZPM7mFm2EJ3rCXMFkS/+stk7h5i8YuxVLlxjYpZfpEOCZh8oJpgzeMs/hrCGhL/Ki2rJXITnZhWnP9ylVaqTEhRaNLDNHHA+9VPvWBxHK03SW5gxwD8zm+g07uEPoSEXOAg0bNNeLVk7mUHGWwaZgXDXgkUchWuhrMx6i1Gjceap0YtoJFvXtVLXyaYc0C59bEuxDBj+aPipraBXzt8y4XBxKQ1OzL+jSOstzDZ5F2iFnK+kvKKiuVh/sL4D3YMqyMwRSabZMsHjyxlDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(4143699003)(56012099006)(11063799006)(5023799004)(3023799007)(6133799003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVpUOUdqblpMTWNFTVEvcWpYdmRnbmxpMkhHZFUrL0cvSC91RTBYRFRQK1FL?=
 =?utf-8?B?UE92a0J5TVN4S3pMNnJNdVo2MWFCREFuLy9QekVrTkVvTk9JOXg3WnhwLzBI?=
 =?utf-8?B?Nm8xdm85YVo3SnV6Lzl4Y3hadEJGN3JQMzhNcCtwdUduTnI5QmtOTXFGb2ow?=
 =?utf-8?B?MHlLVmUxM0lvM09kWlV3WUQ0TURsSHVzVjVuaXlqYXFpZ0FZaTVlNjlCT0lq?=
 =?utf-8?B?UDk1TldSNlZOSUIzaFFEVFNGRXRpbGRJY0JjSzROalF4aVNFSGprblV5RGRr?=
 =?utf-8?B?WHVYbEtCaG4rVnpwU0dpdk5xVkpLSytEQmxtdk81bjVKQUp3b2FXcXVSLzUx?=
 =?utf-8?B?bFF5TldwdEVsbXVVU1NxVW9nSEc3RmVmUEZreDBJeHJRNldMdGRUbkJHZlpG?=
 =?utf-8?B?d1BvSUUrdGRRMXQzODRYK1JXaFhuM09ob2cxWWhlV1ozMUMxNm4rOVBMOFUr?=
 =?utf-8?B?OGk1MFlnY0J3bWg0MzNBUkI1U28zWVFWUURLdzlCNC93SWxWS2F5dGdvMStw?=
 =?utf-8?B?Qk5OUm1KbWVjVTdPRjF4QUxUVHBtV3liNGdpNGdvVWtnZkQwSU96OUpLOEx2?=
 =?utf-8?B?cDB1Qll4elRnQmZmNjZ6SUhCSW45L0FuNFRBcUVwZHgzYnF1NjZkcjIwSFcv?=
 =?utf-8?B?MmxqbXdIMDJ5TFZONytwUElaT1J0SkNPQVlCQlJHY0tJdVBiSkVWN1dvR0Vz?=
 =?utf-8?B?Q2ZRd095R0FDcUxEZUI4OXI0b0UwbWdrQ05IRFJnVmlJaGxZZGx2aHlFOSs0?=
 =?utf-8?B?NldMSmFiYWpYWFd6U0NYejNaejBubXNYM2FuSXhzL3JmZGhybS81SkRiMjZ5?=
 =?utf-8?B?UWhiOTBDTk1wL3FVb2FCV09YZTM3T0pCMnF0Y1hWalE1bWR6K1I1eDNkN2lo?=
 =?utf-8?B?VkdSenFFMkU1eDRzSHcyQWNHUnViMGcyRG5RTHpYdkp0TGh3bWI1R0xib2Ez?=
 =?utf-8?B?NDBBYVJKaVBVU3h2QWg1eUM1Zms3c2tIcGRiQnpyUW5RTUJhYkt1QjZuRUZU?=
 =?utf-8?B?cXBnZlU0OUluallhVXl5OU82b25aSlRqSlVUWHF5c1hqQVJUZFUzcFdGWHNS?=
 =?utf-8?B?S1ludS9NVjJ0ZDU3WU5UM1dqYTZmYThrU0ZYMWJGMktabzVyVXJrTHBrbGo0?=
 =?utf-8?B?cHVZL1pPRm9YbVBvNnRwTTVEOVhmaWFFUnRnaVJkMGhIK1ZZb1ZKMzBkUUZP?=
 =?utf-8?B?R29yOWpaNklXMGcxczQxSTREYnAzdHRkU1g0alRqWTJCaDVHcVl2YTRSRTlj?=
 =?utf-8?B?NWNDZDNsWEVpbVFxY1d2ZytjZFVpNnVOeFJFUEVweG5CWlphVXpqSTVQdDQx?=
 =?utf-8?B?eEFmTFUyeGw4d0hPNWt3ZTRNTC9IUGZQUFFRMkl5NWRIZ29Wd0k3R3EwOFMx?=
 =?utf-8?B?L28vYnllMUt4NUJNM25lYkU0SzNVMDJSWS96eDhYNXVvZFNYL28rQndUQ3Qv?=
 =?utf-8?B?U0dPeXJoMDhkQmVpSzJWczR6dVN6Tk5HdVlIVk9FUEI4allJZDV4YXBiKzZ2?=
 =?utf-8?B?VUU1T2Z1OFpvaU9OT1RCNWFrT1ZLVS85dzBGc01RY0tvRXVOSWxRMDFzdS84?=
 =?utf-8?B?SnExR0UvWkpoK0hHNzRyclNwQXNDVUduanVNbkd2Z0g2NXpCWjUxSkFjcjFh?=
 =?utf-8?B?dDBMUkp5OG52Tk5mbzExNnJTUzFQRGNjRTFlY05aYUxTbHVQb2lKMDI0L1Jl?=
 =?utf-8?B?SGkzdHVTNzhLaXZpQVh4Q3ZkWlNpNEs4ck1ZeXhEYk53UmNRSE1WSEJjYjc1?=
 =?utf-8?B?ai9GR3g3REpnQ29RSDh1M082b1BsZFU0eHpaNS9tcUdISXh6eXZPVkRKMnBr?=
 =?utf-8?B?Y012ODZvNTlMTGlPeVlzWVl6M3JRVDlSenBvZU5YdDRhZHRlUG5QYS9QcUo3?=
 =?utf-8?B?YWZvclN3MUtSVHpNRHRKUjJ3KzVPWjFka24zVnNObUhDL1BaNm4zNnJtQUtF?=
 =?utf-8?B?d3djYW8yam5ZNjBvRzhHV2s1Umt1RjZZeVgwZXk2T200WjRwYWpiMXp1RnVO?=
 =?utf-8?B?TVdNdjRYKzYveWl5cGZZNXV5Q2pnRCtYdVdEb3FaakUvVjU0L2RBcy9YSDNG?=
 =?utf-8?B?MS9TeDJsa0gvUmlTYkF6OVJpcmo1TXpwdjJDRWtFWTIraUR3NjNJRkhiQjJl?=
 =?utf-8?B?NkY0T256MGtPUkZldzMyZW83Y2xqOVVncHJtWFFHQ0VvUFVmN0xHRTJBYy9O?=
 =?utf-8?B?K1VCRTVaWHZDUW04OFd6aVV4Q1hLcEZ1Z094V3JMckJXWW5zb0kxRll5ZlNp?=
 =?utf-8?B?b3ZtQXlFdU5LMWhJLytjVy9kMHpySUJyWGRjVVJCa044c3RNSm9YV3JkWk9K?=
 =?utf-8?B?VmRnUktSczBNZHJmelZESFA3Y0hPdGxrRERwZy91NE8wUWFGRDVOQT09?=
X-Exchange-RoutingPolicyChecked:
	DNQfjypBlBXCsZlROpcJvfzluLvlnxN+Ap1XqHwDv8pNpCkkWgGc+cBgoLcJd2Yobyx0aKcMsW5xnuLtScr4dRUryrlkHeZZIlPOCva8IpRKLF+vXrIdi5k+80E4ECGdwH9332WH/Nqlf/aeVt9OACCHGDBKHJX4yZgBLwZRF79bX/b81KKD6SQ60WL098p5dSLXdDDkOP85I5zQeVX6wyWIaU4HxpskWzr8JhePZ4JwDNTex7pYZNcxNR1SDwdWoSj1urmfV8JiNzDG/135jE/qfs7OUWCjIz8xYpAO/5+aoTMYM/29Cf9ukX4P45MbzI2KBlQ36g5LTPQ0j8EdnQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28294d9a-ef27-4ad5-e9fd-08df156c6d99
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 10:05:55.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BZ+jsiR71+okCdKtr8iBZToU6Kt1VwjKV46OJC5VbZNL5UaTJmFUN9ETKud4T8oGvRKdA1WznVRGjrdu7/citQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB8408
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfXygOe73oXaL8j
 S8qONeoz6D4r7MxdLRifARi+VOuz+DT1nI10FMoxOwd74mTStiYr1vPCey6yNnFycotfu7gTEfX
 lWzT01zCXOuhs79FPtE+OzX1g5Cj+JjOHcUUabg154SlwxYbLxdG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzOSBTYWx0ZWRfX38900YcKSfKB
 obg4i4ECgLqRfqE0IyjxvcMM+poSdfvsBUgf/EY5VxPlY9RUii3EwM2p0+gouxWLTjp9nBX49Y9
 FaU9r2kRSumgAwUwk7ub87r6lcDKZFuxr6yUxFoaBdXH3Vu+9kXb1Gj68P98jf/30GaAOVauitv
 VHl5HHetCWqHWU2dcrzUefXc9ewWgXRJle/7mgwzu93FVYRhKOqjAZQM/zI2FeDoTAcM/WXnzPn
 C1n+m5usgH1AyLZ6Fk0x85wDrzfSLhvZ+CFVaGUeynHYGv+UoX79FRMDi1Jbsr9c8dWFeD5UVrY
 nfwFhbz+F4pOVQjnUHh0pBCA9oAdvbL+MJu9u8zK/KB/ERbHpcTeTDS1mUDGQVzFsARXraF+wMm
 Z13tRzv3vSwgeNyo6X1ljO2B4eLtwkq0EMFDfMHcGSeX5ngPNV5wawGPo6fIUgQohPjEUOAZL+S
 HTg71OSPkS9gAEO5DYQ==
X-Proofpoint-GUID: QyVwrAAd1QlpJUzGXMiDNqSP4mu6RlgU
X-Proofpoint-ORIG-GUID: QyVwrAAd1QlpJUzGXMiDNqSP4mu6RlgU
X-Authority-Analysis: v=2.4 cv=IpqL47/g c=1 sm=1 tr=0 ts=6aad0d05 cx=c_pps
 a=CD2IJdD5qp8L8UJuiUkm2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22
 a=JfrnYn6hAAAA:8 a=4ovWLWta0zXe-DwPMw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180139

On Fri, Sep 18, 2026 at 11:25:54AM +0200, Michael Walle wrote:
> On Wed Sep 16, 2026 at 10:44 AM CEST, Nuno Sá wrote:
> > On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
> >> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno Sá wrote:
> >> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
> >> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno Sá wrote:
> >> >> > (*): I should note that the command actually failed with -EIO but it
> >> >> > actually unlocked the chip! And the reason is because the flash as the same
> >> >> > FSR register than the micron-st flash. So WEL is set to 1 but can only
> >> >> > be cleared when clearing the FSR register.
> >> >> 
> >> >> Why doesn't this affect only the locking operation? WEL polling is
> >> >> used also during write and erase.
> >> 
> >> Sorry I meant WIP.
> >> 
> >> > Not sure if I fully understand. But AFAICT, the reason why erase and
> >> > write is silent is because the default spi_nor_sr_ready() only looks at
> >> > SR_WIP [1]:
> >> 
> >> So usually, the WEL is cleared automatically by whatever needs the
> >> WEL in the first place, i.e. program or erase, write (status)
> >> register. That should also be the case for this flash.
> >> 
> >> Now for this flash (as well as the st/micron ones), there is one
> >> peculiarity. Whenever there is an error bit set in the FSR, the WEL
> >> cannot be cleared by a write disable command. Which we shouldn't
> >> need anyway because it should be cleared automatically if nothing
> >> goes wrong.
> >> 
> >> Also the write status register won't set the error bits if i read
> >> the datasheet correctly and it will always disable the WEL, see
> >> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
> >> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
> >> datasheet.
> >> 
> >> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() and
> >> > give no special handling to WEL so I imagine that we try to set it as 0
> >> > but read it as 1 (given that it clears only with FSR) and hence I got
> >> > the -EIO in [2].
> >> 
> >> We do a RMW, so my guess is that it's the other way around. We read
> >> it as 1, but then after writing the SR, it's 0 (see above). That
> >> actually assumes, that if the WEL and any error bit in the FSR is
> >> set, a write status register will clear the WEL anyways. Could you
> >> debug that so we are sure, this is what actually happens?
> >
> > Sure I'll do some debugging on the unlock path. The DS seems a bit
> > unclear. It also states (for the WRITE DISABLE)
> >
> > "...In case of a protection error, WRITE DISABLE will not
> > clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be issued to
> > clear both flags.
> > "
> 
> Not sure, this contradicts each other. As I read it:
> 
>  - Write (status) register will always clear a WEL, the only open
>    question is, does it also clear it if the protection bit in the
>    FSR is set
>  - Write disable won't clear the WEL if the protection bit in the
>    FSR is set.
> 
> > But the truth is that the second unlock I did came without an error.
> 
> Which might indicate that a write status will clear the WEL anyway.
> But then it might also be interesting to see if the PROT bit in FSR
> is still set. IOW, if a new write enable is sent, a write disable
> might fail even if there was no actual error.
> 
> >
> >> 
> >> But the question is who is setting the error bit in the first place.
> >> And I guess it's the testing sequence for the locking when you try
> >> to write to a locked range. So you could also actually test the
> >> locking/unlocking without writing any data to the flash just to see
> >> if that is the case.
> >
> > Pretty sure the above is the case! If you look at other tests after
> >
> > "Once we trust the debugfs output we can use it to test various
> > situations. Check top locking/unlocking (end of the device):"
> >
> > Everything worked nicely given we were just doing lock/unlock. The DS is
> > also clear about this (table 8.11):
> >
> > "...When a command is applied to a protected sector, the command is not executed,
> > the write enable latch bit remains set to 1, and flag status register bits 1 and 4 are set. 
> > If the operation
> > "
> 
> Ok.
> 
> > I also did tested with basically the same code as in micron-st and then
> > ERASE and PROGRAM commands just return -EIO.
> 
> But the unlocking does not return EIO anymore when it's executed
> successfully?

Unlock never return EIO because we do micron_st_nor_clear_fsr() followed by
spi_nor_write_disable() which should clear WEN. So the error is reported
on the call it should be reported IMO.

> 
> >> >> > AFAICT, we should do something similar as micron so the writing to an
> >> >> > actual protected region fails rather than being silently discarded with
> >> >> > that status bit set. The question would be how to do it? The code is
> >> >> > pretty much identical to [1]. The masks, the opcoded... So should we
> >> >> > somehow handle this in the core (by having some common helper) that
> >> >> > could be set in .late_init() under a common MFR_FSR flag? Or just keep
> >> >> > both implementations separate for now?
> >> >> 
> >> >> I'd like to keep that out of the core.c, but also like to avoid any
> >> >> code duplication esp. because there is already handling for the
> >> >> intel spi controller in there. So maybe move it it into a new
> >> >> common.c.
> >> >
> >> > Also don't like the dup tbh. Could that be a follow up or should it be
> >> > v3. From the top of my head I could think on a mfr_common.c kind of thing.
> >> > Don't thing this FSR register is standard?
> >> 
> >> Not really.
> >> 
> >> But (at least) parts of the datasheets are actually copied verbatim
> >> between micron and issi, I wonder if we shouldn't just put the ISSI
> >> part in micron-st.c. (Yes vendor will be wrong, but I plan on
> >> deprecating that sysfs property anyway).
> >
> > Also works for me. Say the word and I can send v3 with this in
> > micron-st.c.
> 
> Yes. But also please verify the our guesses about the root cause of
> this and what's the actual behavior of the write disable.
> 

Ok

- Nuno Sá

> -michael



> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

