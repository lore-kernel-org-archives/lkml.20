Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3610C8D9;
	Mon, 14 Sep 2026 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376673; cv=fail; b=ZF9EoNOG0BqAEQ3WA74GN249lM4KsQeLMj5L4K8TOBNDT5u8msR+GT/HM5eisiWMnt6AGyTy8+YsoCuDRSH3+nq5P2/uP+tNOgGnF1GY5nASceWITHj5pB1kPH93u2XRpX45NTTiMXv5WPor1oz0jUpS0vP/Gua/RwKDROGrTIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376673; c=relaxed/simple;
	bh=pJZoow4UGvQKO1/RrGJdTX1ivC6REOr7QQZkf9YHUIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP8W7bGe0Jmgkpef+aQdOt85fyEuzCX+Y8vD6wUt74u9g6kgUxmGJAfL9uFWMvC2XpWou4ftd22YEzmlM9mTC5I4kAQpp2iDUh/0kC78RVpCKO0HGTF3hlLMz0NJDFeLFnULk9m7jjtGocv108VEPa7B1KBimIu+y5K7SgyTyyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=P+ow2uH8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=XDUQ+z2K; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="P+ow2uH8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="XDUQ+z2K"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5BRrN317847;
	Mon, 14 Sep 2026 04:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=weBWEJvuFR2cH2er63
	VOVqqb6j3fIsTQLuK0WKduTe4=; b=P+ow2uH8d4lHq3I/tv1XrIC/GDKFeEVajq
	MOm5IRD7CXfoUZtiI9hifgriRV3NtjRhGWaxZNrnpzaTm/hPA5f9mDqYBwhpP59S
	ww5WMu7uvIc9EjfLnGbT/+I6H7wAzR/1IhuCyg94zeWh4N/b7TPWYwkD00XWgNSY
	GgBRZqOuvas6sHKvO/P7fRmZ7ZHWqECoS+79XfUEMDKRza5gihcLz/ZJ5Z5z4xLt
	oI+82Mtr7rS5w6AzZ3LuDYcqxpYHfCDxwRczBr4g1OjazqE2g2PRSOEBFWsY1krq
	wxfq1xWs4RR4iMHtdk9IYxH6cXKMLgFXZZwfi9MuU5JwVKQ7w2iQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020101.outbound.protection.outlook.com [52.101.201.101])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35h9mnn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 04:03:22 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m9/7twKEZtNxxptV1LzXrc7dPWEZqobLtsgvhiDoMEH87B7luBJ5jTFg4h8CLaepHESoozMseMEYEKQFzP7+w8MhcvZKi9FFzOpDt3/marqzl7chJNQ7EkCqdB+r3fD/Raiifa9t7ziRylQFQtndtF0LSw6d0QJy0IcB5eUmL+A7otsQtMnhvWY30HZobIIqXXUg1R+kGkvBScQm6Vr9jNuQO1aEpNtWRi+bfGnJkLf4J6Pu4nUXn7C7ndwzYbqGAywUnuSl5LVgcjEYn0dwB6qJ9v4nPi/pR5b5pApqxYXj9xV6NhmCHkNBHzs3tRjVoUOhkZDiB1XdvsE31URnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weBWEJvuFR2cH2er63VOVqqb6j3fIsTQLuK0WKduTe4=;
 b=t7K9r3cp8KJCYBzmvSQbBI2o0u10eAPGnZGqekgzh/W6hSqMEV0CphONJblJ5oNV3sZLD7sDQffy9k5pzPSaOzDr2YmrsJamRYZKfFgIvzgXIZVXdJNv65Sb152PT3a47EDsiTkXMU+gDKi6G2ysoiNf6MczsQJS/POuk5QoMYuKPqLsIl2hH7oWMtlyUOj56keBov7gTuQFRt/zK1KBDB6wbshhaJVfswVXLYNZPbAmmYDzdE1b/M64lfLHPqHivAQKPPKCWzUrikDRmO9JBUw6+DanTGp5OPg9wTPTRlF0S3hlw2kinmvbnGQwhoepuISNNlil/hQwDYJzmI1oQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weBWEJvuFR2cH2er63VOVqqb6j3fIsTQLuK0WKduTe4=;
 b=XDUQ+z2KsVW1WnPGnvQJztlOvCwDExBGe8/ZS2bXW1GyJFPRs0BB+QoHPEeXUj3Q/b+THYTLMv1TjU2Jduiw42YPSQVDSYey7IFd2+apf+/g+UYLCF5X1uaqxwbvu5+l4CJSSPtow6vywnpqgtHeXm53JXtpYusV0WGD58yMJik=
