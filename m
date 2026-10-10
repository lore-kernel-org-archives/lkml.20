Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19013086.outbound.protection.outlook.com [52.103.7.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695BC43DEC3;
	Sat, 10 Oct 2026 09:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791626213; cv=fail; b=YZWeGBW7vvIOXxSR7P0DNeYIc40H0KqlOi0bHVb06dJw12FawsJUFvmRvQ8xDqUW34m0s4kn5jKp7WmB2+EisA3/8JR6y6Q10remJkY0VxhuorT167UuOZciWuHCZVKmRiXivNjSGCYWaOkTKc1ywhp+MtJoXAn7WxxVhWp8zUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791626213; c=relaxed/simple;
	bh=MMafh3HWlibMe8SKjLc1apboQBkVO8LHwGC2nKA0Dyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ponHedVF+dbUtwF3fBtwEddK6PAUeD37jIkYIVJFfV0NG2/Xq6+TUjvIEaZcCDOoIP1h4NPvbSmGnXBB4uo22/mMZ87J/0lqM24iPiAY2CmmsUvv2s+0/Tyuwt9FZOBya6QJG3dfYj6YOBDwQF9z4U2sv9xX+30cjcxsBPZpYXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it; spf=pass smtp.mailfrom=outlook.it; dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b=VGkSk/F5; arc=fail smtp.client-ip=52.103.7.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.IT header.i=@OUTLOOK.IT header.b="VGkSk/F5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gb0yq7ByOeM19GIxv0gvUXn/gfwuLkvnGwLhv68vEPPtxUDa1O+2mHA5KDn0qbxlmKl0iKm/NUsANAaNhVwVN7XujG0CQqw8Uto4JcWX5SEPOynMz3Ttdm4HKY6HDskC5BJ6u33TLK04MhaXvhN7/HUukzbX2T7QOsGMuvGX0M+4mltWreqHlI+D2lzyhKB7Z0rrgl24MFr1n76Qjq1GWV2i4GKat6dPvUk2aaLzwHiPj3/AsAGTdG4lrFK0G4cK4sWZYVNd0tif7pM5ilCjd2C4dDxMmtgkkwRHXDZbJPz1HXIkG65a6aT5bF1ZUVhXfV3A9V/j6eNPgiDjJaCIuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMafh3HWlibMe8SKjLc1apboQBkVO8LHwGC2nKA0Dyk=;
 b=XsKFHWbxKjgOt/XVxM1ZdrUtbpKtbsq2nCrTTORYc+onQDT7H9oiVrybppOHIqI1H0XmIwPx3zqmHTfRgogqnbJ4z97S4vWK/mOyl4hYNQTAzj/8c1HdPMQ7FaScCvqbKctBZLuPfmBG5iCB7equPyvc+t3XcNEHKW9s1x1izZB0BQ7Y/XYRy+LNhsmX+BNm62gP+JyI6Gx/fh7p4o/eKYOJUMA6VxxoMOxoSdXzfx2Qz8ISRWpY4inDuHssWeImqM9O3VHx91OMy/mMJyw+mkbUSd+Fmm1EI6Qf3g9Bl6Yj51jSU2dm1aMHwKSVh3aRTNcsm6onlb0ryldh3/Pt0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.IT;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMafh3HWlibMe8SKjLc1apboQBkVO8LHwGC2nKA0Dyk=;
 b=VGkSk/F56PZTVpdVJUi0P3f4dKK6IipmHy0Rn7c7MdoSj9qoxIkCHLfbuTKpHJGxeKgvYoIUipR8sZdkcjndFvaFzt3IIwJogcypJWnYQ29gO1zwYhYQUEwta9Gq05h5HwSqhc9GNC8Z0wzelg1ZN++osbY82gRjHLyO8j9lVwuy9hi5p1CnWE3m9TyddklykVKn7LJh10kfnXQwtYjeCYBAmL1jJ6EAJVY6j1AhMy6dVyhOKQbs+STHt8DURH0MNXt9AgtKBSz+0gS4f3XWrEDo/lmXfLg+qqybqZyOap22aXymt43oWozo4ClUbZ8I7WjlZjiEQtG+K7MnZ5eEzw==
Received: from SN6PR19MB2303.namprd19.prod.outlook.com (2603:10b6:805:56::19)
 by SA0PR19MB4192.namprd19.prod.outlook.com (2603:10b6:806:8c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Sat, 10 Oct
 2026 09:56:50 +0000
Received: from SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a]) by SN6PR19MB2303.namprd19.prod.outlook.com
 ([fe80::805c:7f80:c69f:876a%6]) with mapi id 15.21.0496.015; Sat, 10 Oct 2026
 09:56:50 +0000
