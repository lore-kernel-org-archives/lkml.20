Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazolkn19012015.outbound.protection.outlook.com [52.103.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A8390CBA;
	Thu,  8 Oct 2026 22:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791498887; cv=fail; b=RQnUihuVvqb/1kTSAtfm5N0amquEEWfqcxN4t2r/ipYxkHEshmcEBXMr7kRv3CotV/yj2Y2UfZ7reCVOdPJQoKL6JlakYXIHfo0hiO1m5eUo/0LKhh42C2COShUcEd1PIILghbdYPPF56GA5gngmtNjnl/ka9ZapmdR+cbFy00k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791498887; c=relaxed/simple;
	bh=VrbGpqK64DEAqNtPHocLpRyPPUyCsW3kkxTLkaIx0VA=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pIHBPEMg0NNGDOAdsWqKhEn2MZhjj4HaFXfhPmV26/tcnlu09MTRygRNH8IW06Z23/BFFohs8QT7242AR7GtcLVeaSJIWj8UXheXeS1BuPADbkmVg85CJJWUgzrXHqYFi1XrWdSSJu04G+/QvLaD3bpi6hQQ2/5Ve4ckDhOGeAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=JwaVK+o+; arc=fail smtp.client-ip=52.103.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="JwaVK+o+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eejAe1pakisltQHvYtr23RhsiZVFeVQK7ciauBeBxo8ZT7nK10RKLBzYf6KFXoKoCgZ717fZc4y4bG14FDAriXbJrgsqBeRebch8OBhuLROzjP5hnf7UOkGQFaTPopPjCgM1xby96K+TJXQlvunhl23A8bTifeMM5vjJGRYM4ieCB1JC/gRo7HhdcZi2tL5gEtHX7gT607dn7FH2FSR3eFnD9Lg8Wi931thlk2JwuuNjUzVzN5BP76+dHmqjXPscTSPqP2UDafmFNBJ6r0FQsMI84RS8bvZJwnRyg8JQ3spy3zNSDZ0Dp6JkyJ9aI+9kJT115/eXlyTInuQ26ZZzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RpXzMJgjsKk12FkQlHs+EUnzB/PDygnbK2rrzsMc4ss=;
 b=EKV9yFMbHOgF95oNo/1aacD3/3CT1pqM+AS1mxtBlJ1X22G+c05ZjP69l8gYHKi+NAuVcCF047dt0R7Lrq/fSF8wSEWj8RyZi+AJ+F11NLFnhdCajaH6r2BZeHjbQUGaKi7dharbhl8+UXMLGwd0OCf4GE+bS/eOt3niZi4oFi0elfgnQunWg7+Hv1NwAuTdW1YyqHNyjf7RH7pENozFWvIvIEpn/0C/9DW7pyrjNCiCjQr2qh85IM1UWYIzyGVtQ2trdcSCIQGEvQjRZ4uwwHVPo87XIIWGEaKUe2Mbqbfr7+8Sm8VS5LTaUg4YGF6qz9b2ZlJBI3aUmTfRV2IayQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RpXzMJgjsKk12FkQlHs+EUnzB/PDygnbK2rrzsMc4ss=;
 b=JwaVK+o+XaTPXFudEl4geZFvwx6PTvVnFbfqYo0KiNdqSw/B37Uh/S/w9R641NejAeY+9qTkQ+kWc1rvk1hFrxa3ZE9cTz35ycQtUFY1DjEkrYI+Qgb0wUPvLemdkxTmC7Ievh/aNQkUAloiaYRMdGGQuTXAm3GGaR99cP2X53E52K1zNttYNhPX2pVltaBbXIgxAesdNXdJMBhPwvTsVfx5OOfjALRfkPOdsVam3ym9TiFGBSBL6yYoWdSJ0tWu0LcbI+BfyHVlxbR82I03DdvVrI999tgOBGjdAA2ojzy9LfhZrwNBGOs2GUCLbzGhlQmD5ylw6EYcRn8YxbTkfw==
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com (2603:10c6:10:32c::14)
 by SY6PR01MB8347.ausprd01.prod.outlook.com (2603:10c6:10:1da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 22:34:39 +0000
Received: from SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19]) by SY5PR01MB10600.ausprd01.prod.outlook.com
 ([fe80::db5f:2818:b791:cc19%3]) with mapi id 15.21.0522.002; Thu, 8 Oct 2026
 22:34:39 +0000
From: Zhang Jiaxi <Z1529105815@outlook.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
CC: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 3/4] ASoC: qcom: q6apm: synchronize readiness query and
 provider lifetime
Thread-Topic: [RFC PATCH 3/4] ASoC: qcom: q6apm: synchronize readiness query
 and provider lifetime
