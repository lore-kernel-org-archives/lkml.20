Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4EA4DD3A8;
	Mon, 19 Oct 2026 12:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792414128; cv=fail; b=iRYCISdhKhES1kYXJly/5j9b0EmOVHd8MX4uU2QoTMcYp8skSAhPMLv7WF4IihlGfTfnKlpbUHPuA8Kj4Q+qCnFUBFJre7OrFwIR2+jynWyhFduB1q/CQocHZCqBZz8c2N6r2o847ObVes/Q6+SawEX4+TnosJfwMWaLriVJfY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792414128; c=relaxed/simple;
	bh=jgQ+p+qBlvsGjNIQAEsua0k6nh9YjovpkLWgBk2QX1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tImS8asinKVdS8HnKAoLPrge9xb4wAwpDaGocpwhqy3Va4uuQVu7M4vuvx9x4lK4ewddQoCIVC+8I/LZ2KI4V0CgfLETjKBy79Kzm7NNQxML9pnkP2FLC9eWJgyrFlrWiyxpeNUwnl5Z6F/OaaFCqLXpnJvQsJilTSCEB7qNNks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=RLUc7Lvc; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=s2vG3os9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="RLUc7Lvc";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="s2vG3os9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4kBBW1387148;
	Mon, 19 Oct 2026 07:48:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=jgQ+p+qBlvsGjNIQAE
	sua0k6nh9YjovpkLWgBk2QX1g=; b=RLUc7Lvc8CMloVPEyz6JSi2YTSTOx5nbqZ
	AIom8YFOms26JnOHO8NUQxGLgQb2XRz+g3UtQcGCcI6U5r6DUgIbqvD3ZbmuHHhr
	d1U7+vq0Qmdl0xxhn10IruEZEJQgWfyoxKqKt++PA5teMXkHk28X46wWYSdT1igL
	ZiJ/5+tOD37FADWUtw5qwnlyu+aty/AqtowhKBiDFpY6w/ALWUSdH929qdVO0/Yu
	NYVl6sQP5gF5VUjW10MUcezjC/xS5Wgc6LQY2/0H5+5EfHvXTHmatMw48GldEICx
	e8bEkvajcpVjUFwAFH1hsDxGhItZzMhSZYd+BJayjRQmZvu/yCPA==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023100.outbound.protection.outlook.com [40.93.201.100])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4hc5ej2537-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 07:48:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oyVqLFtZ2A+ODTXXTFGz4shboWorPN7OwCjJUQjW3kzU5O8vj8s44dCbNvKZ3Mhkg5jBmk5wvTsfcOmOwQVtDwZWxIAX/KBzo8X5c0NrBTdlzEuuE0JOeCkNjw1KwvZQtsgi1m6u7Bl1Wu2rEBwTo+MahsE+bvvoBA4TXJ+hL1aklv5LPF9h9OqHxD9MgbENg2sfb0eyO7Oe/Pb+tchWFba8pvbRAdoDpvXtUJ5f6i+vEYsc3I/s1wuNdv7hzApQBOcNFMxLJvmM/EsRjFVJH+VECAliuQZlftP/hLpXaRUHIOUTHkRfoG65a+vy8E8mdQ3MD4klqEWSHJy8LwKHHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgQ+p+qBlvsGjNIQAEsua0k6nh9YjovpkLWgBk2QX1g=;
 b=vfSpuxHHHCosiX9a30Qvo5sv66G3R+JheHRB9XLX+CsZ1hh/Rhr0gBd8ZlfTNQiqYGK9yoFREMK3pCRjqRtxRy2z7RbUBSZDuJI7UUFEg6DwDaK4+mc+nPX4hTD8fI9cDihCExEHqy8LS8+YNFG2MYvWft19xinO5esBOBRS5CgHPid0dXaxBekMw7FxucN5RJfqEVUVYh5KoY79JqogIb1osb/RiBIjUDFa3dGOZOPW0GlngvxVF8hCItMmbsEZC2EnvMjgHgbhFFy4LqMqbsEjzh34rsxospJZdokNLT3XDcLVcd09QSHgt6s58eKdwY5VfCSyKYQUo8dKwBxGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgQ+p+qBlvsGjNIQAEsua0k6nh9YjovpkLWgBk2QX1g=;
 b=s2vG3os9kZGxTsYM8JGKCWPT+d42JDhm+C0XAmnWv34KwKMwwGu9XmJci8ZGDtfi3Iyga9VP6Yp1wMcI6bTtPjymRTLvuJIILwB6xvzquvsFMTxynaD2syzk7bVwbybp3IvT+hJoUKHX2Lw+h+i2ND5p2v6KE+gj7BYhhqB3DO4=
