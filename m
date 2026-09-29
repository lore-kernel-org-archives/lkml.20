Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC25038F9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790690892; cv=none; b=qgdKSzoKEQPROELFqu4mYsM7T51oarMR64dpq0BoLh4oWOJxTBH4VOupzYMeXKbLN6xlJYGgtiK7ugiDYSpsg0Ue8c0ZJ2U7iIu27h/OyboPkkhaC6wFACqo9dG2zKTBzFoqJYTqFGXXlBdXo+nmCfsuI8kbDTvXBxb1lxZUGRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790690892; c=relaxed/simple;
	bh=/Z3PaVK7oAFmp3iii9Qe4p0K1MX0L1nF8sfYd5gbdz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=auqGCSbAQV7T7tWQX0YTlbpZ/Lhq5wetqRrw2iCKkKIsEhA+Azy5YN/E9aiIqT+ht+MQfkrWW8K04IjKV2V1JfqbJpUzws0RvqQa+JKVc2BHtgfl6ajM4poRSaRtW4uXBWHLsyo7VZnZHnAEsIoxMRXcICER6nGIncCc5rJ6z7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CwsMkXn7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PL6zHb8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CwsMkXn7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PL6zHb8I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCvsI73300553
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:08:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iknpj6cjDsgT73juSTDvDpFp
	aBzMbtR1nZOpTbq3tN0=; b=CwsMkXn7GPMQoO96BVR6SI78E8zRgQyQcgeJiUkC
	4rGCxH5UliEujbfHR5KsBbRi7nYBxoVWvGbQLjXADst3tLSHhn+iKzqQ+0B88Ql2
	DZaT0FUDj4T6aW8vvDVZtRHiLEN7p3J2m94wHRq2apGnaDLWozwRZ9+sTH378lgi
	Wa42q0tJZ1hMnN+hzsW/IM0uhWDIuVqs7ChzFqJI3XysdzchvrOFLeXQ8DSIBbh6
	hhABNOC7AX8JRBx8kZoB5jX6oKh2ZEUJqow3u8AXQnb7/Y+mpkTeT1Uo9gGOAqbH
	hlOn9eoQYXUCYNbHayz257wLfz57+51aw2HqaFrY/8R6RQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0dsx0bmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:08:09 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c7f887ac6bso6350028b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790690888; x=1791295688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iknpj6cjDsgT73juSTDvDpFpaBzMbtR1nZOpTbq3tN0=;
        b=PL6zHb8IkC8uK5kYTneDDBswP/pk6rUKI3k6ui2ZY8f5jf2WUPHnQ1oJWZpKGis+2b
         bRjLkmo90k+v/xjp49q3mcUsMb35GMjj6qQiRGTOvbXu6Lol1BhW2XUOO0kZS1mPQU8r
         XajPCf6f/M0IBZX0WGDz3QjNpv/TCB+NzXoM21La9zCOmg9y3Hr2dX6e+0W5P1R0pd2o
         bluTTcWgDGO6M6VyceXC9tx6rZ79tBJN1J9+uOlneX4a+jyQ7ZrVMS8FEFJo/WR+3sfY
         9+hJfxkje3kAOg1AwOs6wpmvCJsPbpEAle1AesYkkjEogVmBOep6JQOD3GUCK/p6l9j4
         lXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790690888; x=1791295688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iknpj6cjDsgT73juSTDvDpFpaBzMbtR1nZOpTbq3tN0=;
        b=vEDIm4a35JIdDLSI2LYEsTUBuzWSB8hn1oIWbZrIxaV+OTNUY5aDQ/zpu42dTEwTq/
         Bj0sAR6NxwyibjTu0RRA7UcYPaYNKrKYqtfyNJy0BxWpCc9B2w4cXfI1LZrHm8MSgdWj
         1D2QLxK7lzBjNX96EZAzMBk9tLEshWkyEJXGRsJErcMZbueNLqkjVhprx0eonfqvkbnk
         LUGNy0izxoRaClBwH1aqj0dEbXj48Kz7Zp6OC6c3FQm+RC/A5i+nZ01yGvtvwr1EZ97X
         cE0XmyS+tF3FgWUT78TsmJFoKOQ8GZyNQSLx4oSiBJKpUMXfWL8500FFph+NzT2HACju
         n+Rg==
