Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A664734E2
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339838; cv=none; b=Z0qRyeeOh2XFs5aLWYEZG+eJlw9mby52/J3uFK6IxBm6w5n+UKPHv1ohukJ5UdYQo9DoYOH+VWG8TuU53wOoqAaFEc+HZZNAjtCU1aX/0RHoOqKYWPawFrZ5aVln0vPGBeucGfqkbWKjqhRc0cP8W9cb9YfznhoeFwPfCcVINxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339838; c=relaxed/simple;
	bh=EZrKxFuUrKcysC2lcS+EOmwh/dit0l/aQxjisyRbcvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOStT6m1hO6LixVVAza5gFHanlalJuOrXu02XXVPIDyBomVTBVQGU8vi44JaamcWtIYwDHCZdOWlMHLTfTgw8h41xWhUIaJk4LJ71bqR9zQG9O7PuvZLI2fk8gDnz9xpk91LUyySS4hErLFDxe1cO682jIM9bslqWINzwm30dh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iuaIiTg6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbIg9hjA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iuaIiTg6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbIg9hjA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YX3m2911727
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4UGfyw5PRHKpgZ2uPULbQrSRxSePsNqoHTtdsl23lAA=; b=iuaIiTg60X+ABmQh
	OwtQ1NIhuwipUYuxL4J+Zp6cihSCyXLZgZXgeSVV4Nrpp/Rh/evzorgNMkpkS5nM
	VlrclRaZX9iinKZRsqwSk3owea6oM/EIzxW7Tp+Ya9INrHk88b0jnWtYaYw0mIln
	LvFjYCkyG/a+8i0m2ebO/OAcnxqGyfJe4wKfQYr4kACSKD6Rc+QHpC3WzDFrkU0a
	taDWDnn2kIc8q5RIdgN3JMktznsOFcDnxGri6uOtyKnKYvfdSODZVRJTcLDehW51
	DTHmx18V7SPUrX2cQXbG3o6671NY4x35NOyGRICJ05AqM1lb4b92sysNAvzYt324
	tmhCYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwhm51gr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:37:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9392788b3f8so6938185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790339836; x=1790944636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4UGfyw5PRHKpgZ2uPULbQrSRxSePsNqoHTtdsl23lAA=;
        b=cbIg9hjAdWhHldbrgw1anR43PrxFUP1dQQOJskf6jaJ0UY4l3EKNWGQpALrjmdC1Bq
         HdZKcBXML9hcIhLBgmyLuL+akpJ7xRPpRJunIBUt5q89jwIS1mJYnH4TIgDdqnqLJmeb
         tita9ldXgh2j/EqTdHLy57uP6eNx5WAQbPnXz2YVR1q1PHkVlipTjAqG0CD20DoWZR8N
         XfkcED9DUd0JEWVpdsMIlvvTIT3Yl0+1fgbHEkak+t8B0pXlCMMFUxP+YJLOEmoWjIWf
         X70uZ8XO9IlX5IdYsEoCt19SkzaEaPNWLqS6RceE5VkxLsgfLAqhsUrFQZEG6DisefZz
         RwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339836; x=1790944636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4UGfyw5PRHKpgZ2uPULbQrSRxSePsNqoHTtdsl23lAA=;
        b=lEznrgwsEUjn9i5pfviV26in3p/Aw8hwoK+XEHkquHC20L3vZ7km7TbINPjVvtoqs0
         aNlpeuQ1/TBpMCRxWbklhrJTXW1yCVhJA73USLR2CejekAcqsBvdBJbo7O1SVfgVOq8/
         Eo6bJjuG4fZK2RM3pjktt/7UL7r1YL9cwGEy4dck18WnuBHs4SuxCTRH8NKzy2741zrn
         6YSbhAvTS6NFYSe8vFuCxNlzChMdsXnKYEVlJ5v693eVYp9xD3yXiuYdgOf2ZySzeV3y
         cv2Kj3zipseVEQXPNjQDsIgZBeSJD5ZoBIj6Cb4ngzbA0s3LQmA3zm0L3KHXjk6AyjRs
         IKzw==
