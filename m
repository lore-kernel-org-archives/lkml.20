Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485652;
	b=jz25wEhvUrzzVgMSSZc+Wx4lwIeAIA+EFURw7TzK9FC1/ZxSMFj4kMAkW8DWNzx7au83
	 GFIbgITf22xE8ETssBaiycr+FRar0oOoRPXQCdxU3BtAHU2wKCCxvSlPAykojZwYjeoey
	 /EuUN/zCBaSDh63lvBxh7SsURtKgwkx6UlMrRPa1JM336W5D3cQSXWqUxcxDe6bdhWLGX
	 si7MnWbn4YJ3Rvnobw4I2v/hru/s4/0ZyPu/QTdbvtcN6ZKHwHo5/YgyZgRkAdzkdKJMM
	 QebYYGpUrY9O2wS6WjxT5I6cHG+wXjoXt3dQ4SKeDuKCfvD3lXz3tu1BXkyT1GsJX2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485652;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
	b=NAC4gE/Vd0+owDqyzIfb8x0iu+0bx8gdnUjExPfPYNDtAZJg/9jTREaLsKwVAIqbkYWq
	 SxXQzkRaych9Q7qZM1EKL05d6zZDyAhs4tAbG6bMzNXBE+JCjyl8zHWGVsSlbgQKP/wc1
	 eAmV09Gc7t/V+eeXzxxYScQTyPzSUGEj8piENItiBZZjCDR8UMTCS/N5FLn1rc269/dRT
	 1UgMtnZHOf/oQiWFQ24MSgUfPaJlfnPXQiRu20ex3sGozX0cWE4u7SJy7jXEFl/yCdsP5
	 8/342V5kJIpwVUoGzs3PVH0eUn98zQQm+Dh+AxVVsGpwPkzhVty2O/7H6qjd4LZT2EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="H9w/UWrS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7Knniqg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5BC606A326
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5BC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H9w/UWrS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O7Knniqg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8Mmve3806851
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=; b=H9w/UWrSJeJbIX2V
	nQvVTHUIk9+AcMkuDcfmY2K5LPB0d0/vQLZHvKJB1GgwS6ZgpF/pon2XuNLsY9O2
	1AqS0+1qP/h4mkLa0SpqgJZAr84KJmvCvmsi16dp1PD3SSnDLUEiGdDAK6FIDEGW
	RPI7o0ubiYL+rz+89OTOpRAqZyyPKwTZIhotnABdnUUaJ7ewhFxvNDo9/ojIMfU0
	G0KtJwMh0bFnuUs+5iMD2adcHim7C1qc8efMuZofUQirKu9vo4Vy7z7E/g43QsWn
	AfN0KDuPaAsmc5toNeN2hU/MviWMN2N+VeRvi6O86ZbM5wNUHYHfHT6cdUww0sNU
	e/TXJg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p9pb6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:40:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1f1f2ecfso96375785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792485650; x=1793090450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
        b=O7Knniqgo56R7scxkIF+MG+oHs9XMb7exdylrDF2sEJsub29TLyjGqVcvXtX8oF8m/
         uYTaPoxg3zZj4O4bINfv51LwSeRh3MAbc4eFIf3vMz0nU5tabRuFXoIWJ1IbslFK5Q6w
         AUyCeiETrGly7eYTbcfGje1horoJdzLYHo1v7FAvGqRZcn4d0vfBqkETYzM210dnpj8U
         ttJxGmqW+QqvO4x0WU25MJGK0CAnPJCW0zvgvuZGWor8jbm/2UMxguI4wsXzzkuCnj/P
         ELkQ2IR7Zt1u+lioLorPoJrj+klDFt872DKScSnxcxF3+Xu6jtbx8K5tTtFFZbnSmWiJ
         g12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485650; x=1793090450;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bw2x2c35bCRKRxjofKbbTiTKrpNCpqCYi8VNtCJlIZo=;
        b=wBnavfg7m/Yw5dbVFJHMI58D7PxszpPh9jCCwhOTZJyGqBTKI7WsFqWjFREaK6ZfX4
         v/NMWOktP2KglKDIMDVlxsAejn8ZPWeMF6NVc2l9ctWVF7Jj+eqJdvjUWFPc1oD9ClU2
         3bqN2v1BmxhCwZuqsV8o8wTi7B+4d2JJOM3Y0iS5wi4+pILEG9pCEVvCFegw4DTo9zsK
         PfppLrtPHq2esyNh1qKzwVv0gINtaoDyPPZcqvLWvymykxQMAz/uN8V+J1rljcrRnsGV
         NdzbiE9Tpp42ltHJBrjGFjQZFVFUutRoQ2kzQdmrNzSWuT5rRQKfIfn4MUlCwn+uB4Ha
         bTZg==
