Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407471;
	b=1Dgb6pcLIkS9l6Bg90kx9D63OcLbWVYevgOWalbsOiQ/SW2/y4TL4DQCvBBbq/+/fBfY
	 FpZm8omxFzq7a7SWf6SmVpYp/URNKnqNB1IFQRyFEIoKTfsAQZb+2vecOR9YV5mj8plAy
	 dJm3s1D667exAzXJym7bemOE2BKaQ7EN2eiHA2iwxaqk24LW4pWM79X9gX6G0McLp72PH
	 gW/ftc06RG40+A856MfKUmRm5k+FYJ57LLRDACyuGJ6iCv3C+EGI5C58KSRHVUFU+92jw
	 Waxhd0e4OQbeRSIbyw1qtCn4lW9Q/N6EmyxgMepxN4FVlFsVwTggcFCIiqaFiyhYAJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
	b=tYB5Br1tutPeGSR0uZPwmxwbgC6YgVmI1LM8mjkMibD4x9RjPzu/FepNlUFhH2Wk3WI3
	 SoTEqu6AwKaXtjMCMoOtR9J4vLPGg/krT3Nq31/H1ZlyLH3cr519848m0qXaOojhDk3kR
	 +dDsbQr/9oTvKIxFF5g+WBTLXdpGI9LmnyFYJ0Qkvm332DnzsuwCFiL2usgle9URKrzUS
	 LvmC6aktWSVx5RhNXa6CZ0I7CJvD/O5Yn0VcVCaM2LnumolxcFsxM4mrDNGXnod8pJG+t
	 pNEjsU6uMcbR2BzSw8cU6+xF9edGbkfhZCtUTi34l0zGhkIJcO6sbheFlwlyIEgyJvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGjO7NAW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YM+W7fW7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C18D606A330
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:31:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C18D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MGjO7NAW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YM+W7fW7
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJRHq2577867
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EN+WAVgkwiDEL7XX6X4DT1Vg
	Y5ErtLa0IoCAAHBwQOI=; b=MGjO7NAWXsm5REpaJFCiUmZCvAi9qTiRnAr8Kq86
	AVPhiEtdmyqSoNbuDeMZlrhyVPlwHdQAdjWSC+w9sxdD7esdjBb8iM1bPgZWC8qZ
	hyjrDjJVLrnGpupUahioTlrJm9CkKvSwOhRVsDYYk2ecMmZsNbQ3tevH1BOfUKmO
	IMzeMp1QY8UESmTdYHXn2R7qdjiZjNMrXcPM4Rx6BA+809hJRgU4W7tmp8A4MU9z
	ayKtNV+SPc6XcLi0Wh0Xs4pfN3bYImTHy/kGNYC/PpcCxmmyeZjZqvuF+dgxIAAA
	iwKPNE0pNrhqTGseDWxKfD5+B5q7ADtHGjfIcadDTeLbdA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdj6ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:31:10 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-990ca9607c3so1783182241.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794407470; x=1795012270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
        b=YM+W7fW7tnBVR9LtdCWKFpn6gDQO2+xL8F2TrFdx5XaPG50hxIACci24mnkf9Vsiyc
         o3ZhAMZYQY19xYIdMh52gyVgg/SLxDg/O50Kc1s7h8llUzsg4nxH371JMc4rvbZOb20S
         oZWgQKCepwXHTPtQ5hwjj1AYlV4z7Rea84rOSMBn0DrkOrOk5iWVwmcNN4amkvrH9DN3
         NdeR16mzZ654zt2HdXPW+5F+5eIbp/JTN/yMguzk8VyYqCyqyR2pgqM/j3cScFZkE8cB
         EWcOyrIbRwy3KS+nbp/Je224RQsfQxCzPu3Hv1nMiQkAKjAwqZFkZf+zA7pbXreQQQHs
         707w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794407470; x=1795012270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EN+WAVgkwiDEL7XX6X4DT1VgY5ErtLa0IoCAAHBwQOI=;
        b=Um6tz8TEYbdadPsTV2f2p4UXf/HR9o/weRI4K58Ywm/w0WMVR/zOZ0JRVvLPX/PPQC
         24dK7R1l2k+QxUgaGOkMXbzFeA7FnchQKpNYJZ/Yuye5oCSDkk6R7YJJz+gq5efQAPQa
         F3kvtYoD578HKrmSmIcTSBVbDeOeJJmpraOR7Vskpleiu0zqapKxFuwBTG+tV1b3ynRb
         tI5QGQlpL88Vfmoi2gy+l3W4xB6YXeqzM60QXSGPf5TNx9hCBBktdB675Mz8rPAbUWVd
         YtTeiMQL8sCW4zT43Yc0ILSDeMVLi2xlMD/W9B+lE80Xo5OYdNaEWsdkW4KLjuf7iZZ+
         j+1w==
X-Forwarded-Encrypted: i=1; AL+hErFER1/ouJO9E5Mo/QZiL5FbKyyVmYOmz6mNAh/APa31469ylRk5HobNK4InTDHgS5YeOZkcpZSUPlbO/FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JcFA44szDGyCSHXuSt3ZDbei02MhR+OA4K/b1RFhlw1LUqzpN
	TKkgWzILzf+EBURyJ+iK5khwaA/PLlMjpVGpkl8hfjZ9brwFgYP5R+O/X1CxtKxiMDKoyjQD9IM
	api66RB6DWI1RT8+JryF690tZk5kdNWHG7h8AEbUXp9erKqoeHDdxMp0FwuRUSsh031k=
