Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFF2329E6C
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785892; cv=none; b=Ew6DMNLO9QaCs7WxuzSX27IW1xXW55kb/mN5EaW/MH9qqZk/1US+so+NP5vftAlDVknAt9YVxQc3yGpGS1r74sC5ZDeIE0nvaS3+Mc31zoPjCfhnrzXFaoORHjtSBNBZQ/ab3yBkY7agya/A1wTYxn9S+sO5ptW8TRvFQbKvX5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785892; c=relaxed/simple;
	bh=bpejG+CiNbhijxhuzI72Jd2vP8moLJ/iGX0zEl+3sVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QVLXSUbMoabCvmn7tg/wLRyTARL0M/AUmtpO3LUohyAVQX1aYfHnfH11cY80UT3Q/hTsvU/G9BrJJ/Ucn4Cyyn8e5FO4ajM0lCxTZ6gZKEhYthNdAaVKinvz4Px6MxUlv66RV2Au9w+SJ+FrK5OOOSvwX9BTTzKUP1vgcbwrMX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cn8hUM4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgmXRF0C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn8hUM4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgmXRF0C"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55ioo475087
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U5WUPplqDfO932T8HETSyOqNnzvpg7DeYZKhN0l8jpc=; b=Cn8hUM4vWCtDpe2E
	ymdUQ8XfxpeO1hrFARUAN8PuGHifvXVHqDUGjLfgl7AzedtfJPo6rizshpP+Pqmr
	asR3YFvtMkiQlD4YA1T7zlJQttiWj1vwat/O091WKQXP4lNv5dB4n1YLKEUYMcaZ
	I6IhVWYCH0tVa61Lo2tpiJuFRNsF09P4lqrV95XgCW4b/z5TifiEWkHW+VSLjOJf
	25ngpFOT8J1xZhLRwCKruTsEbWEGu44B5WUq2V8+5TOycBrGuO7ZoSNIMuEiau/N
	FDCjqDe8R7lPexu5JtIFphsMikpZVXy2xSqKMgMPysuw9j1QsjD5DHRbQU/kcko7
	ENxPsA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9vtwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:18:05 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ab341816f6so1413581a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785885; x=1792390685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5WUPplqDfO932T8HETSyOqNnzvpg7DeYZKhN0l8jpc=;
        b=dgmXRF0Cvne6VvLLUQUQ8X/P1KTzwR5BasO9nCkN7bWojuq3z44A+1a4rXyuJlIFL/
         cCfx5fCzU1Yz/6ZJINBlG28P4FIMCKPUtiTll/QgFo4TzZLZnsDnAd1ggVb/LN5FF2NA
         szbvlkAbmNKSWy7LR3YwBtiGfUBpkZqz3xclAZjK2xMqldX7CQ12vEVeSRVtly1bTgRv
         sjV1ILoA4TDFHLV6JZeNz+8O0AppmmN6T+5Vu9SGpO58y0C5ufxJtL8SNG9adgwvPxQK
         heHtu14P37VQc93pMMPj3F9sBSq8EoylVumCiDNDEZjWEtYepMsljNSwYpfD9u8JoqZV
         f1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785885; x=1792390685;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5WUPplqDfO932T8HETSyOqNnzvpg7DeYZKhN0l8jpc=;
        b=euyORkENsJhlm48yOnJCQxWJK0AYeOPDCzRx6bameXik27teGLjG6fbJzzQBhhkOTu
         8jf0yb/L9UIxiav6JycK/7hBEqNRemofD41G7YSAR32NxoBTxL5CXadfWJ6R/+jPKEu3
         4lTQFG8BTpNZ9XuTJVOy9MYVEkQXu8ddnS87EmgdE77CrSAoIqNXsT2892Zpd86jbxMt
         PZGi39/8JO7/nKGyZqSFZk07tJxeKcKooIqJY2qSKJjaH1Jn87+O6WYJJKJI0LfV1mdy
         J7bH4IUKi5yntsCzKadogbvb62Q76laQ+luqgDByBkYS8EzdzBG3zNPXg7USNc8gibwA
         l6mQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrccr0w79Sq4gZb5d0DxwsnAFO0NcGvMZtCm0o/sE7R1ygMfwB8/wOXgaCanoesDrEy5ZdTl9yaE05H8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYInToSuf9IEoOV+iFK5efbL6EBwn5J+3CbkWcjW4YuItpVICk9H
	bwViMcJqH+gkhSmjz1osWOZu45Wgl+6RVfWscbNPrRk6xqZoS6QrrzKVAGM3VJeCA39ym8oE7/t
	QZz/6YWiSfI5wK0BdCUKP1bzwb5ugc1pO9nVPAgGB60IwVTHNTRp8Z689Pui+Oye2WqI=
