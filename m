Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FA5172CC;
	Tue, 29 Sep 2026 14:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692711; cv=fail; b=T4gibt6J864sAYfgwYg0H2jIiyn0hDapsVEUY+H5DenHVIJNAtZbGJEgocSfuuwb8EjY5G/5fAkoy+II0jkoiLPKJnYqke5bb+wPhu+7NbQS0cVWimUodFdQ6WnRk3MoyYxkWIf7S7axx/yitUROT2yT6whdF7A9FbXd8c2Ptug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692711; c=relaxed/simple;
	bh=aPM+7bH1R1EdFGJrUqsG7FjuZ/mdNIePeSpF2/VJ8Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=W/qh7/PK20Ma91Ef38XIEITz06JEj1dQqdHJ51bz76ewJaUarZBFq+XY3MEamHYbjSZN13ry6gO6WI20OISvo9aamg6F458seP2JKKK4bSdUscBbuDoOhzqhgkpZpIBAsZhvFZp8ZtYV2ja4u3PCt5JlzXZmWBn8bhllm1dVn98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H8qRRb4k; arc=fail smtp.client-ip=40.107.159.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H8qRRb4k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhXya2emNZMVjqKQfZbnZ6qFKZ+dZ7BcjuLTvq4YxusQJWC+oO4DqGhvWFqHu+lc5Qknwdkn59wT9hAZqP0t2XsVGWXWnF9gRR46aNbkpS9IfVAXm8RW21g09/7MPyaepeO5h7Z0Zx3zLz6rI1z6YxTo0ksS4VV01mXoNAwhScWrBSjANyCMkDkCtba8pC4mIPAS/c0ncgYCQPPfyFPUGX9zQNXtaENlL+hqnPEi9GQd8FKmzJRtLg2YY38nsCbN4ZWFvqH4pHyThYrT6Q/1kiJ4hp2Un8jELcgvz7jRyZMQJpQtkmnot851y/3VBYHBg/K16sXq3CcDqYw/mILaKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hp+IRLWCM5hlZrQZwlm0ehr7Zc/WhYNBQ10bt0bMHs0=;
 b=Kgky/dG0Jz9XnrCvDojJC5YppUjsR0En8rgkVBPHMnr/T19lZ6c/FgJFPuJ3xdfxhLn8rkkOUyPmVaftfudgEcHju8gE2ePASi1amIywlPpto+Q/Xsri8Ex2xRqmlcflnTFHdR9N79lS6g6R55P/9i4550wzehWXNLjvWm3KAjBSx1RHYvP4pOR6cNBjtB2JpEPDOPP51iis0wUnf/4o4l56Et0Z8ENbS5u94wkwrRErUNFMLsNEJIvwJM8DZdgsBfdxeDH0v0TROqgzJu/jH1Id2eHCdyJg45NMB26Bc/Atd5xvlx1WZx9uhnepKpHry6aPhuurFLmsyh5EZkzoLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hp+IRLWCM5hlZrQZwlm0ehr7Zc/WhYNBQ10bt0bMHs0=;
 b=H8qRRb4k0EqZkHA0m3QQ2dIfInoz3tOwO9ydAaZaN27YbREKltoOAO3y9BxF5sYUDjJozJHRW9IlXmsIhG1u0QjPKbNDjEi40OHVJsX4NrDcRffBuAKPnejadB0FwjPh4Aqi1b7h7siuywqwMEtS9B56q65lngbk0PmpAR+EFsYCdcM6uGIGI7dujTh7i6wUP27jWa/XKcDYh+JhbKdQQw5qIP8bHqHkVIvlTtDhgBnBPPmcGi2n/4/6HuMKpI56EMXBE/P6Rl/hntrWN/ZG/rDQQBtWeUH9Sa9y31DdPiEs9ADU2kJZqEhEDXlIHLlP+8oQmRPh96KSg9wiPkaVMg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8066.eurprd04.prod.outlook.com (2603:10a6:20b:3eb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 14:38:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 14:38:23 +0000
Date: Tue, 29 Sep 2026 09:38:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ming Qian <ming.qian@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
	Elliot Chen <elliot.chen@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: amphion: Add V4L2_FMT_FLAG_DYN_RESOLUTION for
 VC1L
Message-ID: <arvNVv4nyXoB8iC9@SMW015318>
References: <20260929-flag-dyn-resolution-v2-1-ef29487f7215@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-flag-dyn-resolution-v2-1-ef29487f7215@oss.nxp.com>
X-ClientProxiedBy: CY8PR11CA0041.namprd11.prod.outlook.com
 (2603:10b6:930:4a::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: d181d1e3-3d5e-4768-9b87-08df1e37507b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|18002099003|22082099003|3023799007|10067099003|56012099006|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	5sRX/O246OFPfjffP8RmGdYMac+ojjLBF/xSBYKN3F3AGzWYSNi3wz7dT896cUjyLRq6oPZev//oZdOHHkuTziZbcdNXY9iIGU3GjQsWw73dKtb4mNEhZ6hX66A5zvz09u1atTI7FC0NAGPRyOma4+Dp1BQb8yjGTBvTu6kPyX7lITXIZEajH87Vqgd/r/3S6lDzcRTNWBUyKTmSydRLe+of5clxyEqopYDX9r0/aERlodJ7lghCnk57LH5MLbQHyZN7zweNapdD+G1A3HXDswLaDtBiF3plbQylKBnoFJ8ZHJPl7QfKNKhePeuOkG7BCpPXypUqPhX2yODEswE8Yec2dhpw/KrbGVjFyxCbV/90kbEAjP+3E6YTAMo3Q5gatFwSi1s80Ie+pnJ4G90q9l68V/jvgJqjjjWNyGXcAP4386KMLWnPhQyPIrkdTbNYZrhzp7nAayVoW6AMkvOvPBANqcNjV/QrvteQoUHUvtr/sm2TL9dH40U4xbS0Pwvbdo26O0QNpi1xNF8DSV/f9momV1AZeaTkPzb3+7Aa5E8tzLxvZjoR95YPZhA00SkIwEsqQNshZDoDbozQqcGJBQ/iaqEF/Zi9OiVPKQ/fi9xGp/7aST5CdKUB41XmWT3P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(18002099003)(22082099003)(3023799007)(10067099003)(56012099006)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uYYl82cHYuruUe2e+Ceo1S7g+R1LD+BH68R2TW8zR3iErVfzlemvOWi4H/84?=
 =?us-ascii?Q?1aZIBZ6oUrWb2YzDQhNJiQqiGJxm7hqaOttEn9JLsy3znGnUU4OnITI8d8Y+?=
 =?us-ascii?Q?iNQj7RyeIVoqL6lhWO49vqBKXL6DZ33Jz2V4d0C6CDs4n8ClD7QrRFdLeXXi?=
 =?us-ascii?Q?L7S7xcvsGl/M+kTdZ1anhe7j8V49iqT2OYNG582Pjec1vBQjDlJZuuuja4kY?=
 =?us-ascii?Q?7RlMkHBtGnpyHPcXfVjIIPk3Ot9Zri2GVch8Zzqi0Ks45acSQQgXq+bk7KGr?=
 =?us-ascii?Q?AemoR3ry+Ssuz2YTOvWHWR/7ZwJKHtxiwnwvW3wyrTpGkgt+izeJUVd4KFIh?=
 =?us-ascii?Q?PZOXzuPZPQKDrIQzKCl9+gK82vvS5gK+ySaC4sxnkJso/AYnTtJ7epwLizvu?=
 =?us-ascii?Q?N6xGK+Zft4n3Ft/JCuRwTh03qBtFCAB//WmZgMNkIN+XZj0TqPX93MYkScfF?=
 =?us-ascii?Q?NS6tRcIGNOyFvhbpCCBhyopFC7PeqjVL9j6tfAMrO2lu1BpTqGFl6ENy+K7I?=
 =?us-ascii?Q?auvg0tEW4EpZtP5QMdrTz4fgZlnFyYkxfjnyHaGljmmSblU5KF3KeXGJU3gJ?=
 =?us-ascii?Q?myEJmqNfUkJPD2L7Y0zApmhpWWMwdXkLBMKhD4NbgyIucDyHnX/osJjxusip?=
 =?us-ascii?Q?hOI4QCe4Tf77sCu+Qrrw9291sPMIykokv4qqZYYZ5lj6JezyL4OA98DVsAEO?=
 =?us-ascii?Q?0K5ugszphtHcGAXHiBnmGWnaIOONPQ2vKRGcmRz2cdDjEMNb0zLX8CdPmVH/?=
 =?us-ascii?Q?0AEN5i0qirSvKlVN+uFVFRLPhPNzn4F2KzyL5Dbp9q3aYLSs9KGsvhYmFF/7?=
 =?us-ascii?Q?0WYjbd8cHQ+epP98AYTlLSU5H6LJjpVVZm76ZsNN7I3mLR5kfjFkBLE+GZii?=
 =?us-ascii?Q?ItZbIxmk8KGkNptXC++4SHxrFoaoNpjupJMNHYf68FZ6FmFQ2JP1FpzKbnWg?=
 =?us-ascii?Q?LaG82ADjk8OTxeSQus2zVIpLiVvVI1TXl/JkfyB72SDYIc7mR69x0hNvq7gW?=
 =?us-ascii?Q?TjPN8d9HTTY09DDYZNy/LVOV/fkZV8Zp6/kf9y6ho9dF43kF0yq3LCuBOcCk?=
 =?us-ascii?Q?zxSM5FJe+sBjEQGLFmcHbtmSg5Cc4HF7kJwTAnUuFgsVHEydvms+pqdIe7lc?=
 =?us-ascii?Q?/JM0m/uW5qnsMaedacUosmiUwWutATUuncYlEQ24IPe1mULUI32KOZhhcT2Z?=
 =?us-ascii?Q?WufOF51HJMe4SSVXTXBvO2OfVq6jffRJvsirV1mjhC11ZuBls1gSFtxFicnX?=
 =?us-ascii?Q?cvIuU/D7wReo+hafOBvrG/R8kEbUcEN4qPgp7AtrP1qSkgKJUtRICbLL8Rsj?=
 =?us-ascii?Q?T2iBLmeL6LbN+BEqcszziSwV2d3Y+V+rF+huHubaiDUmY8BiIpvPV9Wz9yw3?=
 =?us-ascii?Q?cQNmA82Ky8Cil2VZel4YBhsKlNJEcW0ZwGBuSlivEXn8zUTHKvWPHE92/ap4?=
 =?us-ascii?Q?g1062zeLvKXzzV0Il4CNa5djNSiCB1sysX18t7nj/Lo/fMiap7aqq5rM/lPP?=
 =?us-ascii?Q?/CkdPEH5AQtvkK3r4YkTO54wq3Ml74fLQmuqPOb3M1TVdltHKFTSYTlHyUPJ?=
 =?us-ascii?Q?9w96/ZMz8qhY/AB4N5j/7GayRtRQEyULqorKZZMxMO8NDbAcwZjr6fgu+nDF?=
 =?us-ascii?Q?zB8eoKy/GpBeJEgrAd+hzp4wlLLt3Bv/+Xv+Aj+9EAYpEkefMRm8gMNW2chB?=
 =?us-ascii?Q?wJSViZw2ULorYpOJ9AhCb3uPg3lVwcW/2nbKAj/qD5GbNr7B8bfCASzqAe/a?=
 =?us-ascii?Q?iQMnj1lV50SZR4kyNoB0ABuXv4paGalpapaqTnbFBRvWQeRh8nny?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d181d1e3-3d5e-4768-9b87-08df1e37507b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 14:38:23.5689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8AjDCGhoLkt5FQnU67b7rUbQUx6trzY6jCywHrqo7Eyi05dhKtcKNCmTPq9Dpsx6PDOTw8gIJwiEXkxamyfDMZwQ6351x4bkr1FlZIAyKGReOKkLFiBWMgEww3aWnAR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8066

On Tue, Sep 29, 2026 at 04:30:28PM +0900, Ming Qian wrote:
> The amphion VPU decoder always emits an initial V4L2_EVENT_SOURCE_CHANGE
> event after parsing the resolution from the stream header for VC1 Annex
> L format. Without V4L2_FMT_FLAG_DYN_RESOLUTION, userspace (e.g.
> GStreamer) cannot determine that the driver will signal the initial
> resolution, causing it to skip waiting for the event and fail to set up
> the CAPTURE queue properly.
>
> Add V4L2_FMT_FLAG_DYN_RESOLUTION to the VC1 Annex L format entry to
> indicate that the decoder will emit the source change event during
> initialization, consistent with other coded formats supported by this
> driver.
>
> Fixes: e670f5d672ef ("media: amphion: only insert the first sequence startcode for vc1l format")
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> Changes in v2:
> - Drop the documentation patch. Nicolas pointed out that
>   V4L2_FMT_FLAG_DYN_RESOLUTION postdates the stateful decoder spec, so any
>   driver setting it is already required to follow that spec. The
>   non-compliant drivers (coda, s5p-mfc) are pre-spec history and not worth
>   bending the spec text around.
> - Drop the RFC prefix, as requested by Nicolas.
> - Link to v1: https://patch.msgid.link/20260608-flag-dyn-resolution-v1-0-44dc65516148@oss.nxp.com
> ---
>  drivers/media/platform/amphion/vdec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
> index a9f0521f2e1a..75808482d090 100644
> --- a/drivers/media/platform/amphion/vdec.c
> +++ b/drivers/media/platform/amphion/vdec.c
> @@ -136,7 +136,7 @@ static const struct vpu_format vdec_formats[] = {
>  		.mem_planes = 1,
>  		.comp_planes = 1,
>  		.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE,
> -		.flags = V4L2_FMT_FLAG_COMPRESSED
> +		.flags = V4L2_FMT_FLAG_DYN_RESOLUTION | V4L2_FMT_FLAG_COMPRESSED
>  	},
>  	{
>  		.pixfmt = V4L2_PIX_FMT_MPEG2,
>
> ---
> base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
> change-id: 20260608-flag-dyn-resolution-f39fd24a0ba2
>
>
