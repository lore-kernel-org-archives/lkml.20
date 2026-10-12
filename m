Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020092.outbound.protection.outlook.com [52.101.227.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CE7486E7E;
	Mon, 12 Oct 2026 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806767; cv=fail; b=rpX+nYZRDi81PjhOIfU9FtFULR7QIDsY+DB4SdWWJMrddGtBi9CbdHkMVlwKFY4ak1FZTqm57Jt+QiJMknom5arahjTA/KbF213B3G+DzIyTOK3/L94+3gmjBsW7Hiy0VJbLhl7zICM6GdLd/gjumOouj7A98BP2scH9NXc3qgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806767; c=relaxed/simple;
	bh=YP6urko9OM0M67guE0P5qm5gU7Ofc9Ggr096FqnEvUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VsM50+J7nPpUjf+uoem2BkHU/NIJibx/TfewE1BeyUOw1TPyiOHLVNdf7be0e52Ix6mVJ9Az6t5mFSUG824vtK9pUlkoZat79B0FJtJ26oNEsbVJfD/IHhYLiGVTKYTfh5uGsQ2qOaNqNpSZ/DkPi4yqNftpuTjMzKIsMnAjPPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.227.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uQECVY/VR1XeUa2LxMOtVEBpgg8ZfGrkZZwu7Eb6uAlhx+TZZt2z4qfjnmPMVCLW2CWWbsqzYtp/NP27fnl24av94mCWywogvV/2cQNiK/1hi5TSt/th3MFJiWNPl68qCY+XydpmfulQ8szA6AYR6H6f98M/ftrOAhzYbkUE7mZ3Ge3EmexyuaZm2RvQe/uGqFgF3pSfq5QcLLMOtTOBF3ASWwffzn3pF2pteMvZs4ERqvDhjpAKWFZIdNEXMuzienCe7KevVCQPuOInXd1OILqVci5HXb6B9i28lvwFOISjBqnJMgljQ8rFHTGPJnEkRwVByXllp1H1bsygwQWjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4GJbBCEfmXaCiEOxCF/3A3nvzFaU9cEREPVwIQyB80=;
 b=eKlhi9RLAw1C1Bu5GpEOI2s1F91RhMZpaIxtm5pouhyA2UUDPPgA/FcRtGdapvNfZhVLWYDOLuC6SK56rGch5i3God5eCPUbi/BdYMMW/cYvWYRxfwV04bqNlzhm3cZxgVX6CChGch8VdKhPJi7ZGCn/SWy6mAiJsUh1wdBo6OlAlfW4ZrCgjRqpWjmc4COtp+WWd8bDbNF0NcijiIGc9EnbroxtP2wPG8dc12Ov6qT6yGV2dJ5hWcjDnKaJv1Mv8psKljS23aMGBI1O69+0zSBnvTaAkVsY3MTrBUo6kfezYjvEla4n2FUtNkN+p84Jp8IbU5PahfvDzEHbBldjwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::104)
 by PN2P287MB1987.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 12:05:56 +0000
