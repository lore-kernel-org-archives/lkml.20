Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013018.outbound.protection.outlook.com [40.107.162.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C23C3789;
	Sun, 13 Sep 2026 10:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789294587; cv=fail; b=SkOVKjyCAAxJdgGnqO7ajUFFe2wea41VpGkZro8VhyvllRjej8LwoBx7y4qyfmAN1b5MEody5yvTf8YfkoatEyOWbbgenFzjQSWjgBCPq4fW+GK4aqx//2kC7rvcqXQ0QzdR5v1q1iAuT0q74gfiD6gjPugK/ny83TpkUxSkaJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789294587; c=relaxed/simple;
	bh=ZRlo1gB5Oy41iU/5rOYITjqtmNStMef8qGqCjfMbhNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=POaKGJXuQSVt6VNod/vcFVtcP9xmIGvNP98lnjvvcy3KxScKlWIBYW58gR9HPJ7a5fW9bQL7m1aGX02Y+yyQldKhkMfFUlZg1IDyUQ0PEl3GtL/Op55decNlKX+IKTkvuXzzXod5/kxxpxiiMFDC+h+6PVAhpDKjYnusF6n6X0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SC8007GX; arc=fail smtp.client-ip=40.107.162.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SC8007GX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY1SHzI/w5Lxx8Mw2Vq4cymxlACGH4ABkbZzbMjRkAsQKIP0bA2gtI3AYfEhZZfvDU+CkZoVFqyUickRO0eaAV/oNG5LHY+mYTNBH4DNKwIYFZ0jKlA2swlhjcF5EpZSwZLQR6FF9SC2pUwBAbb2rlphvVhswt+WMiG2hTnfyg46ia/B8FZ3pl1sJsr0Ktne0e78Bn6eRZnLj0su+1lUyxKd7bO7WzC7XIXU2JIhDJ7Q6MfQLrl6+2NQYbw/TqNfoSESATVHEL2k29IaWq2mV0HnkP1kwZTFWq/auW/PXUUzNBsriMmDCnbN/Etbq5iok6iwwJAR02Y/bPKkSuLgPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SUsApcezmqeSyqFYfRqV1hSBjfubs0MytQyJysasRoo=;
 b=GY8A3Qw4ADXUxYLHN3g2oOxZwmbrY9lJ5sevI8zL8JFtjMw+bbBMzKr9vYBu0DtAd87yx2yV+vKiljTYks+dRcrQUAt8K1rdRMMq8OIZHCRIqT6BBpqMXD9Jo6OiJb297O/aQ4EQ+qeNcotXaXbjWHFga9H1oy3j0qSoLBA9lOGoqwaWXIuZ8k+WA+gA3zp8zmt+NBWg2FQZM4xsbnpDuSZQCDRnjWy9IvteYWiiuqaxYdca6ox+wgDOO/i799RYM9vL5b7rR3xpPuRZ4sV6Gftpgk7ZvgxoHzJs2PJzGMepP2ezVGx6wEqC6bjB5Z7JxBREtXKBE/PH3B/0nHQ43w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SUsApcezmqeSyqFYfRqV1hSBjfubs0MytQyJysasRoo=;
 b=SC8007GXmLOFq3CzSgf7GaQGvkwWp85MHDCyazk+sD1LIBJCaKoZf7kfj9eMWwjde9jd9UjjBekR+ZB5V1KzrrxE0BaEaUItTMNqcpdZpPTtaNTqD/RTOPwzSl7csw+5DqZP9dZiUGq3LdWE/Gl6QBDaoL6RlTjo9Z0+J2mBe42Kdeu+bv7fLxzcP5k+JJHxXr/lAZQqiVqX9UTHNqHyrnPMN/rMZK9ddIEIV/jJ8UQDuUd1vFKuvsvLqP+2u05ncJXPPL16idDU2qA47z0dvjQAsmEFEYirMtUw9ifCWlfLi9TEwiU6F1xNlJFQd6i4mBFfveMr3zMMoFGwWQMy5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM9PR04MB8602.eurprd04.prod.outlook.com
 (2603:10a6:20b:439::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 10:16:19 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 10:16:19 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] ASoC: cs42l56: Fix beep input device leak on card re-bind
Date: Sun, 13 Sep 2026 19:15:31 +0900
Message-ID: <20260913101531.2787654-7-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0101.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM9PR04MB8602:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaab7b0-0461-42a8-dbaa-08df11800dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|23010399003|22082099003|18002099003|921020|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	rir5R57oyiXRa4SX2FF+oLGzLn58jEJvq8wTJ+OFtiRbSkXEDGZHr1d1YFvJr8xKwwKcEDgKxu9M/Iv5oFqEvrOFA6d+vV77LpCfNXHb+pCkWknHXd48geadIQ3ra5ARwXXgRwciI7iWBQx7LlzUWfezico4lbcN1mC5uL9s8DsMcpfUQZCAoyFN43b/Iz8ld7xz2hQD0Dft4LDik97HOMuAhG5poKS0D37t7z1dJjzmH+AfNZMR2fRcbSjWOrwAZzy1y/6psE85lUQ5HYSdTJcl0q1e/4wtl5DZ7XQKBLxvIRvWQgRycGGzumQbDJXmAf8MnBCl5jHmyd24czioeg8PEXs4wbeCtNIFNHCvrnPbPZM9S0GO4x9StCTtGoHhpZ23NDsKrlPId1x9+dVxYcbUxrnPzIWO9xbdNpBZnEBuW+ZyFqdiODn2iAM2C75btNuuLSLH6u5hjXOo7SUMN64EAhuI7EA5gharL2+nkCsVl1bB/AfGW9fN3PEgKd/scTLDGyJqayt8O+WsyDPAcqhlK6xsi0nbzG2NmWFjtU06WAVvMKueFTJMyiC1J35aUrpfyGDJqG0OBXw8Waj9QmorWxurC9ohtKtPE12j7qNr+i3JR3eYQkISLkACedwnIgdGIg6x6yIp5itdoCLXFiWZkN1CfqvPhNvorCbdEQ4iDjN8YxDnvt/UpeDn33HZuCh3x+af2jVALkQ8HxF6mw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WUNreIHNlULmAo4vBzIDNIt4xVY2IzMyF72cHteOt0qRc1NLJ4cwz0wbxySi?=
 =?us-ascii?Q?Of/LiIUd3Rwqnisn6TQX0GJtEtW8j9QKC9Z4y77brah8EzWT89/m3RWHomjQ?=
 =?us-ascii?Q?p5IT69Xeqa4VVs+KlFwB/pxCSSkRcvRtpoH0/pQN6hYhyUDcZeFnRlBDVphJ?=
 =?us-ascii?Q?dHz5Y8EGdFSaUXYh+B1KtMM1icrDHPf7sJRdT7qX+0GMTPO/jsSrPDnZ4qVu?=
 =?us-ascii?Q?8ipvK35+B3YfBfUwPEB3IVS3ubGQayD5ZY1ADdoxD9JDhC9sQq7RWRbkEbmI?=
 =?us-ascii?Q?dhhLCfztN9mTDoju1QdAQcX7ndt7qilw+8a1Z1WNE5IEWSDNlsM59bo/H2Vn?=
 =?us-ascii?Q?7otl6aI6mMu9I4XWt0/pnTZs/9kutM3Ehe5U5jaoPH3wXxFhSKV7R8QlV5E5?=
 =?us-ascii?Q?i2e9PHY6eZB9Ok4uvALy1KetnUcTo3cJB9bmpq99nVKUKy/+cI5ca1+D7Bbe?=
 =?us-ascii?Q?BsuRbL8ap/0wdFiz7+gVC6BeF23bBda20Cx2eMm2bjK5GIBCR63T+MrmazVd?=
 =?us-ascii?Q?QdCDJF2eiw6uUGvycF6SIKSRDuQuNKMDeBwFx5Nh27PgEdx0Kax/1usDhJjG?=
 =?us-ascii?Q?8OU+InHhKmzzraFsJee+Ic6/cawj48GESWhzo142CMCyrrQ+cs6n6nphHiD5?=
 =?us-ascii?Q?GNA5y3mJiK+RH0RZVCe9KD000C99OMX5aWPEPLpczjicuWgEJ9X6xTyls0gJ?=
 =?us-ascii?Q?IUdfnYz0hGJthS9VglwMDImc/Jcr0GwK6tTwUd1tiE/Bvf9c3VrfjL0CgWz0?=
 =?us-ascii?Q?wOWEp6rMXtnJPNXwVcBi7JoUWm+rStEljvA2yCOFGQHdJ+TEHAPAYL2daO1K?=
 =?us-ascii?Q?KIrUf1OzEp2r75d3g07GKN52ZEG+r49vZ/gtSw6sO/ytKXyRjuETX2mJIh+A?=
 =?us-ascii?Q?6brAFS1pEKu/LwTJPNRCjRjj/PHACR/XaDCpYGpWt675Nlt/gw2Zkv6hprEQ?=
 =?us-ascii?Q?DCPGLN5Zju2Ndvlvx0VfOaDp4H2IhFapsGV5az/XfLgBSO81SuHFsW/5hnHf?=
 =?us-ascii?Q?kpy/3SrUo/B/YaSV6t6BxcXJneA+YCr3w5WLoyQn4nCLhgFPjlDV+m6wgct8?=
 =?us-ascii?Q?KaL874DhfAm/eOPfMyqhq9eIxhhJaUc5OeHCpAwMfH26/3czRAQt0vgjZivt?=
 =?us-ascii?Q?CHiMgbx1Yv5e2arhN7r9U8esKuHp7saidb/ctGNWoR0NnBeBU8cE9Af5yxGb?=
 =?us-ascii?Q?Ru0zCfeeooIOWUZO+4bH8XN+iEGZePxl7Tesueff7SEEYnFDhAtpkosaFHiF?=
 =?us-ascii?Q?FfVz+ALk+7NAjTjFdVkXihIqL5qUMTSuWZgRopbq/htPRAvt6x+T/7FIh0um?=
 =?us-ascii?Q?11Yve+lNtWRRDs0jl53PgOSWI57Y2DNuSK1hgnu6GGEkzq8VaMsJvfnd2qbi?=
 =?us-ascii?Q?FKrGEwDvUSH+GnGZgvBOUngEeEVf2BZofqW9jWXN3IcJ7ApGLIYreoc0YCnM?=
 =?us-ascii?Q?IehpwEw8DRiyQ9fQe+tuIcNZioZswiiNk7jSJ6vkA0HKsGgAQb7b8ue6PCnh?=
 =?us-ascii?Q?kngWVuUX6Dn9w6Kbi5U1DAcAk4WnSN+rzfCgoKW6DAGlyz5qZIvpAvbglVEY?=
 =?us-ascii?Q?lztzBjKXSp0G/RDea4nE2t3EoEDLlmXD9qLGNBSdLZz/294Zktd7KhgGgD0X?=
 =?us-ascii?Q?R5nUMFYBIf9A3QUS3SiewsQjP1raEo4TpbfLWYHB/1F7+wr6NEJLRciN91/n?=
 =?us-ascii?Q?tqGsujkc8ivoIrL5j17u5RdRUpC+BIyVk+5BBDoM17Qpq6S1UJCp6le8raXT?=
 =?us-ascii?Q?GtxOpwJVnrmXVmYxm4AX/N0KuxDsREco0jBPKlSpEn9mxLhbmycu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaab7b0-0461-42a8-dbaa-08df11800dae
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2026 10:16:19.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECOuSbTE47CUbSYLLVLfAZDY2q8v6XL2bX4cBb4O2Jzlv5oEy0tVEJaSJqTToXnykHSeUa5qUi7xxwgndv6NPnInZLVIDhYoCnvGgEzStRk5e+iCY/NYA4KRyMfMs3Ve
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8602

From: Chancel Liu <chancel.liu@nxp.com>

cs42l56 allocates its beep input device with devm_input_allocate_device()
from the ASoC component probe, but the associated devres cleanup is tied
to the underlying I2C device, while cs42l56_free_beep() on the component
remove path only clears the cs42l56->beep pointer.

The input device is only leaked when the sound card is unregistered and
re-registered while the I2C device stays bound. On that path the
component probe runs again and allocates and registers a new input
device every time, leaking the previous one and its sysfs/input node.

Allocate the beep device with input_allocate_device() and pair it with
the component lifecycle: input_free_device() on registration failure and
input_unregister_device() in cs42l56_free_beep().

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/codecs/cs42l56.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 4d9a22a1029c..37df94fbc887 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -1077,7 +1077,7 @@ static void cs42l56_init_beep(struct snd_soc_component *component)
 	struct cs42l56_private *cs42l56 = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	cs42l56->beep = devm_input_allocate_device(component->dev);
+	cs42l56->beep = input_allocate_device();
 	if (!cs42l56->beep) {
 		dev_err(component->dev, "Failed to allocate beep device\n");
 		return;
@@ -1098,8 +1098,10 @@ static void cs42l56_init_beep(struct snd_soc_component *component)
 
 	ret = input_register_device(cs42l56->beep);
 	if (ret != 0) {
+		input_free_device(cs42l56->beep);
 		cs42l56->beep = NULL;
 		dev_err(component->dev, "Failed to register beep device\n");
+		return;
 	}
 
 	ret = device_create_file(component->dev, &dev_attr_beep);
@@ -1115,7 +1117,10 @@ static void cs42l56_free_beep(struct snd_soc_component *component)
 
 	device_remove_file(component->dev, &dev_attr_beep);
 	cancel_work_sync(&cs42l56->beep_work);
-	cs42l56->beep = NULL;
+	if (cs42l56->beep) {
+		input_unregister_device(cs42l56->beep);
+		cs42l56->beep = NULL;
+	}
 
 	snd_soc_component_update_bits(component, CS42L56_BEEP_TONE_CFG,
 			    CS42L56_BEEP_EN_MASK, 0);
-- 
2.50.1

