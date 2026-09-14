Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247B5406270
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403234; cv=none; b=PumzJ1TxcvgIvmTm7dJKodgVw/80mEclzA6bCVIh8jB07BX5NxQwtIRmgpA0H2D6ADcBuU07yVI94dPlBA8mmMJXchrAK7G7gIaXYDCX2u+6zfHWD0hldfd+HqLZfg54nksgJPkAPuF5uAngAVyaKqKtvmTETpIRFjMG21hwQLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403234; c=relaxed/simple;
	bh=qLxfmbhqyUjDBEHs7e6RQK8nLMqeZ43eOPVTIjzEBtE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRYSpWXDnpTPxJeSipSqXUbWTKo1vvuAbL8bTI8hNwv3mIYodmG8C+m9q5GykUVymZ4Di+0Ll6Qlkql8WMvt3IdnY9+bXPOuyU0Rbne5kPeITUvdDy5g7fUXYj7U7ygvJUaOnfHAtC3qB1BqHENENr13k0hIs74TXOWTse/Ym/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TOOo4VER; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INchhdQ1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TOOo4VER";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INchhdQ1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0T1Q1514388
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyTPgK92z//XO4ewrPGEMLjpligNbIo4paEWK12IK5g=; b=TOOo4VERQOQtZy5n
	/n8GhNyA3QJlNNbaRErJ/v4xKeWDT3KDvFUurEOKTSqo8bbCOBwVM+QifMR+GwHq
	dpDFCNhzFwVR4hq/j7vfsHwia7HrWzTtyaGEYfpmmbH5mE5pjDXOuDENlHSWfREk
	Tl8XIQnNd1SSIaaB96uOWvupMVPO7hMyWNi+edre5hHoDCGuRbKmtZPMQNaB91o4
	n2Q06MNvj7L37bGtfndisK2WvUDOKglExgLKG8SE2GcmBBV2G6Tuq8m0MKBNEO9Z
	CJI4o7iAmE4kpgPo+71ZwSWNH8/3ErvtqGhQPG5eijKzA/BcjGuBaK5qGwnClc5e
	1V2hLw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k0bh7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:27:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso573785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789403231; x=1790008031; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hyTPgK92z//XO4ewrPGEMLjpligNbIo4paEWK12IK5g=;
        b=INchhdQ1L39JUnuDtGgPAaxYSFfi/kMpDjCukhzyEZbY4B1b3IzXFqQ0gbug1hUAOk
         3U7r9jA2XvoL4K+5klw6jdlBtC3dL7WANNHH2eVwK5z7exdUVVthLoCA2DknOZY+8R0h
         gG6YEn2xcT5uG0l66F7w5pbTQCDmG80kJOHWCwLo5ZIgn8iRffefxDH5KfaCRbqyJVko
         x7o+nbeFznPBZmO55yejm+iFgW7d4O+7tCSpIFhufPIQCzY0zQ/i4WxT3HgXCtkkNBMu
         lE7DaTSHgqjMTa339yStowouo5XiTG2e/dnfqm5gkjYZlNturh6fu5iwW6wbIHT7CXY2
         3Zrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789403231; x=1790008031;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyTPgK92z//XO4ewrPGEMLjpligNbIo4paEWK12IK5g=;
        b=bZzx9QEzJ1fkmpfeHajmC/PH4EgrXzuCxebrup2HvoPGppW7YUkhOr0Or+mp0BClE2
         Wv+IvJg5SjgdvFh+mUa3VCSdUIs4vFWPXFoBcAXL6PbrcZASG+wdc8ke7yOuktFPqjGz
         p2nuCsGIxwDHS0wMv32EUGqyk4DVF7zZXHQiZFsKNv58UzRs0QgdLd5cK4doiTtCIeI4
         LGX+WJFPHL/n6oHd4J/uy52VyelVn7tjke46HeEB2dQ2jYfEbs04PgOta+tVCG4cKYRH
         CHvL8kpBva3anY9QJugyyk4l6Ae6Z2ABimxuKvrQRFBQPUdJkqy1BdFAAWDKuv8fIMVb
         gkJA==
X-Forwarded-Encrypted: i=1; AKwUvBxxU+Vwm54GBf0+8gCm9wg1Is0DqUae8DyNN4xbQVDIbfbxbqldkk5/lyi51wFyZAu/y+x71AhZlX7P6uA=@vger.kernel.org
X-Gm-Message-State: AFuF++kX5yWpfyMSDKYfiJvrOkT4rXsZaS+m93hqvROlVOAX/kOMgTeV
	UFEwl4Ykdc4niSqOkjkNJMrx/wWk8DNNaksBCfJmBeoWJ5i68Nzs1+rzetKV1DQRVtO54r8+VJu
	EWgvvOkwywZUcnV4YsPl/mwyYFOReempTQtdNVPWfJx8/krjOdRHmen2THkJM8pSoUAA=
