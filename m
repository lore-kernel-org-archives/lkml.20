Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076033B14B8
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881319; cv=none; b=II/d5mpNbu9CNkVEN/uD1Qizl8FqXU1D3HU+xJZ+s6gOjF/N9dv1Hnf90DADPu3ZlutOxI38w7uWzOp18NB36t1VdR5/YRiDDLWFdqg4pvXwCJnzLE1vcsVYmuJPHDkuOCW3KXWVmEtSeyTU7LPJXyqYokD7i7swkFUr7ieEwrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881319; c=relaxed/simple;
	bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=itTCpox3AGGo6Gy9Ea9MIP6XuCc7/nM4rlK3gs3V9ptNPJdpIo6KYevDla5nXJYLHnYTS+RMVSzDXm3eJV8HvYH+MQKQGcZVMyXALrHD7KZdEbt4Z87JdItXKi+KteXRyMIaWTWwr6rLQWLTno4sASUfXd7l87cRgs9nUmiIllY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1fQoYH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkIoUNPt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1fQoYH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkIoUNPt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D87n6O988768
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=; b=N1fQoYH754tUxWIe
	vRzsEUvObZj9pY05lkTTTbFXlYwbtpDTS8M0XWu4Mh/FpKHMf2POz8NQ7HvsTz4h
	O54KR1ezuEMSc8mVgfSDv5OCfWfeQFYJ2NW1PKPyardkT6TT1OAfIMmKHbqTl/mK
	A7IBEk89eHG/A8yGtI+1jaYGP7lGYxtfpfonE3u3uytXLJPl0mMpXX0fl5wDF9Sq
	LGgRkX2vJQULjuiZpQiLMieHISByRQfz4qRoy7NydA8k/wZFaE8xEx2yc1i3eFvi
	3P6Y+KrylK+CYEa6+Fldp4Zwm4jf9xh66rjBBiM4uhgwJE5SjFCyyOLapGRSrPX2
	WMM5ZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hca0st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:48:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53568f05f8bso8982301cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791881316; x=1792486116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
        b=YkIoUNPtCxbhIHJC+YdARX5lOBUhRlBuf22ayUkM/hLGFRsYw6ldaYEN2F/UnA43bg
         u+tvZzifm6edgNvT9wnECV9CRVz35fEgk8luaBfnxrz8jGRGZK1OZ8pityEfRw67hJoc
         ch9ayjN/ShzRUT31KqT5Id7NMAZZx4qJruvaHvAAjIhKCb9xNxEDaQsCar5Q8Pk28njU
         FRJbghUW5Okui8Eq/DuJoRA2eJpN4CahEz0+47XmauxCMzMvemNtxPL6YJw8uUCISnGA
         OZqI6QtT/ihwHZgNLN2fwwoAUMiYC+ngJmemRVR35ew7p9FrCVSy0M82vXGoivyyH07T
         O2+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791881316; x=1792486116;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rha8+JpITTfvtyZu4IitLdjdf+kx7e/IzzC6ZH+57RE=;
        b=s4cSL0AsJQB/0K1SyRVUPVY6aopvxf7/TjVDOws3z2qGoOP0vFmWrNikIRiEjqMMB6
         7MQKD40JuF87V5JJKd36E9zXZF4xHKuZYClKxnU1A7Waq83B7hGzqyN/LAVzeS5+b+g+
         30+iA+so5l+gGSfe6UXhXlx0EB0noz0b9cAgT4OmjLbOVKyGwHqc3NyX5zJa0Ndh6EBL
         jgXpkM10eUb9GOVOh0LmPk50xIy5e6FCiE8lWI8+Kl5ZzJniH1qGktG31z0I9Fqgov0r
         j265Z2m4X3UYTFddxaF+BebdfCEvpFQjsMThcGfguWBweW7Wb2s8GnM3w/HYXu9kV/tk
         lHFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCO1ABPHr5MD9O+7DaulXeJuYVmDMiCsuxohAksyfr1CMhqplzWUPoCOCItne23G1QYVluo7rZsw6x7LU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhN0N48zChU6qXB5lCP7YWd6/q2Hy2TOTqHHCiX/BvgXDvINh3
	HEXCaTy3iu3swGODB4r6u0+h6kbwOKq/sdvHmcd+/3brFSlmcz23fAQSlxt12qGLbHklOzJ+44F
	BWxK3hnwDbi4PiSkPca5S50EOPX9Rup1oL8k7eIQJBgtZdTNMHa/Vo046Z/zhDY3U5awuWXjqDP
	k=
