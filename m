Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020092.outbound.protection.outlook.com [52.101.225.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312F3346E7A;
	Mon, 14 Sep 2026 13:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392884; cv=fail; b=lBRDREqWzzYPk08ysaJm0bFelKGLetPIkoKzmjYOCgT/7mAsIXh0FfeT9gRQV4dYjZtaIJRlcvgLn4Kr4udssmhUzmQqJa4UJt0XxiiS2zhIBza0PFXbOpL/CcZ4y7EMu8UIyq+/z+6cK/u9RkkUdiURUywau7GLFGXyctAOXdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392884; c=relaxed/simple;
	bh=TQVKIzh5bH+lwvr9GKJjMwuX5ZadPOS4jONuOF/w0Ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ohF+8fNXaLdDUTT5y6vAv1UpS0ruDRV/FFVhkZmVR9QvZU2Atrwgi30SLhhC2YjALRi9k0DZYufa+VEPaT9UV1JNdzBlIFXC1Mz6oJzfP+dAvO4iUrDApoji8OxxX6v2GJxZHbTOwVySXDNuQ4uWiKLfQkIXQNp8pODOgZVfmbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com; spf=pass smtp.mailfrom=ebytelogic.com; arc=fail smtp.client-ip=52.101.225.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ebytelogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ebytelogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHCG3/WuFjhotGEuUHbvZLB+4SggxBVQHCj/0rGQsfmxlS/DvwPuQZJpz933Nu+jEaCh09pwAuaXsZY/AVuB+YsOlDwG/ARBgPHsIZt7BwWHToWD1Zl2ELLDQBvi6szYbUZ8WT9DevjEfc8V62la+0hymfBuuXgaCr3C4FbgUnddDtMNYyepF/BIdcgE2d8cVNQ1SZ9FGN8bYL21ByUCa0V4Gl+/KjomkgMTH8GN0RBk1/ErW1yj+TEE4aB4K4a6TUMRxmlTPU1KDEo2zzapK9/fgZ77Mr5b0haqszSXcqxnS6BvDZUhl1oE+unCikNvV5vfyOoU9rbktM7ZkEJfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojZ2mXdw32kVSt2/uLj7XldDPFmz5tzNJFnp6AwtOeI=;
 b=vKeLsQ3BmI0Ks6UdJg7l4zUAQ7y6y4OiLdtjEotZHSWldGwsK4hmln8OLdzbhJVNdkd+GGhEGyJr+o26mGMI7dPwBWOvffopiNbM+xPCZIQArv/Oh7IYEvzPZM9+WaF7dbAe3c7cJOiaGqdHx7SKp5BtYdON4N32PPPPnc8zNcPUcvkLCe9kuwNJGayfgPzu6bDePhDrSbrQZdN0S0PdTX9eDFwBr0xjShy/2uxXcFER9YDqQhgyvrpb5lEnXPEqBPSxkeXa7uoKGse3sE4yS0RqrMgOt0tVk4XTWVu11grCNpNqGqiUV1t+hFWQQrqddk0/2WrAklJ0h5u3NVEviA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ebytelogic.com; dmarc=pass action=none
 header.from=ebytelogic.com; dkim=pass header.d=ebytelogic.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ebytelogic.com;
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::97)
 by PN2P287MB1360.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:127::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:34:37 +0000
