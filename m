Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F68470121
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133736; cv=none; b=aMMjvdWSvLt/Ro5jKrsfXI2QwebpqHQXQPvGYqTSkIGOfD5sod08KexqKRohhZoeiA5xissU4KVxEnoGa3gRXqZckcIAxYc6DQvaRiiR3EJvPXPi4+oM9nuJuvNmX19ePyy/g3O5EklBAMTS3mzIFMBdwofTLRXlXdDUl33kliE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133736; c=relaxed/simple;
	bh=Bdr58TASYAcnDyr8NYgzvmX/VNnrlFvX5qTimGt4OLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsFJFVpr5tOxZJRYqQKfBZ0ePyzW+qjhvF6HfObWJfu/Ldd4FetLJ9fDytK4MdfyjG6G7kFdVv1MJDg71wx73rve4SM8qp6TswMP+NyKzHOOd3L2656fnugw1/nkvIhLB0AG37sq+7itYQqrRWYzqyiT/Vs/Uj1mrCEoHQdtn9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QS0btX3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVKpvD/W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QS0btX3V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVKpvD/W"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCivWF328446
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:35:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7fDBLHg2JhK2hYvJq0Kdbjyb
	j3USOEIeZfURdTQMJP4=; b=QS0btX3VTC64YMnoJ0GS1sbqxEsPlWBbiO0cKvwV
	WZAQTjjtoRpG72dSt83l0Rv3CBXnFLuYD6YfMH72HScYda8Y+tW5eEA6vBMzg+Al
	Qx9jCO/3SaD4tXTzS5DypjFJQu4f9jXgRBXEpUIEHRcLIymgY3/57czuEXtXeTms
	VPBh+tMEZbgtgxe2XyG2njcmnaVDpS9eqIqKtuC9nWU83oNqDzPOZW2KcddrYLmE
	P2gsHmWe8uSq1XrQQwj+Gr4eE/G4Zrc/UU8A52gWZNDd2HyQgBBX7UHuZtkCf57l
	CgSrBC7fDh/+nB323OL7SWYvGDLrndMwuZP9GiwVxv9kWw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q435q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:35:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so140084685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789133733; x=1789738533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7fDBLHg2JhK2hYvJq0Kdbjybj3USOEIeZfURdTQMJP4=;
        b=iVKpvD/Wx5ttv067ZJzAwzpPGeZpsH4RQoUKAfv5CIRMfW/4SId/cPYKbog8AI7wlQ
         se7PihJqxO1IyXiIIMYElf7+r7vy9Mq0IS8QwjwzCmzU1hbzNd8ybatf8ZwYHf87+MKs
         72gkVswm0WUifgXhfTjsmW7HYUZTprZVsNjlo6MoB/bM7UWKMPhg4Fq3LFokRGeoZT+b
         DxCWLIbjLewLse+Nmz6SiIZoe0/SXl/kgm8wXMFqcYTq2siVnuqAes6Hk5AbMemrUc+n
         glfPxf0ZuLzT4t+ZwopRwlpm95XzPPP4lr1ozgpA8I1fxlQ5yg07PYpLL/oesqXgU5xB
         bd7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133733; x=1789738533;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7fDBLHg2JhK2hYvJq0Kdbjybj3USOEIeZfURdTQMJP4=;
        b=JOy1h52/JlMbjmiyHmzv1oESq5GZjqA2xGVp7V9YSoWlFLYE/GD2Lnnwniu4zVpbYC
         lrTKo5LLtiy/JrUilhDL4ciTorumxvsL7YLjl1iJqza7/+fEpuNCVfooNpj54TKOela5
         L3hdrR0SMjk9vuxK61kwSpccc46U2LLGOekBWCa4jv5AF9mDy1KC2GJQxB2XKd2A83Uv
         6kbBlBDO5VOootX9ItPC81egzDfR1angx3DZAT5LfryYFzj4rJ4kKft64NaJD0I91cJ/
         vp9utPiSeP4DWZXMmXdAsWsAR0RPh8RmvJji+SySiZVa6SGJvCnROVoXmFWXBpuoHWSa
         MFdQ==
