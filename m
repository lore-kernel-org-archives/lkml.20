Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012027.outbound.protection.outlook.com [52.101.66.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5133E123F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033555; cv=fail; b=HkBa03POnONNmphlgHfEZWP5u7AAtE/q9XU9IEURboGAnu+Y+W2KaaJmY8DEDYgQ5JAlyd7f7+Re6bYLaRVQGEFywqYqaisdLHDQ0Zb+1xy3F+IYNNWDk+ifphZWpdaM67nei0a4ywzZL3e5zbqjGnM6NA1McURrM4FmQdzhUEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033555; c=relaxed/simple;
	bh=64Jnx1tcRn3jvRjWZS2wJOHLGUIedqnp8kJataULDF4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ata0fn3Oztv3LZpONMdw1MklaV1h2FNLKWClbgvMMVNKZfif523jWhFgE6ObdRLihOfsxnWwUWCM5AYEnRulMIk/Nhz5Kfz+DmKIyYnANI8KINp7w3xjMALtKXXG9Q3AfCa9Ha8VdKwTXTz8mVVV1HM5fyQUmcAw2Mm17989NpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cw/pg19w; arc=fail smtp.client-ip=52.101.66.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cw/pg19w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZBBpDLgB2nnHexedHwkNRKx49BhMkthBY4x1dgVG3rGNlAn/dSNlWmHb0VBUYFOjYpQtsOuo1R1QbvazaV1bWUN6N4LcW80QiSFlLEVT4wO5xmLLeKLi8q30SouK3+LhDyPMKUGO44aRd4cvYykPo9QZ12fQ9jwjJ6+2coiC0zs2Fv7azjlS2jBaaLc9t86bN4l3PfWidk7uk7RqhaW03o0+sMy2vacFLWlGdHDpFAp2eKBpuP9Z6k+51LspduAdT2RBot+WGtkI37jxACSPuNazPcizbYp0uxoo81UL+NUrz/ICIcTRg9lhqO6GJEV6AGL/OaGFDAo2+2DhZaqbrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cskSQFU2iBL6alZqFV+eIIXKDIhr2Usw+63w3Bq7by4=;
 b=SChaDbMq6TWRcUv47ZRtjc0g9NAgZZdjNhTW4KCGWstk/GhPEGIMt65TLzrfx3viMVJdaoJtNYcHcq31G0E2CKKY3k/FaG3LeL2vTCCoIVOP1ps/t6xF85vMA8QyVzN4MexTKCgPLbW3bBENE1wnMIxxh736lYjpb2O6TvuIu5emucGyM+0pH0O5BcvzkuBNAD4l/tG3TYVurDLXLetccc6zrUp3bdxiiq7PdkItvUXUvBmo1vNUigx3YIP9Ki9EiBN32Rv6Y69VTu2N4SR9lkYSdZ57q18I2Ma91Nyv7u1Gh7xQh8nzkGmn7EnjHhK+dPz3fx2RU8CWHmKItglfdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cskSQFU2iBL6alZqFV+eIIXKDIhr2Usw+63w3Bq7by4=;
 b=Cw/pg19wkrbBXgJrJwfzmLrAIloIt//BSgS3jxB3+7gR+gXv0dXcyPI6bNfGvRA5fk7LDVdS1gZnkL8YF0mL2jwBpgTonFi5VuFxpLcN8i9lPArhQqU2PBiIxXVsQgZcQSdolYzM3gWlg5vvieFwx1cTZuroANrW+Yv0goodvPJhFR5zmfjxEoGGSjKT8VnszitBLacoKcdu9Vtpu8zcmiK1bGVjnuzPMIHMV1vNghQZD95dF/9SmEJTrcoDtZ8Bm7GYD/ei0Ubx2b/KZx4Y/72mMDLBgz6NreWPWxrmYNmrL0vlqlyHOdYvpcDhmyuOPC2MXHUeTdSOp//f/nGf4g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22) by MRWPR04MB11519.eurprd04.prod.outlook.com
 (2603:10a6:501:76::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Thu, 15 Oct
 2026 03:05:48 +0000
Received: from PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2]) by PA6PR04MB11909.eurprd04.prod.outlook.com
 ([fe80::a4b:fa4e:7fe7:e6a2%7]) with mapi id 15.21.0522.012; Thu, 15 Oct 2026
 03:05:48 +0000
