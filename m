Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1923740BCC8
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274197; cv=none; b=jtykkwgWiag91UCBzAD7uxiwTbHrJ67qMAtWTdCFs5bkG9kG1rSwBCOpN6xtd0wnHA4oaCuBvgTzbZBAd5vDQj7VtKKw+k5N9uzutFXASU4UPyB+RyxErzSNX68t1UQ4QnJLo9Dtr72LTv60yTXWx6TLh/mINXAjBP6Gqk49QAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274197; c=relaxed/simple;
	bh=oQ3cm8m+Vrx0gjPA7jzySxcyyOY42vyA16mLgvFWbK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iXMPl1pHtfRRURRqMuIrr9pib8AbAq8PIIrgm8LiMSt8tjEjQE4tP1PLVFCLEz0WQCiFt7AGYZz2mLVwiAAUDj0lU1C9e5jdBamT5dpaxLNXarWcC2SJPvpl9J89MuBYLv4Pqipvig6+dwnUNSE6L9T5XTfu76/OvRByzKyS75g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgpveQ+J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ezaQccZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgpveQ+J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ezaQccZo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8raa2217330
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:49:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ASyO/UHu81+4tc+FHnlvZ1SX
	IpfFftTRiBx/6D9Fz54=; b=XgpveQ+JT11qyb+b9igFAS/UnnOvfS5gVIG/iGfk
	/8r8vW2Bt+U7Wa6Tj9BEHZ5OsERmBnJ3fpqemL3vg2i23rgawVLkDeNBnIoJfBGn
	lTfg1mEXuoV8oqjFUHWwnI0ORJTpzBDrxQE7rr9SRnZoe7hqyxq0TtGwuUy4UwAr
	MXGxC5jtAjHR8vxgeIzv7xCsEklDUBjyxnQYRx5MP0+/gWstXcjuRQWBc1/2289/
	pFnNWTjo+lNLaWj/iMUlHbWI1j8yvv6Eqw6sxg7lrWi5pB4bxmb55FkELh6O9oCD
	nyknlVHUS40qk/jmid7QfvIw3yk2I4dQ5MQhMzIGszkijg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdndxb4wu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:49:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930edb4362dso682458885a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274194; x=1788878994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ASyO/UHu81+4tc+FHnlvZ1SXIpfFftTRiBx/6D9Fz54=;
        b=ezaQccZo9tbMiRiNpqXYwFDmEx8OBRKH3w8071XqMM4CsAe0BnWZ7IJvFovFqUoTCk
         rhJK2TeG0heN3MruzPhdk/IrPt1McPRjjH3SET1q4cQWUJin8vQvibi4WQI7MSpZCplx
         vBx/7ywE8BpVfuIu9uirKPwQyHa5kqb18bV+I29cBgbHNHAk2w4S07DtfamDDFjl+lXl
         UrdMCun4WBqAoRaKBcVoRLdeWIe4WBBmSVZqgb24ut9+AxoKo8S8vUKpzvxkRDLrLRMy
         Sy66fjyBg4+eY9Jd2Q/mI1q7xw9lcOMB9KQAaWQGSUhHKU54S6WTrfHE8YSguUd1/Dh6
         krEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274194; x=1788878994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ASyO/UHu81+4tc+FHnlvZ1SXIpfFftTRiBx/6D9Fz54=;
        b=fAQsspldD93Juk/tt2qimEUJOLeoXD5QNxYcPyj2eJwOVNtZjWlXJYNQ0jsuAxOvUv
         UIbI7GKfYewCfQ1K19CKnBYO5YU+5gPIi3enZ08ZzYA0tOxRBA8uiMoqwH55NQafPB5r
         kLz6dx39Smg5O7fkwTCV1fzD06/m4oNRj++vhndbKi4CpAopH8wn1MyWWGsK8Hy/66e1
         EReTiQQ85ovrkBS++dqkDa2CpIdvOHwkGotR1KoKHaM5bZfFXqrxGgWIDxE8CAsVqBuV
         haP65l58on8jxEN9HU1fOWGt41A/d4+NohBdY3SlCuWXKCvK5zKMvBty6mwIWf2cmtU6
         Va2g==
X-Forwarded-Encrypted: i=1; AHgh+Rrf6mSA3XbwRLMMb1kKh+0Mp+t/gv56qJeUimjClag4DudGt49ZxJnFWgvJEggtR3FlIfUN6XM2tcv0CmE=@vger.kernel.org
X-Gm-Message-State: AFuF++l6M9WAk3sWbfAAzH60OdCKw49aFjqeMlKsTw+KA19ZsraR62V+
	VSilMaFc9DAywKHNF9F1txu2m7VlCg2yOWWGPH0SZUdU95L040JYdo/dTFJ/otceIl4wv2eIOqB
	F7WCJmMc4QtpRXvJqJzUO+1LB3KNZ2FvvbYb9Eh2BPJldEqMyT55xRrB+BhhezM5CpOcqyrRgg7
	Q=