X-Forwarded-Encrypted: i=1; AKwUvBzpCx7Q3wpEtIcD2TPD/klXMVOohr/+fs25Kbu5NGOs3kt4wtRLFLHqikCagzf23vxhfIJ4i/Y/OYOc+gQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kPYmb9zyCpNl4DVk9i5Ffpv5dnYzHpHMh2ySnkoMXkj097q9Z+
	dOFMaROh/kialZ2Ga7KeTwIF4+pSBKZFNAk02lgrCmpizikNAfs4cGOWZWEc2YlvVwtFDDkBdYy
	KSRU/4Xp/husSZk7ZU6WpltHys0408Yq/CIYVfUYhRuzgeZN801fGH4/+RcvLLgIvyIc=
X-Gm-Gg: AYBFou3CQz+bsvzY7Qr7bYNpr2G97nst8Atj9DdsbZsMpSZ3if3vevMxO5rbTCxUE3j
	JRUQI5wLFLzKyqN+77EX8gYWlpOmN2w00D2o8Gdpqy92WiaQX3B2TWrOU7VOT+tDYN8A0k85PMx
	i8XnKSAyE9K3VWpmkiI/BURyzR/FWakGT0Gx35GkvciKXw5VgNqAdXQ50pB+xPQnyQYT+RD6Dll
	54aw4OhmWKBOhoKupEJZEBcvio39wZGJ+8s6ulaW4h0/XKAsbHh0/7BZpra+1t1wkf4ZhUd7t6O
	llqZw88iP48DvEdKP6O8FMdDAMprM7sI+Pti0+pPgkKwqQgbduL5RTumLRUfTc5UB9tuP1BAoun
	gJHK9sKaHNzdfzkcoRPYFZwvqAIa5ej/AOzavr7LC8A==
X-Received: by 2002:a05:6808:3c48:b0:4d6:9222:9a19 with SMTP id 5614622812f47-4d730c6809emr14819257b6e.52.1790690888266;
        Tue, 29 Sep 2026 07:08:08 -0700 (PDT)
X-Received: by 2002:a05:6808:3c48:b0:4d6:9222:9a19 with SMTP id 5614622812f47-4d730c6809emr14819209b6e.52.1790690887748;
        Tue, 29 Sep 2026 07:08:07 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49abdc4ccacsm1106138fac.11.2026.09.29.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:08:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 22:08:00 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,sm8450-videocc: Fix clock
 inputs for Glymur
Message-ID: <arvGQKBY9DZlS2EJ@QCOM-aGQu4IUr3Y>
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-2-shengchao.guo@oss.qualcomm.com>
 <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-visionary-hospitable-beaver-e2c1a5@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX42r9Hc1E/VOo
 xeK4pJQpbDe1Dt5OdJjWdw9PFPI1qkAHF4ELCRjVsdmCwcfFH75t5wSs1inykeOedsM/KPQqK/l
 MILx7bsVIjnZxVS6dpUiPXf7D2iK1fvFz8GnCMOfVoofznpG0c9ZHBUULgEDFVgGRR/F8/TABTa
 m8OrDFnPasi5RqQUdr/ZvLQ2KfE/RxvoNMh+0nVJjGxBj/ps3N79ajlkLxIRaH6OCGIFmHZ1v8r
 A7GYjY3JfeXfUfXCuVmvBvHQd8RwIkDuAdEuxpoQFntzEwhryxOdBn1T5LCJ6qztZLlYa7tfTFH
 UXX1+Ui4TUKUECNW/PiXF3/c1EpLSe8xn3kmf5TIohR25iaMx8f6R6t/Wm9kU0vqRfV81Ve3GHR
 k0fb01o+0ZxfJjlHzvxOP2tq7CHcv6OfuzNRA0z9lxXrU5kp7TztZLjwoxUEG9ePV19t/rVBfKS
 pIsTvMbrztH/3MiQP/Q==
