Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82C842DA53
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767990; cv=none; b=I8v2uUE8qqOTWay3VlbPP2/Re1KcZn6bIzlkMYLyXB3y9P4HHhkYs0RYUUtWpdZAsUdoxZCuPkCQt83ep72uBXD/a4QgP6+OwcO2lBc8WkriyT1NZsT/tEEicB2ZR3Mi0Yg/OeZIxb16oMfDCj+GjM48NSagcZjZ8hg0y/E7PYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767990; c=relaxed/simple;
	bh=lMurb8WHICjQOz0jHZq94HqsFYLXI7DQvOMCmN5b7iU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmk0n7IfsepO6avwsxMelrOnTB+Htp3aohfbF7JuU0R8g9a+zR56djrhV21raynvEXDHeOM0nyFbn4Bi9zMFbKFEdvI/Vf4cHhN9Hj+mYFPoNSln7SUUFyEQdQVK0k79uVcmHHDxDq5Yj4KAVFEPXJsOhZHztQ9oLE0po401Nc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W6mBB4ik; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kXIpN6ZU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W6mBB4ik";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kXIpN6ZU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777cVT2146227
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:59:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=; b=W6mBB4ikriKG2TQk
	96O1PWEV3sZu/NePa52o8aBRQM1ZyKPW5VTnMR2MqemDK3A+FHLcGu7Y2cCiLJNL
	y7l+tq92dDeP/RiWDdaDxHW7Mzpxm8xteInCe2UZAWnrRpIfGmd/KeiEPZmfbhiW
	FFzwpr9z9P+rKJwq2Gr9dHZaBmFB6ssC95c4WsLngXR7CPdPYMP1p2xdgDh6sDGd
	IMdXOTAYtzCdT7EkyBEyPANDJjrKqzPENqK3Dw15eNY69eS6RxFX1eGsa0Z42SEy
	UpHc+N9rRzeV4wa6KYd5DPsh+MpQuIplVay5qhLhYtEbmOkOnuiZIrl7giJdjFIN
	GK5EOA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jdqfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:59:47 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ea38b1e7eso7442041cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788767986; x=1789372786; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=;
        b=kXIpN6ZUD+k7ECCcscEFXRbGsJa8KaEROzTrd8GO68c1Qlqn362mahVIZct46dYZ2o
         GlUqI4QGQ6h1jh63MkyP8k8qVUpJJ8/pGsTIK/pEEW1vHHWCY7DvurvLD3TC2A3k6OaG
         Ah42NzxQIxr4r0SqKdRsdoF7rkh0I1rZG/AfOaj0KAOcUxrvR697KoY89vc1lkAUMauN
         FjxfXCfvZdDo2ywSuYT110+dAb3cCnESqSwiWA4A/vVjcf8LMfzFkOiIj1sl6qgYu8cL
         XifhHq3KjgJEfZbF63hpJHN1acVjYKNwcWmksuQi0CLqdKy3dcExETL5+A6Po5+9v0Oa
         YRpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767986; x=1789372786;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CjJ6/joxMNoyndUpWvHjimxDYdpj29kfkXilh/8W1fk=;
        b=gpsHzvAoN1si1P0TcVOthYRWNZXGqur25ylcau2AGzRkKtm4h3NaCBBt0tVcEcbb1l
         K7ld4rZ/Bpz2Ok1BjmRGXS86SagazFKt9dGS6qyZ6f9Mpek6URM/P+ZPNEjmSZJbeJ2d
         AleIFJVNi7GA2BvvlbAioiMN3ZwbuEuVFgg7m/L+FiyKgfnjskuR0p6k/VOZm6PwFJNs
         nDVrvoiIDSPO09GwfsKOa0SxVUWga/nlndz8GC1FB0KD8bHefMBdcvKDr9WTPKwXVl2j
         pZri2Hfg5u8cuvDPDFTuWUG0KnAzvC1s2p6b7T2+s+WjtBIympQTAznDRN0W0RCw/GcP
         o2DA==
