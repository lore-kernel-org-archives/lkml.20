Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408072;
	b=dIjg8ZXQPWMxh/0mSGTbh0CQrLsi2Z8Rq0nBbi6lnps/a70t5rnT1KVxxPOw85fffga4
	 bwqXfcCj+MBvnDlvLaI2IhiGiBqjng+i5nwlIhNKSz6ZVjm/LuNQNnPGDNG2ao2lOmvEH
	 DwrHRpxmzv/8dTVZMFJZZxu5EoaSaCMvwLVM4GLXOYic+Atj9kxVBDpOlIG0Nk+z5QSdi
	 6crPF/+6/C4jtoU19AKQE+Y5ZA6tSsx/8HGb7IwByuKF2TeTdWFcNa7qze1g+IYsVMBN8
	 ff6QczHM53CzvqB42VeVaPfYXo2sJgI07ZhU8SecniyqPDN5Qif41kHtzNH3I3OZrvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408072;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wo2sfYbQ+65M1CrnPME0e7wbfj7MWnLPOIj1dRZP5jM=;
	b=NZiyuhKloZQOp3+5ZmCCGl4D+BuCVtOP1U0v47Yf+5xOKjwycpebNlTF78NFMuKrllK7
	 6Kats1JAO46eXfOgm2jknUAkueBsdaLcY9Jx2Mf9eJLg91s+UMkefi/kM/FD0xoP97iNl
	 dbhFeRKj8Ztlsuw+uaGZAPT2p3z7kfPMUShfKJg4sQXP9f/jemejOWq6efFPB5BwA7a7j
	 qjk8mphmtm2CDqKHFeBGVI/rJhZUvOGmOBQAIbSSKFmceIE0sB58kTuxMYkymDzMNVXga
	 xeqzUO123vH49g+7pmyiKB17Qf7sP0ZbsbvrqQEF+ANkW/d9Vkfh7YJJwTerN0n4wTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pcu0clkO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="QZ5u8/6E";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68290606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68290606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pcu0clkO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QZ5u8/6E
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEKJrF926690
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wo2sfYbQ+65M1CrnPME0e7wbfj7MWnLPOIj1dRZP5jM=; b=Pcu0clkOkUqUvZhG
	5gSmyF1tS5Nm3FsGWGy0jZemQimA0GYb2SjfJHsPYNpONowMmf8vq7felskbyXSp
	HBGk4dai14RgmrY0LAVJ1PYGJndufI4ROd8YPlzPzWzv162mJ9kl8B4NOwIZNbih
	CjzC7m0+h7qXs8RZD6LmYEkX6+DIoQnx50d2hhhFiGyusHFwS5NLBzpX+dRBXlso
	Kfp1lduU2MenY5l6Idl+CF86Oq43bOqerkCJZ7xjAah+OITbY8DYJbLjf9URiEcc
	ESBZneXKI7Gp9anFC3x4ZqiVHSUu80a0w1Zj602wxh55T1iQDOnd52QvbSRWMd6S
	9ou8Xg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b33xjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:41:10 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3ae327c55so629002c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:41:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408070; x=1795012870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wo2sfYbQ+65M1CrnPME0e7wbfj7MWnLPOIj1dRZP5jM=;
        b=QZ5u8/6E9XJGjxHgnuS1u2coS12CjGTrwclNmD55CoFrcOezcdc9lq5h8GDa7r1W79
         x8WkUopVdabwb33P/R3H/U7eGa0L2cHCF/hsBXEXbZUBm2/PW2nHkL6VCrzlup9iYiQH
         joRFpUTBEuGVpUTKPtwU/x5SII2MToy+3rHQ7xiDXZLP0YGRwmxeu19N5XsE4nELAV4E
         xCb9sMvQwOYbR0ZL9bZlq+5QDLnozEOQjONu5ylEc4zxYBcvUbJERRcvoGvYW2skwe7K
         UFChiJea885qInPx1FWq3lqRQ/SKYAv3XpABCvEaUGgI2FkT5PoqIlBltsfpoNop0KjA
         7f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408070; x=1795012870;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wo2sfYbQ+65M1CrnPME0e7wbfj7MWnLPOIj1dRZP5jM=;
        b=dXKTeGBgoEDgQGm56XfcwUj1dmfxIs7WWUx71C+9OfB39LD5Qqtwxop0n70M0zPrHe
         sGcpNbVOhNe2cNvsBSuqA33LyB07qEZSbdT3fS074btIdT40dPar/ZPut58yZCl1fsU/
         MhYMdyEIgzeVzhC3R6p1K+IPa3COlU6dAx9Z78U6kT2SrUpU4hf7T6ACdttSO2RB9oc3
         Eeptd6Go0BgR0z6mPSOPa2HN1J7JQtPEeiJA++V3bTDB8M+CmQSthHTHMrh3buwbY7mi
         q4sJa1BufUd3Adc+Yk83XG/4eEYAUYwCouzlW+4JW2IP+HlJX8RcnxzG2RFbzsfcC8pS
         ew8A==
