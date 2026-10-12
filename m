Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8983F1068
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813708; cv=none; b=rJftl/O6pY7ouGBKqv6k7Vn0SoCZdShIKai/0q3upvUlAH66Dc5Er30PzdaCkp/ScRjJmkKwDpmp1a7ZvtfVE7zG0GQ/ZfEmqwF8CYcvDeJjLO58U8HiKVUBjSZtYWzP2/+VvbWmMYqtYduxZoOWHme+sZ/7qruSnGcwVVVfz7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813708; c=relaxed/simple;
	bh=hBuZaHp8TT2tPy9sHVBO0/9cnj9TiTeTGPgSlxqIMCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cpvmOh3YBb2XjLv+eO3+s2fHSd+r0rSg9DaW0QhmR+BQkTPshdQvXuJjMM0Cd+ilv5xT4hbNg9PVmAM23VKFmUiHq06xFQ+4wjLX9+o6ScShZ0WKUisucJSYRU0tAzpOtfMZS9h9K8x6rGWk3G5y4jm7lwgN25Y9DuS+UHcGSOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBHn8v96; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kSy+atrh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBHn8v96";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kSy+atrh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0Gbx3292450
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=; b=WBHn8v96BmySlV5J
	ZcckDIJSs30babgz5DeWI8UxO4Fbpnv9ogSFdB7qLcAIV3YB3+Ap7BlibnqkLD0g
	SjCknaWTgwahDtDy0tcBE6QI96oSdNq8/npREjQus2oK9wJfsFW7Yk5FQr/R1hyF
	YP2Axpl2uoRMABKagAvmxB7AE4sYl1/1u+L4hVOzwOp8Mh5YPXdrPhhOdvpqCP+f
	v7ck1UfANyawbtUZA77n3LjwRyP95n/qGTkJLsoyQtkLRy4IXCMDlMs10Kr4oR6E
	NnH25tD2zQ3Nkc3Tn/HYc+e/HWOYivMIHz8lU1JchAKhuhvVldh4fpVcNvqmNGqN
	E0wP4w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hn5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:01:45 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d873da8093so38124e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813704; x=1792418504; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=;
        b=kSy+atrhOAXTMXf0X4LXQHYu72SY4umpVLmkvBjwVUlmLyPxvI52K7WpmB4yKYa1z3
         3d5r1Pmjl+zILPIZVSY5mZKzVpfPBqraYhimOdfHvsz0Nd+Cfut+hPjtqeeVQ6zlzcxp
         uc+yA49erFnM87oxfyhETcN6vpMi6ePyTpAdwFtdUwU766SHK0kcj5fK/1cy4Q8gNyaL
         54VTtJo7c6EcJNxcwImBv7cYL2bQBSgZFT7EZrGAWpeq9K/dqq88fAncyvS5mtc73YCv
         lag+zcPL+qj60mBryReS9MCLl6dd8etknsBFLZAI66RSUAJjMEUxfOCyebSlAkIYmfEy
         5lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813704; x=1792418504;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xRffrSm/hTCfqJYTTAkUvuKQGsX5x5h5c8d6nqDnnZA=;
        b=gS0t8931ZILPGpj80x3W1xmoCASIOh99yKnm6Yqxw35XtRBplc/h35xUHl0a13uxTr
         CoSlUEidaupBnJnsj8yz+j63+gUela42+2midtAfY8w0e291Zhz58ko6H5rn6D4IiEkK
         8lhKEbjJyqtjglN6uuuwkw87R3QlPpghzhin/9tgT0Jq0cEcvJzjKqV3MJxQmBt6lbyR
         Wtbs4Rk9O/cNBzgl7KOjAcHu+fENvA7nIFHNs64NqAAA6BXdYMeBnpCtJgYQsI3EBEAj
         Crrn/Le764aePKgGB+9vvJFqybNlGIlEvKKrbZkqCNOPp72ZGIOYPazEEXgVbBAg8/bl
         cPmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrsx3Zp/8KdxV39i1OhE5QIRusbhjxUkiJPH2Y60oAxV/Fwn3I+XfO4RLHSKAOIUGTZIwmbBuZ2cdm/UM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVlylDPNTxxN4/Csx5tZ0prV6M+mkN3sOa3qqe7tBCYuIIWwFa
	tVQoq50lf5TLOmBvanM3gyaG/+30dlueAQMHqrf8p8FXu74uMkd0YX6lCbHed3kxQgLssY3w2lU
	4k/IvMQhF6wknOakPJRhoEpt0s+M2PQ91HQChWjVnTM/+UowwuyFYXuuDXanB/or4i5U=
