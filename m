Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021111.outbound.protection.outlook.com [40.107.51.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A606308F39;
	Mon, 28 Sep 2026 12:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790597734; cv=fail; b=J53Dl13VQXAmAmtQcxWaSGfg10UOJCgDeiePED0nhQI6YgsS8iC08Cupj9VgyBg55DiE8NNYHXpcKDq3pPTD3PM6MS1eqq3RsLFBFC5sRUK3BGC/RE6+lM88kq2FjXC/Io8988qw8f0QJ8sZI4UXGDVvGR/sLCOBVMNCjudnkrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790597734; c=relaxed/simple;
	bh=FaSoNwEjQKpg8SIGxCNfXW8MQYWs5fWKCIga4GH+zEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cEf1hI8FBG9NjKuZfuWyY2IqRf/RzQJDOdDAhuwFCrtYiXCa3akHudaoipd9UxUiJIkNGqVn9BJzkVAmXACEgNafqqMfRPxokGs9VoNzVixPHU0LLqbuKvFxwRqu4WnoNKorpyE89eVrnj+s542jZ1TroxuXyRqL7yKV/skgb+w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRk28ctCtQu0aD80jhf17bzUgDe3OEOCL19WcN80diXYVm7QBOVgO0po99EM1mTj6iLoxE72b3mxN+BlSNCFtG220C+mkt+z5C+hvzy80QpKPLYFISO98+Mhw6VzhQlNN9XoApOuE1fXmvTtLw0Q/7tMU7Mwg8gCfzvbhcmPif6poqa0O7szfU93Irkn6+dKGdEDJ8WQ7wOAeMLO0vE+qC64KuZdFfll4g6c57SgUn4LpRjIXH9eMzskPSbRVxm/4dw90bPUXU8G3twtx7G78BAKKxnPQffa6cJLwQ3lyu1/2gD7gFtb8OsjcgZE3Pt1EuFY+KqSTT0BxclLuirCwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o5HwX8vHBkKTiPfwsjAcd9w+OCCtcGnfCfVuSKPtno4=;
 b=jSqD7RSxuPsj7Oe+7O8lkOrLdjiIkRTiGb8fKaDf8v8h/y+hWTsWrEBySd7X/8sHY9WrBlp5G9eB7XMsMPCyFMaaKprgDkRl0/nWP/Z6jnMxcUHtvDzlOl+/RLheUjvdk0FUwJhpD4vm+aE2zzk57HEY96Xszzc71PYUcczsHk+DJB/Egn/No69gvHLodd/k6OswlwRKWTZ15ihWqFFb3X9gofg0WpmRY7InRprfd0eBODRkTpnNYJIONcTgBZ1mMRAKINopcQEIo7DKEtBNnP1NIzU9rh+J6WZL2D97LC4uym7eEVv8/amE5rTjU/GHhW5fQLRjjS+kSIssxyWM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by MA0P287MB0267.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 12:15:30 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 12:15:30 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v5 3/6] media: qcom: camss: vfe: Fix VFE reset while another line is streaming
