Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A18A3CE497
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788264251; cv=none; b=qdmQsuO3xbDZJrBMMqGLu5e7XgaC7SsQ0XpwRPPE4z7FDImp+5tfkcStn5GDSWYFHve0/8qnP+gykEftPHdbtsQvwcB56KHdoH7EWpCYsUEiPD+lMPhQDAhgYQv5NggmxT+tqXm0imsPpvPdNZu0Z3TEjCbhR8R9RKRH10h0b1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788264251; c=relaxed/simple;
	bh=pVeSOF/f7uQcPa36tMUD3FIg3wIrNDH+COVd05nTzz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=blc+i+qtFyMPYrqWOPViQ8VLqpvyTwnbreWDYSlfHIeWXqfL3SxPnKPtn16s/4obMjkU+AOsRYKUp+KLrTN3eCSVkdvOEbZ9mP055eS8FvgLjqC0Ppw9f2uGMBUyOoEUtyaGhbETCV+5ZR7gCTlqjYJPxaGIE2a5qw2z9CMdgRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dYIYaiql; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KPD4xT5l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dYIYaiql";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KPD4xT5l"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJp6m2752324
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nX/6r2nOz3Tf0eBMGc4EdUQI
	DcqpozJV8n/AkoW2T0Y=; b=dYIYaiqlI1YtGMx3cdE2yoXniWLlbDdlfwzIqGjq
	ywL4nuI6isKKTwyXZh1rPw+xSSBrvb1kUT1eztdEgT+5kBBueXmgqvC3Q3r4PaFs
	PnZ/RtruiqONcwJr+V8eWPLaSR5DDUMx7wMqh32f5QxBvVoq/t5XBvTlSwnZE0S4
	VBgZiV/R3bricAs0SB+k88ZNKhgSxJJqtud5kul7fiJBgL5FQsp0KwUU47xLXArq
	uh81y0QIGHc7xAjnpntoF0ezdF4IJmolDBrdPNk4NhOGcZNjBKDVk6ASbDjvb9Xj
	IN/3tGO8Y9Cya9W+Uoghy3Pld59WPrV1Om6egOojdQxzxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchbtja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:04:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9393ac4961fso106585385a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788264248; x=1788869048; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nX/6r2nOz3Tf0eBMGc4EdUQIDcqpozJV8n/AkoW2T0Y=;
        b=KPD4xT5l+O2G/u5EvrHsus9NzXkiMmquI5XFVuZX0WrhYIr/WbKUfbaerqFDzRZBvB
         f9LkzMb8JlelDOAFM0/fUzFaiRDhC8gj96r7EHUv1/DbY7IAjTCVzYAdJaFK76jCZzq0
         jVH9uHQ+becGr9+a499e9OPe4z/Bhsc1O3s3XdhweaCX1ieJkZC0vAlBzFh5CcC+BSHc
         k1F030jhsvNeFh0lU4d4CtfRMUODsHQRCV3sRYXbRRgnaj/wV1VAXZUiHcqJ3YcV6/ym
         5sGF+I9wHnXj9Zn2FFu+HHMMqjedQCyz8u8VUZOgUIjjqOqNdE9PqkcDLVeOL3ZjPrdv
         o1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788264248; x=1788869048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nX/6r2nOz3Tf0eBMGc4EdUQIDcqpozJV8n/AkoW2T0Y=;
        b=N4GT8NVJ2Iyvk4Ug3kYUJWyv4Hb11kktuErfYMVoAHcKIpWuKJsWSptA1BQYKWdyj5
         2GVgTEpvdRxSnhJ1WsOIW63iIx3ziUe5XgR7l3s0IWyJ30wmAUNs9AGdv9a3BwiHjZw/
         HS66g2FbF3rnBsrkTR7cxJThv6Xxjmqyq6ebNGnI7gEahDMxfWjozaqfFf9LbueTQJSO
         EOemWUTitG06XWfi/GmYWwKWO59+iXzTwurlJ6GdAj8rG6QTEuClejg4UCfkzGGnhijP
         KiSCCN3IhaplL0+jQCtgqAlaVSB9QwdVa6RZkq1DY9h9gDq1VkgU11tdmZm3d7ztZZHd
         lheA==
