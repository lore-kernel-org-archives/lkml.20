Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73347480342
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404950; cv=fail; b=mrgwji2bbKg3dx8O12TcirNYUtrT7VyYeZ+Ee5RrtxcG1e9WXj/w2eAlJ4UoNL+4hXZiPT9a11IV4Mascc7Ftedu0HqDp8t1x+Ie7+kqzDBmYNzZO7mPs2q6oS+/GTcBbdobx7/VZLcKKWMO6HDIc43vHQMloYRjn87VoXincWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404950; c=relaxed/simple;
	bh=yWgUI1EXqHna47n05iO9V+n8y7cBAIWXV1wkbThUz24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hpectPgCSOMUJ4tOx2nQ1CzbWdmx4f+Kle77wX7U3r8OZfls9Nnufo0vYRJju53JlUbP+8DnBcBsyNGiHO8H8DC51VVy9/srq3Pc09n818Wfpy2W1knoIPNmFJDegOsNsMG+PAQhOrz+73XVld7bbusZ+8veBFvOK4t9nRJmVbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lgaFMW1/; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lgaFMW1/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZfugcV7sCnKCqAYILWDCb15iZwEft/adOqgHtL6jBNXECCWLbpX5s8ADYKw2VQU9mZWpQlkm70icfZK5L7Y7/Dmp5pFiGMpwP3g3K7l/yyf6Bll80sXsDKiCaiqHnKiGJz2KejHo0DLB1Q9JnY6SfbvKLvE4B+GsNUl92vPNK7SyEE+jxA2ac/dxeK7RM/pr7ONPBqsqyu8VF0xjxi/0k7q21P8KCA1cL/B49W33vrsuDSKsq+QfjVlz7jU/KflgCpzeznV6AD0b8s+BUaDrkmUb7xSVDCVN+P015Jh2sTdVg9IDPCv78MUpiuJHq8N0DagcnVkUPXTCXKlOXKudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOwTCR2iaEFoI2pvOcFooFuLDVoCQeMToZBuO3AjVFE=;
 b=IU/cJmPzjG/87nP4NfzMx6xjG5Z3FIWtnjAnuRY6lreGWLV3vV1URnBsflolmyUxqMH0RXiLvLXoC+DDsPwNRFOhizpWe8xx8/8zShq96Sdy2Jb0QmNqj45NHWMLH6W2N3YJdghgIL8iCSKjev2ZpEVM3sMp2iMnt/XV/WNeyYzl2e/YzThqlkIZcA3B9qpUTmC8GdTkXfbHrHECQguAStd69XAieAordF/BApLCEnYWcKbSbG8fsXAmC6wTc3OQ3vp+ukXkw2Hyud817BkFFtn270nYRhtIo7eqrOG4+Tr4btLDLDxoQTl56wLOc7Pe0r6B9GaU3W8LoJwHOEHkhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOwTCR2iaEFoI2pvOcFooFuLDVoCQeMToZBuO3AjVFE=;
 b=lgaFMW1/61HfCflO4iRMqK/rI06ddqxvhhBJUK5PkdNpcLSy6msH33WLgU83C8fQ2DHHP5sWk6fNAAUXG3voqcXQ/aBdK5dQlxtxQx9J+SB94INpA79lbbjX2Cpo/MAOlTDVKWMuVTzsjkYKH55u3oDsd6zB0kAqSktkHoxgBeStzno84GsYYhV5ciPzZ3QP7uBqbINjPJ3qehgxm4Y4ITbZs+I6yfi3aMHl9SUY7vNvw21migPt2VZRYvFqDYPM1hPFhfJK54U8hgIuuOrGlLGIuXIj4W3FAZ9PQWlmerKqSDE8PLecSeWqgf/0iBX0rEIsXP99yfrjJClcD0x8Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11876.eurprd04.prod.outlook.com (2603:10a6:150:2ee::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 16:55:42 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 16:55:42 +0000
Date: Mon, 14 Sep 2026 12:55:35 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com,
	billy_tsai@aspeedtech.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/17] i3c: mipi-i3c-hci: Fix Response Descriptor
 DATA_LENGTH mask
Message-ID: <aqgnB3MOkkRUAEX8@lizhi-Precision-Tower-5810>
References: <20260914113003.183150-1-adrian.hunter@intel.com>
 <20260914113003.183150-13-adrian.hunter@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113003.183150-13-adrian.hunter@intel.com>
