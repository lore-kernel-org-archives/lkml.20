Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261739;
	b=Abj3Jlp/3g1A7vgQKKbm6rYu50R2rarSV5W+Edw4Ib4+JRQrFwa6OzgDznWppXVUmAsK
	 UUmx0zg1oqRNI18n/iL2/MB97IQadL1ZpKPyceysYmoiCM1k9RHvi3GB2wlxzbJ/Vp4gc
	 on8UqF1a/6e5ZMXtIsNp2Xdh9Kisn7oF5xx03BPrJ1hrNp7mjysut01uykjPMR2a1SfZF
	 lfP28m6BT1yuLDI4cqem2kOtqpVzwH2h7b63h1vKE8SfpXrKGaJK6fLrcmDueCQF9gazg
	 Nd6wfabRTJ/RUBiNen+UE6uFSqNIdEZQNsbG7IHD9Wn0uSz0SBLd9zUPL3xy5TQNo3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
	b=3AWN0AdKbr2U2AeOvMp7tYBsLsUojzM18exBkEI0Ndr/fso2oPwnxeoEKrl3+xx9Ryds
	 E7SUcIXo6JXfGwG0KytTaFgWz6QcOdHA80sbzPUKMOIG887cBGQV8SNhhis0g3HuBLd6Z
	 XdWink6TuAiaJemKYtFd+jYDonO8MdqNOOdVpQlyUmN6sFejyXDYt3SymeXzi45LOCyhu
	 xioMXGHZCfSI4oYLQMTux+KhWo0i8jnLWyf06n3QBIpJGSyuB7aDO+Ucm11tkfW+Mqm09
	 t7avO1709seIaTmxHh6rNu4QSlgiqZNIF2ZCWbPUr+Q5VR3qs6bYE5EIlNiaDKOsH+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEF9606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFEF9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5H3GI2974835
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=; b=Ni51Ydx+CDpqf+Rz
	ur3Ui4ghmpDtxdRogFb9VeGwX3g6B4OUCvBJRzwpPq3ayxksQoofX/d+Q7HP/dn3
	epQDJZZYEpAKPJ9p/NdBZLbtt+6T77Rx843WiSnV6JVau5SePRAqiGy9kMtTAihl
	8Dis2v39BxC/Qxo5flms6gNprWw9RdP4Ab3Ig8BXCvSgMyVAd43sZ/YK1b3oJz3p
	kzTrsAM4rOQAV/FzJe/5EO9hAkj1UkqxXqO0VMuamegIMZH6J7C96Ru71QUlZc+j
	o7RElPMcE9Pvd/l0+xPaArwyJNevPUaoannm2KAQZBSyx+eYvowlrHe6KDDoJN6+
	aEqbqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpavjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:15:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so45415485a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261737; x=1793866537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=PkyhNcYy/3eZwUiKKPY4DINNI+7O8PhgWzTx2eO+RPRgOE4iYcoXjZj+eZ8uW5d+zO
         yrDShLjGlnccCN7iJRuXTE6x4d6wqiPm9RW/pWs+7mzKq92tBUO1CsHI7aTZEoxs7stp
         DAlrXW+8Tvf5Yk1EuVFDJIPQQdEIB+TzJ7MmUHohnattdqOuLjaczGEhwrBQ2ZL6Bch3
         m2svPhgQv79xUkLytJHaeh7wMQipk//QREZKUSQZaFn0n/WvPFQV+OqxP8/0dgoevHHe
         Rrjw4LTTFNTko/IZLSDuj4TZNL8DzBzOXpLxwlmrtlU4FG1XaWiIsYBTIapqZ2W2KQA7
         iykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261737; x=1793866537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=DDxl2pWFlROS/Y1nN/J/PuqghF+glGySlYM1qq8PFSdycXVqxHGd1tiau34UHD2jDW
         2M8tscHf0uUf39DH2o5V+hLvkY/KyivPWdNhCx8kM8w1Lv/5KiDF32YRLX1e1vw4DrR5
         VeNds4yVIzIqgS7GeUrMR6dOPlKKDki/s7jf1p3qhUSbAvNAVOuoonclje8b3MzQz3+Y
         SuencmyJVpUpMQDTLAByktF7K08wrJA9+KIHNnoHX6HYJ97ryF0mSTJ+wfGYqbxVlIIR
         cb3X4ikLhOdEM1pX4jpdtA0qEsHEDkyEQIVqkC81Ah8XXwu8/tFZx/eiNbaKZ0F6lukj
         SgrA==