Received: from CH2PR02CA0006.namprd02.prod.outlook.com (2603:10b6:610:4e::16)
 by CO6PR19MB4819.namprd19.prod.outlook.com (2603:10b6:5:353::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 09:03:18 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::a4) by CH2PR02CA0006.outlook.office365.com
 (2603:10b6:610:4e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 09:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 09:03:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ED7A940655D;
	Mon, 14 Sep 2026 09:03:16 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id C0AB7820247;
	Mon, 14 Sep 2026 09:03:16 +0000 (UTC)
Date: Mon, 14 Sep 2026 10:03:15 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Khanh Le <khanh.le.xr@renesas.com>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>,
        patches@opensource.cirrus.com,
        David Rau <David.Rau.opensource@dm.renesas.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Yingkun Meng <mengyingkun@loongson.cn>,
        Trevor Wu <trevor.wu@mediatek.com>,
        Julien Massot <jmassot@collabora.com>,
        Jiaxin Yu <jiaxin.yu@mediatek.com>,
        Shane Chien <shane.chien@mediatek.com>,
        Daniel Beer <daniel.beer@igorinstitute.com>,
        Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: Use consistent indentation in the
 example
Message-ID: <aqe4U6EJ0cGnV+Al@opensource.cirrus.com>
References: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913123234.99988-2-krzysztof.kozlowski@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|CO6PR19MB4819:EE_
X-MS-Office365-Filtering-Correlation-Id: e81efc80-cad7-410b-9270-08df123f04f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|23010399003|36860700016|61400799027|16102099003|22082099003|18002099003|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	VFxRomc5vweqDqCrCOGMhM3EpXx6p/etr8PcSdg8pLzG9LYnbE+ggrp0iETKHGXYQt+fUMmkLSyHyv7zbymqw+bDLlUkFBHjQd9UPiJsx7VagsU5Ia7RW9r/Zuhfb1/IUcob6p60VKbkCs3d3bcHz4b5P3FnY8v7oTJl6dyqZLWmsf2iVob0SDtein2dW2hftw15ICWnWdsbFWomPFqWUafcblZP7Uyo42rL9sy07MPkZNTfQWUtGCeCoLZAnDvidPLDD1C/UjRTWFflq0o9NdsO19V/ZZEdpK+hih+Hv+t2MAb3/QnyuraZG5sss31H2+Zk4eSUqf0CGmUGnfHckvLeOQ1VJE8PG249JFL2npnCx3hafn4+kE668HaBAlEGZyTIH3CW+Atp6mvM7bvOQcQOyrBz1NIWutkLJ/HhW3U3+SaG+62999VeFqYeB9dPsCO6QK4qATfWFRkVhz9jjkOcpXDybTKKeVLi8gLS3PtD+2kENnPepDCAhUtgV66CS4fOZsDcXo9MCMVJVerDRKlw0KLwBxgGjkYRLADoW+aPwSpCkYTFdvqoJBuDwXITdPjQTnPx28DJ99S0Oq/R5/LeNySckaAd2d0crT0qyX02zDlIzVT7OO0sBdk+IZRxw7/bfeP7j2MLR/+LLR+EscQgxSGC+VBx5dJS4g9wt3IVGqnCJ8X7buYxGwgDsO3cfwvbUIm/X3Re4KqBUaCyuA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(23010399003)(36860700016)(61400799027)(16102099003)(22082099003)(18002099003)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Z6Gkp4m0KyjoFN7LQyyK8QHcZqFWCZY3/5plMkUjgRqc9JLdDfxWlAj6d7oEVL5feavjjtcFoIvl7niItUkqXH/uLZ2/hocXROiAuNKnDySeFjip19i8DrjovKX5cnFj9K2NQqleBSVgqMgws46xsmKPT86PxHE0btuBhTfFDbmUNeA8lxdsmIBQIMgtN+SPmuj0XwyfhpBcjqgYJ/GpzJHfbelfZqFf8yt0g99ZpaOZYuq1RMqEuhB88v7LL+PQLMarq4byZ4hkCwt9HF8BrzxF1r1xji2w1u6nr4rXlyHznv6vAHS+tbcd111DnkAX/RA2hyLkCH7jUkt5g5Lw013dOx6B7Q651/BkdIKVe/uE0tPq8E0cUFZ3f2rQ7/e96YZzra3UpOJeGVrR46UOjAnM3KW4zL7mHAnZVUWbGr+cfaaugplpsm/VGOOJTefU
X-Exchange-RoutingPolicyChecked:
	kmZ7w6fDnrUEhvEVkMY3Shin6X0p6OSgZaC+Y/iOX/xJtAdu13WayvEoEGkMMt4kVm5+qg/5tU6uDqjgEThZDleaZ961jW0jc8C1+iwXuncblvFHKv7ULni8+eNldA9EsQchDjLuhS5cjZ21BagkDsNjPdGnLNrxJdarRux969XX9oHgdx3P6muazgaYcN9vnvlO9Gq9fsHpsqpISsr43FCwIidovjxHiQLqIuGinpgnUt92tyHJvVosbzPpGISKYcplagbAYH0k9h9W7F5BIPK+y0hAp3QsS8cvfL/OlQ/F6N0y6Z//jYj76zMSxqT3W022wSt/jflEC3wBf4py2g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 09:03:18.3032
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e81efc80-cad7-410b-9270-08df123f04f2
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR19MB4819
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX4CfEla0ILSUV
 FiB9pevpXdLmxYNfoNYFmnZyo90wQTKayd+mU1ZhDYFPdesPCbvXKq8jmrudjyr//QFen+2O8fn
 D10fEe2ioqVmW6I1xmzS4tkTDAIWc/U=
X-Proofpoint-GUID: pCI2i_DLp_if-zNROd5QIpo0wl2hZ6Y9
X-Proofpoint-ORIG-GUID: pCI2i_DLp_if-zNROd5QIpo0wl2hZ6Y9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyOCBTYWx0ZWRfX6scuMoHJY0ds
 L41aGMx43shPJi2id0mZ03V8Sil3Nh1SoKygWryFcqlaW6C028OZ07R8ogB5ptoqayx45Ib1y9F
 kmlq+7iqdu8nv0LgGgM0EpA5fhme8Q43v07bWz14BEhHa7IZ+yxU4/AEfYuDRBEvzZKab9EbO8X
 n44upPWfLt0tG/nkTuXDxS4K8FJb60g8Jjnl2W3LuxAdXQ8uB+7LMK7XN3DVUCvaQTC0jX1pEFQ
 wFrZyeBiw8KkdcxgIm7F32sDSgcL6gGO5pnu7WBINfaoWQ5iMKySFAmLyT6fjBaFw5EkmzGrOYy
 MlAVw2kZnxsAelc9fgQQ+j4C0vNMbkjUTYgXZNelC4RTW/kgZbBSKtl46gYZk57P8+rcWYWJaRu
 fuNhO3y+4bZymuUJduNhgTYHfsRDHsiOZ6x6hILvVG8NXCsZwpM8+6RIYHbFzxYzJ0JbGlCRVxV
 B9NY6lubK0o4Vh/VzgA==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa7b85a cx=c_pps
 a=47SeNQKOTh9Xu+Vpzd/oYw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=6MNK4Np0iOagQr2kdRsA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 13, 2026 at 02:32:35PM +0200, Krzysztof Kozlowski wrote:
> Correct indentation in the examples to consistent 2- or 4-spaces
> indentation to fix dt-check-style warnings ("example 0
> [indent-consistent] indent mismatch ...").  Preferred is 4-spaces, but
> re-indenting entire example just for that is too much churn.
> 
> While changing the lines, correct also node name to be generic in
> dialog,da7219.yaml.

And cs42l42 which you also fixup, would make sense to fixup
cs35l45 which also has a non-generic name and isn't fixed up.

Thanks,
Charles
