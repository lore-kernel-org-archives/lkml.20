Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884B045FFD8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778441; cv=none; b=gQpFkFPLh1ZeT0fuy8x/O2GekbARXTjLql548V04ku6XePhro8tHypogkbtMPr9+eMpgbG9Z+s9GWDoq0SoNzbjs01pKWMo1dpXoKIgjHYLsR5sMbYIYjai8umamdFaLS/Lz/EOLvYxWjotOWMgAKCTFC8HZXpN3TArUK08ftqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778441; c=relaxed/simple;
	bh=+1Wc7z4bEfBSvdZ02UCtOfaoTFuy+lcRNDmcKFVT0Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TAq/N19gGtYWWjzZqocqIP9Y2ssehQcxwac1bYMxVfr4mPSR3NpDSCvN6oJg+rkKnZVHjWzRqi8h2N8Xl0Nb1gbr7xi1IroRI4iEeKVV8TAZHM0wmK/cnbhxekji65ya0pcaiEXoLby/t40CmdZG0peW8Oe5cHQprkh6kJo/s64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bySE4H+D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iyBtPgwX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bySE4H+D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iyBtPgwX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An5nZ3862529
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:53:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Uprfvc4EghlP0ig/btU4Xfry
	/KEVlHsYbosyb9n5+DE=; b=bySE4H+DLt+MlBLupZyAJDyTGnm3wlgUvN6Mw0CO
	n1aRqPCaLv0AjmapKyYgdV1YTA/VXlhbanBbEmXDlcQ5eR4T4MEOwuyKkGGmLoT7
	8mkizoq6MgzB4uG7NL9zWMLqVOe8zenD1FRBwT5l4lFyODHNEmaDLzcUHVE656Ay
	X4fHb/D026mVmfo01yQKNEZgDRI5kw4fgQmmcxmB7VXgIkjFqkkL61bUVcCUootO
	jNkHRCOL/BKIwPKG2rcaC8PGb9sIHGRaD4FzLQZILJi1dpNlo/UOen/hE/rA8cKW
	/Dwra2D1M+ccmad/f4uZR3dmioIinuRzZiW7b8NrJDOrMw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hf4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:53:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso417236785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778438; x=1789383238; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uprfvc4EghlP0ig/btU4Xfry/KEVlHsYbosyb9n5+DE=;
        b=iyBtPgwXxPZm55Zx1iEc9ufeiwLxy37pVByoHjIMQXOPXm1jQKrf+qE9Pe/uLn/Qbq
         o6mBK1U4IA51xTSYckItWuD/strB64egton2zjMg1YjMzD97GT0kW2UBFuednKiCdN0o
         kzkdT01jwUlM5c4p0BLQLrc6bW0Xm3pOvIHBsYNgkpRanov+wJAW2UADA0gMSVX/VWPq
         KbwaoCd9V32c9lhGbDf8oecpmIkm/bZA5PxTH3Da4d/pcH6hx/aHOm82CIZBnk28Ug23
         9MkQ3nHJFiRFIL8rCBGuRjbHg9is+HXK1K//Lg2ht0FHexv2EQBhsgNbv4j/iV1nz7Ht
         vP/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778438; x=1789383238;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uprfvc4EghlP0ig/btU4Xfry/KEVlHsYbosyb9n5+DE=;
        b=cZtzStQzpUpWKtpDSxfrjuDMZ2Wu13stL5DpRFFQazphtstAl95mN3LatjUFZX6Fu+
         R2UQCviSCeHZ5Sy9d97aJEfXlvnx6hCZIQM9eygbJGdgYgvWcD+VSQzNy+t8y5N2gaB6
         eqjCesiXQFmKtSc8+BBX/k0rNyMnakI6+hCLFLooFLOaCnP3tb/L4RYz6xPGDG6/fNGQ
         yS2o2pHQSKmIYbGA01S/qWt8ZQvDxqkxx5cX0i7EG2JMkHua1ilhvZa2SZHCwtoArHEq
         aVu6+y0ZWcdC8sJw/P9yxZeOKT1f61/uorkoQnmpJOFwgJx1eRlH/FcPXq5UGe5Qog33
         I9tg==
