Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878E4FC8C7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789555367; cv=none; b=iiBdbaMMsglXvubzLp9FhsnWOUrWzWEjDzVtqaNYBAc84F5Ii0YvNpqoAaynHjyM93kvKazQY+8+p80HetSSQxtsuXOoayNAuRNeuZ0JmVnvcUs0lGJOIy1ZOr5ehPb+ejszzn3+CLt4cQKfzy/n//3p297kQ6/XmkASVrKDgRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789555367; c=relaxed/simple;
	bh=UuOyDVyJeFbiCVINs6u9sS+zhZ6hq8NLiSsmu2mcank=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0EHwjXZ8DLnT1dYfg1za/Yd+zpm8sEFWPo1BYRx1KJcZB7bmPF1Iq8nmz3+ouTeNMcQO9N13uZEJ/6K+CYPzxHUy7wziahuB3yaQTvR3LKATUqHvsOPttUd4N9t6K3sl9DMiDGh95Mcurk3q6mkdGhl6bUcvSICXTcpl3L/5nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TbzJo7+d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V9970Zb2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TbzJo7+d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V9970Zb2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934xH1587265
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XIEuDNYC2iW3h0x2HWVcVoAf
	DPrD9G8wcsAY2SJCqlg=; b=TbzJo7+d3AekQrHqciGIaV83lHNl2JiC3Sdpou37
	W9AFmny++RHIe2QaaUkAfIXfikG+dLCwFLxGMfl2M3A4GS3V4rP77L5MMRJNZIHr
	1xoIIyryOONURoCynr3VWDOcQvF2nCp7owl6htznYfJFPC3t/ZHVEjv8nTrcdk+o
	EuOA+JB6hURQOu2NRQMC5xB5fFymUrcb3Tpo8EIFJTpSCv6RkTk9sGTBJnNwRk5J
	FbZDLzQTKgHSPCO8tAyF0gsGTrvVJTFdZt/4P+XTn+5O/2aE6VlBnPe6O5fGNqC7
	pgb9qjUtBYjgtf2GMiWHdJDTeQfubkT8zdJrqDc9oAmSDw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqagektuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:42:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90ce8ad8002so124849486d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789555360; x=1790160160; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XIEuDNYC2iW3h0x2HWVcVoAfDPrD9G8wcsAY2SJCqlg=;
        b=V9970Zb2tUguhMxp4bpUT6Dtz3rvZBOWPa0tOIFmcLjbd4ihG5UVevLNkRxC7EUxgs
         SiX3MFtok9g4swomK0E6s4BGK7IKjAH3fr5hkvgcV4eV3nwu+FrpSmF3pVSQD2OCyRYk
         Q/1Elkxz+8yKJ93T5Vf4SEGNtovQSWKEOpjHk6QFafKSugtIo7dejVo0qry80+8vO26I
         qSvAjOIfUmKOzRl1eQ5jJ8jegHtbRYa46grXbSHES+omb9/0QWigSneLJiA4MhVgrQLI
         AsLGX5MNLRX3do9ECAXBEhPkCA7c88mKaba3KK0/dtHGNvuHaK8yEtvHIU1vMfviL7PM
         FPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789555360; x=1790160160;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIEuDNYC2iW3h0x2HWVcVoAfDPrD9G8wcsAY2SJCqlg=;
        b=JrPQj41qGBGQ/OHSu3G5ufpgfaE6iO6bq+LgzLu61Fu/40m5mpWhuCRLPQMO+bf31Y
         ZdaM47ST4r7oqgCS+RkXZXZmy7OaNV/qQZxG+soBWI4o45jbl6lm4Yl1aM7LPITZNdiG
         5KQHiKbgkZlyLssViBZiH8whX2yzIeiSSfQ6frCupkInF452jP14p7qD4ZNVJI6d+UQV
         Jk1ZxZUax1KvEmWMy/UbOn4Mw0xQCDHcnrQBRI1i5CO9U1Xh4kn1Y6gx0gauwvLdWwDX
         fxU1GCRlnFyrpLEk3w6e4mVWAHeoF2L2MMxM3aPEzJzjbamvoYXXPe0AytSRXqVouvnk
         J7NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWdWAi/kOPjd7w014KoGcVKU+ca3LXO4b13AJSXVAmSXDqICKBFmUE9LRstt2Cr6SgQXVFY+zAITdLbAo=@vger.kernel.org
