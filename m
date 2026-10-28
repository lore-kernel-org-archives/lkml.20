Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201173;
	b=SgdMErhFfurXvPyxzBuwF7VR/VzRRT6KrcEDVmmYt4p8aygumB1UPgqwkmqP9IS5kuIF
	 ixNMUutCUlmGSV5jHIeLBO2TGNS+RFrip9VBehGNyIcK1fsAQvbQGqEfJtpADN1hGrBYB
	 p4tM7T9lMWVSkEhC/bwEfQV7DOO+yO0f0FPvPmMxJoYf5N5hFGEsfAZs4ycwryxAnDUWS
	 95q3zn5hFllorQ2ELNzvv9sHDxA8bFdeM0C2QlONQTNTjcKqr6o072QfJEXPC23urHOV9
	 kcX4JtgWHMJvD6sbgOEwziIGjfY7RHevZ4fRyggy7hVNtCWD1tZ1kFEaYJFXq0fGyXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
	b=WcJ2ZjcuQTmoSY/jpfHLxnUxljJYSkYLaXIoNgby78HyUgF+cZ4/1liuvdyMr73grWlQ
	 hb4J36M26RkQPaT4hELwjHpS0VxchX6FMRXLZd1t1KlSO3UYm89LvWNDLD0dxgCEOVllE
	 fD8g6xRZIJYKxxuetOQUphmFu5dnAEtDAkQ8fI3pwBjKMVCug0qKu4N/vz6R385VHNVBX
	 lB7Cpv1vn3v6Gv67aOJth3r9ifX5Fzx64hrdU19vPISUkWaCAIHPXo9qeGwQDr61whYXe
	 Fygm5DEHGpgqQERVIMx7UBwcT/mFyIDgXzWr2rrjZjGMP/P6ZiXsTRVRF0gvUEZ38Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXjX8reH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bu7WQSQJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2E2606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:26:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F2E2606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXjX8reH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bu7WQSQJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9vT74164829
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ESuzb9mGlbzEuJZWgE2L7mHU
	Td2bVeRjU88sdK3aSnA=; b=EXjX8reHa2KNrA2LGI8s2Ahf2Zmow+agLi9E4cHO
	9SV4Hdv0i+oD5Of3hssDyyEstAdMoAgA5mjKHnx8YUDJ3cEqPt7i/gebjFn4XBoE
	FAIQxgdDD6lmld4RpgjjCpxMZaHxYCEHVSxkw2b+36caFYTqzp/GExzw2jLGKU0f
	ddiRRjxcWdps2X5q9Ifv1b8XMQSqo8f/VGbNIhsAS5QPL54bW0FHAT6u31afypPU
	IffH1eARpTAuMBefiU9pAQbTuXtGMHjzHDxQcf+V6Q6XiLDtt5buCFUlN1HT8nlY
	ipYh3awuU3XA9aQN0VPSxEKR2GCKm+rZThz9uawCEOZCUQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtngjmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:26:11 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99081ea787eso824324241.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201171; x=1793805971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
        b=bu7WQSQJES2mMKNAClM0Nw27F8A93BWaz8K0Bs0bfP+ONTyPBgAC1akxG5Xfb6O9Up
         9GuzgcHuZc2BoarYjOaJ7FFsbRYJzOoP+fMIctxn/iyc7b9W6DAD/auYgM0vKiQPy7jm
         Xn7u8KrKP2XQujoCd1pQoOVLWmcOn3UWvR4TgzowUCocsY4CmzywF3AvOZo3mQOz+IQz
         3w+sm76wh3lsrBVz2AoUIS1XEofx5HquYkxGUaBNpacM5QLs1PsxTPb+938wzIAdpH6E
         KkpSuKHqp5dilakPmAK7fQ5INVe6EZxtEXx/B3V3itPK+yY5t5KiwND/2MTjleEBu2bj
         MM3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201171; x=1793805971;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESuzb9mGlbzEuJZWgE2L7mHUTd2bVeRjU88sdK3aSnA=;
        b=a3KqykBmGBEUefxuUIY2sXKy0kpqMjaU1LiXa7vWz57NNWTxPGugqF0+8hHJfz5xiJ
         Zmdd51YgbYWdKY/LqzDD5rdA132jld4w8yghI0nSTd/PTcVddVmFCMLZu7zlyP2patLj
         ANzxsT89wvPEPvlJ85PTYC/3PVBuf/RiLdQjstDRdDdxoGvrV94VsOe0SwwOQ8cFgR4s
         EcYxqRd5RnIdcKCFgdND1EkqZstFtBxKyjcBixxXygLkGyQUZSWw70aAeVq9UH7ZPV5b
         s1gbxSA1VoQeriwxDqZtttQyWNyB+4VI1oPL3kLgAuhstawRFtvHEJmDfrUz7s1Qm8uo
         ebsA==
