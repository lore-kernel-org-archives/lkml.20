Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB97C3BB112
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788537828; cv=none; b=DDVvls1LKCxk6ZNREoBnZJV03oHv/C75160tRBPCnsuRbhxnppelzRTSOR7NW4DaYP5Vl50xh8DdU7EQomzFXkCWXbzksu//Au7HGdgSfpgKHDhHa7zQ9XzZAA3841OITAKyXeYj//gajmPAW1937y9rh1lpLHVZE52DoG2sGV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788537828; c=relaxed/simple;
	bh=6EMuGemNxkodLoVrJas21TkUtmgw/Ztd+5lOhHoZN80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFUg3n3OGKdfV5K+kbsN8Mnl1QmU5JES4tJJEOd1LdIPn6x11UPqOLrdFyhfMU6dsXZgQFml+lwF4G3cUvmEy47ht7IclrxqT2p9Be4hgOl7S9a2VSvu8wpihEH/1pGcnCYAWq+kJ2jTzjMj7KnWd9kqoIKDKiws0GnAH+i1GaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gGIVfWl+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APR767on; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gGIVfWl+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APR767on"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EjK6Q4158892
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 16:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=; b=gGIVfWl+IVBNqJxk
	KVKIXihnxH4Q6/zL/90Oy45L5JSb04b1GSjLmB1bE+vtZBwapNTWWJV6PEt6N0uU
	8dKz2ADKywrN6I/8IDAvi0jtZ6iXvL0a897tBN2+IEfSnrbI/8d1Erzjjt+hnu/V
	AWrBFdmvxunF+3xsqUhgkdWTRK6qdF2kjxYkfDko0KvWd8r+lNiuDnauIUnbWpOV
	EUU4RVZ8l5FEfqyegCmIUtu0rgEXnwlAv/em1uc+6meMhXKRwPTfk2zqtFJpLjvt
	FN4Cubbm/opSqg4YFHUOwr2RLiIwOMzeltyJWltXUmbXugC9iA9z5qO3jYls3aNu
	bQQB6g==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg011gmqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:03:45 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e52682f0so1836108a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788537824; x=1789142624; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=APR767onCHd8gedYA/rgitlsHwyGBVYD/q/HPnvE6U3SApeCDH1eicp6aZuMPs4Yz0
         bPrCYes+EJBY16YUDHOGXlxOJg/Pe/G2GYSXI4bQHVbPpdKaEoaIIKU77yi5YigTViAn
         ht6ubYlGpbYtVe2mhxDOnhtvnq+CEZQSNNHIS6BjNxhMiRwiDS9g7No5SCGh8aEGGwXA
         PFja/t9yOVIoK3OH0Bbt/arT4n9q3NOqcWas3P2fGWLAUo7PTp6M+WKdXs50UL/dZWy0
         6ztgwXhdfpO9GE3kU8kkmqoeyxPo9p03DCl2rP+zMVw6dbvOgjEXHsVK6Eez6KziduRk
         uV9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788537824; x=1789142624;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ubYpczf2GYl/yIKlMJT3YPKv2d7IuBc85zxyY8MBcf0=;
        b=Hc6ZSlTncU1AV+sHW2X/0fEYrjuhEFT1CbFfK/7MnfMzV8NPTyr2YPcbaYpPKaptWa
         hMoiVPG6ZpkhePtMFNbq0za2S954nTsEuM4UasxYkizhpQ1GbCDV9l9UXNd8lBehNFxH
         Im1sIGTbZ7y/j214dwMB7wp5dRaIJxqfSE5CjYIeHGJk4+bRaoipSWA4stlrjwwoRJFz
         LaQz8/FToLbOi0rHPq/mYikONWbQZ3gU4QZVhPQJ18h4NHfaP2J93Wohr22nEuX9HFmu
         IOEElLqgkjZihXsbsI/GRdLsIT/KQREqVePJkSvfYmFwSA/SY0pBRUjvGAZa7N5ouOwD
         EKng==
X-Forwarded-Encrypted: i=1; AKwUvBzawug62ol3Q+YEU/JU3zhfovq+HVIR8GJmPBW3P3xyEuKK/gtji8Scat8S2bH1GKyx/zmKKJFOabImnG4=@vger.kernel.org
X-Gm-Message-State: AFuF++kPYmuTjo/KtDb2+ouZPysSjT46wRLiL64T8HqBp/rdw0yK2JWs
	t+oDGAxEFz/lzwnGWwaozkjaNTUz2KLMzmNQmLmP5fhPruO+97CiOnIi39PDnYwDinqLM6/6HVJ
	rlewlJSqGjO0cND+NRVIC7Id3+uR8LglXuExCCL8Ujk9g9Gm6iEmkcHHSiALzv1/c2Wg=
