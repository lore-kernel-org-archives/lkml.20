Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229838;
	b=Rpw7He2tar1hOTx/KodU0YgW/JwaLSQLI3g6FQFb6BZB5QCjDZfHydU6Utmxvg+7Fzr1
	 h9k7RNneMF8vanAKYHDpItDVRkgkoezkV/ot3QuOvfP/BdIPf3R4UjtqGpcg3YqGBMEbb
	 Vwjzb5Tne8MeTNkYm/BnfhlIQWNTC4EOpu+gvMwR5gdv8CzFrSaq+J4LJSvLEy/+ChaRT
	 j4+mn9gDkqy+lN5EiB7Jj/ncHsEiCaabzBn6hNc8oJKs3Ugjtr0YuAWH19QctBPUnv3ee
	 ARQijo3RqdMLudvL0qHwXJFVsXzzCTdmKn/nc5B4ztrTXOHX6HpioX+oAWiVV6sJIiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
	b=YKBqG8xygm+OBPk/IWXeoABvdoUd894/XeA6ynkPB/zYyM+7N8ZZCFdtnf4vWf6VBiIr
	 9f/wj9yXdbmK7aZPOdg60wThE2kfFKCbCjV440qS+RD5gckFrKfKyHivsRvBmvNtpOfjY
	 Oc4Bn5U5S7QGomB0ORqirZ8UhBWc0pDlcGxelM2j+dSQ1CQ7qhwZDKQHs5MDv9H1ilLl/
	 uhpDuIdjU/IQ6+5cw8SejuaVWM8NG3yws1gDTKKRQi0zdceo+tGNkyZxSSOSP8oDYqLJS
	 Ud7MFB4d3lvFK/ilUVGxhL+SPH7Tl7bT/06iwB3IxjXXfn+KWmS5Bd2WFjqf4h8k+Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="k/1lxwbO";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RMhgqQ/8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F675606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F675606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k/1lxwbO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RMhgqQ/8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9B3Nc13936941
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 13:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=; b=k/1lxwbOE4uLP7VY
	MujD+j9Rh5noUzT/4yrskSNS6wTzY+zyyYhKGXcRYcC2oZRi8QTzrHJ3mShp2tCy
	JldXh9BfcQxQCXhYl5podohUWvhuIYtOr3atR33Vhi3J2/An3iDrALGWugu9fd/V
	BCX57x8g2fQhu3xrUUqnydn2tR+z5JTPPBGeaQuvlfXGoCr5GJSXT81JR7GUVLvc
	ub4bQrSpLpYp1MnYURxWW0zXAfqO7SU9NmMdKJTTu7OtzZAmR0QnMcXsTPYMaJkf
	0ClzobaQ1lXp9iyd1quFUkg8WLgw/aQ4aTHz7F/Y9rWFgCm0CJwEQhfQZccfgnpA
	dV18XQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hucydges9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 13:10:36 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53630cded29so3182271cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794229836; x=1794834636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
        b=RMhgqQ/8B1ixzrL7KIk8+Ia4ZImzMFBkbSw/YBbwUW7hsIU0b3UFZ1aWQcRYsOnjTA
         tZShaaJegRh27O1Loz1YElphTYVYPUpWDhXEjzz4Q+SNxs1ru28EhRUxqssUH/Ts+Ppp
         x+bSyPcqisg9o1mJBuz2LJEwnmcdmR8Fw8AWn8BmiBUE1h6JuUoUT9yAGq2Sgr1XLNjC
         ENvpE5gXhLUT4NlZhXezZRrW/ndbiRqP3bFcp11Rw5RegxhzUiNXvBsY3CqmCK+7iG5A
         3N/5gNHWc6QR2FxQohmBh639h8n++1bfLPsXF5pqkb9zICsReqC4P070XCZNGncBVd/6
         7YIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229836; x=1794834636;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnZsY44wFy3q/HITacB4SEcKnwDZevDNn4+gnmN9bLY=;
        b=ue7lYhBzIZhVzeQoNYwsVKIa/j+57tazu/q+08zIVPugSEYszEMvRA4hXMeGMIp+cF
         Mer153l3UTMj5Xan+EsoifCxKZyLFPi/mrluFq7cI+bBsKhp1uPba8MF0It74wrARDOp
         nKPHs5E6ZuGcHZB/Z18b01838fndwsW3V0/7nZl//9a1I15jfxNnhbrJLDFQlwErWgs0
         NpIccQOBdcAmiP6Jo5Q+JSECqHMqq81doMS4JCZdTVi4mFjqwN5lMamSsi+45Hdi4Q8k
         tOJXZTYHxJGmGgx+6UztVFlzDdjYkDlytp3dbKDp3ShJENTLawJ9iWhnPq+vMJkG/G2i
         fJ9A==