X-Forwarded-Encrypted: i=1; AKwUvByhannXIH1/caV/PcMz65ju+fVjuCtaRl4BFPVctvlNFWkUOETCRSUSkfSqu3JVI5EtF5tmlA5/SDP71F0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKR4zjW+Eqkx3J5m3xTT0KFYoXV9aws6lkPT0kl7tAVJjUP606x
	YCEAsiXYDXA71AcVUeszLCsqiBEzkPi3ZSjqDIHJqEQoUy9W+tA2kSMNZ/glYEPHFzitcmbQln4
	RbqUnwiDgZ7ALsSr96SRVolapcB0cQzXiqpvwY1PvVrXII8T3GtdIlpvCtX01oF5Ygcg=
X-Gm-Gg: AYBFou0xqqiJaXaM8NMn3c1wsWd28FnvPOPrtPclqLzoJDcHllCraHzNbw6Y8XO2OpZ
	7pUvfNHZiF1tSGng5gbEOqpQMiU4Si4R9H/57zTmBSca3pFfH9sYgH1mQzg34i2hFc4heq1C8tU
	y06DWwxnqE6FLWONwgX4gnZ/1e++GNYQnZANZUSWnq6+mt8tJj9flU8x73Q/ONLE7gj6ExJgv3c
	cA6RaxdqbVlvbouf2sYGXDpsb/+7LjmbDhoxr7MJYbakXAZjXjgitqH/B4PX74NwvNycnaNGt/d
	qOUndTJrfufP2rO/OLW4sOcHVU2NvKcX4ZgryEMTGsXpj9vUpTfZVhWaOuj4JfgBbR2Q4cG8ZgV
	ixR3cGPlM7R65ru5yaKq5y55Je+EGoaH4Xl+XEto+MQFdnoMeimVouXOC5wNPAj06Fg==
X-Received: by 2002:a05:6102:290c:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7d039ef4abdmr1403678137.0.1793201170540;
        Wed, 28 Oct 2026 08:26:10 -0700 (PDT)
X-Received: by 2002:a05:6102:290c:b0:7b3:4199:2dd7 with SMTP id ada2fe7eead31-7d039ef4abdmr1403628137.0.1793201169882;
        Wed, 28 Oct 2026 08:26:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a978d57b39sm83510445e9.10.2026.10.28.08.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:26:08 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:26:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Subject: Re: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
Message-ID: <z3oqnmse3plnnntqwxrpi4xozyuxn6a47qc54agspwuzb4djqz@hzz3lbcmkvlv>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
 <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
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
In-Reply-To: <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
X-Proofpoint-GUID: RiLDglQZr0poBK03GoArEPtvHoSY-cRE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4oiej9SX+2yy
 nTXEzuG0QngAoHR87CBXnrca/yJokW0jzE6a6xVziPVAtj5Q5j2JyfLgAzcWxNw/8TrVSlTA1DZ
 LSXfpdmieM3gT/+WFiGXE6H1yBYXGJMr9JQ8I4/UMhqKe3lHJEKym1SqO+f1y+iwoROnWXY0j/P
 ryjiWrSlNuAV+qRyLMjncE2ITtsku/GXJeQsZ01ofhn7534kBAL7AbycpEg1Oo1cfp4f5EllFqX
 6gs6otkQGYfENRcpQTwANunr4/qxBHn6+JkykViWR0NSVpgZs9WMz4ywyezF4wOajnBBS7fGTWP
 ox2aotKBD/BQh37GK8LaEGiRM3zU5LcFIA/SXHG20XwhxDkEu/uAxfkVVi7rwegN6O5kPBzKe2T
 FZ9DEmwFs7RZMiV0RzyeFYVNfL32EEk4LsAmkLL8HXDI0GG3yXx3OKaC7Jmm4Jv/khDlRBBFc52
 1euxEmwzaANW+oKGwzA==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae21413 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f333AuverTXq-OlsU_MA:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: RiLDglQZr0poBK03GoArEPtvHoSY-cRE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXzrLJqIHjXHg2
 1OJ/28LBm92wzsGIrEHlXtC5Ei8Uorp8D3ljnhl/a/nwARSnNcmi/5ezIkOZtvvlqUy1cpA8/Il
 tG9e3jNOjGFWHLAD2uoZR2l+xfG1hEw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

On 26-10-28 08:20:37, Hangxiang Ma wrote:
> Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
> driver, including the Kaanapali common status offset and power domain.
> 
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 8cd331cfb4b3..658a39463104 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>  	.genpds = x1e_genpds,
>  	.num_genpds = ARRAY_SIZE(x1e_genpds),
>  };
> +
> +const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
> +	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
> +	.reg_info = {
> +		.init_seq = lane_regs_x1e80100,
> +		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.common_regs_offset = 0x1000,
> +		.common_status_offset = 0x138,
> +	},
> +	.supply_names = (const char **)x1e_supplies,
> +	.num_supplies = ARRAY_SIZE(x1e_supplies),
> +	.clk_names = (const char **)x1e_clks,
> +	.num_clk = ARRAY_SIZE(x1e_clks),
> +	.genpds = x1e_genpds,
> +	.num_genpds = ARRAY_SIZE(x1e_genpds),
> +};
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20eaf0..aff9e66f0352 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
>  	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
> +	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },

Nit: Shouldn't we sort by compatible here?

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
