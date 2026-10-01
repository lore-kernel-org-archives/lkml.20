Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB934BE43D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790844171; cv=none; b=Ox5aT+COLWE9YeNie5i9ALY10HLovFKFM53snDfwRUWa+Rmk3ObQ9CdxMqKkBvum3XvVhUkJG8mG97YwWgLjaMcrCpZ4fcEMFXQVClNHpbaA6oqf5Kha48VaWMGWOAhS2ZpwscLmNfelnjZxHjV1UCCQ9glyuR8tteasl+YJ9Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790844171; c=relaxed/simple;
	bh=yvAl4xjOA2pRHrKdjrg+4RmlERN0xJQ/C/7p72SB2yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIUETq8cPozq1rAbF45jaF9SekvyVhuj2nx/YueZEfQtQCwyXbIn4R7aq5IxhQL/hYJQECFgxIECLS+ply7C8MxmqcgjJmbXuHUG2lFBwAHPQZ4f9t58mtNgVJUDCAr8DCvdUnXu+VKaFTKQQzgoNK2vID0qsTZWxhox/k1KI1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cq3Tx5fl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiBmZgH8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cq3Tx5fl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiBmZgH8"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xnND1661097
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 08:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=; b=cq3Tx5flAQse07nt
	Az2xrQe6uUyD6QXF6qmNxibg/nQjzJo//4u+9zzhFxPH106jlcD2yPPbWYi2Uhb0
	qiUXcPLtDAlc7FILg7EPUxAEegFlmO7REP3SWbyc57htxW6Sso7WN4/HkQjYg4VF
	6mdl+OhQSGFfG9qolM0TKvCbjNW1/x/ELppz0y9Vz24/PZXga2OzxWx1pDQ3rys5
	3cjve3SdEMLtQeJByV/wwk9LWH4sFJf3e0LrMLPx/jP3hdFHQ99dALZ55Z78a3b0
	LfVTBz82nWa/UqbgOSTxWRIt63c6s5RO+KRENccmGJC4OGrjpkwa8gJp/D2kMxHw
	XiuyMg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h167pkbbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c9a1cec69so40255385a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790844162; x=1791448962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=;
        b=OiBmZgH8yk376lbo9GhDDqCWlNwnJPVQCTNtd6oS/Do9jRveHXQ/beCAd2mTGYFo+b
         KlYbpbYm5J+jIt5Dvi8qi6V/nsEWOlc8odyID5m5DU309YxBc8YLFchvCqN0kHWOvIPH
         8YQPwoDC5tHCrJwWJRLsxLiOae1WcqKbSe1DdhOONL1meD78F0UY1r2jTb9XUNOu2Gxp
         G0g92s+1205fbfwMfkyEIwMdmi1QKzQbqrZZF5XnbShM26kK+pGNfCiNY/ML8gUgugJ7
         I6K027OaSUEB+lxQ/ftd55kTDx7io8C5A/qwFt6zaBrk/QpXUuX8aQdLFDgFiyFq7UCu
         0NuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790844162; x=1791448962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oimd7qvPs8zhJrz9SP0gUQVsE98vOmsbEkCGIvji68I=;
        b=bZtZwG2dgy6e2oOOVorLmspEw4Un55E16P+YnFi7wB/3e8tcqAoTssRJ3p2VVTv3qu
         PwzUx9HLfCLOd+MoLPxb98/D+WOjSOqfEn7CAq+G2xHbWWIMxrM+uS4WIM+bU8l6YmDm
         j6kt8iX7y/H3XAW0UHEiYojRQb7tjOTS8pFimw1t68RF31b3p4DQ6ZFAdhVA2XGk83PR
         iCKKkhogUYn0P2xbeDfozaTkwkSSEOBVCQ6JIFWz7Q8k0804m70phYYJSpyMmz//M1CM
         h36Xa59L8Z4wQiADIAhZq/xcT+zZu9u+3O4trR6j9yT/ksrw63gGPiO4nQ5HVIl/5xYp
         ED7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwxaSaZY2N765YH4gPOCncLqvhAGF7r1C0r1CWDB0DX0rrmUmK63T3VIws/0FcDqPjLpB1zRoMncTMm0ZY=@vger.kernel.org
