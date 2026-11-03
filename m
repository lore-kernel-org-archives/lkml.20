Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695908;
	b=cWcVbrEgihnTChHunbJDJ7Uddd+9SsXD73/8GyKWr/K48jElKBlwGVdA0gFKSOFq0BqG
	 3BK00zPe51NuRL3jP2ux261fFjkOJ9z5xtHrrRR670H06Ef4lo9/R6V5VmO1iZZpU+M3a
	 loPWuV7LDLPwsxL7j1cvxCkJNBPvX6nsKwPfL4ESu3MPTKH8DJKtIKKFugMA+9J1231jm
	 LSEV0/StkTa82Tqsq+BwWo6LANy4u6O1KChqiFqGxjLAtwkYWBgCdRk15OSlFcnj102np
	 GcOLgNbl8Xrci8UtfGch0avmmb5LzAUP1Oda64ZP7cJxQi2mr8p1FSy2qa2ipk6eGtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=;
	b=T6HgChdEefGlTcsPWJCjn9mw7D/pOU8FL2ZYSKWJhT96bJ49EoE+Gm7QO9KQgE7QPe7q
	 wvz1RZ7xoSFd1G7B9BlsE4oCwn0dl3ZgKLgGd8dHL31kI5Ixj5rFPTAfT7G5azjPRUI/E
	 Ilu1dqc5gx/08//aPVYRzCdTQ6aD9+AB3KKlKg87ucSCRh5TU/ry3oigVh6Xl/wKAF3cy
	 E3c32GTxqeW1Cw/5dv8fGmLmXFryfrE3ygtPoIWOmhUbsY097eiqEzWJS05qRErV29WMs
	 KNbGRdcAgnN0gzaDovSp8nYGm/Ncid6GGfik61O3nsSY8R+ClJ3EvqQlM0up5pn1FsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byxHh5Vy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icnUUpfH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12FC8606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12FC8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=byxHh5Vy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icnUUpfH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A34h6hV750896
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=; b=byxHh5Vy7u4l6tdm
	r2fWyET6aQ5qcLf9L8IUjEpsXuKh+j7nZnBzXyTG+pq++GXSyOEyRWQa3xpsUKka
	N2NawuvEwE6BkavTJSvrGD9vZGmRc6QwRHwGFBw2WZDFXs1xAFWw0OWwmsdFZnZx
	YaHRbLxGz2pDx4XVq2zMVy9RdczTCL4VP2XfoLItXsE0HW+uy0LCbfU1fP1VE1pO
	2KTXD6MNaBczeSwpq+MFT4x2ow1MxHrnOHU/rLQJi9GlbB0fFwdO/T1Hvy++WRnp
	h/Ur3wDMqwpRMyPBVGTz/1r6oMXLm9PyqT59OzgjqKk06dRdE2QiW+z4weassp0U
	427d2A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5gwep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:51:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c4d46037eso9575766d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793695905; x=1794300705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=;
        b=icnUUpfHj3tneN4gWWIHjLf+8cdd51I0tiAI/3t0liFDhr/sa6HGw75Ty47QavM/th
         /Ntw1CDoyH3T3sxXuqsD/KhU2YU2FULHKacktTucOLuSui+TyBeh4287e8UqaZSJh0U7
         ixx1NjcSFnD0TpYpUFaiN2VMgyifEMivoiIHKUDxKf2MocXXHfhqw+9zmEK2jBXODjaM
         GKtbNvAPZ9swB8SWjDtIXQq4C+cHFAG2fyAiGzY8EcXNs11LphcF9z9NyhuLvBf222fV
         8qeBYTTNVm1XXHAVNXS+x78OPo0/Fpe7ql43463cYD9VRmYw4IStvZWXRDpwRgU8FLzN
         E+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793695905; x=1794300705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XCvvirDHMt/mDpBHlLgw3Uz9ts0ZYOeL2ziEuOb6lFk=;
        b=OWxCC7+ilDA9eqNWkl0FeWJqKuJtHvsERZuUPN0+jOKUl6qMXTHxHA0zBoHx+g269/
         YCR/hwCimL8YgCv5eQhjq/TZildI8S8kK9m+vzHeQBpqkTN+Uld6vFsKtPG27vzM2uBo
         mRPe6fiuU2C0l4n1L9oitLAW9rJlvu+V+af2efknzQKZXlkKSF37WUyA1pyW5beylGSF
         YfPuPrh9nTKkSwqCqeA0Z3m7grAgb8Di41McfbLQfMD9MtU+Xia9Wl/Sc4fo8XtmHqDv
         mvBizg1YDVfyUWJLizwURGN32Vo0pWdMCdogBdGjZg3i56beulnVsGilSq9H01UCPMdc
         syMQ==
