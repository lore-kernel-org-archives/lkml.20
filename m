Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEFF2C11DF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388767; cv=none; b=FwHmAXyWDe/WpUrLg98FkMq/UsqWLFBq84TfkPfto0/r8jArAhauE3XU6kIB1pajsQ13dMlgnQCrbMBDV0C5ISNQXsa8zLeq/abzxIvfSxzivCUCMNh7rUj45qQKOQDqR8Gx3irg1yDEURolyBhv9J5sWnxNK4EPz8UPvou+q7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388767; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7mN/OBB+9tCkbEcSOKaO3BsLeaAE0oABWfXlqr98CKKlXfydBshsmh3P1+j31rpG1/zmOaDxfPNJdGwESDRdNMF4LNFKYQ7AzSyKOJMIjxwYKZiypPuJWIIuShd6TsCHvdELS8avlRfRWSej8irXWYgALOE8sjbHxxNbR1DNpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QW+Lix1s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QdARO8Cb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QW+Lix1s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QdARO8Cb"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAmLTq4032469
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=QW+Lix1stPbjEzJW
	qAh5sSunO2KEbqlWPSDJxOj208n2I9GWRqNPh9cji0t3gzzfv+sSUJHwfp2lqomc
	8HqMx6+6ujRwqMVibpTSdTKd+ghInjW3rJVcECmbfMafitrSRgan2PSudFQg+DKu
	DS3z2kfVLJt4Qgx2UOeNEMdXGoRIPjHWELv1PTjkVLr41rt1c/UtoFxLVYYjBWS6
	CmapG46xIbErD8qZyh6zKKNf0maYL3mIMOXT9YfLGbvOLp3qq2YAFogs5pH1Pg7k
	o2oKqfMmQtIONnvcaynfFwAQNOhzAeIsLLMfhRbSv+8NPko05tTdi7fwTE79i9zl
	PkKlzQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuq8h56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:26:05 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97b57ef2bso22584e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388764; x=1789993564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=QdARO8Cb6sPQsHHc6oLRiJ2YD+RVJBs7orZRkXT7kpge/kJsd6yD7FG28U4yOczvOq
         Kz9bIi16Ft1vRIWG289ECIPPfMsz74LJFI7LP1kLmyyxf43EpiokMV+8K6KSEXalglNJ
         fVgnWQQDydgRAprmcw4lXtDp1ZQXPyu3jeybByEgwSBTK1+1LNCDgd/GsjdJPORrUsGo
         TySZ48BI7gkPFowEx/0FNHj+z25yCitcBviN5e8D0p5LJZu7FFY+bkvKguNj0ocWrvju
         yaFWf20bVFzmErWfQ+DSthdySlUB3LYjC7Aum1tC/YHLlgdpJg/WHZsllmFJ+LN4X9BS
         eY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388764; x=1789993564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=NYcyeQYnqd3ZJEF8FzArk1Zv3Tzzpb5+GrjYa6lqjFZDtPkiw/cvA7PzVfsNd24VSd
         wH6Eedeo3gAx/WMbd+1GxXxd3ssDkTHak739Oxq9MwJeC0Qivpq+gOGbtJh0HhMb3n5D
         r8Rbx/xwuuo+2iqI49Ygn2CNKIisunxNb9cNBavHZKbmOqUvBH8sQCjjl27xPIs7ay5I
         ZwQPNC8K5mbMT1dgrdwio3ZOsb7SrUTRobwDjjebDOW7qUgEjRRaQjSb7eDpramTuHK3
         f93Movxs5iRsWuM4d2huVEfwOn5/ja/eyHeoCqWznMSBBhJrnl+Sm4hUDAuZNMNoIr0y
         cntQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxQCLgL6G0pNI21rcAWaaqXNlSsHtvOkaW40oIaj/mkXEnf1ydgX8gWXGzJm0HDHFwOiJmclhKJbHuT5U=@vger.kernel.org
