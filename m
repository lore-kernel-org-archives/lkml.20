Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309EA3E2ADD
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791541721; cv=none; b=TCflDHKe7al46xDO4YoU1cc6hdY7VMkfHAhEk9HsvUlPJ/91+m9rGrB3yEFy2y+K8eAX9JXqXH3rWg3zLTUXNePcbxxuWaOcPsW8pPHN4+k2riKbqSVYfrmBWXpZNfVA3zCDt+mRMbhsXKm9zmP4PjXGTZihJMoOmrscSmO12As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791541721; c=relaxed/simple;
	bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OSIbUZZW8uWufPUVBjkLSlvMVefTvPCdmWsrJM5czavE9uA8GGx1jS/LKzuSxthCRRq7cuPll2xMuYhp1leODE407ZH+jwuz9Mq/a+d1KHvDB0khUCVCilNODpSYSGva1yuScZe9kc2OhgLbUVZucvxf4CqKDj32uWoQ637NzCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGQkYIQQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D8Lo6aCz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGQkYIQQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D8Lo6aCz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998L2c1643852
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 10:28:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=; b=OGQkYIQQ4RvfM+Ap
	IJlSx7rqsMpEPPnw5aSWZpJ5i8aY72mZpAN3V60qPKBdauN2p+oLnmUAFl7gzeaZ
	s5ppFAIMmqzBGtRLXUqWU3f4f6/ZdA8DZQxvwvNXPCmMAuZsWqy4T/QExt80chBI
	LYNQS05udZAEds7J+bAe/XtGPHB0LD5qbc+LNgdeWAepI5m3QsUfyqINmT/clUYQ
	UjZ2yzj56ZOjh5tNMiAU0lvvHw3qsNbOUPWGGeRtBzSYHZEG+NeAcwk/GU3a2nok
	2xC4E5pB5chtds/3RjP1ItTF6IaDzO/KUvNfNAyx89GOK3+eN8HT7n3eKyCDl0VA
	Z4Z2HQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxru4hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:28:35 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so2319467c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791541714; x=1792146514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
        b=D8Lo6aCz5BXOhVS4sXBgiO6dmOKPO7fsQECrlRqKjb5z6DMKtIkV6Fsw2qQv6eGtgp
         oKmJi6q8ZOTqtSSBlP9vDMtg9x4b6KR0v/eYeMoRjnOxRkrupZW2TY928uxXnxHp4ghp
         /gYIMDN9U+Z+1Qy7asqt1xt3Z9zXOEsxunRbGlBLdIVicjOTTQiGfYCIExkMJgf4VxiF
         UXO/HSD/jXDNnEP8xchU9A0KzgGa/4tiYMYHx3sUVrMjPZpYl5S9ieTRmgrEHUbpI2un
         /GlgslvRumR6czV8LR1f6+/5hq/+1EE0FUyaF7hrKW3vze5fzsle0WA/krsTyp5WnCA0
         +CgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791541714; x=1792146514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8x0WcE/7xm7pXjVo4mK5xEsBQsqge6KlTXf75BL4CU=;
        b=u1ip07N+HMRJABf5pPam2vH7mkvN7ZqO9xEU4/x7uzzRtzl3n6IctpGKevJsgeNzhT
         YVDJzXT2GCZSjzPfqZIQ+Nx5ElgGib/5isQAh75dWchO2xc1leHQrZYFaK1bIVUxYvJr
         mkDRb9rg/sg7fIBZYAUAi5BBaVA1BAs5SmFpWzcYLV4dPMO4Fn5FruEHul5ANzZ3lLZ5
         kopDMLiLVcpSOzGuauYScpnwnzSBK12eqQMSZFlnjUR9rMbL3b2ppuWHyeClNQfF9m/0
         WLJd7kXuJCD9dqjyrE4VAmha32UNNrVwtQgOe+5bWEiOHNyU0t9coHDXal/aJwmJy/84
         UFSA==
X-Forwarded-Encrypted: i=1; AKwUvByj0XF4km93gaJ+tI+dRngsnSn9QTdXUQ+hS3BxpfuSRtVb/ikD19En0yPeP7zCwoGu7ROBCupSb5Cy0Cc=@vger.kernel.org
X-Gm-Message-State: AFuF++npKBEMlwxR+Ps+xRR3/YQDREovzrAdlM2gbzPXoL/xomTxrE8+
	u/+AK/lrScczsjuNHoLup0TU23Sj7+m4RZ4x/K8eRdl/Pd8mvfkpkYAPTUDtvhXOSWihh/3uvIE
	G1gRGX1NCxAD41Q8nXLfQKkEg92SzfJgnXu3EkrGcGPUTkaoNESIPNUkiqVJ+32+Z0AI=
