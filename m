Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020092.outbound.protection.outlook.com [52.101.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951E472527;
	Mon, 14 Sep 2026 13:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392886; cv=fail; b=gbh0IY6yZ7lEWbkLSGNwGF86ynx0ulv6ZFFeKulzjTTDiQRsBxVlTMxv/jpbaVsDR9tI5Wmikit5Xd1mcLHI3I7+3Ug39Rs8hjJAcNIzM7FfalFrI1hzUqULrL6i0BHX5YsYVVetDTFsIaVZVA6jV67ro+1obGgE+LAOd7BJirQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392886; c=relaxed/simple;
	bh=YJwWVq2CNUNPCmPHrbeCRebXO/0oPXHgr8pXHMI6OWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pauBEnpOPZ/FQ1NvZyIm2id48qipRs4dzBffauMcD9nCP5TcGAM/HqP/IfVn+xIR7b4fSeD+baJnqResT3smCbSk2CZXfobZo1bxguFJDdAcnXDsBtNRcWBap5LYMIU6FbeuXfeWYa6QZRrYnB7Rh2ed0ErPK6rQLK/MawhEKtM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qIqF3JguZV2lIUiITPTmPmBZ6YtI51PgXaTbtw2M4Tbqp6tW0c6IJtL/ZqKvONzq+l0ylcdqWgSJ/xuz9XXJPlge5rEGH+qDY/raKDN9mxAUw20DRo1oKNz3IjksfTB16QIUiAcRMDEl9dczGVCp4OsMj0TYxp82+U9kH42xAMQ+dCx9+o9IeOLeaUhJBPwZNqZk3/gPotRny57C3GKoOzt3uknWg7L4fhIFPAyNtYABw2fPuV3KlAPvbjOT03bPkNluCJ+z3q4Wopa/nshNvQEyTl/8NvBUhxZOBxl5rXWdOhmJi8yRM8hFcAYWkzINBrWtGqU8utj0CCIdrfglTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bg9rTlNHWVPDpyT5lQgGIzx0WcV7zZ66+/Jr7WxnGGw=;
 b=gpa2/FQHiLA+dH67BTnlGNOtKuskJkE6ZHW5QUpPdzkKLDW1qoI0nKehfGe9PVCUXIjeoMnLfCOE02vCpAiAGIikLvT2qj6lilMu/VTtm13unLl3nI81qZDLwNAil9csn2fXDZRTa4g35n2NIOONZJfZ6S0f1sHE0dfjmELumFfLsV94R/f/BQVUnL9AuGbKty8lKfBZ3bbKuWBvT9w2LoyYPM7ktbnsdsO3ZfkJiJ6JPDKdb2zeAlLqGwZXfIJJWBsY2JIoxuwQNbow6hbXkiBX+tF0OUP8QcS8MzhnUtJjLkARkij55fleDypJoOPPri02fAaUqhDjvqm6Ew1nMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1360.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:38 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:38 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH 4/8] media: qcom: camss: vfe-17x: use the write master matching the RDI line
