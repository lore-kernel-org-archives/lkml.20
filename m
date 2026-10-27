Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091143;
	b=rBqnupv2ZNgzF/gErc4HdBm2tNJnJQQVcK5g5gEKWLHJDmaebvgPCD0WtMswtvjaBqVT
	 M/VKLjvghWJF+9b8kpmdLuUiTsH9Jka/Jgv+1JZxW2THsoGLDvdGG9v6E+sRI49ky9waw
	 qySU9SZVZ89bHZHAEijH40cuPbkeoeum1QUE/5yZ2gp22P6xIqGjsBGidL9EivOQ3xvWW
	 ZiDfw8mq/6KEMSyDgsRWzuBye+YtvkUMHZIJQgIVu0tRjkBdKVPyG7C2iqz8Mh0ESjp2U
	 Zpv1ki3JumYhcOUrNSOzsc3UXaus2jOepr3zrNEuqaXTueMqnM2PgFWIQC39jpdT1+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091143;
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
	bh=MX/CFeYlqviYPEAg7kIsLI6222amXs6Sa00osu1TjYw=;
	b=KbhjeRcnQuA5nHdW30AhcmQ05ZWKb+O4BN1d9tQGeAi8NZmFMFiSYtshOIAaKFROy+QK
	 4ltjgz82H9c78Rvw7WpR2+IKuh7V5K/kDEmstNNXWFghuj36u7a2J1dQiqTwVqt2ZxB7o
	 e0sqkboiPz/dL+PxU5M4TyiUuwN+flr2qkYYis2tBMsSEva8TlSmi1PrnwF/2qi+9EKkv
	 gSUVGOMdFbK/3G0kpu1uPw4gKhhgwN+5uxDrtwLXh87hWwTa1syLPZmCxueQpMt+d4wAQ
	 qKc04kDhaxCwzmLNvcwxaBbGjYPylEeSl5A0uum1k9CwqU4pkNDVgKNBFZMKZX1S55A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4EJEtyPD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.61.68
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010068.outbound.protection.outlook.com [52.101.61.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFC3606A31B;
	Tue, 27 Oct 2026 08:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EFC3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=4EJEtyPD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ln3QGjPtRSVak+1nLQ0H/adKraky9iCk0wnmzbkYjN4O8vZfK7NXNRUdoez8y06+WkRs/8aS1ZfQ4+ahLRlG9XmuD8Ghma9i/U9EcnasttoouUgLI9Yw198oRC6SAhVBpVvURW87p8u3HVRnpYWmEyP9yC/LObpCqkwGpW8ak7/AfiFEdqjE0g9WPBMJU3QBw5YE7npTFOjz3gV06WAyiUxB1dnrNixu5k4h/2rYusSNRDEfFu7OwhL8e3hOfCt6gGXWINDQSbdnDo9RYX31M9tM+yyv9F3bxbSTmclj3LNRsen2joJCxaOFG2oIb92efakIHBOPTbuxInbvIXHAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MX/CFeYlqviYPEAg7kIsLI6222amXs6Sa00osu1TjYw=;
 b=f/Jbdy0VV1vethrK7JTkuwkCEihuo3D5jkWluXxdXyf+pJVUt7HK1K0nOQCM2awBlpApwfa8bhjjN4xdC5ci3uCkS9SG1TcgUWl3+pzVfhbA9iDtCxdnpNONNSV2FFZ4rthPNdjs5E425t7eVxkJ5dVB9mthzFsFH2JAYhkXsrWbuwv5JVDrTRqn5vD4TGjzO0VfqgxOkiLXOo26BHDlxyrCiKDoNPY9UP3AZSLU2IMaS9Hnruq1yiWX3KYmZclh4P/f0VzY1vtIxECL0/iHnVqpIVrHOOyoZpGfxyGzqdWdJOF+Bv8ut0IYN3KSkaIJvcfZyjpCc5dzJEXUTXlxKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MX/CFeYlqviYPEAg7kIsLI6222amXs6Sa00osu1TjYw=;
 b=4EJEtyPD5t9OGKBav2DD9nowxziX3id1bY7Gdxv9P41kWVsrqJ0mim5JKr2/j58TVZtYVnrUkZ/5EgjYOGNx/DMNjE7KjvYiWUP9maUSFuoSoEQFCdFQOGSquRQcfPxf8WQ6fCKHrks101cjA9DeyAUx9W5SoEU3DSFmtD/txx8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7747.namprd12.prod.outlook.com (2603:10b6:8:138::20)
 by DS7PR12MB5815.namprd12.prod.outlook.com (2603:10b6:8:77::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 08:51:41 +0000
Received: from DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589]) by DS0PR12MB7747.namprd12.prod.outlook.com
 ([fe80::2ef2:e88:4708:b589%5]) with mapi id 15.21.0546.021; Tue, 27 Oct 2026
 08:51:41 +0000
