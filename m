Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794424959;
	b=1AxVNRzIfBa+gCdnahZWIJibpmWf0IjMFKVuhh6VhaYRDAAkZS0PSneIF42dlWMPZ3IM
	 RQbPSoZS+TMUBCwJz3ugoYlhozyp5tnvJIWsePWrd4Ti2biOgBVrg137QY2xJO905QC2F
	 Ahe44s/t/IimI27zCCMHgJJz8xu+dBtYq9cB3KBwMXT7uyzsezurjItSQwG23iPeATJb9
	 CeaC1DTa/VOtJcV2k7Fl1T4/FMfWWhII48JNB46ceB/bo19g6up9h6p60cTqfj4uIAnFp
	 uTe52bu/mV2aEgMVy5kCVbP8ndz/+NG+Gy9p6EXk/zigDUXyNkevV5J46dEVLcgy1zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794424959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=;
	b=znUeFriZJ7fUySXe8SIv8swewFIjX2owZyIYCnlATCZYmGs66Meho7U8VjDsn1NiqwCg
	 O8tP39+i8l+HNUZWvRqmXTXxByTlCbIHZIi1rNt2PZTXRYNmTcrQ/DFyleb6f8hgD9eNC
	 IvwZDbHYkOdZS6oOOfjmrE3d0x+emXzBtRuYEzipnIe+swXOBLo3w0OKlTUpgBkZVHbsG
	 HRgaPP++61OuPXEiWciZzbE52ot3Kd7SBPsi2OrRTmAy6kSijrsWQ1K1WxiETZAt57O+t
	 dyFxkXJJKUWnpkPv8EYsM76RYjwnOl576nLW+IyjO14jEEYSk5HS4pMUUKpEgTzVvfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6cnb6rt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gwPKPIay;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E37606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E37606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a6cnb6rt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gwPKPIay
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIp56W1141755
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=; b=a6cnb6rtjgtl9v5k
	zwR8A7DkvUbAkut5S7wJvi8kO4xkz7knxYDT1LfMk8y33eE4Ip1dh0ufrudEFW7S
	UEAgl/+waZYamYSv/1vNP87MnWieZVH6sJHzayXjf81wM3SyuP8hF/OXnF3GtfgV
	c6RUbaupg9tfyaPFjJFVO3eN0TCuuo2XD8WGZo2YekeSEQc9IehNGDaHD3gzF0Kf
	nBEkl4zkEvaLE4/emMURa3So9/KiwroM2gkPwUm4oUVUIlk49vQl6RMVuuXQdr/Q
	LT4EgY/TAIimtftkQavM+XsX6SB/JZ+vxoehs89OUisn05V2iC7S0NElPjjf/Lw8
	NI9ReA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjta84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 19:22:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f26e6abe9so5301583eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794424957; x=1795029757; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=;
        b=gwPKPIayP4tlurdE6bKoRAf0yWHwf6bPts3+foXWrYuPofxU7YrJqYuxdPWDkuVgDK
         a4qzvR8Wum0bAlRYf3UgiPavOeBGgf2fp6SgI5pIZShzhRflkG7LT/UN9MyXHfNUdrZo
         hNstLmUKb/lsHq/AJN/rPSY8sG3iSTkla7tR+MTvjRbirQ0CF+2AQ9CONkbnXwb2POrW
         kMLkcNU/NT/ZuhDFjiV7LukysmZbPhQ2z4F/5CVrUwR2qzOQ0g5g7ocWEqWwV9FaTPcS
         hD/SeIP5MpSYdClmhd/w+1CUY3M90eRvTore2vhwvO/Jy8mL0W2P3oRF1+rLQ+3H85og
         G2Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794424957; x=1795029757;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ReekrPpGktMFuSDQYs4o53/ZO85RZPgLvI6NpbtxPhc=;
        b=RWxNVub4zF41VUBGuP4m+JMS2vOnEXRH6yS5xCJjb76AO0nPKDYRs90Nhe5YDBgp+m
         UBhTAx3Yd6xl52IXGuh86UMO1XOn6La/4aCBocVLQ6Kt2ude/N2hIDVcYQ7ttn6oPpaJ
         1bLFSAGELkEFfdpGt+JW1VbOP34qn0lu+PcqDqQ0vP2EsjcjOER5IQ0gj8FpXbf3mCRk
         s1JHZ/JvIzEGXa+s7nloMOCYruZ6Jv7TUr5Ob/7ishSof0Fl29Fg+eJUxBxqd7MzUxgC
         T8zx294RxWBFeDDqZBxZYw8BqVhWctU8XVp8CQ2wiKK06PcgaSHGdM31sPi/Z+73U3J8
         jFLQ==
