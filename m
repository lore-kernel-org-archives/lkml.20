Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099040;
	b=Ak7+AYqyse4+Q39r8efz/u3BUO51Feev6oNXG+ktPoOqw9g+eGLT9USkyRb4snyk6wpX
	 sxGmKT0Ex4bKgUvebTEDzgT5elMF98uFzHYs8o4zklnTVXyqhIvd8RkbQkIBx/LgjxeOY
	 GnA3dLqkkldTvqUQNcPZDmISRUo4mTC1LuWxmD3oRvMPOisx/qNoQrgZMkF+8xUYUGrQX
	 oD0cmnYZBq+6gBVzPJtnmuz+KkYLaZ8PZye6/nilg70h6YU9Pui9rZ5Ou94RwAQBTyCDI
	 lPXVKqealY4tFhySxS9IJnNalQCo7VU228ZZph7SSA403ZUqSrfJ6DMd+ugSPTqpPhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099040;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JMRU7tGm5kBuUWjUTUxq7zTWYVqEcyo9YxKY8UwEkw0=;
	b=4t00H0vswpgMQ1valBVY710cVt+LZVAVkN6PTYQcCvnh7+HYwHFnWUJJHjcGMNmq5UPz
	 HDwcLxgEIDYg/qG9IkSQ8QulpbhzKWTBWSmdOHho8UGtcG+yvDM4zvsDXtwXfSDRZN1Pv
	 EimO2UeM02KIZgq5bLqWt9RFxyaWVuEkRgJDaiSCg3s57ocqLESYPrQHlR/7waZyY1IsU
	 Kkd2cfIVsy7NhFf0pPZ/RT8e5gSSi+0AEqoAr8FhHWcrkNM/Hbiq7wZ3RIv/nneLp6pGi
	 awr/6v34NHer8me2SWCWSIPXwl9iayKFqEhsVkpoamCHZD+zdwptDdGfdURUQmfeNkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+nB3XXC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icjB0tQU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3392B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3392B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+nB3XXC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=icjB0tQU
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeEfk1974946
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:03:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JMRU7tGm5kBuUWjUTUxq7zTW
	YVqEcyo9YxKY8UwEkw0=; b=C+nB3XXCIUGvxxBtpRWZYZJlwNkDFS1zJRavSUsH
	ttV9K/TLqxzPYExUJeYSYsEeNJyQya/MxZ1be2O6GcWlG7yHqSDDWLj6b2waAUCB
	7YbwG6iT8OaoD5qHTXVDGEtc3ZUzGgj2vSmStqxyHXOEgPs/r1h3PshtuoqAaKBT
	khHA6GavchaWEjpQrLgK78sSGfiecZVNXMQzpsHAaJ5+g6eXJZwc4IpZ6jslTc8c
	vXhuZRHF7L55xco+DfaZvBrIwOwQgh68FuTG0UkYuaiNxdIiI7dboTbdy7uhMLEO
	3570Lhvxb8nPsr0OsEW8HiQJPzk4SNjz5tP5C0a3878KgQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1g7r7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:03:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-99064f8c7efso3075815241.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099037; x=1793703837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JMRU7tGm5kBuUWjUTUxq7zTWYVqEcyo9YxKY8UwEkw0=;
        b=icjB0tQUe9z8wNDFYlSKhY6dFkzZlQS1d7nBWmWfZcANDqh+23D5VplEbwfsDJQyXf
         33/PBypaeAX9jwVeThptytORsGGl8V5FW4nZFoSklnVuGD/fQp/uNPCMf3lgc1K1tSRz
         WorlYPCQeHYedahT/XamRuSJoi2ze8TMqB6Z4/ATZWemZglX1JKFGLSuER+3gY9HJnXm
         cBAkD+ZL4145O4BdqV3zcZmk8L9t3l9f+VC5jj6/VWZkVkFjiaOFXIr9nfgc6XutQhzv
         0CYcE2rSA9lY2Kj/gErUKbTUwnzeJmP1jTPQibm1RydxDKuppNk+asj8LMpWCWHlJ0x0
         YWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099037; x=1793703837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JMRU7tGm5kBuUWjUTUxq7zTWYVqEcyo9YxKY8UwEkw0=;
        b=zPOdNUkn+bHzJA0OIy0XL4AtefmSR0p5V2hw/az3fQ4qgaGlTeQj+OeLe+MS3npY3D
         wB627LBv97HV+SSgtSlyqctvAkeyMiYyaxDZ9OTafFmmxdjibunGj2maITtHc188SQg6
         D8pMVzZnLWNZqwYOk1v5UXf3GjT6xLlEMlcoY8W4cHdeNuXeMAlyEmTpMuJXdNKsNIgT
         f1F9MzpQILeRBr8pm3khAVSHXvuDG2q7NO5BnnWGF9VNiy/BxuTWwdeQiK5eyirO6pdW
         4C4io6tVj9yKVySS3IAYV8RTTAjjKmXtxWp21//V40xB9lNVaM7NWVJfIQMOO6tFqqG4
         caPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjuye+u4WSEN23fHwqAeeeMtApIoTCuL1lkGjK+JU3Jt8bHNTU+By+Eo4JkFBx5jxldWA6ZvJP4x54kyc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJb+nKLxsUKX9BIQFADlf59qK+keMw1abu4/zxqtmfiA/to7Tn
	x3qAE/nyV5uHJG4ZxjPaGmWtWyqmqDFQyyyEispm8LrE8wTGbP6Qrqao8ocs8Bld2mYs2MsQNRW
	52UKrv8xMkzCqgZJbDDJH/D9Mw8ii7qU4B9kHUvdFCvswSA1HB7fqXY5Utwa2008oSY0=
