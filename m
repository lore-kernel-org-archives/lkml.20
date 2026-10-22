Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659890;
	b=PinJdvljtymSN8CCITbmWA/RGqVBCaKcU+eCVD8PlfmwUOJpsTSHOMm8a2cgVX2B+tHn
	 l0KzQxZSW6+T7xiVwHVVUQO2V8pZe9f7AZf4acP2c1cXwmHLv599C8Emig+MsoXpiR0K1
	 pSLZrv4hnMWQ2IToSYg5dPQU1gkoY5/R1Xdpe1cfGV/0ZkpsmAPEg0i8u1EPhQKvPIttf
	 zCgLUFZBZ8FPdQ9UqNjgd5aXFrBUz1lVrkO+NovKVmq4uAeLcL2gm2PRxwsCfNkus7ffo
	 UbkYSzMV6RMwfGS2Gdw/2JkThVMMavOh39Rh2/tWH0AJyiOJA/uf1cvF9zhsHNIvDfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659890;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
	b=i+iHO4o7tuGkUaKdKqvpeZc/XVhXLNzWUu8dYD77Qe//C3RRGhFudR0HY7eGdlUrqadH
	 xy3pVnZh1UoyYyJu843kMR79L8UTSuRYgTAx2js56tt4ghKfecR1ec/UjHWJSWN6Phmob
	 ftYG1LjabhoD6qzMSdgh6Q0zWygQvgnT25ARPLItpOEhBHAJeRWYpJ9w9Ti/wX5F4KErb
	 ZA0n1iqZAnzif4mlmQKt9+N2yLXJj2iE41mMK0BCI2mn0Iquqm0hQDYLYvPRReY7SUQ5G
	 COR/iDGPLM7s29ACAIPKD6/MpAFUQPAmeUFJcCfwi8H9cs8YmNMfsEZxNHDwjBnGCjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEbChZoX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPP3IIuE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6AE606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C6AE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QEbChZoX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MPP3IIuE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xuKF1560103
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=; b=QEbChZoXe8SUQilQ
	v1DuEY5ECmVDOGhoRCzNdIMh1N/Ryw3mScFCEO4OAfzCVJg2H/Eg486DW1hyHz21
	0I4WgaeTiQq140nHo2pObmyJJLDzs0u6PQW6oOA758cus8KQJIO7yOiNej/0gNQw
	h6VoFPyBWUlrnTCwMxjKua9/+RfFvDDGITtAwqe1YgzerP7TtaXdLNOkeRnl3LkJ
	ZlRJaAouwQSY4pJCYRrGG5rulR1rKvligTj8SUKbgxnDqRaC8J7ext4KxptOTpHk
	TN8D8uaWbFlpq2F5um8vn3EmbsS2AicPl8ez9B/bGZOJ7C3E4AYur/WHbBXX5hWX
	6Q76NA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahmfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:04:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so46408785a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659888; x=1793264688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
        b=MPP3IIuExSnL9EUYNbx32OLPP3d092SqUqiOOPWCXf8W3aoQixWjKmSOxOtzZzbjiq
         QLlWgfGy57rZq6bN84sRAUIkQSkkb2VFVHPyCo2f2SXi9MjYTka47NPEGOUlm7aRPRz/
         w110HqHoXDq3jUqqhZkYUZ7FKmuLWU1FL/kM9ZpdurJWnjEBZs3LHF/ie++l9D17q4BW
         T6dUle7C4wE5tCNm6mlaR6GefB+dpDtFI+ITvyPL7xvFnMH3QrZjL7OB97T1SqIx1bu0
         Hra2vsmdylKwmF+gKbCMp3szY5jw5mBf/TXa+ay6eyCk0yF3vAQpA2IDhQ2P6/4IkWhB
         MKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659888; x=1793264688;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0SnzBaUgKaKCBmz+EoWBqVmXukamKFPd93LngtNdqQ=;
        b=mTfEMIPyO0xMtswGZq8f7dNnBUL3yhdKNnGfZYlzOyd4NbSU6B8SCK60UXZAyXWqZt
         YUz/t8ZU1NddAb+XfnAtw8FuOruOjKzQl8RrAqJnDQvBz7OhjOwJobwNz5w4L5DWcQtP
         hbSWiq7sIvEAcOOQaIY/cykHTyEF7bQk3+tyuLBNKAJYjUk5cSjDSYmFAPuv6MxopP0B
         u+wtTsvH1M94uP/HU+W47GmdgXaBDh65UP/dW8r1vrzbJKdvDl/z2kKU74MIOrtxkxU0
         7aeYx0P4Isq9zK2q+nSOS2XbY47nlq7Atj9CvaMh6xgN2tMFK80A2M33+LAgH8CaNVuC
         QKYQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5hta6f8938f7YHDqcwVd6Bp6aIshjOy+uPHgwkJ3xFQDr+T+m1LnbzN5zx9LeLdzFJweYsbkw4xaIg5k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNDYIisDfSorSVIQDUQ3n7E3UDVsasq/r1eAz0YEEGeTIaj+Kn
	WpsCiilgs2ztxro1rbDIH/WKgsSFJhQO1+/xG8NgHqdU6Dk3oYuq/w/97i31hT3pFaQ5k0ThWPP
	vi0z3sqsbgekh5YL/vFOobTyf7CpNnmWPRc1kzeBHDkEanHqDv6NcXFTJvtS+KU1fgb8=
