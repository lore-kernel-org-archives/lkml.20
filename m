Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418FC3ED128
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184233; cv=fail; b=Y40hmuMuUYWnJTXMFeeqzITgt2iOtoXtUHnn0IV7iws+E0i70ZRUwcdJqse/4EmWq2UQvAU7bV4JSK4wV5wk1YN4PYkVLX138+FYZXRHQSAEQUA2WeVshNY8/UKeGO98t/M2Zeyr8/U75IIS5ujl8o0L/PbPuSHpQrpxhNM2+vY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184233; c=relaxed/simple;
	bh=Mu29aDK8CdRTfFIX/vKN007y/nw0b6gcgR6tLsDPZtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k6yMT63+cKxPRdQpM1vErNk5EDeroUUifWLn/raItBM7CCKnhaVhXlCZdE4qWO849+I6s4J13dhCv5JYxa3lry0vPn3oQ07BAP+PQQ/YieyggfwuTGmd84LmiavVJqsrk3hFNM/T7ESd/WUgreb/OH7blPyuMSFb4NIJVi3aYl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hmxsEzgh; arc=fail smtp.client-ip=52.101.62.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hmxsEzgh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U59ZbrieVyc59Hitx2l0I28V8fsX4n2WPo9HQMrjgEkM8Qm1BXmkeE96CZU/H1cDsXEpwFUMj3/jAmCpLtXYX80s8oIGLmvBhQ53IfTYUcLf7JGqEdhcQeMqfX4I5OSYTL++UjwBWTRgj7T/jcMhqr7vHjMOHO6Y7FubXB/0tEiXVWx1dIaeG/TfZMehaJI8BZyAOF1pNPtd5lfi1dWgClmd0+FEcn+HS6Qd/9z/Jw/5jEU3YSbhrazK5nypvNemZTMzbE7Wf64UAOvG7IjYXS5b95+hd9RmJ0Hyq19Y4heeVJdJhjeTFZ0OWZZzBOuIvcKJTZYiWQB1aiP8C5/K8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9hMRl2vRUVg4qvMLjgArPASUx9Q+pkwtn5zHJds2Os=;
 b=svU5/oM7IdBBUPzYgVIRyfjuf5xEDSI5AZuMRPh8xud/65x/z5OkhBnwpD4kFTTzNBIHABYaISA8C6/YwaFMWJNoohVbeG3Ct6NvMxYxxw7FgBCri0F+lqSMAthUIzfnymFEzIEmaumO5uW/VgsO44eDzpMWFn+JxdnEecUQ5BXg4kIAoJqrMKb24NSzNIl8F7MGyhq8EjbJfMLAfI8L5PvX8SKz6zs0uWLMxu/Hblxrv71RLrpFISirVtTKx+hN/nPHWFDCioALD5VLgkdzkd+58ROMQWmBlZHaWx+95eP+jh4+46VmrtZcAGANUrPeBV0yeOWGE9+Myh+uUlOHpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9hMRl2vRUVg4qvMLjgArPASUx9Q+pkwtn5zHJds2Os=;
 b=hmxsEzgh6VRgbmdJuXKRko2nE9AktArp5PkqzVdqwm8FAR91KK12ZE/GzyGjMGJq2g7t+f3hMuLmPkU7jNQhldgB5FOacrULCP1bFwvuslhMYfMoQxaBUojrXZW/kwhJsi91QO4bXp8Es5rbCTIJwFF+OcCPQmmvbOdSCIrOHTEf6xtOlU4mxZnq/O2qSUTM5NqyLV93bipDb2SdXGAcY/nxya49P5JVksoJNHD3xXLmsZ2j8Z/9EFKoIcbFbj9dhd9L0J8e2aszTV9NSJGxq+mKUp6Olhm5G4ILijHZbLM5n8SzIGk2+93nF0GV/fgpuG9KoSKsr8191XC9JJJqoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from PH0PR03MB6560.namprd03.prod.outlook.com (2603:10b6:510:b2::12)
 by SA5PR03MB8402.namprd03.prod.outlook.com (2603:10b6:806:47b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 17:23:47 +0000
Received: from PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b]) by PH0PR03MB6560.namprd03.prod.outlook.com
 ([fe80::5364:bd7:85a:f07b%3]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 17:23:47 +0000
From: hang.suan.wang@altera.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Michael S . Tsirkin" <mst@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Cc: muhammad.nazim.amirul.nazle.asmade@altera.com,
	tze.yee.ng@altera.com,
	chee.nouk.phoon@altera.com,
	genevieve.chan@altera.com,
	adrian.ho.yin.ng@altera.com
Subject: [PATCH v6 1/3] firmware: stratix10-svc: increase args array
Date: Wed, 23 Sep 2026 10:23:39 -0700
Message-ID: <e0d14d1599f61d9fe2f1af8aa589968d8906c4aa.1790183374.git.hang.suan.wang@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790183372.git.hang.suan.wang@altera.com>
References: <cover.1790183372.git.hang.suan.wang@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::27) To PH0PR03MB6560.namprd03.prod.outlook.com
 (2603:10b6:510:b2::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB6560:EE_|SA5PR03MB8402:EE_
X-MS-Office365-Filtering-Correlation-Id: b08d6ded-2394-4119-345c-08df19976cff
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|10067099003|56012099006|11063799006|3023799007|55112099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0C3zTAzl+CsOhVl3cuvEHoDVYjkimwKo3+vMh8+49Wykm2acKlfao34z6ojCVJsBw0kdz1VoImSnPt0iuwAV6K3uWKVZQnpRWjfwu1fYtT8wOJ3H+k133C19BClq3j5QQ8gEaFu5IdpVb8oc3vTYrT7I8zthI12s9BqTX0Jp+Kly7HivRvHthoO9tcY8CSiTUKPhrFTEqSQLOKSl2jw0Y6MZTDQayJ7sCGYfIvz/7nbIh6/uWWWIQMFXjFARo8HvGSNfOIGk9/RHhwNvXz3r/pr7N+JGh+XHgO4deCDzHEdSoKYlXTBNGd3BEwV6QmMAk8yhKaYBW8yPH9jiJcFRHd/PtxwfpvLYwW/nuBX/5oVG7b2h7fvcoIrO8UTYzwll7+nHQni9gfIQOS+l8syig4KOQmDMnA2uewB75y5dONM0HnSDf86RmfmjBiFhXJGB92iKXWE3f9E/JbT1Tlj2NmrQ3xtyssM2HYi7iqZw4Uoxsx4nSlAWArGGoFxK1EmmUIVUMJRdL+LRm0x0qR2j1yoYbK4eQ3KuyMX+hH7gqHVoMPR8zYIX/ZdeXubxcfVVP9btlHkeeRnpwFLd3T+t3tG7WJ44pbAFcTOuDC+0BpwXGnSqHKHA2r/uA3jftB6uzjy0AdTwn1SK3PEEvYrR0TGH0H4A3AdGFQGvk/VucuU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6560.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(10067099003)(56012099006)(11063799006)(3023799007)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c/UpGP3x1Krq1Dt14nS2brLN73rhCD9XXkA2MIEJsAmg+g9/M4IOsY7gQUbu?=
 =?us-ascii?Q?tk4YnYTzbzS4k3bx+Se3EomduvvkMzA8GdTEAZ24oEWR3ZBlTVZvfvlnJ9Q7?=
 =?us-ascii?Q?/7SGto2KB5RQno/eF37ZB6b44Un1gZXTgubZSupNdDFHCwoN9ovShh/GayV4?=
 =?us-ascii?Q?DvRkzd/+MUgphu7LRjhi+DYKbFbj06BkWoNZX8sSM5sxIx5rL/4HinktYd8J?=
 =?us-ascii?Q?l6V7cMB4M+EAXHQT9TCI3B6aof8thPBsi4D5vXJdwP0HXitKdJ1xo08otVOu?=
 =?us-ascii?Q?Pz7hGSsBoXO8Rsu88NNdjgCgnHZLubKJ2otI2ckmAvhPxaGz1tuUg2qx/3Rx?=
 =?us-ascii?Q?LHB0nss6FQ7SbUF5s8v9vIqpSpMQqUrMRottYYoCoSKDnLEU3pX+Vdrbnl9F?=
 =?us-ascii?Q?FlRN6zpubYwDgoUb4/hW1QyAg5ODlQZNmAxuQhCMzInXQEQ+Vv+QUl81+JPL?=
 =?us-ascii?Q?IgAuV34VVMCX50dZRKh0VZyjdqeDUwM5R9b+HSqdQzKnOCSTptWHUfzOVksB?=
 =?us-ascii?Q?Xkaqa1OexL7dH4JZHDRy1JllJX+QfUt0Xja9tK5FZeDmK5kWloqwdFjO9Up8?=
 =?us-ascii?Q?GpTrNV/ZMeAHhzfTg9by++YVobHX9XCeNrSX35DI59TLuOFFsu7AB/FBFGJy?=
 =?us-ascii?Q?fSc0nUmwolha/qUSmUuUszBUEwmJMY/6sxx5knOVI0PRdDyO9t3vAUVnPfQf?=
 =?us-ascii?Q?wZCDldMn4o04T9rrT17CsucyJY737moVbqUxea9HsGvgfmNGad+am4oWXFNr?=
 =?us-ascii?Q?3DODMhEMVCNhFbsQ+9yuj27rBcakBMsPvH87U16oZHd0HtfH6y18HFqNT+yF?=
 =?us-ascii?Q?9kwWN5IuouYXpDBrLUsaSCRZa4rhvUvkbReJBqxew7Z0Qgomlq48P9J2qrWQ?=
 =?us-ascii?Q?9TEOLCxl+R0SGpXYC33ITkggn9Y/YQzsoihdUJj+F0QdsWRyyWm//dsvXTRJ?=
 =?us-ascii?Q?V1RG956kPbOfe5JuHOrfzAFmQWdYNdHrJ1gUlyJeHJ24fnRwTMxGl0oTQGYa?=
 =?us-ascii?Q?o8UDS16LGc6U31NhprioQAvWE4f/Zv4t9sBCVEr9PYU5PWfZ5lScmE5yjE5G?=
 =?us-ascii?Q?3LOHeZIfWi8pY9R0gHVjBT2hOtblFI6IMN1WF8M4y4PVTf32FuJXxJuPz78e?=
 =?us-ascii?Q?RJSdNwMRQtXmr9BrUdMjP8Al3DYGVkqA+7xB5mB1ic2YGol76pZnh0/Q95fk?=
 =?us-ascii?Q?wlStqTU4ZxcWKA8SU6qyPIOpuIT2vk6e/HB4LDqeIzkULugjQ231URKSGBxM?=
 =?us-ascii?Q?fbu4wmZoqtZszHhCaxhFUfzrDbh/cuMMQMWLoUKWqXRL5hrNQgYCFr7+728y?=
 =?us-ascii?Q?8iBJpy9tAyCY8S8BpqlOikIiRzdPCKB0DHtksupKGqNFkRDQMgVS+mFbBi3W?=
 =?us-ascii?Q?41u9+gIV+449omvB4LP+3Pv0ziUgllmnpd/9oYoyTT5u6jvcHguwE/8ejFxo?=
 =?us-ascii?Q?uET+NfAFc75nP0IHn+AU1IJiP+UtX5iLgrhNpjbwmojpO1ETjezL8XB6YNMo?=
 =?us-ascii?Q?SrSWP/EICaiTiaE0n5RCTUGSktKjALwnz8Fdq1X91N7S+gzjQ1BxZfVfCU3C?=
 =?us-ascii?Q?FaWAgAZip7BZfXs6u/0E0ucJWYov2k2SF86vSfPMsELnTuseeE42QSKlq/VT?=
 =?us-ascii?Q?VLHAN9sGaokL1ua7CH59Hj5/x8olNBAOIh1T9B62Bn5Y2B67atjTi97j4t8B?=
 =?us-ascii?Q?A6JhkvGhOo0d/ddozeudS2mFHxOUvz4FN+gzm3Xy7gP54HXPE72VUyGe3uNN?=
 =?us-ascii?Q?cxo5wOxJ78tx9lIaHG4BgXr3IHdUwSw=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b08d6ded-2394-4119-345c-08df19976cff
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6560.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 17:23:47.1032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5V3uYIvm8TIPED0z92rqfzLy7xTP5x5HO/ntF0sNIDVliVQPlu6i6EPzmaaS32nF8T06qmBWhgQQelQU6Np9A+0xvJO4NLRZuUE39fpxGA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB8402

From: Hang Suan Wang <hang.suan.wang@altera.com>

Increase args array from 3 to 6, for the SDOS encryption to call smc
call which is used for args to be passed via registers and not
physically mapped buffer.

Signed-off-by: Hang Suan Wang <hang.suan.wang@altera.com>
---
 drivers/firmware/stratix10-svc.c                    | 6 ++++--
 include/linux/firmware/intel/stratix10-svc-client.h | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/stratix10-svc.c b/drivers/firmware/stratix10-svc.c
index f8c2da207cb4..07345efeef0c 100644
--- a/drivers/firmware/stratix10-svc.c
+++ b/drivers/firmware/stratix10-svc.c
@@ -173,7 +173,7 @@ struct stratix10_svc_data {
 	size_t size_output;
 	u32 command;
 	u32 flag;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
@@ -1888,7 +1888,9 @@ int stratix10_svc_send(struct stratix10_svc_chan *chan, void *msg)
 	p_data->arg[0] = p_msg->arg[0];
 	p_data->arg[1] = p_msg->arg[1];
 	p_data->arg[2] = p_msg->arg[2];
-	p_data->size = p_msg->payload_length;
+	p_data->arg[3] = p_msg->arg[3];
+	p_data->arg[4] = p_msg->arg[4];
+	p_data->arg[5] = p_msg->arg[5];
 	p_data->chan = chan;
 	pr_debug("%s: %s: put to FIFO pa=0x%016x, cmd=%x, size=%u\n",
 		 __func__,
diff --git a/include/linux/firmware/intel/stratix10-svc-client.h b/include/linux/firmware/intel/stratix10-svc-client.h
index af13dacdf5ac..9bb46c3cb0f8 100644
--- a/include/linux/firmware/intel/stratix10-svc-client.h
+++ b/include/linux/firmware/intel/stratix10-svc-client.h
@@ -215,7 +215,7 @@ struct stratix10_svc_client_msg {
 	void *payload_output;
 	size_t payload_length_output;
 	enum stratix10_svc_command_code command;
-	u64 arg[3];
+	u64 arg[6];
 };
 
 /**
-- 
2.43.7

