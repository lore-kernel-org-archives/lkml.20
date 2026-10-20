Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.78
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792458621;
	b=ko2MYdanS6569dVi1RibUrZJ1Mq2rhLi00eR2QlR6Lmt/cFxfaNKHTTZhnURFc2mKGEr
	 MOjXC2CN/Yfy4BFyyqGAMEDRmp93FsQroE/tZmVGteKdEAlBaf1YiZQ5fcs/JIjibrZnn
	 E2NS03u+LFkDq3F2iJ1edOinA3KaD4Bydpd/OP0s9p+KGDo+tFlLqDKShbtC3s/HO9rUQ
	 4MliJbEL8FjjEaL4kTBr7UIzDs6tSWokQuHRQ7sHDetnWuBUjRfT9k08/Xop80NNtDCoH
	 DqE5NJ+sPvfg3mpzyIF1qbi8PxcIQqLJSaJfVC6/LsFurJROH9Pk1JHLxo6riEkjoGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792458621;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EMaeDEu8WSn8kFkbwu9EG1JhtcCjw2OMVa/lyZRGE/o=;
	b=JEMGxhBxFLAGuG13xHnlOXCX/OHZtIK0F5x0bf+srnMO5cn1X+L8iYCdKF3jF1r8gu8V
	 nz5joHYeQueKTzoCUPuZ3MEmXhbt3A3eQZedFCbPXZtwNGvPiCPf7HgdYPem9Ft8UutXq
	 TrZw5oaW47ArWB9PQJePh9B3c+pSUOqdqDTIN8DUGUsouEr75I1K2YbMR2oKR1zM5jHib
	 HKJunmN5eTqpgNP3GP64V3i6T5Wg78PJsZvtOWWUin31EfjEnA5S3oqzRWfenk374JG3m
	 3KTF1s8XLtD05s7ZUnFcVsW6cALQAXZBOjvCCptVW05ZZgU0Tn0CKEl9SOnEtuyHexw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=vcutGjmL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.78
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022078.outbound.protection.outlook.com [40.107.43.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137CD606A319;
	Tue, 20 Oct 2026 01:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 137CD606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=vcutGjmL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tWmRZER2ABWocu8R/c3Wi0g5toITLY4Gi5qt0/LAO50Y1ecvb+PG9Qs6xLOE2pSPwrc46Mq432xNN1ac3aKYHm+MszbA3ZldbWpWHgDrTZkVQRmmZPlltGPpFUzC5+/Mts0T3RjL7WsZVDta+dj7iQxwpr3xXnfr4h7WXlAvx0nbFviuht651iTkpHHkI9d2WeY5x4rfQVNDkMmPHItZ886fwQOgx+zSme8SeOK7BzTnlmKskiaFUy/GK2HNN6tA99LEAMhqFVFL2vMsCY5FTyoUfP3su0RvpJPjNqnVGu+JwKcPbjFEyIwCy2YjeVgze1gBtCasXEgfUtKPPkEXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMaeDEu8WSn8kFkbwu9EG1JhtcCjw2OMVa/lyZRGE/o=;
 b=bik79VKMIUAtr4PTUgLD4cmo6q8zkzF6JcZzUVfTux9a6YTppAeO1Wv2kqhAcWcaOMZCdgsiO6HIYebCt8xtnPno7Zs0fBumzn5e6TXwkAIX3EeKiX6HSaLGQe4+JLIzv/NUun6aN+3V9ZCpjpTFq4ziRMr5NJTylyFvKMUYvemo/Lr707pR5gHwq/K/opQyriXay+9TmaXEz+Dax8IVAiWuRKkEidCBN2UZyc5hGFDsyyBO8KR6BoSDmwjqm3gqYu49+sJA34dH5XNZ6AItgVgx/CVrZcXH4cMdhiw2IR1JGYHc8M2L5uB41rhyJZyW5hc8mDtlZuXo0fUU0MdWWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMaeDEu8WSn8kFkbwu9EG1JhtcCjw2OMVa/lyZRGE/o=;
 b=vcutGjmLavhf51HmiQDnJ6KJ6/apNXNEeQ5ar7cTqaKlmTHJVSkPq5bcWl+d2Jw9KRRZma2Ip1QIDf2bhV5SmUWyjS4ASj/tAHHKoYiaB3OdUMjW3g12EYyiENDohNuzHuMQ++n/vZuC3gCR41FJUwkdMUxsrki0mBvoXPwkeFK00gN4mZVRYc4iy3T8RuO6xg/y6DPZPHa7MRbqLxs8phC9xKNnZzGsACWivs2ADDnRPsBbLeMUcXYytabVVvytPe5lvMlCXNI0uOy2eWBYc+BDtQfJRCvI7cVJ2jHg6M5l8uPCwlwUrOHZpOFGIZA7P0HAumE2vSIPJmtP5H87Pw==
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE2P216MB2073.KORP216.PROD.OUTLOOK.COM (2603:1096:101:11f::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Tue, 20 Oct 2026 01:10:15 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 01:10:15 +0000
From: "jackson.lee" <jackson.lee@chipsnmedia.com>
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Sebastian Fricke
	<sebastian.fricke@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Brandon Brnich
	<b-brnich@ti.com>, "lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: RE: [PATCH v2 3/4] media: wave5: handle encoder runtime resume
 failures
Thread-Topic: [PATCH v2 3/4] media: wave5: handle encoder runtime resume
 failures
Thread-Index: AQHdX6K6+sYVEg752Uqsp1r7cKOt8LcFn1gA
Date: Tue, 20 Oct 2026 01:10:15 +0000
Message-ID:
 <SLXP216MB1148D92C62FDBF0E08F819EDED672@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20261019082026.1798945-1-yaojiale02@163.com>
 <20261019082026.1798945-4-yaojiale02@163.com>
In-Reply-To: <20261019082026.1798945-4-yaojiale02@163.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE2P216MB2073:EE_
x-ms-office365-filtering-correlation-id: 948da29b-7457-43e5-1c7b-08df2e46e627
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|921020|56012099006|4143699003|10067099003|261009223027099003|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 KjYDpLaWH9AUJ/LXdEbVIwPVpjVR6WSVa4jXDTF5AIpx9NXbOJMM0FhZCXp43y2O/+Zuh3/2r40w01sANkZMslDLueAtlHlgcGGQBBw7E/VHfco/luIG2p8/LCTuWRuFt1CObw9xR7fGAgLEdLzjkSzGxXc2Z2lRR1jskE046dn/tY/ON2O7UFgmqcHEYGGY3VvblVb9V2TvhTfs4pkG3g/jLoPDWDjt+Phb5JBSWx9+xS/ST2ke9AuPwExTPErqz0kcKl0UqjRn9mDOYacxD/uOS1QzLzYtMZD/svBx+0gfjk7rNhPNH4WZDPsUDXfo2k0sTgU9ptr6yjeE56zySCTJzEPmFQP2uW+fsZfIY/YH6vIApi9gO5nuxb1iHYFB0m8o/MdEVMXmkfBzr3OgzHznquq1LmXr3xvSEDrEMyM/quP6q71S2oaRgxUnTmxG+r5+4ZhlKMum0mS4mKhCjYZb8uICovuAKbNXj5IalWWkBEM8HnmrkMuZS2L0JZCp2cAwaRzzVLAzza0MVE3LH/WFFKer1gIUhVd/wKaOuOGLXlm2AVfZ3wV7FGUdLql8cTIjrSZSXTTq4pEFFx3e2HRphnR01hVvcOmWz1v1Pz3e9Gru2nZEuCvhT5NBqg/XxNBx6hSr+fJj/ImoGb4RcxKxKeo16iSFYFhwN3X4j6N938141uYDFW+R7Hq5tN0EvxfaOXgMQtVWT3bsJKTe8G4x/ExdqEcQaku4bg78o4ASdr+LbT12vSzLJTbt3hPY
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(921020)(56012099006)(4143699003)(10067099003)(261009223027099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?J9AjnPQTpRs/fLzd8NbGRpMgm1ZFFQtaXWSroq+YX5yy7Aiof0s2ZnlMlrsD?=
 =?us-ascii?Q?jpc5a21KIRVq52gFltGeBccPBn6jMcgDL3l16Vcamvs38i+uq0e8klOzQaOq?=
 =?us-ascii?Q?z5Sy3oZh7gTdJ2p0Sj4QP1cYdbqMHXwvBHNsG59CmS087b+6k+VcvvbhqEyP?=
 =?us-ascii?Q?CCGg8dREO9rKI4x6X2w1Kki00kRdeviAjpq8EltYmop15rG2VVLuqpOXmgK8?=
 =?us-ascii?Q?8bynhIbW2M9vHg7njKcMmfnXsLHmec5nKMHFiOVTSwFbwR8TeIKOpif/KIYr?=
 =?us-ascii?Q?51NaH87p3RyxErK+pPmxPT1URih+WeHPADlfJ4s9E0H8xWzI+cE+efZosy4V?=
 =?us-ascii?Q?z3thTJQYv3rTg5IZKcPXqkFj7PVkh2UmB+C9czxVkInqPQLITnR1Tv29rlMK?=
 =?us-ascii?Q?xzPhcp+BWGBqvJEy/duoKmXFOccvkxMDYtHQeYtU8RoSYKWi/bOrJbUDTni6?=
 =?us-ascii?Q?n5Tu+kZ4UWo3jFR1ZMzBykpSIIM+lyWCF8m5BAwtzPUnV9p8Ax+bsZ2W3K0y?=
 =?us-ascii?Q?TDvjyL3+NTvJc4/fTWqCjt+yd1nIVKlH5aRvIKOpehUiX8PV1DcU+P8I8sTq?=
 =?us-ascii?Q?rIaKDEGvFKkbpatvgGemnhKNRRa8S8ybabYi2RS555lqd/6skFpDs92+SuqE?=
 =?us-ascii?Q?mt8y6ZTyCtRCk9qWc9AcMolJnrjJgLcTDpRVK40nIqUa5W+Tr9Qog02vWY6b?=
 =?us-ascii?Q?87UX9lDBEcFdVHPt6mmb4yxxES7ECV4vi9Fv9LLWBGi+CCZ1HzH59KU/42R+?=
 =?us-ascii?Q?oJLBUUP7W5ke8fOs3KG4jSPDfYHaMJTQIZU9LTfGL1mOLzfNFozgo+kT2bvs?=
 =?us-ascii?Q?6RaldBLesU/3rp1N4rGNfEzdjL/gzwu0KD4QvO6eRxzy5x30oboUhAv5AE9M?=
 =?us-ascii?Q?+a84voXqtpdHGWxk49oRks10Pzao/PKkLWhob2py2XXXHd0sAVzZprzjxzg+?=
 =?us-ascii?Q?j1NayUZXY6J11ss1/ZM35A3wcU9hvD+ouywxQvZK07dTso3p5rl2EhKnZUUp?=
 =?us-ascii?Q?Lkbgu4aa6TzE7DbT4t20ayb0j/C1M88JNDgE1dtZkcAq08TAKjwNe8dc0mx0?=
 =?us-ascii?Q?xb9ZzuKZw5L/quoXcJPSVemVILIdvUQQ7B99bJTkfCewblBEmd8m/oqnxZT3?=
 =?us-ascii?Q?YWE5nY6uBb3UMVfgAeNtB1r3Ctcf33OCqy3Jn226L4uMswWz/cwbQtfx7gKX?=
 =?us-ascii?Q?Yi6U600CiGB4/C+fXnsrZY/q475XHO/aclLmnerlY5u0hfb0f4ypWxSYp3TE?=
 =?us-ascii?Q?lpJNb/WRKZbNSP75gkZtSIdKvusBBAFvJdzqDPqSAsLKBb+YPFIFq4+1UeVh?=
 =?us-ascii?Q?3NCUEWvPbaqN/NVMWRXkO3Gt7WGwv1CebGirFvOvgniALirzyfv4Qc8vmXmg?=
 =?us-ascii?Q?lXRTfVdJ8hwXGc8guiVgypJPaY+JNsJqSu/uT7CSPQjX4/2j/FcObOOPQs0X?=
 =?us-ascii?Q?vj7fdORDbTUTAEBkfNrr/h0ms7VegZwgWGuUuMXHqi6Pp/IFutTFFpPiCgcR?=
 =?us-ascii?Q?qMCHF+SkgnBEMAItfNU1NRR/O6VSnblG3F5HKmZsrNjPfQlXu7QaHoAI0GFO?=
 =?us-ascii?Q?YxVEaQdRlASVrmMK95TfpEe3G5SjabixcKzIkqLIjpjuAN8njP198St9FHqv?=
 =?us-ascii?Q?J3A5Vczb5O5zRwNKdh37aAugO18eis48cPbsGF1sTpcLiOug1kg5SF8MvcKi?=
 =?us-ascii?Q?V8WI0W9Vuemx89PEpOFGvBtr0w5RZcWDNJHBOLP7PGaJxJm2ORVpDgXWYzPH?=
 =?us-ascii?Q?/6pfiW0v/w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 948da29b-7457-43e5-1c7b-08df2e46e627
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2026 01:10:15.3410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zaQHD15FZBGza0ha6F65Wv9L8IgRZmv95qkZTKAKxrQFEq3cXJa+IXIwAa+tOdAh4UeclE5PLH/0lZiqZYh4yhvbwp5c1Idgh+RqFEIYfns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB2073

Hi Jiale

Thanks for the update. The device_run() error path looks good to me now.

> -----Original Message-----
> From: Jiale Yao <yaojiale02@163.com>
> Sent: Monday, October 19, 2026 5:20 PM
> To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.org>=
;
> Nicolas Dufresne <nicolas.dufresne@collabora.com>; Sebastian Fricke
> <sebastian.fricke@collabora.com>; Hans Verkuil <hverkuil@kernel.org>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Jiale Yao <yaojiale02@163.com>
> Subject: [PATCH v2 3/4] media: wave5: handle encoder runtime resume
> failures
>=20
> The encoder callbacks ignore failures from pm_runtime_resume_and_get() an=
d
> continue issuing firmware commands. Runtime resume can fail while enablin=
g
> the VPU clocks, leaving the registers inaccessible. The callbacks can the=
n
> drop a runtime PM reference that was not acquired.
>=20
> Runtime PM retains a resume error, so simply finishing the current job
> leaves PIC_RUN runnable and causes the mem2mem scheduler to retry the sam=
e
> failing job. On a resume failure, stop the instance, mark both queues in
> error, return their queued buffers as errors, and finish the job.
> Propagate the error from start_streaming() and preserve buffer cleanup in
> the other callbacks without accessing the hardware or issuing an unmatche=
d
> put.
>=20
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime
> suspend/resume")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  .../chips-media/wave5/wave5-vpu-enc.c         | 33 +++++++++++++++++--
>  1 file changed, 30 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index f9fcdf4c22..7359f86f70 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> @@ -1351,7 +1351,12 @@ static int wave5_vpu_enc_start_streaming(struct
> vb2_queue *q, unsigned int count
>  	struct v4l2_m2m_ctx *m2m_ctx =3D inst->v4l2_fh.m2m_ctx;
>  	int ret =3D 0;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		wave5_return_bufs(q, VB2_BUF_STATE_QUEUED);
> +		return ret;
> +	}
> +
>  	v4l2_m2m_update_start_streaming_state(m2m_ctx, q);
>=20
>  	if (inst->state =3D=3D VPU_INST_STATE_NONE && q->type =3D=3D
> V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) { @@ -1451,6 +1456,7 @@ static void
> wave5_vpu_enc_stop_streaming(struct vb2_queue *q)  {
>  	struct vpu_instance *inst =3D vb2_get_drv_priv(q);
>  	bool check_cmd =3D true;
> +	int ret;
>=20
>  	/*
>  	 * Note that we don't need m2m_ctx->next_buf_last for this driver,
> so we @@ -1458,7 +1464,14 @@ static void
> wave5_vpu_enc_stop_streaming(struct vb2_queue *q)
>  	 */
>=20
>  	dev_dbg(inst->dev->dev, "%s: type: %u\n", __func__, q->type);
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		if (q->type =3D=3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> +			streamoff_output(inst, q);
> +		else
> +			streamoff_capture(inst, q);
> +		return;
> +	}
>=20
>  	if (wave5_vpu_both_queues_are_streaming(inst))
>  		switch_state(inst, VPU_INST_STATE_STOP); @@ -1526,7 +1539,21


One small suggestion for stop_streaming():=20
switch_state(inst, VPU_INST_STATE_STOP) only touches software state,=20
so it could move before pm_runtime_resume_and_get() and run on both paths. =
Otherwise the instance stays in PIC_RUN if only the stop_streaming() resume=
 fails.

Reviewed-by: Jackson Lee jackson.lee@chipsnmedia.com

Thanks,
Jackson



> @@ static void wave5_vpu_enc_device_run(void *priv)
>  	u32 fail_res =3D 0;
>  	int ret =3D 0;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		struct vb2_queue *src_vq =3D v4l2_m2m_get_src_vq(m2m_ctx);
> +		struct vb2_queue *dst_vq =3D v4l2_m2m_get_dst_vq(m2m_ctx);
> +
> +		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
> +		switch_state(inst, VPU_INST_STATE_STOP);
> +		vb2_queue_error(src_vq);
> +		vb2_queue_error(dst_vq);
> +		wave5_return_bufs(src_vq, VB2_BUF_STATE_ERROR);
> +		wave5_return_bufs(dst_vq, VB2_BUF_STATE_ERROR);
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +		return;
> +	}
> +
>  	switch (inst->state) {
>  	case VPU_INST_STATE_PIC_RUN:
>  		ret =3D start_encode(inst, &fail_res);
> --
> 2.34.1