Thread-Index: AQHdV3Uzqli6TFCjvU+BTK8txYNLJg==
Date: Thu, 8 Oct 2026 22:34:37 +0000
Message-ID:
 <SY5PR01MB106008FAA5C77DDF36D83A31CA1932@SY5PR01MB10600.ausprd01.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SY5PR01MB10600:EE_|SY6PR01MB8347:EE_
x-ms-office365-filtering-correlation-id: d2ec35e8-5d12-471f-c1f5-08df258c5721
x-microsoft-antispam:
 BCL:0;ARA:14566002|51005399006|41001999006|38102599003|24021099003|25010399006|15080799012|25031999004|31061999003|8060799015|19110799012|8062599012|40105399003|10035399007|2607281247196008|102099032|3412199025|26104999009|440099028;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?SylHd/SvkLw2+UgRZqaW/zrkZMVbfVkS9lEIghGjyV/SVUu2mo3KffthQU51?=
 =?us-ascii?Q?IA03AzJhYHCIS2G3p3EUE3RPTHXQoK7qsD9+RuCq2xIj75CxQC4ysMuXIOOJ?=
 =?us-ascii?Q?G2t2ohtA+qVtJg/NSE6K1Nvy1aMfQoHziKj9McIBuzzIAetuLPQ6Oi49oDoA?=
 =?us-ascii?Q?4++OfDDoyPxi4JZBk4VG3aYXeINE3Z92FMCjhLx/7OW9Fm58eNWX3daM9sP5?=
 =?us-ascii?Q?06/ZpFsd78I/rP1r7ThiFVuZyO/fcr3oEetsx384vodBO0wF3Boxnxu59udm?=
 =?us-ascii?Q?4MXUyl9HmmdgM1Lp08ScYNS3lwzcMwyr6pyFKHBTaSqCq+8RzgnmhrjjL77t?=
 =?us-ascii?Q?gzM8Grull0juWFQQfDmHrG75wXmh9OLxd/3QQlpho8SY1jYALUaBlmgj3rAm?=
 =?us-ascii?Q?43gVLnN5rFkv33fvPzoRKT9liurxvGLlFn/H1PJWOeuK8Ndw9i5F0PMF2c5M?=
 =?us-ascii?Q?H3JIsOV1umbWEMc/ETzy2K4oRyZ6L62YvxSNr73QcJPOpcz3zajue9cBV849?=
 =?us-ascii?Q?eq961ws3pZh37q3XtS9xgyR9crZcrbK2RGiV83A/aACzS6jnUB01shDdPN2f?=
 =?us-ascii?Q?S0KQoASfpvB6JxEG3kEv5fIzL9QZrvgCTb94clN8bYfkdnxo/dxt57FAGBRI?=
 =?us-ascii?Q?ZZltrhUKxiYfAxuErYLYgu0rCa/4gCTPW3MXkRgdc85XEX5cjtabwUKLhkeS?=
 =?us-ascii?Q?NqSs6mghJj4VsUJwlhMw3F203nRAsPuO5IOfPaczEPMvatT+JibSR8YcVh23?=
 =?us-ascii?Q?Y/N1gYrfh9MsjoJ3hG4EucH/ofLJg7TL5Y/tzADhXoYoZq7OBjMAtSDSEuy1?=
 =?us-ascii?Q?lM5FZyfrqmstwnbq32pxA6Wg0tO0ILQ6Q+1OwqCIcyDJWh8X5hTpw7vMIH2O?=
 =?us-ascii?Q?QyWgNj0s6BMgyD0CjF60TD7iOQxIUhoaXvN3gXP+8hQF9xSUTCK3RIER2rKh?=
 =?us-ascii?Q?XjMNYXnSturxsY+ndVcx5wtvSZsdm1iZ9GyfqdBTR76sY2lQeoQLSagkFQ/3?=
 =?us-ascii?Q?1wNDCVB4DS/zK3/dRqn+8Ka/dQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?q66+BpQgkOYl4ns3u9xgkudWEEbeMI9/1gvAgSNj9qznOXu40ozaMMnKcUUa?=
 =?us-ascii?Q?hcesSc78AV9nO7pkcHjVfo+bK63YZozDNenA98slSbLOq3VWdFZx/OOEoemT?=
 =?us-ascii?Q?5PCPT4NLUlt/9U0lVbUPf0JD12wuezac0OwNfx9lG/LGZKO+XfzMhcsl4h9q?=
 =?us-ascii?Q?yqq5cYOmcmsNlfn1+TYGzKKcz+ddJfOTGSWL66DGRscHWbY2BB9vmMw9O/hL?=
 =?us-ascii?Q?OdcKAzcY4ynVfD3oryfXgEQ2TSj/CbkXqDViAcQHn/bLFblwyfNZFgtaqwQ3?=
 =?us-ascii?Q?VKktPOs0ASnMOlbuj+TsX/w0+IpVcvWRDKS3PZ4GAAbOFg9aEZ+JR4EkOXSX?=
 =?us-ascii?Q?FbFit3ftanQoIHwmcTI3xtoB202vVQ+X0HIMjywcychoDvEU+mcmnTA8ujW7?=
 =?us-ascii?Q?hpz8tgHmnHLFfL0ZtRfXBN7fv3p4IaJYcIIduqs0Ego3e8lE8JzetYaq2+Oa?=
 =?us-ascii?Q?tcrImvx6UigH2IjloQ+SzO/w8O7OmcVP+j04dWUMxufWLZXbs021t20wuASH?=
 =?us-ascii?Q?5Adfpt1sc6p5jAGJPFBlGDA0305d+fWfm4r5AM2Otby9uCqVobGVWSu8FNEb?=
 =?us-ascii?Q?HgQ26b1hHWSmx2SBLNMrkVzvmVzEAGUYBI2FxTde4QlcK3VdZMpH5izWlGN/?=
 =?us-ascii?Q?apocqXnjS9QNiVEIHIglIbF/g0uxEJKpOzl8TTfQqlawI0fXjfBRup4s+aQT?=
 =?us-ascii?Q?qltNOR42IgTXHvUos580eX6ECRkXdlPJshHYYSia1np/WUiMU+5ywMwbutzn?=
 =?us-ascii?Q?l1VUguSFdTDYU1O+0h8IZscU+aihdB1RqxB3zS4P8rKAhv1+snP9FnElbQhd?=
 =?us-ascii?Q?r5srR4G4B73aUwGp9CdQ1ub0xYVII4SRaaA+HKFNFQXKkDZVpYs2hPs3s48M?=
 =?us-ascii?Q?X7cTkvaL7YNzWerJtzAxotwXdHbWAIJcX+iJcBXu1fe6DVQo4uXYCW8DGbpV?=
 =?us-ascii?Q?be8cLnDrNmvVGzeWoJzF+QZZp/T6F58RHEyH9WL+kqjPTpaKqHBq4l07i34w?=
 =?us-ascii?Q?1UR3Flb6lsgoVU3ziRYmTuKNWAanQ710d62bJtrihpEDdsq8n2Gm8j7AEinD?=
 =?us-ascii?Q?SFai0euyFtfH4uxWgE0p4Z37B/9gw7Ln0R2KzthR6DzoPGl/Cga5KZ4jAJSk?=
 =?us-ascii?Q?04xSuwZA5y7DVjuIeb3brn9DIekAbfPghLAoqUCnD7cS2iSSQmPRFeqZmsVu?=
 =?us-ascii?Q?Q6lA5I8gD2h7S6v7LV9oIo+3YrUi/Y+FtSc03wARw6OBv/qYV6QQbxkWVW+z?=
 =?us-ascii?Q?dke/gU/fWc1p4kbOeR9F8/QWhZB2X8lIpW98CgC0IgVtKMhc5h4Ppbu6UZwI?=
 =?us-ascii?Q?GuRT6J+JZQO1IoUiLSDtm3rvYu56GNHCM9NDJFntVBEMrKYaZuW2a43lM1Ga?=
 =?us-ascii?Q?jRdN2DBenDVNK9vFahEqLyWHSj+s?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SY5PR01MB10600.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ec35e8-5d12-471f-c1f5-08df258c5721
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 22:34:37.9497
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY6PR01MB8347