X-Forwarded-Encrypted: i=1; AL+hErG7jFsihEzRC/l/ceJQqHd74F8WPcBun6oJk0i6eC1HF0rlOu6yh1rNRGKOZZppi5xG1XB9bWgYh36SmwE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WjJfMsL/j0psrPIqKfizK+Bp9NO07frAskk56ZXrYlPf5mGn0
	ZTzf1BOukntAzWi2oHZi21273PA4F3XgPFGi+LCvcQi1X98Ik6glOnxT4hvf/LGiFd8Elo3SPR+
	FWcUm0WBsBJ6te9AJccesdPbzoEWFNDAvuo6MEHnEXKZBPpsDfonmMPBi+OJOOXZtpAA=
X-Gm-Gg: AYBFou0AEDwNEfbHVG0FjbbOUBohldgcJIUNj8/jMVI5Fj1ZdKv6tHKLlR2X4GkCIRd
	fmlDFs7IIs0Lfvd38PXD4c1M9ahZzNAVHfJ0CfPcrLghJBEs0LHvXzpirrLTUhASYWFTVylKChn
	oY8KfJIDajUWHb4nLbUlr/V5KvR2nsf+gsFXV412swa6AuIRXdN81rDjElEKzMLwBoZepiS9m/L
	YHYiPV3zr951p4bKtdxlEL5oecJAv24KzlA6ueOKNf0saE9CjCjYct9rPtFdzjms80R8jZurtp1
	9y9O/vM0Jmp0S16tbuZtjhMpxUt+7h0F62i+nQc5pwymazarEiV6D2XOH9Hi+eHNAo4qGQoi3e/
	pUgBoQliVXqAQnx+02PHgH1Vp8+oBvnO4VutMHvbsG2KH0QV8YIu8LmEus2vp8puC/jVN8g==
X-Received: by 2002:a05:622a:e487:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-552a46edbbdmr59576731cf.3.1794229835818;
        Mon, 09 Nov 2026 05:10:35 -0800 (PST)
X-Received: by 2002:a05:622a:e487:10b0:54a:a0ae:795b with SMTP id d75a77b69052e-552a46edbbdmr59576271cf.3.1794229835244;
        Mon, 09 Nov 2026 05:10:35 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c14b7fc273sm905653e87.24.2026.11.09.05.10.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:10:33 -0800 (PST)
Message-ID: <86c73833-99f2-488e-ab90-114f2c9d1c19@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 14:10:28 +0100
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
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: sdm845-google-crosshatch: Add
 display panel
To: david@ixit.cz, Dzmitry Sankouski <dsankouski@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Petr Vorel <petr.vorel@gmail.com>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261108-crosshatch-panel-v3-0-87dd4ec4f7cc@ixit.cz>
 <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261108-crosshatch-panel-v3-10-87dd4ec4f7cc@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfX3bNnI4EThaCP
 k2psAUMS15eMdWdaYZwrx0MekxU52OpULYaOnOuyFqFAMr5tDc9e6O7gjawPhS0jWNR3GwPlpQs
 oWTGcCCZlg9fq5t/SWUhK9vjYjhz5YY=
X-Proofpoint-GUID: wW6tcgvW46jZLZDXcV9vOKBXJ6fVxWTA
X-Proofpoint-ORIG-GUID: wW6tcgvW46jZLZDXcV9vOKBXJ6fVxWTA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MiBTYWx0ZWRfXwWN6iKAg4ty+
 m8IH9STDyEF1o6y/vMcJgwZuFHqbkKjL6c5b66beB4NKbZ/iKYChR7Cg+R1XGmQIzmJDjmi6hSe
 Z830O/lU9DVJCuTqW32IpIW8JnX5lgH9cAWMqIeTYzo/X//lIeYUiSU3KtVYPLBD/X9S/sumacS
 viZcsyLbnRo19rYoqV8s5RjuH3Dj0usVwBpSHJrScpGoWaZVS28JblkhNaCF/DFQtMI+tUkbtbp
 fY4O3mq9F6RQrokRPGJFGUDhzRGIUrxLERsNH2ycY8TA8GsBnLxhzEktBYIOGkpkB8yEHpymClG
 HYqlPTVy1z4FGQXYbn7CDCggq+n4HPtsxFm6UbdLo8armdAwsGEXsrMVJ857v77daUtybqpgUpk
 7+tNpOiN+D+HJi9xpXrMpv/2G/U5s5L9Jm/KphJofAoM8asQEoxFOUpmtd1K3/4WpGRg3LIOfCo
 zfbDuU5zELJhEel8S3Q==
X-Authority-Analysis: v=2.4 cv=XuRvqlF9 c=1 sm=1 tr=0 ts=6af1c64c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=rlgZYKK0SKzbOMFyHoYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090052

On 11/8/26 1:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Wire up the Samsung AMB630QY01 AMOLED panel on the Pixel 3 XL and drop
> the MDSS/DISPCC disables that kept simple-framebuffer alive.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
