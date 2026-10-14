Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazolkn19010002.outbound.protection.outlook.com [52.103.20.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032193CF662;
	Wed, 14 Oct 2026 03:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.20.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791950146; cv=fail; b=V16Q2+4h5MQE4MSWBFYCU0eOySM9Uxrh8MImuRmP8be1cbu/0w83Ii+8JIurhM7x5cyJbQEtNPqR//vA+WsCP8+AR+6bVPd9mvHdd2kzfRRIm712cLWktu1MtWuCj02BTq6p0oP8rdA/Ez12M27XeTZn9vamWHevp5pcGRvthPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791950146; c=relaxed/simple;
	bh=LpN7OfJvsQ53q8r8aDwMiJ59GisKlFa2JnDwYRPXWsg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Qu2dVx9GXsFrpV4dcv7mgL/SsVt36z8NrVHN3ovA1NT1WjMPqb6kPp2PpopWD+7JAtyqYhCwOZqDcvD49ShEt00BY39zWv7Wc/BsvDMDF+NOZCeGPfJq+hSm+SUEGfWY3HgjZhdKRfEdd6PYLJ462K81B6/U/w5fP+S1z4RKi5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DSzGyPZs; arc=fail smtp.client-ip=52.103.20.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DSzGyPZs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZvh/U8JmOEbDt4KERN8VNNv/Pl4b3neVeM30txOtv8rW13Sr6bNFQ2CKBfZwA8ZyRHhWkxh19F/FE79YjV32R+RxKdV5y6w1rQDdC0cMt0oZ1ml00CJCai+olD2P/LuJx7f4pCrKaubTFRM87p9qIBW8LOpXjmGgILjlAgTNGZxNLMTBGU41NCP2HBuFYgcTsDeMx24HooM4/c8/b42R8D0yZZ9TR+K/SNvU2vQ3Ps2W3G/c6LiumoV1Ki1pHTNA0t+xvyLOABXGjxyuPl5e19MzctcPRJtNVmQDJog2rzUkojux4BI5dEdrmVoMREaXuZqRP59B3+P9Wf41Y6J5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfaacN1YWK+TL1gEp4m9nK6s5dlyCfEfF1+vlKGIOdM=;
 b=v1G4Sbvk8D39CVEXxKmQ3OmxbUhW3XDbCFtv8OBo13gZjhwgCttrWG3GXjfJS8ZTLQdT0t4P0/7N79o5qxaZ4ApIcKHvrwlAKEvLrPlvGX8O+0BrrUuYdqMyHwCLc5mPZBLH7UrUouAi4dcw1evt7v/Ox/4Lu9Fg/g94k5HsZDTH5wzgAk+JNGikZSiROUoPXRqWFxuC+Yz2/+IIE7hR0KR9kEKRkglZH9xzKZjXPxhva7rkLOsneo+7/tTNrBssgQmTEIkPJBZcB7xVI/hkW9AZ1i5GLpEGex/2afWydoEYqFSSfH18VRBEiC3lQ8z1YzL7/2HHG0vhW5rOsMs0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfaacN1YWK+TL1gEp4m9nK6s5dlyCfEfF1+vlKGIOdM=;
 b=DSzGyPZsLfaXK44BmBgBxuBU9bjZORDl3hrt2hT8rvuBr6DxSii+j0Rom6bmlUarpCCbPGF0UASQJ9/4UjF25ZVgsrg74Z5y8+TbFPesf6FT7JdRZHcgRFsymrNMjuQUHG2eQuJn3SkBC+ROEMoUOyTkw303KGiFpVUAdDg8OV/2Iboc5Tjs6iJt8C/usP2t1BFCUDyR+gTHBevvv+4w1REAEuC0L6d5E5gIkmzvdAazfAFHwDRjQrsd0LVOMRVUHQ/gwFdaxv8jQ2RtyxOBrqpGQ0G0W6d5KbGZIiiyFWhGNOy1vj79h/6AIGaW6Ij/Yk3Ovbs3A7inHKQFNyledA==
Received: from LV8PR04MB9007.namprd04.prod.outlook.com (2603:10b6:408:192::17)
 by PH0PR04MB994320.namprd04.prod.outlook.com (2603:10b6:510:3ff::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 03:55:42 +0000
Received: from LV8PR04MB9007.namprd04.prod.outlook.com
 ([fe80::eaf2:5da7:6815:452f]) by LV8PR04MB9007.namprd04.prod.outlook.com
 ([fe80::eaf2:5da7:6815:452f%2]) with mapi id 15.21.0522.011; Wed, 14 Oct 2026
 03:55:42 +0000
From: Eric Argishti <eric.argishti@outlook.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Argishti <eric.argishti@outlook.com>
Subject: [PATCH] docs: admin-guide: fix typo and punctuation
Date: Tue, 13 Oct 2026 20:55:33 -0700
Message-ID:
 <LV8PR04MB9007F44F1F989D9D95D1A386F49D2@LV8PR04MB9007.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::7) To LV8PR04MB9007.namprd04.prod.outlook.com
 (2603:10b6:408:192::17)
X-Microsoft-Original-Message-ID:
 <20261014035533.79522-1-eric.argishti@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR04MB9007:EE_|PH0PR04MB994320:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e3fcb5-d26d-4906-edb1-08df29a7045f
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|22141099003|15080799012|5062599005|19101099003|23021999003|39105399006|5072599009|260925184616899003|8060799015|19110799012|25010399006|4140399003|440099028|3412199025|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rydpCazl5kucocmNTYWQ2yvfyE204Oua5TRqfcxOpd/kU+qK5JnGSUWCwIEU?=
 =?us-ascii?Q?6G/KqJcd1IqbzWMte/Sx4oalasiFh7ouLQcRGHOC6px7wRjcm1+ARghGfX6c?=
 =?us-ascii?Q?sCw/DtZwPleR6o3D+lfcJG8OloBFQMmX6yG3xz8a7jmonQirHBZfyhn69Ttn?=
 =?us-ascii?Q?lxlsmbCsd2ACAgu/M/UYLWM/Z7+4YoAUjYrf2aZWBLWPUqnb5KUoZN5o8FYI?=
 =?us-ascii?Q?2oEezKOuL4NFs/MkUIVTqKvLYL5RBbKR8J9lnEsAtyeszcIfRLA+ABLCNPBg?=
 =?us-ascii?Q?PMrK8EBnoaEXfMG2tsCU4Zq72LMBzs+FVA3yodKr87HqihRkF60iKOwOuoL9?=
 =?us-ascii?Q?DDSLcQpZGjqwepkvwpmLpuR6UeBVS1k2kD6w23D/YR9gXStreGXiZ/wo3Zrj?=
 =?us-ascii?Q?hFVfyo3FedVlTxPj2FveXqWj9NT0y89J5izKDA6XSMZPDHxNA27hBYhU6Do1?=
 =?us-ascii?Q?A1M9+jdHNmJky7pb8WJjPhUs+pk5U+qJSBs82ewaAhDdwX3Wo3S0wFf2MnxI?=
 =?us-ascii?Q?/MjvTSpai8E0ozbpxq3/dN9rO2xs5b7PysmuO1/9wJA1XG58pcNgdnFetcGp?=
 =?us-ascii?Q?gT6tDPu1aMNiDB9+el6YG0npaxxEVkbMrP869IQaNBhm93LWjv+XabgqrYOH?=
 =?us-ascii?Q?ldGF9McyTDmj7jLHSNjcgPUO+95rkLQE66XyaPSzf1V+nP6/2ePRRmMWiL5b?=
 =?us-ascii?Q?Tey2dWpY2hFG86Ox+/QKU4WZA5ir3ob1/JZwY8UiwU/oMeAxrAToUT7+e3nX?=
 =?us-ascii?Q?laqjMTAuuWdwEkGScOq3igI8i+ffWgZnDRkpBvW57xeSumsgYtArM4WxWnny?=
 =?us-ascii?Q?jokaJg0C6B428feCG9WvqrpLBw+I4HqfGZF/A/Fsn1p5IV2O9c9NqG5h+99k?=
 =?us-ascii?Q?EucaX9CCGayyF5KJDvoQHlqZXoXUvSCiVoNmHQeLbOfJPXTf4baXhwWpIGca?=
 =?us-ascii?Q?jVh1eFYVU09iDWH06xMyFRq+xv8oPTEO/Bl5fq9jIw55z0eaAGIwhZPBwEys?=
 =?us-ascii?Q?uI8VRH/QCQWJuMWNWf2s/GDS1Q=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QClQP+BKMtpv2WjJQupEA/TLTLVhzB8K84bbQCnt/j6tAXrgo0PwtxaA6vSF?=
 =?us-ascii?Q?nVEUwVWK/lsv8bn6+wuoZHl5cr6m3RZ0CA8F6JZZayfrZTz5bHF5vtnlR+lH?=
 =?us-ascii?Q?4TFWbNv8RqMlDS9hGas7/D27KI7HFN8UDFL/ln9iEKaOZLuIsBUOG1WxiqEV?=
 =?us-ascii?Q?Qe5x/2vuBjWSaP7kME68tc1+w9grgpopTLAIHbd4G6TuhchXpbVQWUOH7679?=
 =?us-ascii?Q?5iqOdA3SmTEKuvfpjLPDoyA6VD9/gZuNZTm2K7SqgjIVatDWR3+swVN4SBio?=
 =?us-ascii?Q?clTiO3L/pFu97ojRl7puF0wfjDeDfx7UCWAfLyCIGjz1VGAjYSulBShsNJAe?=
 =?us-ascii?Q?pV1+DOE5YhO8AKJO4DRr8VYC5X5WT84HiKRGgva7lOONsXTjXpHW9Ia2OToT?=
 =?us-ascii?Q?f7BFuXCxaWfXcrsnYUqq5SkKPllxnbBSAyW+CQk2+FpusBhzxqWFv7dngbXl?=
 =?us-ascii?Q?Vc0Dg2YzO5Nxl9ZK6uGxBoq758EWPlNYEr0h+BNxVGhJVb1/WQ3P9VDWVSvX?=
 =?us-ascii?Q?fRepYrFDeNbRrEI5rTxp8Y9d752TdqL+9pEEJjKUmqUHG20kiZGfyNubPUK9?=
 =?us-ascii?Q?mGad28xKAlkNItdvLL4wZCJzNOkoKgtlNs2T68IYr872LXkRvlf5AaHaGCFy?=
 =?us-ascii?Q?vC1vKnNvGXHe+FXwbil/0yOxQCy0wZdC2Pd9khza538vCgHqW/Q918rQtxn7?=
 =?us-ascii?Q?s190wobBasHDMPCXDd2lh3le9YZBKCcgwOF+dQpjJvdDUdo4kdC6tMpT73xe?=
 =?us-ascii?Q?AOoFYEpwBkNx1zS9qcR4Tu8LrPDlViFKqtkyeSJe/a3ER96KfQj2KTO3h8tS?=
 =?us-ascii?Q?q1Dav0j8pvlM/PvqyOZmDb74rM3mPDJcsbX45h9gAur9cMrc+uZBONF8a4Wo?=
 =?us-ascii?Q?P2j9LU1kvfRkw+53LUjYyKCKkkRhFavd4kYeWKLCKE5FEQvWxo93aymJiwb5?=
 =?us-ascii?Q?mHyLkadbQft6sccrmtbhWay5sjUTsrHhhGXsW4KK9beTeIS5CkcCpP5d5oW9?=
 =?us-ascii?Q?ID1LganofHSnou5XWGVMSeZZQuOmZBWapzERJQ7QV3u+IVi70euzE32Pvmbu?=
 =?us-ascii?Q?yzVkHvvyh25PWt3q0RGFDsaENJRqhsFd1pEx09Vi/7uThgmVcL3m3loNFCzq?=
 =?us-ascii?Q?JG3FQQER1ypixPB+nxZCc0rbW5sNvLKq3nkUDyIoljAimkJhGZ5TT/+I0b0/?=
 =?us-ascii?Q?/GD3Terlmo63VewNwORPAZzjAQzkaQJpc0uDiyvSYTFnVQ5ZwM7HFG/H1VHQ?=
 =?us-ascii?Q?RABbhg1tu0+DsvF5uP2wulNQU1x/9ZTk3sOAETMpLS0zHJRLGeEWWFLqD4M5?=
 =?us-ascii?Q?D/w2u73qhuq8gyaErKV+Mn3iQQ9oTeubpJQ9nIdcyzA/SYg07hlfltH3FDxu?=
 =?us-ascii?Q?QJK4NkdgjEYGYP2DXI65NIGQ7Mc+?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e3fcb5-d26d-4906-edb1-08df29a7045f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR04MB9007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 03:55:42.4821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR04MB994320

There was a typo inside of the admin-guide index in the docs.

Signed-off-by: Eric Argishti <eric.argishti@outlook.com>
---
 Documentation/admin-guide/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/index.rst b/Documentation/admin-guide/index.rst
index cd28dfe91b06..f87e9bbcc458 100644
--- a/Documentation/admin-guide/index.rst
+++ b/Documentation/admin-guide/index.rst
@@ -23,7 +23,7 @@ etc.
    features
 
 A big part of the kernel's administrative interface is the /proc and sysfs
-virtual filesystems; these documents describe how to interact with tem
+virtual filesystems. These documents describe how to interact with them.
 
 .. toctree::
    :maxdepth: 1
-- 
2.56.0