X-ClientProxiedBy: CY3P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:fb::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11876:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cba3bff-e324-4b3f-343b-08df12810351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|10067099003|4143699003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	XPBCKCMRPU4PvL05jduKZj7UruoZoJDgqXaqIK6Jflv47oRePkqj8mnweIWtgV5taFn997NM0wDPKR2Z507Du578UgVN6TMHX8fYakCIUw4Tt623rJA29KrhrRMDoulrWI8XdETTEJFaFQUitLXGB0MDe90VbwzYxo8YHLJy7g+1qZqJHWH4TXS7o5ezy11y66uKEOu2kKbLV9mHDzj2GcQVJrJcNS2bCSjRQWHvNYQUbHiIVdAaW6ZYJyZEgr4JRCz4lxKqzVWPwEKPPMw62tNnHspY3kmOMCWzI8wRB0k0SCbIJp9xIMd4gDBidWFNkQWmlVrdMvnELb8aN+dZzm1WP4X7W775QFfi0wuT96hT3WewA5oDF4AhOGMvA0TSIVDtgxlkbAmOsnHyG8BLnhG/2EY7YlLwyXhQbMTAdJ3Zd8VvX9hfLQ4/Dh7apLRIwBgk4L2Rb2Tn4P52vsnuyIb9KbMvEaoMHyqkZp++E4zDzTpbJnw4CnGZHRmQQUB+5lftKvKjYHIu3Q5EvzFzzhOpR+zTnbJVK4neryB76fUAU/Ah+Gy8n0bSpZ8bB1EMRU9pqdyIW4BHuvNaIqvtlEbUFIca5+ZrZHUxhrn4HBg/v/U9slI0zODBAsi8hXTRFXbCC8mi9RJTx5Qbgrn7AsrO6G6GaFaGfIK/5kTNHAc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GYNjA4H1KusnhBF9Xhnq17d1RF4NbqKK69PsMD30xUnza4luiJnW8gbP4PSj?=
 =?us-ascii?Q?iu/numk+jf3wu4wfPoMoq4d7LRa3zif9R40jypASEqyDtyuUbA1yr8hrXGp8?=
 =?us-ascii?Q?xBNSp1CAobnXf/rLZVdT2B85NnAoFz4sGTXu7dwBMdoQeXkCvTModMQQmYTu?=
 =?us-ascii?Q?zvf14mLZvX8KWTejnEj0UOUd25vKArY2q6DixmjgMteK/kuVBjTNm6As/Cnf?=
 =?us-ascii?Q?EatMO7XS1LOX1E6FfeXS8kJVmj8cLr85QGIsGFvFhW1DV9Yr1mnZoyuqzlXJ?=
 =?us-ascii?Q?PiAMEet9QdjaxmnBc5bIDZTs4ZT/8Ot1AZd/nS+ehWd7D1LHGPk6Iq5pr3Xo?=
 =?us-ascii?Q?FhhWxweKYWMczxzmbnZZ/Khqnr2gDpWVrk1m/hS3jCjRL2pUcQeq5mQKW//2?=
 =?us-ascii?Q?/eQDaKpfbkdLa7o0jYsybLIhse5HE76wrTvEu2vALpvcwoOhFsLZog8JMIfO?=
 =?us-ascii?Q?2oXGxhrMMw/UKjkXeVboeiGoph3fCs4v7/vDFGs6Hv72fubejI3tSkGOmuwj?=
 =?us-ascii?Q?42V7x4B4sAVdGsuTc57fW+OAkVsgW86e18/gHmnICvicRigg1o1809PAUS6/?=
 =?us-ascii?Q?aQAAKnRqDCOgfoe8i8FOY0Nlm+dJnlX51RoRDf5bNPIGj8PNWSrAslKpWJeZ?=
 =?us-ascii?Q?2Ax70mX8lZ90gHQjbg8WdPyvHb5wgn2DXKZkXxsc7xBKt3c8wV7UnLqZVO7z?=
 =?us-ascii?Q?PdT4ErMuQx2Czj7cK1aV0Z9zEHqVqnIvd5QuPxTBe7CNMrdWta5rj47aSFB+?=
 =?us-ascii?Q?zGS11EUiIseDZYNSTSDymaJHnEaQ6Z5EzTc6QM8dT6dBzcPwhddeg7a1f//6?=
 =?us-ascii?Q?aoHz5wPHjvwXZxIVqQ2g9goGANLLom3ibdUFy13n0nadHOtkXfiNPQuLd7ZF?=
 =?us-ascii?Q?e5IpyYc7SMu63HcWRxwmvF46kmoco7YLOH/mccvSkG3+uY8ieeRerNTAmTiw?=
 =?us-ascii?Q?5vMcIRPNZg3YUt1A0YA58ZNRc3ucPVaBWPvRYYo6wgb+aV4J7EW8aPHhPdgk?=
 =?us-ascii?Q?PWOvwESMwMDGn2ZQpUdDo+VuiAG7Liowva6wDtPdGrRaHlllJvCUvFcVllGf?=
 =?us-ascii?Q?W78deHDmogwYvjZU2xawnawn2Y1gGFFB9P3ksSxOTo0Vd8PnFPjbrNbzwkYx?=
 =?us-ascii?Q?LjQIIRyrPfDPfcJi8bhlFS3mQOesISqFXKh0bgM/adsY2BLhLQCslUbCHmOR?=
 =?us-ascii?Q?IK2OhJ4qieKqk0l/deZ30Scxe22GP8XZw5B35Ygvm/uAEPie7E8bmUvzoEvR?=
 =?us-ascii?Q?CSa1wfHUrHoSlt1lJ85OHOo8NktmBKOLCWK/tkk91en5j8BQeHzHyXbyBcyS?=
 =?us-ascii?Q?/RWzDDrepEUMJ122vb2BbmIQxOBhtsjMrsKYQm34pi22UU9Ps+K8e6PAocxp?=
 =?us-ascii?Q?CtJTncxr5ROqK2zi9Ei8q+TwmlaX5xEg80MGjt9oQS9zUKFj6NVoYDN1spmH?=
 =?us-ascii?Q?kztApHBLPqzB39fBu39VsP2WqtWC5TUGWRhXGj1zqjZo6MQ4xf2ZEOZiiwR6?=
 =?us-ascii?Q?V7uWgnXqUKXbWbtrAgVy/JZT9hm+VvOpAivSxpEwJzF2F1/sNVGaiHkzM86h?=
 =?us-ascii?Q?plWl0ucS4RKhAiOMiZXrw5AbkbiVJixVOPpe8/GnoLY5AhAOcTau7KfsvOFH?=
 =?us-ascii?Q?iFNamCHXrQ/XfcQ/hiBy7ubrYuzetru1TwpHsRY7oGaNO/+LoL5QVErt1k9O?=
 =?us-ascii?Q?Z5UqmaXBl5XjzcAup+C1nhqpc/HreTFiPC3z+HnoUsipMZ0rK7FglK9rHScs?=
 =?us-ascii?Q?BPtE+498uEuX0cdLOIPoE3U6/Cg7pSS7o7k8tvWzcqjzCi3Ak9o3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cba3bff-e324-4b3f-343b-08df12810351
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 16:55:42.7241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sy6nk1FVZe7OKCGHnnT0CVrRxgezjuhcJ4iYQT1roku2MpwtzYkhW8znirCFPmkbg7pf/nOFIiTTAcluneQRWjnjBUC8D/FEzExLcrccnYyFw+FW4OR52MwrZ1wsoUkF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11876

