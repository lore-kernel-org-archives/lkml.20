Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568268;
	b=W4Fgu+SACqeL8QG2GSlRpfuTyo7qtPnx9rOG6O5SxwVF8UskusuCaCX7vUcjkY/wc10x
	 9SD56ker1Ue/cftfH1sC8NTLmWVae0lfODwxaD2EV/ohluy7ZElnwzniYWlFVvF6McSa+
	 V8f+bQLtzhos6Vqb+/Hbh5wB+yCBx8Zg9umwXzDRh0hTkUKR7eQ8w+no+URzu7gXJnjxw
	 szhfdq3zXCa8QGy3urbWPwzIvN8qTmN0teIN26EalJGzNNv+QDjBN6KNcLDwWkxOz+DBb
	 Ue62n1DdI+XAfmxT5/BYEe++HN+f0meY8ZrE+ZKWWnmm1e+CmZIi1vLU+g0JMllewDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=;
	b=ufO+r4Qb+aayMJ9drfa+Nlge+BW+qSpmQle1rTFJ4yCGJ5TgjIn1TNnRgBYa5cICCkBv
	 qGBAAZ7Wa+5rQ8484QxeOcpgITiKaznyvy1smbD/em7BI8fBJbaOdwIoxFI7NI7AFyZ80
	 UI05GXzL7JrsM3F+2zUveDhpcE80dgNrScc+E4hDdGDAKEyAzOT6NhsZpSomyvIM+fA2g
	 mAsZUsaDVDSK8GhsQmNb8LnoNRyZL9YC3aqf5dv9qCAJQfYLM3NRGQxcGJeBSwaqUVIBe
	 E+f0P3J/UIZtALldwIWplcEJM/+d/dH54gmRSFALJTS7fxEDVwEXHCC9vav3V2wteWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0raHv9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHODPjjq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1260606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1260606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MP0raHv9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hHODPjjq
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jPTW3573370
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=; b=MP0raHv9b8S31GAn
	jp3bKYWlCYFqovUnPW57bgfCzGz5va4oaDRTrIYDErm0zDT1wSYwv4Z/JiV6NGJO
	8cwYtoQ2E6VJ8LlKWf6IVjwQm9wUom+x99276PoxJV4YmTYOfZpzbSQDb+s0mf8U
	J+jeygXaSd/i0lCcs94b/VFCbI+GmKYpcnwNpQfG1Y+ruW0hngRubVVK1p1ECeqK
	36iaI9F4gbMNpiPkz4OUA8WQaFp6X88AujF1dccJM8HmK9JdE9QOYSeHUvPEuscF
	LUC2ajh5OWMJd1NYUwPZQSlsD62AgNMzJk/Co72qVzytRKzYVWoXvUSlBS3fOAoh
	j/X15A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htksh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso1367521cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568266; x=1793173066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=;
        b=hHODPjjqheC01XUqsBbjgwzsbU8/xLMnVoQvNAcvMti61le6CdKpl0nG2l1tKKsrzj
         nzIFwlUkr0ejh0XxJRhe73uMP+k41SIf3amM69OYUrvTlXdv8qiOfOa9VG9jE042+7ff
         0h27KdydTeU3MtaaCiKcHqsFOF6gmOg/RhNLaOm4CbtghOpfjYfmpOzXMXNHIb8TqZ5R
         cnrSf+lRDQy7juZD68VQ25NjZQ4tkeLaeER0oIBMLz8wVJHESqK9Y5orVHK8H7YBGr/r
         nCVux/vlJG+ekxzP6ANZlez5DSFQzOoKl9Uh6pt24gXjnPX47wfP0S+cDvf3cPs3AL/K
         m3dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568266; x=1793173066;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj8rVsDjCVNiGCvcwswscnlJkXJL5LG6WgdMkVptoVU=;
        b=S/cTS42SSJQFgPEyI1IfnzqfXmENwYzq9IvvVabCmYPWC0babeld3xwieABa9Ipzir
         7xBo7MewQoMRtebkkb66wDkm/YJACzpz4rD5ga0lzW7MLRVxk+6ztmrhazMh2m57maRg
         RD/OC6bQQ1kQnAoKADEekEsqqWURje5r72gZTWvuOzJ8QbG/HwPeFDpNntut68MP0Ow1
         aAM9MY6soc1JvH8j1Yb6M3ZaX8IrVlqY5/812B3lvKoNlVIIfwk9p1impEFiAL8rUYse
         YqvYP5XonB6oe+lhMXfFsi3XPUFZ3Q1qfWZJ9OR8gKSprNXbJ2GTX4ZVzJAeaSspeffN
         7hLw==
