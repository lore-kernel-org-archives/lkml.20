Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA49C3839B3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693888; cv=none; b=CYynjxwYW7cwcIPU/LZQlYi7aewSgPOdyyEsqmgCWHpV+cyy7RVRSciGrLwj2cNd16tqDkC7N9qCR5SLSvPvIgJQmkvWgdaqdcS1C+pC0ITu9dq0kfL/YS/APwQpqqZwSosmMeJ8TP0M6berSg+VROJozx1ZF5EDWi7ikegmLaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693888; c=relaxed/simple;
	bh=mJhIpcCPsqDqQ0u74wDgs2yC+8RTbFAPTEYWSK+egTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ipLBvPeubBLfFIfoLGFc6AjOW/qTxYevUIAmN2KsjVd+o5JHz8WdG5nImh5HN+TRY8yCiyiyzuM7T3On3kmJjqNzhdIrl9F7FBMuUyqYG13hSUQc6YfInjafGf2QtW4Uce96JtQyuNolDDPENkp7K8yRtzHolsANdjK9Tc6R+4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CaFQsLhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iRltMWpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CaFQsLhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iRltMWpG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLuQZl2390181
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wmysUVQXhmMNTq63fYjIpjKg
	r6wrwaa9V8vpQzC25KE=; b=CaFQsLhAfrMcy3KHgNuZSgNARpyrHczcppvYt1W5
	UJPqNqISbT1SY4EUE4sHXd621gzAflAEtfvBGQ1LgCEzu2dMqYpd0EWXvkcx+ATP
	qpVcEBQGrnSsl5RQYfpnunNLDifabrAH7cgF3UnbDWnL6m/HSIKrD43Sbd2l7yfL
	L7qhUpV2aYCmBM6O2cTh8CkfyLzLj5PAauAkzXrquK2CXOBcoZakZY5HjLPgVJIm
	awXcrBrw72YzYgts7LAeO/V+XpXRsQSjCG6eNP5xitp2PanRhj3vyDu780hwBG2V
	o/Wlb+qYOTaQhdUp50TfnOW2EBqPQaA3YcX/Dynb4W15eA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrjdrn8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:11:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c85798977dcso212809a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789693881; x=1790298681; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wmysUVQXhmMNTq63fYjIpjKgr6wrwaa9V8vpQzC25KE=;
        b=iRltMWpGXgx/cZ6d0rMvgcfEVjNN8JKNVr/2uLo9EpwOOp2Dh5Gf/5okjC9UCYUZFa
         1uZIwukK8OGTKtean+gYw03Oy6cKZN+4B7IJCk635O9Oi8XqOUImC/5aOhV741BDknDd
         rTlJ1RvlKkjn8ArX+2xz7MaMAhD4Agfa0w0DEzuScgTxg1JuUrruPfk19Npa4oW85Jy3
         ZJbb4bKTgyhKA8O06IpgY9AkPDVaeBbgVOJrOEDc6+gzNOfzZJ7/V/cJ2ibFV21oRm5O
         fgE4u9QKozlJvYE0mmFqPnXd6sBRm0Qypa03fPdz2QPMI7b42bLc7/NNMCbr7fgBFOgl
         Cxyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789693881; x=1790298681;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wmysUVQXhmMNTq63fYjIpjKgr6wrwaa9V8vpQzC25KE=;
        b=s6i37zV4NpseVqyCotpweignFSvBerM+tV8frxK3XvTaTpwxsuoqqZyacKX0/Z+uKl
         5+MbPqclZ8Ucc4p9WLAsF35Bd/vpJ8uXGaubyeG5nN3iVN0SNSJwvq/BJRrS/XYR8sNk
         EMXzCX6TLEeWTSTiLoHXJKStNdM4+LxBRrNdkDmgOujs7PxSEsZHzNAhaCCZDBrWD4YN
         J+OntaJRT6oIzKBQ3yupT+JGNboNw7V5WHfq1PiirunyGv4HvBkZQ4jHl592kl/cuoub
         FCvAf3BYWR2pNnCvUzsP3kdZiDoe+74vesNxb3sgcZzaKDHG8/X6PJrkAQBwP1UOMBXH
         S1qw==
X-Forwarded-Encrypted: i=1; AKwUvBym/IUoKhepbXOg6Cgl1FR/2Cy0RxyQiuJa2ktmpAS7KMBCFk46CuDLXpJ2ogMd9YBFlBJX06B+KeFgSi0=@vger.kernel.org
X-Gm-Message-State: AFuF++nDy72JU4k6oU5V/kCjXj291MVUYQnFNDJDpdCCw/sD7HAo4LNX
	gZ7IxrlQ3xfQVdu4QE6WhbkyL2bLOhrnRYM9bxsJlNvZOH6WO9hng+heM1CiQx4/7YsoevE+DYd
	pRX7hMLyUneq7yXJPegMrCZPnC86CtQLhE+P0Qv3duH6cUcnppPZjrggyrF4e/zrGWKA=
