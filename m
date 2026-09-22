Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EDF48EBC0
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790101700; cv=none; b=kbRjpgQzaAH3cG7Uiedf/YWGqKkFQDykN2wK2Ib42Z2ymERZ49V6BUl3J4UhKzJVFOS7JKSbEB/e1z2w9H4pYP142FbIe08+/gmsAETaoY1TrvTs1AQcmCy7YieOrgSaO0zCMvGrU5UiovnbBKMefbinOKXEBHEkFg0VNcWm2sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790101700; c=relaxed/simple;
	bh=nHouAfMbcTuW3k5oZdMP4hN0VK3YJ5ZLtN/ur7LPOao=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2aC9FMXNDGH60BV0+rNlpGNvJXkW5IKpet3/R/8NKPbY9VwgwtloO+Lap76A7qPobL7yWWjwOUR5OGZKndwEenCWbRyhHT5xPHWduLfB7pJ4+ryzVLhz5J/hohgIi5KFDXazYXEeAdgtsbTXRdsX3fREaVZXdJXr2He+nrs6rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCSE6rA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GyT+ypkN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCSE6rA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GyT+ypkN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7fG43757284
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=; b=MCSE6rA5pdBLqI3t
	4GiByLWhJTg933+RqV6ERhtIm4BC9eKNNnhuw4i20qC5lApfWW2k59hL2bANr7XW
	zmX1iVE4LMEsfh4Gb9hMV5JWIZfDGfNr05baLhL8GCqxYbYL9k4jy2MEbg78zuFk
	klLgYlpmgz8hNbdFelp4V9+C4XfYbkgsMCzcOwW7mPAV7x3WOelOwYvVGbw8cV21
	3SdV0i5Br4UyLik1zy/O2sEevGrf0rX6C6bIPij++ok+/DnEhlUji4zEYiR4DABz
	cNHFn1e4ySc0e3pmLl1SxEpEPw7Xb1E+vigjb/pJi7rh6a/O+nywvOkFKq6Zpzd9
	MS/syg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113tvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:28:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32ab0911226so96194eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790101698; x=1790706498; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=;
        b=GyT+ypkNpYC12vM8RBGhfloC8ngIG+IcJEWYgFuu0DLOABPNQadzlYRsbc8RfavH02
         3UAfgqGAH1YjgpFO8i1xRiznr37mouB/6o8ssFOInUPi0JARKk/H9L6Te0JXux49BrT8
         7eYR8ddjyoIBkeEow/FA1A5V45r4TDX9KtU/R4SsK3jX32KhdiL1es7+fPui+YJIJ80N
         R4S1vqJoEZq2XQWM/wJ1i32oSlyvziwXDl0lUTR1CVY815JkkMURZf7uE115zrZcxO1Q
         TADDgRVZZT3zgB/pKPHKFwkhM2eP01cg8DStnAF+D5k11fhlG2UNI2VOWsiHKD/W9vbu
         kCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790101698; x=1790706498;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+mZemlg7hGgvRVaZjdVd9HS1E7W5qsywvUfhDPy7DM=;
        b=X9xnU1HsDdUZh8vaD1O4ZIhAbIwh5bIPqYzvQzOmPE9tRChUL+nIr32sZqx/6eSbqy
         NwBa/LMecgCePc0HATWFFuBuGNCpJtjtCei/WfKsvvjywX9s3BufiFX0dYEGG3bnQvCk
         bAluxuy8DyA5JIA/MZvN6uJBnzdh/6vsdD4qB6vsSR63mdaAID+nTXHGJx91t0/E8zWA
         YidTzVyB8grktUvRMNFYbYG1rSzr4GOSzPNXtET6oAPHbU1KwsxZlq5Pcd7dehSmuFXv
         w7+xiHAJGjxWsjQmdTk0aRMGpN8bCqyivnPnpSbob+k8Cb6X5FD4y8PkcFbpxWtOUIWE
         diRA==
X-Forwarded-Encrypted: i=1; AKwUvBxBQVkOI/z5/GSLQre/9vgUJ3zCZPJWD7V3b7MzeMQ/B1QaxCXOeLqdVmOtqUkGR0ks+jmp7Lwecz451Mw=@vger.kernel.org
X-Gm-Message-State: AFuF++nXVZzQYgT+Y6EWF/IlAhH7T0ohQm8apPg0M8OWXUWObuV7jhzv
	23snuKtrV4F6Z8C+1Loy10fXLiaAETBOTQyfC7L+LMd56jWUbraadqOG+mfjaqcDOARGYPWJQNl
	jmrL9yLayEiLF1X8NrurWfz07W7m/vBZFlwEqKU/EpYgNSuq8yIDO0zSa+QjrpZA1QFIMe8IZhp
	E=
