Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020107.outbound.protection.outlook.com [52.101.227.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C348A4CC271;
	Tue, 15 Sep 2026 12:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474580; cv=fail; b=sB7IjfcUS58+0pf3rXkQD9ekij3iBhYJcZb/1lN18ZSq1+wzfbkX2ShR01tptjLk4YJHbPC/v0GGSx9Hi49bWNOKWu8tjSKdt1mxh1g8zcrkqwKM3dEum6i/5SzOeyY+j9DnGgpKugMzlr4zIlV38JsVJAtXnxPg4vtt0EUTcQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474580; c=relaxed/simple;
	bh=7TD/70lop+79R0e+ufkT//Aoe6SfkolZUHa+I/pkCmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cz3270h0xWktH9CEaGXSyF+r/qhtegQJUXCIjvNhbtJacij1TZIvrNWt5PrG7zgF7L0p0EEDhPnF2SBG+reKTZBlG9aJ9EZ190V+xMvQCuRUsbpBRzxoTGY7t3jQ8NMlC5X4ciTGDOFSkZeedhvNfimWpq29EzRADS6Y+gmi+hA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJhx1PnVUQ5WFSxOcRVMfUv6Zs+oh4CyIIqQNn/i3Ub5vbxRjbMSTqb9LcfUPCkrbJJ/XtR4dbzJnSkjK7sTtubCMryohfoRNMrL0pmisfCGFaM73daYa0vxtKa6qjmwp7XFKtYsCZfnWAptj/iS5lV6+sAAJagvVyBxJTh8mk6vOTNg78PKXyX3uZLqa99AytrLCZ2xxtPcecwvaXwWXjeq18vCdcDkVwFHsTD3elJAUPDH49ZPKSjE83Mz+lcZ2miYvaiOqPLStsgGrHIEtD2WXRXgVdaOeX/Clde653qpDAT4SZl4FVIqpALU/u9bhNOW0G4yCKa3gFcSXKqqww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0UOVOlNC+KGK4JyPZ4xfHf4A0mMmYwK1yPJhvrix7k=;
 b=jv9mA2O3sw5dkhKsbHXMQRPrSYYNwUPd9WguG48Dx5EcbawMI/k80wzBtyH51Iq4ZM7tERuTfwuF+vfNoNx0oPLiNYi0FMJfw7T/r5AWHdyk6yn7G303HpZDsWWtjCseSRmzQ+CQSNXifz2xCdZIPjiSSKbiwzypyfxsuzuVgdW49OVjGFHKlJd/8rwAi97LfYAxSdzavzCqqdawsrEPNWpHelgTxjyIGg97cv/aW/pz3FCPuFo8XcoCfB0M+YNnqqETxqt5NeX5CEHYnwBIk70+6/4d7+y/UROApJpAZybiWC0msXp0D+M1jY4Ph+RlkTt7Aggdni7foBQIJE8Zaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MAUP287MB4525.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:18c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Tue, 15 Sep
 2026 12:16:15 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.012; Tue, 15 Sep 2026
 12:16:15 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v2 3/5] media: qcom: camss: vfe: Fix VFE reset while another line is streaming
Date: Tue, 15 Sep 2026 17:45:55 +0530
Message-ID: <20260915121557.20910-4-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915121557.20910-1-hitesh@ebytelogic.com>
References: <20260914133416.1030231-1-hitesh@ebytelogic.com>
 <20260915121557.20910-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN5P287CA0038.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:25f::10) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MAUP287MB4525:EE_
