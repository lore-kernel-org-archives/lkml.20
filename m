Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422804;
	b=wGLx4C3Ifp+QymJIc+Byp2fB2Pihvt8cVwPe97cZyntgS0ZZKKge14SRcYtCiyQDvPwv
	 oK8twkMOkPaE77lsppuWwd6VMjTHLJpxVXgB/wC6mp/pf+sFJyJk4yIWVa7XzDsKLVSP7
	 UOENz84M40U6jYwUBRe0mUF48km6Sj9/JoqNxC+k29Ez2TXXcL3v9dZ+D3wyjMFX+c3SZ
	 AlLXEKwlAfHoX5owXXVCAbXyWPnhI81op1fe82sAUDK5wP1aevYcc2HnDUAF3073/UkH7
	 Fui7KibxOmc+3NvPFBXS4LHRYhWa93093liDV0gY9naLn8SvLU9nRB236qlxstCa7Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
	b=MdM7uEUbYW9V1geEuqny4UvBs45PZgDIj7Lp6RFxA4uxS8KJ1zpWD9xLFQID57SQz7vy
	 8YpDYf4nJDe/7zsWFlEyVDoCjkDP6OiULLalxCMTiWXydaf2lgbdJwEK0KWgs00w+EIBy
	 bGBD3TltFwf6uLxYuhmhp0CSgg7wGKHp4a+lEdgb36wz8FX76B/7P1Pt8zy8xvdWHr/F/
	 +LdAT5pOXFlfRNCOe6Qa7nUQDJdrYwwGUjzoaZWCdkDb6px2OjklxhHs+b5yDN3lMSh3a
	 yIrAk3Oxf9YB4OBMaeXV44KVXtSXNqwK01EoQOCOLXlqs+eaoNAtjrZ0OTi64wSJIYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="G/wgCCmm";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dipNO6ON;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2C606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C2C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G/wgCCmm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dipNO6ON
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIgE2E3162679
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=; b=G/wgCCmm3FHTOOQG
	e9/ng4bKh+OeU4l+jXQGRNS+CTxI5qvXs21sgkKyo4LH/y2+69ujEedssfuFYtDZ
	qrJiLmB3C55OzIT800Ia70b5MBla65L1pv8voXplP5uHxWxLkIS8PTRHDRNtdSVW
	Vg8ydmYis9+Xa54r9ps9Kovpp0FKv3RQNion6bMWVAiLzuND2hK/mEJMgJJhKEHT
	gBW7QmvP/kHO6K1XyJJrhfGXFQmT16qM8BXYnE5tIPV8GxHjLjw8aO3sMf6RBOVB
	oyOo4fn8oEQ+X55OhGFGV0YA+0dhh/T11OF5TBfThZ8Y32lpNirMgrB1MS5tktfj
	vgbVHg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdkb5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:46:43 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2c7428eb2so686881137.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422802; x=1795027602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
        b=dipNO6ONct+dJbZtn3WLFsOkD3JElX1yoWdF6CKCZjrcThhvR372TU8EenGsC1tupV
         VhLaqB3e9tnq4D9j9BeyKbnp6c3WFFuofHrtcwE/b8Ao00Kw1rJywdSnGVpLDG9G5MKp
         oZw5tezZPXZtmcfXLh/WgycyLc6kA3e4ebkxSDfH3K4gRegMQ5MsomePe4ollnu1LZdV
         wJ6jnEAC/YeEizSu2wW5aqPSxLxg05WpUrW/aJawIrlHdbYv8PJ8n7livsmX+EbBlrHk
         wDtzn0oYBbpAEcR0ucWIN2lIABLr4d9WJScMEpgh/gVf2+f82X0wRjBN7exNOH8nFwwB
         OF9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422802; x=1795027602;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MHpOPQMnBsXdD4rxYXwjWTXKlMKBvycegMK8DhfOcg8=;
        b=xCjhCQKya+qVRr6VGJ4q7/oxHYBV/cFN48wwSUyUiN9r5H+H+wzAJI3+BVw69QEUvE
         owbrVuJWbT96u3Y+QqC1oM9MSIwpvknk0pSe/mMxvilDakUtgGTIJednpDh9NkAIFRmE
         8BuOw/U1IByJRVbxUKXOSAWVqcjuzBy9ztweqRSP8tO00Jm8nDRpjy+7SYj35+QLnSr/
         /EA2S9pMfEB2jvougI9u6OyQX0rjCs12NOosWRkgHr0wOOMg6VTpGNCuckB5ibYLHfgC
         bwba8Eikbix1mUIitasucwcRbU4tzuTWfJTc0T5mJ7mMUp9GIlhCDfDBujh41YoKc0Zh
         Sd7A==
