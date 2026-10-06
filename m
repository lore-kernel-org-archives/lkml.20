Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com [148.163.139.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F79390CAA;
	Tue,  6 Oct 2026 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.139.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791291750; cv=fail; b=IaU0RuOFT/fWTem5eQszpe6HkD1EbHIa7vSGFzkzpkIQkUvnTZvvoCL5kcYM5oO7Bs0sXoSWJQK32Q9guEvsSPH4TStNBBjxAWFf052a4BfkX8llVeV36GsJklmt6KVmxKWPCGHqrOAN9v6YYoAXBT/Urw2mV+qNKlBFlnaQjFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791291750; c=relaxed/simple;
	bh=MpAWxnVJS0jbT7GF4DnWr4DC2NhPICKMaxx8qmP2pns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QXFxpGCuWBzryK/wmRS9lDRfiP+PspDkd/eA7pZYzrTaZHBkxyhCOQmSW+ZjJ4G4oeGD4yg53e16qtJcWQxA6SP1dYH8cQddMqv21kjxx+TwOM2y9bCPzS7zSnDlGvQUJ+PSZ0rQJ1VoFgd2G8GweBsihFDscqG3aIra8+5t1wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=UuYkKu5x; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=jnhyUJXm; arc=fail smtp.client-ip=148.163.139.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="UuYkKu5x";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="jnhyUJXm"
Received: from pps.filterd (m0516786.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696BQfVR2052634;
	Tue, 6 Oct 2026 09:02:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=8Ikv8Zd4qXEYKkacGOMwPsXUI+5NQY+1WwHY50spjh0=; b=UuYkKu5
	x+9LiBLsiVOghONWXMFuLui++BxFUwd9zH1IxAqTfZOrXaxMI/Dj6QqTH4k1Wrcm
	+4KK+q7s0XHBjXLZ6+Za4EsjFtfysFNaQ+0SZAvonrc7xkc5UtqIdSf/ovsW32Hn
	GPkPV9zzKIP9yRaiddOgj9rt1OzDAxQuz4CTCVmUpOLKqomPuQr3AnjDGygCxcjr
	2GQoqe+rtyPU/QXsYcs8lbQi30FfxgGkKmWbJmEuW+drd8caQ7wrpVMeYLIqYUkF
	xuHo7jwzitjXgy+5DHtdyoGy7mS9K2GfcIBiqyBDZ/6vRbRBpSW2jUhlL/JvLT63
	8i2f7SvXOXHckww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=8Ikv8
	Zd4qXEYKkacGOMwPsXUI+5NQY+1WwHY50spjh0=; b=jnhyUJXm5Kw6lWSCF6iQv
	FWZhwIPygJZSALBeYZhh80t4s1qdO3yCc+IadSO2N9tdnmud2gy/mADs+VQUlbcS
	NaUt7AA/WC2DyITBuL0KEigTDE4+aGbPjkDc4yN+m4Gu2ypknfqhzE+8DRIXTNGc
	SU5kb+oi9DHqUXjfhClUonLMjV1ZCiwWwCrrdd1b5g/JJAG7iBokB57cxu2lIXcv
	YUsV+czVoZ23bTAR4SChqIo7iog3LS/Mxdms69sjSCP/KJlb1uW3IrhvWPlFsm08
	98JsVZ0Im2zzeRSqaejQR8ojPcEQUS4Hbm2wh3MscW64LO3OZ0JSeIPA2VXfmtgH
	A==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4h4pkx33qg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Oct 2026 09:01:59 -0400 (EDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFJ3cJuAN/fnRDoN5OuLdDt39uV5HJ5Viv4hFyMKD1Ka0pboLaxeReHRVpiK4lJ4OOjfi2s5E+nAsw9FipiTZQDdIDcKg3vFdf/MUmoGDWiUz9ci+UBNc1xjrF/ISYYM6pO5ntvJbdpUG+xhSLjMpEWj53c9fiyzRs0Dat+NmA/8HQXGPK+ykRDqn9cqP4gOarkd5C6I0ORpZiPn/T/NR8A93pDqMrYRwmwFn6Weq4wHYOct5rf43H0eFEvma1IK0ltgJJbJ7Di+OozBUvmvUVdSqjOYUwBDTTCQ/dMP1sXsLPqN+AVB6SCaSUrgZuFsr2lgzT5npKBskglxofacgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ikv8Zd4qXEYKkacGOMwPsXUI+5NQY+1WwHY50spjh0=;
 b=bYmqswtq+rEE3AHMRqr3o2KaXMuXgVQM4Tb7jxx/To2phu9+cTr6FybQx9/Itq5O8Kgympf1eiKNUCmEnJm0qSzkMuK1hbU+LdjjLqKFGxAZx8P2OJaUZQDL2RjMABgWMm4+C3AKA+Gii38UrWo8sICqiiWYgl+CHc57lywLcA98aWI6M/Ap6nnivBarap9tFSOHUX2reF43qVL+kwrt5TT9T3WuuCSek6P8yRvTEMbLqA5NDf6pNjyI9Ru0xhLyvWmY58Cdd3Cq4407wBYDm3n2pGEE7vXJzgm6FO+w9J09ChHUnPLtUcRzy2WO4e7VEgsULYomd5gDPt9QHgUiIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analog.com;
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com (2603:10b6:a03:28a::17)
 by IA3PR03MB7762.namprd03.prod.outlook.com (2603:10b6:208:507::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.15; Tue, 6 Oct
 2026 13:01:55 +0000
Received: from SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a]) by SJ0PR03MB5469.namprd03.prod.outlook.com
 ([fe80::2a19:76b2:e731:8c5a%6]) with mapi id 15.21.0496.010; Tue, 6 Oct 2026
 13:01:54 +0000
Date: Tue, 6 Oct 2026 14:03:12 +0100
From: Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>
To: Alvin =?utf-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ASoC: adau1372: two small bugfixes for the codec
Message-ID: <asTxfoXO2RGllDDx@nsa>
References: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006-asoc-adau1372-fixes-v1-0-599cc17fb5f6@analog.com>
X-ClientProxiedBy: MA3P292CA0053.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:48::6) To SJ0PR03MB5469.namprd03.prod.outlook.com
 (2603:10b6:a03:28a::17)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5469:EE_|IA3PR03MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ecdbb71-4bfb-4430-8507-08df23a9fe9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|11063799006|3023799007|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	9QELKS6cMcFgm9F3o8+PSFmAZo3ahdVKOjDaDmZAqcYg6YR5EcxAaLap8AjGuLeWIIxJkP6e5ed8CpqMIi2gd7MaZrHUww44ewDw4VpZ10YXdyCvVM6FG8WP5vH2WEK2ZxEIey05CuO+JRiG3L/JuK7U9MX1BEb7jdQV9lVlW7YvaiJvG5MpX18iOff0CWieTY50CdP59yq0MCYQNuQmDirKEOLDxaocc4QExlG0HHmD+ZYY9MgwHS4xM+EygX6IBQNj3enC6M1tkRiZBOTKL86QDnHnTE8SnDWrsURmpfdCT4HD8EAzy+3uPARS0lAE/Xn4cw8QJ53FCGFc2Q/0mWMDd/JXOc9f5qxbXZ6uREuHLynA6rO7GAY4DaJjeu2XEL5vQZ5+LEcHiAQU1ICCnCeY6fSclfJ8GFdrFZUiiApriBiuBXlkhq/JwgmiLHPjZymFshKIgoXuOkkmOiK3oHnpcnYjf0NtFk1kEhGoAlFMzH3AVtqnDg3LobejQPGF5L0XdcaH935tfYobOmLyiRs6hu0q//jweXGbUsag/GstgPuPh1W094aYLuBVwTEmri7ehnxP2nmpRlLk63mOKueuRhEh5oE9csqpQJIXMdqBWvux1ffNBhAoHPKdy3Fdm+tC5cMY2pBSMAibmbHz7badcWDLe2oc6JyduQELM0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB5469.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(3023799007)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amY2UWI5OFpXemM4SExDdDdxS1pKZ2ZUcnJ0eUw5ajZ6S3UvNjUxNEtMSmVk?=
 =?utf-8?B?UTBWK2RlYlIvRjllUGJpNUxoRDh6WXlhaC9sT1pSeUQybE9VUjAzRnc5RmZw?=
 =?utf-8?B?c0dVLzh2QmI1RUYvNGZvWlVaM3VMMkt3NmJlU0Nlb3BvczJnMWhiaGpkNnl5?=
 =?utf-8?B?OGVEZ1BpS21La3lKSEZRNmNnUWZJa2lqR2d6d1dJZGZmYWF2V0djemYwWUhu?=
 =?utf-8?B?MjJ4ZG1wOGtkaXpWc1lNcmY5ZUdJNWRJMkl5Z1FmNitCa0E0U3YzZDJhSUpX?=
 =?utf-8?B?Z1VEVTA0TmNweHptVzk2My9XckRDamtiSHFlbnhDL0hPK2lXck9LTHVQb2ZJ?=
 =?utf-8?B?aTkvdWlueDhhdndUaFNzY0txd3hJZFlGVlNiWS9CR0txSS9RR1lCcDBuWnhE?=
 =?utf-8?B?b0JxcWZUQWcyTjAyZm1ydGd5WC9QREh4Y2F3cDdiSWp4V05jdU02NVZFbkdE?=
 =?utf-8?B?Y2daNDd4azVHZVk5YXVhNGR0ZXlRVElma3BxSTRDY1M3MGQrWDVBMjU1UWVS?=
 =?utf-8?B?djMwU3pmdk5wT254NXdwaTNQQ2Y1R0ZNOGpCK1FUekpsRzI1Zy9wdTF6aUtY?=
 =?utf-8?B?c0dTMHUwa1RpUTFQM25uQ0E5VFd6YmRnN0JMOTA0TGVWN2pLQ0N2akRjWG5M?=
 =?utf-8?B?M3R0VldLZ2xwcDRHNEhmcEp3OUM5MXBPdFpOVVhJcTJsTURQYTdwSWNkWVFK?=
 =?utf-8?B?RTlaSFpndWE5anRSd0tiYUd0d0c2OWR0bHM1Y2Z5SVhNU2RNQlY4dDdkZ2pX?=
 =?utf-8?B?V3g0WHJKcjBwd210dnJhNy9YTTZCTEhJcWtQOEhPS01oUUlacnBzT1I0ZkNx?=
 =?utf-8?B?QUJzaFNrWldTZUpDeWNPZlAwMWIvMEYvOXlubzJQQUJrQU95KzU0UDMvczZQ?=
 =?utf-8?B?aS92bVpVTy9LVDFUcGJCRDdyRmswMU1DcWNML1dTaFpIdVhsREN2MjhVT3VF?=
 =?utf-8?B?TGJrTFZPdFQvV3dMc0tQeXp3L3ZzemprWjNtdFY1dUVCdzE2TDdlVklURVdq?=
 =?utf-8?B?b0J3K3I3K2ZIOVBvNDlkTWZQcERSK1RHL1Rkb3hVLzBLamxpZ1lBZE1GWTBT?=
 =?utf-8?B?MDgxYmw3SkJyN2owa0RYZU9qZzBQS1VHa3E1RDZXZENKNGhXTS9zMlc1d25y?=
 =?utf-8?B?UVRFY3hLL2NVcHZqeVBWWFV0VUxRZ2dTclhMVkdlckNkcVZCa2xYZTRQQlR5?=
 =?utf-8?B?VEU5eDBzOVpYZGtQWjBQOXFrdzNxSWgwb25MMGw3YVpDdFhRMGYzbFZwVFV0?=
 =?utf-8?B?Y3pzdVAveHVEOXFTejlTazIvdFJ0UHlPMkpqUU5wOFhGeVZBcnE5bE9IZXRC?=
 =?utf-8?B?cDI2ZGE0VkZNeE5WN3I5Z090USsyTkZYR2E4RTE4Y0x4aGVsV1ZmUUw2cTlB?=
 =?utf-8?B?Tm5WNFU0a0YraUtycVBmK0lVSUFDTEk0UjNjM1NhcVdVRWFWaWpNZzUzWm1J?=
 =?utf-8?B?Z3dXYUk4cGdSa24rWkw4d01YODZIQmxIaDZKZEwxaWFzUnNMbVBtT3I3c2dh?=
 =?utf-8?B?YThuWW40bzFOeWpJcUh4ZUVpNlMvYnFCTDluaEdEZXJlVklCUWp1RnZXWTZU?=
 =?utf-8?B?SEt0R1BDREtXV2xScDFCbEp1UmVReklJUnorVHplSEc3dmxWNkI3SHpYV3Bw?=
 =?utf-8?B?dXRqY2lWQVI2R0w0TTJvNlRVVEllaVhIM2JDODRRRVJKeDdvMVRaZk5pWW1w?=
 =?utf-8?B?WGh1OHpmdlVlRWljWk1YMW9oUlpwMkFjUWVzOHUzUFpOcUVLUUV2Q056cGEr?=
 =?utf-8?B?TFlMTSs1UVBudmREdGFYbUcrM0pwckFiTFZjSS9IZ1lMM1FiWFBvZGJPN3Ux?=
 =?utf-8?B?MXJOemdjS1Jmd0JsZHJuY0lxd0h0QlRNMWNlSTVNVGlySnFMTWlKdmpmNkVP?=
 =?utf-8?B?NGhyaks2NENOQlc5SVp4MnA3dXhMeUFVTmxlcGlxa2pBWklOUWZQQkJ2Ri82?=
 =?utf-8?B?NUlqZTV2RmloKzNZMEdRUHVaOHluTW8zNGJkNjBtZEhLbll2TlVqU3oxM3V5?=
 =?utf-8?B?U2V2ZitGZ09OTWJKSWdGQXA1VU9neHRtNEE4M05HMHZVMnlLelcvUVdUeXIr?=
 =?utf-8?B?dERGMTdZQ2lFOEFUcFRHQXZ3eHl6cWowWjhWZGJWRTJUam9aSDYrWGNvR2p2?=
 =?utf-8?B?UzhzNnJZdk5mbm9ZRXYyYnRZUmx6VWpiUlJXTzkxWEZ0bzhTMHgwS29JcVBx?=
 =?utf-8?B?U0pCa2ZOUm52STdOaVNkUCtKZDhtYWwvYzRtZGhsZExjZ1lxQW1iVjVaTXdP?=
 =?utf-8?B?SUExRXVxUGphWkZkRjViajFrMDFQR01nTkdvQnp0UWltZ3dHYjBOUVFUdWU2?=
 =?utf-8?B?MkNJR1NFZmYxWE1RVVBlV0diNlRmT2tuWnAxVXJjTmsrWnlVVDhQdz09?=
X-Exchange-RoutingPolicyChecked:
	nrsvyRmVqHvq4gWcI2C89tpZCS397MpdaMhVJ/1cti1PMGNsCe4nBiMZTaWBD21gFL/2uyJ/lqxrfJ3iYuTPdVqxWzGQXEJmCvEwtSohcVtSxwEFuP78hTy89/ekopmiZpJLhXBTLtXlRA5EJe8BUNyWkesWguCboq3zMAdNnVF/n+RwyB3ysYHPToKM5lTOCk1kefttNvkYJykdozY/QDj0i//4s4KJLMh59+syhC+A+D/4hlzU4kGlgG4JqlZc5eBN8HXqcxuDMSJrcq+UDuDVS2c7+E2F/1UEOvFy0O4auGOjBqogSTLlI9FOoLWRLTETG28ZjsiP5bJqQQvAmw==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ecdbb71-4bfb-4430-8507-08df23a9fe9a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB5469.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:01:54.1189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gUiOkOETeBAU/szM3DPTemHS5RCgMfkl2d1hp/ll3oDOs6UiKj0d4RGMMo2R5hMhnfFpHCoUimrR73nX1SJh0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR03MB7762
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfX7JOgjUzA0fCB
 bAaQOScUeTPjXmWB2P14B+b8VgVhuHseQ8Hfr8kqpEcc5r2jFdUrf3nsrM6qWYpo3XndKYKVXLw
 mflvdKV2RCGw0YPgHFUXLt7gcqK5FyQZck49B+ntQ8TTGxIPa0J7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA1MSBTYWx0ZWRfX8DlMmF/0lqig
 iD8Eg+cKPgc8l10VmARw0mouyYO8fRwPYL7ZEHF8zFGjCyf12uPyoDcuK8g+rtM9BqlZRCWI+H0
 wdY28f4IumBnd8IvT4s0s8LgDHkXl2MR2UEMOarqXdhPWI6IU8aCr289M0sfQOS31tqURwHtloi
 isZqua/3I4k83WryAH6v8J0+MyfUnrWRAYPhV8dv6RA1svpvaGpUUi0PldCcXhPAQLDEosVBgbY
 SRC987fsHDDSKX+gpI3C0peCWZP21EMCAomYY4VaqkSncMNycA9l+uRfVMA/5z3RgNmTyKpJUrk
 U5pFnBZnKngwO+wsuv1qzELLRneGGv7irlZxn/FmJ4gpgzmiZ7edgy2vNnXJCCgOKRfSSKpWXzw
 4bXD7zmA/c5RFWlp00kD/yhBLZwqrg==
X-Proofpoint-ORIG-GUID: -Vc1-O2E2BMz4iTz9sl4-prqhRhj_CT0
X-Authority-Analysis: v=2.4 cv=P9ivFSAu c=1 sm=1 tr=0 ts=6ac4f147 cx=c_pps
 a=kfEGYAivpUbBRfgbjfv6iA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=M51BFTxLslgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22 a=ZQxX5BWu6Z8IJBb2zLX7:22
 a=gAnH3GRIAAAA:8 a=xdfcH_FiUIGh9HHEDNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -Vc1-O2E2BMz4iTz9sl4-prqhRhj_CT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060051

On Tue, Oct 06, 2026 at 02:55:55PM +0200, Alvin Šipraga wrote:
> Signed-off-by: Alvin Šipraga <alvin.sipraga@analog.com>
> ---
> Alvin Šipraga (2):
>       ASoC: adau1372: allow sleepy powerdown GPIOs
>       ASoC: adau1372: fix invalid default state of output ASRC and DAC muxes
> 
>  sound/soc/codecs/adau1372.c | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> ---
> base-commit: d0cb7a7b2a490c381ad97f53155d02a748b60dea
> change-id: 20261006-asoc-adau1372-fixes-c4e6b9912ebe
> 
> Best regards,
> --  
> Alvin Šipraga <alvin.sipraga@analog.com>
> 

Acked-by: Nuno Sá <nuno.sa@analog.com>

