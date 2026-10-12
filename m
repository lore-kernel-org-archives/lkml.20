Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3470A26656D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792069; cv=none; b=onqzGwHxkCB/dzPgO5Q9PNgmVEFOKKIoLb0+YkFpUzNPzlIfnLiKxPTCAt0HpX0QR0QFisVdufACqYuwKgnPEBf/0TvpXp5R8yp0O/dz5FNywVwlU8KlN2M8qH8cZHlTSa4pvVH6M6x9gMllxbRCee7SNbc5S716lFx4KcVcfj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792069; c=relaxed/simple;
	bh=2UE1slJ/TuqtnCQfrrKjh8A7RNcnR3G6JBVTg+E/JL4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXpTUEXhqnW+PHLugEdI6wcSyWfbhTx4MvILPt5DQoMkSpG0I78NLw6nXBLq3XG4kUsjS+SGYQU997RATxxKTBsDYdgbWxnVtwlReNtBnyT8Y9ZxSZzdVoUTDxZZ32nwC6gwp8SJgkJh+FFE9wnkkulNJE1RMa0ygn+Y4xnEowQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R/iGb5yh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czTZqv/p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R/iGb5yh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="czTZqv/p"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C567XT1002377
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=; b=R/iGb5yh5gV+VzRZ
	yCFEkH4d4rDnR+vKoe15fRaCJi4R42/mdiB6NmcJrF5frK9CRi3rD8YYWU2pyb8v
	OUVigOu78zNtDxDGKQJmQjTq4oHP5b413jrhdmFsg0VBon054OMYK/KYZCZUia+q
	Nw1aiu3pupkVf7mrgTgolwvyR1DMps1/4jTDyCRPZMgbB4BjFAKcdfC0NYj/O9S5
	GZoMfYcCBDmj4obyPe7oZqTlMAl0VhU6mL/9baAWZyug+xKCnMO9Mny2Xel4px/W
	kWHFX2jSt5qEiCBmM6FQsUNLHaYw5hVsiW8VcRGvOzD6Xh1acjR/zrWWfkpAFXt3
	Zgfvvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkgx71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:01:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cac495d99so6409785a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791792066; x=1792396866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=czTZqv/pjeDAvGeb+1fWuI59V/zjKYnrk58c0H3ya5HpQe+FT2dP98hk6lifsNJCiS
         PiZJCOwNVAqwDWoJdnvRgk8mj0C6qs2BpJbJt0zy6b+zMmvH9AM7mWWDzjc/kIJed4hH
         svQL/LItE9cT+bNpWOI72LmXQY83lfKuZMyIRJI63rWPDjKtHshNsQFBWCkgQIdjCmg+
         cm/IglW2JmHn0VxXMsvzzPFlVrk/DIVlpd7lnKa3Qd3knx6IBGr+gKmeXjzsmb+RwHc4
         RNKBC8Skf3nQpgPXxF1qGiru9ht986G3026Cwvv7jL5HoHMNri1DVh6SKS/rTD9iVggB
         b7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792066; x=1792396866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsBn+x/B4FRTAQ9qeP4Xp/X8QK95CkhbCMiwhXCn/08=;
        b=rMd5kr2dOZTwSmoNMZbvrcugirNemOxRcGLkkcYXRxy6K55K6DVnweDC+q6zkHMFfW
         RUY98ZW+YZ8KDm9VZdLbq7KJnLduQ8m+OYjpcOx2rZ1FLhnq/mg8AI2mFPbKe/Lp4lmG
         rcINdU8ZsrlXvuhfYM1/T/NVAE+bkF93MnnduVavpWcqhPGZhhTgK7vonw3hPvC45b/Q
         pLkkxKIC8LtKwBecytT8Fr+Oe8TkVwqY/6DyeCzJXvwZFkwuwIhQ3SS7E39KQ3IcNbbv
         Uv6gvFQ0XwpnEf2WlS+1Jeb3c7cjI4dW5XQ2WsLfMAmqJfrffLXDoVvoLg/01DZ4y1z3
         sJAg==
X-Forwarded-Encrypted: i=1; AKwUvByLZho/7oZDwKmRPOBXPtKpOPpmXkYk7Q833iyg5DQddg6TxP26TvR9+620LwRvkzGgRfvkm8d2lNsyNfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLxr/YxQmnrGd8dzcRsK636SVT3jh7EAR9tlewBZhGFoykvhrwk
	eXH27d23lJ6RRub6t1Cx9+Qq+tSkP/pcWGguUngig90jh8+QOHhJqTzK+nTQWs5o484Jpf9kR0L
	m/NRbU3PcvL1snSFahw1EIY8zusZQirPPUYRb+EWCfdpsavDXoa1/VJjRhI5WtzFAiMo=