X-Gm-Message-State: AFuF++mzQytnBsO4q9IlMe/YvQKQE/flIN9sYjtpa/jWKc+zcsmG6Bsf
	LbsE/TrAbrSa41AZ+kzn8gTD6cwQuupISq438hkGJZ23TI9IaLiTUnamkwUQeEVYnQiqNOTQ2Yx
	2DCZcpL7+E6UqehkAYiOfin4MAjCQ706CVvozSKRH6s+voq3d/eeZV61se0V7QAZXB5YrrnNijV
	w=
X-Gm-Gg: AYBFou08ZHl3XZD4q0JZ3VD9gIBO1uSAiKIUb48YVVjogW4xyjV2SQF8YTz/TqLpyNm
	h6Zlfm77wRZMObAkWHQ3ekDKi3w9k5F+erzMLIwFY/sd72D1o893C3cLdm6A8tvD7142EgxTok1
	hRw92L9MoRzvj1Sk+J/ERGwYHmWzz8E0R1Yum6ueuRUSrTuNLwWd03bKCGsqtpAcGNfFs8fgsEf
	88Agmd1BsTotygMkMBtw9QCQ84wKIIUiTjHxeMUUYBbWC+TUwaDcy7DG1HHX43oFFs4GRmH9AlC
	xVsYDWale/vDp3Xh7zvC2Db/UiI8oszaWdEQiOEWiSW1d0QgvklC8NtCElGKeO6XSWabNqSBGKt
	3RQNw4BQFxFcQ8PE=
X-Received: by 2002:a05:620a:2618:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93bb7881a08mr317147385a.28.1789555360464;
        Wed, 16 Sep 2026 03:42:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:936:dc4c:3bf4 with SMTP id af79cd13be357-93bb7881a08mr317096385a.28.1789555354062;
        Wed, 16 Sep 2026 03:42:34 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm78780185e9.7.2026.09.16.03.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:42:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:42:31 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nicko van Someren <nicko@nicko.org>, Chris Pouliot <chris@pouliot.me>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
Message-ID: <oorz3qknsttz5726g5ypr6ypmlo6ucqz7hrjz5lvrv2tgjbugo@qaalsnqnkbgj>
References: <20260915-zenbook-dts-v2-0-41de8669a7a8@oss.qualcomm.com>
 <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-zenbook-dts-v2-2-41de8669a7a8@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfX8+0J8qzfn2E3
 Bdnh12u85W9mnMvsE2T81pASi7lHuvupdVh5P5ArpyDGUuha5fxoYbBoaSbTWof3qvFhmLHCrif
 9OJFdXHGIXVjfkgG3rQBEkWtQK386NI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE0MCBTYWx0ZWRfXzhvg1CONEusW
 YUF9arekkLdN2J09btmnxBAN0r0govtTZXGckSmAtmms8tkdVgUmvw+1jF5bfr/nqoTYGMQQdhS
 czAvOgw+jtervrb9jLIbuTTnsQU8JoAQvpgQgmoR8OMKEnyYhOEzqoGJHb68qhs13uAynhHQdbC
 NCQMU/xJtmbkxPU9Lv1jpOqr68eyupF37MhZyfoIEvhMyGvmaLBNYDSubmBPU+uJafvBmtIT8mG
 GMrfP7PrbcIua4tRHDN/dmqEU408gyHHABFxLfMx7FfgWdPARrGxMCQT/e0tX63KggV4tug14Xj
 +QrDfFGg6jL6loELk2AgGZhSL8cH5HQHfMLkG1iRaKyHnhQtOUY/v486Y7ydOX1hQuKYc5PgCLQ
 Ufi3LOOFKEms4w6XtYQgl4h750csPPNd4motaiCX/Iy0Z79wYad+s3PFKXxr/ivJrugjiuU9x9X
 oaR//C5ab+N+cnvxQ7g==
X-Proofpoint-GUID: 2yvL9GBL-AbojMeslB3C4dCa_AoFnL3U
X-Proofpoint-ORIG-GUID: 2yvL9GBL-AbojMeslB3C4dCa_AoFnL3U
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa72a1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=6LU_cUpum_TGSJiRvRUA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160140

On 26-09-15 20:54:23, Bjorn Andersson wrote:
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
