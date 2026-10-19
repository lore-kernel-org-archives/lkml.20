Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61548821A
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401059; cv=none; b=IbYPkWhB9W/2ouV8fIftQMKu4iKZrFZBx7y/riRoNfB/L89OJCOsHOPIctbhu5bDzv3rpt5pmlHCg8fYx4d2MI+B4pViz15l66TdRPy2l4WaTI6G9qJkieIrcxX3VrYldPblcqACByllG/slBekuj+q0lSsUY6h0QJLNCLAEjZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401059; c=relaxed/simple;
	bh=gcdwFaJgb3bl745WlPsLEYzIlu37uAqRXUzhv/+8Fp0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDXq/kzVecc9fj4X4NivbOKU8EUeMzcdNn5h9CWbL9StV4yfPVYLVe4Z3NPfTzuulO7eyg1V5F0SRfIk37+98Ut7bwS/5jacJ2JBVefIGohu5bgmzXo/eT9X4YYd33+YEqWRwYLRt+rTESbJhU58SUnG+Tgta06MgdaeESVPJN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ty1RSPF4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh1CtDQP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ty1RSPF4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh1CtDQP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Oteq3256627
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=; b=Ty1RSPF4gsENtoNF
	/Iklvz1AEoIc2j6ogqpyjHcxL5o6TOs80/FqxwqECUhgXNGw0A+swQgjkgTYGsIC
	0nssr+ifLUlnzkvShc04V1BIUvYUD2cZmVbRxKJm8OIZOsN5pkKlLFTrn4+YXGGk
	tLXBkOV+xNLGko3o327qKCk0/fsdfQD6Cy1xm8JrTrnmoGPbt3IcdaKt2Zd5FF/w
	nzZKOkozyXpHUspnWy9/ZhcOp6zDr+AXS6Ld467L9QL+aMGzq5ip963fx/s/GNM6
	caZBahHTYXKCwI0fufHdYiU1CoKExxg2qmN3wwnmF4w98e4ncyLPao0uQBwz7iq3
	pbnOLg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8ad0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:10:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so7545481cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401056; x=1793005856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=;
        b=Lh1CtDQPPv8Z5hKaaLHl6TSicMFFqGp7DG3X4V2LcEJou7+YynNL0y3tUes2A3mT/p
         0a4i/yHFu8MexAWOktLe+bifNd80p76oB+LOEYuiNOBq4bAZJdXpeMWpaRXfXnLL5FD/
         jCLym1oTJOxpag0lsMzrfBlJWJmV9eFuCbebR0GM0s0jfn8SobqtcSIKajZdMUsbZcPD
         XapwJLFDeeDD3SSpRJglV16wQ91GDD/F1FnUB22ginMyPyfNIeZtlbpzSXJJw9m7OMks
         cbHPoIuy2jOVMXVu0Dh6uiseMk4m56tke834uMZE9QJLXm76mH/n4ME1JfFlktSWJrGp
         vfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401056; x=1793005856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FiYZLsdsYcH2zF9vfikCztl6fwIDMw65OPywtyAG5/E=;
        b=gA5rB5oswAuUFzzhlt+X0a5ZlDFACqRCrn/VHF9yGR5r6NSbxqU+qMz7EijZ8VkGYj
         fE9TkwBpYyILeY5e6LzVcb4fF9G5V8iVd67AoszG2tIczSoTa7JMpCWAqnNtRU0hdXp3
         9cCWCcreWBRMGWgtE6CcpiIcWRXHFFlo0DMwWvCe3lfhEslBDqBSoJnSbW7oy7H1JYFI
         /ip+J66pXJ0oPsAz82+kFJOGtqN5If07Aov+/obGDs/si47I+Npy0auG6iAMk93npH1N
         NQapOBJxPtf+BLq9ZtSRkvbEJyiEbhHyScnggNxrAmj2lj1viuak7RO2aE53ECPgq7Gc
         7FHw==
X-Forwarded-Encrypted: i=1; AKwUvBwVEId1jGojPHY1SHCmNIUaB/sxha1zsKbDdF454vmkZ24W3kOyD36dbyEO0YQGd7Y7mNN9iMfQrFzYaSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQgH8rZ5g2eFj99t7wOhTNU19hseLxRAd5YvnG70DKCR4mq+rn
	MHq3ywNKVpb6iOkV2bG8DhxSIPsdMlVjKLDwTwwTBkahgKrwAS0lCSvtTcfmFcEV6jCygjtlntR
	7hjFVk4NVjUP1MWlTVQcAF/hL7vQXg4ioBAgmUhqA0Syyk+JM0NxXMkkSkZraJ2Hh+gJvCfB7Wj
	U=
