Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944EF3B3884;
	Wed,  2 Sep 2026 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379365; cv=fail; b=hTa6kUo+pIWCXD8XoaVrx5y3zaA4sfhXq7Dgl7LVZrcMSZss5+gPDt55qI9mGU/ph9mKn7zY5Fm26yg39CcbdoSTcdw+z0QUgT3CP6AIzcGZSJXDE4+vBwWFZ0oi5TtJjuu80WzyQpLhSLxON5JF/2djxE3dXNdGZ0iNkc7mh/g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379365; c=relaxed/simple;
	bh=C4k+nURXoznXLNcPYlZHR8k2JX6gvOZ1TOjoGnWWI60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pa6kPRyI606w4GwMP6QFsw4JZZEK6a/ImObS7yan/8lmoImwapxD8lOAsGAJbosMgAT4OM2+zKUnzR9SpmwmyGI42yLCw9a9OzKzOF47/yPZSPi8qdD8f4X2GobhGvZD5XIYbbWvXOZlvMEypGvZpCg5QbgI3TsbrNeYE/EMhRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=HYHaF21j; arc=fail smtp.client-ip=52.101.70.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="HYHaF21j"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cds1T9CUPR6iKz6EH679WNiDL/xNhV5WBJs8zkMyssRP5kUX6C0FR7gD+8JVmXZtvhdi+7g/DJca1t7t5MNQfjBqIhzuG9GBLdpSftF7IRUHpz2LJRPSX+q7UoK6bdc775Gx/a8IfsICTrPF5cr5zElYWVFKmiu720+He+Tvj4joUBC+B6xqjgXY4icmxEZXiHqta1KVSJi87kObX8Li0A6Pvw5BWN89WMSzYgvuERFW+jEhE89BAobCCXKz/4HQDHUwLNoEOUF6hwtcRP1xZOKG2LyV356bDfveqU0zVCTc4px9EnNY5JRpmuTKbi42L7O+T+xXMZ0eL6CFbKV/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A8FvB2zG4Qqh6Y4HT2BGnSvFKXZPYFtlXzVdE3BwRwg=;
 b=qQSqC3spxjX498OYBGNT0Vn7CFRHB7WKXaI4kdkDdlMFmuxWMjrOdTP+EHqtJ6jMlzNhSeDQfppjOV+jUn/y7jqmXT4XH/UZw8QlD60TIyQG9vs5y70EW/CAGmnDBZPw1fZT9DnBl2/hayFfW3WEXgqVwbRAnMSPraTlddUuKuXERVcEV0ojGve7GItoLojoctBly+jxL0ona4oGfDJxhNfxzvxZ3a37Yndy7LcjjYlimeoUxolssWy/PgpGoThtBJOGush4FMXooNmy/RJCoi12ZhBSqfU8G1LptXhjgRyKpElwCBNuXMWopZH+vd14ea7jqIOmV+QfNIe5dr0kNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A8FvB2zG4Qqh6Y4HT2BGnSvFKXZPYFtlXzVdE3BwRwg=;
 b=HYHaF21jB+xG9qMhMgenx+yjvRWlXUFvfp5ZA+6NFPrQ+stKTuFhNivk4wqWwb8LW36Y1ucJ4IhTRSeMnuqeG3iSHUuRT3BFD5/1azIz1gG/7+1mbfLlqXoRgI/UBP04Sx/Lpj94C+IGcPQnjS90m/4XSHM6ErZE3YmjRAgWvNyifQLgjlC1XHNDL3clw5aO7U7qWO7IdDe4WON+JC39pV1AdYbLLYLAMlMhYN7DEHqdiRrZBWlg2DaP1vGejIkVnZ4lXqj8J4s4xzEDnx9WlbGUqCkuu/MdoS9PCK4Nw1sDI6iOHslw7WXz+AwQnF6fUAszgX61avmhO0tUSi2d4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB9463.eurprd04.prod.outlook.com (2603:10a6:102:2ab::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 20:02:37 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:02:37 +0000
From: Frank.Li@oss.nxp.com
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Cong Nguyen <congnt264@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on queue error
Date: Wed,  2 Sep 2026 16:02:29 -0400
Message-ID: <178837934009.2133892.15003893546075373931.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727104927.520546-1-congnt264@gmail.com>
References: <20260727104927.520546-1-congnt264@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132F9.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::2a) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB9463:EE_
X-MS-Office365-Filtering-Correlation-Id: 68031d3c-b4c4-45d2-46e8-08df092d2291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|7416014|19092799006|376014|6133799003|18002099003|22082099003|10067099003|5023799004|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	YXozcwy7AKJNj8oYsJRFIWmO5If4WeFOOd8ZilNsAwKL1hxwTPrOgL+hwaDW5UoLhbjer7Es+z2XRfgthpxdPuOCYM8h+JsjoYi4tLDtJ3WawMJRpfUUgFBu3LGADfcDPjHQyWXGcm5HwL9YKew2QSNq1AKh2G3jGa497CTXLol0TDew/PzsBTub9urfGjSRb/E09rvDK4MHtSshBUu8OZU6BzNrAkFEh5uz1DAF9xVXfsrM9NIAxpYP9jHfX9c/gYpnbpUA+I4nHnZfDLwuYWDF2JgXzKNwcDfBvTbAzPw9rNzOIlpteuT293MB8LWOf8hHyKyp8nnG6qF+iHUbmHzaZJbLtJOpK+JyLUJbG5uj5hzcGCBIVzuP6WUTQAr6jacTaUSR3U9oNOTbg+SYt365gnWp1VORxbPnFzbO0q9zJqJaKjpXMs93BK6Wn3va42cWsDKIp+oosxDGSZ3N5CY+fcb8eCQgpuKtOjgjzTEzYOsQ4wg2mjcOTe4J1BJCyPlVMJW93nkerE/85hMmSxF7oYptscydyU0adjcZ3/BXiI9U6qjf54F9EerJ19JQyenVPiCrd927Dz9wGurqk7/TBTO6/MahBfuLR8FXUCQbn4uo+60Z09JUMA1cHjOmNEGRlA1DRWw4m95DryaEHhhHVfW62nO/9F6GS2ubfDk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(7416014)(19092799006)(376014)(6133799003)(18002099003)(22082099003)(10067099003)(5023799004)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzR0UGpKVzJoWExicGcyd0RjRzRMQ1oydHNDZ3l5aG5vNEJ3RmU2YU1qS25o?=
 =?utf-8?B?WG1wb3B2cEg4MmRCajdaV0J4ZEhJcnVKaHAycFZtU0Nwb3ZQK1NNTitZRzcr?=
 =?utf-8?B?ZmFXek5ZQi90TUp6UWlVdWVZdFhYeG0rSXhWU3FndHY3N2dWTG5OTnZjTkJi?=
 =?utf-8?B?NWRXS0RudWwrSWFwQ1VyVGp4VWJsTzhoMkFkZjZNZWVGa003T2lXVWdhN1lO?=
 =?utf-8?B?M1lKUTlWWERnYkZBZHkxYzZPMmltempSbHNaN1ZXUjdEZkJUWW1GU0FacmpO?=
 =?utf-8?B?NUZrQlFUZjhmNndKMVFxbGg0cFlCb0tTdFBrL3N1ZnAwS3UxMFZKc0M1eERH?=
 =?utf-8?B?RHhxa2xCWUszWktJZHcyd2xEZ2tNV2FLRmwxUDdnUmxyb3BFeERXb1dqV05L?=
 =?utf-8?B?dXNJd05VOUhrK0FpSHoxLzN2bXNIdisvbnpJZkJqNUUwSE1qZzZEbXdIY285?=
 =?utf-8?B?VndSek9hM29FTGZCRkFBclkyeUdpdkN5T1A0NUFLcXptS3k0QlU0SW9uT0Ns?=
 =?utf-8?B?cSs5eUhZdjduZTZsZDJGblpaMGJXNjcxNFFVNUZac3FORXd6K2xXRjAvNFk2?=
 =?utf-8?B?UEhxdlZyTFY5QWxlbkhpcHc3OTNwMWIxM0hXSjM5SFFoMXd5Snd1UFZGOWlm?=
 =?utf-8?B?cjRva3hyQUo0Y0xqQm1WSnhxbTBnLzRFZ1p4SjkxeWhmYnM1OGVCbkE5dXBF?=
 =?utf-8?B?OHFOOVIxUnI1a3hFWjh2V0I0ZVR6VHlkTXdRY3dkWEFyMXVyQmZ1SHE2VkhS?=
 =?utf-8?B?TGgxejd5elFKRDYzV1RrT3JsTU9jNVVscGRCZ09IMTNleVRrQWgvUjMrNXQ0?=
 =?utf-8?B?Y3c0TlgrN2RXck5QUDYyYXBrR0RCV0ZGc2hUUGtjRHA4OFR0M21PVHNwd1Er?=
 =?utf-8?B?SUJHT1UvK1hXall6NG9Va0J6VGVzMGtZL1NkelRlbEU5bU5WL05iQjZlWUk1?=
 =?utf-8?B?MGh5ZXdoWGp0YVpjZVdrcVZSUHRUcXZ3V3RHQ1hJWjhSWmt3K3Z5VEljTG0y?=
 =?utf-8?B?OTJFSUkwUkVPWEJ1c1M5WjgrcGtQeWRxOEYyZmxjZmJvK1BvaEVwVGJtakxq?=
 =?utf-8?B?UzBpQmZidXY3Zy9BTWFTWDdCUUJ4ZkNNdHgwNHhvSmEvK3JYdDRBaFE0RmNS?=
 =?utf-8?B?ckFvV0RMeTIra0tKUHdIUmtIQmNuZnl5L3JoM1BNOEFQVTNSK0ZDK2tUcERQ?=
 =?utf-8?B?eDBESVU1WCsvaWFuVVNCa2hKNnJaVWphTGVkb1A3ZDFKZWwrdmpxb0ZFRDJ3?=
 =?utf-8?B?TlpxT0oxMVI1MmhZMUVTUWtHOUpvSzhYYWk2K0hyMGdDWlhSK2Z6TEVrU0pv?=
 =?utf-8?B?Z1NkTEpoT0Z3UXZhRzl3RGxBeGgwdHVzQjhNby9ZdnNybmJNK1JmaFArRnlZ?=
 =?utf-8?B?QW12ekZSeEF6S3UzNlVjc2RCYVFBMXY3ZFdJcmdQTlZMYjRGN3pMLzBybmxq?=
 =?utf-8?B?SVFEMTRzRW1oUkd2QnluaXJOZW5oNnVjVFNMeWRoUDNxampDK1ZiQ0JJcUVN?=
 =?utf-8?B?Vm5qN3NvL09NNDI2Mm4waE9uOGNxUFBMbkpjYkUzektWbWtnWXFFTlRsSHFu?=
 =?utf-8?B?MVRRZG4ybm1BTWFQLzVrYnNyNjhIZjkwdHdvRW1vcXZCSEdJcVRuRDlER3JY?=
 =?utf-8?B?RVNFWDBoRW80VkRrZkZueDI1UDFmT2xCZTRBdEhWQzh6UjdVbmR4OXZFSTJU?=
 =?utf-8?B?U0RzNmdrbUw0bjlWRWlRajBoMWpBTjRTWmRUNlZ5dW1vOGpZTmZXbVUwVURZ?=
 =?utf-8?B?clpoVjEvN2lRY3BjaEE3TGxnMmM2clVaZlJJWkU5aWYyR2h0UDVEczgwbk9E?=
 =?utf-8?B?QTNKa0ZkR1oyM3NjeklFcnlTclFFaHZ1VmhBemZGSVFDNlVNUnZwa0JtMk9r?=
 =?utf-8?B?WnYybWdWMXMvT05qbVFqVWZBSUJldjcvQnlMTlR5QmdxbWthdXVSYTIzb2RP?=
 =?utf-8?B?dWNXaFJBenhOLy8ySllLUnFtQjA3UEN2MDRxSE5sdjl3eVF3cnhOSk9ucXYw?=
 =?utf-8?B?akRZbWpnUmkyYjdYKzBKaWY2MmgrUkdVOFFSVU15QklTYW51R2w2anlsSzZM?=
 =?utf-8?B?Q0kzd1lPelhqbklYbDJLR1dUNUEwN3FUSVZVRnpNZlpIOHNoZzFhQkpPTkZv?=
 =?utf-8?B?QXFvYmdaeWEyZkM0dW5FNTNxMGsySHB2WktXcnBjTHBzS2Jxa2tFR1ZJbFM3?=
 =?utf-8?B?cWlsc2M3bnBYbVBObCtrbng1M3hndmd2RHpycHQwYlFiL2luTEJxRWVBZ3Zx?=
 =?utf-8?B?cnhZaG54T09EVjRkTE5CWEdWYnBaMVJyaUV3QktqbEZuOEZkMGJqZGQ2UjRx?=
 =?utf-8?B?ajcxYlY5MVRSVEdUYytHZS9SbDhYSlYrZUZLNVFjTjZmSW5WSkhFRnM0R3BD?=
 =?utf-8?Q?vTkpYlfKxmRJ7GeUmejzXyOdfWuwNctGF7h8V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68031d3c-b4c4-45d2-46e8-08df092d2291
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:02:37.0218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xmn81ywSmepLyzv6gy4Mjlmeg/qFbah+quB9ykYaEIouDFoIlejD2gziiVVq4ntllsG+SgTDyYNRagIxx9g4bn7V9LeK7K3pNH7iqMJYBgvr3wtCsQT3xIcPklxoOMcR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9463

From: Frank Li <Frank.Li@nxp.com>


On Mon, 27 Jul 2026 17:49:27 +0700, Cong Nguyen wrote:
> device_run() allocates an ipu_image_convert_run object and, on the
> success path, hands it to the IPU image conversion core via
> ipu_image_convert_queue(); the run object is then freed asynchronously
> by the completion callback ipu_ic_pp_complete().
> 
> However, if ipu_image_convert_queue() fails, the core never takes
> ownership of the run object and the completion callback is never
> invoked. The "err" label finishes the mem2mem job and reports the
> buffers as errored, but never frees the run object that was just
> allocated, leaking it on every queue failure.
> 
> [...]

Applied, thanks!

[1/1] staging: media: imx: csc-scaler: fix ipu_image_convert_run leak on queue error
      commit: 70b993467aff501363c7bff3dfc4d76d6a138102

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