X-Proofpoint-ORIG-GUID: 8I637QRMzojUUqUrMVJ7Lu4Pw2NYFe4B
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1NiBTYWx0ZWRfX+3nxgXdLnLbh
 8ilg3yoIuXHOUv+FvYiCk5FM/bOVtc173+ZkIYhJyt1fBXLLSyV81FfTlTOnVZqrLllizc4EMle
 T/6KFBkNIrG/ICWBbK6C5C4+eBoSRIg=
X-Proofpoint-GUID: 8I637QRMzojUUqUrMVJ7Lu4Pw2NYFe4B
X-Authority-Analysis: v=2.4 cv=DqvDa2/+ c=1 sm=1 tr=0 ts=6abbc649 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=AY5MHz9oPD_TeV_maQoA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290056

On Tue, Sep 29, 2026 at 09:57:40AM +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 25, 2026 at 12:11:50AM +0800, Shawn Guo wrote:
> > The schema describes exactly two clock inputs for every compatible it
> > covers, a board XO and a video AHB clock from GCC. That is only true
> > for part of the drivers bound to these compatibles. videocc-glymur.c,
> > which handles qcom,glymur-videocc and qcom,nord-videocc, and
> > videocc-sm8750.c both declare their DT inputs as DT_BI_TCXO,
> > DT_BI_TCXO_AO and DT_SLEEP_CLK, and parent video_cc_sleep_clk_src on
> > DT_SLEEP_CLK.
> 
> I don't understand what you are saying here. You are mixing drivers and
> compatibles.

You are right! The argument was the wrong way round. What I should have
written for a schema is the hardware, not the Linux driver.  Sorry about
that.

Per the hardware documentation, the video clock controller on Glymur,
Nord and SM8750 has three clock inputs: the board XO, the always-on board
XO that feeds its PLL reference, and the 32 kHz chip sleep clock that
sources its sleep clock generator. There is no AHB clock input
on the block; the AHB clock the controller uses for itself is generated
internally from the XO input.

So the schema is wrong in two ways for these three compatibles: the sleep
clock input cannot be described at all, and the second item is described as
a clock that is not routed into the controller. I will respin with the
commit messages rewritten in those terms, with no driver references.

> 
> > 
> > Because the schema stops at two items, no device tree can supply the
> > third input, so video_cc_sleep_clk_src can never resolve its parent
> > and registers as an orphan clock. It also documents the second input
> > as an AHB clock, which no device tree using these two drivers passes,
> > and which those drivers would interpret as the always-on XO.
> > 
> > Describe three inputs for the Glymur, Nord and SM8750 compatibles,
> > keeping the existing two-input description for the rest. The sibling
> > qcom,glymur-evacc.yaml, whose driver has the same shape, already
> > documents a sleep clock this way.
> > 
> > Fixes: ed9ca8296147 ("dt-bindings: clock: qcom: Add video clock controller on Glymur SoC")
> > Fixes: b190eaea5780 ("dt-bindings: clock: qcom: Add SM8750 video clock controller")
> 
> Are you sure that you are not reverting review like it happened this
> week in IPQ? You know, the trick with reverting maintainer's review I
> mentioned on DT IRC?

That's definitely not my intention! I know nothing about the trick.
Would you point me to the IPQ thread or the IRC discussion, so that
I understand your comment better?

I checked review threads for both commits. Nothing seems to be reverted
here. Or if you would rather not have the Fixes tags point at those
commits, I'm happy to drop them.

Shawn
