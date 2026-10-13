Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F216B49BD6C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887857; cv=none; b=MuuTc5JF1MZYZuSTwRu0LjfvD2cVGCkfvAM6du7l+5ClwyFvP134zVRgwPOfPZEIl8e0l8ruSTl+GT/CSp8LKd9ZxTNH/xd/Z/orDtyRRDXJfvC7Gy4PPL4siZTrBpyMewCbmrn+8+ibnhjma5w8o4nvqdbNFkODBg0pSNk0t9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887857; c=relaxed/simple;
	bh=+HssKmFa4W8QviNZoCbAs5D4xy1mXVxaLSOA8v8Z2Zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hL7Ir5PqvA59oDeLSx8q2Dyxk/VQ6ZM72ARwbqTj5zsxE+PVB7+kqit37fFoyAIKu58sPzoxIx5eZxOQjazHP0LfuIAPg33ZqHmaGIqtzJDYi+1zHFUAlJfqN/bPfrTuekZuy3emX3CQPAQv/+vdyx7Xv/O4DZX8EXI9E077cew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O5N+ZGoZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jgBuJL7j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O5N+ZGoZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jgBuJL7j"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRMQ949375
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a9AxPqD/Z29pGklUbSzpuY+z
	VJ7aQfVVvZ7OQ9MppEc=; b=O5N+ZGoZ0iA/VHGDtnF/mhl9zz6ze7KHh2YzbJNq
	gtE+g/zxFAKZ+pNvWQbUnI0eI1q2W/wJe5E8LqFHTq7QLJlWE1fHoJWpepXElLIK
	tFrP84fAJP532XxN/f7NwTh3V+RydjMPlnh+vA2w89e8E9ZLyFKZIm4uJwkuDTgF
	ZNc+UOLzvyk/ySUXA3nqU0+lqBw8b/18H+gmEqUILSEGh0m5vGro0SXGlgCEM5Pj
	slJS6XoGwEk70o5PtnFH8mxAed7nFQhV6GPhnmV5bmo1CrfkR86TR2PCvT0xMnFE
	iO3qsBulk+S03Ei3bLqbjKUDBYBPsYISe1YHzULLOrClRQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f6293q0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:37:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dea1b6c89so543296085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887854; x=1792492654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a9AxPqD/Z29pGklUbSzpuY+zVJ7aQfVVvZ7OQ9MppEc=;
        b=jgBuJL7jskyybTD6hyKAdxjEzFRyXCSk/WcnZl28fH2BKWNEBc6QA+IxQJm0iIOBTZ
         flbwVJLjeTYjn8BfeVT0qzvFntq8c9PK+Jtk4pvKIT/nwUGNRA5Xt3pr6Cn+lKrL3EdH
         UzCpSdc0AfAGwUxjzXmm4HvvwHRQuu/r388xD6w4kJzsSotDNiTWQEt29ySlOv9FkYdy
         lPYdEP9CwhK1d6h/qKD7oHnUSeITcBbwVcDOMbXJkfNuqUmvP6WfQZB21CGyBznJ+eRq
         +WsHfP1GwCYCyD9Kp46cv/w9i5c50pYqEZmdncAT98BEsf0SlMSwjM/WkjLC6FCfXmtg
         ejgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887854; x=1792492654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a9AxPqD/Z29pGklUbSzpuY+zVJ7aQfVVvZ7OQ9MppEc=;
        b=HNWHvgO5KlK7Ft7Qvq1zktSWc2bmLpGmb8+nccnWQNJuxQvo/QngqPlDiGQPoI3wxl
         K8gB0ixFzxL1mxYc9JVPBJgIaseQXfViCRQf1gtxTRkaj+PQWf3AEytiWRyCUHpGvVVU
         hLsJuvnerwNLWreWipjYNn2VrvIFNOFrov726i6dpKe16ce0WyagVzOlBnDUPbLBD54z
         rGxGkT6ORcIqxvY5WWVjLiiAT0EHpc5WFYgivzi7yFyGyrB3Zvax3fS6R5LfCJf6GQVW
         aC9f0Y8yJO177zoa4uvRJnIIPpSiw3XHu29g7OZQkV2/XgpXvAjcAb6BhXTK1KQrdbRW
         0EBQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6VZvO8oOhZzVc9OM4ipSw4pfoI2xyv2Kx1K+fyxeRDQqcz15G6hEKaVN8EgFriqwDFM/ub/fkgC3UaxU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLes4HYzulnO3sKlrjYcTaBS88D4JLPC9GmVr+Ek6yDp20CguMn
	zHn+1OtFdlzE6w6727NQIWkVB9kHcDwpoeBrvgyS5b5NPheLCHLhli+Pn2khTZ/wtRD52BfG/Il
	sm8v/049PEDheYISf4Tz6vuE6tlSKhZit0vcPdYY80I7AFhGo5yl4HiIpU6TgmY26iL8=
