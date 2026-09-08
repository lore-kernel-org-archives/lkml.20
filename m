Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9054EEBC;
	Tue,  8 Sep 2026 16:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788884497; cv=fail; b=fzhoWQYS2L/fxdXZHl5UTi1Y+Tzkpv20vUgr3Z6Nw1EQ5hdPcpU4Mwj/7M3JUXVlKS1/NBQuYG9m/+LznwSVldilvp5rracg2A76KMNN0pYjrduebqCPEYHERmedLtgLYZIsif4pK8lQq9v4QkHjGvfH59glIxN2iv7bemzRF00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788884497; c=relaxed/simple;
	bh=uPpbA5ecymvD7TyPRXyyi0T4og0WyCqAIJvscqAoIkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuAE1WMu9Zgjk1KBfs+ChMA3dYSIvpri645Yw7rwdEplIGyqVpn314Vj8JMbF4kHo7Nfm5hLD9ya8T2Nyjph7le4gSiBIr8KF6ArXehipfTNHR5w1j19k3dzoCgT+tkm3Y3HpLLsJdhEStAsiN/eYfU8WyR9LqyyW23UMTjziK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=S6Y1MxKI; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MCqp+kZX; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="S6Y1MxKI";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MCqp+kZX"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FWggl3528172;
	Tue, 8 Sep 2026 11:21:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=YwW7t6tfrAwkAPqUyX
	eRJiRTEFVoubonHty0/yowhTU=; b=S6Y1MxKIy5w4/wlWZV2a6WmQW/3URovkNV
	hlbqH5AnjXcB4SuVJTD4kQsFeTmGFWLWFDPfzVJW5zL0RudzfK8YmtwTOuwYNl31
	xrDdsw/yZXByjzaqdnIsckNNZf/s8tw8kjsb7ZXivo19HWpAqNr+VE9kAIjx+Q5J
	VtS15+NZ3X/DkqiXzDcpkD8Aop/Wo+n9WF08MxULJrW3TVfPlvPA+oyqFUmnKG0/
	SiUEMjIz61bCrRmt/kzN0Kf//FsTf3QeCcyrlrOnxOBFeUUKL+KfI2lKtcjfj7IZ
	guzzjHG9Z7OkafskHuUtec6g50SUwfIlwviV++I1YAXMqH5x8Itw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11020075.outbound.protection.outlook.com [52.101.56.75])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjuqm5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 11:21:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0NcCTg+uYE+q9krWtMVE5RA7kmFuAgjYdHSbmmqTyLEVvij6va6HbfVr187ZrcnGUZYVnbOVeav5moZEXlOvsU7i/3Brb0G4f4DblOoBBORCyXk1xsEXYyggy/jXGo2rhhGwvqhVwPtdpygonQs4hb6S5lBQzHl6CMPYew1lvW0xffYT1uAjyuCx9XEBdM6Mkqs4GMa4dPau8UOAhZcHWj6Fa+OVkSYIHMPwqHfrRq9pmPPEy9doWlgooAcaI+/BVdDGlem8Lhivto+8y/Gx9BuBFVstdyYl6QCximtWH/gSrh3qhbn9oBRtt3sTA06W9V5Fm1VnpaWAhBrwRuJkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YwW7t6tfrAwkAPqUyXeRJiRTEFVoubonHty0/yowhTU=;
 b=GaQ29nWl8rYFPoe3uJV08G4HldCFgB5+v51J3GJDj5UC7Xh7P+XuO8vibHlbXuF1+wqU31aEJoWQ3dKBe29S0utpTrDC7hxF/qhUy9ZeXQhPmBvziv/IBeadmYYKLcsF5ZG46bRpm/kSBHH1KVj2jpLuXjiaGTSzjdvRNwkwwYpOEn/iDQr7Df3c4o2uhj1j0CGI1gUDWNXz+wAs9DggNkklA8vzEuy0aQwFJurWYltPmu34YQMJ89HJYF6GcZbCbNVoJhGgqDuIL26oEfKllIPI+Yp/txIcVaLTPK/3IilKnwET6dUouLKsrsLnFe+YwWohOFuLR2TfDkGQzGVXug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YwW7t6tfrAwkAPqUyXeRJiRTEFVoubonHty0/yowhTU=;
 b=MCqp+kZXwSzOc+JzzA/rVYBb44E0+ATxpdWLRpwdQztcP/uIb/4t9ZKQzPq4A3PTwh9OSDai/B7yQhj2yqKJhkhygvt/yTOYKeOLBwEoR8HiIGTyGLrL1ZRVy/t1thiqAK/94VJS5QfyBdrVRlEaNBpmyeRwE3zwIWWrufx8XHQ=