X-Forwarded-Encrypted: i=1; AKwUvBza0TDvjegrACCo26Tr0gFgWrD+rK7N9qCEiFBHMa/BXTzB2gARlCEzhpE8TPwFt1zECaT8HYgxmakLiKs=@vger.kernel.org
X-Gm-Message-State: AFuF++ktZbr1a57cC2ABu8fttUU+E1RCcN4kVmV83Sqnfrc0B9jW7sxO
	qzCwKn/gXRcuiNPYN1ER+BewadoHSt7hQi4HCouM0xQb8swx1EPEUwQKQGFQCYFekA/jHf9bxFr
	8ZLcx5oryPDgU8SfhkCMvs4jKhtmqBtnjArPHZsI6ZdNtIyWumS8N6/0eEiQnB5NQ7xM=
X-Gm-Gg: AYBFou2FGLpQ8tF1kvRvSkKU0vinn391BSvGZm+IEBaPL3o34I6WgmH2+R6rNTUvaf2
	FtmUJWBe2nCH/5ZDVzNOxs4D7BPnfFmqa4j7HPK64GxUrmjooKtTsIOtZDE4K3n05bZdCKKguG2
	A+3c2+3R/5pjxsP6sQ9VZ8I5wD7AeAmluEBRrttfzjgnS/75GqOThHwCshyLhcwbzhNe8S7wQyL
	Er4g/VEW4SU9yu87uB6VahN1zqyt7bmZGweaV3TnL39h60Lg17/oM4V+56C6Q9STaNIJciOoNNL
	gm9z6L9oiFTsmZL1ShXVzv0B9Qof1bo2klbzkJRZdKNF19v8BYzMF6lxVngViqRm/uISb/XXHMN
	rJKzyk3n3nzNdA+s=
X-Received: by 2002:a05:620a:630e:10b0:939:f978:c1ab with SMTP id af79cd13be357-939f978c3b4mr135519785a.4.1789133732618;
        Fri, 11 Sep 2026 06:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:630e:10b0:939:f978:c1ab with SMTP id af79cd13be357-939f978c3b4mr135511385a.4.1789133732044;
        Fri, 11 Sep 2026 06:35:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm6290623f8f.27.2026.09.11.06.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:35:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 16:35:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-mmc@vger.kernel.org,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Enable SD card for Shikra EVK
Message-ID: <e3h3volimyab5h6nov4bzassb6qki72c3wev3h7yyaxkdn4gfg@l2f53ch34aru>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
X-Proofpoint-GUID: cx7BXUfb63Jfz-tuwdXwv9L2Qq-Hhm5i
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfX19mpCf69sWfQ
 Lxc320om1Hs/jeUinx7zF12XddMVxdeViKoh3Fu6/6F5cLEC6GYI+5x+CDzUouArULG57xRjFTd
 LYOBZWBu3SDwh9ccBDrX37p9dVVEhHE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE4OSBTYWx0ZWRfXw6BllsUBGy5n
 X6DSdJJNPdN5Hl4jbFRwZ1Kt1StWjxwb+gJSeNo4GmwQ44yCmFFsPhqWoH4tDZ0NpGPoLpPysDR
 xp1lTl8jPC31zYT65BqZYzMj3s5J+mpaEJSfuVwwhSplfSHdlkJ6MdUkc1gjnZiJZ3VwYa/rK8X
 V7sRV5fUlssR/LHGmWu/RY3+rSq/OIWprK9sNflTSeCdmXCjhP7z89Xg/W+OwHzJStAxDQ9OLsk
 VODynkSIgcfKft2dSEL9sC/FIQD/rhMBo1xokrIwHB+0CPQI6t5gLLAJnxoD/fCecpUliJWHYPK
 VShpT+ZQZh54NLz+bMPcJAoT9TRyEuvxIe5aWBINMeewkHXUfZvHvl3lq+5zvdk8U/dqnmJ5Wc5
 XgI+nRTm9T5bBN1hIoXOLwR1eRTdfn/PsgaDn4RYAmZMn1NT6OM3trYYw8RuQIZqgUTRtQ/0hC3
 /+T2LHm/FsDWzJC2kyw==
X-Proofpoint-ORIG-GUID: cx7BXUfb63Jfz-tuwdXwv9L2Qq-Hhm5i
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa403a5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vBACkDl9X50tgIqftl8A:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110189

On 26-09-11 15:09:32, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
