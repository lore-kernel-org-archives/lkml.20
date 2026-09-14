Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D390B438037
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382741; cv=none; b=Dh7b2/1rzcyEzjj5SjSK17C295rxXp3MXnd9d8Tu+IT0eHsJcpbd7WUPX3wag4V8BdsvyiIZQfuTwPZVe4eQd46eYGxFRbCheWbrGQhruQbbAAkiWfQ3FZx50fbNSZtntsG6id3oyHLuegXEkmRoLN4+JXbMC/qYN/MirRnqOlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382741; c=relaxed/simple;
	bh=09bElBSp9ky30rD5p6g5MgNvAR3/QKYinJ5MW8haZE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YB4HzbEgqWoEkz0AcpXsiMJDEXg3dCGWjjho4J6cxxYeTiHYK8rdKb7syyBXbUrrZh5DiWzaYe4ZeB1Da1ek9TiMuOZ7jr3Zk/TbnXNnHvAK9NI/dJU577BR4rE5859kEleyVaknJDoYvoXy+0hyl9sagZDrRATLoUIGunxCcgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGG/q5/l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ahJl3482; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGG/q5/l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ahJl3482"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9oJlZ601131
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=; b=fGG/q5/lJHIsPKP6
	8Sh0gK8NfrffriC3Y8WFqBMwkq1F2xstIxpSmQNWIrIAG32UPUlNWypW5Q20kMYJ
	jpQ4RGR8MHrkZt52OSBQxYvPU2erWqaWOXRxK5nhg+Gjmrm64sJxJ0u5YrREZZXw
	CBwgQS250yx5jb1msqfvtYZ6mE/cN5J738MPuaCI50XKu+PqndspAfdxVIgB76Az
	EFEc7Wwh7KqVw7buLC0Ot2Patwkk3KBN39FjirpcatKAKEt3tTl8xVNH6N9rsL5d
	W33Ukd5HGq3PKDOwH3s/M4t5ia+fMhBa65NbXap6KcELKkbUFV2YG7Xjs63wtan0
	zO1jig==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rfcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:45:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939fc317691so51652485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382728; x=1789987528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=;
        b=ahJl3482gjBbGtlKgPZo1J3+9vfgt9jBvn0RZa2QciBU/tmUGbg4/+8l6zPNB5sy/a
         rAYtPPnt5SgwGASTfYM3tc8BU1eD1FSVexS55VX6pO2c9B3HYUg3CU0GEvAOgyt1kr0i
         xGm8wyj5OfMuK4QAVxbnntYowBwITxm6am4RPBTuaYTZ/tAauDduyINAHuMFCg1oS6Da
         kkXa2gDWWSQij1MH7jT4y5Pul/hh01PqhSGBqSluBNAYv2AuHoobT0LnY8V/FrkyWSUQ
         f9NAQG854UFcOGcSQsO8AL+Ad8D0cOMuxs6OVEf/TBiziVcUaTkZMdMD7XO7W9dtVd/T
         2Log==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382728; x=1789987528;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7c63gGyRDtYB9yo/soPMoorPIcHdgXPKZyHHMFe5skw=;
        b=mOcFSaoey5CFr02YkwgG5Fl18G91QiV+wvqpNExc5EQfvLYzJi1BBE3tlNJYNi6thu
         yhVRFPZcyJ2VgaPxfQ5a0RJ3UI6Co/yDehp8Od7UvVV/3uweNBVhVRSqRCBQnndG02RE
         lyE7GAwHvPElp4etpq6mkOtSAf+OIO6513OEoRW4sGj3i73oxizyCYFYLI5YSRA1u1K1
         k+YLsTk3hZHsJSkF8LfRkFpc0w7qFxrMLhmkzyoO4/0MtTuzQ5gvNB0u1oXQeJtX/V6t
         l366f9QDeB2uCJP1tPKJQdp7qYpevX/vJiKTaVEKiqyZsFt4DLtIAd+TSdkUDAVw9tbC
         0Pbw==
