Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706040;
	b=t0H4jdQHOeaJ1heXaciWSCnmuXq/BEr4SJDARwJG6Opdfo9yXzJCWwm86M7YxU8i4Sxk
	 +6klw6DSwcgywzmggkSVvZTinHiczkQLMF2Ow9PXUtH+TyD09MS1xcokPYPSFrQ0ADKGA
	 cHCEtX3NyRG0g7ZbdBoFsNWFqy8M0CP4b/1kZS/EZ3NqpoB2T28Dx2L9XpxyT6ZYiSOBH
	 hy3ACoHgKamSs8v2/zE6oS/MamK4IHFE6ndGP1gMDLYPUuqBAiEYCJowCzpbKypyjI7EY
	 MN/JiJzuJSQvbAlfl8asMX0jQONkktiPTC/XHA8UmPFbFNckKc1DWhyAwYJ1VpNwbZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=;
	b=Oj/x7NHw0f89tZNuqnH9ql/rUFZLppvmcETc7XqTYkAUr/mQVumVPkhkKcyftkfW3J4f
	 GlXhdUD2G3mqAPsZnJSxoaNqYsofU5ULLB7vDTe3QSHYnK72RxZTF/t+rhJX0OSWv58W8
	 n22o9yoo59xygDPJdEmPUeROnHWNEXjaNzQt7hVEUxcSU1H7OXGPwQqyYKsai4W1fjqY4
	 F9/1gfX3Bx0iuArjJOyZZGUDrhuj1c7lKBYUGRcms03E0EsTz89PjZLfI82PgSrajtgM5
	 d1eJyTubHyVkrlr62nDFEKJuo9N6rlQfy0KZCDSpiwTnUShm1AzXJdkOLfIigcYZigw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiogIaaP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRPYdIEV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3981606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3981606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FiogIaaP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GRPYdIEV
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AAEo91476061
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 11:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=; b=FiogIaaPYpXXIDum
	pitbsoBx7M1oAzx4YFWUUWzflsdBDarJmI/IoIR6QOi6bVlLDcctGiIVzccDincc
	O33Dw91buL66saAR6Tnxa6xwSxSUDCNxB0KxREl/Wzweny65VyY3gcFkKQppjvIl
	thoQuscmRvHsYGl9//oS+drgX0uJeDF/R9cS5Sjt/XT4B6BneYEx3W6s1sZpXQ0I
	DPcmODvUnQPX+DnGf79YkA4spKXkYDvFqlqMwQduXanP7zwz0JNC/g2TGMqUfGHP
	sjpMPMihRr3KCNv6jeomr/NlYIfgsuAbtt2Dk2p0rrIvYk6WKUE1pvgRIpPabsBc
	VdfTOA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5hk07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:40:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53630cded29so7360291cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793706038; x=1794310838; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=;
        b=GRPYdIEVP2IieXb7TEmu+aKb64NGQsNFAvNsFqKYdY49HxkUVhlkauBT9VcThSHaUS
         eR1lWCQPN4HTY+E5lIFjYmswKyzujadgUWhA/GWHVByJV5AKdbxSQgkpAnCGMqNAVfQ+
         iEtGKKI3S756hvPiBENlQyeGNmwjm9k6/dmn+gZ8akX43k8lmqnC4sqIDnPHPMvgqaLp
         l7rqncgKx2s6KdZQ7A904zjYRSxLOQLoT4hdhLY2Tkgi7be4zHjtb9ORowBsk+6rxHYg
         6+zAWrrX3SmYlNh7WVfakGH3CMjwhbVM/rgnrfalN9bAALzPOkNcqMFWXn/J3qwXF2vd
         lnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793706038; x=1794310838;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/FO6YpKaEZyuI+tOQ5hSqOHGNnCb5sKIIH3PegRd3c=;
        b=BpJyUwozM8W3hyWcf8d06urXIC/bxfSd0s2WZi+EFRHxlt2QhYKF4Yy5yDrmvUkLKD
         8Tdfm5COTuClHmUdJL867m63s5R7Nzb9xJc72foqit0pfGy+IDPbOsZZz9HyepqW2fLq
         b4z8FBbqW4nNsWsfVpzXB74Z+CAIdu+WPHX99RQIuWVFUEL92uX7vxHzUeDmNXKzF+lT
         IpQUCvjPDHm8MHtqjc8K5HlnfYFrWW9xgvthHLF+Y1ez/h4PTrGGT9iIR/HVo4CxGhhn
         fcfixneGDXO30bA7oXi78qVDpyB8tjRqt67+tg9pt2822eYsqBZnWtTJ0Lt02TT3YhVe
         Jqww==
