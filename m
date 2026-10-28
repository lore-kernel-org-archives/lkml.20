Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793184145;
	b=A9fKHvBiJsEnNS1qqVkljdMo1DokO3ZheeKeVLmcuu9fgdmSW6zfbej9MLmVjy2HnF/6
	 MjpLMWPH/BhY3E7upjTgKAqPN5uuBkhzdsDzAa0I57D1e4bs9flAzDvbHA3eHiu8U+gzU
	 rfbG3ejuuzLukEc9EpwCP4LhQdrH5GS5URBycoqJrIEakgMaLKBlOc1OJ4KGrxeRBB2CV
	 2892Q+x/YwBl1sd05+l+KLupF6c7Xrwh/6deLb6Ou2NQbXwb/VYzfPIS50wXfUZY9kEQa
	 RZHlZvu+TXZqAq+0NP3MkXTzv2Tl6FQsYwfAwMOeJ3r2a+m36U3QLG6IdroTN+vgCyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793184145;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
	b=U3/nefEL5ZpFi1razuJ6DzIBZXh5503sQt5GbkrOm5PfRnSdRZlM5G4wCaQP7bnaDMDf
	 ItiQnSoPup9CbgnVfyfwgmuuqzZPIRUocw7a9ZSN9FfJIWFzbrPNjcPmxgCJgA+rOPcEf
	 0szSlgQWHTN5JLILvm69NyEUu0MkpYWJ8iL+FTC2Jm5bIXam6ujJJLY60D+PMZ7UPvPkD
	 q8Nz8CkEzKMKVhXtWddDyyBvG06vNzxPijRSnZ2wMuZSCAQGy8uVuSluQKgWUnaSQJc6J
	 6rlnIoovn+6a1AX6xdUd+sZc6iBfvnGowjYOx8/vUamOPPQvlGcGdFUSVdHlEOdnegQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95CFA606A332
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95CFA606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mmLAmyUm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kfBdqoeI
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9An1642886
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=; b=mmLAmyUmawismWCM
	8D1zgUydQ1Xhy0P+VxZ0PyGm0kc7/uWAHcrFCJVniY9LLW0PtJmObLbQ53/nsWr/
	CkbEEd2FsH21X2F4FW2p0R2yTU3kHIAQWN6ILFgLYGx88ZhTBJdo6Nc819UQwAmB
	XSw5K0I1fIuWgCWjKOQuT8mJpj1k+lz4AoNT8gc1rHESfTlLglKUd80vFkKqlgJ2
	rzB695UWp/wYvMzKlsu7kXFI+2C/+EuHzk8yiVlnKjYvCAFn4PgqtXtbA0XZZXSy
	1SHMQloONLSwZVaAY40+iOpWtV5f+j54p8Ck0uXszn6mtkTzk6+j/ee/SBpa5pyN
	9Zp6Ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpukd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:42:23 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad53f538d2so767997a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793184143; x=1793788943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=kfBdqoeIO0DRvKVGSd/doQ91F/4i/COtBaN2RGThuLLqL+GPRIXGi5hOIQXtXQucHh
         HmWeGhiY2r704PR6JraNEwE5rvjJOz3f+ja+1oWGQ4893jntRA/kBawued1AuQWSB6Nb
         dTiwommSdDP9oDqLzGNPhud2rzMPAN/oIbQMcjLQsELdChmdIWKlhfUJ5+bZnP5Opkqi
         6ojn5ODmaq6f1+RAVMLygCA35R3qst0LTDrq18AZVXcBhujC2UB/UwVIibNK37OHJdIW
         f4Yotz9RoWNmh9kBinPruzA/wO7y7lPN9UMTlUBhy87aOlBpcDHsJDDUaivV9FRFwlD1
         H+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184143; x=1793788943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qhXGeFfyEPBAlzjmWsqA2M1XI8IZO5q4l9rV6x/6NFc=;
        b=ju0Tg2SdOMyoe6qgIBtIHbtaPTR1TcL6NOEDz4S28EQmuYj8wqYGtB7SEU2ooqsp45
         m+qwPwi4x4dmYRijISQGPHBSsnl1wMWG31Zwk2u/FiiJ34QI6WiCgj7VoR3z7M84Gi0n
         7IdoDJdNBJEv1LJq7G9eJuqhbpy7Q4T7Bxt1IvayI37nac2nFvHM9Gc+kMcHTbw8eQ55
         NGLkNl0tLcMvFMSa4u+UD9cFZsJHKotV15VQeaxJtF8Ouxw0RvEziixMHoGqDv4VOw+6
         hmYoRN6hbmpllrBDagyz8QuGlkXAj4IK+udnUc8+9PflhZE44Sg2+BCYn+4ysCO2cPfa
         dRhQ==
X-Forwarded-Encrypted: i=1; AKwUvByS/OPhgfg4Gw9GQX8DQiCmbpX6QzePYXU/OyAfTYTSnOtfZDijdpbBPqt9fVygbjhuarLlOH+Kc9Tr+eo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw87Xq9aTnrESpS5DN9e9d3Asfse8WBw/34DLgKNBpz3j0ZRH5
	ZLC0COziZuVZR8bjcx35qt6CT4F1c+Rb0CjmC+lxr52plPbsyEct0oLO5p3Wq/24iCYvGmK3Jiv
	JVaunwt4znad/0jhjFzmNdE7KijadmLqnbWJ0095uew4uV21OWUXGTlqpnXaA3c8WnW4=
