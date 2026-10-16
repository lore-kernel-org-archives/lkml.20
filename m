Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7608E44C51A
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144184; cv=none; b=iJSJbDN26QCt6CLfItPTG/k5IaHm1cF3nWR/YyLGLdl1lJHqic5yVvswlHq6tyynqJnlNA2YzDHd99n9O9NlZ+/rc/FOQM5m/Pro0qjKbD6dHPOQclxud/9MlS4oKzQB2RzUNIfZMc913ob3yT8qYGrcbg5eAisBMw1z/3ND2L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144184; c=relaxed/simple;
	bh=sZ0YEEJM+nQC9l3aPVYzo33JA4V892pPBT/BXf8zA1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OknqrkZelhWVIjFoXCrHOyiQtZmKEDNLemWzn5gprjPRRUnCyh3C46QVFT10Q64JQ+7sZ1HiKqSGM2guJoiZdKV6TBV140x9cI9MaNC5hCZzqc9LuyK8eH7WlygZem4J47rDqckvWU63mjrKfrTygYzvPmd/7AEdJtBAoHRx8SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z8kwL6Sy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jqfWtlNe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z8kwL6Sy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jqfWtlNe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lhGe921375
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=; b=Z8kwL6SyCsVD+soQ
	dLZ5g8n8IPDPJb/2xXKCcv0FSJCpiksMujS9qNAgdwMq58UXKG096D2g8n3zm2Q3
	agk3+qSCNj4nw7GDTIUg4bkDc1J1ty4RCQdkU7YdOfrEQjUE/1f5sRJnKO8IBuW9
	kvDllT6dkS+/bwoXMXFpLIRnMQdkVnwkXXS9OLQLPjuRUqNMS/YypUpymFTrr4qT
	zZIrUuuInxYomymOWImDyarCNrb89gXWZJfmqXx9KHv+9kzI1WA4dtnRGk6L3wm3
	GtTFBFNDwx5IUTi+iJI/2hLit96ec6wFNRjErIeGlGWTAG3v6SEqLutlZYPRYgnr
	3IsXAA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3b6xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:49:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917ad3b42eeso15804016d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144180; x=1792748980; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=jqfWtlNertLx8O3w6Yu/V/ruKU4axKgy5bClzIn91gBi6UE9Xbin+4wNw+vxvU4dOM
         5KvqUIvs6CP+xj9xlMjRgmhmOMoELgeg1CTtUpjyrGCOmj4om62c/+4zZFicHQtJRI0e
         BINwHaDt5c4XdmkKg9WY83J7CbyW/wPiUwt6MQVY9c1O4zt0wxqvm5zdGnjC4CR/ZJtE
         qH9XZ3Q4H4E+U05jo1SN5hrPBnlToxA8cbOVkTZJ18ZiyYLX1R2CkYocI3zPfgcpSS2c
         J2QYCMtfh+BNWtDVtF1riOoksS35WYy0VMLi25s7OMnBRn/1kz18RTALh38U3FhG/f6A
         GaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144180; x=1792748980;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56f64g6oLreLCUIowP41hw9zucQESMG8NygFkLofNIY=;
        b=BVg70VbLq7o0esbzFDD8+swyt3RhvbmnDz5NEAjl9I7ZnF7p+ISQct5f0zY5FDHgIB
         51/uIgiSCnO+pK0eDFnX34QAPyK+zQgZ/u0T33+hUeNoxRKxq1zN0GRuQz63HaqET54/
         vS6dYYcd80LrUAA4o5fOF7sTfLPoZvhRjco2++o8Qw8/1b0oeLSRg9S1/lS8A17OA3Km
         W9hDItcIxT1SwF9Vcw8JmrjJTANHO0bGcLaI2FiM9U4xebNegMsB21w1C3H4H67XiGF0
         ZyMewDFAcNhcRmUqGlSr+3cmgW5XLX4TngYixZpnpSPPrIp4/NPAWVnjUMp0YO1BkrvY
         3FCw==
