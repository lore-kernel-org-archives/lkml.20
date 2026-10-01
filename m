Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108874343EC
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867485; cv=none; b=SM6VH6LCg0VAXFnrX9FpanniFZEZtVtKS1+O5uESHgeI2dIlHsuK68ik2Gc61+raLUuob9uAf1HUCikUhCvNSK6BmSVTkU4HAcWgJluhdyjbF5pc6VgGZPEWY8sv2+0n3ciq+IFDHJcCcTdhA9yH89idUpAfapkAoZtxGD9zYj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867485; c=relaxed/simple;
	bh=iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzvuGe4Y844eMufzpa2t/o1zIsP2shwgcbnUhFxpRItkVTOzSdjIKlxV8Ic7TYbjf793kihQWrE6YG59VKAGIFCZcsrRNhxy6QQrCTg41z8VSVGTfVjCLvTLbSLYRi/zwg5fHiUo+affLbySVKB852buC69l6wVOVRv7GYku+JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uk2LgLKX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TuhOBZLY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uk2LgLKX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TuhOBZLY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691EYTwS2705910
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 15:11:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=; b=Uk2LgLKXwlosQNrL
	lM/U1nQlnjCv68l4yxb7IIXVi+aCxd94Hedfj1kJCkEm3sEeJMdW6hAOTNDntS2T
	HyF65uzhOjFf3/ZeZN3vD2DltxF0a9h6EWOjXVAloPl0DkKi0F6ch6u7T9zH2HId
	7JrEBWlKC4r/zZ5hALYb4wnIvCzsB1Pa10kzvEEpPsTlxgJMXI1qiAPgpnllDG6D
	g1919t7U7hCj2xftOqOnf33sPsnBQ9PLoIINTMY0LUariHvvhzBb5xaImxsb8+z/
	WaEk5JeVzpdun1n/FwfvIZENjTwmQOZD5VSWtVeGheI1/RK3ep/GHSr8BD5CI7sb
	pkzn/A==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1sdcg7wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 15:11:22 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d44237e2faso157262e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867482; x=1791472282; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=;
        b=TuhOBZLY7zUVs40nxdQIjT5+gglmCCFeHVn6Gxsx04NIDiHY6HeTazkGXDxNvOqPy0
         4isOv5j5IlTpbR1jhKRDot+31/t4jVx6JezRB91uEB1irEs2t3vEPn7CAzjQOvCzJxwG
         9z/c++T61znPjnOK75mOaM/qxQZfpNZ1bO8jmLdwzccfNXJyud/upUl7xDdeavkonVen
         wBOC80Jfsz0zY8d4gFf7wHfRrUtr+7J+lPooqkoJ0GLkRTBVnXkE+je0nAuqetuZubyG
         Zaf0zuOGEgNAFPC+5T4pbKfyTyDG8Z6pqRAcEsE42wdXWeCkujKUXuvYOI30LCMIeTXF
         caQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867482; x=1791472282;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iYBzGParazZeDHgmm6OmKxdz2ZT6O24nTmp5HoaQ7xc=;
        b=oFQZM/rn0IEmaA6V58u+j/EZfzf2dJe0lH/cWwWmI1ZpCCgI8zTm+2MFI/IYSptqgM
         rOXVWYSmGv5CXPC3FhGmMuGHtZ2oMfpvIrNeJ0Ex++wOOtCwgJwx0FzxIXvKLlEzMC/U
         ycVeAxH8g6nNiu4qkaS3IB7hFvP4pK6GcT+ltNYac2Tl+uaVJpGq6xLx5Z6xoXVE5VkO
         xHEWU28eWy6XawHvCSvXr2lJWCxtxkTkLi7Yg0ML4gkmJdoBQ/D3V4293Ws+EXqEvl3M
         VFSb+y90+gA7gp95JEa3W7opwBqIONXpvgNGC03XreRbhl8E0mIyAmbUY4DXWP+zMru4
         OaGw==
X-Forwarded-Encrypted: i=1; AKwUvBwucbtiB6fw4h0HvGQDyGCDtpEcVRJjLfbReyn042IPXhmXlOQG5+rPH+Yeuk+3XI8oc9Yle9pClgjqWGQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUtoyDQ9hLBsGPu4bNjJrbGhPhGYD7GY1n5hqf1IOGVExCLzWH
	51ZAt0s65Db6CYoEP3bbiBB0n/kPGc4yxGcq+jk5WJxz/qxwSwl6n+OoYl8K1Eojxxun4b6nnHU
	QXqn72/IVl6IcTwKw28hc0CGZ4ajh7CzNHjUYmzC+FRBoB39T3E5XraISimx5fMS20hk=
