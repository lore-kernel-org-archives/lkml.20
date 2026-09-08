Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE535674A;
	Tue,  8 Sep 2026 15:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881668; cv=fail; b=WpFt/ZEezMMz5Rr4t+zEY8K/I/cFmvEzQenVwwBFOPQK2XMi24VayS2t9IkWFO6hKC8UZpDHywwB1luEPG1oi5t5WY/nkpscb6avu80NKqtX4u6bnIk8cZr7FrjM7oT5tBqRrDrV0QBDjQhFA1kdSOmSFBpAWf82l5IaYTnmQv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881668; c=relaxed/simple;
	bh=RR4qM1yK51Ab3DiByZ0rf/nfo6oJKVE8vJZ0V2h4LRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWy4/i6rBcAbT9TtU0YQvCAFKxJ8dhT4Oyk5/Boru67+AIMljFp9RDeaQxWnJZ0OyB8JUJ5XKmOD7E7LiHDU2TL22o7d/hjmGWV/GIyC5R7+6NmR3zltAkT0cT86c0fIUNTBmyyaw7BHf0k5pUvItdrdlAJ+F/TzYU6Jn3jvD9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=HFaGYGgA; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=EvXlJhJe; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="HFaGYGgA";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="EvXlJhJe"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6884rGhK3505187;
	Tue, 8 Sep 2026 10:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=xZ+az/K0vYnX/32pEM
	ze9k9HMFl63sTpSRQa/dGepU4=; b=HFaGYGgAJ81jinqXdkvvzm00tRZ/sCyBsm
	bKPFEs9PZlXfbOnIVioV5sRm6IrS9FOpRluhxAPyWychxK+GpQIekX2PGfZuaeXf
	j9HACFtsBQZxRNrB5wXajbeQarjpU5y6S+tHE6WWeW++u8UzTGks79ow70v6WcCi
	1r5ce5Xj+Vd+G1+KeUzzKLFKx9icZ4Y4ImhVZZW7S0fUrSLOurNaKhYD6Fm0Z7IB
	zoGYiIRfUw3qhbAVfHGv5XcCfLv1S4KVeAt7+Q79MvBbqyp2oA2JfB5FUrRxVAZO
	qoGLykBu2jPIxOjc5sySXcSCKVTQD63OVWc3qPM9//WvSlwjITkQ==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazhn15013037.outbound.protection.outlook.com [52.102.140.37])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4gggfwkqb1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 08 Sep 2026 10:33:45 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yfqe8a2FnOhKxRpe0NewQnvnpF8JwkZpNfNw41tq9HJ27NU9MZ2cldP3+hR7JMFgW185xCsBHDFUOKHKRcu2iZgtReWUkC2IhkszvBJhRLN3OB0QDMCeyTu00uwml/ehrcUjikEcPbegd+5dHJmrfKJfbYE4/atoc1Z69fVpWOQCz5vnerV74vNddHs3Cx+5myoOjDcoBqAaPfYuYxcxAOBXihmHDASoYIwZ1VJUgPUxxaF+uooq88TfGhO08PP6xuxjfAJ1KDM2TayJ6/NCtK4xdxDcS0htRGz1+5UY2s01sK7f2J/aqoSvWDOWIBL7m17Gw9m/12VV3bEBQBdw5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ+az/K0vYnX/32pEMze9k9HMFl63sTpSRQa/dGepU4=;
 b=CAYuwidwTmq7GWwmNsEDYCBwh7Mj6xhNY9/9hbXi1mPTtz9hiqKz60DhBsys9S7fnFNZ88n+bFiqAh5Y6UEtYGqyzAysnJpMkaU1aseqBzY4+NRjO0pjVt0APq/BPg071LoJt5lKqVz4Lv6qIKWEvSu0aNJXnWbIPYH+N2v1EAtycpChgex2v7LHE6MH6cBxKZXCC+bE3I/pFLerVaREPgGent5/8d53VzByYXDmr5kzI92YWR/GWT1bAUGVyjOI+0mH9Jxk2piRb3C2pGhRQF8H261mdFPahcAIiVivBGTp81h3nLUR0PewVnE2885ihA5Hqg55DYcr150NtKNimg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=catcrafts.net
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZ+az/K0vYnX/32pEMze9k9HMFl63sTpSRQa/dGepU4=;
 b=EvXlJhJeSNP3PfoB+hlccBvkWy6J+JXTxErDDMr7TsbILADjYQUa9WfscX1NGyfsTkYvQ2JOncNdED9SAywn2w9MqRLj9qcphuiyI7GXNMrTGft6rixGPXZtp06+ZXIl46YB3j90iCbXH13WyqWA53KRJr42/biL4877jEomHns=