Date: Thu, 15 Oct 2026 11:10:17 +0800
From: Bough Chen <haibo.chen@oss.nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>,
	Takahiro Kuwano <takahiro.kuwano@infineon.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>,
	Bough Chen <haibo.chen@nxp.com>,
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>
Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
 entering Octal DTR
Message-ID: <20261015031017.pdqnv2bp5627bhed@shlinux89>
References: <20260929-spi-nor-fix-v2-1-75440cfe4e76@nxp.com>
 <87zex05uvn.fsf@bootlin.com>
 <AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8820E136E7257FC5A02F1A3E908C2@AS8PR04MB8820.eurprd04.prod.outlook.com>
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To PA6PR04MB11909.eurprd04.prod.outlook.com
 (2603:10a6:102:51c::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11909:EE_|MRWPR04MB11519:EE_
X-MS-Office365-Filtering-Correlation-Id: b92c975d-37c7-4102-fe5e-08df2a69361c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|6133799003|10067099003|22082099003|18002099003|3023799007|5023799004|261009223027099003|11063799006|4143699003|261009221227099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JgROuxPS5i0p2y6c4ZLnSVyE9jQb1kvzO5D/nSezCHys4KOCy3w4VBGbJfj34RBSsuk54/JFOGgkT+PrpDi1G4rrg9Wvo/GUSmerCYIAPPFQalVqH/Fd/wgj6IJwRMUXpJMwvAPcpBvbV36Z74ymGKRys+v5OnEyM1lOakPiwvwJFX1xOXuH6NxfCQIspndZL8pnMacAgpcWyczewYUte7/qIFlkGvcIxo2mxcCCQ9JY40wu+YYwR/4HyssDMStk7NPxjKoRRaNebaeK9i0CuWqJYpbPXmhNZuwlTlCkhLI+Mjo8vZ1q898p2JejqxaBW1EHqxXmXYudjnq/qpHlh6hdvDzCWvvv5IOSbimqJTTgHMkJ3RBoUDRR25+QwAZ6S73GKPeBpw8kZkl5fasa6cQeD6l+2VcnznA8t9hJIirfgHJJgChB+LS6gL//CmRVC/51O5u8bN0o8PBBK5VkrxkDuFIEFV334tjQcwFFtB4MgAcHDnU0FEKhNBvIiaJnoQBnejXMWjV11JtJiuFvVv9sSmjJlLAaMCfynOj9wQc4dZMF+CSefVoBszcS6A1N9QmQ/1BgIaalT+VHu9BeepGNZhzV3j2uxuEcM+kCCU/9VwvKWYvsXiqgo4JOWw9Oj8LI5rLVgWmJ1Np8C7zDAqC3mLAEelhUdoRTt3svf9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11909.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(6133799003)(10067099003)(22082099003)(18002099003)(3023799007)(5023799004)(261009223027099003)(11063799006)(4143699003)(261009221227099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RVpTQjl4bDNlZnpLdVAwN1R1WWIvQlJVMkhEdnFxRFRGdElQRGk3T1hBTkVv?=
 =?utf-8?B?UXRDYXJYZFJvOUZJbEkxVGxCS0cwYVhXbFFFR2pKNm5NK3NCNXp0MzQvMk02?=
 =?utf-8?B?cHY5MVhJZ25hZXdhVk4rVVFGcVRxOXVlaXNsSkpweCtQYzhiV25kOVlkdEtH?=
 =?utf-8?B?QVJkc0dvdStnRDVYZXBPbUoxbURVcndiYUszVUFkZ1JTR0Z3ZVljZWRWR2hO?=
 =?utf-8?B?NktHc29PcXdRdzBrczVPNGY4VTUvSDlrcUt1QUgzWTNvVkR4bGJUVFFDUFhm?=
 =?utf-8?B?WnRCaTcweDdmdHB1MWhHM2xYVm85NTVvZldPR2dIbzBvb3A5SW1vWVQreXR4?=
 =?utf-8?B?aktNdFA0U3d6UG9tZ2ZTamhKWmxRT0hHS0ZMeHJXMkp5RldDOHJrbGc5V3JG?=
 =?utf-8?B?L0c2dzN6Vmw1aFZPRTkyem0xdnBLVUpOVEM3czEvc0dQamJJTnBpQWs0RzhZ?=
 =?utf-8?B?VGxzd052ay9QeFdpeEcxNjhQK0lLczc1NnI1MHR6VHJjVVZDRnBNOXd6bENK?=
 =?utf-8?B?UFNNMWtuazBYNVVkOTJoMFFWbk1HQm03MFEwRWtRdlV5SkV2b2Vsem85Z2Mr?=
 =?utf-8?B?VURiUHR4eURXSDNaempuZWo3V3g0dG10WlNORWhlMVZWMjJQT2RoN2xiK1dI?=
 =?utf-8?B?NEwrY0pqL1RKNUszUXhybGVwK0tndXp3L1FzSitsb1RDN0E4WDNSQW56THVC?=
 =?utf-8?B?Ykh1cE11cksvR0dZY2cwMmdtdUZhSkZEcVk1Wk04a1pUYnZwdGdQM3VYc2k5?=
 =?utf-8?B?RVMwV3g4ZHV3WVVldzJ3Mi9mTFdXbHVTamVtUnVWNmRqVUR2MDg2bnlPSU9K?=
 =?utf-8?B?cjBrZXdib1ZwZmFQRUhLMitCbnoxdUE0R3JIZUxLeXFXUTBoaU9BQ0RtdVJ1?=
 =?utf-8?B?Q05PWWhvdytQNkkrald2elpSTEVNM1VRME1lSDVkbnZWVWdRQ1hkaDJFUHBX?=
 =?utf-8?B?VU9kbzV5bFkxVUVHcTRkM21ibnF5L2xqdUoyK1kzekZ0Zm5EWkYxOEk4VHky?=
 =?utf-8?B?UENjRWNlQmg2b1RJSG9wWTJKZ3pZdzlscjBKazMxVjc4eXllMktwZnN6SEdD?=
 =?utf-8?B?bG1La0d4NW5Gb3V3a25iT1R4S1k3RHBObitUNFRtYXJtQ2p5TVNJallkTk1W?=
 =?utf-8?B?cHVwTjBMQVN2S2pGUW04OGMyUnRFVzA1Y1pWcFdqOTN2S2V4NjB1ZHNURUN1?=
 =?utf-8?B?TFgzUHV5b1JhQjMvdXczNXhONXg3SVdCSk1UUVJvOElncGh6elAxdVFBRmxO?=
 =?utf-8?B?NDJFRjYwWmxRTUhyOGYxbzVBZUFnUWVKdTM5TGFXb3g0K0RLanFiWWl5aWt1?=
 =?utf-8?B?RmZDR2VQV3VqYjd4enZJNHhUeHFlWXFIUXV1Vkk2ZlZFQ3g2NGRZUkFSMCtv?=
 =?utf-8?B?OXpNUTBHN210dmxWdmFPV2Z2V1B5NXRBcDNLaVpKQUhTQkMzSzJvUFFBTFp4?=
 =?utf-8?B?WUxQTzhNSC9BZGhVbjN5dUk0K0VPN1c0aGRWQlFSZndZS0pCMHFiVXJkN3NC?=
 =?utf-8?B?Q1JxS1ZUNTVvZFQycDU2SlFDUlVVVkdTVUVnRjVlVkdYVDljb1FiTlY4VzNk?=
 =?utf-8?B?RWxyY0h2Mzk3VSsvdFdHNmJxMjFaaWdvRllVMGRianVDbWdvS2dObkMvUWZO?=
 =?utf-8?B?ZWd6S3VndGhoSjdPajFGcW5URmZJcDlHbS9lbU90WkFSU2Urcnl2Mm5rWmtW?=
 =?utf-8?B?SU5XWjAyWVhSR09kbWpEL1FPdlcvRExMZTk5dGJCcWdwZUN3RDFWak4yM1Qz?=
 =?utf-8?B?eFBxVXQ1MVdvS09zb20wbGh5anBTcDVwQ2MvVm1iU3dvVVZSelNEZ2NoUDZN?=
 =?utf-8?B?dGtuL291ODV0ck8reStnajc1azZYZnEyNzgwcjZFWWpwMEowWFVsSHMzbENz?=
 =?utf-8?B?cE90YXE3RWxtYnc2NUp5M0F2cWlXWGVMVzNCam9aWUc4UUFMRHowVXZTZ2t5?=
 =?utf-8?B?YUlnVWd5ZU5zSXJCVmNCUGIwd05ZYnRoV0ZFZDVKRGpkYytncEc3cGpBYlFX?=
 =?utf-8?B?K1p3OVpDQkR5RjJCbURwelMwcGdWQVI1WWZ2VU5lZDg2d1pKSWJuL1E0U0ZY?=
 =?utf-8?B?N0NabmVSQ01TN3k2bVgvSXB6ZmZxYmNEbGJDcmhZNkFsL0RvMEZZdldDZUVH?=
 =?utf-8?B?bG8xcUNFRjJZYjkzdFBKSndQTU9zbnQ4dW5ONFdXdmFUQSt5ZVMzcUJCRVVB?=
 =?utf-8?B?SDNlSmZSYTFjRkp3VnovdTlQUEt2SSs2Ti9qWWJRaVprQ3BIamxxRWFkTldI?=
 =?utf-8?B?bTRDMTB2MCtDc2pJRTRKZ2FYYXJrQWRYeHlWMVczWXptUndUS3p3NnZHRmMr?=
 =?utf-8?B?NHdPUllSZm1nWjVlRloyTjJDMEdNL3BhbklsVWgrVlFZeS83bStNbTE5ak4r?=
 =?utf-8?Q?Lezrm8yneRJ0h+EeZ9UGzV6B/Ey0tPcSt0QmV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b92c975d-37c7-4102-fe5e-08df2a69361c
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11909.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 03:05:48.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9PYxa3X44MiPotF5y5608/yEGo9t6DndtpfrS7roD9dAtuNJVGbR/0vH/wuTuhpeO9EUg2LNEyVR+jbPE0RXTTKQ/TTh+uyY5c6XkbrJhdrR8wa5uAeHzAS26WLxaOC4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11519

On Tue, Sep 29, 2026 at 09:10:37AM +0000, Bough Chen (OSS) wrote:
> > -----Original Message-----
> > From: Miquel Raynal <miquel.raynal@bootlin.com>
> > Sent: Tuesday, September 29, 2026 4:23 PM
> > To: Bough Chen (OSS) <haibo.chen@oss.nxp.com>
> > Cc: Pratyush Yadav <pratyush@kernel.org>; Michael Walle
> > <mwalle@kernel.org>; Takahiro Kuwano <takahiro.kuwano@infineon.com>;
> > Richard Weinberger <richard@nod.at>; Vignesh Raghavendra
> > <vigneshr@ti.com>; linux-mtd@lists.infradead.org; linux-
> > kernel@vger.kernel.org; michael@walle.cc; Bough Chen
> > <haibo.chen@nxp.com>
> > Subject: Re: [PATCH v2] mtd: spi-nor: clear the default RDCR opcode when
> > entering Octal DTR
> > 
> > On 29/09/2026 at 14:53:07 +08, haibo.chen@oss.nxp.com wrote:
> > 
> > > From: Haibo Chen <haibo.chen@nxp.com>
> > >
> > > The core defaults opcodes.read_sr2 to the legacy RDCR opcode (0x35).
> > > In 8D-8D-8D mode the opcode is extended to two bytes per cmd_ext_type,
> > > but the resulting command is not a valid SR2 read for these flashes,
> > > which access their status/config registers through a vendor-specific
> > > indirect register space. Since spi_nor_cache_sr_lock_bits() now reads
> > > SR2 during init, i.e. after the switch to Octal DTR, the extended RDCR
> > > gets no data back and the read times out (on i.MX FlexSPI: -ETIMEDOUT
> > > and a controller
> > > WARN() during probe with Micron MT35xU and Macronix octal parts).
> > >
> > > Clear read_sr2 when the switch to Octal DTR actually succeeds, so the
> > > SR2 read is skipped (a cleared opcode already means "unsupported").
> > > Doing it in spi_nor_set_octal_dtr() keys off the real runtime
> > > protocol: a flash that advertises Octal DTR but runs in (x)STR because
> > > the host lacks support keeps its usable RDCR.
> > >
> > > Assisted-by: LLM
> > > Fixes: b7b63475903c ("mtd: spi-nor: Create a local SR cache")
> > > Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status
> > > support")
> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > ---
> > > Changes in v2:
> > > - Rework the fix following review: instead of guarding the read at runtime
> > >   in spi_nor_read_sr2(), clear the default RDCR opcode.read_sr2 once, at the
> > >   point the switch to Octal DTR succeeds (spi_nor_set_octal_dtr()).
> > 
> > I don't get that choice. Why switching when Octal DTR succeeds only? SR2 is
> > either supported or not supported, I don't think it is anyway different when
> > entering octal DTR mode, is it? So I would expect SR2 to be cleared earlier than
> > that, once we know the chip is octal DTR capable. And this must be early
> > enough so that manufacturer drivers can still set their own value.
> > 
> > I am wondering whether we should simply drop sr2 opcode in the QER SFDP
> > parsing entirely for octal DTR devices (Michael?).
> 
> The reason I clear it at the point Octal DTR actually succeeds rather than
>  "once the chip is octal-DTR-capable" is that capability != running mode: 
> a chip can advertise Octal DTR while still running in (x)STR because the host 
> controller does not support 8D (see reply below). In that (x)STR case RDCR is
>  valid and needed, so keying off capability alone would wrongly drop a usable
>  SR2 read.
> 
> That said, I agree the current spot is awkward and does not let manufacturer 
> drivers override the value. I'm happy to move it earlier. Two options:
> 1, Clear it during SFDP QER parsing (as you suggest) for octal-DTR-capable devices.
>      This is the natural place next to the existing read_sr2 = 0 QER cases, and it runs 
>       before the manufacturer late_init/fixups, so a driver can still install its own SR2
>       opcode afterwards. 
>      My only concern is the capability-vs-running-mode point above — we'd be 
>      clearing based on advertised 8D capability, not on whether 8D is actually entered.
> 
> 2, Clear it in spi_nor_late_init_params() after the manufacturer hooks, gated on 
>      octal-DTR capability, so vendor values set in their late_init are preserved.
> 
> If the capability-based approach is acceptable (i.e. we accept that a chip advertising
>  8D but forced to STR by the host loses its RDCR), I'll go with dropping it in the QER SFDP
>  parsing. Michael, do you have a preference?

Hi Miquel,

Any suggestion?

Regards
Haibo Chen

> > 
> > 
> > > - Key the clear off the real runtime protocol so a flash that advertises
> > >   Octal DTR but runs in (x)STR (host without 8D support) keeps its
> > >   RDCR.
> > 
> > Are you sure this is a valid case?
> 
> Yes. spi_nor_setup() computes shared_mask = hwcaps->mask & params->hwcaps.mask, 
> i.e. the intersection of flash and controller capabilities. If the host does not support 8D, 
> SNOR_HWCAPS_READ_8_8_8_DTR is not in shared_mask, spi_nor_select_read() picks a 
> non-8D read_proto/write_proto, and spi_nor_set_octal_dtr() bails out early at:
> 
> if (!(nor->read_proto == SNOR_PROTO_8_8_8_DTR &&
>       nor->write_proto == SNOR_PROTO_8_8_8_DTR))
> 	return 0;
> 
> So the chip stays in (x)STR with reg_proto == SNOR_PROTO_1_1_1, and RDCR is still a valid 
> single-byte SR2 read there. That is the case I wanted to avoid breaking by keying the clear
>  off the negotiated runtime protocol rather than the advertised capability. If we move the 
> clear to capability-based SFDP/late_init as discussed, this is exactly the scenario we need to 
> be comfortable regressing (an 8D-capable part on a non-8D host would lose its RDCR read of SR2).
> 
> Regards
> Haibo Chen
> 
> > 
> > Thanks,
> > Miquèl