X-Forwarded-Encrypted: i=1; AKwUvBycp+7Lk3pYipl6vronRPLRkt5pvlCQG8dabJiuwknhc9EV7S8Vrch7yEzRUeApWU1SDlwqSLaubCGbgaQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0dR1CezdOFFBzJcPG0k3RuvNIyDRV+HmOCebE4yQ0YVHPBafO
	MRGxnTWU/EXO9n8VOcw1roWAGoTE7FlhSa5VIOhuRmyHaxF5uGLVpIc+rVV5vWnaRltmA6jotr7
	d1VMqvQPhE4lNPaIpcK3YR2hOoV+1u+9peffdiw6uSQTyijkk7JXzNV8yso10H+xsqcA=
X-Gm-Gg: AYBFou1956M6cLL0dMdOZXGeIvvnDJXM5xNaJENbcWgCiGdIthsXX+2onnfpXpZEh2z
	TybspXwW0Q/NFYkfcCJMyVnZ0CLeLhEbkLPatNM3zLAMcOPPbCrc4ZWqrLprbpcubVBOqEoIlRG
	VC/eGnNiB1ZJRpSyf1Kibi3lhPcIxns5Faopzgd0TFvp5PRPTR/Lu1AGk0EO4TxT/j+6Y5SsnAN
	Ulk/vsvH5WZISN0n75xhHU1o3V5xcD5csF1ZT9dJ97KFGgm4bsGHVw/VTWfnT8UYLu6XVuYaN+9
	hFsbSTE1ErWBdjiGY9p3ilt82WH/Ddf/KAJhhkRWWCs++UnnshoCymfneejo3t5fWwkvV+esMzp
	PSHWcaFDhzTZU2XKuarRNjzQZ182QAGY5yxT9ZalbLQGq3Z4KjUp/YQ7yG6E3ls7j+KtqpQ==
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr190129911cf.4.1793706037796;
        Tue, 03 Nov 2026 03:40:37 -0800 (PST)
X-Received: by 2002:a05:622a:8447:20b0:543:18d7:1823 with SMTP id d75a77b69052e-54318d75457mr190129551cf.4.1793706037206;
        Tue, 03 Nov 2026 03:40:37 -0800 (PST)
Received: from [192.168.226.81] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf2ef54sm75777466b.47.2026.11.03.03.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 03:40:36 -0800 (PST)
Message-ID: <e8075b30-3407-480e-9c83-320b15001f2d@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 12:40:33 +0100
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
Subject: Re: [PATCH v3 3/4] drm/msm/gem: Decrement loop idx if handle lookup
 fails
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
 <20261102172001.508440-4-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-4-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tNNxvWV-d6IJZqLJ9mSmKMc0d6n2G39I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfX7qK0IbqpRXl5
 3eC4bErUHA3XLZHFK7u5nzRig8H8d05VOUt2V5IOLjxD0sbJQ3SHALJim3j1mcc0A6yj6IU2xIr
 KTi332Wkz0VgyGYX3Epw0YY6SyrEtJs=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6ae9c836 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=9tEP0OE30YQ_IqY-BwIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: tNNxvWV-d6IJZqLJ9mSmKMc0d6n2G39I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0NiBTYWx0ZWRfXw8nm8JMDyFnW
 2li57w3K8uRUtRKmC/WJ6BXtdvlneeurFH2lcpZqhjUSbQ597tuvpIJDAxRhgvUneqD1LQjJ3ka
 WxCpJOSFKVtzIZsfNvW9OmQvV5Mqypl0rUorxscE0ZMSdncJTm3yu5OURWBBaJ+Wki0QVdlQAAO
 RRmZUTyizTDysWoC4EIDqNvbJQ9i/yrzq5Ii+sOAHmf/ZC0h23kcUcdj4XOvZjaXjqBtN5S3C9X
 PDu1wfeSj7q4keAZTlubDVcWy8im6TckRmXwcuPZDt7qRW9pADla7hENABe2kn+LOvrQ0iSzTfN
 UsstQ4df0pme9xypNlENOPh6gceAQCQnVOEkUzrHd+mL1y+zqqHmOPcj7oZGl39wqhlJXJ85xoO
 9INXNCumXA3o60u77c8ODy8h3QOhU0Vzf8BtF/kVUhE+Bpi6UDzWO8eofAI/N2U7v5/xz05/xZq
 qCC3WR1pFnwKYs/UQjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030046

On 11/2/26 6:19 PM, Rob Clark wrote:
> In the out_unlock unlock loop, we should skip the op which still has the
> gem handle instead of gem obj ptr.
> 
> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
