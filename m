Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16334CB8C6;
	Mon,  7 Sep 2026 13:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786280; cv=fail; b=L0VhVYigV+82XpFKck6btvI7SscEf4FZPQsBHaxRNKkJdvQ5s2QIXDfMKv0D8J2HyCuWgKEga3bCQ13uZvmLFqLdIqVH/XV3wAxFDJDOlu7jExOfJKWafudnFi/k96zGZc7dnEsGexVL18IdjzBLYF8An9R0K7NVOap/YQDfzO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786280; c=relaxed/simple;
	bh=h6eS8sQNNLv/hGqZT45aVzjoFSo+aycD0anXt22VQXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeVrLbT+Iq/fjZXAUa2aKgONqPM4XmZlhM7OHVbVi2g9XEQph+rWe9VlrbaMQSRC2LgCpeO71L17xJ1/FsD3UPQj3FK29YcZExQwMO5kchzyE/NMpRzVaoOw6h+kQCFGI5SOZu3ILUHx9EUe9Vvmy8lW4P5F3yfxuifmDV+9zNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hUkJc6PU; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=BvRFPYWi; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hUkJc6PU";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="BvRFPYWi"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6875bj8n082728;
	Mon, 7 Sep 2026 08:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=WPnpFN4GLSZx0njVAo
	umgY+pKntLzWe8rbbFtzBPahA=; b=hUkJc6PUGsy5NEFOxbFybDX0bKIA/GoWh2
	C+HPoeIQV5DQOp/vjAH+oSHwsscWnZqeVxosRAEFKD7zYSrMAZE6bgk38UrCckyF
	vbPpNv2BYaQGD1or1JsG1UrTCtAQcnNYZJIzqamqZH1G0npGP6uIr1iR3IGjV0l1
	kCNew9uP24Gn7ZtZSlBZ9cqVYUH2nmpAGdudQbwi+i53bCS+jwLMtmtUGalOnO74
	OTVOGqnNIDRL2QkpuAhCJTeP1tBWxEI80ipYZKh33sAy36Y5TRlXAv0XhIR7Dp3F
	eSinzPDso7l+JoyIBvZGuTeuRTlWH22PD8kP9gvb5jC7vXu2pjIQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azhn15011023.outbound.protection.outlook.com [52.102.138.23])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ggfgjt0k0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 07 Sep 2026 08:04:09 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A3NWUnYpA/+DzenZR3O64fzPNBkZUh7Ud6E+c7Em8+1ysuCMTLhioHR5Rsk16iTlsAxKcjWoioOGx1+JJLdAcYFLVdmo9tiHEEtsdN+3BTdA3ywC6NTmCq7yglcajsNmLbNdn3KVyVEKFAIn9Sw1N0RdrihoBh4UK337e1ULkl3BlpaLYk0vZp7d20PLnySinBK4miAdDSnDH88MYT2buIv6b0bZzRcuybLUKCFNgGbAsX4O/ztZFFpR6dR1dQYO6vBt5udL2PZ+2PFpQe9IyPqZnd8pg+N4wmI6ygmatHZ8KkO0S9/WweUxc+JzU7jvoFDtMk5sWmFN7QIwy/feew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPnpFN4GLSZx0njVAoumgY+pKntLzWe8rbbFtzBPahA=;
 b=WR0Wx0lbd+smk3+giQemxdGJxoKNicAzHHJcxqtDk7/H1ID7lA9TLfaxa+eJAbetejfjnSsTJURq4PySB7Q7KiEXenwrnSm0dCl+k8oXk+4nZfGUUYY5VTT8e/3jRHLivSDFzRZQ9/XDnTsRADL5QzzNUZgUQzDT9eRR2AiWKo8j74DEqe4FYRCCehNvbUp013rk7VmZ4o6dkyr1BERt2a5TcCCMeegepHonoEBINHlP+EreDaSQVPoZ6mRTphEvFptfXAOoy4OHlDU3Z5yqjyjcW+sIZQxQfo0adgxeV5AdyayZPJEaJGcPJA1qdBHQLmJEnrTEm7wtxtVY6vJhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPnpFN4GLSZx0njVAoumgY+pKntLzWe8rbbFtzBPahA=;
 b=BvRFPYWi8HqSm7tMc9A7ZftOLH4XF9DPTofAb6zP7JSdOIJAB+wLNsbfDie8HZ3Q3G90T0PFt1XAuZIQQJeo/5xfw/i9nRSNLQ6tdY+8O1xoX8ET7zHuMdlKxhfkK3KUM3bodiuPmRDzG4yvIbrRshjcxdU7ooqzB09qSyQ95oA=
