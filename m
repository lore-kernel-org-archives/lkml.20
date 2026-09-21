Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B3447FB10;
	Mon, 21 Sep 2026 10:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987613; cv=fail; b=u4QVYKwptAzsP8B2aBcdCq1oVf7nX2atW7h3du8zYF/WzfXXhoOBmM4Zj2sx59qMetGxdd98aDTgDoK2oXfMVsgZ26eULSyF6yhYyUI0wfpqhN5QNSsfcIo+irEggwxN7VJbPGrf7Ok13wG+MP71+0ESeqtLJ0MG+8Tu6nF591c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987613; c=relaxed/simple;
	bh=K9+5X//Un8/t2PRlvYTRAuAWbx+SWMeTK18dikc8+7E=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cBjSklxOqgMEvd50n71lUIrFa0NQPctAsftFs9rN/Oz/oIe4qrFOUH5LGpQ5zrQKk80rbTC4kLFIhRa/maT/tp60Ant4GcDuTQl03yvQvNDQUwQ8itoE6T40UZDARTIV4Zf0AL52UEIj4elVxNbIW4N7c+jAhr9vbQtr+k1uQwY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pjOaqCh/; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pjOaqCh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eJCdLnub37o3gXolYmnCgtusYTHlHpVoxhqPqKZIDIKNMmhkCRm1LjVH2m4WPgV8IsULgEnnCp45jbGf+YU2GbXGn1vijo8WgdbhS7L45WaIEqSuHdrFL7iKPkD5TsVUItXftxULTUg5oMrRBF9tYsLD86hEhOgcNXo/aiQgdyF5M3zO2uLiopTonkHUSwfMRamba6gvBikoBtiUUqafUfGB3gy/HKCkXguPXxNSJtCdswgRoy3f5948pJ2MKlx7rFlE80kVHySB+3LElNY38y1C4rH9NY/JD5cnYOBaU/3tgwAVss81/bm6KPq6sIjbpDoBIG/5TF8rctRA19ehPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xdkCxLJo2mrqWtwupTv7WE+X2EGbg2klql+zvTZ+TdI=;
 b=pQRfils1EPac6b4MBQBo6I4t/11PETXBEJ6QvY37XvBh3aELCqx2cPIvf1O8Ie4jamk+FEEyegMeqWbMFiBtyRWO1eiw3F4F2ulocjgVF2BABqF+Ih9qy4pWDTyHEa+kvk0IbJm0EumFbWkPyuFpoVc56+8ldukhMWt4Df9NEQA7CinFOkH6WAoZoaDn+trr3ii5qYvkfFo5xn1H3dS0vqqAJzhJ60E+pnU1cI8akafPIq13GbpKOQqnrBH29oSxs/9ojrtdvl9wVJeuTlDqwXOmWsVNgRwwEpQjg5fbw+orMzE/IaC9q9dxKUsNymo8eS3+pOa+RAhGRIs31G/EVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xdkCxLJo2mrqWtwupTv7WE+X2EGbg2klql+zvTZ+TdI=;
 b=pjOaqCh/EcW908DYwbZPxGnQSMjjxi0nk3TWeCPwuAvk02U3Jy6sJ9s/SW4gj6SWMfzyXv0dBLDa0hbSpIBfrLdmIrl/VrlL4U2daxNkPtqM1dEAi9Z8Svc6Vq8hOdsC9InBNh6p+2Ak2T4jhsfug7+aRDVrz8pnOYZvk1h5vfgV/AAHGKGsE1kg7WlQE4NbOidtcOfVAXsH7lwb5HZ4YaDllmHJfOlLF55jBxWNffnc4tEaYi6dv6mhX1djYvsEenW/nWHVTRDfVR/0EYIU1AF6Aw7OyRjzbSy5T9zz0PKvLSvvPRmwEg+lqPIO1/1q72GyrmrF7pBbjuslyBFlFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by FRWPR04MB11198.eurprd04.prod.outlook.com
 (2603:10a6:d10:171::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 10:46:48 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 10:46:48 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Oder Chiou <oder_chiou@realtek.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: [PATCH 00/21] ASoC: codecs: Fix resource leaks across card bind/unbind
Date: Mon, 21 Sep 2026 19:46:19 +0900
Message-ID: <20260921104640.1941554-1-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0123.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::12) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|FRWPR04MB11198:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f258d5f-aa01-47ad-9cdb-08df17cda28c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|1800799024|366016|19092799006|376014|10067099003|56012099006|3023799007|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	TEHZ/cFpwuyi4JEgiabzPWo4VdFGWpqNUm7G/cDTtAMIzlivvqLRUGGnKYP1KrZ287RHUFgjhgH+eW+ipIuz0Ksv8SZPloKls3XRRtUldCBjPi3naLwSAfQbgwKs+DB+MpNCod5+acCsAHx0u1RRI1nebgckt9hvxq4R1DOlF8oVZNOmbSGsuB4JDkQJPOqU5OGcEfTIn/iqqIiJkqziMCS1ZoXSQlIOSRp/hQz8EUlEFdCMfYuIOtGey5fCye51Hr7jpduj0/9p7aUSBx1vjHcEq34JTFxPs1IGhmrJZZXlKYJJYtiSraU654cy+rZ/Q3TTYjqgS6Lr92BxB3T78HCv7sq8QifDPCCtEUiPiY3ogFcd3wsORaiaDjcsDSedhiFVZl0sLP3Vdoy60L/uvGHoYWEmoHSPdzO0c5MjUz1b5YP1EzLFyUoF6eDn5u6fH9dHVMKeSFTbxVYofc/FBktUZ/5Yy0nbQBrKCrZvOUE98FHdtX8yxIQyAsa+5TD3fIdZhAKj8DJMpBcnspkOg1zFVVl7SrSvn9IQgKglkC3tjCu9mr+o+VNIK8BqseYPywO3JgPyzOBk6tT5V/fcWG3MbXQwstnYxyegIAk2Z64NB51EEmVAV42kh3Kny6UV
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(1800799024)(366016)(19092799006)(376014)(10067099003)(56012099006)(3023799007)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wWszUauPIYNngVYLdbsyl4HP4alUrUXaxqHNY5nZ3w9lYjctucS+s9CryPS9?=
 =?us-ascii?Q?Xnn88kqaGURKY1orMNd0g2uzswd3AGXMAtDH+h6lw69wWl0GHAaXGfAwJhwm?=
 =?us-ascii?Q?0rG6SH6XgySMTx8YtplYqnMEOm0x/UYXEnGqtCDfz2CXAGNT9hzJEwM/fR+k?=
 =?us-ascii?Q?tLQuS7uvCmwJwGWK5wx9hJ+hPccWNaLUhXkPCDwQtl9urtqA7eR0gRwX0lbW?=
 =?us-ascii?Q?1GgiLsZLPjKibx6PdMzkc0itp43ZhvniEI2j82SlmaAAokrWmLZ2Hdkmosj2?=
 =?us-ascii?Q?+25OUUvn4F3JU6Gc0mxmga8uZG1SNcTdI4IBAMp0zMfzw03BVqoF/LcNtP7c?=
 =?us-ascii?Q?dej19jq+DxZ/3NXuRA1lvr7nKmg21pYZJa0j/Nw0AZ/pJBizaciZTKZ/QHA9?=
 =?us-ascii?Q?QoF4iWdovvkRW1h2y0T0XppIFigVTv7lpZgjubK2OlPdS6AVOZ+H6TfXOuQg?=
 =?us-ascii?Q?GUqCtwT3W2co+ZZTB0P2o/ixtM9SZ1SzsJLnrihRl/DHbjdbmEv/uSwvbOUA?=
 =?us-ascii?Q?kyZNpc8UsDfe02emyT4PnMY6UF53BBdnG5KtsYnB9dgqZZUKHcf+wHatejD2?=
 =?us-ascii?Q?Bj8uTSeBvRWcoBel8M0IKmxbilMzeVCrUgKF3zRCkYwwBT6gqqyCbjmsSpWi?=
 =?us-ascii?Q?Cv+CpYjW3GdQNoZyzfQCllkbBnucYZR0t4IumkPmy3C3yLnsHyUo1um5ohal?=
 =?us-ascii?Q?BenonzB+ewFDTX0o6+67w5Z/1Qakvia59K/dG6vlFnQrIv3sS8ALmirgZBPi?=
 =?us-ascii?Q?TtYmz9qXgrelt9lzD1KCQWOgvmPtHxx4N7ndLX/MsAiMON1nHt4qxWD8V6CB?=
 =?us-ascii?Q?j/tj4AK1NrvuDRup2htQy6y5hw9yfb2Skl04Fei5bvvQ0HkldaZKqf09IaC9?=
 =?us-ascii?Q?PcYO7ioq4HCAz7zl1WcziLHPwIjqVamajYVESRgDDFlz2/VODotyQSeVxGdl?=
 =?us-ascii?Q?fOUtdmUUXzYylUXoc/ia7Rz1oNmkCCvKX1J8TU6eyN6ug8KF5Vjo9BaFWGNI?=
 =?us-ascii?Q?slDN9NxJvYVhj+VWQg3Xa7WIinyao8s0D5lD4bTvsE0zQDpPWXfjrEIajW5g?=
 =?us-ascii?Q?EYDYJ2jl+DTvGmoY8YJUJrOemSXqWOIx+lKCsaO72UeWEBxIoEfzEXkuxTVq?=
 =?us-ascii?Q?4lKZRu803EcBCHQNMIdYPSJSpv4TOToUlF982tZJTV65PRyFnePtZkrXWWRf?=
 =?us-ascii?Q?m4W3HmyMaoLGVvdtr9uPtrSY5R1Maxr+QyuqNNQjoVDn9ZQZpFs4zC93B+HE?=
 =?us-ascii?Q?XXLgY1s7EatE1CxfWuLQ6Fhy3+eLoiwfAqNlpvXQeJo0mBCAOkhkT1I2EIAD?=
 =?us-ascii?Q?ktTlxpSd3qbrsRnaFzO7OLxQ1fcnGfP66aDtQrvtCQeu6BTBrjv8DjzszY/Q?=
 =?us-ascii?Q?GvPCLaicgZ0ij1ZOM7ikIy6K6wa1h9J/vJkyP035wz7vQtTdJTJJ1S5pQpnE?=
 =?us-ascii?Q?Iw4AdITjIz3GWJqqY2cJruUrzr9UlQXJyKrJcD8GXa69M7WqJ6zfSXVmHZVl?=
 =?us-ascii?Q?CzXL4Wj4HxqUkuB2fGkVc+HXgf/I59yH+5BcO7WMOZyxTMfa3dGMH/CwLJMo?=
 =?us-ascii?Q?+5fqVI++1tXmBQwEpcqCpMYkewS9grpoLPB1s7JEzrBM5XxHM7WN0TxYTo99?=
 =?us-ascii?Q?GYwrGjpVm24G+tB3A7gCzxdkK2xkFkc19n2VL1Iv7UKuYh23rG0UN7+KN11z?=
 =?us-ascii?Q?grLHPvaG/vtwR9B6F10hf6uJAiJ6bX3b2gEESZt3JWO0jjzAdyBelWQ2v9e+?=
 =?us-ascii?Q?1usAB6rHva/bGrz45nUdpl/qpZyclXTvmiSq8wcI2Zbb3nZ9XTvw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f258d5f-aa01-47ad-9cdb-08df17cda28c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 10:46:47.9930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m5mT91Yqdt3kNjGoy8yQa3IgO35vlNMWafweJRsyte3YJVVHRNKI2xMYJrOGrKDIFkM2xar9cwhJvA7fta4ki1bkHUzi1QMCkcqJEpXgvGkJmMI2oby4UaSrQrxFMNGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11198

