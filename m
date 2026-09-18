Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA2483BEC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726000; cv=none; b=Esk9T7ACGi+f1ZfClyBtQ5jiPA5tYT3lJimC8SXRbNtmsk1zl7qwPOvZVENvyqgVPjZY6rY36YomSP6qLZdPDiVxNfVNQNmC5fIbCBAUPYQFtI0bzkU8gNsY3BcrjoUoCEdkUKAEIfBc8DWxQ+m9nd9Xq9JvaUnSsRlZDwuXTi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726000; c=relaxed/simple;
	bh=ZgoSaCzKmKHz2p33jtXBIxb3E8I19yAI6VB7bch70lA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gpxvrCQTFzlLM0I+Gqsod0QB3xpAxtguzA2LbQ31NtmhAtxLkNQn/4VJ2mjeoFnBCo9n2bp6ebmWcskwjo8mCSGYGVXRe+6aHwiakgG6XEl9FR0cQtvZIBJ/iVKy0Khed820y7jP5dvuX/Zwg4eMflF3ahiHKppOcbbDzJQHHd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oN4cxsB8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcdImAvt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oN4cxsB8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcdImAvt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9eE9J522593
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8/Q21cSCqT7ec8jqFJIowAyY/dNI1Dq7UWonJbvKvDQ=; b=oN4cxsB8ZDAfv36F
	0FW54o8hbwK6DXkgs/iK/I9KG/AP6Tcdvrp3zLVIBbOfjzKzDK/UXmSusLGGv2UO
	nHVSHu9FhdyOxYexRvu2Pw3U/YcxaHhb904+j+DzP5ddQSFQqhE9sEehs/MUGPfn
	BdfgN7lR7/bZ8d623yeAVMKNxgvDqQJGVyL2b3jsPQs2lxFxNvzgq0MS7uqN+XAD
	AX0ghV3sx3vIXXjlpokrbAU+fkm9fW29AqpNjbT15rsOnIbaDh6hzJCwHvPokJK6
	aNMIxoyWZVNo+Bkenu2KX4+ucQ7uZVszqjZq71PUc1GaLiTrSuDR/8mpTHcudZcL
	A3u2Ag==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grnqebcsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939f4002c1aso9011485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725986; x=1790330786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8/Q21cSCqT7ec8jqFJIowAyY/dNI1Dq7UWonJbvKvDQ=;
        b=BcdImAvtVFkuBbL2krovGly39aPnmb0dzEhjMpABUsGgCTYD3omjuV/TXv3OlUdcLH
         LKSPs9xHOvIG+GSHSBHfwvqvHxukCAkYQqaJrTnG5+QE5Qt2irWMhZMai+6itj9cTzzb
         ONDjzRyFTbiKaEJFQiH2usJHF63RKRKpkldkSrSuVPrW7g8Z2S8WO1/YI5TQKbFuMLCZ
         oIOJQVG0I+amkppNJY9HeAGXcGyfmrHZI4GGm17MaU+tne/0xcXqRP7jLwR+5h34k4Jp
         1Ur8A1TRhR5Iy9+/nPIKaYZVuIldqdokh4GKav8G3XUZMiKlN+Y6+B92iBchZPJLw5/Y
         OePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725986; x=1790330786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8/Q21cSCqT7ec8jqFJIowAyY/dNI1Dq7UWonJbvKvDQ=;
        b=qtYkCAux+BNgnzOx2SrVjOo54jfB89SR6x1Odvf16KGGn9IkKXF6DdlXNN6qOBmCwW
         xnuQK4XGgzVrFH9fecJybTAJvMxBdC2b8XoysqyO/oe3gYSfJ+M/4sDxykheE++xAiop
         NlTM5h96o2s5amVifHJL+22Q7TBOPq7aepMnf10OD4p1CPxjp1/vd8zYxaI7u/5ywV6u
         aUHHSOBQtMMhIFDe4gr71HOOF6s3J4y2aiwkIoRJdq+8ty6L/SAJ8hjTshsS6Iq916jt
         RR4+ktO5LLDmfIwKVqX+8K66CD4MGpRHQzJbe/B1oH7iYI0AFijk8T44qgiiCvu2N8ke
         IH9A==
