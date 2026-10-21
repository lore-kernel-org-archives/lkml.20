Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579019;
	b=ey6XNZtJl3jto83YQw8rla3s4rO+vNUazhME4n2BYpP0TIMlhpcn6kszZOApIkzgj53c
	 0q2oMnvPJSuY22duCg3RrhjCygmycJpoF1Le6O6MUtw4fvd7Y7aSbv76DHNdY4xwvoqg6
	 VjovCOU1XsG7C6heYWNYIw8bLNNxH5JCBg8xGq7UnNuigHMzciEILdtj/6cjxOsaOWeLG
	 G4ipWN7BLgIN7xey+xK2ichl1hiXqlBN49/3/hoC9E7ZpszvtF3iulGjYTbJppqZPcAp4
	 y8N9sYn/MmMJJeAclJaB997VRRUFdSaPxenUqFsgmhxeGq+Dk4EcFz4EsQYy5hbzS0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
	b=Rr0CmqJVcWEFFazYuLBjypsJYBRH7Komz8kFIJ1LW4NTb81d1JIGtBgef0gTXnIj5jwB
	 HaZXJ8A4T56Vvf/oN0Dc0vt6W/FN1Zg1HiTi19wg0tONIOWZrNroIm9fTezK5k65KB1ad
	 SZxmgHCb6jqkdKtr77iWRKD0umh3J0WU5RYzMXKr9z/u6jh1wvSVqi6nVQpfKKNTgAxuc
	 UtRARdhAL3pcn1+0kC9VHaz8AE+tOA5bl9ZKSgVkKz8o3zvaTY5xDmcqRZCWlURf1l7EG
	 oaQ0Y780pb9+tdRIZhdAOZ0J7QIG++TpUl9w/Ao/LbzfCai04KfTP30A6fB94Me8Siw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Vp4iHIH/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYyl33Ca;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D119606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D119606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vp4iHIH/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CYyl33Ca
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJUrf1422119
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BDJTCmz6NRGzzDUbjjpAqfjp
	VYc95zSzfV9UFDFGTpI=; b=Vp4iHIH/b9Q8rswfYPYJsKAo6rBa1Z4J48mcAa+Q
	7qjgUJF3HlevIxTNDJ6IzOuDTRRTW+HYytEVjAvPmGrA4QLm8/YxZygJNCoyURIr
	WdXV1Jajnj1hTDzjjZ6AR8Qz4KSPs7iOOVrJmOi+qkZ+4+IgryNPxvFAOYbSxzOK
	e8T6lXC4sa+xnzpXYbQUjAtgNsnCOG5ChtmkpTWNpxo8PCBFjkALaWrFQFhwje4E
	D2UQ8vXIsYHNvCqWwUQLQZ4nGK/sR513htDylgxhGCAuHCD1orw0nzZWOBYK/A7Y
	2gMDj6ZiKgnrkxY2JSCYeTNH61VBFTSQzRT00P3C8ejLqQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug1tq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:36:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso125609285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579017; x=1793183817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
        b=CYyl33Ca8WDKE51GLV/8NaGnmzXbXbbc65iseYZf94hhlDUEO1gD6zbllAHeMWHwcC
         /7by7whn3uTE6/r1le3wHIj3DgfUbwAppFQ8RTgvV0euDROxZ7aAc71VWobSLpePvIqU
         hi3kWGVBohXG0Uem7BN+Y3PtwDq4Ct/8L/56yrUS+gVmWwjTd6AmnK160A7B7RI6hy5u
         dgTTY3H253fu1ivRxy7PhlhXAWe0ER8qSpuiFOH63bWQjTXUXUhnigwoSjSyESOVh7ts
         y72yYpTwZ62NNwpOTf9W9XJJlW8Zj9ES7MO65izExkZJGTeOabLncY0S/pmkM7Rd/vQe
         Fo7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579017; x=1793183817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDJTCmz6NRGzzDUbjjpAqfjpVYc95zSzfV9UFDFGTpI=;
        b=Ly0qgfwwbqWr3yhsqcrilVuSTa0eogQeSLVQv5ZFZOKxo6UvJ1Ul69LR1owJf3dbLn
         sNYbD58pSRWX7URHIZyWmQgU3khrKwCk6wg7Gr/OH6r9NU/AnxdUNWAe5+ZK/h9AIMyW
         8Sq9+8sPZKF2ZyIDvb5mruHRAIVNJAn52MRppzaMbEciFjJd3M3xjQWxoNJK4gpULgCE
         lwLFaP4FJoOTPxCzVzUubm+FTzdjFt1bJmnMiCYd+KZhLt2ZFl7oDXuT9OcreqKKrrqK
         lADFIQpbSQB0GQ/CoF4enALNQbnqEoaB++T4ir5KvvT0mEQ4mqsIYA6QaBCv8krNcxRy
         FvhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEh8FmOWSdg6bWacY6XacghPGLme0khrBKgZIX5JAckm2x5V6GPONL9RCe4E1n3UZgwpKUifCsM/UyJPU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4Zvv+ju4jp7rf/CRAWMLlnVKW0jd0zCDzcG94tvQ1OiL6rsD6
	qENf0Du1OkXg/AhHJrnDSYOy7djfKiY6MW480UEqKgLe4ttqI7Kt1MLhu61ZVldR4U/Yednf2pJ
	wlGbDw7xPPmqZ/rQIq7fACXItzVvHR/1nPYi3e4ZSuclXfSsbQOrADU8oPaJHmiJD18I=