X-Gm-Gg: AYBFou1TBeu0XL0+xOZYen8W/3POtulgKHqXm2KFwHmzQUIABfof4WFOEA3xemIJK/i
	OgeGKmGpGjBL7eHzkcAgNH+m5I1YQLQFI5EiWw8X6hSbxVxt1SR7MhmE4yB57kY2j0/OyBfY4xy
	meoNgZeDFMq5OHsz0tDlrLRgxOm8iR+JCw/Rjo1BdjATbzFTvkqDJXaoqrThHBFGKKcdLTyi+Tb
	HXMJvGvD12YmphHJvQMVSzUkjVxhC0cY4Rnzbt1a5UTemB1sKec2zJ7Y+AFvOhbiFK7HOUTqUnL
	j/4Yl/VXiqFZ/iVIA/JoPfxbhjmc0BUtaMNuJQAuwCc52rmehILcKS69JVcPh+TDGdJWYC6y4dZ
	oFCVPnp1YWuqhD4Z6sazwNi4W7ER2SoAGPVQLHYbAXUIMSax0HhrHETUfJ9pkcCgOMArKGVsNgl
	Qsi6BVV8HvRuiJ
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr1860608385a.74.1791887853978;
        Tue, 13 Oct 2026 03:37:33 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93e:c12c:43fd with SMTP id af79cd13be357-93ec12c4a90mr1860605385a.74.1791887853548;
        Tue, 13 Oct 2026 03:37:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddea81c7sm3497937e87.49.2026.10.13.03.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:37:31 -0700 (PDT)
Date: Tue, 13 Oct 2026 13:37:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v3 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
Message-ID: <zlvbdhqnndsqmat5pux3alfdnnhalvmjwf3gh4qs7u455vkaak@ge7gn4gv2jqx>
References: <20260724-nords_mm_v1-v3-0-32b45232217f@oss.qualcomm.com>
 <20260724-nords_mm_v1-v3-1-32b45232217f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-nords_mm_v1-v3-1-32b45232217f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace09ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=IpJZQVW2AAAA:8 a=te8iVueUN0VzZH6eLK0A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfX1mQTvYbb5RAg
 rEG8iO6QhDH0nfaE0h4r32+vlGDjz81ROzXsqfU/5Iv5PiUpmS0vMcEG0nHtQKsM/CjyvNqbs5R
 rTBhhEZQo7LBVTDYNF6dv9jc8Y8kWCQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MiBTYWx0ZWRfXwMAQREmXGfiP
 jUNEpGMr5/jm19KIZuhuYH7XJQFxC4HVPsXDVUS1BYlmNuyuXfArMb9f/1F07mf7WWWrEpF7F2+
 XEQhPehHBRk/x09C42WYJsnNWZ8D/3jqkqXP5RI32Sjf32CD8vL9RD6OP5viaE+AFuad7tn6vkx
 wUqTqBp4bhweopzwZQAqNhavLCSbtDx8UXx95Mm+JG0XQjZv/t0M5KQEFTQMxTSPOtOwmh7MeMP
 OX9S2onMHug+y01H1TON9mr9MdHdtWf2TIQUzqnmt+lnVhmavCXyg9ofb3rOsnACekHoBv2slHS
 4Tkwlaoa6btf7HTjQyEYfYSuQXWewgUihbxEYamf/oyUKbJjdeqwIWmrHAnuBK9lFxXEOAUMmQC
 jQ/YmyrlXZXPZZO2/RN/dzJhNbR0HjTLhFJr38L/UrtPCTGiIpZyE4cdfjgoACRQKF/cgJy845L
 xYJkhOGcsavfp82fg9Q==
X-Proofpoint-GUID: IytBrNo44Mmwu5yupTfd_DHgglvKOEEr
X-Proofpoint-ORIG-GUID: IytBrNo44Mmwu5yupTfd_DHgglvKOEEr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130042

On Fri, Jul 24, 2026 at 04:25:05PM +0530, Taniya Das wrote:
> The PCIe link AHB and XO clocks must remain enabled for proper
> operation. Representing them as clk_branch instances allows them
> to be gated, which is undesirable.
> 
> Remove their clk_branch definitions and register their CBCRs as
> critical clocks instead so they remain enabled.
> 
> This matches the handling of similar always-on clocks in other
> Qualcomm clock drivers.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-nord.c | 37 +++++++------------------------------
>  1 file changed, 7 insertions(+), 30 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