X-Gm-Gg: AYBFou0x2y3ln/QWSYqC4M0vdNVlFi6XxoYJI4/XMa+DcyMukcKkDtQeZ2u+o5dPnzn
	tsGzAdVxOd0maGLyscfjuKgHjbJJXzABatt7CxyTZYhRByhw9211S+RgwxyxdlBRk6qKbjlTdSl
	6ix5CvD1mD6ymm3jsEAA+d+IxlnGSXM6RL3G40tfeMBIwVrkh4rKD+dQhjZDJ5KnShbmfiJxYZ3
	rwKKT0BuFUfNQ1ng6XDB6LXU4X+k/Dw2tz1hNK2BTi5ExnPk/EbUI6mCeDtVi2giY4TNVxcxlB1
	q5mwboyorDVZuxIBRvShOMg+JCZvOmuxuqFxWRz3G0TOzxauDgI8qRheeqT1fQTiujKLzYUog16
	B08pIEqCgjNuBHl6w4BVrpwBBm0fncAS563WL8Jt7FiU=
X-Received: by 2002:a05:6a21:6e91:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3dd8c42864cmr1773048637.9.1789693880831;
        Thu, 17 Sep 2026 18:11:20 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e91:b0:3c4:46ca:334b with SMTP id adf61e73a8af0-3dd8c42864cmr1773007637.9.1789693880437;
        Thu, 17 Sep 2026 18:11:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a1a5sm19633819eec.5.2026.09.17.18.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:11:20 -0700 (PDT)
Date: Fri, 18 Sep 2026 09:11:15 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, linux-gpio@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: spmi-gpio: make direction changes
 exclusive
Message-ID: <aqyPs5d72s80G6b8@QCOM-aGQu4IUr3Y>
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com>
 <20260915014447.282121-3-shengchao.guo@oss.qualcomm.com>
 <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d0ee38b-8ded-480d-a586-d26b3c292427@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxMiBTYWx0ZWRfX0kGbOTiTh9LY
 yLL2cWWyBHNdODDJgGoUfdT1ccemuSU/kEI2SopguVLG1EqNVQ7RBHKzVzYFQiUqWwV4Yv96WB1
 indXX/OoXiiJHZ/7AF3yhSSlAJwcgEoXyhJhfAGePyRCsjoGxFUUag4923yrl+GHhLHI2iXN+wZ
 TBhh99RMSgHrj3r2+dTJPgfhpV8OtV6kfqFMA3oHkOBDrTunEcQfryUkV6FaQJg21suWDxrHHXd
 PjHr0E+ktIj6S69fQj5aJ0v0HoMQCjygGp7vUVm+xCQv/VWAJrms2afIDInCrUreb+eqqO0muSa
 AvINfzrZyA+Yq9tRruHyUQgkBQYjWWRbYe3ov9DOtDxVFInXgxHG6ntw5rv7kjX+ESA0KS3cQMm
 sgng2RaGm1pJIvoCrdtxAWsUXfBbT3a4hmfaH2hPydgRf6W+Umcgs/+IT+AeiJ831JN654s47m9
 toTJNJPaLJU/k5cIWzA==
X-Proofpoint-ORIG-GUID: Oj9hZaZbYgidsSL4XJ_j90HYrtXhYTPX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxMiBTYWx0ZWRfX1n8S+IQVKONy
 97JwgKg/p0m0lZylGCEEdr75TVmD4Lp4ax1YsexFecu8CwioZWpNC1Qxuxi1hemhNPEb8+fpVo2
 aSyQSjJeEMSP7Mopv/A7z8GT3APbJAg=
X-Authority-Analysis: v=2.4 cv=J9Q/fwnS c=1 sm=1 tr=0 ts=6aac8fb9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=HOgYhUj95sWBd04HZmAA:9 a=CjuIK1q_8ugA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Oj9hZaZbYgidsSL4XJ_j90HYrtXhYTPX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180012

On Tue, Sep 15, 2026 at 03:11:48PM +0200, Neil Armstrong wrote:
> On 9/15/26 03:44, Shawn Guo wrote:
> > pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> > the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> > DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> > buffer enabled.  Neither direction callback clears the opposite buffer:
> > .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> > output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> > which sets input_enabled.  Requesting either direction on such a pad
> > therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> > direction.
> > 
> > That silently breaks both directions.  After gpiod_direction_input() the
> > pad keeps driving the line, since the output buffer is never disabled.
> > And after gpiod_direction_output() pmic_gpio_get_direction() still reports
> > GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
> > input+output, which makes gpiolib consider the line an input while the
> > driver is driving it.  On a board where several regulator-fixed nodes
> > share one PMIC GPIO the shared GPIO proxy reads that direction back and
> > rejects every consumer after the first:
> > 
> >    reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
> >    reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
> > 
> > Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> > direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> > DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> > once after walking all configs, so this stays a single register write.
> > 
> > Pads that are genuinely bidirectional can still be described that way
> > through pinconf, which is the interface that has always been able to
> > express it; the gpiolib direction callbacks now mean what gpiolib says
> > they mean.
> > 
> > Assisted-by: LLM
> > Fixes: eadff3024472 ("pinctrl: Qualcomm SPMI PMIC GPIO pin controller driver")
> 
> You should add:
> Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> 
> Since my change added the get_direction callback.

Indeed!

> 
> Personally I would prefer patch 1 instead of this change.

As I mentioned in the cover letter, both patches are fixing real bugs
existing at different level. So I prefer to merge both. But it's a call
up to Bartosz.

Shawn
