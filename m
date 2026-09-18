Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF01A4B1B38
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726178; cv=none; b=OBZa8Apbx5jOrYMo9w6SPtqSwII+L2h0/SDWeSEWPaAere60kZ+DicT4CTed5J0DVAuUjiOxhvHMVF8bXrlLzCEtvKHpKshvkHLs16e4Xqbmnnf919IScJa8RtC93W7NPICribK7EWuhhl+HAK8vsZUnc9nAdCA+H2oTWdE5Xm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726178; c=relaxed/simple;
	bh=sbCiK3lk9rToDwJbJpH6HmjQ99+hXCYkkLWlr3Lp7UY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fly4Uf3g/W/WpEoaKCA9eqoBeygnpXklllZoOeCZq7N4CMeSTIWU87Jvpxv7Nmwv7e1jMzvctwH1LrstE4XtPAEWaJVOZkalqmOBsleRAaxumA+LUTQqLYi23gnIu+wXNkm+9L2lQKLwzViiJ3irkQwIt3dSh5Pb9JkF73TBGuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cuzjbV6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXhqp20S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cuzjbV6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXhqp20S"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dOpo250723
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:09:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FxIAsuzIQprdhfrEdRS8tnb9qVgGLZiL2RUpN9zabmE=; b=cuzjbV6WxNE5tOB+
	xRmQjQpo9FzGX0u7vKfO3KJi7OX8Onq1qWFTxMKhBfn/Z60OlFmfakZDr0qImtIU
	V9MTHVJeonc49XIf4D+17IuEyDmt4mSo47JM5ePzgHe8iYWMpOkkfAj8G9BlAZdS
	2QcNEbgXVJ9JHaMgCZrC0es95Yur21ybmFvwUHQwsD8EokUdUBbZgiDcZZRIwjW+
	HB6mR4A5CgR0hyQr5FGpdhqLw56eat1zIkD/z7ACYffLnIb2jR68DskFcCIz/DYN
	iejhdksOahX6j9UOZlxgqsZHQ1ms7KTaD8202Nh7QU/QnOntYs3l1Jpr4jGjCT5K
	gBioUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2390ay2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:09:35 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530db5af1dcso1651611cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726175; x=1790330975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FxIAsuzIQprdhfrEdRS8tnb9qVgGLZiL2RUpN9zabmE=;
        b=DXhqp20SkMonDQE3wAVeGH4UmxQst+12AfyhTJ/QatoRFWhtR/bYWCaP5Sf30vZX77
         Jtv+wynxmCDvVK82XB2QyiniKkCiYbQlMpFp7IA1Mce3asy3krVh50Hn72RBxIgrA/Fy
         Tomuuib6l1icBup0K1vUi74VGpkWlitLgxdC7q0zUtzSArwQDAweNxee3RBFuV2cri8n
         VqcteV5lJJmpBkraA5UbyHrcaWlG+TdiGXNeDw9qgsacNR11Wsx3bpaZY0vvM+xlpN5a
         czwZFtk7WsRdmX3hUohSwOGfHCap6tyyiQG8cplMl0jW5SsJcxjqQ4YfTunja6B1e9hJ
         FDkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726175; x=1790330975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FxIAsuzIQprdhfrEdRS8tnb9qVgGLZiL2RUpN9zabmE=;
        b=mSIYnn+Cw0RMfsKZrkkWMTGonsRVTmvcJXaBBKbEl5hS6ZcvEs4eDv94w9YE6Ahru+
         3r9Q1RvcCYMWju/qtdpMCJr3EGzCWX37eDp1Am4Itq62/zW0T468rum+PAgCCC5IhVax
         6DDS48WDPWFBR+Qht3nKYkP49ANKmE/Fq8oQIVK1sA4L+eNBlTcA/3roeA8spZk2RDKv
         RZ+9pPEWZKunhgT80II0GFiQ29uu8JKkmy6ju6kDpG0XINq9W8sKMgikAFhHZXtB3fHv
         oUv5IqNBUcxgUP+OBUYK4KCdwHQCClruCw3QrAGvkDt89ibG3fKokaPVI8RnTAWy8hSE
         iIpw==
