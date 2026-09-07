Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F029C30675F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788785833; cv=none; b=m/vMDw5XEXUn5mh9NQBLyQwLnQ4oQNNnzbztpsSVksI8HniFzAGg1beELd82u6TWWMeQgIdtGE9MQLruHD577uzZBha6H2SzBGKDMKvBkg84OTgIGbINaRX17mNximiJGbSnvPjb238fdFA1mHaDGwmH4Iqx2cmvT+vRTLwy5Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788785833; c=relaxed/simple;
	bh=Q/jU/CzwiIUS5/1+gDBO6vEJCkuSQCJSMr8mBk+OxX4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t+GgBpqc8JckSGq8gRmAn1rGQOcgRjmRG86tvgyuXtZWQ6AD5Lbl2CUA4Zd4NEsRQj14/1s3EYwmYKESBikxcXeb1mj2J6mCcZQIFBoycGah7U4w+KXd2uzhIblhQQz3xN9dYmKutHFx8PGbl66uz3NeC77qTWZBxfmkwYdDjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C7Lebzdm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gcTFQRnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C7Lebzdm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gcTFQRnR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AmudM3349032
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 12:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=; b=C7Lebzdms5HqeqC3
	h2upwCAxlpFGF6S6/40S3On/uUXxgxvT+ZEaDqDIbGVSwXyNvRgRDWK7vuue8yLt
	6HipWeu9pOELQQZuSwdiB5Haeq5ycuLUldNAWJU1zTo6Sosr0O9lJcOc4RuV8VoN
	Csm2fzKGNn9vvRPBPtuetUX0arXMaRlhQUKNWPS3XeDzhfSDrfW846fod5f5onWV
	goAKi/9PGY/Uh3HLqwvmQ3eLWUZojTUOeau/HrxeXlF6b0xvH8EVAreFXfJNsGxU
	zJqKYDhP1IXF16KiSUr8cBuTUyM3YqrpVbvJkMC1N0CLiuvZpznCHrNxGUXmi5Os
	v9YAEA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx0uec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 12:57:08 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9104c027650so3881496d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788785828; x=1789390628; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=;
        b=gcTFQRnRRnWJQcpIW5wewZzuzG9LPotcBmpB49N1vydjlLltz7mUeFEEjpStCfL7Sn
         fFQX4Xr7a/lL4GF9PU+C7kuX6mpiy3vgRYYGp9BJmZrlaPDYduXhs1OD257pm/JyaMd4
         KTqYxpdne3lSCphnT7xcjhPYNrW6ddsXBSl5Dy9f3e6HGf8fpDYMMLWN1SY8EIPaXnC8
         VQ6qPlDb1oVsGBu4ZUFlVQQSfWCrAdYsdxOpL1jHqWQPEijEUzIEjHnqbVp40r1Qtkr2
         o7dBYgnaydPEtvMeBMvqGzf8uylLkqhszIyvSEjavFN9uuo0gWea2rE2bFSCGrzqfblC
         +EOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788785828; x=1789390628;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVn+zx05ZG5vgGFE3mDfxzd5a7QCiGbj35+Nu9q1D3Y=;
        b=QD5ym0rVofjVyXf8Io6MtAresSwEBZkccOXWe76Et/NLxgaKV3RhvsLxTIKXYWAUvt
         Qm5m/ZwoV5R/kclqdZjDsopZmo8LD2elg/1DwwXZYvrNDpen6JyOVkLUWgfXIPcabpEr
         5YcNWxC7214kR1CZXsxi3Gzx8x+KrjDeiWdkNSCmBEotvHtpGi/p8AOetu64awCpJ22B
         UVqGhSiT9WEVI4scb0pAoAFgduOOSM+uE2tHfrbq2/itqbG394qtKVG2CViLAamsOAam
         XzHWeWfPYiznempZRGEDFGEC+NmMfWhHoTkrlsnb7xvBW5tbTn33GLvFeT7+z6GC6oGj
         YASQ==
