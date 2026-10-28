Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793168510;
	b=KM4h8BD4d3fJSY1ozWYgBs2KApLUBwQ2Na+WnV5yDuB8rh7kBOAZAPf8qZxUNSljnFyt
	 8aU4CW9IkRViCy7cj4yX9VC49Ta+r/Z7aeoxvVJTIbhcky4fHE79PbFWArKlQIqOtvXCf
	 5KHmmoC20F/GjFWVApSDkDXBYiCsdveUj56HqPdSw5yIw0pB5PhjzHH9aa0ocdp3AQLTs
	 VXN9JgbQsKW94uuBNQAwpGb+89yqAWOpM3po1Z21LAI3nTrJZzVg30DBJVMUEyXtjWSNh
	 669FhMoNXtvkrn0NifdcYp86jH+hyFpBXND/7uOIKMFE6WEV1ME0tcSPYJAncSOJoYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793168510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
	b=3ax3vQgE9sVM4d/KQQO4v+2ctEhabU30+FjuUzQrcCjhWC8Dnwd4M9kfTeN68r3ZqiZV
	 u8JW5ZCXr4A1wdwF0pZPAMextGlGRMxeWe+GU1c7RTNBHBOKMEguwk/62QhtIHOiHwzdL
	 yO5kmkwpOF+nUW0zat/IgdhPjdw5sNRFVTuzjUzrixro8wZIcEUxmVw/GJK8Zr+Y8GBNn
	 kDgzs1Meji1qwlmXE7EvQ05RWz3zRaijClNIC9bpUIH38hCAv2+x/zqO2S41rxZHcZY/f
	 3HQBj1URgcxurn7gVu7sOAWRelWHUhX8tkjrT0bl3jFXlYOQ/WArOBseDWuhEVfUrTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZE2ux5mK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D296606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D296606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RGRCJdyq;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZE2ux5mK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S6AAiT326589
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:21:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sG9Xj1OZVI1nTkH7YcZt+Jc0
	eaj5QNvufoqH8/wgxTY=; b=RGRCJdyqidppeH5y1UWkTK7cqkfH7Ky9Hx/ccd47
	Lnnk/+X89OuXV4QsYlpHNhta9YMeZRyqHzxhYfDOe4sdVNVIKHogj/BD0IBKu49D
	gYK+9K6xQegHz7NBVAQB6Ne4nMd87z/smpPRZ6sr5MASz0pSJY1OUwh03urjLeWX
	LFJOmSc9x31D47tRusH6y392NtJ76nj9OJ0TDd5HRvm0Zi6+fCWZqDOY5keXmQUV
	BoGfUbaS0lUsIGwKKljqKXPwjmQLjAc10Is5OLCjsy7Pe44cjzBwSDMbwLy42s2Q
	qI9/AgiV1vRoWorSAwP6neZNRLg+Jscrta8Rm7PZu+oQfw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8160-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:21:49 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-351788121cfso508245eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793168509; x=1793773309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=ZE2ux5mK8+z5PYn1nhZBhysEmOjrRE06QDGHFZpR4RzKxHFkjMifS9C4TWvcwwBoOC
         vTHgUEwaEKtJGhE2KrLJ7bD8Mn1gguddB5yNST+4l4XHIObcVVg8sR8LRHwAoQxGrXe2
         YOf/utWNelE0iWIMLJwHVD85+7r7KuW2sD5l9CB3xU+C5Is9ERxkK5/iYrHk/DDtBAzG
         xo0TVXopvi7hLtS5EuGgIos5nE2kE2QpP9K77MP9XZA7FdCbKjgPYmQZ3+7Z6zJ4P4e1
         v/lL0dRLNVSG/RqMue9I1IjilL0a4dVNdSvtfMPN1z6G3BzurHLRp5z/jMV55MkwvwHE
         fvBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793168509; x=1793773309;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sG9Xj1OZVI1nTkH7YcZt+Jc0eaj5QNvufoqH8/wgxTY=;
        b=JAtmW+8tQLEI18lutAnoElnYoR1muWXWVukFIfjON83m51+ExA46kBHN+sSZJs3E19
         2CJdYF4mvR+9CZLKekRQP16nZSQFc2pFUJCuuMW7ZkW41746KoMNhC/49knRzdyqp/2C
         T0C6uQ7GHilZb5lrdFtfmdMJrXnuwwLHntos6Zv8Tj9gRfCuV6aNupwvZyFATnra1BWu
         4Bnq4WBwFSIqeOG1TzorO8uDelCNuc+ej0vZ0Ug+gyuA8fDDPm1KRaNJlcnHmvBCOu8t
         ZdtQrqUP+gh07N4CgN6HvlGszD11cdbURiHPdBloNis5UdwbQkh2IdSnbl3/r6g+NKTc
         qpGQ==
