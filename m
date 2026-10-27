Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090073;
	b=tolTPsNuUtkgc6JeiH0Yx8yijs780NzMJIzsIIKzuRdgKizYriXNL7FrNfaKrMIGtyhA
	 2UUhsH6OWJEPHJVc6ANcpM3SDkz/MpiXo4+XylsXA6LGPXLd7o3XrlW8VcIqcTvMRlNop
	 RIWGsLNEpzGGtew1wh1VEnNQhXZjR9yyE34jWEGv88nOBC9w5M6I9id7fmUWYw3aeHlxc
	 vGeACXTb0OYZWDdvxv0Ev/0I5wGfZrP+CgE9imZrPyZh0ybNDpab7RZ9DYxJmJiU1hduk
	 CL1dsUlgtRdkD63XrUepfpXB9mIZ8ThHewJSnwneabPRoYQ31izJ0XK1Bl6Zr6l3TPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090073;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=;
	b=KLtkgryAwt2x62uN8VsK3O4lshm58pcML+VVCLxVrCbvnMAQ0dMrbYU+QA6qKqkV7WEr
	 xv2SSZeXRj9a2FqdU46VFjZW3sq0JnwmaBOCZt3YzhsfBYEN6oN13kHfuO1ODJimbrJ4z
	 TFf7RvwqKhnGcjluyOE+qGRCOpOMHvd8fjXu2kJw7V4WBQe1p5cf7QmfdkDyxCsYqEIaj
	 pXHwHK88ahauRODltppRxlt61/tZZUINft68IvpHKZCRxY7RLc5jKOWsX8Gc7vCz4l0Pu
	 I8EvP/F3JGZLLwOv6OC6tIufAMoAqmD8RxZRkMbdQwRTDVjc4iac7YOdhNC2pp4trUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kF5My7A2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZ3Opre;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E41F606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E41F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kF5My7A2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WkZ3Opre
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZJ0g3950119
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:34:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=; b=kF5My7A2IRd6QUBi
	LDTYgdiZ/J3U/lZ/GtNQZpoNmIiPeD/WZfJ2vEo+v5WVHLqxlGvePKQH8aOLYeB/
	JNQ7aOJzzqefKSquofAmkbedrb5n2jlEQvZSxXa9tkajc+Ku2+BqMjz9IkEb/9tP
	CjgoVSDwqgLw1/H/4j6gu45p5MUH/4XoiH4djvxfGAhaZ+txFJ6DRxcLm0wmE8Pz
	Ii0eD6WaM92n9RQdEqhrgpBocvY90oLPn1OX5k0n/AzxtGukDq8xYvipujlZrbnw
	F1Owy/Qb1vLiVqIARITwyXQvCI33laY3SizEWol549pAazrsgAN0gBvGIN67KjM0
	eAWY5g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jvaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:34:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e05d31e54so2661157b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 01:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090072; x=1793694872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=;
        b=WkZ3OpreAQb8BVy4LA27hGCZAGNgGCGbi9Jl4i3eoSIA6QinNB6dw+zEiuvI7fNM3q
         5O2LqR65CO1qNKs+POfMM+gzrAWr/4+HhI+uS0TchA2wGexh71gZLwm4uklTkuoD+xVx
         /xNmU1n/tk9eJNUpftST7IGfm3BNLY0a/7qgMMS/T4WAPoBpBQLuNx2Bx9i/yPqC+NPP
         t1zRBMmcgaj8VL9NkU0KzUCfvjDb/GVcM9R3XFgqbxf1Fn82nr9Wiwt+PZazKDshTpq2
         qwo90GDjXXCDkbYkgD/J4UBnRvRl+cY7wifGAWBexIQfUEa4XAblu9MzZqcCVukmYq0e
         MizA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090072; x=1793694872;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wrQkMaK+dW/8z6fl3qfa+S+gShoibCmJmmER0g7vrM=;
        b=stWiKiWYtC1KxzueTIsKTyTCss5mGPZ8ebIHbOyI2Ycos8JxYb5Rf6ZLdjy5aDuEMA
         5uj6d2D9rgbl7owwZEdrHCy2gh4TEM6xCbQ5jvmBf01Exq4Tda/o0M1YUQaDlsNTywkR
         I2UcgbhgZdtL0i15SykeB2nE9ZIRzGCGzmllrWHLJSA6FjYzNarMRBtmuEBztrQkH0Y9
         SHTxGsrEoXhKV0zHITPaesugZ1oNuna6vPxSlLG5VzHklE8mlJeCndC5fNe5uZhddFxs
         bbBJSnEi6uRmsULjZ5gklJLLOaQ1Ssd0DiWpOYUQGRCoME89yeTArzYbbeDp4uRiMCrm
         QedQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLI2J1wz4r4UsUmJHxqCMjL4Nkylor6+QJDhLrERsiYadeXwXn4kiLTZ2qeQyXZm4a9kzDRKeCvhRTgaM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKX20wa4shi51iwRfpJvZ5WfYzj7pt5L8fsAitDGoCwLkgJBbh5
	RLy0KPDI7PfKWDaLypSVyQJBDs8xgfE5nUrUOENEQ8P2UilXlu+QASKusWA5BvM95h7SUml46c4
	iuRSbGU4qdrFEalxv4lV20Q/j4ykHbPymVHhGmqCMMODRrbs9aqTfc7IYspq01FqjFfA=
