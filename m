Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329241D239;
	Mon, 14 Sep 2026 10:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380580; cv=fail; b=epcMQBrmH8ROcMZoYpdSF9BGiax3co5OWyrt+g7T6uM8AuTVZXEINR/paAbVEwtKU7FgYnRSWJu+IhZnurDhe71tOxPJzPEU/uicgX3plhxia6AtaWJiGls63uQa6v9B87VMuQQR0p4PeRIry1IZCd7jx9BlwPSPmMFfweP7fJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380580; c=relaxed/simple;
	bh=m4rCIypYBwj4Tl4AEZE/tAloUp1AdTze72HRmELarkQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CsnDufQtTL5HB8EIVxlKuJJVPDlMIxVMGDCfBSmpCA+IZXeX6PArezpLXwr9ALCi+VvNEbkNH1zu0Xz6sTRxMX+umaHSBGZV9T/64FPpnsUd3GVPYR2YujE2Jlhu6fQn01F40+GB4XTW48MhFJjdBrK+9WsbEp+7a1zqAB6GXTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R8E9+lq2; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=gQENXSUY; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R8E9+lq2";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="gQENXSUY"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E4bXQR261164;
	Mon, 14 Sep 2026 05:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=UCt+HMpzx+CqOkzLv5E9fpS0lrpSRGwkPaenmf6Hseo=; b=
	R8E9+lq2wp61j3yREY6Wo7UpICuciMEfORFETXxe7KCE8mprHCtIDvm/dION4CGu
	6r/Bq3s60soPERZOKCSq5y7RQm8AusVzbjNLux9w8lOwqFXgWYVlJ04tsvQ4mH5y
	jl5uRnrSKVXf0nB0LoDNlzkoNb1Ph4uMl2L5BzCcI5NbmT4ZPQ5jYgdTOrk1YobS
	+M9BfG8Gdzf2kUu0lRntsW84VZRPmkzvLlLxitkeWyF9B9FMAJ2ndN3iEb2g1Wwz
	pfl1Dbg1nMtAzK0aR4Y9BBmqr2VdIt1vPBDBXZKRiFW6V+tNUEAoNaaHOWOZjckx
	hi47Ky8pBMlj4ipX+Ki2Ug==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020078.outbound.protection.outlook.com [40.93.198.78])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4gn35h9pxv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 14 Sep 2026 05:09:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kiDQRRf1vzy3/3cqHrcZsDm+SFjdZLPWgZ3wwn/EEttzYp33jR+12hhPtPM3oR+LI1Lx30Oc1I6UXgyN5ZJud68qrm+ckjLKFK5cESecygQ9WA/6W5K0rl1B0myoMC1Z7QkOxsv/cEwzbD/ovDfbnArw3EGD4b69NoqhnFsQhLONNzVle3YwLxLPGdmAKMquuuodu3nT+ifSqTRYjZwLb31f7KgK9PPONPZxqTz1+ldOd0I47xLen8cAUAru36Hrnn1ivlYZu05vSuQdEA0dtXXLdQGhaA4U1ntYwjbMrXm07bqw8o0aVPCf1zqoiz5t5T25cf+leqZM32ni0sLpHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCt+HMpzx+CqOkzLv5E9fpS0lrpSRGwkPaenmf6Hseo=;
 b=MzygXsseWnfRW4W6HesCCnyqFsceUpmTrLO+M/RyynYb8PyhGHN1An6GxdEusHHV/C7js93eRtT6jdvXBE9nuplaWfXA3m6gXLnwC98ZZw3xWRMApK9rljiah6k83VU45Yz3jttuORrPzX5fHPAnuazA/jl0wXkufB6Fcs5U/qtyIzOZzPOueudXEEIItMo0Gfs5XohTSlZKx/510i8bvU6pUcUX16OqIHY995spYIkIh5VO3KCml9pkyz08Ti61XbrCcZuQFlA4cwFLjQdp0FY1wbrgKnQOnMfBmrwRY6iJ3Z34THkygwscxDosjZjH56U+CeD+7pzaVgNqPXjKJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCt+HMpzx+CqOkzLv5E9fpS0lrpSRGwkPaenmf6Hseo=;
 b=gQENXSUY4qAi4P5P0wF+R3+WgUah+inTNQ4cSQfrScY896KC7nHafZYhuWc4tiuA/aTRaLa92zG4kjC2tOXHmTyTAeE/tqqWEOLVuxQ9cEugmyUugUz58eMhZIQqH2mVAPbTJsyjUwrlYqqEWSAJzIp2LGWdgOIOcpjD1kLYif4=
