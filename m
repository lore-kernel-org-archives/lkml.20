Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893F83F4854
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788417229; cv=none; b=iVl/3l5ZmDBBbHSOUlhzY3OwZ3/q+4cOAHng0+7lQVWWT5vyVj+utfXd5KINxRL4zeoZ9K2awGEcFD+mKglS9GvNdCCpnvFG4YP+48w2c+++B4VgwAX80V0YZOHzQmoOvRXGk9pZ+6ubKPjfrVYPXXE2QFYWGr/tryCXsQz2Lis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788417229; c=relaxed/simple;
	bh=cDGLZdgdLdaWlj4AbPhCwBakiz7olPf9997bhEYEO14=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iIX/KGcLcxAhzCCxosvjViCCPGp5K4tRiSiLAkDpd+ayQT2A1eeoHnlztO58zU4o92WWMFWpXJfO6Pu/Ps+VJ2Zj1dzfmIHYNC0xa6k1zl2VoFjhcDYNE23iZ0M0KmpHxVaCaMUncEIC16HclZcwIpQoFphe0lqZwp92vnx7PYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ms4Zn4Ra; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XZdRHIWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ms4Zn4Ra";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XZdRHIWf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lTJQ3749489
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 06:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fr7cHeYqrI16WQmSdQLJQaBM+npOKUH7CWYOJaeU504=; b=Ms4Zn4RammyQ2I/u
	iWL69q5E75UFIB/stRmu22d6yz5BXjR7sPqxcxIGDfcLyW6Dj6XxTA1xx9ASb48G
	2k1vZluop5rQ5kZfWOBH1wFOdazLf+bv1gm4DJisowPetpYvghJ6XYC+ko0cZEZ9
	3yZ8a1n0fQJzQOSXf3GA+YKDHrOqJQnb5UBVa361ilEqIQOtzr9+9fGLpKXDREOZ
	ksMT9IWYnqWX2yIn9Zm/tWpAE8Se32/ZyqjhDZKY0gL9VtIiVNIaFBXVk5Qkxz/v
	7P5DI4kITzm4qIfWObd+vKv/dXOYAPAzQ5z3QSCTTRoUVNNlTQPN1GnVlN2vi8Pk
	3fP5/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gepv5u73q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:33:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934a8cd3a8bso44155485a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788417224; x=1789022024; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fr7cHeYqrI16WQmSdQLJQaBM+npOKUH7CWYOJaeU504=;
        b=XZdRHIWfLEiqwq7/Lse/OnRMPxqHZMtTJlvCAFZYUbuffF5531g6vBgNk4b5//fzR4
         MlNynzUoFKEh6aKG/fPFBlg/hCpNke/Liyrmdziiodm1gRiLNtqDz/uuw2iXEN9Q7gey
         FokJAkqwitqDKjIQ5nc2VRS3zMrbQJW5nAoSTltm4y2pw731CjUMqqZB3mHHAz5rL2i2
         aUy/0xJVeaChUo9D6QRg2cPWwkrt76OrhsL9rcJxwu9aCrDJyMbF/40pa6d6MyqE8Bs8
         1sB7f/B4NQfartSv9Eg8qBDw9onU1EfrsvirRfr/W+szZMaf7qgP2obq1b6kUPSH0eM0
         4Oyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788417224; x=1789022024;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fr7cHeYqrI16WQmSdQLJQaBM+npOKUH7CWYOJaeU504=;
        b=ERNho13rHYPP9JkSHohpdxtzIfHmBM1UZmfQguEW9u+WevowUQT589lXxD/sIbAF8b
         8G8LjwPm5DlULoHSl2sPrqSLelkKUXgEBXwRNBncFl0VVN7UbEXDVh0Ar4pX8x+560ot
         Zl5HgQSchokuBnuGQH6bvfvmJWDmTbuaPZh5a00e/78YA0F+TlcB8UG8PHGZHnZBWXSe
         BmN2q+aaUlYUKbibkhoLOeADcfQkxFIRUERROvPWpq25VSLyU+sAypyQevzanJwm9/12
         VZ+URp8Q9r2X4Oqs6RtFbFm4JDaH1yr2K9lDeyLTlg1quWHN2nhWPCOZ/7I+j8At/ODm
         8lbg==
