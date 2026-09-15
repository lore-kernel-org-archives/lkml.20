Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazolkn19010023.outbound.protection.outlook.com [52.103.32.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245C54A5C38;
	Tue, 15 Sep 2026 15:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789487975; cv=fail; b=P4WxkOvXvBIvDKCSUY5nVodU27/ALmKiGbtNYwadzWOADtRlihbs/XBLGWEi6rm0oVwVZwKTjBRyN/2gdRfxZcqYdxPX0lvAb+DFMDEoEtAMGLKiiJW9XO0VzgC/jR3iR/atzwllShEa4KjBdBLJ8StuMRbloeDFUSkYoyJTk/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789487975; c=relaxed/simple;
	bh=4WNqPyO1EJjW6yRwms2Tou3oa7TvxFURxIJDGTFVir0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jAHzNXN9XfvXZeucm3cEFc/bR4/fv4G0mi/vG9LiQ+m/NcmSnD3SAl8kKVzaDHeoM4maV2Q+s1umoUfnLyb07+jIyxZQHj/n6uQ2PubyyXiCstjqSL2XuZXByUx/k7W/7xqcbbRPvAWVZ0FdPOXehm2vjRYqyYQ385QRpBIByHU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de; spf=pass smtp.mailfrom=outlook.de; dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b=g+mzvWgc; arc=fail smtp.client-ip=52.103.32.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=outlook.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=OUTLOOK.DE header.i=@OUTLOOK.DE header.b="g+mzvWgc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFNz3LFIaTPLjwb44EO7Pfz7FjDuZwZZCKeqapfawaqIc2Z0w4aKdY/CqlOoLncv16FpIexrg8WwHe4URBQoL6oN0872+Fg8LTodHe0faZcAibLN6FFiRbptsAZj+xYUVwCAEcV9Kvcu+LIx8ntepYk9Xdl3INEvpwcy4hwgOkQGQP0Qe6hYy9Rpoyl1YqxmIqDxZSZSa+NkLh/Z1tQX0enEA6OhlihxKE8XdUCUNzEH3m3RM1ggJjJw9aPQfvgAlKv8sUJrh8YO85W8PPLO3lSH7fcNY1aEuFlSL7R9TbgMDlzTOMK7JcBbes/R2ylM2c3zpOseOzCrNvjjmw7xhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KN+pSNUTDaJzwY+tFGc1+GNldwKyYYTHp69T+N17z70=;
 b=oXTk/T/fwd5zEr48YYbXPWFIOxgKn+I2IrE8BDBf6SKF5rChspMJMV7wPB7YlL3R3yox1eVG5qpj2x9iv2rTJ3qx/2g9iH2IagBAxoYT67zQbWQtk+VdiPq/RsSshxxDfMhra7ym9MTyaknIGzjn+wbkFgcAbrXxM46FNAzV6cIcHdlQQtGPgrNy5IWqlKR8WpGs8td41mSlIBX8SSJY+YpICIU+ekmpASY57p74IGO7iOUX56ACAYk8C1MXv0+ZlQcVk43+TTHrWYc9Nk9pSQjgUSkSUVEOs8FyX4Osnlu7XVOZlTrbjc5J4O6ibbmyNilo9lM+twXklP6kp40wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=OUTLOOK.DE;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KN+pSNUTDaJzwY+tFGc1+GNldwKyYYTHp69T+N17z70=;
 b=g+mzvWgcR8nJUGCMYMRGI4dHNLfcIZdit3dXxx1IX+A3L+JeJXJAkNF+CmUObVOHlUSqVx1K64LB24exakkYocbpZiogqZCnUUfaHd9XxEViCHrbJXrk2nz4EUGEXd0RnyodUU9Y8OvQA9OlvZ+0RBastJ+sduC8sp03AZ+hzZ16QgN6daaK7/TnsBFDUjPCp7ikSKECpLxmoutDkrK5Oy6dVp1JDIbh2fvUSKX+wv3TXOy7yKm2PxaHE0hJ21djlWGKUjQUVssLgRxM0/BhdNHgmVANnLwjjrniSOX9ZwlOAZgsdf7d0JxBziAsb6I4eBe6HUqvY9sqzz0+yysv7Q==
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:6b0::11)
 by GV2P191MB2334.EURP191.PROD.OUTLOOK.COM (2603:10a6:150:d5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Tue, 15 Sep
 2026 15:59:23 +0000
Received: from AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883]) by AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 ([fe80::f9f:9408:b010:9883%4]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 15:59:23 +0000
From: =?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
To: perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Luca=20Rodenh=C3=A4user?= <otzelot2021@outlook.de>
Subject: [RFC PATCH 2/8] ALSA: control: copy the card bytes outside snd_ioctl_rwsem
Date: Tue, 15 Sep 2026 17:59:02 +0200
Message-ID:
 <AMBP191MB2886BC8F731179ADEAE6CB63CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
References: <AMBP191MB2886193B1F896974A7CE23E1CEBA2@AMBP191MB2886.EURP191.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:6b0::11)
X-Microsoft-Original-Message-ID:
 <20260915155913.421839-3-otzelot2021@outlook.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBP191MB2886:EE_|GV2P191MB2334:EE_
