Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BCF3CC337
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767072; cv=none; b=R4yuHcDSNePRgUQY090sYvQ8LJRHoG54Cm/VCr9YXQBWTplkFoNEkqFYz2KnHLOLh4GCQTEqjrftfo08OvdybKqTcPR4QjSE+XPxh36Q6fFGjgNh7jO40Tw+6IGT4hXSK7Q7Vei2X9U7u3Bxx9SQMa06tfFwDtxlz8L7uzI1AYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767072; c=relaxed/simple;
	bh=nVli7s7SIG9R8Ak8hDj233cUyczfZaKTWK1A6eda47Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH8Wcm03Lpiy6I/87YfPQzGolnnPll1fXoh7Ecz2tAApJ3JYtIG7b+6WnS2UkeVs7cYDDP9zfEzyAjgnK4L5JwVdAWV67I1j4ZrTJbnAYmPHFxlx3z+ZjnE37FmbG0fEHfuihtngclzjBkMY2FTLI/giezv44zJhbl9JEYWA1Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on+Amdzh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y51V/9w0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on+Amdzh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y51V/9w0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7iTf2678474
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:17:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=; b=on+AmdzhiABp4AVN
	jlvqS8amDfM2NaX3SIIGVQW3fAGlyaI7+iZrcM60b+77ycX+JEi4k7SWTf48cOux
	lcrxtIeSUtGLKV2lHpEVhwXfJTYBfjiI5YDHzeK1VisBmqwh6Y6RjFSTBxTB6uBe
	KBspyxMzrO0LfQZhE3SOJyrAr7cwZwPD9TaSraeb+H8ggWhE9A78FMQ66lvHiWIO
	QaaEIaN4I/VgRwnwnSZIuz4vfGQPCPpeEvEYmguwYjFCcMF6WfpU24pn2zKTlmOK
	ZSWD3GW43+kb/NMGJorv8BInNiw87hG97x4XY/LBorbyHSJtzRkoKDKn9Gc9y0z8
	ek+jhw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj66t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:17:50 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so5379066d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790767069; x=1791371869; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=;
        b=Y51V/9w0GsEm6AiGZCnaUD23jiXNlB+S3N5lkk5YvyaZpGAcP8eWyH8TU9i11YGI6X
         Zpy8E70ei4IIe3GDPLC2ynn818KgRTw6oYDAjkRBHkWBrSFBLTASODymmXsD1iddk2OG
         qiSz8DI1u3Bh9whLAvfb5KBVqEX3BrNMnp++c2AS6GaaLoqedChEltVTqJ6EsziW3yQ0
         L6Bd8Z0BXa3sYIOzp43by9skMjq3wUBabsYOk/TS8vGoa74SSN4RfDQmBh4b9V48gAU/
         +KHvThnnToNoUXfov+kD8uVInpem5LReWMlCsv9unwwFSuJHIGEbWg2DxU9mdvsQhbRz
         UDgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767069; x=1791371869;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jN1MJymaRVBcVG6FKC724CFrGIYLlKb1UrrRV1ot6zc=;
        b=Hswdf0Rbm2l69qqqfPDxM8JeGwJHd1giVRwURGfcpBMdKg4uJdE04VzO37wtRhyFPQ
         qjE4D3yQ0Kk1qPOvcxleliJKJ81uRz0STployzYr73OTBAkGUB+nNOw3Pt/h8QrYEqS/
         AewEqJB1g9dho6bSpjUjjeck9ax2QypR80mECJbwGDXbloa2t4USHXW3p7btGAWFf6ft
         3mstvfDPzaEA9rxSeeIs2pGOiXyorV6CkUIwEGD0fALvbeQ8vpCMlissgiUsiI/7qpjt
         jlaAAnLWKB92CHUgJqFyGo1n18mmePuspa2PnnuUzGrZwmH3hjebEo3R7bSGBaxkBI4L
         1Yuw==