Received: from PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e]) by PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
 ([fe80::df75:6e8c:7def:a08e%6]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:34:37 +0000
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
Subject: [PATCH 3/8] media: qcom: camss: vfe-17x: do not gate write master done on IRQ_STATUS_0
Date: Mon, 14 Sep 2026 19:04:11 +0530
Message-ID: <20260914133416.1030231-4-hitesh@ebytelogic.com>
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
X-MS-Office365-Filtering-Correlation-Id: e962b17f-ec23-48e0-4b23-08df1264ebbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|10070799003|23010399003|1800799024|366016|3023799007|10067099003|56012099006|5023799004|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Z6Z+LJu+dl5KcsWY9cgrZxNurlSw1AGMh7k20HKJFr6uymMV2ZpIhWJXHV5JfVGVW+AxH815B6ZZPdWrLpEAAswRs1UQx2coeXzgZKiqppiCynuEO/pRAXugt76GYXEZGGAhgbdhQp3b/mY1TK171U2WRYrgGGXvQh8tvQXQIs10IIUSTXIvIENa3I8FO4HI6CuAbawey2QR7rGna4IlHFnw7ZTVnxHQWo778oAOm9X0IR4xKt7qyUW0DiYaa1oluACiTXju7KBN3lEfRwuwc74D6qGH937AoUggMeXjagt+0tCAM8uCP/aMfnNsoh90z5mXoTe/rltPYuassEI6TP4Hmc8tZu3fsMo1dG8zEFSvXTwdQm8ZevZ2fIE6Vk1GhT916oGdAiuVj4Dq/CBvMkc+IYYl52VR/tmPbucDgdfffm5Cz9nQUffBOl8Zr9Unr0U0QVPn7hiDZqLe/sS6JA1h9OX6mhQzPs/wBwfBJZHAoFbXTSVqFwaCZLBbpeBQ/j/WIpV9SCl76NRggBiJAOdXjKBLn5/h9pCbssb1qE11R5j40obyTH/VLdpW3ZFTMWGNyoC6qs4YQ0YTsAnJtzOSi5njUZZcIpTsacJyPz2EFCZjFhey+x5Xp64Vva0CThGQ1+9n9ZEt5fCKmfA1+OMMzQ8vQSBvw4eMcD1sUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(10070799003)(23010399003)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(5023799004)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zy3l3ZDQaUMlTVK+9XklhPHWNa96vn5NvenzBY0XSmWEDBKG2C0xxCFXQZ7o?=
 =?us-ascii?Q?0KkUmcXOHEsuXwbnDwJC6OjOZC//Vr9fA7fj7sL5yGhYOvxkTfm3TnsqY/2n?=
 =?us-ascii?Q?QqXH2D7WHw5reBupWsQTQN7kO6YVU4QPwQQS7BCWocrx6T3cvTSywr7ARSyR?=
 =?us-ascii?Q?ST+fAALWHxI9TS77Lmd+It6Ux8im0R2sLtPucnqrCXoPqZjUB7Q4fvsWOIQJ?=
 =?us-ascii?Q?e1unMmrevMT1dm3kq9e8k4XLmIB5UUq4+dDkZqf8sBDzEcZjXgnOrw/Seh5F?=
 =?us-ascii?Q?ACyjmRqnLpcpLsK2OURg6ktnTbHRgC662MIDOVgLWjuq97w6ddRmXDqypHni?=
 =?us-ascii?Q?z6UPfsTiLe5q6cwTYkIpUkpHb+2LyoW74lz4App4dbHyK71LW906A4+UzN7U?=
 =?us-ascii?Q?ejVB4o2JBSMmhUn1+csgp/wYE8Uh1lp9YKL9CeBvjmaTpWsNAqHTxHMQ4g3s?=
 =?us-ascii?Q?R3cy5fqBlRzAri8WrXy2ndaXtWhgDvuGAAKChfy7l+hXiX6XVzjCSQVvVSrG?=
 =?us-ascii?Q?lj3uAF3bT8HS4+Kpn4V39C/HUL1lKxyMW5Wjq5rUoOw7omAK7/omCrnyELor?=
 =?us-ascii?Q?Q5An2co62guqKJN8S1F0cX6tNnXtYTJgNSp/BQN+3JnS7eZhPq+3n+LkTVEP?=
 =?us-ascii?Q?pbC1TvhW5tai5YhMgrqZZmFxWTMBWkuXcgyYn8UinFRGrIwfSgbVmuahTgDK?=
 =?us-ascii?Q?17OlpaAK4KrJrfIcA2ALZYWJZs/v0DYIXuEaKCudC7S8Oa/q82GQWf9hfEh1?=
 =?us-ascii?Q?Fn/j9bchLcJ2kvJsQlBY3DBcxw5b/duOCETHWqdCdyi5NS3tbCnbUcr4A98x?=
 =?us-ascii?Q?K6YMv2ZK32WFYA2kLg9wVge3phwbjQI637RMHdLkmm2gyssJ0NXgdAlJdhkx?=
 =?us-ascii?Q?Itj+BbLy33NMTIM8tmE3sVe8o7i5vvgmWGiS+cXgG3ZshY+Zk+B2XHbkPP4Y?=
 =?us-ascii?Q?K5//ZZ69MgiWdwo2HZCdo7yrrVYZEibl7ZzivriybMw7+FQhlpysdsh23HWZ?=
 =?us-ascii?Q?RUCuPm/o8yHgeieEANiJBF3CcLTLeHp9A1GfwyYWkEHB3wNmw4cIoIaAfSyr?=
 =?us-ascii?Q?tTHP0shNOxziJdkxzQy81kD9dArlo3FDsCvAaAQkbfUXDSkOJbuSWcd3iUl5?=
 =?us-ascii?Q?iYQShvI0b/IKvhrpSfYtg1esxJ1BUWTqtcQobJyzLorurnSukJOOJYy+8wc9?=
 =?us-ascii?Q?x4Zk+rQQYN4c/IP9eyrX57WYRsHI7d44J8qpP047aecMY9jpg3Onm+hVfe4q?=
 =?us-ascii?Q?sJspkKiuOMrc9fy116LWLN2WUIJARP9tBxCgK1pKBdcvNrbXobTg+SHCk+EQ?=
 =?us-ascii?Q?dTsOm2ccY9zoFpKnIdxBXvcmneh3NlRGioKiZ1cORvXqrQgs1yFO/6r4SFID?=
 =?us-ascii?Q?06uRGEq3R3RX1ZeW6/UTPTer4zp4+Z3uzr+laMWQxbfU/NOKONXCPDBauWTs?=
 =?us-ascii?Q?XPpLvYu/HuGlrPHC7WrB8bKCTFSC0tbChKM8bSIYEgj50Q+1rIx/+PthrDjA?=
 =?us-ascii?Q?iMrqRKv5FHcoztkBh9xBo2rvSV1YcxVapoUqRf8JqhjboN8KdUf6y65fGrmj?=
 =?us-ascii?Q?Ab75pX6kwRmzI8KfxOrOCBG47I3zwgmE4QLlmFMgyivUUWOfAJXDHmW8WPwl?=
 =?us-ascii?Q?IDerFZW9Qwp9mwufmhgfGmUCnTMGPsOkC9bAn3VMr2lhLO1sEQ+2KAGbC9Ft?=
 =?us-ascii?Q?z+aHDWUcCJv844LAXkmsqWFWvXAHVo9OpjOVPKGZcCKUPWFszd+cj4fIpuqT?=
 =?us-ascii?Q?FfRRu34vyOnsKmK/cI2gxLoiYCjvNwE0wU/08n82DGQ54WtzhvynB+eLPFLd?=
X-MS-Exchange-AntiSpam-MessageData-1: QXmz9/9F8LdXiA==
X-OriginatorOrg: ebytelogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e962b17f-ec23-48e0-4b23-08df1264ebbb
X-MS-Exchange-CrossTenant-AuthSource: PN3PPF28092842E.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:34:37.1791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 13bdb17c-4ae8-490c-90c1-ec8121ef96ee
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: szyYeBR00vNRu78t6S0GQB3oPWM46LIes3H62sjaMH5khMFzQMzwvKWgF2UObOlKHQUViTWrdQI9GeZfOpLPmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1360

The VFE 17x interrupt handler reads and clears IRQ_STATUS_0/1 and
then reads and clears every BUS_IRQ_STATUS register, unconditionally.
It only acts on the per write master WM_CLIENT_BUF_DONE bits from
BUS_IRQ_STATUS(1), however, when bit 9 of the previously sampled
IRQ_STATUS_0 was set. That bit is the ping-pong flag of image master
1, which says nothing about the other masters.

Those two reads are not atomic either. A buffer done that becomes
pending after IRQ_STATUS_0 has been sampled but before
BUS_IRQ_STATUS(1) is read, for example while the handler is entered
for another line's RDI SOF or REG_UPDATE, is cleared by the bus
status read and then dropped by the gate: wm_done() is never called
for it, the buffer is never returned to userspace and that line
stalls until the next frame happens to line up with the gate again.

With a single RDI streaming the window is rarely hit. As soon as a
second RDI of the same VFE streams, which is the case when a CSID
demultiplexes two virtual channels to RDI0 and RDI1, the interrupt
rate doubles and one of the two lines loses buffer done events
continuously.

The bus status is read-to-clear in this handler, so once read it is
the authoritative record of which write masters completed. Act on it
directly, as the gen2 VFE handler does, and drop the gate.

The write master of a PIX line is skipped: its buffers are completed
from the composite done above, through vfe_isr_comp_done(), and
completing them here as well would return two buffers per frame.

Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-17x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index e5ee7e717..f62fdabbc 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -363,10 +363,13 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		if (vfe_bus_status[0] & STATUS0_COMP_BUF_DONE(i))
 			vfe->isr_ops.comp_done(vfe, i);
 
-	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++)
-		if (status0 & BIT(9))
-			if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
-				vfe->isr_ops.wm_done(vfe, wm);
+	for (wm = 0; wm < MSM_VFE_IMAGE_MASTERS_NUM; wm++) {
+		if (vfe->wm_output_map[wm] == VFE_LINE_PIX)
+			continue;
+
+		if (vfe_bus_status[1] & STATUS1_WM_CLIENT_BUF_DONE(wm))
+			vfe->isr_ops.wm_done(vfe, wm);
+	}
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