X-Forwarded-Encrypted: i=1; AL+hErGq0f2CMa83l0ZfBhjtTGkeTDyFaTG01lbSq1ajeu1to186uEWtpGmfSfIrUXVI7dh7777tzOZUaZlMU+w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qOSsBrIUh+JuLUH7eaRSgMM8Axig8VY/AQqSmhKrP6QsiIuOI
	2Tnb6gbXQZMl3AK0xT9tNQ66E87FXU3t5/yn5KVUCCwQ6yzqyU3jpfj6u3eE6Cg3cpHLcJNYuMN
	hVaV/okkFP+AEpFppuAePBgAIPhe9UtBCnwAVi8SXOm/yTnGNngW3KAwZGjSzVrnwYLE=
X-Gm-Gg: AYBFou2PimMaoChzeCwA0PpDtkDp+HH3tDu8dgG+4aRgj1D0ZzzYiB/GeNHBeIOqa0i
	w+Y+4GYePW9ikp54D5NUqLt1+yOezwaQgXE5pmcQEmzBlj6DqYGVQ+fNawKZQRwzdJUUAH9TwWy
	XcjA4ZTuL87y6PcI9e/E5GTTfkLOY6hUfXqDKK+No0lwkX+AbKyj+LI3j10SnPZmGClKi1RO0/k
	bNvja7Bk6BVo8NAYIlzdyKQlo+5rthZ/pN6wBT3YR48BHLiVbMov1r7Kmdu1QiS+a0yTHgxn3DY
	yRtv2uXMDPqtNp6Df4pss7Uo3j9AaGE2tAvStAUmbYAJXQgtAU7lDeQFKixWbTkH3gzAdqHu76y
	N+AFcJyK6tcgX8UD8gkPvmDJ05LeGmk28qR8ddSasXeRTnmnz3dx8BfnKFM71+wjTAOLSiZL0Yq
	E=
X-Received: by 2002:a05:6102:605c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d5061dee63mr964759137.32.1794422802159;
        Wed, 11 Nov 2026 10:46:42 -0800 (PST)
X-Received: by 2002:a05:6102:605c:b0:7d2:9cb2:88 with SMTP id ada2fe7eead31-7d5061dee63mr964715137.32.1794422801221;
        Wed, 11 Nov 2026 10:46:41 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bc9asm11539016f8f.29.2026.11.11.10.46.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 10:46:39 -0800 (PST)
Message-ID: <88380d74-ab37-4903-8f8c-4e6652dd5ded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 19:46:35 +0100
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
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: msm8996-oneplus: Disable
 disconnected DSI
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-2-fdf8fd97f49d@oss.qualcomm.com>
 <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7gqjjq7v5krgibjxqelyjwmrfygfnbsvyfubgbpkshkvgdftxr@dwm3rdpoqbnb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af4b813 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NUy6FM0n4CcUAni1w6YA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: _AG61c0gLLXhSa8UKrtK4dMfj-UUIPKx
X-Proofpoint-GUID: _AG61c0gLLXhSa8UKrtK4dMfj-UUIPKx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX1SzODtAwjfm+
 FJma1nI1HlZX882Hj6ZTXNscFjRlm1HLqLKW4C45BEHrcry6gnw4ETf6L9rbx4RywiuBlWAGVnG
 KsRPKa2eEwKl/WVRqfPi6tp3Ew7rPLTbTxrHGL+59RKWU7Q3W//LyHRPhQugfpNjeFYdKH/rCIM
 g6O5bG9tLHaOjiUJ8cuWYITpbuVh2BQNI1aRDhxoCw2yoy8pCs+pY6ri6OfyvWlg7pFZOuOJngQ
 oGFaXvA0fLYAZj8t/V7TRoOe7GdQs1Burl0qG7ZgTP/a63borNHJ58RVCwHBQfqSoXlTmb8CbNE
 uT5BBbopMbp6YM98CrVvR7GQ8f2F/AXP/wx+AjfMzgMlAGuIig0NZ0R9Of/HxA69MQnsLAq/8uL
 uS0jzts/9vBVZePbyEGwRZJNubIbS1qYI79MYmI9KZhSkOT8alyd/x1TX8GZhXxl8GnLZj7cuNO
 JR8ow43vm/EXqpdWaqw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX+MhlMNv4oC2v
 O/IXVDW4YpBr3exkI09ntglTsFWEnsStEIS0jAc6sl4IgYkRAo4yBghR3yPGHxXJGchWhj6uufJ
 YU8NfjukQCJm5Ou++8wRkXvrr7KVVW4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110074

On 11/11/2026 19:16, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 06:45:01PM +0100, Krzysztof Kozlowski wrote:
>> MDSS DSI and DSI PHY are useless, when nothing is attached (no panel
>> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
>> drivers will also fail the probe.
> 
> I don't think they will fail the probe. Nothing will be registered, no
> bridge will be attached to the DSI host, which means that the component
> device will not be constructed / bound.
> 

Indeed, I'll rephrase.

Best regards,
Krzysztof
