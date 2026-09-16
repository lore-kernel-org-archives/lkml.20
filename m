Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED4647987C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548257; cv=fail; b=KKyvU0BCLFatwh0knnUTT3jDbrjPmbYhLnGoEkV6bG5SAKCNaj3MGHN9JgWR88B6NT9+R52j+UJo0psni7i1tPE6f4rcXmpNLfQF46FjkTcI0IAKAc4F221c6frwDf2zyccLrgAl8hbFFrgti9T3mqdM75hWp/gxFxCXaHNWjU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548257; c=relaxed/simple;
	bh=8wGTXoTWrNiNU4p4Ae1L9QJUBa/yBOs8JENFg01oTN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eL6FmjcfmsWcQJpDvX68ibjUYCmAhll4rNhwT14+QYLbV4n0rVMPYWJ+5CNOBwJRGi7Qbh4p6vVOpWBXM+wvDiU//Fw/fBqk6HKdHOTZ6z0jBI1NhrLuOGpYpCQzX+vit1k5jMJ+jDe5wbWuWFSuMmEvz1lltvg3CjKxx+HdJes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=z7p11UeE; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="z7p11UeE"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G41wdJ3576164;
	Wed, 16 Sep 2026 04:43:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=QGmNU
	AzIxuMW6IOvNwiBwWcGjnW7V9PnE1EWCZAXf30=; b=z7p11UeEihuJbWAvpJFf7
	pPR1R++xuOs2QZi06LXVDZPZjTPVyJeRO6EEdwUOCYKDK/f+P53CpTc6qC53YCB7
	ojVr015h840WBKFKgf6JaRpB9EPk+vIaGNRkK+birPFp0KqgIssMfgvYPqEIy7WN
	YnRExje9efurHJ3qD3/m+mOPrCr9erEMvOsitOSNVGOnv2LlXfffkfglkPnp0ezy
	Pm1ILB6MUXh4SvSDqcxG5God5xp8oPERR4i4aqZwN9E0DrjcobAvSvQQeWBUqI0T
	FOxSWsFgjiVsIBxEhE9AvzJLiNHgpiUPIN7Er0QeZ8nbibIlL69vHaDC/MWjHwMl
	w==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012051.outbound.protection.outlook.com [40.93.195.51])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gq5trc8cg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 16 Sep 2026 04:43:52 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyvAL67BhA7oPONw4+ANL6ajUPk6+59DhHNkbJ2tTkclxrDsXZ2XGM/VPrDThjlWmqC07cmu5372ErCQ6y6UpvKsJNsp6AuXpZgbIwLM5utXyu1MjIlCvTpophGivHMptAEZ20M3yLBoKCluaLnaSX0ByI1Xcaom/JNC03p5yB/GvPe32XycasO3kAn6UdNJirQHJhMhWAwd6NjzndGZIdEWJOkpEZ4BfNa8rVDCVxXAymaqJSVLLmjci97oB4qgMBVOBuD76SSD8m5Bc6ARrlzJ9QEsEHf5rH9y3m/KRcu6vo6AFvmTWfUDpHCYA6qE+s0iHq9dIEnvagbuTdi8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGmNUAzIxuMW6IOvNwiBwWcGjnW7V9PnE1EWCZAXf30=;
 b=LfQIHAkGBWx6KMWlNkinkllrMxPdMgmsi4kcAK5jeJo2vU/qS1HXBRh8zHRSwxFrpJLEuAk5GYDiaVUdhuvaMBvlY6ZFyC1Ic9sGnkKykyz7zAnqF5TXqD6E0L1eIoHaA+rLsJFWi5MdPr7QJX6Y7X0ENNlPvD7omUwCCMfoz5c3ohKAxYwfyeVL1kda7maZ25BBQroJLkQeDKLEPCgoI2W5s1GMUsOExd8c0b/x1avacXmTTDGzQYe/uRgfycTSPshqWkHgYjSChcwI55Ne1bdofq7ycaDK+VlyFMUJ6rBQd8prwf5mAIhjIhDzrX9lGNf65KG/tAWy+TSxQF/07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by MN2PR03MB5023.namprd03.prod.outlook.com (2603:10b6:208:1a7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 08:43:50 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Wed, 16 Sep 2026
 08:43:50 +0000
Date: Wed, 16 Sep 2026 09:44:59 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pratyush Yadav <pratyush@kernel.org>,
        Takahiro Kuwano <takahiro.kuwano@infineon.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: issi: Add support for is25wx01g
Message-ID: <aqpTO-5LTLtRXaY4@nsa>
References: <20260914-mtd-spi-nor-new-issi-chip-v2-0-3cd4d7e434b2@analog.com>
 <20260914-mtd-spi-nor-new-issi-chip-v2-2-3cd4d7e434b2@analog.com>
 <DLF3H41RCZJF.37WOY30CYJ4AY@kernel.org>
 <aqgRsP3cxzcLok5C@nsa>
 <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DLGK0FH8L7PM.1JRX5777NZQQF@kernel.org>
X-ClientProxiedBy: MA3P292CA0062.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:49::18) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|MN2PR03MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 77754a1c-21c6-4970-65ca-08df13cea19c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|6133799003|56012099006|5023799004|11063799006|4143699003|3023799007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	sLt51HubCt97fAg0msz+Fv2Qc5epiKhfah47aKiMgmUx9dwl6g9zPkW6sHl+DqBYSruNFSh7ByFQ/c+q33sgRbxhLZZfi4TInrPOvR3Tr6pW8aG8kkHLz928+XhfXwDa41v/g+SmenYRJESfsc1lPe3c1VK0tISKeKgjZEsFUD5PmGDknu7Gf1oQJFJiHDT3L18gGyLJrKRYHnvzgs6H9ayfbzZvq1382F2z7Gyfj/ucnt2/mxHMH/owB3JwXNlr709crG5jM5uxOVkDdbL833dRoA+SCMDWoix9Ni9nRWyv6MNzd+Ucqkwq665WIsUVBHi8alHQjrZNm9L/vZhCYZcni5CkN6DsNAhm4ZqTwIv4OHaofuGTKSIoNk+qtMH8HcOid3qOvDQUajruqV+rQWRvQ8qxMp6+0G30Itv7FrThrqlOS7yrIp982nvJWMs28GarbXfyzi7Sm7W/J2ZzxZ9BAfGpykAKz66PwTTWOYa9vY9S4J5PFg3egHTlR0+3P+FY3YysBDrHSdYle0/Zg5lqwZ5kz1bFv8jEdUWsmoeu3ZbjpFko4Q108eR96kZiiUoavXz8usXoacJGMeboYtrSPcueAPjZ1VF5or49IzQ9b+FKmr+Q+akfBbPhzRB6tgQ5PjvJl5DIldHfo1dCWwIBeH+WhrLQNeLiRZ4ZjFQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(5023799004)(11063799006)(4143699003)(3023799007)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnFTR2RjaXRQbTIyMWxYMmhLSTk4cEVzSTdNMGFPNDlXMEVER0FlMnRTMEp0?=
 =?utf-8?B?bTF5R3QzamZvdUhPeFNGamZKN0xBZHNsdUhlUjV1aWdpQWg4TGM3dXFYcFBn?=
 =?utf-8?B?SjJvcy80RklmMkRlSVRPdnlZR2ZmUlM5cWFvRlF6MndIWEYzQzIweE5OcHcv?=
 =?utf-8?B?WUZadk9wRjVOU3FQV3U2YUxFZDRpUFBFbElmMi91QmpTeTR2WVJQNkVTRVYr?=
 =?utf-8?B?N2FZUUxsMnNEcHJJajlVUGE1ZXhMcDcvaGZmM3RCZnhTNVlmUHc2VVRUZzRm?=
 =?utf-8?B?eTB3UEJ3L1h5VG1LRDlyRlMwVHRjalVkRVJ3UHBPa2FHbVZENDlWRGpFU0w0?=
 =?utf-8?B?VFhnYkVBclppQ1pOYlNCTGNoa3UyYkxYOTBySkxNRUdmWVJJdG5wSzlnTlN5?=
 =?utf-8?B?NDFkQm12MThCVWs0MGFkYVEwOG11azZSK2czaU1qUHlyQ3Y3T3Z6TUNTNzlK?=
 =?utf-8?B?aTFYNVpUbyt6ZVJWT00vQnlpZHB1RGZhZjhDc0hBbFNPTFg3MmZoY1ZaQkdX?=
 =?utf-8?B?Y2lUWWdweEo4dTlaZ1NJMnFEOVA3SjErK0RtbVRsSUwxODMwcTUrUVpoNkw1?=
 =?utf-8?B?L2Yxa3ozMkZTYVdmTERQM215ZWplbTJENlI1UlFWMHV2UVpaTXYvczlMbzQz?=
 =?utf-8?B?WE1EM1g0Z2JlZ1JJdDZnUUdQcytsZldHcDVVRGk2eEdXeStPcVBCcVBKUzJG?=
 =?utf-8?B?MHNtNlFhMU5PdkdNelpIbTM5VEVZb25VTEYyY3R4RXF3YXM4ellERERUNWth?=
 =?utf-8?B?VEtTenBwdmc0SkhOalZ1YVZDL0VQLzlqaUYycXBjY1dpRHBVcXFOSlBjN3Q5?=
 =?utf-8?B?MWNvZm1RM2Jrb2NOcC9hcXk4WUovd1draC82emJoMEpheU9oMlFHb0UyWEVS?=
 =?utf-8?B?Wnp0S1RFdVY1eHIxM3l3bUw5UjlCSWxMQmxraE5sT040Zzg4WTFaSDhUZmht?=
 =?utf-8?B?QTBSa04wa3hobVk1bi9OTGY2VmNkVVJzTmQ1aThTQVhlZncvYXl4U0xoRnBw?=
 =?utf-8?B?TlpPQ1FDVVhTOGhic0tia3hpdDBpN1JDRXFUNFBmRXJMY25rdXVvV0NVQjg1?=
 =?utf-8?B?MzB6ZW5UbzJpdFVjSjNpVEJBc1o2aGhXRENpYmpDTW15QUszRk1NNUMxVzAz?=
 =?utf-8?B?cGtQUysxZE1VbGIvbWRXZVNmU3dtU3hITTYxelNHMW9kN1pFWFBKMU0wTEs4?=
 =?utf-8?B?dU1DK3czNmZEdGxZWVlNdnd4UHdVM1R5QzRoRkFOVWNqYUhtNDRKcG82K241?=
 =?utf-8?B?WlVDbmhvL1RQTlU1L3kzNFpIRHg2N2FkRUZRV21ieDJhVUJkQnQxdTZ0WHBl?=
 =?utf-8?B?TE10eEtOTmpVdFVIeHJmKzNkUUd3ODA3VlpyVXV1V2x0YVM2cWVtck40UTQ1?=
 =?utf-8?B?dTN1VjFnTFFEVDZtWEx5bEx5ekJhZE5LWE5iNlliRDI2MVdVa1JscytZTDV3?=
 =?utf-8?B?RE5Ydml3anBXeXhFRWhtZk1GUE1JeHlwcVF2dUJXSG00S05FY3RiZGVnWDNC?=
 =?utf-8?B?NXNQS2UzR2FxdWtkWHFZUWJtaHBUSEFPOXFYVFM0dVhvblVmTlNLSjFTUjh3?=
 =?utf-8?B?OVFuUWJ0VGpVYVROL1pzbUZsU1owRTJBNm1XbDc3Rjd2RU05Uzh6RFBDMEll?=
 =?utf-8?B?c1RHTy9pYlo1K1Y3MWZEN1FrdVRwNUsyTlJDVHo1V1A1V2xpUjdjY3ZqVkwz?=
 =?utf-8?B?d3BHQ09VajBWTnhrek80QVNjVkdPajd4V3hDVGY4S0tSSFFsVXhxKzVia1cy?=
 =?utf-8?B?ZkN1SDB2SlZaWjNIdHhuZFN0d2hkeGpzbm5ZQnV3dFk5WWg5TGRzVzVITmhE?=
 =?utf-8?B?dkQxSjdYaS8vSXBRd1NZRkNzRkVTODRhOVl3YVVRb1BYQW03c0FFUC9RaTFW?=
 =?utf-8?B?Qmk2ZWlacW5HUFA4akVDekpTdkM4akJmLzJ4cDNlWmEwUUJYdlFDWGp6SjBR?=
 =?utf-8?B?RkcrUk5ka1JVanF1MFNsOGRlbHMrYVhubCtVMlFVa1c3eE5lZmRrUmV1b2xm?=
 =?utf-8?B?RkFuYUNnVUhlcGd0UGNhN2t1WEtoT3lwVyt0L1pKR0RNdzRSeDArenIvL0tE?=
 =?utf-8?B?RDFXdFJOVzV3U3krOHJNQjJZVWlVd3RmREQzWWVYalB5cW4rNGxwQ1hvTy9N?=
 =?utf-8?B?K2dzdHRmZ2phZ01PWFFEQXZrVkVrOHVtK2VaKy9HblZrNWVhNThSaFFmN3RL?=
 =?utf-8?B?Q0djYkZTcTFRWVF3QVY3R2g0VElxZXBNclcwWVVMOW9hMStOT2ovWWkyUE5U?=
 =?utf-8?B?RkFSbjBIbkkzaXVoWXdqY05vZkF5NHlxaTJxc0dadStzSUJVZmV1VENjek5Y?=
 =?utf-8?B?QTFjVGxzTElnTVBPNWVhQlFlL08wWTRGSXRrNzQ4TFdBREw5cHpmUT09?=
