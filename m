Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491949;
	b=MzRM0MOmi9EyT8Zrx6/4bjVyKo3o5DiE1EWbBoLmI17uehRERna4oYHxIpILKKjUKm2m
	 P6HgSfb2HEGSJschBPKMB3QmxSdwTvF56+jlvYd39nD0XLGosVIHLUHw+kJUlIk1Hn+u3
	 6GWY9FziXkjCQPuP9TzBMtPzh9AqwOkxouy62iExrEdUDa3I3tNO3M5O6u/23fznpZt27
	 tC1/JPNJNK45mqQNz3n8PKy+0BYeMkodHavfd+D6MpuXxc5M1TwObsWjG19+tXCrsZpnk
	 PYDImneGhmILN+i4x1uoVVD2SWOF0FS1bCU1HlrAASO5rQ58geOG5E+ruSY4Bn4wy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
	b=EcaSnrX07V/MSD8aVMZNxiXFhjek7eTXDQeKWqnzsTE1fBLRpiCqzXTSj5i5rULd6erL
	 1w0mlOle3Jnw5hIAHIfho4U/KZwyZT73naPsgBd+MkllbHoSLv2gwrbqhNTxtTCGpRuUE
	 SdLZC0rG7Mi+wjvk/j/q9nrPO1SUrOmzDLmKEJAsNXi9KaFWHCvtUm4MCK2de3mE0yMBE
	 hmCf2w/3qD2u4FylTJcJ3Ha40HzLJZkuy1TiFgxyNY1Ab0ainoGTuHeD/sCoCDXOyV+x5
	 u8BFqzL8YbpCd2X95VfpUSJL27NAmfhAkohZQm9ymYjlJS6vdbte0uyQ1I1Lbrlk0aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cb56eWOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeZoGGJL;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E01606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:25:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20E01606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Cb56eWOg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GeZoGGJL
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8OKHM4032275
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mLeqBaTgJ20aTc9spiaAIGrY
	YecfKuCtitYoCZ1tdAs=; b=Cb56eWOgfpOLdx2wuarL92jytqocs3Wb/IfJOJ+n
	ywjf2DWmupscEzijhRAnP6mg7ec9w3B5lX+tRC48KQdVtWyDOGoUGs6bUMdHmUNx
	E9MgKujWpKCGjKkN4u72lnhw1jmpbgAUOhJj98MsYazjPmVxB5JdDYXbSAWYuUPJ
	dWaIFAFZUzURTS/f4hvRbq8MVes9C2u8XH9bI+PNuE3WNNZMadp/3qanXmyU4OKn
	EWBAGspfIVLzRJkpDfDX1Ybd8MX/6rG45XyFFkuFJ+lIycMkyH6lmtg5GSp4LlP3
	P+XxP+ckB+J5FhfkQiqG2AoHoakxbHFt7ONkQuE0Gx6c1Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5qa0u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:25:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so631115885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792491947; x=1793096747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
        b=GeZoGGJLsbNN1cpmEcUUMWC79peGPPdwgL4jctkKkxspURbnjKGxv/Pc4oeoHvDJcW
         a6/CC5zfpuSVxsY+m3F0oUHWKpw4GIAjLSKHbB1pJ7/DC8TFWkFyEp5nX0ZooUg4lQW7
         SF+hdYLEBQ6d8v9923f19OY3E+gk9Y7QfoxdHRa07jb37f3luNttYkDenlvDaEwKty4Y
         H/A4sx4+K8e0xBdXW1LoA1kC/KpYpBLQi5PajQ3tCFFnepNaybRruYASgZslvxvaiiM8
         hBDrrCtOYw0yXLPnqKp8qebdnj7NfK7roDW9LkaC9hAtooA4hyyx28EBUg5ErtuOD1Tx
         xegg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491947; x=1793096747;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLeqBaTgJ20aTc9spiaAIGrYYecfKuCtitYoCZ1tdAs=;
        b=X3gMEExWlIUTIDYww8VEaZVA6kNhB8cJMpKCJOXRwMFqMHoEVSmgyJZiLhdbwZnCT0
         rlOvZ1d7JFoco18hPehmCfsrs+zeD5OLF4BFSidzpcOrlvGMEVkRoE8IcIjqCy6s3AqY
         L/LhWS5VrHg1FGu3MB0E6Uc+U3egWMw5OPqf5fr5F43IZ1mqd80K3baq3fUi6p71kQVJ
         43MJ1pwoXPTv6Ly7UcQVMJ+bUSGKeFfm+FdS/FtsyUzvGQm3DR2Qk7BsyXdJtItvGxsS
         Zgb0QrpdNX8SPpr9BFzNF8qSGYKV/uQAuvhGrZ9iWBM7zUiHsAlvUFf00u9XSlaqB6W8
         ycTA==
X-Forwarded-Encrypted: i=1; AKwUvBzsGgYKc+1WpBMTTJ9W5eZhDijiR9Z9YVGbo9vxioMFkdGksYJCtMoaoUtOKJd/uxo0RH2LgFs1bexrBtA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZpjbpSVYyOz1e5f1U68IRQpU9W7d7G69mTSKQzYxJ4NIIWTa3
	MXxYrryGOpSZBWVS18l40PW6DY5l5aFTvnxzwlZt1FU3qrS76DcQOPxkms6Kq2pk10rS7MJdobI
	PwvqiMNy14kNVW6k2LjmI8tyiBoXyHHB+4eyhGYBX+53TZKEqnysRw1W8HrxX+RekjtE=
