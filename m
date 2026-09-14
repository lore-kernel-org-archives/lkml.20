Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7343D3CFF;
	Mon, 14 Sep 2026 10:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383414; cv=fail; b=Fv6ICeiDhIY6SMHTmRlFBd5Uz7az1UEswTO+yjulZzCA2lBU39D4mQrAPg4w8VMSqZVkxuaag9rQzIKw8EoSlCFVnI/6dKbSjw2q3koA3wN1HGfSpdpEixuRY5ByD27BGjN7FRcfju3BQTQ8P6zG6LEt0u5BvBcqezvt3/zfhT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383414; c=relaxed/simple;
	bh=Mf+amyda1UFpMjwEpqn5RYgc0cat5Gy83JaXs3gz6fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dl51TPIUDH6U6uGfz3jYoJdrhqi/ATaftbVvUtKF/f4vb7Bnu0gmmZxDtUTMKGlojEEypx8WSMiQYeiU9Neimoovu5H5MiY6UuoBePra/ziiAs2rLcaIe/22gU6+ILKGcM6GrqZ+6QtGviUdbAwz6/Gj7FjH+T4SJQqhQm5bb4Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S6loSRk1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gRNdNGn2; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S6loSRk1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gRNdNGn2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E49B2j786064;
	Mon, 14 Sep 2026 05:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=02OXRsnL0dqQvKQBXT
	Y147djUE1hLnjuBi9UkLwTIvA=; b=S6loSRk1tncvvvUMwe8vtdnvkEOIXAsSny
	0TJpDLa4OBTYetREG6FIQcHFJ38H9KxyKOI/fY/qb480q5say2frJzg1GbS3vRXx
	CvYcKvNoFtw9sp36v1yHZp34HiuQTWy+5pz1GgW8DT3wCeq8AawB7zFh9eT1qilY
	hz+Fc5eOcsdMzrcTwaCiYznXevRBxYhgVSU+7l/vNS6V5ovA+1UJobyoVpbTORel
	Dy21pPHeeMeo1WhcsuzmZK3MwQdEWo5TFX3m1hLf4TErBrxpcdiCt9P3Yu4pGFiH
	R7NQmmmnuThtYVO4V8z1xAbZ1YnJmSqbrTy/SIezGsgUthcQXqWQ==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021092.outbound.protection.outlook.com [40.107.208.92])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gn44w9qat-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 05:56:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQPz6sDjRZs7tka52qLTgG29LsnSwp7spwz9KlA3HvZ4YmANGgzFX7boEhNxmmUxEVYqHe9/m+N748zO9fgVgu3BLv0rMAQFIkIV+65oS087GntMiPrvuYMT0rNx29HvrGXIHeqGQCu6u/cTI/yNusTFzfJPYZ/h/Y6WcToqbTy8vAz67GEWnDMHIHQnCAraUi1KmQcE9Evi7jQlQTJ8SWSXrXjfHQV2fak8FTKU9jv80oI0x0uOnbA4HlHDsDuUwymfsZTkL4WLAfN5yPo0/z3gMAmJjy7/zyTx0yPYGc0ShQWgZManHpXS9w2Y4TbGVQxkD7OCYpJO4CqFhZE1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02OXRsnL0dqQvKQBXTY147djUE1hLnjuBi9UkLwTIvA=;
 b=ii/wvcRP/mjvMUmicI18wbRdN9CN/34aM+C3lqBW3mY2yrVoK6R3OZs7fjtRjILSKnoMsExMCe1f+c3PsQ1ipMYL2jDW/DtSQdZu9l/SvE6I55csU7VpsQb8GFDwGf7FDMaVuVu35O1oL+OKeC5X4eAd4wqCdzzCEyUV8pzZvWYYY+s3IeMH6kfRxqlkQkKYJxmSt8W+85SQvYOYG9sxeN87YxfxN4Q/IV9Vi2XymPLSIRjHTGlgr65pXaFLbo0iANmyygGlPrwl2WA9mQHFSqLeNUVVERIj5QQf4TuYn01dTmCBZzGmngIkzByGA3d/1bl5ePTlTT65dkAjguJ+iA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02OXRsnL0dqQvKQBXTY147djUE1hLnjuBi9UkLwTIvA=;
 b=gRNdNGn2j+dRtmK/BVGuT14wgNk5sges/Aofxkp8uYEI6yQ5CgNE+wGW7V/uNP6gy9JbqmTx7e/SE/5+ompSVcQLqE6FsHSjYnHT10EnyBobz8RivhLXm+8tqlCKXlmhtY0JW/f6YkqyA7QQjPaBG9Q33BXTXQ4p3LRqG3PQBTc=
