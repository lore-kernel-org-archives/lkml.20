Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389AB420E89
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155247; cv=none; b=gTIq/sXgk5Df5cgC+je5IgvCdwdtxyGZaLlJMoR3XDax7z05fMmPM67/ugCk2SICADLbzCd5Z26t3val7e/IqEEdZFXpljreh7jLhqOG9ILf+ppvIfrey1kWxtJBTzTLNb8jJkGxkwpOIK9vqZP0ZIVHXjJ2BjMxrgu3swUA5/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155247; c=relaxed/simple;
	bh=agnKGDj9D/11ohWIAcMyJ9cAJeGIGPxxPTv4jH0y31U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ew08bVuOCNrK3qVLyzLHXCklmYjX03A5AlWqh0JipBZ/EDLX1TEmWC3ElbUoOOExd0JzJTwzDbZrdc+SSvbVTatHj2fruJp74JvX1ye1lL9fzO3MaC/rBUJl7HU0NvwzB5QD2UCkt6v1M2Xm5iL3suysVEN8UlK7kfovxDUswWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TKazVqn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6fLcB+6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TKazVqn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6fLcB+6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAA0Mp942520
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbaygPj1foUfq7XQq4qIhZBp1hiwUcPnKN9f7a+bhbk=; b=TKazVqn7RnIjs6ou
	NMs6ieCixC3sPlkI05ujT0rlEnWQ61HzgmlN7hMoldxL2xmKdHjdUF5tOnrGiu20
	PsXpOAFbpIunQFMYrmQnn/wI24YCXXnhXwffUvwU1GriB3pl+YCC+f+rU0ZtWlvr
	Naz9C2uKdkBOCWIgt4hbgVYCtVBgaVnJV3RS7HOVhHBFGb2CHeFBhh5LDsdToc4A
	Qb2tPKrvfHxfVsfoYiMEwF0EJz+OJio0eAU3xoXDNQRpS8/1WNMmXpk72qDv1Sg6
	E9+Yt2bT4XKXZiTsvDY6MfyYsdrWrIj1Wl/WTnhztUQUEC9E1jtS8K0f3HnzEway
	C4RA7w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbhur0j9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:54:04 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35cbea41088so4645668eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155243; x=1792760043; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbaygPj1foUfq7XQq4qIhZBp1hiwUcPnKN9f7a+bhbk=;
        b=Z6fLcB+6FKccSaAp6h0uG9FJHOiL0OTmcSo/cp8+QWuGeuivHrFXvvO3X0OGDY3snB
         1JUgCRTpDEL7KxFwGAjMZRRVtaX7jH1TE+GAlIHF2zg9JJyb3tQyDyRVukO+K6b+mBOO
         DWTX3foLmV/8d1mN0weuuR572qQPJCvCmyFHulvYBcUjlH6enz5I0aM0v5jkYosbTTQj
         cKfvicIkh80bemZpmiDtOglAkxQKlcA7vmcKDyNP/rCw9XrxYZt/fjmNJwMi6TDPaFsG
         kHQiadQRLK+sXEhEekcElzyqVw6UCQbNBnAc8WJkq5xOTsnbu28fQqpJAc6N6Nytiuzt
         HQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155243; x=1792760043;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbaygPj1foUfq7XQq4qIhZBp1hiwUcPnKN9f7a+bhbk=;
        b=xqDer7hD+RICQHpD+5IAK/r3lOIn1penW7q4RTcI+XYDYyCNtEXEc/cdwqY6EO6CJo
         miDtu30N4lZkLxBpaVDiIbc6AE8xHR+/XFeChsN6z9g9/FbiU2YxrJfApu3HtkyKDKpG
         M7upKoDfGdnKkQgDysoMjjvZtOY6m3mY8SgBBRhlaUdEfoJGO6/5a9TIyXNsI2VrhUlQ
         v1EqaC4a5awy+vfDCWrTAlzxEEqPGkZhvndKPmbc0KbU/bR+2j/udSTYWCZ/R2FffErW
         RuhAFzQkNiY6HEGcdUeAuacbsiGyvwlGGKb5ZLgwUaSUgzZ70Wx4LPJXd0BQQ6QSQAlw
         Wm7Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlMx4abqRjqQhDdoluiprRhpNFbNcw/YkmMCRHsg07oRT4gj9do4M4G92msTYVLnPjYF+jn3L6HyabljA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKjBrkmsV8VEVvAOpQV5Rj49dRPPjrOGKVjs5fEycd7N/MWkLCw
	KnRzIn9Pr5oW5E9jF5+A+WTxE3pSkvRWXU50e5ZXmGmyTZiS48wLltpgqjksiYf4dp/J6kIzWXi
	ulComqHZWwWHglmADcQ5J6t1dPSDHcl/19YGr3fnNDyNw7FLg+P3xQ+AzGaVnMZ8XtOw=
