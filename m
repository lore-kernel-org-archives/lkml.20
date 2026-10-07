Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A513BBFBE
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367264; cv=none; b=ZEj2xU2FH3ZN04OdVMf8GG+h5D/h1n2C5x7RBEa+QP9pqJEAOCNiHww8Aw2EX3q1sYoNEaUrck/lsNeWH2dnXH3BkFE6pUGcVqXNwOzSeCla24hrmS/6Owukiw1GXai2dPF5FI2aFNg7cs9WKffTi9xiIZbiF7Pdm9QpOLyblkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367264; c=relaxed/simple;
	bh=kT9shb5MvhohupBnYEiT1SmtC2M0G+OAfdgFWHHHntc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pz+JMQtcQk25IV3OXbMrZeYuPElsMelVX78LSy2AxTWepvmC8aRV9wgfli55VCF2X4l4LevW9OXPn0d7hVa7zpOGSOjfuXPeo3znC7FDiKjDldKtM/UDK3iCvTsaCiPtWHOUmFjsG384bNtqNn0mNM7NdW9H3PWvsJ/wSYoxWBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I7H6E40Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2ytvAbZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I7H6E40Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2ytvAbZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jgUx3334707
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 10:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qlUKaFMDrg38PJ0GDSlOro1LZIAOUQlGfbV+b5Mr72M=; b=I7H6E40QcAdgCk0K
	SdYYJm1vadjyPM5v4qxzWw5cjLhaZyyaY+DyyttlfPvc8v9z23O6OUaSZIY3Zd2Q
	3Ib808Cch+mF4lARhQLYq5R1K+w/aRTfhVf0azKxtKG5gl/MKayg4HItKfGEG1jj
	Ld8q0Fu93qqW/9D1tRofC3Q8Ue0dI5dqQcypQGfM3ICrYk9zn2PcsBDJwG1CfcDi
	QcoQX+xGWVx6CaBKF8r2ea3Y4P+uyc9Gn3iWXpYL3qTRhWU5lqaD3k+Jw6hRJREx
	H9D4z/GtVXYmQ76V/5TYbW9i9tOsSC2lC3h1DZHsP2K5KkYmiK0bcYzZ8+8Lzbla
	wxE+sg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h54623h47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 10:00:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cc0b31ecaso828555785a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 03:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791367252; x=1791972052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qlUKaFMDrg38PJ0GDSlOro1LZIAOUQlGfbV+b5Mr72M=;
        b=C2ytvAbZDusGUYWKOQShuLwpls5bsXHg1NsIqj7HAOCQzcodZCwW34ZRTVATV4XvFs
         uARZjB9Y/j9YUB8dn1SOIUJ7aRFAZ+a4FZwJv6Ao6pevyweqmi0s9aZpv4e95AhQZQ+c
         Vcn+YvN3ZBTcoxOlprxoHZ9VKnJyw94HgvIGkX/wpEwxPU/xoTHJjpAGLckHQ87pY9zU
         pR2p9Taqvt3dpnI6AC1+OUHjKKwMzdPBcAgM3PJOBGsCGnhPLLcAE9DZDelidHfF/G5f
         qJq6NHTTWOqSpY2+6t6NmB9eG/g4EpUG3MsQCtxwR2fLN6cfu5IWCWreFLeIHMLDSTRc
         KqZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367252; x=1791972052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qlUKaFMDrg38PJ0GDSlOro1LZIAOUQlGfbV+b5Mr72M=;
        b=YBBYwVYxykArlLZ+5MPt71jbDeyqg1IuoJc2/225Xmq5HQDtyxNh1LdMnij085W8B5
         JEe1L5BbWL/NKlVo7fpyu9WpSM+s3jLtVca+CkcEALrrHC8aV/FoVK6a6a7WXkNVCkH5
         a0V2tTWjXXSURhY5noGr2LoLJLgIqcA83U6JgnZmMmVsHm+9UXBXPwmS04QBZ0lFQcbt
         s+UnHkH0O+Mh/anhxtRfzjGKlGujOWNWDERyQKYKcFE6fFUJskcmliR+xBFfwyuJ7xnT
         R3Tkgs1aUwCGM6n/GS4LHPZib0xLWb+hp2NMUiLmFKtdJW4YGZnYadFTBJdcu+sYafQg
         QD/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwVE7NMwT5w1Wyx2ZSp4jK55AOMfSkZ6NIEXy3ALoJ10M9UeqNu7D4ay6HzF9kbe0x+FnpY4nwLu/KkLUI=@vger.kernel.org
X-Gm-Message-State: AFuF++nVHFboxeYeySGc2OuNCZAlNdWguNO93jNkg0javZAjlw/DokhS
	+LCtjt/A8bJDnANhGAtBjIaWbYwNPxlFVquxRPJT2WV0JBFvH8uhtblK1k9UVD3ag5dL9nBfpDx
	8PM1f/FFAOIYBvdyYB3gY0WbJAOdLdVNcw7augEY6Pr3angM9gtQzwJ8QbutEdX3Yt2Y=