X-Gm-Gg: AYBFou2tZjgQxlw6Dp5kkWsRzTmU6VJJcj4KWtgoppJ1T19XjTtJDcDabXUiG/cJ5e8
	A0RHpzZt8o2v3ockjm63W6BAbEwvZZ2RkPR1YzZjgEW5fqAy6Z21p7AEAvJqTCUbTAjOB9FcWQV
	ph4qKqKxo/Lh++R8wsY2PYGPfRgHPRdgpMYKWcjdiuyq8hee64yWCasC3SfymcCamyREw5mHRl5
	jvNeNtNaiF5SWtloktM1coCa/OD34iOkpkcUGF+fcXOGWnygLyphTuOt/HAw5DUaxvXrlaWvcoM
	uVYMS4FHMnLkOi95ndCMLBLkpcuZORo3rInL1R8CZc1N2LED5H04QK1K4Ump5nOguGCHKhTYBKe
	pBMlv6VkX6EN7JrEbRcswiaPovZ3xmelcOR2DJwKBEtu9YbbIWVqrfAQmydZGlzhfujnmWJSg8B
	fof4WMxe0ytYdL
X-Received: by 2002:a05:620a:6019:b0:93f:38ee:68b9 with SMTP id af79cd13be357-93f38ee713emr1081445585a.28.1792491947448;
        Tue, 20 Oct 2026 03:25:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6019:b0:93f:38ee:68b9 with SMTP id af79cd13be357-93f38ee713emr1081441285a.28.1792491946837;
        Tue, 20 Oct 2026 03:25:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab20a8b3a4sm28145191fa.1.2026.10.20.03.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:25:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 13:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: interconnect: add Qualcomm MSM8998 NoC
Message-ID: <guychj77ohhlnhzw4bcgglcfiwyppgt7wzd677smjbd777kmpv@s4bclghi335b>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-1-c2da3934b6c8@oss.qualcomm.com>
 <20261020-daft-competent-saluki-a080c7@quoll>
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
In-Reply-To: <20261020-daft-competent-saluki-a080c7@quoll>
X-Proofpoint-ORIG-GUID: Mlbk_8uDjAdSebXbOuIHnRkZ9TRBPx_1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfX4A6r1vIv+peJ
 BaGXxNG7KWHbLQruqt7wtfiSVsbEeiceIuEzH/IGpt/ohuC35Wo47PRrHn5b0ZE1NB14awjf/VO
 bdm6wrFB6d6xikU68yA1IPPz0g8A8bpNPboJB8xnwJfmBQsY+Y5qmO9NlRWz3AHoGeseBdbrNAh
 LUuxjNVwbRHj7xJg2N5tc/wUui3+QwDEuBoU952KCgBv7Y37c/Zi0+Mv/YxZMLU3I5MoTZ1Ejp+
 Onal/v0z7GFEhI3ndM/4X2CMVK2/hOPT0FMC2WD5u5jv34HULUpjGzG/t62w9+UiJAYlzV2bkrB
 7OKiDbyv1XjD0McRaTx48eKxBH5bfSIYtq12LM5vE+ZjQdSFDBZXLhuUqtcaIzuSyKwBs20YV6t
 5PZmGKDZvTAJCE0OOopgHqYOnDcDD1SHVI3bGenSjLE/+3iggC2E9MeQ8FCPu1QT/w5UMFKIzGc
 uHzfZLJyJsUYJaar42Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0MSBTYWx0ZWRfXyTPSqmske/Zm
 01z1FyPSBxx9hR/u/bwZbu5LhCPze9QxMCk3a2OJCaCxd+/3xTepNfvZAa5pW5weRlWJqc9+tL6
 mkUEhf7wJVOf9i8uZbhxmNt2kfoXffE=
X-Authority-Analysis: v=2.4 cv=LpcHWXdc c=1 sm=1 tr=0 ts=6ad741ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NwY7b9YWZjBNx-CeCFIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: Mlbk_8uDjAdSebXbOuIHnRkZ9TRBPx_1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200041

On Tue, Oct 20, 2026 at 10:24:24AM +0200, Krzysztof Kozlowski wrote:
> On Mon, Oct 19, 2026 at 05:12:39PM +0300, Dmitry Baryshkov wrote:
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,msm8998-a1noc
> > +      - qcom,msm8998-a2noc
> > +      - qcom,msm8998-bimc
> > +      - qcom,msm8998-cnoc
> > +      - qcom,msm8998-gnoc
> > +      - qcom,msm8998-mnoc
> > +      - qcom,msm8998-mnoc-ahb
> > +      - qcom,msm8998-snoc
> > +
[..]

> 
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-msm8998.h>
> > +    #include <dt-bindings/clock/qcom,mmcc-msm8998.h>
> > +
> > +    interconnect@1008300 {
> > +        compatible = "qcom,msm8998-bimc";
> > +        reg = <0x01008300 0x77d00>;
> > +        #interconnect-cells = <2>;
> > +    };
> > +
> > +    interconnect@1740000 {
> > +        compatible = "qcom,msm8998-mnoc";
> > +        reg = <0x01740000 0x10000>;
> > +        clocks = <&mmcc MNOC_AHB_CLK>, <&mmcc MNOC_MAXI_CLK>;
> > +        clock-names = "iface", "mnoc_bus";
> > +        #interconnect-cells = <2>;
> > +
> > +        interconnect-mnoc-ahb {
> 
> I do not see how this can validate. You do not allow any children in
> your binding. Your tpo-level properties should define all possible
> properties and nodes.

This was validating because mnoc node explicitly allowed the children.
I'll move the declaration to the top node and constraint it separately.

> 
> also, name should be just "interconnect"
> 
> 
> Best regards,
> Krzysztof
> 

-- 
With best wishes
Dmitry
