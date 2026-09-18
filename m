Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011044.outbound.protection.outlook.com [52.101.65.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AFB4FD295;
	Fri, 18 Sep 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789741301; cv=fail; b=mZG0/zrOjsX23iQXXpfrBjyLp+HigofOkO9KBUU0vaqsvlC/coFvJ4pD5wGms1RxYvzdrJcFni6831GUfEvup7nPoWZofjMqLZ3iu6Cvi99fz3nERQriMJ+LcGYtZq0uBbGoXHbOnaVaoh00cOFFOACImLru1MgXcguSP5m2Kr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789741301; c=relaxed/simple;
	bh=EROl+aIjRqX+nkStNlqD9pbOweYR1V3yAhrEjOttdAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=icQBM2Rmh763bZj1KA/K/Nzt0LFmP9joFb1LTFZz4nBqmdp/v5DNMiD/BFdJ3blCCUVxj0BveAmM2y+rspjQXP/40xgp8blONwK3sOPV03fOVVLCpMFL1+i3doECx2eC7CiAEAO8NErpwWuM73lNfjvwpztTiFItMxQj2MfF3lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UHkuwW7V; arc=fail smtp.client-ip=52.101.65.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UHkuwW7V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWrsM1Dct+hlOgnFqooM1uhmHWIVDm/h+5QIf3Q0CspkYRwR21ZvCs9gP6huBRuI/HMq5bKA15I19VNxl/PnFgzirLtIClnf3Atszo67//j8+04gIlug7SuI4F9FM6BOSsY18ukTHgbcZwcxrTUrE+H/e3KAuXUi2xLCqIuS/0ZFAyeuiicmZjy3ZaJjevY7dbe3rbETwUu1WVRU5iSaEysjvK7RzF5WSaib7LWNqmxNPXFLBWxHXbfEev8saEI7okzejJZnBu7DX8tASd0jjQzO30rgrim4W81erR0YhorYfPdpdSkiDKn59VST7cghDa86srroGWoiMxf8vrWnWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvpRAgjpPu8BvnLU6MpxRN7ZJdfDqg5AYLix3SjE9mk=;
 b=WGIUVdoGkCKqe/gigmPfpcIPG1zljkgvEfgi5PGbSUvmRdduu17G1ddJBaiCs+Yy9RmaYGuFgg1w9SXMbXJnJWY3QPq5rv9+XyXBMaS4OkYLOtqAuwqTIhekmCBhdK692sXvEfT1CT8yhQtALMeogBV009Wt6W6kkmHROXB4l/VDEkzx7lEkp2lkIEUvmUZRfsvgZYO+C6446+V5JVy8hkTdvnO1WX2VkjG+yyg+Ob1IMWoMTH/nBOT7TcCec1lHs65pxGd2fNv0O1DWZBSuBBrb6BAjeJbHYDaE1J7SAksulqUM+y+EEdimzCcQU1Ccfui4f2GsjZSU1pRBN6t+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvpRAgjpPu8BvnLU6MpxRN7ZJdfDqg5AYLix3SjE9mk=;
 b=UHkuwW7Vfndjd3j8Q8fS066rSCjUmS9vpCD9KRcujiLbHyqztfJQf8W/gA/NU9Tln1T73e+IBzmU+t9mvp3qZzFYIGIklEBxmaEsPhyMuVI8nqsuERF71bvrCekdNZWUdRiMwv79DB4TfilhOu19bPRwzk9ZTK05ZUmzuJWj5CB+9/X490gBwhvqNr+c7a47SPO46pZHFHBib31jk1uV891ahxssApyrXYw6naqMFgN6R8FHqusRlfFeBO3KmPFsdZZ1ZlLf6nevblpvA5c8VfQqhruDwfZZJ8M5vQulNA8pnvWDLf+vzxZGcqcXhdCSl4LfxkZhvpuqvylTC7mvgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by DU4PR04MB11846.eurprd04.prod.outlook.com (2603:10a6:10:627::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Fri, 18 Sep
 2026 14:21:34 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 14:21:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bin Liu <b-liu@ti.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	Kuen-Han Tsai <khtsai@google.com>,
	Martin Rys <martin@archlinux.org>,
	Oliver Neukum <oneukum@suse.com>,
	Peng Fan <peng.fan@nxp.com>,
	Nikhil Solanke <nikhilsolanke5@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <blum@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	Victor Krawiec <victor.krawiec@arturia.com>,
	Jeffin Philip <jeffinphilip14@gmail.com>,
	Fan Wu <fanwu01@zju.edu.cn>
Cc: linux-kernel@vger.kernel.org,
	Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH] usb: use assign_bit() where applicable
Date: Fri, 18 Sep 2026 22:18:50 +0800
Message-ID: <20260918141905.3023171-1-peng.fan@oss.nxp.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|DU4PR04MB11846:EE_
X-MS-Office365-Filtering-Correlation-Id: 793c1d1c-b092-4925-d2b3-08df159024c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|23010399003|376014|19092799006|56012099006|921020|10067099003|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	NA0glPZIJ3kGcY4b/DsFVNRwUgb03YcjAiih4G91ubpWaXFHJp0752lX5J8CywzgEJ727j6tXiiPm2TtN0rosFxX8dTOMPAm3FJjH/9pwedemLh32gWMfjd7gf0iK5+ufIruYupyjxh8a8BDAxo91K8BmXD604qE2S4VnCwZ4KkNsfu6CFnbQC0QlM4LuX5+5eISEut7jOulHiJtddJcd0ehgCQ9lOpCJv5mOWXMD6ZOK5Zdov44LK2XgwdoqI+IDSbKLgU5wkoePaqZVEhAqLm/uNyoLLARi8kd8nf8909SaNanVCh/Gddf/RO3ZDQ9/KFS5sV2xEP6VNr3wWD6HQwuRKKUbjw4yaX+QrnFhtb6bbA8vVDx6EtC2yAbDqp2V2ug/skG2ub7TQGSQWzM5QAK48cz96i6pQlkKz077dHSf40TMx5sr2MP8UK9uUWxFmrUS+nddEyeqJSweijl3/6U7Vl8ZsSsU84oDyoYcFvhMMJLvowH2sj2HiH6TTO0gbfVj0mTnSNj7bKJ3uqJafG6iv3HwGCGMR/Ak7hrhtiy1u8Zyx2XjVQAZOedV6DRXcWXae5doAu08utC71TAETICbWzeZWf32xFLGut/oIlkXyucPMesQXzX9jVzLtENnIf7kHU19V09IB3FBArdbREA5Jz8HklzR2LgjFeLkyceOQpibOzrS4MqTApJ1pPabU+berZ9nSipJ+kmztSGBQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(23010399003)(376014)(19092799006)(56012099006)(921020)(10067099003)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hYxN8rg+vOwf/qSnnwyoDUaBiOL2ZgVDK4cJA0cPiR+x6uDfLkENrRzly3Sy?=
 =?us-ascii?Q?0iwEfhBzr/g+ym+xs/yW/tKEkBCKxZ6vNCZ+HI1QlLX2gPJUnlGsagkuOlv1?=
 =?us-ascii?Q?f5KxawDcKtaKNlvhb6tYZxfyYeoNGW1pttYVofPpWgwd/KaUT18qNPnIPn3J?=
 =?us-ascii?Q?x51+82s1+izsRBR4VF4Fymz1MjVy4W/rstclliFj6HulXwJeGWaPtZcoIe7w?=
 =?us-ascii?Q?PbhfJfxvfrpixq5cu2ggiU26X7oUEAndJgExEFIGG3psDWvGmhU2ym2ugPRd?=
 =?us-ascii?Q?SkQ1MZByvRDsYyptwE0xQ+UI1o0SzJyMbZTBo6iuKuMtO8I7MPwyqZ4GO9kP?=
 =?us-ascii?Q?LYF4J9kZh329LzgBBOCzije4zNhmx0ZGHTpVmffhnRvle3jgJN+fNrAHU96y?=
 =?us-ascii?Q?HQQXFr8gOyC8zGxPS2zXR6t+FHq9lWhQHUJH03SW+6DdoDs0Ry0gOT7E5EOg?=
 =?us-ascii?Q?zl54+xu9O1ShjG/N9txg7+hcIEBFqbd2Shv/Z1L0CuoTc7JHbZXpy4lyIFzG?=
 =?us-ascii?Q?2By1sVRNAetkpEboq5hF8Bwm10T4tC439+wI3D9eRSPHHvyFNSIk4UGM8Jqm?=
 =?us-ascii?Q?sDIqqdT/fbRiQyRm3/oQvxE4pV/sah5yaC4VVwck8/lCMdQKyTw1a1CX9YDk?=
 =?us-ascii?Q?3oN8csvgNLeJNuPcygkOmMNwU7Hk1fjxcK4iv/QgmsJ0Fw+lvB6/TqwtHqT+?=
 =?us-ascii?Q?DEpP1Oull7kH1EfeX75f2k3vA93hv0XVUyIcVM/c0f1YEMU4vB6j+hKkxpdw?=
 =?us-ascii?Q?dEp4XRYlITj4NQn7fx/KPYg3Kpx53FY+y2GsumnSXIh6BH4QkdlaVkAeelOp?=
 =?us-ascii?Q?8k91kgrwCNlB+ph9TvYCYw29eUMKrNU1Z+K9lo7D2YCee6WHrIF1TTB/Rmbs?=
 =?us-ascii?Q?ggWBeZmoY5V9pRWAvK2LVE+S/9Dj7VTg4HqyxI/Ec8mcvnfs2PtYPfTO/3Ji?=
 =?us-ascii?Q?/dJG0/vKzJoorHr79A5/XrOo6VDLucle313DJl329ey/slhk9qMz8ChfxPEK?=
 =?us-ascii?Q?CL+GqYZaULDX5E5LwkvYH4gEPDgMEfvdxivSdmmjxGacKsYPHS2pHTetjAeQ?=
 =?us-ascii?Q?t66upO5Te1hTmAnfC59vl9jWVAOOAEYiZUAkzhV9azEHQbHAtsBmvhf13Uky?=
 =?us-ascii?Q?3oBsxKsHXGmXiv+oaUYIbPt2/4mrT23DFchAN1kmjW3eA8M4ry0aMTxdVllX?=
 =?us-ascii?Q?MkMj9qxLrCI2+zqaAn8B4EVY7lbyaW2bVrTOetB56UvHRezDb9My0ZXUnCIW?=
 =?us-ascii?Q?Jx0MoCaal81Mksofq3u75PBl0T27OTSFeihRP4HkodcuPhHKOuKbyUHKboCe?=
 =?us-ascii?Q?WaLe2o1esAeYUGqCv2D3sJsMCXwnqAzAivlMf5PI4j4L83QhwAveXupek5TN?=
 =?us-ascii?Q?0A8tWcRD/aKOWgJCGzJTh3nOBGq6krMZDW5c+Lsh3Z9fdyW/LkzM29cUjyYh?=
 =?us-ascii?Q?BQf/qvq+DO2d35hqrV8yFXwR0JduO3l8+6Ur8+msDkBrBwdK6QRT0gjQyQ/u?=
 =?us-ascii?Q?cNE7uG1pUFRZX3ef68XpneZV/swFxiiZA6XCA10AghazzMN7XL07jAnNp7nA?=
 =?us-ascii?Q?dQhPwDhrzajAvz5uOI40ofDcNbIN4r0ct/ooVYC2VluZmEE9GgIwrcxDYgdJ?=
 =?us-ascii?Q?VVlORAZ/i7W5tlYwjaWtiO2N76kieIzhQlA/zfPBFJiF32z8aBVmgI/5rUQG?=
 =?us-ascii?Q?i629ve85djDEiV7APZWVJB6muFw2RF9Bq86qnY0vTULIxNWyNap90qXVK3gz?=
 =?us-ascii?Q?+2wz2RXN3sh2mbSdT1E7R6HTGumYdI6N1vYZcTTjAZ/no7+j6HsI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793c1d1c-b092-4925-d2b3-08df159024c2
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 14:21:34.7137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VznhkuaqeWLv9EvKIA7jXOdiMyVyfd3mMW8lxt1z5c9L/gCloawLfdG9qXyCRk4cIJtOb4ibfF+VD8ZcwGnVHh8/FPYvdl58gQcCygZB40neEORhdC1aI8/LDeAtMo46
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11846

From: Peng Fan <peng.fan@nxp.com>

Convert open-coded if/else with set_bit/clear_bit and their
non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
API.

Done with Coccinelle semantic patch:
    // set_bit -> clear_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        set_bit(bit, addr);
    -else
    -        clear_bit(bit, addr);
    +assign_bit(bit, addr, cond);

    // clear_bit -> set_bit => assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        clear_bit(bit, addr);
    -else
    -        set_bit(bit, addr);
    +assign_bit(bit, addr, !cond);

    // __set_bit -> __clear_bit => __assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        __set_bit(bit, addr);
    -else
    -        __clear_bit(bit, addr);
    +__assign_bit(bit, addr, cond);

    // __clear_bit -> __set_bit => __assign_bit

    @@
    expression cond, bit, addr;
    @@

    -if (cond)
    -        __clear_bit(bit, addr);
    -else
    -        __set_bit(bit, addr);
    +__assign_bit(bit, addr, !cond);

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/usb/core/hub.c               | 5 +----
 drivers/usb/core/sysfs.c             | 5 +----
 drivers/usb/gadget/function/f_midi.c | 5 +----
 drivers/usb/host/ehci-sysfs.c        | 5 +----
 drivers/usb/host/ohci-hub.c          | 7 ++-----
 drivers/usb/host/uhci-hcd.c          | 6 ++----
 drivers/usb/musb/sunxi.c             | 5 +----
 7 files changed, 9 insertions(+), 29 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 199d3f535a89..25a1cba39063 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -902,10 +902,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index d22dc78457d7..25e8af8c1bd7 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -1032,10 +1032,7 @@ static ssize_t interface_authorized_default_store(struct device *dev,
 	if (kstrtobool(buf, &val) != 0)
 		return -EINVAL;
 
-	if (val)
-		set_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags);
-	else
-		clear_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags);
+	assign_bit(HCD_FLAG_INTF_AUTHORIZED, &hcd->flags, val);
 
 	return rc;
 }
diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 63fb6ee70a3d..eaec5a517faf 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -769,10 +769,7 @@ static void f_midi_out_trigger(struct snd_rawmidi_substream *substream, int up)
 
 	VDBG(midi, "%s()\n", __func__);
 
-	if (up)
-		set_bit(substream->number, &midi->out_triggered);
-	else
-		clear_bit(substream->number, &midi->out_triggered);
+	assign_bit(substream->number, &midi->out_triggered, up);
 }
 
 static const struct snd_rawmidi_ops gmidi_in_ops = {
diff --git a/drivers/usb/host/ehci-sysfs.c b/drivers/usb/host/ehci-sysfs.c
index 5e6b545c30e6..83bbcf759435 100644
--- a/drivers/usb/host/ehci-sysfs.c
+++ b/drivers/usb/host/ehci-sysfs.c
@@ -48,10 +48,7 @@ static ssize_t companion_store(struct device *dev,
 	if (portnum <= 0 || portnum > HCS_N_PORTS(ehci->hcs_params))
 		return -ENOENT;
 	portnum--;
-	if (new_owner)
-		set_bit(portnum, &ehci->companion_ports);
-	else
-		clear_bit(portnum, &ehci->companion_ports);
+	assign_bit(portnum, &ehci->companion_ports, new_owner);
 	set_owner(ehci, portnum, new_owner);
 	return count;
 }
diff --git a/drivers/usb/host/ohci-hub.c b/drivers/usb/host/ohci-hub.c
index 84d10a932942..1ebf6aa4b2a3 100644
--- a/drivers/usb/host/ohci-hub.c
+++ b/drivers/usb/host/ohci-hub.c
@@ -518,11 +518,8 @@ int ohci_hub_status_data(struct usb_hcd *hcd, char *buf)
 		}
 	}
 