X-Forwarded-Encrypted: i=1; AKwUvBxf3vrQe9DaAWI76EkXWl/lhZFAUQM0Ms8snYL875htWOqs8+X8qC724PfTSNFwCHopdyTxc5+wglhCL4g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKap6o2SAspe41NHwIJ2h26bPFG+rjQjZidkoKWHduDHbkQAUtw
	xLXokT+oHqShoHuv4uWNsLOyNnFfJfY9x7Fr6dd1VMf0IXvf75gnYF8L32+UKhvbwOqwSNTrN91
	M7l+RDCIW6RtZO3ttoiSShf+atabOdoNixxoSEMC0TgFpBfEkmRcCZsaywVeSIahDNW8=
X-Gm-Gg: AYBFou1bATzWXNrZvh43ghUd5iUnxxhvt8PStZTlsu5f0oCz4Y/lIfAY0+uouKVFBym
	+2g7zx6U4hjtP+miOcBF6eg3yJDX0IktWkbgPh2TzzjVyKm/y3lSR3IF1UJHNUXeMvxsHaV5drQ
	jelQTebx5/N8RU9FWt6NxLRwgzheELdjIz0zDsx2gOmYA9XS4qwY41VKTJ/78E/lL0+DIs3vkAW
	JnZsf1Gs5MJld1RRLBcX/QEqgx3SAB5ArN6qa4cnJNgyet+5YHaFeoFw/zWg2yMoepPLIOETY4g
	TSVnuLd7txzQ0RO+hNkfVw8or2QFImKQn+4/6PAqH6Ehs2HKKHmJXytJ1hdp5RAD4RSEO1YaWS1
	I7estzIK0K5aJifzJ8G2noQ==
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276518185a.5.1792144180548;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
X-Received: by 2002:a05:620a:6501:b0:93a:1312:ff19 with SMTP id af79cd13be357-93ebd2661bdmr4276515285a.5.1792144180098;
        Fri, 16 Oct 2026 02:49:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm690572a12.24.2026.10.16.02.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:49:38 -0700 (PDT)
Message-ID: <734a6666-e420-45ca-ab5b-f00a0a7aacfe@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 11:49:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: arduino-imola: add support for sound
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260930124607.1109167-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930124607.1109167-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX1GD227P//Npi
 pmuGgEuhBLyeTfbyC9jbvUJQq8QS8WGUe3KQQHTEhcaluhKkS/YZ3AUiRMZwsd72rCYtD33rI1F
 bpITENLyypZ3KiMAngLF6JajJUL5G3bCB4xBE/rHeKAXvqr4hZ2i6GHXJPDWyKFt/xw5S1Dr/Mo
 3XSH2x348K43CrAdt45LnmEpbfzQmL3RbK2eW6Hy93wz9AmVeyFZI0EO2Vui5IIrTHCR6cW8QpD
 qgKhW/6rMl3llOBUZ/8pES2Q4U22tubVXX3oJl6mUJtyGj/2jLOxG0U5KK1kg62Lt9glXwkL/p2
 N/KF+JaGh2aPVWbO+cZF8Bwh0roaxOsYim1DRDh/0G0KLTQwLbLDbI3KUU5e/sFJeL/Zp0QLANh
 wdoi5q9SAb8NAENTAGrjgvko0TJ4QTZcsWxt/B2CTTjJuoSSp3B7Ft0dZxy58ltb9qpvjHmAhcA
 6I14ilupWMztMl+FTRQ==
X-Proofpoint-GUID: 7e3TTpIlLnN9jmR9WziPv1aUUbyYfnzC
X-Proofpoint-ORIG-GUID: 7e3TTpIlLnN9jmR9WziPv1aUUbyYfnzC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX77g2O3pbFkzt
 N3NtGWDDODOLJbO3SwLx2pjW9pLGMRsU5vYE3eANBYBJLZkfkw7pN9XIOw/56lvRjjiZv+5mqOU
 vCr+Ocv6MQ2QjPwjUDe2d2z0Si5U+08=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1f335 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=iMdRMZ7CqAKYY1MXlagA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039

On 9/30/26 2:46 PM, Srinivas Kandagatla wrote:
> Add support for sound on Arduino UNO Q board, which includes
> - Headset playback and record.
> - Lineout
> - Ear Out
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