From: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
The private SPF-state query ignores its synchronous command error, while=0A=
the bool API accepts a stale state or even a negative allocation error as=
=0A=
ready. Its q6prm probe caller consequently skips EPROBE_DEFER.=0A=
=0A=
The public Graphservices GET_SPF_STATE response defines READY as 1.=0A=
Require this query to succeed and return that exact state. Protect the APM=
=0A=
pointer for the entire query and state snapshot, serialize its publication=
=0A=
and removal, and clear it on failed component registration or population.=
=0A=
Run the initial probe query before publishing the provider; its error is=0A=
still ignored by probe, so this does not add probe-time error recovery.=0A=
Removal waits for a readiness query to finish before clearing the pointer=
=0A=
and returning to devres cleanup. The callback never takes this global mutex=
.=0A=
=0A=
The existing per-APM command mutex remains responsible for command/result=
=0A=
serialization and waiting, and is released before the synchronous command=
=0A=
returns. The global mutex protects this public query's provider and=0A=
snapshot without recursively taking the command mutex. It does not keep=0A=
later SPF replies from overwriting the state or add reply correlation.=0A=
APR callback draining, graph lifetime and DSP restart recovery remain=0A=
separate lifecycle problems.=0A=
=0A=
Based on sound.git for-next=0A=
62d9f9ffdfd44e88010412bf8f23732f0a93a9be. No target hardware result is clai=
med.=0A=
=0A=
Link: https://github.com/AudioReach/audioreach-graphservices/blob/042cb60b4=
e510fd30a944ef940a2c79af57aa7e3/spf/api/apm/apm_api.h#L1002=0A=
Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>=0A=
=0A=
---=0A=
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c=0A=
--- a/sound/soc/qcom/qdsp6/q6apm.c=0A=
+++ b/sound/soc/qcom/qdsp6/q6apm.c=0A=
@@ -6,6 +6,7 @@=0A=
 #include <linux/jiffies.h>=0A=
 #include <linux/kernel.h>=0A=
 #include <linux/module.h>=0A=
