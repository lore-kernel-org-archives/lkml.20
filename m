Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021109.outbound.protection.outlook.com [40.107.51.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D9544684B;
	Mon, 28 Sep 2026 06:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577837; cv=fail; b=D5Y3xvgDc/FfdwBj2NA20Gq2Z/pu6mt199Gj7dLtsWhVwTXxKwu0gXsmpykW//Unk1FJyFB2Wom/39kMkxU/PIRk16GwPicmDJ+Nz8Ruk972TJ0MMQrAXt4RJa9nlrwXVaEKN6TEhL/0pbBxH0YM1EYIbvVIe9qsrMXE04xyFSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577837; c=relaxed/simple;
	bh=JGkckDYXx+yWm9hZoITtT5nfy4n/ZkFgpozd5T6E8Z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UAQb1z4UIcdjK9f7w7AxFJBOW64VkQXafws8ps8YcGrVag9xPIPuuHSeLQex3wMnQ3hyMppiR7tfBaegG0YwFdiOezJhU1WwG1V+hBS0//OQ6fxC10h2c/O/QzfAutig6cDZo8+Bkuv9LQqW/dzxLG14ROZ/s3sKpGv8KH7ONiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=40.107.51.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0z5f5PluPW4vvqGobRX3vLubL3rdF3oJs8KhIKT/U/RZPo3uvr2j8QrLmxtgmGMc1VaMr1CMH4O3jOiRi5TUQucSWPSrLfHWrw28Mt8IIs0PZEVx+r8ZUIOdFxcbQeIKao4AELO9Xo95C6vMb82RBR9c2uUiKw7ijd+B5wfTfYqKsjsVqBcZNDvn+uxc+R4KokgZqG0PITz4UjXgcxF7YDoeY4UbCAhp2D+B65PFzTDrJOXbdoi4IhomLk4PHlsiusy6jXwKovWyqLQBYROB/g622zacFDqWYXQVMzZzEfO7Az+/RUfrIXQv6A7tfyGjsUhv4yZeJ5T1/6QmVkqGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLTBZvSlcmOOuB5RzQlod4q2vk36qk0RnHTVoUO79uw=;
 b=JIc0R/q+1cITuf0fGeq+0SNlsBSrp1np74RvYQFqM3/BirObpiH7fZHYC5ol6Ol2uC5cwgdL2vGDtMG+NhVfcuks9gqGxBm37GTs9cvkDUBmoanQfUHkRayIraGTQ5VpSZr0ExVGvmtZcggBpUrRccAYMO43G21g1ETs1O3ECPs+eH5JyGD9hWh22y1YHUqRuPMbW5333cIbrfPcIOwSyY6Sot+3B/AikcltI3RvXCQVTxcSTenwyyJzgF64KtF5WwjOfj6SsEJ7DQdBHJQ4/+v8se0pq6BpCruMDlt+6R7cr4k2C+zHjRbqMKTetHAlrKK4swMhWit6KX/6qmI6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN0P287MB0963.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:147::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:43:49 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:43:49 +0000
From: Hitesh Patel <hitesh@ebytelogic.com>
To: linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ravi@ebytelogic.com,
	Hitesh Patel <hitesh@ebytelogic.com>
Subject: [PATCH v3 1/5] media: qcom: camss: vfe-17x: Fix write master buffer done being dropped
Date: Mon, 28 Sep 2026 12:13:32 +0530
Message-ID: <20260928064336.272659-2-hitesh@ebytelogic.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928064336.272659-1-hitesh@ebytelogic.com>
References: <20260928064336.272659-1-hitesh@ebytelogic.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PNYP287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23e::19) To PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::97)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3PPF28092842E:EE_|PN0P287MB0963:EE_
X-MS-Office365-Filtering-Correlation-Id: 776236d5-1b25-44bc-2de8-08df1d2bda54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|10070799003|1800799024|376014|52116014|5023799004|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hrSXuUu7/Eu3CpFpcBvDrXrW0Z+djionUqPpLAybDPVhu9gRGCuYtH1fH0eNXKzcPEmGIUKE3RDGzrzHQpYEBFsSexq7rJ34vNKU763m+Ajc6HotGi6v+Lf6Xqf+G9ZvHpOHIm5Zw92u+nN7MV/wtu2kNQZueWDvisB3YGlpKcjwnPFs7ecQbDqXljupngGsKoHhtHEiIX8CA7KIHWDGBWrxva9dUUapA/eBbaolYr6XnSwMmnwOXswuEr4vZyngeEwtWAW8zRz9sHvs4AVH7blQ66jgpyJf/WUfmQPosCtaqGliKu15WHNuIo7r2AgS8nBCRqpPS4VoQZGcoBRMO6xtpynxW2LzKjneM+x4nfTMW8tkXdskYDhJeJ8d0Vrmaq3AKB8B140zBk3CC/BwiYylzx2NSb9oOl1T/S1QVKASuM25laovrJN4SnLVLt3tml1YrKqctVDzV8uDiNniQHo6BltQ3F7Z81pZ+8Bf3gURKl4DVpPAfGPyN2hCWzlWLoVgejKyjxlmaj2E+NTAJKMzyubaLuCGOUnnUUJ9jYg2qDOmJnheX/LEzHAHzZkm11y1CFRtYoGcIk6g8pk9yJ2EMZQusaif2kyfW7eZ0wFSwc+va2G2oS3XQzlznwM4agkGTjQlHRHSZw+GuNLIGRc9hSxDTkz0gglkT6jSfVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(10070799003)(1800799024)(376014)(52116014)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mUkxDMUJvTZTygcxjNnIN3PoJU1/E3xzayR/WPcAdOWWqGzYyixKQGMrJiwM?=
 =?us-ascii?Q?DoBP03UVSGBOtItJ3Eubti1q5QXkocDEx1BKV+0esbCZ05ZYFTRqumEQ8c5h?=
 =?us-ascii?Q?gC3jwfb1XA6L8lofjEub1prVxwhMDsb78Bxs1fofhJjScaeEGJFmM/fLJbp8?=
 =?us-ascii?Q?rybBYY3fk/S5nTvrsMUvKQ5fDx3YMtCKB/k/djoogY62hsklnWnHJhMCYVjI?=
 =?us-ascii?Q?/xl5lq/gHC2+ieu7PVYv7lN4vvNzZWFliebDhD/qQq4sw2NkGferY+ha0nyo?=
 =?us-ascii?Q?HLqnh+dbkw8ZVH8wtz5asnfMlwAnIkLD4oWlvsZI+68Gae2rK3Gr/+EWq+3d?=
 =?us-ascii?Q?krSynNpgozZPjBFwsQxjAyy0l9wKn9vEGK22ukEYacG/M7sSkTvxTKbxlYzT?=
 =?us-ascii?Q?VKiul4fRkgTisqXd9rphHOAQUFA5nr2q2f10Yz8C9KbDSMTuEW66FDynoIgR?=
 =?us-ascii?Q?XxIljhx2F3hTU8SqElZg+uY1QjfMIuZ/cJyrttzE0nDJ6Wfp9TN5PoJQ4I6Q?=
 =?us-ascii?Q?ADQmaGJpbyQW8CBdLTj7Yf/IMXBjRyTJhWIrLqAJU44bOuTkS7c5NE9pjSth?=
 =?us-ascii?Q?GRAyCKb2EnVMgne1heYWv/vKWgroa/e1TDVcTz1GaUt0OH2WwIHYYdXirtMo?=
 =?us-ascii?Q?9TyTbhUDaBqMqb+azFVQUOSR4IXUSDSoLfSFDb2UDCyXtoYk81W4y2roCb6+?=
 =?us-ascii?Q?aeYmcLTmU9x06K57EX1Ou0wWiMiFtZFhFdAV/3I9LktSpkoajusHc0e9+RAW?=
 =?us-ascii?Q?Ilo7P6K49p5PImKKvCABmASFieDXI4/CTTiSCgAjZEzy+uuUOdZ8gczXsc8s?=
 =?us-ascii?Q?YeAuhq6r5MW3tyv/MOkAiPNP7LYp0zi4jPlJP1xKuSxyopmCGB2Iahkh0wCf?=
 =?us-ascii?Q?l3es+W33p9s0hyur5oUlwLMhSen4MxHZwY6GPxkczyz8Rcwxjca4K7+J5r1T?=
 =?us-ascii?Q?MfMmbBUG45wkcsOWsUdU/1UGcOzdYDBZqyaxilnEosOKTKC6EDHhif1XZmRV?=
 =?us-ascii?Q?WLkrsmL814ivIVpCvEdmjEwyBLC7BYxkeZGDF5l2KRmUNvvDyw971pj21kCb?=
 =?us-ascii?Q?5LyihW3bc18srbaXBOGBLXwxSKdiJ27qSUHmIY0OEMd/HoX2NMC1m6GGjcDR?=
 =?us-ascii?Q?rULPRbom5hCbE5snDIk+x801/J5bB/y1HS+qjs1xCsiaXlIVHvjqSmW8rgNc?=
 =?us-ascii?Q?FyiR57sd3sqXB2S7JATMSWFq90qflIWVnP61mE09bffBx6Ncg7MaLDNpsYbt?=
 =?us-ascii?Q?i0rGNyQ9hTqabXLjGNVnzDRGSBQm2K/wGpCpB/5+hpBdgz3pcebggawJcBUE?=
 =?us-ascii?Q?OaGkshEChfo2OqC7kF9v6G2250JVUwisNPDKz8XUuwJBCbwPjO0TXKt6AdOy?=
 =?us-ascii?Q?kZbwhcSZWJqyu3uGxcZyD3F5nMGwVR2GHqXSdbn5Cw3rPAjawHAUsJLp3/Ra?=
 =?us-ascii?Q?A9DXG/7150nJzxl/L6ZLxFW6fKf9lIloq8oUOzobHr1ypCDiyxZKQyPbMilb?=
 =?us-ascii?Q?EDJW5ejwvlHdVSixyDZLU2X3oqp4pmwpQW+TNDMvhG00TCgJ+KbWYzkV2qOn?=
 =?us-ascii?Q?n8fSsZtTHb9GYhMEciWovrc2kBVZBLduQ9db4vAbVTbOGOuLIp/Pvrpc8sAn?=
 =?us-ascii?Q?oZb69Oh8JBC9JSGCc2L9g3glwiyxAurJRmNFcjpzshSNIBwq98IA1TOgf68N?=
 =?us-ascii?Q?cX5Oo7SJwUta4CN2ub5sEooG2lGasn+z4/O6YrS611QrFXhR3SC0eIhfpV/R?=
 =?us-ascii?Q?qj0wyomyYWHGxe8jqJLyanafeMgNKlvTPWblvkS/Rg6WxckQEe9FEfUvvgSx?=
