Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794219719;
	b=cFo3hjMk/Vo159ITUJoJLosS/0PYpDjGVT8xjlXza6I9B+y9Py17cQMplIeqU2UZpqDF
	 4YE6Amaj/CWuSS1b2tlFwvfDm0bOm+WhLHJ0sv7JFXbSxaEyGE72jueafmQCLZ7equYmu
	 gP+mYjbccIlgT7XuIJ2vkm3BZ7Org1nNWHKC16QK8BQt3nv9zVUXxna7N8v93+/NcN1Km
	 4jD4uqSeAmUijMpr/GBhfdMNGYsQLJdY+qmfUvd6kpldY4xcmN043NROVIUat4TIF2+B0
	 dWxJRLx0OevLaGSYwlzCofHbkea2zREoIn68o38xSKyN1zmXYNdBrOdSyaUg8jj2I3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794219719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
	b=qmw8gdxGcdRYABjerSBnzhW6sKl0437EwkOFrphXQI7a+mYBXOuX68Jgqk2zzpjMPIkx
	 EqH3lFN6btrmQ3aJFoHbgh31fv/gBGvUlhRMpoRtzhJbVyPfDN9ewIAE8nmieBrHjxvVm
	 qi+BB0KB9f6uD6lO+npFEi/hIXWfKDGWr0Mve/kcLf8gfwC9Te4bWAgKq0YroDKsnUd9P
	 WkCMTCNjWLzdsV62tL/OlubB8+dcAwbgWpp7O45zsAsLG2utz1oQwPAHOSwBJkewSIhiJ
	 vkMKbX/t5UDLWFJeTNhLZLsQe5xZmgtXa+TzeYlQRcXH/JuK9+gwf8f1sUOTUWF5t7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J7IVnPk+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dchNHW3Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405F1606A325
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 405F1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J7IVnPk+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dchNHW3Q
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99umRN899219
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=; b=J7IVnPk+ZvttqHVE
	1ShK7YYJXJ5T5DuVWct3V7U7ie1ys0Q01RRPpg/qyngr3THIHLdIsRKOfZ6094/e
	wbIUQuAq+ngCYPNKPCwpVeLoOQ+3a+KfBz9jm/+ZtcMfvee3F/V0qw3Ka2DbmZUf
	m510ibhRFGJXouWOiV50oeOlmcVWZw+ItA9bE3FcOI5zjO1Yyy9w/ANXkTa936W1
	3QkCleFz3WEZUYNwsE/mneX8ukpn6GuKvu/xDpaYt7HA+vZeZ8mWUugQew/0iuiN
	NpBOJaXoVmQjwA9vX3dXtByuaCvmhNr8gkgBLFmLoa3v/WQLtx94O5+hrSolrOI7
	hKCxYg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf66u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:21:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2bdebfc5so20422885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794219716; x=1794824516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
        b=dchNHW3QKdrtsCKkTL+vy9l7Z46Z1Z5g+dxGSmq915YXYRh/qWqWIwDEXxN1eifDc+
         MTO1LoFMGx8oh8KsVnTYyz8E+XtKjeK0TtKpO1yrFNOABgKgADHDsRARNidpp0XdV1+F
         ++ShccSO8D510vjL+v5OpBmNlk52xqvAWTpPhR/o2fdtPYeVLXHc+7bf/inydymzfcP5
         dcuxc6AcosA4e+zrjR1hzW3kjGH9/OEWlwZW7MhZTAkjYHXmufWvAITSTFPA9XSvFIkn
         MRCgQ4MNUU+9Hiy6XU3HmMy+mQVljibyqxuEW/QNcWLUvAJz9ib7xPfQc+utK36amSN3
         ZoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794219716; x=1794824516;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXrXtlQCSd9l27dDZzkaCBWWQ7huOf1nA2Nv9XiEhbk=;
        b=LSIIAHwbJCmfYHZ7x+2ib4ubyV+2h3MSjnNmATT7m/KHJ4iWexQeYv1eheu9X2tprr
         UKiD9d4SxzqTUXxofSuQmLCHLQpjgzsllKCGbIS1YXKSIIfVBEw6dyfnMisBQ16iqIRt
         C314SoC5s2aWL9od28Hw3ciNOVCuh5cbzJifaBe0QpK8ZhSKE8ndJMCx4IZqPyrEbLme
         TXefVHJVOwLmzyzTEvKM4l8ejEHmXDIoTfyXTABqcqO/+/1VlymCsZrSbeCubZJomovf
         sIZNPEC9p9EiTOLJs1+pbm/Yy6R5JrdLULict4s1EKOpy3bp7HKO1m7h9JEGYcKkLHQn
         NcQw==
