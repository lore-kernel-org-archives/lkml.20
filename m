Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620162;
	b=pfuDPewSRAz5tPvio/BjROkD0q0E2pmyxUNgflMRb1qnrSQ6I+gaWM83YJUmJMuchAcd
	 eXjcsTbCjlMsthIgN3YfBZ1kML+2wmeJ3lm8rvq+6iuGCT9B4WklLvLCT3WUj61cTzEAD
	 y61csJQ9GAFhnHkqkkz/OknUOou+1AaGFu8Bi9UykjO0P7G5m7xtBwMd25IU4TM7tMzp2
	 yZgMqMJzE9GpCvueroI7uOmv/w5uPUfROykP+0hmxWz+n0cPuKCtGWJD4u8UoOaIzksF/
	 7oWdgt2YiZt493LWwm9j5XBlHpCMCcwRfVdJOHY8kJj1eF5EwO6v0h2NRAv6EF1n6Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620162;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
	b=Wv72BWthRdnyaDZVgBvftx4/dThXv5b7+UGGdzkQqcj6zEsHVdQdJmWZrD+/uIuMr/fi
	 9d+fGoLpvKWaMaabOReG91QvYPo+PRJu/x1wllmFbpeQ2STOXKNinT5oBJ+1ax9Ugxrni
	 npDWqd+WJRbvqPZ4twHQ4utwQDL4SZOW52YJD9TkamgG9RnAmSUMi08Plrsz5N0vpAHsT
	 CdAUAVDgjBe2xk8TMXFDYn+/GMh7oWf/DUlV1Jsnn8eqrZFhGI3WH5RZ3UZXHJ8+V94mL
	 W4Pez0/N8Qk2XQenNLHKg1JOmZLHQOocmZXKufMxzk3W2RmygCyVXOwlzwnPfai3TqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofHmSgH9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMGQCps4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA4E60A2602
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:49:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA4E60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ofHmSgH9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EMGQCps4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2vNw077082
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 11:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=; b=ofHmSgH9FKVoN6FP
	EZvtNVxIU+jc/kRrs1G26S5RN6Why14/9JolC2Eor5INtH3BV/IbexYikxiRnU0Y
	NBSn3RfePJCK0O8GLANKGocGJGWunwRYbna3uGmmQ2q/wtd/f7PGkOAM2+9F2frW
	of3Wu2rGREhEFuK+xehUq/u0NvHbwEaqN2GG6hrC9HY0Oe+SV9+kIzIWrU+onxiI
	xuC9P2/Ei6M2W6CEl6i2wfwgLIqMF0KyWH5Af1h7oFcaD7KhYCdedKfb0Iq+b6uf
	Gyt6a1sTqqhZ1qUadaKuk7yKlDHZIcIsLNBeOddysolN07KN2+GxL4lw5seOGw7O
	xvV9iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r4vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:49:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso28455385a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620161; x=1794224961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
        b=EMGQCps4+V0AvtIepAIqRz8Gzl6IMS4OHCucVm3muiSRulqy3xuxgbkPOJLETlMhdN
         D+23jpseR9iedabOPaanAKZMpSpIIyMA6EUcTrIIZGOvTJGbt+cwT2gRwx30AUJqXzjI
         p5iKy8a/irxO6dBEiYPaVAOmPp6zjwlE5EktIIjY+/s8WEpF9bW6UARHJaEv8vony2Hr
         1jRrIxrckem5rCeuyV+N1TzEBbw9SqUgMxLoeeAfIDtGfOtMCzEu/op4SkRQ8hpz6o89
         0nHBiKckE5tTUWzkk9ERqjysAueZkv4AQSPUb01XqdEhJVcsIt72JZ5YA3pjrpqqU/79
         br4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620161; x=1794224961;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok52yNh2y/vd7LQUBnqiLzCNFtiJc7744aqsR0f9mLc=;
        b=1fPTYPVZ/lv45jDEgvXioT+MzG1t4aROeg87OURS8YNtOa9AHRBrU/u8bDq5z8g+/s
         1A793NZKOirjeZ8KhbOmteCysYE7u8+85EJ+wQS6FDW24oorlbTx+8Kf+oO0URsqNB0B
         G2VjzuUkbLaySuUkrsLztY5qu7pvYsx4W8w0nSH2w1Gg0vm2AZP/wToSxiBHyAV+MWSO
         aENy8mbQ3Vz+QVpHG97n9bCES7WtGI6TXvIK+H9v40MTSYvun47Xsk6Llsuj4B9W6hmd
         6vN5Q/KAuO57n7hs7YJGdw/NI377tZoW6D+RKZUq8/D7R17DYVE9Fr15Mbj5giaaRaKD
         ZZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMJ6KFHKZ/TgFZbdEAKojugd/Znlvs6aul3JR+sdnDMaqsnebGvkX1VC/ffQwGz50gnF68dfnNgyammcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmmWPVG1ZEPU7xzmifTEo526AykSxoFCxhIzNj/fyeE3MDWTVI
	ILKMUwsWRYnvBo00Hfx5dtf+hKhLT3KM3g6PUu55X1dV0tri3xSof6dD/Jq8ki7Q5DZyHKBC/SA
	Q49B4QJQDOFnNBic/F3v4wLVAdGQTmhmvyxBe2KJ3yj3qsmQOx/v0qFMFFkmB6jRrCtg=
