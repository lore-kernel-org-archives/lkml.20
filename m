Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9A842123F
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792141424; cv=none; b=cto2oHZq+qzju4tl6prbJYzJ6H097K049napXm0l6DGr7ZGuu31Etl2q8XloVFYE7NP4tNXOxYzMxyn8yXsx3Ei5+4i7mTmL7sl4jRgCEHTfyrYE0Wxd1FNbzcq7QWUJ8iPvNUzPBzCtpKtFOCCE/ydW5+dAb6hicR7hLIFWvl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792141424; c=relaxed/simple;
	bh=rRGP1hWP1Zq3f3a2NEkF6lXMJMr8GEujcVMurAZBXWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/SUBs7JQ/Gl9+EmxXfwxv6GV2j1SEm84DUXjDwVp4TbiHmYCNzKmU9+G4Un5+CrS4YYGdVhU14SOnuYGwuHJ0QK9ktCufN8JgnBuCJ+O4NSbNVqCjV4RkfN7L6qfiXWUMPe+raw4jUm3BqySKux8mPNy1+Gt+OKnqNh1dhT+jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I6oI6/+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLvkp8sm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I6oI6/+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLvkp8sm"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lCmu1761417
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gsGzyFaiwGcO1pe9AnLoE33D
	r3s8FnQnCBvAQ/pIw/o=; b=I6oI6/+JlzLIx5B4VD7OiMtbUh3+BiIDu2gYH3Wt
	4gjL1+2EfR/PlYNd4D44BprkIrAGpS9etnU4z0trf3NTJQof41gEWcDKbw5QqI7Y
	sOhS2vJ0Z7OxsOVxKddOC3u6K7YUEk6kR8H3MXLj6CR5me3ymDnOPZ4nPzDFpPTU
	tI8K54sroOzMQ+qGLHaYKZsmUeue4ADJocZwT95lFmqcRVXVqxrusGjXxaYZ0Jlx
	XJAvTlTWg9ToCiJ4yP/RlYjgevdqaK3WTdMHwxdZpUU9dcF0Ry72ud4/1Oe6Nv7N
	VHJcFPGPkdKlgFZA2uYHgGSq5LB7NvgsjosdvBNb/+XP7A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yr6pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:03:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a3f673221so1858199585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792141421; x=1792746221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsGzyFaiwGcO1pe9AnLoE33Dr3s8FnQnCBvAQ/pIw/o=;
        b=ZLvkp8smdaGHbIQXHyZ5cZpWQgH8OmnPT3Mb/pxb897FUGDgzo9gpIlmpNbaxqWUnL
         CUW9awRVvjVSRHPM57fFg56UINInKvypIVoPkjCdDHepgju1NA5UOrVEcjTemmrNTQUb
         O38iun3Eax+zWZI+iOPFyr7QaTzKmIjFGH1+UChjmBBeS0XH8/Fc3HuB67PwDpV0wmau
         YG16QrPvuUvHrHcI/2i1Ty1ZA91zOqZlYpD8HihaYxQDmfAy/FOK6ud5J6rnR3wOjDBv
         xy68QW5Gvixqzm0ajPAF6pwjVDnFVyHfLT6pLDXZ9/WCSnKRARc5PlaMR9FbvOAvY0Ur
         jiEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141421; x=1792746221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsGzyFaiwGcO1pe9AnLoE33Dr3s8FnQnCBvAQ/pIw/o=;
        b=jkln07ZwvVV4lKKfVCdwE++aD8QpQrTLMQnDbH7/ZbDp5lx9+zvmqsiFts3ubqZLKh
         EKznKttDF8uP3x0kGMY9DC76t9nAeuq3q1Mj1awu/gXwqznXpTR1Dwt2FOTLzDwuiON7
         6SYy27G04qH6d8LVXztW6WaVx4gjzD3CTnVf+PSMlrejBuAqFTkx1tlhopNQ+5UfEkEZ
         1xOvk4CEpU2kFBbzQFwzcITJdUkat/o+jBOwpHyxHOr1AfAZiMTVM0mjwWZvBGPn66W5
         XuW6vLj3xuLH7zbBhfhFHZbdEboN+3La9ZvMZ/HKSU1ObT3QGBiOEH0GewJkR40A8uwD
         Z0Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwuhZ3yvESSGw9C/SqJR1vliMrV97Oop/kKLuQajAXO2to/ZPoyXK/aAVdb1za0T7tu5ppMchFkYpB+Im0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2qIhB9cnPYAj4+nsLGxK9omLm48kYFeDPYCB8zMYuJwOk5Sp9
	ZfAK7+OA653m2OskfVpz5CL0kbIWof3MvZqPO+Bl+ia3Dez4IkH0DWtj/e0QY9osmS9jFidei7s
	QnwSNPePKXD2mfcIRdgZuqnRroIdf1GWX2KZ1WE6OUt5WQUFsOH5A6P1Vh+ALjqEYMi6LTK1EBZ
	o=