Date: Mon, 28 Sep 2026 17:45:05 +0530
Message-ID: <20260928121508.1404808-4-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928121508.1404808-1-hitesh@ebytelogic.com>
References: <20260928121508.1404808-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0091.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b8::11) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|MA0P287MB0267:EE_
X-MS-Office365-Filtering-Correlation-Id: 35ac9aa1-0ddb-409e-95ca-08df1d5a3005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|10070799003|23010399003|6133799003|22082099003|18002099003|3023799007|5023799004|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	iDoGR+ekY3XySA2sE5oDJjbXWErfzD+SKvUlqsZ3eFmETw5nWF5XL0gRlhKuJu7uLTbkXzutrblEFQa9nkdaz0UA3XTectrX5GNKbkudEWWeABF0EdKhhH8JSv8kku10IvZYtTuUPLdU7IUZOCp42qAKbEQ5hINQ7Yn9Io8SAe4XlNCI1f+RPoqXbJwEzUSTLRpafXdNG/02dhx3k3XXX5uGBSlw5cG+L0Pl0K41H5vX3Cr/E3tAk8sZLBmgbJCzgnL22ihkYgttsTmHXCIxJxnpGgKUqY9w75jKxb/8Xs4I4d8oCGlfpCceEfeO3Ts2z7G8mQ197ES2kyLJT7iw95KrbdXoXkvtYxvpDzswvxs+2SP+jAEDMV5iE3LYCFK+GGy4+y4M68Nr/zeAls3m/+Dw8p91My4qrkEiqSGU+2U2zd7/dn7Y/Mt314PzKQihchKHGtnt3uoJmuyjLPh4seyUzSQgylL2ZLXKJtCx2tAO8UQrcuGK6nF9MY1A+wLK+lHsMbQ1LBHI5aRbnxU869tLglBb6BYDIR4HMNHJPEE2GmDEZTypQDPMbPxqnbAy1U2csM4NiOY0rvMiMHtreMlmK3/GzXOWEQmACOiGowC50oRUja0GJ7nfe8hzJbJvpT6RUXXhaXvLFWYn8ltCcOnoj1qwuao3mD2lsV1Ldow=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(10070799003)(23010399003)(6133799003)(22082099003)(18002099003)(3023799007)(5023799004)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?G1WQR12YtstKev0jXMFWOq+41ipMtwPoQmWyETM9mKj0hIngHmL0X+Hr77yz?=
 =?us-ascii?Q?1Wi3jxn2/203wFfuu7lWouYnQhyP+oF4rSurwfpEmSLhkyYYmdDO8DCHDqcv?=
 =?us-ascii?Q?ULQQKfPA2dD4BfPmjLjkQ8krhWpXCJWx6bR2/Red2BWcwMr6cboBDQmbz8Ci?=
 =?us-ascii?Q?R1LVE6x7qB+JAGbi68wnP4n0tbbJveiKvroxwJEi6JNa8C2jlWX93EHQ0yoK?=
 =?us-ascii?Q?Fe+9ltElMKF8d2/fwMQDKRjrfNf/RwvhFPjeZa5cyAIPEx+nZX8yfnT01zut?=
 =?us-ascii?Q?i1JkM/WVQBLroEPHuiRNiFoKZfqX29ePx2bW5YZcwgw9snGwO0qY7fKSMpDi?=
 =?us-ascii?Q?9cKLHUOvq+JRc+awGhaGjtL2zZ4Y+QL1uZmjgscYcKdmkLYhwi4zrNI13d+K?=
 =?us-ascii?Q?lYnHRwVBH+U0HcgjGh0MWKRgy9eLL+/FU40S8L3saINN5wekkYI4Dl/UBdcG?=
 =?us-ascii?Q?KYmiloxwe+QFndvFe1G+4wGfup66lWvCvsvxzFnGCuNZ/vVRy441cq2ipsmO?=
 =?us-ascii?Q?fJyfbEFBzLESD/gXTUiYADYEMRqw2eXCPubfkIYf7iBOvxdy+pxUHvbXN0RQ?=
 =?us-ascii?Q?oMNBk5dnOhtZ1KPiI/exZOsA1d5dwuybqbi2xktC+xB4/y1AuYse5SsgrPep?=
 =?us-ascii?Q?L4yiAlgQ9TilegEoPtpp+AEJ5SM8vpgqC8eh10rqZu3T1pVAwSxshuGGznWM?=
 =?us-ascii?Q?X+n4WJ6p/xBc1gszo7OMogNT7btZutG/FqZuxuCXbWsjqDy8MGy08X+Sd5vW?=
 =?us-ascii?Q?LmPz4sFxIeOiX+XIPPMi/0wGCeKIbUwXqGfnlwcocWJTsmaUNiuv+CKQO463?=
 =?us-ascii?Q?/4rdWmVIe08XtmseiJjdJ0CjAx/H8ZTKbj3WxlnyhwLbSIW3WNXKy5cG3HDq?=
 =?us-ascii?Q?VbuSdXbz5kH4Sr8j1vcMmVwquVNB4DtdVz5i75oSakCxMRQBwHGYQNC9Q8cJ?=
 =?us-ascii?Q?Eftvy7jXW2OZYZ72cwlSh3WasEhx65AF2mi3FQlbx1RM30Ytw6/PsRS9DmDB?=
 =?us-ascii?Q?8QoMWOdlPfB3i3/JuIW6+D46TRwdj66T0Gx1KeUKrwmauvENb0TV0hNNet91?=
 =?us-ascii?Q?Y9bXgWdCKNGad0ZPSXSrh2AxrEurl5qWSDlXzLZtiw/ox3LVYnvpjhyXj4i7?=
 =?us-ascii?Q?MJCv3osbP0GMkevoa3+Mgg654H+3OVtRc1/aZFt+BKFLA+Q18YQoMjbLwPeb?=
 =?us-ascii?Q?2A6EQtHyrZGJLiUfwilkZNtP/bLACovQgd2liBXTenqWGEAOi1PHQ/jYve4r?=
 =?us-ascii?Q?Ol82+nIMT2Pfp0vVUrm4b+hvp1q75GDY3Ah54hYmUvtzKEAStOjvJr1Pg9Wo?=
 =?us-ascii?Q?HKRqfdJk0CKu1Y/Oejggl1MGo4kHIzF9PUt11Ehss471dIlL8WVOKVnZn7aJ?=
 =?us-ascii?Q?5+5VvaOFVPpQUyrWEp7v3/ibo4SUGjDzs2A9XDe3Oxc0X6ra3oxIRrXE62gw?=
 =?us-ascii?Q?sIOKSk5jrOSu330oyF5dua7mvFmYZJglPiyvkqXwiw3izSNgomWMaX2hS6X7?=
 =?us-ascii?Q?/guGX+lhbhbVKQ7X6YHCTjsJaKC2dRZ1f3Nbrg4tw6WPDL8mQlSTcWRpozYd?=
 =?us-ascii?Q?Y4M9/cJeEhAdqZ1rowYhxv5HQMTvXZEVs21ANo2gBHgWMfpQyzrEL0xsyG3m?=
 =?us-ascii?Q?MfwOzHvNHs9Aci+nP7s1F0kStCXicnmgO8J4r/BddzcnKMGEWx2//vW2rpfY?=
 =?us-ascii?Q?Ad2/v1amUyFipqni7Bswsl3kXAU5IPbuZlofxwJ0DRhlylU5AwvvWppTrjAF?=
 =?us-ascii?Q?T9pz9k93wsJMOfRNGxWhXuvVIjRluCRg1KrfDPMriopVMF4feA1383CGjCLA?=