X-Gm-Message-State: AFuF++n1Oq6lVIDUUxNeH8IceWsiXjXTsMAw4svNGknXUTP8IkXtnmf5
	iXbBEvMS5uYajDINxIM7seGcXp1NkjDGD+3U7P5wXIu15gvcabxvf7lnmP5GzsM8HDnAQVAz38C
	jmzNAkk2UuXhnjmPVPQNcEUuUVjY6Rve4dEikpqvAwWRXoGgbUH2amNvz9oa+ClUIMwY=
X-Gm-Gg: AYBFou0kTsSlXiwRzNMdjCYc5/0uoL7l+xgWrBNVAfdrgcOphdKdgehcBwfjHMIpRce
	6HkDASlN4jBJW/XEVhwfyAHELP8yhHsOnItlPZamgq+b6dIJtKNNJjZeM3MI5CfdLm8J6IYUons
	K0JyzOsSEC8sGKoyb5hcjHmGcMEoycnnk2HilsUIYOCQYpf6Obg9epzDDWHP/ufRZiFxTcCEXzp
	Gakrqaf15Vnz6hxArh81zW4k6B+unUMIM4AqYSOgvOZCq/lwehx806Ab+oJvqq2Ky3olnUOPTu8
	ZYY7zKp9iQhmrR1TsHiiI63Ql5X3W5h1XilZVGklAi6r3LTP7gj7Fr7SZS+p/7iyRMAfJtLRUbh
	ALQLW/iUERDJMHDjX90JofA==
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr643091385a.3.1790844162473;
        Thu, 01 Oct 2026 01:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr643088485a.3.1790844161997;
        Thu, 01 Oct 2026 01:42:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8efb0sm107709866b.23.2026.10.01.01.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:42:41 -0700 (PDT)
Message-ID: <58c1c4a9-afad-4059-ba81-cdcc92d0c5dd@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:42:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord
 ADSP
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aqhCkSE7g1EV6HA0coVqsyxdVTDNR8HA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXzL0dv4v0jpVs
 hxLZIuHKwIo0wmH2sY2drKx+A5wRX0+RGY/t7Fxjg4/WDhvM8XpPkFeBiFXOAK/8v7pr3yBDMvb
 XID5wmLoHHLZVJYpUYfS5SIcIeUj4L8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfXzNuOzJAn9ESA
 BUs/Es1TmMS4eChsF0lVOY65BGQhDNKb7wkZNzPaMJb8GjWrAj5rSKI3IERGkZ44B9S9qfGYlZU
 whwoPNpuIxSwQMk6/BErE7tBclcqzj44JbO3uOyDl2g4ew7etCbzC5rk8T+vtL3iMzLAB/0vD2I
 0rI96zc4KiPz3gpSJTMGOMobWZmABXsiuL6whVgPSzsLprdzSaAzfHnMS9Bj7e5wpk3sbbQsjZm
 YoK5V5ouOoh3oycO2+Gpc1seFuE5KQ0LRfXjEcp5umpyq3h5CZCNOxZywSsFNlwkn+VCS4hpK3h
 BW+Kwgh5Iwkw2+MJDFF430Frf9JUaIbFXHa6GANWo0AvAmod/tX7bqXeSdAUS19GM6+ufy4VWif
 rIBrIAQWm+4Ea+V7oJtVXV8DJUnde5UmFV9EELFT4NecOOxdsUVD82Bl4SKfEpFaFoBsrrpVw6u
 wF0daKQXC2BIXT9UeQA==
X-Proofpoint-GUID: aqhCkSE7g1EV6HA0coVqsyxdVTDNR8HA
X-Authority-Analysis: v=2.4 cv=WpC+otfv c=1 sm=1 tr=0 ts=6abe1d03 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IuaHxTfj_tQD0nhE68oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034

On 9/30/26 4:07 AM, Shawn Guo wrote:
> Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> Nord ADSP for that purpose.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

What happens if this patch is absent?

When the early_boot path was first introduced I was really hoping
that this behavior could be made unconditional and Linux would
figure out if the rproc may be active by virtue of it sending
back signals or not, unfortunately that hasn't made it into the
tree..

Konrad
