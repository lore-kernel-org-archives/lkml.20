Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8DF417BC3
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791189988; cv=none; b=u/EF1V0q/YbscDO6elHal3LvW0/pSM3uMhmn50jiSMXFe+P46Pgn8ZMlXmLehks6ZDBKGU/eqsSpZ8VJ3HZFslX3vOVRXNHxpQczKfoSII8b9hha+YF1awys3NvD4mAkenvSYx5aXaB0CaxLh0D5SP6ARgiDsMJDtRuUz85xMOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791189988; c=relaxed/simple;
	bh=lWQMxFYy3CH9ui7usyd4qhc+qXFkgE0C6cwY5p0NkKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cObiaibaV7JvIO5Lnc7P+t7X+UHZxe1E+qG5uL6m6/AR5HOETF/kC3MWnIaUOk3AkLGHfJ0m0TGY+71VBG45PoYIqjYravIot7QGyOulqgQ8obc7A172zyZCIiX2vxj4xaVW27O9LPzGENB0CgO/KYP/47ASLJQdg2iHl5tnskk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=foB672t2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qyvvs0Dt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="foB672t2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qyvvs0Dt"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6958b07N1751182
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 08:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkHxS049vFe5YMJRUbWGcu5qpatYUixPO7U8ss5Me7g=; b=foB672t284xNvpKN
	2YDYf2QUbz016Ieb2/bf+O9TjUBVhbVB4gPUzCz0+6BrSQupxpE83fYT572xptLx
	O14P7fsq19dK9Kb3t4VhVsPz7H0EMJL49xeRa9wMzDP2029vGiAj4BPH4uZNdFmc
	gejyIivLjjk6Si+qAAENa2ldj2/dHtbvJKOrO5jVncehOj1kL2k/uCEM7IiZh+zu
	4GGpI5MFRM+LlJDjlb8T2fltW61tC4lkBMtAz48+GfdxgxKvs9PGVKjBvIHdi4yD
	lnUcG3VndSjG5BQVFx71e4rhsqb/ICmDRd2oHURWKcoJHuSKYJYCmjCOygwa+iUK
	L/Wwhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa55r3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:46:24 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso4461814eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791189984; x=1791794784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xkHxS049vFe5YMJRUbWGcu5qpatYUixPO7U8ss5Me7g=;
        b=Qyvvs0Dt0tSJPNwsrmJdM4QroN9WX0mXTqG3zsIOkEIhrbsRhDZyz8xNHcchp5nRSl
         iB/PkTixh6QV7sGAsHP6WNHexW23EhJZCfpLyrPCivka0Elk/OhlWPfQU5tsOQanaj+5
         9701EzvmNfonCRcs4y7ko4hWh8FQj0I8kGrSw0J37xeBwaVFgkFKVJm7SpJ1th/xifBW
         gAEgj0d/Drg920Hrw3z3mU2neUt1uV7j8AauljMaTvp3ANJr2soYTH0Qnm/8vWhymxax
         9NobX/1vQ7TvXrwhsLZahK8nQMdXHv+ljK9Dr25DlvS1H6LyXkzRH/wASqueXHkU+M68
         xfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791189984; x=1791794784;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkHxS049vFe5YMJRUbWGcu5qpatYUixPO7U8ss5Me7g=;
        b=EmCNr+uJMIJbBRC7hh1Q3zTwaNGvycveQ+Qc0WddIXdTt1P9rDbnhezteJC0d+YuO+
         7kAYP1Upf74ovGt3VJOjpDf+znTWKa+eV2RrQJ6scUfOwTHN+URXV39Z3KLtY18efhdy
         Jsw/IBr4epp7ZawYTl3Vl3LrjSWUu1+aPAZOFdUXu5UHFg2WZ9gjoIfiknP4H5qg5w7f
         nLex+MsBV1KCLcHRUUK7ubiku9dkx5a/43ZvQmTqpEnmoAYCCtUiao2Ez1joTH43xys0
         4tNfyY4SUWD0LRGRuFCvrvZBvv4/OiCZESVghYLuoZYositS52bAYHX7KN0qp6cKSA2P
         UtDw==
X-Forwarded-Encrypted: i=1; AKwUvBy2gr7jyKzyt+6oj541PzGLpggu3OGLlsKTJasxNh30BAJnqeg6sDIieG1ynaOswkaeuyrbhun+rZqMF+I=@vger.kernel.org
X-Gm-Message-State: AFuF++lMzNvisNgzbkRauHUC7Lvh9fhJ7JuJa7IJ1/LjkqGnL08ZW3sT
	R0X6RlA/4lspcpqiVi/LAbrSMomiraFfbMJm/S7oksuEGl/juoDe0iA6tPcEA3pzrwY+aj0g32Z
	kDuuOBfGVc4FNPsuLNi5fAZ/i1oIzgSZ9DNCrpbqB7fPjzX3mKHKr+R8g2G0so6vXnK8slaKS5E
	U=
