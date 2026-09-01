Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C9A47DD4B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788269044; cv=none; b=cHkPq80QOxJ2WJi7svf4W4V6U90HyrxPDG4i9kVBu2XzWOdAlp8wDJZPsfcZkl7vQpDGWJXbvqV8+YKSOvKxeKDBdurHY8xFKH8F4uJYVt4Tym6SUddj4WOi+/XjtIMhQrZm/pOrfEf151qrv0rKc7hlFx1fqQH7bbnspdirGBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788269044; c=relaxed/simple;
	bh=3zqLcpTLoMs6LhXkatdeCvR4ba6QVP2DbGRDZsgza/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dKkm3i8sOHeUo6hilD8k1oMPS41DG0chklAMk/whdilJeFrghey9tOQAAKoyTWs/viJHscKWAky43WBzbACXilCjPL96Clp5hW55ivhNtRe3PinLfH1BfuL43xzp5qwrqHqtXzvbLlzdNydFB/yqgT/hXaUbnV2Z6DAErd5xhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BYfG+sLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELqFcDg1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BYfG+sLj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELqFcDg1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJYa82323262
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 13:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkFwD+08A6OWMNPULH8+kTN/U4oiF3aX3TKvMYm/8Ik=; b=BYfG+sLj9Hfjc72B
	CcZefthfnKrC+ldP8AWur0gMVr42HfGCV8ycCTRTXXInIJckjLB5ifYs52Vlp8zb
	PDlpPZHZTat7jVN4U6hGbrYvIuAIW3FEfN7+pjFjw5kOJxpGFjH7ZdLhsF8Sr+9T
	W7LMZ41FViKxXxQM1jvD6MR4xLmVDEA35V4EXehK05c2cMOKAoiBRzA/KLt8FW/+
	lGW+eZGOG1aQQlxxKC6DoX50sIULFUJCaw3Cn4ycZwt0zl3cDDLsqSXn5K2EoOcz
	D+AgvoHskfw2dbYx+uO3GDiHIF/CZ5XZ7pP10Wya06BavVHTlYI+cCOYZ3lYtJ1/
	GPW5CQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7camgu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 13:24:02 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so143786e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788269041; x=1788873841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkFwD+08A6OWMNPULH8+kTN/U4oiF3aX3TKvMYm/8Ik=;
        b=ELqFcDg1U9ggJwKjyur0dfSv0Oavsm3RtikMRaQ8eKgiCVIL2BbmezcwAVcjYC9qez
         ed+P+QpazvuxU4HgPkEBSBqNOGsFfH6rDtDtOWvTERBTP8oApiwE7FaeFp6wcVq1CV+b
         6JLMf3ZBqrSXzg9e9atV42fGHHWbGvFXVAyOmP/KE4ceGpip/UXp2OmcUnqFWEG/oksd
         eUzTzLP5j5MYMbK6MIC8Tg3aRL89PTvZ6qCmLX/GXmYNZ6KjUzce7S3c18z/lW2H1VKD
         0+tcr4eMyePDK1VieJW8i837nLZ1cIxQ685eQYKtOpSNhQbeOdrxGug8WyOTS0mVI/iB
         J91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788269041; x=1788873841;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkFwD+08A6OWMNPULH8+kTN/U4oiF3aX3TKvMYm/8Ik=;
        b=g2sxRJ0ogFWL2iImuIQXhA7Ofjf2T9gjgtoAVNu7YxyRyOFwMYLCqLD0yajLwAwdSQ
         ZZQ4E41o4uq05NoLYzKVdNw22q8TIKkxsDkpoUsJmCbnzf54W7xC8z8nc8LZQbjNEYUm
         gxc/zpBAFLjl+MmikS+0cSNO45Li3jr5IajTaXdWlUoXvpdqDpWVvvTK3bfGWDt+Ad7N
         BpkgQ9fQLJFR1El1RirHGW8HkJwiEbsxlb6tN9WKVIDyjIt1zHEqJEv5JUjDn7ijZaeJ
         NVV5qHnPyn0hUUo11ALNGReFtvjB7ygzwfTRXcU7HNsn2kHgI++aa+pa5abSwlcam8dp
         l0dQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYEhSwE3zaKDsmA++fVsS65HZTyNEKhcRT1JUDrefBLfjgY0NZ9LL8Ok4aEQOI/1sr5anVma46dbu8VQk=@vger.kernel.org
