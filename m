Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C58412C08
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766116; cv=none; b=X1RdJIf6iSlRWt1IJ6nLNq2QtWPktfc4luoZsAm5wCEI4ZPN2ew4q9hlRRu3YewbrKy37aFYIjd3iN9eVVcf15veO4bkvCtAXA/3iaebPuJN9Dc/BJ31DZqKugZIcw9eHE8EP3ZVD5VzqPrCIlkf4CWAHLMJmFmdLhfRze08DDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766116; c=relaxed/simple;
	bh=MMlbb8+iKcRQ89PRsyjDwvellyFyFh2hBXKU0RweG40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpKovkmvukHMJwOfvA7ibdL7sA7mxRe4ExzVF4viYVPfKymGPw9jgpOzX+R7zqYDfuNCA9ogqEg8LiRABoeA+5w+sk7xmRhVtkhTOeClr4sf9x4H2E6OJpLpIfKsRsqDNk+aWNmQ+/5v5NhLST70mTPCyL7/7+xnu7NxPxFCoJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5pTLVVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPuNlGuS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5pTLVVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPuNlGuS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777CVq2838515
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 07:28:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wK0WimAaK5oxosHNI2DDK3qbmaA2pkSmllJZE/y0tC4=; b=j5pTLVVVYiwzwqU7
	2CSQMFxwW3tCFOT1Z89pgTjJEHTnzYCNp8MUVcGxj55/fPvRujOv+I55/oaxWFAc
	buvqKufN7zIIfIhx6ntlRKlucg34OpqALOhETp9RBLie8gzzgScHlcUeFAK6nUFj
	g1bt/Vv3Kl5g7Os2TSnUrE7LRw7CEoIPR182UPuKk945+ZVxCRWXLXK6jPPFMfZc
	ZiT2bQeeL8VXinKrMDopMVYCcYuf71SebHQJ/XPad6xjw7/mJbqnxscjRSiq/y4h
	ntSmQC3QTwhWWKm753bekiky8V/cccfh3kdFuWWIXX0dMiZVPjv2juWRlzDW1BDV
	l/EPVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbuenpyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:28:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so58570085a.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:28:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788766113; x=1789370913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wK0WimAaK5oxosHNI2DDK3qbmaA2pkSmllJZE/y0tC4=;
        b=KPuNlGuSEgX7oUuyVZ6Qruyszg8aPKt95eRZySPguMZ0dZaqEgGTpqZy/DoVqg8/35
         o3jYjF98FgEbiMEbwz3s/0bJk1ZBbRgd5X7Xevj0qp16jC9XZSVA4z9uKoHskzbP10Fw
         NrQluinH2RXzR+j3GTE+ZDo+5FiqhZU8r8GrqXSL5rPIyb6KYcEr88ZDSZeadxDf2Jqa
         OhwpL/Tbp3wZBYewKyWE7ywdF8rfFsxUcOmg5NIwJZ7UBXQszv/J3VctnoLRypMG2GJu
         IkBpufyO+T87jJiZADXRiTsiMJEIJPL+oyjySfVVyK1P9rRs4OlFDIJBuAfs2e4FkF0i
         phQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766113; x=1789370913;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wK0WimAaK5oxosHNI2DDK3qbmaA2pkSmllJZE/y0tC4=;
        b=nISXOILz9n3F8cSwEB4zx+QAzny71knSiUUDmZIECHpouZHua31kkrJ7JLM2Acs5qs
         iSXMPdBXVhdK5Kq4NzHsOBZYBDjoWBv9Cr3+/jWqlIkCELUvsLuZRVriFb0pfSDtcz9+
         7HhBn/tvFvUSEtpojo1T2TPB46YqqTNRc/MQX9bKSdoQlZEOZYgtzwh4u0QoF0FrJY7D
         VGbv9d7KMxmCjjaF+r8w0UXbzQC4aEf8x6x3ws1MR701K29ciGca0ZuJi8jG68Ykp7Vd
         4lJeQoLf4xyV2vja7/+kD/bNZgTUYWHikZtkfyckA0Nx0ytoPnZ6EJ8mtSwMRr/5wycD
         pZIg==
