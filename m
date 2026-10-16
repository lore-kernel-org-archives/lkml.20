Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9753E51DE
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140657; cv=none; b=bPbaB9JVdRHwknVt2XoQYHrSeD9EyliGCoMACeEG3vSKPCHWXMcUNsYgR+7sgENOVZSPI08d0oqv37D43ToGSWtfaQMdVDzXW6uZZGPW3sqmy5+7C7LNdWhxHGyl0ZGsiVS9+IJM/H4pJ3pc6PexgIVEf9pDpg2EmLElofb87xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140657; c=relaxed/simple;
	bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I+6K+iakFZKQlD0TpRG1vmLavDps7Hs35rsdFR4uz8R+7ildjqruRdY5qWqTH6JcfRKTMOBKc5Qw1hV2kUVdtKH0WPL0nsEGYy3uUQfcdYD0NSd0wI59zVuUFIOJ75/A9y4L5MrYaqpoLkptb0tZn1nwyx5D3Ib194M2MIRIy/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=epnIfv2Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFkh5Co0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="epnIfv2Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFkh5Co0"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lPpr303659
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:50:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=; b=epnIfv2YPnCmZH3G
	XNNFK3X9+iLNlMw9bySonTiztaHiOiHLZducHovrRXVO83TVcR9IebpsH9GhijAg
	WGnaUOt0FKU61pSwOByAe3Yp16zTI9lseO9husEoPIf1kkNlm2Q2CPHWVvxbPKnm
	5iuLwek/AslPSNXeBrWwWeuKVk9Ql0v26n+8PnG/IFWYdgPugJio5aXRSJ6mbw5u
	JxIc/RzQzGTfq5vmP7+3qERXKcQVzOgBNinaNvfG08IoWwQjMRzgeJwcEgjtDaSN
	59ksRMbXvQscr17XZBQzAj11vj4dpXYjMXf4KZuv1qernIKpLl6raAmbNDR7ml2I
	Oy564w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbcjt90w9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:50:55 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5350d8a2368so13662821cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 01:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140654; x=1792745454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
        b=UFkh5Co0XgO2NQ4KTgbKK9CYTHudWKx3rJ0yw8y9NDek9kleszxG5W2tMsg5yMI3OM
         8VrhnomUCCzVJ8FJzyh76VEizhek8ljknXk/Zm45KziD2BH8jDvzd1LoNC71VWkr8GKS
         QmTNhijI5gT/4LarrXWirdIHNPhmyJa+eD0hWdFHFpATpJ72uY6VtWiYTpb3pQ9vjIG0
         Vyk4c30WpS3DGDRf5CkqFuMPrw3ZPlP6x+r+xYrBvj3iSLfYgjcf8Y1a787UtObg9dnD
         8WxfmPbZPY7B1g8r4sEYn/BlO6AZYMPlGERDzQnple3JxFkk7Si5wnX2DIXvikrzhtbb
         YfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140654; x=1792745454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hVsOcmkcXmATJ/5jgF/IOTC8llyCXFVJa4pJ0+tKRcg=;
        b=Yf/kA8x+8Nc+WNVegPoIXg02SrvOQX4ILOqgOCQaMyq+cGTikgpCeEwY+rYT8w9G9R
         Dy2vjnQYTq2gTOegVBOtpoMcy6mVQCMM0mTbU95QUdahyfmLZlbjeDG4Vz5FKT/K0gQl
         ClNoEoflwymYgF3s1biVy7IdTSP/O2D9R1eF1Gztl6ARL7mKwRv3N9s4h8JXTwXPuj/5
         GdTCVMuoXjSz2T4LJNXYRILS+ZAF/CrnYTfBtT7U51TW7bi4qU4W2pDm8/YNm6bWUMx9
         l5ZxG0IWaYzLroPRzFZ1xxP8hP9i+8yA7wbgA6v1qOPYa0s6E8jnYNBhGsNvOzUEaYjX
         PhIg==
