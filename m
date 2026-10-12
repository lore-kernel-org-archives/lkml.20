Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB9E4AA578
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820363; cv=none; b=ED41ccIBJ99uuUgMTCh4nOolbzgP6MZXxzKn1hw8qIaC6aB3Jv4FMupfcjNfeWT7gLcp2RmNqoECcLBSA5gTe0jDaqZj0qeigLySwivaJyv59tAyrawndUSDge8AGDaKT8bbiQY2qXeVDHMZN/NMix/0h1sp+XAfCBnNX/cH/9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820363; c=relaxed/simple;
	bh=s/Mbf0x0sIgUm6VG+i/AMdI84Hw7nY61I9jfRK0CkHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zcx1kHFjttWoZ1yy7aFFaHq/yKbxvg+ohPw9k5GeQLIyl1OeeKwnb4mJXd4ZgazBXvjpknmJuHeS/vwsCY3e8BrIiA/xtl3ck8Kj0Jd+td1QAIUwz5Xfg6/vdH5emN07xCQN9vckkcfr2IYl0+8Au1kFBSk9eH24y78fxohc5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GWPxwrMk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/6L85bF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GWPxwrMk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/6L85bF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CFex0E3851370
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=; b=GWPxwrMkEjVUKxlK
	L/k+OZcFrykZB4BugiKn/ftBWMLJxY3lDlLVBKvBfcA6laNZ+QN78Wv1irHgeELQ
	o1BLycTd6TlWuueXF29YsnTdErn1JyLC15BS7RmslSesQ7LwNED2b2uA7NoVR3pK
	eWYyAye6DQ5H8/8TMAF9P68gxi+8S3cfvx67wQotTy/wmZsO+87Ld5kEUtU5NP4c
	zMi5CYMiIbqlv5xWMF+oiRQ0ggXN9CM3MTjPiAtyiDVSEugbVYSpO2mEOsq9y+tf
	yLxVOc3ZVfHMeTdWSLwShG1FmW5VVggoNP5do+QsUnsd1uOj0XEOD2u6LAswMidJ
	hd0liA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdr9h6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:52:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso22520685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791820361; x=1792425161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=h/6L85bFg0W3f1vjDgQ9LqdGvD+vt3bTEyKDfzzCMYD09Jmu9h9KPnz+US2vBacBIV
         wmHX50ZgiqIjOcefwUuXMte8xnllF5WzZbrX+muTz3iIr1N39Q1RtfsRyf7YHLDdm/fU
         PsCrnVBBdZaeGfZqbtLpAtqqJLQkuxd0mLq4508DZb5+WcASsPlkdXlEO1p5Y4K0MO2L
         9jhU9HCpTN++jtXelrW0zuYW0S9E0Z1uc6niYJRv/D7mmEv9IMTVajwNe+5PckHmC4pI
         ocfWSJb24iDYoyYVARDJdQlSrN5WhObBUl2X80taSVkP69mm9JhefCBTYMxmjU2+C0vG
         L+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820361; x=1792425161;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPlb/6FP/XOC0zbZ9c/es8B3def34aaz5lIhTTHLCRc=;
        b=NJQPlU/DkC0PILu7ZEqXxI8W7kD9hmKrjDVdy7SLn2U5nhZAIh/ZnzaH1OKb/mFcs+
         8Uz5bCZCzrLVnweJAowfXkF9gKHAldinINAuT8Oz+dH4/hVjJU7+BZydsYDDApkhMTHs
         7IH3UfqTpjM9yA5FICpb7/lPPZ9URGPmtkmr3HkmOr6UrNIaUvs9upPwom0Aj+o+t9hr
         zhUvUzD9lTAABrQ4mv9dh/WYOKtlvFaraxXyv2x6RSfcdVL8MgGfrNrVfZxsaf5tazuI
         gqbhUYNso++RpO0RzXcNTBGmEZ0Mb1+QpbmUDRI8eshtiBbIBosFHW9i9iGEVKvMueBF
         UYHQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLl7WmsLEvRagWfjUfPL7SrKa+oxUn0eNqmWoCyv+RE9qDAcNz7ONor2211Rmw0zzahMi+92ba9XhkdKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJE9wmPoHESiT+q+P77ZiCe9ExDMzxoaxov/NYZOnHLUNXPU3/f
	/VlJan0ltBxUeaCTK4m+cjcMXTWzroSLWD8pllUwFYeOihHsqs84dQ5DdGbS5VgAk9LJ/kcWaOd
	8GX0ZlOaVLbL4B3HbGfOL1afBC+LeteNQuoCTW+QqIDFuMD3DOZpXoCZNhc9EPawPGQ4=