X-Forwarded-Encrypted: i=1; AKwUvBxf9H6QF/CJ1gHYM5Y+00kdox7+avvjeqJWKDthqezmrK/nxG0lx0rLygUKXkEAegUMNlKECwj82hk0WxI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLoNj706dUK4m0dq1GKYE10ShXnOekoCfzmegSYweybpuVBLk5t
	xDdphRhJbIwrekaWScPgYg0+320igVDtJAQGG1shV+EC5K6tXyDpQCMWGCnKD1h9u0KFZscND6c
	uYtlc7/SZANGTq2/dM2XS8LNo93Kwv47xZ0koqFvIYBq3sThi7yBRMRbkiNlSqmtqZb0=
X-Gm-Gg: AYBFou2HXL3Ml2okfO21iR754WRwToYmJtl/KbIMDQ02PnIkmCbFyA1jHyuLrPobj12
	zdtm41sUkFRbibAN0XpRnDLfKqO/6w8/tEloBUDK8mwFYSZp9WpawLQmvQ0cFD/Jq4J7RNEq1ZV
	oafFHqL8FrYIhyLWmK0s5nHUmHugpEcndoEQUPcKDv7G9uccbgX8EKurGTjhaCjcxKvpNWdnuyx
	gpaawUKbx/E8QxD/Yx9TMMwhL0jiQd/g+AIx8g+xRrdCZ4NgBUyUFOMAzY9ewFmGZI2CLz+ubo+
	DYNL4WLT1sX/HGG9Q+61m2XC2/1OlyzrZBnBTDB64veVvhqd+f7+gxUEG+zKCGeBg9nEzQswVie
	6sPy0t6nJ4rEX+j7uzX8dKw==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr25454591cf.0.1792568266119;
        Wed, 21 Oct 2026 00:37:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr25454351cf.0.1792568265726;
        Wed, 21 Oct 2026 00:37:45 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678fa9bb1sm47891466b.36.2026.10.21.00.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 00:37:44 -0700 (PDT)
Message-ID: <63c8f014-0410-45ee-8315-0b646ff78d2a@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:37:42 +0200
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
Subject: Re: [PATCH 2/2] soc: qcom: llcc-qcom: Fix whitespace in slice config
 arrays
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-lower_case_hex-v1-0-bfac89824646@oss.qualcomm.com>
 <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020-lower_case_hex-v1-2-bfac89824646@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad86bca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SbMn-8PG_jNgW46L1lQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX+2KpT7Js5kDC
 8uujH6HcjXIxOT0C2MUiyW1TDDKFQbExosEF389UQNotaUIAYTqk3vXAcyWlO3+adZDWoHStn5b
 DJz/CB/x0fe4Mi7/uU3t2kXk7wNPk00=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfXzhp5/CKKQu6F
 moqOPfLNZKXIwZvb/HgrwJg46mzf61eJGnISW12qJPgE59VRUkiXrEuCURRdWDFUf9OkKadBAqW
 6+nbeSGoX5BUuytq3LNJfB109eXurnrOB8D8IzQMPSq/vXSGBui/uJtu7eR4ckfNW/Hr5l9+2bo
 EFGEsXBMvLQ64ghYWxh/YEi8MMDNZn5N5DY1sfzOmyc/92+aGeIOShWWYmo5hfVWDklgLJZ38AA
 xzvJgmGMKinw9FmztkvYMj4RrTWQB8PcHge4l3bqqKQQPAj3zfC1Rb4SWTC3LJRGBgup579Sy84
 LjqVp2EEPpoNmBoLCR/zlqyo0so1UH6GEHTonwoo2OIAxRPqtw8NzzIGAop1msfVVvSy+PpW8JW
 BXhvsOPKpjDzr5COpKpe9xi3chy0LzdQHAUN2HCL7vq2BrjZeYKLZurFu9S9r+WI9TozVg80faM
 Ud8FjacV5Js/HfFAlqw==
X-Proofpoint-GUID: IzK736y4bkdXHPQjkAXyvrhc2_4-bUyY
X-Proofpoint-ORIG-GUID: IzK736y4bkdXHPQjkAXyvrhc2_4-bUyY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

On 10/20/26 6:54 PM, Kathiravan Thirumoorthy wrote:
> Some slice configuration arrays use two spaces before the opening brace.
> Also, sdm845_data has the first element's opening brace on the same line
> as the array declaration.
> 
> Use a single space before the opening brace and move the first element's
> opening brace to a new line to match the rest of the driver.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