X-MS-Office365-Filtering-Correlation-Id: 927b11fe-84ee-456c-f0e0-08df13424f2c
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|51005399006|24021099003|55001999006|41001999006|15080799012|19110799012|5072599009|8060799015|23021999003|6090799003|25031999004|22091999003|24121999003|40105399003|12091999003|26121999007|2607281247196008|18061999006|3412199025|440099028|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGg3aGd0RG9XSjc4dEsyejBwZVl2VlhPeTNkVUpGdUl1SHlzSnR2endPOTcz?=
 =?utf-8?B?SVdGZDdDOVcyYUJMazdjcCtDWFk4amhCeDltWERmbTNCaFJNSlBBbU9heE13?=
 =?utf-8?B?RElEQWRkbWhjclNpMnU2OHpGaHdiUGt2dC90TkhRSWN0OW1hTVB5a1h1ZnVJ?=
 =?utf-8?B?NEZLdWpWejFWTW1KNTE1aU1ERDVJQTFzZW0vWUpCQ0l1TDU1WXZZMmFFSm4z?=
 =?utf-8?B?WEhwdFRoK05PMGp3V29MY1dMaGNJbHF2TjN6V2RlVm53ZUxIYzVKN2hrOVg4?=
 =?utf-8?B?T00yalpBUjQ0cXRya3pMVmwrK3FOaWpPenV5NG9XY2VlZE1PVFBDT3FXK3Z6?=
 =?utf-8?B?WTEySU5UZFd6dFFZK0RYa21PcHBRYlM5OVVMY1lGN3BqeU9aN2pZVmFyNlZ0?=
 =?utf-8?B?R2pabGdyYnJ1NTA3cEpCRWU5T3BLMjkrWTNNdWEyQUM0MjAvcXlDY01xNXJm?=
 =?utf-8?B?MkhUNThEcUVjTHBIaElFbXZKTjkzREcwVWRrRWxvWGxqQU5oRjV5SW1sYUVJ?=
 =?utf-8?B?NVkyMXJCb0c1YTlPYnd0Yk0xNktkWmk5ZWZBcHh5L2Z1b0hQZ2NaL3lyci8y?=
 =?utf-8?B?S0hzMTM5eDlteklhdko3ZEFSU1I2cVJmQjd1VUY5MXdEMHVCZnFPOHhveEF4?=
 =?utf-8?B?TDdsNUFMVU1SYzN4L3QxNy8xUzc4VlZLR2FEaFMzUlZScnlIVFhSUS95UjV3?=
 =?utf-8?B?K2R3blZYbms4cGFZMHJOQ3dXN3NnaGZvYldrNHlSSy9VUUFMNURITkF4dW5L?=
 =?utf-8?B?ZHJrcWlUSVlveFBOK0JKUU1Pa3VxZ3Ixd1JUeThEVGdWK1AvV3BDM1FodFVz?=
 =?utf-8?B?eEFrVjNWSnp2ZENKU3RuRCswcFg1V1A2SEJ4dG4rdmY5UmZrL2wwOHlSbUUx?=
 =?utf-8?B?N0tzcGhMM0l1TEhTcVhiYUpQOVpsOTFYWWxSZmZ4MDFHZmc4S2ZEK1EzWS9y?=
 =?utf-8?B?aGlkdjhnb2ZYWVE4WktkblR0UHRZeFNXN3YxY0Z1N08xZ3lBK3hReGo3eHdF?=
 =?utf-8?B?S01SYkc5OXMvdkZOV0ZURWZUcUpBWjdrdG90emxVZlJWNjZIUEpxUG9HMU1w?=
 =?utf-8?B?Z292MCtKMVVpM2pJc3lrN25OemVMdEFUZGxqWXAxT2xpY3RiZUNLdk4zekxG?=
 =?utf-8?B?ZmVwWG5HRHAvWG8vK0F2RFFSeG5nenZSdjJsNVUxSkYyVGVqL1BNNDA1YjN1?=
 =?utf-8?B?Nk5JaWhSc1FJZ0VQb01jYXBhMVFaQTEvSkJVblpSU0xueDhOM0h3MDFGSmpO?=
 =?utf-8?B?aTBDYmh3RHNkekl3ZWhFVGRIc1RPYlhTSE0vQ0p3MEdoRmtqckJzamlWdmJN?=
 =?utf-8?B?Z1VWc0xSNE9vZFJrVUI5eTkvUFo0MThBR2tXbS9pUE00SU9QYmxlS0YyQm83?=
 =?utf-8?B?SmxYOFNYOXkvSE9jblNIdGFNU0VLaTA4Q0xYVUMvb3dnY2RtQkw2aWU0c2Vo?=
 =?utf-8?B?Ui9aeXQzME0yNmZXUW9TZXZrUDg4YkozZGxBSlVldVVxYXF0LzJSOTJPYzNT?=
 =?utf-8?B?Q1VnU2tvd0ZldTU0ZWVTWVNxZVgrWjFBTWl0ZlY4REY4L2xaTjc5VTNzbHJX?=
 =?utf-8?B?YXNoSjM3bnJteEdiaXhKWC9FU20zdnZEa3B6MHordjNOeFdmYzd0K0IwblJS?=
 =?utf-8?B?NGtXUEhNNXVmWjZCeHIxdG52RGxybjM4K0xHTjRNM1NzaFlKOG5FS042aFdV?=
 =?utf-8?Q?708B8C0GvcIvhSS0NJxl?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGtYUjlRRmZKc1BIUXZ5MEpxUXJ1ODhwRDg2NXVwbmV4N0FJbTR5Wkh2ZGg2?=
 =?utf-8?B?NTdvVlNpaXJTb3NmMkhSR25jb3MrdVNpUkVjcDN3cDM2MGRGWFEzUmpnQTFG?=
 =?utf-8?B?UXNQR3dBWDh6dXdQZEJ1d3BXWU01SkVpcFFwZElidXhETFhaZXBGV28rWWFH?=
 =?utf-8?B?Q1dndTRoK0tMWllHV0tDcTBHMS9LVUdYdmNrVFQ0UWQ4bTFzaE51WlBpaVU1?=
 =?utf-8?B?QnFxUHVZK0NKdjdjMG1yWWtWVU9zaSt5NlNETy9ZOXRhZlBSU09SamdZSzRI?=
 =?utf-8?B?RWFmb1lZYWxCSC95dldmTTlSMnI4R1FNenBDQnZvSUJGbTQxL1hieS9YeWdi?=
 =?utf-8?B?akpaeDMyNDJHZFg2WkVwS2o2WlNEWXZpT2Y3S3poTU8zakFLQmtyS3NZVDNr?=
 =?utf-8?B?VDR2WmdTZVVCMGNUdkRwNVYwcFJYdWxETmxHOU1pRUhBUkpZVndnNFNRSDdE?=
 =?utf-8?B?MEpLelZEUER3Q3lLZmVlVTZmNG40VTJCWkx5TmJMZnhoVHJaejloZlYwSEJu?=
 =?utf-8?B?T2h4L0szQ1ZXNk9KcG5qbmQ3Q0duakJRVFRMWDZOQjRCOVpVZDJnOUkwR242?=
 =?utf-8?B?ajROb0RhVFZsNHA3RXoyZ2tMVUk2MVZVR3EvL1F0N1VYcFBleS9NN0hURUF0?=
 =?utf-8?B?S3FldzlCbnpLUlRxZko0L3hDOC9ZcVBGTW1WSkF1ZHplb3ljc3Y5M0ZUQ2lq?=
 =?utf-8?B?QnF1Rjg5Y3kzTXVGMHhLMEZ3TEJIMFBUWUVaSmFZNld4SnNETGZ0L1k2WmxC?=
 =?utf-8?B?K1VuR0ZCSlJMKzVYbUc5MmRlMXNGbG9FMVRwMDVsRDVZY3pWYjRndVpuOSs3?=
 =?utf-8?B?enpBODdRNDhDdDJNb2srSERlUHhCSXJyZFlOWmxjYTIySzFNWkdlT0hPNnpL?=
 =?utf-8?B?Tlh2WThIVDZiaHZOMXE1NW1HWjFtb1ZzeS80ZGJqU2laak9xalRUMmdGM3Vk?=
 =?utf-8?B?VjZGZC9FS2kwd2N0NnZaWnVPRzZtSGF3Vmx5ZllxcW91SjhtNzFkQXBzUFdq?=
 =?utf-8?B?U2ZIWS9RRGRDdGhFOHVKaVZYUE45UFhCYzFjaDcyelJxSG9iSkJDbGl3MEJN?=
 =?utf-8?B?L2J4dUtTUUtIN1MrQWdiREIvSHZlMlRRRDgxUW5HNERjUHg2MDJXQkZKRDZH?=
 =?utf-8?B?bGd3ZFB1QmhuelpxdUtkSDQ3MlJyZW50S2FUL2RnNnlDbDVtWkFtOXB5aStH?=
 =?utf-8?B?WG5aMjJqUVFma0NtSDRtczRWdnhuTUR5N292RjN4ZkVPdE80YmdqME4wdWlC?=
 =?utf-8?B?VExuamt3UHBLR3RnYVhrN21tUWxxMXZoNnRWNHphNVdmblVSTHNmNjZMVFUv?=
 =?utf-8?B?bk5IZUwrUG5KQUNNay9vK2crVUFrTURXNmd6SEhXSk0rdDV1dXU0a2FXSWla?=
 =?utf-8?B?L0gwY2VDSy91aGhQbE8rVDZMdFQ4eGRRZmZ5NEVrY3UvTFBmM2VrU085S2x4?=
 =?utf-8?B?RXBZZDVzY2ZoYVJUU25aYmdiOVBRRjM1OW9uRXZpWlFwUmcxcGt0L0VkUnRr?=
 =?utf-8?B?ejgyWFU0ekNhNlNVWFdPU2ozNk5BZm9WdEtlek1aTGdBSFlVY0lGbldqT09r?=
 =?utf-8?B?Q09sVHcrOGJwZ0NDMzdvU3JzWmJ2TVhBK3UyMXl0OGIxdHZtVWhCTXJVM3Zi?=
 =?utf-8?B?NGVnTit4Y2VyaTQ2S0hqcDRFcDQvaXJ5ZkY3dm01ZXBTdTQyM3dsKzg1TUx1?=
 =?utf-8?B?WnhEVEw3QUhYQ1NGYmMvZmo0aEcxUkp2dHBaU2YzYUJUN0VObW5SbEtOQmlW?=
 =?utf-8?B?N09zK1VxWEk0OWZNZ1hXMUswSDFnaUVVVE5FS21xMi81MEVWOTlYOUpZSmc5?=
 =?utf-8?B?MFJicVd6aTAzYWFZM052czRSQlVGd1NMemRoQ3dFSmtENHNXekZmdmg3NjZa?=
 =?utf-8?B?M3RjdGxXeGY3VC9LT2swdldua2RPVmxlQW9WdHBHS2tWbER2NGhJVWl0bzJN?=
 =?utf-8?Q?vXQt2YBktrCRpSifQAA/Je0ncLvJIHqN?=
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-061ba.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 927b11fe-84ee-456c-f0e0-08df13424f2c
X-MS-Exchange-CrossTenant-AuthSource: AMBP191MB2886.EURP191.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 15:59:22.8875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P191MB2334

