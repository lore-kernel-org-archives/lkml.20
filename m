Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EEE499F21
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789736525; cv=none; b=iBGRRzLLGlAeFj8UkRbqVhITPQN9WFrAC/Hx3v7W7MGDRjqImTQevLnrHe9VuuFYpPBgtiCW8K49WCjTw3Nk3qXxBne6nx/i5JkN/rnYMCIjFr/9PGsehibHShWXG53j9/wVOuBGmiiWrOSRJPoeiT0rldANSbkY857VtK9NE+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789736525; c=relaxed/simple;
	bh=y1bPt6F5nrd5HOptM2+x7SSdZZR6HwyHNglhGdwATAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rh2IyfX+I12k6HBo54V6R4tQ5s6I58/LdUIIir5mjzoaNrU0yfr3IP96bQRfpmL1kg1cNuvEVrhdJUTviza5Dqy01nc8u+ySbHaHyUxJE17KCEdtWnILX+ScItJ6LBl6GbI/lIfLBdw2QMpl45BK5nuZpYhNkhKezC8n+Lc6Rd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gh5dBrNY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBC9XPDi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gh5dBrNY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBC9XPDi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ICu1Zf574314
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:02:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKF+BfwHstfALzVlcYgGwDp+dczQ45u3j4MVRIZQmGY=; b=Gh5dBrNYIsC2hxXS
	6O8pqGCerH9URA9GezaB2NtNLgDy7tT81mqkbu+ZxArfztMFmlACeacbi6lnSU8J
	vJWjze88rAH9ZHt8vRcLhdH4kmbexlGUG2P5HIvCIWH5sr0F5hZYDAFUZ0Yqmony
	uelO/RAu+aZthmFXFS1GYiNvsF0H1fie0tqOIY4YKOxXrQlLTBQHjg9cVxHpdYCV
	JD3A5r8KSgZHxkCT/smqduSH5sKnXaDogP932RMBvEXymmdwwwwVgG0akofCdLS4
	XikZljYonIzJvn2vbQgZMFozQO3FYuRnwTycd69dc/bE3ywZBKFAz5su7fBgYm9G
	vvH0rg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gry2bss5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:02:02 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b3619f2637so9406eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789736522; x=1790341322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CKF+BfwHstfALzVlcYgGwDp+dczQ45u3j4MVRIZQmGY=;
        b=YBC9XPDiPaCtsUBLt++1v7Y3OfiXdLweYOKXh4luKUe5l0mArUiMgnsynHMyE5pRf/
         7f50Oi7U2fBoUWLWOlOF96uPeoFz/ZacpCk/m0JHtGbb2SjPVkFyQT6LqH6sicAHRAXR
         OAQqWxqWjhjjGXfKAnQtozcfgyJC/SQjj6c83T3Bt894odFt6Uy3Fu2mUZwe18RuHFIQ
         QsZgMJTM8n+Y6RB9E0F2B0yqMbmMt5/phqy/klzPXez0vZ8JTD1vpr0bA2mqUvOkb3o4
         iss6nuaxBKYSuHi2hbZYfEe7bpedqgtkHP9+I3cKK7Lrhhr/iBo86ff/Te1B89voH6NU
         1tkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789736522; x=1790341322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKF+BfwHstfALzVlcYgGwDp+dczQ45u3j4MVRIZQmGY=;
        b=tpTWrx0SUEHCdRo/i+eM3tMS5dfoIvJEv885rn6EIQlWUyfVZtYxRm3FkazcSC4/TP
         T1BT1hv0+UJ/dsO3XdoKzotCQmHXVlIL/YEAJu471sg8RtaF4JKuOFlY+Jazk+Ky1sgi
         QJ2ftIAC3GZqRl76/9D3cWQ/KtihwTYPHvoZA4V8f0QZuy1rmyJZk+n3vS2TXZsShdFc
         nGagAShtOWWXAlzK9zStj4Xj6dmpJX42ptfZ+kHxYIWy30tenjIJuhIOIrG6LdLfKau/
         7fBPThm+srYfianaFG/BXMQlocj+tiE04gNCvz0QTPcq81RvtjvNrPkDmCAgemwxijgI
         lHIw==