X-Gm-Gg: AYBFou1A/nCywbyERLYhzKQB3zlrphnS+Ix4gAH46jZj0I6jiGQlwHn/G9cxA9bMps5
	s2SbE54Nwmm3LQv42BmBUAw5CDYpeXKIovz6YFKcGDgP5xDoU5qZ+w+TXfxlFUZ9uqV8THy6u7z
	AieOKys5xAeV3PLVAhzLovl1GIbMlagzGIqBdt0kmwHic4NDaNHWV5LcC4eDlwAZMgIW0KI3s89
	b6oTDkdj4kYuEtiba6fZLNsXaV1O440s+aVDN/8EQ+GSTmLFh2x22x3ADYmg8t955BAXb4VFI+r
	3o/nHlgFAM0/4d1ViN36xME5NUU5ZyKLfB2djfgWVcL+zjaoLwDNfLSAPwuxsxS5oMOS+KpK4bw
	D5RXdMiuCXp2Z221osMDPFYvkJj4f
X-Received: by 2002:a05:7300:8345:b0:34e:6cb9:14a4 with SMTP id 5a478bee46e88-34f219c10femr13177689eec.36.1791189983965;
        Mon, 05 Oct 2026 01:46:23 -0700 (PDT)
X-Received: by 2002:a05:7300:8345:b0:34e:6cb9:14a4 with SMTP id 5a478bee46e88-34f219c10femr13177643eec.36.1791189983195;
        Mon, 05 Oct 2026 01:46:23 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127136c44sm12194324eec.9.2026.10.05.01.46.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 01:46:22 -0700 (PDT)
Message-ID: <fc526d99-d04b-45b8-931d-1fa337a8ba41@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 14:16:18 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
 <20260913-rpmh-timeout-debug-v1-v4-3-e94d3e416ea1@oss.qualcomm.com>
 <c24937ff-e88c-4e64-8eda-0b13a8e52f79@oss.qualcomm.com>
Content-Language: en-US
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
In-Reply-To: <c24937ff-e88c-4e64-8eda-0b13a8e52f79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAzNCBTYWx0ZWRfXzHuxNMCJy4r9
 O1ydpjZC5w0z84p5P12ONuc/oEvpLqVNzDH0la1dDtUbDNZdHXqtaKjs/CtxxHTCP8kFS7HBcpQ
 lP6rclZ6oFLYTXxCyQwCyZKYVUyX/aEgxQ/3HvdJ0KbJsCiWogyD9la+6SXxI7KWTleD+YPDu99
 morAt+i6Ra5fRk/Y994UDvmgzc3Fm9ObzKlzURO8jfEGY9ZlPgnD3btTNT0SmEUy/y/QZhHX0i7
 kyBvrCCAyymn0ZZ33wIjJomF+nRuRY+pTMreiFDOC5ic1CgVkrGaG4Y6iZjh9cb3r7ReO3drheg
 3olcu5wQrj7lGc/EzOUxzz4eUOsZZrAK+RIho4uDJTAlgVfpcHPs1CpjvDle5erZ5Lta8RrGS8P
 3mS0r8qfxgEZ1LkXe3ya6VLmlYTltvXvLydEHodw3kWCZP2esijwhSw9Gpi1Sz61k+eh7Ehekva
 Cr5He1Z5A3pcwGUvqXA==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac363e1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ZYORgB9VOuKEr7RHt8MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: bpWYIBhoSsMQDEowWrYuFIxjs9KCt95P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAzNCBTYWx0ZWRfX9rx2BVInGVry
 9q0qB+Emr0w1fRy/5JTd4HXGeNegKcYJKFeeGIAKv1cErBjoVzVAUr8F4HZy0PrWtdDwscXnjsG
 cpAgnp1n2EqsPstZ/1VhLMGtusVoXeo=
X-Proofpoint-GUID: bpWYIBhoSsMQDEowWrYuFIxjs9KCt95P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610050034



On 21-09-2026 15:27, Konrad Dybcio wrote:
> On 9/13/26 2:54 PM, Maulik Shah wrote:
[...]
>
>> +print_tcs_data:
>> +	/* All TCSes on a given RSC have the same number of commands per TCS. */
>> +	for_each_set_bit(i, &cmds_enabled, drv->tcs[0].ncpt) {
>> +		addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, i);
>> +		data = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, i);
>> +		msgid = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, i);
>> +		sts = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_STATUS], tcs_id, i);
>> +		cmd_db_read_name(addr, rname, sizeof(rname));
> This call may fail and must be checked
Added check in v5.

>
> [...]
>
>> +void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
>> +{
>> +	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
>> +	bool gic_irq_sts, aoss_irq_sts = false;
>> +	int i, busy = 0;
>> +
>> +	dev_err(drv->dev, "Timeout on RSC %s\n", drv->name);
>> +
>> +	for (i = 0; i < drv->num_tcs; i++) {
>> +		if (!test_bit(i, drv->tcs_in_use))
>> +			continue;
>> +		busy++;
>> +		print_tcs_info(drv, i, &aoss_irq_sts);
> 2. P2 — Patch 3 retains only the last TCS’s AOSS completion state  
>    rpmh_rsc_debug() iterates all in-use TCSes, but print_tcs_info() assigns
>    rather than accumulates:
> *aoss_irq_sts = !!(irq_sts & BIT(tcs_id));

Addressed in v5.

>
>> +	}
>> +
>> +	if (!rsc_irq_data) {
>> +		dev_err(drv->dev, "No IRQ data for RSC:%s\n", drv->name);
>> +		return;
>> +	}
>> +
>> +	irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING, &gic_irq_sts);
> This call can reportedly also fail 
Added check in v5.

Thanks,
Maulik