X-Exchange-RoutingPolicyChecked:
	4HXZO7FvG+EEJ8BnodaBzBpBA86LhTlongFVTXw22DduB7omU9Pb3SaC4Yso5Zs153h58vMaMFZ2FBmzudNrQYwTeBkP+ajN9rIfU2FiSTJPDMfI0i0VTtAcZRA84Htvw48LlPXZ4iM9E7/RDBAAFQGcf86kizV/1nsTsBOmIx0gy98RcP1HoeD0boc4McCa0x8PYFep74TDoCcItKIty9ZoRuH9Wsf9r7TTAYmC7xwW2y1LNYhVGqHH/gI+wOztvTqtjzOuGg/O8go345Nx8Qtu9pXyOj15Irz1yL6kv4nIr1v2to8b51jKiB4daV2V8YjgNuvV5X1S3yx6LVxDsg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77754a1c-21c6-4970-65ca-08df13cea19c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 08:43:50.7381
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpvfPCrSYMJGBgFpgfxrxxAV+OnxeJJA70vGx7ns4XKPq4rYCRD1NZly4ag7K4c1ZwuvMPmiBn7Bd+h8KmXi2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5023
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfXxv7kRhQUvw1J
 aReiq5N2PoUZsB12S//FAaLHRtFBD9BjVqjB9Mqf234Pm6er8mP/QM877MH0olMkP7fz7FDDmD9
 Ise5LK09JGc9ZMoDkpeZnZWKbPrGtalbwbHkVyckGl3tX8iMprYk
