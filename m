Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F3937BE9F
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790665079; cv=none; b=Zm6D/xDMoNBQ/Wlgfrl+ODCXhUyAbu1tYZebNZ9z54Z6oIczbXmhfzcnUnDhUDoXDoEB/2EskbfcGOIRQjfscA9qO/j768sgk4YZjwSHhTbyTafpURQqUhlsPnltgc8rUkNXTdx1x4XWxwXJL+elGhmxxGoKnMODfy+nGMwXRfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790665079; c=relaxed/simple;
	bh=xhwVxfB07XPEgYR21geJ9/caheAwF8RaNX/1vDisvgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qkbmqDmlbPh67lUXx5r8oXvGgTZcPSZJ65wq23QmnyEYeHiCKgoUYKn2r0iCvhcHM5BIh2h+ZDh7i/CEXOeRbgrLIQS86hsRT6zrMkeOTK10nE4pXQHqcutkHbVsd2a4dxgMJ9Yj96NfRr0/OL0VxsAZAnnFHmHJzjy+h7oWHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wy+hE6+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R60XoDCZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wy+hE6+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R60XoDCZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T47Rws420502
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KdlFhgFOCr2Hd9m/lrgDib1GI4AIWOWUGzDTlerfKzc=; b=Wy+hE6+IAuyX4sHz
	LutrJ9cjK+RRoSM+xlNKi+JALg1EGkmDrAmgvjmNl9vxdrLAjnXfXCUk67Buu6hM
	eY2aBTbGZ2uU2AVCpL7hp7cNIjPmUtlUHLpqfNLh5RhknjoOtC6RjHdztgEWi/rW
	HIN+fI3U2ZMD2Livgbc5NmXhQEVIgg44PZ5ZiQ0dvHfZGtMW/XBsLgWZ//SSaA7V
	ygeVhbskcMYw9cChNajyEcCXCEf5d3p57tSYcf9d9NzQ9D+XUDaoaLoJH799Zu+j
	vZBdq+sD3C4FORHASs43+XX3/gflYoMtd3BCRTCjId/8ZT8QA5gppmuPjE4a1FMH
	rAxUyA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyxmua46g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:57:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df5a65671eso6801015ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790665077; x=1791269877; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KdlFhgFOCr2Hd9m/lrgDib1GI4AIWOWUGzDTlerfKzc=;
        b=R60XoDCZMbFTAiJ9t/HlxOKHQTseYJzgKl5YPp9sjInGDOwLGKruSiIpAW0X9024Tt
         2LRfUU4weZOQC+NUFDzu1/P5cIr9khUHR7MWlqUtHMQy4KOsCJ4ioH/owYdg337hOfD3
         QIDxOBUJeYt67b+TglnUtoW3KWe51Qsd9RfUgPKT0XJGi4Vi1m5rm2C72xJhIuo24eBl
         NUJ2Gdo0F1iNMYHRmc8N2fyuDJeuvIZOTvUQOe+CSc7Pj/qPqdWaOyO7hVohygnc3KHT
         NbzmJ4RJKw4kizmoMoWStngDXnI2TJHy6BaBDi99KAoydZFFA1N7denEahdy+SvMbZR9
         cOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790665077; x=1791269877;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdlFhgFOCr2Hd9m/lrgDib1GI4AIWOWUGzDTlerfKzc=;
        b=lTTbnCtnJEuQv1LWafPMcfpdnbR8zq5Q4ejA5oL3j6QejjqiPrvC4Lpj057qSxxdkS
         zNT0pRYptDO5b4ByP76zVYTKiZdT9Zyh2YAOqDDo+juuPSUtm40o3bPKWw75UHiCH4de
         kNOVGcdCdkse7nbuvdJZ7ZmypVXSMPuUCuVrqUq7WNxLjljjqp0GuFHM6PgZuFUyZiD/
         aG1cvUPp83Ca4Ar8FMhihPQpW5rbpaB0MD6zUZmVv3uGSYPVs3+GBQboGv3/W+c6piNP
         mLQXMV4QeyA/+2s9IBHy/QY7IlrjjW9v2Q1F0fvkANKnhhNFJBERniBJC9bTE9BdbrJu
         HC8w==
X-Forwarded-Encrypted: i=1; AKwUvBzP7wAHOEYtL/s6h6bDzL1pd3JAp7c5qNyYDQUuMa8l2EiZItqOyR8/ZakMudTEZ2u4PVIvcOWwFoP6EHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOW3MLo/AAOe1p7WbHYTe5NIM2Vid0SqBDiOibfRwnW63eu0uY
	QQVzKpURREswCbuLb1e1C5GYdQLfvXrYrgH5LZiWmLzn0snIwFN31x8HDhvu4gHlUcM++lm8/Ec
	+D+aQxkbE3DnnJISD0lK1Ymq9gmfayw3eP0eBK3+WQPZv7kPPhdvkc8p1Fi0rj+NnDlE=
