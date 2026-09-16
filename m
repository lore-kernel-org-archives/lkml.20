Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC254F648F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565223; cv=none; b=GLW3q9xpmKc792jbacCts56gyOHFSYsxD97jxh1MxSR2TpqAI7p+k3TrNwQqFffqYWJsOjxlfUR9WSgEXcfomQPQZd2ekajGfN6lQoR9tDGrca79DC2+0WYVACf+Ti+x4cL6Y/Az7pCH8GqFyI92wPudNxl85PajzlusJLXevP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565223; c=relaxed/simple;
	bh=0MVH1UVmAUe5/J+L/Yf6YJo56Lmvi/jOR7Pmv6KXqjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqqx0KJcDI6slDvSiy33whEJEqyK+u/Ya81N+By9/AMOaa+TcrCWdqM2IkSGAHqX616KVUBErDGtrZFl9iK7ijgfnyDygcEUs/ohKBXX2ISrCi2PJBSP3fuiFEfBSAARLcD59ujC0Hz3kqtyoXY5mIIcRs0A7FV8wwtBxxO5IH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mdcQP4VE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dztp3BoI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mdcQP4VE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dztp3BoI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDJicn2283717
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MESC1KI0wX6qjB4s98iNgVKHGPJ6KH1ZIsZM1iGaT8=; b=mdcQP4VEcQ2YZ7in
	MjoGc0dkFhF7e1Dv5zwqOWromheFG07ioVoo3k3geil4jNO5TfeAxx8TGU5y1HZu
	2S5kA45hKqN3uVlAdvWOEDA9DjRfgC6bS+2GETOVdeEYfGkhVvztUVhxSV+chKEq
	aE7jNidhypXHnk9ChR+Bu4Va2f6K2fHY5rC9SO2LtcKQxPTGELynf+pImUOz6ax6
	uNenbmdMs/6J1dZVR4GqsvozYFJAuUc8Sds+eikKm5BkiFd4w4eGhgRT7Amyf28w
	uZnLSRZUXZZfz03+eOW7zJDFQeoF0qViAU0pyjG4nYDMV2oVbJNslXVNQqbJtX/Q
	KZejwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquwb00xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:26:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86ab8302b54so6174260b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565219; x=1790170019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MESC1KI0wX6qjB4s98iNgVKHGPJ6KH1ZIsZM1iGaT8=;
        b=Dztp3BoIeZHfvXudcOEYSml0sUt+Zg6opESAKOF4Oq8OZsq825TGe1UWtZUb7/PNkA
         xBLwNguHSEkw3CYkoQmITvC4QqMg0KC3xdYPexA7YAVYUAMQfv5YBomYZAOVQTK7Nr5L
         K+aEvjGjQi2sh21RAWxXV6voNu7E+JJvLaYjbCxcbpDXdFjFnNiCZjPQf0+IhNQQZp2P
         n9kbkTXnG+B8NSoCHgeSeB6VPx5/qZEmIefy8XRi2hxe1SiVXJhZxGjUS4voNd+7KFIK
         aBIcR2+x0oFGJcUsouMhbHKvW7cqbYt3z3gTvNXiIfYF72tbhh7APK1qxDhCFIax12zv
         gDcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565219; x=1790170019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MESC1KI0wX6qjB4s98iNgVKHGPJ6KH1ZIsZM1iGaT8=;
        b=vNmDj51/pEgjfonfsqyJXPJFoLzA5s4LX5lMGH7yVCPt/HKxJMVKUG3BvRtSyOSCol
         iqpnJCoai/J7xuXWGgi0+wPsaZwqycDN+pN5GNza9fBYuTL4qIELVes0qziU4W2M0aao
         s5NzS3azPb45zAS5+pEb9EeZYB/u7MTz0bGdSXCNqD93LrtI1Jmlpp80PI9eItE1vQfU
         PYi6TcMkH0PaIzg0QfvZJSlnSh8riAHyztzqN0YUVyEpd8qCKxwvaE60ewvG3pOUAzwk
         A1RRnTb/ID8Zq04iD/n8UIyrw4Jn7p65aIajGkIJTscGu34dv2i/SyqOhWAuv99c1V71
         BudQ==