X-MS-Office365-Filtering-Correlation-Id: 794b9c5c-8988-4b44-1e25-08df1323238b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|10070799003|376014|52116014|1800799024|56012099006|5023799004|4143699003|3023799007|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	oNPe64U/uM/K+8xy8zgPz9gI3e63Rv5CGL4VVLQtdwqZuSWG4yUQesW1UWOtvbEwANfhexiTiiK6+40hEPuIhMw6BYjztO46mZ54jkhA4NFkGu9drWMeRlpPs4PZDj1h340FoQ+FtIfjmh6uanVlfsFUeRWVuUCIK7Z/vTZqVjEXuvW3SciOtnMHad+qwzXFnmvD9xKprfoiZ8tQnaNyNXZPBJTMTzUGmnX6w7D91bEXeiLJgaIh7Ewm1gb6kF0x+AlXPGegafnO2d3YN8EGON+owd8ROGVzTvzUtNDQ59TnpjXoMADvEmeniJet5XdSOBeuJTE0bdd0R3VqRCZhYLRwQMG7bj9E+9BBBBo2nBwQkZFjwQztxUMKBkIIskZkpsMOI29o9gekuHqNy/no0UQf9K6gaAg1Bha+LwxV0i6LUxf4ci9ldsWz5OF6EU80UBENxvJZNNhYPaoc4Yt56Nfd2n5Xk93WBs6vKMQnSKyQPJEGGLCQQrLuEpFDFPChf+gyHU7ik1jBeTBUCEgUZbNokGlmcP4WXpQo4eko0XGvhUIdc2Dln2OcW0lh/OJzy5GxfyGugzAQherWel5CDSlEZZrKQFSQ7YXTquGKxdXWpw5qWu+7TXpYkCrfDwzYp4wgLW5QDDOlmfUoKoublMRMrj7oW6GV2WsrmUn+lY0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(10070799003)(376014)(52116014)(1800799024)(56012099006)(5023799004)(4143699003)(3023799007)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l+5aIDm63PxF4TdeSP7u+wdqA1e82EYYZNgkGRDQqSDHORFkPv7kChCCnEni?=
 =?us-ascii?Q?jEEUtbdBqdJX4Nifn71qCET1haS232fyxIrsseHrZd39HmVTzqCLOHAOZvRY?=
 =?us-ascii?Q?hhNqOujgpzqPvx2KpJJ9aNg1bVAYXD/fBTb8mpT00XXI11KMuJlI95m7Cz/7?=
 =?us-ascii?Q?q8WLV/SE9PwCTHnyQuyDd807ice9bQ4FwfR/h+axxvJXaTtcnOvcucoaHOsi?=
 =?us-ascii?Q?j6umaCOoYOXVqXuf1IqAeXITL6z8JCaZQKvAspgtisJUFRaFc0qp/VPFvDAE?=
 =?us-ascii?Q?hryOjyTfbxOURKEnfv1w1gYGgu3wVFpgDigHclMIAWZxBwBGqnHF3TEa6O4j?=
 =?us-ascii?Q?qDjtH31aGelgUWZ80VZos9XECt+AyYcyxfWARqZippmyerK26avUip7CCx3e?=
 =?us-ascii?Q?tl5pZ7U2s2noLuWFKChjbqoyEYqLL2tKYuNtOCNv/Vju0I6BrOL8qDoNwxpa?=
 =?us-ascii?Q?dXKMVCpYjzWRme945JUpC/pYvkPVueMql1kDLKJ7+yaktv3FOXjgAbmUru42?=
 =?us-ascii?Q?jb69Xd8mABL3Sw73ipiBCoaHrKMNU36EwfDWOJuFlG1qgA9/6ft3C9hak6Id?=
 =?us-ascii?Q?MJhAhVre+G4JEwkbRNM8OTnB2X3BeWBz05nYkQIN75BMYtNFZe53obqIWug6?=
 =?us-ascii?Q?+KgUQjvKGLCK5YNiSLOZAssoMLzQSaABjnQew7KCnh+brBnleWfjr/884l73?=
 =?us-ascii?Q?K27dAwcdN1hPQbMoSMOYAk+ZsGVSWgxlGMhT+p1EKMyGux+RebRKYiTmw1cE?=
 =?us-ascii?Q?xTTIpvQIfEjxMBfAaQuk9yPwA+q2urCGWHC8WEzG1e8A6ks4HPXS2KdJ+WS6?=
 =?us-ascii?Q?F7bDcLOH40kNDXladMeSTC54sVsYhM0zcV4btot4Eele6vmf8w+lzbcOYvtq?=
 =?us-ascii?Q?ZierqWu2bEQPG591ThIxvEd4O0s/3xtPXo0a74h8lrP8Xzo8WR50NxZbyeG7?=
 =?us-ascii?Q?iOYBTOPyqtmLKMY5X+aKlCW38C9nW3KmmcR73imK2koyXybpdIsuk5eT9LMI?=
 =?us-ascii?Q?2sW5twu5PyvVFRISCo5xGF1/X6xxTiXWBCo2xP9XiN2QVR95OYAbg69f/tJY?=
 =?us-ascii?Q?Vr4kdJgdRujwRi++j3Wq382NpJOQpsuqEWwEOFMcZen9zmxBFTiOabaNVHzG?=
 =?us-ascii?Q?40NPLlapeYtgUafBn+QW1A4MMdWw8v+EaCZFZD4oLtwr8ciPi++9nQW8qyNv?=
 =?us-ascii?Q?h5q26dlngHaAOKj3YlTK4QTGbDAVvt2noDtYXGObJm47EIG8CBEjoA2seQau?=
 =?us-ascii?Q?bTvRyFQc3xif71PyIvf4h3eZaVQhfGlUP6NqIksJTXKMyrtVc+3sqRHCmnn/?=
 =?us-ascii?Q?E/PFZdhjxxK3t5UURYKnp5hFL1lDqWWZorsopYzZC894PbI4F64zEeoiquwQ?=
 =?us-ascii?Q?j5s9FriuFsqjYqVmHILiYSnId8MGbL5QbFAhc0g8cnWGpuNCfsd5rI1XAfF8?=
 =?us-ascii?Q?5BC3+EJaMXl4H/0lXc1852fWtAHqOcRQ5x4toyzL73VO+mpuYiAsMM/8wvsl?=
 =?us-ascii?Q?XBMS8L5mXmbeI3Fp2QJQjbfi6SVlJA3ChFT/KITwRtO2laXq2UUTANcoeEgs?=
 =?us-ascii?Q?p5JeX30GRRrTPQW1TZjx6bd50ILq4QAmQJkwxva7p6Rsutux7rFxr6j3GvTm?=
 =?us-ascii?Q?fxo5/H4r9fGH/CRzH+dvv2oB+4K+Zu8vVQD/lef33rfclVt8as8QrTpYw/Z+?=
 =?us-ascii?Q?PcPRFHuD3tUwcTLBpDeejTgu+R3WH4S2FwiRmbRBfeCDhnBS9mZ4HWRguPqm?=
 =?us-ascii?Q?bOJ/P/80/D5hBmDvbvMeAm6ve9DbB2B+uzAYY4inUIH1gfHmB1xDZK+voiFu?=