Message-ID: <8170cb29-05b2-4ef7-84dc-2e89f5b381ce@amd.com>
Date: Tue, 27 Oct 2026 16:51:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: amd: isp4: hold buf_list_lock while sending
 buffers at stream start
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
 <20261026182442.229869-2-saif.elden.hatim@gmail.com>
Content-Language: en-US
From: Bin Du <Bin.Du@amd.com>
In-Reply-To: <20261026182442.229869-2-saif.elden.hatim@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY6P301CA0007.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3be::17) To DS0PR12MB7747.namprd12.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: fa8f11ab-1a10-4545-5838-08df340784b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|11063799006|261026121527099003|260925021311599003|260925021911599003|260925022911599003|56012099006|4143699003|261022075727099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|10067099003|18002099003|22082099003|3023799007|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	CZC9gOVvvz+w9xiSGtFczvOnG/FyIHUxyTBsU4YPXsGhnK0aVI0a9ghoT95MEFwSZ0rJxyiSnky8yS4+A/wsyN1AdMyRE/MY5t4ULAooGRJ/fRw+k8Q2QysGf65EV2ZRO25bO6x8mJ395ntyU6nS75+7MkxRdtk+j3ql5yPS5j36gcS0HD8McHxHt4g4Z6s+D1QLMtUBzGKnTmwCB7ZiT7K4WfzBnHP2bOd90LurLNyLftXYQz/Fyo5OIYaKKDAYYddnpXqnQE1qWhq4Sxrsds5SkDnI/pYc5+eUX/2ju/Aman4aSWJuxcieZiR4IWkYJDHE77SSZKuSosicVY+uxYrSanipP8woI1E/6kMAHoY68FAeZCjjY01YQXxAzPCaUqH5hWuFgVVmBRb+an3c3yubnmkBA9+He83SUzrDKS8fclf5a9nHOQNU30+TQ9xx8gCtEJufDhj1FOGiiYqSaSZS8B7ELZy5Yh2VLf3zYAPRbgaAFMRzFdYtQa10sIJWlwls3eWXY6D1gGqH1mlWmZTe2/CwQigUJ+xNuUjCwxXhBctZFp0aaZ7ov8vvDqaPHRwRkdWyAknE/LYOpUJc6QXW9KC+FSjAhP6kYxq3SRh70BS/Gq1UvX/NMjnIcWFMOSexjetflKiLMtDcTXsHWzysbbYUVX2DHznkMaIeJ1c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB7747.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(11063799006)(261026121527099003)(260925021311599003)(260925021911599003)(260925022911599003)(56012099006)(4143699003)(261022075727099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(10067099003)(18002099003)(22082099003)(3023799007)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGFXMEkwTzFMYWhhNUt0MGVBNDBTZzNYalJyeTIvRmg4RlZVNkhyWjFwUWZP?=
 =?utf-8?B?a2E3K1VjSWkzSHU5S0wxYXl1d1ZWdFBxcjV3UlBQUVRjd2hsL3JVbW5SbnJB?=
 =?utf-8?B?T01JSkVEQm5RZnFpQy9IOFQyUU5KMGttcGgvdVJIWTNJUDRUUTZsdjJRTkxK?=
 =?utf-8?B?SDR6WGo5L1JlNjBpZ01yTmp1WG9FdTVHTVoxTk5DUktxR0V5M21icnYxMzcx?=
 =?utf-8?B?MjNCZlJWRUpWUTVyd1BhRVNhWisvR1U5QXE5bDFwWjI4M3UwV3ZCQ0dFN215?=
 =?utf-8?B?SnRxS283UHYrMW5NTVllMEptVVdBaFpSWTZGQWN1TmwvRUsrOFlLYlJIS2xn?=
 =?utf-8?B?cWZUbTFLOURPaDFTZWZQeG5XN2twcjU5RVR6VXRvSGoxdmx3RlpvZFcrOU1a?=
 =?utf-8?B?QzFLSk14Nm5zcGJVWGprWjhsYm52NGNTaHFpLzQ5WU4xZ2YvU0lOSXFCWm9F?=
 =?utf-8?B?MjFtSmx2cDBhUHV4RjJvWFo4UFZmdll5NmlsSk82c1RwcGpZMmZVNkJtSVU0?=
 =?utf-8?B?bFlPOGJWUkdtMkIrM1ZGbnJGNDJENnpXOGwwV0JvZFlLWjVEd3BGZmZqTVRh?=
 =?utf-8?B?U1ZHRTVZeG9QUWhxemlBK1NiMndKMFJiaXd5blNlVGJTODlxOHJOaWN5STdG?=
 =?utf-8?B?WkhFTWNnbktKa2JGdXBsZ1VoM1RJdEdJdlUxSlZ5dExBVG9nYmVXR0RvZ2pG?=
 =?utf-8?B?WUVsSDRSMjl6bGRxb1RMR1JWUjFmL3RCRGVLY3haZ0RyTG5QNmk2OHRHYisz?=
 =?utf-8?B?ckxXenlYT0lVUERPZThIMjdoenBJUUZmWm10VkM5ejI5UGhHQnJLV2h2TXpt?=
 =?utf-8?B?YXN2QjNJU3FvSHpyRHo1SmZDemtUMXNEaHp0a0cwUFdjZDhENDlYak4xK1hF?=
 =?utf-8?B?TDJYZXI4dVFSdEp3dWNiUDBGRXVjZUZhWnIySGg0TkNXTy96RkZLSWxadm1q?=
 =?utf-8?B?TzFmWE1wa0Q0VDRYeHVxUFo3STdYaDRmcjhKc1Z0aDM2S0NNbG1iODZnY0JW?=
 =?utf-8?B?ZTErWUlPdmE2eWUrU1RhUUdTVnNpNFVLUUV6Zm1RQzBTRzRLM1RydVVwR0N2?=
 =?utf-8?B?U1Q2ZGwvbTV5c3dsZFQzY25RVUxBeElHQWFhK1BmWlJ3allWMEVHQUNHRGpE?=
 =?utf-8?B?NytNZmZ3bmVLaWVXTXBidHVPYnY2c2FCNjlXaG84ZnQ1SlJSVEJIZWZ5RkVP?=
 =?utf-8?B?dWNicGFVNEJyTGkzY2EyM1AvQlZVQ05EQ1RyTDhZVUxrSkZ6Q0ZhRElFRzVx?=
 =?utf-8?B?eldLQk9kT0trNlNXNjBKVXd4alZxZUxzUFlwZVRSSytXYXJad0JGaDV4ZXZn?=
 =?utf-8?B?RFdUeGNMZjRYMnN1c2FHcWRPZSs1WHlXMUZoaUNkamxhWjB3WEZEMTBRY21m?=
 =?utf-8?B?NDZMNXpmSjExa3UwNFU3cnVxZ09RYzBUWEMweW5nUCswMDI1MmhSZW9nQU9k?=
 =?utf-8?B?WGJSQ1k5TW0zcVpRQWs3S3RRN0ZnTUpVaVpKaXZlYU84aGdtUHE5OXlXZmNy?=
 =?utf-8?B?Mms4TnI0ekE4byt4UTNYVHVtS2E5UFNqOHFhbmFFTHpxOXJtY0kyS1dJQnUw?=
 =?utf-8?B?ck1qZzNyaTZadVBEQWdRRFRHRlBDZlVHNnQyS3VpWXlhT3NrUmFqbjZpZThG?=
 =?utf-8?B?T1VBaEs4YkRzc0N5OGdmMVd1MEZpdjhiNDdBd1RNQ09rTU5LUjQrdTJ0bVls?=
 =?utf-8?B?dFBVaHFpdFdDOGhCSFplSWUzSmhwdUhMNWltemlLbE4yd3dBcy9mUHNQb2o3?=
 =?utf-8?B?OXBBR01nR0RsNzZUN29nQm10T2RwUXl5NVVxdjJqRlNUMjB5Z2xNbU8rbEdq?=
 =?utf-8?B?MVVSYUU5bjMwNDJ3bFN6M2lqR0U0N1didkU0WnJTdnkvWE8wcForbHZCOTc0?=
 =?utf-8?B?TU1BMExzWEhBNzVGS1RYcFhpVlpNMERDWVNnL3J5T2dKbFA0YUZrT1V2VXg4?=
 =?utf-8?B?eHJ6RFlVRkcyMXZ6YjFtODlvcjN6SEZoVDMyMytRMlRKcGxCY2gxaFZrM1Fx?=
 =?utf-8?B?MUw4L2dWeS9CblpGZTYveG5la0QrMThOWk5wd25yRndsMXZkSFJXeVBkNVhN?=
 =?utf-8?B?akt4QlVBRWRHTHdNcEtDd3FsWTNKbmR0Sm9kZkZVYlhWSys4TkZxZVo1RHdE?=
 =?utf-8?B?dzVaSU1kUDBBdThUMWYrSGxrTTdjMmcxcWVCdUtSemRwcGdQR2FuMzVHc3FD?=
 =?utf-8?B?YTFRdUg4S3hvbXdYTkVMSmV3VWFvclpsZnJNZXlEczlTZ0ZuMWlvWmtpOGVI?=
 =?utf-8?B?b2wxQkV4eml1aTBvY1l5V01NakxkVGZZMkpyVWFWMHUzckZvR3ZpWWtwQTlJ?=
 =?utf-8?Q?Yo5AORlieEgSfV/S83?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8f11ab-1a10-4545-5838-08df340784b4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7747.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2026 08:51:40.8271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /83NrGGUXCO9XJHkTIgyGF91NvDavlWYJgoLvg/2iU7Luvc4jMQOmRbbjvAg3u3n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5815

Reviewed-by: Bin Du <bin.du@amd.com>

On 10/27/2026 2:24 AM, Seifelden Abdelmonem wrote:
> 
> isp4vid_qops_start_streaming() walks isp_vdev->buf_list without
> buf_list_lock and passes each buffer to isp4sd_ioc_send_img_buf().
> Every other access to buf_list holds that lock.
> 
> vb2 serialises the walk against buf_queue(), but not against the
> firmware response thread. Once ISP4SD_MIN_BUF_CNT_BEF_START_STREAM
> buffers have been sent, isp4sd_ioc_send_img_buf() also sends
> START_STREAM, so the firmware can complete buffers while the walk is
> still running. isp4vid_handle_frame_done() then list_del()s the
> completed buffer from buf_list. If that buffer is the current entry of
> the walk, list_for_each_entry() follows the poisoned next pointer:
> 
>   Oops: general protection fault, maybe for address 0xffff8e6944d97060
>   RIP: 0010:isp4if_alloc_buffer_node+0x37/0x50 [amd_isp4_capture]
>   RBX: dead0000000000b8 ... RSI: dead0000000000b8
>   Call Trace:
>    isp4sd_ioc_send_img_buf
>    isp4vid_qops_start_streaming
>    vb2_start_streaming
>    vb2_core_streamon
> 
> The oopsing task holds the queue lock, so the video device can no
> longer be closed and the module cannot be unloaded until reboot.
> 
> This was hit on a board that is not supported upstream yet, with an
> out-of-tree change that made one isp4sd_ioc_send_img_buf() call take
> over a second. With the stock driver the window is much shorter, but
> the list is still modified concurrently without the lock.
> 
> Hold buf_list_lock across the walk. This adds the lock order
> buf_list_lock -> ops_mutex. No path takes them in the reverse order:
> isp4vid_handle_frame_done() runs in the response thread without
> ops_mutex. isp4sd_ioc_send_img_buf() only queues commands and does not
> wait for a firmware response, so the response thread is at most
> delayed until the initial buffers have been sent.
> 
> Fixes: 2ccf48af2270 ("media: platform: amd: isp4 video node and buffers handling added")
> Signed-off-by: Seifelden Abdelmonem <saif.elden.hatim@gmail.com>
> ---
> Testing and AI use: see the cover letter.
> 
>  drivers/media/platform/amd/isp4/isp4_video.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_video.c b/drivers/media/platform/amd/isp4/isp4_video.c
> index 856a2a0b4..58ea8d6ac 100644
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -567,9 +567,11 @@ static int isp4vid_qops_start_streaming(struct vb2_queue *vq,
>                 }
>         }
> 
> -       list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
> -               isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
> -                                       &isp4vid_buf->img_buf);
> +       scoped_guard(mutex, &isp_vdev->buf_list_lock) {
> +               list_for_each_entry(isp4vid_buf, &isp_vdev->buf_list, list)
> +                       isp4sd_ioc_send_img_buf(isp_vdev->isp_sdev,
> +                                               &isp4vid_buf->img_buf);
> +       }
> 
>         isp_vdev->stream_started = true;
> 
> --
> 2.56.0