X-Forwarded-Encrypted: i=1; AKwUvByQfC9HcdoaZl6eZc+cc5nYYX5plr1AdZntnEZj4a4YIX4a6BaiY0RgbhvI57YoqnF8VsxDWyB+4LvBc1E=@vger.kernel.org
X-Gm-Message-State: AFuF++nBBRMhkMyPk5CJ4euapzn2JgpZItNY7Nq2KI7GvfNKvcq9Kd6+
	VKMQsvpHVcQ0t8J1QEfBQ7VLHj+iW7q1l4ZJrh8XcLd6YrckVX3ArrDy6us7ehNeFNJlP65DREV
	MCPO/sGz3gEQyUvxV887y6StmHHFn6Cyk4wkkRsARveYZwldnSwwlXWLtPG9Au/c3YgQ=
X-Gm-Gg: AYBFou1ngsJKofcXAIOyjAF3TAULLfnh0IiBZtRDlUzicj25n+gH1W17HO/qPrV0NUW
	x82T+x5cOuhFBGW1WkHlQzITNbGI2bJP835yNggADm1vhkBwEe5jfQlrgS6liKXVae8h0mHutjm
	gG9VDg/6G/vC/04AFDVL9nLmoDd6ueJm/hSz0XeLv1Np8WzP0LBryRvOZBZWDwknPXTwrGiMMaZ
	rYYyPuz/za2JD/YCsBTK1scL/hEUXzXj2BhkpFV1+fyxuMFkW5lbZv4rmEJa+G4TA+SaSQYFKVa
	jrSz7LS5/mThPXIbIKyMgRI2QivOeDrYon0V8dzG48SuJb/CMhE8nP71O+TcCollsd3lCvWLppN
	byryYozu4NXYqLG7ZLHOoRw==
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193663785a.5.1789725985713;
        Fri, 18 Sep 2026 03:06:25 -0700 (PDT)
X-Received: by 2002:a05:620a:6888:b0:939:94c4:b799 with SMTP id af79cd13be357-93be074c4efmr193660085a.5.1789725985335;
        Fri, 18 Sep 2026 03:06:25 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59715eb1sm618412a12.16.2026.09.18.03.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:24 -0700 (PDT)
Message-ID: <05b9d20d-5ef5-4ae0-8507-141a92e947bb@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: txFktO52N_wJ-BqvYkQVEh9F5_GMs2D0
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6aad0d22 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: txFktO52N_wJ-BqvYkQVEh9F5_GMs2D0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfXzL7eG3fWtXNE
 AbH+9meB66NcBQfCNMDiat/tT0E17U3gWwMSGeMrubBIveh2ibFxNcCjjq9D8xg/T+mO0NY4aDk
 bSQq61NU2+8P1LabfMrhewuIyYYpyJscxMDXW6ITlVuNEitZ8YLsBZIicKeCBrPOjXS9O0DZV2w
 5HLVBhFRX91SQlHn2gXllkae8keSL8rslB0klfpiW00kWlHsTbKfyAgFBSFqCMIIcQIF/ID2eL8
 XikQpqawVdLyjZBVotPF3WFlYPTmMypkK3cN4AuJsUgapB8q5H40XcpVjq3ILGSwgHdptpWL+DK
 /vhW37YVJaMc77+hkCq/U9os17OE23AUQfXC64zqGVhttxPg/TpSzHvJYgurXZiJrnEYjfD39uq
 LAKj6pOn1f1jO/va3lp6SODUmO7bl+l+NwKPbR4WM5r5GGVzYSQjRxRbRkN1J8wZ5Hu7pGXpKRL
 MANecPlY5G71WgzuJiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX1BraSodg0++5
 mMlq7Q3hWNfiIlsJseFzYmOmQuBdYLdE3EDWGMhbQWgk1h2MAU5MqJnJC051gEELFpJVWFugUog
 SUbEnQ0W5nAZtED5H3rtYBgQUbWTuEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to pcie0_port0 and pcie1_port0, adding labels to
> these nodes to allow board-level overrides, and renaming perst-gpios
> to reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
