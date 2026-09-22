Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010057.outbound.protection.outlook.com [52.101.69.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF11364EBF;
	Tue, 22 Sep 2026 02:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790043546; cv=fail; b=EkjfPTXl0V0RmbsxKMf/rcEb9qrAFApl9SQv7GVOpFCJhJIUd4CAsKfcCJ2dhlRdKFAS4ClQUpz6SXg5Er2I+rT2AjrlscphP5QEYA/VzWo8uhp6UfMpCrsEebKt9Op8cGPYfCOiLxRdNI1pky5GGQVnDmB3dfLAfv5XQIQfXqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790043546; c=relaxed/simple;
	bh=xgP//YBnYafBnII+j4U7MVL3Dz8mnNV62Gzr2YeDUTE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nC3E+ZSNj+hfFREewnAdCp1OW/6Dyv3yLjepo23YAov9WUp/gHBOVGKFWM79UWBloQlHPL3xzPlG/Gz7j9rwBjIilMacAWWVLds3xNcamI2QTH+3YdjyJRGqKxrokbHIM0cHbe9gPTLrFnRqfly+VcHGWw8TVbWZS9ZrqHsIRRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oOavr9rw; arc=fail smtp.client-ip=52.101.69.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oOavr9rw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A0jUDocSP3IT+Y36bzARB9HdMWfU73NWvtnqmSazndAlKxW/L5PmyVTGD9xV9E6iH5w2EFeRVL2iOTfUBxg7IRrxESwxuGZmTV697nssQbZZurETMwSd4VpQHTbIacqz11iWKVVj5g6BTzFRNFiOHxBI9SC8R2g/BD0XMQPaHdjRXsB+YYDAVzW4ofodESQF6vG1cWERVNmY8BtG9Ldc29M+PDxS0tMbd7Kp5K5eQEFuRfSV8eQjb5chZLjUvAjrORGRYKLej+u7NQyYbmoeZwG5aMraMhFJJuv91SXSE5sXEqXdyvG37k2nT7+bxW/0dNxHKzeWBV2GXw4O53mJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW4a+WiocvsN/H8ebOuvTiFlUbApclyuFGDn5bqd61E=;
 b=fEHs2HscFkxoQB3wu0pRN/JJc6HwsMWPPoxUAuDh6QrsxlqGjF5dXt0FePzvRy+Gyz65E1M5o0qdL/ze76WwN5oml0xeqwud9OazsdinvvjeRkEGih8HN+13MOtQCgo0c0H4HvNUR9nCkOq8u3+ZNHN6+tBJnA/wY4QzD36OzghFiu8eGaKoxUhuX6liv44d5tWVZWYF37F8AR39NCX5qMVnW/AbotQIiKurHTwfUpOk3fwhABZ5DKRDD4lFFJlaRhDyQCWAmv9sRDZMGgeKu3tzsdfJKv4p44oqzz/y0TrLynY26wIW28nn3u3nOwoKMVgzz8dqWEl7MSp8fQh+ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW4a+WiocvsN/H8ebOuvTiFlUbApclyuFGDn5bqd61E=;
 b=oOavr9rwbL0XwQUdifaj39JZbrGrC64Zkv+JmmnSYltG3sDPCPbOCJdJogC6XWryeF7OCjLUoKhWa17KvuSt/ycQtJKXZexpK/1filZXF+RzneQFl0R+No+VNIbYC6kmpeQ92Il2VjMdykIZiHa3V7ZbnATYq+QZdmQfKTEn8c5qUKqGVgPGrDUGn46CcVEwtzLXIyJJwT8r3/30rTVTtxHkg4FVA59TQAvhFJBkRcOyyWtanphZqjsBQMneQksIDH7tKVWUPeXByN+EpbPvCndbEMyVnUGYtilCedWh8UuKwpB8TkpWuPTyFrWPVO/hF/0VRAzOmcwdVj0r1jkyHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by MRWPR04MB12069.eurprd04.prod.outlook.com (2603:10a6:501:99::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 02:19:00 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%3]) with mapi id 15.21.0451.012; Tue, 22 Sep 2026
 02:19:00 +0000
Message-ID: <805d3fd0-d935-4e91-b2b5-bc56a283b4f4@oss.nxp.com>
Date: Tue, 22 Sep 2026 10:18:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/21] ASoC: es8323: Move mclk acquisition to the i2c
 probe
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Oder Chiou <oder_chiou@realtek.com>,
 Support Opensource <support.opensource@diasemi.com>,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
 <20260921104640.1941554-7-chancel.liu@oss.nxp.com>
 <arEuUlpxzLbIYetu@sirena.co.uk> <arEup68eG4XrhnpI@sirena.co.uk>
