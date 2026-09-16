Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020096.outbound.protection.outlook.com [52.101.225.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ABC3E1736;
	Wed, 16 Sep 2026 05:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789538044; cv=fail; b=WwqWOAmlApfVE2A1UFdjlNMJ8rvW1xjnL9/k/96hcLAqs2cITtLJgxk8IgMCtsbEjckjm2BH1YwF8VnXrgbj2e6NMR9MSZENn1fjjvdyGQvk3Xj3tbVTA6DwFfhZb7GqIMVIWUUKhLC3Jv9MSw285ZdSjhgbgi9gA2b0aYDVPhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789538044; c=relaxed/simple;
	bh=ssfgFZ+LvoRNmkZGLQPZhQGgV18nuf6UytgZE2A8cH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K+UnRH4N2YndN0xVUXPKHe/hoYqt3adICa9rmn9es9HSYLiFWx/Zkn/6PYP5jhMkvItv5lEq+C8mqybebKSR8gejL3UdRlXlpsqLQfVdOvHOWdu0i0toAKFMYW0bUAedmU721/n5QllWTl7ITfwk965JIaIdAY3UqFUNo7BUt1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iSxZMm7YVjgMpJu+ScGMhnwAMeGhPpmIdd6DKtldiA8rC0lcQ8FsqTtj0mV+u9fntcfaS4BbeRHd5OawuDoCLRq9uqaFP7/aBFb2Gm9++XwxmYHFgpdDWHU1F/gmDGbYiK3CYNL0Tbr8tmfl8GBJU2VWKK+gYdc8DVIn06NUr1qBCPDd8cwAzWMidt4cMc9nOzDYtX83+6Ly2XLmGM2pg8D4uwuJNnXPePW8vlaKrXNOcMJfhXEOgbUCwjvsy6jkpXARayBLQYizuhtt1GZ4BmfWabkYgc6jdKjUPrMd3jwu3h/3F+dZ7gDiIvDPyqM9QK00WZH40nhj66c1nVgAAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RnrmqdUTVZLgPF97PmJ/A9JWGxD4eJKTgxXE4NvmeQ=;
 b=G7umqgh/GXgBhwW8nzHPj1qH1zyblM2N3f/t6RCaGf5WZiT9Dj0kNZS+dj5LLtJjFCBjIiC5ezmqEyJNbhapnquuWWm3u7yNam4D5OXLCDF4eI1AkxVsVjrqkBvgfcmtxDQWQpRCmAwx4SDqXOFx62PB1cRnr5Tjz0poE0aRbtr+tNPshaUuK3N2y4Y1IxnbCqcqo09sYUImil7I24pSPyUl4Y5GAu34YlpYB9rKW3x+zHGAq0Iowzx4RTwe8Ur1Ss4xkVU5duMUuoYC9IKTNfeBNJK4WITI5OXreIZo+op/P06ni4s9p7WaO0r1/dyF+OIqt05JX4ZZ9P93ON4MMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA5P287MB4465.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:195::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.11; Wed, 16 Sep
 2026 05:53:59 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 05:53:59 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
	Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 1/2] media: qcom: camss: Do not link CSID source pads the CSID does not have
