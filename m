Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E358B3DA7C8;
	Wed, 23 Sep 2026 08:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790153861; cv=fail; b=K/GcUQnf/y+Wg5MnKETHGM+WxrVNHiS7CUfuCX9yiAtvf1n++zDMqzq+2qocQlKuNnZFhEbG2xK46I2FAq2yX50idmg7DGbkezJz8wBPN/RDmWrMSc9L/L4qX//UD7+LAc4FYzdbg8p8SO6uVwdDqUyzJ2PMNu1qjSnctRTJeck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790153861; c=relaxed/simple;
	bh=3Ojsrdx+H6oIZ0KXkExCjqQ48pwKP4gYW7X91J2478o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYGv15powOFhqZ+m2yQevjgSgFEdjXg/Np1o3jcF33AXNA96hk3a+7uXM0wOk3c/4npM0mo/iP5UAqBw1I/z/0Ocm1um+Nsirm0ogtz55iRLzKWEXpkZ0GlXE6j3JaB50RQFSI72pbY0w6Gm+5QwEjSdhZKjC1O/LQGGdwhAgoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=pCUM/zzv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RJ8dlEoT; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="pCUM/zzv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RJ8dlEoT"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N5ojUe3764960;
	Wed, 23 Sep 2026 03:56:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=lZNpIUzn5Lx4qQv3f5
	O4sU7+yKeCtrnfjFEoV8GAzRw=; b=pCUM/zzvSMeym6qRO0uxu82kkXY4ufCB/R
	thmHHbck+L3icbjFpaScgxMfpl//oz51EKtHkALhwcS+YEhbCvTj1Al4cI3lFV7I
	OKAO91lofcJudNK9IGZXV5HG7ehtSxtne52KjLYlu11AOrrEU+DtDQ+aYoArc7P3
	bzUmb0zojNhtp7FYXdm/MWmD+rhv+VMWWK3Xf+o515lQ6uWkWy6+a2LxLzPn9mAE
	+IQoU/alELZHeHx4VTF/EabzA7JWQMbQMEPFaT2rvsRS3ccWYw+6pmNoI0fSA7vf
	f2JTsYYUIEe13+EXjwYBBUVjPq4YQ0tJjrqf8IhpAUTLkgVVWM4Q==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020085.outbound.protection.outlook.com [52.101.193.85])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gsqt0da6g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 23 Sep 2026 03:56:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rr1gaxg5bjRzVZHFZvULQFqThRDBRvaDvas6NG8G3t+PNW7uAfP2g5HBkOLR2rCe+aLYqNPxfyRBgz2gGo4i+ZLp3uFUBNuS6U7FWvx2iLaNW2rdzHHNnH194Wbfa1HlybYvFDAtnBMciMq9fiJFgML9sFIu1Mi69iQ3nZtoEjF0zG5wkr7ca8uoYUUoIot6Y2vpaFgKIBx8c767PSiinS+MINDuJJVnnRQ2Kl5UBLE4+PhEOyUbWGHmb1WW0hMYX7dVBxVF759OvyGJgNTj7yMhxN5n9Gol0WKoMcQnu4NolfkgdtKGvpDtOizJglB6zSWQbF3KKllj7LaRql9BHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZNpIUzn5Lx4qQv3f5O4sU7+yKeCtrnfjFEoV8GAzRw=;
 b=xZHf5c7ApskhdidvuPeB/pwAik3lImLXCfLF/LOVTpUSrlUjZ/xnDD/cbVj9yfngmJwEuRFIGjCCwXArh3Jyxm7BJJb7ps9ngZdX0ImOalCi1qESFRuk7wSgXT/HCs3tN3a3DgTgGiBrTJBWHpcX/t6l+gRq6V41IVhttMH/meg9cl1JvMfRKs7llHbdrU/MIOecPZ6ECUcUxqlaB+IaH+RaU6ZFZCjADCS4fw3qNfTQSxnSReOhDZsrDQeRRIwXTeH7xDyQRJM60U+LAD0Jof4dkoQlEXRfu7jLF4uHVLszRO+lsRjyd4Aw5lahgoadzGqHyFi53bAPH9dI0286xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZNpIUzn5Lx4qQv3f5O4sU7+yKeCtrnfjFEoV8GAzRw=;
 b=RJ8dlEoTp55oU68/AVKtZdyqRmeDKoRMTZFI3BgH1w/ZAoS2kFuuGGFj9gjGwtnFGyo2egDf39f7stziluapWQRRJnQh9s10HcZ4bj+kxaTAN1tRksAbg4IWx4YIkEasZzpiqZPAKp6ygujA67zPkDU6D1Z4hEWgBXeYkJgPito=
