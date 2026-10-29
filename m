Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793286112;
	b=0b3HksGaVEkAJdLBBAr+5gY52gb9jBmMi5NPH/QDGq6O34Wh2Tnb7DfaMr0OQUpFmcIO
	 jZVw71wu3ApEVnbiBuAsWs44t8HxofZ2ky0prmQFaTVdJs5rYiybmqk0R5LvSlXDyfJsB
	 rIv24LIC4PliNJFStoEj2q9x6DqE7hbjgWNChoX+dd7+pR2CKr61c1j6EfFaVpcfcptgr
	 G8G0ZRd4b3F40dDVFix5QCPESyVEprKC2sxxcgVJXsUf1RsCUX8cwmQiLpy64d6bNVH2w
	 8g7ylvFqZDAMCeobsTo2Vg3hQOUEUw8YVLijyLZp6b89g7hNG1npV09cxteQ8/vmoJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793286112;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Psn9FyzwF+YxtVOM+2BF6Jlpnd7q7okijJn1kUmKsPU=;
	b=3mAgki+f7Y8zzY0dfoPqWvQDTGxsuUrCqwrBM/+/9lffvqlSiZCCxWrlS4GqY1app/e0
	 UVVEdbk4U1IWV+Sx6qqpe23jzh4+FRkFImhOuJZg+FVeh8nXj/gRrbEFcA+lS9b+xIiNX
	 Uxqia3/wvTHxGtmW7u/AxmRjJ4EKNyTRGTrfCbpVPEyuhFzdZ6YLy+ca/khsCwDWx8W1O
	 cfi7G387CLxJODT/6YeDi88Sh8FCMDNGG6yU/bioDVmieqzH0cMk+2HyiCm+WKJ6dl/GA
	 QYI8G5XRKzj7EfS/C/CGV168DObQaOElQfxrMnvDBPvWhv9SfY1I6oFrs4dSMvgxYEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ctUI9AS9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.7
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22A0D606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22A0D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ctUI9AS9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kfLoqtIKrVn+/DhRlvQxKBKGSC0eRnIWqoTfcjG4SuNMoN/kk8/SPIyofU1ncLYcyoV7CQOVx+aB9k85dPce9luKqIG4H/XDQqLeiIfWsQC5XQjAR28EE4luE3H2YhapQmbYuiPM4iUoSf3h2ILRVM0tx8JmVX8yoUhf91Sv88OxeQ9i40M0cyerKeeFjMiSs1l/Zs+BhXFxdDJJm74Wfcb7HxQBaZlO1rRnb3BHJM2X9MBchWSDZJ144hOdJ8pJf2GPOkDJHnOitDz9eVZKUYVT3bS/EItH5xczd+fddkdnZa/34ShAOmCT6IQa83UgVl3gU362/FHwTzSa79zXrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Psn9FyzwF+YxtVOM+2BF6Jlpnd7q7okijJn1kUmKsPU=;
 b=FrEc+4sVsF36vrFUZglfx5wvRC2Dp7r8e+kpg7fD1EyOkW9G11v9EQzcj5mBzaptcyrfmkacjF+9uuRiLd3F/BfrY1C/uX6w3kVMmOZg0dWk+BOC/ENnvTxYialYKlpjwlQHQPq2X/0ifdGSTtMMmMmZwEfmf5Km9a5eXwADJVKRBVA+mlBTzYNfELBEOwZmimZ8XtZXbu093OZgiAzE7dB4SaJEDoOVrxbE2VTtgK0xeT0FLUvAsUUGrUkovOeQDW1bT8sv1jUgUA1MmUJtizgs5g8+gHewkLTt8JU55RTRR/qCpT83sPvTxLHkiJk4oC19idYsu97gvr8ex+0qoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Psn9FyzwF+YxtVOM+2BF6Jlpnd7q7okijJn1kUmKsPU=;
 b=ctUI9AS9yMPUqx64UPNXMfFbgl8DuWSOcVbMXPZzOdu4EiBwa9UoXvBPANpDQxDvUKrTWQOcgNtvS/lw6qaxLVzRc2igtM+WbZ8UPnITq3sFCbWixK/RXkDYcwDlYpaQSl51ukuJJo7wsuCA0lIOz7AkxKapw3E0gp4dXyynONy8dFFi/rok3yNbxXhdWYjIwg/W2YbtjQtH2jtdpJohAxpvUxz62zkO2oZ6V4hG4e8tqtqyDvMlMS9a2hEji1aYyyAkMtnrZMwvezC29lW5YbZ9jw/iw80u41aO+hnGtGiMLywo2/YRwUZHsgcC71wiGvsg546erliyrvcDLlWpog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by PAXPR04MB9138.eurprd04.prod.outlook.com
 (2603:10a6:102:22d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 15:01:47 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 15:01:47 +0000
Date: Thu, 29 Oct 2026 17:01:42 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: dri-devel@lists.freedesktop.org, michael@amarulasolutions.com, 
	linux-amarula@amarulasolutions.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: fsl-ldb: return -EPROBE_DEFER if the panel
 bridge is not found
Message-ID: <auNeWE0QyjtZtOH7@vm>
References: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029144132.572020-1-dario.binacchi@amarulasolutions.com>
X-ClientProxiedBy: FR4P281CA0270.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::20) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|PAXPR04MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 685cfda0-d8a7-4738-9c9b-08df35cd8d66
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|19092799006|11063799006|56012099006|261009223027099003|261009221227099003|261026121527099003|261026140227099003|261028144727099003|10067099003|261021121427099003|261021123027099003|261022105027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	J/GT4+snEKg5CZqFxLRIfNftVS9zP+mi129BsE9KaXgPP8pCBF9Y7+zU5UJefs1IIf5vltktjd7VnulbdsBUddq23kph6UWdsGtTFp3eOiwgr7ywgDSTEy9+foig2CTf1BgvS3pHcsNgVMn2fXgKRT+GE717bXu6I/tvk4eukRkYoqWbs6hmkcUuocVi2bedPsjw5JW//zBDG19z/hIyF0pkUSh1JvYd7KiHVDA/EC62OTPRNfORYwePzxehMMxUpUgIppY5CqFG4wdkw9kd29CO1uF19UazrDcVgTpX6lk4d8qOAsms1o5vFTOZDAoUiqIVDUniDL4gDUMR8m0ekNLpgAEHbG15PCsYrxjdNP1BTop+wvVCy7g8qQzOFPtEB6Bq1R7rr5JvxGgT17onGqiMxQ7wQk44lUVOq8ZFlh8Rqx+08H7EAr/Rb4nxmEwqEDg5zL0iXcNKfG54a9m75PbwOC3k0AAyEDAo6sev6kaRQ17bIX8Goi686wD+nXaHTzigQ+VE1wr95QcNUivF90HJKi0yJUcE0X5fqtx7cFboXmE+9217QGpj266MqwupELoSxLFH4wED9hmZ1/EKhrQQnJ7GzVkUZM9MuOqLuPA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(19092799006)(11063799006)(56012099006)(261009223027099003)(261009221227099003)(261026121527099003)(261026140227099003)(261028144727099003)(10067099003)(261021121427099003)(261021123027099003)(261022105027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VC+me7KYgZcedsr/7T6/kskZqt6zeIHAO+5pkG6P5rB1oG9WEvsTsmbHkZ5O?=
 =?us-ascii?Q?94KAMe77iPG+w5sMV0N7+MJ15cD6Bc2QgNMbh8UVTd1tf4kt0BT06lQ+RLJS?=
 =?us-ascii?Q?9e2DqqY+K6fjQQkvQbRNqoDY9SPc4e4AmKC5kbDnqiOBzk8hdAWb1q9+3Tpq?=
 =?us-ascii?Q?+t7CfagctlU2aK//HfN50XWRncHtfZIe5YT3B4yKFuyFhDvBhmxTWbxknuyT?=
 =?us-ascii?Q?WPZ4/RaZ67dMDD3+G3ykL3pc16ssvJa1FbBEWjEk5/2rvMeZ2c9Sn0NZANdo?=
 =?us-ascii?Q?185OONXoe7Eth1Pe62PAsyCJHP+vTHcErgZbGj6ioRZiM3INqKSb83erTWpL?=
 =?us-ascii?Q?U36p81LG2Xnbdr86Y+/Ny2DXHGsWkG6dfL4ECdJYtAkQAVE7El+yefFStax+?=
 =?us-ascii?Q?k5xxnFEontce5ROKQLGgYlsWJ+9dPp6dv4HM3MIL4qGbhcd5pWAoeUUgQucm?=
 =?us-ascii?Q?y9AIYhsDQ0ZlQshuMzlP6tzZlVS4JwOIKP9ZEYIuQ3B/D5SmxH2OFzT8SwFG?=
 =?us-ascii?Q?Dy0UlzE+stVKf9TdGbxdnx6ZQBjMSbN9pP1S9h1S15f+GR3qCG4cBPhx7owm?=
 =?us-ascii?Q?swmpgaJHwY/svPr9Nwdgcp5+aY1ItfavT8P2i9P3DNCFGvv//QU/GIHRT/mH?=
 =?us-ascii?Q?4AQCD6IUUwI6RGRxloM1yLmDZT7KZZDrPgt3AWUnxxqclMO/r06YdCVZ7b3Q?=
 =?us-ascii?Q?SAXDDzwefrQPwOwUtMGELCwaSoLVZ0853bOUzIXnqgE3I9pPH84SHmw/VVth?=
 =?us-ascii?Q?F487HwXzk0nx+ehq6bA02FfV8rOeacQtRBigCiSoABQrHDD625JnIt4Y53Hy?=
 =?us-ascii?Q?YhvgiGJtI4GH4uFWd4KDdoTjoHCtlmZw9abwW/PqdzfnMlyPDsZb0ovmUG5h?=
 =?us-ascii?Q?K8n3/+yj/pbGUqmDjcXgwZCKq/xz42DRCJs7ghYHYIpBYU/7V6tnMQB/aG/C?=
 =?us-ascii?Q?ww6FFdPP0SWBLzHArAjqmu/5ceB6cHJRZpjkhVTuO236J+s1dDl9vOz205i4?=
 =?us-ascii?Q?668ZiG3Hsxf7Y8Rcba54kJ92Rw+K3gmuO8nPrubQzDQY4fJHVCcWDHYDKLC/?=
 =?us-ascii?Q?6URtDRpNMtiv3g51iQE4+rZH8xeV//+sy9ZIks/T+MCSfTZIqJbKsM23Ski0?=
 =?us-ascii?Q?olriyR5kVQZBk5zTwy3m7dylRmgI6kqyDr/ZL6J+wf/kq9Za+O8NSlOfWYv4?=
 =?us-ascii?Q?yKHjFTsuZR8H9KBO+6/0XU86D7EHtl0c+eaoA1LZYbYUUafslumKn09ZZjDo?=
 =?us-ascii?Q?ON5SxUyzMimd9oZdxqixUakVIshpRGc/zafY733ppdYLvD+kjtSI/a72y20W?=
 =?us-ascii?Q?oU4c/3Ub6PHnyyR1MF09mMI81Hrc28vAdEtel2bd3/WhxMlhpkI0Pju/SjSz?=
 =?us-ascii?Q?ViDnetqOsybobSCVhbju2hEoGFxQgpkGCBVtzTbilBaNKP7BMti7J1hvrtte?=
 =?us-ascii?Q?AkHweKju1ALU3RDUJiyI0+xCw/7xbpMPw89An3MnVCDjADtZUcOkHPp0Dm6B?=
 =?us-ascii?Q?Ll8sOSwzkKthPkIM2siolSiUYPSH15yoGHDDBbmy728S9tt53UeUWB2uvw1D?=
 =?us-ascii?Q?YsXcwdeOpzv30dUXngk0nPdvyqkLG0ik5AJqmHur3yL4B2e31gBSKpGcwRMd?=
 =?us-ascii?Q?l5YU6qY6tyXKt1ic+cMexc9pgg9fcJpeZEJtYQ4DMXF+1sp+5IUkMIcDVBcz?=
 =?us-ascii?Q?XmmusB1oWlJdQtps3YzmlS5l4WX91F/nm9+os75zpofnug4EFnOwQlrKU9ug?=
 =?us-ascii?Q?scN1FPsHDwpCwMj2xu4DRMueha61YwE=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 685cfda0-d8a7-4738-9c9b-08df35cd8d66
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 15:01:46.8849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZK7N9v+l6cTs3S4OlGfNg3oKVXkNEoaBNiy62EmXIGInmAK9oWCz+ni1MgUGssEBE9EnmQzgYBLna0kXsBzOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9138

