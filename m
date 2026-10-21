Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792564604;
	b=n2C3wLDVhyE7qWJrbb2Cto1NiaSPOesO02BClQfnNdjSsBZdfla2tWgTXspObkGIawvq
	 kfPPfQHDVI3Dnih3hCujp0rBtu/NKhtkW/M+5coxZayRDNyMSnK1qB46KiVqAH6jryhdK
	 gXCtn2ldMIhZpNAk5FNQxtQAYYS8YCEZUVZergDFfNvqwZfBCBISG5Vnr4JpUdJ0qZvST
	 kRZLVQJGOmcVAdQUYH9htYxMOike3Rn/lrFjgKqp6FfthYfLEXq2S6LNUQy9hV0UpRm1z
	 T1izAvi6VUUWcfbvVGnHpgt1LfLm4sU31jxoXzZUocz9qG9kW52sgVOr5ya8C0l6FYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792564604;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
	b=gtww6RUjvEkh95mYV/JrKXjgbFGLcqTbP/4XjZgw0Z0tm46X8xRwVcVjWtwkGBziUA3m
	 KfwyOWKGgFrEIF2kPN9JVxlEsSgKyFEfw85O7OyM9nlG//vjrihCBQjX5DIprzPcjlN6k
	 o5obB6yGZLl8UlF/9kX4avnt+4JgbMpyz1vXdZFpOxy4Q7e2GK2X9DCp5aAF6CJnpVKLx
	 rD7CKSBof1cgSCHnm8ozaspl4d+xPvyjSmGCibUmXRZ3MGf7FmGLE6EiEA6/fDLWv4wLP
	 0O4iJZW8RwRFv1OA7lAvQGdkbPDla3ehnI+5NVyUDl/USl7fdY4IjtSfAHM/uD56C7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqZYt9N;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5Xf4tgj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D28606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:36:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19D28606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eXqZYt9N;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j5Xf4tgj
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jOBE3573340
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:36:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=; b=eXqZYt9NHbMWx11B
	mEbZHXnQxoqS+81N9BkQhN3YP9ctwTfcUQRFpL4mlOp5wa0/YkdDYZD/cqoJF5o6
	HDkNSAOMUZp/0ky0maFWcd4wWZGk7Q0K8nhHD0U8yTFYWRJrFq0YzTSiMmkCUo1F
	+m3ydB5fVyDdkmwo3CqvQm/DJ4Q46hQuPRJsiwSgBik4VM46prhiq/BaEXZt7UCj
	8CuGn8rE9AXZlaVTpcWjgC2GhE2/Z9A5Zu4bkRfnKn9uXqRrg9d7BVrl560ocD5c
	8nwGk5g8TXgL7CETA392fDYl+YDun9f5DGXgjLvPWnHDaJHlBIuHQAmaIhzaiu0p
	ej9fgA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htc27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:36:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-189d17eca17so88925c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792564601; x=1793169401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
        b=j5Xf4tgjg6MmEay67YJtTEv4Xz93x8IVm11M9TjomtTRVwCglACm2+eiKt/jvPCSkk
         lMg9q38hpCgn3NDDr8qzr9j/OhRNxNoRyHMQmZCGMND5txh/Q+kzvBZdHx6pBor9Lz8z
         vkR/clACkQzY29HdfU9tmO1egH340bswMRR9NDuypPQ5qSU50D74CZPcVzA+bNamOhmj
         wAUSeV3vysyNsqRPQaopJ5hzuDJ/8rv2v3tqpyw1y7Z07zRqNsqMsvfopIPhD/GzZ4Wu
         dItNXJyiXCCBO5t+2qka2ixFUfiQn5y5Vi+uacq83rDykgi6bjAoVbc4bcVFoN5/+YyS
         Rk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792564601; x=1793169401;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUvV9KKh2Pn3/81yGLjUx1I7O0Bd/HZJETt1Ks68rWA=;
        b=Ods2D8uRnGBHyOG+M/wlAfa3xI/2T36Xg3vPpaAoNZm8BLRtVXuYqg+ThfOFp76cmw
         UXhoUnvnph4Eguadpqz5ZZ1USlepKIov8uevIV6ENGFnY3u5vbAFuBse78WKxKc6muD6
         lk9QNvLHiB36qWByZYsmZTG83QaJ1KnDh2IJCORrfpLan1dOCeAA70+OcsDwbmKUrZUd
         lsgp8e+MZkdGvW1mybIdTqIoVleh1TbmTsfrLFl72V6hR9uOf23BwpgGZljpDPCaIAb+
         +kZ/fBKDOQIAIKBI5dtFXuhLvlEtmXVuno8DUZ5ZZ6/KQF72ovboVx1S6QoqIDwNRVZA
         9qMw==