X-Gm-Message-State: AFuF++nLGvDca/ujUnwDBW/Gsfn5FVwOvVMGgBUUacgjQWTi/vBLrOSG
	lCEd2JkC5RjSo/V7UTrNgStfEc+qTtQO3Bp2X4C93hkhZ2V2TWzKRxncQ5aRUItyNURnFrOteU6
	+4BotcwYMbEKZpUBryc3MPRozSqPj5TXwSLDPpLuVz6Asl3a8QHsNNYBUK8M0QYg0aPw=
X-Gm-Gg: AYBFou1X+WHfucZT6C4DjSfed8ZN159T8Dk6pUFQ4EbrfQwA5RNRvGHWAj8c0eL8k8G
	HPGchPnAdKRhXLrNLYu6TnYMpmjeqQnBFMtTiTZMUwyzgum4o525nzOY+UdiE14Z43aX5rT4YjM
	nIgOmWuXW5aDb04e/UJzpcNl9AO8g34fFhkRFPjEYIXGOtm+rEPC+9tqUyGualtZY64g91xxnUj
	vNbkLIHjXLtzI1STA8raRms+q/BWC1LNkhzddQYPyluQegoDaRZINxaf/P7grhXt4kOMmaTH9s5
	vAvxhurkWsAgleStSiDx92+ASPSTUUNQ75KAeuFU4OK53OdR7/6KoLf37jr7/hNruekRUCf47VD
	f4RkXoCLCL32iNswYc0Qquw==
X-Received: by 2002:ac5:c002:0:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5c981d80eebmr335210e0c.3.1789388764360;
        Mon, 14 Sep 2026 05:26:04 -0700 (PDT)
X-Received: by 2002:ac5:c002:0:10b0:5c9:6766:5353 with SMTP id 71dfb90a1353d-5c981d80eebmr335134e0c.3.1789388758960;
        Mon, 14 Sep 2026 05:25:58 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04643f5sm2408744e87.43.2026.09.14.05.25.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:25:58 -0700 (PDT)
Message-ID: <773db386-55ec-411d-a4eb-cf57056c236c@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:25:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/31] arm64: dts: qcom: sm8450: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-16-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX8h79kvc+7r3r
 8eRpV7NPYTv5VlkA8DtVBoR0sImdkXgRkfgiC7Uf8h7vchbntYhdaa03loMOipPyZKL0DytZsGO
 Vo6si7IqSWOPQz2kqaJfh10PxmTpQsxmFrJr/i/kxMiTa+bw358lDyO2sPP7dmQ746TtfqPcZu1
 rbgIQzX8lajoWTt6ENvEf4pVlI2tpuxQtjbCOty7phlZUg6gEHTZOrc7F0xob6bIbh48wDCd9Eo
 bju7ZN4pX8eV6BVVs2b+GpwnQgeFV0HBqcG6mgm2JyL7bdmXvaf5DQepFlqL2W1h2o1QVhp7sdD
 D5pER5j/8l3YqmgJdVQ0E996WLZnC5SC2jqwLAeWF23by6hCXnE2qDkPW4BvNkkPPDL8Vh/G7Ga
 s5nTPtyXzK4Jx2iZ2b++X0Ww001dCXxZtuZsvxcSPT6AO7FjjKYbGLmV8QuNokDZkYl2TDe/STJ
 0Ioil1NI/bnhtyRcyIg==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa7e7dd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 83UDHv8SAj4EFqp7d9cbUnEGT4rUeYj_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/r2uvPd424vm
 vHLymJH5j4AbEGcX2EX8N6rrWLDudGbosXDGibxZl/eNz+QEGzfRcyd4b2Kj3jwzaaVxSnkLoxP
 bm/BRHPOfY4XXrkup5QyrY26VIzYMgQ=
X-Proofpoint-GUID: 83UDHv8SAj4EFqp7d9cbUnEGT4rUeYj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