Received: from BY3PR10CA0019.namprd10.prod.outlook.com (2603:10b6:a03:255::24)
 by PH8PR19MB6998.namprd19.prod.outlook.com (2603:10b6:510:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Mon, 19 Oct
 2026 12:48:24 +0000
Received: from MW2PEPF00014678.namprd04.prod.outlook.com
 (2603:10b6:a03:255:cafe::86) by BY3PR10CA0019.outlook.office365.com
 (2603:10b6:a03:255::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.19 via Frontend Transport; Mon,
 19 Oct 2026 12:48:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=softfail (sender
 IP is 84.19.233.75) smtp.mailfrom=opensource.cirrus.com; dkim=none (message
 not signed) header.d=none;dmarc=fail action=oreject
 header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MW2PEPF00014678.mail.protection.outlook.com (10.167.249.185) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Mon, 19 Oct 2026 12:48:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 796EE406540;
	Mon, 19 Oct 2026 12:48:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6A54B82024C;
	Mon, 19 Oct 2026 12:48:21 +0000 (UTC)
Date: Mon, 19 Oct 2026 13:48:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: HyeongJun An <sammiee5311@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        patches@opensource.cirrus.com, Zhang Yi <zhangyi@everest-semi.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: core: Warn about controls whose register fields
 overlap
Message-ID: <atYRlMfEX93loVxb@opensource.cirrus.com>
References: <atXh3Br+fuH83S0q@opensource.cirrus.com>
 <20261019123800.3410554-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019123800.3410554-1-sammiee5311@gmail.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW2PEPF00014678:EE_|PH8PR19MB6998:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f07ca0-fafa-4eb1-6ce9-08df2ddf431d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|23010399003|36860700016|56012099006|11063799006|4143699003|10067099003|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7PYubGtPMsO2OFxNU83W7e7Wnvpplnx2sqYoDTlM/SPCIFivkdxCOM5vxR/5vDs3KVyt7SPLewOkI7fqIc7kYmFlhfIbvwD8qekgEYROMd3lY82u4jYgW7CAVpobb7wb7oi7/PsHKatBbM6pGFMzX4lRw2h/dImwze+4Cxfn95wnuDBbE8t15epbRSyi4T8z38XMjfmQB+lFHcqPlChlstifIwappzypATVZvyK6VBqd7vk6c94d+OpLXgyHPsaxRUhfiEJCQKZ6LlHWltAu3UuuRab0CIG0Y3fFX/lPjNukRLltI1bXGvSQXo5RB/zTemVihspHVw19QQQ2gylAKzjQ3XTtyjvuXdzCil3I8lUIofH/TGy+NngdxFoSW5vhO9GVmsQ4RQ688aNaPTdKt44HRAFODXaICI4i1/HzUpViGPuh8Lh+mIXWNX4AXeFfBU4p1l1F6WkdlTZZLMyiPUEUIuD66SkVQOVAbYbgJNBBGiJbUWHn5frrQj4dV+N3DX8hRbO2NDtueg9g25TFxjlwnc6sRVE0RV0GFBe712k7yMQj3YQn/TzGUOqh9VC1mUaPhIW0keK3OEXYVsTMB0y8QKTr0XLKEDTzUdB0f9OkYEMnKVBGOQ2anWJ1Ai3Umr9VP/ToN0bMQpBBWKVuCk6CdmIl805Xq2M8gITNM1cHeAL6lE2ASE9ZOAjCBff86VEI0Jthbj+xy5am2jwWbA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(23010399003)(36860700016)(56012099006)(11063799006)(4143699003)(10067099003)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	46oEsDgivFTM+WqQtimoOAMI+2rWVyp/qmLBcuI4OTkGO33KyfWgKYJjkc6ee9YeWmEItY1cz++sDc65ZJub8Kkt56MdKEIUNgL1m7VEwD40Vii5CzTuT/l3iRogz31XlUkC1ppDGMhWPI2NTNW5wDU40+6T79g3xW3wkDY2zrPcYYd+kHJquuLMGIEWO7rBqtna7id40xPKrYTu7yiCDZ5GcIgJy/jwzvArsjWUB8wl5OBsiqofqdQJaw4LWpYYtLRszkHtttKUW33ZVa1wW/OA9eJTAh28GuuliLXQhgwfEOBk7wIZf6VD1RClCYjHmc3GsRmKVuXuQDAZ6SrBvZqEiExwE3XK90oXtGXdd29AhHQDiatbSwjBwsFNUMQ9FfMjQ5+UIhOdUVApQmlGTYtM1+0MsNVyUr0kJnIIFmqt4HzWFPB+spDc5c+u4apv
X-Exchange-RoutingPolicyChecked:
	WWkjiBQQ+QvAL+95Q/tNo1Y1ws+3YYlc6VJkZmdczCKopp02HAv/vhmSTjRB+Sy73vNQlUZBIhQZEB/y/5o+Of7pnqQP9QHdCeY1ORqYmc5y/Y9FZ4NyDMEc4+9RmQty2cjhAEwhO681e3LAi+vt3JJkGfJIxnQT9bJ2ngGQsUNK7S1eNzH1O0hLvnByOCAcmfMI+SfKke+PuhbOhHpX6YDcUZE8fVOEUpqc/pyAO1UzjUDmMAQq0Ul7M2jCOQIEnJelVsuSBfXUEBrhrPplehH2ciyrgbHjyVY8Q4YN2eogIPXp/vSNWq3016OoBR4+T/JIo7pyMXOFr25anAUmIA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 12:48:23.3588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f07ca0-fafa-4eb1-6ce9-08df2ddf431d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MW2PEPF00014678.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR19MB6998
X-Proofpoint-ORIG-GUID: DdBG3s5lGDnDWFsGGXjlxmHfjaDAM2Ce
X-Proofpoint-GUID: DdBG3s5lGDnDWFsGGXjlxmHfjaDAM2Ce
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfX/7gDLICAh8T9
 OwZuIs5NPzan0VS7AbG4cmS9uk156ekaVQ6oO9zS5jc6HpXiXkxbkHiw9hIEx/fTHQQbZKbOpeY
 mv/gFczx3dXQo01kYQtl0rJsx8ArMsc=
X-Authority-Analysis: v=2.4 cv=KrjYSmWN c=1 sm=1 tr=0 ts=6ad6119d cx=c_pps
 a=RZStT+UEo2YVQxgsfJfMbA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=M9gAAirHPP0-tn8VPkEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1MCBTYWx0ZWRfXzS1O5SvIQ0SX
 KRMMguf+JStMlaar+Na+mdG70Rbw518ZP3zHFfX6NisXT1DrPMdIKkOsP0QwtkhtG8+dOumu6BU
 Sr2Z3xWNjuu3Gaze1fMo1T1kwtj5XogJQqntpKdiTuboDo1AL398SiGu31xGoFLQ7xtveWDoLCM
 1/Jv5hmAg1QozX+qBNbxdIx60y9baixGfuNfNWt8meRpU9hC8dgHYEIpmodL9pc5F3nlIILE4TE
 /HpAJmtMWvolOy2zBOO8PivTg1fc5PfOCm3iHYHG0R9WoAj1OBDMNdo9IVZXbqsy/cSaMJwhxVx
 bjqILOn9aCCAQtkC97wuofVlzm7yQsh9bDzPAOcoOhFzsbLez1i8fxUJyaXn2qfR08KndgQ/wFa
 7ZZ/RmBOriByCx30Z95yExSLohr9ofNoKDVVvUMVLA7OrRFvzvsK7F3DzQDDf5Y/7HDYlexKqGQ
 usSkaqB5kVezXP+mQWg==
X-Proofpoint-Spam-Reason: safe

On Mon, Oct 19, 2026 at 09:38:00PM +0900, HyeongJun An wrote:
> Thank you for looking at this, and for the explanation. That makes
> sense to me. If it is all right with you, I would be glad to send the
> patch myself. I will Cc you on it, and I would be grateful for a review
> when you have a moment.

Perfect, I am more than happy help out and review the patch :-)

Thanks,
Charles
