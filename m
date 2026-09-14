Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E933A4503F3;
	Mon, 14 Sep 2026 12:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388298; cv=fail; b=e1e+hoAIhTAGzSY4AU9UBli9UA2LXuFZ/C7KxYKHJqLcfbZF3IDYNE1X1t8FykyzCRNH6VbG7BQlJnhkuifEbC6/6QwLNYb/2mXvXKlOsTznBMMQSLfYthBRtvFTzvMkGmdHJRHfzFfNLU6Zy8gr32wXORIe/RGeJfU0yeWHnNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388298; c=relaxed/simple;
	bh=JL9s4GjGkyTMSByyfUDPFVDEyxr9qK7dtyLfD2J9lvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SH5WdqeO0Mid6Dx667q1Tjd2A30XUWP7Arl/HQyWus+Jvc1rUVbXIQHTYLSzXUwquJgBSpO3XyfQJN+5f1VXFI7OcOX51G55djGqPxxTHDyTKQUUcxDsEXVOThbgxx63LGbvG2xlj2ioAByQd6oUDzBe1fsRzQGVvgTkZYqoIvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=xvRyihYW; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="xvRyihYW"
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9msCa3696782;
	Mon, 14 Sep 2026 08:17:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Hg0ZA
	edAOeDu14YD4SHDoEo42aZjTDZ0R+Ou/2Pv4oA=; b=xvRyihYW7zMKi3voDQS+U
	PnBO85QN9CJmpdVQDVHPDEQ4jcXzd/LqUbL2E50QlZhlGuauwjicy93MuQiGCOyx
	bw67IskNhn0IhKYDMI5xqI8U+30g/1LXytYFfYJoSmnMjSmT+puHc3I4PJI80F9I
	iFqcm149CZ9cRZ31yWTWwcH7FwvYaAFLFlHeQUAYC+HuvxUXZu2vNYjYGdyGNJU3
	rVg2u2+FSujPF9R8TXjV9d5vH+Cidp4Bp3wtCZoSko1g51Yi0PPNJB2lJbr4cBS3
	GLKYGgMXpdETKvjxuYNkOvVhZpDRybsagDvjQ7cS9XxEEjfyrfXC0yeGe/ABhvVB
	Q==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4gn0g862pa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 08:17:51 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MyzaTyhVDGP+EbFTxLS6c7j/riQeBpTjMf+iCjxxq7Dq43rhfgEqBNm9/2Wqs5Y+dHdBzbaRgwQXZjnZqmtKwWajTXkVHVcUABzj6ybllroUUDaJ2B4X1gW9NclDkIkkCQ1ygOKTbfTkUBL5rARDM2rQL14og3inxCm06aUVMIFGuLaPd1D7/zeSICekVQHA4Fy5hCl/kq6shrZFs31PS4tKiCc97OnGPYDlssIN3jiH4iLHGjIjfPD4Bg3GaObyk/zePZdwseJOQnfoUh2W8qR+tE2MXQloiKEj3WG8D1ejNbJgEWap4iYqdSQKBRPDM5FkQCNyKPS8R3t7asrQdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hg0ZAedAOeDu14YD4SHDoEo42aZjTDZ0R+Ou/2Pv4oA=;
 b=ANoL2A6/Vr8fGJxAdLKcGP0CyzWdz6+9KMkOo8HeL1PtA3mdxhiWH5Q0OHszt3J6c215DEMJMqlbvqD2QrU2IeeegXgmNiIChVXMAnSx4hPmTt6oj4iB4f1/sMp3RifRxR9Kn0+YbedBViEKwC0sJDX5LNMzVu/UxRU4DVAyVVMBr2Qo13QSccs3TsrBpmjfUZQo+bxzHhr9DCA6rmxLZeDGVLapXNsU+DeEEQEcfoDytKtvJtrF6DYG2D8fsnebp+I+Fw1cuT3Gl5oZnXgqguxluB8UF+KcpRKA/T56S9J/Xs5aTUTm3WFtNdPzNUHzueJANNyaUHocnk7/DMAzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by DM6PR03MB5323.namprd03.prod.outlook.com (2603:10b6:5:24b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 12:17:49 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 12:17:48 +0000
Date: Mon, 14 Sep 2026 13:19:02 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] ASoC: adau1977-spi: drop __maybe_unused and
 of_match_ptr()
Message-ID: <aqflvL8a6mgEAUNS@nsa>
References: <20260914-asoc-adau1977-fixes-v1-0-aa2f0cabd728@analog.com>
 <20260914-asoc-adau1977-fixes-v1-2-aa2f0cabd728@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914-asoc-adau1977-fixes-v1-2-aa2f0cabd728@analog.com>