X-Gm-Gg: AYBFou2HgGzoWg2SiAW66UQpQ+OvrkQ+1bHHsqvGdZ088fg2wh9dr3IzzkwkKeHIYNS
	nwDox5Tp+cx/0D0UoIOa5kjbfCp+dQ9oVJIMXSTszUIlpmRbvJG1SNBE2/llgimUgHQggPWSLqt
	mgB2DILKN5ZiDzdjAl0TzcbOuIQz3Gz1SwO5hRJ2/4W5VR3gg4Gi6vHKNTMVh942Z2oNmeoay6X
	zoF5k5eGgTMzo8G6tHAz7yxr3g0lwXkv1/ocqZC36QfbduDOyN6zwrUdG4tPA2nU5EKApIKd0vN
	xkLaf1X8A+aJfejeQDSPRvhYw18R+fjDoivuZEpBNWwkVwAENCwkyj1f2PK1uzdCGyA/9JnYEMG
	rvD1lFf2j4oFntMRUTQS4/JyBOhQWuicMhrx3OVNN
X-Received: by 2002:a05:620a:27c1:b0:93a:14c:32ad with SMTP id af79cd13be357-93e9af3458dmr355367985a.0.1791367252386;
        Wed, 07 Oct 2026 03:00:52 -0700 (PDT)
X-Received: by 2002:a05:620a:27c1:b0:93a:14c:32ad with SMTP id af79cd13be357-93e9af3458dmr355361185a.0.1791367251734;
        Wed, 07 Oct 2026 03:00:51 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c5b9d6sm125385755e9.13.2026.10.07.03.00.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 03:00:51 -0700 (PDT)
Message-ID: <df0d8984-37c7-42f0-a0a8-16008130882d@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 13:00:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/45] dt-bindings: media: qcom,sm8250-camss: add pixel
 path variant
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
 <20261006223953.3382273-5-gjorgji.rosikopulos@oss.qualcomm.com>
 <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <e7c46f2e-fa6e-4cfa-b16e-8fa5d2112db4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JOSelAqs5_cNtc4862d4D4KDiKBoAWhv
X-Authority-Analysis: v=2.4 cv=ZZiIpcVA c=1 sm=1 tr=0 ts=6ac61855 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=hlJ52qXToqDDZdDxZ0gA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX78CmR6LJF782
 Qs5L+qVx2RC68i/bkbPYfe+8X1MJfJtEQrKFIFkOodHcmLFbFCo8OKlzUYTS725sdutQmeyeLrE
 RNXPWU0Fqb+LJ1UICqkxbfzYtfbUpgg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzOSBTYWx0ZWRfX5yY+qYh2QOqE
 Uh8NYXFlJkRJ6P49oNctRMLZcn9M33J/B+AyZNETDq8s6Evjh1vIgzrtyCBLiLjQ+nVRRPQwpfn
 FGtIZwMFgUWyHUKv84naZdZlm2OnqqvLUf+bwcDwoc0hbYWtglkdFyc1004lHoHOGz0RoF16BFE
 kPhHqBte8fcnnTxAirH095wBq2+kmqoj+9voUUN0l49v6MQjciuLJ/mlROCNa3RnT8beA0TDn+W
 ZMaJJRodxM3DeZR4k2LFBUGkH0t4nt9T77X9t16fPWzhPyDylGSM8dgxTcc/dDcm9kF41qYmnNs
 k0gBm2iMlUvgunpge1tJdFSFLOQWcdrQoFTts03il8mjOI6XuaOPUUp/F/BpQq/I+0D3ctciyg4
 cQGqWiBZYQ9DqksWsNN8YlG8WDVEEmKkeUg4k4KlrC09L3Mgpxkq48eW67sFmyP/MCPvBegvtDC
 eRts5piRc+15+V88Teg==
X-Proofpoint-ORIG-GUID: JOSelAqs5_cNtc4862d4D4KDiKBoAWhv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070039

Hi Bryan,

On 10/7/2026 12:52 PM, Bryan O'Donoghue wrote:
> On 07/10/2026 00:39, 
> Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com wrote:
>> From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>
>> Document the qcom,sm8250pix-camss compatible for CAMSS configurations
>> that use the IFE pixel path. It uses the existing CAMSS property
>> layout without additional properties.
>>
>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/media/qcom,sm8250-camss.yaml          | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> index a509d4bbcb4a..d561179be48c 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
>> @@ -14,7 +14,9 @@ description: |
>>   
>>   properties:
>>     compatible:
>> -    const: qcom,sm8250-camss
>> +    enum:
>> +      - qcom,sm8250-camss
>> +      - qcom,sm8250pix-camss
>>   
>>     clocks:
>>       minItems: 37
> 
> Same feed back as on the other binding.
> 
> Enabling the PIX path shouldn't require a new compat string - 
> Lanai/sm8650 operates this way and x1e/x2e will also follow this format 
> in v2, v3.

I agree, maybe pix should always be enabled, hope userspace not break because
topology will have more outputs. Not sure how to handle this case for backward 
compatibility. In theory if userspace apps are well written they should just work.

As an option do you think that camss-ife can be migrated to camss-pix and connected
the pix sub-device just for pixel pipeline?

~Gjorgji
