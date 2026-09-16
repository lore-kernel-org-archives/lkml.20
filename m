Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866737EFFB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789571115; cv=none; b=P6jt9E5PkZrl8l4aGu9wOF6j8se2VnwDG8nmBZYI4tkLtdsgndqNukzd0ePIK5ZZzHKt24NgCCB5+tzvQ2DJ3DlnU/oyk9AtPoDhVVPFRgvvUR9qQQ8OZIdWCqS1xIyP1tgnu3lGyJsWPVWYbZl9TF0KOuIpa1Ah+PCYHMnRWKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789571115; c=relaxed/simple;
	bh=WFZZvXEreJte5nBGMpFEg3DhjYB0tZra7/TJ0VEudps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dCm1l89LM6J4cUVo2wizKGNJBViJtu+vWfm7YE2dJ1yx+wfyaa58WPFVTpQSD5idSF8NsfcIqXdeKnDbOMf400DLWgtEGXgu4xTC5GUcW3afBb7Eo0c4IISnCaaAnVfktfKY5DDpUGuomFSlLBs0VW75waM5yFV/J/GEyZuFmO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V5S9uLPB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d8AWNbl5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V5S9uLPB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d8AWNbl5"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GEZNWH2956559
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:05:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=; b=V5S9uLPBg09h3bTM
	XtAh5/C+atDPq7dYnJgm4MvHjon4GE3DZLkwoJCiupIwGFMRy2ZeyrNY1Vk9wYvY
	PRkfVNdjcnkpZSEv9k520lzbf+J2dQQe7qh4R47rqLlhQ+Ey82uSHYE0IlPBPI4J
	98UgpYOV4xaVAJZkCl65ZMnCwq0kFqK8DUHEEsCnBzgLREUmQrpbCSPpaEmyqY3P
	8IvzK+pAdsNAJz6onJkkjYFnXosaeC9cLoVwKA34dF2DHSIKNl6z9fKaJfhgvMDn
	LZQxeDaFL46X6vKwA7WLDlKWmfeTF9AEo1d+5scH9RkPGsQfGxFpnmE3RNMiSiej
	Yuct5A==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2rf3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:05:12 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c55ba309c2so6005177b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789571112; x=1790175912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=;
        b=d8AWNbl5jHmLKpLMhfhaCSSuV958y3dY2F4I/U5ZO5RrSz9V1vbL+xNRDDoNQC9yIw
         JS8faYYlYxV7TIwhfROhh4IH92TVHql5gMTjprqlqFHi5Nh0NcUyD9FRMgPMaylfvQkt
         bDTzvPHHVoIjkZatIHP1BlprXIN3OqgzltuVqO3XSGqLg/cmj1yUqGL9ZaqnOjgyllrA
         O47pS2wt1LUkX3CDS7sQAiHDueQHANtHJCs9oNf2+rBCcnMAqpsm7kJxMhK/eiNscBi7
         Y+PDnCFmGn5LO+pi1ffvknxcNJjz2NJFqTnko1tCa81Cm58v9AO6DXtkOR2EKr8oJ5CC
         UDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789571112; x=1790175912;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8uXNolMcn7VWBrYpq95LoEiUSffaGyw+nlxj/sZcvx4=;
        b=CpoqGhXbaDV+lUE2hTs2dlntx24j+nOPFQmhHfN0q2aO74uPgwfA+n3OvqEVZb4wSu
         x3yDzw7atCkXTxSNeqCpAerYNVOBQdxCiTk68vmuMWzmz6ULS4Rs0ODRzoo9NJEYfFk9
         wV3B2s2VMIgkItwZYcOKZIeryaYyjZ91t5Ryk+8JdpBa+lJqy0OdhcYk0+iMgfmmF5gZ
         7Y6Vd/5u94N696I6Q+b85tXJheDAgHVIQRPCbykQo4bjom6iyV8tqLz++mZoKviJoepQ
         ExXWHY7sdfJ71GDR8NtsSVqFAJLjGEsnUCd6KVIzMsaeTRFto56kHbPyna0EslAZbgFw
         gZLA==
X-Forwarded-Encrypted: i=1; AKwUvBx8i7PlyM6TkJdv66hOFLAx3wQRekfbnlXmvHK2weORkwuzoQUK0gbGuPhKbcAGIraKdDK6NRrMG2pVnV8=@vger.kernel.org
X-Gm-Message-State: AFuF++kl7QZafanpPsB/xAZdH/SN2c9lFOU3lO8NYsH/oiSh+vda4OhA
	MvU0TZAXJYOG6roX5IPx/rZ+XJzsrtlyo5oog10Cyfdr0mz9ZmCIRZ5ei6aRfLteXziddWQ3wy1
	B+FaAgBZnu5gYn/XMaq51Z5IOp2FNpnEO5vjzGiafY7Y86xlxjmF4d+5XNDz2EWKKPTo=
