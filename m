Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BB03F4835
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239834; cv=none; b=Sj/yCdCwhGuolhcHodyyHb02MAtljDe9cmkBYSD35BJPfQwMsOaFGAnFEEeSMKz+1WDH9nYi8yqGcCNHsXC6pDmfqyaUrVVMAx0E0rnUv+y2J9HBrDR2qt9HOoVs3MyMnd/HKDUExSKXkxGLYnYl0QWNVha1ik9J53DZ+aIO+B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239834; c=relaxed/simple;
	bh=hPMLvh4B/qutHl/1Fl4MO4beSnCtt+tFPmWl1Tf0ZII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mpqeyj1oyxkAKM3GSMLBdGC+ZuvbbBy2KsVsiSRINcrSFpgfa9LWe2Yah+cSwhclUlYHPjfyP6QzhgTF989KnoxskTM3HbJ/tgQ3/2cjY9w6B9gTobMsg0ikz5ewhzTKFg2esihnDjFJwxyjTPxdXLUMEFI3dwxKqnUtGV1/XIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHGTMWb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HngdUKpg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHGTMWb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HngdUKpg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O62Lm91475679
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:50:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azU4cXOkIOMdloNfjSq8Jjao
	n75fPsiVrta7+Ugvieg=; b=XHGTMWb5F8EBM2lbERFdlwJBxN9bhaWMv+yAQKXZ
	SyC+6OBvmo3c76liw7hiNHJKv0pz1IIMRVL4FKsu6QiXv5o27OHE53PrsM1zj9O/
	h8xhzLp9lYc6RokGdgyubh44p20TmeKX/5P2VFHxRcj/ZW/7zs3+QrBcd5DlE7mX
	4w1h2VVhm8S1YVPCNY5yGCN89FeD7HJX9fhfbUG8hcYlyJhSD064xiBqTbEgwqjk
	CDXKsiUEr61CmI34PchFcwDRJfpuF4Xjo7m0NvgdyUKZ0vfIgV7etsUBtTRjxP5w
	Nzf7jpYNThbqZ+1PgMJgP7HXjci5tRWQdJ02EmTlX52laQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8agn76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 08:50:27 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1416f32fe11so2787251c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239827; x=1790844627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=HngdUKpgapDPtycC0Tjk9dZttwZ7Sf9RX0GFQnxI2ur42vkWoyqIy8sUhV0MUG4/gP
         h87TGNZLRMDyholtbvZj9QcGxXynWfDHM/ojvnfUvFryWjO45by1s2DVRoFZvCUL8NSN
         kwsYWrehHfwYV9l7SVl7gDkBdqCqGPgRtYaJ5Xtuk6rsPqtqjuUFlYuDdQs/RV8Wo3d7
         9/XtxuQtBhKXwGtSzEmGHUk2WzrKH9YubVxssMyZ/MMvihFoJxUfHVi8+CkiAcYYSjyR
         G85UA8vM5FDVnIf8KdqdgvVpcvZ7pAa9NaGclD5DRE/gUPzu0uQCGKXKrh67z5tUjVBT
         JcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239827; x=1790844627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=R8DrQBg6KFtzzsG6z9qxSQSBTBdLCUUBkVvcVOaCrBKGjXDonT9iL8PQmbPsM2r+y2
         K0zwfJXvdGvEOi9bfg3RRJKC6oBk3AV04fzesX5VLUq2o7Uf7QMCBLYXHsopuu2lpy/c
         89MaWy6Oa4teYfJric0rU9rZUg4CvpqtyAVdQ+J9Sf1Zz5Iq/8KF1zdfm6BTq0lX6nwX
         Rgfbp+s8JT5SaFlhqDkd5eNILZFMQh6ZsUpt4a/96AYomBvWyGZS2auif2UwLyGp7qZo
         AcPNtQj5m4Bd7ooOoaCjKmmJRzGDlJswFZMsGy6iHuOEelMv+0uGBr75X70agq/XmLGt
         3cww==