Date: Wed, 16 Sep 2026 11:23:45 +0530
Message-ID: <20260916055346.520826-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916055346.520826-1-hitesh@ebytelogic.com>
References: <20260915121536.19207-1-hitesh@ebytelogic.com>
 <20260916055346.520826-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0104.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2bb::9) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA5P287MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7ef825-064d-44ee-ccb4-08df13b6e6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|23010399003|1800799024|366016|10070799003|22082099003|18002099003|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	4NtoJ9hDkEEngEBnS4K52EWoPqM+2N7hLEH4Y/w8OsXUpeQ0wGA8JUH8xBeCh8SHvf99rmygeY+hqTopyvXyOA7xKLnPgSSUNi183YgukXv+2xiPMZjmVnrDlI2iWTnpJljzQi6v2RqMawkhQ7fG+GsUxLK5/jGs+3jRulZoNDKw9ErHIz9poyHdTKywt5TiZFsnNR3zPNJ1uQ7RJQUmG0hRCjC/cKYzfxHbn7M8heYzaMgeygR/SuCh88GBZPeLXEeisPVTl8QkN9DCDhUHQdT2Hady08p5ISV7+jojP71Z9FUJOPl7TPLXDRZpwUZUj/w1qRUfq1eHigqNCRn5hV1IUiY+T+mmWy+GnqPXVgFYQrXLmZpa51TKJJw4F5vBLNGiNoEkN9YrxzBtFO8Rjo0rHSLVPRG8s47vENh31W/nGo0bPBPMcH+QnR2YcQ0nGv+3e0ZPBheemJcgXIDmT3BTLnYfH+G1yvxd07ELbJdqi6O4lB5hrfUOaUCqlW1I4RmGU08I7bevuSnVB/GK+4LXbwSBX6Gkgu0NkNiOu1zA52jdK1xNujHezGeahiMHx0QphZ0Yyc6l5TkoW8MyDgq8HhCLI2UZiOysg5wYHeCWaX62o07JpHgj3hSFMArGe0kN23AwqVmlDLEnQmmTTtl3w+YXo9KqEwGDPNyvu0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(23010399003)(1800799024)(366016)(10070799003)(22082099003)(18002099003)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HobvU+QTOE2oDOU4toJPcko/26+sukOhiuoPlyBcBNLDm1rV/zzcuQVv48Ty?=
 =?us-ascii?Q?yFCoejs/fTCNsN+N7Bx78WplQmTUt3X0467XqibV5o2V+2pKyBwGmn+hz/68?=
 =?us-ascii?Q?t7m6xbdpAOVPbxzEZWSmwHJX7ifFhKz+H3ufd8Hi2qD1+iiept97GifxFVB9?=
 =?us-ascii?Q?L/HoPY9Akem4iy1spyz8X0KTjWL5xJZNPrG1O+YZ7AHWgZEb5i9G6Q1W46rG?=
 =?us-ascii?Q?N7+nreABF03dQSbLcz0sS/Puv76YLw0cO/Cn4cfNHjLVYG/RFjEdVXFy8N33?=
 =?us-ascii?Q?qubNf+kcMxcnbjNMjnuKHyW+3cgof19ye2XOYYktcx10lCEXL3b3tXw7TT7e?=
 =?us-ascii?Q?JJcnuLVKrsS+6oOXGO6xA08SOnX2NUN3ibRbAUmVP5mjNfF5XBNDuEA9y4Ta?=
 =?us-ascii?Q?fKapB8PEEhCxyjnPaBdrQU2TF4M+XEgJu/7y/3sqyJ8g9EmX0TFEO5ieLw1p?=
 =?us-ascii?Q?tmD0UeAg+UtI6Gdl3WB3oflv1zdlEptvQvGyM0y6iQguK+UpXJZBqe2Snt2H?=
 =?us-ascii?Q?s+lplRkF2HNjAIj2i2lW+WM+Orpr4FS3avPpI6lxPxtFRdAlrnZDIlutBNpJ?=
 =?us-ascii?Q?Lbh3mC5rrcvcJYwqqW2O9gPkBeFfSmF8coTot9LBC0k+cDiNRJEl9YIy90+K?=
 =?us-ascii?Q?7DDl3Sv0TEjcIx65cskbNyvy5/9y5aK0tcB9AcZKqogc35RM7sWdhDkKnCqW?=
 =?us-ascii?Q?aiaXHbpxpnnXDs+0tqFNS/8AKQC0kZxVT5hzd+bu2OXwD7CL7sGZar9uxRNH?=
 =?us-ascii?Q?0MbSjqZwrGzLlV5/URwY/yRUFqImlWnRz0f5cuP3DaWMs65n7Y93zqp4xOUP?=
 =?us-ascii?Q?Z9G6RKmKzb1mqoAFLSJTMOHo1MdXwcFKwp/c0s/Ry9E5AY7wYLuz372vejkw?=
 =?us-ascii?Q?p9h80e4LMGLUa4lwskVEAawPJePt3t/BnMJVUa6D+nZDS7m2xyhuMVloKqt+?=
 =?us-ascii?Q?vX0G5YCtJMw2v0yaMdXFE0FqU3yhQ+k5JuMkZnHEkDbyZolFTnM+SS1TVGkx?=
 =?us-ascii?Q?QvKMUBAv6JDIQLSfOCSg3FsX2aV8mYNth2HRX3GjvTY2zSMtZuqDy7zkQFBF?=
 =?us-ascii?Q?wqBganDr8IicNdbKAdRJXH2LuMT6Fy5L0TTQ5YE0dqG/gc+JpRTrrn9L27F5?=
 =?us-ascii?Q?z8jZ2pHVoRRVCXaLWYPhTcbyVpChkb0ErZ3/pc+IpV3qu43WHbz6gc0yucx6?=
 =?us-ascii?Q?R1eWlMa0U9Q+lZEoJ4xPtABu0ADFkC75Zc+pyggSTvfm28hOiewqSfMPvHKX?=
 =?us-ascii?Q?lyNjOVBLy63+JU8q4nrL5sdXMSTQiX33FQhxxpqoog8VCCPoj6JBJoshLg4T?=
 =?us-ascii?Q?B6qKxS4oO9WCrW72jVYoCGT+roqRg8jSan1OtkarTgwYVBUwVgZS5Qo+zp81?=
 =?us-ascii?Q?TvT0TD4JQ15ahJ5ve868QteG16fzuF/hdPcK1j0Y8yR4M9YqOehGs9nIwV7x?=
 =?us-ascii?Q?nllWInsPyJ0krNeCUDezhDM5KrcRflsJtCA/Io9xHhk6yEWTv/7j7nS3WIng?=
 =?us-ascii?Q?Kj335/w7/Fo1m1mH4dfTQ4lwCfA/a7GPvH/wqbLI0x03t5Xqk3mHFTwFipV5?=
 =?us-ascii?Q?MCy68t8NpObnoaAursJKaOSYZNeRv5QsbAFY4AItqfOz7QFC7oy4y4uM5Srf?=
 =?us-ascii?Q?SvNjVSAA+91QN1ftmL01vPUNBvyt3vmATMwasahwRYY4noyRC6GpguZ+nNRt?=
 =?us-ascii?Q?tZNL5ioEEhyPBWQps7z+XbAGQsR6jviDT5Zz13ok3TwSE4SW7mPm/9Lc9IWI?=
 =?us-ascii?Q?j/kQWOQ85PSeVxvhN1Xc+acvwxHcBU5XqJN/pXiq6LIyK45RzOB6fWfNV0rT?=
