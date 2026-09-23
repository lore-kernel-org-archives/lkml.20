Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013012.outbound.protection.outlook.com [40.107.201.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC8246F4A4;
	Wed, 23 Sep 2026 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151746; cv=fail; b=QV8sDyn9M9c3ioNEn4YLjhjTkYjkA0LgTHD7TQVJdwi+sCN9fVMXkcBWbaLYub3fepATqa4Wkv0Ldmp898dWlpimLlRB4+y4ZskDJteW7XiG29+qLA1QFiPOn5RJLL4tqq+zWsstN8wlI40+aVE0578iJtRrt7IH7cxAM3s1C94=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151746; c=relaxed/simple;
	bh=xHcVdCOfuO2pFhh6LkcnseOgHGQt5PGXE1C9FWmOVmw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mySKs2Tr303b+0Nb8/c0JG2pWNbOokRbuIttECfwfZfss1LmXTa/8yRYfr06uedJ1GwM9uaa9tHoJllUa7ne++jMbdA/p1ccmc9HLyuPaot+a7xyPEPLFL9NSl/3wb+JyHZcWYPinR7bQqbbon4uj556hxOGfCHAfzbZMVQoy18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=VUC+zE5f; arc=fail smtp.client-ip=40.107.201.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="VUC+zE5f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oW7vNiY+Bwzi7XtaviTqFOIv4Hxw72pPvzUhzUd/xn5q+ZiALPk3j9EWj8LcjtZalFcTfTUqmPMFtEurgfR/UtsGFK++EqcbAzGVa+4fe2+3uCnuu6XoemdwqnoT6CM7j9Sh0WTbTDCvdz7VOfDTt5P9GpCxAqNsO6ycrZWd1NQWo1sNfG8yg7otDhKE/6BEP9/QQ+AtpOYipQpxW9G8iSHwYTBvZSdv01WpFYSFzdMzaK1daGHNXslBTdNLRblTxJrTGlXYqthE7ngWxsi4dWqHe/gUTXgYyJBMLFoW3MLexHx+3Ktvd3aJ7FrZ9dbtRmDLhTUu5c9Vgc6tRnmaOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghWhbARUKNGT40tYrUbRDYy1kOzSsVZxzs8Ldqp7C9g=;
 b=j1Ytc7iDPb/xs1+uzYBj33GecmSqohw+vGCgYIldmHMi72ovSi3hXwCvD8uOtDe8EomWJKh8hFW7NEo7JHfgoJnHaUlWdhLI5TlRedyYkRQI7DA26PLKeIPveHstI2ludLiZdO6FDhy5lNdfxt3wmx1Tqty81pCZDdHvqzlU40jIbHsOkrgLqescBOhk+qo+sW9cJV9pI//HM8zXM8Wulx14JrLCoVUaLpXm+F5K5nv2JdvrKYbO7/2RY5gEIw5zYc28v2LnXgGqUcrR9xBzfFEKkxGdhVH0f6kOI5DUr878crY6n/MityVBUzHKbgPUhFXmazAlZVJ8+9H/vVgvgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghWhbARUKNGT40tYrUbRDYy1kOzSsVZxzs8Ldqp7C9g=;
 b=VUC+zE5fr14dSNHhWiBz3trMUa9CIHdQof5t+7+jkMA80ojn2q8kz2014Pxjgb776huYzFbxnFT4nVCrW2cpzXd/El6xH3PYsIQ2Rzzt0+/EFp3UQtz7+r9UEvDK0zWRU4oleHPagDe+faz+4TL33q4qmW72/0TYZNydqrDMp/lYg9sCys/EtT/hFE3ioNPiYa9VejYhgdKXa2GGxIwhd68JdP23eUZn6Awj0irXEMw8N7Xql4l+xHEK3x9VXf3HTacIrR7zyJ69YnWFLwzKLyZsjbFaOVWUj9EV09ztRKx3XMLbPUaU3w0VMnGLbrc0fq7d+lgA1iJ9MPv0MD8A4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com (2603:10b6:a03:2d3::20)
 by BY1PR03MB7849.namprd03.prod.outlook.com (2603:10b6:a03:5b4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:22:17 +0000
Received: from SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01]) by SJ0PR03MB5950.namprd03.prod.outlook.com
 ([fe80::53a0:bf93:6b6b:de01%5]) with mapi id 15.21.0428.015; Wed, 23 Sep 2026
 08:22:17 +0000