X-Gm-Gg: AYBFou1j+Cd0F5zWgD9e8qMTtgbfqkFa3zg0bJICL0xxekUqVDT9cEGUdG6TojbuNij
	UkU4eno6/wMhq9ZrAnXJR3GD6nWXyiAPUdo1ILG6C3NMdjhjwdeAA06YBmmORf6wZ8FLYn2DNsO
	LW9Xf2GNKtCvJGheCaq/ZzUvVQXDcmW7xKQCXrflrkuUnPpNWorn4IpbRmqhOZVt8OtFnsEyzhm
	AwHxTOcUb4QRZgkcNfXYu+TDoLj1evFlFnZj23d0qLeoerozWg87rST9dLagjWAW+7xgkiflKjy
	N4mq5VErVnK4G8ihlzZ/FmwZEwx13NLouXdPQd1XeEUveat+lTvWiWLEEAZuxac8adSK0JJFpDR
	YxUAgqUUH5Dm+D6e5+w0nepow1XSYTrC5O9i+zkFDXZuV8WKLs4MMFoj6rgexK5hZ
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee1c3ff521mr824885e0c.9.1794407469357;
        Wed, 11 Nov 2026 06:31:09 -0800 (PST)
X-Received: by 2002:a05:6122:512:b0:5ea:e052:2ef0 with SMTP id 71dfb90a1353d-5ee1c3ff521mr824825e0c.9.1794407468682;
        Wed, 11 Nov 2026 06:31:08 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e57504sm54594105e9.2.2026.11.11.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:31:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:31:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladyslav Tymoshchuk <tvlad744@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-sm8750: Use retention for USB power
 domains
Message-ID: <gncowr77bzqv7mnshfpqv5rkvkjeyc5if7zfuf2xtqbxakppi7@xvefvpjdc2et>
References: <20261110213346.1359-1-tvlad744@gmail.com>
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
In-Reply-To: <20261110213346.1359-1-tvlad744@gmail.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af47c2e cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=F04PIRqRD5HbMnb_lPAA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: cMQKX_QHd9QhexHzC8TFAg1ixiGt2Bib
X-Proofpoint-GUID: cMQKX_QHd9QhexHzC8TFAg1ixiGt2Bib
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX4VfmrC2U6j04
 g2xg4QaGrwogY2s4E8L25coqCZuAy7qzHSBI2xj1SrS2Sf1+Y4Qv3TGf516zx//BiaZmXYxad5E
 WLdwRtyOH2ALJz2q/TCSs5Ik72rLsc6x3LT0mU3UXULBYpJucaI3PCvlHjJUWfFPVOpRowNRtsC
 xSOqXEPuLkkP34pMBYR3pfZBMVUPjkdAvrvyWVAgbZQInjW5fPNZwtClfTc+OPScwMHezmgqn3h
 AXZySZmOusMTaUVPrxk85e+7k62Tpe8U4oypzF5ocNvOZAQybwC9c2TfHj3ONL+hkH2HXy41jY/
 JZBLzzy5HT0TGfnEjGD6NrI5PL/n7Y9TTnuJ1NZmfqfpLFx6gV9ykaRM0KvmT+JmaG6Fg+/dMTD
 NVHvEoP6yiFoL7crbsBnPzi03/2Diu5kxA9VBs4gY2aJ6nBRToNHketkJh8cYtjk8KEKCVlt2lX
 JoOKVTa34sdAkpjnLsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX6hDy+7yKVfOR
 jqiRDlZu8R/GatYOWNJdq+ScPRMp82JIH83FIP3y873cCR5JtjOXSQIRoQ2RNzBabWtpZItb1dj
 yFEbF/VAq8X35pounqTwzYhQyXgqYVg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On 26-11-10 23:33:46, Vladyslav Tymoshchuk wrote:
> The USB controller does not expect to lose its state in system suspend.
> The controller node is a wakeup source, so in host mode dwc3 keeps the
> core initialized across suspend, while genpd still powers the USB GDSCs
> off. With a USB stick on the port, the xHCI comes back from s2idle with
> an SMMU fault and is given up:
> 
>   arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x669fd3200, fsynr=0x370011, cbfrsynra=0x40, cb=5
>   xhci-hcd xhci-hcd.3.auto: WARNING: Host System Error
>   xhci-hcd xhci-hcd.3.auto: xHCI host not responding to stop endpoint command
>   xhci-hcd xhci-hcd.3.auto: xHCI host controller not responding, assume dead
>   xhci-hcd xhci-hcd.3.auto: HC died; cleaning up
> 
> After that the port is dead in device mode as well, until a reboot.
> 
> Keep the controller and PHY GDSCs in retention, as SM8650 and X1E80100
> do.
> 
> Fixes: 3267c774f3ff ("clk: qcom: Add support for GCC on SM8750")
> Signed-off-by: Vladyslav Tymoshchuk <tvlad744@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