From: Chancel Liu <chancel.liu@nxp.com>

For an ASoC component, component->dev is the underlying bus device
(I2C / SPI / platform). Its devres lifetime is tied to the physical
device's probe/remove, not to the ASoC card's bind/unbind.

A card bind (snd_soc_bind_card()) / unbind (snd_soc_unbind_card())
runs the component .probe / .remove callbacks, but the bus device
itself stays bound across the cycle. Resources requested from the
component .probe (or from a runtime DAI callback) with
devm_*(component->dev, ...), or allocated there and only released when
the bus device is removed, therefore outlive a card unbind and
accumulate one extra copy on every bind/unbind cycle.

Each codec is fixed following one of two principles, chosen by what the
resource actually depends on:

1. Pure hardware resources (clk / regulator / regmap / GPIO / board
   description) only depend on the physical device, not on the ASoC
   component.

   Their acquisition is moved to the bus probe (i2c / spi / platform probe)
   using devm_*(&client->dev, ...), so their devres lifetime correctly
   follows the device and they are not re-requested on every bind.

2. Resources that genuinely depend on the card/component (they are bound
   to the component, or must be torn down when the card is unbound)

   They are kept in the component .probe, but switched from devm to
   plain allocation and released in a paired component .remove:
   memory (kzalloc/kcalloc + kfree), IRQ (request_irq + free_irq),
   delayed work (cancel), wakeup source and mutex.