X-Forwarded-Encrypted: i=1; AKwUvBy4MT4ZN+7FbjOYGIBmkaK3iERR/CbnbcsldjpzXBPCRFPq2P40jj6ri7ckct8DrLVyAu4qYxgKkxZ/Qjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1R3V1Ru8VOmYY5NuY13s3vVnTRW9GGzbNXQnpf+l11uOzry1q
	1vvwjeA+/bBuaE3aUkRV6oaTriI/mnhrTX5xAHOIj/+1G9k1vS5kAwzamvS1RRCCov+KHcSR0vM
	YCKaO4quUCSw9nOxYESAOAeU9ypyFm9D2KwEFbypLaJhE0GrGH14Alq2na8QjSx51bX0=
X-Gm-Gg: AYBFou2MzajQ4TqotuqTYFBUmP99POYF21mFKifAG8ZENHalEMh7wk+sxd/BDVV2hLd
	BcgiYPvZbCQYZReONSqffnZai874xm1/HsQGPxrABlLAMA3T+KeGNAWUMuE1aJLdLxX4qN11XQe
	GiquTztyBvPgkc73eWA/mnL4eAYBbIE7xobyC6gRYHmikt9p1f8sQGxAX7Dod6Ss8EVgjax36nR
	SyzZHwIUlk9GrUNSW3U6A3c8NkZYBSs9OfG0idJGY/YXiyV4d3ZDuqSJCvGMTPKf3mYPOIvLq3o
	Ve2K2ILXx/zw9keDnhtdxhwPhjfpEX9RbiScLOxijQeHGZ5Y2MHP8Zt/o6mPWZJwtVlxwDFH5nV
	THnLg+W0SFePjF0VABJKW1A==
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1902089485a.4.1792485649600;
        Tue, 20 Oct 2026 01:40:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2602:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-93f29d3b758mr1902086685a.4.1792485649072;
        Tue, 20 Oct 2026 01:40:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cefe3sm451118766b.34.2026.10.20.01.40.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:40:47 -0700 (PDT)
Message-ID: <063f95f7-8499-4b3e-8641-05d2fb352214@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:40:45 +0200
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
Subject: Re: [PATCH v3] arm64: dts: qcom: eliza: Add FastRPC support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-dts-qcom-eliza-add-fastrpc-v3-1-4e3fb632300b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8hr3uaZZQC4urvzIzM3D4ylAuNH_zCM3
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad72912 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Fpyk1htM9JFkJ419By4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfX1J6NJ5SIdupG
 EX7yTURmfc5wW/3E7qKYN2+vkArsw1GAESzAePGDEQ7AQnDmPG27Z85wqsduTjW+czonGvYqDqN
 uW1ro4cmNjhF+x9oHN6XugYh0kgBtTK0NcdX3WScKjdie/4jyR3xxGCdOhvid6i13Usr8RX2X/Q
 5ER5O4gQ2e5FtOdHpvTaZ3mJMYh6eIskg2+mDO1oiOM9k/f4h/W9RVW/olYDtddgY520N0Le1BH
 +ihXO2pwiox4erSAQxCCOTO4obj5g1v5Hpcc3ptVqrjOVKN1qy63zOYkIjC9foZJ85SKwpk0fWj
 EJaGKADkeXQRouVAkTiOivWSbYmkWP4mblYO8H8RvJUOaf9tLbjHojl+cvqU807Iz1tEZ2nh2AN
 3OlSa3GvJEYqHTbC1bS+sTgply04+seuWeQDSAVeaYPcrRuY3KUep3A04EwKUdKPiinpwX1zx2u
 FOveBnRADS6XAJ1ORwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzNCBTYWx0ZWRfXwo/okkcbrHa8
 RoS8G8O2+hy+WvGwRp3VJgTxN0Md5lHMsPivPK3lCLTByBbpZyGzk/6sOU67jt768dhdDNqJrmO
 RfYk2yeWxJTqr+UCj+nu/Eq3geoVb0Y=
X-Proofpoint-ORIG-GUID: 8hr3uaZZQC4urvzIzM3D4ylAuNH_zCM3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200034

On 10/16/26 1:17 PM, Abel Vesa wrote:
> Describe the FastRPC nodes for both ADSP and CDSP remoteprocs, along with
> the ADSP remote heap memory region needed by the Audio PD.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
> +			compatible = "shared-dma-pool";
> +			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;

-> "0x1 0x00000000" so that 0xffffffff is also a valid addr
(off-by-one)

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