X-Gm-Gg: AYBFou19mMpD0B0NXgIKjDiiPBlfIRgtwt6OW2J2kRxjdN+y4kjZVivyyPEbKm1dUu3
	rZ7QS4YEE6XWReM7u1WHtvHxCd4BlJ+0GRePqQxsiOuJY0RHGGD2JIT5hl6B9tQJ/cW5MLMJxrh
	RC1ERBYrQSMgAOfrkv9HNRI58TpTKoMD2OcvEoVc0oZD4q8A7/h1kqeAwH76WINHHqyGbWtKHKS
	MfNp0XFhYpk35r7aD/mG8+FbcJvuLVAa5w4eM8JdqZ5tEm9vO69IlnCY4ScaHtkqe1Q0+eoOzTt
	xyNMq4mbuy3azAIL3gFQBqh38RgCnr0hUYcPlbh0BH2kGsO61FDhyxa+k0TNxfevWm6u3XC7Y91
	J9uCjuwf44L0j2EoYbLqkVg==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661416885a.4.1791792066177;
        Mon, 12 Oct 2026 01:01:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr1661411885a.4.1791792065667;
        Mon, 12 Oct 2026 01:01:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3c9af97sm27169731fa.14.2026.10.12.01.00.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:00:42 -0700 (PDT)
Message-ID: <d33eaab8-2933-45a9-a716-b3eebf3dd9d4@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:00:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
To: Xilin Wu <sophon@radxa.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX0hXNNH4JveYw
 /xs04KkRS9/PhoqwukdM3sYCI+xOFu/Jh8DlO6YAgJNl/TMNiIgt34/kyMBZTrVKeh6MeF6qqCw
 pA8d84GThjLLrXAftW9FEUM+q3ZazZvIiz5SpLi75YLb/PK3y7CNvygUcOeKH7FwFEAJXX5Vtcr
 SC41VM2VkpJKjXDf+Zjze0xXrlVgbQ/fhIjN0KQ64C++NU+V5m1TvmLe8BOKJABr5Inb4J5FHMW
 edj7wa27U6257HO0r4dc4cuzoHH0PISS3oUhiNAYj329fywDUUs95/uUJ9YaK0s5YEMxqqX/Y3d
 N9p8RQlz2ldYMcfbzeOAnHAvf2MG2T8Rv4PAbEVzGnov7gkC8zkSUyc5zCb7WVJkZsC5bTf0ARS
 kqjOFAC07OMiqSItrDRIHePRuXcv5oBedPgyo9+IXTuJUfRAjfYbp6ioeTbXvPSpXvga2Klal8a
 zoZ3zz7nadZ65EKlU1Q==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc93c2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=ksxQWNrZAAAA:8 a=KLRTrxjsjmTHsxePAeEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzMSBTYWx0ZWRfX4yMK5ZH4udwL
 Di91K1IZhAAa67oVUj9/fB9k9nxH9WZXmTkB6z5deBoePnLzuIHIHtEowkiuG/JF6Jhe8ROFzKM
 IBMi6e/wpiewmuLV+9jef/ZCLjtxjqw=
X-Proofpoint-ORIG-GUID: 80_VYWXJZtUBFIOlujoqRu5YhLpWjw5a
X-Proofpoint-GUID: 80_VYWXJZtUBFIOlujoqRu5YhLpWjw5a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120031

On 10/9/26 5:16 AM, Xilin Wu wrote:
> The MISC0 update clears the bit-depth field but only ORs in the new
> colorimetry value. Bits from the previous stream can therefore survive
> when the new value clears them.
> 
> Clear the colorimetry field together with the bit-depth field before
> programming the new stream.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 791bb3af2cad..783cafb22374 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
>  	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
>  
>  	/* clear bpp bits */
> -	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
> +	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
> +		      GENMASK(4, 1));

The colorimetry field spans bits 7:1 AFAICU and bit 15 means
Y-only video

Furthermore, I believe this register holds the standard fields/
values defined in drm_dp.h near

"/* MSA (Main Stream Attribute) MISC bits (as MISC1<<8|MISC0) */"

so we can drop the local defines

Konrad