+#include <linux/mutex.h>=0A=
 #include <linux/of.h>=0A=
 #include <linux/of_platform.h>=0A=
 #include <linux/sched.h>=0A=
@@ -28,6 +29,7 @@=0A=
 #define APM_GRAPH_MGMT_PSIZE(p, n) ALIGN(struct_size(p, sub_graph_id_list,=
 n), 8)=0A=
 =0A=
 static struct q6apm *g_apm;=0A=
+static DEFINE_MUTEX(g_apm_lock);=0A=
 =0A=
 int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt,=0A=
 			uint32_t rsp_opcode)=0A=
@@ -149,17 +151,19 @@=0A=
 	if (IS_ERR(pkt))=0A=
 		return PTR_ERR(pkt);=0A=
 =0A=
-	q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);=0A=
-=0A=
-	return apm->state;=0A=
+	return q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);=0A=
 }=0A=
 =0A=
 bool q6apm_is_adsp_ready(void)=0A=
 {=0A=
+	bool ready =3D false;=0A=
+=0A=
+	mutex_lock(&g_apm_lock);=0A=
 	if (g_apm)=0A=
-		return q6apm_get_apm_state(g_apm);=0A=
-=0A=
-	return false;=0A=
+		ready =3D !q6apm_get_apm_state(g_apm) && g_apm->state =3D=3D 1;=0A=
+	mutex_unlock(&g_apm_lock);=0A=
+=0A=
+	return ready;=0A=
 }=0A=
 EXPORT_SYMBOL_GPL(q6apm_is_adsp_ready);=0A=
 =0A=
@@ -862,6 +866,14 @@=0A=
 	.remove_order   =3D SND_SOC_COMP_ORDER_LAST,=0A=
 };=0A=
 =0A=
+static void q6apm_clear_global(struct q6apm *apm)=0A=
+{=0A=
+	mutex_lock(&g_apm_lock);=0A=
+	if (g_apm =3D=3D apm)=0A=
+		g_apm =3D NULL;=0A=
+	mutex_unlock(&g_apm_lock);=0A=
+}=0A=
+=0A=
 static int apm_probe(gpr_device_t *gdev)=0A=
 {=0A=
 	struct device *dev =3D &gdev->dev;=0A=
@@ -887,26 +899,31 @@=0A=
 =0A=
 	idr_init(&apm->modules_idr);=0A=
 =0A=
+	q6apm_get_apm_state(apm);=0A=
+=0A=
+	mutex_lock(&g_apm_lock);=0A=
 	g_apm =3D apm;=0A=
-=0A=
-	q6apm_get_apm_state(apm);=0A=
+	mutex_unlock(&g_apm_lock);=0A=
 =0A=
 	ret =3D snd_soc_register_component(dev, &q6apm_audio_component, NULL, 0);=
=0A=
 	if (ret < 0) {=0A=
 		dev_err(dev, "failed to register q6apm: %d\n", ret);=0A=
+		q6apm_clear_global(apm);=0A=
 		return ret;=0A=
 	}=0A=
 =0A=
 	ret =3D of_platform_populate(dev->of_node, NULL, NULL, dev);=0A=
-	if (ret)=0A=
+	if (ret) {=0A=
+		q6apm_clear_global(apm);=0A=
 		snd_soc_unregister_component(dev);=0A=
+	}=0A=
 =0A=
 	return ret;=0A=
 }=0A=
 =0A=
 static void apm_remove(gpr_device_t *gdev)=0A=
 {=0A=
-	g_apm =3D NULL;=0A=
+	q6apm_clear_global(dev_get_drvdata(&gdev->dev));=0A=
 	of_platform_depopulate(&gdev->dev);=0A=
 	snd_soc_unregister_component(&gdev->dev);=0A=
 }=0A=