Hi Dario,

On Thu, Oct 29, 2026 at 03:41:28PM +0100, Dario Binacchi wrote:
> of_drm_find_and_get_bridge() returns NULL if the panel has not been
> registered yet. Returning -ENODEV in this case makes the probe fail
> instead of being retried, so the LDB is never bound and the display
> pipeline never comes up:
> 
>   platform 32e90000.display-controller: deferred probe pending: imx-lcdif: Failed to get bridge for endpoint0
> 
> Return -EPROBE_DEFER, so that the probe is retried once the panel is
> available.
> 
> Fixes: 802372cf316a ("drm/bridge: fsl-ldb: don't create a panel_bridge")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> index 7ec84c81cd78..420b3e08130e 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -342,7 +342,7 @@ static int fsl_ldb_probe(struct platform_device *pdev)
>  	fsl_ldb->bridge.next_bridge = of_drm_find_and_get_bridge(panel_node);
>  	of_node_put(panel_node);
>  	if (!fsl_ldb->bridge.next_bridge)
> -		return -ENODEV;
> +		return -EPROBE_DEFER;

Hmm, I have a patch [1] in the DCIF series that adds support for non-panel
bridges to fsl-ldb.c which, indirectly, should fix this as well. But, since I
don't see that patchset merged anytime soon:

Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

[1] https://lore.kernel.org/dri-devel/20261006-dcif-upstreaming-v10-2-bcfb28de0aae@oss.nxp.com/

-- 
Thanks,
Laurentiu
