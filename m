Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11021129.outbound.protection.outlook.com [40.93.194.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B2748A8AC;
	Thu, 15 Oct 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053258; cv=fail; b=Q2LGqO6TKnHpdasK+2x7a/F4ECloMlAmpyWtxE1CeUup0/aYh3Wcw24LpqLeb+iMxtlYJ0jMpKIFTOkXTUlQqkK5fjjeDE/rMFk1hQ9Q1DUufdcpAdCIaC0UJvkBf3i9+nTzgJ6xrRh8nNGW61lK4Mk/rg/RuKO7ZIbYhefm8ts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053258; c=relaxed/simple;
	bh=Ozc23atUqN6Uw0eVXJCRsckd3yGXgRi7em6nm0a7Nvg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Z/WcBMfCpzXL8zGO2ySxmV6UVSsA0VBCu1y2jiKl2zIh2GR0Bert31nIveys/tDYNh1LzUXT0iYylZ6K+R6G/TZ81vbMICgM2L+1P3oiS1EPKElfX00rvTgq+if52qH0sr11JVqBf6RQ7pbD+X08AfPUjgeoUpoqKYgupISLNmY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com; spf=pass smtp.mailfrom=axiado.com; dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b=pr01/fsH; arc=fail smtp.client-ip=40.93.194.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axiado.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=axiado.com header.i=@axiado.com header.b="pr01/fsH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qv0ouWJ5kyvoYzwEM6u5eb8kE75XfLpgCVPmp+mSKBF8dbdKEt9J1UctfvDizTEGCjCFMDEM1Zz+07P6zOt1EKJeGYC4puWbbkVZcmdzvgYUi5JOYvE1B+HuYItcm/QUZ6FC8s8iXc3EJvky1XMQdjjRqxFWbakTyzMDzIE+Ri8vwFIYtBu8FvTK99XsEfuBd7RyXh6gIg3DnKTE3vOl9kWeqrQnfJKUyBWiRzdd5hO0QCsE9H1a/Ry5U5ftSsyT3tDVLLCfY1JIwBFqv0WBRr6DiOlTIjpiNpeeZrWkYaHHjoVYm6r0umJzIyR7PcsU9di6WqZy3DPExh/L/9EBnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fXcvMnzQCYlVmxI9hRbPeoI/VE/Zr+PUoIsjt9tKQQ0=;
 b=XwZK/hdABE4KeEch0MPL6oQa0mQ1fAbE+q54DAJGO/joPcNJsSO72x68HDG/dtyArpUTxhXAwng59/OG3gScTJ10xL9F36BiJ+OdIRBhGm9gwJ7Ql+v7ZARyteCVNhh99JEWPEdjvxMH+iDpoeSzYgBCwOlZ2U1AwqIKgtUDNZtjR24g+4OGad/29H5Er5pG0vCZGZSlflNu5Y0hiFgkbSqpxf8qU992FV8j19P37L2jmJ/s8w2bsbgpzUS4zh405tsO3H+6/pphiPGGal/T82/0Y3tRq6gKN4YoR5tc5q00bgc/kpGVoY44HNL66bBega4vEtnUNdO96GAhb0HRcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axiado.com; dmarc=pass action=none header.from=axiado.com;
 dkim=pass header.d=axiado.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fXcvMnzQCYlVmxI9hRbPeoI/VE/Zr+PUoIsjt9tKQQ0=;
 b=pr01/fsHgv1MQRlt2T/yYo8GM1MMQdt9L9As7M2Cp3PDk+qhUQ6HXhZ3G2G7p50Ii6AXtm5c5EHRt+dYlLXfK7lcpfqwZE8tmG8g+vx24jMo2AjDnVjTyt7vYDW3jSjjxZ6outnlokRMJhj2HaTngDFeasu88iaSHt8h2Q8v+cGjH75ZXpIrMU+lLO4TXlPk+CndLZObSySeHyD6AEx3nQWb3ZxvlFjlXimziwv1X5m3NM7fLUvjr4Y85dBIKfaC90G064e/tfBEGe/c5ghXhSwIMQ1lpV2+whPYfWLJ9NDd9iSorzr0XqrDrrJqA0anjEC+Wpsls+VNAmnXJhzTVQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received: from DM4PR18MB4144.namprd18.prod.outlook.com (2603:10b6:5:38b::8) by
 LY0PR18MB897198.namprd18.prod.outlook.com (2603:10b6:404:207::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 08:34:14 +0000
Received: from DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11]) by DM4PR18MB4144.namprd18.prod.outlook.com
 ([fe80::cb97:ca8a:e55a:b11%6]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 08:34:14 +0000
Message-ID: <17eed43f-3fc9-47af-83f5-de7058830adf@axiado.com>
Date: Thu, 15 Oct 2026 10:34:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] usb: gadget: udc: add Axiado AX3000 and AX3005 UDC
 driver
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>,
 Krutik Shah <krutikshah@axiado.com>, Prasad Bolisetty
 <pbolisetty@axiado.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
 Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20260817-axiado-ax3000-usb-device-controller-v2-0-0ef033dd0a68@axiado.com>
 <20260817-axiado-ax3000-usb-device-controller-v2-2-0ef033dd0a68@axiado.com>
 <699de61dc2bfebdf18cdb0e377d1ba63886b4e12.camel@pengutronix.de>