X-Forwarded-Encrypted: i=1; AKwUvBxl49Ptf8EanaBnToO9dOOiJ2vmqYXiOcWNn3AfYX+vaXO9FO4VLtWPwmIHpMOvQenspGFS/Q8pdnajexQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k2cAYiqbaI/0AY1ld1Op3ZkabNQV7t4Kxtx5hyoYX3hJ9u/tC/
	Xh3AdyHcGCQleGiNqZhmR+xjuYiFyO8IaE6O8MtKGnIC1UTVYit+GdjMKVi8gztnMCeVsN0CqRr
	9keuYG7/WjqC2JVR3WlFZ/so3BpsS/0gUxqA896L3YbqMsllbDpmAgAI9r13H+9hHKu4=
X-Gm-Gg: AYBFou1pwwWZXmCa2zYVtJ07C6uaEVzYhfgul1rjLal04PcyP3Be4gL8MssApt/NPID
	YI3M4jOcy65jltAdzwHip6OLQ2ic5NYWfQlO3Op179mzKl8Ri4vF9Cw+lh5zGNnUkgv+s3ZYI4I
	sm6KOLYnZLx70xSigj+wjOlkjOYkK3PXVeLK5ng4bHA+aCJRItBgohezhIp06zj6odzlH/lc37N
	6CdJ+wcZLxul6hhm4lqDn42BqeZ0Z4pSwHDWb/4g36AVzNv/EBGAD+kAdS+9itQ7wGDEhu49Nn0
	AK6z1R8MmUx1qYzFKqVDUnBAA0PqBa/1F93pGihXkVNMqJvNcFMHT+uSfHNc/vd6iwPHlh475KA
	4n0WHCi2uk+xUc0TlBvCRQQ==
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr120114371cf.2.1788767986006;
        Mon, 07 Sep 2026 00:59:46 -0700 (PDT)
X-Received: by 2002:a05:622a:148c:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53064575926mr120114161cf.2.1788767985530;
        Mon, 07 Sep 2026 00:59:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6db6sm3684473a12.5.2026.09.07.00.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:59:44 -0700 (PDT)
Message-ID: <b4e9a3d5-385e-4cfe-b477-e3b5e5e8adfe@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:59:42 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for
 GCC UFS muxes
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
 <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hS6roY2iPRq11TI33dO59n5VWqn_zKio
X-Proofpoint-ORIG-GUID: hS6roY2iPRq11TI33dO59n5VWqn_zKio
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfX5gmocvS9kLIp
 2m1VC8taiENsIvmGUGTuiIYQqada0kJ9jdxefdNrUScFHXVgT9dR2XiIgJG0Chtwf0BqyktGuxo
 3610YABAREvkxDiGhFpMPI/WHE4DBQ2f07+Z3j3JhFiIUFaTlNoDTwGPCO7fAc9a7N7QX3N57hp
 diKp5eHGNc1hD44RsFpHMatfS5KWLShOqtQk+mykw2ggEW1I6snP2ub8SJ/oeZMUPk0TZ4zyx8t
 p3j4torTb1OBqXN+gdugJtfwIEXwMQafMN9Xsw7YSWed3DJ+NkfAe9yH+eU3Z0ZhCIdabRwztrk
 Bzx7D0AYsijPP6UClIWDHY8dWb87VO8ciexn80PsN+jCuvlCBZFHQOmePq+emzYnd6XiaYv0qFp
 CedYtcWWc3qqkFjRbga+za2hgT+yu0MxmhwAEXDuVQ6nBPZSAUhk08woKtlCaZ78hypuPAIEIS/
 JAHe2tIvgDACfB0YRrg==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e6ef3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vZgVdhwgRuDMrAwUH48A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA4NSBTYWx0ZWRfXwieF2MBQB4it
 TO46DBzbvpm0ubBXHUJs73mxXku9Yd06ykjVOaz64HhGIJVtaSz/VR0lV3lUn4mV6x7pA9J1Gfr
 EEPpnD2mG03DH54KqZ/mtpG/frdVAhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070085

On 9/4/26 8:50 PM, Jagadeesh Kona wrote:
> Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
> automatically switched to UFS external symbol clocks during enable and
> safely parked at XO clk during disable.
> 
> Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