X-Gm-Gg: AYBFou2MsElY3kFTySXmv1qHzp5m+2iv/cPXkFeeHTEC0FctMBAKozS8m1uI0i1zvKC
	gbWTMAaFfX4+80oxMTzCkQFDAQQuOe5gjCZVqEbIN5rHnwJ8Mp43to+NndYozeYxbacEU67D8r2
	VT2bxqajhROY4pjtKjvDAvmDd8Fltn+FAQxTzcTNK1LluAWyXfYzvm5F0B1dHoyuZ8A2j45KytK
	xDMZDkDQRqCLS8zSfw0Mv3TKJWQXq3Hn+yeAg1GNyP563JLU0Xc6C6l8HlOlnKGQkWOghT1m5rz
	m1E5lTvHngP6mOM3GporB2pX5UgdJOJQHymzar1L/U/wfT+sEYnV+4ClLIHnnqqdAHMBAKtzbbx
	Jg2+I3hDNZ38Wa0kHntzfLkUeyYdjRRwXXsM4n+KmCWu7jUzHxdDQAZg2U5rb
X-Received: by 2002:a05:6820:1792:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6c7d3af57c1mr3029339eaf.40.1789571110796;
        Wed, 16 Sep 2026 08:05:10 -0700 (PDT)
X-Received: by 2002:a05:6820:1792:b0:6b7:46fa:1693 with SMTP id 006d021491bc7-6c7d3af57c1mr3029183eaf.40.1789571109343;
        Wed, 16 Sep 2026 08:05:09 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a1a5sm9336952eec.5.2026.09.16.08.05.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 08:05:08 -0700 (PDT)
Message-ID: <fcebbc78-63a7-44ef-a822-2313ad5d7517@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 08:05:07 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ath10k: clear QMI if failed during init
To: Albert Esteve <aesteve@redhat.com>,
        Brian Norris <briannorris@chromium.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260914-fix-ath10k-dangling-v1-1-15c5089682b1@redhat.com>
 <aql_xwEy5POcVmyU@google.com>
 <CADSE00JiEr+k3ykLq+D9C-WxAcPpzXdF3uJnv_P47G1V_-jeNQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CADSE00JiEr+k3ykLq+D9C-WxAcPpzXdF3uJnv_P47G1V_-jeNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfX/1VZiUuZEfjb
 if6KPH9lapo62I/w/KMtNTBgisOPk4cBKQlUXrTjA9VDMuuLg9KwdowYsFOmKiaEoe+IHKKHnsy
 zKK4G7XTSwVsGAQnqvdU4JtFZd8WSRI=
X-Proofpoint-GUID: 626ciRctWAS4pLxFYDRZVLf6_DLeSaNJ
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaab028 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=cm27Pg_UAAAA:8 a=BEXexABXWyTRsNrkf64A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 626ciRctWAS4pLxFYDRZVLf6_DLeSaNJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDIwNCBTYWx0ZWRfXzKjZJ9mkTV02
 iDLsDnbQLMSaXkerM2R5w7t3WMBiA5haFGHSSvEtRplT/Xn5Ib1swxPloMSlwhc8A4qUtavbBsI
 JhbVnrLpmf1OHLhxZVufZ/a3KCBv7WkP0XbQBhK2nJ3z1EKHca4gjJxqNIFuXxEESf+1dX4SJvJ
 E8Ell1BDIxPKR1CxC4g5Yuw1vRnAGRhJnPxRxKQdcBOBoQ0s6tEFQMCjbJAps63mJvtTbjVD2B6
 mrsLFWAv3oU+83Ccc2NDWjmr9eyo6JHwH7kP4m84Kq+kT3RlSKFaWMqC3nCj9banqZS/QbRLjUe
 eVUCYA4awEpS1p+iV79ka8LMSOkw2f5MvW5Zxtl0Hz867W53XpwTkXXD1A+htXojqfbxOKoPrIs
 1TO5ED19oQhxWYrj1tob3njseElXCcb7eOngM3Q4yWFhEKCnbanyHwdddhVlHrAi8a5Q3W14QmK
 rbG3lqj7gf3N5O+WdeA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160204

On 9/15/2026 11:55 PM, Albert Esteve wrote:
> On Tue, Sep 15, 2026 at 7:26 PM Brian Norris <briannorris@chromium.org> wrote:
>>
>> On Mon, Sep 14, 2026 at 03:05:19PM +0200, Albert Esteve wrote:
>>> A failed ath10k_qmi_init() left a dangling
>>> pointer (ar_snoc->qmi) in the cleanup path.
>>> Clear the pointer on the way out for hygiene
>>> and consistency with deinit().
>>>
>>> Fixes: ba94c753ccb4 ("ath10k: add QMI message handshake for wcn3990 client")
>>
>> It's all going away (probe failure / removal) if we get here anyway, so
>> this hardly qualifies as a "fix". In fact, in a cursory check of the
>> driver, it seems the NULL-ability of the ar_snoc->qmi field is totally
>> irrelevant to this driver -- it never is actually checked.
> 
> Yes, I agree...
> 
>>
>> I suppose you can still call it "hygiene" though, and it's probably
>> reasonable to do the same here as we do in deinit().
> 
> ... that's why I phrased the patch body that way. I hesitated about
> using the Fixes tag here. I can send a follow-up removing the tag if
> you'd prefer.
no need to repost. I'll drop the Fixes tag, update the subject to add the
missing wifi: prefix, and edit/re-flow the commit text to use the 70+ columns
that is preferred when I take it into my pending tree.

/jeff