X-Proofpoint-GUID: Sf6ikGTwPJxXsoTWQa-2hAKud1SQAHMj
X-Proofpoint-ORIG-GUID: Sf6ikGTwPJxXsoTWQa-2hAKud1SQAHMj
X-Authority-Analysis: v=2.4 cv=aYX0Dhot c=1 sm=1 tr=0 ts=6aaa56c8 cx=c_pps
 a=W+em2WlbpAENNNrDSTAr1Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=paFjG48bRarWj7HP55cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExMiBTYWx0ZWRfX34muGGuO1QkL
 mKPZH4VcBilhNJ20eChL0PAK5XX0qt9ji9XSJO8NImqeEnbAjSsmzyGVB4W5+2Tqpgjxw3ccGN0
 x+j9E1GcPKgrwXW1ZQuQz7axk/RhD/76e61vqcyBdQEQFoa9asxJjldwm5dZNz7LM+B+Vph9py7
 sj0XrbVfwwMA1magBJbgZcZGmCqxcfnAzUQR9INTb4OPDTaerRz530/vwwaY/b3ms3FyM7enGKu
 j4/YJ9++sx8tQi9u1/n8IlTgeiHcSJBQEMXs2dVT/96otcEuSpul68HnVolmSLNffm5N7QEUEdj
 31eUSddnhi32VJjo39ySs51W8PqcCfGLo0PTcfZ75GZQgu36kySYy4uBZF9lx/0tsNLjFlgIqb0
 ZxRVLOW5dtdQb19mYw4yKVNU9Vyw0EaWITcgHqnP/KdjLHzaWynDHPrynRhc0KmgqVbsaSWPkox
 ox6GhdnzlPn8hANq+yA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160112