X-Forwarded-Encrypted: i=1; AKwUvBw7k9u+m7dIOOPDVnDL/IzqpvxXD/soaO6eEbI4QTkk7xlchrvyoBMnYHxfeKTBjC5b8MbDgVIwZZ5wNq4=@vger.kernel.org
X-Gm-Message-State: AFuF++meBX1NsA9uuJ/6BsL9IJYhumecLbT/FUlLfPicqh1vS7TIfPrH
	3cMtCQjehjU2aQb//0Wh+Zu5769m9kV4GTUoJ0QyNB4MjNWYYHXP5Djlv1axOMveDEFzpAmNide
	aLUQPxOEU4H0TXMIrFJ0YGxqcWuNDo9opqWw5KsfTmFZWtdcLqOgj854FIghtGWJH7xy0nfMXcC
	Q=
X-Gm-Gg: AYBFou3pWphnY2ZHuD026/Pxyqdo9toqWARh2HmlpqwfLOtj8LXruRQkbRpL4bQuKTw
	Eyg3DI9Ig+/cqrR96L5SqzFQWF8hafC45HN0iUVPQxgdZaVQwLmsM5kIPLlNconoOgF4dCoIlxj
	H07E1HcZ3iDgbLIQ7LwHButHkn1bmuXMi+qGEz9aXYoSRaZA8h4BzzzOVUgEqShzfaJcysRYvMy
	/mNn9AZpUZ+qy4sz69gTpsWtcncY7mZ0zlAmR/F3U1CJIZB+g2aBdIo1RFKneV1u4MiKj940BZf
	VUjKgv0Pkd1HywemvuNIZk0IffatdEUmqXHB8N7taSxfWK95VNAKG6MyYyVs2rs+rtWUQsiKpig
	Wf/JpO48dTUfvcP4kSd/ung==
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr182316085a.5.1789382728087;
        Mon, 14 Sep 2026 03:45:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4384:b0:93a:1312:ff19 with SMTP id af79cd13be357-93a29bfd542mr182312685a.5.1789382727735;
        Mon, 14 Sep 2026 03:45:27 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b59149dcsm4125481a12.13.2026.09.14.03.45.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 03:45:26 -0700 (PDT)
Message-ID: <38874e77-df57-4254-9d2e-d4109a0412f5@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:45:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX/9f2qgRDXk49
 9Wwdz5hNR+FDlEX9XQrQYzEZNepLvI0IqEdPS8GOBnMlRSqw2HjuO47CsuWlzmU/h7w5Nj5uYaZ
 YFuXM4wH3Xig+tz+XplBVR9CpOiEthg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX80dxds6I5QK8
 bRGTYbe5fZpm9DLELKhRzMOhzFlGdzP9HQh8D7yPcD+sZrG1inVVQweXY8Q5EiunYc4DSPWqtWi
 FaxwnOF0er1pp/HZCC05cS8Udty32ZukbKfco59I4Owe3rw3kjMvFN+Nwh2HCaxksfDj0LRNXZw
 p/XBCWEg+8nGp85eTrITRPWrrT++P5hpD81+9JERqWDHvM4JxWxwvvynWhJACmDosgLIM4+zT/l
 LY1mGIfJXh3UZZrFevc2WMuYd7XnKZwx0TspRcvPtZojGUXi1zNgXyuvXw7RWcrziNQYdQcIvqa
 nDuDasdjAwAQyGxfpg0aRwti5iknJnM2pjmclxU+qq0RleFPkrfj6SJ+BZVwzTf9lYpA8qja1g5
 zskbLOkqBZrbvxp3f61+UjtJ31XbbEpsvsZ6oW5egP0y7U98D3lEsjEelaD3MDjqeC0cxWEfkQv
 k/uK3oCCLJY8XXKP2hQ==
X-Proofpoint-GUID: UHYYpXYib1Tz3NNzHRZtRQ-IlqYiqWlR
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7d048 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FkmPcKp2FLNqR73q6TwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: UHYYpXYib1Tz3NNzHRZtRQ-IlqYiqWlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140154

On 9/14/26 9:19 AM, Shawn Guo wrote:
> The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
> a board-to-board connector hanging off PCIe2, using two lanes.
> 
> Unlike the Ride Embedded board, the RRD generates the module supplies
> itself rather than relying on the module DBUs: three discrete buck
> converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
> 1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
> while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
> peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
> itself.
> 
> Describe those rails, the WCN7850 PMU that derives the chip supplies from
> them, and the PCIe endpoint node consuming the PMU outputs.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
