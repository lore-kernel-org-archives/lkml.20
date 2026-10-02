Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD051342C80
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790966425; cv=none; b=OrjKizYsXzd7FoTARLsxGyhRzarkjD9o/Ggq7fu0ANA2HCpWxhVBC2qlK3+nbS2dszuC//kBECVEgJyQWXV86XkM8uutslxypK9zDFwmE8DmdVkprv1NG+93571BVxgoYgziIxlgzGZfIEuKGwZ07MQ0bkWIx9/OQXg+Bb88rhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790966425; c=relaxed/simple;
	bh=B4QCi8SM1E6HBMBo4DshVMCnb6Z/I0iVnzwIIrgKkHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jzYR6y1U8sWNnLWkEcZwMFOI2Ne2A0tzpM5cdMKk3P+rIPcFgpoVDnJvtX57MWrwjFFCEXNryK+zhNKAwgRP8bvsAKvHIzDG55ew/f/uDkOk4WuSODcPo9wvWrOTmT6TTVkKwrE3YptAnXxegiQ/7Fv1bmyuIce6s0JJc/gQzxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcEZEJ2s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q17Uys5c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcEZEJ2s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q17Uys5c"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692H6Opk1675873
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 18:40:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B4QCi8SM1E6HBMBo4DshVMCnb6Z/I0iVnzwIIrgKkHQ=; b=pcEZEJ2sS9XR/64T
	1gmJDPOBtXhzhujZYM+wZI8eoM9W7Y7KijDKiCanKNgI8flWiL1u1y9971QMhXgE
	Vm51JcX6b6wWXmVsmweoP4+f9UWAQqDwN3TQQ8RZC0GI7JdbrYFiAGerUFo4BMNu
	W5oAkn4Wp8+fD77+d93QWE4k0LvEZdhw6Q0tKuVrtBi68JTVGYt0jdk0GhyaXz36
	Kvi7LbFiLDpocsAaPpQQj0q/fp985ol2y4YVi7+2T8XVpAhPafqnDEsZPTevgfOv
	v245w7rNPDXpa3y72ifOEetTU+UiRXzJkGWlkjrnzTB6lkr6tgMT9UUGb2oDFObP
	bi62iw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8rnhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 18:40:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438719cc1eso9452117c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 11:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790966421; x=1791571221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B4QCi8SM1E6HBMBo4DshVMCnb6Z/I0iVnzwIIrgKkHQ=;
        b=Q17Uys5cLAVO2KpUKq0Cux/8vJ5c5tk28OolPFXHIc/yosT20wMU5tc11hzkRYThfW
         HRhGabS+r3aMCyGTGJ6kg9hiGDENKx74AtZT1NaiEYhjKsIhp+9s6R1jzlPieKZxv1VA
         i31ONU33j8ClDYFPjNj7wBODLXNOQ33uEz1NmKawT3zyZalAD+HddZB2oTRfsYsW87rB
         lLjQ+nKUWkxvynaBOpAPzBWzeAQ1iyoHIYKKl6Y5rBGR0B05x74zA6dqB2pZzXDgNVNW
         kDR5kEEwmgYw0b2GN7HiCX0RX/PY7GNIaEyzwBACG2G1cqn+r59jooa4aMXAwd3UJgmz
         S6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790966421; x=1791571221;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B4QCi8SM1E6HBMBo4DshVMCnb6Z/I0iVnzwIIrgKkHQ=;
        b=IwUdUmhpnt19cYeWCE7GGamrJN+2M7Okppcc3W32e/oY1dIv1FgwYpAnDkBXpHphSo
         5X/sEKmKeyj/3si4bEDhbnC15/RQdVhYGX5RyihkuTTJjZN0gg/wdpmzNqrcDIF2Z2Pi
         bkQg67QZr4iuRvtX7N84g2Ygu8rBwmCWKLIk7JpH5d5MDLQSdhDCqIXhClwMKAnB0845
         suzrY4Z+F9hLNAfjzlJ28i+VNiPPXWMX0P6UqtN3XcZNiqiG780ln8tsylNNzZdQqYhe
         fu28VS+QbYQQ4PMQExituiEAJTrUaJAHd5d4oedX9EO4nCdpYqvmLxNtlK7NTfFNk0fB
         lE4w==
X-Forwarded-Encrypted: i=1; AKwUvBzlfq+kUIa20TYA9xITjWuVjTtty4KOZgiXr8ZOs5DVAnU+Xk3GKqRrjZAb47/5WRHq3AhWT+k7DQclycQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mU2bDpW9mqqQZRCtogyxTol0TU2ltUDCrSx9pCKFCWK2eCtU/q
	NGLNXibVWhaTnu2ZejMk/lnOhevfvs5IocKlmMbYfFXBbc/6Rx5MIUtzEGxyQlrYg1o1FzBo9KD
	SITIpLMP4vkGq3H5tDO0YHM2Jez78ujWYP4f6yNtmH65pNdIrUybePRStcc9oqFfktkqwiDoIu8
	Y=