X-Forwarded-Encrypted: i=1; AKwUvByLBPk6SNshHypoMfO4AGqnmIegnBoOxJBzwW6wEFHsZpgOwnIZ0lkqnV5UGHyR64yayukBmVla695XJho=@vger.kernel.org
X-Gm-Message-State: AFuF++lRaqB1C0g+Svkg6HQE6WxqpDt2Yl4USNmsTAc8BOvDtsu/wByZ
	SUdI1hsBuc+nKUpZZ2GqvKet//JiErdoQDf49XqPWLgHfgKWU6kCwEK8RDZ/7KGYGW13SJKK5Jb
	d7YyQTj6JgDg9UrkG7AzqzWgJ3VYAbWje9uxeyRp17jhGR7FMIjhIc3VHrNy3LUQU7uU=
X-Gm-Gg: AYBFou3qLOdacZVGV0VT0sWT1i+Y+t836buES3hVHYoyv8tbDDm8SYZQ6K3YOYnalKo
	IXO9kyYYJC5qdZBiN6I+fqj0Uxblkcym+DPnKM3kKxl1/w7cs9yyzqCewiUvgZVMFEK61VXorae
	xIouZVoYHtmJoPTw0iMxUNLgYZDMcoB1g4SOXp8re5cpFZyEwQ/K7kcXC3JhGZaF5dJZzhtRCsC
	p+VOpTqibY/36MmoKcSKgHUOEh0WsiET6XHV3PZwAxF2y6pDw8h9xEDGnjHCYYKHTtot9k7ND/n
	md9pjtu4vns3Q5Gwo6Q8xC77GXT3n17FE97DJR2f1pKBlN52adZwroJTBHe8XGIK9ulaU8Lun3w
	5mUIlI/NfVS9B4I5PRz5+Rg==
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1231542985a.5.1788785828004;
        Mon, 07 Sep 2026 05:57:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4141:b0:939:47f4:935a with SMTP id af79cd13be357-9399188d614mr1231538285a.5.1788785827480;
        Mon, 07 Sep 2026 05:57:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5277e6sm459162266b.27.2026.09.07.05.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 05:57:06 -0700 (PDT)
Message-ID: <7284d02a-bfc9-4d30-87ff-32f9ba65cfec@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:57:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/10] arm64: dts: qcom: ipq6018: move DR mode to board
 DTS
To: george.moussalem@outlook.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-6-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9eb4a4 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=EtrS5e4rPv2Xu7PadmEA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: lbZTWQoEbdN9P9h8UzU5tahJkjvBR_Qb
X-Proofpoint-ORIG-GUID: lbZTWQoEbdN9P9h8UzU5tahJkjvBR_Qb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX1AINIxsXI2BC
 /YzQuLa4I3hUMHh5BOan4i+pjX84GL3VjqZDpStXVXvAXoqGstIZ97zWGNCTYUzAkzMTEioWLZw
 AaIBNJvPHiMt5U60+Qolluror6UHsFQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX5+zM531jGcL7
 Z8h4XpLCjj/Yytx2HNo5i+diN4bNUUD545pcqxcRCW7NQBE4m5Y1K2f9hyNP+r/vVWa66AbY1hi
 ddcGp7fngJpHoMpFx8kH6aQ9JoSS+HXB7AlBUmVct4tjHKKne3z9RR/NyZnMMcX0DMm3AMgw49f
 ISB2xP2vAAyscsN+sXSVnt2QyU68yqt9zDqINU4e9aG46KeueDnmxwbw385Q7g2Q+yPaadijsgr
 G95U2m8pXD7Xb7i4d0fQITMM7QbWIbV8WI+aLuKE+udkb2D+VY7mHmRzsurMdNzDEptEKo6pf9U
 NbsdnPWXYl485Cnw4TA0NjHXi8UZRJKBJqp59TTLpglRS8AXNUnxxKxYbNAfrdZ4oNON/GQ/utY
 97u4STjV10PkMhRTsW/NqCSfKo+yWlh2OjfOIFJYZFm4T0UtKylNVsyUnhBo8XxWc9cvMyI+D2K
 C/TshuHcphV+sO7jZTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The controller is DRD capable, but it's currently set to host mode in
> the SoC dtsi. Unset it in the SoC dtsi and set it as host mode in the
> cp01-c1 board DTS file.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