X-Forwarded-Encrypted: i=1; AKwUvByODPVIwHU9wt8TGLfZarfM6bijX4PkBE+dqPvMj2mdjFoZGwklrewuyIHHXTd1NyyfXLjwpCwe1a/NCK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8g0FNqCxHDepS7UuZ5qBVQrFL78TLu+jy8SL5gK9MT/S9MrbjG
	8Sw+ZWskNkP5YLHQA5VzXfDvvwro4aQH/OT1bSgTxTYf3jIufMeiK64zbNjLAeDkOJp3jJHJFq8
	1qeNAt6OK5GbDQaatlkgExIXQwduRKitrLPk6bqyy+O+GcAm7RqZ7Jhheuj0iT7EdvaM=
X-Gm-Gg: AYBFou3IuB5i1z1IrMnnMaz5bg63qFqR/9ExlZQ2rMTBitkK4mLDFqveDaL5EZk8Ohp
	Ie/sEshvhWRvM08eZfKxabyHHHg2kb8LzborVCgccHLVriCSgZb/hy3E/AXp1vE+PmiEeyqarXo
	9TzdbEcQ+NKyPUOhjkqWnTh3Xy98c5s7jHS+e5/lm+mVEnQ5MFCPgH5bv8Vofyy9hNjrEYQG8cJ
	4vatICB8XiSQkn84/3YD75gVVNGYaJkWSXNIaFuybUvIjtmZaKvEkPCpEQT0KoXxGYet7uQRxTa
	itfYR/gIQJiaSkP49HY11tH0NSRVTfe+dpRfBjR9ffKHVEHR5+woyNXS6SuSf6Etc91uq8F/z0X
	90wGMrSpLnuuerIyW75Za1gN61RqSecuR0qbLS6FFyqo+7e1QoRTUG6lgEAFGXXiAU8HJyw==
X-Received: by 2002:a05:6214:3f91:b0:91c:6e94:3b52 with SMTP id 6a1803df08f44-91ca47af0f3mr285847416d6.0.1793695905251;
        Tue, 03 Nov 2026 00:51:45 -0800 (PST)
X-Received: by 2002:a05:6214:3f91:b0:91c:6e94:3b52 with SMTP id 6a1803df08f44-91ca47af0f3mr285847046d6.0.1793695904509;
        Tue, 03 Nov 2026 00:51:44 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cec16997esm66447766b.79.2026.11.03.00.51.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 00:51:43 -0800 (PST)
Message-ID: <47cc93a6-7816-428c-9c6e-43d689b459fa@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 09:51:41 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: pas-tee: Always initialize resource
 table output size
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102150110.227479-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SfYJ4Ek31K0mUXyDzwNCxpeqiYyN6L5r
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX9Gk3nO8wZC2G
 efxKapeibLmIeISRfSWQpiZCVILrTkYrjpZmYt6NVgkByoqq92tOsIp8z47Dq5WjO4iuk4A/dzt
 HPG7vDDdtxEvExHJFOkUVKgwdr3AZtQ=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9a0a1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_Sw2Lv-1HmNiuYeRDNQA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: SfYJ4Ek31K0mUXyDzwNCxpeqiYyN6L5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNSBTYWx0ZWRfX/by+csNhrfHo
 7c0J4H/gYkZkk9hLjBvZ8gzwPROdsuuQrC1mUxDEW9zD37pO03ttg3tTiCniX64/wJ45kqlBR5F
 66XZQwZc1Xqp/IbyXMhiFsOPUknI/LxCQnHSTYAcBYa2uh83Dtjrc3BmT0sGcyr7jvd0MwWHRrx
 D2+JJnOBZsjL8umZ+fsbgOzCR2gLmTQsa0P5dMqQ/I6NckIxuBXDyJ4dwnVczoZ+NBHkYFbNfh4
 RM2FV4Hs2ichMcg9II7pq2gdhyuOyvlKF5oPY7PBgjE/mrYqAPGXBBSsvrnB3brKULko60RX0Pw
 WbGTsNSh2x5tGPIo3/P/R6jpYKy0lzCHCBhcAlL/YoO1qiOmKG7wKEVsyubjS/it05CbvA+ZMUe
 1NRItWHj4tMjDcuTBWKNScisX/ZBnEwHHi8EuevKYvYHsJIhmQp4ux4fkG5iKgoUOFizqtV0ZYV
 rObAmzb7oSYAmBWY1Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030035

On 11/2/26 4:01 PM, Krzysztof Kozlowski wrote:
> qcom_pas_tee_get_rsc_table() sets the "output_rt_size" only when the first
> TEE invocation reports a size smaller than the input table, or when the
> second invocation returns a non-zero size.  If the TEE reports a size
> bigger or equal to the input size on the first call, but then returns
> size of 0 on the second call, the function returns NULL (no table) and
> leaves "output_rt_size" output parameter untouched.
> 
> Caller of qcom_pas_tee_get_rsc_table() treats NULL as success, thus
> uninitialized "output_rt_size" output argument could in theory lead to
> out-of-bounds accesses further.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-bb15726c-4185-460a-a5f0-f779d5ee144a
> Fixes: b6f7978da0c4 ("firmware: qcom: Add a PAS TEE service")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