X-Forwarded-Encrypted: i=1; AKwUvByzmKtFvSQtDsyi3n4RonahTFkOUJKG9lAWZEyWllQxyEZ02a/2MyRTDaddOIyLMdIXRAV7kzM3ZqlaApQ=@vger.kernel.org
X-Gm-Message-State: AFuF++noPa75ho+k3swYMisouIjuKvxIGbOdw9HFBQ89r4x4bIn31ids
	IwPT4p9cP4MnT/aXCjwDxMPcP+hu56uKYIrI3qAfTitmZRuGYGi4+6VSqpPI37iG9+futh03sZf
	peosru3qb4mGAypLyr9UURyEp47Gv6xEnYJZ/lg4Sm7zdsC1ri1L8JjD4qT73kmTMVtU=
X-Gm-Gg: AYBFou3uLN+H1zdxIlxJF8kxstb6YDW/yZ/9qWGopWSo5hi2967fUMoCmk6ajINvbg0
	Z3i9w9UbsZnSekNYZXsw/PaCxUnF3CwwgtNZnatH3af3DvCmPA5HMP3RWv0JMmf0FBSXR26J5nV
	E+ediKf7uur+uNqru6Z8uVca3mrplOj61Rg4ufDOPy8XJ7WaWcUg47eA2KT6VriL0BZ2lDnrOjN
	uh/OvIjEmA/iJiuap9zcSS7npfc3KZpdXKCDgHj9S2SiZKxI74mdJub8wHLe9/+v3aVYaVJ+oXl
	U4omkuK3t6ag5yQOdGJxWPxSbmT8oa4FD66XabMBc47HfjIc92Z4dEAk+91B2ao8ObcajlUgW1b
	I/BOgXVjPAzDvGAOZES0DeA==
X-Received: by 2002:a05:620a:468f:b0:93b:c6ec:780d with SMTP id af79cd13be357-93c43dd5b7emr388013485a.5.1790339835834;
        Fri, 25 Sep 2026 05:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:468f:b0:93b:c6ec:780d with SMTP id af79cd13be357-93c43dd5b7emr388008985a.5.1790339835365;
        Fri, 25 Sep 2026 05:37:15 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm105785766b.32.2026.09.25.05.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:37:14 -0700 (PDT)
Message-ID: <fe383ad4-8c0c-4f20-aa53-3e732114ac66@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:37:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260924-nord-gpi-dts-v3-0-74a85134699f@oss.qualcomm.com>
 <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260924-nord-gpi-dts-v3-1-74a85134699f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uv6dZU1VyJWkh-VOo3BQWH0DZLvwbLXy
X-Authority-Analysis: v=2.4 cv=QYnzLcbv c=1 sm=1 tr=0 ts=6ab66afc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX9hG3t8ZQbZ7K
 51nn9qGHJQ3ETj75D+fA4LqAFM8VmJ4aABbDDVK1NF/dt1c63aoagcVpWQBxG34wBeqr8WQ1AYp
 y2mmx5KoTYcJEotI9/OKGDxCoaOZRfojZ7VncKbyLjuqUrBKksNvVORmjpQp/94F0SV1jFUsT/5
 Wzn3ZIjrkbg0cSNYNGzbGykEaZjuUZgv7wlSkLx+QY1zWmP9M53WiWCmZauLSFe04NsMSF0FpKd
 TbF+sUxaTGU2DSy11/F2GK6A6Mc6y4qhRKHPZHg0gGsoJhML+93HufHKSKVxOZQVmNThKrS5b0j
 /ZvS2TMXIz3rB3FU2wLmwr2UlOrGHZ0Ntj9dts9ZJru5jme/UxH7SrDlxSe73wvZbmZfVMPeSwS
 bzjP79KatWS5wviSSn5b+kcs8orLOxQ0AF5a8k1joo58fw1ZVXShrnZZGA6aZFVrpQ2SnXa5OTQ
 DG7ShEuBdCWaTMmvxsw==
X-Proofpoint-ORIG-GUID: uv6dZU1VyJWkh-VOo3BQWH0DZLvwbLXy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MCBTYWx0ZWRfX51E/rox49eH4
 7vWZkCYDKq21QP3BsngTt0+6Q0ko2ZoMBbWcGbAsdMnADps8gQTsrYYF7txC2cINVy5KacTh/aS
 g2o/s7vP801aBjA5edwy5rdDFXpNmio=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250050

On 9/24/26 2:10 PM, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
