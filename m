Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8873B44A739
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984646; cv=none; b=oQy96bWjSVqKKVy73qFM3BXlV2hwKYWPRJa6uX3uovFix0N6lI7cD+h0SMuoULrjc4OcFmDEeeEwAgmGlnEofI+6s8uhQrvZcIkgtqaI/IJ+u48NlC//+evrtd/8EI6+B9gSYobDPaE/QEA9b9eZgooIpY7mlFQZiwk33OlxDr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984646; c=relaxed/simple;
	bh=2hpdqpvqWsp9HGKrGlGD+v19A4ROe6TiEFtPRMjY+lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WqmnSDj02r9bh2ih7FJiEoVyfICo1ggRzVVd3cpltYfV/do4f1FePFwXldMfHSUMKB2p6cmreurYfwPT2PUUiuC18pxYrUmeICKAF5o/g5lyxKuR7RODfnGvR4qkd0YdDV2snpPANsfUOf5nSNMcpBuryLWE7K3z3kPgvhuUU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cjx56/e8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LN1Qdwyy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cjx56/e8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LN1Qdwyy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7F3Wf957107
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pdKtn8acBsq2JOdFmvVRGdiivlSG6ckujHZOGMugqVM=; b=Cjx56/e8Iil1qceA
	/n3WffMq7zmYjsbeNCEHbIg9FVceUzSJuIPHqkAwmDuGalI+PWM0GPNUmh+CXDY1
	RyjICE0nDVCRPViAo+BPloWMD/86SnznhI15wMz0Tmy4OiB/g9r92FR6bTWFxh9J
	YnBKsUogQHH97pi8A17oeJcD1+oiKS0s3Jd9NxsYGIso1Q8EoJtnYAAW2oNlQOpT
	Y9/ue+bQSz+GImBpr21vn6Mj+CDHyhxE+E/dsur2rG7FLuAvm20gH7EY1xXWZ57J
	DXUeIeO0EcR3soAygvi5jGUkHnkogNkVbfiIS9UIB7ovcZcfUKyzKQanps3hFS/S
	zvguHA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d0n5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:57:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103db79014so8168116d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984643; x=1790589443; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pdKtn8acBsq2JOdFmvVRGdiivlSG6ckujHZOGMugqVM=;
        b=LN1QdwyyZ2d9rj1bYBzDpS0js/1u3y3QlbA5JJjMPxmgwjw/NMrqXj54e7fuxUSqHd
         sEf64G30OKhqE7YzFM1IoO/ckeKYrciUcbsckxhm+vO85V33HNxg5QQh1ve8zt9h+A9X
         QvdFA++FanDmJLYu/vFMym6VXXmwhGK9p+Un49MTRprrQb/aqnsI4bHYk2ECh1Lz7TpC
         4gaWjMjV18o8Ax0H+TF8kvnowDDVB/rO/794L6FgK8jgy4y7OnL3U4tW2OPQ4dEG+jJW
         guiyV2kw2fXIRdJeQVlwRk4bDyVks04rAuBjXTQZ9X327mYmRvNKxd8PLIw1rXcpqtYv
         flNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984643; x=1790589443;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pdKtn8acBsq2JOdFmvVRGdiivlSG6ckujHZOGMugqVM=;
        b=EeqAPC4aLh3w+A/nfYrNAPru/1mZEJVBLYCIlEhxKPlG8y1radeJWTGYcewzlDH/mc
         bgF98Rr9Ax7tlRg2R7KECR2M4ZHFTcHOxYm7lUJpd5lfYzRN7zNi4sNTuy0duYDqj3yl
         iw8iAWR5saj+ndSAbVN6AVtcrHfFla4+W+d5oLQYqNPDsJwh9gr7JmS+qJvM7+V73Csb
         /SPjPZRwgY/zmhoLB7zNKhm0zpeevny/ypMq+vnL8wyqBhpK6Wte4IvRxDenG7YahcD0
         brHeCLAwOQSr7/1YBrQOy+IcWeogxCmoMkrPqdd7edNFvFvllqL9/2C0wC1kOXYs7+pB
         JJdw==
X-Forwarded-Encrypted: i=1; AKwUvBy/YiJh3bMlVSh82eM1Gu9OLMNmXlVPQazkkoTXaDe34TnuE2LsgLsm+8m2NrYrV6KnJsehys5Kx1Hxq/U=@vger.kernel.org
X-Gm-Message-State: AFuF++nk7LXrMHD1rJT+UL6XhKpETMwWZ0NFh3nA6DB3fjUVIOarYUgO
	6xRUO+CkEjqWbdDUzhjHqTs0PMRROHZ/jYhct+K+Qcn05vdzgIhBTjFQ5CiWW6XdQi1WkJnwlXt
	5hg9q5JuhtmXrZZPm9f5zjKg3ZrfuIQHjxFRv14t+WaFwva6ZXXq5b+ZRVj5Qq70kNRg=
X-Gm-Gg: AYBFou2gyhoRhfXL3sWa1jdq7GR35M23uLLxMM8xXPdw+PGIZjllPHJQ6uDUmUTLDte
	FzKK1riPVMbwxn9+/WqCFd2sNM6pPVLQwdPGBePBHx32zP6fBKIj9L79uiJbahE4P7NTw+znkfh
	1of+QqLHSsrUzyog7cctlSLXWrPlMbMjUY5DYT3keEV4xgdzdWhBVrYe7jbt3cDYcSzyNpmv42v
	Qz3yXWO6L9+HmpaAtRsFBjtcqBwUkYg31Wj68v4V9+D5ZewdaCYtMc5bbY6Ls0lWEH2idt0Prd9
	oKwmkFyfPfVqvrJgiub9lRbsGnNyYf5/gWnPVZ/K2AuHNIzQ7xa4dTTp4PG42+Q9knuaw6+60EG
	tsb0PRI+T39z/YdwACjPhGw==
