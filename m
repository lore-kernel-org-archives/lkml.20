Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26E84D4873
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410449; cv=none; b=AzDaOki6IeQlpgvBLw01C+MLgG4+3N4XnHb7s7hwkDHckEIQBfgS3BbS41C5JMGPjoxL4NnhDKOLtO5soOv42goqGMKR2Vienb18m54XKLxxMxqtNiWjC+QXghLSSUjYqnUr6lgESLeC0WguzX66wnYreh+wp8ssWckEBfrfVro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410449; c=relaxed/simple;
	bh=y0Ccx45xxLYWt9pp0bul/0px2ejfDCS85zdyec5AYdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CXmWjCSC94OnEjw//sE5BGnFH/XGJsdlTePc7z41QNBqDtyEh8RAirnUzrtsyUhTzo9dzCvpx3WVCnXJol8Qzb6UNktQQCqjLZ2OrhvhGgPYCcx6DyVvBxHt2S8OoAlR5if1atttwepx0B255pza2z/tH1cTqTyt9gFy5RuNcOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XW/3WAht; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KQnML2Vx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XW/3WAht";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KQnML2Vx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OuKm723272
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DA19jX9AB0uHbCWwD9Zbkxsp
	a0JfxX+l+oTCDhGHnvg=; b=XW/3WAhtWkwvCLBXO/vlD0QZ6tpeQ3sN3MTurgTS
	OxtGoYo99+/xkRlscU80YeHr1FgogvIN4dd5HV/rt53OdWbEVSDqM3X4XbcG94fD
	gLYmZGjQu4xVzU4IEVSP9Sgss94Lre2m5cDmXuV4Vt3iz8/oq9leUu0DK/20x6tW
	Z9GvJfHnd43p27MVk/MD+s/hC7YyZyjyWLIMCHa2NKhW3y8jXGRmgE38X+vLPQim
	7/Y+9OqT4cprNevEwlJoMG2NXGmUbzC3DeditX1IbIvQVZ+vQysLMasPFFit1MOk
	ma0d6KgTKawpeQZyVjP7cVVFoIgtqWdZpkqE0gfRV0khtA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gvj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:47:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ce7a85f04so414680185a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792410444; x=1793015244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DA19jX9AB0uHbCWwD9Zbkxspa0JfxX+l+oTCDhGHnvg=;
        b=KQnML2VxCpD+9VqQJRc4Z6MUJJCvyqV14h6THhyEY52oa64OrpoRDB1DzVNmoFQb8/
         HKTTB3zpVtde/r9EL69Kgtvms4+1zaL2pd8yXQDM2lOPiyOuEX2RJKbDNTlH00gTipNH
         KLKJFUqrFpWo1t8AAOtRdBCTtMFkNMyCwT/7jllV6UxoIC5yUA5kzkpBC/iDYVsO90j+
         /Vm/KV8NE2I4xzU6ibOTJGuhPp4FAi1rjvVs6Hfr3q2SH1HQ863JPxEE3tFSWk+0NjKg
         IZDqChhZK4yYDFuZwExU+KP4dp5NRryjLVWXJ9+g2iJEhW0UvyH9CdMG+Wge81pdXQCa
         42eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410444; x=1793015244;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DA19jX9AB0uHbCWwD9Zbkxspa0JfxX+l+oTCDhGHnvg=;
        b=Br2F4EYgd09twre11VTnjSFOmJptdahnQ87LqHqGK1snjuEvIY9pCYXgrDF2R/5cqw
         S+QR6kXdmx8rELwLBmN45yWxWUkBgN9r1KLPrvxoiep5cwft6qFfGq8Gsb4vys6/NwPf
         sgb7nOe2AiBfSrKg0tv95UcG3xI0EThUSL4Z+ZCo2hh6wjI5B+BOTMK0pW3TPW/M3n9x
         cItKv1k7Lb5NmBL0xMcXdTqkqaFdU3wg4A+o17I7W4j0oKAEJ2qu0UGhtjL5KViTKXXK
         iGo8F1STrp512cv4Xu7d/ozzVKMJ/fhXgUy+q3gU6oXYqapaYm00Wwj5ynxelCWZLwgH
         eYGQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0lIQ+d/qn4hrKqVJcVPwBdqsiqkY88PbToV6vDEV94uAOOVj/ezSlqX+0uOBuW4TQsG6nmILiG9CkwWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbcydgONsChPqs67PrHhJlfhVcGpFOkfG7QbuvoQwMACu+uGhD
	hyNIDFL0jKa4fJb6ynzidY3VdTd8kdWipkRMX1bXBIyVzETD2AMHXmL58iub9xNqEXhUPSN9LXA
	vmFeFikz1P9wl0fsKGfAz26zaBzh3Tiwp+WxW+0T1nbcxtrOc2c7Us9+77S4XTAfwXGw=