X-Gm-Gg: AYBFou3wyQbGKZtVtLAAvvkrybkhLeXMg+I+yN7VoGF78Rd4z0eUfCgvENi5qZeDAaB
	6d/YGm05udMrvb3KFuXYqMBOmPyj4PlM6mN1m15uzcRjhTnnGX5Y8VcymbxESYQ4fSDhJ95NiY4
	md0Tvdwg8NH5G6tTQa2xAXJwk5Qlc9WVN7TpPZHiXCkWZrY0TnmSniAW8eI0fVp6MGnSoJRj0qp
	qms13psoI+Cr3Fyh7rMgHRdI4aIVI0QV5KFkaLMELhQB71TnZS0JozFKeZlYRKrYFXEVmPqyZTz
	iRrN2rc/mGE9p5re/xkmw87Gu45JrgC5+AeROyyr+7+4E0048ezPrq+QJupaiOSV30KMigo/Q3B
	j09jJaUZMgZIjn4BNQtfttw==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2038960685a.0.1791881316171;
        Tue, 13 Oct 2026 01:48:36 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr2038957485a.0.1791881315427;
        Tue, 13 Oct 2026 01:48:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1ce47f8acsm1792713a12.24.2026.10.13.01.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:48:34 -0700 (PDT)
Message-ID: <cca9b4fc-bfb3-405f-b818-b8b6c0278b3e@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 10:48:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: ipq5018: replace gcc_plltest with pwm2 on
 gpio12
To: Adriel Santos <adriel@adriel.eu>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Gilberto Conde <gilbertorconde@gmail.com>,
        George Moussalem <george.moussalem@outlook.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261002160958.908424-1-adriel@adriel.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002160958.908424-1-adriel@adriel.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX9dF9nAOh5mXi
 fexYpWSk2rG7naTeB0MG7Uhomjp+L7IqqzCfnUEDQQE/s5XaeJ/1LGSBWi0nRvqn6yRAQu6QHjV
 G4gAyY9I0JI7f85ZJdf7b5MRj/8LugzmIQXlfenPDU6V1okWzvlj3xqDFcCbdzhWKsBHjQXPD8f
 WrVFR09vjOCW4zbC8kowJCIX3fbz2AMm8DMZWMwYl2xB07OeifLzcCbtMDM7yWiFcLRJdFx7eXj
 e7zb7LoRGYIoODXBbCvTc6GLctjLSU66z/9d17vIwzBm31+zb8PhNWdoveSWN7jWDVR48CCTxeg
 wiFT/+CblCYoGkz58acY8vgZ+gf+50s/Yi7E5stOW1Na1OKhfMoH4gyuDDHiVLyxy02egyWh3vs
 s6XPcLUamEyih4Yl6zZemsQ6ZydZ2P1IZJsKkfJ9PpoP+lndRBVPvvLlA61TtfjrQ2asfeh2LOr
 FDJh0zAGN0nL+TBSDiw==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6acdf065 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gsNUEyUwMFFXpnDrQ7IA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: feJb-GkK_91b1sY3zSkQLikbtx1RneRd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX08mo+ncDAOx/
 eZbh1zcbjUbzNGvQYY/yfVYK6SGchZhrme9O/H8q2EI4564KLXne+X3lM8eiQb6D3y4vuydjRyq
 SndBSm8qTbaopw1nJCEPmKrc2P795PA=
X-Proofpoint-GUID: feJb-GkK_91b1sY3zSkQLikbtx1RneRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 10/2/26 6:09 PM, Adriel Santos wrote:
> The pingroup table has gcc_plltest at function 5 of gpio12 and does not
> offer pwm2 on that pin, so the pinmux core rejects a request for pwm2 on
> gpio12 as an invalid group. On the hardware, function 5 of gpio12
> carries the PWM2 output: the Xiaomi AX3000T v2 drives its blue status
> LED from PWM2 on gpio12.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
