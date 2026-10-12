Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC7E4A0135
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791819133; cv=none; b=uI/QchmON2hfhF8uJwUSzpNO3Pm/BveV0PXn+8jLPSymczRS1N5br7+1BuHsYY6igmcSh07WS2/NyOlm+vyIkiA/olSW6NS/XJeISmLpuBXPQ7q0jDv+QdRrITTJLiYqRt+NuAC5EBiqg8wRjNLr1oFgnpww6sU9gCAmiTBnOxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791819133; c=relaxed/simple;
	bh=b4y/kM9nQQeiicS4RTPuO/cyCI6SZtxImdln7AP0eZo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OZD1KAll/EzcYZZ/49wR3DqYvURuUl2nI7RBeep8W+d/gQb201MoOCX+sePWtZsmkalF1ePN/xT1rkO5nY1L+Zva0yI5eURdxwbHqn+NFUeXa4WLFyqFvZdgjWTHNFjjUii8vF3kCuACU2VaORVXcSb6kwCWx/GuEC9aQKGMpXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DrmAn3z5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OJc0ZQ3Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DrmAn3z5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJc0ZQ3Q"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0FMV1236331
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:32:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=; b=DrmAn3z5sO+ufxHX
	zziFm+zFriYdEvK/CMv4BjzqGJwWI+L4/0Tsxg33R4qxp6H0q32LB1zsa2uxQgL5
	0XAs27RrBIHWndwhXP10ptzfxf2x+aqolI6iovroBoWABbBd3tw6mxEDDq04N6mi
	xBotHvagyY215Br2BKnrZs8cCWFVckTWsencBFuU+zRktyzmMFSAspF89B4FbFkx
	LAsmGook6Kp7riODSV8lYXUemGtZ/Ewu8w5ktUzfB038ixNrNcJn+wmrqK3LzFME
	ibuHWrXdsU+nxnG9uZw3jrUTqUHacGWIC7yJEGYlhh1ZHQL4jdpOmI5mun6ITmJH
	hoVj3w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkq9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:32:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c2b7a15cedso43589137.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791819130; x=1792423930; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=OJc0ZQ3QiuLtTTyNSQ9Nzm9UYdY7n1Lx7/BXJQ+SIQQAwCTbqEx0YSZ2DpCmH6+/iZ
         TGs7ngBeD7fRlgIBM+jKHV5LglrLJPvKdr9aYYIOzzirRJe8sVKVfIUPSRu3HLgH8lNi
         VNK/JNVn16xh/87H7t8rM6A5D9rHLitaYL8MnSKl2VDj2pwaXls8EZtkRkrD25Ote2Bg
         bP9I/ayfUkwnD5UKWpdh6Sec46j9W6xdFrWtqWG0wwRRTp0g75nm16mLHNdq3QXeveXj
         Hd3J6AcihJMhsxOphfxSkbKp9H3rXurd2B1IV5Xd2wXsgJDI0YQ17+l+aViIw+Up/LHV
         kJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791819130; x=1792423930;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2E7NWsYM5jefqd7x0KPOme7rcWFKAPCKoT6nTZ46xg=;
        b=jGtVbZ5YZQCchOp+fT0REYLSFtml9/gj8klh7dB18q3BbjjoJuZzdE1N6vG/lG80qr
         cpvjstBTwyFgVttErRc4qrEY65YR62B9O6wdIjXnINxcJKQD37G69GvNx8s92KLkDBrZ
         I/31tPLd6t139WgIZ/L8fE44KF6XIvNyTbDx8J2+QECur/aiQDlGGEQrB+HCYjJ9O8oO
         kTjt1WaRXPsOd8jhs9AfYRv2pdCzygfbNxS6S11S9WZBnkAY18XNps/TM5H9mAdw3ped
         /H+BOPlqZ2p1rTYex1rzdF3OAvTLm6j243Yeg/gCAH4kTeFMwUbR9uuT0f1a2Jy+4DJt
         rDlg==
X-Forwarded-Encrypted: i=1; AKwUvBzPMXPRg7gJtV8Jq4yt8pJhRcJxS0GakP1r0eTklCVbxf+3yqm9HEApOGpK0mKvvJTVjUmIx0LRuz491RY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLEIDu6ztIag0DidtQxZ6HDlMwaHnfCiW09EABRTzkPlhsvnxw5
	8oJE+Q2Mg52bzz0xt1xAe2Tf5ITVp47VW6xRinQQT2c7OgEup2DvV6GbqQyhBQphxmceQ45BmRU
	8WyZjoUxlHaD3wm3ArUqoanbQu54TmLfAaFkYJyDq56qxfTFtXQimpbr+KMGmfk1kTy8=