X-Forwarded-Encrypted: i=1; AKwUvByzrFKiVqAApcJ16vS7RiJKcAl1scSTlkwjFauO4nYoStcZQsIss2FolkAEps49YkdxOEdduxRPdrXt0x8=@vger.kernel.org
X-Gm-Message-State: AFuF++nNK6nAyfuoYivBmWoqBSTmLHP4nOIB/TZx8vMDoOVL5dz5LRck
	czaGbg1ZupjXLGzytdpFdSAqn5H9Bjp5rBW1uAIMtZ7UDB4GGizQM1Cp+Z9dROANdjiwfCveVYF
	XT1xF43lgMxah8FIQpdisqm3MRuY9+BGKR7dStYz3oKaeBXNKep8HU3UlYSEPSvczD/E=
X-Gm-Gg: AYBFou2n2t5N62xuUPU7LavE+Jy6pChjVWsLaGALhgVzb8YgW1Sdaxr9+/rDfBwRee0
	pvvu+8bNX34GOyounIBFA/VfCnuTICZUkMC12ldpQmzgtizNxfPSlkSXHJ7feYsSI3LZftdosQd
	us2uBFW01AUGfLCv+9wgoYWaqqBZUYn3MlQ22/cQ+zzx5Md60wDC/1N+PXmK6dHQxjeFs0aSpCr
	oi52cq6VWUkegp0+d/Uzdq/1MhSquGVnmHgEDNk29JJ9J6SHXlib5MhxzsnBu2F0fMbXP6QqNIf
	vcySfgmArL64wbSiT7DCcCmxMsrOdvapNJzFWIULVxUgZ6LUI9tG37hk6mBiu1peAsh0bd+6Hti
	7+lP1zYY6yirmRBcQpmiZKg==
X-Received: by 2002:a05:620a:318d:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ca980197amr163469885a.4.1790767069590;
        Wed, 30 Sep 2026 04:17:49 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ca980197amr163465285a.4.1790767069147;
        Wed, 30 Sep 2026 04:17:49 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22f61b18sm51194166b.35.2026.09.30.04.17.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:17:48 -0700 (PDT)
Message-ID: <317c7e66-e4b8-419a-bd52-38430a9ed6e7@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:17:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: hawi: enable iris on mtp board
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-7-016ec3d24b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX7nhCeXUNNKFM
 TnPjnYTbL/NHNxfCrm48eym4eBZso9tQL/KN1SKFGM0Wc1kyFBp8hZdL1vhTiSvXn+jwBU2MbUi
 m4D3FDt4ohbntU14K59pxZDMbPvUj6I=
X-Proofpoint-GUID: BTBZsB1IDeF-e_qJu3a0t_H2O0001Dvg
X-Proofpoint-ORIG-GUID: BTBZsB1IDeF-e_qJu3a0t_H2O0001Dvg
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcefde cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=AG5diU-uafisgQmFzkcA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX4Y0jm0nX62Dz
 FOzsEuYqnJ2eS0EKbVB2l+p0qOJ6Y/ianG9bs1QkRDMs0J+o/+H9/23sIYRUzCQRFIaxZXIYdOb
 itggrFYz/vuwwU8E6rcrPb66gK94eHzRoqHfDfH2ZiJn+QBDONRhukufFI9jLOPipVo2Azrrn+l
 vI8aG4lkF2HaT35KBs0lP+JnUMVrhmyeR6SvIVJzaX5wi8WMZDo6I5SoDDrx3TrEgUIEOqzs+rq
 7dKXkZ2P04OkLlrfhIQN+JO07UtirqmwEx8lHqhmrl2ZVsXQKoynTqI1ayrPT82L1eiWfub6DZd
 13bU3IoLCYVf0wtNKMo8FL4sCwtPAUrwS76QCN4o1AbnJv++NFzxFpLdcSL99BZOy9F+GS2XQ3u
 hW6mIG5oTk9kFpoHFj0KRSfKUlw1yiiPlHHv5F5mrCFWmqRWy5F1RbmJD0sdplWX1AsgPMDFxFn
 LMTngovIPc7tyd634tA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 5:27 AM, Wangao Wang wrote:
> Enable the iris video codec on the hawi MTP reference board.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
