Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021123.outbound.protection.outlook.com [40.107.42.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC2934DCD2;
	Thu,  8 Oct 2026 07:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443791; cv=fail; b=FuNNtJxpDZbFp5Y+ibdU7ma8tr8g8mXayH+xMyIsqyMgLvm3eZqPwwhA8fGQamLGtOv7qMqxfx3bMu7fAdAS4fJeDfqRtkuPn+V3rrFZ8fhN61QMRrGzIpWl6vGnf6VeBee9kOdav7nqXrnnMnwpcOSw343fNEfHa3Uoj+VED8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443791; c=relaxed/simple;
	bh=6AKe5QgN3j/HRKLGuSFKpWhFGAsqnjCJ5ivtkmC1mfE=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FyBBwa0a+cdsg/mOvYWuAeX9lQ4LFPHJRuxPTlfSWBg+hCpig9dgzyMknBTCxyjSqa8SWlq2LVp65kou3hK5kecghTqXUCzMbWhGw3HPSuc0gxcJ3v4bKS2gYlTxPCnzOaET4zhXf8J+NW1fV4Rg0fW9IH1gfD88seJ2PHPq2QA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=TV3Z6QwA; arc=fail smtp.client-ip=40.107.42.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="TV3Z6QwA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpHt/FQcC8sQU1LYUGWXEj6s39cgS7gZMVCPj29++FBGL/8bmaiUC1Vb9vuERfhFcrvUYkZiAFg7zbmse8R+SIcuoki+7hkEom4xNjo+RI1OOAulvHXhSooxwsJrRBQlpaNoiuocy1Mt22XDde4UdV4xu4zTt3IFMUCwzWTb1R+iAM2pUTVAc6ZJvtG+RFGpV/r6IrGqFC0bTPTAHZLMNyJTnJ/teGcswFNYf5Js+X7OsA9hT5izKRFNvWH3iqjQ1P7aBw9fffxU8QCgD8VcNXNTqP1OQAQsKbtT487O4GcYZ8oCutkk3cu5aq6UU22rysR/16xE+3GKDMvOz0nbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JsdVLpaJAjTReZxE8YvrGx33lHzV5nlG/S7/KZjCVc=;
 b=nGQH0f0Ge9o4ZOYTo05DVcjdEiPqsJMU3B5oWfYit//F7eBL+H4qB73R38e4Y4pUFf7mFHgVBW9TG98UjocCgjNXUGkY0Hnay8NV9MYr3vF6um9BkokQc51qna2FX8xjJUQrBc6cLcD9EAPWZqzcfldZonMlAdAoqF4u9CIbjoAFk7slbo9etyduHWh0rIU35nuWCStNqgBjT/nPtRWiD+KRn7Jmo0+zlSYA5XffHJQX+lLG14GB8N4Vro/nQA43eaedcrvQx9T8Xhtzypx984eZuokp9MDHJctr0HUTZkzFL1CWn1XhbACJNMjvGLVgEgm1NoHAiw6+eK5NsekEGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JsdVLpaJAjTReZxE8YvrGx33lHzV5nlG/S7/KZjCVc=;
 b=TV3Z6QwAziPvbYHAKP7BnKHCK2/T9q0I8YwiyOf05LCXkCkvCGylyqZEVaHIquRn2/9nJSLQ8Qt0MpJZasyJezVci5xDXYFcUm9Vu2FkshER7gllCWE7EQbibt8A+SuRMf21uPKx2MRUCzVyh6BBy42jomFgGfiMVmzmfGZup6ej6yzxPKb70ZDfN8Wtyh61n96coCdeX8rVqOYnTVE+PAQ8LvXcOf/T7qoxG/IQ+lfCDZjisSf/7V5G1DQ5cA9X/Jlwye7sAJdZyL6mdcnWGdY5x5sc0vw0A6ZTqbgWDF5QKZ2bc8rMJHNmwo8jjRpEnl6mqJfKi8rg7UecpYjNSg==
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PUYP216MB3127.KORP216.PROD.OUTLOOK.COM (2603:1096:301:158::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.17; Thu, 8 Oct 2026 07:16:23 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%5]) with mapi id 15.21.0496.015; Thu, 8 Oct 2026
 07:16:23 +0000
