Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BDF4DA553
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613671; cv=none; b=E13+LqItTf8C6cDXmuVL/zzZOG3EDT9/tKINQvFzPmgIpPrwjLZg0jA6CRueGv2TOcX/EsMwuStPd64Off79EZdxjl5e5XOPQNcMMPlTheaZ3+1NJFgOUzVATZeorTWszsZj/5+d0WaduIeK43Ij0c+9jwFDIIGR8MFvESd69mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613671; c=relaxed/simple;
	bh=b7wbpm7186exrmEXMnpKBlh8UDpja69phnBSq3imT24=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QHbt47nEIqoXoPGfY6eJnGxpc2gbV2oAjqiinHcJYQLIQxHSjjCqLtkZKjlKGt7ENgS3aYs2VUIwD4QYfNsfmO/ofHhfByD5vOokEYK5BztuJBCL70R7lmx0XeX2LFqyux7ZTKqOCld1eCoxOYM+Vqs1VAOZlJGUNVU2WKY/mrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g4P9827M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dy0XPEzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g4P9827M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dy0XPEzZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdsa6378836
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6c+vR2Xl2NMRz0OkFfpsOTaX2BCXiS4GI9DqBySoalE=; b=g4P9827Mh66irkRl
	91ExcjOaJCPoK54PQkY+q5QCdcS/izq0X1WKAEZ7B1VaMNnRLYlJ9NiyQ20olTBD
	EsZ0JRuEmtOHGDOXwWFoc4wl/mrO7bVZ45smjU7KnCjktw8hzuZvnMf/ej4UXRBb
	b75ibyiFtDPW4N5uVWHk2F/OPjVgofazhbOB2/DOAH56kRa7/XMpMTdMhuzGnwY9
	578dCAU6Y2eL+UVwNdGc5I/cBK/w+7EywvG4QWrr6qGpqgadUFMskkITzv7pbLJu
	5IzfXbOigin1qWC4LTtpVv6CMk0zJHXFvlIa2jEwU7XnHU8fMBur87OfZmkIqOyv
	BPbgiA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyqx395cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:41:08 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b731e00834so978746137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613668; x=1791218468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6c+vR2Xl2NMRz0OkFfpsOTaX2BCXiS4GI9DqBySoalE=;
        b=Dy0XPEzZvZWgKWJ1iAN8jgrwAMsYA1Rm1beoPKp2LxwT5w2tlWJRtqmuqU/UW+4cCz
         Mk3nri5YlSwc7sOoo/mxbbOhobT6H6W7vqGsjIkKV8Mjp/N/LRm9eELhupW2MWwS/vgK
         cMYYqcKpUbTD4WEpfHJQejK/FHvW/F3B7twNNWrI5zQgFgivjxprV7rSH2Ufcgi30b0M
         BXjvf0Wv1FIB1lr1/OAKQZ1i69ZMCiJ60fRdVFgrXA2o5kxF49YXn17CFdVWy+IPt4hS
         fc5BCvrPsPTcMTUYLUGjcCDtbZARGaSJkkBahw6RuuAPYNHD4ikaBiWG2CHRpQR5jymG
         LeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613668; x=1791218468;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6c+vR2Xl2NMRz0OkFfpsOTaX2BCXiS4GI9DqBySoalE=;
        b=fxbQ9I6xnG9dC4ZBWSR/8HWZGxbLm0uPE5a39R4s4NGl7DA8CMBcf+kk5zae6o68KK
         Jw/iM/xoibG4knUd7ZnfxQaXtLoH4IfIksGJEEGCsl9pVxqFfs06fUx6YJxy4wNfRllL
         ijuyrYYuKiuXAZDzDugJalnBgwqBY5f0obySY0sLwGNXk2+6sz/0kQXmKQaMs8695F+q
         AmFw9e22ieUq4HNkC+3a5gIyp5p21NL7cNQrKY/Qi2o7uLUu6JOoLOHN+hRj+G2YSlU2
         ir3ch5gjfjscwqzT5gdpyrem4DoYgfOA4+2UvIz6rrQmaWiUmyoFSJ6ODwDl0C5FQXxl
         iu2w==