Content-Language: en-GB
From: Petar Stepanovic <pstepanovic@axiado.com>
In-Reply-To: <699de61dc2bfebdf18cdb0e377d1ba63886b4e12.camel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::12) To DM4PR18MB4144.namprd18.prod.outlook.com
 (2603:10b6:5:38b::8)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR18MB4144:EE_|LY0PR18MB897198:EE_
X-MS-Office365-Filtering-Correlation-Id: 07c2a780-b093-4708-9e0e-08df2a9717f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|56012099006|921020|4143699003|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4rbIgU/2imXXNcLx60RuGpmBt7Qk0Ig5QEq1WxGQJrRIG9cjWE1bk01U9nSQl9adkgWulvGtuaXezElbpzl6hf+lfBdTkITJ0GHa8jdV7Wfiv5ccc4631tDoAmrPE5KcCZSkfGaZl3siRKU/k5sTuKbgnyFMoABdMD7X/LEKBAa4cIzSPm57bAct378QEivvKkwU23dtL1YJbu1ERd8U0Fp57wCYxSqblKc7jF6Gcyq+D9Hnrinzasbbcz4D00OLi9jPEmO148cyAqBPJF1zl/KcGxDc+9GlrXSGvhekyM/hBL0+X59y63P9LlSLuczZq9N4pYyixmKyinzxyXL1iaLb0QXf3HKwTqhDYYdMNY/MVqGbXLPGPSBzfiL8gRDAdjm/b7TGz3US651gPIq7tr/WLBGF+g9C9hw5hJLS4vAfKwz36FvVVCCAW1e6oBOSb7CRZW7bFBhL8vkSpbttkoE7PdcJEHJVzm9S8illfPjLfTSTLjcbqZqYOGjl1DiaxCTAY/GbVHjVmqh/wfiF8F6gruowhtM0/QOSEnjM/sN9940LAThOgTgZW+jukcD7t/ewnjoXVoktQ77czzFPhU0tRMNsJVCa5gNDSpXZh/XB7boI52MlcQA5QRuACwStgFMrpcndCDfX2uJ0l5VsC8YhyVpPrQm6SsU5LGLTSuS15FTZdtzwZIFtq0JRsxOg4RtfLdvPylcgQ4EPUOGV3g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR18MB4144.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(56012099006)(921020)(4143699003)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFBGc28vNUcvb0lVdXZkK1dwd2wxU3VBRDBSdE43S2cyOGFyV0Q0V0ZiVDAw?=
 =?utf-8?B?ejkvbThjMnpGQThEZUtGUjRZbXZUTUZxZmUvUmRoaDNiRVk0eVpkV2ozM1Fl?=
 =?utf-8?B?eHhwOVB4VDRwT2VTK0lFYXZZZThQUlkzNU5JWktzaEdyZEVmc1pRN0Y3TTB5?=
 =?utf-8?B?U0lDeVU3Y2RVSkJkT0ZZK0RQLzdIVFJsMm9xaFlGY0U5MHhNbXNYYVRnY0dN?=
 =?utf-8?B?a3NnVzhoeXg4K1JKaXJ6ZGVqL0VPQ1ZuSzd2NS9sMjR6Vm5PTzVoVFF4ZzJw?=
 =?utf-8?B?aExnNTRsaHV0cFI4emt0Rlhobm4wd3AyTmVpcEpUMFFRZFpPVXdNN1V1Qjhq?=
 =?utf-8?B?RmdNTUV1RHRyVUFVUWVML2dQb1NEb3ZRRzNyR0NSYTdLbjdDcHVSdTAwZkx5?=
 =?utf-8?B?S2tzdzMyT0pKYjVYb1l3V2s0czk5bXpha256MXFoekNCeUc3YWxZbksxb0F2?=
 =?utf-8?B?OGNUZjhtSE5NNk5ocGZIajRjWWZVWGl4bVBLZFY0eHFqTzk0SUJVVCtHV05m?=
 =?utf-8?B?M2p1azJuRlZHb3VZY01MNFFqSE5UMXo2OEs5Wms1OUhBUWxweG5xRlQrV2Zm?=
 =?utf-8?B?YitEZ1hPWnBYdFpFa3pNNlFPYzNwMStjR3RuOHRvREJaeDBIUXNUWkp5VFh1?=
 =?utf-8?B?L3FqaHEwTUllMm9zRDBtM3hhN1M3Vm01NGIySlNtak5Ibkhydy9RTVNzOGN5?=
 =?utf-8?B?TEtENDF6bUQxcXY4MkM2Uk1YbVU0OFBjMUc4OUdPQmZJWjNFZ2U2U2RINXNs?=
 =?utf-8?B?WEZrc280REN1SFlQRFh3NU9kSG16VHVadWdxNHVvTUl6S0kyTWZobXpvT2hw?=
 =?utf-8?B?Z2VLYldNcE5tajc3WjV2S0N5MnRpUnNYcUxUNXlPa0hlSG83bTA3dTd5OUhD?=
 =?utf-8?B?dmhqSXZ5dFFkeE45RVlGcjlOM1VKZFhTc3ZwREVlLzhqSHpIbDErY0k5K3lQ?=
 =?utf-8?B?R0c4UlBDN1ZLMHZZZlFtTVpIOWtwa09La3JyemF1RUxVRnA2VUVRaXNXRUdj?=
 =?utf-8?B?KzNmWm5EY2ZNZHdUNXZ1ZkVEZE1ENDZjMFkzK0VhaFFVdEdGamZKdmREN3Vm?=
 =?utf-8?B?azVuVFVEQ3dvUkZ6VjRRaWpiR0MvTVBZVG10WktML3NMSTQvU3Q1WG5Tc08r?=
 =?utf-8?B?bENIb1NESTVuRTE1QTBGeGpOZWFCU0dmRktCNFIxNDR5eDkwRWJLUkJDdmsx?=
 =?utf-8?B?dVV6MnJyOTR1TjE0NnM3VmNKV2txVjhxMEZyWFVlV1dNWkVIQlFDM0tITVQr?=
 =?utf-8?B?WHNaQXovMTlYZ09NcUVaUnNpYU95MktNaHg4NTFuSGdqOHNPNWpFM2lmUTBX?=
 =?utf-8?B?ZHNKUVVQdFRXRS9QK00zVThjMldGNGxOeXkrdStGTnQzQVVXZFhDaUlrWTRj?=
 =?utf-8?B?b1FEU3J3b3J0dXlpM0dOc01QcXR1ZHJKemtxQnFnaG5YdlRGWDRjaXE2M25j?=
 =?utf-8?B?MEx1YkFXd3RCSWNDd0J5d3pyWDF4eTBpbTVhd1d4QTFybmZVa2RYK0Z1MjVZ?=
 =?utf-8?B?Q21DVVNzbFhqRGh2cFNzeS9DWU9lS29PR2hWZG41MUxMblpGVkgxUnJKbk1G?=
 =?utf-8?B?NVJUSENjUXgrelJ5c1dPdHl4cHJKc1lxTHJDUE1tNVNIK2N0dFo0TVd1cTZY?=
 =?utf-8?B?WnFFZGdjN0tlRkNEMmJWbjViUHN1MzFqQ1k5Um5ad1ZocSsvK1MrakVzcHln?=
 =?utf-8?B?M3JvbkNQT0NzbmJpWmNXcDVXb0NOY2xFQ2FnV29QVHdnSGxmRDl0dTE5TEpX?=
 =?utf-8?B?U0pYc1JuaUJCcDdDM3p3L3hWVElBdUlUeHJmeUZnSVNFN05XOXV0K1k4TmZs?=
 =?utf-8?B?ZitnZ09KM0ZLdjA1NDFLSjBWZC9sK0ZiZE5IbFRyWDQwajNrUW5VbXJVZVhk?=
 =?utf-8?B?eGhKbmZLTVdCUWF0OWxzOUZhWTdqakljM2RPeEdITFFMc2VjcVlNekJ4ZER5?=
 =?utf-8?B?ZkNTQlpDQm4veE1maVkvdWdVV2cvNG90S1J3bFBrWlNRSlYzcHI5K2ZlUnNu?=
 =?utf-8?B?Tmgzc2Zwd00wTlRXNVBTVVpHRHdPeGlTcE1kVHpLc01ocHQweVlET29NM3dy?=
 =?utf-8?B?Um5FdjNVRW8rSG1RYS9hdmdpUzJBRWNQWDVYM3FBbUNMNytkc2xwU1BJNGlq?=
 =?utf-8?B?ZTBxbnpWRmk2Qk92THRZLzdVMjAzL2QzdGpsSXl1dXErdzYzZ1NjNFBzRUNo?=
 =?utf-8?B?REFSZTVBekJ5Mm9MM3hlcjZCNzZyM1l1a2FZNDh2ZVdqSTdKRjFIVUpJNDUr?=
 =?utf-8?B?U3pEdHREM3ZwVTZnYkhpMHMzdWIrdG84dllGWklxWG5WaTd2bVBXQ0VuVWo1?=
 =?utf-8?B?SHdjY3FwcG1OcUdTY0QyYlFUaVhaT0lXQVgrYnVjc2lUSjhURWt3QT09?=
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07c2a780-b093-4708-9e0e-08df2a9717f3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR18MB4144.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 08:34:14.2360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oc3cr7G8JNW9VFQo/vPWyhpAJ5umSfuWwmMqr7E0+8n40wRiYBVDxj+6bOvhKsUIfu+g0VPJstjq0+5AfMriLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR18MB897198