Received: from SA0PR11CA0146.namprd11.prod.outlook.com (2603:10b6:806:131::31)
 by DM4PR19MB6176.namprd19.prod.outlook.com (2603:10b6:8:b0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Mon, 14 Sep
 2026 10:09:28 +0000
Received: from SA2PEPF00003F67.namprd04.prod.outlook.com
 (2603:10b6:806:131:cafe::46) by SA0PR11CA0146.outlook.office365.com
 (2603:10b6:806:131::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Mon,
 14 Sep 2026 10:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SA2PEPF00003F67.mail.protection.outlook.com (10.167.248.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.7
 via Frontend Transport; Mon, 14 Sep 2026 10:09:27 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 69E7A40655D;
	Mon, 14 Sep 2026 10:09:25 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 58FE7820247;
	Mon, 14 Sep 2026 10:09:25 +0000 (UTC)
Message-ID: <4621b455-9460-4f45-88d7-303b6243ad45@opensource.cirrus.com>
Date: Mon, 14 Sep 2026 11:09:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ALSA: hda/cs35l56: same calibration condition logged at
 dev_info() and dev_err()
To: Navon John Lukose <navonjohnlukose@gmail.com>, david.rhodes@cirrus.com
Cc: broonie@kernel.org, tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260914000308.108995-1-navonjohnlukose@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260914000308.108995-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F67:EE_|DM4PR19MB6176:EE_
X-MS-Office365-Filtering-Correlation-Id: b36d063c-b184-459c-4f0e-08df12484295
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|61400799027|36860700016|82310400026|11063799006|56012099006|22082099003|18002099003|16102099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	zoZ+60NvhUmZgduzWNHy8kpPKrl+eTo8swxt5OK2aiAvREIfapE8oPtmHF2+yg92UhUVfIHzzDXFaXKPti/0el+6QQUI8TTjQdHAk4Nb/1reaG8R2U+uC6EUbthBol46sS2EzrgECp9KE6WZFBJqb1RHOA+oqPn0mSNAAQdGssbIY2tW4uRt1OWzinxgCdXXYjwUJO9+cRZBzMxMNIYUk2A9hCbANn2gIVaQ/06W1gaPp+aCvUkaxUaD9YH3GrPLMrtk7rPfbrt+Yrj54UPM74SSvU1f7jsA3TeoERolp1XxTswf+rcmjgPfAzoHfOmYeGEuaP53o3ZijT6gUlyK4U3QUbo9b2djhkf0ZjTsbfEaPeQYS8aLql6gqWSH01LtLN/E+Q4mimNvx+Kbfadf4/iG58LUt8KUxKq/BrXY64rMeNyJxreuCoSrxVtUtC37ngRX8TosjuW9qMD2J5MM0XTYHkT9aqq/znb3mJsnxqvgEIo63uglsX1+qmxfNzVAkrpXFg0XdLOEHCSwkQA9nr4Xjgg//3ij/lRF0BrOzmnvAMrKcbCF2SLeezkqVvVwYwATmIKlwudgA4hyEAK9yLNe4L7J8TADbygbs7kN6ASpTR4b5M8cGaYR/EaRwFCjkGc9RUyyPhjiK5b6V5IKuK1iLu1ykLcxLMX7pbEx2NQtD2RHvpc64OIsFCh1/gE5EXLWGByIgVxP/JMq2CF1rA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(61400799027)(36860700016)(82310400026)(11063799006)(56012099006)(22082099003)(18002099003)(16102099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	W0ThE3epmTERH+9zrplrRaheE1PtAhxbY2pN8KNixoCpqw8rPBkLmQ+pOFAGR0umhQFk+/QFsqO6pMZSUo0uqlh80VuzshALjAeQnL/M3goSgY2McGZ2SsrDnCKi+aR+0E13cEkB/59hzap9fWhn/CQh7IjRfHK07qn0ypQQtlgvus6EmJCIUPcGljT8DvUZFnKr39TxppqNYluyEGmbDc7Fh7TPnYKRGpDHuQ546bEb4gmAR3bikzVu9fCuS5ag/Ou1TkCUmPEEgWaEPLsIVGHXw6jw1Xc9CQKtZltXs+fZ0x/XtFjP6pg7v9MXKAaj4Ky1sqC7EIWowaXPMkRss6ic/l/5S4CcQ2BAGqgnbf8J4oU3Vq8qaKpM+9u3BpJUmcEGEzZFdmeACCcOSYRrA211aZr4TztJp40Q7OG0TJ4nj3iNaAajB7QW38/D8YuE
X-Exchange-RoutingPolicyChecked:
	kCsNukLtNju3HxW/8XrQaO/xLVHiP9Hj/7kke8WqI8Sd+HPWZzwJDamwGw+XKMJwkV67EFC71WU9TspKIVVGHHNpkzQKLre85XMp6RvCKtGvRj5bQ4yXzitRTgRvuGceHdiLqtsF6nYWBMSSFeB9zgz12zytHF/InRwvruTF2WNJ20sxKvw8RCDWa6p1v21ZCQigWuP9J1cUh7LxRYUl5VIIOw870fc6q5FnbllGHMBRtTpyYrhJOR3HjnMLsKMieBAwVJbXfUYD10MLXtrZ4pxp611ycphaWkhYBFdqMf9tiNGvOhdu4FHKpd793QXSQ2/JjDzGrHQYKkupSqwRtw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 10:09:27.0961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b36d063c-b184-459c-4f0e-08df12484295
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SA2PEPF00003F67.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR19MB6176
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NCBTYWx0ZWRfX/0eUE3omiCSD
 XzgYk/wDeNtQ3636QUmhKgSrHARsSJtIj5Rp8TZt+NkLi10+Ms9CAwFp6yrRE0Fad6WoWowST6l
 yNxqHZJhHQiKVP2UZa63PZt7tCW2vxg=
X-Proofpoint-GUID: b_0OBMNQL2EBjTtOlqe68nde8X3qGEuu
X-Proofpoint-ORIG-GUID: b_0OBMNQL2EBjTtOlqe68nde8X3qGEuu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NCBTYWx0ZWRfX4E7yhS8SvOfo
 eS8aZ3VAgQ3OVqwwdZWB7pdkX6rU2EDZxyJIJt4ugR/ru7UocCnw/mWXX5EujZpU0MV2MbO5awi
 VjFmjqyllzlrVkwXN1b0pgWG7D7pB0G17oxb6LGikI4S6NohmnSv+PjsytAXtZ0Natkjwyrec/G
 ttOGUZDD4g2+kybJ/y3G4PWMmvx4v53MzrcmWzmDk6emyUOwBbYTneL3ILoS4zcea1hvPNR2Ank
 n6fRooNVpP7MxmBd+SGwHX60saxQGyHIk2e9sT9GVLf9aXmGWHKp5t/39YruWwxKpvoEUuPyoWO
 /UbTDAfOoN61rUXovrt0+GKoxzTz/rXQqEUL/msz0A0OwdrYjlsNIiOCi3nc1ASkGY7ewYIHXfE
 wgK/VbXLe0sHb41Q2o/DWUvrQBfnoAOVsgxx2fZZ6mjCx1wCCVWr3jdCom7a/oW6IuEwoUtAu7F
 LBjy4eDz6ROZRV9YmGg==
X-Authority-Analysis: v=2.4 cv=It6L47/g c=1 sm=1 tr=0 ts=6aa7c7dd cx=c_pps
 a=r5kpy6O4d1nOJ9DEYQWzwg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=gmlGpiUbkyEgtPAR4HYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Reason: safe

On 14/09/2026 1:03 am, Navon John Lukose wrote:
> Documentation/sound/codecs/cs35l56.rst says "Failed to write calibration"
> has the "same meaning and cause as 'Calibration disabled due to missing
> firmware controls'". The latter is a dev_info(). The former is a dev_warn()
> with a dev_err() from cs_amp_write_cal_coeff() ahead of it.

The documentation is giving advice about the *typical causes* of the
errors that can usually by fixed by the end user (like missing
firmware). However, I can reword this to say that in most cases they
indicate the same problem, though not necessarily.

The former is a dev_warn() because the driver attempted to do something
that should succeed, but it unexpectedly failed (though is not a fatal
error).

The latter is a dev_info() because the driver skipped doing something
that would fail, and is informing that it has skipped.

For most users, in most cases, the root cause will be one of the two
listed in the documentation:

  * The driver did not find a suitable wmfw for this hardware
or
  * The amplifier has already been patched with firmware by something
    previously

> Rebinding the HDA components without re-probing the i2c driver takes the
> loud path, 4 of 4 attempts here:
> 
>      cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write to 'CAL_R': -1
>      cs35l56-hda i2c-CSC3556:00-cs35l56-hda.0: Failed to write calibration: -1
> 
> list_empty() is false because the controls cs_dsp_power_down() disabled at
> unbind are still on ctl_list, so the dev_info() branch is skipped.
> 
> The calibration is intact. CAL_CHECKSUM, CAL_STATUS, CAL_R and CAL_AMBIENT
> in DSP YM are unchanged across a failing rebind on both amps. On a speaker
> amplifier "Failed to write calibration" reads as a protection failure.

This is the second possible cause listed in the documentation:

   * The amplifier has already been patched with firmware by something
     previously

> I lost around 5 hours chasing this down, believing this to be an actual
> bug.

Warnings are warnings. They don't mean there is a bug in the code.
Some interpretation of the meaning is usually required, and AI isn't
always good at doing this.

The documentation does say that you can get this warning if the
firmware was already patched.