Date: Mon, 14 Sep 2026 19:04:12 +0530
Message-ID: <20260914133416.1030231-5-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914133416.1030231-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:262::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN2P287MB1360:EE_
X-MS-Office365-Filtering-Correlation-Id: d6423a39-da3e-49de-2d08-08df1264ec86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NA5BlIQFzydpnGPHJOnbn1+XQ5l+a4Tv7skZ5wF/+KkOYZpnH/9iEza9xhbA16ysrje1huBAKk2WCy+HAP0Gmt1r0BeRpt+FPfSbQSKFx7S1IswME8vSnoUGZw6VXUct1aIZbfauZatp2Hou+xKSv4rG8+deDPBnD+LPlir1N2QOCh7KHFyw+9OKl3/aLNdXAOzSpjTE4/r0mUF6mh3aUB7CChWfNF/G9iwXqgm9j/C6Y4OEO7T9DEQecwhfZZXZnKCXGUoFHWv6ybWwoeEIm27reOFMO1i0JnmD5a9dxzpxM+0BFcVfqsO6dwAdx8nmUfSDocwyoR5P/iqu/lMpgxtfR9c5sWtaZDzX0cBMV1/XmbS6AbDp8cA7Ib1S3Tc2VgFUN6r/oxFTk8lLA5GlzKXG/Pl6kq4VsGoaP2wk4HmYvHg3r5241In3/0iKWTkAcvBeceoQqiI4iCF+Fyg/GhkYJU7JqjcZ6lC8QpQXi0FZ9/c26jM/W8ZFVUILr/sp0bTyJdfXYZ77Z8POCnF1mEphgK8F/OdF2Lstmmi+7fs3EwgOeAZpPnr1h5PtdNtfwtZ9wIBlYdb3rF0siy8lcCsgDViS0dNplzmCTXg5dEkQ342vr0RUGjcWIvLndcERvCln69UIcUJ+mWvc1qGkcZo2h0HgZ0PlYfs0KHhklNs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7+qfepLZ948UfdoQHf/K6WPJZlfrSlgidptPbLSMxRFsja4Ndik8+t0KV6Xw?=
 =?us-ascii?Q?neeOWZdVt2r0xRKRxmA0G2OpBjEDufeIhRK4Zeg1lB8peRWFCnvS1kr+V9YQ?=
 =?us-ascii?Q?Ob3dAO6jlBjUQ6jGURv5vsQ5UFMKowxYygPzaJjNYDxnT9iTITTatK26hq17?=
 =?us-ascii?Q?uhLH0v5diRkJMN8a6vKKKDn9yV6Ixb8HmH8kAM3d9tde2JoW+kcIzWwFJI7d?=
 =?us-ascii?Q?CJxpDKkBWloHDwj9gx6627183b+7CwfqYwkG4g7ua+BlMsUhwuu/Ag0AUz49?=
 =?us-ascii?Q?WY+utlN5fa7CngQHsDsO9rWKXx2AHyTF7rDjyPRIFNT+YQCrkNtpskldpg4B?=
 =?us-ascii?Q?DdI7OgvEl7oG3zQLYrHxTm1rPm6fkS77ZEqH5hdFoF6u88uu8FLftIAt1K2m?=
 =?us-ascii?Q?ZRmZRD9XJy9WBv1nMk4Oz/toWyony1M31ofsNZnWFW1MxdKJSUyCkqibPj5G?=
 =?us-ascii?Q?/Y7GdHQSK5oavXXotySgmTy+ZyNCxnEDkWmeoHjz0MPlRxRK2pSnfOaaLizp?=
 =?us-ascii?Q?Bc9YHjdO73M8PWWxUI2WsVN/LyMzfr+YryAAohtMEQLW06Q9pi2eGJdFivrM?=
 =?us-ascii?Q?B11WXRDgQeCoUwiNUqSHjL3wx5Jh0X5Ro8zeycmZnHE21dpaqbUWCIfT5Sft?=
 =?us-ascii?Q?4bnDGjTFczflSPZ+ko9njVe/Poac2N22eNui881v8E9KoOKpTm6fz5KyY3Vj?=
 =?us-ascii?Q?wu5RHBkW2PlqCuTD1znaShz/uOFXWvafIj0vVu0u9M1K8vTFCt59iEy0E7o8?=
 =?us-ascii?Q?+7TKAZDmmvuHztfKq/df+41j04f9jA+E1oHw+uSslAOYxLU4OD1tI+jWaNCp?=
 =?us-ascii?Q?+j4BW0lSuAWDFY2vdWbypA/AnUvtTlIIDfiaI5sEyuVSZ9CS3fM9g8V3ARs9?=
 =?us-ascii?Q?UdKGMV4ZWnqlpWhJlrbt/FvvwSurxpv5gZFR6e4nkB8GaIgWFTT/2vlmvtTa?=
 =?us-ascii?Q?DlbEZKwi+IyrwYhJDHtVIHjDWI/8rb5b1Lb/iTnQiJOu8V4XkZreWOa1qRQi?=
 =?us-ascii?Q?Ge0aHAasjmXOnZKcv1+Eb0wVRGPBOfJCN8+hJjdIOdI2E/2oRc0wTD7B0a5O?=
 =?us-ascii?Q?bOsGxjZHVGKhD0FTOedreXXra4B7KLQhFiFUqGVtAy6Z7c01ksWT1+D4yGeC?=
 =?us-ascii?Q?UzD2gzp5JmaR8fsBhgkTENBRqujqiqouSXsmFH1Kk5Vz7Y2UDTHzTidyXD2/?=
 =?us-ascii?Q?2fhr9ojPtzh+ASIvGdtV1gB5gE16hbv2itDWKTd6lj9dAZpGmfx6KTqUhM6G?=
 =?us-ascii?Q?QFD7reXQOwfYJOsXMb/YpS9epk5EtXOdj2L/HFwyevh1CbqQRLXOqwj6lxTx?=
 =?us-ascii?Q?ihRg/03UXHW58xELOI1lET1Do/izekdP4TWMFVrQmnxFJvt2i4vTgdL7lJAe?=
 =?us-ascii?Q?LyXANMcPDSGbKi9pzTVKKiWufEjsLWiwQMgSUTdaXQkm8IZTqiR9I8mIM/cs?=
 =?us-ascii?Q?l/VkCqXk/1g+YffwRZn0T7P888YMe008r8DUn6Jv11Y2vV56QTPT9SHAb7sv?=
 =?us-ascii?Q?u+szoctYETKsW4PFuxPo0P1bJKbhROfZpQgTYLNdoEtWj+czPItlQggwkIlO?=
 =?us-ascii?Q?HfxlASNkqY52weKYHpXI9n29h87+gRAIL5CZ3siUsnCmahv4WlYGI0UZnsXY?=
 =?us-ascii?Q?F+pYJIYwJwQdYxNl1R+cJFZy/Xq/5XtpVUvPcSjnmb/LmQkgK5i/8jmAyEnV?=
 =?us-ascii?Q?FnapZelBfMnBrDx/OZaCUcW3BCkGLSzyrU3xEYJGyOqE8fssoQPjGX/GetE7?=
 =?us-ascii?Q?XV+1GCANxvKtWYGRsJdj1rASmkLslabkceP4LtzAtLw0tvDB5kRLgE7BaF3E?=
