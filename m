Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317CC3A6EEC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028053; cv=none; b=Cu6tWzP8hWMScSTXciBpvwgx1zQhwgAVaRnCjhkw0+wygfAbiyH4fJ7obdj3OHDCBOaGC/1gXOBl0//vCKkuR6LDC2WufPRmyqhetv4S3H6KWBnl15ntzjv8G1lOabAm0bMnK8L5ulnQS8c1fhgiIShJQAdA/a9EiukRCRpf7es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028053; c=relaxed/simple;
	bh=xvZomGnwMIpd1clhQ3e9HrFkUuPf6zUAzeHN758cNi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a6nK2vbqZTd84UlBh1S5NHs/wAHimOUcFBV15IMS6wErApogllXeIK4Y055m3FX4s1x3GI1+ZfOx60erXTL8PR/GwAavWkbJekCVu832M1IBguV+iFEhVsEU5TNaj39a5wH1/gwjwOiZBf5vJ9axD3gx6gnxjxZlD5CEhqpF+04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMq5Kw1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TQj4RR2s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMq5Kw1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TQj4RR2s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A71EJq754371
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oMGTFA8dUvLOZmzkmBtn+iUh09E6vfKjirLqmSxcoo=; b=UMq5Kw1CBbFc8XP6
	fCnb2lfReZ0SgJxXVlPzfBpzBztGhEuz/5MDtH6HQnL5We/KbEQy70MShGBv9J6k
	2kqJszVYPJgrXVI2s6ahIKEwFTxxqIDV1d3wx8SDnRvGIsVdlRX1nRKQktiPMCNx
	VnYKYlkSjm6CtmI0qd0D8a6doGpSFckan9yePfrFpqjI3LdDa06Rjvb4RS0y1GDA
	9z6e7rk3a+LB/GeNGdhiLsJ/SQ4duZtiJOiQKHK+eDs8Uf4l1XEau9Jwl7rboNeM
	LJs3NAZOV8PNffKM67aLd8fByFA6ed3HVXZOxfXJ7Sg9Fb97CJQAlslRboEtKyyM
	3tQE3w==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvr8yv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:14:10 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7eb6a8c61deso6052476a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 01:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789028050; x=1789632850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oMGTFA8dUvLOZmzkmBtn+iUh09E6vfKjirLqmSxcoo=;
        b=TQj4RR2skXYq+qUuRScuAXgrjOuq7DXfm3AK09VouDT8OJxrDQFVB1qnaO8qP2t78O
         dikfKziRCwviJyJdUmNXaUMJPhdXG1y4bJqalQ1PRMC2wp26uPwuFfo5q/P9A3JFKEBb
         grXwGPrHa0IFUyEukj07pTtu2+m9JRTgzoYBLFnluyaa92LeTHnxYnVVgetqRhXizq2x
         XjlUiAfEc7tP1HuMTLx01ZrSa5goywAir6oNh9QnltloQ1fg3657STZigPgmYb71tV88
         bPzKMFq77Ui8n0MAXujJ/7Wy3X3UrTkNYy9SQlYHOl/Pifw1Un243qF7uH2kfu6ErJXP
         vGZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789028050; x=1789632850;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0oMGTFA8dUvLOZmzkmBtn+iUh09E6vfKjirLqmSxcoo=;
        b=i1V2qmzUJeX1aCMxeD/MAduQ3N+1Zcq5ZF8sksM9rWmON0ZBPoqTE+vNPiJdAZbYd/
         t0e3o6jHQEICr1dIxDJrHLbX1ctlABWEwu4eMBybQy3aqLSKYfNUptnTSbzGUu5nMfMd
         QSDt6oMwchojnSiaciADCkeyil74p1mhu5j3pUXAdpKAOtgVSbvk3v9n0ksSlRkxXtXr
         aKwuBrdoYH24v7wG/1gNdClaERz/KwJYXSfEjJ9jf4CeI/5sH7XrS/2o4sBSBoHmk0wY
         CP0CsobiN2gh5jsefCzcXoB0MVBgfXHVRhWC10G1l//FqKdVaKZkPJo6NdXfwmOz4G7i
         C4Dg==
