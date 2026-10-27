Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082848;
	b=Pm3NE5YJ5klOP2KkiRwm6lFyOshfe+WmimjW9w46Re4kH6SLo9aI0zkeQ399LDolHy2S
	 E3HuCFcNdgYIHTZQJgMuRjssyEXLIPiT3UXsS/RRbNxTd0pgDIaDxe821BUVeYQug2CyD
	 jE1V7Gs5u/LI1qQZG+ct+uORMjI7NGdsI6xj5PlqxLINJZZuDwPbsFdSOBMiqKG7R1N6I
	 H8STZVASamVAZ/kCIIB9IWh5Ssev71GFrkYwOIHPVT5u2hOKU6XeFGtuIdYu519eJ83Ct
	 yLBkxooXaRl8/zNa6My6/6HoF7jfV6IWXU4knYmNwdP0WHnmsQqXh7vzUCG7leDHuyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=;
	b=2nY10zTM36cHKLq/XBkFjB9aBlJz3zlR4DInZGZFFgHoVDtRUQzzkOhN0kt/wMgbtMr8
	 VHIcetDG37VyfVkYEYV6xXjaHVeUkoRDddKOHxLtgCMPjHkgY7ii4FxYCQaUtgfPLAXIR
	 RHrSOKjIbdJ+lu99+coGn0McPQEBj5iS+UrKbiXBrFs0JdqWxCqN0AdChPPxzuGlUHZw2
	 SsjaaW8tWagv17//83Jl5A7tTxeycTIvRv+Co1p0HdPvKIn6B3UiUVHTJs76jzynuJjL1
	 4n1tSqHvPTpO/EPW+Xxmm3CY7rmLD6D9TiAT6vl8lYqMZwOLdFNDNNG+vWY35bErAag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5m6F+dr;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mm3BCJUM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1887606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1887606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g5m6F+dr;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mm3BCJUM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R5ZPbx1851020
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=; b=g5m6F+drEHQbgNHy
	PdD/eoai3n3Zr7ZOTf5sb5iN1PqIXksIwhCzg3Xtya0lrXb19GZlI9NCAWnF1fyl
	+id/BU9W+R6wI+DU1TKG6jPyLN4hT8hXezSFPvHnHDOarSjzJ3BgwaIA03spEyD6
	bQlXNZomSGWrXBqzgprMSqfVqkgg/xYYuVG3AVuFNQoPH18AfAPUN706bNIsfYmG
	lvhg005Lf9NLbMqvSWx3dKSr+pD67iQREJtf0eRjYygaC7PXWqE9IvckZYyJq3s9
	q0pterFffdOCDi/onRvaZUAJtm3oNg2kys9UezdXJWV2b3Pwv2Cl5vQCPK03Ep1O
	wJ34zA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf43yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:34:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so4094143a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793082842; x=1793687642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=;
        b=Mm3BCJUMtzIz/7AEdB86oiDIG+ymZlln4Q+zgLFFa9nD/LPQJFfNf1FeByLYbv1cmm
         hfQP3UHgiDQZ+G1RMVomfpkTMo0VcWPxpWKpJfrt0McTcHZp+v54Apjedv9ReU3sRtzd
         VpuB6G5hNozt9Kkne6EO7zSN4kl8RkRGnQYDDdja0uMSxGwGxAei1TcFxoCAxWRR74TY
         /ZUFSGXw3wCqzuXhSPEnj5QhEiyiC/BUAo8feNYrRBbYpxBM6a59JRYCjf+ojBIdbmZq
         hWiMVHktZYOkwX1syED7E8lNunbPJtuD0fqIMgQ9AfmqUkkZdcLoCVrRYlwgjf5Ao8iB
         zSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082842; x=1793687642;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZtzWFSKtvsdQlpx1vNzzCA9A+CSSMDGzxEbgDk/QeEM=;
        b=eQP8pLs+rgQ6xHXOPtqLr8GbfgAWyWHSwGBJ3dGn4lopBgp3sf3VGWc9+VMAe/UQjt
         zxGDZfF9hvvb3wNSgOaMiVBpf8JE/BCJP67F5nwYu+o7sEm+hrNAr/nZ3yxwIel3CtHn
         G9PY8IfrJxbdMU8jHbMiDWpeI1tBEXAL1DYvTHYsS+YrAwDxP5q/WIUHXXdo7y4NxyMj
         cJ5yGod2++opkoY0VRTfTdjAJzVi1vLuk+BlnKQenUlZFlxLOnQkDzD7CFAJNsDfF8uK
         ciJUoXTS8PfwCK4Mm3GiDW7z/nAscGJrYDNIe36H+puy6g3b6oLxhCOqxdnDHyMV4Q6m
         EYfg==