From: "jackson.lee" <jackson.lee@chipsnmedia.com>
To: Jiale Yao <yaojiale02@163.com>, Nas Chung <nas.chung@chipsnmedia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] media: wave5: handle encoder runtime resume failures
Thread-Topic: [PATCH 2/4] media: wave5: handle encoder runtime resume failures
Thread-Index: AQHdUw5yzVy7a7iGWEaJMJFhoo5WNbbzQ4OQ
Date: Thu, 8 Oct 2026 07:16:23 +0000
Message-ID:
 <SLXP216MB11483788D54B7A534681CB66ED932@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20261003080853.430099-1-yaojiale02@163.com>
 <20261003080853.430099-3-yaojiale02@163.com>
In-Reply-To: <20261003080853.430099-3-yaojiale02@163.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|PUYP216MB3127:EE_
x-ms-office365-filtering-correlation-id: 97cdae5e-a37f-44b8-0edb-08df250c0f1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|38070700021|56012099006|4143699003|5023799004|10067099003|18002099003|22082099003|3023799007;
x-microsoft-antispam-message-info:
 2UBH0O7gEQXeVirPFjaYxI+b2JW3hhFKK8muSNJepGjDjyTCbxeFFJldg2+MUA98qs9xhWw9UrkS/tsJlB8PrMg6ESzEwkLr1lFzpXBtPzxK7k3RjkFz4Z8BH7H4XhOaZr8rvCynWbSYfxHPJkkWKYj6FlaIlxgVRjJ5HNFhnIJz1h+2T1vcB35/UlloGumA7DweDBaDIjiwNs1Wumyh3FaqYs8ENZkL0HEuz4Vs4LnoJ+ht//Mst1kvD/coQoEBPGUVr5w0Hpvto5dZXT8+p+i6Mz3Jf3NPj7ogzMtfNaJBXNEObU32RdVJ/5mWhYnPNGJuzjI/cHenIJTQe6F2DNRcLw99R/G8LTH2sgYpmZXGGcgpK4LxdbmCRaHRzKL7vM1S7q/q3baJD3b5Z9mp0CFTTA0QvoRwdVn97iMsJU8UEqTtOVL/q2eqNHEcodw441d9AKGrxmx+JRRHk5vxs/FimWud8WX92oF0U51XKNLZTz0InJ5ZwaFVSfcsDYHoYHGFEVB9yGFLENNgQbfYMiJJqlvB6lRAxeGIAuaGi5AHUMBceAHsnh4jkZRLrQP+aGSfObyf2zUI4Wl5vGZJl+/uQVbUk0zajTQz2aTmmcA3PCmXAeWYIKR96BZ0s8BZKy72d1BJDukJsVcxvzGubySHMEqHG54Z/8cNmJJyU0E9+zwha3iZSGlY0wjvEf/BBcyOekIZUXZcXf5fkywoOU8GoG5/3yysROtd1s7NMZQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(38070700021)(56012099006)(4143699003)(5023799004)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?axM9w3q7UkE474lAdtJXJCnat52Z9BCIs67fj7fzkXLNmSSP9bSO1qHs+DPl?=
 =?us-ascii?Q?OmXy+8MDSZny6T/X6ruHyNZ4eXIMnhrFH4ze7VLky3xPSZ3sUVN6GZ3/5Nkm?=
 =?us-ascii?Q?Cm6bwz0LtYQfwv+mjho78wAiZRVUOhOoq+DGwkLS0J0R7CzXLS0QjWUL70vV?=
 =?us-ascii?Q?xQo1fQWSXqARIzLZAlFt6SoE4KJa39Q9G7Ok+798TOy+sN+gQ0nKgsH9+aQo?=
 =?us-ascii?Q?cESJVF6U5XNw2lr3bjz09dkq134tQVA4IYYHS1hPj4wl/kb24UIl6qZPz0yA?=
 =?us-ascii?Q?UDl4Fy3Bvriv0i9V3mZx456O1AtF2NdKGcwCa4bsDMQMSpDAcFH77pzmcRZn?=
 =?us-ascii?Q?SBlGLMm3gyr0UL4ira3sS5x+j4oudakVjHCm8IlQEQx7OSNFShBt5a2i6Uu3?=
 =?us-ascii?Q?/HfJ4wwAARxLL/AJJF/qPG7kunRgW3vilywwY+eBmWOAZhBp+ADqwvmNw+hM?=
 =?us-ascii?Q?wYgGWklpq08ZX3cOJUmXsTN48/PYgXBaAz9PUvGw4ZX9N/gEcI3SMUChxLt3?=
 =?us-ascii?Q?fwmUhx77VUnXP25ebHmxIhY06lABMLIzHmRySd+VN8ORtDoSCTD/+Q7L1p2B?=
 =?us-ascii?Q?Ll6MzXZUstXZZjKrCl6JD+eFeptkmJvLA8rZjW1r5szeji0k8Jo/DL7RwJmq?=
 =?us-ascii?Q?zEoNC4LT8bInyMFQSuG3HaK49Cb6lxPy1JNNzroOISh2f0Bx9tep59zyjt81?=
 =?us-ascii?Q?1KPTmCM+DBkeEuVpxdyjhlqiVe4ySUvMAKdZbEWdczLqIpkrcpRVkgLmBNeL?=
 =?us-ascii?Q?Qmw4l460GzzHdAvA/nWGW88VJNij+nrqjWVFjyquJCub3v47dv1L/E9b3LJf?=
 =?us-ascii?Q?NGHCy2UM6nzW+LJm+3UKj+DLqMnr8vFtgmi7tbOcYs4+FDrZeNmB+iO59ATj?=
 =?us-ascii?Q?7n6v1IeKdz5Gncyf2C5HhifS6s5eyxuVAgE2OaJrzG8ux34QfYknq3m7Pysp?=
 =?us-ascii?Q?RnVJWH9U1QP09fTgr8sENLNiwfA0KeH8M9SG3LqVaflBRJr46jj23rpIRd4Y?=
 =?us-ascii?Q?bolzWHyBF6WXjuXWZcHvU9dTRXibJlQ5TOLxhS2OLAGpd+z6tbFALvhwZvgC?=
 =?us-ascii?Q?HY/xepuGC48jbHc5pwN10ZTB/CoVbovinPMFOJMJlRQJxCnOasn8ypgRhI8k?=
 =?us-ascii?Q?C5sArvtCFN6ei2FzYFNxEMRjcw/QdoYqPHVwD4wJBwLhGQM36s5pXoN8QyKM?=
 =?us-ascii?Q?dx6Q9x4x+t3C7fVcC52DSZU6A2+hf6FBbKBxatV+IqicuH5inM/s/gtLTWf0?=
 =?us-ascii?Q?usXFPEQDnTa3g39yn7775q4DcWnGoQ+azpnTih2U6po4ltBVbzUj+Mvxz3wx?=
 =?us-ascii?Q?EmySw2vXmjAmCksxvs71X/j2phwJdudASB/BX+hhkFUAvzzR94SrAPxHhZKI?=
 =?us-ascii?Q?iRrhNRBupxOa36Q7wcIiYTmf5W43155o2APOzbMSgp0P8q2eeUQYcBsvkKSY?=
 =?us-ascii?Q?tQ4rkuXcRqxp/BpSYqO0sD/LA3LB41471lHugmH5BP2tmhG/xsBObFi958pK?=
 =?us-ascii?Q?psMr0cy/crSxtnZngnm65NuLaK/Tb0eQGdUlVJJeko6RzFaq2ZWqkJPqKAd4?=
 =?us-ascii?Q?wbx9P0Kf5UAt3JUsy+4jLNkFO6TT0+4qMRh8Fr3+72/hDb4RaUS/JPb0Yraq?=
 =?us-ascii?Q?SWnZG4S9kLnqFnEahxjAo58SSoAA56Wc+R9orrTvlWNNK1o8SGLNzVrcDoC8?=
 =?us-ascii?Q?dgCPmXy36CJhu82JIm7GQMCKNRgOJgpC5Ivzn2zN3ww81Hekb66BjFMiETsp?=
 =?us-ascii?Q?rk4WOwWQOQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97cdae5e-a37f-44b8-0edb-08df250c0f1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2026 07:16:23.2757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bkD45DkwD8mcK2Z1vDhdLiAK6GqdKYVD1N2YyO8DHXsVqPFrf4kbcrHLfZh6eU4yYt/sx5Qwp6Oytu4ujFLpWlXohqsE0I/wbDCtlpWe3Cg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUYP216MB3127

