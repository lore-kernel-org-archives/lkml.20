Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021141.outbound.protection.outlook.com [40.107.57.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECBC4825DE;
	Mon, 12 Oct 2026 12:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806765; cv=fail; b=SngmcR4Vq3OfdHf82vPpmSWHqEXsXSd1igqwHdOL4FgDLhAwORCu+Kl31rsTmTU52VRpW6mcaXUlJZD5pAsU4FSn0UN/zwZyA2a7yIAPckc4Pq1xrmY42L+2LpmvKxLzTLiiG9wdfKK0dl5hRwyEvVLVx1zUeXre7pPso/L6K3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806765; c=relaxed/simple;
	bh=CzpcgKrgxbJMWmObGMkT92nKjmTQ+jrcNCioXz2sPBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LPR2ag4/+ToQNEBJxKtBIqCLS5Vi+gy+3nySYcAiuiEQwozEqUno3C/fFzMsg09QkOHEbrE7eK6FDIKL5grXc0ZLydKLkEV1IF3aeo3lkTG6n1WY4pE1oErSL5tn04uAZ4Up7ovmLE5jHqstKB/pvcsZGPZIPPChstootq/vc+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.57.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vn8wEDVRCM+nZLNMkXQrUvuKnfeFVIVd4u8dP3gVOMCDwfbJ3pkrbGCfokdGUjFPTBuUklwdU7WscIMzrGdjvsbsabuq3+nooZO39MzeulD+K7wVxb1CobctpNl9lQgSzE4i8ZhlSe6VqKSZy9aFaL4ugbZcO7qQQr0jIGyl4X4iD7ODQOYgKOaRjwuMAyZ449CLTINkDJVWJB8LgxZz2G/uRCeW8BUpnzMgfG/Og5PsC4ewHzSoFo1PYeAY186uRkMV1YaN8aeogdU9DWuc3q4IOE40v2kfq7AnVxxuFKfPtGPLfqt0sACg2rHdsOYXjyZKna0WmW8RlH6H7cVAsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvFfR2URAFIUF/lV+6LIrgRLtDwMCAVp1KWThQLN6qg=;
 b=r2pn/kN75wULDf/fLtXkPxQewDRznOUhbEf6MbxG/BSHAb7tr6/WEZskhGgAlR1+Wpx2+s6GK5DP9tF2C9JoN24UaodXeDGmiPFV1UDNyo86mfJIt65pC4PcUSgFVE+meIxL42qId9lHALmLPPD0gBA2wCx+r77bxOYyqAT8ET63lC4zrE529yA67ayz74eYO8m2Bkr2kEuSXCJrGmiwSJhJHXmIZ6KRd+JiKb5bQ95tKU9+ub3SQhGbOcD8cbHDpvmSKhfx5C3+g41BwD1tJ/4mtAOKZqQO4d/3Zn4XI8Cp+DuqPbMS12UokC+18dLkN2FjHU97gMWf9xB/ZbP/uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::104)
 by PNWP287MB6007.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:343::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:05:58 +0000
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e]) by PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e%3]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 12:05:58 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	mchehab@kernel.org,
	vladimir.zapolskiy@linaro.org,
	loic.poulain@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	atanas.filipov@oss.qualcomm.com,
	jigarkumar.zala@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v4 4/4] media: qcom: camss: Do not link CSID source pads the CSID does not have