Content-Language: en-US
From: Chancel Liu <chancel.liu@oss.nxp.com>
In-Reply-To: <arEup68eG4XrhnpI@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::16) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|MRWPR04MB12069:EE_
X-MS-Office365-Filtering-Correlation-Id: c0bea73c-e95c-4909-e30c-08df184fdd21
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|19092799006|23010399003|376014|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	fqhUMYjAQn+7qQfFUDBEQ0cmlR5o5LO0nI9pTmVyEhqDuRbcUfKsg7JLUA/2j+Y6+/y1ZoUw0kQiU9fOnz2fwSHwBV4e5zHh3cs0Zryo5vcLbpSNS0x3SfjKZQls5Km9oCgW8FgCWeVQmrEEaKLSRcD1KYo6I3J+iUNgYVaNZAmFBUPB6HYWToJNwsMVrp5ebuIUky4pADydp7f/9sXfLq798Xp2oNbmpeU+yA0zNVenJxH+3QM3Gv1fMoQKpUPjsJPvxkjVKwL8YVocU55TnZ2cKGvABHjC0X+HylN+DceTRnjL4/92GK0v7RH1O5zh0Mh5t6MBeyojM60ZusFEdG1vDlP1tqIXxT8bCfExJNyzPPZ5QNBO85SSUzUmpXE3Uj2/A/vtf4vJVnjNfBDfzoahLjw2++PC6+jpf/9L2Z7pivmr66CFRYbXoEaTXCSl/mmzFti7/bf5rp7cajIiYChRaE2rKQZEfXF1ka9FutQ4TjN9vDULbIVVnGU9ZD3awfim8qj267yimqVH8Ypm7HEqfiJkaiSzvnoQJf7xNss1UT6jnvZfEA/oXjifgkXveFS2hkXTv0RhOLAYpHE4gNlM1nuW8abtboG2kOzx3WqUiK0OnRvUVIGUqXdDsQsFh5QMtXLpV8AwmfVVZUqfs4vGmKpEAf7vsmhqSQdYPnE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(19092799006)(23010399003)(376014)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RW90SUpQdDJwdmhPMVBFRkNidWFCQ09hSmlTZkRnMTBJT2grNFB4MFBXem8w?=
 =?utf-8?B?eDJMT0VuVEYrejJtbVRJOVBDLzNrZGk4RnNMUmdtV2lONXhtZEVTNVZiVDJ6?=
 =?utf-8?B?Q05KMTR5UElUU0FnTWJFOFlQV2d3Y0VTRDJ2UkJuOVl4RXEyV0FxbjB0RmFU?=
 =?utf-8?B?aGNzWXVxL0xDOVlrS3RIZkdYOGs2VXU1LzB4T1pKYzV0dEhuWWhKdk55bXBG?=
 =?utf-8?B?b05tT3hzdk9yUFhrNkxLeGo0SDZKN3lEbzdhWWpWZG5Wa0VmRXovSXk4endk?=
 =?utf-8?B?bkphT2EzTm4vWkc5Nks0dm8rYVdpZ2RZanZyNDFvRER2YVlndGExbjdqY1A5?=
 =?utf-8?B?bWNsdno5YjdxL0d3QXVaSVJveDcvUFNCbG9BRVArWVl0S1k5UlZUeHd2c1l6?=
 =?utf-8?B?eEpXenBIUDhrbEVqVEFJUE42MUZ5R1Q3SUVwTlRaaS92aUU5QzI4THREL2xD?=
 =?utf-8?B?YUc4cytXclVKWXB3S1I4aUlBb3RMMFN1RERJZlZLYTQ0OTdUVERaMGREYXVN?=
 =?utf-8?B?WDJOaHExc3FQNXg1STl5bTlIUXJ2VjluMkVYVGlSdFVQVkxOQXFuYXFBaldQ?=
 =?utf-8?B?ODRJNEdBQjIwbkxrVnA5cCs4d0tjem1lMU12UnZxRTd3QzJ6NzZaVFFTekxz?=
 =?utf-8?B?MWVOeVh0VVZZUEJGb1RFcUU0aS9rSXRDZUpzUnhXZEVkbUlXeEUvZ2k3dFhR?=
 =?utf-8?B?YzZOT1dWNWtDajJkd0REVVdwdE1LWnAwdFRnSlhIbERPdThjL1g0Mm1uelJS?=
 =?utf-8?B?RmxZOGJrZjU5bkVFQXFmU3IvM0haRGswWkNnU2V2dmdZQ3MyUWJPZXdQdFZ0?=
 =?utf-8?B?K0ZNWmV3Q0hkR1FERnkrWCtvRHhHZ0ZDM1Q0RG11VXlNaXRzUkxVZmROK1l3?=
 =?utf-8?B?RHVaR3hzNFlsVVZqd0RrcXN0WERNSVQ5VnVwM2p3S3lxd2VzU2lrZ1JWckRu?=
 =?utf-8?B?azJ4eUo5ZkZycmRUL3RQWGR2Ri9oQ29qQngwSVZHZEhhTEVzRi9rNWl2azNy?=
 =?utf-8?B?NGdkTnlCZ0lwSGhab1padjJzNmZaNlpiUWJOQ0lJTDU3cXlUbGp5YXh5WGda?=
 =?utf-8?B?MDRqVlFBV2JKb1hGeXl2Z290N3pNcUlhdXpmVFJzbVlpTmNoNTJWMUlBSVk3?=
 =?utf-8?B?NWpMYjhDQ3VETWtzZVUyUnVSaUsvZzVPRXU5MEhKWExEZk9vNW5EdzBLTHly?=
 =?utf-8?B?Ly9OZjI4QTE5TTBiek1OTlVzTmR5OUxsVmVpcHpkMys4d2FkRzRPSUVtK0Rx?=
 =?utf-8?B?R2p0eDFHRFJqbzVURVFHcllTTGFNWmFYdjhmS0YvVUwyRkw5NnRxNlI5cnln?=
 =?utf-8?B?SUxjVlg2anR4SGt2SmdpMmJpTTU1aHoyUVY1aFJPOXlFQ203SHVzMDBkK0Rj?=
 =?utf-8?B?QnJOa05mWUFtaENoa0RhV2RieE54aDJkSlBOekZYaXovd2ZXa3JvZ21RYklx?=
 =?utf-8?B?ZHJpa2J3QWR4V0pKejNxMkdRN2xlRDIrTS9SRW1zTm1kaVV4bDZ0NDlCZjFC?=
 =?utf-8?B?Rm9WdnpGYkdGbEowbkZCRU9iN1EzV0hMdncxRjN2QUtpRURjcEdUejVJYVVY?=
 =?utf-8?B?QThDWXZIVHkwdG1LQ0lqTG00aStxS1c0N0Y1VDlDaHl3Q2hzL1VTa0JEOEY1?=
 =?utf-8?B?Z3U0YTYrKzROTG9aQ2ZSc1VseWU1NlZHZ2hlZklQSFU2amdtdCs3blBycHhu?=
 =?utf-8?B?SkV1MHR2cng4ckN4aXdRUHdNN2JwdTUwaE9yK21MTit2NjdxVDAzcUthdWNB?=
 =?utf-8?B?ejRnSWVjQUttdDhYTUZnNWZIalhsaU1ocTRQek02RHRzcXlTbzdJQW94NDVp?=
 =?utf-8?B?M0tHQmFuNm5Ybm9zSTE2bjZ2Y2FCa3BwWFU5ckFWWWJMUDl6TkUyc3lSendS?=
 =?utf-8?B?N3FuSW5TcGJTOUtQOXFsbHE1ZU9EaDQrQ283NW94c3FVMWVrR0lULzRuZzNO?=
 =?utf-8?B?NHJlR1F1V1hKbGF5Q2d3MHdaZUVNTDdJSlRpS2J5djZxZzJjMWN2YnpYV3NO?=
 =?utf-8?B?L2Fma1JvWVZiWVRORXo4OXVlUXc2WVlZTmMyVTEvS3YwSXMyVFdhdFo4Uk42?=
 =?utf-8?B?UHZ1UlcwcGdLQU02bEV0UkQ2cTFCR2hVSW1vRnMxeXNzcEZqNEFzM1o0YjBx?=
 =?utf-8?B?cGN6NXJscGhyNlVGemRnZGx1VnZRakRFdUQ2b1FZbnovbUlnZU55MGVGTXl2?=
 =?utf-8?B?NkJZZ2h4dTdETWp1NURYRjFrTDl4M1FNR2J2RC9aNWVaYjBibjRBYVgrM3dE?=
 =?utf-8?B?SHdLREJDNk52SFVzNHpBdk5iZnFycDdTYnZVKzhQZXcyaHJBeU5ES3dXNVUw?=
 =?utf-8?B?R3BYOWZCcTNvRHg2Q0ZXSTNDZ0YvUmZLMWhFK0dQdkw5UGdJWUcydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bea73c-e95c-4909-e30c-08df184fdd21
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 02:19:00.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TA8LIK7rsDSPzt+reqZodMDnITGwCqelYgG6allZo5Zjcr9XBEWLi/Cw/rHZqC3ihvwyFcUreXf7b0JLJLPCYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12069

On 9/21/2026 9:18 PM, Mark Brown wrote:
> On Mon, Sep 21, 2026 at 03:17:07PM +0200, Mark Brown wrote:
>> On Mon, Sep 21, 2026 at 07:46:25PM +0900, Chancel Liu wrote:
>>> From: Chancel Liu <chancel.liu@nxp.com>
>>>
>>> component->dev is the underlying i2c device whose devres is only
>>> released on physical device removal, not on ASoC card unbind. Getting
>>> the mclk with devm_clk_get_optional(component->dev, ...) in the
>>> component probe therefore leaks a clk reference on every card
>>> bind/unbind cycle.
>>>
>>> Move the devm_clk_get_optional() to es8323_i2c_probe() so the clk
>>> reference is tied to the i2c device lifetime.
>>
>> There's also some devm memory allocations in the DT parser which is run
>> in component probe.
> 
> Sorry, meant to send this on the da7218.

Thanks for pointing it out. I overlooked these extra devm allocations in
the da7218 component probe. I'll fix it in the next revision.

BTW, I've re-checked the other codecs in the series and didn't find the
same pattern.

Regards,
Chancel Liu