X-Gm-Gg: AYBFou1bbETZY/lQoeNNEzSz1dDKnUrZE7fjMfdNi6esjnAlmaGjbycNb92gcU730dw
	IQ9ya7CLC8gF1ADI+rue2bDbCMfovj3offscVwrOZjhzw22bQzFVKDsLxVVDkA+idezlzc0bLiu
	6NgNCiDEEUKmNdulRLRUTxxSz1RwvAdriepKMkwQ2g+oefj+GJl55R4hSo6V2N5vE+D+vipNge8
	77paEK2+UdFCxhiGYfVfIdes2KLYhbeHjwc/6mv5oAwq0gnlzPvT1SAOAbcsYkTSbMYk9a0nMB2
	QA65ugxJjEVdPUHgozCYHCav06blGg0U5RApWPr++4lkWhcHJrZuFB1kkulPr8pqCHTew08ggT1
	Vu1rYNw+Y4jGzzUVpgeHkg8JGnERTb++nbIOoWwALGYjkJtLI7JP246dKJkdcx1FJQXVdIHLORw
	==
X-Received: by 2002:a05:6a00:1889:b0:89e:7bfa:f884 with SMTP id d2e1a72fcca58-8a367a3cf01mr7107763b3a.18.1793090071590;
        Tue, 27 Oct 2026 01:34:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:1889:b0:89e:7bfa:f884 with SMTP id d2e1a72fcca58-8a367a3cf01mr7107751b3a.18.1793090071132;
        Tue, 27 Oct 2026 01:34:31 -0700 (PDT)
Received: from [10.133.33.161] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2119266b3a.7.2026.10.27.01.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:34:30 -0700 (PDT)
Message-ID: <87eb6978-74fe-4ec6-b76a-b09210ceea7a@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 16:34:27 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix lost 5 GHz range by
 tracking reg ranges per radio
To: Ahmed Essam <mrmrmidoessam@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Shenghan Gao <gsh20040816@gmail.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        stable@vger.kernel.org
References: <bbd65b93-816b-427b-8abe-1d1fd1cf4e70@oss.qualcomm.com>
 <20261027015919.277156-1-mrmrmidoessam@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261027015919.277156-1-mrmrmidoessam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX8r3zfNRUj/rc
 YlL3gaw6jbUcbz8yKS+ppOOWbRUGinqOJmzqnVcG+VCpuTC0RcM3DOThWkyL97SMVG7cymwAjzU
 prKxm+tDOwcegFiL2FwTSWTCAZMpj5Q=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae06218 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JLF8xD7Yat_ry6Ihdo8A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: KEQbnpSPNqQO2Uwdc7ayoRaS20FSCDYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzMyBTYWx0ZWRfX9bCZZ87s9SXT
 NG+hSx2wqBl+AF0azJTGWEwS7sg4Q8rePAX3l5/kriedIYH+TXCiIIsqKhVJJxjQ3tygUr2lHul
 Yu9z5xAi0uivh7NWfjQdHZ63I9C4xMYbDcQE9hVQKzXTK9iLbpdwtBJcowgYh8x3i+95VUcqCfC
 w1Q2Kl2SJhhrlzAYNVao7l7Myw//hqc6oUnDInwRhbLv27sh81cqv8OjY8Li/GFXBaoN6CzlJxc
 BcXDxter5UxlCyJdK5EAajarJc7e6xqexyUTr8KdDDkSm6bBbFNHYvhn+3cEPRaQBod2T9YEqQp
 oaY3+2RTGyu0l8tXKbtd/CpqtCrflbf3Qfx0REFFTV2Cq9oDNhQgjvhO+nYlhkBv7XX6844ZASm
 YS5BTF4tD5M75sX04uC7GoyCuW+EJjJOGFSk/5sbORxfg1Dz0jS5mjR7JdZW6Oh4UKJriJMyzvt
 ApeEzoU0jI4X2ngZLuA==