X-Forwarded-Encrypted: i=1; AL+hErHIxKJzUMoYCuEJWkXCdja4cMIqyP0DI8nrT0D+zOJV0Kf5EXCKTOBejIP7NTQdHXd4FstyLOk5GdF9imE=@vger.kernel.org
X-Gm-Message-State: APuU4Z88bvnhNl0STeb1vN1ZXED3TuHUrYzwjcgX5JrLNiWMpwcIclOV
	FuZS9JW7JARdCY1lbxeOH7osvrA4swjgG/Mxg2+rXsef6JIhsUhtQhqAwfVJRLuZsvu/g4W7gyd
	fXqdds/Ti0M1BPUo6v9aLsB2y9JT5Fcb4XUpRok8Dtk3/0Yu27Boq+PeUxJdffgGe0JQ=
X-Gm-Gg: AYBFou3obrNvnfSzGBVNT2jQqOTEM/ayK3y3MPDdLV83XXq5jKR77dEdCC8fGtysK4G
	BBFTu2+XfsH8JnWG4xSZ7cbDMZhNvsXh0oVrta53XkP9DtycUARWVCbLfUcEasydC0H5ZFlC6m0
	JuGISptx2pPoOJZijACXs/0w23QQlPYMrmoleBS+hUxDcrRZ5B67W/MKnHzcuvBQLdjzk4AIA7k
	pqDbudYwURC9KkGgjjQmwiHeAmXwuwpFLuhPfIx7CAKpz8bBz4oFObqLJqh294GRKDaGAANCQXq
	BaWOZJ2LwtsHZlrFCYNLMRpDe3cqINqLmq7rbYfoOYyOW8Ibhsvrdx5vNWBHbrJzYxsEhtEN0oZ
	cBpOqLMC4wDGYfs4BY16qu5+JTtpQRYX6+FqcdQJjGSqMAdnhAnqAcW7mlHrHYShrEcMaxcnySQ
	AaJH+n
X-Received: by 2002:a05:7022:3b84:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b3bef392ddmr3307471c88.19.1794408069606;
        Wed, 11 Nov 2026 06:41:09 -0800 (PST)
X-Received: by 2002:a05:7022:3b84:b0:1ae:d447:6c84 with SMTP id a92af1059eb24-1b3bef392ddmr3307427c88.19.1794408068834;
        Wed, 11 Nov 2026 06:41:08 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm34141943c88.10.2026.11.11.06.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:41:08 -0800 (PST)