X-Forwarded-Encrypted: i=1; AKwUvBxMDRQze+m7I4YyuVI6xkb4qHdCCqS7x0JOp9b4TjDvYcpU6hFXqxoNKSwHXi5wv26+g9yTHWcNXhX4w+U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLARACLCu0OIyRXuqXbt4U42/YizwDssQwAmcxAg3MiDLvQdTAa
	O4gmYBJR09CRUjTz+dYVyWs8PX8KAKmYlj4wX442LTIBAp3pubFyegApq8E6f5uSuLGrGTWxXCk
	Mk9QVjmLvlmUp9LhkDZXsYNnsA5lw5a8CZnum2x1RvvbkEGI91z3MKaKp0NsQMYTGAlA=
X-Gm-Gg: AYBFou2EQJGVOYAwsVVmCE3hxQ0VeNWfOuDjDQHaUnoeJPYE6pSjWgVXjxPnR5IZO4I
	8nI4n+3KTPIkYE6Ktf+8XZWNFe1Eg3xWU24GDkjUUaPjb0agiOd9skzX7Fn5ZTdwgSv+AnC+0bL
	pbQMsSmFkErNdHMz1L9Sa+Iq2bEM+rnyzGa+vAEWFVoYoAg5ohvZNf7ReZOgYjsEOuANnimj+QH
	AXi+QIkeKcz5iZITsa2ZCyWjP2hY0gI4/pp5aTgRoAHF3B5eGLUhYyQpUH0kI1u7RWWX0CUc6vL
	iJncLDltWrpKulFDP6MkD0FuaFdoTv3NyK1vZwSmQpkz2z6pXn+RkBBZDMo2o0XK/HhQu1SOxgX
	mCiufIsDTBabD/CIgBSYVa1HFIg5irbclBnBiX5OajaCwKyIot2Eb57SiU6dCusdBxJpQZg4=
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690394185a.5.1793261737036;
        Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690391385a.5.1793261736641;
        Thu, 29 Oct 2026 01:15:36 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b495ac4a78sm2434202a12.4.2026.10.29.01.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:15:35 -0700 (PDT)
Message-ID: <e67f8b50-f3b0-4a19-bbe3-d1f240ba9b2f@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:15:33 +0100
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
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae300a9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=UmW6FQozgp94pkqAIjUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: IiVtDcJ_lcJYhV_PJComfegjmcysLrNi
X-Proofpoint-GUID: IiVtDcJ_lcJYhV_PJComfegjmcysLrNi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX9f+6GCvyI1mn
 vGTys5XC4evFXl+aqu/2oUgwoH71rE7o3aazhEXZM2Uyecyo+kMsU4t06B83w+JfDIoD5Vmk4+6
 GQFv6zAzhaEnhptx+uPBkFAOtgACyO4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX1Wj3DtR8BlQ0
 t4/VXlJhS/X/rMSvIYSPJZhJ67pRb0/aKoGD9/2Pf4w462o+b8FzF7/cbxVpibPPAp3TN9131rz
 3ITNtGp4sOo4hoNCp5c8TtICIe1U2pUdj6h37kN/OUvE302oGqQO/f893Px7aqmCsBy4IjGHOgC
 YhOMlM2+7Ll4uEKY+CyibhG6nUEi8ENuRhHdfWXkhYyXKnur/RoOztP/Wq3SohOl3xHIn7CRYTU
 AsZOSJ6k0U3aYFLTl+ch9hJNIuxWunfeEiWQJQe7fuIhEZUn1LBI2/eQF5efNroSDo8XU5UpXr/
 1SZEcdVORrf5VTGUs/rlY0MUwHNeSvy8X4Leqv+KmuaA3hI/KExXzY831tTshV9izBqH5yKyCx+
 LVS9hOoJiFHxluvGgs428GFwgZ1m8tz3s0qHl2vlycFol47a7TNJeXgGqA2mUE+WsnBIWk9WkwG
 QQZBGoGL5JwJ13Qz6FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/26/26 12:29 PM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