From: Marco Giunta <marco_giunta@outlook.it>
To: tiwai@suse.com
Cc: marco_giunta@outlook.it,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz
Subject: Re: [PATCH] MAINTAINERS: add entry for AW88399 HDA side codec driver
Date: Sat, 10 Oct 2026 11:56:41 +0200
Message-ID:
 <SN6PR19MB2303FD862C95299D7F386F0BFC912@SN6PR19MB2303.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <SN6PR19MB23036B2EBA9AD55D12961FA0FC822@SN6PR19MB2303.namprd19.prod.outlook.com>
References: <SN6PR19MB23036B2EBA9AD55D12961FA0FC822@SN6PR19MB2303.namprd19.prod.outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MI2PEPF00000B8D.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::414) To SN6PR19MB2303.namprd19.prod.outlook.com
 (2603:10b6:805:56::19)
X-Microsoft-Original-Message-ID:
 <20261010095641.21487-1-marco_giunta@outlook.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR19MB2303:EE_|SA0PR19MB4192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8bcc95-05c8-424f-8cba-08df26b4ce13
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|8060799015|260925184616899003|15080799012|5072599009|23021999003|51005399006|25010399006|19110799012|24021099003|440099028|3412199025|40105399003|2607281247196008|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kEOvzJS+/VR6OtLUs7UGPV675LCsRWAmGuhQzJ1TzXYidrklyvF14AuuFO8v?=
 =?us-ascii?Q?i1oC8tIW0EAxM80xSQa11w4R66VEMAFfDjwyIn68bTDr6Mz9TP21xsx2xFCp?=
 =?us-ascii?Q?XMKYS41b7+170GUykRe3Ce+5Wx0n5pv17CKGXoH+iM6q8hOT7u/DGiS5Pu4v?=
 =?us-ascii?Q?pwmIa5sG5S9w2l4xdmZ8kq4s24WzFNpkzHF1vZDp+0hQJ0uhnGUeothI4dbh?=
 =?us-ascii?Q?O868EmeLNeXvuKPS2e28aRJi3Wcig6hExNmIxe0YdTjqsAM9TTr1Zd4eLFdu?=
 =?us-ascii?Q?TydpCEbWVbaqf3rRy1jV1itfQL83rOme1eg3nYCUuizW0joIygWVz9pfffnc?=
 =?us-ascii?Q?+rKU1WtC1oDO9dyKcn2N2ya7tljH6SibmKp8OeWYt9kKDaLYr8vepYzDYyyp?=
 =?us-ascii?Q?I7Nc7JCIO/fzPrB/Md7eTA7RDiyqCUG8CMXwYw/bsN0pOGORtrUn2URd/GxU?=
 =?us-ascii?Q?2xenCU+Bn7A3Bm2RdtRp4w0pvGpP/94AbO4TXi8Wk8KRvkZR+0OSEWLIuiX5?=
 =?us-ascii?Q?Z/7rzwxltSMMvqxorq0W9zqvm8HshhXXaeKbhXXuGJW5zLBasr9K6wa9yy4X?=
 =?us-ascii?Q?KyqswbZ61/JoQPNwUUxRtC7zSyBOk5VM9/GCuXto6EOt1cXtmdNbdWitGqas?=
 =?us-ascii?Q?uc2rxXgxSauW4yY2ccghCJJwksznvvvpvftP1lOwiunLgJ8XCz0cbMt/2pkF?=
 =?us-ascii?Q?LfhFj/fk31d/E058o+srEdOy7/Z4R2tFnvXg4gwLc8noHYEqPCYjnr+L0L5y?=
 =?us-ascii?Q?hHxb8MQ3hKWKCTtmShu53GxTRIIcjR2De40M1mTT0xFh/cMFrDJiPmekOB2J?=
 =?us-ascii?Q?RCQlphvNK7vBJKw78XVI0q3/Fuy6j3QIeJoQORc49hruFAHhGJN5kNO9gUjO?=
 =?us-ascii?Q?/HJtBjwFZARgeQPNaf7ZCcMcYx8cBK4YmFzVyyR4xrW/SDnTKFeoYJmuODJr?=
 =?us-ascii?Q?vL6JVruwMQXVckJyd7WZTA=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/4jTpSJHJx07XsG9PtClFyjioNWxdZLm5c9XTX6/zCXrW33F0x0s80kycAJp?=
 =?us-ascii?Q?eQPhbc3LgPhw3lyfoRz09KhFEMOPpqw8ItrSs34R2danuuoMDMyewGdYIqPG?=
 =?us-ascii?Q?U5dPbqmTr4Kf6PJ9dmyIlLPRABie4lfNH1Cb0TAZwXw6WwN/WlMRsq0h7wZy?=
 =?us-ascii?Q?cnVIDKZzTT3vHuqxGnqusAodL4YEAs7P0NIHUSr0pZIMyrEU6aJ7R987fq8N?=
 =?us-ascii?Q?MBJB3JNs6cIvw69bLjCFDsi5acJyzdRR6ElKxqZRz//PPORtFNRWcmXoxfrq?=
 =?us-ascii?Q?Y8HKFMwNLcvwUEW863lShlBI/5+/yZkxePIPUYIVyJUP9U9a04HxZlLrrkTB?=
 =?us-ascii?Q?xPl7Bg2DHouA4xB9PExt2kIgcvw8S4WqiOKlUMS0wQwTxqCmZ7Eyf8a0RDF8?=
 =?us-ascii?Q?R7WSWnlNvsQL8LWzozwkPY7OutbYxKXlXB5tBydCYmyV+e9OxwFV9eTYzklD?=
 =?us-ascii?Q?HRa3GWPels3Cp6zpOQyFpj8P3MqkK1McDyHn2Cdde8rW4c6g0JkEO0ze8Esf?=
 =?us-ascii?Q?ksPYC7DWeecFYanR4iIcXmoB8iAEYT3rN43t8zVpZYM2RTuJ78sl3hOVxr68?=
 =?us-ascii?Q?Wa6cu3YtgI6LbcPYQDH5W266SutXac2RywijYfRbWvVGqC/lRu4KQ1fujRG7?=
 =?us-ascii?Q?kXF+AjDpuwxbo8MluAdp1rNFAi+IrxPWdfUshcGCxumkar0+osW+EoUVzAuN?=
 =?us-ascii?Q?5qYsJpL5LJ1gU7LPYnRun4fcMyUW6gpZ+avHdvUiWL+lyZiN1pDmUBY193eK?=
 =?us-ascii?Q?/Hp4DTo86nkzVcZNw7f9GYXvlyBG0IqjuTyzr2G0jQaJhbEdLbNio56P8IxK?=
 =?us-ascii?Q?6dMxXIb5gkCWanXHzQ4qPy3Q8lrxbvni1z1v2flxrYbCIbJE7Sz+qqklynik?=
 =?us-ascii?Q?fNayp/Gg+kbTC6RWNQB4Mm4FJZ3lAJGEIhIaeB5YFxBSTK2uvrBm8xoaGQ9t?=
 =?us-ascii?Q?QaBMKSgvO6HBP148quoAyh0SuxowvxG0U+04DjpJ2MCojHCVVBKr/FPuwEQK?=
 =?us-ascii?Q?ZNbyQomBXOvcZUMk6B63B629LrzP8z0V2BZA0YUmAFbXtJX974jNtw5cs/y7?=
 =?us-ascii?Q?kRmmFAUePsIpf+98jPXgaoS59agWtHPFFjcsxU4b8HllYo6m2lC+hR0RYlpW?=
 =?us-ascii?Q?OYyekUMvk9TaUGrp1N7a7iyo/h7UTfy+Y+E2BK8xgrf3g1+xLQmfDNQr+5lx?=
 =?us-ascii?Q?t759aPKGIJaAvw13A5CgzRwjscyFG3ALvTM6FnF0KGbD/s3S9nWFLuxsPdhk?=
 =?us-ascii?Q?ZRbvOc8RdUFFn5EcuxwlhGqzqn8SBmTZcBeQ/x8w6/ZmSACaao0mtToFFG0h?=
 =?us-ascii?Q?1Aba3j4okKmJlL/ni14c5JsMxytDEZxdtDeJqGRnBsR1LWY7rW3QmmGAa4zw?=
 =?us-ascii?Q?fIrpL6Ts/irLLuvFfP1LzZXcUA0u?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-990eb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8bcc95-05c8-424f-8cba-08df26b4ce13
X-MS-Exchange-CrossTenant-AuthSource: SN6PR19MB2303.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 09:56:50.7133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4192

Hi Takashi,
second friendly ping on the other thing I forgot to add in the original
driver submission.

Thanks,
Marco