X-Forwarded-Encrypted: i=1; AKwUvBwj0ZYeEhXqxm5U3NFjzgbtMBnvbVz5YkLxTEuCp5l8c3pifuTR9g8CwlZeCtCKmDtncVsLzY85OfXCOQA=@vger.kernel.org
X-Gm-Message-State: AFuF++nUCm9dqD4SVjiwT5ZSP+b57XD3DyxGNiJINT8BC1yCjQfq80c4
	gVG1DEk0uNB63AhKxKMux9Nzm/0RP2tNYJTcMwxlB8Ey5Vmi9irGeYo6yuAuB3HmYf6GDmcKlfX
	vbeq2h3WfIZYx3Hbc/zOqTxXqZ0t1aOHjQE6USWl+OCgv5KxJEm0Cb8fCDyIp3GPujbQ=
X-Gm-Gg: AYBFou3eXnzFqi20yh7HZTEhFUKqUgjUoedtsAkyuL+1XJ8BZTgVdPKrtltjIaVLy/w
	P4BNXdytu5rBavdzIIoGCMiOLd1m4s0ymNx3fussVjT/bC0lGWDYBtoo4u1uYBy2WdCTZjmSWX5
	uGJADlFwTEvyWio9jHagjVRgQzHroyeHjYJv44VS9F6CBTqq3KTmj48MhXwATtEUFAbuyXbB3Xp
	+SpVZOLt+uFEv862VbjxNzX/woUoK+oqtcdQqIwz46r0wZ66HDdc+7SuENA9dUvdZNY3REUcFPJ
	C5kK5eCEbSlinze4Yl1nRuIDbWNcvjjtJZwR1n+4c+vpg67nBzbP9r5RvpaqxL/kShLk39xUlRr
	RTZvGogg5cnPL
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2113100285a.38.1788778437621;
        Mon, 07 Sep 2026 03:53:57 -0700 (PDT)
X-Received: by 2002:a05:620a:a50d:b0:92e:520a:ffab with SMTP id af79cd13be357-939804af76amr2113096985a.38.1788778437055;
        Mon, 07 Sep 2026 03:53:57 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883be709sm28323928f8f.21.2026.09.07.03.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:53:54 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:53:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] pinctrl: qcom: Drop marketing name-prefixed duplicate
 defines
Message-ID: <yz3tbk24afsqjlggktuollh2bgvdtaac72b6rmmchfx7k2r6ks@vvcotimb7zpj>
References: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-topic-tlmm_define_cleanup-v1-1-accdf7859e4b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e97c6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=pFkGdBQqtmt80OZv5sgA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TG7o7QA3esRlahoOeiGMeEPfmcl_6vaJ
X-Proofpoint-ORIG-GUID: TG7o7QA3esRlahoOeiGMeEPfmcl_6vaJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX2grWqetXiHFB
 RfvXay19O8ILWZQ++hW31YW3W+YMnoquMmvxBvWd4RvuO4rjX6WssimhnCJWKjAm9R7CsWXCFas
 2jEsMBuqdM7dnoyvyCSsf3qbR0Zxi8Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX6WkDOeJxdUsQ
 r0qpahnwuNT3FO6yfSEvXWUoOqeASnQL8/BtFfn1gsxMwFOGnypvK6xUIhX3YF2lajtidR9+va5
 eZWpcwalOyYRIF9J2APYKtPXUudkQHqROGFUATuxLWM/SsDCGlRwg1u4C4VtATQ8KvPIa9bmQPf
 vjF8D6jaOE9pjFmiDi/xyAlKXepYX0SDsQZbD3aXpGnDMq5JpzMuiDit10KcJfFYgHCl/9fwhz8
 E9u9mYHxZ+jkYWbyAG4id+da91Vwi+gTrsqIpXdItu8e9dIK3b+13aydDlLKDV3e3BjkXtXd16h
 CJ8au04RmgvQ4pCkP9ehy+D1dcKdACfiY31pEQStYN0ZH8rpCmPQVtulhxRxpZ2S5ipv0r0VD3k
 utqXaq5JQc9Z2OqBuaETKl+opxQtDQMYbAQj035/rjubbsc9TP2Do7KAU6pyAvcYvGTwAcX1HgJ
 wYzYQaPlJK+UJjUVpBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

On 26-09-07 10:11:31, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> They are identical and of no use. Drop them and use the common MSM
> prefix.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