X-Gm-Gg: AYBFou1CaBl0rIbfKu0/+FSfGAb+W9TYFCsuZRSj5KaHmGgsij5rw1AWZyuAyKigs00
	137NazVotBEfEfepMXIVwqyWsZjwGdQf46mtX8sE975Pp0e+JQpnyKAfntqFwT4Dk0OfW46hCMu
	Fx1UHuI3Z3NqoH0MTb3xIaU3yKJhwRr5QEwxiZymRDhrOjLAg1kRGG3lfiTySaiX0PYSyQFBp6D
	hP/ArfBXO4z7o9db0Gj0cxmbzaS5LQertVn0xjVNBRg8rznBJ9PcghzDocjbMuGKwnUwEt4azd2
	Aq/cJxUWyTWEcL2ifM3iZT4beqfQJEryBrwobLji9XUgmF95/kPOn4gf34bKEp46ujS89t4LBuo
	cEkin0dTeVDfRUxX3usNCag==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr986296085a.2.1792659887663;
        Thu, 22 Oct 2026 02:04:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr986290685a.2.1792659887103;
        Thu, 22 Oct 2026 02:04:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e13d2sm81040666b.72.2026.10.22.02.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:04:46 -0700 (PDT)
Message-ID: <39e5f5de-c9bf-4817-b0e6-c598d421feeb@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:04:43 +0200
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
Subject: Re: [PATCH v11 2/2] Revert "crypto: qce - Mark QCE as BROKEN"
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King
 <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        stable@vger.kernel.org
References: <20261022-qce-fixes-broken-label-v11-0-0d33c34fd0c3@oss.qualcomm.com>
 <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-qce-fixes-broken-label-v11-2-0d33c34fd0c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfX8eM/HO4z8auJ
 TiloQarVbTL3O0PNnrb2eGmUdKTMDXrJ+KMyaqLXZBGJGf6iwQQgyhG0lhXZYh9xWm0657MdBRy
 6yIzow+hGEygohGEBpiS+d5F+7ElZ+iaSuUU92tdC4gsMvBDDynPrOuMxK0/cSVqeFJOl1d4+ti
 UVsMNwoHJcaPt1gtrbAATiy/HABitJxZ30DYOY/tEtHYMhdg/vem1MoWdfN/X3kdot8RB7QpBRf
 O5JV2bkofOPSp+qvQ1iKylCL2gzLtA1cfsjJ6JDtVLBusCs8mKNj9drqlKvDntZnxkWkLoubQhs
 i3wJt9gXh02ZU3hKOYPKmfWBQdB52q6c+j2vaL/OwdjzZKLJLJKhZkJbKkqN3KC50iN1L3YCcIK
 jqJ99T0OGKtqEg3nJHUeTZ4qsWMdN8rHpEy7wC7hH4BVAbxDzSSEHgymEauaOX0zzj898JFZQo9
 bCVMYDpulcxc5vIrwMQ==
X-Proofpoint-GUID: BFT8zqehqExAe9YdcFRMCt7jmXh9a4_k
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9d1b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=3IWs9GYwE_XJkEP3BLIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: BFT8zqehqExAe9YdcFRMCt7jmXh9a4_k
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXyslxXZKqS+RV
 L25zHK43SEHd8ldthyJI2hLbvY2F6wMIWUZBwV8NVam1yi3kxQNGx5QWcs3bpvZR/tRjG7PEedj
 kGUUBwZ++BI/ePNB/mVwnEZ+Nx+djkk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220036

On 10/22/26 10:58 AM, Bartosz Golaszewski wrote:
> The self-tests for this driver have been fixed. The crypto algorithms
> are only registered if the user explicitly requests it with the provided
> module parameter defaulting to false. There's no reason to further keep
> it unbuildable with the BROKEN label so revert commit df373d39c6f0
> ("crypto: qce - Mark QCE as BROKEN").
> 
> While at it: update the Kconfig description by saying this is an
> "offloader" and not an "accelerator".
> 
> Cc: stable@vger.kernel.org
> Fixes: df373d39c6f0 ("crypto: qce - Mark QCE as BROKEN")
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