X-Forwarded-Encrypted: i=1; AKwUvBz2GOzUmzxFfiFKVcsN22QnGwJuwy9EbZr2O5MDh4voDBjcpawph56ItYPUwXVDGxhnTWwH/Cviyi4tcHo=@vger.kernel.org
X-Gm-Message-State: AFuF++kToF8jhVEXrX/YBqSuInKCeG1kFJy+KcInuNOQBuUjbps5Uz09
	TrwZkS/QvhU21/X+a+hwFL4+Kyqf8QOh3uUbFCb+pcWuDNcjQS/vtSErllUaAIsu4UvBkx0WfX5
	pKQ5KfXHhzjeuGr1jArr7dybiufTyuyHxKVEb1MClPwdq36ww7Yfd/9Za6FfkLLCVORU=
X-Gm-Gg: AYBFou2zQszqtGe1+bE7Ur6CuyIrBEmUO/9LlD5nrWx7S77zUuKTiLGET41hVsegIuY
	Hrt1vzOBPOb4HyXPOfPXog76xHMKWkXWfyqYWCXTzRlZJ7NYD10UoYyha2YXBFi33wItzw8dayX
	dA8eVEEG2tM32neF/meA3rZZdHiPLvnWvVkD4bkcIPj254TZhSHyxTWtXyRis8QW4Vu+qc9dFgl
	JoC7PGkgf2mq7ze7NCrQnmwzctoT8y+XiHXLtYiX4Nieb4a+0TnhqKYTsvtygWFx8yzXpixoRqw
	B6fohE6NVDQK3weA3nz5C/XwnaxrWrRJj717QHYv0TITeLzx+WHbrDKM928FQiZ75bi7KnMVw1K
	91LTfUZFhErrxK61QLmI1kQ==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr702103985a.6.1788417223786;
        Wed, 02 Sep 2026 23:33:43 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr702102885a.6.1788417223371;
        Wed, 02 Sep 2026 23:33:43 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f3eeb888sm53439266b.9.2026.09.02.23.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 23:33:42 -0700 (PDT)
Message-ID: <292a6a67-0870-4735-a34c-50f2cbae36c0@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 08:33:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: Use devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20260902194041.1999834-1-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260902194041.1999834-1-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T8y8ifKQ c=1 sm=1 tr=0 ts=6a9914c8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OkyngIYZ1pMGiDKQ6L4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: dtC7-12wVC8WxBKIOO8kVtrDXTFgZdJB
X-Proofpoint-ORIG-GUID: dtC7-12wVC8WxBKIOO8kVtrDXTFgZdJB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX9iDMFG5ROYaH
 nUVnk8r7ZHNvtx88IJAcFKm59414bOZgRKGPIM8utOsJEXzbGNCm3a/wm+uolLmder6AX0OVCMr
 8o3UtmdQGX9BdaLaS+9dWKIjFpUaamFAfwPSoHSH67QT13+auyfqNzhX2Zafz1AbXHi8nD5nSNP
 Kf8I8bBMZ4qybYvUIQBgGkq9NB6tsF7pp35Z4qlNfTjptDepUUlAWTSnNapQ6zIjMg1m0xIqL1o
 OPLsoilm0FCedcGAuFtTUVYnLiK9DSA/ntkPYHNgDZXB0ET+eEMWQUzeuyqEcSR6Td/+sqV6feg
 ahghKXhSFMwvsdmNi+kkF61EIt8ax93YMr8KqVGnV1wou7Q9ulL6MSutZbl/db6VquLqooC/AGR
 GXOsnCGsdSh6Gm+jfjHoIbZ6jxkO0+yGvcdsiWCvIVRvrJFw64f86MIw5PRnQ0TXHgeTYSRpvlE
 qIF4XDv1KjgFA+khLZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA1NyBTYWx0ZWRfX6m2TxGV+/Ck5
 amVHNp4BhjJneroGZCkMV44OTxgbTCuWe7qUn3gd3bOpDkdAhXGj9R+hd7MG/UYhIX77WA7WH2F
 +b5zffefCnZEis8QkoraqFRsy1v6vWU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609030057

On 9/2/26 9:40 PM, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
> 
> Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