Date: Mon, 12 Oct 2026 17:35:42 +0530
Message-ID: <20261012120542.1140157-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012120542.1140157-1-hitesh@ebytelogic.com>
References: <20261012120542.1140157-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0057.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::26) To PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::104)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPF076CDA63A:EE_|PNWP287MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: a5bb4b10-9797-4796-5537-08df28592ce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|376014|52116014|7416014|366016|1800799024|22082099003|18002099003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	vZjCC/3K0134NKSDuwkRBhKRQawVpoa/zsCcI7CdQvmeMvPDD4uAbFAbWRai1rxGBaAFUzlceMmB663Uia0K2xBM/rBVw+DfrWfNbUlwWYPqP6KGPJtjoYdbt9WJkkytDQW/i+LPgQG34o5MVrT+UtYQsCQlb5a+PyKa2heZuElS2xLSwwDCnZf3cJVruA0RnweUeqlsl4xkelExMgNamyAH6gzXtf0aubXFDBQ9EV0C3GgP8oePuDPj9KXjmU0Zne5Hz7P9iuUxeGU2Yol2swFDr/hOzvN2Yx16W9XFRDRCeGXFIzyl8khEAnrT5ZYuJfxysRvU0qg3aLK9aBEHTy7FzC1A0nEaNiPK8hgGyJvGIvCkmz85Pr2sGk17BI5z/C2Y2n6NAXVZYQepMLwnRCVBIc/Q7cWcLaTNKpwQHKbs32SW3vYIpaOpaesUUvTL/xOT/ZMxmGhGU5eCWJ24GEe3eOeSBJ4li9D8m2Fx0+QI4G/wzqIo/ibX5zGJWZudNGCF9LVfHELFSqJ0zPtEd3+VgdLzgUbC8yn/+vKPSAiK5iyfTLoj3KaVs2RpBNAK/+gOUM+9pmuyYliWz2D6d5obuZhC916UQ/bLghunir1DduBRseyUdEMgMUkHsF73sBGmwghbaMoO0b0qo+WUe5E1p+Z2QfxCxlzNRvZ/RDE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(376014)(52116014)(7416014)(366016)(1800799024)(22082099003)(18002099003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LWejfwnl9aZFAR7keQvSFriM1Tn0JOEKKu/bzy1tbF59z0e1dv1LDEGkczZk?=
 =?us-ascii?Q?AO0ijLoCLQajFlkw692c//NCzSqi+HTj/vlu2FfxeSN+f0WmSmxogTPiB0fo?=
 =?us-ascii?Q?7e8gGqgwd3hj0QLEgL7cM5uXL0HCjaa2keGBiKtnwA+J8D78Q/FGSaULsxlt?=
 =?us-ascii?Q?0bxMRbR6Q5eL1MzHpc+yWbEPgX3zRX5GMkiSyd2c+/UeKnH1cZbLiaQFHciN?=
 =?us-ascii?Q?cnLzqLGO5BiYn5oDM2ij5PxnQtzgI0lKiodWpvkUm/ubSAL6h4vf0m1HGdq8?=
 =?us-ascii?Q?OqSXfPcnFyHL6U14Wx0IiL7G1KMj8wRa5EcL/O5LaN36kQXlhyb9Hw/1ap1k?=
 =?us-ascii?Q?EaVK/oLMKoXMd8xtbIdjiYvOHMUeqXajaA4IKqJGFQfu5jvE3JJeLmob0FXp?=
 =?us-ascii?Q?4AYDjBV96+rO4mbu1OMLcZyorJ5A4EQUL5QmlQohk8zFmVeUc9bO3ZligTgo?=
 =?us-ascii?Q?qv4ul4xC3yT+IL09huASLJzsr6ZITkaZN1NewOnoabsTVlEVlLLXHrKIy9x/?=
 =?us-ascii?Q?U5PrN+Fa+UEGWP5VmcVmzVh0euUEuXz1qjnzhEbaSe5rCxCiXX/BWlS749Ij?=
 =?us-ascii?Q?q1JVvNlPa/qi8NwCZH9Pp5aA70TvKQRmzmoQlnhbHvLoPlgW63/T4h8dCfQM?=
 =?us-ascii?Q?WgLeokdVrEbb1jlbrAjMAVAD5KM75ftZzYCdW+jh2JbbSmWBphXug78sf1E4?=
 =?us-ascii?Q?o91GhhgvLUhnyOvY//fvUSH2+wmkykPMG07AlPLN6iC1BKnn5XMRIj7QGtip?=
 =?us-ascii?Q?FstecWm6r0+zkvpBgvc1GzP2WeOjdIzrG/Yx1A536dSPEChObMwyM3kzSyBm?=
 =?us-ascii?Q?s7CzfwY5v5HMY/GSRRDZHp1PUERVozHK4DM48KnGP8llO0CEkrsaP02+1HvE?=
 =?us-ascii?Q?iHDIL93BDJtt4nw0UTdGabK5wEeAsIpx6RfeHl+2hFncYPe7QkVVmPOM2jKw?=
 =?us-ascii?Q?/tY8Ml3eDcvSBozNX+8QajVVXyS0/NI0k+1bLsTQHTYGcjv7Zq/bAH94q2CE?=
 =?us-ascii?Q?jyMWMyeGcVc0TfsKB5KvQUjkzpwgMswoMx/FWZ+nbtQgiA8zwYVyfKr1U5Ow?=
 =?us-ascii?Q?SnVf0BAwJgcROUn7Su55eukg/mpuUdOB3SpopJa9IXl5BR7UzjNJvMwim4mi?=
 =?us-ascii?Q?0zjp0lOtjB9ya3zH+uHkU/du0rMnEahtTvJIdo4RuTGWns5JjgiXCocnMYMb?=
 =?us-ascii?Q?nsd2XSpFFdEmnT9NpIXbeRxlCdjk0rHzBSaC2eYDBGEASl5RF+Uk+L4Ur/yl?=
 =?us-ascii?Q?CnyM+SVrwcwTsglqSuvH/wzDr66Tf41fsjYT7jUwl5Es5HfweG3vTPY/Lllb?=
 =?us-ascii?Q?cDD9UDeS/amGAdW6mT/h7mapw0zGmyJJ3cDH3BOCywIzUfMVS5s1lsrhKyKc?=
 =?us-ascii?Q?PIhbsK+e+Ux1Ot22XdUpojdD6fPBUPPJvYPdBPZyksB0xlmvCDjDWl7kQIuW?=
 =?us-ascii?Q?cD4bcpJVu7VOKTB25LaMwW90HNGFpL+FtYKpWn7t+VrT6j8ms6kSgSmxaUXW?=
 =?us-ascii?Q?GDLs/DbAvxMO5ra+qJoBunlwqXXzEQ9K2rD/9TlustmW1fwjWP6PtjzGPWUF?=
 =?us-ascii?Q?Ob23DicVFwG81JdU3oUSQamIwyrxJsvtfDsUMzxoB4dT0t+7h3VY4UOtms7T?=
 =?us-ascii?Q?XUAT0+W6K/9Cl5Kp1Ost+T27WRULDgc0npxUULXVaF7pBvm/QY8554Z6E/BX?=
 =?us-ascii?Q?HzNxONLd9bkrMCXjfd2+5n5XgUmPj0PxTU61k+DlVdlwvKXMpaVUEZOQyWmh?=
 =?us-ascii?Q?QkxzYCVV9uf39FV1QCpbubeq9AqbKGp9ZG9l+XydZ/9q6boQljARSq9mWSjk?=
X-MS-Exchange-AntiSpam-MessageData-1: yS3hlsp5Ba/j3Q==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5bb4b10-9797-4796-5537-08df28592ce7
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:05:58.2089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8StbKX55L9YakteDvoPA4wPDWCaHIHeVe/qDGirOoRnvnfiQfqfu3YvXjuAEQcuqpk8jUpQaxW0do5z6yy4lIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNWP287MB6007

A non-lite CSID registers MSM_CSID_PADS_NUM - 1 pads, one source pad per
RDI0..2, while a lite CSID keeps all MSM_CSID_PADS_NUM pads:

  num_pads = csid_is_lite(csid) ? MSM_CSID_PADS_NUM : MSM_CSID_PADS_NUM - 1;

camss_link_entities() still links source pad MSM_CSID_PAD_FIRST_SRC + j
of every CSID to line j of every VFE. On SC7280 the non-lite csid0 is
linked to vfe_lite0, which has four lines, so the loop asks for csid0
source pad 4 and the driver fails to probe:

  WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
  qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
  qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

The pad count depends on lite-ness, not on streams_enable, so every
platform that links all CSIDs to all VFEs fails to probe as soon as the
CSID streams support is applied, whether or not the streams API is
enabled for that platform. SM8250 escapes it only because
csid_vfe_fixed_pairing links csid[i] to vfe[i] alone.

Skip the VFE lines for which the CSID has no source pad.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a9bd79ca3..4b73f8862 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5028,6 +5028,9 @@ static int camss_link_entities(struct camss *camss)
 					struct v4l2_subdev *csid = &camss->csid[i].subdev;
 					struct v4l2_subdev *vfe = &camss->vfe[k].line[j].subdev;
 
+					if (MSM_CSID_PAD_FIRST_SRC + j >= csid->entity.num_pads)
+						continue;
+
 					ret = media_create_pad_link(&csid->entity,
 								    MSM_CSID_PAD_FIRST_SRC + j,
 								    &vfe->entity,
-- 
2.43.0