X-Gm-Gg: AYBFou2l5vEswtmCnTdT/kwwmezHK9yqDQwcqDWw5QediL2THi+Dp9qJIZUzxz4fTRk
	V1t76+Xce1KSVmLIihQiuYXict5d9t6nyIo1hAbquV2SoStFXpdiVadQ+TpShIYEU5pY0Hbb2Ag
	ReCJdC90e6aS3Kkp12WgxadUGiDw+QPGFiHvkQfa6Rt90H02cXPCF0ETjpJnxYf76MrS7cYsuCK
	8lZoIHYHEubFKtf8RySO8j5EjqVAppJUU5uViBO9lv1kxpHDoX4NOQjk0fshYbc0VWLjW3FIDF+
	vxEnr2Ts6ep5geaiY4MzgU0VZbASrSg8Z+rDLaeTj7PuAPTE8KCqEmSbdVLsMKcq2RBmuoRU2vX
	bu2iKQM+8KIn4hMXi0XD7ucYpYpR9mA9paA==
X-Received: by 2002:a17:90b:164b:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ab3a97eb66mr6399529a91.29.1791785885176;
        Sun, 11 Oct 2026 23:18:05 -0700 (PDT)
X-Received: by 2002:a17:90b:164b:b0:3aa:fc22:8ab4 with SMTP id 98e67ed59e1d1-3ab3a97eb66mr6399515a91.29.1791785884714;
        Sun, 11 Oct 2026 23:18:04 -0700 (PDT)
Received: from [10.204.78.217] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38f4863esm17543736a91.11.2026.10.11.23.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:18:04 -0700 (PDT)
Message-ID: <926167d5-e912-42b5-a040-be2bf220adbc@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:47:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
 <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
 <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
Content-Language: en-US
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
In-Reply-To: <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc7b9d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=84AGO2jvVljra0sjFOsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: n-ZisXWNGbFLN4w769XOgrCJkgBMBtrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfXyoPXUSrFG5uG
 E+Fv3gEW66N0ZrMHesYknNkRzQ2EtPz+HZrMAQLjSHTRu9pU6C95P6PFyWabDSjAWHaHwoOegeH
 cYu8OcMnQNBcleWFMTMqg9v/Wy2/BqXa5f3L9JWbRmCxc1QOZGAeP8ugySWuvvs9Ob3ITwH9kF9
 zrtUdKAeabPtvwyY2hK7kY3fWQ938DMh2as+4H6aHy4gW4bjn4fKsmrO0QvY6gZE3N+icip5+sQ
 cMy/KaGd2yiby5mXN03gkiRMG2p1W7bP5WWHnqegzzKXlpzDOixb/eQW0ZW+9nbfQxYVNMtPnZJ
 e3uulUmxJt/wzI+49fuJJMjTbRQa4OPQ+STOimWy8ee6X+kbe8dxmeRLYfXaC1sPflY5qzb7F0d
 +yVOoUFSc9T5T74FUYu9T5kd5d0A7WQvTGeyHzpTYDbC8sxT4ao5kUKUPPDReR1tL597lhMyLLy
 9fA13UfzqH7d8FZ+fzA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX/TpVsA3BnJlH
 bpxxogSTT4N018XOaPk72EitjYolYA4rD2OrTKy9GO4PalYPi1MAlHFPqtkaXj3eY8w1THZsIzN
 MfLBAO69PbhRCQM+5MyaeHo75pbUhKc=
X-Proofpoint-ORIG-GUID: n-ZisXWNGbFLN4w769XOgrCJkgBMBtrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024


On 09-10-2026 02:04 pm, Dmitry Baryshkov wrote:
> On Mon, Oct 05, 2026 at 12:54:29PM +0530, Balaji Kalkonda wrote:
>> MTP does not have audio jack connected and relies on USB mux (WCD9395).
>> Add necessary nodes for proper audio headset support along with USB
>> Type-C accessory mode and orientation.
>>
>> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>
>> @@ -916,6 +926,42 @@ &gpu_zap_shader {
>>  	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
>>  };
>>  
>> +&i2c3 {
> No clock-frequency?
>
>> +	status = "okay";
>> +
>> +	wcd_usbss: typec-mux@e {

Hi Dmitry,

The default I2C bus frequency for i2c3 is 100 kHz as configured by the controller driver. That is sufficient for the WCD9395 USB Type‑C mux use case, so an explicit clock-frequency property is not needed here.

Thanks and regards,

Balaji

