Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B24D8DBD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786098; cv=none; b=sOHD/VBoT/yfOQsIP4/ME1VOF/GLSF9lctn2BKn2LUglyqJyPKsqDHV4nG49zLhWrcmSbpQA1WuHwuPi+wJwE0hLStOgJnXhDjN8ACflh/fO0H2kNz/pRORIjU9sGkPeemWSy0ZhBUGPTPrT7k0pvmB4WSA1nSuZWDGSJ+GLr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786098; c=relaxed/simple;
	bh=yzcBe8CWx8CuKM6PhuNC+5srTyX+HIdMDmFUULGmUx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fs5ODxNOORo2tLoE+UfaKiHzDDcadB7QL01t3XTEDVvboj+rxXHUJCLtVML9jicdODOVf+UD26UUv7leYzZUwwFzg3PE+IiM0XBQBPGA4IwbXUEAYAwIhGbg4IfkXQH5paQgBLZxvN5rqqXiQsd3MeKncijWSKbdaqDAYEWlbbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYNkjYRb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e/Isk4cM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYNkjYRb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e/Isk4cM"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An2vT3873321
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 13:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=; b=LYNkjYRbHTev5ej0
	8iVNfShq93wGtCm+CPnKZ1T8naeU6UCiM8db30+Du8vbocb6VR05AI44IZ/GtHHH
	YiK63bcbMI0MHAuyFXqiFcOyK2ap147FvNB64sGi2aFTHcSylc1HpfQBT9Wm6wRS
	RgtEdiy80Jck9TB4+QbCkJcv9B/r2Cno7ArZniWE4JK4CWOB0kDBO9ieKhMWN7A6
	CiHjHTttfUZdEpCDd6nYFrtIvE8Hka5212z8H6Q/hI/A8lLr1Cw63iMvWLnFc73W
	zxJMOxzke5SpMrxzMxxJ1skbunf0Hghxp4835v+lidPHYIZKtRyjmTAeUDIB5j2b
	womCWg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj23hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 13:01:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6b8a88b88so5421775ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786068; x=1789390868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=e/Isk4cMVgiZFVXwpulJmrHaEMppyu8O8IL+Qjx8gHoSWIbjnuY+JRs1XYjAi8Oed1
         wtFMneCbzVCamCF+TGhAxVpsT6QtRTnfGKZzlk1CJflHJeJ7N5ZyiUQGKIjkslc5/7mQ
         qyQo36MovMcl1qXX5xzj5q/XGDk0/G1epiYi4sLxFua9Mv8eXoUViNlTmcRKpzKLlEBU
         RbNMMSrrJSH8Qry6ECFDJLu29MA0+jYsaZAeiyUsf6HoYC6q0cuh2LbX4h7jYSIZh6tI
         F2MnuIGGzEthkRoeDmTZyc98LzPf5UV+UEtXe1Y6f0TlCJfdehP/sow6IEhQUjppKQsQ
         tMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786068; x=1789390868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uV5FX9EAa2yK79TkM7YVqQLjk7WhAcUlfgshdf2q8yE=;
        b=P3VXnAD1e2XudQZeo4+c5LcAxpc+Cze/0nxyqjt6dcxuwcIgqYRwOnsyQffoxU5Wsm
         rkVDrM4whou/QtvL6rSajzipaRlleGRQk7JDidABeOxAcgy4UZ5rP4c32xXI+8WOtNcC
         uS5fEFBcDE/8h2yxDZrmyozM3aMFXpDNAZ+0gGuHqmGZMzIiYuA/qraW3QrSBtIN78gg
         YMk/1lOY6k5FrlUNu6m9vG9EvzoDHwSs+Btr8wRjGP1L3notXUzTKO7zduwDIqnQeCZ+
         hITQo/rCoKJyv5OosMexpXlcy4E+TpHrN0MAmnvUYcq3QBjRRlbmcqWC3EcFeaPflntb
         iFjA==