Received: from BN9PR03CA0957.namprd03.prod.outlook.com (2603:10b6:408:108::32)
 by DM4PR19MB5715.namprd19.prod.outlook.com (2603:10b6:8:5e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 13:03:57 +0000
Received: from BN2PEPF0000449F.namprd02.prod.outlook.com
 (2603:10b6:408:108:cafe::2d) by BN9PR03CA0957.outlook.office365.com
 (2603:10b6:408:108::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Mon, 7
 Sep 2026 13:03:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF0000449F.mail.protection.outlook.com (10.167.243.150) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Mon, 7 Sep 2026 13:03:57 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C0EA5406543;
	Mon,  7 Sep 2026 13:03:55 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id AFC24820247;
	Mon,  7 Sep 2026 13:03:55 +0000 (UTC)
Date: Mon, 7 Sep 2026 14:03:54 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/11] ASoC: SDCA: make find_sdca_control_reset()
 return void
Message-ID: <ap62OoErmU6lU+9l@opensource.cirrus.com>
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-9-srinivas.kandagatla@oss.qualcomm.com>
 <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <289d5485-44fa-4d74-8f69-7adc1507ac9e@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449F:EE_|DM4PR19MB5715:EE_
X-MS-Office365-Filtering-Correlation-Id: 450006f9-cfe4-46fb-e362-08df0ce07a35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|23010399003|82310400026|36860700016|7416014|61400799027|376014|10067099003|22082099003|18002099003|16102099003|56012099006|11063799006|4143699003|12100799066;
X-Microsoft-Antispam-Message-Info:
	l//N74Ir4QMdYNU3DXosMfndDc3aebmtPoOzD/T8StPQugtQPP/BM15Is9yryQeWe2GVFmdCbyW5imty1oPrL6ZLfXWHkcel05rrrHDyR4DcgoXQ5nlxeN264VQKAskh0VsXg73h7IdY+zosTCqRHxkKEwaCuyx81MADXhUdg3qsr0k59Vf5jIJUu2WccIexGyrQup/8QBAOLrFLUqKapbyn8zEcZPUrWFsdnznvC8KQvnnSMUEMAeVYKhgs3UNEycNhMoeVACWgMWt/SyIJGSYm4YfC5MdkPXXnXefnptnoDrdrbh9wdOvYzkrO+TKLJ/tq3PAyeXqpQdbhY5jXmt8H+1tzySzVXD/jjKVDPtUR1ZJXJpzuTBi5KMuF/y6ktlZKentdnSq5gqjD4PH8lDo+5j5V1nB9W1LBczHujl48FvUJbOoeZf7AoRcCI2TXQFYVtQmMTHUY+rIgqYCBfT7CFgyZJDhlcZZRrBYiY7qVyjMgsNOiEY1MCTD/m7DFUmob52XwAP/9fPehTCjtqag5Jhdy5hp9QrfPXC82HLs+kxrw30oSP6Qd/VAkdHAfZDxs3wMZDQGd8lXk3Ar0F7sOUHnAcFCU/76YsQ/8vV+O/sXQXQmINJu/bXBwq+3yJOXZymLkDl+uCTxiStfi0IHwTOMGAcogHZ/n1zGnBhaHX0nApDtySUHJEkMSjI86I9qqogUVYiuhPLFdZY2Q+Q==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(23010399003)(82310400026)(36860700016)(7416014)(61400799027)(376014)(10067099003)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(4143699003)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5hDR/u7Kq+YeQg/U6h+I0N2PW6GdRsjcapemQOJABKe37B6SAQBCYUHIMooGu9FHSaWo7ChBuTJhwfXMAiDiXmtk+MDJmqXVOgNVW1F4h2ADpwgcuW09+kO5LBJSJDi0GvumiR5kRn4pSfNoYx02ZKDHCTQy4PKCuh7WtCMmGvyxURsjPZC5d3AfgFM63srAKF6gkkJy9Wo6Bgc/VduUYfk+RmHpEweW5eYGWusPfcQEnkLlzFpDSPZWLaq66vj7JbssHrzAZhz17SyDhBaCxlLhTFRxzw10TxHB8TKV3QY8JgK5QODk5UtTp9joPum+qf92KOxQM4uDy4Cd4FBkV0ncre0Hlupy2FBF//Y+kIvchiywPwbZcLd0OtwiIutEVPuvFUc66F4t2CPiTGIBBaWB4BCWTbAAIPnaSPMAUZWmglRlRfuW85NT2rudwqNk
X-Exchange-RoutingPolicyChecked:
	AzVJboLhKelSvknAUmCnRJA2QrKzF57dPHPjZKdxGP9gbnTqiLZmx2Fpvd4lCu6xWMGZJmQHphIyrz/+yNKzE1BdEefhIM6EgAwUM+IK6wDwR6wmQi8kxoVPgk8fQVzcUYW1Kuwxsd1iCUcswFUjs1Ls5VOpoUG47tox5dyWyZUwP9bu9xU9KLXKI6MJM8NNnNGSHI8xI+J46F9OHhPb1NONw4teYjy7oM9Fr7oj2MdM5IZh8CNeSUx9N7p5dJjvD9FHKtWSbcS3Hwy3vn4hqYSPDu9JXaJv8gdfCibBlmQ1gkV45wkjCWVjwsQievhPRRslGg658RXoJAjYNdaq1g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 13:03:57.0326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 450006f9-cfe4-46fb-e362-08df0ce07a35
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF0000449F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB5715
X-Authority-Analysis: v=2.4 cv=bpd8wkai c=1 sm=1 tr=0 ts=6a9eb649 cx=c_pps
 a=q2hZHjHJ6RREW6J1AsNp2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=EUspDBNiAAAA:8 a=w1d2syhTAAAA:8 a=VXqrDlWz27ZXUdBuZq8A:9 a=CjuIK1q_8ugA:10
 a=jZz-an6Pvt0H8_Yc_ROU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX3Ez3uWFVk0Lt
 yrvzJSIoe6lDDk67HyL4TK/ADYWdawKrePDcv6XeDHDoVzSb4WNZEcUEMoN8YiDKsmKujfKCMNQ
 z5EXWhwiGp5CBlTKrNfzTRbBrD2L/sS702nWntI6eHcc6vgdkL1HUDEDvuw285lsHJ9nI6CkcW4
 RT0wyMf5mmJKZtWkcAv2l7yeKQ9P+2k2yAvadU88kT5qW9ggVjQ1xCbnLYjALA4o6/cIaDDXeqF
 pQkcSMxNF/9zq7qNt3NHPwcNoX3UQ5QZB4jYcDnupMuLiQeSAuhWlpQDC6oJ4zsxOKZpN1guc2v
 XGxeDHiF6EWl3kJn8BdTm7qZe3PRGVxQ/1VVMABnhjgySygPdMNumm/eZ4dkw6OXoEBYrVdU3Ig
 +TWuVhT+pWy2F9vipZq+kwZYtxCSQWg27m4J8GCS+tPY2rbrbSFi+GPrm3786CgVSXa2n9z54e2
 7qpu6QJ+cKY+J8mavug==
X-Proofpoint-ORIG-GUID: uqSkm_hrle1NmXa6v3DatiJ5BfROJUru
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0NCBTYWx0ZWRfX0DyeEHJPhnyi
 3Qmm/BT2Tjz909dNQGLG53G1q3D8KnlR8N+yU7nuW5l+EhE4/i7BIv1DEcpjPdZQv5CgPg4ab7R
 eO8xoraI7CGaHm/EmW094XbADVwTQRo=
X-Proofpoint-GUID: uqSkm_hrle1NmXa6v3DatiJ5BfROJUru
X-Proofpoint-Spam-Reason: safe

On Mon, Sep 07, 2026 at 01:32:30PM +0200, Pierre-Louis Bossart wrote:
> On 9/7/26 10:37, Srinivas Kandagatla wrote:
> > find_sdca_control_reset() only ever returns 0 -- it just sets
> > control->has_reset / control->reset for the framework-known
> > (entity type, control selector) mappings.  The int return + caller
> > error check in find_sdca_entity_control() are dead code.
> > 
> > Convert to void and drop the check.  No functional change.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> That looks also unrelated to DT stuff, not sure it belongs here as patch
> 08/11
> 
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

Agree lets pull these two patches out and submit seperately as we
can merge them both happily today.

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