X-Forwarded-Encrypted: i=1; AKwUvByMIOcSiPyPwY18affpftLaxXleXaEZiK0f/15ep4C3rw9WiIDeDlWBlTikDimw+1v8tstqV0m1yuovnKs=@vger.kernel.org
X-Gm-Message-State: AFuF++nnOJa67xqE5V/NCvGfy1q5OTAgkBcxv/+2Xa+iwTNr4h9LL2Fb
	QqIlV/SCbAQ4zoHkXZFaO8napteiEHYQXsutIGxL4pQraq37KnBs1gGxKt3biOKBPgLzMVUTqBB
	iA0tAGr4I7pQ00cFwQmtgjww/IqUpyKFLKilf2D1cAzPYWtf3yoJTfUolbkonZlmRy5o=
X-Gm-Gg: AYBFou3vUd7hxIFtzWW6lzU63xkhiTx16zjByGbkBEKn1En30j6eXViXKQSPXy+IApy
	k33CMBpNUV4BUuCyGyXc+leVUsV86IW2xHP2AZaQr031wuvEp9sEt+UoECkfWiM6R7Qf5WSgjMT
	32EjWa+oz9RZdM5QIR/uew1xCA+s5ubgpuXRGuV15g2vaHF6Kzy1ExkmL42dc0dpb8Szngqa1+E
	opWCaEJ9Zff+AsM0ifBVnhMQpkcWVhrWhoW497VDemh77NesUmrwQwxhNJuodf1S5iTxZfOE6To
	WdeRPLle//doxhyHeOzjLEJQRHzQ0jW3Xb0h2cOQwVWz3PGaL6KySegQnR5kzdEO+6xjdzqo5IG
	OBe/8wKt7Y+SLF9vj3lOQ5NLzDUkHN2NY
X-Received: by 2002:a05:6a00:3c86:b0:86d:c2d4:f3c0 with SMTP id d2e1a72fcca58-872376bd23bmr5119015b3a.9.1789565218613;
        Wed, 16 Sep 2026 06:26:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c86:b0:86d:c2d4:f3c0 with SMTP id d2e1a72fcca58-872376bd23bmr5118933b3a.9.1789565218017;
        Wed, 16 Sep 2026 06:26:58 -0700 (PDT)
Received: from [10.92.206.34] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d17e76sm1241562b3a.49.2026.09.16.06.26.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:26:57 -0700 (PDT)
Message-ID: <5f862178-ba18-4b27-b5db-1732d57d7b47@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 18:56:50 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] phy: qcom: qmp-pcie: Add Nord Gen5x16 PCIe
 multi-PHY support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas
 <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260909-nord-v3-0-b0a82721c547@oss.qualcomm.com>
 <20260909-nord-v3-5-b0a82721c547@oss.qualcomm.com>
 <aqJFo3beKde404qd@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <aqJFo3beKde404qd@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4JOUOYi c=1 sm=1 tr=0 ts=6aaa9923 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=L3-XMscUPCAweoWNVT8A:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: 5jX9XPRVqhBgARYXQMhPA1_xnzuODlqG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE3OSBTYWx0ZWRfX80q0fB9EW9Gd
 EOJPxoNEb7KKG4GeDD9z/JZCCW37UULPkgovFuiWkSvFNYFlKoZr+Dl1ecwST2pMoZ3rvQNS1Bb
 JYi+ziTmMxXof8XMxRAY0br4hIhkfdKsnLqKAm8imKWDZURF4ve+2KmLBOM0OnaWTRNyREjmeJL
 jKJasaCAV43eZtCB/j0alufNHAJl+tX5N2AuuQEt2aWwOYBSz+dh0p1jr4HNGTJioZvCpoUu5ap
 0c/KG2/AhrHyYEkgTm8Tx9QYnyOlUiaVTZMORTakqu0j0CdHmWDY6a4xSLuVW7YldJSaJL5pd3l
 Nw80hnFjkyvfb5Yf0xB6Bvff7FRfMHv6oXWwINTOU9Jrrb9x1r2SVm8vsXiO+9lwp40rELHfW9B
 ysLdQlneR3AiC6rsM027GfKb0vJpS8pBYPQABSkB/idTILheTPl6Azu9BMOr5ml2izXw/fmv+u4
 BIgxJ/O4VhwdbNbakMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE3OSBTYWx0ZWRfX915eHa/BJz2c
 tANQcpP4GJjtn6GYeSHD9ZkGDw90swoudAf+agWj/RMN+8It/Vugn36MjF6zwmd9G6C7wT4UWJ+
 /2lmnBotWYA2o6fQfCsj4UjeOewZz+0=