Received: from CH2PR20CA0018.namprd20.prod.outlook.com (2603:10b6:610:58::28)
 by SN7PR19MB7521.namprd19.prod.outlook.com (2603:10b6:806:340::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:56:05 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:58:cafe::63) by CH2PR20CA0018.outlook.office365.com
 (2603:10b6:610:58::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 08:56:04 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 08:56:04 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 42AE1406540;
	Wed, 23 Sep 2026 08:56:03 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2BBCF820247;
	Wed, 23 Sep 2026 08:56:03 +0000 (UTC)
Date: Wed, 23 Sep 2026 09:56:02 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Chancel Liu <chancel.liu@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: Re: [PATCH v2 15/21] ASoC: codecs: wm8985: Move regulator
 acquisition to the bus probe
Message-ID: <arOUInKl4Nax1IGm@opensource.cirrus.com>
References: <20260923061305.4041197-1-chancel.liu@oss.nxp.com>
 <20260923061305.4041197-16-chancel.liu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923061305.4041197-16-chancel.liu@oss.nxp.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|SN7PR19MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: c2dc41ab-619b-468e-dc9f-08df19507ff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|30052699003|23010399003|61400799027|82310400026|36860700016|4143699003|56012099006|11063799006|10067099003|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	tiyV+nsqkpRUnob8sBSjf2Bo11ibPMJ7bldySw3d8LYT3yX/5F4PgaHkMBjRMPEyCrbiulkkKWqsO6SaOgcVQvrmY6q/G0RXyFpHUjThH9GtuQQzu7kUjfI8KE0H8ae5VBVK/ieqg9X9lfyDXj2CuoqqnKTyX29tiSuqW6/AeR8MdtE9h9Ysi3bBrPWQ3Ip9TsFIqAoyXswQSbbGlgzPKLg6FeQdNAq3vkg+1on/w+hcw8ytGybZ+TRl2WeWjLb8VC5/P8K7fX66Kn65iQ7NY8rdOneZXBs7PJ72R8A+cMe7iByPGEdrRs/YzmdW3AzCo5ME1t1xc8eKBXMODzr371u1T5QJaxzd1VV0QSpTMYavRPckC/5192gULOTbDIiOP7/YprzLSL41yfr9ldOZjBYidW1rdY8t34AS986dp2u9YVRiXSB1YHHwdSZJFFdZHRX754eIh78Xaax65nBparUN7b/HvNB2koMi+CSf6x0+JBfdaDGl4+FTCEa+puxLe6EqppXFASdgkeVutuUxvC85ic4MSOB1iW61/0Mqfgo9cEJKEOWCto/zPArHYDhW2b7O52vlh/B1jTKeNV2bnoUZWnrDyQQPve/GAJydAV0OqDXSkTqnfxlQ7TIY0Lr+nKdLsGS3XhRdqsWluOWuPUflFZlRI8Kadf1CPcv1JG4x+W6OoVamzRMLhLm7UAi35HzrQDuc9iugZtYuL34Rdw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(30052699003)(23010399003)(61400799027)(82310400026)(36860700016)(4143699003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cG7F+RSNROh/T4ZMHeny/8kRZoVZJiBYPAKiQHBPHHQrk9QwE/Jj7863x8pj99AZisbLNIBAgg8+mnPpohCbc0ah4FYBrvaDKJYe1bTWEipznbsVk7aALqMrjbVQq2lZS7d71TkrbZouQaKxYs5eLsd417csSUvcq3mqxghHIT/OqLsJp0ghB+/kOiqUpNwQ2wrusTMkl9oqhJ6o6fnUDdlMUhJ1jAcd8AhvAg3dQq4Pkegw5wcuHbHYDZqUwfGacHP1lKcqfeqBQ3vl+8ICRwpseyQTt0O4qgRnwxJ0AVFu3c41fTeo/XzKe8XiLhT0BnSV2OhuxF3yS9ix3eOByB2fcJs99Wa8XDTWzrG7o4QvRRr/O60hfAqoByjHigLj66JIsAxXVTThiCDPtr8kicmhRTJZil+P2zqglAu6rMxTwjpkULi5pg8lmyzrKjw8
X-Exchange-RoutingPolicyChecked:
	pFaBYLcC3ZTw8/mZtMR0pvGKmPl1I0zzo6ucmyYi4Im4OtIGhft3Dfdjq7miDvLE+o6V/h3usoWe5ZJWBkOzoNfN7nhpeothgfuTPnhuIBuDHChgWCWfBrgI5TYZiySven2uysPqKEhu5wQg5iL3hkxJin7NgMc1qePGIS95V5+tDI+3oONeUxWF4Mc7+cpqq8dgjce/oMVVZULys8YMIJEeAssdhBLHfCsVLJMMEwTbbqpP6zTBJ2LU4s1PAiQ5ghEH7RcnUGDN5anVHwD6vQeoNvDJdBMb2Kiturus/psEmeE86iH8PY9pxi1tZx3Ubrjb0sQfXkzDxFcDPUG1MA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:56:04.2481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2dc41ab-619b-468e-dc9f-08df19507ff6
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB7521
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfXx5c7bAosg1H2
 DVYZ4EgZgqwrUGtSizjN9FJliX0Xvd97uwtxS/VNkRnR9UkqDMYwtiMNYmzvh87V1cZ926nmEvi
 ILB/LUPQJkj6/RsNbc4YNyRrqUbaw/9hXaIkQ+6z1JNV+TnA45IgRXr57bKfj6O1uQJDABAzR9p
 y+gcP7cnkWh2LWAoW7m1TOeZ75CkMmqxI8Ay8P//3rxp/urjvuSYSySbETcfBR+oOTQn/QPuDT/
 6YCqgPQaI8SeZLz/4Fdic32XyAYV3R6TDE8gN9YS3tc85XIyXlo1BB6Gr7f1Qbl+oHvyuQx5RC2
 axvVbmID5tC71EyC4Rizi/HGh6E5+SPcJ8P5SRkyJcUIDZ9ShHEs8SWusVOfnC5YPQ/DXm840+e
 QNE+pMWBM3yrfXFt/kGrJd2xcaRRydfCG9H8ifNjs8BZDDZ9JWS1YP7qxEFyjtelDrYKfcmsvBL
 u6wXTT63jDyzAxmRizg==
X-Authority-Analysis: v=2.4 cv=TPTQ2Fla c=1 sm=1 tr=0 ts=6ab3942c cx=c_pps
 a=wRTyfpdww9+IwBZk8xkLjA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=8AirrxEcAAAA:8 a=w1d2syhTAAAA:8 a=vDDHL8stx0t2f8X2AoEA:9 a=CjuIK1q_8ugA:10
 a=zgiPjhLxNE0A:10 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: Lm3wZJu_GZbQSw7waHVgx0bBjkUd3QiY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNSBTYWx0ZWRfX5jlU12uFKwaU
 QACvm0Z11V/FOqU6IAqcgKhwdQVI72jr3f8SojDk1AuvInRIdL1muoIP3T2Uyh/Smoz+amifJWw
 /erLAX2FSN5msV31MKQC904Qqm4+OHk=
X-Proofpoint-GUID: Lm3wZJu_GZbQSw7waHVgx0bBjkUd3QiY
X-Proofpoint-Spam-Reason: safe

On Wed, Sep 23, 2026 at 03:12:59PM +0900, Chancel Liu wrote:
> From: Chancel Liu <chancel.liu@nxp.com>
> 
> component->dev is the underlying i2c/spi device whose devres is only
> released on physical device removal, not on ASoC card unbind.  Getting
> the regulator supplies with devm_regulator_bulk_get(component->dev, ...)
> in the component probe therefore leaks the regulator references on every
> card bind/unbind cycle.
> 
> Move the devm_regulator_bulk_get() into a helper called from the i2c and
> spi probes so the supplies are tied to the physical device lifetime.
> 
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
