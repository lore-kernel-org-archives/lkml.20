Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091144;
	b=ImM/pkBkv1FVO2ZvM6tzXY1qV7ANSNNJmmoVm4lZk4g9QJZ4zKg5aiyF9N6VS+4Zjg68
	 bN51rzUkLP7Ls4HtCielDO+JluVAh8xTUzNnDq2Nlk7BlbLCR+mHm1SA3QWrBJEgCKC+C
	 QHLYTbG+2RbchAkgSZ0c9+lv+fyHpbtO/2XSpdO46WZegEXoc6HnWffAoeg9IrJnlh97v
	 ykDeByViq1+Tyf4i1mA7udKldprSTZ58wsc1GG3IbbmqKZsrO2NegQhEYSEhxuRhzW8UF
	 t5wWGWqG6iG1Iy3YPXWGlZYaFTpsd5pqN4tm9SFSBiokDs6mWAl8HbfO0lU1XVNb+ZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091144;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=/bzOZ4MxFeHnxUoYgeCOw803kUqX5jaJ284eC6sI8jE=;
	b=Vksprvo5TdGlRsrWIvORA9s2E/8m3ZTZQg4eI/fHvNg3GAyypHcQWHOhnFXVMLycflJh
	 5Mmbxc8U1Hq3TeOQ1XLeIXCLRWL764MTBeiB1vsgoCo8sBwexNYSarQd9GAn3nr4OiTZY
	 BqSBLDHvVAy4UirDQpRtsLYYEXJtRNvrUYY//xq2bl6Ix6okRDtkTyELhsn1PNngFtwQr
	 XkWL7THSS74iS3Nd3YSOstH0AXSDD0+x5Q8m6EZfz39Pq7RxLF2C2QGxD819HOMqS/GHu
	 74SqiGB1b4/S2Es5i12tIOmEV9sohfdTg520LudClK1vfEfGqsNZROrwjoQNORg/P0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b="m57Eso3/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E63606A31E;
	Tue, 27 Oct 2026 08:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E63606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=m57Eso3/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EdNvWL1U1Vvmmg13TNdvMMubkmiS6dYEArdmk1Is8xhVVtJNB9YjgoZMO7QT/3HmzAoQAnSKfq2yt8ZLcVYUJ8xyUc5s2wOzZGuw+sVtyTrlWyUiIbb4HCaSQq+alF7ssEV0CfhtIRYy4yiiqbidQO6gGqNWnggI7eyuYprjFkXS6y073roOd4yLBaSWTh02yFycUSSkgjJQILdTxh67ttQEyo6RFE7VMtyEd6kssF+hNN+1hJAO8bMPTuQdMKk1PfSSNKiVh6NhsbhVH1bS2a/VQtahUBghTeRDaKlmB3arPnnQQL9hggK03yFdhNjUuHShpdkSjok3ZzX1YgSxiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bzOZ4MxFeHnxUoYgeCOw803kUqX5jaJ284eC6sI8jE=;
 b=nxRigTg6flr7UAaOlPOOxFPcXARP9yn1hA9uV9wUEIQ1GinZoUJn7X7PsyITfUVntO/bXu7bxKKSCDSrTw1wIfrx7iKtNOSRgnWYgNFXQ/LuhGr7PGWM/3Bt30wnqYn8wMkMPyZ/1hR+VTtmHB/HgGceja+PxQh2XUfrMN1fidJ/rvP/iyWLu8qH55YNWSdJk0XP7hPiS6HDislbZ6grMZ6cVcnC1NazNwAgqw1V9q2BPZhKrX54FF7OKYIE54ESSRhn8SvVLieNaaZ8wEnK2a5K09ORBV9dMG+RQ/USXNDtRizTliN6zAZFKNLhUYXZYpyfB/AeoiaY7AelIia5bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bzOZ4MxFeHnxUoYgeCOw803kUqX5jaJ284eC6sI8jE=;
 b=m57Eso3/c02g0xZwvxyuU0EvJg6j5sW+t/RyOTDlvIks0Zr6kcva6RHfNJDYiRCxBPQLd9mQaF7TjefykiTaB8eldeyzhO12Q4mVxx6J2ji787QepaDEHWpkJ70NVk3+gHAAcpvKRlhbfQCcGG0q/Lkkos7P30ncE+L6aO4Qz2g=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:51:55 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:51:55 +0000