X-Gm-Gg: AYBFou2eGczQxt+JLcxBW/s7ao0yIajGMVIM7sBJNw5PTS2QrJarC2vAIqI8cm4DU7v
	GXAHAmgnSRlDtWBYai1/m2jcx2vjSAo6kWWyKExsasJ1RIueGzCxDl9mrQKadp4G21INTHQikq3
	Gf98jSbvHLAzuZ59QXFQll8GoHaP368iOPrGMbxA2B0qWILTACmnUwQyjq0PDZxzsj9HO53K7IM
	5vEG64QQ56LsNibiLAbbQO1DEI0XeR2ynW2LAIuaVXdFeDalP+w/7qNu0izd2x6EeuDZ6MoBD55
	Luuc5aZJQd2gQU00jz/x8ZuSR/7ZZ8XEhVLbUDdPpA5Q9lqOjC1Cedt4IKC7DfzQH6DZil7JCa+
	goarnIpRlC8EWBbB6YXbNwbX4LbXXFSgi8y7s/jtDunfx
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr319905c88.2.1790101697772;
        Tue, 22 Sep 2026 11:28:17 -0700 (PDT)
X-Received: by 2002:a05:7022:b88d:b0:143:37b8:5007 with SMTP id a92af1059eb24-144f8d4c260mr319878c88.2.1790101697163;
        Tue, 22 Sep 2026 11:28:17 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.143.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f949e51asm215796c88.1.2026.09.22.11.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 11:28:16 -0700 (PDT)
Message-ID: <b62758d9-1d7e-4a48-89b9-eec6f6e951da@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 23:58:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: iris: Add support for Eliza
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
 <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-2-5fe7be8c0230@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lesByRvWQ89FQbBdjNbxjD0Z4kaKV5vt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI3MCBTYWx0ZWRfX31u78wriYMTW
 ZRn+53UkhCWe5fqA0IfqGuLjI7Ik1b3fRklcEltSKJxAc84IB8iLwt4W4XA/zyHYjNirFqOlWri
 V5318rKsKZjrj2mLdWT1Nbl73tq6n/c=
X-Proofpoint-ORIG-GUID: lesByRvWQ89FQbBdjNbxjD0Z4kaKV5vt
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2c8c2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d+GKXRUq2vCLDWIvqUj1TA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=UnPPif1LvG_pJMLD7TsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI3MCBTYWx0ZWRfX0qwMXLwpdquh
 taoscXCElv2Sz5WcIrHS1t4xwI2ycMGi7eFNeEpo6zp82bQ1wGOUhgfa/cxLL/HcAcnDiK/f7nH
 rp0g/2/JoXDUJAk6AoMUEwkU9HPYQZdNZ7h73pqjv/lbrHaTTwEE9JK88Ngw+TTaE/phm5xpTaC
 PbQbWuVMwralEXqWYa1lyrih0hRLPRJXpheZIpC3iwMWLHunvSOOrQbzxG/mYwASHdPW6UNvxxU
 G4KlKzvLx4ytoYuKM40MBZDGl6hG3yfUE7GXLRxsQGWkX2F5u9meeGZGr5h3ydvQzylFH6LzHIH
 BfrCLQGIuhLNa13vwqX3L9dtNBUuxexMTpjvvJaGwG+ot/AIuoHRbPxD1SD1sVTxnu4WudHqeXe
 rtDPrYeEmY6y+87gIZNMt6E+e0FIzHUHQq6CT9l/3LT1BuppfMPt4gof6vb6aR60enC40vn9sLK
 6kEcnctsjwzdbImut+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220270


On 9/21/2026 3:21 PM, Wangao Wang wrote:
> Add support for the Eliza Iris video codec. Eliza uses the VPU3.3 hardware
> with a dedicated vpu33_p2_s7 firmware variant and SM8650-compatible
> clock/reset tables. Key differences from SM8550:
> 
> - firmware_desc_gen2: vpu33_p2_s7 (SM8550 uses vpu30_p4)
> - vpu_ops: iris_vpu33_ops
> - clk_rst_tbl: sm8650_clk_reset_table
> - controller_rst_tbl: sm8650_controller_reset_table
> - inst_caps: platform_inst_cap_qcs8300 (4K capable, 2 VPP pipes)
> 
> Signed-off-by: Wangao Wang<wangao.wang@oss.qualcomm.com>
> ---
>   .../platform/qcom/iris/iris_platform_common.h      |  1 +
>   .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++++++++++++++
>   drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
>   3 files changed, 50 insertions(+)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

