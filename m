Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013029.outbound.protection.outlook.com [40.107.162.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B2C395AC3;
	Tue, 22 Sep 2026 02:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790044324; cv=fail; b=RX0HIeKL2TldTUuEs7wegmMW6o3xQcq7rhwUcu/GqVJ6vcIu9ycKCAE7dSa9j7Lh4tAhl6rIttH9oYfpfzujN1u05kQmzXc5dxhNwbil5AQ4DTvsaTHvxiocjAwKX6Gr5JhLRt9APUcMTRRzVW3iTaqnUgOP41LuhyW4CUR2jvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790044324; c=relaxed/simple;
	bh=Q88WshSW/McJnrLqIRMiejAdpUQQsnebHsvx5AKV66w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t+kuYX7tdOqti32YkRYvmPyXc1YHUTI5cKzBNMrG+VtpNUETSrE/VSXCD5/L5PPkUS8SbPFWUGeQ9vBMImD6rNWeN2AJX+OM7+KDVN0sxoAuiPVAULCmmROo7rpTUsc0lWfx2NGj1jZ269y9XCkjcIub1A6Reeb17RBNDAGcK08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RBj4l2yz; arc=fail smtp.client-ip=40.107.162.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RBj4l2yz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9JydvNQ4oonXwouA0fwewiJfOAHDEzHNBEYM/UMyQj9TBD/L2lwSE2cVemb9PBGhAo3pelAQpn/7SY4ptukhCXwDlm7gPxS2nftdKRsulkCjc6TIqh8A95UVxMSZoM/fWYd8Ifm2Xt0Y9iPJiHDiphnaXmPruaYcJHiYMiRy22Ocw9xRk9E/x4olEwDqoznHMcuYKTyBTIoKzailk1i9+QWPhK/QeAWwZ46+cVZ7NlPMDzJhVGzI9vGDbGEkH1ktqQ2Sy1bHus4GixEXIdEmxllKBdUC2d8r0y3UmJVueTkp2J1+jsxd8d2jLsJAzWkjVjZJCqIFph/ZdrkbkUUDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hjZh5preDoP3lNKg0QQhRmL58mqJRNY7Do8KjLfI7zg=;
 b=czOPEtI8OYF+9f6lQ2M5h+wtslf7qRiHJt0lysbMfCpklWFjRwub89hrQL7FFpXQ6U5MWBl0S5epxLXP3c3urTSMcaxednfDS7nSWfgqziTROtQMKv8YtlxqrQiA1AFJJHEfxVFIAvWVZxBqUillkNi9Zs07yJe2H2Uyl5isW6ivrxRyxfl/OozNiuKJdmA5xPhG4gaSU6U2nt4g3+Abdkre6MlY3v4V0jLVMphTkdjgZb3jjTA39GJpHZJPto7KuMeuLoZxiV3Zx+ln5SRCOHxvK2BXtLXGGLwbxPGEwXdtvnLNRjbCx0qxXukL3vbHPlhMxHQnmo9aXqQNPPWVgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hjZh5preDoP3lNKg0QQhRmL58mqJRNY7Do8KjLfI7zg=;
 b=RBj4l2yzg4Qj5WRBpY6URDoo75Z14tCejUoaR7y9BIPcuadj6CFZ3sno/pTOOWLbbI3vmYaeUapGYG+VX4MS91znGOL97uEbpkrA3/dZdL7iN6SWvN9H+uK1KZec06zW2D8csxRf9VEYez6sjmx251Kcwzbxvbxlz6EfTDNCXyMYVoyS1/RxFsSsNvOd+elOh0ZHjMP9loBjzoQshKC2RgXVlpx92ffYoZmfHbsNO9m2cbwPseavcq+Wedd8L0tH9qSXIZbBcT1vY2GPX6kgbsvTV/6cTwBDf2npbikiZSz8VSU6Of7RwmurHyDVRoj7G91dYW/muR5xOdZKOT1Hew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AM7PR04MB6903.eurprd04.prod.outlook.com (2603:10a6:20b:10d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Tue, 22 Sep
 2026 02:31:59 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 02:31:59 +0000
Message-ID: <37b1e459-21e8-49d4-9baf-af330a68505c@oss.nxp.com>
Date: Tue, 22 Sep 2026 10:31:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/21] ASoC: rt5514-spi: Free the DSP context on component
 remove
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Oder Chiou <oder_chiou@realtek.com>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-22-chancel.liu@oss.nxp.com>
 <arEv2rLNkSo_2yXm@sirena.co.uk>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <arEv2rLNkSo_2yXm@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AM7PR04MB6903:EE_
X-MS-Office365-Filtering-Correlation-Id: a54ffad1-88a0-4106-1e37-08df1851ad4b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|7416014|366016|1800799024|376014|6133799003|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	DKVGFjg2MchFciX3n9USLeaGmm2hsAcKI4twnrsdf5MvG+yIgJC3DHgrQkNVDE759A7Kjnv2sTu85cKOl4foXrNbmrESTjvymsTy/7p5eVBCja/K4Eu/f1mTZZTs79SxNxCNeLMXu9zmg94DSCgWFJULmPJPerPRS4bqhrJgOG2xvOD45zbIZn9mGSnXfH9/G0vwXP7EQ9rwCBo2WB9rIufQTYdr9ZYGE3t8QT+VXGZedlzmpS4/3hcJxdWwJRj1BVgbf9WjA0nlCmXvQiMIEGpVhJl4OEC2xAq2JonV/sNQP93vmW42ZyOMfwJhAryM0PiXNF+bwUv3wMZlTcZxoAGQAxyLfefKZQENMlZuLsJMLUL94Shj0sp4HDlVZK3kEHYoAoeEd/JRX7XrB4Mot8Fgm+TUIyJskR8ke/bkV12TXKWOyU9a5evyuF9AlvpXyjpfiWF4K3Cdbqu+BTH6knreolm9oF2x0zU8Btex0QVEuQm26OqnNKGnkcSP7x/+xZ008r3bdWlmMhGTDDTAjp7gshDHV81AGnsl8TFT+AVZ0zx7yGvYpzDMFDYEh1eWIv+h69LL7tqu8pLIjTlXaN5ILZ9iJvyq8F4O1sksHLhQLkU1lkFcq7k7UsvTXsbrR9XnNXobvLYP6/wQ1dRNGNif2WPNRv9QpSKh9nXoxzo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(7416014)(366016)(1800799024)(376014)(6133799003)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akZaZ3RsRnk0RkVzbXQ2UFNSNys1aHFNdkFZcEFNVUY5RVNXd0tzQitRTUJZ?=
 =?utf-8?B?dnNXWllUS3ZjQ1hOUGREQlpVSGM3WDV6UTJnUE9LbXNSdjE0a3VWc3lOaTVu?=
 =?utf-8?B?YTNPUEMvU2xQb3Q1M3krU3Fya2hNbnRBb1VFOUNJdm0wTFVSY1FTbVNQUzFC?=
 =?utf-8?B?WWgrekVzOXVLUU1YR1FHWVZGa2tHYkN4ejNVMFRkSjJ4RUNuTzlmbFFwSU02?=
 =?utf-8?B?QURENE13dE9RVXBCdmt2NzFLN3VPb0pteVUrL0tlcTM4TzZNQ001M3NVS2xJ?=
 =?utf-8?B?cjNmNXpiaU1KaURvVkx6VFlGZGtIUnZra1J3RXZJbHBQV3l4Si9BbEJYTHd5?=
 =?utf-8?B?d0RIWVU0UVIrckdnOTR3d2l1Tng3anlZaDRxa0QvZWI5MkxmWVp0aEVlbldF?=
 =?utf-8?B?SU4yckJKTHBtNEZ5TmRyTEQxNXJpUE1qejRjbnAzTHJEK284SThXRHFxTW1M?=
 =?utf-8?B?dEpVOSs3QXpwYUMwdjVEVVlWVm9CUkRzNnVRUzRPdkFnSE82VXlTM0xVTmdN?=
 =?utf-8?B?MlY5UmVZV3JReFZrM2VLQi9pNmlMRzZoRVhWNmtuY1lETWg1QXJBRllsWUR2?=
 =?utf-8?B?UTJTSzdLcjgyVi9zbloySW9SYTNrVHIweHR2Z1BFczFKNkl6TkUrVzhpZ09l?=
 =?utf-8?B?WUg0WkNsSlEyakJIQ1pUbk16RHhFNmFxZURhejkxUDFHemIyVTBMV2V6OENZ?=
 =?utf-8?B?K2M5VjlaM2I4dzJaRFR2NEpUV2Z4ZThlMHdzT1JvbUpxMlR5OWZzaFl1U3Z3?=
 =?utf-8?B?L2FZekhFV1Y4SXBiNUFwMkg5YW1mNWg2NjRTbFg1S3hHdDJBWklWSkEvNGdZ?=
 =?utf-8?B?S3hKY2F0QXJsNWRHc0wrd0hoUGhGYUVlMUk1MkdoR3VTMk90ZkhwWHEyWWtm?=
 =?utf-8?B?dDM3enQ1T1c1V0dOSXUrb0lrQ3hQUys3YmJNM01yOEtMejFQMlpLaVBjRFVX?=
 =?utf-8?B?MldUVW9MY1RjVm51eTJFT1hYdUdpVWU1RnRnL3g2MkhCOGt0aGV1bnI5aUw4?=
 =?utf-8?B?M1BlMThKQlQrb0tKam5ac3c1Vml2RXFFeGJmRCtRanh3Y0FLZCt5SUIzVVJT?=
 =?utf-8?B?Vmk0L0NoMFUwV2F1bjl0eGRrQ0R6UmVid2M2YmxTVmtjK1hjQ0wzcE16ZUxx?=
 =?utf-8?B?Z3RxWDUxWWQrUWhzaDI1Z2xxYWdITmtPYm1VY1gzMlRDZEI4MGc5VHdPVmdB?=
 =?utf-8?B?SHRLVjR2cmI4bjNpV1dWSDltOVpOK1NzSWc5N2NGbnFBUE5mSmRrNW9wdGJm?=
 =?utf-8?B?UmlWazFHYmx1WEVuS2lFNTYwZHJ2aUN3cGZ0MzhqMUNrSFNXSEZudTMwZUxt?=
 =?utf-8?B?d2M4K2dOOVlTaEtnNlVNMWZITlhNeW5aSXM2MlJqcFl4Q0RPdGh3YkowVnF2?=
 =?utf-8?B?V0VJclJicUY2MUlwMng5M1hoTW16STNjU3ZJdFR0RHFqWjY4Z0N5VzliQ1Uz?=
 =?utf-8?B?Q0E4d2ZocUpsRlVHZjIwWnB4eWlZSXZUYUduWldVQm5RRmovVWRyd0RhZVEr?=
 =?utf-8?B?SzFJM2lWc1JVc3V3RC9rV2RuNit3TEZxOGNPcC85WlE5MlNKamJMbGo5c0N0?=
 =?utf-8?B?SGdZdzJyeXNyaHRudXBwSys2d2RET09ZTDNKK2hrSmVIVUFVSmZOY2FtVTZv?=
 =?utf-8?B?VlBMUzRzbWEvMTkzRG9YTFF5YWV0QjFZdUd5V0FCWXZFQmJ5R3R4dkNjWG55?=
 =?utf-8?B?ZEE3Ty81Ti8zUnk1aE9IWVJzcTdqUXU4UnV6aUFBNTlBZ3pOaVpxZGZzbnJG?=
 =?utf-8?B?VGFvMndDbkR0akZ1MGZ5Vi9aU05DYnpIRU1HZkExbXNaQ3ZTU3QzRTRwSDdj?=
 =?utf-8?B?eGpqMkNQSC9Jc2RobFhsTVBNRDZjdDI1L2tadmVjMUJrLzlkeTFWSkY0Vndu?=
 =?utf-8?B?T3F1WUZHOGhHdXJMd1pUdTNoVitxNWRWa1drek9vQVZtaHZtVzlETkZtV01y?=
 =?utf-8?B?YnFMaFNuelZKV2xhcW85M0JZK1kwSlZSVWNvdEJOd2I0NmlYdkZ5ZDVGMHMv?=
 =?utf-8?B?K2NvMXo3SDQ3YnJrTythRkhJY0pEZmVKb3pzZ2UxVHZWUTJxdnBtekFwUHBn?=
 =?utf-8?B?dm1TblBtcVZnc1hBMWlZRERzN2RMNmRDTzk2c25uOFdIWHJtSVZVSGRmY01H?=
 =?utf-8?B?N2g1RFJDZFFpQnlueHV5VUhSclVnamRaNWJOMEZvdEw1WGtxa041M0NZek9a?=
 =?utf-8?B?MGhLb09CK2FoUFpnMm1CRjlHaUV5WnJ6UCtjU05vZzk2dEFkYnBYOHUzT2lp?=
 =?utf-8?B?SzJqSFdFa0hvb1NsSHhSRlRVQktrM2RENzNpRC9DOU9VcTlJdFlONUM4cVRj?=
 =?utf-8?B?T1pzdlRPTDFGVUJOZFlibFhFUkVEeW53MjBDMFlaUGxucmNCT21FQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54ffad1-88a0-4106-1e37-08df1851ad4b
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:31:59.2335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LWpbmfhpp+NCVh/OOZhRK7ol7yycvXqzeWbc5aYiQjgYE4AS+u+Nz11iittdeB93EVrLbGy8pmcU7cuFmGmrxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6903

On 9/21/2026 9:23 PM, Mark Brown wrote:
> On Mon, Sep 21, 2026 at 07:46:40PM +0900, Chancel Liu wrote:
>>  	if (rt5514_spi->irq) {
>> -		ret = devm_request_threaded_irq(&rt5514_spi->dev,
>> -			rt5514_spi->irq, NULL, rt5514_spi_irq,
>> -			IRQF_TRIGGER_RISING | IRQF_ONESHOT, "rt5514-spi",
>> -			rt5514_dsp);
>> -		if (ret)
>> +		ret = request_threaded_irq(rt5514_spi->irq, NULL,
>> +					   rt5514_spi_irq,
>> +					   IRQF_TRIGGER_RISING | IRQF_ONESHOT,
>> +					   "rt5514-spi", rt5514_dsp);
>> +		if (ret) {
>>  			dev_err(&rt5514_spi->dev,
>>  				"%s Failed to request IRQ: %d\n", __func__,
>>  				ret);
>> -		else
>> -			device_init_wakeup(rt5514_dsp->dev, true);
>> +			kfree(rt5514_dsp);
>> +			return ret;
>> +		}
>> +
>> +		device_init_wakeup(rt5514_dsp->dev, true);
> 
> Previously we would ignore the error and carry on without the IRQ, now
> we pay attention.  I don't know if the device actually worked or not.

You're right, I'll keep the original behaviour in the next revision.

Regards,
Chancel Liu