X-Forwarded-Encrypted: i=1; AKwUvBzv18d930cQpVHh7/DbMObVm2a/NZ/D5NC3KeS4/9QutImTOLc5VuALt+5sUiIrCuaLeSjm+b4tXhlhkhc=@vger.kernel.org
X-Gm-Message-State: AFuF++kEOHv00HQPjEg86t09WQs8zMYRpn/N16exFg7qFkZyDvObhB3c
	MbVlVscLGmHtN7h9k02+xg15jM+Zo6JacfCtiP1RKe8f2sP3W9rKUm+gdvFV+Ph1RRg2GmcsxUp
	N2ArgPJQ85zHNXF24UMq2CxXjadjqChdAwdDijSF/CKEyFpWejKEcEtZ4FQLTh9fQfIA=
X-Gm-Gg: AYBFou06pOxpx1P3HJNyE6kG3uXlpZ+VIUaocjSEUakF57DiJTy2Iplh1O9/sNhQYv/
	ptT6KzXvmg7LvchCq7BF8vkQHSnWHJhFVP41HFKduYMrArhb3MF6y/YE/8QjUEzIAlkpN5B6NaK
	EL2oZnOvYjAqfbaQqeI6v9uLazYcFvDejmyHkzCeXvbGogN9bU/bMj9gooXvyoCB50Ret6ML1SJ
	U/KFinbLbiR3ABnGGZ47ZYmJYbwHmaBjC3uktqrMjG4DuyboDvHRihHpvJWkvPR5WCEa8kIDpfB
	fjVLhhPrc36pANjHQqux4YPIIZVjKh/GnXm1PkfnJzy0eyO0O1cuqkrAHhEEcEPvJ+lOOgU09ZR
	DBXy1n0yKeKwuW9u96dS9fkP2rqy4qX5h8KZFPdldvw==
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286632c88.1.1790239826129;
        Thu, 24 Sep 2026 01:50:26 -0700 (PDT)
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286485c88.1.1790239820824;
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm11885603c88.9.2026.09.24.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:50:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Message-ID: <arTkRbBda_yzklux@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX1Wcgc07DSRax
 6kxA3xPhmrhx2LJOK4oVNpUjb87ZjDvJ9UVLNlVaPgUkKNN8miOQMGXPo8bd7djmsBgIL1Nzmhp
 Is7dOZJZmuA6VdAE6mDz1d79zPSWxT0=
X-Proofpoint-ORIG-GUID: C_iwh8JQk0nuEdGo4QFpg8bXmf5KPMh6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfX0GqtRwprJ9Rm
 87tpes+9fsN5aCDzCc8p3soXgVZpm0BGp2PnBEBnIr7dhcfZ84jPqKd5QD09R2Ups6TmzovrGVq
 t7qm2L5oRtttD5FyrB4SY+4TFw4ell+NzH1nEAktE4MA7e0s5p7+Jws8xhtX8IRKBumYcT2ivg1
 R2jP8gEVOceTbdM+wl7CwFiTmk0n4iJOuXA8GZkuGRMFSeX9YFpxDo9h+aqQLC1VVyGqpgblx6y
 VC7gZZy/KMK8llWhiZFt6uso1WwWhais4wK5WbZ9l2gE+TAZ1IWyw4ko8hzE7A8Xcb9QC038/iy
 btHyi10fZex53O6u4njuwhqbS1pBLOoH2LHfoiBF63SfcC5zykPrKKCL39pD5iNFzgQ5qrXfAWG
 ASm0CXvoDuEmZt1WHlDgw/VwsZSsRr6hXn8Yw3lhgOoz1DIjQxsXi+15+rrIXn7KwsP74/sAgqT
 m3RLpB7K/hKWk1zNtWg==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4e453 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=q38Eq4LkVyZCF8x0k14A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: C_iwh8JQk0nuEdGo4QFpg8bXmf5KPMh6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240037

On Thu, Sep 24, 2026 at 12:51:31AM +0530, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