X-Forwarded-Encrypted: i=1; AL+hErGg+OUGemKDmRAVyigCanjR42/aFV8NOcr+yNQSZKLIAD/ebmvjodC2X1YpSPhfduxEcmaKJHjoTNzwqwA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Gbvse5i6Ao81z6Pzi3eaKN4cxaGTjKoeOWC1Cl1FSfU9oXy4j
	H3VHImeRKV+5iki/FxZUK4erRdh8YevtpNerDTiAT4lQ1yODHYhFWpqhxUv4hlZW4dtVwqFnFc5
	qigKoNqAAnLihT+V6Bwiw8/isrDy3xKLh25qc57Kr9RaWr018IAux5+hpAR8gNRTnag8=
X-Gm-Gg: AYBFou35Fe7rLmoiOvRFa7lhw9efKjEc3N8QT8816jXdawiiaXbaC8RNhh62n1LzkpE
	JvjQ73xvhPoiv8jpT9+wDSh0wIRG6VCi0jAmG4Kzc8FcFSPjBULz6P1NbN4yPov8IEXsKqtKUkv
	e/XZsIZWcUmRUxuMv5EXGlg3VYX7Jg6IDHhxHLHTLRM+e48xj2MYo8Mj/nljP/KDXBbK1ZN7x0d
	KCxkt9cxJfUfFlDBzSsP7iQK7EGor01Jy9O0TSGl//w+tq+UXZAsgFEsQmw7HBD4X0dv6OZVlRm
	gwUl48fne3xC896ZplM2Vtv4CKMVo5s2M64K3zCy9e17DAw2ydDUSUZqdyf1ks9l44BDS2CEcnf
	8OMvDPiUcsVXq61Gfz/O1TJdcqLOitQ4GfL8btYMe9cQ/uS9Ad8XJeRDpTFwueEuwMV45D06yam
	IQWEh14pUvlQs=
X-Received: by 2002:a05:693c:87c4:10b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-376867551b7mr3870115eec.31.1794424956325;
        Wed, 11 Nov 2026 11:22:36 -0800 (PST)
X-Received: by 2002:a05:693c:87c4:10b0:36f:9d8:4a33 with SMTP id 5a478bee46e88-376867551b7mr3870085eec.31.1794424955755;
        Wed, 11 Nov 2026 11:22:35 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm17793328eec.12.2026.11.11.11.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:22:35 -0800 (PST)
Date: Thu, 12 Nov 2026 00:52:27 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v12 0/6] Enable ICE clock scaling
Message-ID: <avTAcw+DZtJ7bSTG@hu-arakshit-hyd.qualcomm.com>
References: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260824-enable-ice-clock-scaling-v12-0-09271f583dc6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NyBTYWx0ZWRfX6klJW2/sQQmA
 TuSYc9iG4UheVDBaVUcapAqv39mSKgfZwGoevGD7CdYj1nVoT09JZk1PgMTMt1Lz+/tZ0QGr+Tw
 in5hKp0rOtQWL3ksnx1FwPyC4jT/ISOESM3Ek78K89rmHQdohtN4AAp2APKI0WyXLFAQ202wAqA
 8GWPomdc7pYwh4ia1HhCfbQ2DTnnRuCJzU759UmtFbSa221hrUU/NIi0OCcTeWgy6BbWK1/5RtZ
 j+4ajJ3jye4Pd+cTdmSV5Fcao5nuzCrTCmkbi/zdgE8L8UjVjy8OTTMJJfOrOF+YdX9j0exuvzS
 KNhX5H3VtrP0gCAPQ16hQmiw0xkPvoUSKaKkrg/Y+Fzl9ZHf6cr4gj04o2Wb+jTkMO35FZ29l87
 XXy//msg0BXAkrFFUv4wK4JttJTdqoxbmanEM7vgSeCdy4BcYaF/HxefW686YS1PqtFC7nMaEA1
 SImMQBMAxUvcL+TvFPw==