X-Forwarded-Encrypted: i=1; AKwUvBytuogrxoYnQbHSHEvKAonHmZfbJafmXytWx7LX7aroqFIiubnX0q8p5WTl82tepQ2bf7sQ2FIW8VYZicg=@vger.kernel.org
X-Gm-Message-State: AFuF++kT9AsAjE0T4QXd7DwGbds1C7B7rCXcMgGlbUShGWVwPqDJpEuq
	ogBfdwITXauocY1v9N9L3ZNCNttphTpsGINqcmn9w9qSDoViNbE00kQr9JM6bA5F1hJD2v/TPit
	hWZH3aiqGBIb24VX1DY2+MwCdHK4uKRArbf7Q/EY5q7cjsIGuzS/owaATUA6Q5Z+dQPI=
X-Gm-Gg: AYBFou2QmvJv2qWesEgwSGb5nudwTL1HdwQKtLU12wa+xrV0txyq3q31q01oQQKAxEj
	Zu2tRinxjevHRs7qp/Om0dszzUq7CYYGkkR5F90Mtkxf6ZgMaHGOW+IMiDLAG7EzjllCW0rz+2j
	XA9sgA7uAK/ihqocSO41Hu4WCcpAhB/4LpJD38meb1tkQXI52JO7Hqheprlb+/i6WppPawQqcAd
	XeFEjuK2FzeGow1wX3INS2GmLLvJZhLm8EtUeW3IjcZuANsABY+Pse1erE0BD49R87iybzuTgif
	Y3LomTxprNnBl9P/0dzbjennJ8837/V0TtIa0fY9GyHPnVXcEMu5zfH2TMdHfi8ZAEemjfGXKs+
	PCJUwE0vnKpbgqkKlAQy+3ijBk+c=
X-Received: by 2002:a05:6820:f00b:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b6fe3af760mr22792384eaf.30.1789028050109;
        Thu, 10 Sep 2026 01:14:10 -0700 (PDT)
X-Received: by 2002:a05:6820:f00b:b0:6b1:24ce:6264 with SMTP id 006d021491bc7-6b6fe3af760mr22792357eaf.30.1789028049628;
        Thu, 10 Sep 2026 01:14:09 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm47603650c88.8.2026.09.10.01.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:14:09 -0700 (PDT)
Message-ID: <f27b9dba-15d1-4c04-a0d9-7a0773ce62ec@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 13:44:03 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] clk: qcom: Add Nord DPRX clock controller support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aqEaGuCwBRnld3db@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa266d2 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=-cX7WTKAfXPw2pp_mdYA:9 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4OSBTYWx0ZWRfXwtiMV3ziXbDZ
 DfPLhkmJefco0fsjq12eDSWYCHOmiR/vKyaRX+I3D4TZOtf//sNWu5lFhn/6TduuDgZPLqI6P5U
 K5/DIe2muuRgmBWCmkwUkLQ4PFLIs1eXqFgNK2ggE6coyQMsUmNkVO5UBiZqLHmPXfr1bD/97J/
 7XZXrXXyRR36JYYbe5Tm9zg6w+P8JXG/WLL4U9oh8Z86bcceesE3amxQ6gUZSglDizD4oOK0kor
 cilYizJq8c+3g7JltuSHADwruqUiLrIjePfLrH94fkgK8j6FoTJ6q3rEfj00cS6uGhHd+9byq4Y
 p1a1Y5MfWEFXgVqywjZvEq2iIMIRvQV6OBRpM1H7txdXXvC1szhN9i5AShtbgSeNev/QbpE6dTq
 WAWcqre8xyOSZa9DN+c9Db512q4hZRJDmTQLZhNdST4Dh3F5QZs1rnrPBjK7EnoZ1BZXPSF8XQQ
 d/5ubcmsml6zJn9mEhQ==
X-Proofpoint-ORIG-GUID: FdR6fPYLBSKit2yfnOr_crbFy38lHumH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4OSBTYWx0ZWRfX0ictqWuYhRTa
 O+c3cBWJ+Ff1xv/6gLSJpbyAbsAjGGhfiLQn4XQDs+DEPoXhhkwN8Ye/MBVrd2ZaJkQ66l/NlMu
 nmGpOU9fM0A3syjQ1MZkEzRupWApqNU=
X-Proofpoint-GUID: FdR6fPYLBSKit2yfnOr_crbFy38lHumH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100089



On 9/9/2026 2:04 PM, Shawn Guo wrote:
>> ---
>> Taniya Das (3):
>>       clk: qcom: clk-alpha-pll: support a 28-bit ALPHA_VAL width
>>       dt-bindings: clock: qcom: document the Nord DPRX Clock Controller
>>       clk: qcom: dprxcc: Add Nord DPRX clock controller support
> Hi Taniya,
> 
> May I ask to be copied on all Nord patches? Thanks!


Yes, surely.

-- 
Thanks,
Taniya Das

