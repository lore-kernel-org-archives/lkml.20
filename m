Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868895;
	b=MfIiheXzFAONjXickhZoQ9kJXBb4aNRcYl8Fb1pcJzz7PwIOgvOXisxI+oy7uyjXdp3c
	 MAJmND/WTnvdXVglIiQwTE/ZImG0I5aXGWW1ms4m0V1n+xSt53mmKwlEJUudMDo2qajXw
	 n3N1NsuGRpGOxNRI8aAcUNAnimAR3R/Yhz4Pg3DfcqeWQOdLBqEyr2R049Da95DTQJ+ol
	 NrkOwdxr1+ehPimDrEr2kinf7D9NLa+597k09s8uZ4HXh1Img/ShSbRXh8mevTCs+sWHQ
	 IQq+wtOT0WUYFr5Creuf+rMd9LcgWvPaHmGyodYG5xiVan1/saAC4iZVC8OKIvH8+OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868895;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kO+uPMdDpz8W5t/f37PmqHD6B/Gio3Vy2iMQmXxJUgI=;
	b=iOM89vHQMX5AxxHHy/PletkWNT5yWMPrCNLQnUsKnBNhSQZNMAtq9xGKWQJhQ5owcEfq
	 tbzWuocnuSrFJeIlrWlGJGqRyugBUuQo2pUD4dsySTAADZ2AMggvixKezhk4MzeBCK2N/
	 jKQzkgaR8hrYgQ0H6UAw5zdL68ysbPuegTdzWKRe88uc3Eg36L5PrkfZr80cdsrdnVtUn
	 m7ySXN5vy6pj3YAZnbwzGy4d8jcwZpAT1E1I3+XZfrNu+1k2yE0J1s43ohpflypEulwoo
	 mhZJ+gNkMYS/tciUTOyy0DaDfMZFlMK+9O0kffFlGBuCfn9C9csXSWbGdcW7PRLSkGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjN1lQM2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJS3lh07;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978A606A33B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8978A606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjN1lQM2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fJS3lh07
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UcBU3624953
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:54:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=kO+uPMdDpz8W5t/f37PmqHD6
	B/Gio3Vy2iMQmXxJUgI=; b=QjN1lQM2lBm74tGA6J8kZzfAbK58hzzqHrUuUJES
	zoJacckMYEzHW4ZtwZEl4s0Nq55KdU8lOEiBIOyqPgVoDGsQY9dRCJsXhshVhsQb
	g8Ix21CdLKg+ebKq6KCoA65a7BOqy5QFdK00RG9BpFWYziliPuRK8aI+0gBGNUQT
	LRitOMu1tqg1JRbSA3pCpXrftXbHpCGwg781gWafpKEznqoWmHwYsOxUBXmwhnFE
	s7FRPQqcd7KcGywUrgyV5uWQIhI81cxvR2yvmwhXKslYzNbNeR8KjDyV7SZpiPNi
	1rgGdyorUHmNtw33+ri7J9PxyEzaLm9qeLAcuXcTd8EQ3w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6br43uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:54:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7c02e1df088so431502137.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793868893; x=1794473693; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kO+uPMdDpz8W5t/f37PmqHD6B/Gio3Vy2iMQmXxJUgI=;
        b=fJS3lh07mwOOdRIf5arM/QvbuGRl5vPJsdmldR/nODTH9CgeuUds6Pw8LSsv0pxp8P
         R7RrhRHUF3MCGDUsN6hl0Z2Qde5ycl9HtxMSciOH/xehUbJRAllwYJodab1xDEr+7BCD
         qTnuxZJx9Tjk6k5TF374hvjw9uZjWU+OsrAb0pbK/oz9As93le60BCoLaIo+9g1HPUFk
         utN4OH5bMtuDHqhqg8Gs+Nj7lnI1cVOkSd4+PUkPDrLNRlzwiIBH1QzUPpgFP816R129
         ZHAqHTskGRQv55DYpCuue45pNhmTIeOxbv8lqHd7msJo5smlBMEWZitxzQiwz0iIjzCm
         OK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868893; x=1794473693;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kO+uPMdDpz8W5t/f37PmqHD6B/Gio3Vy2iMQmXxJUgI=;
        b=Ciaj+VOAFOmCa2PcMrXQkPCtUXwaLg6QlVkribyM12f9hQuW4+qVDvlVPpeMtyghv9
         QUHds2zoxWCIcctO25XwbJxryr7gyy+x+Me4ljyUoztpLEH/HDDTvcEM17P9QcUOpJWh
         IUzGZgZmiytW8XQEh3kZY6M9Q8ktNUeVBCKGybImp94shjTUQAISIp9L9Ezg63XQMFB+
         SrR6Qy+wZ1Ttra+UFhk1k1heX+lWOBWRbz26fKCc6iZuGkVRO2U7YZQFoi9MjMGKrraT
         /SWeNbpt3M5Sz5u2GNfEOdBfwj82pFqaEipJNa5F8W0+jyE/UHwqSsHcpcMRyn2TXQ9N
         Hp6w==