X-Forwarded-Encrypted: i=1; AKwUvBxcFybishninRmOl4gWu/NSpEEbK0aFIZh0yRWdssde4tGa6DA3xnrMXagrAZamnCrzOAVxebjYHdacwmA=@vger.kernel.org
X-Gm-Message-State: AFuF++le73TQGv8XQkPLV14KE45O88ODrHQiQUxNoCemaIvuOgs3f/0i
	6t9lIiWVk4svNewLR6xrNjCk18h6mGjWNHmZkp07DsLFeo9jwbOQZdcsfB3WNx3qWzbjxGh/alk
	hX37sSm4mIY/rEYsTJdAiEQnXZ92ZU2aQbVnNoCTYwSjNfgKbJJFs2QT5oHHveN+E+jU=
X-Gm-Gg: AYBFou3Yg/JVs+6tmww6cJjrIeNTK05ntbBf3XdDL/H/KBwEKjlkI9RC8gj5iAIpTd1
	EVyFoCl3dS2tzklBdJ4pKQX1rYYeqQMLnJWfQ3nlwqVQIYapAD0qE2w/y+qwqWiF7tvj5WldhN3
	tm0gFDqoj2zCXzpxpxKD/o7aCkx1vIWq5deEvXdyrYApiz/8PKJEdfrA7bcw6CqC0GhHVXGOtKO
	CVlZMfzO521iU/uw8Yzzr35HWSLAd2gmGRi6iuKU11rIMbUbtlwnOQDp2qpB0jCHgN5LY9NYhK2
	RNrjN+i6/h9jNPFrxFN9MzjUgbfYXsshD5LJV0lqDifKIUYWMHPqwFaSAJfwlL0DnGfCWSuQ09k
	3cU0OFc0UM1YPjdvINLNB5Q==
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24640516d6.5.1789726175122;
        Fri, 18 Sep 2026 03:09:35 -0700 (PDT)
X-Received: by 2002:a05:6214:e8d:b0:912:16fd:b389 with SMTP id 6a1803df08f44-912570aade9mr24640006d6.5.1789726174703;
        Fri, 18 Sep 2026 03:09:34 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3237bsm627029a12.8.2026.09.18.03.09.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:09:33 -0700 (PDT)
Message-ID: <162cc52d-80f6-461c-95bb-4ab6b842c0fd@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:09:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: sm8550: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-15-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfXytpY6yPM/hOh
 k+iz8biWqUuMj5jOmKBFbW7/yEHBwECKZxyedSeCxTHUvq6cF9ICbyXV0gVGN1w7TfAXZShyZjY
 cPWWORP+eLGgG/9GhApO2pfi/GRAGbQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX41ZBBTC5orwX
 ZzTg2VT8gr4bpDqcsZ8kbNFqXSOn3aiF5/hfMXzkgv2NMAFgCbbcMMPqIpN04fK7rKAFAPr9vG4
 kzxofh1C6PB5i7KvtuaEBQAyEGdek2g7fHvm9bbLMRdGb5WdozvsjCZCcVWTkME2UoO/RvQz5Ud
 krNxiWODw09IIqlKNhiNH8OUNgvqL9r62NuW0tGuuTz/gHFJVhXMz4FOtyg2pLs1MWlcS13TI+o
 sXdKYr+7XxKb7vnLo8JssIMfO4POaHze2DmG2PEyPqDfGX4n31jti3F8zwgN66xTZiWo/aXL7E4
 xjH2zOPSwpJUJfDQnwB5h+EWi8I4T/bZmzqPR8zvaBKc+3nTXArDqmNkV2ktoyDTIExKW8mhh9j
 vwOP91pfYdjYo9Z8GEztEjJ7GUo5rDILLwZvv+sk/7d7JdFjx7nyyGFYN6HQsayg+RUpf+P4Ign
 5sbBVlW5dMTCYtH2axg==
X-Proofpoint-ORIG-GUID: 0xwsTYIplBdfWm_djl2pP8bYrBvDuN4A
X-Authority-Analysis: v=2.4 cv=I7zw19gg c=1 sm=1 tr=0 ts=6aad0ddf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0xwsTYIplBdfWm_djl2pP8bYrBvDuN4A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the
> controller overrides to the respective port nodes in the board files,
> renaming perst-gpios to reset-gpios to match the binding used in the
> root port context.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