X-Gm-Gg: AYBFou0RuAvyR6CqGIz5FuqGB78y6O0MEHqYe2owoRM79nZ8gjhCNh1syvwulpV29Gv
	eHchAtcX9v/FAIGVZzzLXJjGT20dkgYaHjBdEFAnFYo2+vMcM+cHU7RbtdbyD5wFOdYwVZMNzMO
	9FTCU+L3jjjQAjR0ZgOcMIauBP0nckYr2uuPUb1UEyzvzEZD9/X5MF6mxc99SzrN1c014/HHAzg
	PtfahpHa5oHhvrQNVxBlDn/i51UECeXiSPuh/QcCis5jnNSD+666zgwQPaqaKwD2iy7WurYk8Fe
	VLUQ9k0L0R+lhLXkS9TWafcPE3+XBbeV4afgS8E7TQqgz0R8B3e9AiMl9LlKUPm+Erl8IfbcuzQ
	AJLeDCBfTokavMHbPCtDTKOxdvpFwry4HB9SeFaOw1+PB/KMoKsQgxWTjCSZMFW5PT59oxAI=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1795219085a.3.1793620160673;
        Mon, 02 Nov 2026 03:49:20 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1795215085a.3.1793620160155;
        Mon, 02 Nov 2026 03:49:20 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm3301742a12.26.2026.11.02.03.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:49:17 -0800 (PST)
Message-ID: <d6126285-97b7-4424-a644-23828d58cd82@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:49:14 +0100
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
Subject: Re: [PATCH 3/5] dt-bindings: display/msm: Add SM7250 MDSS
To: Krzysztof Kozlowski <krzk@kernel.org>, Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-3-159f403ec405@brar.si>
 <20261102-wandering-peach-lemur-0c57fc@quoll>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-wandering-peach-lemur-0c57fc@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfXzKzmqz4K6VRT
 QIyPTwHD0SFjcQfV8i6dg2EzGgwCeBpA4+mQpo1PowXM5Rh0hIuU5XP6VaosZCZ3OrhEoraaE+D
 0VT30azXcGWmVvOMVpsUxVyJoEufHIuGDt3sg3wGQY9jHICvZLZ83a3OLIlIt0Ot5TnPWIK8HAm
 zC3iI/I6jbDinRo0TWxNLq4W0LhyWGie37btYHMr2z3u20rs7k48U9mETmqyAQ78XbB6W8HerQx
 WxmCRVXclbOQZeJqqNqztRpxfej1li8X4oZ9lpnRZKP5Tr7qWZ4NBE/m+7nV4keVoGv+MO9UNVw
 Sc8o7bRgiUQ/LLHcnjwX2nsucpIYlrmR5Fs+Y5TY0z7Kr44LdWZgYPvOWHZgIFi46bmq4KtjkSU
 jhk9McggOGCHWGXzX65DmvBT72VkhMVLLSxXCn5gPjik24eyPaTRMdyHfK6Kq/5TtIo0TUR7flP
 kigHeDBRhm3czMRzorw==
X-Proofpoint-GUID: AT3Hu5midh27KFH4opKOBAIp0dIGAG68
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX3w1pmeNtCWKQ
 wmiMiG0x9kyIwzfxAlztG2A1OkioHZNtVSz0FP8h7OaHhjEpqXQIUEg7Eh8fzdrRGizPiYk+ock
 t4FGKlrGj6DQ1nBRVaKQZrdGEtMJz4g=
X-Proofpoint-ORIG-GUID: AT3Hu5midh27KFH4opKOBAIp0dIGAG68
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae878c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ujgWmTuqKpTCez_IP1MA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

On 11/2/26 12:35 PM, Krzysztof Kozlowski wrote:
> On Sat, Oct 31, 2026 at 01:23:39PM +0530, Ishu Brar wrote:
>> Add the binding for the SM7250 Mobile Display Subsystem. It has the
>> same clocks and children as the SM8250 one, so it is modeled on
>> qcom,sm8250-mdss.yaml. The example uses the SM8250 clock and
> 
> No DisplayPort?

FWIW This SoC has a single DP controller

Konrad