X-Gm-Message-State: AFuF++mrQ1LDl1Y/QWyNFK4neKdr6JrV9azW2BYl9trWtPu8AbYXLG8a
	qXpuo16NnBjSo/clcGLYDW/Sy8YjgFOqU3latItTUMZx892rHjcSTRRwlLnY0m89d8TO7NQ5F9k
	c18BIY2bOvkIMIxxJcTZh3wsWp+3DNW4smyau4EJXdy0XjCxi51DKArXpADMlDiCTQqI=
X-Gm-Gg: AR+sD13d0zbKaBceOW1VrwZp6lWw1sFADYjRFO7tesNdpNQ7Vn95/ZMbsldjAPdpm3o
	neH/826luP8eArRUdda9WEkb2gZsaYsVt1nOAvURnLfh8o/V5u0C5PC7NcOuODFAzJLatZS6L/B
	39Qs9HrxeKRTYicw4rbJwTAxrgYl3u2H9NNPlhhBMAv8d8cMhug0ttzOvM6Yl0jkWXYHaBNyXNw
	SUgfZ5jxQoYvsgzioqQSyqV1i29UXomMLTA3XJRlBqS3vLoiXq4IozY5h1JrOL1Ui6pX0GmiAPw
	0CnJ+vMPZH6b0Flb0tST6iwjdE/KnaRrRp4WbodBOLLvNN1XCoDQKQ8FEu1PCfk6e4J1nfDq26s
	/SOUXj+oF9glZqp4HFcH5Cg==
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4259045137.2.1788269041355;
        Tue, 01 Sep 2026 06:24:01 -0700 (PDT)
X-Received: by 2002:a05:6102:5044:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-7859956a0e9mr4259023137.2.1788269040844;
        Tue, 01 Sep 2026 06:24:00 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e89ce501sm2964115e87.18.2026.09.01.06.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:23:59 -0700 (PDT)
Message-ID: <f4f8fbbe-1fc4-47bc-9125-296109e20173@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 15:23:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: ipq5018: Enable USB
 Super-Speed PHY
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
 <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-12-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OcyoyBTY c=1 sm=1 tr=0 ts=6a96d1f2 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=_thwKDryVKp783wjlzwA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: T7LBAthfBPN0uw4YjTNkn2Y90qNRJ5be
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXwxlObZwtgOBd
 RW8bUVz9CoMDY2U3vM5fXrTEgYsuWp1MwXYSrxe9S98Ve1XX9iytCpgLwCyTtpJhrQi7ZkR338x
 XXh0jBvTQ8djKX+DFdyb8nJ3A/gNlJs=
X-Proofpoint-GUID: T7LBAthfBPN0uw4YjTNkn2Y90qNRJ5be
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExNyBTYWx0ZWRfXx83XOe5NTmQ5
 zyrovnVQzHRV3QG6neXc7Hqhpl13hMvNDOSRoZtXa4WAyiVD1K47QuEoMGk5U2cHxITqW8hJJWC
 FLWN5A3MO8ri1FzryfIlqeTRdN1qKXpZuPBxoCzIDFzAqC/bBb5OHf2dfv0ndC7ZtfXdNlOKlfQ
 AhZOB+ReoPyugFWJvVR+NCj8196V4UTTwT3C2kY0OzjA8lJzZe1GtZ1JFh4oN6Mebs4RaQU7o8S
 qfXO33k2siUTAzbvokg7sGpBvozHLqIaexvORBgMjdZXtnfGUz56baJZXxU/ZFCcpq2cUUOz+Pt
 q1YHKYpDWmfx0jj8BVDhfh5NNN28D7w9Q+OdhhgoeZSiapgVyExYKBKIOk0abQ6Q20BR9zi9+tA
 clc4vbS9au4OsR8PG+zuwSfqFGAz/QtygaV4FG3MiQCLgu6vFFgxcX/2gITmX+X4w2j778FldWP
 lsrARyV6NtkQQq5lYAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010117

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add the 5V supply regulator and enable USB Super-Speed PHY support.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