X-MS-Exchange-AntiSpam-MessageData-1: Ie0QG4yFixOWjw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6423a39-da3e-49de-2d08-08df1264ec86
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:38.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raOnZOsGTXdV9kHPTTPjx7u/KOI+1HC1XZazDtJwDF7n2izValk2GGA2U1QKLA9sK1pTJ3cRSP5ibHCvfOQpDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1360

vfe_get_output() on VFE 17x reserves a write master with
vfe_reserve_wm(), which hands out the first free entry of
wm_output_map. That only coincides with the line being started when
lines are started in order and RDI0 goes first. There is no crossbar
programmed on this bus: RDI n feeds bus write master client n, so
the write master an RDI line uses is not a free choice.

The mismatch is not visible as long as a single line of the VFE is
streaming: RDI0 always gets write master 0. It breaks when a CSID
demultiplexes two virtual channels to RDI0 and RDI1 on the same VFE.
Whichever line starts second is handed the other line's write
master, and both clients are then programmed with the wrong buffer
address and frame size. Frames are truncated at the smaller of the
two buffer sizes and the SMMU faults on the overrun of the larger
one.

Reserve write master line->id for RDI lines, as the gen2 VFE path in
vfe_get_output_v2() already does, and fail if it is in use. A PIX
line is not an RDI and its write master is not fixed by the same
rule, so it keeps using vfe_reserve_wm().

This also removes the error_get_wm label, which released
output->wm_idx[0] before it had been assigned.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 .../media/platform/qcom/camss/camss-vfe-17x.c | 22 +++++++++++++------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index f62fdabbc..0cfc24255 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -403,10 +403,20 @@ static int vfe_get_output(struct vfe_line *line)
 
 	output->wm_num = 1;
 
-	wm_idx = vfe_reserve_wm(vfe, line->id);
-	if (wm_idx < 0) {
-		dev_err(vfe->camss->dev, "Can not reserve wm\n");
-		goto error_get_wm;
+	if (line->id == VFE_LINE_PIX) {
+		wm_idx = vfe_reserve_wm(vfe, line->id);
+		if (wm_idx < 0) {
+			dev_err(vfe->camss->dev, "Can not reserve wm\n");
+			goto error;
+		}
+	} else {
+		wm_idx = line->id;
+		if (vfe->wm_output_map[wm_idx] != VFE_LINE_NONE) {
+			dev_err(vfe->camss->dev, "Can not reserve wm %d\n",
+				wm_idx);
+			goto error;
+		}
+		vfe->wm_output_map[wm_idx] = line->id;
 	}
 	output->wm_idx[0] = wm_idx;
 
@@ -416,10 +426,8 @@ static int vfe_get_output(struct vfe_line *line)
 
 	return 0;
 
-error_get_wm:
-	vfe_release_wm(vfe, output->wm_idx[0]);
-	output->state = VFE_OUTPUT_OFF;
 error:
+	output->state = VFE_OUTPUT_OFF;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return -EINVAL;
-- 
2.43.0