X-ClientProxiedBy: MR1P264CA0117.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::10) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|DM6PR03MB5323:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b3ad40d-0924-4314-1ea2-08df125a30ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/FBxJbZ8o9ILquf1hdkDQwzyVMpbzsUqlogL5gwfQHIJsDCOhQ51yhLv+9Wrlq6gtaG91lvvOi/ByQSbSsaIt2dLL50gMiEJ+hBXbJoJurP97Gl2xEzNOL8JBx4YrTs4aUtzMu7uFUENvSeSG3zFOrzMB+ifSJdmavNDKgKNXoPYXtQeOzupyah8hFrJ36PWeuZvgyhCTNCmLURQ+bXcseGIRYyG74dDWOsXo8D47Qi08ThHE53I0haaX/oc66OVrEF4GPwOfCzgsr719NAbgNJZIyo8vsLy93rcOMGnJWksCIbB2yEECoOLd/ErxsCYQFHJ/kWS4x72H7iOqAfBKqIJOnYrwMItUcQXbmDUIdkAigP3waqEAPhLSGIAYFTtu45n43hjA1TZFwQu4jpPoaaScocHSfnkUa1nnOWlnmYFzylLBpS7KMyqjppLHE3RVy2UVYwiIxt56R6ebxq9qwpreLYXuqEhTE2f30klVL1aHzgJcGRh+5xNZNGvPqEwxJ35FwSGjl140vv0c6YFHlTx0DNySbkl6eNGcZYLK79jct60TWF9trl7q2V3GUr2iuvospBZphPlv7ZPGfgOdhInbJCAIQ7zj57oDyGKGRVIX6f5Sgd1y0phgHqXgnCaPLWs2mFrhI30Ai8MsTesAoryHFl8K63iMYO9b0sKW1Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk95RGxqdDRpUkZSdmJZK0d3NXBRekx5by8vVHhpVi9sazhQZFhSamxGUGUr?=
 =?utf-8?B?QW5yYm84OEZRQThlVW05UWRkdnRKODQ0bWQydEpCMm11TDBBaERCdVNia1o3?=
 =?utf-8?B?bi9qTm5JQVhTMUlKWlNPSDV1Sy9oV3M3dlQ3UU1BS0RIMUgzZittRG91a0Ez?=
 =?utf-8?B?dHVFc24rMFNrM0ZzdlJ5UVNLSVZzNm94dXhZOVYyK0E5SHh0NUZodkdSbUtn?=
 =?utf-8?B?SU5EbFAxWGhzN2d0eW1tTExUY1N2UU1NNXFvaUxCUjVpUHNJeDhYTlltUEhs?=
 =?utf-8?B?aG9GQUdlQ1NGMzJwd2QwaU1jRFNiVGIzWVk5eWVyVXBFUHV3SHFSbUtJMlBY?=
 =?utf-8?B?YzVEbTNNVEVvQjM1NVRtZlRNc3hOTGpDNzlqTUVzbFVYMCtYL1l1bGMvMUdi?=
 =?utf-8?B?QzN3LzJwdnM0VTgvWWJ0cFBQcmJzVm1MMUtzaFJBRVMvNUlVRVN2UnlLaDZl?=
 =?utf-8?B?KzdLMWhNNElNdFB2WGdKQU8zTUZZMVhERjVGcHFNQjQvbCtaK3dLVDZWK2wv?=
 =?utf-8?B?RmJkQXBKWW5pSWJHRzBBMFNPYmtRb0gvVm5EL3ZUSU9xWlZsUXZtK2NPZUZ0?=
 =?utf-8?B?aWYxeVJaMjZzR2xjMXRxemNiZFgrQzQvTUtUcFhqWE5yek9EcGJiTjZxVFky?=
 =?utf-8?B?ZWZqdHBydUNoSDBCQ25nQ2tpeHg3UHVOOXBDNHdEQXRHTXJRZ1F1bFYrUUp4?=
 =?utf-8?B?YUJNamlyc0Y4d256MmQzUjR3dng1eisxYTZuQjNDU1YzMXByRnhDWGY3LzRs?=
 =?utf-8?B?Sko3WnNoTkhjZWs4M3Q4bTkwdjdMMTdCVG42dW1nVXZHZGs0U25XU3pGK0Ri?=
 =?utf-8?B?V3JGcG9sR1owb3V4M1JablN3UG5zYkZsZEtGMlBGWVJHVmRPTWpnK0RZRmw1?=
 =?utf-8?B?L1ZDTE95RkNLSE5vMmx4cXkyRnRRc25XSFNCVEFvd01RWkpUcC9kQXErQjUz?=
 =?utf-8?B?ejYwMVN6MmlYS0xBR1dzejIyVzM0dGlSRWJXbm9NRE81TkZIVWJJVVdhYzNC?=
 =?utf-8?B?Um9wL0Y2dndkV2t2NUZFV01KUjhvY1IyZU5xZ1hHRHdUdmQvQmhoNkExVk5j?=
 =?utf-8?B?dWlrcyt4N3J1NWIvbmlwZmNGb1JLZzdiaWluQ2JPWFdXNVB3MUdabVZYeGF5?=
 =?utf-8?B?ekdLVU8zTmVaaWFDTlF2VXZwYVVsM01QNUxrT3lwNGxNQmRBN2V1cEEzUmtX?=
 =?utf-8?B?QTVIYlhjVmhCWWhtWEdQRjYybVlNTGc3WFNYRWluSzlYemEzbytXSHY4cHFE?=
 =?utf-8?B?TlpaV1N2VWRCcE9rVWNneEhHWG5IZmk0SVJpWXp3Nyt5SHMrZjJOZUlaak9H?=
 =?utf-8?B?VWVUa2hRcVJwZEE2dW5LdzJ6eGNwKzk4eFdheEl2RWh5c1JlOFN0UU9hc1Ir?=
 =?utf-8?B?anJEeTFuNUJKTVhUU0VJWW5PVU1iRnBmblpQSCttY05rZC8rdDd1MG9iSFp2?=
 =?utf-8?B?dGl3SXJsMDdPb0tEY3MzYUU2c3V4bTVHcU41QlhRQ3NhY1RHQ2FIbXFpOC9T?=
 =?utf-8?B?VHowU0JXallZNHgyYkxKRWFWNGV3NjZCcys2NDRxTDlUaGhtMGpVNExSczht?=
 =?utf-8?B?ZEV3WG54WHpEVCtYTjgzRTZyUTJFOHo1ZTVOZ0pEUEoyVktGQzNVTkpReGlM?=
 =?utf-8?B?NHpIcmFtY1J5eGliRTZjNStQci8wdFpXUlRJVGZaNlBvTW9NMHc5VlRLQTVn?=
 =?utf-8?B?OVhCWjVWb1Q1eWZ3YWhrRXJaR2hhWklDWHRvVy9nZlcxZ3l5VSt6eXo1MWVQ?=
 =?utf-8?B?dy9mc0FxSFJhOTdIK2EwdURFZk8wYjVSVEhoRW5rK05GMVhiUng0WVRCM3pX?=
 =?utf-8?B?RXFKc1kyL3ZtNkh2T0JVNG01L1JBSE80Y0hERVNwbDgvT1JDWmxQSDVSc1NR?=
 =?utf-8?B?UEhGSnBPUjZ6MGY4TmJ3Z0FyL2ovK1hrWmdkRlJNeTN0YUxjRHA2bzNWREMz?=
 =?utf-8?B?clRYNDhtSmpCTjFGdFM2Zm4zNE9uczUzNkJTUStkaTFHUCtiR0pPVGpKbTdo?=
 =?utf-8?B?bW5wM2g0YkVsY29YdjlJeUZhZEtTNDErVXFYaFBlYlMrRjlYMnhaTC9wcWtB?=
 =?utf-8?B?UkRZbnZWMGczV0pobTZZVDR4OXpzZitEV1dWSzFqTThTNDRUSWxTWmw3N1JR?=
 =?utf-8?B?SnE2ZERCTFVIUUFNSys5R3F2NUpIZjg4d09JVExlQklZazhxL2hXakRyUnlS?=
 =?utf-8?B?R092UndJem1lTDh1bE9RVlVPdjRjWmhzYXdzcEdaWlZvZXVJa3Q4VDQvSGNt?=
 =?utf-8?B?OGFlVlp5Tkg1R2N0cVlLbmZCb3NLS25wYnNyTW5oS254dEpoQTJjL1c5alJR?=
 =?utf-8?B?OWM1S1I1U3J3NVpUWHRxZG5uTWVMQ29xbUs3ZUhsUTRlOEtiZ3RXZz09?=