Hi Jiale

> -----Original Message-----
> From: Jiale Yao <yaojiale02@163.com>
> Sent: Saturday, October 3, 2026 5:09 PM
> To: Nas Chung <nas.chung@chipsnmedia.com>; jackson.lee
> <jackson.lee@chipsnmedia.com>; Mauro Carvalho Chehab <mchehab@kernel.org>=
;
> Nicolas Dufresne <nicolas.dufresne@collabora.com>; Hans Verkuil
> <hverkuil@kernel.org>; Sebastian Fricke <sebastian.fricke@collabora.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org
> Cc: Jiale Yao <yaojiale02@163.com>
> Subject: [PATCH 2/4] media: wave5: handle encoder runtime resume failures
>=20
> The encoder callbacks ignore failures from pm_runtime_resume_and_get() an=
d
> continue issuing firmware commands. Runtime resume can fail while enablin=
g
> the VPU clocks, leaving the registers inaccessible. The callbacks then
> also drop a runtime PM reference that was not acquired.
>=20
> Check each resume result. Propagate the error from start_streaming(), and
> return queued buffers or finish the job from void callbacks without
> accessing the hardware or issuing an unmatched put.
>=20
> Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime
> suspend/resume")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  .../chips-media/wave5/wave5-vpu-enc.c         | 25 ++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
> index f9fcdf4c224b..5a5ee70cd854 100644
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
>  		switch_state(inst, VPU_INST_STATE_STOP); @@ -1526,7 +1539,13
> @@ static void wave5_vpu_enc_device_run(void *priv)
>  	u32 fail_res =3D 0;
>  	int ret =3D 0;
>=20
> -	pm_runtime_resume_and_get(inst->dev->dev);
> +	ret =3D pm_runtime_resume_and_get(inst->dev->dev);
> +	if (ret < 0) {
> +		dev_err(inst->dev->dev, "Failed to resume VPU: %d\n", ret);
> +		v4l2_m2m_job_finish(inst->v4l2_m2m_dev, m2m_ctx);
> +		return;
> +	}
> +

Runtime PM keeps the resume error, so every later resume fails too.
wave5_vpu_enc_job_ready() returns true in PIC_RUN while
m2m_ctx->is_draining is set or source buffers are queued. Nothing is
consumed here, so the job is rescheduled right away and device_run()
fails in a loop. Please switch the instance to STOP, return the
OUTPUT/CAPTURE buffers with VB2_BUF_STATE_ERROR, call vb2_queue_error()
on both queues, and then finish the job.

Thanks
Jackson

>  	switch (inst->state) {
>  	case VPU_INST_STATE_PIC_RUN:
>  		ret =3D start_encode(inst, &fail_res);
> --
> 2.34.1