X-Gm-Gg: AYBFou1S8Skdba9auU6QO+uGOoHvxRTqMFEdz+jTgHxFpnFpgkLbYhJj74GiH/8iKhX
	m/01BYnewX97CZRRXf1JqNRry66fKjUnIb0n1JKNPfhjkGhXSBvF0UZmX6k5CZVtcyIxoxWribM
	Pbw2MR+XJLiG1Q7f+68V41MiamOmh03Lnk6Q0SDK8hqlTW8q9HSBVBkAFYxJEM6ysgTnrcFu+zE
	a+Atzeo+GeGFuP1Y1KKSnA6R6f6iW9J0HTqSLjanPyyRYpe6CUQP8BFblvE0S/YtCvkkGko3F47
	nJj90jJQ3VYNEmCayjUfXEZGMow5ecZDW0iZf9AlGe7Qy2Z/HmUFAbi/VEabATQ/Flb1U9CuwCB
	OzxHazqQO6/ZkYQYV
X-Received: by 2002:a05:620a:199e:b0:93f:1f22:9698 with SMTP id af79cd13be357-93f1f229f30mr112584685a.28.1792141420603;
        Fri, 16 Oct 2026 02:03:40 -0700 (PDT)
X-Received: by 2002:a05:620a:199e:b0:93f:1f22:9698 with SMTP id af79cd13be357-93f1f229f30mr112579085a.28.1792141419788;
        Fri, 16 Oct 2026 02:03:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm3205109f8f.1.2026.10.16.02.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:03:38 -0700 (PDT)
Date: Fri, 16 Oct 2026 12:03:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: nord: Enable SoCCP on
 Ride-Embedded board
Message-ID: <7swyl4774at5ntcttwd4vpshabwg4rlg5ykhl4spk7lj6d74d4@jac75gglzivl>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016-nord-soccp-dt-v1-3-ee13aef55d8b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y8psI4LkJcVY2-SG3Vg8FrgPeIlLXXSq
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1e86d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Pl5ZWcywM73K_Xcq8j0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX0lI3ukhds7GA
 8aew/SKF8HzS0jL9o5zfjjynK2dsIa9wZjbzkTQEWfdT9Tl1cVbeEoWAiXn4R0wvjUJWgpIDLG4
 eisJUJQcN8PnW19mvjSBim5RLO/TMec=
X-Proofpoint-GUID: Y8psI4LkJcVY2-SG3Vg8FrgPeIlLXXSq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX+CWQAedtRBah
 MdYOihjEGsERyuPBlzrKT3LhXnfIwnD8EOmCspe6zE27OkmYVmFIp2/SO4/RrnTWkizjeA64O+7
 jDB/0BSB4JoKL01D+go+EqtFXRJrd8sQ3BfRkXHTIHKoTnDta5g3PGn0g+hKuaeTxpbCPiQbTun
 SwDiCqiG6VMth4BhB1HUEAY/ZFfCEKdaChBRZZTLro7tPPlYxStGvLum81+3G3JGW5xCmR2yjPo
 kCGbhg/ujvtPmr3Th/Hkz121JwxHR7z1yXhW6wo+nHeTnHLHUsLtdQITKUWOxPxtFbVj48rRtL2
 yV/VbVkDtR8R55CTeQ1dYPKUIUYWkd6qdFdD54+FKn0AX/DNtfeSybYW1mwkE6YgLDlBZYACiMp
 WEtgnuX7ISbLWqLK/upLiRiWA0QbGyHSDT3cCnNc5rd11L+X4gyBZnRV1EMczF6bNrCgA4xbt+w
 c/l8Cc7dx7oagHfYxaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 26-10-16 11:09:56, Anurag Pateriya wrote:
> Enable the SoCCP remoteproc node with its firmware path on the Nord
> Ride Embedded board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