X-Gm-Gg: AYBFou2Kv4M/Q1bhvgGNIwhAhOR6dBs3odwFH/8gGV4GA3b01zycWJ8XfAtPMKVqETA
	QbL3QZ2er87oT8A+xDr+Y+9q8uozNQQGdRHDKaIzVTNN+/httFHhjMRa2ftTEzVvFkmDISb9U0J
	VKVd9da3NSIdTQCYqUxHpVAlDHWR4+V5yWLokyLeJwF/mTQBcbEcGH5tz8KtDHoI7mZSe5XoTsM
	tHoXIDB1at05ptkg0Kh2vkVaGuG8n9rESZ4l6trW+2gjwCRSar8csKEgyhN5i9hf9vND1Sgeq+x
	DFgEzE/rt0nMsBgJ4ZLbQzD4PJR5wy5LRL93gnTueHwi9ney1KHVNTavWBFEXD07mLudotQbE7R
	qAOltenig/WNqgBc8iFv1VYyvc5ag9VlzSw==
X-Received: by 2002:a05:701b:230c:b0:151:7f08:5961 with SMTP id a92af1059eb24-16a54ada8e0mr2160610c88.4.1791541714502;
        Fri, 09 Oct 2026 03:28:34 -0700 (PDT)
X-Received: by 2002:a05:701b:230c:b0:151:7f08:5961 with SMTP id a92af1059eb24-16a54ada8e0mr2160580c88.4.1791541713961;
        Fri, 09 Oct 2026 03:28:33 -0700 (PDT)
Received: from [10.204.78.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a2f17feasm7713134c88.9.2026.10.09.03.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:28:33 -0700 (PDT)
Message-ID: <1db319c6-eb4e-4821-85ae-f8ea5e41d28f@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:58:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: dp-controller: Add
 Kaanapali
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-1-6faeac3a6d59@oss.qualcomm.com>
 <20261009-subtle-tricky-locust-b09108@quoll>
Content-Language: en-US
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
In-Reply-To: <20261009-subtle-tricky-locust-b09108@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8c1d3 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=n8cVz6FT7eV6zO6OkoAA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: caamo886Po9LXWEseKQCoMUfhFQwuCaZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfX3KFSgw/86zHq
 k+eB1DlhbTa1/GrzdHEE+W/Y9DXGXZcJ7oiDBwIj227cVtpZK1VL8J6Nrv62CfsP/4tyKSfXRvc
 R5mfLmvJUFWP0IDCJiWRNDjL3a+D+kWZ6xy/A8vUYjiY2OAcF6iKuUv2pFZjlNBHBfTvlozr1On
 m1qsbV49Uo+zKdW2bl2afBEu2KpzUwUHGMIVwl14bQMzvjJWTtlgm4iZ5877wx4YxONI3i7x5Wz
 wAman+5g5hYJbf8KcyGpLSUnwS8j+Vo3By7f3NR8HmSPyGvqnSV80I5kWRR1gOeDG2FKtIVdeuE
 X3xilPK+udKfqDSfCrP6UHBeBhWgDO59HIZaczHx+/t81Run7IAU1C5D65XtrDhSelspY/+BCDg
 rGyxU/t1GtzC3NysU/keOYeIAyhaa0hyaNXHGZwqn89P3v6Mf1I/XK1tkYYoIhAec8YrOKYs1YH
 VdJuUAG0qCqtRzEkETg==
X-Proofpoint-ORIG-GUID: caamo886Po9LXWEseKQCoMUfhFQwuCaZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MSBTYWx0ZWRfXxqdTxASQGrcO
 R2+edGM+yEHJgCgRQvMiUNRM32yHaFpppsHDUfHuwU+x0QQF0EyIBuir1Xa5D7dR1itvBSs1PsC
 5t+rVCpSE2nzi65+2hRSwWHNVWyfEP8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090041


On 09-10-2026 01:01 pm, Krzysztof Kozlowski wrote:
> On Mon, Oct 05, 2026 at 12:54:26PM +0530, Balaji Kalkonda wrote:
>> Add DisplayPort controller for Qualcomm Kaanapali SoC which so far looks
>> fully compatible with earlier SM8650 variant.
>>
>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>> ---
> Dropping, unanswered comments.

Hi krzysztof,

I will address the sashiko bot comments, and it will be part of v2 patchset.

Thanks and regards,

Balaji.

>
> Best regards,
> Krzysztof