X-Gm-Message-State: AFq9FYLquzpcsAMeiyrEqJbDeJ5W4XEUOoINNcud5945IRpsRTNqxgEE
	Dw1rctDhKQwuBBjNOM2Ar9JmNX1ZgGxOTnLnhCR0d2KS7z/5lY6sdycTEo+H8UOoOnhvmL7d2xn
	OSDBwqmPo30qdOyRaGpIu8DTEsc8pjtTyRrO3SkSGPRnxwLs8My3AUxn+/Jnf6eObSno=
X-Gm-Gg: AYBFou0odR9b+EcQRZdwWE6TsKQ/EFoXx2QeC4dEHi9GLhG79vPmS65mVrOi1+b/ynL
	op3tVq8jRzCDmZhn8ILW0IU7Uv1/QGNJeAFKwuNWJWBHrLFa2RyLL6XLlCPB/hNar9UN/4GlIsy
	2lacuxPPgG1ckvdrwqOHcbWMDY3T1bx4803Q3aGMO2GaRBpuM4NBpgT69+MregloVrTsI2NZTLf
	z5EG10PEzEYFG91zIWrbQMDjTz37ll8LUJo696HtORsXMAKxGoo9adjNYeV/zWY1FFcS3p5hBYG
	Jhe6NEkTzfHn5bYVfEp057ObzTNEyRvDhxu6mEg1/Bg2ybdHX61oT7NN+SRc5HHRzTT3nRODV6f
	5gw6iS0MJ/P+otBYgyQ==
X-Received: by 2002:a05:6102:5613:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7af1ecf76c6mr5100074137.27.1790613667727;
        Mon, 28 Sep 2026 09:41:07 -0700 (PDT)
X-Received: by 2002:a05:6102:5613:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7af1ecf76c6mr5100048137.27.1790613666989;
        Mon, 28 Sep 2026 09:41:06 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a2acb4dsm28397941f8f.0.2026.09.28.09.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:41:06 -0700 (PDT)
Message-ID: <d009d500-e938-490f-8375-f016a2494984@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:41:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: gov_power_allocator: Use common error handling
 code in power_allocator_bind()
To: Markus Elfring <Markus.Elfring@web.de>, linux-pm@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Lukasz Luba
 <lukasz.luba@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <a3dc82f0-7333-465d-85b4-8034b1591442@web.de>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <a3dc82f0-7333-465d-85b4-8034b1591442@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfXyDyggpyPhvDO
 /py2G6pj4sIH194TQvoFvlhIHUZOtouPwUnTFRso6H4FYEZddUF3c5kR3Ny0J6vLud9EZtuJ0Tc
 QES8ligP0ifshTFXelcH5dfe/4jiMHboNg1pyO96L9G5PBTLis3wwE5qjVR/x2nplUSYp28WdWs
 HtH3y4/AB6traCizdj1lL7XHLwV7Unmw1ahMeVBA9k0/H8OKcQrnAvNro4hlgbqfmR7g3cbbZsc
 uAs0JHTMhjyjJOdl4Q0If2uk/OotjCDtm8c5Vhu+N5AdIURWX88rXPopXoFy5Jhxvpv3OyRR5/M
 rsXeu6b55kC4Q7P7VP5n2WAtt8sFo3Z9ZeSVqpGDNkYJJB7pN1ZtlaRQdP6jdv3L4iUzzCDvvQj
 JpzsBsDE51rZuh+3+tWW79a8MxSP/yojSURmlcnR7DT+YZfJRKdbJqJFmLO97FCfEJjtndTpaUt
 bffKUrkVWc76EKW1iuA==
X-Authority-Analysis: v=2.4 cv=f7jdl+yM c=1 sm=1 tr=0 ts=6aba98a4 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=FP58Ms26AAAA:8 a=HHdwwCC6DbPLjSqiHdUA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: pbGRKgKK41yAndwsp5_wY60XjnjgoGMm
X-Proofpoint-GUID: pbGRKgKK41yAndwsp5_wY60XjnjgoGMm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX+WKni00Q4eQS
 WF2hZFVpWksWuupgwZAZ6dls2WghUB0xKyNsNno58C9t8HnRC1SvR0Lqo3bF6GcPwZrpFaMA7ue
 KLkOT4MqxSAR72qnN7uqLw6uFKnlEzQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On 6/10/26 11:30, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 10 Jun 2026 11:20:37 +0200
> 
> Adjust labels so that a bit of exception handling can be better reused
> at the end of this function implementation.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
Applied, thanks