X-Forwarded-Encrypted: i=1; AKwUvBzTRNnPAAeJ0vhRrg0YyWCTuoAeCMnHNhasb4rH4rVcrwbIumxa2d62OwlKvEssArs8jJUD2bOw2KSPCBo=@vger.kernel.org
X-Gm-Message-State: AFuF++mAA6Gh1cxxTf7GOEvm/wU7faiQfEbavIlFv7VxwEiSuG0LIWNs
	B7MJlDF95ehIoYmtnfsDVhm61tHoyutljMzRmXNRPAbWuWtfJb5yHOBflUTumF4rATOs3PLmx+3
	Vq5dHKLmyqXR2HuXPpjOHuFRN3NhCZjGP47EfFt7hYUG2B1XpA0tOQE2eiDlMqoYgAvk=
X-Gm-Gg: AYBFou26bEjwcZx9iPN6rO7GAt+Jxq/Y7Dir8G/DEN+Ky2mR8Eod9g6cnQBZqr8Ilut
	H984CQwtYyc2RiPOsIP7LzbJte7fjbZNjgajcLoOn3brXUVC69HPrkUFVDcaxoNVrR94S2L/eEK
	DojwXX9d63B8Q+tNba/go+baFOemEKUFQMlgmymkbCBBCHbyq3tXZAQXEFUVGWq7DrOLwNWDJgw
	4U8WIiw0TU3jt95hC4y3iYd4ETNmHjgiaXImV4cwk8MB7qomO766/Mh96HXrCdPYFFCivEoHiH7
	62fGg0HdKqJ8rSdwRjDSjkqmVFzsoeTWwxnCEtpKIYXHDZZPucVpWUxyToGtS8U4d91v1HLqfjW
	43uJ1KqJx8YZHeyoce0byPA==
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1720048985a.4.1788766112999;
        Mon, 07 Sep 2026 00:28:32 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:931:23a:83ca with SMTP id af79cd13be357-93980be17f4mr1720047585a.4.1788766112556;
        Mon, 07 Sep 2026 00:28:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d55b306sm432124566b.36.2026.09.07.00.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 00:28:31 -0700 (PDT)
Message-ID: <37203bf5-ed0f-40fb-96aa-19deb594e820@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 09:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: fix typo "uninterruptable" in comment
To: Hemanth Selam <hemanth.selam@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260907061742.10954-1-hemanth.selam@gmail.com>
 <20260907061742.10954-2-hemanth.selam@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260907061742.10954-2-hemanth.selam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX+lcM0Iabp44j
 HV5EZeLXHoVsLCEmKbwAuAKWxjJcu6205RXOvH37nVkXHXVCgmElWwJWnYjioWRFslLSel8mEfB
 sOh8dX0sIutGaXQlh+H7Gaj+FU9HTmPJDVnCZ7vZ6vza7Ed2p/+IUAb7aucq10Yg02kTePHW8z1
 AeAft9hsWM+Pwug8f/o68EYaIih+TXhO6bmD7qqgzkT1dFZmV+RczkKe0ZFUDEaKRW0GAA4n71Y
 eu560IGNMHVG/PtRhL2Iu+k2okQY+dvb7Qrubol7z3pc8EbIYoYhg28rTNBWj8PE2tiY3sGAtr9
 pd4yh1TQ22ZF/2hjvsFF8/2UBw4O+bmYRD4mhKv88fvlOfunm0tfHbK252Ks+NUdVnFdyWbdzKe
 J6TRw1PaIIBn1pSOKOyltcO5ZpsS2+xYh/NDkzC+os0dpQxQjVRzznzEkWj3jQpzOP6Jbz9PzG1
 5yJyA/b+cKkhVEr2+KA==
X-Authority-Analysis: v=2.4 cv=P8AKQCAu c=1 sm=1 tr=0 ts=6a9e67a1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=nOFz4O60ngek6UsjDhAA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: g2edsYBYvAgugmKmWToV6sU0PUophFzE
X-Proofpoint-ORIG-GUID: g2edsYBYvAgugmKmWToV6sU0PUophFzE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OSBTYWx0ZWRfX+ceedLYPeTXI
 w2OBZBe8JD6WtU+/AML1Q6Uk83RdhwE18+J958Jsh6V2DH+uk+OnfPmybJ4ZY+Xk+1FGpGlMa8g
 BescOyGbiYmrt4HNZKlGExzrx3UThMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070079

On 9/7/26 8:17 AM, Hemanth Selam wrote:
> Correct "uninterruptable" to "uninterruptible", reported by
> scripts/checkpatch.pl using the misspelling list in scripts/spelling.txt.
> Only touches comments, no code changes.
> 
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