X-Forwarded-Encrypted: i=1; AL+hErF1Fbf3L7z8sRhVC+MVm/XwO42FFz5Dt7fVVNRuxh5eLRS0JdrXXx7PqfkiC0qFHr3iYP0p498JXCNOEnk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8bFT1ose1aJwqGYnaCDndCLFmzTE7zb0JuNbYoM9G9JULLh/CL
	TFGb0vx/YWwaXJpNT7JtVhLFjQGq2sjmlNth1CHkmGsTfeVd7PaW9mrfreeSTzatNE/HyVig38C
	br74/LVhSWJoeCpaJB5eqSEODELIajjKAGa4iyYhBqWsyM3rEOvsSnLRraVdb1/wBUV8=
X-Gm-Gg: AYBFou0mk/e7kkFozuVE6ts4SU/HnZ1cmhlX5L367nzcItH/GrcxQFq7lAuwGqWx2pa
	M2KFuBEnWnkrempFaqydbbExTwuEniXXPM+/LsPIB4tDXzLKRuX8iw2/ootwiNmEPk3zKKquKWu
	gDoHcaG0mno4xA668D6uHPL9GpH8NmqIjHbryOXVpGDc4FRC95Z9wGDnyq1v3ffs1AZ+oOZTTz0
	kuSDAfQLoAk/NTTXFB4cegrfE7AwChyzj+LaLrfJ2tsfoZgycbD74RXrI2Zr1AuSj1XQhr25Wb9
	mHisEplarXOqOfa8cYpaeHHQAUl6UfL79LGZZPiGpwTr37R7KOCJ+ZJEJQtqf+Pz14GggZtJ9n2
	JiiosQNmkQ0h6nM48GD9Sr0v7j7clK+Vcc1WUkRX4ZKNLAwGNPtT5X5MjwcdGLKq6gtiJAQ==
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr526950385a.0.1794219716408;
        Mon, 09 Nov 2026 02:21:56 -0800 (PST)
X-Received: by 2002:a05:620a:a2c8:20b0:945:db0d:9cc7 with SMTP id af79cd13be357-94783fcd83amr526947285a.0.1794219715892;
        Mon, 09 Nov 2026 02:21:55 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d6a474e3dsm148159066b.42.2026.11.09.02.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:21:54 -0800 (PST)
Message-ID: <099aaf7d-f0a0-41a8-be75-98912e11094a@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 11:21:52 +0100
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
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 touchscreen support
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261106-mahua-t14s-gen7-touchscreen-v1-1-d638ddd34170@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX7I8aChL/LgET
 DnCqO2tYWbNp6ikHqU130PC5wbRVdBKVnnnB3LBnC6lJJpAgGXHAcFP/wspabkvbdYASI9c/IQr
 IsOZ52Z+O+yulTmpfdcyJo+A9k3BKR8=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af19ec5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PEJKZ92eUzn2SXrnmagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: F2JJuihVRz-WW-48vlZeCDB9rhr-v_lA
X-Proofpoint-ORIG-GUID: F2JJuihVRz-WW-48vlZeCDB9rhr-v_lA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MSBTYWx0ZWRfX1RAAYQ4ZJ/2E
 yEGo0eN1JyCCdWVVXIYEHe5iJiR4qWMvKMxrQw3LRJpFi0zZDY1ZmMiSgmgZtB3mnOZMtqBeeIW
 hWVVGTwCMxiQ9ft1dX9Zs89x2CyUtbhT0zYaTvUPefscey8cCV8LJBwLKDph6jgdTWhdQ8HbOTY
 Epkq9K0fQ1Lw2iwYAlC0veFNWxdm1xo8Ijk7lfTzqde0yR9EzegpLyeu5S5VFiZ3BBwBZMbf4Ai
 y/dGogH/pizAIoDwsjSqFukroUpsGFdq7WdCh/eSxmyHiAy/9MVvapqWTQ6Tpy6PJ1xpkNlz1yK
 pMd+L0b/BA3rCXOk1m+cUerfS8BR91/29KvMxeFJ+2ZgoL2BtuT//a10gXv3Bjm2FGnIrZeoBNI
 R5Fya7ibnrH+Iqk6cRXeATPwAVrhzKvbM+uIkLG4vgwUZtIORZqaspm9yWb9CCjHIhqs/4GPIop
 9iMQJ2ubra+sBDSsDFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090041

On 11/6/26 9:47 PM, Abel Vesa wrote:
> The touch SKU of the ThinkPad T14s Gen 7 has a HID-over-I2C
> touchscreen (Parade, HID 1da0:3009) at address 0x24 on QUP i2c8.
> Its interrupt is GPIO 51 (level, active low) and GPIO 48 is the
> active-low reset line, which is kept deasserted.
> 
> Describe it so the touchscreen works.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]
> +	ts0_default: ts0-default-state {
> +		int-n-pins {
> +			pins = "gpio51";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-pull-up;
> +		};
> +
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +			output-high;

I'm afraid you'll need to add specific bindings for this touchscreen
instead, see:

https://lore.kernel.org/lkml/82a96d57-94fc-470a-b7eb-f0fde0c0dad6@oss.qualcomm.com/

Konrad