X-Forwarded-Encrypted: i=1; AKwUvByxY9pmMEZ3xpFaWWNO4/mt2TLx9x9qvGaNJ0wON6ku3NdT2fYQQYJ9plWPR2be6Ui4VL90C2iZ6cA57fw=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9lm/Dr4f6XI2oq0NPMqOG+o3M2bVXYqdDEIkj5OpNtC3JrCxo
	HWTwfmxnHJfFCx9hx4/uHrLgHcjS1vzm+zRFWrFHogz0xEQPioVRzqIBnP4kWPgK5jDX1RkI7+4
	wEYozXfPVZwWGXAS16K9fLrjZ6Xx1BxynqTVs9hZw9+8Jwl2nptnMLueumGLAEf9W4Xo=
X-Gm-Gg: AYBFou3gFSsETMzmhQknd0CkujQbi/mcfRt8UxnHXyKfYYevdt23GQvgdpG5F52+9WL
	SCdhMBU5L7KBqCGlOm21eRBgeX7iODtPnzB53iqOsnOtY3uRsDvoJ0Co1LnR88FOFQRtCqzjr7e
	nEZ6qPv1PsF1cFeTtaVSizKzbmLjYHqxs2jH1Sa5i7JSBuMx3PvA/nfkgqTN8OiWthx6ZZcbXSK
	hyViac4Kj9EzE1cuT3fJsHpwyaA8r+6WIqOKxiLlu2jdjqiuGaDcASSynm2wnhT2Xoxdnsf4dqH
	w5rMn5jgrdYSRxuyvkWFQ/hz4g2ypU/57/+f+PTUun8qzS3jmnMru41h1jSNzVly3krjo80sBWA
	X9+VmslLnUBeW7RF0NycaGA==
X-Received: by 2002:ac8:5f0d:0:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5359f069904mr444285121cf.0.1792140654542;
        Fri, 16 Oct 2026 01:50:54 -0700 (PDT)
X-Received: by 2002:ac8:5f0d:0:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5359f069904mr444284781cf.0.1792140653931;
        Fri, 16 Oct 2026 01:50:53 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb1762sm52191966b.73.2026.10.16.01.50.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:50:52 -0700 (PDT)
Message-ID: <42a66c40-4185-4c70-a26c-75705f891263@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:50:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: mahua-t14s: wire backlight through
 pmk8850 pwm
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261015194732.64428-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015194732.64428-5-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX2VHAw2079D9i
 rUnKIzUTXslBQxoazvdsKmxCs9JTF/qB4EOU+SgqPqHNg/aSXgMuUQJllFTMNW4pXOLGGSyd+yx
 JygzqyamSKOXhZVE3BQza4cFUGODH5vr/9fSnN6Xm3Yu0UqT/+anNXOyQhtuyJCh58XInZEmx/w
 itK3DXwqthK5B6StryzSZYBAm1NEcHLehmoF2ZlLCX4U+TaDcqmH3wBrchITi6/YKCMGc3C02Zu
 cx6cltgEMprxIftinFjVg0OwCyPkbkzSVK/AlH6WCZHlVCPt9GGCFj2YW+dTwHbCt7PaDleu9cb
 YsUFLaJb9BpEvM4zya75TFWKG2djmsCeghnpLQ1JWGWDXDaL61RdAwqegJgdG148xnCOeU5SEEZ
 WFxqX9gvn3m1VG//7bu4AMTwds7rOxhWtO+gsx10E5m9dxizqKrVceskFsXC20VC/GqvDhTpjtK
 VwkutQs8ZzY8OoNhIig==
X-Proofpoint-ORIG-GUID: e2Mh6V9k3rqXOe3BicpB3cBm-MwGe7t5
X-Proofpoint-GUID: e2Mh6V9k3rqXOe3BicpB3cBm-MwGe7t5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX35TVP01qOw9M
 mlpeoAty0MZVFygrXpqMEhU1PlcBD0uopLxjXKhPJs9+qCzrMOX5HsZB7/xYp82KPrese2D4hzh
 XRa7UyeX995aweMlQtCr7lYnO5LYtco=
X-Authority-Analysis: v=2.4 cv=VpS2kO2n c=1 sm=1 tr=0 ts=6ad1e56f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J7U4xS4vm7cozkhYKksA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610160035

On 10/15/26 9:47 PM, Srinivas Kandagatla wrote:
> Move TLMM 18 (EDP_BL_EN) out of the panel node into a pwm-backlight
> node and wire real brightness control through the pmk8850 PWMR output
> (EDP_BL/PWMR_BV_PS on the schematic).

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