Message-ID: <135bcaf6-f7f3-412b-9b13-494e6dd691e1@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 20:11:02 +0530
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
Subject: Re: [PATCH 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20261107-gcc_i2c_tsc_support-v1-0-433d02972d7e@oss.qualcomm.com>
 <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261107-gcc_i2c_tsc_support-v1-2-433d02972d7e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af47e86 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qDnasNCYrL_4tYwmdqsA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX7qq2jzW3XQqc
 H/1jPexA4y/j1C93feBfvgRlbRlmfIivVHcse2uOZzXxlyJaIg/NoU/NP7LW1gbk2kkdHFzdhq4
 67RwT0E/7wBnWheXaFML86UvuKtugYv1Kowatk/9Y2WuqRAaHSKP5M0p8Qt3LXLOGc1JAYGWxUV
 w5bPtZExTUKCbLpfA2IaEpTdrLe4TSGCsT5m0txFLQPXf395/WcRO7qS4AS2EGfj9FZwnKneAvp
 xSjJx2H9p8Tin67RrdkzX0MGk5E1yI7J+WSy+t+AJ3qJ1x35kGKmktSncYiSQuQwJKXg8ma8TrO
 0tPyIm+WevfUSfc/f247iaBv0pQEHctJP93bSDsvS53T4O6uUmJcNmttuVPYSwxsxsYwp/jc8dw
 OiCZVDJPOVLYgH6V6XcHWhjunkDSj8OhKjcQF8GcHnoHDt2A19f8vb/6vp5lBkAoN6r5ksaKYvU
 8UQusp/jGNqc1bJJZUA==
X-Proofpoint-GUID: vRtX8-8O2VTHH60CCS4pjmUDIii60Sbm
X-Proofpoint-ORIG-GUID: vRtX8-8O2VTHH60CCS4pjmUDIii60Sbm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfXxWxzoXyVwr/D
 8HjroWk+bPDEEx2WYDkFVH8SeriLReeH/A7ha6jcbb5R7ppAJHhpCrpS2nPf1RYDi8KYcqL1Kl7
 fdw2kSzWQauPSfXRdNYZgUZKKUiMTQ8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058



On 11/7/2026 11:36 PM, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/segcc-nord.c | 187 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+)
> 
> diff --git a/drivers/clk/qcom/segcc-nord.c b/drivers/clk/qcom/segcc-nord.c
> index ef97da3852e3571db5c34676a8f08b9650d1e4c6..7fdfa44fb10360650e1bd59fc973f990788d3ed7 100644
> --- a/drivers/clk/qcom/segcc-nord.c
> +++ b/drivers/clk/qcom/segcc-nord.c
> @@ -29,6 +29,7 @@ enum {
>  	P_BI_TCXO,
>  	P_SE_GCC_GPLL0_OUT_EVEN,
>  	P_SE_GCC_GPLL0_OUT_MAIN,
> +	P_SE_GCC_GPLL1_OUT_MAIN,
>  	P_SE_GCC_GPLL2_OUT_MAIN,
>  	P_SE_GCC_GPLL4_OUT_MAIN,
>  	P_SE_GCC_GPLL5_OUT_MAIN,
> @@ -74,6 +75,23 @@ static struct clk_alpha_pll_postdiv se_gcc_gpll0_out_even = {
>  	},
>  };
>  
> +static struct clk_alpha_pll se_gcc_gpll1 = {
> +	.offset = 0x1000,
> +	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> +	.clkr = {
> +		.enable_reg = 0x57010,
> +		.enable_mask = BIT(1),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "se_gcc_gpll1",
> +			.parent_data = &(const struct clk_parent_data) {
> +				.index = DT_BI_TCXO,
> +			},
> +			.num_parents = 1,
> +			.ops = &clk_alpha_pll_fixed_lucid_ole_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_alpha_pll se_gcc_gpll2 = {
>  	.offset = 0x2000,
>  	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
> @@ -189,6 +207,43 @@ static const struct clk_parent_data se_gcc_parent_data_4[] = {
>  	{ .index = DT_SLEEP_CLK },
>  };
>  
> +static const struct freq_tbl ftbl_se_gcc_cnoc_i2c_slave_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),
> +	{ }
> +};
> +
> +static struct clk_init_data se_gcc_cnoc_i2c_slave_clk_src_init = {
> +	.name = "se_gcc_cnoc_i2c_slave_clk_src",
> +	.parent_data = se_gcc_parent_data_2,
> +	.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
> +	.flags = CLK_SET_RATE_PARENT,
> +	.ops = &clk_rcg2_shared_no_init_park_ops,
> +};
> +
> +static struct clk_rcg2 se_gcc_cnoc_i2c_slave_clk_src = {
> +	.cmd_rcgr = 0x13034,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = se_gcc_parent_map_2,
> +	.freq_tbl = ftbl_se_gcc_cnoc_i2c_slave_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &se_gcc_cnoc_i2c_slave_clk_src_init,
> +};
> +

Please drop the i2c RCGs as these RCGs only support 19.2MHz and are under
boot access and not controlled from HLOS.

Thanks,
Jagadeesh 

> +static const struct parent_map se_gcc_parent_map_5[] = {
> +	{ P_BI_TCXO, 0 },
> +	{ P_SE_GCC_GPLL0_OUT_MAIN, 1 },
> +	{ P_SE_GCC_GPLL5_OUT_MAIN, 3 },
> +	{ P_SE_GCC_GPLL1_OUT_MAIN, 4 },
> +};
> +
> +static const struct clk_parent_data se_gcc_parent_data_5[] = {
> +	{ .index = DT_BI_TCXO },
> +	{ .hw = &se_gcc_gpll0.clkr.hw },
> +	{ .hw = &se_gcc_gpll5.clkr.hw },
> +	{ .hw = &se_gcc_gpll1.clkr.hw },
> +};
> +
>  static const struct freq_tbl ftbl_se_gcc_eee_emac0_clk_src[] = {
>  	F(66666667, P_SE_GCC_GPLL0_OUT_MAIN, 9, 0, 0),
>  	F(100000000, P_SE_GCC_GPLL0_OUT_MAIN, 6, 0, 0),
> @@ -380,6 +435,22 @@ static struct clk_rcg2 se_gcc_gp2_clk_src = {
>  	},
>  };
>  
> +static struct clk_rcg2 se_gcc_i2c_slave_xo_clk_src = {
> +	.cmd_rcgr = 0x2c00c,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = se_gcc_parent_map_2,
> +	.freq_tbl = ftbl_se_gcc_emac0_phy_aux_clk_src,
> +	.hw_clk_ctrl = true,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "se_gcc_i2c_slave_xo_clk_src",
> +		.parent_data = se_gcc_parent_data_2,
> +		.num_parents = ARRAY_SIZE(se_gcc_parent_data_2),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_no_init_park_ops,
> +	},
> +};
> +
>  static const struct freq_tbl ftbl_se_gcc_qupv3_wrap0_s0_clk_src[] = {
>  	F(7372800, P_SE_GCC_GPLL0_OUT_MAIN, 1, 192, 15625),
>  	F(14745600, P_SE_GCC_GPLL0_OUT_MAIN, 1, 384, 15625),
> @@ -670,6 +741,21 @@ static struct clk_rcg2 se_gcc_qupv3_wrap1_s6_clk_src = {
>  	.clkr.hw.init = &se_gcc_qupv3_wrap1_s6_clk_src_init,
>  };
>  
> +static struct clk_rcg2 se_gcc_tscss_clk_src = {
> +	.cmd_rcgr = 0x2a010,
> +	.mnd_width = 0,
> +	.hid_width = 5,
> +	.parent_map = se_gcc_parent_map_5,
> +	.freq_tbl = ftbl_se_gcc_emac0_ptp_clk_src,
> +	.clkr.hw.init = &(const struct clk_init_data) {
> +		.name = "se_gcc_tscss_clk_src",
> +		.parent_data = se_gcc_parent_data_5,
> +		.num_parents = ARRAY_SIZE(se_gcc_parent_data_5),
> +		.flags = CLK_SET_RATE_PARENT,
> +		.ops = &clk_rcg2_shared_ops,
> +	},
> +};
> +
>  static struct clk_branch se_gcc_eee_emac0_clk = {
>  	.halt_reg = 0x240b4,
>  	.halt_check = BRANCH_HALT,
> @@ -1079,6 +1165,44 @@ static struct clk_branch se_gcc_gp2_clk = {
>  	},
>  };
>  
> +static struct clk_branch se_gcc_i2c_slave_ahb_clk = {
> +	.halt_reg = 0x2c008,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x2c008,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x2c008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "se_gcc_i2c_slave_ahb_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&se_gcc_cnoc_i2c_slave_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_aon_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch se_gcc_i2c_slave_xo_clk = {
> +	.halt_reg = 0x2c004,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2c004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "se_gcc_i2c_slave_xo_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&se_gcc_i2c_slave_xo_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_aon_ops,
> +		},
> +	},
> +};
> +
>  static struct clk_branch se_gcc_mmu_2_tcu_vote_clk = {
>  	.halt_reg = 0x57040,
>  	.halt_check = BRANCH_HALT_VOTED,
> @@ -1456,6 +1580,57 @@ static struct clk_branch se_gcc_qupv3_wrap1_s_ahb_clk = {
>  	},
>  };
>  
> +static struct clk_branch se_gcc_tscss_ahb_clk = {
> +	.halt_reg = 0x2a00c,
> +	.halt_check = BRANCH_HALT_VOTED,
> +	.hwcg_reg = 0x2a00c,
> +	.hwcg_bit = 1,
> +	.clkr = {
> +		.enable_reg = 0x2a00c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "se_gcc_tscss_ahb_clk",
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch se_gcc_tscss_cntr_clk = {
> +	.halt_reg = 0x2a008,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2a008,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "se_gcc_tscss_cntr_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&se_gcc_tscss_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
> +static struct clk_branch se_gcc_tscss_etu_clk = {
> +	.halt_reg = 0x2a004,
> +	.halt_check = BRANCH_HALT,
> +	.clkr = {
> +		.enable_reg = 0x2a004,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "se_gcc_tscss_etu_clk",
> +			.parent_hws = (const struct clk_hw*[]) {
> +				&se_gcc_tscss_clk_src.clkr.hw,
> +			},
> +			.num_parents = 1,
> +			.flags = CLK_SET_RATE_PARENT,
> +			.ops = &clk_branch2_ops,
> +		},
> +	},
> +};
> +
>  static struct gdsc se_gcc_emac0_gdsc = {
>  	.gdscr = 0x24004,
>  	.en_rest_wait_val = 0x2,
> @@ -1481,6 +1656,7 @@ static struct gdsc se_gcc_emac1_gdsc = {
>  };
>  
>  static struct clk_regmap *se_gcc_nord_clocks[] = {
> +	[SE_GCC_CNOC_I2C_SLAVE_CLK_SRC] = &se_gcc_cnoc_i2c_slave_clk_src.clkr,
>  	[SE_GCC_EEE_EMAC0_CLK] = &se_gcc_eee_emac0_clk.clkr,
>  	[SE_GCC_EEE_EMAC0_CLK_SRC] = &se_gcc_eee_emac0_clk_src.clkr,
>  	[SE_GCC_EEE_EMAC1_CLK] = &se_gcc_eee_emac1_clk.clkr,
> @@ -1520,9 +1696,13 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
>  	[SE_GCC_GP2_CLK_SRC] = &se_gcc_gp2_clk_src.clkr,
>  	[SE_GCC_GPLL0] = &se_gcc_gpll0.clkr,
>  	[SE_GCC_GPLL0_OUT_EVEN] = &se_gcc_gpll0_out_even.clkr,
> +	[SE_GCC_GPLL1] = &se_gcc_gpll1.clkr,
>  	[SE_GCC_GPLL2] = &se_gcc_gpll2.clkr,
>  	[SE_GCC_GPLL4] = &se_gcc_gpll4.clkr,
>  	[SE_GCC_GPLL5] = &se_gcc_gpll5.clkr,
> +	[SE_GCC_I2C_SLAVE_AHB_CLK] = &se_gcc_i2c_slave_ahb_clk.clkr,
> +	[SE_GCC_I2C_SLAVE_XO_CLK] = &se_gcc_i2c_slave_xo_clk.clkr,
> +	[SE_GCC_I2C_SLAVE_XO_CLK_SRC] = &se_gcc_i2c_slave_xo_clk_src.clkr,
>  	[SE_GCC_MMU_2_TCU_VOTE_CLK] = &se_gcc_mmu_2_tcu_vote_clk.clkr,
>  	[SE_GCC_QUPV3_WRAP0_CORE_2X_CLK] = &se_gcc_qupv3_wrap0_core_2x_clk.clkr,
>  	[SE_GCC_QUPV3_WRAP0_CORE_CLK] = &se_gcc_qupv3_wrap0_core_clk.clkr,
> @@ -1560,6 +1740,10 @@ static struct clk_regmap *se_gcc_nord_clocks[] = {
>  	[SE_GCC_QUPV3_WRAP1_S6_CLK] = &se_gcc_qupv3_wrap1_s6_clk.clkr,
>  	[SE_GCC_QUPV3_WRAP1_S6_CLK_SRC] = &se_gcc_qupv3_wrap1_s6_clk_src.clkr,
>  	[SE_GCC_QUPV3_WRAP1_S_AHB_CLK] = &se_gcc_qupv3_wrap1_s_ahb_clk.clkr,
> +	[SE_GCC_TSCSS_AHB_CLK] = &se_gcc_tscss_ahb_clk.clkr,
> +	[SE_GCC_TSCSS_CLK_SRC] = &se_gcc_tscss_clk_src.clkr,
> +	[SE_GCC_TSCSS_CNTR_CLK] = &se_gcc_tscss_cntr_clk.clkr,
> +	[SE_GCC_TSCSS_ETU_CLK] = &se_gcc_tscss_etu_clk.clkr,
>  };
>  
>  static struct gdsc *se_gcc_nord_gdscs[] = {
> @@ -1570,11 +1754,14 @@ static struct gdsc *se_gcc_nord_gdscs[] = {
>  static const struct qcom_reset_map se_gcc_nord_resets[] = {
>  	[SE_GCC_EMAC0_BCR] = { 0x24000 },
>  	[SE_GCC_EMAC1_BCR] = { 0x25000 },
> +	[SE_GCC_I2C_BCR] = { 0x2c000 },
>  	[SE_GCC_QUPV3_WRAPPER_0_BCR] = { 0x26000 },
>  	[SE_GCC_QUPV3_WRAPPER_1_BCR] = { 0x27000 },
> +	[SE_GCC_TSCSS_BCR] = { 0x2a000 },
>  };
>  
>  static const struct clk_rcg_dfs_data se_gcc_nord_dfs_clocks[] = {
> +	DEFINE_RCG_DFS(se_gcc_cnoc_i2c_slave_clk_src),
>  	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s0_clk_src),
>  	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s1_clk_src),
>  	DEFINE_RCG_DFS(se_gcc_qupv3_wrap0_s2_clk_src),
> 

