Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C409445FFC1;
	Mon, 21 Sep 2026 09:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982377; cv=fail; b=px+G0iSBU4MqlsM3m2RQiD3bi5jqYreBi9n4Y147DfZKPUlREwpOvX7vWYtrACo7+6tjJanfiuwqp38/HT2nlBe3Et+WFKmRboxvIVThKJ79CdDh7ey5NksV4HvZVpSdweKmNU35BSX1SEX/oMpquKmtK7IzzkhP1kqTTkQ7yJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982377; c=relaxed/simple;
	bh=RHwOw/Gnn3o2p5xZJEZxvO2m6gcN7IVtO2tFN6GthPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7mK4W2g0ZEH/PD5i/WWG80deWeU00J+fSnwwZOHoqtV/y3xJbj65DwYoXBvW5EkmD1iT4GUEe1mqPb4uCmoEg4NDxjoXKLAPpL145ShlLjZZci46uchOzHiFhaZcfwaDj3NTR0XuT82B2lFSfb6Ynwa1Pnt1/js54BISgdAbwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=bNhpTWdo; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=cVjVNp7U; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="bNhpTWdo";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="cVjVNp7U"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L4bLmp528308;
	Mon, 21 Sep 2026 04:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=neH3O3Zm3/Ac/BtxlY
	S7ZqqOb9o1kxTMCKug64sn8mI=; b=bNhpTWdoZyNZcdSSXu3/SG/1Fzc9fn+8+Z
	9OqzXFFUsPySfos8dXjtae4UsfZujHuwatoQ1z2fz5jDfM16nPDC7sV2bP5acRVI
	7lSV5U8WtveV7dxM368FCLv6lcnOt6OT5RBcgFLsrC9Y2i2jKQ8Wbb0aSBY2lCis
	FcnpWVUEWseqYwZ5SaxVD3VTidysAGEZ4AjPlnFfGlRHaLL2bfEmHg9OoNkgpGcm
	/MXSUVMrIHoebOoXsjOxuf6Z9UeakeIEzYBmaQGkrbbV8uOv4wR6sUWRfpwefRRm
	qUvPzorerY1iCwBVxQkzSQbYrEGitwz4gs6/Ql1zh9crYjej9oWQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022085.outbound.protection.outlook.com [40.93.195.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gsqt09qfq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 21 Sep 2026 04:19:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QrEnjYkdefCzL7AkxIwmbGVDBlj+QF7ubCDzUUffvnqpOspHcqULa0xEOcPY2MJAoo9fPddKvD5dGxm9HZrNJhATdlNgKUWdFvJEBcaVmINQel+aWIND/ew2HCAp57OBJLgxo0X9Ql+6f2mn0e+GZFy99Y1kc3/qsMSGbN0TE+qPLHzAb7dhnhZgOizGCWYCtINVBbe32BKfJhrC3LAWFuJuZBcqq8pEr+bxH6J2EZkkPCRaZEyRGqZt0qrsNa4a1I21TdrPTXBKPn7LPRm8rH+1ZpzPn5oIhgFYkKE7lCjyHFQhPdCoaz/+KSlfrIkhcXSfaePFxbZ/joDyYorwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=neH3O3Zm3/Ac/BtxlYS7ZqqOb9o1kxTMCKug64sn8mI=;
 b=rUadHAcSSyZZzwt/Btzgo/vaJmKefJZdoWjI3TjscjuAV0lWHD2fvDHBdIeNHHlpEK/+bb8VlrWJP0JxkrfUtAvMeuIj37J34dZ9zcGUgDORAndGzv5SaEtdFKOFfycNkyxg7Wn1KYo3pH0qBFFJ0o8iCqej522BESLNr34C18olGA4i4ep77zB0FkkVBsnreOQTr/O/WXBP0PQa/NoKXExNiGyEzcVJVbPGuX5o2WlCPi0TF+bxmJSfR98vkxjPXj/YY56eYs/wxhBhAk3yWOndcTvis9E8vDSGW73PYLoj86DM21uqTLnDDrrWuMXv6JLw6fmYu7SYq2oLHzk92w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=neH3O3Zm3/Ac/BtxlYS7ZqqOb9o1kxTMCKug64sn8mI=;
 b=cVjVNp7UplSXVxNKhjvpkVzwQIcKAEwd0C73Woq1vTxldnM+XeSlQUZ+j0/JiGthR3X5VXHxggvU0UcnWI6BmbIuYotziPeYHst/7drMP3cb11+9kpz/amzxhrweap0tiKKwv/KEW61B8efgXBnxhExG2WKwTirAH3by2TXdGck=
Received: from BN9PR03CA0670.namprd03.prod.outlook.com (2603:10b6:408:10e::15)
 by LV3PR19MB8807.namprd19.prod.outlook.com (2603:10b6:408:26a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Mon, 21 Sep
 2026 09:19:11 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::90) by BN9PR03CA0670.outlook.office365.com
 (2603:10b6:408:10e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 09:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Mon, 21 Sep 2026 09:19:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C8871406540;
	Mon, 21 Sep 2026 09:19:09 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AAB24820247;
	Mon, 21 Sep 2026 09:19:09 +0000 (UTC)
Date: Mon, 21 Sep 2026 10:19:08 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: wm8903: Move the DRC QR threshold to the register
 that holds it
Message-ID: <arD2jB5Q+fJ3u1DW@opensource.cirrus.com>
References: <20260920135327.3628704-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920135327.3628704-1-sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|LV3PR19MB8807:EE_
X-MS-Office365-Filtering-Correlation-Id: adb2a1a2-ab37-4fa9-3b25-08df17c1657c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|36860700016|23010399003|376014|11063799006|56012099006|10067099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	h0R0/nMGODm1INHyBWQlrv8TmL6A6oiVZiCifCQv4XVMTbmqUm2F9KvLzc4tNn3St10v0pT1svLYjl9MtuGeEN5SfqDqDXuXEyt16hm2EGPmW13201caHE/j6aC9utDvUNRvxU5nJ88Ah+RjFfjlZblw9rdn/pRvQBhjBPkIutNuyfFgLtIMKuVCI9HQoy8DBuVki3XZ5siY8hX3BO98IEg0qOtLrJFdGkj3giVJM4ETR8BZQiWtpVc662HA0f3daaU/DBJNgyynLseWCpfTeqYlt/xD04Z9kOs2WfhkT+bnpJz4/AmYPr1Q9vuQ14DQ4zDPiTBdnTx7mZaN3JEtvJcGUGZv40+OAjslnGK7zl2OUSnewZQkJmoB+cPC+lvtNWLIgOMoidgAx7pFq8kvtG2ysfbJEuCkoKl9VfPd1bPsyymtKHnbu4zowSEZHx1BvDLAXSp5FdfrIZ/M0niJqZGOYcN25DazwSCBQTuA58PHXh+mTupKimueCE0Smm+qZO35ruk193dCvWhiMDR0BoyHc7bZ3DUEPS1vPwaSUgJuE8etNPinUJ82JC6GY4bxsNfVA8ng9cXitj6Sw3gXOorhZvzffm+DiHI5gfOAEqjxZAiDcGnbx0xRHkwayNdUagUBgZRrJ2vECnb4c1oqSfG0L6XFL2tpt8a2xg1BfPSc049iSuNius+yXBiagrYRo5OdcMy7q4SUUKB0WNGi8g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(36860700016)(23010399003)(376014)(11063799006)(56012099006)(10067099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iuK4ZvYaYBHT+Op0B2HHyBMvBQGIbpWJxaFKPo5TGdBxkYjVvWKGuuq3+tRTjakuz8Kjn6J6fcqOYsGsw9IgptGgn8IyukwtCKGtX3EsQtcQpWbNqZLb5CB4bj3fBd2lCr+GFCK+GbOK6K4m26zMKfFExYXyMZf30ro7XU6KZwaIYnF4M3EYOJt3oozY7PRULDavRjIcjrwgUkPxkNWjMu3fPNmbdwfOe6KI+GX2TSGCyg2GPxO5HfW7+i59uFFKl02fghfgOXjdUTPHi62DjQyTpgnaC4nwe5eSakwu4DHh/jgQP+nkPT66e4ofYgTaPelz7EhKFnXrjiWkNUnp0O9yl6r0UIFdZ+SQWGqUsQTJg1pX/cKAxnVRWcID1Upx4qqwmu6+S59o3VJRPjd2rCpYZ4XsaDYLHDh2RoPZp0cRsaf1DecnvTqPkQEXVTKV
X-Exchange-RoutingPolicyChecked:
	d3AxAhj9i3xiFiQdtFNyglHa7xVxeFwJir92GNIpNIfQ5t91HYLBf8Lsut4f6LYqxVV6VK95Xx61VDF+U3CEAPCYmWxt3lurbLdnIsRZXQQD9fABjb+IgPePozHNg2jBeBI4lnI0oAM+/fgwFMg32Pxm3n3PZkj5wt2xTzjSLLvxIPZTS8w0i1jvslyb4/MiTx5SK1rc6SOML6z+QtLVRh5XNOouLJca241FB9RXcNa/rofMHa1kLdzNHuwWPdEWBm+emPUB5b8qlKNq6gyjHI9CCgtl17m/17MLX6UKAKqwkbEv7UBUTUFIGB1KZOrdrQAgoV/ff+mW3BpSrdL2vw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 09:19:10.6464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adb2a1a2-ab37-4fa9-3b25-08df17c1657c
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR19MB8807
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzMyBTYWx0ZWRfX5d5T7dNUFOB3
 +KcWY6D8RTsC7BQ5PK6vozlSxhqncESZJXazphHHbgAntudoTredQi6FEb38JGRT61q8nK1JKxv
 p+JJFr406bUn48WHZVCQeC4cpwET5WE6BzltF8ChxiDPiqAXdeX0F6HC/MKN867VDvmy71QBgdp
 cake1AZapyiSAJ0yGU0qvkXzW/ilMoRt67n590XuyYRxHR/iZqkRrGVVgqDop5n+RFCESR+Wf9f
 zkxpxLi5/GNCbLosp7MeZG1U2qMQxJlTvK+DHn6quyXgMEZ3HoDHa3suoC3Eh9ip91dTnVXpluR
 8pbLWNNPq1b1KcSNqv0jbmjjnfIVwIMyA8y+j4xso6Ja48COKN+yyhZ/GHMt4k6YzLnYH9/kScN
 5XjPX7UW7vZirKOpFAgY85ioMXku9LkqvfjdncjP/t5kghjSj3o4odSXtYP8w7OYGUnPml8raN2
 ghHdEdDfWY22HiKOfRA==
X-Authority-Analysis: v=2.4 cv=TPTQ2Fla c=1 sm=1 tr=0 ts=6ab0f693 cx=c_pps
 a=IrW4GQFFt97Yz6NwHc2cjQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=pGLkceISAAAA:8 a=w1d2syhTAAAA:8 a=qMo64YFJ8lxqF5BYPsUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: JxaVyDGF03X3wu9_Zg5qbeBaL0THpQ_X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzMyBTYWx0ZWRfX4Exunr4uMo1O
 iZQXIbwAjHfpM7UoiXMAAOsYU7ixwo/cfx60uQPuLrK+Ybp2PhabqFbrdcWkneW94/HGuNWjqrE
 Ui1FqQPWVRGypA27Ne3WCEVt4oI5DS8=
X-Proofpoint-GUID: JxaVyDGF03X3wu9_Zg5qbeBaL0THpQ_X
X-Proofpoint-Spam-Reason: safe

On Sun, Sep 20, 2026 at 10:53:27PM +0900, HyeongJun An wrote:
> The DRC_THRESH_QR field is bits 7 and 6 of DRC_1, but the control sits on
> DRC_0. Its shift and max are right for the field, only the register is
> wrong.
> 
> Those bits of DRC_0 belong to DRC_STARTUP_GAIN, which "DRC Startup
> Volume" claims as bits 10 to 6. So the two controls share bits 7 and 6.
> Writing either one moves the other, and the quick release threshold is
> never reached at all.
> 
> The six fields of DRC_1 tile it exactly, so there is nowhere else the
> threshold could live. Point the control at DRC_1.
> 
> Found by a sweep for two controls claiming the same bits of one
> register. No board with this codec was to hand, the register map is
> the driver's own wm8903.h.
> 
> Fixes: f1c0a02f32f8 ("ALSA: ASoC: Add WM8903 CODEC driver")
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> Assisted-by: Claude:claude-opus-5
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