X-Forwarded-Encrypted: i=1; AKwUvBz3d0xVRplEt9LcR0uHp0m5n1OHiksan0iy4LgKc2PC//zGNw6bKfVf8ijRcqdWUJclp+pRKwCx+t1wpiw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLmwLtOsiLSjWTbHhAPcjE1vspMlggaD4fJvNiF0GlLIus4bvpz
	VUugqcAWXg7ihB2j/I+G+i3oe6vigHm0q+XOVuobX8z42vmW+snK0lRaxInmwIXozqp7ggBf0IV
	1g8MJY9EkyvlHEW+ug+unM+1IPP2Nbp8gtfmj2fovD+B/sU6NQf9td/03Kuk+kcXqms8=
X-Gm-Gg: AYBFou1bj5hoJSsMvQxk0ZEM6brPA7OXk4uFPNcVL5ex6S2SN7FJ4PhJT55AZvY5O11
	o3HWHZ1YEZZ24JpmwgcR8gp8OpdAUjEpGxQ4r+Djl2HW6xla/xm2CJvkoGD4CoqCJ8OIINMiS9j
	sCpLSqzd7BpPgeR3d5xdzP0LtTM3QVyTsabQrSZWcMUjqkMCFm8LAPcDZPbS2BKoZHkXa8ZZz1g
	isPq2rii52IbM+kWvfPGpMyJqlZZn2FtOsOyDSownoEsjI9SEGqHbx3GjBuTBcZXw/8+gpBFBjz
	VLhLAb8zoLc77dR/W/j4NyupPJpZLhKm7YCzcTWMipBsmT9aMTpcqaracO+N264cG+DusNU85AV
	QZWZovFnomT0BqRy2ere0
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr2050301c88.2.1792564600662;
        Tue, 20 Oct 2026 23:36:40 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:154:dc96:c1d8 with SMTP id a92af1059eb24-190a03343a9mr2050272c88.2.1792564600108;
        Tue, 20 Oct 2026 23:36:40 -0700 (PDT)
Received: from [10.216.19.242] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bb7f098sm5544025c88.12.2026.10.20.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 23:36:39 -0700 (PDT)
Message-ID: <cf08ef44-54e5-4354-a553-9c51f628f864@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:06:34 +0530
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
Subject: Re: [PATCH RFC v2 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018-nord-soccp-dt-v2-0-4d713d316e9d@oss.qualcomm.com>
 <20261018-nord-soccp-dt-v2-2-4d713d316e9d@oss.qualcomm.com>
 <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
In-Reply-To: <atTATLreJ1Fo-ZqI@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad85d79 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=j2EAsdPlCOniiROzf4oA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX8l8W0VSUYPwd
 2QtxqmOgFZOmfrFmbUdQvhX5QPHCWVuugWQuKjRwERs2M49lAyh+HfkKbN2nN4BAR/5sUOWVcQk
 pPVqAJjQCxFUrUJmE+SjseNX5AjF/+Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNiBTYWx0ZWRfX8JjACkhCKe45
 i3j6mmgpmmwVukLb8J3XZUtCTMuXvX8izA0ZvV41Ud5CbfNitrh5Nky4ry6ot6cEcRD4HpcSJof
 Dz99Esyk3+xCQ+8YqP3Kj34v/DU48ORttklij03pnK6q3WLTDVcW2yjSZwyfQmc1mwqtb7aqkpg
 mNRl9Hp8HqHrXz7Z7XLt50rMm2VUeYunR1J0ZxXioiloxsbU/2dsy5XMehpexArQd5Z86TAmlbK
 JIrXjBQVttGjNuSob8oc/gmHOpOEvnrxXSJQ/vyvJJjDX55tOhmCOqg64Wkzg1hIMExpnUaPeMq
 EiB0i4UezxMcXiGqNeguarOVekTOiGpMt4ZrxuqsvLXlfesoEsUL/xdo4inCqWPKua+Ah9dAX3Q
 dnyPTSse4LSkKtZZdqstjC6MXVoLjy51YwrTMuY7s38BW24eBD5DMpgVrxrnuLi9L2rqaE+htun
 cCXyiqbU+niJJnHmNQA==
X-Proofpoint-GUID: TIycIcsNHuoDkJjzer08h42gOOfnEjRb
X-Proofpoint-ORIG-GUID: TIycIcsNHuoDkJjzer08h42gOOfnEjRb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210026



On 10/18/2026 6:19 PM, Shawn Guo wrote:
> On Sun, Oct 18, 2026 at 12:46:47PM +0530, Anurag Pateriya wrote:
>> Add the SoCCP remoteproc node with its firmware path on the Nord
>> RRD board.
>>
>> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/nord-rrd.dts | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> index 47978df0af92..89f8d36ed812 100644
>> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
>> @@ -434,6 +434,10 @@ &spi16 {
>>   	status = "okay";
>>   };
>>   
>> +&remoteproc_soccp {
> 
> In alphabetical order, I think it should go right after remoteproc_cdsp3
> rather than spi16.
> 
> Shawn

Yes. Will fix it in next version.

Anurag

> 
>> +	firmware-name = "qcom/nord/soccp.mbn";
>> +};
>> +
>>   &uart4 {
>>   	status = "okay";
>>   };
>>
>> -- 
>> 2.43.0
>>

