Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792696947;
	b=18170KfDjoXDY/zqEMAxW3dYDb9RuWDRI2SqVnvVQIytwtdMWXSctBbU5hezVFMHmxiG
	 5wd9UyF00/Ax3lYkHNZTt5stqyFPa2MhM7l/f8iCJTsQ+1sP7PYoZhIXXCeUCA4TLkGzt
	 tc5/Fq88IHf3WhBL0TeFJrKwL3/uzIHxStGB2o7eHmnarweeiPK45MbGamOy68emlwtol
	 KEAdZRNVDdrjVfwf3kOJh/nd4xYZuO5neLggs9WYPX4asiaDwkV1sSi6F2XK5i+b0+DUc
	 +UBocqtx+/kCJrZ0VbJsoDjTzYCtTzhMTxge35Sd4MxtawBNVqFKKT9GTqUTg9AbPCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792696947;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
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
	bh=jQN2G5XzYjbf7CEtb/68+7YFMGVi8NJFSDqMwv8dp9M=;
	b=QtjEVIGik59aJGBpczyQ+8+1A1QcERx3z/m+wW/ZMysyVViL+WDm4Ogi8JxS5wMSjK/E
	 T9IMz8bx8hpuLsHuWSA2XL0nDvWcveB1G/UIUn/STi9fOf1DvPhqMDv1/1A/Uxh43MhvU
	 uFgbgpcnO76QlBFo+cuUY4XrOs1q5tKYmHwtDVuj+46QPH+Sbk0eYQMBJVoUhlcDk1Gq1
	 uBiZuEIIwnmgFx/Bx6C2wMywKsYYE89PuBRL2SILVlYtpAcps92qEJ6VaZEVhcLZJUJU1
	 Opx0v5xXzNtUPksk2Vja3ZycDH10b851xQHhj8pwcID60BJlSLZI9ps2pRtU5hhE2pQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SmsBE5tj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.4
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013004.outbound.protection.outlook.com [52.101.72.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D74F606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D74F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=SmsBE5tj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JHdtecEMUgqIayvaSfEf78KPjVLM6jeEXzwu3BaJMnRUmgglxfopyEeFYkc2QLFxAbbqPEAtdkaC5vrC7KGgrV6NcyCMz4gK5YJsIXckLqvLT1n7+x56UklS31oX/idKdHjnpSojfRERoDdFGOkNz7hAYos975JhOdlKQ1ikbdAd+2quSdPOLds1YCGLgM4BpB3d6QiPW+FJDlZ9jyUXMD9WJ3ktcS+S+/XCD91UgGQcOvzY/uaAbQSibn35vVi1yF4BiJdThJrsEP9C7jOQ7t5xTJtzJQ3csYI1EcxFR1kNkeHc2yAEVASySb3b6oAV4Ww5j3QIlUTAEYsh/JY1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQN2G5XzYjbf7CEtb/68+7YFMGVi8NJFSDqMwv8dp9M=;
 b=TTqEJi1aUaL99fhs17CTseKxHW+0HWkGm2a7qArtazAbPr1BGaLF9Wc7XFgMQcu19j2ECsfVNGcxoCZPFI1J3S1gmRQvf2f7UHbQnO5uFlEDHz6F9vCMdZqiNBijZU/h27Rk3izUIjeN9FADnv+RILoZYA9MzvXkFOhps1vDklAS7+N94ycIWv+6xXj43h2uRT7suGwrSTZLywUq2eVXknG4S1bivPfdvgDE9jdNzHJxUvVs6enDfBmnc5ledtjgxMgIXK9NV1bwX8YwGfzw5QjiuzZLa5xQIF1RDeWhLQGYZJxT0hlAK1mOWkjBVcI9HPAxiKsuQPipsfvigc3qbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQN2G5XzYjbf7CEtb/68+7YFMGVi8NJFSDqMwv8dp9M=;
 b=SmsBE5tjui+74v3wwuvducFopvxCmWtCYuKaiVJkUDqOYExkvukOEQKCRnlmNUFAxBnfjBdVlQ7OCWwKEOpKPz2h+/9vHxw1vQG4Ay6u2Bs139k5XpurKzRXyCK/elJ4oEzXJYyxfWjI4DBR08g3m3ChYDsyVuLS7137w1q1hk71DADoMwngk7GpQSjkNB0/NrRI2KLPpPbfKFbNG6zv5JfKDFDEQ4ZtakcyJVnyxqnwAvRNq+9/XV5mBGOP7KY3RfWmiS8TCH9/h1Cw9y9jl+Eh3fCQqX1L7BcygRsee5r7LZ9Q+qa2+XHCeD7ylKwYcMk5wxo138rjWKeuR4U+WQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 19:22:24 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 19:22:24 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jaidev Shastri <jaidevshastri@vt.edu>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: imx: sm: publish the protocol handle after the ops pointer
Date: Thu, 22 Oct 2026 15:22:15 -0400
Message-ID: <179269689933.1238482.5892325731136888957.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921-mb-imx-sm-v1-1-39f17526d253@vt.edu>
References: <20260921-mb-imx-sm-v1-1-39f17526d253@vt.edu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH0PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:510:5::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM7PR04MB7157:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bc46579-5f66-4e68-7070-08df3071cd33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|22082099003|18002099003|3023799007|11063799006|261009223027099003|10067099003|261022105027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	J7Q0PZw7Wem290cISPRVqXflrrgxdJoSM3ZzGmmk2Uh6w4kCj1tIy9pU1PTkJQAUt5RNeU+Mgt2ptwVSzEPm8B8nikSho5WHlSWRAQC2WubbvbbHTMlJZZxO2rIzJF+H1pFBh0z2Er/npcrYKOm1M+zvuxpFIhCO+zu6N3hEYtUV//MLezVkgc8gyC9Dd/NEatOM0zbAd34sPioFrGpcMuqxM4lz/0JpTp7qtVO7mNsy1R1ph54xyMGTzC6j8TVhvEKEfoPb9/6RFw40WVnqxKyKJ1bXAtsXurpaDmslpeWuh5u4LOxa4Fo9aKBDlEDjJ5HDWaOhaqIZIAEtIfhi6nT78Y4m4O5JPWDLvZBC0JqCdZA+rX12qmhFKKm/gWfxzkrtm3T4tmLfjAO2JNICzXhYKCvZGjoc+PBcZRGioKDKXGL/5S+TzFijH7UY0VGkRjZ8z5veZpsm59iTGAAGVVgw4A4atCNhUwjFFjTvoXzMT+sD9n4dn/4wvQQf1FqnQeug7+YBSLqGKrIho9wc2N1yCMpwYDI3BcAL/YCSJQPAYex4hnSugl1P5Plb5pWkHJt1UVi5cobaRsBGg3Qf2K/eDYcY8SXnDh4kfs1u3STQLXi0WGsGDuhgF8vGSI2eDvfITEyPnG8HKbtuU9H04h1TPdUC8SP4JBLSJQNYxmU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(22082099003)(18002099003)(3023799007)(11063799006)(261009223027099003)(10067099003)(261022105027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YTd6aVF6TXU4Q21tOHg4QlJQYU5GMnZYanNSU2tkanh5TVVlR2pQeThQWEJz?=
 =?utf-8?B?NHFPTTNhb2U3aDFSUU9JcW94ZzgvdkxTQklLNWM4RitmSmlZWWl6Q0NQeURo?=
 =?utf-8?B?UDErdnhJYXRkODlVTUJBUXhRc1BZYWh3cFpvbGdRc2NpdUM0V1EzTTBGUzdq?=
 =?utf-8?B?dEp4S2trMFJVTlRJVFpQUTIwRlpnVjZEN1doZkFsMUJhZUJZRy9zUlFyTmtj?=
 =?utf-8?B?eDN0aTRwMVIzUXRhdUFBNkFEQmZWYVZDZzlnQnVpZ1Fpa0pMOW0zVTVBRFFP?=
 =?utf-8?B?VzBSYVBxdkFMSGdOazRQNFRENXVPYllXQU5LN0o3c2hka0tDTGdSSUM2SS9s?=
 =?utf-8?B?cUxFYnJrSFlIMzFrN1B2RVZLdlNLTGs5SkpVMEtsVU5aeEt4Z1FFaWZBb1pl?=
 =?utf-8?B?SU5VT2VFUU1xaWNwL3VXTlpGcGJ1VmFuSit1MW5IQkZpNFVmN0NhUGE5eEhH?=
 =?utf-8?B?eXlvWVp1SHE1Sjc3dWpvOTk3WWo4WXRGQlhwVDVXcEk4b0dicmsyRzBGOFBh?=
 =?utf-8?B?c2FiSlN4a09JWmgwZEJXcXY5TlJSaHN1NmkvSzZ0dUlqdXh1dVIrVVQxVlBt?=
 =?utf-8?B?QStYVEovdWVuL1hDTmxpekRERHlmUVJSWkZXOG1LdkZBSitodlBGaDRxbVh6?=
 =?utf-8?B?YjF3TGJUQ2psc1hoTThldzRxaGRIRS9sNG1vQ0xMQXo4cnlqUEk1Q0FZVHJl?=
 =?utf-8?B?bDdPMDRxQXdGWVVXZmhKd09rbFg1eHJ0eDVmc0RjdFliSlhXa2kzb25kSG9k?=
 =?utf-8?B?bTNyMDBsWkpCb3hNVmNxUkNIMy9INnFiakxwcFk3bVlEYytwUElyRUFkY1dO?=
 =?utf-8?B?ckRwclduUnliQ3lwMTMwbDF3eUY2ZTRJcTBZRlo4RmtCMys5enB1RU9ublFj?=
 =?utf-8?B?V0tRdlF3SHhaWEJaNld5akd5NTVBZG90QWZncmxTUDNFNVkveUsxVTBUMklV?=
 =?utf-8?B?dkRqUjNVTGZzSnA0ZUYvZUh6UHIwekpTWllsYkZiVkE2OTZ1YWFnOHduMVNH?=
 =?utf-8?B?eEMxSGF3N09aejNpa2w1dVlQUzFPM3hNb3JRSW9sbXU3clZSOW14aCtYK0VW?=
 =?utf-8?B?Y2pQZ2gwNnVoczNxRGM1R0hIUlVJVTkwSEY4STF5N0pLQ3pWNXRYWENCeW9z?=
 =?utf-8?B?SVBJT1JxR2l6cTBTZnJHemVNR1k5N1oxVlp1bG0vdTRSazRuSTlhYUloMUd4?=
 =?utf-8?B?NjE4ZitjT2dwV3BpSVZwWS9uMUNZSGc0OUt4cEhXbjMwNnhqUHhMSnpMcWZB?=
 =?utf-8?B?ZlM0S2FvQnZtS3pqbXVYV253TCtFbm9vWkIyYmV2UlJTaTI5QXZzWS9lRHJw?=
 =?utf-8?B?Y0VEUEtSYTFQcVhVQXlNZWdwQ3VFUlRwVWRJY0NST3JKbTVDNHhNMzJnZ0oy?=
 =?utf-8?B?dzk4bnVqVEpVZWVYeVNEMnliQ2tXVUpxL0ZtNG5VMEFSN1BTSzBkdmhRK3lS?=
 =?utf-8?B?dEFZdHBCWHhzcUxTTGV4VzlBb0N3UmVKK3EyYXVVSEtQWk5GaGllOWp6OWdw?=
 =?utf-8?B?M2JrT0RjSjdmR3NIWnNyN0FhMWc0VTJ6VkowUkgvZ08zWHR0ZDFxTExKYVg1?=
 =?utf-8?B?NTIrRDRPUFAzbDdHb0EyMUxHdzQxL2grK0NOT09lR0ZXQ1VSRzVHTmdBcDRz?=
 =?utf-8?B?YXF3YXVnMjhQLzM1S3lxTVJiWGRZY1ozcm93V2h4VHFGUkxXQW9DcVROY3hu?=
 =?utf-8?B?YUtYRTFiUzlpSWUyek5kVVhhV1F2d3MyQXBsMXZXVktQT2pHQmdqTlJEZ3h5?=
 =?utf-8?B?MWFaMGVoWlZsZGpydnNkV2xRREM4dmRkT0RJUmRCR1BnQkVvcTFuTTNmWklF?=
 =?utf-8?B?ZnIyM2x2OFROSnpHQVZnK0k0UnZNTW12TFRaQjlPbTNIaE9nOThCQTNqMzVi?=
 =?utf-8?B?WlRMTzNqTDByWjVVNjRHM0t4RDRGT2VHT29zcFNCL2UvcVhnQnhHOWFCWStF?=
 =?utf-8?B?WUkxTU1sUi9ReHVHVkh6ZWFMZDl2T1pBbEk0WTVUY3RzVWpiOXlOQ2hBdXZK?=
 =?utf-8?B?SEMzbzNVNTVzNWtMN3lWOEJ0bStteEZnNy9jN3dCdFJiY3h1K0dHaHU2VGhi?=
 =?utf-8?B?NTJaZXNkK0lqK2tJNzNac0N4emcraEdMbm9xMVhvSitnN3h4R1ZaUjNud3dZ?=
 =?utf-8?B?b05pUjhZaHNXOGJtSUJMd2lpTEFrMUZDOU5uYzZQNHVHelpldkR1ZlVhM3dH?=
 =?utf-8?B?WldsL2pxb1dqaTZOaWhTYzZnMnc4Q002L1pSbFFodWhGN3F5b3VwRW1zL0FP?=
 =?utf-8?B?bDRSbWpRcUg5TnV6YklpdHV5Wk1IeklUZ1NxWHFaKytORWJnK0ppT1BHRUdx?=
 =?utf-8?B?ODgyUG5SWlZRR0FNbHRLZC9GblBVenFJM05BdkVDRnlRZXFSVUsrZ0hvN1NO?=
 =?utf-8?Q?pwtkrfX2GGnjj+tudzcLURiDyjmvql4lR4a/H?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc46579-5f66-4e68-7070-08df3071cd33
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 19:22:24.2880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ogzeH9hBjmvSjF8Euqg4ZYB/aBRv4MNBKyTfxl1Sy1lFjOD1Lrh954orwNauF1IDKpRRP25W4/EzmnG6JbmpEKYTLKesiKvGJuAjn/cKcsItoDUqC+cTIWh0uDg0eYpi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7157

From: Frank Li <Frank.Li@nxp.com>


On Mon, 21 Sep 2026 20:28:17 -0400, Jaidev Shastri wrote:
> sm-cpu, sm-lmm and sm-misc export helpers such as scmi_imx_cpu_start()
> and scmi_imx_lmm_info() to imx_rproc, fsl_sai and the i.MX SOF driver.
> Each helper gates on the file-scope protocol handle:
>
> 	if (!ph)
> 		return -EPROBE_DEFER;
> 	return imx_cpu_ops->cpu_start(ph, ...);
>
> [...]

Applied to imx/drivers-intend (will apear in linux-next after v7.4-rc1),
thanks!

[1/1] firmware: imx: sm: publish the protocol handle after the ops pointer
      commit: cbbf9f9c96e875c6ffdc505b2175f3a95e33b4ab

Best regards,
--
Frank Li <Frank.Li@nxp.com>
