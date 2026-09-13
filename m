Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069A351C27
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789312856; cv=none; b=BAqKI3Wye2hZ7MkvQxbgC7TdtVPlhtBR0eiIrZRgDpOBuhFTonIpejjVZtEMmIK/9B83HBNMu6Wp5lhmOQhsRyu5zULfEQeDOXjkDIMGixSz6XEbDNJgJO+05BRYHy1SK6BR2HgOBzFNoW/u24vZBfsZ8onZGa4TDWWPN8YduzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789312856; c=relaxed/simple;
	bh=t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9llMguJavZ/JFYN3qVq0VTKt4b5jpy1M91Uv8/FFyiSmewuaRtpAL//IgkkyGXEUflgGCxMa96hC79ssu5hIc6Lk9U6VehZxBnnpWr35WfLRNeImwviMLUiz3EL68OgdSkyznMeZ0g6bpaJ3sEaSQyufiTF3VL7P6sO59EHCCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ESO4Uu9h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVyl2CEU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ESO4Uu9h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVyl2CEU"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DE06nQ1793095
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=; b=ESO4Uu9h2cfPvt6d
	Eu5FFCSNztSvxXt70SCxpeGJI9tEVzTKu3mHfycBSkZ/Ll9bNNhwqHRXIOep8SlR
	gXkvYTyyWSoCQzrBQZPltKc8mDKGz6rqTo1Ukyd2HKRs/JwCLJg04X114sT3TxAr
	A6ZAYdtHXcLQ5hkwBBhC2/WuOoT9baNM0JFmITwUnA8QU4wIvVciegvIW8hmiX5i
	rlWV/8xv8OWe90rXbaKzvOSRtUnqhbXOw6TyqdN5squYvTFBt5cqKXB6NDFsEFyR
	Z/AAnTZJKsXatujA+h1kIrzWgI4hiqfBPdgeSMxpGZMHH+PMt3DGMTeReBoh/ok9
	s+c1vg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dbgqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 15:20:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d02df2bf09so23055175ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 08:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789312853; x=1789917653; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=;
        b=GVyl2CEUU9k5aUZO/CfI2gOTNAOk6I+8GhZNjXHXNDppgodTCPQ5RC0drusRz5thCG
         IcpEC2brw9vvj86TPl7B/2VOjP1sP3Jgy9ZpGoXGDJoce79c2t5QPriGtoNAhaiQdDso
         lSDMyPa4258YcVOw9m02ltOj2BA1x3CF+Y7M+5IfQQ7eyAQkPGcwpLLIFGhfVIbQOS2Y
         4mtpjDbJ7qNJwyclQB+zGPF8vlvW4SgGx+g1MK4AS2Jwjj4nvLDJ0vzpALZUaXAFyF6P
         7c5CiGBDlpcoAuEl2ForipZ5Q/zolIvhRw+SZHY3INzGPDoXP3OP/W135o+sG0htfNx9
         d/lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789312853; x=1789917653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6s/awq4RoqBFyOqvzNKS/rkyBda1l+Yp9s4hTmPxgk=;
        b=UIKRv7xgsu2XSkc/Z3ZbbYIIMsS3L97o6zB+CgkJVuqbpskuHCtoVhmID/DmuY0mCx
         AC1ZtLZuOQi/jSXVF6yYUrPvYtK81FL5teSD404jz5wRAfCLp7Bpo49l2h0Ag+j/Onxn
         ywzpfSi900O5o4sRlhvDWoeV34iVrdMStkP5a+urCTw5tDSPVzNoCxbMVI5S+4xtypph
         l3LAKz/gjemvO8apXHKMG4pDytRjeTM9TYqztNLXro1ambAlVJd0t/9sCVKGtitQReJ6
         5FsnU3L66KB2zHmEohP1fWAUQuCID2agCIis2N7iNaEM9WMXmKbV4De9z+K64iST+SkF
         3ULA==
X-Forwarded-Encrypted: i=1; AKwUvBy2dmo2r5zfJcImaU+bLUhBpJI3EY3LRwpliZ2IBW27ctoqC6YWrwu09oPFLkuLZIy7WDXX29acAWn9AQg=@vger.kernel.org
X-Gm-Message-State: AFuF++mGB0I5M+iyNV63/MNm154a+3/Qicuwjp1jDmLFCewI5FNojWp7
	pVPqdblGs+U5Stc+scJSsUZPfSnQFnSYdQNcHcKj6TyxAoYLXBe6LeSsxdW+Ig7OZkoSOsWHWgu
	fbJY13v3P6b9OYiGq7U4RXLTVllrt/YnCTfZR39Wdu5VO6t9BfVCl5w2HBxFaYQXXcqQ=