X-Exchange-RoutingPolicyChecked:
	RY7hSywLn1svh83GURfm4Ufpl8UPAK6g3Esp7aa5MYpyI36RHRDEMEjoV4DvDNL0L5GpZI+n4or+SbRPtxWJI7ZF1NiXkv+Q1Jq8sxvPNMoQ765s1vjLh3FsNxY9wdsh/7JYYbdPVAZq/SDbGcDXF/osOk4je3vsEH2llsVQAz2SLFWnQ/E0CF0DrfpVskN/xCduKqEZrdPNF6a6tq/QWI2c2AN5JKx1C2ECVENGG4gqHJ5GqXdtARKedEeZFD//o7/ywVZuevyAX6al0AGKTklx1cLVrdhZ8JIQ2YAAiDJI8/17FE7ELfZ+y4mOaO8ulAYptumUQ9fLK1JLACveNg==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3ad40d-0924-4314-1ea2-08df125a30ba
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 12:17:48.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjC/3jwB2LxfT/1CSIc+nCR4Dy3RTktzxGf2/TGIEHWHIZTKme73NyTcINfR45WY53ZLwVqojoeBw6kCS9XtGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5323
X-Proofpoint-GUID: hlnFU0UI6yi-7DM3L-2Cz2ZI58pd-cUq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfXx4CJvv96oBBE
 m+rVSwviih3f+se20O0Jw5sKnFPTwACo8Vh7dajYfj8qUcpG5jkjlVXxW41FCnwXm2gsncxwl+t
 0twjk64nP+98q7f8DF93Gsd3+QLST3d9DDIiB22ty6QRIMv9NIr245xnuHHt4SWu4IDzAP6tJeM
 mIOVNTw4F2jpck42bICUPJVFld7eaK/h1UbdozS7AYMRAEAKgowzdxI5h0/AMGkYuQWj06tythF
 UHx/vY5pZ+B5r2IGA2xKxiE2RinbhQPXlf2Nq/MktE6j7RuZLEgwP7WLPD8YCbqukQy0rybrEE7
 kq/PBMqLT3DP/wGl8UtXymP9L9EmvkUgovLoHG5TeHx+WRkwfEOhHICGovxzBv7sS8MsLlJ1SDD
 bOgLDpKMRBWYDsmPAxa7hSAtDGqMwXJuweMVvxivPHOcFTLIXuotfGTldivhKpmvw8arfosXt66
 lTSzJ7CR4Pg5T7Xr26g==
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6aa7e5ef cx=c_pps
 a=kCLHszyQDyOf1WNTVQSbFg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ugNRTJOwpmtT476g4l8T:22
 a=gAnH3GRIAAAA:8 a=_5uSoa3ePiZ8Q5jXrEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: hlnFU0UI6yi-7DM3L-2Cz2ZI58pd-cUq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NSBTYWx0ZWRfX1F//SqmOqtJ3
 7ETAYbSBJkIBpb0Q0fXMvydVb8GwO5KwPClbfK50eKujMbPwqrSTWalWXIezEH1Jb7ljhVXGFg3
 jCKpXozyPDmwiOVoRRVgg8llBLebI1nPlhY92H58DbjOOAx6+6Mp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140175