X-MS-Exchange-AntiSpam-MessageData-1: EyfKSbs5d6qhVA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 776236d5-1b25-44bc-2de8-08df1d2bda54
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 06:43:49.4704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HaCzC33HnUg8oxcSQNaUayK69eYbcWJL3UBpkSvw366aDF1JhNlC5+Wl3XmcmuqWVwOmE9p8iH96PTczHq/e8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0963

The VFE 17x interrupt handler reads and clears the bus status
registers on every interrupt, but only acts on the per write master
BUF_DONE bits when bit 9 of IRQ_STATUS_0 is set as well. Bit 9 is the
ping-pong flag of image master 1. It has nothing to do with the other
write masters, and it is not guaranteed to be set in the same
interrupt in which a write master reports a completed buffer.

The bus status is read-to-clear. When a buffer done arrives while bit
9 is not set, the handler clears the status and never calls
wm_done() for it. The buffer stays queued in the driver and the video
node never receives that frame.

With one RDI streaming this is rare. With two RDIs streaming on the
same VFE, for instance two virtual channels demultiplexed by the CSID,
the interrupt rate doubles and one of the two lines loses buffer done
events continuously.

Act on the bus status alone, as the other gen2 VFE handlers do.

Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version Titan 170")
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717b..c011f64f63 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -364,9 +364,8 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 			vfe->isr_ops.comp_done(vfe, i);
 
 	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
-		if (status0 & BIT(9))
-			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
-				vfe->isr_ops.wm_done(vfe, wm);
+		if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
+			vfe->isr_ops.wm_done(vfe, wm);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