X-MS-Exchange-AntiSpam-MessageData-1: loYS+HHmPRSeTA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35ac9aa1-0ddb-409e-95ca-08df1d5a3005
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 12:15:30.1827
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: viZl8l/MAKpZkgI0a5li4lIFJt/0mxxcPan6uYKl1j5Kk2Pwfs2pPOQ8Pb54MPe5rgWCr8kQCCi8b74equihHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0267

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

Move the reset to vfe_disable() and do it under stream_lock, as part
of the decrement that makes the count reach zero, so that exactly one
caller resets and no line can be enabled while the reset runs.
Stopping the line's write masters is enough to quiesce that line on
its own. With a single line streaming, the reset happens exactly as
before.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index c14d97a131..d20cd4dfb9 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -821,7 +821,7 @@ static int vfe_disable_output(struct vfe_line *line)
 	output->gen2.active_num = 0;
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
-	return vfe_reset(vfe);
+	return 0;
 }
 
 /*
@@ -843,7 +843,8 @@ int vfe_disable(struct vfe_line *line)
 
 	mutex_lock(&vfe->stream_lock);
 
-	vfe->stream_count--;
+	if (--vfe->stream_count == 0)
+		ret = vfe_reset(vfe);
 
 	mutex_unlock(&vfe->stream_lock);
 
-- 
2.43.0