On Mon, Sep 14, 2026 at 12:12:36PM +0200, Alvin Šipraga wrote:
> Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
> modules") MODULE_DEVICE_TABLE() is enough to reference a match table and
> the data isn't discarded by the linker even when the driver is built-in
> and CONFIG_OF is disabled. Drop the of_match_ptr() wrapping so that OF
> matching keeps working regardless of CONFIG_OF. This also means we can
> drop __maybe_unused since it's always used.
> 
> The entries in adau1977_spi_of_match were also erroneously indented with
> spaces - replace the indentation with tabs to conform with coding style.
> 
> Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
> ---

Small nit:

>  sound/soc/codecs/adau1977-spi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/codecs/adau1977-spi.c b/sound/soc/codecs/adau1977-spi.c
> index 878cde9d1014..c98da5ba9e9e 100644
> --- a/sound/soc/codecs/adau1977-spi.c
> +++ b/sound/soc/codecs/adau1977-spi.c
> @@ -53,18 +53,18 @@ static const struct spi_device_id adau1977_spi_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(spi, adau1977_spi_ids);
>  
> -static const struct of_device_id adau1977_spi_of_match[] __maybe_unused = {
> -        { .compatible = "adi,adau1977" },
> -        { .compatible = "adi,adau1978" },
> -        { .compatible = "adi,adau1979" },
> -        { },
> +static const struct of_device_id adau1977_spi_of_match[] = {
> +	{ .compatible = "adi,adau1977" },
> +	{ .compatible = "adi,adau1978" },
> +	{ .compatible = "adi,adau1979" },
> +	{ },

While at it, you cloud drop the comma. We have the null terminator after
all. Also applies on patch 3

- Nuno Sá

>  };
>  MODULE_DEVICE_TABLE(of, adau1977_spi_of_match);
>  
>  static struct spi_driver adau1977_spi_driver = {
>  	.driver = {
>  		.name = "adau1977",
> -		.of_match_table = of_match_ptr(adau1977_spi_of_match),
> +		.of_match_table = adau1977_spi_of_match,
>  	},
>  	.probe = adau1977_spi_probe,
>  	.id_table = adau1977_spi_ids,
> 
> -- 
> 2.54.0
> 
