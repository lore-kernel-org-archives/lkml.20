Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B02357CF4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954943; cv=none; b=Np91nCTqqkI34WseneQCYySjl4VAJnAvL8D1tQSRszJ53pJcU7awz5R8BM4pgBB16jFHgH1RDRK/csHSr+WkzBANdzB6q2Q9KC4in8M0xZ56vsfaY7PonRawNFtaHL2PAkN92j4aDVKzQe++ExauLizd7HWNdH+MfVyg3CquPG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954943; c=relaxed/simple;
	bh=BFJTgS4+m6AffK666z5geQLSFJoGz9ARqmUsrS1+COg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+2H2jfFy9d5lbDwADTYd0kVKmPAqFWOYq3P2rqbo6wBgustFeHVC9QdgEknL8VA0+dRrru2VCYsDcxbN5Dp+7oa707y3uYByNYTuaiJi6JiTpMc99uZcsbekJFLcySqLk5JOpM8GddN33c0Rklztmk3ynHuJ765zs+H2y7Vsbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GaQ7MIUt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HbuPCUwY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GaQ7MIUt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HbuPCUwY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FGsuG1246617
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 15:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T1+L8JBJ1croGtbO1Ta2y3Ak
	Tt+nw56WqpEdFXhnL9A=; b=GaQ7MIUtJ+JKgJs2GIEPKZzKMumtWfRp7AUF4MCV
	U0KyYD5yzGLDOVer0vuFN/wf6rZMhAle8XtIeyotA/p9Wt9fnBe5qLBE8QbfqfSw
	M1F47ocrsrwVe0tHOC/3knc/Wswr62hgp2AQxNQVYnbUmQrgEn3ABYuNRlwVOD0J
	Om9M3qh3QhN7seHVv+vBK16Fgwxk/gEk+cvraBr8RfPpJT5M9Yztpy0cMUVRDQPQ
	f3c5KJpoVL//E0xtmZlOzpewmvmjD7dGGNnQWypCD8xM4f+is/LYWv77MlNCV7La
	ZzrSN6YJL+mexcM8GUZKVV17txPyNcsK/2jl+25OsWPgfA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2f3d81mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 15:29:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca4a2b9c4so604950785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790954940; x=1791559740; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1+L8JBJ1croGtbO1Ta2y3AkTt+nw56WqpEdFXhnL9A=;
        b=HbuPCUwYlef5SNKrwZaA/NC1ESXfTQwBrrGHK+0Zp7XOHLV9yxPaK6suYBR3LpG4+s
         hnu0/Os0efA5ixx0en8wjxgHXI8+Qcv72mOS06VaH1uk9kvHLxFpThCgRkxZfavRZ9GO
         +QBFWftdQxmglUCkXi86z6u7VqS9q/wYw+083bY3WPaG/eY/qp6In6f9pBtfC9d/4Duk
         ZV+RyfL89y4ciPIA6sbdnbitTHz/0iB7l+rxPLPKFW7A1jeONfhuQtIKAqrxlciWfkgQ
         86YHH94j77fAeAswLKYT2v2vBuEhGx+pFGxp3SvJNFNZPQgXtMPMCOn8jMEewdjnmJON
         37tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954940; x=1791559740;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1+L8JBJ1croGtbO1Ta2y3AkTt+nw56WqpEdFXhnL9A=;
        b=ccuqq45GH29WHzzO+03pLFgHCL9FF98t9bGd+0rQwz9LLYTCiW+BeddtpbII5y06Zu
         LE57cXAX1Pw09UA78uPJA2cgbovk7W9ssXycx93E7R1/8L5hC9hQJft2SCFx1LMf8DDM
         5svRTs5Ti8o24fszkGM4/9AIyBCE2D9tRgLnf1LpbjPDJPWLhSiS4+UG8bN/cKYxJCn6
         TzbQg+njTC3bprLcTMLw/bZh+h1Fdidw2SpBVbw7Fqx4WLI/qloWco1hUOzHt2lYGcjS
         nkPD3Pf2ZC+8Fg6ZtqUp3GY/oAkSUSWHbPGYwArZVM1mmQtRbWlCqvsBtPyna3IAG6M1
         l19A==
X-Forwarded-Encrypted: i=1; AKwUvBzoZE8CUE3XREZbevLXdq/Ot9+hmMnHutYY3FBKCQALHEmjh2K0GggptL8bmwgn0xUIQ+OTtXrYSIzy61w=@vger.kernel.org
X-Gm-Message-State: AFuF++kJCGr8zv4O7dwr2ZkpquehFXGg26UzZjtkCcr+Cb+7741Z5laf
	w1N7schlFh/zLxtg9rhpxpNyHWxiFAuJdRFo6nZUIPa95YbcmqkuZy7Vr/25Q9uPF9+xgVy3FDw
	UrGakEU6Zl5Wpg9FWJ/w002X0gXKp1BD+FIPas+tYnC7+IqwxnUPyHbMq0NWQheTGqzE=
