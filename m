Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739792;
	b=gUixTptPZcXCKdf1A0QtNpwlKMKYQlR3nvjcZzpRHPPXvkyXW8agFrZNJBSMf/oBgaYt
	 oDa9EjGG8eq4SsTgYRQo7xzAEnk7iXwS8EpetNgts8nLzhZwj3qxoRnNP7ra0AyD5JG1W
	 ohY+/linxPLSjGjdeKCHUu6wspzEtTbnG5zC7RP8GQHQo4+dm8xoTgmCt6b2wolDbTu7h
	 xF70JR127DAQe5yAGoDIjeqPGnFt/gEjr853jOb4pFgKLDMrNwhPT2rNaCstnuQvddX/t
	 uuwp1QADj/4z1EccoydJH9U8KGmv6ClR9hIqUN5WyB9SPkULpGomPdd+6Mv05EbcsmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fnCHzkMl/tRSoOoOmfGusYJwL1UrHp+aabajQ/sL5Js=;
	b=tZYkX4EgXV9CuK/Fn/d+VzeVxNJzGjVYCU2S6r0YWSuDL6JjLh5tifHhM1RvJPFaF95D
	 BpxbULvFtyUkUzGFCs66J6NZlMkvAlBo8hk9GNyGKuJ33h2LofZt+Cenff21RB0GAQUA7
	 Aer3wb6mRyLwvzj8khGKJxzoISENz9PBxh9BDrlVcOZZeH22XXfgvD5sGxj43u4YNkfDv
	 N5obju1HDdNm+tVp2cubLdA+GNVFrStP6yXLKDX7f8/a41VZ2avcPtnRwLRCYDuS/UNjl
	 bJQnCq8vwrJSEaVrRSiD3GbN4XjRiixfZjjEZGBHJ2bU8NWbQMYSZxeJI3PFjy7pqcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBLk4Ho4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvCbbhFz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41B7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E41B7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dBLk4Ho4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UvCbbhFz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7FLPj3167844
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:16:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fnCHzkMl/tRSoOoOmfGusYJw
	L1UrHp+aabajQ/sL5Js=; b=dBLk4Ho4qkQhKjoVeSI5pWWyd5Oabiv1lWIm31KY
	XBcPtBr2vVtev6+fGdo4vrPDrsdXKHkYkE0KHMDJmc/Uijd92O4rCHkLwt6Vl0kG
	JcRP6P31K5zAP8WYNKKLS34Tpf/0XOnZD0Xxke7t+9MnxG/7hhHh48aobgtZsFf3
	xajKoBWDLqT8LxGT+2hAqjNB6hGg8BVoP+M26KVbUzAwfxki0wSf+KPrD0k6XjIj
	NsdJhcdsuuTIxZJSxJRe0+Rz9olSM+HpvP4I+fpDbJVe0RUhtF5PlQfLtgNpNC+0
	zrJtVtaJGpkQ3FnDwKvCBgXwLXUm+LJQ0T2U9LUIzV/j9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmpae2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:16:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so114386285a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739790; x=1793344590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fnCHzkMl/tRSoOoOmfGusYJwL1UrHp+aabajQ/sL5Js=;
        b=UvCbbhFzvXWqDloFrgUx1A3Am0vw5Z0gBizbaxxJZUWaoyZiajHAts/hrRNE/WVo28
         LMhk0YeP5MsUuAWLjxCMnZaEfGplFn1uwSkEiQSZRIl9xGZZyNbxZ9FiDQY2JTLNdZl2
         cgKrL/tzp4oZAfB5ZYlNWSn2mVO2AM5YEg2iN6qBvl9QOOIIdiNc3//A10DBFW135kak
         r+DyOrc7eDZIJ+sDfJFb+ylmVJISuUTMr+3mpEi6//cOpgE01L/9Nn6DOQ3wCff0Ca76
         bEXHvwIKHb8xZwyTCEuZJPB6e3qcrIPWZQa0/VexkmgdXnUmh0+bhB+SNXkgPuzX0wjy
         p6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739790; x=1793344590;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnCHzkMl/tRSoOoOmfGusYJwL1UrHp+aabajQ/sL5Js=;
        b=u6mIw8BRuERJAWdzetXks6KkMEygGP76R88RYxZJ63P3+h+89G0bFQRkN+XhDf+KnK
         hRLmLFz3qHYOH6sOrzJ0fE3KsS8w+m8unll18Kz30GcBWYeVLN7zepCldVQPb7wkQIfh
         Xo760N41EKBqAUsHcg582yebDPnTQuQNho+HcUTiI3lpTDn5R8G1QIwjpw1T4gCsA0Fi
         fALn0pUslhTBsmoREXdjz/uBzRSveMgBf7WpXuI+SHSn4vzxODfjv7lhXljzXa34dCnl
         dDRN0aMv3+DLCT8Id0EayuQvAY4jusHx0JDYpIWzJ7nhmwH7uh1FI9iDhCUydAwpST97
         1cVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz3253PceqYO0kB8pYLW1X7So7UKAQ09suJApOkM9tCWHgwMRg44B5FvMJt/uOsbLZgV8ROZGBUTMy4AmI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKcJJwzK2F9kVImJxM4gAcGZ8W97Z8Xukd3alqgfg6gJ0LbNheq
	kEOKMAaT28ARX2AmGJUON8yPth49bF0hFpDhOkAvJzH1mH4V1794inATBOHkTmyyMTCX/Jdo+66
	ZmBneeUJh3iraodi3q2KkoBhGFNaRdLwzvzyg/XxKJUUrn0y5xHcSq9p6n50WV6wTW1Q=