snd_ctl_card_bytes() holds snd_ioctl_rwsem for reading across its
copy_to_user().  That lock is global to ALSA and is taken for writing from
the card probe path, by snd_component_add().

A user buffer that faults can be made to take arbitrarily long: with
userfaultfd, or with the target buffer mapped from a FUSE file, an
unprivileged process controls when the fault resolves.  While it holds the
reader, a writer from a probing card queues up behind it, and because rwsem
is writer-fair every later reader queues behind the writer.  Card teardown
then waits on the probe path, so an unprivileged reader can stall the
removal of a card it does not own.

Take a copy of the string under the lock, drop the lock, and copy to user
space afterwards.  The extra allocation is a card name sized string on a
path that is not hot.

While at it, report the required length even when the caller's buffer was
too small.  The -ENOMEM return told the caller to try again with a bigger
buffer without telling it how big, and data_len is what the query form of
this ioctl exists for.

Assisted-by: LLM
Signed-off-by: Luca Rodenhäuser <otzelot2021@outlook.de>
---
 sound/core/control.c | 46 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/sound/core/control.c b/sound/core/control.c
index 4199342d4f..e404cb55a5 100644
--- a/sound/core/control.c
+++ b/sound/core/control.c
@@ -14,6 +14,7 @@
 #include <linux/mm.h>
 #include <linux/math64.h>
 #include <linux/sched/signal.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <sound/minors.h>
 #include <sound/info.h>