On 8/24/2026 5:33 PM, Philipp Zabel wrote:
> On Mo, 2026-08-17 at 22:57 -0700, Naveen Kumar Rajgiri Bassappa wrote:
>> Add a driver for the USB device controller integrated into the Axiado
>> AX3000 and AX3005 SoCs.
>>
>> The controller is based on the Corigine USB 3.1 device IP core and uses an
>> xHCI-like programming model with a command ring, an event ring, and
>> per-endpoint transfer rings composed of Transfer Request Blocks (TRBs).
>>
>> The driver implements the USB gadget and endpoint operations, including
>> endpoint enable and disable, request queue and dequeue, halt and wedge
>> handling, and standard endpoint 0 control requests.
>>
>> It supports High-Speed and SuperSpeed operation, control, bulk,
>> interrupt, and isochronous transfers, and scatter-gather requests.
>>
>> Signed-off-by: Naveen Kumar Rajgiri Bassappa <rbnaveenkumar@axiado.com>
>> ---
>>  MAINTAINERS                      |    2 +
>>  drivers/usb/gadget/udc/Kconfig   |   14 +
>>  drivers/usb/gadget/udc/Makefile  |    1 +
>>  drivers/usb/gadget/udc/crg_udc.c | 4491 ++++++++++++++++++++++++++++++++++++++
>>  drivers/usb/gadget/udc/crg_udc.h |  355 +++
>>  5 files changed, 4863 insertions(+)
>>
> [...]
>> diff --git a/drivers/usb/gadget/udc/crg_udc.c b/drivers/usb/gadget/udc/crg_udc.c
>> new file mode 100644
>> index 000000000000..bb3ed394d984
>> --- /dev/null
>> +++ b/drivers/usb/gadget/udc/crg_udc.c
>> @@ -0,0 +1,4491 @@
> [...]
>> +static int crg_udc_init_hw(struct crg_gadget_dev *crg_udc)
>> +{
>> +	struct device *dev = crg_udc->dev;
>> +	int ret;
>> +
>> +	crg_udc->clk = devm_clk_get_optional(dev, NULL);
>> +	if (IS_ERR(crg_udc->clk))
>> +		return dev_err_probe(dev, PTR_ERR(crg_udc->clk),
>> +				     "failed to get clock\n");
>> +
>> +	ret = clk_prepare_enable(crg_udc->clk);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to enable clock\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, crg_udc_clk_disable, crg_udc->clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	crg_udc->rst = devm_reset_control_get_optional_exclusive(dev, NULL);
>> +	if (IS_ERR(crg_udc->rst))
>> +		return dev_err_probe(dev, PTR_ERR(crg_udc->rst),
>> +				     "failed to get reset\n");
>> +
>> +	ret = reset_control_deassert(crg_udc->rst);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "failed to deassert reset\n");
>> +
>> +	ret = devm_add_action_or_reset(dev, crg_udc_reset_assert, crg_udc->rst);
>> +	if (ret)
>> +		return ret;
> This looks like it could be simplified with
> devm_reset_control_get_optional_exclusive_deasserted()
>
Agreed. We'll use devm_reset_control_get_optional_exclusive_deasserted() in the next revision.

Best regards,
Petar Stepanovic

