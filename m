Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE173537D0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788421733; cv=none; b=RgCS1+zqeFk09ugoNIE/jsJJVSTWit+Y37wtL+Yi6zcoMPQac7JeIELirHNMREikTcsouXlQVdIHj5xVJkRDozfvDUkQeTRBpOPtDTsdQlKHbq4NYuWvmep3P1ilY0UJotrwlYqHtZhsMq029GZ3VoadSQ8v23TARFeZaaDgVIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788421733; c=relaxed/simple;
	bh=7ijGiS2+wzo4PwNz/evt6IxgRjZZ4JMihlDGZHu76oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcMMc2h3Ipe3A0utYwiQVnnE37YmE6LFmllN8omcQ9EPNullUvcEghRi4E6Eq4mC1GRm1B/0o9/KHWdjlHFIWY2EbcgS13Oldo+eqOXP8HfVO8/IfOmG64GaTH4vNEbVWAzWT9VKc+NjcuxXDZl5qYpI7Uu9esMOD3jb/cZNDJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sco4QHmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RpQqp3yo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sco4QHmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RpQqp3yo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835leFc3176906
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mz1cnQxwXtL2p1I+qlbL81gs
	7OQn/pzuf5bl8EXskxA=; b=Sco4QHmrz6tuR1a2suvlpCxvgAALq1WPq9fZogAk
	w9dejBQ6ae32A1bNP0zTxORjwMchVn2JpmtvuJryBDIYts9tcXJhgt9Vbqz/gVjS
	xGgVDqjg2knRSJAGwrLKgrO3PAQXJz7lFzOlbd/8FKaTG26NGKPfZ2O1ldVKFuld
	sjL2tmJow04q3AD3JUDm6qVGNFSRhg+WsbaM+lhGzirlRE0MCN7MfywdBKpahdiu
	wxoGBXADc6cNmJ8HappuKRxNICRRcFfHcRpn4LBAJDhTdf46AVWKK2jPhW1FcMXH
	aqfWsv6kUp/1yiqCZLyvdMchNWvSLXsCBBqJtUbYSve2Pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemj4v4wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:48:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930b571432fso124248185a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788421730; x=1789026530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mz1cnQxwXtL2p1I+qlbL81gs7OQn/pzuf5bl8EXskxA=;
        b=RpQqp3yojvQJgzvfONzUkhquU50yn1k337SQNN2Qh45IPEieoyc1ej9dsKmLcdriw9
         x4q5ePnHs3mV0+vXTRX9kxbTPtZIsfhpOLeiW1zy7Wioi/L98g058k7CN1h7YUFxbecY
         vtIBs+HIonxWcX1RKOuRdUo2jHhzZwjhGEP2L3FOASbOsSuOOK3TkDvxjc48IEoes9GM
         S4DbXMTq7ehcMplxbCswj/799Gb8CuvsWuHXciB8ulIDlYGxvIhdhvrxj3vj7o9m55Xm
         kI/rpu/jQauHWlEyYsb8vpgTyqKkPHmdpSJtUkkwRREpbOhn0G9Qa96lMNltHJ6CZNfd
         cmRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788421730; x=1789026530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mz1cnQxwXtL2p1I+qlbL81gs7OQn/pzuf5bl8EXskxA=;
        b=aTzY/LwMZirU/tW6iXfyInTaU4xMTh3mgXI43gSXL1COhh0kigQf64yXB4zP4UwWky
         YxMIw85xb9bcIiJMPJS4xTQ0yujqjC4BszgeWTUp+NzslqMb4+XXMkWDTrCxeXE9xihD
         a8PNaIZP9jXf2s76s9QKXn9jJg0zs+t0x34nYHh3mqRuRJ9e9wVbZkhAOaY8LSpuPaN+
         byB3TXaVb6BLlLJxFc/wOTZHsqvOU95e1/0zO4FwFIsplyavlj7VjLvqwz1J9VjXT6BP
         YCSrkBciIXyYFSmPkzEMh9VKL8uWycOqcXgDRKAVYMJXjDZtrUT1v0C2II2pjbmOmjH1
         ZOUw==
X-Forwarded-Encrypted: i=1; AKwUvByOvWLVJXMcVAJSidK3QnHOTmUJZ/dvjEMMzli7lsB2KIDygAu4kRkvs2+RiSDQ6wnTg22gN7fEjjEeaeU=@vger.kernel.org
X-Gm-Message-State: AFuF++mfVTP/3WaIjq+JxYIPGSLqeYAUVnDaY6WPQqG5WOZBI56Q7nzY
	U2KVr87JQwRxAIVL/jv1iwNT2d5bHdO7kuw4fJI4N78lU88A6LtpYVNezO88JEmFFDAihcKsoOg
	P/phWamaZpLaYVaFY/s/XS3UT3NqldQfwHI9k3AeObvH3R9K8LxGKWo7isdm8Fv4FsNE=