@@ -904,36 +905,45 @@ static int snd_ctl_card_bytes(struct snd_card *card,
 			      struct snd_ctl_card_bytes *info,
 			      unsigned int __user *data_len_out)
 {
+	char *copy __free(kfree) = NULL;
+	bool too_small = false;
 	unsigned int data_len;
 
-	switch (info->type) {
-	case SND_CTL_CARD_BTYPE_COMPONENTS:
-		scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
-			const char *components = card->components;
-
-			if (!components)
-				components = "";
+	if (info->type != SND_CTL_CARD_BTYPE_COMPONENTS)
+		return -EINVAL;
 
-			data_len = strlen(components) + 1;
+	scoped_guard(rwsem_read, &snd_ioctl_rwsem) {
+		const char *components = card->components;
 
-			if (!info->data || info->data_allocated == 0)
-				break;
+		if (!components)
+			components = "";
 
-			if (info->data_allocated < data_len)
-				return -ENOMEM;
+		data_len = strlen(components) + 1;
 
-			if (copy_to_user(u64_to_user_ptr(info->data), components, data_len))
-				return -EFAULT;
+		if (info->data && info->data_allocated != 0) {
+			if (info->data_allocated < data_len) {
+				too_small = true;
+			} else {
+				copy = kmemdup(components, data_len, GFP_KERNEL);
+				if (!copy)
+					return -ENOMEM;
+			}
 		}
-		break;
-	default:
-		return -EINVAL;
 	}
 
+	/* Copy outside the lock.  A user buffer that faults can be made to take
+	 * arbitrarily long (userfaultfd, FUSE), and snd_ioctl_rwsem is global:
+	 * holding it across the copy lets an unprivileged reader block the card
+	 * probe path, and with it a card teardown waiting on that path.
+	 */
+	if (copy && copy_to_user(u64_to_user_ptr(info->data), copy, data_len))
+		return -EFAULT;
+
+	/* report the required size even when the buffer was too small */
 	if (put_user(data_len, data_len_out))
 		return -EFAULT;
 
-	return 0;
+	return too_small ? -ENOMEM : 0;
 }
 
 static int snd_ctl_card_bytes_user(struct snd_card *card,
-- 
2.43.0