X-Gm-Gg: AYBFou2L7zWg3PnK9EWUfAv6bSKT8MdKLFl24wFPqlDCEZVfNBqFBtteC0xfYi8xs3W
	D2n3oodokx2rPusXnx7p9SJHBtEC6/cJ1Em1vWsjEChR37OoDDY+rHOnBntjibteuw+8fbj34bW
	AMPMJ0H+eWy0oAygtx8I6kxGR5O+rHZ1FteHH9URuK+3MvZHIFp+Cu2d4ZX4KH8qyYZLMboNR7n
	FwsIlm8FSn1lRByhBo3VwJWAGVst4hhXoq7GWHXfW5j1Tw3udybDG3RxJunqz7eABeRDj/ceV1e
	5mNalhv/QOw1rzprGxs4bSmYsRyBN2SSONDUNKP4bOb+ZXkMNWdEKQeOslobTesqcdE18j6L9r+
	p5/rs5YZV3UTRGVfdLz2xqA==
X-Received: by 2002:ac8:5e0c:0:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-53645cfd307mr122462871cf.1.1792401056169;
        Mon, 19 Oct 2026 02:10:56 -0700 (PDT)
X-Received: by 2002:ac8:5e0c:0:b0:533:96b4:8dd4 with SMTP id d75a77b69052e-53645cfd307mr122462701cf.1.1792401055667;
        Mon, 19 Oct 2026 02:10:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4090dceadesm349444466b.20.2026.10.19.02.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:10:54 -0700 (PDT)
Message-ID: <3fcaf48e-7973-4fd2-8ce4-7d214d2a6191@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:10:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra: Switch CPU ETMs to
 MMIO-based probing
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019-fix-etm-probe-issue-on-shikra-v2-1-b2eaed0fffaf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 52RJSzkZnUImdYL23tnqlCEviiaCjDgu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX5+/EMDZz9x5k
 dYYECv6497Son2nepBtnbNhygzptcamnF4cBJt+6TYLVjOTgERJuOZMUDi6ua9dopry+0aocuEo
 Gcn9qppmsyi2FJhp0aD+VkQCKAXMh+04VUedbYmekvslhtjwOY3ZvCFJ4vwMfOk9WLmsLi8ALxZ
 u8d7Sk+t3VzAmCZkx63Xy0YkOi+4/C4AhTq1TXOFTL6B4seeIwcec36Qd3KRrZZkigjYjJHLua8
 zYdB8VbfDLe2DG1dEEaZ8oYcOHsCurRR8wiB07HyUeEWnjO1LlG6EUWbwkExu8kPEiUPMGy+0p3
 mL1FqGN55L6qIgoRz0TQTTJY8gdPB6JTdBtChBd840QrqCiEkte0HxltkN9du+2HNp93A3JcWrK
 fzH49lSp8v4KWF4jmWu534CnE7S1KgXrdzupPzKSNcJL2kCgXMLo1cwHNCvN7c5fir507ONGW1t
 1Cd1SjtGIVyw1+x94oA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX2IAS1vJBooRj
 mpf/QaEnoCPCX2CFuQDpMJrOmBemo/2ZJTValmWvwS3IwnBK+9JwlUKnRniruPmC7v1WQdh32Vz
 hCRwCx6TeRswdYwPH+kOoOpkN3dNI08=
X-Proofpoint-GUID: 52RJSzkZnUImdYL23tnqlCEviiaCjDgu
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad5dea1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=l4fDSgpoRc1iC7w1fSEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190036

On 10/19/26 8:58 AM, Jie Gan wrote:
> The etm0-etm3 nodes are declared with "arm,coresight-etm4x-sysreg"
> but do not implement self-hosted system-register trace access on
> this SoC: ID_AA64DFR0_EL1.TraceVer reads as 0 on the affected CPUs,
> so etm4_init_sysreg_access() correctly reports the access mechanism
> as unavailable and the ETMv4 driver fails to probe with -EINVAL.
> 
> The CPU ETMs have a memory-mapped aperture, so switch each node to
> the standard "arm,coresight-etm4x", "arm,primecell" compatible with
> its MMIO reg range.
> 
> Fixes: eed738c6dd0c ("arm64: dts: qcom: shikra: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