X-Forwarded-Encrypted: i=1; AKwUvBy4Wq43G3IZU319eAuqEuNbH54B1hP84jDhdzn3K9a9b5ZyS2vhd3kqfbrT3ryiC6cc6ATBj5m4FAMLK8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ROt8eD4dkCu7h+1SgnG5XPVgHhwDlevCViclNYsqt9pgv8O2o
	ZkNgKJdCBXuI8Hei9W0r1MAwd9/LQIKSqDkJAFI9dBUdKTDXu2K2M+AXTNCP7Yt3M/mjKFM/VDt
	kOVL/QW9rP69CJHU4pzBkOgvv0q7i8iM9WsI/4217+GaPWIN3OkYMvvfBos5RZrD3eck=
X-Gm-Gg: AYBFou0+JrE9sdcNNkylH1c2NVCeAtNBqXzOmZ7L/nbFDE8bX3+hEaEPFSUPV5XHcMK
	H7tFWHg0/PUlFm63ZZv4sOa9C2Q3SnYH53DThyjljpF6UB9kb3qdH7hgw7Td3umtxIVi5SBPkY5
	1iwE5IsgTx06zjfaXVQZ8X0sj4Ya2H2gx84F8g+KUQ71Y6M7k8uKl+d4DGEMmcxktQCn2CQH5yC
	f8VDdbmgmy/CZ9P3dT0Bmrgn2c/KUn2tPchxfa9a2iH7V/WhcnWE42IoROTMUj85r+hvXyYynrT
	vrxFXt+Y/Q3jRMUPf4gkgq0z1TGDBHobN0YEKKPPo6m46s9+zF591nn21ScezEVEE7eFbWYEOcU
	DGewHZyDumkdXH0x22wVQZ/56tYRIgYUxJ5GmF4WPzZLLpWyVCQVqQVl+aVdF4Os=
X-Received: by 2002:a05:6102:5811:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d072c25cf0mr8060503137.15.1793868892502;
        Thu, 05 Nov 2026 00:54:52 -0800 (PST)
X-Received: by 2002:a05:6102:5811:b0:7c5:4da3:aefd with SMTP id ada2fe7eead31-7d072c25cf0mr8060491137.15.1793868891889;
        Thu, 05 Nov 2026 00:54:51 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552afcsm8675487f8f.41.2026.11.05.00.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:54:50 -0800 (PST)
Date: Thu, 5 Nov 2026 10:54:49 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Haotian Zhang <vulab@iscas.ac.cn>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: cmd-db: Fix probe race with possible ERR_PTR
 dereference
Message-ID: <znleorpqv6fey4tlkwzemxhqwxy7jz5lb4xoy5jhbfxqovjtpc@ueapczda74lp>
References: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104151550.215604-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfXw1z3MQkJQoaw
 rE+XVqe/pNN/6XRp856oAQMZjBtxpo921js1rPl/hgTsYC6CGJMpghrDFYJosU9pzxX8UHDoTty
 iLH4Kx2XXdRXqtaCTEuhQ0xsUZMvywum6dhlxxSiYPE+xFva2ul2RFLfTYiRSRMWVjLoodRxApC
 Nr5+wh+mcZFoLwjU58ritzJpepwM/I4SeITCCJuRteld3b5lvGBBVMRt4vx2A5Q84AhS9r7/g7N
 zJoidTV9ZYFMDxGCYDgTo/41J3AlO4dpbD3qLToZ+JYHOtecTnAo5ELX1CsFmpEVhr060Z3nrlh
 khBRxWxkkPmYK793dGDlAunpbftqDpt2zuSmydAQ0J0UOVWe0HzSnwSSVw2HbxzIFOU7oHBJmak
 lrQC5mox6MEfu7b/HoBHP1GORvqUikj5jIFoiwSaBDZ/awv8D6QrBTW0y5qIR1JXI+mPamdx2w5
 l+SQTjQgsdfFJ8wrptg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+PgOSWoP9bzE
 eaz2WKinGM5wLWy/BxoqrNHzNttWK4+uuW1FOM7qRI4EZHn72MrVsQ77kUzwkqE49r77ud2lTJd
 R8XcdWVmCPmxX2eNH6bjPiLIRgM5fE4=
X-Proofpoint-GUID: tSqr3ptO5g7nY2AdMoeR0-fd72P_2Kgz
X-Proofpoint-ORIG-GUID: tSqr3ptO5g7nY2AdMoeR0-fd72P_2Kgz
X-Authority-Analysis: v=2.4 cv=futJ914f c=1 sm=1 tr=0 ts=6aec445d cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VtB4zeJ1tuDDAJRGO14A:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 26-11-04 16:15:51, Krzysztof Kozlowski wrote:
> cmd_db_dev_probe() stores the result of devm_memremap() directly in the
> global "cmd_db_header" variable and only afterwards validates it, which
> opens a very short window where a concurrent thread could access and
> dereference stored ERR_PTR.
> 
> Theoretical (not reproduced) race condition could look like:
> 
>   CPU 0                               CPU 1
>   -----                               -----
>   cmd_db_dev_probe()
>     cmd_db_header = devm_memremap();
>     // holds ERR_PTR
>                                       cmd_db_ready()
>                                         if (cmd_db_header == NULL)
>                                           // false, proceeds
>                                         cmd_db_magic_matches(cmd_db_header);
>                                           // oops on ERR_PTR
>     if (IS_ERR(cmd_db_header))
>       cmd_db_header = NULL;
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-1e6d9e1c-b97d-447c-9cbc-d874a0609918
> Fixes: 0da7824734d8 ("soc: qcom: cmd-db: Use devm_memremap() to fix memory leak in cmd_db_dev_probe")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