X-Gm-Gg: AR+sD11xxSnEyaKfbtdTVTyzwNOccA6wndGEJiG1JFCFq5f+WvN/Qje4xERHfMzXmWp
	kqNsAyd3QimYweQiiv4QcnnlN6xwBLSa3fiTMO91fdXtsNO5fnz3WIUW7Uk1J/IOJ8hlMNovDyG
	llffX7tb/nJfH+4gzeFIZ8ZGF82QbwXKL6C5HcnG5AMhidjcvp5UbZFLyxMBSGkh+wq/F/fxqjd
	gGq40qcpstH9UA4/vsAEeOIEy+y87hnul6a6MQYh/6KE3+p+0aTBiDuqZOE7EI8Fdair4D0pSwK
	5bfKKMgZyUwPl6pCQzCwyLiBU8xS/mZmuZ5BNE9kSrHUuvDvVKKCzWMvUId1fvKgS/bvkp4kUEZ
	uExYYPytSTACZrg==
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr3062395985a.36.1788274193462;
        Tue, 01 Sep 2026 07:49:53 -0700 (PDT)
X-Received: by 2002:a05:620a:55ab:b0:936:afa0:3661 with SMTP id af79cd13be357-939138df41dmr3062384785a.36.1788274192638;
        Tue, 01 Sep 2026 07:49:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d6e826sm5215392f8f.19.2026.09.01.07.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:49:51 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:49:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Abhishek Thomas Varghese <tessolveupstream@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: talos: Add RPi Touch Display 2
 5-inch overlay
Message-ID: <qvgc6ku5gnk5fil5cnmwiji7552ouxdqt7oig5lxqvarxw3aw5@4wd7imptam5a>
References: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901-talos-rpi-touch-display-v2-1-40f0e92b2071@gmail.com>
X-Proofpoint-GUID: AsmSTbeB5rxwAm6fhNeY1cf13OZdDrUU
X-Proofpoint-ORIG-GUID: AsmSTbeB5rxwAm6fhNeY1cf13OZdDrUU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX3q/FPHV7Lw7w
 zYuXFAYXmUsfYHa1bmTLZ8VHF/nLNQpTl/uYXqX6uhOV7KYTjaltIML8KuNmL1Hc5Y2pjCalKhK
 Thr1smKt6tIXF9lCTftcKLJgsJJPO0M=
X-Authority-Analysis: v=2.4 cv=U8eiy+ru c=1 sm=1 tr=0 ts=6a96e612 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=23Cz_ppem3x0p0_49vMA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX6jOjU9pbggOl
 gS08MOQYx7mkBX0E4Q5eXYA/lOinLKFcce4QYqVKLtHtIY0TPK9iryLbocXGjbGfkuhpzhioCgX
 zDueN6sPvL09HWP49tXK4HzmQ2sYks0UgLOdnKgqb395PKX4YZfHrFofS3w+EtpqISlLzkuaZNm
 sp4lXJNSeCI3SCGd3FICYjvi21KY5/IVaDn77ThTeWnVNNQyaZw4WqGIfYoMQGPq3IWuzkRSu3n
 gb3e7hzNiaLIdJfDR4sR7as3wHBh6qvWDl3xGmMfg1e0qZO1t1bjWUoPyaFJxnWsSXSYLGefQcA
 niewch8/ku/GxQ0SY7NKFfyGmG8Af1JqxNymNAIWf2a+bn/R6/3s6tMfBwUxCh04NUWALOZ9Dz0
 u9I2ywDnjqrcfWpWNjNjHxK2uYGQkNz2SNu5kKLqdxnqH6DqTzpEC2pauJkfyEDiOYRXpcGLYxX
 3nPYHcyhfsj4LtoDJRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

On 26-09-01 15:18:24, Abhishek Thomas Varghese wrote:
> Add a DT overlay to connect the Raspberry Pi Touch Display 2 5-inch
> panel to DSI0 on the Qualcomm IQ615/QCS615 EVK.
> 
> The overlay describes the display controller, panel, touch
> controller, power supplies, and backlight. Disable the ADV7511
> bridge to avoid a conflicting device on DSI virtual channel 0.
> 
> Display output, touch input, backlight control, and concurrent
> DisplayPort operation have been tested.
> 
> Signed-off-by: Abhishek Thomas Varghese <tessolveupstream@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