Received: from PH7P220CA0131.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::33)
 by SN4PR19MB997555.namprd19.prod.outlook.com (2603:10b6:806:505::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 15:33:41 +0000
Received: from SJ5PEPF000001C8.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::64) by PH7P220CA0131.outlook.office365.com
 (2603:10b6:510:327::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Tue, 8
 Sep 2026 15:33:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001C8.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Tue, 8 Sep 2026 15:33:40 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8EB8D406543;
	Tue,  8 Sep 2026 15:33:38 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 756F1820247;
	Tue,  8 Sep 2026 15:33:38 +0000 (UTC)
Date: Tue, 8 Sep 2026 16:33:37 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
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
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
Message-ID: <aqAq0TPQ8euPoXXj@opensource.cirrus.com>
References: <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
 <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
 <ap/MFVMHG2Hej8k/@opensource.cirrus.com>
 <a6ae0ad4-6fb4-48f7-9636-7c0e266b6940@oss.qualcomm.com>
 <a6d1f575-2431-4951-ab5b-e5bce5ecc63a@opensource.cirrus.com>
 <af9a7339-1e21-435a-9d58-b29977195520@oss.qualcomm.com>
 <aqALjdlyZfUb5fDu@opensource.cirrus.com>
 <9ed5d56c-9231-407c-ae7b-9c608c603254@oss.qualcomm.com>
 <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4d6ed30b-65df-4f29-b0c2-245e854021df@linux.dev>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C8:EE_|SN4PR19MB997555:EE_
X-MS-Office365-Filtering-Correlation-Id: bd343bba-b8f2-4eeb-6f7b-08df0dbe8ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|34020700016|7416014|61400799027|376014|82310400026|36860700016|4143699003|10067099003|22082099003|18002099003|16102099003|56012099006|11063799006|12100799066;
X-Microsoft-Antispam-Message-Info:
	wi8B5v90Ce3A1m+Ck0l1SvU8GX65CdGYIpEAOI39H9yJC2YqiuWFOEXhtyHClCh4JbWbmufxdf7FMjIjFJseSLuQY+QMtxFzwf9Fi9fpZCJIcJa5JX2It9WHPgiPWHaOfm3E1qHbyno8NaMPuVuZ45BtGGdVOh/cfHWV3bBsKLaMtMpQdeHW6E6pKJMOvKiJvHSp4zI1GPJESbwpDMoe5yEynz1VvYkcw9/TNH3MwpZcMzR1h/zWKxJ2JEGgqU8NkRI93J1B8RVUJhXhNwkxv7hwVd0oyFje6JQOw2f72B36+X6kG30XRbLmF+WV9VKbRfHd4l/+53Lq/NPapwQue38aBUiFOxjs30KEP6GCONA9LoWiAEidkHMIEwPd3lm0l7RbNy5s/3xspKKGtrgzquUlunIHvqBqm3VDp89sgdzQsOaWNsVHhbhMiFLj5YbvwOXZwjZlv8+A6zZPU1rqQzB4Sp5j14rKr9cRThsfm80g+2FpQoUYaPJefg8uBLt5NqEmR4HwgXiPHrvQX3LKJ8haspdcHgHIna8Cv2OAn/2+J/GH9+WEuX0dL08DUKD9MjDww1HENG19andvCrHS1O6xncpNeN+Jy0nsRsOz82IL9VQnHrWsrr/uZa0V1DwMyuOJf0hr6zuuJYVvrzRpdU6BdMpyUASzgeSfjVo3x0u1PrUXxcIT7ot5JBRbP0j5lCqXXdTYQlLLnGdBsWTsJg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(34020700016)(7416014)(61400799027)(376014)(82310400026)(36860700016)(4143699003)(10067099003)(22082099003)(18002099003)(16102099003)(56012099006)(11063799006)(12100799066);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IuB0uWGy5R25j7d52x8wyZTYb+hNVablo8n/qKotcvukGXBlODQJumml6/u2mVVdp6zq86X34bhDTPLlSkJXaNasxgb8Pook91yLGA+s5xLC/RdAH/iVr2o2Wd5AD2c9pQwNBTKzSFVsIeniSzPYrHYDhS8wG1f4S743QQ56qecjz6IyeXrkG5nqbxZZvY7lDQjHxiIMQirWaCNYaxqaG4Tgbx9loee3hKG2Bu9VWCILPaIAGzG4Wg7RrxrcDhFW5lZ6TjFSpvQlK0Q/xmK7rodGZlVjS5m8sB9DUMFDnahf3KlexeC4LKMuIKIOebgkXgjOn9KeRZfOgl8IZrR0t8FhXpvm0ffzEfmvn+uzugiyR83EZC8h+Yp0vrOtzksbfWPELceQQvKREKSe3VsQe8T7cbBnpMZ0i3oj0YoWBcn3FWjJY4ZyVVSAMDim60we
X-Exchange-RoutingPolicyChecked:
	DnROL7tzYm12cqMsyXHjR9LEFnlf0q+WcnferLC1NaknKqQrlRTD8yRxg+iUYWClIQIVrR5yRWj1cMSWRr3Ligd4r+Yx2qkcVUz1GEW5K0ptcgd3Fe5WlITQLzuZzOZIJF7eghbYXLDDPfRzDtqeAGybmmuq9EG7SvyXPVLnvTwVl/xxog+zoRsbeygX1mxOY+UZVNj/4P4rUxvmU7tT3yEp1YNSWgdH0avBDmhE8ive2c2FaoJfh27cIue2ocQ2JhSUkmMxMwOQeepNsOj8+VOtDwwJXyY2FHitWelJqy3VA7y+7qUbKixe+HjOnP2xSVDYVyura38UC+2JbTRs0w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 15:33:40.0053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd343bba-b8f2-4eeb-6f7b-08df0dbe8ef5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001C8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR19MB997555
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfXw29ZVFvdCGvJ
 Neys7zJ9etT8fb/Q9QDyyIOxu0s8lWPlSGW9vesyRdavoR7OgnaU1tBAqsvtVHKEUX0QtbjLBjz
 xaE8RU9Rubd0HC3D95gLiYS4lA4cQ1Q=
X-Proofpoint-ORIG-GUID: LxEbMoWWYPUy8QjWSsubUiXu7I4kLogy
X-Proofpoint-GUID: LxEbMoWWYPUy8QjWSsubUiXu7I4kLogy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfX8zlQ67vaPEmX
 KHaNu5fS/iAk4xr104m/q3FI/d8twcWpElHrb/0cmtsZUyyi2oh66vAr7c/NZp96ybfSNe0D6Br
 WTGU84rEWSyrMrClICHAWu1VkglpWcfVn4RfKI+bpYEkqS0a0Yv0xsb4skHLJf+mMelOTtpcaO3
 YV8kIGtiLoi0Pa4CMWWFI1ewkbrVqzue17P3MMqhTtf+II6B4g0YQAHMZbbwXEa3V6bfZLaqmnj
 QfuboacEvut5YGzjZmw4Wr8pSVEimU5gAhFThpyAV2t9/Qsult6ASfRX395Gd8mBAVWZa8uQ9HF
 ILUpe7Ax+kWB1SSJ9YVeTev6Qg9G00/RT71znfMy3XG7fHNuQQ920Rd67Ryrnw6hyky9+w/qe5q
 UIZByeMme6HreL2Hi5oy4Wa3wBu27fPwyVcKX1Lmh5RPmLMr2JjnBQvh31hpOaz7CUhLt6Phgj8
 MDs4vLVoK1iB/D8ScWQ==
X-Authority-Analysis: v=2.4 cv=fK4JG5ae c=1 sm=1 tr=0 ts=6aa02ad9 cx=c_pps
 a=SHLTN7Gfr/mm2tH/IiG+Iw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=tDm2drA1hDsPoIlPH9sA:9 a=CjuIK1q_8ugA:10 a=jZz-an6Pvt0H8_Yc_ROU:22
 a=VlVynqX4KLlZR1Cn4-IV:22
X-Proofpoint-Spam-Reason: safe

On Tue, Sep 08, 2026 at 04:22:53PM +0200, Pierre-Louis Bossart wrote:
> >>> That's why the current series takes the lower-overhead path
> >>> (mechanical transcription in C) rather than proposing an intermediate
> >>> DT format as part of this submission.  If the concept-DT direction
> >>> gets traction at LPC 2026 DT MC, we can revisit.
> >>
> >> This part I follow slightly better, I would be happy to proceed,
> >> pending reviews with the current approach, although if Pierre
> >> is or not probably remains to be seen.
> > 
> > @Pierre
> > Please let us know if you are okay with this approach of C structures.
> Now that I have more context, I don't have any objections with Srini's
> proposal. It'd a good step forward to use common class drivers across
> multiple vendors, we'll probably find a couple of bugs or harden the
> SDCA core and that'd be good progress for everyone developing or
> depending on the ASoC/SoundWire/SDCA frameworks.
> 
> If this means that in an intermediate step C tables are used, that's
> fine with me. In the long run, things might change with additional
> options such as:
> a) ACPI support on all platforms
> b) DT hybrid mode to reuse ACPI/DSDT tables
> c) DT native representation of properties.
> We can review the preferred direction when the platform firmware
> plumbing improves.
> 
> I believe the point about binary/opaque data was noted by Srini, it can
> be handled in multiple ways and there's no reason to block.
> 
> Best to start small at the SDCA level with incremental changes later on
> how to fetch DisCo information from platform firmware - that wouldn't
> change the system behavior, only optimize by making the translation from
> DSDT to C tables un-necessary.

Super, thanks Pierre. I will start working through a more
detailed review of the series.

Thanks,
Charles