X-Forwarded-Encrypted: i=1; AKwUvBy4U9274uh4X9PSyhXBrLGdD6LgcJfT/WRWKXP1XL26dFDChkw/l1IidWEp8h3jUjiU9UezvEoCYDLg/vM=@vger.kernel.org
X-Gm-Message-State: AFuF++m+M9IwIYrPSzsFgRYNUbg/pl3p7kpaIldnGKU3iA0XBnsYksbo
	/83jjQ6+LkV6/YtDh/GSXBWVYbl0NhEEOGWgkRgBpHuf1bx3f1GF3H2fZh7udA1KQS0rQFzDVTc
	4IPOWKrEZiLwi7VY7rjzP9b3ap9p1nArqKH2bWAxnnZy9FLaJ4uadmpbFSl4mZhbyA90=
X-Gm-Gg: AYBFou1upmIs2M735CsQzFIbKkh/eujIVKjpEBB7QUqLff3UyNxSN3pQcl10+mZt7p3
	d1xzDOdZXuAearLsF4tWO0E4ueFq/3ECxSeZ9mseYqE5Yh0MJ3XHpXLg/hwva5aJSj5+fcLWIDF
	cLVv1ayni6A9y4KxBX9gpNF4hwuEujEFuem/vAcye6tb0pvCtkH1l12Rs8znC5IM03nk9XcLa90
	ywjdUDKv5HfO75lXrXj0lvxT9k+7rx8mpiovH7Sf08ypCljKoI3jrDa9l3Tq6/fawMF0Yvy3DVs
	N4TeEWz0IYOB4cxoQjAcGqtK2GaULi/cRDPx31gCvoi8udOtfybdFO4GSBK+xZzI+tHspKzV38X
	idvTiaJsIm/ejvYQmPJH7Gw==
X-Received: by 2002:a4a:d857:0:b0:6bc:dd88:2782 with SMTP id 006d021491bc7-6cb1f3eb6camr1100931eaf.0.1789736521972;
        Fri, 18 Sep 2026 06:02:01 -0700 (PDT)
X-Received: by 2002:a4a:d857:0:b0:6bc:dd88:2782 with SMTP id 006d021491bc7-6cb1f3eb6camr1100874eaf.0.1789736521490;
        Fri, 18 Sep 2026 06:02:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58f3236esm815027a12.9.2026.09.18.06.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 06:02:00 -0700 (PDT)
Message-ID: <1229ea97-9972-4cd3-9697-ab03c64c3fe1@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 15:01:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: glymur-qcb: Enable UFS
To: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
 <20260918-glymur_ufs_qcb_enablement-v2-4-16619f7e36a6@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-4-16619f7e36a6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfX4dB+hBAs70i2
 NLH6xinJFU3/QIGVb7HBwCtX2UXw1VLGNMhS8sw1dMokDUYs9ac6f6rcVtKeW4GfWm1ktPJFjsQ
 IwnmrLD/OM8oQp3nZCVIrsH4dPSCZiCDA0VzsyH8lpkqGAmyTuuVMGjeJwz2x8R4UmYI+08fmaW
 eNxRcyvgn3FdE00gfR8v9E3OYn3j+uj+5+JR3UkX7Pac7f2NObhbvGMmt9y2ijhPshOtTJRYLpz
 4Mk0OROdLF68qbnWmzIxYnkfjiQgscN7Z+cOWwRB/GVcB4F+1Euz/WuYhkMGZzGhWtjk9F2aYXH
 DR4+t7X1vfH3VGxnunRfTpa7B4FOcjJF5fMX0901x5l8hITsEbgjLL/aNlbmR4u7tVvp2j4zlMW
 lNv98DbMhTcW6yeXNfQtlbDkWDBljMZl1rPcjCVfYbLkBjp2mVXBC6looSgxsf/D0PrPkl3v3bK
 vClmAp/evCXcWUTk1Fg==
X-Proofpoint-GUID: x8vqYppevc0PF5H6GP0-R4QSJ5Si32AU
X-Authority-Analysis: v=2.4 cv=bYP+w+PB c=1 sm=1 tr=0 ts=6aad364a cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BBNwevgwxSeHGHzN-EcA:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE4NCBTYWx0ZWRfXwLwRjJIjj2Ip
 T7wXb1bpOj/i7WbwpUQnfWJIAj6y6u5tE5cbLjBfZqk4Yj1W+wS/TamctqmE9fbtAWLFyqPKC1P
 am2eRn2SwkvpmqbhFZHeXYVNZz3Rn9k=
X-Proofpoint-ORIG-GUID: x8vqYppevc0PF5H6GP0-R4QSJ5Si32AU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180184

On 9/18/26 12:39 PM, Pradeep P V K wrote:
> Enable UFS for glymur-qcb board.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