X-Gm-Gg: AYBFou3py1rGkOmXGQ4AIvvK/PJo+E33VrImMkqi8HR8+L8Z/aWe0q4ueUhyDnJ08RJ
	9cwo2E/kCvE+JihLXLRKTho6EJsmnJhcfM8I8ZrVnHmkYFdJ4apxVGuSj8ioAhJdPHyBmIRAiSu
	1JTJPXApENmm+A4Ga9Ciw5+cxWC/vP07SUTiUYtax8AiwSj1QhjRo73bThFhHEt7A4ntS9Py8d9
	nvpr11rGVznSIP40JYnyaPkc70FqQX+2iFbluANf3swn6IMEGpYSUu1xgD/tV/YZrUxkqw0RAxE
	KeriqlYwUPvpRmLANfOMyfknMtQjWsZP6K6DVkic8vpdWX1+Df/F4escjh4LW2qGb8cDH+bSX4x
	zynoX6czHytAdO1pJwErHGg==
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1543514e0c.0.1791819130062;
        Mon, 12 Oct 2026 08:32:10 -0700 (PDT)
X-Received: by 2002:a05:6122:4a52:20b0:5cf:69d4:10ea with SMTP id 71dfb90a1353d-5e92e15cddcmr1543473e0c.0.1791819129608;
        Mon, 12 Oct 2026 08:32:09 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34feaf0767sm124748466b.40.2026.10.12.08.31.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 08:32:00 -0700 (PDT)
Message-ID: <1e086c0f-148d-4dca-a129-9123dab0ee65@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 17:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 29/38] arm: dts: qcom: msm8660: Align closing array
 bracket
To: Waqar Hameed <waqar.hameed@axis.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@axis.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1790892852.git.waqar.hameed@axis.com>
 <0b1bea1463ef62cd786c8c7ad150e723f6bef8cd.1790892852.git.waqar.hameed@axis.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <0b1bea1463ef62cd786c8c7ad150e723f6bef8cd.1790892852.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXw3Orgo/dhxnc
 Y8QIGwbidR+uVhFgbdMhwxzC8LWsBaSqlbGko6rSbpK9mQt3ogqHbBLmFiogjHMoTauexZNKJHt
 gA1QinTxQPdTuj2mVOX84amC52VXwrezPpqz5gj/EaW1RKW8yklE2aYhaijmeVLFv8Abu0qBNuu
 FQs6HWnja2Irn6hoBvbWYs0f6cA6snFqT1HfCW851NA8tq5SAb0JAD3QFHnyMbvq5QwmD+Hqi1J
 4dcP7kZIe0NyQLKPAN5bNpg3jQPor3eQxf5TkP6Jyg5QVo6TQThrKKlf95TbpeeTvv9BJQqKSUK
 pWGhuugmrsqWxwlqHS6bizdarBFKTdBkDXDDaYHaWqtWphjIhTwNPZZaPCSjxZ42RgKD7JpWo43
 sGG8PJ/gp6DTLIJxfaVDosB4eE3DdP+dlJAcrjvL0DEQAFg30ghvbL9kb5MStNfCh2ADcK5mjCt
 GGDTBWiJ3arsst3sNyg==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accfd7a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=3-RhneuVAAAA:8 a=EUspDBNiAAAA:8 a=C61bhbeWJC_1YFl37gcA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=VLVLkjT_5ZicWzSuYqSo:22
X-Proofpoint-GUID: oZXsPVRbtXJI8AScUiM61uvo5_YOY8uQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA2MSBTYWx0ZWRfXxRFK+bi9T4P+
 hVqSM1J8DuEjC0rwW3vJxUnpRgC8TAdpNxyUOJD8WhEK1oCl7Yx2qfW4PNu2DKmaB22AdCfSQij
 HYwi/hSb+Jlu29Lcga14O1+Gtkr9qY4=
X-Proofpoint-ORIG-GUID: oZXsPVRbtXJI8AScUiM61uvo5_YOY8uQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120061

On 10/2/26 12:36 AM, Waqar Hameed wrote:
> Closing angle bracket of an array should be indented like property name.
> Found/fixed with dtfmt (Devicetree Source formatter).
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
