Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazolkn19010023.outbound.protection.outlook.com [52.103.43.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3744372691;
	Tue, 13 Oct 2026 06:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.43.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791873074; cv=fail; b=btnEzwPYD/F8L7smCGTZoYM6aE2VSdm7Wts3WnboublahpDnPz8l1tqG/fALkyScHVqery3V1A0sw+tjiW917rTtTDl2mtNPZv0SXciBnRwUD9D870sLqHINUg0R1TPNqNMMDWkUFj2I5IeRqKy19jmeWYK25A0PX4EIqGHlWwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791873074; c=relaxed/simple;
	bh=yufYWdwkVgqmEYzIIiFdx/xt/5ugPgzHYtIHFYczM7c=;
	h=Message-ID:Date:Cc:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Nqmdf59tWOpciGs6X/hsfcHAjDlchUnr4y3mvml7Si9aYD+XsBu0Lc4H8Gc1KJWU3L/pn6K5LjeCub2MMixTIsPHEfmLP51Ch58KZ9KOSbSihOIrrJVPHGvPkOwmg268SFReegBM3muzLuQ2SufgAoAVc+MyKj/FNsU2dAiZINw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=BqliCFBG; arc=fail smtp.client-ip=52.103.43.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="BqliCFBG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpE3v4uPkBFSI2ioEK2NB/U9QO2NIAIoOoUKkqlJFx2ssFO0rgA6XGxJCXZCnEscRMPjAxgfl7QmNP+s4/xatKiRqDf2dL6+1uPWyxMW2cUc8ezyZDo8rQ580yUpUDcDJheANQ9bOO93k+2xBSzyG3PCW0QSqruJX4cqxExDRv7q7jVbxyzk7ulFTDpgydzOY2waaYhNyYhkLIdqoyUXw1VZK1RMmiWUGNYlTVBPsTkkigkfZkefe8mXJYkZTrtSumcUOH48UO3GOD2vfhKWtGi4RWAOjCIoxxcMLETdoCSSzkSzoKD1cBx688pNSYugiPiXuzCJx3gEbbZTf1DFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yufYWdwkVgqmEYzIIiFdx/xt/5ugPgzHYtIHFYczM7c=;
 b=RPhXjN+OIpEu9+6+PQIesVKv+17xbQSu2ewEMHwBeTL+VzDIwoYBnRku9NONuNURZtxK0Bl8yyJyFrLWP4Dp65bptWJXcMJ76XkauoUrS2sb5C+Ek2H66/EJP4yNXk84tmB72gY13tH3WC/nOKPfdBp+Ath5RM6WrBCqDUqb+tfDOtKdFR3ujjHvJu5dNyLmmX/gDE6/eUs9bBLYXL1Ms/x+K7lwWXEDucGp5IApV+bM7klHcxAbEWEjl7w6cZYLVk9YF6J34gWLAEGhHHijNt8kmkXU9OOgbUDdCO2EgZBKZc4gvJbk/eS8loEg1WnlHEdt5P/3AFvTG2s6lrEsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yufYWdwkVgqmEYzIIiFdx/xt/5ugPgzHYtIHFYczM7c=;
 b=BqliCFBGnnDtvlCXFpcjWgpwt6s2cr+fNRn0XhJPQofmoqcBm+RIvWkG148btfgsqpot/ucZvKtAuNgtYz8EJocIybWjy1aBOtBJGFi+N2YUPGhPCtoX+eVSoteT5I/0glKMkrQCJbz7y/UFzuKq8fGdaedkdccJgq7gFvK80vSn2NGDfRl5up5+ZZNKL57rBQTP1GyKnt6oEF3Hw+1p8T4/sld+Sp277MTENdYwH5Py/RK8B65WJQL40aIqf118feKuUqkGD1h0gssFliI/ApkiOFUjpny7b3nBZJ2W2LyUeV1xbRMjk/UEGt9Ni+BhOo/6CfeDRJz2kq51db6hoA==
Received: from TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13) by TYWPR01MB7404.jpnprd01.prod.outlook.com
 (2603:1096:400:eb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 06:31:05 +0000
Received: from TYVPR01MB10892.jpnprd01.prod.outlook.com
 ([fe80::911f:7aa6:717e:cac3]) by TYVPR01MB10892.jpnprd01.prod.outlook.com
 ([fe80::911f:7aa6:717e:cac3%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 06:31:05 +0000
Message-ID:
 <TYVPR01MB10892166F8E1073891D64AD98989E2@TYVPR01MB10892.jpnprd01.prod.outlook.com>
Date: Tue, 13 Oct 2026 14:30:54 +0800
User-Agent: Mozilla Thunderbird
Cc: wiagn233@outlook.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
To: Jennifer Berringer <jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
 <20261012183204.c845fc69@redhat.com>
From: Shengyu Qu <wiagn233@outlook.com>
Content-Language: en-US
Autocrypt: addr=wiagn233@outlook.com; keydata=
 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
In-Reply-To: <20261012183204.c845fc69@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m9mEhZVNtdS2mxS23Ml6w5cF"
X-ClientProxiedBy: SE2P216CA0031.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:116::10) To TYVPR01MB10892.jpnprd01.prod.outlook.com
 (2603:1096:400:29a::13)
X-Microsoft-Original-Message-ID:
 <fbdabbf5-98ee-4e08-87f3-77861f9d8a84@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYVPR01MB10892:EE_|TYWPR01MB7404:EE_
X-MS-Office365-Filtering-Correlation-Id: dc47647d-828c-4d1d-4ae9-08df28f38e9b
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|23021999003|6092099016|51005399006|8060799015|19110799012|15080799012|12121999013|24021099003|4140399003|25010399006|440099028|4302099013|3412199025|26104999009|20055399003|1602099012|12091999003|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VDZXZU51dnNzQ2dQcUdSaEwwVDdnaGpvWisyQ2FBZVM1R0pXNWp2cEl5V1RD?=
 =?utf-8?B?OVRSU3gxZ3RhbnVhVFY1UG5vWEtMVmlRNG9EMEcvaitRVS9rWWdxMDlWYndR?=
 =?utf-8?B?TzBBeGtHaHdtUFVxc3ZGLy9hc0lzRlBMSGNhcWhUamJDSDhMRWJWcXhkRmR0?=
 =?utf-8?B?OGNBd1E0S3dvNUdKNDEzdXgxemtYTVA0b2hwcm1aSG4rem02OUROUVpjR2NW?=
 =?utf-8?B?cnpQWGNpdjhqcm9HNjdZVldscnJOR2xlb2hoL0FORkRNUjdwcDFZSHA4YWJC?=
 =?utf-8?B?VlBzSWdRS0Z4eEFFN1dKQXY2a043QnYxZjhTZzB3TFhHUE5DR2c4MldVbTJi?=
 =?utf-8?B?VHg1Rzlua0o5c2RIRytYZzRSNDlwN0N2OXRVRUFVMFBJRXdGdi9Pb1RzNkwx?=
 =?utf-8?B?dnk0YlZWcy8ydjBnM2dOanBQRFdhTDNlS0pTVFJYVVBQVWd2Uk1yS0JQalJw?=
 =?utf-8?B?WDFKcmV3aHlhMW40WExiU0FCam41VkRhRHNqSVMyaHh5V01BcWhXei8zMHlB?=
 =?utf-8?B?WWVTcld1Zk9TZ0Q5Tk9vK0poTCtqMGhya09jdW9YWTZUeFljTWNjaXhOYnhw?=
 =?utf-8?B?Yy9UZis0RkFCSlZVZmFNRy9nQVp1Vm8reEhNQXF0ejMxWDlYK3kxTSt0RFEx?=
 =?utf-8?B?aEQwWVRKanY3Njhnd0pHbU16Znd6bFVHM2t3Mk5zcW4xeXpKL1BOOExIYUZo?=
 =?utf-8?B?NjNOZkJKVjAvTWNoenF3c2xYT2NTRTBieEVHZUNSN0VNUTdmbUZaekdFS0FZ?=
 =?utf-8?B?WUYrNXNXckJaOHVsczMrVS8zNDR3M0RreXl3ekhkbnQwTzlwWk4zVTRqYys5?=
 =?utf-8?B?WE1Nc0JjdnM0ajlpT2hNK2d1NGQ4cDNXMzMvL2VoSkxSU2xzQVlaOWtQL3Bj?=
 =?utf-8?B?Qk9HZlo5Unc3MjNPWE9kMllNeXJwdEJ1RCtkOGs5K2d2RVU3ckd6ZDhRbExj?=
 =?utf-8?B?cFJSUmRaRGsxVkp3a2RWWi9rTDZ4KzIzRjZWelVjcXNFWEFoWDBPUUdpQWVh?=
 =?utf-8?B?Sm9TYnRUM1oyUWQzemU2VHk2NUtNb3ZIQ1ZCUVV4alU0S2sxSkNkTXEwdXFU?=
 =?utf-8?B?TlBvSVMrVVM4bHc2dHBUR3ppVGFiOTdTbHJrOVZHVHNCTC9ERmgxM3ZoclFD?=
 =?utf-8?B?N3BvUWlhSzZqbTU5Tlg0R3ViZE9abFVWZ0M0YXBodHlwTm13ZktncnBtSGVs?=
 =?utf-8?B?Zm1TMTdtbE56QzVpUnhpeXQzR3FpaVNSempHM2tvckd5NzJ3QVJNT2xPbDdB?=
 =?utf-8?B?NC95VUJXbXl1SFpoTXhSemNDeVdoTlMvZ0lFNWdFUnZyUm9jTkFjUElLUWIy?=
 =?utf-8?B?cGN5UjRRN2NKT1k1UVJITy92VGxOeVBva2dZbzdRWXdyeXVNczY1cGNWZXdB?=
 =?utf-8?B?ZzZxK2NLMzlqY25wc0RwQk9iZmZSV0VQU1Q5S2NYQjhyNFQrWjZZa3IzRTQv?=
 =?utf-8?B?VUN4c3RROXRvUDdkWTloVktTZnY3cVVxRU1wYzBSMlJka2w0QWpwU25PQ0Nv?=
 =?utf-8?Q?gz2/D0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkhyWENLb2wzdWpzeENoNXJKUU0vckVOckpqSUY0T2ozS01YVHBSZEtHSUp0?=
 =?utf-8?B?aGJZdzQwQlB3Nit6VENQMjlkV2R1Q0FRQ0lucGtEVjlZemI5Q01PZEhENkls?=
 =?utf-8?B?TC9Wd0VtVnhsQXNpeXZUMzRocmsxYlBRUjNlVEl6aG4vMVpsWGIzM2V0UTM4?=
 =?utf-8?B?ZmY5anlsSThoR2ozY0MrK3FYQU1jenczaGMxMlZGMmowaEtpNmJsNERIVGVL?=
 =?utf-8?B?dEkrOEoyOXJ4SUl4WnVVRFJqNHFhU0xmMkVWV1FBVUpRdlJTWkZ4bEtDbHBv?=
 =?utf-8?B?NjR0NXRsSjY0Y2U2ZytxL2ZmQ1l4ZllUclVaM0hpQUtFLzlrdXJ0NkdaUVZZ?=
 =?utf-8?B?RlpLZnN4TmdKUjNWdHErQlJpT1Fxb2Q0bk0yTmxmYjkvUFJuWGE4b3F4ZDRz?=
 =?utf-8?B?cm5CbkQ4TjFnUVRXeFcydjh6cjk2MUpaUmdsK2NLVTlIRTJCd0EvcFJwd00r?=
 =?utf-8?B?NDFZV2YwVmtBOXZyVlRyUzZHeEdtdFZTbEErZmFOWmE1L2tnQ3p3cVoyc0NY?=
 =?utf-8?B?RktoU1ArclhwWXdFYnNMbDFWd1E3VEpjbVZ5Ly8xeWhVZ0JoSjRNN09TbE1X?=
 =?utf-8?B?eWMvSlNremQwWVNJcE5HWVZmTXZGNG5wbElKSGYzR3FmbTBoa0g1WDl0TEdo?=
 =?utf-8?B?Ukx0NHBoZEtwQUxLSnhHN3MvYkxuMC9ncSt2WUEwT09rbnBuaGV1c1h6MFFh?=
 =?utf-8?B?R0x1U3U0WW1vTzJFRVRHU3N2RnhXeWJjaFpCK2tkbi9rU3pEN2svZlRWb3Rx?=
 =?utf-8?B?SzVqU0czU2JUc0RQd3A3eFByVlRBRnpZSnBWOFJTZHVoUGNNaDA2aGhSNzBB?=
 =?utf-8?B?ZDZRVVhjb1JOWXZyQStObmFqMEFJQVIva2JwcFA0NUx6anNuRzVVRExoLzdi?=
 =?utf-8?B?dnNvM1F5V2x6dW9mcnpRendzKzl0eEZOQ2I4VDZxOHhJaVFDR1UzWlNjVStn?=
 =?utf-8?B?bUZza2RsY0ZvWDBqcTJ2NXYyWWsyWnpCdWJaN3ZPZkM5WjhOZlNFd0VCUklj?=
 =?utf-8?B?REFEWUY0ZGNDbkdZdkpJYXVib0dnazY1Ky9ramc0dTIycWZDWW13TndVeXhV?=
 =?utf-8?B?dHQyNG9mbjQ5c3RhSnNsRmkzTGZZTExZWUhDOUxqeVFrVWJUamVtVVpQNUxD?=
 =?utf-8?B?NitVaEF6cGdtTDZ5dURhb1M0L0pzZmxwV1ZHSFVGdjl1aFU4NE9nR1N3Q1hp?=
 =?utf-8?B?NjlDMUVLMEV3bnBXT1BzbTNuM3FSNXRTQTFFUkRuUnNzSTZKQnJLaWpZUW5R?=
 =?utf-8?B?RnlZaUpDcnFDdU9LOU0yaGhHRGtWWXEvSUdSRnNndHl4ZTFBa2toUzYzVStu?=
 =?utf-8?B?VVNmMEIrbFZ4WkZKN3RRVjVlL2VIQktLd2tBZEtXdWJybG9jTVBLeWc1RVp4?=
 =?utf-8?B?Vmk0Y2daZkJ1bW1kNUE1YVZnQmNGd0FxYkZaMDcrRE44VEZnM2VOa1pSODhu?=
 =?utf-8?B?REFlMEpvalN6Y2hMUHBVTkJzMlFvdk5WZm1lOTkwQkRiN21jZmhmeGFHUXo3?=
 =?utf-8?B?eCtmdVFQKzlwQ1V5dlErNENRdU5sREg2LzBmTm83eDV3TmpkWVI1R1lNYk9t?=
 =?utf-8?B?eTUvbmtFNXd3ZXhtOE8vOGNsTTZ4eXllUnNZTERZbmJ5YW43OHoyYVdBRzN1?=
 =?utf-8?B?ZmFBdGVic29ZZjgySUhMeUY1YW9aZElFci92RTZXYlZobm5ucjFObDQ1anpB?=
 =?utf-8?B?ODNITFB2VXE3RGRSU1BhR2JmNjRTcXA2NjR4UmNWSlN1SkFsTkVzZTFlTkth?=
 =?utf-8?B?QW5sNnNRSER6b2lRYkRvNTlzU0J5ZmZpdkYzb2tHa21RaC9BbGZVdktVNU1X?=
 =?utf-8?B?RzFMVFk3ZkhHM3RvRE0xV0E5dVlFajZBWnFtdUtrNHQvdEdab3JMSFA5cExa?=
 =?utf-8?Q?D+OqZGnr0QxYM?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc47647d-828c-4d1d-4ae9-08df28f38e9b
X-MS-Exchange-CrossTenant-AuthSource: TYVPR01MB10892.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 06:31:04.9144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7404

--------------m9mEhZVNtdS2mxS23Ml6w5cF
Content-Type: multipart/mixed; boundary="------------hlec9N2arRzUhIst0dbu2YIY";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Jennifer Berringer <jberring@redhat.com>
Cc: wiagn233@outlook.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 James Morris <jmorris@namei.org>
Message-ID: <fbdabbf5-98ee-4e08-87f3-77861f9d8a84@outlook.com>
Subject: Re: [PATCH 4/4] riscv: dts: spacemit: k3-com260-ifx: Add rfkill nodes
References: <20260928231807.1757995-1-jberring@redhat.com>
 <20260928231807.1757995-5-jberring@redhat.com>
 <TYWPR01MB10887E1A3744FD44000F89E8F98922@TYWPR01MB10887.jpnprd01.prod.outlook.com>
 <20261012183204.c845fc69@redhat.com>
In-Reply-To: <20261012183204.c845fc69@redhat.com>

--------------hlec9N2arRzUhIst0dbu2YIY
Content-Type: multipart/mixed; boundary="------------RzKVeGhcz4rDdSyGcZTUFF07"

--------------RzKVeGhcz4rDdSyGcZTUFF07
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCuWcqCAyMDI2LzEwLzEzIDI6MzIsIEplbm5pZmVyIEJlcnJpbmdlciDlhpnpgZM6DQo+
IEhpLA0KPiANCg0KLi4uDQoNCj4gDQo+IFRvIG15IHVuZGVyc3RhbmRpbmcsIHRoZSBwd3Jz
ZXEtcGNpZS1tMiBkcml2ZXIgdGhhdCB1c2VzIHRoaXMgYmluZGluZw0KPiBjdXJyZW50bHkg
b25seSBzdXBwb3J0cyBzeXN0ZW1zIHRoYXQgdXNlIFVBUlQgZm9yIEJsdWV0b290aCwgYW5k
IGlzDQo+IG5lZWRlZCBmb3IgdGhlbSBiZWNhdXNlIFVBUlQgaXMgYSBub24tZGlzY292ZXJh
YmxlIGJ1cy4gUXVvdGluZyB0aGUNCj4gY292ZXIgbGV0dGVyIG9mIHRoZSBzZXJpZXMgdGhh
dCBpbnRyb2R1Y2VkIHRoaXMgYmluZGluZzoNCj4gDQo+ICJUaGlzIHNlcmllcyBhZGRzIHN1
cHBvcnQgZm9yIGNvbm5lY3RvcnMgdGhhdCBleHBvc2UgUENJZSBpbnRlcmZhY2UgZm9yDQo+
IFdpRmkgYW5kIFVBUlQgaW50ZXJmYWNlIGZvciBCVC4gT3RoZXIgaW50ZXJmYWNlcyBhcmUg
bGVmdCBmb3IgZnV0dXJlDQo+IGltcHJvdmVtZW50cy4iIFsxXQ0KPiANCj4gSzMgQ29NMjYw
IERldiBLaXQgc2hpcHMgd2l0aCBpdHMgRS1rZXkgc2xvdCBwb3B1bGF0ZWQgd2l0aCBhbiBS
VEw4ODUyQkUNCj4gbW9kdWxlLCB3aGljaCB1c2VzIFBDSWUgZm9yIFdpRmkgYW5kIFVTQjIg
Zm9yIEJULiBJIHZlcmlmaWVkIHRoYXQgbXkNCj4gcGF0Y2ggc2VyaWVzIGRvZXMgbWFrZSB0
aGUgcmZraWxsIGNvbW1hbmQgYmUgYWJsZSB0byBkaXNjb25uZWN0IGFuZA0KPiByZWNvbm5l
Y3QgdGhlIFdpRmkgYW5kIEJUIGRldmljZXMgd2l0aCB0aGlzIG1vZHVsZS4gSSBhbHNvIHRl
c3RlZCB0aGlzDQo+IHBhdGNoIHNldCB3aXRoIGFuIEludGVsIEFYMjEwLg0KDQpUaGVyZSBh
cmUgc29tZSBNLjIgRSBrZXkgY2FyZHMgdGhhdCBjYW4gYmUgYm91Z2h0IGFuZCBpcyB1c2lu
ZyBVQVJUIEJULA0KZm9yIGV4YW1wbGU6IFJhZHhhJ3Mgd2lyZWxlc3MgY2FyZHMgKGV4Y2Vw
dCBBOCkgYXJlIHVzaW5nIFNESU8rVUFSVA0KaW50ZXJmYWNlIG9uIEUga2V5IGNhcmRzLiBB
bHNvIFF1ZWN0ZWwgaGFzIHNvbWUgUUNOQ004NjVBIGNhcmRzIG9uIHNhbGUNCndoaWNoIHVz
ZXMgUENJRStVQVJULiBUbyBhY2hpZXZlIGJlc3QgY29tcGF0aWJpbGl0eSB3ZSBjYW4ndCBq
dXN0IHVzZQ0KY3VycmVudCBpbXBsZW1lbnRhdGlvbi4NCg0KPiBJbiBhZGRpdGlvbiB0byBQ
Q0llIGFuZCBVU0IyLCB0aGlzIGJvYXJkIGFsc28gaGFzIGl0cyBNLjIgRS1rZXkgc2xvdA0K
PiBjb25uZWN0ZWQgdG8gc2RpbywgdWFydDYsIGFuZCBpMnMzLCBidXQgbm9uZSBvZiB0aG9z
ZSBhcmUgY3VycmVudGx5DQo+IGVuYWJsZWQgaW4gdGhpcyBkdHMgYW5kIHRoZSBSVEw4ODUy
QkUgbW9kdWxlIGRvZXMgbm90IHVzZSB0aGVtLg0KPiANCj4gU2V2ZXJhbCBvdGhlciBleGlz
dGluZyBkZXZpY2UgdHJlZXMgc2VlbSB0byB1c2UgcmZraWxsLWdwaW8gbm9kZXMgdG8NCj4g
Y29udHJvbCBXX0RJU0FCTEUgcGlucyBvbiBNLjIgRS1rZXkgc2xvdHMuIExvb2tpbmcgYXQg
cmszNTg4IGJvYXJkcyBmb3INCj4gZXhhbXBsZTogT3JhbmdlUGkgNSBQbHVzLCBBcm1Tb00g
VzMsIGFuZCBSb2NrIDVCIGFsbCBkbyBzbyBpbiB0aGUNCj4gY3VycmVudCB0cmVlLg0KDQpU
aGF0J3MgZHVlIHRvIHRoZSBNLjIgRSBrZXkgc2VyaWVzIGp1c3QgbGFuZGVkIGEgZmV3IG1v
bnRocyBhZ28gYW5kDQp0aG9zZSBib2FyZHMgY2FtZSBtdWNoIGVhcmxpZXIuIEFuZCB0aGF0
IG9sZCBpbXBsZW1lbnRhdGlvbiBoYXMgY3JlYXRlZA0Kc29tZSBpc3N1ZXMgaWYgd2UgdHJ5
IHRvIHN1cHBvcnQgVUFSVCBjYXJkcyB3aGlsZSBzb21lIHVzZXJzIGRvbid0IGhhdmUNCnRo
YXQgY2FyZDoNCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjIwMTY1MDUx
LjE4ODkwNTUtMS13ZW5zQGtlcm5lbC5vcmcvDQoNCkJlc3QgcmVnYXJkcywNClNoZW5neXUN
Cg0KPiBVbmxpa2UgdGhvc2UsIHRoZSByZmtpbGwgbm9kZXMgaW4gbXkgcGF0Y2ggYXJlbid0
IGFjdHVhbGx5IG5lY2Vzc2FyeSBmb3INCj4gdXNhYmxlIFdpRmkgYW5kIEJUIG9uIHRoaXMg
Ym9hcmQuIFRoZSBzaHV0ZG93bi1ncGlvcyBoZXJlIGFyZQ0KPiBHUElPX0FDVElWRV9MT1cg
YW5kIHRoaXMgbWVyZWx5IGFsbG93cyB1c2luZyByZmtpbGwgdG8gYmxvY2sgYm90aCByYWRp
b3MNCj4gdmlhIHRoZSBXX0RJU0FCTEUgcGlucywgc28gSSdtIG5vdCBvcHBvc2VkIHRvIGRy
b3BwaW5nIHRoaXMgcGF0Y2ggaWYNCj4gYW55b25lIGJlbGlldmVzIGl0IHNob3VsZCBiZSBk
cm9wcGVkLg0KPiANCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNjAz
MjYtcGNpLW0yLWUtdjctMC00MzMyNGE3ODY2ZTZAb3NzLnF1YWxjb21tLmNvbS8NCg0KLi4u
DQoNCg==
--------------RzKVeGhcz4rDdSyGcZTUFF07
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBGK0ObIBEADaNUAWkFrOUODvbPHJ1LsLhn/7yDzaCNWwniDqa4ip1dpBFFaz
LV3FGBjT+9pz25rHIFfsQcNOwJdJqREk9g4LgVfiy0H5hLMg9weF4EwtcbgHbv/q
4Ww/W87mQ12nMCvYLKOVd/NsMQ3Z7QTO0mhG8VQ1Ntqn6jKQA4o9ERu3F+PFVDJx
0HJ92zTBMzMtYsL7k+8ENOF3Iq1kmkRqf8FOvMObwwXLrEA/vsQ4bwojSKQIud6/
SJv0w2YmqZDIAvDXxK2v22hzJqXaljmOBF5fz070O6eoTMhIAJy9ByBipiu3tWLX
Vtoj6QmFIoblnv0Ou6fJY2YN8Kr21vT1MXxdma1el5WW/qxqrKCSrFzVdtAc7y6Q
tykC6MwC/P36O876vXfWUxrhHHRlnOxnuM6hz87g1kxu9qdromSrsD0gEmGcUjV7
xsNxut1iV+pZDIpveJdd5KJX5QMk3YzQ7ZTyiFD61byJcCZWtpN8pqwB+X85sxcr
4V76EX85lmuQiwrIcwbvw5YRX1mRj3YZ4tVYCEaT5x+go6+06Zon3PoAjMfS1uo/
2MxDuvVmdUkTzPvRWERKRATxay28efrE5uNQSaSNBfLKGvvPTlIoeYpRxLk7BN0x
i/KZIRpSlIf0REc1eg+leq2Hxv7Xk/xGwSi5gGxLa6SzwXV8RRqKnw2u6QARAQAB
zSFTaGVuZ3l1IFF1IDx3aWFnbjIzM0BvdXRsb29rLmNvbT7CwY4EEwEKADgWIQSX
5PUVXUNSaGVT2H/jUgzJGSnI5wUCYrQ5sgIbAwULCQgHAgYVCgkICwIEFgIDAQIe
AQIXgAAKCRDjUgzJGSnI57GwD/9O6kei9M3nbb1PsFlDE1J9H27mlnRWzVJ2S3yJ
8G1oJo8NSaRO7vcTsYPBYpEL1poDQC5MEGh6FXSiOnyyHrg8StmGLksQE9awuTnl
nQgvXDQMVtm87r1abBAavP5ru2R9x/Tk63+W/VT2hPekMfHaJwFi1KATSI1AhsF3
CVoj0yDulz1u0uZlircKdbeEDj+raMO0LA12YxWaWtL/b9XaoAqV9voraKhx+0Ds
ZS5bWoUvs+715BArPBr4hPqKavsBwOWfzWDTKln2qv8d+glWkmk6dgvZFcV/9JEJ
Q8B7rOUMX614dqgwi1t71TI0Fbaou3nhAnES1i1it/aomDUCLvRwjGU2oarmUISF
gvZoGYdB9DfVfY3FWKtfDJ9KLUk9k3BFfBZgeAYoLnFZwa3rMyruCojAGTApZtaa
LZH/jzQf7FpIGGhDYnvGKXS01nLCHuZSOEvURLnWdgYeOtwKW1IIcnWJtB12Ajz2
yVu3w4tIchRT3wekMh2c3A3ZDeEjszezhFyXgoRpNYDBzNl6vbqhnopixq5Wh/yA
j6Ey0YrIUbW9NOhIVCGkP4GyJg756SGzyPny0U4lA+EP7PS3O7tE0I3Q5qzDH1AE
H2proNlsvjZeG4OZ9XWerI5EoIxrwZcOP9GgprB4TrXUR0ScTy1wTKV1Hn+w3VAv
6QKtFM7BTQRitDmyARAA0QGaP4NYsHikM9yct02Z/LTMS23Fj4LK2mKTBoEwtC2q
H3HywXpZ8Ii2RG2tIApKrQFs8yGI4pKqXYq+bE1Kf1+U8IxnG8mqUgI8aiQQUKyZ
dG0wQqT1w14aawu7Wr4ZlLsudNRcMnUlmf0r5DucIvVi7z9sC2izaf/aLJrMotIp
Hz9zu+UJa8Gi3FbFewnpfrnlqF9KRGoQjq6FKcryGb1DbbC6K8OJyMBNMyhFp6qM
/pM4L0tPVCa2KnLQf5Q19eZ3JLMprIbqKLpkh2z0VhDU/jNheC5CbOQuOuwAlYwh
agPSYDV3cVAa4Ltw1MkTxVtyyanAxi+za6yKSKTSGGzdCCxiPsvR9if8a7tKhVyk
k4q2DDi0dSC6luYDXD2+hIofYGk6jvTLqVDd6ioFGBE0CgrAZEoT0mK6JXF3lHjn
zuyWyCfuu7fzg6oDTgx3jhMQJ2P45zwJ7WyIjw1vZ3JeAb+5+D+N+vPblNrF4zRQ
zRoxpXRdbGbzsBd5BDJ+wyUVG+K5JNJ34AZIfFoDIbtRm3xt2tFrl1TxsqkDbACE
WeI9H36VhkI3Cm/hbfp2w2zMK3vQGrhNuHybIS/8tJzdP3CizcOmgc61pDi/B6O2
IXpkQpgz+Cv/ZiecDm1terRLkAeX84u8VcI4wdCkN/Od8ZMJOZ2Ff+DBbUslCmkA
EQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1JoZVPYf+NSDMkZKcjnBQJitDmyAhsMAAoJ
EONSDMkZKcjnnIcP/1Px3fsgNqOEwVNH7hm0S2+x/N/t3kz50zpKhczHZ8GWbN3P
Pt4wkQkdbF+c7V4uXToN4a17bxGdUnA9qljxt8l3aEqd4jBqLn2OJriu21FSnrZO
pxb1EwWwvnVUwrLxCuV0CFQJdBlYp2ds64aV8PcBOhQ62y1OAvYpAX1cx5UMcHsN
VeqrWU0mDAOgvqB86JFduq+GmvbJwmh3dA8GnI2xquWaHIdkk06T55xjfFdabwEy
uRmtKtqxTP/u6BzowkV2A/GLxWf1inH5M81QgGRI2sao6To7sUt45FS+y2zhwh62
excOcSxcYqKzs/OiYEJjWMv9vYRwaqJGEVhbfGFOjeBOYr+ZCCeARh+z4ilo1C2w
upQT8VPsFiY9DRYgkAPKlbn9OqJvoD7VhvyelJagSNuRayrrmnEaZMsoRdS22fne
CVWM0xlGSgPCVD0n9+6unTnVbmF/BZsEg5QufQKqlFSomu1i23lRDPK/1aPc2Iox
cQPh2fomy8spA5ROzOjLpgqL8ksEtQ75cBoF1K5mcC2Xo1GyDmdQvbIZe+8qwvQ3
z9EDivvFtEByuZEeC5ixn4n/c9UKwlk+lQeQeN+Bk7l8G9phd4dWxnmWXQ/ONR/a
LzG+FguuGNZCPpu5dVQH44AXoFjoi9YVscUnWnv8sErY943hM8MUsMQ5D0P2zsFN
BGK0OekBEACw8Ug2Jo4DF9q3NFOZ7/Vwb6SlKpj3OdBjGTPwRZjV4A5CzbEqXrkl
TKFNE9CRbxyoNXN1UXXrBb7VHKgyu0rnGPqOb0rtUABz+wMvYuShKOPcWmg6n9Ex
9UGIsYBMJ01IQMU87qcZUmfxo5eYfniyBnOGB+pbVf1jhOhZWIXlVdmxYbMc+xeh
W+VHI98BiL14vXWFmpBWFc85BO4AbijDzPtkZhPvB9mj2he+z/XUND+nG3to7xAY
I0Kxacw55w8HL35Nuv+G7EtUWX5uhpO/dDB0BMcW05s6L6rebpEAAMFVBKIAJUKy
pvTYcAN+E7yfQAzvl8mNtcVMsFHTr54wTSHR0Xx32G72Ad7dkeqy8HhfkT1Q/5V/
xzUz1qgmtQtWgA6jnSCYISGOXMjnFhzMG3DVuE5cI/RaPlybHfBsqrtQoxeMMoX1
qD3Tt3TvwFojOEw4KE3qz1zTcozqLHScukEbNhlcLRUv7KoqSIcnN56YEnhjMu9/
ysIbFuDyQo9DaieBBWlwTiuvq5L+QKgHsGlVJoetoAcDojCkZxw6VT7S/2sGCETV
DMiWGTNzHDPGVvutNmx53FI9AtV09pEb2uTPdDDeZZhizbDt0lqGAianXP+/2p1N
Zh0fMpHJp+W4WXPQ+hRxW4bPo/AXMPEZXkaqqDrMcsTHrwrErCjJ5wARAQABwsOs
BBgBCgAgFiEEl+T1FV1DUmhlU9h/41IMyRkpyOcFAmK0OekCGwICQAkQ41IMyRkp
yOfBdCAEGQEKAB0WIQRP/KgY/enlmX5EpW5fvkoEB8mxGQUCYrQ56QAKCRBfvkoE
B8mxGVNQEACNCgyibR1+BY00hem9CCIZGHqyWfJn9AfiPYIY1OB80LUJXhJULtT8
DeUUOgMZtywhJvu4rIueOufVzeuC5P0lfO4htBmi2ATQu8bT2h0YxcNL3YKYFoqe
+FiVI7RxR1G2C+fDecyCXUrPtry++NiXdLVeFdDxumCuHZKffqiqFpL/8yDLnaoc
3aVHPT2Wv0iDU1JeSOC5LKPWFNznA5ZX6uxfiKzSc4E1qi/vr+1twXqwiwfIc9Ib
NniN59mzfXyKd64Geu1UT2wf1dZzVAcsXWDM4orCyx11eVh7ZKPmmVe9mpwcdh+s
4t76/WDFbbUe6ZSixOwINRUn16CvUNBxpCKI5RXmpCLj8Z+oUBpyR6c1sdw0uk7F
o4TcjBsvQXtpkewqyXXyy4NcCpveWPICbh8RmvZx4ScTufXH0FmLMkthuRgH+TqD
HHFvKNyhHoXWeIQT7oez28oY2a81CKQ+m/TkgNeA6vqmBZYJ1kKK6nc3vbFLc4Jk
2SRVCNpIvr+E38hxHz5e2n6dtgfgCCb2EEA83TjmX8/2dWZJA4ndML7AaCjw3Xqr
NbTrVgP99oH+D+7tFxJ+LlLAhIjKs1efKEFlOsXH7QqyO13BUYldhFL+2KjrNFoG
X9s7f57xIaqwdTd/okf4eBNYkg1+Pcj/AMgEAvRcagMATy2pAGmxMF2YD/9Z6y3I
oPB+lkSrP3AE1fhBRL/OH7UaLB4pyCpeGLhG5X8xdM9dwRPX+kadflKH2F0GPqUi
x5O1tJUMEdCb/WpQ9gUAb6Ct1Zntis8hd8pNQIGUT+kpwnpiLVEhbeg5DX459ho8
N+o6erYR34cUz4o0WFa1TVNFQGKRTWfzyUxxGUUcW2QC5mCwPCPZv69zvW5c0Ddi
RwUcYGGruslC7cHWXbO8zQ/R2zQcCjnyIniqoyQDTsQlK1oBM6iQMALhej6fsMe7
zWlA8/0FNj27Ub6biaWmK9aohWTkZtv7bD3IKaQRaq/lBg+2OmDGrSHNREt5T4EO
85QqMJLnjzQ2/FbA62E+piWzRaChJVUy0Ol6SVJHGascnqT4fWBX0lpZx9A7+XQh
CtCbX7ETzHPzugeXXyAhVuleaV+yzoSc9+aF2y38WrFczSzFX5APegWZ/8JxEbhJ
KqOwqSlC+IMwblPA3naZbCiKuTYxiU0Ys3CSdZeFFvSXuvhLJk185anQQjQS874J
8pkvTd2ueYxp46hde0rCZaAKlhNrp3G1NNUpt5QpjLan6NhmpQ42XfILC4v1Qg7A
T4vGG0QPhmMhbGgPn+44EYuh8/941mkyaYL0fXyu6l2HoKEZiLerr8vqgc08NvAl
QW/1QnKz4zA5XUvOrxQsLFF9ie2eG6DWJkdh1M7BTQRitDoIARAAtZRhbhuAfenu
NS2kPytShodMn4bfP1lSNi/P6vSWVym6s+bQPIbuRYfNvMZMKR1hPF93ERpSCAx9
bEsLtXJ3w9p2gFOUkn77sw/14v0jPJokQbTfg3dO0PKb+/89q1oVuOyGLhgXW1P/
ZGdIred56i2vsVfz7NmvPkSATr1bPTocYgpqdGf1+FQp8pDN60aXQ0RJ7rZpOTGx
/5BvgeraLXCbpy3ibaJF92HDU5QM1AeBs7LpXybFc+DZ+wktULeKemAF2EDnFauQ
CfGi66MHXGz2Dgy77ladSpz+OvpLTMpubzVeiGXwkNsa/Fs6lv1+arY2dUtHjvvU
0kLf/arNT+mOCMD8c2aOapgUQhOhM2U2OwRgbJ1y6OVKyN0UN76kDpKSpSsQelpV
/TfUk4LMTOB+rIfeAwG0NfKsYCzxV2dvX9E4wgAupsryeHYhidFuUwQncPqckOVg
xXCwOA6GGtMVEQFR0snuVn4ulLgAJy0rJXbYSj8vac4V67X6l2CK8xvgvZUgm2C/
MoV9XcjoxQzNIMySFDNBmM+rtTOW7Rxn1mlI7se5TOKAlnq+cTuLAu+L/LKNRSoe
dKYsUUTjHGmewyUNlcHHHQcjMS3jwzZ2a9+YP5KpKJCsT/eqBZoiPAL6V9iCBiM+
02BKe2R86wK8OqehvxvR2mpFwVPk/H8AEQEAAcLBdgQYAQoAIBYhBJfk9RVdQ1Jo
ZVPYf+NSDMkZKcjnBQJitDoIAhsgAAoJEONSDMkZKcjn/ecQAJ1Da87OZQnYugWr
vPQOfsdV9RfyyXONrssGXe8LD/Y6rmzZVu+Bm49F9TF0Qxc+VOrJpv9VVsfOqFJi
0wykOwyESdVngNrAW9ZWzfIvkEDSpTlaxvzbNEY7pBpvb1xFoSMrou1ro3299XKf
tlA29RYHiwH1HIC1JPJBWsS4tlahZ9AtGo5p5wVoEKxN6D/SrjLCcFiQJlH1yISc
sZVFm3qgTuo2g0uzJM0o1Y2B7T8mK/rsm3hUHJlbCrPl/rkYEAlhSUKpawKhldRh
OeqUUCcjnfdmFgTH/HtTMIlEQA+Ck/T8M5+Zp/nhCpPCx0pTuDdUTRo3tWHL+Nri
wK+AuZNR+0pevuTYOyD6CV0Hng/3lU86i3gN16GVxNWQjUdQ1ps9InaQhLxsgevQ
msgzOqo6GUiHQIdxvAtcG7pXv7HRhxsZA+68h8lixiMeE1W30PH1nxn5gN/Ekldj
c5F9xBu1/vTSX9dGzer1zZZFn4J8lbD6R+keOaroF8Q9S1cYnQbh3vASshmzNgi+
ISmLtR1a4zjxY2AlKNv+jkdpItjot5dewxVeU5x5i1sXWJ3Dt4xNyFSs2PZs1IuP
Solmy00hVZdFiGmr8QuMmOo6YagSdVvrryw812k5vAskD5AMC9EGru1Y8e9FddsL
lMSoVV3z1s8dA1DK95ykSdIFtVZT
=3Dr4B8
-----END PGP PUBLIC KEY BLOCK-----

--------------RzKVeGhcz4rDdSyGcZTUFF07--

--------------hlec9N2arRzUhIst0dbu2YIY--

--------------m9mEhZVNtdS2mxS23Ml6w5cF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmrN0B8FAwAAAAAACgkQX75KBAfJsRkX
JA/+O8KdCRQiS3XEv5W/upnaayULStHU93l+3/4aFH2dvFKANjkhU/IP9Ayycpj7kRKAdZN5MuS6
+NV750FAiiF76j8C8EsoEI65E360lGm7Ak+gQqccXtQNf5tLDNCYuLkGQornwZAfOq75rGDGEHTz
kwvOzPEVoPTxziUqXI+t42HVPf9t9sZSYvHxohrzcOmfZxGBgm+/vF2/Y7EMkB9EdDdf3SISVH8n
GBkiVtHrtdqNuFUAQqW1P6VxmDedW/v1srd9scrW0/5QGk2dFN0SF7ownujrCajSFi2D769oUqqi
K0Q0znQVtpBqXw7CIB2PfG9//UyDtFVUEStQHAG3nH332qblNyt5Kn+iMHo5sGZ1Y4JTxOuALjXe
KeXKKqvrEPddlEq7QUmIYXPAoQnkCb+q6ZOAVja08pHF0jYeaeNu/lC6GOm4X3Qxdw9Y6z4Nei2Y
OeSQ/iAghQrLAvB//Q2jJ+rK5EzLpIC3UkVJvsN9rR9Qg6EYBMPKEYQmdwabvldYx10AQEuHC9IO
R9aJKdB4iMb9dEaHtZTc++36zGx4FP7agaUryafvcPAPaETI2+U0tUQyLZdRp4/Ba1/3lBR9IYtp
E4Yew20/iSP0GozZp/3ytrHdkPpxZzHVlJ7JRlFSyxk6lCicsamn31hsET23VGQT0eIm0mj72Y5s
lPs=
=Pa0K
-----END PGP SIGNATURE-----

--------------m9mEhZVNtdS2mxS23Ml6w5cF--