X-Forwarded-Encrypted: i=1; AKwUvBwN7wTPrJwyz8JK96jmaUIxkULm3yxf4QS2ZXlkQOAh489K/Rk6+TAlfZ7mUWNcJqWGiPFgdLMuYZWvlZw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT3I9QVNMwrLaY4/39RC1SDBia9TPEKKXLZh0KSnyZqQ/jDQYS
	Wtpm5IeGJwE+njv7SjWAg7rOKrUStNmPPGu9TiNE5FCf9g8tgNEtUuKKX03uFfwtWh/eXHwbwv9
	lkv7kuHLMmFbTR1xvTDr4WDHPK+YIhGGpVr9o7TT+qcWU3win9/tgw+YzQHZDYZRCdJc=
X-Gm-Gg: AYBFou02WcNN5/VCFHKd4yqWdOf/1NarBI6TfARrPWYThpAS6dv0ZSicy383GcFGTiw
	xu+J8ns2Cn2yXwR1apsn/dtyqW8O2f05q+quBhacDjfxxLdOthHUaXZQUh0QomtLWFNZ+ikSqAr
	WlXVobBooJL2AcDvSe5sVXjgHgEZ94ABcIOq1XyJ5PHYnlo3KhFv9CqHpYe4GuY3vlIDykZiTvm
	ouFvXPMy1MaI74SL3EOiFJD2z+vBxbyACYtMfIHHas0YeVTc9tiFbuoODz+tSzNb207ZKViD/xA
	24r0rpBbEE9sk68cWsBgYF8aIGX3wW+TMo7rvc+uE3FdlbBpA4M+70SFnIrwdKnRK6ygevNeZog
	scPX3oqAtCzywidh5KfIdN3+Miw==
X-Received: by 2002:a17:90b:3803:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3adeb101a2dmr7179860a91.66.1793082841929;
        Mon, 26 Oct 2026 23:34:01 -0700 (PDT)
X-Received: by 2002:a17:90b:3803:b0:3ac:a204:aa27 with SMTP id 98e67ed59e1d1-3adeb101a2dmr7179851a91.66.1793082841527;
        Mon, 26 Oct 2026 23:34:01 -0700 (PDT)
Received: from [10.218.26.96] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404274b2sm2238992a91.5.2026.10.26.23.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 23:34:01 -0700 (PDT)
Message-ID: <236471c7-cf05-4019-a590-b803fc471484@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:03:55 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] Add support for a TEE agnostic Inline Crypto Engine
 service
To: Eric Biggers <ebiggers@kernel.org>
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
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261024185602.GF2553@quark>
 <b5cc804e-0f73-4ec9-88bf-ef6dd04eea83@oss.qualcomm.com>
 <20261025171903.GA2212@quark>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Organization: Qualcomm
In-Reply-To: <20261025171903.GA2212@quark>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfX2yWlM+/XEEiP
 8ncc9FBh/YIYi3jzF396bNtSViCsNtpw7OL0/+GdVYuVdxV43xuevo6V2eTJh2ca+KeL/HVBuoN
 rv60YD7MvAbot6Sa5OXbTlB1mNkvIKE=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6ae045de cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=_ITZaPDcee3h4uv5GAYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: EItmVQu4KidaBhFtJg6-sv2UYBF2CTFh
X-Proofpoint-ORIG-GUID: EItmVQu4KidaBhFtJg6-sv2UYBF2CTFh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAyNSBTYWx0ZWRfXxq+1xoxVQrDe
 QsOn/JQZM+cy8dpCk9YTrhlJtBvWCb0Dr0uAC5QutQ1tQy8hXQPZ+K9EchWDgnm8zErPALo+rxO
 QJCOrOd+N7sp2TJ4XqIBYAKbIrc1PV2uzoaE50tV/dIyBLgFKREW9W+dCt1QvQylT61vh4csUIf
 9CxOLd7UZeBEYRH4mC7Ef65mK1wfB2d5QnCCWvvKzX3NA9GSr+6RT6UUHsmf8iN1IsAdlRQurUw
 EClLPvZewaFvUw71VV6ZGV5A7Ys0W5OxTnKaMTgJKoGzVRkAbH9vXGkyY/AN2kF+DYHO88ZZDBn
 56e6jspuIIErWjVn++/Hy/1J04fX8J+jM3E47yDODgvAcjtsxi4CyK9poYK87Z3bgGLNLYwidfw
 X+h7mvuTJEtXrf9ZPtK2yyxRoaL2mlzjpRiBy/8Yf7rCdQx4jVaaCD4ukIuPNOwJ6fCFq9I29Bh
 Ivc818W4/egA2hMFzTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270025

On 25-10-2026 10:49 pm, Eric Biggers wrote:
> On Sun, Oct 25, 2026 at 10:16:49PM +0530, Harshal Dev wrote:
>> By moving the TEE call re-direction to a separate middleware we are ensuring
>> that we only touch the 9-10 lines in the driver which depend on the TEE firmware.
>> Merging this functionality in the ICE driver would substantially increases
>> the total file size.
> 
> Again, it would be simpler to handle it directly in the existing
> qcom_ice module.  Yes, there will then be more code in that module, but
> then the new single-user middleware module wouldn't be needed.
>

Sure Eric, I don't have any deep preferences here. I will move the middleware
to the ICE driver itself.

Ack.

Regards,
Harshal 
> - Eric