X-Gm-Gg: AYBFou3ql2us35ewIR8XiQxsBaxRlK7I+MDMOsrch3hTVziW3Ft0+bKlWqPay7xCKvK
	RCqW28ChEIzHynB0NPCKKPQZRohmMdckqEiZsh76lC0l/B30efPOVtHezJw3zOU0ADqvtP8EDo+
	T7GY+KM5kIuwv1HE+9flbfWzYeLApsypDH/XR22sOvcwKVvWQtxFOqYM2Rj855Q0zJdNzEqFGGV
	o7quF9R4PlOxeoRD9Aeyqst1P5O7Iq4QES5d46aJu86ha/lQtmvzF9T7hP17JdurrsGD5QR1i7V
	k4TkDsgjN431TrBhuE6Cc1v0bubGpa1o6l2x2AMRYpLkMLcDDIT8XRIcCY39Ij0dlE+uzjEGAiZ
	pjG7Cn5sl/P7hdAEioejxkw==
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1908146085a.4.1791820361097;
        Mon, 12 Oct 2026 08:52:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4613:b0:939:c7d1:7471 with SMTP id af79cd13be357-93ebd228f1cmr1908142185a.4.1791820360671;
        Mon, 12 Oct 2026 08:52:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3bbc9sm480313466b.20.2026.10.12.08.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:52:39 -0700 (PDT)
Message-ID: <339c25f3-72f6-456d-906c-a6baf37257a0@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:52:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 38/38] arm: dts: qcom: sdx65: Align multiple property data
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <d0585f480c491b5d58d7f73a7f4429fb4e35f67b.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX3JYDn2do3aGI
 3ZFLmwcerIEPeCMuYGsqCAciAupHq0p5n/wlPbAdMAm/4tZwnukIyhvrZH70NFECEIoiNcGRlWQ
 Yeswk8kl1Kwhzk2GFVWBgIUs70ZSyPu1HwG8J64qgp3K99+0b5G3/9phR1TSkyKyfH6mYT3ep2N
 bu9j8Mjz4FhAj0s5hORge15w1+DIGl8YZ6epc2v9VK557Rs9LoA1WMiyWNBnLs05/4hbO4R7uby
 3QamgGtdX8WwAdGqlwJsOJcHn73jbY9AtVf/wJbFnSs/rF/HsAv626jJ4wLTTsiR4fbN1D1rDEQ
 eWiyRrvcnBrIJawFZxC+F/jcl+GOWgGqVkmyaUJ+nTEYtXYqCk9XVMeCwAS88jfUr+la/c/+qPb
 7N904ejFSfyrfGM9sJOyU12uO6r95e7K0MPYAXHaqfpv0VxHTHAGi+54J/n62zfDY7Dtnrz21Th
 JjWEey/kqmetp1K5CqA==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd024a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=Bz_mBq91WImKixDMOFkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MyBTYWx0ZWRfX3A7HrWE22jN1
 Yx8lnIZeT1g/xxT+uv6nA018dVrO1SYS2eAeW6zlLy57iGkHneSu9rtk/wcqtcRta0FMk2BmZx6
 wTeneuuvnZmxAXZvDTrCeIIKJkvESic=
X-Proofpoint-ORIG-GUID: 8Y6zOVbgIdq2w_9A2ZqQIUh9BaIu7Sqs
X-Proofpoint-GUID: 8Y6zOVbgIdq2w_9A2ZqQIUh9BaIu7Sqs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120063

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Multiple property data on a newline should be aligned with the first
> one. Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