X-Gm-Gg: AYBFou1Vf/aIsnILAMJujmyhUuQLfZzWAWPcsx41QbIpvapCqUYprlG6YnTeAQtsm66
	UpWFBfQIdnujIF+g6a5TwqpeufQ256r+oJxWobFV7NyKNbIv4Ee/mHdkwgKUexf8MgvZeaXMrQz
	aLFX33AkcsK3zP2ulSzrjy6+KY4fX70N+TldX/9A/mBADNSHcxLO0lVrMpdZ0P2LP6rj7aC5/FY
	ARQEYlOHZxSeuU9G6cG3R7MREu+PS7hhvaifyt+oqXTGCCH5kdCy7uSWbhWyoWJ3kcAjT0slYdH
	t3Nk95qDNC4JA5EazdZyOUvyQEbUrZ7hrybrnM7KCwOYvK9K29YHi+ohhGIb/LawKN4VOsgEz9P
	5QxG5XhGBnINTQnQxkjuI2oOMTrF60ucqj+2zmAV4UOV/6W2jdCf++Zw8ExYfKdylqpNnotVzEk
	E/PrRUHtUMfW/8
X-Received: by 2002:a05:620a:2623:b0:93e:4bad:af5d with SMTP id af79cd13be357-93e4badb518mr191532185a.55.1790954940140;
        Fri, 02 Oct 2026 08:29:00 -0700 (PDT)
X-Received: by 2002:a05:620a:2623:b0:93e:4bad:af5d with SMTP id af79cd13be357-93e4badb518mr191525085a.55.1790954939567;
        Fri, 02 Oct 2026 08:28:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e33530bsm10506291fa.42.2026.10.02.08.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:28:58 -0700 (PDT)
Date: Fri, 2 Oct 2026 18:28:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: mmcc-sdm660: enable the parent when
 pclk0_clk_src changes rate
Message-ID: <3ccbk6p2khwi4nnz5xrenw2nevazpnp5nnf2iacxgit2mk36cw@3wljgcwiuj3i>
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-Proofpoint-GUID: G0eygQwgNYEmNaunLJMu0onVDbefPzOc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX8M7YBgkdwfHS
 Pecr4V26KJj4XBwj4pxIGj/Hm8Wj61lphHPU+5G6ZMqbUofHq1NdVaJIp954of04hFnjHT2GGo1
 SWM1fpOQZCcV00X9YjRXxfbnZsBhPds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MSBTYWx0ZWRfX/Bx2SJGOw+cE
 EORzvXK7ArcqKv3KJXOUcwGVXPW10o9G82yIQGAMi0ml018bwgIt3JD5CLuq149VddJquGTAjuA
 NdB4HGu9CDfCknE+pev36ft2S9Un0R4HjxPJ5ytgs66dzhFNTV9dQu+YJsj03K6xmXSQU+otifk
 OuJDZh6lY6E+9xaHMfT3t76xHhCf2Zj3QCUG1WBlJHB8Uy3okQ6X2QXvD/42YKN9cMjOfKXg4lc
 hmQ1OJkT6i+xqnhxbZFBrrzUaKBhWNPztuQsouWevNjHRLitdB4y9vdrW2MW4h22Th5hM59SxtE
 tQd4S7ArIE/DOHWZkBB2dZQAbu6GD/EHYjvOTyXyocthI0D0k04nzw1gBWUBmMvnbbW5cTY2Xyb
 4qkCOkq5LxoznNx4BFlTaYe/gWgcQk+UzuWOwyWtaB8qgS6ohmhZ5cvceeoeIxRmeasvvfZJ6F5
 sc+g0RxpkVpD4iDRP5A==
X-Authority-Analysis: v=2.4 cv=L9SI0OT8 c=1 sm=1 tr=0 ts=6abfcdbd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=YkurVD2kF5Iagc-0gNYA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: G0eygQwgNYEmNaunLJMu0onVDbefPzOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020061

On Fri, Oct 02, 2026 at 10:55:35AM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> pclk0_clk_src is fed by the DSI PHY PLL, which
> dsi_pll_14nm_vco_set_rate() resets and only clk_prepare() restarts. The
> DSI host sets the link rates before it prepares the PLL, so the RCG is
> updated against a stopped source, and if it is enabled at that point
> the update times out:
> 
>   pclk0_clk_src: rcg didn't update its configuration.
> 
> Seen on a board whose simple-framebuffer node lists the pixel clock:
> the RCG then reads enabled at msm's first modeset.
> 
> Set CLK_OPS_PARENT_ENABLE so the core prepares the PLL around the rate
> change, as dispcc-sm8250 does for its pixel clock sources since
> commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for pixel
> clocks").
> 
> Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on the Motorola Moto X4 (SDM630, payton) with the sdm660-mainline
> 7.2.y tree, sdm660_defconfig, DRM_MSM=m: without the flag the warning
> fires in most boots, with it never. At the stall the RCG reads root-on
> and the PLL stopped. With the display built in, clk_disable_unused()
> also prepares the PLL under this flag, and some boots then log "DSI PLL
> lock failed".
> ---
>  drivers/clk/qcom/mmcc-sdm660.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
> index 9f8b8e29fa0f..bc95d0de75a3 100644
> --- a/drivers/clk/qcom/mmcc-sdm660.c
> +++ b/drivers/clk/qcom/mmcc-sdm660.c
> @@ -984,7 +984,8 @@ static struct clk_rcg2 pclk0_clk_src = {
>  		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
>  		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
>  		.ops = &clk_pixel_ops,
> -		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE |
> +			 CLK_OPS_PARENT_ENABLE,

The same fix must be applied to PCLK1 too.

>  	},
>  };
>  
> 
> ---
> base-commit: 9f24d789f03b22941b905ded43cb5ff8eea9ce62
> change-id: 20261002-sdm660-pclk0-parent-enable-8123c9ac71d8
> 
> Best regards,
> --  
> Fabricio Akio <fabricioakio@gmail.com>
> 
> 

-- 
With best wishes
Dmitry