X-Gm-Gg: AYBFou2puyQa5Qr9otvfMqoBb0/XVvGv0I2MHgAd1vlmYtIO79sgO8Yb2RQUhyTIIgA
	MmXXTBUK00SmYOOwVoWTy+83Gt1RivaSO1xxYQQzK+RooIJLHwKpVBQBn9yl0/51pIJYPbUzDuY
	krosQq6ncJmC2Rhz6LPwqAL9lUOQBNwf5S1qWD3PwwTJHZ+D8EhuUdfUC31ul1Xp9AtBGC8c+UF
	+DUIqVul8r7/4XVyOxyct3mB3Mo2kd79zFsZ3i0I0mCtiXiRUChcNmYi7MrO5YIcz47OAkgk4z/
	lYD35zIwEEjeSnZ8lqDr2lQWdAL9gGqxJTjgpjadcWE0FDujKk5f8HNsvvnm4K/VZMpES8ciGo2
	Me3UjPy2qFcSddbIsk3IrVpighAs=
X-Received: by 2002:a05:620a:7018:b0:939:fe55:402a with SMTP id af79cd13be357-93a346fa60emr19928085a.31.1789403231256;
        Mon, 14 Sep 2026 09:27:11 -0700 (PDT)
X-Received: by 2002:a05:620a:7018:b0:939:fe55:402a with SMTP id af79cd13be357-93a346fa60emr19920385a.31.1789403230649;
        Mon, 14 Sep 2026 09:27:10 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e7d67de8asm4247995e9.12.2026.09.14.09.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:27:09 -0700 (PDT)
Message-ID: <f22c7346-d597-4e4f-b498-d8a46bee400b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:27:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/panel-edp: add CSOT MNE007QB1-1 entry
To: Doug Anderson <dianders@chromium.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mpearson-lenovo@squebb.ca, sibi.sankar@oss.qualcomm.com
References: <20260913201835.250085-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260913201835.250085-3-srinivas.kandagatla@oss.qualcomm.com>
 <biywo5isdeagqu323ozaleeakngl4sngps4v7ngwqo23ju2sw7@jn53hxxuccff>
 <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <CAD=FV=X-Te1fieogNaMuyFAa2q33RKUCVXAUFcce_r7csXAwVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDIzNSBTYWx0ZWRfX02JShbZOD5MW
 /LCZWe3D3dM67iyrYksnwnuJ0m4YoBvXLIza1Uv23hThlEqLLPlf2HaSXeq/g90kjWeNYb7bV9/
 x9hDJeN6XHh1HhXuKhkWYmdsS+gS2PU=
X-Proofpoint-GUID: SKNkNJL4WOQneJHFTYOKGCwj-UJBfD0U
X-Proofpoint-ORIG-GUID: SKNkNJL4WOQneJHFTYOKGCwj-UJBfD0U
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa82060 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=-qWaGmECaF3vQ689P4QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDIzNSBTYWx0ZWRfXyR0KPkdPJ5cV
 RNnYWD7YgR6hhxunJJBQQQxFezXsfcvca5AWuZmE+n2efV/7Z6BEJd9qzdYOuL+06lG/CvXxwAc
 kzK1T2DTAMAwJTrLBdU0Fi0Nqk+QLBFTL1833yygdsEl3HCAcd1yLsf+WW3tZ4Eso8mhcfxPwtr
 VuDAA6LVUW84clFCVR4uUube0QA+H93Vk+YiELCNQ5MUFT844904DUCFOuBj547iEkk5CS0drc8
 yu7tfqPSjBSbAcH99lKFWCK78pZo+YLDKK5JpQZ9ONirJoHL56wpC+IoeVNnB/WqAff4igSsmU7
 Owh0RZFmSTCxxBg2VEgGx4YWOHWm3tinGtmEWeLcf875EQVsyS+O0xSyIIfMv4D4nXiuxuuctVh
 3C6asiUEw2AIC/61L+IXY/ESHSpXDeG2Y5t31VmQu+MPVp9LmzZwbEVTVnI7UKfLZRqjj1thC/i
 yY3u7Jt6b8LAw9YBm0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140235

On 9/14/26 4:13 PM, Doug Anderson wrote:
> Hi,
> 
> On Mon, Sep 14, 2026 at 12:34 AM Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>
>> On 26-09-13 21:18:33, Srinivas Kandagatla wrote:
>>> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
>>> Panel identifies as CSW 0x1465 over eDP AUX; uses conservative
>>> delay_200_500_e50 preset in line with sibling MNE007QB/QS panels.
>>>
>>> Assisted-by: Claude:claude-opus-4-7
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
>> I think Doug starting asking for EDID dump in the commit message.
> 
> Yup, please send a v2 with the EDID in the commit message. See all
> recent commits to this file for examples.
> 
> It also looks like you are adding the panel without having access to
> the datasheet. That's an OK thing to do if you truly can't get access
> to it, but I'll at least ask if you could get the datasheet to confirm
> the timings...
Unfortunately I do not have access to the datasheet. I will look for it,
but if i dont find it, I will send out the EDID dump in v2.

--srini

> 
> -Doug