X-Gm-Gg: AYBFou3oSdjZcwXOvldLArq5N/y5AUuMok+z4pU9MOXT538D9yab5iy7cWewUXHO+35
	SDPXFWS4pxXI2jtw3KJ5UumTm6Co+pR7AX+oGPt9yTLL1cSEXREF68AKdmNQjNK37Jr/nSmi23J
	eQqC4YXY3yaGz73SJMcjzB4IXIu7S0a+JjhzwlL6xC8ZUGJWZHDENWCA+oCiJa42UuRw+kqKQgt
	/g6N8cNV/QwYBTyGg6JRLpqMlPQM5UUiYb0h1bWNLKLGuotALQlBGFRNPI4i/jTVKTQrqeetsyN
	aF+kcbwN90NQQPt1qfGp8SSGIP/6kSPCCk7QAR1/0HGSOOa3ZrkAIBl1pkMpUKd+T+piExK6fvg
	PpnVUZ2AyPw105Zc4e0hbiaz2CDZG
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5568049a34.0.1788537824553;
        Fri, 04 Sep 2026 09:03:44 -0700 (PDT)
X-Received: by 2002:a05:6830:82e1:b0:7e9:dd7f:7a83 with SMTP id 46e09a7af769-7fa1b1e535amr5567922a34.0.1788537823727;
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Received: from [192.168.1.11] ([103.211.19.21])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6793f53sm3195659a34.6.2026.09.04.09.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:03:43 -0700 (PDT)
Message-ID: <65c956d1-eadf-4bdb-bd66-0530421fda0f@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 21:33:36 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/13] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
 <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-7-dc81d85b599d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfXzWoHlbZjDGHY
 SthQUM503mt2JSSvCb/6H8WZbvW5+GZd6n94U+MTJv5aItFZKsbVwFuSkYeglo1qxmTix7aWiE7
 EeAFpGvaTmg7JKCEqVUdyG970uW9OFhPKi8U6pXGGpyb5ASACbXBMje5bhjv1jJhpk42AVQDp0i
 HhvfC9VdoRDKkFCScolHksiBHqKQhurAasG2UJBaLYQ20zR7RYqmrRT8/aS0aZlcRWUeYYhx1dY
 ERXtq4LjsO+zX21GTQuLDJ3YkD5sJ/h33OxTXsDeiDnBKO+LfBr/9wdZb3R2rue0XfBntuzZMj2
 dF+N2N0UETad0JAuLjpVk2oC09Tox+01TzeSCPpEZQB2KAw0MiDJzp1yilHRGcl+hsDxxxbO4rl
 4XB/hKuqHkiwnXbKh+US2mRCoKJTbqtTgETpZr8P2ximcpBfcaqUx+YinLR8431e/8GqZAHpQNG
 XKaEbJGMLZJa1ongkBg==
X-Proofpoint-GUID: myJSVV9iD87UFysSZDHtD32cETRdWDCc
X-Proofpoint-ORIG-GUID: myJSVV9iD87UFysSZDHtD32cETRdWDCc
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0NiBTYWx0ZWRfX0gS9d6+GbwBS
 pbkdOTx1QS/GWg4w4svvL5LEkq4BoWRf0zo5NEaut9lgsLnY7A9xIN70ZuvrYrAAsT6U0EMiDPI
 MWgQ63xuYcRZYtIgv9UmVjJQqtd8DKM=
X-Authority-Analysis: v=2.4 cv=Ibi3n2qa c=1 sm=1 tr=0 ts=6a9aebe1 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=UQytLGTC8N96CC/hvWkJ6g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=sbdT_ZAiYm_QAtLiiUQA:9 a=QEXdDO2ut3YA:10 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040146



On 04-09-2026 16:26, Bryan O'Donoghue wrote:
> +		port@3 {
> +			camss_csiphy4_inep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy4_out_ep>;
> +			};
Hi Bryan,

camss_csiphy4_inep has data-lanes = <0 1 2 3> and csiphy4_in_ep on the
same physical link has data-lanes = <1 2 3 4>.

Shouldn't both endpoints have the same lane numbering?

---
Regards,
Nihal Kumar Gupta