X-Gm-Gg: AYBFou1bSOEHwyULY7CzTJqSSHNBv3YW4IUasjhTm0w+LqUL16dnSMJ/SosrZhF5sY+
	oPf+1G4eW2MpXGuTHxtCu2EhVOrtK+W9GSDDgYFZq46wTo62TWAy36WDl1C/LjjTBx8nDbU9FHH
	CPQvhawbf8/Z/OPt0hCcskIO4KTzEniMeHPjROEdK+gazWcT4P6gk873ajp0OZWvbQxnflIidef
	YlDbBjykk9tTPszA/XQhtdVcHUT4vgDLX3sZkWvtGpnVzrAmr1NIJKaSvledn1knXOzY7DZGYBD
	EUW+IQxTpvo0PKOWy31BEc90C8mU29+lcQOBxVABv8ta6+rpgpyBhX84SswGJlluc6S8Hn7EEoM
	EDYnO28Do/u9dYh+F
X-Received: by 2002:a05:6102:8655:20b0:7ce:645a:13bd with SMTP id ada2fe7eead31-7ce645a1bcdmr2481351137.18.1793099037033;
        Tue, 27 Oct 2026 04:03:57 -0700 (PDT)
X-Received: by 2002:a05:6102:8655:20b0:7ce:645a:13bd with SMTP id ada2fe7eead31-7ce645a1bcdmr2481332137.18.1793099036427;
        Tue, 27 Oct 2026 04:03:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm258526535e9.0.2026.10.27.04.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:03:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:03:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: ubwc: Add SM7250 configuration
Message-ID: <d7sepni2rnaopzifvozadtmtzddrs7wf77f5534rj7523nq6x3@bpxittn4b26p>
References: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-ubwc-sm7250-v1-1-e766b1e264cf@brar.si>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0851e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GK7zBLNOynR7OwqPiSgA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: k0WNuaPcXIkRvtLs3hQ5_pxPySHbyzIf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXxH0bIutaiA1z
 P7uq1D+J5oQYgNujOHjGUrRw/z7km/z5sohTpRsIlxrWFsmAOI33Ye4KkMKlWUrHJOs1TGKW/at
 xhMD0RWAer4+PoqPrDGpfzMmG8GpATc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MyBTYWx0ZWRfXzYAAkBuSR0LI
 faAtkp+h4EQFB1xeiXoqZRpV75K48/3QKZMMZqCZbprPmlcTyoQPHtKv+zjU5aoU/WD71Hv3vel
 3TTczDu+GQ4/uj0Y+xU/IVU7BSiH7BVydgSOMI+kA+2dtMPwAAdfcR+/ZEzaRsdyWzRftJyrliP
 x1Y7oBBw0+qEMAPY2oFFpPcPmWSE1caRacPTxqKqDE71lt6/D38ddR04x2OYGnDTp49mIvjJWN3
 npCZeby69+92esti4hp1vzN9qRhSLCgddZEqom2RQoQo40xgU092CNsrNcNnB84T0P2f5owMHna
 bVoXe8QS9xMRSgSWxZXcM1gSFrHwi2B57Jbk/MT8VWSWX3us6LfwaDs0RwP4BJ1t3EOqvg8T7aa
 jh1YMgIAgQEQbwtXf/XCl8s2mA1cLFpU2JLOdESvuqxCL13rAMRtKiY3LtI/yMJ3S6qGEjylTiF
 GJsqM0KMsd/Crzz3qQg==
X-Proofpoint-GUID: k0WNuaPcXIkRvtLs3hQ5_pxPySHbyzIf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270043

On 26-10-27 11:49:31, Ishu Brar wrote:
> Add the UBWC configuration of the Qualcomm SM7250 SoC (Snapdragon
> 765/765G/768G): UBWC encoder version 3.0 with highest bank bit 14.
> 
> The downstream GPU devicetree of the platform sets qcom,ubwc-mode to 3
> (UBWC 3.0) and a highest bank bit of 14, the downstream GPU driver does
> not enable the 8-channel macrotile mode of UBWC 3.1, and the downstream
> display devicetree also gives UBWC 3.0. No existing entry has UBWC 3.0
> with this bank bit, so add one.
> 
> Without an entry, the Adreno and DPU drivers fail to probe on SM7250,
> because qcom_ubwc_config_get_data() returns an error.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