On Wed, Sep 16, 2026 at 09:14:52AM +0200, Michael Walle wrote:
> Hi,
> 
> On Mon Sep 14, 2026 at 5:31 PM CEST, Nuno Sá wrote:
> > On Mon, Sep 14, 2026 at 04:04:40PM +0200, Michael Walle wrote:
> >> On Mon Sep 14, 2026 at 3:42 PM CEST, Nuno Sá wrote:
> >> > (*): I should note that the command actually failed with -EIO but it
> >> > actually unlocked the chip! And the reason is because the flash as the same
> >> > FSR register than the micron-st flash. So WEL is set to 1 but can only
> >> > be cleared when clearing the FSR register.
> >> 
> >> Why doesn't this affect only the locking operation? WEL polling is
> >> used also during write and erase.
> 
> Sorry I meant WIP.
> 
> > Not sure if I fully understand. But AFAICT, the reason why erase and
> > write is silent is because the default spi_nor_sr_ready() only looks at
> > SR_WIP [1]:
> 
> So usually, the WEL is cleared automatically by whatever needs the
> WEL in the first place, i.e. program or erase, write (status)
> register. That should also be the case for this flash.
> 
> Now for this flash (as well as the st/micron ones), there is one
> peculiarity. Whenever there is an error bit set in the FSR, the WEL
> cannot be cleared by a write disable command. Which we shouldn't
> need anyway because it should be cleared automatically if nothing
> goes wrong.
> 
> Also the write status register won't set the error bits if i read
> the datasheet correctly and it will always disable the WEL, see
> Table 29 ("WRITE REGISTER Operations") in the MT35XU512ABA datasheet
> and Table 8,8 ("WRITE REGISTER Operstaions") in the IS25WX01G
> datasheet.
> 
> > OTOH, on the unlock path we do spi_nor_write_sr1_and_sr2_and_check() and
> > give no special handling to WEL so I imagine that we try to set it as 0
> > but read it as 1 (given that it clears only with FSR) and hence I got
> > the -EIO in [2].
> 
> We do a RMW, so my guess is that it's the other way around. We read
> it as 1, but then after writing the SR, it's 0 (see above). That
> actually assumes, that if the WEL and any error bit in the FSR is
> set, a write status register will clear the WEL anyways. Could you
> debug that so we are sure, this is what actually happens?