X-Gm-Gg: AYBFou0Nyn2TjIPHHrp/5WeEyKl52m/yt2Y0O2nnheez122hrTS4FuU8pFZJTNZQXsL
	iwIQYd54+V+q/t9YEr2c+08YcQO6WJAq9Nn9PV3FIYoYGeJQK+P/+bfN7fiKXbdztCe3Z87BuWo
	7h5bVP+KkrhPAE7LKzjyGxWgrbpd623ijAygqfgL03WV277pyXSnP5walYHtYyHoDS3SOJFtxHE
	Ls/wK2S8AUdMlWsQWN+cw+GRv/g5bobm7J8cYlNTdd4rvx61G5hBxwumEZRoKvMKg12UoQCqADE
	GF7ppFWiQuO4xl3f+CwY+Go1qsqFshH3opr8n4v5DacbNjnYdPC1FEQTWUSbEykbjHtk3I1PzqB
	05O5U3vA9ci4wS4Hu
X-Received: by 2002:a05:620a:4042:b0:93f:735:6c83 with SMTP id af79cd13be357-93f29da63b5mr1143958585a.56.1792410443676;
        Mon, 19 Oct 2026 04:47:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93f:735:6c83 with SMTP id af79cd13be357-93f29da63b5mr1143952685a.56.1792410442992;
        Mon, 19 Oct 2026 04:47:22 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c575esm19986031f8f.10.2026.10.19.04.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:47:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:47:19 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Message-ID: <gcsjw73m5tj42ftvhyckexor62waf5eydntycyy5qm7ubkesn4@qgr4ratyntfw>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX9iaQmcsm28jA
 UNvG8MGupjQeYCJbaykMmcZgTue174At1He+l7qeatOIxjLsUOC83hj0OOngoFn8dRFGg2Ci7ir
 jrr5z4E0h5I0srnfL+ZsUlxhJjNz33w=
X-Proofpoint-ORIG-GUID: udxHX826D40uMGoDrcV6f3m5HAZBRZwg
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad6034f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_xPOIdEwXcuG9LIM0_EA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NiBTYWx0ZWRfX3UgFnFhTBQX6
 wKfLYpLwLABZiw+oPgMtFFs7EJCAy7hhP2zbulGl3Wm4UjyiF2k6YjER/kZe1l3RqMsIXKnhgXM
 qZE+WyapJD8OjILTTTKYzDakI2H0ihnUiqW+uhifFrXgnRJJ627OrARtjK77kTwwyNn/WV8wyMP
 +Y4jtpaChRP9RUjERc3ya1hwrnW4RglcPNLTC22tr0e3F4r3TM08z9KfWH1MJ1N16TqDsFz7JVq
 b3LR5NthBYBAu2CyP30Gxx047Uq0oeK2yjmCkOxZrONcKTKqydB+0vVNg41lF7hqt4aaUn2MBqp
 STuUeNta1Zj0eBNGIb662amwdJlBu66Tbytrp729J5DgcM6bYcnzwATw6HGiDxLsMl9zapPjP3Y
 PtYpxmrfa0ZOVEkOXCaWdJfon6cz+jJVybG6C6Kk+gUIb4/VvmoRcd3ZmWMKHVe4zqsim25WxN+
 OQ5XwwW5uNh3Flu9C/g==
X-Proofpoint-GUID: udxHX826D40uMGoDrcV6f3m5HAZBRZwg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190046

On 26-10-19 14:25:41, Dmitry Baryshkov wrote:
> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
> 
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