X-Gm-Gg: AYBFou3b7WpKQpUDQtWXX1EqMFb6YOKifBnTb8fpSkTgMDLGIGxBvmHBZvCHbRz7hGD
	ZsJCIGJc6Huh9rjf5djUi3WtNtO3WTbwt9O7W7Ky8w6NBGZNH71s7wVTfVF5PWb1ONnksA+l6YR
	udc1Ju4VR64XbsHrLpvjoQelcctwuzX/5SPOT/drNVfFsBCimGoFmxtvqvVJ9aEwtwk7cAOc8fl
	M8kqNznwQGMak/EPQNtTXfCpnforMJHWieBMiGaZl/Opdv0wiAb80IOxWkdIDZv/y5BpgW/I3h1
	ngcNgtaDOyl0wG7r2Cjlh07Bym5Zaqag1AZOsL3tgnmxKFQJSIeN3yIknT6bH7z3Ay2kO6+m8Q6
	XC2mWFIj/mupSnsoOi1bkFz+oopL79K6lZvy9J6WhnHQGdk8BrARfqEGER59PnJLe
X-Received: by 2002:a05:701b:458e:20b0:147:5149:d12d with SMTP id a92af1059eb24-151c32d9a9fmr334579c88.18.1790966421470;
        Fri, 02 Oct 2026 11:40:21 -0700 (PDT)
X-Received: by 2002:a05:701b:458e:20b0:147:5149:d12d with SMTP id a92af1059eb24-151c32d9a9fmr334554c88.18.1790966420900;
        Fri, 02 Oct 2026 11:40:20 -0700 (PDT)
Received: from [10.71.40.138] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f46da52aesm6468818c88.10.2026.10.02.11.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 11:40:20 -0700 (PDT)
Message-ID: <1d814431-c01d-4730-ac22-c41f47f93b0e@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 11:40:19 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/3] net/stmmac/dwxgmac: Extend MTL/DMA
 support to 16 queues
To: Jakub Raczynski <j.raczynski@samsung.com>, netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@foss.st.com, linux-kernel@vger.kernel.org,
        k.domagalski@samsung.com, k.tegowski@samsung.com,
        cs0617.lee@samsung.com,
        Abhishek Chauhan <abhishek.chauhan@oss.qualcomm.com>
References: <20260601162537.553512-1-j.raczynski@samsung.com>
 <CGME20260601162618eucas1p14be36902c4948647448160da08aaebc5@eucas1p1.samsung.com>
 <20260601162537.553512-3-j.raczynski@samsung.com>
Content-Language: en-US
From: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
In-Reply-To: <20260601162537.553512-3-j.raczynski@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gTSJuv9hZktB-TsJeq0vkPvp0UaqKsfb
X-Proofpoint-GUID: gTSJuv9hZktB-TsJeq0vkPvp0UaqKsfb
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6abffa96 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=o24aB88WmS8rWKrxVysA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA3NCBTYWx0ZWRfXxLbJSBLw867J
 dlXmJYwwCU/STGZYah72fDTfuxrT6W35J5+CGYLDSxIBt0C63ljc1sES7nxWjMi8mgiQxcC+E/6
 sdSNMLFJ59mtSVeL1ZDFnu5l+SE84XQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA3NCBTYWx0ZWRfX8LG4LV+iVFLk
 lTcBm94cP8/vnWmVaHg5S2/PE0W51IY6G23+NsUE7CUnQE1jFKrQjmSq3zafUrLvU6+dwj/q1jT
 2ltDWjndTsvwjlAX8SdE/RVYe53D01QdliBw0zGCvUPPHZwVHcgMvy6co/eo77bXOK/dc36j3iM
 lzDuV+4znL3HIm31TmkNC8JRf/QMzcNRvs7ehCxQPpIcWsQwRYSVjc2nSwLpF54m5UUodYNF2tV
 Cfy8//CVuPEbt1QEux8kMSRu9II8yE3n0Wsq0vnV/7gisaKCJ+/58IkIpgVqZwa1vs3Lc7l8s1Q
 3PdeQUqEWoFqt8cgJmqnnlJmC4q7yZTxU6yeP/KOEA2/BJBYTvtYLYRFZwcze8HHt+1ozHIkbu+
 nCXMJRUs/yOc4TZtE6KS6DzXnKG376mIPMD+PYVfIVMfGaxMozT9Da/b/sz/m8uPLFQ0hyQKz86
 rOR5NdIbIbXwXh5x27g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020074


On 6/1/2026 9:25 AM, Jakub Raczynski wrote:
> New datasheets for XGMAC (3.20a and 3.40a, depending on product) support up to
> 16 MTL/DMA queues. Before we increase max amount through macro,
> prepare dwxgmac functions to handle that.

Hi Jakub,

We are interested in this change as well. We carry an equivalent
change downstream for a Qualcomm XGMAC-based controller that
implements 12 MTL/DMA queues (MAP0..MAP2), and would be glad to see
this land upstream.

Could you share what the next steps are for this series? Is a v3
planned?

Thanks,
Sagar