X-MS-Exchange-AntiSpam-MessageData-1: uuYJps0eiKPG2w==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7ef825-064d-44ee-ccb4-08df13b6e6e5
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 05:53:59.0148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Moyx5Ds2FkH/6LXyRzYGvurElCaaCWE8Vp4/3YEIXNs8vezQG0mK9q8eqrQVBn5G7107BPSOg4hdmOY5gvZoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4465

With the streams API a non-lite CSID registers MSM_CSID_PADS_NUM - 1
pads, one source pad per RDI0..2, while a lite CSID keeps all
MSM_CSID_PADS_NUM pads. camss_link_entities() still links source pad
MSM_CSID_PAD_FIRST_SRC + j of every CSID to line j of every VFE.

On SC7280 the non-lite csid0 is linked to vfe_lite0, which has four
lines, so the loop asks for csid0 source pad 4:

  WARNING: drivers/media/mc/mc-entity.c:1150 media_create_pad_link
  qcom-camss acb3000.isp: Failed to link msm_csid0->msm_vfe3_rdi3 entities: -22
  qcom-camss acb3000.isp: probe with driver qcom-camss failed with error -22

SM8250 does not hit this because csid_vfe_fixed_pairing only links
csid[i] to vfe[i]. Every other platform that links all CSIDs to all
VFEs fails to probe as soon as streams_enable is set on a non-lite
CSID.

Skip the VFE lines for which the CSID has no source pad.

This patch applies on top of Gjorgji Rosikopulos' series "media: qcom:
camss: add V4L2 subdev streams API support" [1]; it does not build
without it.

[1] https://lore.kernel.org/linux-media/20260911062213.195007-1-gjorgji.rosikopulos@oss.qualcomm.com/

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
v2: no code change. Add the dependency on [1] to the commit message
    and as base-commit/prerequisite-patch-id trailers, so patchwork and
    the Media CI do not try to build the patches standalone.

 drivers/media/platform/qcom/camss/camss.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 9bfb02903..0201debd4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5022,6 +5022,9 @@ static int camss_link_entities(struct camss *camss)
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

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
prerequisite-patch-id: 285e8b983e45d4184863e92ae99ebe46bb4f7020
prerequisite-patch-id: e8dce2cee0678cc20446f3a4a286c4a3c10d19f6
prerequisite-patch-id: d0bf82158d99863344c206a543d3e381b24a3b51
prerequisite-patch-id: ddffbfdffba948a608fc556a5ca81b9dabae7e00
prerequisite-patch-id: dca159c5eecf280ea7ce7c67f5da2364c8449759
prerequisite-patch-id: 220ee607579892058879cad0ed9344f6696313c8
prerequisite-patch-id: d7665451d090c8d4684c79736ac517d6c7ddc1fc
prerequisite-patch-id: f297c801f0254862e4fc8440dbd27473a8b78159
