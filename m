Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9478F44E67E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388508; cv=none; b=SK7FkHeXIDSdO4Ymb8CUMQD99pdbz5wdT8To8NoW045jrdvgBzGUntaQk9+a+gahUlqQBe3h5NxnYiQ2znHSVIUjDKLzA4lWmzpaSyMQhHgLOityAwM7ctROLf2z00ragJAnPShw+651UD1ycBKJOwRXurXi7RBsmNX8ZSvFVHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388508; c=relaxed/simple;
	bh=qyvVZPMmf6cjGNsZBWyEB+VQPzOPL16F00os4ISp9tE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TxE+aYMRoCeiqaoAWN8FioVgkUcIAta3MBbxVHlnjhs0i9WuT7oBQPanL9ICt2J+jHw0NEXSl33w7f4PAsOuzpZbI/82yNUzjChVqGe447xVfk3wE2XLobyTAUM4PgEa76UG7QKwQge+uTbK4zwhCCHy3Q+N4rLCJNfMHLVnilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9l8oCM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ektk8BMH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9l8oCM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ektk8BMH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm7UI530975
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=; b=g9l8oCM86cP5zO5M
	/PKudbbPBSLcsu4HAY6yBpVvolo4T8D2h0qjdL3lYpOnU+f4n+m8gGu0gbuIt30b
	Q1u1Wzd6q1bhjVVUh1xyaeXxYPVxqUr5JUQGjooHOr1RWoJ8R0iJNQO3JNz2CaqM
	R/+NTyJYV7uBPaFC6Uc131I1jFUIlu3I1BuO1Yy4L4ArFTuqJRhfE4aWU3Ajll9t
	1DbHiVtE4iN8vm5/ib3W3F8GPWJiVsQAyJPu8cLU+fUTKs+jVdH3hRqSsBPqs6lR
	lJy0Hfc3oS5myUosu7F9TifdxNjOCB8GZ9zFWe7tnsjzLdXKuB2Q2RJkp04dkkV0
	lpS7KA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstcr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:21:45 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c665139c92so115207e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388505; x=1789993305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=;
        b=Ektk8BMHKKA7kYd4d9rVe90O7ydhvlTfQ/KaNrY9/M0XXTFdyg57sCsk9yR1xXzcxv
         X9DMSz/3a/fRnWu1OLXxgC84mSbQbv/m0upPG3FAyjUGhM6SZaa1wPSodqXzRsCILPNl
         yL6w4ZQ70hkHjj7YVbeOsJ1abY/Z2nhAIu8ec0NSHxb0pYNC1KXgneWol1Rh3zLj6jlq
         OEyDJx8RoXH9wYT1Sc19c5wMTrs9/RR7I5HQhkgOe7XWtaJDd0VfZ4sUY76VVRTKJ3dm
         /aNmVZUUY3AAF//CHNpIy6UAMvwhUydFucta/qXynOBhx1i+7lSPp2fbGQgK1Z0WA60E
         9Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388505; x=1789993305;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1PW+/bUk6QpGADVInnZi52Jm6RKGs2vV5c8Wvv2dVo=;
        b=ev1wFp9ynFFbmSLmI3nXX0my1Qin6AspzQkX2PbCF7CmuzzVBtTMkMq7oLMzYVOCEF
         k1+THAS4RPSUz8R+iVqOLYZJEmqOGjjBTXwTv0VuChnH/9eK/4lx/yYqX0I+ca6Vaekh
         jKfcRvvA9fgiYypuOsTgCSv+d5EbjZgdNYG+jWHTjv9PkiGC8YoHgEk/+Zc/4NRjzoJw
         GV4qtvqxys5m/K7kWvoTzIFYiMEb9uYyoa4bujaX4hHQE+U56Dk7qourMp2Dxmwvn6Lq
         bWi1ySePANKmqKiU0jmp4A71a2LYMM+7Hq78tyxmJvQ0JmK7OBMToA2ssROSr4CUz2oK
         VY4w==