On Mon, Sep 14, 2026 at 02:29:58PM +0300, Adrian Hunter wrote:

i3c: mipi-i3c-hci: Correct RESP_DATA_LENGTH to bits 15:0

Frank

> The I3C HCI Response Descriptor defines DATA_LENGTH in Bits[15:0],
> with Bits[23:16] reserved in all published HCI specification versions:
> v1.0 (Table 91) and v1.1/v1.2 (Section 8.5). However,
> RESP_DATA_LENGTH extracts Bits[21:0], incorrectly including six
> reserved bits.
>
> Update the mask to match the defined field width.
>
> No functional change is expected because compliant controllers return
> zero in reserved fields.
>
> Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/cmd.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd.h b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> index 7bada7b4b2de..e0d4a6e0e319 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/cmd.h
> +++ b/drivers/i3c/master/mipi-i3c-hci/cmd.h
> @@ -24,7 +24,7 @@
>   */
>  #define RESP_STATUS(resp)		FIELD_GET(GENMASK(31, 28), resp)
>  #define RESP_TID(resp)			FIELD_GET(GENMASK(27, 24), resp)
> -#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(21,  0), resp)
> +#define RESP_DATA_LENGTH(resp)		FIELD_GET(GENMASK(15,  0), resp)
>
>  #define RESP_ERR_FIELD			GENMASK(31, 28)
>
> --
> 2.53.0
>