X-Gm-Gg: AYBFou1/oRHL6cnpixd4kWqhOpS7HeqOtWjc5+Ihf2Ev7LEHjDe6aRLaBhVdyZ9xXh2
	CKJmQo0pyY8B4NBX6qhHB5DUQ/dXVv5ddhlKxGT7AnNb0yP8SxmCbwkzk3YMNIqwbVDgdhyfGbG
	NS/UdqBRVdlASivWbeXJ8hhh40LS7s1J56SGpSX9otym2bfsCWa/Cox47C5IbHspO08gYWV1rA0
	fszcXu//6xA39PZpT1RkuEO87AzaKfjvVbgErMsNXWLlkhxuRA50OF8yANoxNkMs2GHNYydtaVz
	gue3Si1QW13cmMm2ZRFfExB6xRnEKBWFb0XyeQ6U4/5lYhrMTC45dVPehuBv5pNiOUaaAl1IxC3
	AbwmUzq+FEWkN
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc2mr145314985a.29.1788421729748;
        Thu, 03 Sep 2026 00:48:49 -0700 (PDT)
X-Received: by 2002:a05:620a:28d0:b0:939:72cb:bae6 with SMTP id af79cd13be357-93972cbbcc2mr145311785a.29.1788421729142;
        Thu, 03 Sep 2026 00:48:49 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed38cfsm10924848f8f.19.2026.09.03.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:48:48 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:48:46 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/2] arm64: dts: qcom: shikra: unreserve GPIOs 14-17
Message-ID: <d6l62gsplmvzip2cdoatgrz4dy2ko2e2kqc7ecdfcfuljwumpl@lxs4au7jhoqx>
References: <20260903-shikra-dtpm-v5-0-e8ea3ac8a135@oss.qualcomm.com>
 <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-shikra-dtpm-v5-1-e8ea3ac8a135@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX9Kv9e57n91vT
 RKOJ/k6nfjAGrnaLgHu6T/xo9qagJuFDza8JE9FYWXEgePWHS7PDUJKpBVUFCsCLDZjjJFy0Mi+
 Uz5L6+R+sOY4m1v2tNgmac/NUXx28PyYsPBmaSDOqa3nDWSZPlALYAYk8dE0/4JL+eAyJUKIy+t
 Nwp8iSucfaUvBzhkTtd+FMIwmW99PUyykIK9VTYlKaaVtJAR2hy+S5By19UEKXd9wk33Z8y4gmS
 rpRxSJud7h6vuasV4DgBrnldSwKAoHToAl+HQo6dX+RYPAc/XdIe1HN8y04xn1/ZTpzNIGH1eEG
 eLhC+SjmxBViLiqjhTD3enVVHy21we0fBTFJDqjQApUvkyXKLS23y1sbbH9VyAp5FlJDaMQqDne
 XNC+WlWEUWxB8pHyLwtNVkJP4YzpL5yw1VRA3uw3TcO1UmcnreW5auKsv1sIfhtYRBHy+bajyp2
 ZAB9aKBqaqYHC8a2U4g==
X-Proofpoint-ORIG-GUID: quBqAA_uwIZxG0sJe0iFReekIVg4vL9p
X-Authority-Analysis: v=2.4 cv=MdhcfZ/f c=1 sm=1 tr=0 ts=6a992662 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=rJE1ynEhMgyPisKzH1EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: quBqAA_uwIZxG0sJe0iFReekIVg4vL9p
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OCBTYWx0ZWRfX6J/0noVAzaH4
 uqN8+0FGhbp6udCnQetJ/ROTxn4B2a0hEAwctc+DMo9PbgbKNflyuycTIf2EL7s843aLRb/6Nwj
 wAx9FxWTLXCz1XQn/+ZM7b5yGpCQcIY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030068

On 26-09-03 12:48:53, Khalid Faisal Ansari wrote:
> GPIOs 14-17 were previously reserved in the tlmm gpio-reserved-ranges,
> preventing Linux from accessing SPI5. Removing them from the reserved
> list across all three Shikra EVK variants (CQM, CQS, IQS) enables it
> for dTPM usecase.
> 
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