From: tze.yee.ng@altera.com
To: Dinh Nguyen <dinguyen@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] arm64: dts: socfpga: enable SD UHS and eMMC DDR modes on Agilex5/Agilex3 SoCDK
Date: Wed, 23 Sep 2026 16:22:05 +0800
Message-ID: <cover.1790151203.git.tze.yee.ng@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To SJ0PR03MB5950.namprd03.prod.outlook.com
 (2603:10b6:a03:2d3::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5950:EE_|BY1PR03MB7849:EE_
X-MS-Office365-Filtering-Correlation-Id: 02a05504-0ab8-4060-513a-08df194bc6fa
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	yCmR3JjFIzgsEOQXcLdZT8G0TN2ZD07wkq6dYEPI2rpFvGfk2x/HHGM5ycUnl+venVRztZJNOeNTFkumRHwf9jpUFBuiiJw09LXx6qAb4mL7U5G9RH51WTQ07vcJ4kUOWcAwXdocJ4e5vm6Kku9EoWPBZ3uf3/MaWFv5tvM1suQBneEi8ai33BKe+49VdDtQ0CWydULf7vrgLeUXgZNP4f1iLurXYO7QFUCwdFPCsFdGYKvJF/zoigjqp0rkCed3x5PkHredTIdQk0t8oU8qiNKG09T9ONyyAq8HyVfWnS2+60u0XfwQrbt/JB2QYJSLMeSdEH51QDnfMvcchVNzpCHNXSJWx23JfV0RpjipEX/Vt1Q/vTewxn0rvN9bTekR8ht0RAL4pUVFy/9OMM0G21gy5j0oDybexz171M+83SezgDnHJ19yfP/0WGqEiz0wfbXGYlsDBYPa+4ELZXrzJxNj6dg4sIkMXE9Z7bkouQPsK0NNewtB0L3psBp79ZNB+rED0r+dJEX7PM18IjcjdoJ0tbWfPsaMdqYeXHlJdaxriasrq6XYdJCR8nvyE/I0l70QxW59LxbFUz4/mV5zf63BEjUKW7LoumqvIEg5nTM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5950.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o4wmRQq8LGCox6co++ezro8rCKn+bZ4cR3pJ3mYtfYVbPuBLZSO0FaF0QwJv?=
 =?us-ascii?Q?4pVNXD3XGCIL7nBE1OexXLBXm+cUh0C3KLCgzaEXjVXHWY7TawE2uwae19cx?=
 =?us-ascii?Q?quYyPgk7Q+RniRBTGbKmphw6V2AO6Bc5KfZ+yKtEeMxfKjkfkaFsZgvZA4MU?=
 =?us-ascii?Q?UDlQp7Yfqd615jm0O78U9DappjErGp3INsHGbFi6Aku3igM36CcUnRR5ry6a?=
 =?us-ascii?Q?z1rpdJrm1Hwat8q75UZNc34wEleA2Vr51q2OweUstnO6ATAinidxwPFA9XOi?=
 =?us-ascii?Q?7jtww9vhCfd9cMt2UsgSb8E5JJ8ta82yfairYmqxNgR3atB7QMNph+2x/JPK?=
 =?us-ascii?Q?aBzoAqUrNpGS0LoBm3ArLNb4LuMqK/Va9/HLHLwY9CPE1d9bXvTT2EKiDmdO?=
 =?us-ascii?Q?BeXi0XnlAojTIbA9OhCINBTluRfnKv+lIjyqKgyasr1ev3VMN7td9guGpGFm?=
 =?us-ascii?Q?34B4NUEtQNHlyDaUmw0T+x+oXYNTYhwdFFysMw/yjJWt++QX/lgZKawaZKoc?=
 =?us-ascii?Q?q1uyoR6EHQcDYhFWPd1xvp2taUdpQqPhQX4W9VPGdg3MgjNQmxIrBBm3F+My?=
 =?us-ascii?Q?NfBx/k+KJGOvOm1yousVbIkhAWU1LNMCAzc4Gb4RpkXPxtb+XwNs8A3G1S6W?=
 =?us-ascii?Q?J3gx5smIBJZE1/kp5y+fpRq51ZW+JFSQ7diV7qInTQY4BkZMHjYDctF233Jr?=
 =?us-ascii?Q?kZTLgf/oAlgyKnnWHksgKIeH4/HxhV0BkLsEZqZsd8i3QnLjIvHl9YPq3GzA?=
 =?us-ascii?Q?YH7fkqr/1gL0dxHXvchkcyRBuvC4G/x34Z9egKsGIBogfWvwQ7hC/c5AeRxW?=
 =?us-ascii?Q?d864Fe4On8nbcgjfhvsR8p+mEQE0fJhYtRGb6m4wc+cKkUmHgCQIHF/3uIt8?=
 =?us-ascii?Q?4H0mMELh1ljU+BpnR9l+VhrBdIqc1nZWrSXiIBVPsSFUKVXqe8SsGZPA0VTt?=
 =?us-ascii?Q?/MAVSeZHqS+k3wueiz/wO/rXYLMg1Ry43tHyLRtpjLnnnBoOTDJRHU6QzCe1?=
 =?us-ascii?Q?eATMneFif7mh8L0nu66ARNoUHZfmkWv9LFV4rCWNFwJSvHwDU8+KjPNg5a1h?=
 =?us-ascii?Q?Dq4iRKRsfWxkm7LtYAjw+xZiWnpc1+PxVVmruG+YnqGEIG63epTbE4rhwVOo?=
 =?us-ascii?Q?ijb4Fmya1X6RyAXWQ6Gh42Sn2/ICih0K3yM/LA603wpA4AOpPUsxFxKWxyB1?=
 =?us-ascii?Q?pz4Z0+fJwEthFGGbAMYtE0wHbTX0yGGkxLC04jB8PqqgVdYtSkq/tur6GOxR?=
 =?us-ascii?Q?TwmVeaW3U5nsLKbk5GBA/9+UFGKsKVVcCaf2M16lxLvyjFuX4HwNoV/6ajzH?=
 =?us-ascii?Q?5hr/PQ5v86ZREVn6ZbvB/q+ixv+RvgX/gK1RBRlUdBj16N6Kbe4gKYizd8ek?=
 =?us-ascii?Q?1TrOhA+90q0N03IMoSf9WIiW/0kN5fBwEi0FNKWPXkDYTSf4lbD5hyia0bCh?=
 =?us-ascii?Q?kP/wlLUZ43rA1vuM99PHt+BJvwntSEZHHnere7Fxkpry5Xf8/0ZaxEO0o+fU?=
 =?us-ascii?Q?IPvQIB4mHi18xixOnaHAOUnbofYJPRWYlh+f4KZWBnJBw0zBVCksB5Fq8Bqh?=
 =?us-ascii?Q?W7FK/DFeE0aDzOBCv+3TM2y/aRvczrp9HXE5F0P9iXJbxHpo0ALQ5YgfN+JS?=
 =?us-ascii?Q?lYiz7ocf86TJ6seJFG/9GoMtZUy6u1rgz3evgVxTHC29PBRO/qMQo7G/k7av?=
 =?us-ascii?Q?JPiru1d55XoGpEjjGArm2hqBZQM8lPSntW95aEL766YD5KpNDq7u1dfgp0hD?=
 =?us-ascii?Q?1sq1NBcTIw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a05504-0ab8-4060-513a-08df194bc6fa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5950.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:22:17.0136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oIBt/VGOf1wtzVNUtR7L3wAs8EfwGUge6C10VoiPjt0lC/Q/wEs3gKbZS/4RqRFqdotIhNvPvEk3YImL8rroZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR03MB7849

From: Tze Yee Ng <tze.yee.ng@altera.com>

This series enables higher-speed SD/MMC modes on the Agilex5 and Agilex3
SoC development kits.

Patch 1 adds the shared DDR50 read-path tuning defaults to the Agilex5
sdmmc node (also inherited by Agilex3). Patches 2-3 enable SD DDR50 and
1.8V eMMC DDR on the Agilex5 SoCDK. Patches 4-6 bring up the micro-SD
slot (regulators + SDR104/DDR50) on the Agilex5 SoCDK modular, Agilex5
SoCDK 013B and Agilex3 SoCDK.

Depends on the SD6HC DDR read-path tuning series [1], which adds the
sdhci-cadence driver and the dt-bindings for the cdns,ddr50-* properties
used here; please apply it first.

[1] https://lore.kernel.org/all/cover.1790074790.git.tze.yee.ng@altera.com/

Tze Yee Ng (6):
  arm64: dts: socfpga: agilex5: add DDR50 read-path tuning to sdmmc
  arm64: dts: socfpga: agilex5: enable SD UHS DDR50 on SoCDK
  arm64: dts: socfpga: agilex5: enable eMMC 1.8V DDR on SoCDK eMMC
  arm64: dts: socfpga: agilex5: enable SD card on SoCDK modular
  arm64: dts: socfpga: agilex5: enable SD card on SoCDK 013B
  arm64: dts: socfpga: agilex3: enable SD card on SoCDK

 .../boot/dts/intel/socfpga_agilex3_socdk.dts  | 33 ++++++++++++++
 .../arm64/boot/dts/intel/socfpga_agilex5.dtsi |  2 +
 .../boot/dts/intel/socfpga_agilex5_socdk.dts  |  1 +
 .../dts/intel/socfpga_agilex5_socdk_013b.dts  | 33 ++++++++++++++
 .../dts/intel/socfpga_agilex5_socdk_emmc.dts  |  1 +
 .../intel/socfpga_agilex5_socdk_modular.dts   | 44 +++++++++++++++++++
 6 files changed, 114 insertions(+)

-- 
2.43.7