X-Forwarded-Encrypted: i=1; AHgh+RpBdRBmpzufD0vMTVEd4uaGO8+mhCLGkAMNE8jeeNL3TsAuY8s9DU29s475zAOHXiChP7tvYDKRY04cGhA=@vger.kernel.org
X-Gm-Message-State: AFuF++n96p4bF51F8leHdhiTPpAQioxSQxFK8cDUTQZw2HhOvbGQSnaK
	/CESxRpRusUUeYuYUahnKKVXgiJUjqjNwMJhIxNoTAkbE7Ne7NfHKliS4Np20tj3k3nS+XpMN1O
	vWOHFEkBWvvwVEg/wIl1Vf02xR0/uuN1GXtQKIP+ycOgbW/8p8QJHmk2xyi7uJFUjztw=
X-Gm-Gg: AR+sD116QfDNma9oqIHYpkDfPobBRqjQkK99A7SttuFsvRDHK9p0ZWZvKuIwJ7SSQKc
	8V+Djb1l2+FqkIH6EoMYVc575+WBg/HMnH7T978oCIjUnYh522A2gh/qgYAtDEEedgRBUQIxhPt
	k+n0m7As6M5B/Cdd7EjS+ovmLg0nExuEZ7U3zxTzAmP0gdpeywsN5rATA6chJEFJwj5Q4ATq3XC
	ZO/VVWLGaVcZ1mqgqGmQEu6f63vjZwSbz1ZzHOGPRR+L4eN39WSQ4jiixn1llD8Rb6+xZw0crhs
	/uQ92X2AQvSeE/Pq1tTohdTjkMZrkpB36l/VQeDabv7dsmjCN9IXD3UiOyPZ9aajPGTHivaFXL/
	kNJng2y4nYKKKWk0=
X-Received: by 2002:a05:620a:f8d:b0:939:7fc:cec3 with SMTP id af79cd13be357-9391395e55bmr3250729085a.41.1788264247306;
        Tue, 01 Sep 2026 05:04:07 -0700 (PDT)
X-Received: by 2002:a05:620a:f8d:b0:939:7fc:cec3 with SMTP id af79cd13be357-9391395e55bmr3250706385a.41.1788264246216;
        Tue, 01 Sep 2026 05:04:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d788ebsm4651556f8f.27.2026.09.01.05.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 05:04:04 -0700 (PDT)
Date: Tue, 1 Sep 2026 15:04:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-som: Enable Adreno A722 GPU
Message-ID: <edxed7tn4i4ostqaldbi3ytsv4bkhnfkootday56sj4g4s335a@xsgxhopu5axs>
References: <20260901-dts-qcom-eliza-evk-enable-gpu-v1-1-a7c3fb27b4e9@oss.qualcomm.com>
 <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <109b0a77-82e0-4eb1-868e-48a8c592cd6d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: J0Kk3wz79E5oUneVBeRi-PNRseFxHyEs
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96bf38 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pxLU6pXUeMuNvs4zQuMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: J0Kk3wz79E5oUneVBeRi-PNRseFxHyEs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX79B4Zrlhy1TQ
 hRsatxL9HxfnKgKA0S+AhClbcKDTP0hT2THkD8kE7uNfphvj8IK/erEqRbqaLu1tJxmtWhNQ5iO
 3uHSsqFcSvjY4EPJNxn1pMsypocLsAE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEwNyBTYWx0ZWRfX8ihcmuSH0KiL
 Gg1/SV26c1gq9L8BLixf7Bt8Kc034elSKTFnoNb08y89n78MO5uNEY7hmMk/dsUaYgTnAOQhHJm
 IOe8jDdh566lt29wwsC5EKtC1tw7t2a7V6UvlMh+/zd9OegnkcOiEy1ho3b7I9ow/r8TWlDfROQ
 i3Kvf2c3r4RlQ0J0N0SQlzjo+y1oC6xbPKXVP5luTc/vHleXE0fJxyiWBahnxdJh/VLKE+WocOj
 EafjyfKNf04aHYoKC5GrBb2cKzBKVftIQhZVAcm8VrNZThCnBSDPcpSs/QyhpG9dyZAgKahLdVM
 uPnZQwNWhGaHxmigmMfGUnytc2XoBdsnBVLhEeZmqPT12LWwhOLb2p0I+jisMMKKJQUAv7f/tAA
 xPwcC30qhhaQvIA1RmIAZIJtdOF0nLBOwUgVC4m+J3ozpKUXe1mq11NHFC9bcooy1fe8YlmuDHy
 KcccxeZVri8iSTBk19w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010107

On 26-09-01 13:14:47, Konrad Dybcio wrote:
> On 9/1/26 10:22 AM, Abel Vesa wrote:
> > Enable the Adreno A722 GPU on the Eliza CQS SoM board and provide the zap
> > shader firmware path.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> 
> Either "Adreno 722" or "A722"
> 

Sure. Will respin.

> with that:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 

Thanks.