X-Forwarded-Encrypted: i=1; AKwUvByyqqegHPHekql56s5jWLBFsJcRG6PiMVIfGRNzIC4lr8sU/QLyKnWyWDXbMsoiF1EsyNUQq0CX2r1lK9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYAOpRWYxXXhR6DGgXpZaGWpsNIRCtI3XiOoPpGc+mHMUdUtvk
	oLXgHm7P4k0/gLAE0mVIpoB7G+LHLsve2DZp4nVmXRp+XI7cmkySIoiHPUcZg//GvH02Ze429rU
	YWwLsXIgGgC1zEHdeVx2qUhgXljgBJWRCF4CH/RFYHNAkqbv6bbSvd30XzVXUFA1Vke0=
X-Gm-Gg: AYBFou33979ZG1OX6NBH3UuXUf/qAKJH4CGXFilGotUJA+MJFN8N/os11Mq2A3UgcLi
	IDa5NBVelboEmktvDlNPNdE2v1F1HN9xi2j7uUORxmaNLFu4oGC9IknViUsviYXUnmBKDq1b4VR
	IovUVMdRTT0/JsMSfOXMvnJsBOQ0xph/yOz+nmBZ4s1KDOU2IpM6KiyGAwtUOAHhMrMlSourEAx
	cypGyuRbbAy+XhlXUP857g8IXHYCF7MgQZkLieJw7pq8q6p8rkMrRhDYj7Q/hG90/3fNW8y7XOV
	LNuzG8dqSUT6oNnH1Hl6TXY1NgFu76ec1Yl2DyaXgmh5LhPWUcoU92OqNSm9sWuqFGt47cmDcdL
	8AGpw4rs11uLvHkdPq/26Pwa5Nqx2KGz25fEatrObxlDrRqrxmEJn5crRDmtS+V0gRms0s1TxWj
	w+Wkavnw==
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161098eec.35.1793168509018;
        Tue, 27 Oct 2026 23:21:49 -0700 (PDT)
X-Received: by 2002:a05:7301:fc01:b0:369:fa8b:d725 with SMTP id 5a478bee46e88-36a204a51c8mr2161055eec.35.1793168508453;
        Tue, 27 Oct 2026 23:21:48 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a23641e78sm3397103eec.0.2026.10.27.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:21:47 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:51:40 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com
Subject: Re: [PATCH 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
Message-ID: <auGUdP/IZnAEui89@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-5-585caa39cd7c@oss.qualcomm.com>
 <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
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
In-Reply-To: <fa143c9a-722a-402e-84fa-a127494b3f5c@kernel.org>
X-Proofpoint-GUID: 5suYf_Eqjhctx3bvQ23emnNtJ2K-qUWX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfX26/PZnbkgXw0
 xT18u5BeAFjzV/LOp55NRBSLPcyBdI9+x9ALx6peEJQpTBqeVObeaG5bKBEeDLX+2dqa18HmpAj
 fxb5YbRU5nSY7iOvC/k9sgNeeh+KcX0=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1947d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=eYwbJGcMLBrUiUMk08gA:9 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: 5suYf_Eqjhctx3bvQ23emnNtJ2K-qUWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNSBTYWx0ZWRfX2Jt1k1UEUaVP
 v6MkjeIFpJDtDiIfxkWN9uKwCnk1L0ke8UxYhLKYqKsO/2ybgLzXNJQkd6actfSHV14gWKEZpMM
 NqNNn0rkHov0A/06LCv6MLYk0EVQRxOcT08CXH/iyTYMSUK4moZcqM31mHKkpz3O6Gz+OS8IJFU
 RAsRf4pQeTh/Mwfg56mlpize+Tjb2Fb+b3D9bwBOSww6aP6cfVag2/HjRxIiz0PhwCvg5uB/ahc
 TKvfasgG28jcSBzf7RahgEQLlIO3KPUx5BLpjw+V3XDzotdTD8uaUbNtX783gGnDDaFtq/35X7c
 FakPI1YvyUpUeVIy7eNJgx7EzERwDn8Jv+aiwNwxgDyOS2lbAr1Tm9dsUE/jE16Wrkd2X4A0v6/
 JKHtto1Vw2ZqidjhLttf6zQ51I9BQtq6xoQRmuHYR2sMae4APOyHNL2gTxcNsB34zpDGk94vyyV
 5Vf+xb5+6KrNEcaRJbw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280025

On Thu, Oct 22, 2026 at 12:48:05PM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 17:17, Anand Tiwari wrote:
> > Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
> > available, used by the Talos Lyra EVK LVDS panel overlay backlight.
> 
> We do not have Talos vendor, you sure you did not miss dependencies?
> 
> Best regards,
> Krzysztof

Qualcomm is the vendor. I'll update the commit message in the next 
revision.