X-MS-Exchange-AntiSpam-MessageData-1: 4za1mL2CunGhNw==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794b9c5c-8988-4b44-1e25-08df1323238b
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 12:16:15.1773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuzHiw2pbdv6HuAad9cUSfAm+UcDDuZEBzL1AJHK//zU5W2shTBSGYna7L/W/vQlR2VbPO4HNP9mcDLk/IWenw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB4525

vfe_disable_output() stops the write masters of the line being
disabled and then resets the whole VFE. The reset is not limited to
that line.

When two lines of one VFE stream at the same time, which is the case
whenever a CSID demultiplexes several virtual channels to different
RDIs, stopping the first line resets the VFE underneath the second
line. The second line's write master configuration is wiped, the
buffers it had in flight are never completed, and the VFE is left in
a state in which the next global reset is not acknowledged. Stopping
or restarting the second line then fails with:

  VFE reset timeout

Only reset the VFE when the line being disabled is the last one
streaming, which vfe->stream_count already tracks. Stopping the
line's write masters is enough to quiesce that line on its own. With
a single line streaming, the reset happens exactly as before.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d19158..9cdf26671 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -814,6 +814,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	struct vfe_output *output = &line->output;
 	unsigned long flags;
 	unsigned int i;
+	bool last;
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 	for (i = 0; i < output->wm_num; i++)
@@ -821,6 +822,13 @@ static int vfe_disable_output(struct vfe_line *line)
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
+	mutex_lock(&vfe->stream_lock);
+	last = vfe->stream_count == 1;
+	mutex_unlock(&vfe->stream_lock);
+
+	if (!last)
+		return 0;
+
 	return vfe_reset(vfe);
 }
 
-- 
2.43.0