While working on the card re-bind resource leaks fixed in
https://lore.kernel.org/linux-sound/20260913101531.2787654-1-chancel.liu@oss.nxp.com/

I noticed that the same devm-on-component->dev pattern is present in
many other codecs, leaking resources in the same way.

This series is the result of code analysis only, based on the same
devm-without-remove leak pattern I confirmed by repeated card bind/unbind
with wm8962. The individual fixes have not been tested on hardware, as I
do not have access to these codecs; review of the resource lifetimes
is therefore appreciated.

Chancel Liu (21):
  ASoC: cpcap: Fix devm resource leaks across card bind/unbind
  ASoC: da7218: Fix devm resource leaks across card bind/unbind
  ASoC: tlv320aic32x4: Fix clock leak from runtime callbacks
  ASoC: twl4030: Acquire board params and hs_extmute GPIO in the
    platform probe
  ASoC: es8316: Move mclk acquisition to the i2c probe
  ASoC: es8323: Move mclk acquisition to the i2c probe
  ASoC: es8311: Move mclk acquisition to the i2c probe
  ASoC: es8328: Move clk acquisition to the bus probe
  ASoC: rt5640: Move mclk acquisition to the i2c probe
  ASoC: rt5616: Move mclk acquisition to the i2c probe
  ASoC: rt5514: Move clk acquisition to the i2c probe
  ASoC: rt5682s: Move mclk acquisition to the i2c probe
  ASoC: max98090: Move mclk acquisition to the i2c probe
  ASoC: max98095: Move mclk acquisition to the i2c probe
  ASoC: wm8985: Move regulator acquisition to the bus probe
  ASoC: wm8955: Move regulator acquisition to the i2c probe
  ASoC: es8389: Move regulator and mclk acquisition to the i2c probe
  ASoC: rt5677-spi: Free the DSP context on component remove
  ASoC: rt1011: Free the bq/drc coefficient arrays on component remove
  ASoC: rt5645: Free the hardware EQ parameters on component remove
  ASoC: rt5514-spi: Free the DSP context on component remove

 sound/soc/codecs/cpcap.c         | 74 +++++++++++++++----------
 sound/soc/codecs/da7218.c        | 49 +++++++++--------
 sound/soc/codecs/es8311.c        | 10 ++--
 sound/soc/codecs/es8316.c        | 14 ++---
 sound/soc/codecs/es8323.c        | 15 ++---
 sound/soc/codecs/es8328.c        | 13 ++---
 sound/soc/codecs/es8389.c        | 34 ++++++------
 sound/soc/codecs/max98090.c      | 10 ++--
 sound/soc/codecs/max98095.c      | 10 ++--
 sound/soc/codecs/rt1011.c        | 30 +++++++---
 sound/soc/codecs/rt5514-spi.c    | 37 ++++++++++---
 sound/soc/codecs/rt5514.c        | 23 ++++----
 sound/soc/codecs/rt5616.c        | 10 ++--
 sound/soc/codecs/rt5640.c        | 10 ++--
 sound/soc/codecs/rt5645.c        | 11 ++--
 sound/soc/codecs/rt5677-spi.c    | 16 +++++-
 sound/soc/codecs/rt5682s.c       | 12 ++--
 sound/soc/codecs/tlv320aic32x4.c | 94 +++++++++++++++-----------------
 sound/soc/codecs/twl4030.c       | 63 ++++++++++++++-------
 sound/soc/codecs/wm8955.c        | 24 ++++----
 sound/soc/codecs/wm8985.c        | 34 ++++++++----
 21 files changed, 340 insertions(+), 253 deletions(-)

--
2.50.1