X-Proofpoint-GUID: KEQbnpSPNqQO2Uwdc7ayoRaS20FSCDYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270033



On 10/27/2026 9:59 AM, Ahmed Essam wrote:
> ath12k_reg_build_regd() records the frequency span covered by the
> received reg rules in ab->reg_freq_{2,5,6}ghz. Those fields live in
> struct ath12k_base, but firmware sends WMI_REG_CHAN_LIST_CC_EXT per
> radio, and ath12k_regd_update() uses them to compute the frequency
> range of a single radio (ar->freq_range). This causes two problems.
> 
> First, ath12k_regd_update() cannot tell which bands a radio received
> rules for, so it uses ar->supports_6ghz as a proxy: the 5 GHz range is
> skipped for any radio that supports 6 GHz. That is only valid for
> split-pdev devices. On single-pdev devices such as WCN7850 one radio
> covers 2 GHz, 5 GHz and 6 GHz. When firmware switches to a country
> without 6 GHz rules, for example after an 11d update to CN or EG,
> ar->freq_range collapses to 2402-2482 MHz and
> ath12k_reg_update_chan_list() drops every 5 GHz channel from the list
> sent to firmware. From then on firmware no longer scans 5 GHz, a
> 5 GHz-only scan request fails ("received scan start failure event"),
> and 5 GHz networks disappear from scan results, typically shortly after
> boot. They stay gone until the driver is reloaded or firmware moves to
> a country that has 6 GHz rules.
> 
> Second, by code inspection, build_regd() resets all three per-device
> ranges on every event, so on multi-radio devices an event for one radio
> can wipe the range of another radio whose regd_update_work has not run
> yet, silently dropping a band.
> 
> Move reg_freq_{2,5,6}ghz into struct ath12k_pdev and fill them for the
> radio identified by reg_info->phy_id. In ath12k_regd_update(), include
> a band only if this radio registered that band and received reg rules
> for it, instead of guessing from ar->supports_6ghz. Checking the
> registered band is needed because a radio can receive rules for bands
> it does not operate on, e.g. the 6 GHz radio of a split-pdev device.
> 
> Also fix the reg_cap lookup for single-pdev devices: pdev->cap.band[]
> is indexed by enum nl80211_band, but was indexed with the
> WMI_HOST_WLAN_*_CAP bit flags, so the 2 GHz lookup used the 5 GHz
> entry and the 5 GHz lookup used the unset 60 GHz entry. Refresh
> reg_cap for the 6 GHz band as well, as is done for 2 GHz and 5 GHz.
> 
> With ATH12K_DBG_MAC enabled on WCN7850 and the firmware switching to
> EG, the range before this change is:
> 
>   mac pdev 0 freq limit updated. New range 2402->2482 MHz
> 
> and after it:
> 
>   mac pdev 0 freq limit updated. New range 2402->2482 MHz
>   mac pdev 0 freq limit updated. New range 2402->5330 MHz
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Fixes: 657b0c72c4ad ("wifi: ath12k: Fix frequency range in driver")
> Fixes: 13324cecbb2c ("wifi: ath12k: Update frequency range if reg rules changes")
> Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
> Cc: stable@vger.kernel.org
> Reported-by: Shenghan Gao <gsh20040816@gmail.com>
> Closes: https://lore.kernel.org/all/20260715065218.41232-1-gsh20040816@gmail.com/
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Assisted-by: Claude:claude-opus-5-5 sparse
> Signed-off-by: Ahmed Essam <mrmrmidoessam@gmail.com>

Ah, I have an almost-identical fix pending internal review, but I think yours is better.
Thanks.

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