X-Gm-Gg: AYBFou0ojriFZvYX1GMPuDKxXXl5WSLMiB0HOBX9haasWjwXrZnzIszMUQojKTeQfSa
	HvHaQFpUzOl19FqijMeFrQrK5T2eCY6QOL8cXlOiZGeBspilWcesH8Ot6Aucr2TwA3mUgnR206B
	otJ2Xez8JMVsyvznPvhDrMXWqzTHEu5ft5NnmDUvMaZ9Xf15xZbJZsRSORJnY4wEtDFHMQujhEM
	1EpcrXcIAz1H4fqppa8rBV6SpWYfqEp60RKv+2qHiEkrR7KcZoQCss+TxdW9tHXox4422uqhYU/
	CGbvnaUOoBkJEwvlM2MjBVlXKwjokUUTFXnnVPTBLVH8njdWy/GhT9TRhUI2T3hCcxYnWgMyKIe
	QtCrKZ84rHG21s6MNwJkWKEH7kbwQmznORX/0rkcgppPVOc56JXYMf5mqguTxy/NKS0UvSoQPsf
	0066dG2u2JWe13
X-Received: by 2002:a17:903:b06:b0:2df:8ad8:dc5d with SMTP id d9443c01a7336-2e2c534ff3cmr9677085ad.12.1790665076605;
        Mon, 28 Sep 2026 23:57:56 -0700 (PDT)
X-Received: by 2002:a17:903:b06:b0:2df:8ad8:dc5d with SMTP id d9443c01a7336-2e2c534ff3cmr9677025ad.12.1790665076175;
        Mon, 28 Sep 2026 23:57:56 -0700 (PDT)
Received: from [10.79.116.124] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9141a58dsm50918405ad.42.2026.09.28.23.57.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 23:57:55 -0700 (PDT)
Message-ID: <3b6a8f8e-b014-4165-bfa2-92126bb2f7bc@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 12:27:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/2] arm64: dts: qcom: Add EC support for Purwa
 IOT EVK
To: Bjorn Andersson <andersson@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260629-ec_support_for_purwa_evk-v1-0-e082b70138d6@oss.qualcomm.com>
 <179020199814.520949.2112926853306939366.b4-ty@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <179020199814.520949.2112926853306939366.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX7Uqr7OPM27Lb
 kKaw2ElbIb98MZuhwHqD9Bxj7SSGy22eFqIaCFpxEn4O1ZwnBpLChuOOWRn2N766juCHXUANpZT
 uzZhIKV3SHsUW5wwNpQl2LUtClJAVuUI/S4WxOdl5Wx2GSHs+QTXxYeVS2M75Owl/l3qDxsy2tL
 H3bw27myqAR9ERlu3GSOWFkWbPUtEjYInyQXzDS20EG5mOckZyCtLYju6WF1CCryWiKNVz02t6I
 FP4aSo96JN/ZVIOsuCdwVJv5TivqUG48Ht1VK1dif4obcdGCPg3NaGoKum5SgSNWhUjYjDJt/Gg
 wu2t5cqu1npba+u6kPXfQwU0GJi+idAKjP85/RoYaP1vBem+yZwU5FWLlEjVr5nt3lCk2RUNNiz
 Bsjl7yeSv/E7ym+WlVcljedU6ZBZbP8+PqqGLf1aroshzGqlZX/Sj1xKxCzGRfhgjTw96UlPKX2
 PYUY8hPwiuOCIN6NQPw==
X-Proofpoint-GUID: Ml44kyCWVFWuegwE9jS6CdqH60E0I68P
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAyNyBTYWx0ZWRfX4D+ky0vZygw6
 3pDB9DUwt4qtM+tOIVhsj1zmg/++S1TEVPgfr0Kdr9C6xUpVZcKm7lPsTQwhXXmkbr/0R9RkmmU
 rx84uWhuFqJHrfeDHn/NT6MCV86wrDs=
X-Proofpoint-ORIG-GUID: Ml44kyCWVFWuegwE9jS6CdqH60E0I68P
X-Authority-Analysis: v=2.4 cv=c70+0h9l c=1 sm=1 tr=0 ts=6abb6175 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=hSG9Uez6MuwPyxXb6SAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290027



On 9/24/2026 3:49 AM, Bjorn Andersson wrote:
> Applied, thanks!
> 
> [1/2] dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add Purwa IOT EVK
>       commit: 9d1a720973d0f16e0f93b658f82c45033b61a02a
> 
> Best regards,
> -- Bjorn Andersson <andersson@kernel.org>

Thanks. Could you also merge the corresponding DTS changes for the Purwa
IOT EVK?

-- 
Best Regards,
Anvesh