-	if (ohci_root_hub_state_changes(ohci, changed,
-			any_connected, rhsc_status))
-		set_bit(HCD_FLAG_POLL_RH, &hcd->flags);
-	else
-		clear_bit(HCD_FLAG_POLL_RH, &hcd->flags);
+	assign_bit(HCD_FLAG_POLL_RH, &hcd->flags,
+		   ohci_root_hub_state_changes(ohci, changed, any_connected, rhsc_status));
 
 
 done:
diff --git a/drivers/usb/host/uhci-hcd.c b/drivers/usb/host/uhci-hcd.c
index 433d64a5fab5..efc1e01005fd 100644
--- a/drivers/usb/host/uhci-hcd.c
+++ b/drivers/usb/host/uhci-hcd.c
@@ -376,10 +376,8 @@ __acquires(uhci->lock)
 	 * doesn't work, then we won't get an interrupt when a wakeup event
 	 * occurs.  Thus the suspended root hub needs to be polled.
 	 */
-	if (wakeup_enable && (!int_enable || !egsm_enable))
-		set_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags);
-	else
-		clear_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags);
+	assign_bit(HCD_FLAG_POLL_RH, &uhci_to_hcd(uhci)->flags,
+		   wakeup_enable && (!int_enable || !egsm_enable));
 
 	uhci_scan_schedule(uhci);
 	uhci_fsbr_off(uhci);
diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index a6bd3e968cc7..347f547696b3 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -208,10 +208,7 @@ static int sunxi_musb_host_notifier(struct notifier_block *nb,
 {
 	struct sunxi_glue *glue = container_of(nb, struct sunxi_glue, host_nb);
 
-	if (event)
-		set_bit(SUNXI_MUSB_FL_HOSTMODE, &glue->flags);
-	else
-		clear_bit(SUNXI_MUSB_FL_HOSTMODE, &glue->flags);
+	assign_bit(SUNXI_MUSB_FL_HOSTMODE, &glue->flags, event);
 
 	set_bit(SUNXI_MUSB_FL_HOSTMODE_PEND, &glue->flags);
 	schedule_work(&glue->work);
-- 
2.51.0