Received: from CH2PR02CA0022.namprd02.prod.outlook.com (2603:10b6:610:4e::32)
 by SA6PR19MB997387.namprd19.prod.outlook.com (2603:10b6:806:450::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 16:20:58 +0000
Received: from BL02EPF0002992D.namprd02.prod.outlook.com
 (2603:10b6:610:4e:cafe::5) by CH2PR02CA0022.outlook.office365.com
 (2603:10b6:610:4e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 16:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0002992D.mail.protection.outlook.com (10.167.249.58) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 16:20:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 188D7406545;
	Tue,  8 Sep 2026 16:20:56 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E7385820247;
	Tue,  8 Sep 2026 16:20:55 +0000 (UTC)
Date: Tue, 8 Sep 2026 17:20:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <aqA15rhdjAtWrWK8@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992D:EE_|SA6PR19MB997387:EE_
X-MS-Office365-Filtering-Correlation-Id: 70159f31-0adc-4bf3-be8a-08df0dc52a02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|7416014|376014|23010399003|6133799003|10067099003|4143699003|5023799004|11063799006|56012099006|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	x4yvaff7cqlsvSswLMX7fhnjICrzMrKwUis4rlragMshPy9C8k2COzrG98eaR1T032hlpShPXBaQq96JyD6h8qBGZGTJFRhDKgce295lNAZ6NTsLy2WCp9NulU4XgIjRcFlnFHgFC+1IpnvFkSgLzu0Wg6QY7zwVComzGt8duHTtCZ/Oj+uu/UhEQBZH9nAwjcuTGW1n1uWkOEmKG+YX+eR8PgljiTiBf+5DyAGPazq6yPSg5HEDjuNoCWVZY1UyxHWDkr6hijnr2eioS23lKVjo1auXMPziXY21s6EtzHpCItnCihcwBT7LKQWegvV0JDQaQDFozNKQfWyxcIuxx0b7z8ftZSZ5i3Ta+W9UrnqYZJ25zvtzrCyEPEklQRnbRjYz7DCUgXlr+vzPrgnV/NX31wDyRJS0O+sv/sn5I/2bqCDaqMhrqTcB7OpEiawQNsw7wwrW/V/WxLUy2hrEjVSYlbMHTg2hNt1BFjbfaPSuJ5antJwGScUMVhBBs1krdTcw+WT2/x0y5uFv2u8TdgvAGzlWcEtvH6GfZdlTzJT7B5/mLzqiPy2K9cFk5W8UJke6ql7ASEnyFp27Qs/lzReZoMHtxcADGUYfdclplbkibbdwFE7Jt8s/4XAGudOQo+ll2Nqh1nTPffN0RjSKapyaruVCwPmAYOv5WNhQig8vFsEOAftg0bmfDEzwcppNMDw+ilHOhOaMaK9kZhy97g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(7416014)(376014)(23010399003)(6133799003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9F5LsNkHKigt/P9y4MHD/BrD+Eh01Kg6OShgRkJ5L9hefNyg+KFfMJdEZgBYMZVpjrAlS+RplpYRLDWo03lIVFD9TAL30EsRlLVUsOdP1xvLIJHLPEC7mECikexEWtC8ItnJFishKBlORvvHhRFQKLGGAzRq/0AfhlVR9+yGPhX6JQnm8DPabVd8q9hzDUjz/VtCD8E2C0XkiwaxYfYgUSnVrm/0rqBk9xgxt3XgBPsrVUmk6J/+1+7+RgNPkwlq0ywMSdeMImcx6y0Dxta8JCLFyFGxKYkvdaxDr5Lt9zZlDd4eltw7pb05ScrDk06TYxqwsEJ4+ExNmWiqPZGRuA/kHdlUwN5DVrKtFv1gGZ5hSP1QAGhj6hwht3rwhjJg0ri346Wy6pDfG9vi1bGa8/1LErR0si//4rargHNwVivJdtbYosUfTCg03rp1vFgx
X-Exchange-RoutingPolicyChecked:
	ELqy/qiakTqX8ICVY8eRsawPB4Yg600FS1YQkwt9IVZYsWQC2mzzTJ6CYNPAzXcXQHUF6w9fe6yA235iEUy16hxEjABHu0ty7s/6O0o/SJVjKWadUqCo5h5OVOhXqw0WKE6e2vGP4Oqv6GIinpSvCNF9R8iOw05KlDSu8EelGSmXI0QRyLJaD9L8GIlochNJ42xXFfX0u64Vdnhog6IpuzksdoLxlY2m9Jbx9+dxOsjPfXYJxqfc4F8/qoJDG26Z4MTmyvqPNcnwH/yxroQYreytStJo+FP4to1iMj5F09HvIwdFys4bUNAn57RddPCVoQbjAEinRdsXwT+k2+PCDA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 16:20:57.2384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70159f31-0adc-4bf3-be8a-08df0dc52a02
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0002992D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR19MB997387
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6aa035fb cx=c_pps
 a=JPYgw6djPvulOwJF0XPiqQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=CzinWtuOQxXa3hCDXlkA:9 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE3NiBTYWx0ZWRfXxXtTQiiTGwOO
 5U7TnvjcrAfLZx/XT38EXjxRqbDkfSIWuCQeG/on6Pfo4wqC8F/wI5rBB+UpelzHRciRyc/6L/e
 PrVuGDOGuEbeXsh764Z/tyJ1HiLKRzfG+7cCF6H94hNX7fOKTuTp/DpuZvcn0Dwcc8IqSRrkrjW
 dTtYCHNuLeH6QyHmE1FEdEOlWq4J92E4lUjkXnsP+fowIvbkEKwkQXpIFGDRWBw7M+EMddUGIk1
 Nd4DnJHa3OrB3gSnGlc7VCOHYJSAeTxdRqGxbJShwtTEJZ9GBuXix3b0GA4LE5eMWIkarBCxmh/
 9+WhL9+JVafzYlxJWlXKBbyUSBqDpqIZXGC/tB96KvlxGoJ0DD0xcNUKmMypLMGJCTF5q1QDrrB
 1sS7yLKzFCSUkrycP188Odxn+UPAXUfsp2VNxTxWUrn+lutC6wKSciecg/fmOHfv7IfFedzBgCV
 kAhHB4WShZtKfD/Icfg==
X-Proofpoint-ORIG-GUID: aa-5D7N_j5b_Zptn10mbq12e96JbXExN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE3NiBTYWx0ZWRfXwXs/6SU9HzkG
 kVvNkkTC3lCJLNlktVoA6Oo88i3b1BBSkOSHycKgyMG9x50f4AASZzeI1qZK6e3qGhGa7hNSvG2
 bOMlhgZWJTcAOgRifLhKkrLqjUj9WnI=
X-Proofpoint-GUID: aa-5D7N_j5b_Zptn10mbq12e96JbXExN
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 09:37:25AM +0100, Srinivas Kandagatla wrote:
> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
> mode over SoundWire.  On ARM/DT platforms without ACPI/DisCo firmware
> the SDCA topology and SoundWire port properties are supplied as static
> data through the codec driver.
> 
> The codec exposes a single SimpleJack SDCA Function providing:
>   - Headphone playback via FU 6 (mute + Q7.8 volume) and OT 43/45.
>   - Headset mic capture via IT 33 with MICB2 bias derived from DT
>     (qcom,micbias2-microvolt).
>   - MBHC-based headset jack detection.
> 
> Implements:
>   - sdw_slave_ops.read_prop: SoundWire slave properties and dpn caps
>     for the compute-mode dataports.
>   - sdca_class_hw_ops.hw_init: enables supplies, toggles the reset
>     GPIO, and enables the vendor TX PDM clock via SCP.
>   - sdca_class_hw_ops.populate_function: fills the SDCA Function data
>     (entities, clusters, init_table) from static tables and patches
>     the IT 33 MIC_BIAS default with the DT-derived per-slave value.
> 
> Binds SoundWire slave id 0x0217:0x0110 when qcom,compute-mode is set
> on the DT node.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
> +int wcd9378_sdca_read_prop(struct sdw_slave *slave)
> +{
> +	struct sdw_slave_prop *prop = &slave->prop;
> +	struct device *dev = &slave->dev;
> +	struct sdw_dpn_prop *sink, *src;
> +	int ret;
> +
> +	ret = sdca_class_read_prop(slave);
> +	if (ret)
> +		return ret;

I am not sure it is worth calling this. All this does that doesn't
come from the firmware is set use_domain_irq and scp_int1_mask,
I would just do both of those locally, calling this means you
technically process a large number of DT properties that aren't in
your binding doc and also you devm allocate a bunch of things you
won't use.

> +	/* Compute-mode fixed SoundWire slave properties (not described in DT) */
> +	prop->simple_clk_stop_capable = true;
> +	prop->paging_support = true;
> +	prop->clock_reg_supported = true;
> +	prop->lane_control_support = true;
> +
> +	/* Source ports: DP2 (headset mic), DP5 (optimisation TX). */
> +	prop->source_ports = BIT(2) | BIT(5);
> +	/* Sink ports: DP6 (HPH audio), DP7 (HPH envelope), DP8 (optimisation RX). */
> +	prop->sink_ports = BIT(6) | BIT(7) | BIT(8);
> +
> +	src = devm_kcalloc(dev, 2, sizeof(*src), GFP_KERNEL);
> +	if (!src)
> +		return -ENOMEM;
> +
> +	src[0].num = 2;
> +	src[0].type = SDW_DPN_SIMPLE;
> +	src[0].simple_ch_prep_sm = true;
> +	src[0].ch_prep_timeout = 10;
> +	src[0].max_ch = 1;
> +	src[0].min_ch = 1;
> +
> +	src[1].num = 5;
> +	src[1].type = SDW_DPN_SIMPLE;
> +	src[1].simple_ch_prep_sm = true;
> +	src[1].ch_prep_timeout = 10;
> +	src[1].max_ch = 1;
> +	src[1].min_ch = 1;

Minor nit: Probably simpler to have a static array and kmemdup
it.

> +static int wcd9378_sdca_populate_function(struct sdw_slave *slave,
> +					  struct sdca_function_data *function)
> +{
> +	/* @function->desc is already set by the framework; fill payload only. */
> +	if (function->desc->type != wcd9378_sdca_desc.type)
> +		return -EINVAL;
> +
> +	function->num_entities    = wcd9378_sdca_data.num_entities;
> +	function->entities        = wcd9378_sdca_data.entities;
> +	function->num_clusters    = wcd9378_sdca_data.num_clusters;
> +	function->clusters        = wcd9378_sdca_data.clusters;
> +	function->num_init_table  = wcd9378_sdca_data.num_init_table;
> +	function->init_table      = wcd9378_sdca_data.init_table;
> +	function->reset_max_delay = wcd9378_sdca_data.reset_max_delay;
> +
> +	/* Elevate is_volatile / has_reset to match the DisCo/ACPI path. */
> +	sdca_apply_default_control_classifiers(function);

Just factor those into the static tables, if we have a bunch of
static data might as well just fill it all in. Doing it this way
is confusing because the static data is incorrect then fixed up
later.

Thanks,
Charles
