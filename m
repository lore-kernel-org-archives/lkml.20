Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011023.outbound.protection.outlook.com [52.101.65.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB1949739E;
	Mon, 19 Oct 2026 09:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403910; cv=fail; b=DDHSdvWwUhyeY3svwHlAzCjrhxb/DeshOqcDkmvTnGafDHoRYi8vWCDooKZQ4XZcjpWPnhSAfzgZjzvWkuI2UOiCXm8DAi7QuT6KJWdLaIVSFsNJ5f9yKyD94aJpfVRRkiqrUMKdDdRoaXyjXVuCD6R2EEor3ca76vAwH4zEOA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403910; c=relaxed/simple;
	bh=T8rdkLXgUnKA0fRbsEvMMNHYdYaR7m3R5I2oqv5A8Ys=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Wfb8O7rM2VbJktrwYenIX4eNj75i/8U0ml7YnkhcLAGEEN04XEFXXi44yPDneIwx+0gpWC2+BxE5G8gWMTKQYUQsG+izA/I/4idoVbrecCcIe3Q2YsKevwLSOvtxnF2BhBmHGKOKTJuN3j0FFEnU/qgPCRMLyN295Zg2kBOGZ4I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UTPq/M1V; arc=fail smtp.client-ip=52.101.65.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UTPq/M1V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Br64vYNLbKa2eEDx5ye0Xl63halL8uUOzG17Oxg9xiJ1vus7/Q+GfcfsJHi75/PMia1fATO32LjtObVegLo8rU8iVjtjshDCuWvjDEQkOOKk9g37kjZAzEBHmaEBDVN9f5H9OaWDbVaH9WEatxJoOv8j28LuwgjPutbXD1u/SI2bZw8rWU8RHrbeCgkM286zbbsIz/fMWYzdqprl6c73ooRrt//JUjnqVivq9NjJUK/DqvITyEdbAAmdDULKDqQm2bnT11pMDapmtwIArIrSzIDBnSMxx6nnTscQOL2AhGS3tqjQcJDQ5FlHWDUGNIWxFKexFXL1z9u5A3y0A+zoXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IF5BmW3kafLG+XLWKRzoNpd5pglgGaIiXP08Gkq0qo8=;
 b=CGtfEhAYrwjKXURmiATmRXen1sGXJPgXyXdjYJpAd9CSVaqicNN1o366TbJR0vuthWfO33lixq1r4O7SuzWWU7jQE948s1KZYw2ambFM0pfOqiq3a2SfSCtYBf4m4EddZbm84LRa14It+G/4qsuVjqRj03Pdcc3r/jUFVja91LI09WMawjBQMfH1j4eG7JJ6kJgIW90L91ClFSOjozZP46uoQdu/IjJTfor44nFPtZTe2BSbhpBhlcubOy2CuGusH6hvATD21yN7ERXcwTskN+rblBGZUDF8kQ66eIb+N6BjH8sBl93ONVEmREnUKrySItsTET8m/q24a/3LSpI+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IF5BmW3kafLG+XLWKRzoNpd5pglgGaIiXP08Gkq0qo8=;
 b=UTPq/M1V3yMNxZOc0BwOj5ljPy2jcaKIPHOmTLtb/xWp/BuQvjFaTXi86p+XfmUtEOQjnvHRMP8lYb8ovxnuR8CEEVjmytQMsCSs873paznApQNnJRDcZiYxMu/Dar/gwyCY95nOHWndTRyM+Ew8N+xSX8gC5OaUA5th4yU6qfUdZ1Zyhmij9M6rekq4MWoMYHinni3S8M2eaf/VRUxc+X87GK0sWU3gxfjewpYqDLnZm+Ki+T8hWWSDaxRjuZMP728cLuBOaScqoiN5H0bZEA60WAJAz3cXx4uwa6MU6fhRob/ElIuipbeB/aCKJ1z0mByr9rYm9DKC9KfdGi8swg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9791.eurprd04.prod.outlook.com (2603:10a6:10:4ce::9)
 by VI1PR04MB7103.eurprd04.prod.outlook.com (2603:10a6:800:123::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 09:58:24 +0000
Received: from DB9PR04MB9791.eurprd04.prod.outlook.com
 ([fe80::806a:199b:49ec:b4f3]) by DB9PR04MB9791.eurprd04.prod.outlook.com
 ([fe80::806a:199b:49ec:b4f3%6]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:58:24 +0000
Message-ID: <2d415b87-b14d-402e-b69c-153431f7a600@oss.nxp.com>
Date: Mon, 19 Oct 2026 17:58:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] media: amphion: handle debug runtime resume failure
To: Jiale Yao <yaojiale02@163.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019082754.1806443-1-yaojiale02@163.com>
 <20261019082754.1806443-3-yaojiale02@163.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20261019082754.1806443-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To DB9PR04MB9791.eurprd04.prod.outlook.com
 (2603:10a6:10:4ce::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9791:EE_|VI1PR04MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ecefe6-e467-4949-ee0e-08df2dc78394
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|1800799024|376014|11063799006|4143699003|56012099006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cyXm3oSmgR9k6vk7AgfP2+yAaJ6nTNexBD/FC2U6V/XXIEWv2XhkXckVFuL+WBb/wDG8cBFtaOQrVwTAXz9NYdbs1npixbVw9nl0S/VJcRb7gEx9UaDmV5dfruTXcRzXS3mupStRw1JxpfmzM6ETyfP2yKT1wmQmmJJzfHlAwPJDygpd6PRULbjce42JQv8zq/Ksgnyq8lWOMQgemFxv9HmhXDt7oJWq8qIJ9gokKlnTDoRLVY996uspi3NdSzQGqeuuq2ZS/jkxZSHSugTLgsxE7TnqMKARrJAP8A2ugI6lzm0xezh2AtKoHJmQqLvxbgCWbsHBUTjMo40lZiKb+XqJdr9qq3gEySbUTu3qg2ulxf4TAjQ/lduwp+CL8v3zjVIPDgtXoyzx02T2buzUL34Vglsu5Bd1IXMQvk5UPoJVdk3qu6lfbLqtztTCN/9Tf7U8ikkN2ZCfWtj07KRmYyDOXIVN6BaH6T8paLwU+SGKXQdHjD33TkRxJIKHvR2RUXeJCNciMtgyvHJ8z6xKPnPXsl4ghb91DsPQ3JoPoqv8drhPzqdom5Wu9WMDWdkhd57T8bjlz42bzqaVQAofY7wMPpsGDuD+AhsCibV2fmG3pj8gi1KlausPt6ZjTrX/fd+4t4ydBVfLlPhvynaGlJAoqH0x495LjRkaJumAluE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(1800799024)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3JoRjgvNERsZllHOWhTclYrekVaN2lBM3FQa0M3RHFZdjh6dW1HSjZUMHlh?=
 =?utf-8?B?MzBNdEdhWFF4MnREengyMDVJQW04ZlFhQ1NrclhSdlp2RFIvcndBcXgzTlhu?=
 =?utf-8?B?MnFWSnptOHV1c3BDek9rQ1RNelM2TTkrUWNNMGxYekUyM0JBMGlPNTkyN0Ns?=
 =?utf-8?B?cC94VEdYZUVDU3ZueHdzOFBpNHFXTEpENHNiK2VQZ25Xcm9uaEhDSkdsSVVi?=
 =?utf-8?B?QjI5dnR3SFFxSXByTFFibUhXTjhTYStSVG1DVTR6Yi9rRDZWSkdyL2NjR1Vp?=
 =?utf-8?B?eUpJdUpsWHFoejJrUzJZeXhmVXBWd0s1VFZISTVlWXI3eWFLd2hqQnZWRzFW?=
 =?utf-8?B?bzczZjRtWkkxRXJPQkxzdUkrTG5JaWlQU2M3dzhDNXBTVHJWZ2NlTEtTaUVI?=
 =?utf-8?B?VzBHMDRRcy9UM2d3cnNnU2hmTWpMQmdWOEFCQWlBMVJwMHlhWUxVK1VsWXQy?=
 =?utf-8?B?WHV6bTFKN1Mwei9oSEd1aEI5eXhDaThnajFrV2xDb0dIdVhSblMwcXVNSzMr?=
 =?utf-8?B?NDNEVHNiWXZDVHVaOGNBTHJhRlI0djFVR2tubGZpckRVa2VjY3hOSGo4R1BU?=
 =?utf-8?B?L2dHbnBNK1JpT25rYStPc0NSLzFoclY2OGExSXFwRFduaGp4VnNvRnpkdkda?=
 =?utf-8?B?a05MTUpndzhsc3FyT0c2ZFM0VTFUY2R0alEzeWVqd1BOQXVyU2UvbS9DUjlz?=
 =?utf-8?B?K1ZOOFhvd0YwMWlVd1ZobFNod3lyc2Fvc2l0bGx5WTZiNFM0bjh4ci9YSi9q?=
 =?utf-8?B?MTMyRS93ZE9SY1FCWUtHdXBod1Y0V2o2eHVJQ0VwRmxwa2hnR25GN3BxQXZo?=
 =?utf-8?B?dVE3SWI3dU1KVXJYd0drNFQyaHp0cjl6QmtZeVpTV3BpLyt2dXk5Wk0wQjlZ?=
 =?utf-8?B?SHZBQUxLTDlaeVFvbUpPeEd1bE14N1BKSy9zTVlESng4Y3ViaGx3YllpSkI2?=
 =?utf-8?B?NXZER09sRGRqK3pHcWhTRyszRHUzOVh3aE9RanVNbnBaMjZoUWRIQmpwZDlB?=
 =?utf-8?B?NFV3VVh3cTI3d1hrOExsT3BISU9PVkNUMVlvaXNDOTFZa3B5c3gxa0RPYlFZ?=
 =?utf-8?B?aUs0Q0hLd2JHS1ZLSmJURkZMV2V2QnhpY1VoY2JQTXpQVDNwVTVmVzBVOEUw?=
 =?utf-8?B?S05CZ2N2Z3d5OGxYd3oyb2luamE0OXdDMzN5NjBkbDRrMXkzZFJBY2NxcHpl?=
 =?utf-8?B?SXE3enlyYThOeWJqWXk5dkJlbnlUSHVtNXgzdC9neXF6THVyQlpabG1jR2xN?=
 =?utf-8?B?OTlGbXZWNUltT3Ard3R3bkZsRFdTVmJ0TkhBL1paNjhmL3VmRlJHMmtMTXBs?=
 =?utf-8?B?a1o1MEtpV1k4T1JoSEtlbUFhZkJjYWYzZW9GSnpxd1JRZVV2WDRwM1BuNnRL?=
 =?utf-8?B?SVNNNmk1TFBMNmpJZDA2THBEdDVFRHdFVVVKWE5xM0xUOUg5UzdmVTNKblBJ?=
 =?utf-8?B?YUxwSVlPcUpWMnYrc2tVVU5PKzc5Ykdmc2tzN3laajBJbDZrV1ZZWVVWWWRt?=
 =?utf-8?B?aGZlblNrL1lNT2o4d3JUdmJ2VVpqeUh0WjEwZHkyZGo1c0V6Rlc1ajJKY3Vt?=
 =?utf-8?B?MkJBemhCWmpROFY3dXlXRUVqb0RubFJKRHU2bVMrN1djTCtMVGhqY0VwSGpZ?=
 =?utf-8?B?UkNDemU0Ync2UXFUZkNwWDQ3Y1MxS3NmWGVtYWNFWDJlaGFQcndyMHhuSTJ6?=
 =?utf-8?B?alM0YzJDWFNxQWJ4UlRtejNPNnpWN3BkNkYyKzlRM0dLWDZvWUdGRWdPWkZX?=
 =?utf-8?B?WGQrQjl5eGhCQjBOYzQvS1YxdEtqNHFUbEdxMlE5MVBXYnN4WWxOK25ZUHBu?=
 =?utf-8?B?R3ZMVldkNkVBV1dKUUJVMk9ZczBOc3VlbEw2Z0k4RHBzUWZLSml1YzEwVFNP?=
 =?utf-8?B?WTU1T0E1L2k1L0dkZFhEcjdmWStnSW82amFiaEJpbDNZNTVnUmlIc09YS1Jm?=
 =?utf-8?B?V0dtUVlGSWgyMW03Z3lLMGhESnR2c25CaVMzcTdKLzFPZnF4TkR0UksyUjhF?=
 =?utf-8?B?Zi9MUHJDQWF1WlVtVi9LOEptZkg3Y01kR3Q2VVYreTJYcjJZRmU0RFN6aWdt?=
 =?utf-8?B?bm1WWEVwNW03N1hZRnBCQVVzaGQ5UmlnYlBaQWh0SnV3N3VSWjdTYTFZMVdI?=
 =?utf-8?B?WmhlcjRCQ09yYkZRY3VpYUFidVAvNWlsR2ZVUEhKVXYzd05WcW5jSHh0dmxP?=
 =?utf-8?B?bWZVNmpzM3BsQ3ppMjVuZDdTVmRwVGx2QmtBWkVqSlgwYS9ZTkRUZG9hVnAv?=
 =?utf-8?B?ZFpKQlpWbXQzNWZPeVJKT0dSY1R3UXhWbFdVdUZSU2c2UzB3WnpTejg0RFNs?=
 =?utf-8?B?aUJOVDN5UFVKZlVyTHhLWHZiUmpjMnNqSEcrS2t0RWEvS2dXRHdIQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ecefe6-e467-4949-ee0e-08df2dc78394
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:58:24.3451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDrOAnp1c9cSM9/jh4qmC2m9JY/SzQueLTnLirq7fVT1VEWviSJJTI+1CyCojFE7dOpYCQioinyPFRJDDiGcOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7103



On 10/19/2026 4:27 PM, Jiale Yao wrote:
> The debugfs core write handler reads the VPU power state after
> pm_runtime_resume_and_get() fails. The device may be unavailable after
> a failed runtime resume, and the final runtime PM put does not match an
> acquired reference.
> 
> Return the resume error before taking the core lock or accessing VPU
> hardware.
> 
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>

> ---
>   drivers/media/platform/amphion/vpu_dbg.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/amphion/vpu_dbg.c b/drivers/media/platform/amphion/vpu_dbg.c
> index 497ae4e8a2..fff4df4f45 100644
> --- a/drivers/media/platform/amphion/vpu_dbg.c
> +++ b/drivers/media/platform/amphion/vpu_dbg.c
> @@ -382,8 +382,12 @@ static ssize_t vpu_dbg_core_write(struct file *file,
>   {
>   	struct seq_file *s = file->private_data;
>   	struct vpu_core *core = s->private;
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(core->dev);
> +	if (ret < 0)
> +		return ret;
>   
> -	pm_runtime_resume_and_get(core->dev);
>   	mutex_lock(&core->lock);
>   	if (vpu_iface_get_power_state(core) && !core->request_count) {
>   		dev_info(core->dev, "reset\n");