X-Gm-Gg: AYBFou06BD3dBMncx5hwwtCCIMnz4uEak6umiTvsJtglsUasGiFT1bVNmdkIIbww0In
	wuQhrToq6U0Cqg9Cq94zorVQ0zqT1Ab0Hi4q+pYUepbeVTr13z2qgNcgjTYSJu1pEP01p3f8jgm
	jr8nQbo3z428mlRDVJgRtaUImQs/xEoVfLhtYzH+BsZPDuf/p+Cj0k9hn+SydzNnsN1EwXYRaV2
	0LsDudFExgGn3W3aq+KHdUknsuW8j+70UQDETRSBmI7fy2YGYV2/ux/gaHyBnjAMmHB7XX/YgNF
	z+EVI7MR6Ob4UVe1gz6FJwxcPdTDwn13A+RjkKoSqnE0EbbWLLdKx3um9WqfQL+QzhMTirCpumJ
	wPnCrUocdWcglUs36
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr751725985a.2.1792739790127;
        Fri, 23 Oct 2026 00:16:30 -0700 (PDT)
X-Received: by 2002:a05:620a:270d:b0:939:5d22:d1f0 with SMTP id af79cd13be357-93f624b1fa5mr751723385a.2.1792739789532;
        Fri, 23 Oct 2026 00:16:29 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38048ad9sm3287521f8f.35.2026.10.23.00.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:16:28 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:16:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 5/5] firmware: qcom: scm: Drop exported ICE wrapper
 functions
Message-ID: <hwjwaxabshws26kx7xa5qfdxnj3zomkvetpbp73vnl5ugdmvae@vckrsfkyptbp>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-5-b035be7aab0a@oss.qualcomm.com>
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
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-5-b035be7aab0a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfXyUVglNL4sQpQ
 ON9JmHGdVyFsHIBLU2qyynJKivXAfIHuv5WStIXEgsAj825HzIB72Mf4egw+N1lWBy56uX4E5QF
 CYVETzhLIAU9vm6+/ThxGxoHhrYl5UY=
X-Proofpoint-GUID: 0rpNyJXAisFC7g656sXPYvmsUAxUKQZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX4tl429Kpw/BE
 KG5FQxbyQRfkAMulXJJXQAYk2FDqfZldR/pRgZ9/3xLYE/ffXoeNG4D1OINKTm+Ff6oLKK+tiwa
 Gtv0vQvb7ZjV6DNOywkdaUcs5ODBd4wPpxfeVwWUKdWvQTYZD/KxZP74pIvEDFjfADz52Kw4p4L
 dQvzCAiJiCdY+eh10daRpjg1RJNPr1mCw3H8SX1UgwEBQXDdHbpBEtyOwDG5MVEkVQxi7lC8gXH
 zjWM7XZWZ7d9vnBQ9Q057bcQNGbQBSo8IafjmhkC1uZIEvhhjsVF3Pwz8i8642+U3J9Eh9OggVi
 1ha0w29niR91IjYkylJW4fYLYukfhBcFtwwNe2KSKtqL+VpLHCFmjoH8kK6m0l2FcIBvi7RthPD
 TlB1LMpdGhG8ML+w7rYpD5I1aFuvSNdjq0x/yEMkOwBbSycIUvm1YWoZaCsQ5t/vSd4+OZ66VsF
 zKkIm07/OzvFh0oh+ig==
X-Proofpoint-ORIG-GUID: 0rpNyJXAisFC7g656sXPYvmsUAxUKQZ9
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adb09cf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-aaPCLjwiM6LKh8ESrQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028

On 26-10-21 21:13:11, Harshal Dev wrote:
> Drop the exported ICE wrapper functions from the SCM driver since the ICE
> driver has now migrated to generic ICE service which allows re-direction of
> of ICE secure service calls to the appropriate TEE (QTEE or OPTEE) at
> runtime.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