X-Gm-Gg: AYBFou22C7iMTNnTMvdV5s6WwDthU5hsHjsHdZrYTXB9u4My2Uuur9iuq9aGaGHwdBt
	YaHrRAZGA3bat+WQLoFGjOgD1YybBAARiTZSBBB20qmLcihR301Ed1iA9aRhbiaQoFgen9o7pyI
	qJH29RcIHya4h5H/wGaON2YAPqp9t/C0mXRflvW4gAIUPkfVO+9SUG351yhYvnZYFWxHCFBeL3V
	6NwczO4GCykekQ/bh1hHF87a6qLKFZArEoJgx6LyCB5B90rWuZP65+StcNHnkV1rYCE5O2LW8DH
	nAwNvg4B+NI6CoR4SJKglybAm9O+5LtAW9hKSSpwdOukjYSP1Who67JgNMWZ5P1IO9XptDyx5VT
	aUcdppqbcy9T/ahO5koddMgVwHrynzshmZFbyYrj3GT3aCP/aOMkld60LhJYFEs8wI4/nSHaE7Z
	gMMQEbVoNzkIQgVAP7fOYfi3BCXEl4JNSFPg==
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449759a91.45.1793184143121;
        Wed, 28 Oct 2026 03:42:23 -0700 (PDT)
X-Received: by 2002:a17:90b:2e48:b0:3a4:a592:4cfa with SMTP id 98e67ed59e1d1-3ae58250508mr1449738a91.45.1793184142665;
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Received: from [10.239.96.176] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a9a58d1sm2493140a91.9.2026.10.28.03.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:42:22 -0700 (PDT)
Message-ID: <218d69dc-5761-4a8c-824f-7a15307f54a6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:42:17 +0800
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
Subject: Re: [PATCH v2 0/9] media: camss: add SM8750 support
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>,
        'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXwR/uy4xxy/m8
 K7/7JaXqkZaMz108r2vtt16PsF/bz8dLB5TkasVtNt+zcdCRQ4Kkhqd0hZ9RmbiiIfHWdVV5zGW
 +xhdSeDNP+ioIXnKK4Wc0FWnW3+rtcWQ+IJqGq+pRkDjy64EMDVGROTEaabPiFKmWtZ8PksjQko
 tXASq9XT6V9rdaTQh/TLc5E39mDjyvwIQDhSXBusUy3lCqNyBdkCGOYHGyahGFDOkKyUqXxloua
 D3Cw6WZaZ0ylTY9yy+jwchfJ32/478dlBBwADJNSwU1fN5G0C7tPPioZR71HMMkTAUVrglPe7xx
 LdUtN/nmVKg3aCtha3YI3SdSIcKoRgmHCd+nnm0o137shMJGUGUaGvMqLCjtY4HdJGkxfTLZP2D
 NjYUvcs7LBkAFPCma9JTIJm3q+oP0Q2TryzPhP9rPNOCC1f+8UBqArFutkY+j/AQpnt14t+QgId
 /J0xY64x/RtumGmNU0Q==
X-Proofpoint-ORIG-GUID: 4ZUZqjMBRfOoSYUW5lcuQKb89GHZCPCO
X-Proofpoint-GUID: 4ZUZqjMBRfOoSYUW5lcuQKb89GHZCPCO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXz0neyPVWslQw
 K7jA+v3aCIFAEaezJWAail44jtElPc0PpTmUnKax7/CXpNXMHJH4cNzAZecCdx+CAjwEyYuA+F9
 RH1mt3vh7WHraDYszWO/8WYZVYMuSX4=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1d18f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OGqcxO2SmPZ7BlYD9rsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

On 10/28/2026 5:29 PM, Qianhui Xu wrote:
> This series adds camera capture support for the Qualcomm SM8750 SoC
> (camera subsystem block with three full and two lite CSIDs, six CSIPHY,
> three full and two lite VFEs and three CSITPGs).  It was developed on a
> Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
> front gc08a8) capture at full resolution and 30 fps with it, through
> libcamera.
> 

Thanks for your interest in this work. It looks like this series is
based on my SM8750 series.

https://lore.kernel.org/all/20260721-add-support-for-camss-on-sm8750-v6-0-a5f841061d18@oss.qualcomm.com/

However, the original authorship and Signed-off-by appear to have been
dropped. When reusing someone else's patches, please keep the original
author and Signed-off-by, and add your own below it with a note on
what you changed (see Documentation/process/submitting-patches.rst).

Also, the follow-up work on top of the SM8750 series is already in
progress within our team, and it will be rebased on the Kaanapali
series once that is merged.

https://lore.kernel.org/all/20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com/

To avoid duplicated effort and split reviews, could you please hold
off on posting this series? If you have improvements in mind, I'd be
happy to discuss them on the original thread and include them with
proper credit. You can also split the CAMSS framework part out as a 
standalone series so that it will not influence the sm8750 CAMSS series.

---
Best Regards,
Hangxiang