X-Gm-Gg: AYBFou3nlVWvFMEgkf+JvnakpFVwBjzifdlJeWS6jbuYt87FpA68AqQPdyQcB+S3pl8
	jTiuseew0LCXTj1DDeD2vLCIvnX3g6rs4iPPaK7P+UixpaDhwFO+mVnDgbFiptZrWhNoZM1R5bg
	L0GuLmbEnpeWS0t3fQFGiLj0rNl83JAFrI3PZyzszhUdUFV/WG+mBqOO0sidyfJQUafgLS+PsYl
	7/1Px5lzquPkYCW9vySnXx0F8xE31Sv46QIONbvQnm5nzn2fc2reu/5Hgs9AVfXs2Zxbt4EQM43
	M0GJ58V8/mGWpleoZgDFOe9f7wLvXv9wIfbbWh65xdZ7qoKES5zj+Ar7VNDUsySsH9tZh12ZCCC
	A7OLHhgFrDB66bBjB/IIt8w==
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr1786231e0c.1.1791813703909;
        Mon, 12 Oct 2026 07:01:43 -0700 (PDT)
X-Received: by 2002:a05:6122:a5c2:10b0:5c9:fe51:53d5 with SMTP id 71dfb90a1353d-5e91f242088mr1786149e0c.1.1791813703157;
        Mon, 12 Oct 2026 07:01:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c338d5b170fsm237486266b.75.2026.10.12.07.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 07:01:42 -0700 (PDT)
Message-ID: <04672b02-cdf6-4719-a17c-4f7ce95a98b2@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:01:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] drm/msm/dp: Add support for DP controllers on
 Nord
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
 <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-6-a2ab9af954d2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX8R67/T5WpfGl
 UoO9fecscLLQ1qKre7wlIg/hzuAHDM8Mngyvyuy96llry6NQkXSEpOmWZM318GglZ5mElgq1k+v
 rvNV8nfmqPIRYieV2Lvu1I6TOgypbrUVW6mO9+3aSOgwdMzRc9A7wPdcscdSykGlpazeIxcSqEB
 ri/q7hNGu0AVfqLdZ12Y3YYNcHRGWv4FoK29tQmwOiTZzTD0Ck4A+8U81gNlxAio3sOIveRvQn5
 mV2ZUHjRy/3rQP06LbECVxc7zNCUNrthDOe5K3lq1N9PUpcqyRndqS7nbQ6Tn8O+j51wOjmayt3
 O8ry8LkOhhxk6gFkqD0ZKfHYxnBC4m5UI12PbmJEuNUeAdvoirVueta4mVZF3cikjhr4a//CanI
 W+y2fFiPXSlkhV7NFNNhDlSbaytYEIo4Ip0QTa94AggER+anGaTIhA1+fGyd639ZCqSp7VhEKJB
 QqFLHw6iYqPFMYmUzyw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX8wWHxXcm89YD
 a7sH+hkyXufF89Crv8O+SQBszSeREfunAZohEkzzifvQrORES70OUaQFa66rpEl4Ozs3ip5EixA
 lVMQTf7YWZjCgQrWeXVkKb/1ndCGIKs=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acce849 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=rMXm0_BZOgqvqhzNPSsA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: UcYEyvn2b9vUGieQXI5RU7m5dz1ygKXv
X-Proofpoint-GUID: UcYEyvn2b9vUGieQXI5RU7m5dz1ygKXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120055

On 10/12/26 3:32 PM, Nabige Aala wrote:
> From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> 
> Add the Nord DP desc and compatible. Nord is supporting the
> four DP cotnrollers, two per MDSS instance.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