X-Forwarded-Encrypted: i=1; AKwUvBzlN1ng0tEstGy38hetcKakzvC0y5qZ6O3qEjktbwdYYRImkB4TX6s8Qqmg5Bi0wKXQTLwcaRUgRioD72E=@vger.kernel.org
X-Gm-Message-State: AFuF++lGHF8Ol/F0svfMFOGehl6qI6VVosR06EouDmlxr1i2OWobZY93
	y+tyD5Ej9VDnqx6G9aUmVVX9AG7ssM+RlXv8ypIMGn9OygNdQlnlcd5E1G54Tv4pGsY5EnD0l4l
	Cps2Pe2lXOG9rF0iqaKne8BYxYBOTW8XKpGhap/xS72ig0cpWkrj1Ju9KDjowTwBUxts=
X-Gm-Gg: AYBFou2D29Hohs3Y4dh2AjlRmFgmZ7FfXmE6lIlfrHxPVbm4YTZPnX53cbrm4ZVlzXJ
	sl2qYoPooyYWY0zPfTl7C82MB60fKNF7pPTzIe5UVHzH5YhZqUXxvvHa6WXj4C9vuB6ZwrOyS53
	2xhF+D2RD2dqJtC3+0TWcT2x3QSvz+UmQfuEiRiYBUklleKwq6KSZP4ZMiqcuowAu+uxDLDeKdI
	VlFro2x2QOdi8/sQW1I95Bxx1CHY/yxcb2FBapGl8VoS6yN8nb4BTdyOPnn/IJjDHTkQNt782hG
	ZxtWSMGTp5pnChY4lZ4hQp1lvbCc5tX+11p0ETgmKc+B7XnMWre08uCTaVj3EOAc94qmHVHXg0D
	Q7ZPNYYDgLUYCgm/jNWzOng==
X-Received: by 2002:a17:903:38cc:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2db276b8656mr154074835ad.1.1788786067843;
        Mon, 07 Sep 2026 06:01:07 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:939:5924:e319 with SMTP id af79cd13be357-939914ccf18mr1133602985a.0.1788786048213;
        Mon, 07 Sep 2026 06:00:48 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d036652sm477639966b.2.2026.09.07.06.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:00:46 -0700 (PDT)
Message-ID: <4740e69f-23b7-4b3e-8d75-d7127dd6b140@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 15:00:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/10] arm64: dts: qcom: ipq8074: Flatten usb
 controller nodes
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
 <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-ipq-flatten-usb-v3-9-13e4e0f63123@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfXxEjqg7zhGFRK
 NZrcSJx1UJRy4vDNBgIifGBfSI05KBAQDIbW5X+Fhd0n5133XW6ZDN7w/yVFpZe0zg/T1IpkDS0
 Rm+W3NA024oWuGIaeRArBiS8RgUmUtuyYBe2WaD3J6Pvq522x6JTBKKshjm7r2l6fZgrcoKbiaw
 NEIzhEFLQ5SdO2P9usEt2+KrsxSVw7lqI5PD4UUs5+enYd07wnGohijn/ax00/3AWkKPxYro7bm
 BjCswF4jyIMz4Xdqsw7DllRsGmXGWdSrJUTmlNjTfZg+nunRgqUrqeFbHKlE8aNcNdCWY/96TWy
 O0LfLbvZakXu5KbubPB1/G9I2nOA73EtJ4I9sJT9n4MigP0QJ/hu94wNlYsi1mbKhA+Rx1cSZ+C
 NS3h1masj/suVBDQfg3/mrzpFgUw03bJIaL4x7tpBtDrwobd9/VUIIxlFiKenethk8XFt++Pml5
 2Upzuz+yVn6aznKZE9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX7AvHXpRAQaNy
 0O3u95aYEPUGSUhXmO27tMcmPDiC6zw7Y6RtvqGX4cS2M2VP6xss4uneYdo5HBH4FYI4H/V2Khf
 pOEX00ezBU7fXM76KMtqUUXWJOcC95I=
X-Proofpoint-ORIG-GUID: meavsy6tIoMeUnQrqMc87BgLogwsv7tG
X-Proofpoint-GUID: meavsy6tIoMeUnQrqMc87BgLogwsv7tG
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9eb594 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=BCToOkYIF-vvb__y--MA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070143

On 9/6/26 6:46 AM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, fix indentation of properties in both nodes.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