Received: from PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e]) by PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
 ([fe80::3a7f:fb1:6998:b89e%3]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 12:05:56 +0000
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
Subject: [PATCH v4 3/4] media: qcom: camss: Enable the streams API on SC7280
Date: Mon, 12 Oct 2026 17:35:41 +0530
Message-ID: <20261012120542.1140157-4-hitesh@ebytelogic.com>
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
X-MS-TrafficTypeDiagnostic: PN2PPF076CDA63A:EE_|PN2P287MB1987:EE_
X-MS-Office365-Filtering-Correlation-Id: c60e65ad-6e45-4c1f-8601-08df28592bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|23010399003|1800799024|10070799003|56012099006|18002099003|22082099003|261009223027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	u39gM/G0K1wIm7wcTSZZK4yccPOApOgT5PHyrdwrEgsl0PkbefWb1Ic316tngLDiLlj1YQ20NX/VXQkxlCMQyF6DgGrDmSl/CGbQXhFCINNtv3Ck6iRMBm6B9YYS8pMUFn0rQfbM0ZxlVAT7Wp0yBqR2asmh8H5FD8kl6VL+mIokDvsxJrotb6Q+RiF2z1EnB/z7rLerBsG1IvlHju1+6b7oDvUsCUOoYDuA6HWBqElX3ob+m+aSGy1oEveSZjSt9+MMWGcr36SdT9dBRTdrJ0LYGXsFArDoG94AxJyL92HSY6selRmQ9k0kju3/1ZRxO38Dl7Hvk+P5Uz8qzLbvCo4iH/2N4sH0knG93D/dD6OC0d9kR5X2Zu4qmsXwCzxhNb6Qe7qd2NoK8kS+WlrHUhhzez97cRQkSd0j6VOuFZi088EmtetJejRGueBhEM1y9B2LsMw6G8+dMWXagdYjzpaiUbDfGg8hefDAOiv415DRC3q1YugMkGXmWp58dLVfVPH8zXQs8tm6Nsf7k6zBkOdhOfPYJlm11AIyBQEvtTnGkwvNb9GWABnZ0XjEfpc864v4NjsSd9sODAeiOmaJmGPM9U1yg9QgpPdIShf1JZHElV1FfEF2aI0ucVHzLH4dOREdajGsUwtFx2ZbuMcSZrXiwYbk7FXXcXJPN1oXhtA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(23010399003)(1800799024)(10070799003)(56012099006)(18002099003)(22082099003)(261009223027099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Xhyzj21ToZT24RU8opzhDXZXKY0xZz0V5JjGAI8yUXr8CIqCqTJ8fxSX3r+?=
 =?us-ascii?Q?7rsf5zumQjEJqOWA9OXNLTkQsTrWEeSF7UQQOIHjQxAnBQ5zD74TFmQPJ133?=
 =?us-ascii?Q?MtG4NC8O13sFEFp+I1GXKPvT60vSxNXpYsUWEzcSFsF/T0qVyo3dY7LU+kJ3?=
 =?us-ascii?Q?mAyu6FD5Q+chDqscN117754hYH9dMWT/k13o3FacGfOcNS6wcL1V4HnitELO?=
 =?us-ascii?Q?RRROy2UPsClOoz6Vhj9FNZ7Eqj1xQNoSS8Q5sSNzgJElieJOIaPCxToQkExW?=
 =?us-ascii?Q?u0gf25+cLrxOdL8eNI0CeY4HNjnmtdoKRuHoLQhIXB9O8HJSKxuH6DXlKDBe?=
 =?us-ascii?Q?0ABg7IVj/bVNI2C9txhHU+Fki/UHjajxsCzM0jdKYlUQ79wnOrMW1DPi/VhE?=
 =?us-ascii?Q?UYx0TGuLw2tdKUU4nmAD1qOMMgwV2GaF+ZtyJvqONeawzRB/B7z8zX2kAWhK?=
 =?us-ascii?Q?QdML3/uPAkAYEL4Zu9EhK5pmNW8XF1e3W3yM9oy+GoCoOeHtO5dMeQm/xSwb?=
 =?us-ascii?Q?Lt5389iX2kG9MZSFhP7VRPqgtmVK1IBLWl0iNXcnQ2xFV61pLiZfQJTtV4Ak?=
 =?us-ascii?Q?IOA+o0v83ij4YLI1Q+FCMetzoEob3RynGpsftZURDWlMJCJMtFuDzYNnT0IV?=
 =?us-ascii?Q?4KlVp35OCqOiUWFheK3D6NmtbVT8iwAGTkz4AgxNjQBWTvbjmM6mZ76gBb/x?=
 =?us-ascii?Q?vESwlV6qnHoXfSgPxRotget/SPp2g6ZaiJhHvIRaCjWJqQEjFoINrQ1/FcrH?=
 =?us-ascii?Q?phjUA0H0/E9CNqrm/PBq8+vfwsQEzwyGuWaeSGAi0E+4DquiyPJt46as2A6i?=
 =?us-ascii?Q?iVo4A+YWaUM+zK2TywNA/CSpNhZjp+3L5GBMPXVAPiM0GSs4iyGJ7VGM4vS1?=
 =?us-ascii?Q?oxkFLbBYuZP8w6FgbCMTVUT3XWrG9rLc8ffHojymxB+iAgHIWKzSec9l4UFK?=
 =?us-ascii?Q?LGLL6I7Nt7D/nATyQj0McWhv7CpcCz2GSnIvSW6ZBFCwZc0qdbsxh2TK4pQ5?=
 =?us-ascii?Q?+PPGlPSOxtF24XDBRdVivxsv93OBeRVdeMjzwzHuc3lvWQD4Bmb4cEATDRU1?=
 =?us-ascii?Q?Msr3JMaP73v4n04JW4622b/q/CHplUA9AueJ52+floKs6ASTEug5zLp3MgoD?=
 =?us-ascii?Q?C5kISVbb7yaHDA0GcjiHGFwaC8oKKgnIgV59rL6MoEaprrEJL/wZeBFUlZM0?=
 =?us-ascii?Q?hw7jVMiung6kyBPdB9OIW5snD/2KtMeaJRHwo6JgQ4auv9o31UWDW8GeROeO?=
 =?us-ascii?Q?lEhhcshgxh0JUY2hIxd1oH8SEBomc7dX/0ccodIYWF1kwqkoRWg7bSJY9cQ+?=
 =?us-ascii?Q?XyvT/y/Zh/90liTL7oQk83dwbIdlKipUncQT1PVPfSKcUJm9q3TSnNU51/9O?=
 =?us-ascii?Q?vWoBg1VXJa8WF/P59vEKIGdo4dFA2uDvUFMnolP6jDnEvNAR5/YNdGkM+GAT?=
 =?us-ascii?Q?2uUIiTvAwyx8ghdc3v63B27bJSnFiAe/T559P43X8NX+D+TPFNKZo7hoBOTa?=
 =?us-ascii?Q?trM0R8e0pw7uZv9asjbB1X3hf7sWameEyroU/pHS0BJ7xHoZL6LpM2O7W/b7?=
 =?us-ascii?Q?khaN7HaxLY4YhwB1MntN99o++oRTsfbIAfJJMgUocgKP6+1VP7mdkri8WNHQ?=
 =?us-ascii?Q?P452+01g1s0Lu/pzIxQ1VLk5aooSBZERxCXYpKhZZHiY5xWDRdJ34iM6CTeU?=
 =?us-ascii?Q?JjsueFm/mfo03loKuGz/YVj9B+T6y8vMmT/J1IJrVCW+80OHaAIGFKw32Dpz?=
 =?us-ascii?Q?A8DJtFtUfMhYlQZxYMxu6CesfdRGr7cFPCa8LY1n9/ukIj8gQ/nQSD1c5VPS?=
X-MS-Exchange-AntiSpam-MessageData-1: NeEQHFZ+lu5/sg==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60e65ad-6e45-4c1f-8601-08df28592bdb
X-MS-Exchange-CrossTenant-AuthSource: PN2PPF076CDA63A.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 12:05:56.4917
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e7gPtZi11o+4+vYwm9y5HtbcYWy3YMdgovbC0J1JoWRjYHvLX96tkUcJ+AKT7sowYVW/tJoKZRZVlUa121P7dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1987

Tested on RB3 Gen2 (QCS6490) with two GMSL cameras behind a MAX9296A
deserializer, one camera per CSI-2 port, so two independent pipelines
share the deserializer subdev: both cameras stream concurrently, and each
can be started and stopped repeatedly while the other keeps streaming,
without the WARN in call_s_stream() and without the second pipeline
tearing the first one down that the legacy s_stream path produces. The
CSID test pattern generator keeps working.

SC7280 has no camss child node named "phy", so camss_detect_legacy_phy()
puts it in legacy PHY mode; the streams path dispatches the lane
enable/disable accordingly.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2c9c4ce50..a9bd79ca3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5760,6 +5760,7 @@ static const struct camss_resources sc8280xp_resources = {
 
 static const struct camss_resources sc7280_resources = {
 	.version = CAMSS_7280,
+	.streams_enable = true,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_7280,
 	.csid_res = csid_res_7280,
-- 
2.43.0