X-Received: by 2002:a05:6214:508d:b0:908:2053:b57b with SMTP id 6a1803df08f44-912a806b654mr101725946d6.5.1789984642742;
        Mon, 21 Sep 2026 02:57:22 -0700 (PDT)
X-Received: by 2002:a05:6214:508d:b0:908:2053:b57b with SMTP id 6a1803df08f44-912a806b654mr101725746d6.5.1789984642376;
        Mon, 21 Sep 2026 02:57:22 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dde9dasm3891933a12.21.2026.09.21.02.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 02:57:21 -0700 (PDT)
Message-ID: <c24937ff-e88c-4e64-8eda-0b13a8e52f79@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 11:57:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] soc: qcom: rpmh-rsc: Output debug information from
 RSC
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Raju P.L.S.S.S.N" <quic_rplsssn@quicinc.com>
References: <20260913-rpmh-timeout-debug-v1-v4-0-e94d3e416ea1@oss.qualcomm.com>
 <20260913-rpmh-timeout-debug-v1-v4-3-e94d3e416ea1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260913-rpmh-timeout-debug-v1-v4-3-e94d3e416ea1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oMXFqPXkGYbVlbtL3wEJ76B_AohUswgp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MyBTYWx0ZWRfX05COjQ11InbS
 8fyTVffHEvEyqMkEimsThJ0/tnETKgKmWFJ1refer6O1V7Olha2JzcyQ+dkPLPlSkHlUFCUaZZ5
 Ui0RixdUX74HBLJ2FMW9ZBzi3h073+A=
X-Proofpoint-GUID: oMXFqPXkGYbVlbtL3wEJ76B_AohUswgp
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab0ff83 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=LpQP-O61AAAA:8 a=Iuay5Xm-iJaJg3NLcAoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MyBTYWx0ZWRfX6oIdOQvanCLN
 T/Cz0A0XKf/xRz64kk7LLJjGrTPh2ONL8mxyPgCyOnOZdQjNgvn1GTrxDHDp+X/sOXWiJ75dz2Y
 U8nWYUNt9wjyhkbjS4pqAzRH2mbkW2i7wto4+P1NXv3QuLIqmrZmPEJ9E83enkSNFlz3u7TKFmv
 4wYUdAhCRdzhRovfjJyt2sUZlXqeKfJnfg6CybJPGdLup/cgQf4vhnJxOZubce7O5MsQ7mtwz17
 +Lu/lxaGsmFMBpM86wnPsKbKdKJYG5wxwdDE3IaF7o5KNf8d8H60OmJxZMkTG54gTbwN76yI1hw
 s8iNl/129k0RObpQqwnyYR/KUIsA62ALNO2C/PTSVgWjRuh1dX/PEggECpJS4HDnNH8xBGVZMNc
 lC0unyIl0/7/+jlhxWns5E4fvxxl0vgUyDf6Wjn6tOORQhtzDEnHhBDPFPewz0h0rrPiZfmX9Gq
 9VqaFUx6Yhrx20502WA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210143

On 9/13/26 2:54 PM, Maulik Shah wrote:
> From: "Raju P.L.S.S.S.N" <rplsssn@codeaurora.org>
> 
> When an RPMh transfer times out there is no visibility into which
> TCS was stuck, what commands it was carrying, or whether the
> completion IRQ was pending at the GIC. Add rpmh_rsc_debug() to
> capture this state at timeout:

Some feedback from GPT

[...]

> +print_tcs_data:
> +	/* All TCSes on a given RSC have the same number of commands per TCS. */
> +	for_each_set_bit(i, &cmds_enabled, drv->tcs[0].ncpt) {
> +		addr = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_ADDR], tcs_id, i);
> +		data = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_DATA], tcs_id, i);
> +		msgid = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_MSGID], tcs_id, i);
> +		sts = read_tcs_cmd(drv, drv->regs[RSC_DRV_CMD_STATUS], tcs_id, i);
> +		cmd_db_read_name(addr, rname, sizeof(rname));

This call may fail and must be checked

[...]

> +void rpmh_rsc_debug(struct rsc_drv *drv, struct completion *compl)
> +{
> +	struct irq_data *rsc_irq_data = irq_get_irq_data(drv->irq);
> +	bool gic_irq_sts, aoss_irq_sts = false;
> +	int i, busy = 0;
> +
> +	dev_err(drv->dev, "Timeout on RSC %s\n", drv->name);
> +
> +	for (i = 0; i < drv->num_tcs; i++) {
> +		if (!test_bit(i, drv->tcs_in_use))
> +			continue;
> +		busy++;
> +		print_tcs_info(drv, i, &aoss_irq_sts);

2. P2 — Patch 3 retains only the last TCS’s AOSS completion state  
   rpmh_rsc_debug() iterates all in-use TCSes, but print_tcs_info() assigns
   rather than accumulates:
*aoss_irq_sts = !!(irq_sts & BIT(tcs_id));

> +	}
> +
> +	if (!rsc_irq_data) {
> +		dev_err(drv->dev, "No IRQ data for RSC:%s\n", drv->name);
> +		return;
> +	}
> +
> +	irq_get_irqchip_state(drv->irq, IRQCHIP_STATE_PENDING, &gic_irq_sts);

This call can reportedly also fail 

Konrad