X-Gm-Gg: AYBFou0L2wsWhzEhuWMgYOewOijOHojX1cF9N1cUo9IszuYFkuxlIvQ90+QiUSlJhVk
	Q4SIUdjkL4dE9qmeoLrpXWd9WY5+9VQw5CCrQlRtO6zf7pEYN3Oc7W+JuIZ1unhmJySFI8iF7jn
	eYbJs1NeIa3DaVXIKCopcYEMTnOIpF2H7ER3XNO9H9i1+Sry6OkjAzJ52pkgDQ8JtEPvFd8TjRc
	VQ9fvC0qEQBiwZUT0T5csKKZcQdnQUBDj3NFhIfiCOkfvr80uaNscxmvQ8b3517l/RL+JEKMEtz
	YepVZoHwCDoG46IY+92ZSC6EP5EY/cM637xSIH1y2iOUGBhMpBNy8MnczNJpparxIfuARgyMgX3
	RK0iae+K0qwhZKbYBzQmZ3XZExCX3Pw==
X-Received: by 2002:a17:903:1a67:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd2a35dd20mr223181675ad.17.1789312852771;
        Sun, 13 Sep 2026 08:20:52 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2d8:d4d3:da4d with SMTP id d9443c01a7336-2dd2a35dd20mr223181195ad.17.1789312852339;
        Sun, 13 Sep 2026 08:20:52 -0700 (PDT)
Received: from [192.168.29.166] ([49.43.233.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm9983061eec.9.2026.09.13.08.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 08:20:51 -0700 (PDT)
Message-ID: <71c309f7-3017-4c2f-b2df-82cd1a8019d1@oss.qualcomm.com>
Date: Sun, 13 Sep 2026 20:50:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Enable SD card for Shikra EVK
To: Monish Chunara <monish.chunara@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        Kernel Team <kernel@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260911093932.2376058-1-monish.chunara@oss.qualcomm.com>
 <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260911093932.2376058-3-monish.chunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX3s81vs9ZmHIO
 stusUGLvO8XLYgWPsLwcowdR3NTMlvasLzBz1iFdEUoIt+1Z/jQ3soJtOZ+5zPhKPCyl8f88+jY
 3SrUfrjtFLRNqExt4ZXhSpXQUWobP9W6x0PONkmwNOLbbopgrjy4LEnsntjx7/yohh7I+m59bJp
 DIZhHluqzwci4knpvgmuUzXPfymgHIpYaIcyIyvYmH6zQ7GPW4RUP0Ldwp1DKevZy/ijsdur5Ln
 +UrVclPmEmYLdyW0kYNAGuC3Ggkhsw9mjGyC6B/EZUXt2Z4T5r1wAgrfXxgrTUSI2FeYIWk1nA8
 UFdvC5YnlhyS29A1pL3i4REnlgFwq2BrjWQNBaN0CBV3eugjPLyfyAn2A8M3wXUkWuacoBjwkwp
 mtJqOBRkr/pVY7l1F3SUFE2c/WmKNnkxGI+jtE/xY20TEgSxxbVVXgANkJOVNt7Ll6vip9ta2/l
 f1exiqVulNK/7xrvDcA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDIxOSBTYWx0ZWRfX8kKTW820beBf
 2l5CrA9D5cRwqzCQc/4ik1lHcqzhgvzQksesgsFCI73PaSH9X0sIY1XmPkcbpx8XAv89mAUZ4/5
 aXo56FhlQ3ODrEiqeP4mZoaybK3g0AM=
X-Proofpoint-GUID: a99lS5fZPfRH80K_kuhndukfsz3Yna14
X-Authority-Analysis: v=2.4 cv=OeUNnRTY c=1 sm=1 tr=0 ts=6aa6bf55 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ygYGJKfEQ+goyyaro2Znww==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UvUgRuKAC70QvhXwD9sA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: a99lS5fZPfRH80K_kuhndukfsz3Yna14
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130219

On 9/11/2026 3:09 PM, Monish Chunara wrote:
> Enable SD card for Shikra CQS, CQM and IQS EVK variants. Configure the
> vmmc/vqmmc regulators and gpio-based card detection for each board
> variant.
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>

Reviewed-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