Message-ID: <71ecb260-ce13-4107-8c97-7d1d75899b48@amd.com>
Date: Tue, 27 Oct 2026 16:51:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: amd: isp4: return capture buffers with
 V4L2_FIELD_NONE
To: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
 Nirujogi Pratap <pratap.nirujogi@amd.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 "Chan, Benjamin (Koon Pan)" <Benjamin.Chan@amd.com>,
 "Li, King" <King.Li@amd.com>
References: <20261026182442.229869-1-saif.elden.hatim@gmail.com>
 <20261026182442.229869-3-saif.elden.hatim@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20261026182442.229869-3-saif.elden.hatim@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY6P301CA0010.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::10) To DS0PR12MB7747.namprd12.prod.outlook.com
 (2603:10b6:8:138::20)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7747:EE_|DS7PR12MB5815:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ded67d-21e8-4ee1-4455-08df34078da0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|261026121527099003|56012099006|4143699003|261022075727099003|261022115727099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|18002099003|22082099003|6133799003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	oRkwCyy4Yq67+4GPitOXcVWtT9Prp47n5L5UhIKzJLP/ISdawuBBjd/gUFsIOZZ6gy9LzQvc/0TgFRKrOJw3UCglgq9nUxLaXrsyReY6uIYNv1kgrLp9lsSDQ+fCGJjjgwRqzDzemp6fbEhm86NIusbnvdNF0RKlCRRt8PNmE/aiV26A9DKu38DcaPId1DojinxAQWIIn37+HUBRf5lmvAiiQ08zVApPyZRl8oDYo1/uBKbLzXyk8o5knNnvRAeHc28Kh/WtEdzvvbg6XQuK3Yvrhm6De0rPNZAGS/9e0DwVCP7fad5Ca3rpYQXYN5eM5IzeoRTeI7TdyX27WRqUOPncK2J6zaZGzcz6StLJHbeGL1IN1tEHeJIyT99UPFj/T0ZrskOrzT6W4AAsqMaBFI7aSgtMzSbOyGO7xL/QTU2RVQnViiLc+U/P77zha75JbTvWeZ+fFAiFfZZMvOCEZQIW41xi180RTSCUZd8jQTlPv69hvQ52VhXYxrZqkcxcsQjGd7ROsHxFcdUar8Er4IF6MGOg+tQWhNFyN8zPCORzm9D/+i1kRlqDIDnXP1KWNkISpBdov1mNjpdf/T6GTTaM4vYqC/SUTNp9WRBl/W4ypq9umbkNh48VvR8SAUi0adnaQzFNaMef/PxJwdJAJKFoAdAx4L9rKejNI7cphAk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(261026121527099003)(56012099006)(4143699003)(261022075727099003)(261022115727099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(6133799003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZnlwRk42U2tlNVl6STJNdDR4UHNwS3JpTjRHZXU0N2VHSmlXUGhMdzRJVmN3?=
 =?utf-8?B?Y0dMMlBZQ05wUUVaNGVtaVVibmdxSnppbVZRaUdWcTJ1bVVVSWs2RUNieFhq?=
 =?utf-8?B?TkhuRFhVNzNST2x6cUZxaDdrTEt3c2NLOTVoc1UwVjVUTkwvL3RXaVo3ZXIv?=
 =?utf-8?B?WWxWODdrbmRzakh1ODYwY0hhblpBSG5kUy9CR0kzdm9RbWFmTmVXQ3ZvK1BQ?=
 =?utf-8?B?bHFhbXQydHJaNjNRYldFeEV5dUExZzV1Zks0VVBrdmVLdHcwejRDcjJ1ZGNL?=
 =?utf-8?B?TjJrWTlibEhGVi9ubVB5OVBRWDJYdVZQbzZFeFZQZXpTd2Y3bU9lamhEeklG?=
 =?utf-8?B?UjB4VEpuZHJHOEc5UWJmc1BsYUNZMlhwUVNlbi9jZWZIbmdUdmdkWnNhd1ZQ?=
 =?utf-8?B?dk5lV1pCSWtaUG5MWDhYdC8zbDZjbno1b01tNWZMUzVLNS9mVkt4QkIxMGdn?=
 =?utf-8?B?YTdzQ24vcjhEd0Z4ekNtZ0tEdU04bW5Yak4zRFg5K2tvYy8rK2Vubmt3U2JU?=
 =?utf-8?B?cDluVm1ZZVdRY283U2hWT245TmkzdFZuR1cwMjliYmYvdm1XbXlWbWJKeEVz?=
 =?utf-8?B?c2t1Y3NiSktVTmNJZzN3WGR2NGZjWU8rdVh3L1o3QTd2VnhHM2tvMzN1TWpR?=
 =?utf-8?B?TG9jMTQrWVBIZWdtajJVSkE4QXR0YldEZWR5MDAydVRwMTIyK3YxVGc4SCto?=
 =?utf-8?B?SzNQVkwyL21MR3Y5UC80bFlVdmpSR1Fzc2dNa1VKeERCdDV6dWNKVHpjUTdC?=
 =?utf-8?B?MXVzZTFFWWVoYzRacEo5a3RMRGxVWDhTVkVMbnlQSVRZcEIzanVkL2lZeU5V?=
 =?utf-8?B?MmFPUWNDNDRCY0pwUjBJZnVYMEdCbEpaYjN6bkRhK285di9mRXBHWGlObXNE?=
 =?utf-8?B?SjkxZHJhMVM2bFZCK1ZFL3RuQWNqUnhiemd0TXhFMjVGQy9tekJmS0tYb3lE?=
 =?utf-8?B?T0txQzVEVDhwd3R5Z1V4bHF3bDB1dUxFclpaTWxiZTdFaFRYaG9XNXdmNW9o?=
 =?utf-8?B?WmhiV1B1RzZudi9DbDZkWmR4VmJETUJUcUI1K3hWQzZQM0lIaGU1dC9nZGlN?=
 =?utf-8?B?VFN0YWYzajh6djhmbnRFSmlRMjF4YkJ2RUc0VHo2bStVOXhycnJNOW5JVmd1?=
 =?utf-8?B?STVQZ0tzMHRHTEUxcWNGWHhueXplQzloQ3lLaEx2dHZLTWN5OGl6b01ZR1hi?=
 =?utf-8?B?UUhNZmErQTJpUjhWd0NpdHpUQWpLTE1kc2JDUVJCaXhhQjRDUEFQWlV3aVFo?=
 =?utf-8?B?ei9XQ2FwODBVamZHNkh1VGZJalVDQi9PaVgrT3lTaXllODU0ZWhQTU4wMTVN?=
 =?utf-8?B?MHJzbEl4RFJrQnlpeCtnWWdLSXZGbk8vSWlMRXJFMUxKWlZBL2JWUU9xWitU?=
 =?utf-8?B?VEdOWmVmeVczYmt4R2NveW1TVEVUSXRZcEdmMHVqeEQ4REhuU2lITzdUbDJ2?=
 =?utf-8?B?VE1OeHJ6YktJVzhvK1VGSWl4d2RVSy9uQmtNeEVVdmVzMUZEWmF3YVloNkRY?=
 =?utf-8?B?eVZwbVpQYzdOVmFHQjFOSEtoK2lhaTd0ZytHMisxakRFa2xhZkZsdHFNQWox?=
 =?utf-8?B?RkJDU0t2c2cxVGNOQXUrcDNMKzJGVmp6UGtPdXpZdGxyQTdJbWhVYU0yNGhl?=
 =?utf-8?B?M3ovdFVPUFdTbjdRNFJnNkVUeC9lanJNMGpqLzNlUlBNYlFFc1d0c0kwNnFu?=
 =?utf-8?B?eUdjalM4VlNXUFIyWWRDKzBHcXkvbG1aVXAzYkFQdU0zZVdpVEJEZzNGcHJi?=
 =?utf-8?B?b1V2dEl6WUtocHNLWjM5VHV6MUxiZmtReW8wbWhJT2JrNGVMS05YdklTbzZ3?=
 =?utf-8?B?VUVOd1pQeTNEcjhoeU1Hd0NWUnlyK3VVcU1pRTUzUGxxWXBHQkJhWmovalNv?=
 =?utf-8?B?ZWFJRi9KSXlsOXUvSlBEd2pkMTZCR0QvNERvTWZDeHJQdHZwTURQS2NQZGxj?=
 =?utf-8?B?UDl4TGIzQUNHVnJocXI1emQwN1ZRdG9NSmVYb1Y2Q2N3TDFKMks5UC9tdEVW?=
 =?utf-8?B?L1VmdEQ2Nmd6YTlSbjFaaDNEVERhZHprd0ExMCtoZmZNOE5yTnhXWXZ2Z01J?=
 =?utf-8?B?Z3BHem5pTzNKSjREZjZsRVVTQ0lubm1yMVYvY0x3UHg3MlhGbDB0V0pjWUtk?=
 =?utf-8?B?ei9YaXVsSW1GZ3J1VGNkbkNHcEpHbENkdThzRnpTZFBYNlM3SE9FVUEvV2Zi?=
 =?utf-8?B?VWxzMUNUZjczUnk1dHhCRWRPVG03V1dYNGJSN2ZGdlhLczFHd3RvTVNBbFg3?=
 =?utf-8?B?RlJnVDh5RDZQSHBCY1pMME9sZk5jMUhPTjNWSHVEd2RKaUlMS2pBWHI5Qkgy?=
 =?utf-8?Q?ZdJrBdSsa51LeEhbGS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ded67d-21e8-4ee1-4455-08df34078da0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:51:55.7827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qrVReezL4zJMm3SuZzLEcg9XH5fXjlu/QVm2orY4SiJf0mcIaLB7y47ZE9mf+ekz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815

Reviewed-by: Bin Du <bin.du@amd.com>

On 10/27/2026 2:24 AM, Seifelden Abdelmonem wrote:
> 
> isp4vid_handle_frame_done() marks every completed buffer as
> V4L2_FIELD_ANY. V4L2_FIELD_ANY is only valid as a request from the
> application; a dequeued buffer must report the field order of the
> image it contains. v4l2-compliance therefore fails the first MMAP
> streaming test:
> 
>   fail: v4l2-test-buffers.cpp(419): g_field() == V4L2_FIELD_ANY
>   fail: v4l2-test-buffers.cpp(1280): buf.check(q, last_seq)
>   fail: v4l2-test-buffers.cpp(1735): captureBufs(...)
>   test MMAP (no poll, REQBUFS): FAIL
> 
> The ISP only produces progressive frames, and the format ioctls already
> report V4L2_FIELD_NONE (isp4vid_fmt_default). Use V4L2_FIELD_NONE for
> the returned buffers as well. With this change that test passes.
> 
> Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
> Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
> ---
> Testing and AI use: see the cover letter.
> 
>  drivers/media/platform/amd/isp4/isp4_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> index 58ea8d6ac..b8af3c766 100644
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -72,7 +72,7 @@ void isp4vid_handle_frame_done(struct isp4vid_dev *isp_vdev,
>         /* Fill the buffer */
>         isp4vid_buf->vb2.vb2_buf.timestamp = ktime_get_ns();
>         isp4vid_buf->vb2.sequence = isp_vdev->sequence++;
> -       isp4vid_buf->vb2.field = V4L2_FIELD_ANY;
> +       isp4vid_buf->vb2.field = V4L2_FIELD_NONE;
> 
>         vb2_set_plane_payload(&isp4vid_buf->vb2.vb2_buf,
>                               0, isp_vdev->format.sizeimage);
> --
> 2.56.0