X-Proofpoint-ORIG-GUID: sutgCUHG-Wsyz68fm_2ptnr3u6YOgXZy
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af4c07d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FeIq2xlXlOKQ0BwA5tkA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: sutgCUHG-Wsyz68fm_2ptnr3u6YOgXZy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NyBTYWx0ZWRfX/OBur3l2BmiA
 kpXPehBXXA2EdIRxmK9xiawBb6wdWKCK0ZAh3fvCbM9s0cFBYi6tXdg/NqMBjOZQ5sjCxNZ6KkZ
 JCSjs6szE3rlkB/CiKvxFw99zNKXsXw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110077

On Mon, Aug 24, 2026 at 01:17:37AM +0530, Abhinaba Rakshit wrote:
> Introduce support for dynamic clock scaling of the ICE (Inline Crypto Engine)
> using the OPP framework. During ICE device probe, the driver now attempts to
> parse an optional OPP table from the ICE-specific device tree node for 
> DVFS-aware operations. API qcom_ice_scale_clk is exposed by ICE driver
> and is invoked by UFS host controller driver in response to clock scaling
> requests, ensuring coordination between ICE and host controller.
> 
> For MMC controllers that do not support clock scaling, the ICE clock frequency
> is kept aligned with the MMC controller’s clock rate (TURBO) to ensure
> consistent operation.
> 
> Dynamic clock scaling based on OPP tables enables better power-performance
> trade-offs. By adjusting ICE clock frequencies according to workload and power
> constraints, the system can achieve higher throughput when needed and 
> reduce power consumption during idle or low-load conditions.
> 
> The OPP table remains optional, absence of the table will not cause
> probe failure. However, in the absence of an OPP table, ICE clocks will
> remain at their default rates, which may limit performance under
> high-load scenarios or prevent performance optimizations during idle periods.
> 
> Testing:
> * dtbs_check
> * Validated on Rb3Gen2, qcs8300-ride-sx and LeMans-evk
> 
> Merge Order and Dependencies
> ============================
> 
> Patch 2 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
> Patch 3 is dependent on patch 1 for the qcom_ice_scale_clk() API to be available.
> 
> Due to dependency, all patches should go through Qcom SoC tree.
> 
> This patchset supersedes earlier ICE clock scaling series (v1–v11) with updated dependencies.
> Hence, this patchset also *Depends-On* the following patchseries:
> 
> [1] Enable sdhc inline crypto engine for kodiak and monaco
>     https://lore.kernel.org/all/20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com/
> 
> Similar to patchset v11, patchset v12 is rebased on top of latest changes picked onto linux-next.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>

Hello Bjorn,

This series has been posted for a while now and I don't see any outstanding review comments on it.
Could you pick it up into your tree for next RC?

Although the series reads as a feature enablement, it's addressing a real regression: on several chipsets,
turning on the Inline Crypto Engine today causes a significant storage throughput drop without this
series applied.

For example:
Without ICE:         Sequential Read:  220 MB/s,     Sequential Write: 310 MB/s
With ICE enabled:    Sequential Read:  143.717 MB/s, Sequential Write: 126.762 MB/s

That's roughly a 35-60% drop in throughput (averaging ~50%). This series is what makes ICE usable without
that penalty, so merging it would let anyone enabling ICE today actually get the performance it's meant
to provide.

Abhinaba Rakshit