X-Gm-Gg: AYBFou1oFSnqH3INwUvwoHOWRwk017gg9bXalimzJf004IYMsSYJU6wJO0bEAC++3K8
	OLL8oSEBSX4tFFwvLf2Gz2rd3onAUlGTN0Ozv/TOcrJbkKqv+kFHvi9wqH17t0wA/RtsjgaPy1g
	cxatjXckzi8lshzYd+/hf9tAlpHWOwP50k3zEZ7NRlvnFmeIQFYCw5UlB2fSSAz5PIAo2zOuoIC
	pOH9zphrbRk4vO55AcSRrg9kuJl9WUpPsHmaiKMLDbJxGRBIUiooaWXw5/rUQONnbslOD1mIXyV
	EXbISe9PHyzmnXOPKL8UyOye0cJkkHzR0jC2NyC7ikoZ9GVCdd1srSqv5ndE412IcZlmjZ6v4Pg
	DMGHsIvMkS6xo6hLoyWpMfg==
X-Received: by 2002:a05:6102:6a8b:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7be72cb1e6emr1260220137.3.1790867482209;
        Thu, 01 Oct 2026 08:11:22 -0700 (PDT)
X-Received: by 2002:a05:6102:6a8b:b0:7ae:544d:b50b with SMTP id ada2fe7eead31-7be72cb1e6emr1260203137.3.1790867481730;
        Thu, 01 Oct 2026 08:11:21 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31ce3ea9sm187363566b.32.2026.10.01.08.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 08:11:21 -0700 (PDT)
Message-ID: <20cfacef-2238-4967-a7f6-eff0e883df00@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 17:11:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] misc: fastrpc: map ADSP remote heap into remoteproc
 IOMMU domain
To: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Amol Maheshwari <amahesh@qti.qualcomm.com>, quic_bkumar@quicinc.com,
        quic_chennak@quicinc.com
References: <20261001-fastrpc-kvm-iommu-v2-v2-1-6c32ad6f662f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-fastrpc-kvm-iommu-v2-v2-1-6c32ad6f662f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZV08E3XaPnlOlkeMI2735cDv2k3t6Tjw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX1OrQJSUDiviv
 vhy8HLrzjKrbK9YgNi+YWxxafu4FdJ9Tjxtl9QvAJtbCXUjmjTpWjNgadbDGqmaZevdcDobXbmF
 SpskkSJyOFeNB9FVh9p+WcSdfbt3sC4=
X-Proofpoint-GUID: ZV08E3XaPnlOlkeMI2735cDv2k3t6Tjw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX6NwTpetq/iwV
 a6hrSz7+EEZW0fFa2isa1zgWzCukTDikM76OKDrAy57TZtb40PsXyfE+YjuI4qgPa5bNufRA5TU
 WvXqoU7phHqYLFjkKUYb0d6OkUx2N+0OqY08rNlvmdyPvLlEDt+p6MYrtK4C6V4Bm22IM1RIwsJ
 7HHY4uF0n9MpPWDgfNDCJ3mUlHKHbYZWw+cedxD7NnCkYEoFOeq9k709qM4F/bUaev+sd55psKP
 qEGdzLpsYE8C8R2KSo2o0Urgil02kxrW8OEDziKr98ly1v5HayP/HKy7J23yzWzCEgaRULPK8dW
 fLujRJuLF2S3CpB1dsoBaxQaM7pPM5NWmrYSMcWtToebXKqJvLcZOpbSnqS0KGbpUDYGUAFP0JU
 0phaVo/j4DVTrpky42eD5qSE//a50sWSvJ4xa3VBZKz+yr7OK68ZswMkkDo6/fsZHK0dNW0543k
 OBNU0Dte3/+HuRn70Fw==
X-Authority-Analysis: v=2.4 cv=D87SufRj c=1 sm=1 tr=0 ts=6abe781a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=JJHmHs2BdlmLsZ1y3_4A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010060

On 10/1/26 5:00 PM, Anandu Krishnan E wrote:
> On KVM-based targets the kernel runs at EL2 without a separate

"On Qualcomm platforms without Gunyah/QHEE"

Konrad