X-Proofpoint-ORIG-GUID: 5jX9XPRVqhBgARYXQMhPA1_xnzuODlqG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160179



On 9/10/2026 11:22 AM, Shawn Guo wrote:
>> const struct qmp_phy_cfg *cfg = qmp->cfg;
>>  
>> -	reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
>> +	if (qmp->nocsr_resets)
>> +		reset_control_bulk_assert(qmp->cfg->num_nocsr_resets, qmp->nocsr_resets);
>> +	if (qmp->resets)
>> +		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
>>  
>>  	clk_bulk_disable_unprepare(qmp->cfg->num_clks, qmp->clks);
>>  	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
>> @@ -335,6 +1067,20 @@ static int qmp_pcie_power_on(struct phy *phy)
>>  		goto err_disable_pipe_clk;
>>  	}
>>  
>> +	if (!qmp->skip_init) {
>> +		qmp_pcie_init_port_registers(qmp);
> Have we tested the patch on Glymur? As Glymur's cfgs have either .pll_tbls
> nor .tbls, so skip_init is unconditionally false for Glymur. Is it
> intentional to run qmp_pcie_init_port_registers() on Glymur?
Thanks for the catch, I will test for glymur before posting next series.
>
>> +
>> +		for (i = 0; i < cfg->num_regs; i++) {
>> +			qphy_clrbits(qmp->base[i] + offs->pcs,
>> +				     cfg->regs[QPHY_PCS_SW_RESET], SW_RESET);
>> +			qphy_setbits(qmp->base[i] + offs->pcs,
>> +				     cfg->regs[QPHY_PCS_START_CONTROL],
>> +				     SERDES_START | PCS_START);
>> +		}
>> +
>> +		usleep_range(2000, 2500);
>> +	}
>> +
>>  	for (i = 0; i < cfg->num_regs; i++) {
>>  		status = qmp->base[i] + offs->pcs + cfg->regs[QPHY_PCS_STATUS];
>>  		ret = readl_poll_timeout(status, val, !(val & cfg->phy_status), 200,
>> @@ -357,9 +1103,36 @@ static int qmp_pcie_power_on(struct phy *phy)
>>  static int qmp_pcie_power_off(struct phy *phy)
>>  {
>>  	struct qmp_pcie *qmp = phy_get_drvdata(phy);
>> +	const struct qmp_phy_cfg *cfg = qmp->cfg;
>> +	const struct qmp_pcie_offsets *offs = cfg->offsets;
>> +	int i;
>>  
>>  	clk_bulk_disable_unprepare(qmp->cfg->num_pipe_clks, qmp->pipe_clks);
>>  
>> +	/*
>> +	 * While powering off the PHY, only nocsr_resets needs to be checked.
>> +	 * This way, no matter whether the PHY settings were initially
>> +	 * programmed by the bootloader or the PHY driver itself, we can
>> +	 * reuse them the next time the PHY is powered on.
>> +	 */
>> +	if (cfg->pll_tbls && !qmp->nocsr_resets) {
> Every cfg in the file (Glymur and all seven Nord ones) declares
> nocsr_reset_list, and qmp_pcie_reset_init() only leaves qmp->nocsr_resets
> NULL when num_nocsr_resets == 0. So the condition is always false, no?
Thats true for current targets, but on future targets it might not be true.
I will remove the check here for now, in future if we have any target with
nocsr then
we can add it back.

Ack for rest of the comments.

- Krishna Chaitanya.