X-Forwarded-Encrypted: i=1; AKwUvBxDTynsyY9JN3XmDiKSAEmQHRNGfvWSjDJk/hlm6n0FlNQAz2FVSRAMWxqEHTtohxeu15AKkdwQZLUrqrg=@vger.kernel.org
X-Gm-Message-State: AFuF++m2/u/SOYvqUvdhfs4QA4qgTs9NBznsJX85YbQFKy5Rqj0rtTfq
	969IBy3RhbkO9xXWhhnWtae44dgvyjHSi0JkFq3jRx89UR1tFe3ubfqKzHKJYTjIY9AhInlLdaB
	g5CWiyZumzUUT9IBuIwwNu4v7zMXKHu1zVPcA3QsrmsQzFlgAzQBQE9VEhX3YJp4V+NY=
X-Gm-Gg: AYBFou1qzPGD+dKKk1ffOfxVZxccz6wMbrBxo4gnJqnoOeB8VV0s66F5mOWqxmmSM2I
	5Ue1pddP+hXOzS9KOevqInv81PN292WvRaHmum6oCy7UUXztSt/KeJ0xRkSksHmrcqAXSm0/VoQ
	dGyHtJIZKnyJ6QkZh/ESOIQgFsX5NWLQDmGyZk2YULX67PDMpOk2IZaL7CgMGr1Deg1kO+hiv5F
	+zyfgb4F3N0T2xXX7aoOxyDxx8Ff9bTEf6Yw7s4CdrcOnMEr13gfMISqNO8m6ZIhL93YN+DE70C
	hOVb9NLzRaf+xy62O0AqHNUVDBAkgj1256qNqXEduOh/590DZuLjwhiET/AE/aub/CPduYpYMUb
	1KadfJnUzXxczKfFowphTcw==
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr354675137.0.1789388504771;
        Mon, 14 Sep 2026 05:21:44 -0700 (PDT)
X-Received: by 2002:a05:6102:54aa:b0:795:41a8:ff58 with SMTP id ada2fe7eead31-79b53156063mr354659137.0.1789388504296;
        Mon, 14 Sep 2026 05:21:44 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a04568f2sm2472223e87.19.2026.09.14.05.21.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:21:43 -0700 (PDT)
Message-ID: <1be88118-4ecb-4d60-a79d-8675b9399a4f@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:21:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/31] arm64: dts: qcom: milos: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-1-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX9JbB9shN99T9
 E1BiyREjwWvKAVXk5/Nifou2xyRVVb8Rj5tv5ragPBaCvNNO/5LwtdbwRLSWzUp1vNs8aXnG0OM
 lN39q6wIsL+EHwgyxKqOb+wOBu/2t/ILrwLzLimHdH0LtPZYZvrcinZltHu2gbiIj3i8Ae4507u
 v43OqzZGXCa7y7pblA+dABQ8ukHK3st57mpMFvUAX9V9A/0lVokNfJWRIHagtmcmDXL3bszWNyX
 a6kcx8t0PHz4Up9IlpWAhGR5pwNnaOzcZ7+gZIF8wPtZrrZozXif8ypdu/MdrTy6B89YzJ7BiiC
 nTVNe389zsduO8lBOyUkmU1IhHqE9BUAaO+kxpDGnZigWkd+hg8X5rg10Hl/jp+f5Qwx5e4fBeh
 l19Xtj962leAy4xZuyCxQoI3nEUjY7XAHdwtKFS8R8u+dzYNuncOo2oQTOi0FxWG+Hnb8jMQpvr
 QLT1JM4GJnm1f8zjxGA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7e6d9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=YiyR5B_2n7VWvMOyD40A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: Sfm6fF_a9NdJks9DskZTBZy0g_Y16G6F
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NCBTYWx0ZWRfX1GAZpmE8VnbN
 xbrz/Tei9IPgKDg5ckfWHwC1y8hM2CEo/rVcJWVLpZV2lrxsj28Mmu+FCGcYWltpf6YvbW5F8RG
 QN7J1HDp5qqoSdJQ6IBWybI4HM4wFGY=
X-Proofpoint-ORIG-GUID: Sfm6fF_a9NdJks9DskZTBZy0g_Y16G6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140174

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, fix the big CPU idle state name, which was described as
> silver-power-collapse, and update CPU idle state names to match the CPU
> type and low power mode they describe.
> 
> Use little, big, and prime CPU idle state labels for consistency with
> other platforms using this CPU naming scheme.
> 
> Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