Sure I'll do some debugging on the unlock path. The DS seems a bit
unclear. It also states (for the WRITE DISABLE)

"...In case of a protection error, WRITE DISABLE will not
clear the bit. Instead, a CLEAR FLAG STATUS REGISTER command must be issued to
clear both flags.
"

But the truth is that the second unlock I did came without an error.

> 
> But the question is who is setting the error bit in the first place.
> And I guess it's the testing sequence for the locking when you try
> to write to a locked range. So you could also actually test the
> locking/unlocking without writing any data to the flash just to see
> if that is the case.

Pretty sure the above is the case! If you look at other tests after

"Once we trust the debugfs output we can use it to test various
situations. Check top locking/unlocking (end of the device):"

Everything worked nicely given we were just doing lock/unlock. The DS is
also clear about this (table 8.11):

"...When a command is applied to a protected sector, the command is not executed,
the write enable latch bit remains set to 1, and flag status register bits 1 and 4 are set. 
If the operation
"

I also did tested with basically the same code as in micron-st and then
ERASE and PROGRAM commands just return -EIO.

> 
> >> > AFAICT, we should do something similar as micron so the writing to an
> >> > actual protected region fails rather than being silently discarded with
> >> > that status bit set. The question would be how to do it? The code is
> >> > pretty much identical to [1]. The masks, the opcoded... So should we
> >> > somehow handle this in the core (by having some common helper) that
> >> > could be set in .late_init() under a common MFR_FSR flag? Or just keep
> >> > both implementations separate for now?
> >> 
> >> I'd like to keep that out of the core.c, but also like to avoid any
> >> code duplication esp. because there is already handling for the
> >> intel spi controller in there. So maybe move it it into a new
> >> common.c.
> >
> > Also don't like the dup tbh. Could that be a follow up or should it be
> > v3. From the top of my head I could think on a mfr_common.c kind of thing.
> > Don't thing this FSR register is standard?
> 
> Not really.
> 
> But (at least) parts of the datasheets are actually copied verbatim
> between micron and issi, I wonder if we shouldn't just put the ISSI
> part in micron-st.c. (Yes vendor will be wrong, but I plan on
> deprecating that sysfs property anyway).

Also works for me. Say the word and I can send v3 with this in
micron-st.c.

- Nuno Sá

> 
> -michael