X-Gm-Gg: AYBFou3UjD4he9adm00KiPkRDei3d9GbaGdnq6Bt9fSoB5pg2m4ByN6piZ+eJKcvfwf
	/51ci32qz9lmajalrLvAg1G2TEy6a54BFZY0MTwD0RbSS6WJH4b4uPjimL0weNhhqvADy29cvAJ
	mkKXhRLhpPPODH6k3GzSKY9G5QqQzD5aAqSYOoICZFZ0CAwj2WCm8rl1lbJwpCQlgPHaV+yZN9O
	kZ9OkQrHOkAPogfsHrUEH4sOd52OfNHdeN0kT6AJZBP651LxHrqJiUtDj4lS23gfDTHDDgx8c65
	SSVkeXqVo9c9OWCcedzLynpuHsw7Tn5RWvzvzid3sPLpUpruX0VNnqxO4mO8s+I7C6U48UvHBkF
	FtC588GsMOILLPLMk
X-Received: by 2002:a05:620a:4452:b0:93e:f97f:f245 with SMTP id af79cd13be357-93f57f4ab04mr324735185a.30.1792579016760;
        Wed, 21 Oct 2026 03:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4452:b0:93e:f97f:f245 with SMTP id af79cd13be357-93f57f4ab04mr324733285a.30.1792579016246;
        Wed, 21 Oct 2026 03:36:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a20049941dsm20742025e9.11.2026.10.21.03.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:36:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 13:36:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
Message-ID: <mi4c3ld7yjptbubswccnzoq4xrlbj6yj55fkgwofnoaukzbmlc@l664p3rhjcmd>
References: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
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
In-Reply-To: <20261002-sdm660-pclk0-parent-enable-v1-1-d6ff889144e4@gmail.com>
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad895c9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=NuZgWczD4kNqo5kl0xoA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXwQXOY3wbbdjf
 tF1StksnBvnFnHdVMR5g91JvLSK97b33pAxRG0jIqZlELkTuHHNfVj/fgFL+xqSGbogFbqcDyBB
 d9i18F+c7+mXerCQn55ArAxddndUIpM=
X-Proofpoint-GUID: wVRoKhUGHOlOjYmZ5XsnkuRZ_ulNse7V
X-Proofpoint-ORIG-GUID: wVRoKhUGHOlOjYmZ5XsnkuRZ_ulNse7V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX9ZWgL+zc4gVu
 5Wm+7+cQnIF7xigulekfV0AnVj8fcas4K7nudCvJapszx/EjEyAdxAhJhBh9/t80+5QcCDW5tVZ
 vq1YHyuWyfX84Q8+avaLYaZ98Wk5kyFCmheXGMk8mANDArfvfQZnUx7SRArPYJKpDHsCGAM68xJ
 iXBMJL36gdDau72VPlxuKWhGKNaEpa3P5R0AwxlyLfI8M4iJExU3SP5Ph94BxjmRSTup96Fjg8o
 iiwA7+Q6zDWtjTuVNwLf7vgtSIboYDyDhkDMM+Nk7PqtiVV9yhQcZ0b7yLhZk81B2ilgzsSFTT8
 DK+tBgOiv/Xckm8LTUmpJFtKnIDEiwfYoPrRqiQuOYX4Z4XlVgEe48vC3IYJa7+pNC2oFChFKIx
 GKjBUQodRcQAALab9k26wqfsD4YawKWhJh2XUJxYeP1hbwSHDHnb3J1oQTHW0z+rxarrMTQVEti
 GRpIFwOT6WmrQ60PN9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

On 26-10-02 10:55:35, Fabricio Akio via B4 Relay wrote:
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

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