Received: from MW4PR03CA0003.namprd03.prod.outlook.com (2603:10b6:303:8f::8)
 by SA1PR19MB8071.namprd19.prod.outlook.com (2603:10b6:806:37c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 10:56:30 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:303:8f:cafe::3d) by MW4PR03CA0003.outlook.office365.com
 (2603:10b6:303:8f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.11 via Frontend Transport; Mon,
 14 Sep 2026 10:56:29 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 10:56:28 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 641E740655E;
	Mon, 14 Sep 2026 10:56:27 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4091A820247;
	Mon, 14 Sep 2026 10:56:27 +0000 (UTC)
Date: Mon, 14 Sep 2026 11:56:26 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] ASoC: wm8962: Fix regulator notifier and beep leaks
 on card re-bind
Message-ID: <aqfS2k1TS/meEIkI@opensource.cirrus.com>
References: <20260913101531.2787654-1-chancel.liu@oss.nxp.com>
 <20260913101531.2787654-2-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913101531.2787654-2-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|SA1PR19MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 11b3120c-0a12-47d5-4f33-08df124ed47c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|376014|7416014|82310400026|23010399003|61400799027|36860700016|22082099003|18002099003|16102099003|4143699003|10067099003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	JDvuZWgsNqR+3kEakOKFmny9QUrO/40lC3DXJc/vzxHZhk3YsZggU+GdUxpr1ICPHOG5+f5aX2VHVj8oXXZzKFTZEGoPzlKgp1f8+8kk+zXaOvUsgz1o6mziL+Luotuc3xjAtrroqcqjrmjrSfHzbsY7bzvyGSDDjfJQCLn5oKOeMVgo1Xx9jbWW4avTqniJP/jKNi3A+6qfi6p7q18rm23uW1oQq8pO4PEZD6HCZnyndQ7XJv4UxsGux+6bQ3WcpJ0KG7tiDkdt7pnZXHDLecIBHsDZF3Um4sAJd07A7aeGJwrTEWw2MBoyJqOJOdgVqbRa4ZG8gbuaZRQB/82yVqnRld3dyvFPOhUXqN9TJcG4nKJEvbAQ01vJFPxEnE/pZvS/lwI7u6b/4ZB3rkoa7cxHCQ5a2IyjOzFN6bYWgI0UoxbkcOCbHzD/YYvyaexbrJzVSJH5Urztks7Lwo+qz12x3uiokfuWZLQzvAxtD2SblyEh+qN7DmuLiJ0xtuGkI4hmA7d+kKhaRicv1LeioMwsNq/JxfN3hyeS++D6Od9ONIaVe74SmToMbJtsbCI7POMWedoM7mHPG6jxSWBpGuntn3jYqN0/eJN7hEo+tyfn2RQ7GwGqRsbodXQqhdyh5O2oTMZPeFwSLA9gI7B5f/8Uzq/4WtmgUinSKC80oM8Ox8Ur7n7mbII2OIKGi1AUz+v+4j4fpM0Y2nPBSPXrzQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(376014)(7416014)(82310400026)(23010399003)(61400799027)(36860700016)(22082099003)(18002099003)(16102099003)(4143699003)(10067099003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0ppPphHUEdrcHrj4y/hFO4HfkX8uC3jDIPvnyOJeDaX4jo4ohcPfzr3uWHtpQewVlTvcscNer603N8GMxT6X2Q8RCwzP49svp+QStsxrQsusiwDhaCrzmTZdguI9/wvdpee3gYGtcte5Pjs/11OMKKXJXIVbs5TAaptk29+wEgg6LLp8Zg+beA1+DzxDMmXfLgP6EEmnnFYHxnft3rOOK9BHyVMh7ajegJVmiGkaGIO+fy9ayy/ScsSgNR5vNnBgE7Ci/9j6LwgxAiHg2YJSSVwankR/4CSeQQd3oizOK6jyr4oKHY4zkbq4Ez1x5XmYAGGGGgZ2EUj+S6nSuJ1zQr7sN3O+iZNsgJZzkXMxb+5wW8kyGNsHNwAJfYc5cJj1x+fj7SIWEf+02EUwnhv6Dm+nmo/GnUQQ56qJT2fZM8PHKPcQXm4fwQY89lZEjW7s
X-Exchange-RoutingPolicyChecked:
	n9tlCHFOVeYsg36hqPz6dW7XOYks7tA/wwyHuQS8+ABH3idbLe7UFKq0NVG+Z8K50yszqZtZhB8mmLJkD2GNne3UlC2XmaQdgqsVf8ygLlDV1DuxA+nu4DWEe3DdrK9fv9A8rozZqXGSKgdRRUmuYPGYPo1NPygMvHZctonAsh10MeRkygnpMLuZUYU7N1HXfmoO58i4yZ+or2fd4jd2zO7M1ExFhVPxj7f5+nWjigymZ3STGDzImYiL/cwb0fweziOBX4u6aiWLgcttyqhIw4hg3I9Yl7ZFeSkTppRgp5r4H6ciWuXOLkwIFbt9IjNAiY5HvrWxxCRzbh++L5rqTg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:56:28.8285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11b3120c-0a12-47d5-4f33-08df124ed47c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8071
X-Authority-Analysis: v=2.4 cv=A+T5rKWG c=1 sm=1 tr=0 ts=6aa7d2e2 cx=c_pps
 a=N7hQvVYZfm862vJ1WlRLdg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=u3qkiGmfUHD6hov5-qEA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfXyjHe35BZjkKa
 zG9NfXYyhmnBHNxGgDDtLUPUBQ/zH6zRW0GdxXPY6REaBdRm1MMVQ0Na+ctZOxL++wUF7fDqPaL
 cVnPpmfcRFetKWemHJWhkl/6TKIj3mQXBTaoHWXoakUExLs0z4vFnJwh4nEMQpL3D/paGJcP7kk
 w/9efhGNU/Y1+9PDTUfMa0Og9rU9AIhdho/xBwF/Lm3sZ61kB4+T5p319jVLRvhsFKIJC/rsapI
 vin/sEcdrAwgDyialIp9F2ta4ooD5cSTHmUGEavw0KiUc1ghAE4qbCxp8Rb1wm5w6hCxIzRvbG7
 6ZIHshEtQVdZQUXS6Cws4f0L0xfP9LuGWj8GtYQUirtTG9XTgraHMmL2y02ydH9W6IcSJ85fAiu
 bXvT3UfrVPqKeEfBQ6O5OkKdNJ5yU/CH5MCfC/und9Zollt2yC8AFFiWn5YzMbJ/J6DppCb3r4X
 AynR8i/Bhdi024zxjbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NSBTYWx0ZWRfXwCs1srihbpGU
 7elh+NPP1B2qzQAiwTZXkARulABlKwvbh87+MBogUkFZgkeJ1C7+RfMKc8ohhpu63vSzfzI1ROQ
 dYUkFPBdXyoAjwMZHnrCuN6QdACHFWE=
X-Proofpoint-ORIG-GUID: gujrLctenAqU5-xnEFRe9XQZFhadmHU8
X-Proofpoint-GUID: gujrLctenAqU5-xnEFRe9XQZFhadmHU8
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 07:15:26PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> wm8962 registers its regulator disable notifiers and allocates its beep
> input device from the ASoC component probe, but the associated devres
> cleanup is tied to the underlying I2C device.
> 
> These resources are only leaked when the sound card is unregistered and
> re-registered while the I2C device stays bound. On that path the
> component probe runs again and:
> 
> - re-registers the same notifier_block on the still-registered
>   regulator notifier chain, which triggers
> 
>     notifier callback wm8962_regulator_event_N already registered
>     WARNING: ... at kernel/notifier.c:23 notifier_chain_register
> 
>   and corrupts the chain.
> 
> - allocates and registers a new beep input device every time while
>   wm8962_free_beep() only clears the pointer, leaking the previous
>   input device and its sysfs/input node.
> 
> Fix both:
> - Move the regulator notifier registration to wm8962_i2c_probe() so it
>   runs once per I2C device bind.
> 
> - Allocate the beep device with input_allocate_device() and pair it
>   with the component lifecycle: input_free_device() on registration
>   failure and input_unregister_device() in wm8962_free_beep().
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