X-Gm-Gg: AYBFou0ypUjOm1wINiT73IndwYvVGLZ4n8/T5lI0lheDaI5CD6sQMNlf03zlbm76nyZ
	+I9sNgDkSuM/WK4XbWAvI7by+FJ78XspwPlYWtT5IPmxOVVFr+ZmwSAtO7anu9cbQG9WS7ge6qj
	Sy7VBZ4eKfvjHwEJtSho9Tl3YBcoyksuLiPHbi7rBqCFeZPkHLrA3HTxF1b9ibmX/M+YMGqrVRG
	WPlPyr51qWHhm0rbKK3obZcfGRG5us2JYDVVl2yWw2gt3gQAqlm0t+IctJHMoaBtCKpKEVxHnEk
	+Ir1tjK08uu4Pj7om1pWyYCe9VhVRp+ZPEyDqqWW+ETfBdVv1nmmxoxKl2OAcnn8iLTe2aXr5hB
	wPOaqpNKQOi6Top/HeOn9pOU4sy43Jw==
X-Received: by 2002:a05:701b:2914:b0:174:7d98:fe9b with SMTP id a92af1059eb24-1747d99019bmr18067737c88.22.1792155243214;
        Fri, 16 Oct 2026 05:54:03 -0700 (PDT)
X-Received: by 2002:a05:701b:2914:b0:174:7d98:fe9b with SMTP id a92af1059eb24-1747d99019bmr18067699c88.22.1792155242548;
        Fri, 16 Oct 2026 05:54:02 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa3ebsm5344485c88.8.2026.10.16.05.53.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:54:02 -0700 (PDT)
Message-ID: <edaa8679-63a6-45b8-9e36-c04740f20332@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:23:55 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] tee: qcomtee: Track the object invocation context
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-1-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-1-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXzufp/p2yBIi/
 BdRVtLLr6dgW5knlw6txfIfdxW4j1NhI7zRO0fAVuePt6vVZT9b648AM2zZYGhKm0X4Q+SqRxGb
 5vV1QL86t3BF1SjhrExrhL6G8CZ08g1bx+/LWAFYP8YU7To+9XG6Cu2BxmMl0FMgyh5710HJ7hZ
 zXqvC1d4PYIczXTTWjnXiNsyMRkYjm2L2TtKETVY+6hSI4C5Ye8u+IbwJOTQuWXxMMFbK1lHIIq
 1JFZ9HAIDAA9zXQHk59t2wA7sIHR03cPfnSAbK9ce1aAizVjKRwiMU+gE+VJtv0cYv1UmXyMe43
 vwHnAbnPBXjkfWg7OBOSu2ppUTJpRvaBC4ojH0f2Fh91GDbmJNMt7WpG9Bv9/WxHg2+Eb48+v6E
 xOmtqXBUHQj/j6ZeySMcfx0jjUsBf3uafJwCfwuYSnHXOlhRZ2M9eE6eUHyXKON0a4tZeVAahSc
 SfQGkduOc+fstJN1BlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfXzG/612sgpP70
 eaz75YwpyWxTaoRFJ4n5fxEECJny+Hxk2QA/lEMpx5lg1wyxDLXtSuqneLmYIpXbk6Nkge59ImE
 AJofVn+OuUWdURyPAoQAoY1QsYsIzag=
X-Authority-Analysis: v=2.4 cv=PqsG/AM3 c=1 sm=1 tr=0 ts=6ad21e6c cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=wUKrATpdGnaYG2FsxpQA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: lm9WHM1G3fIZfqefbhgVWYx5MRYzTnu7
X-Proofpoint-GUID: lm9WHM1G3fIZfqefbhgVWYx5MRYzTnu7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> QCOMTEE needs to distinguish between object invocations arriving from
> kernel clients and user-space clients in order to correctly marshal
> UBUF parameters and decide whether certain operations should be permitted.
> 
> Introduce an enum tee_object_invoke_origin to allow clients to indicate
> the context of the TEE object invocation, and add a kernel_ctx flag to the
> QCOMTEE context so the TEE back-end can track it.
> 
> Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Reviewed-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

