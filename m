Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264250;
	b=TtyOXt3jke5JIBAbtyZmun1UqDoROq3oGULV9ly0AF3De7cMmUbEf/RYsXQYCcxhiVlr
	 oKuW1e1Nn1Y/6+DJn8YCDCZbLSyS5Fvt1apx0CLwq1vWx9TDklKMRY+eAl2u00x5KiG07
	 1Yg+c+Y1FYdyPCkoE4IiCYiQaUC8F6kc7t4uslOpt9niv4nWBd4WLkC5mQRdnEc4+ckTI
	 gG1+kCrps1G95pJHfVOrpRS/CqGSk1oupmy07pwRKqqcdvm7gxlitYvEe/8bvK0SxVk3L
	 J/3EZK6c72gJmfPn9OUXeM0s3o65z9Wo61npfmaAJxnc6UdQ+Miih9Q7QdtJ1JDDKxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264250;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
	b=a5rzcmkb1ule6YFgAGCg7DXqAQkLgs8glh0yVTcK6IvvehVipTciZJP0geuKQmK5bK+k
	 70jAM7975VQvdsYzs6bHN5taiige2NY2KXa/0VnqTKIl2iCRgB5vBMBbiNR2SefW7v6Mt
	 F9nEMhnMDxQ84IHsnKpx6bgmq89SiUFrctG8+HAVNByyF11smE9o8UfaRRrompk4Y7En0
	 vsCVQytwSGLNSXU7ZIkHaPSpa5GYAFagCkUQ66czHfSIkBImlGp61pCTgEd/FKIjR8SsY
	 BxVnlUxmKvocMMQQtlVBChAyoDmjEMnv2hzq61Bi4xYm+KCFJJODJPzbHAX9qhJexmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb8nWuEx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="H2a/IXw8";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A2606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 904A2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Xb8nWuEx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H2a/IXw8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vSMZ3457774
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D4dVdmSFeRE0JHF6scWJ75Zg
	mMOz+dO8pL/chYBEZxM=; b=Xb8nWuExxWSsNj80Iw+7Nh/Boe4LnjrQEuyP3n1I
	ACXVL1hHFjtBaWzhpRF6mdpk8jZN00otuJSZhzYqTzym7bnm/FtJExLruETBp+ZH
	82YhFZaO5355ftSGa7ENqbvZhlRP2C5abtjiGadzH8ofz0TzGzB2qhr4uEuKopoy
	CAPVvZ8L/o0EMa31lWheJd6gtoupEwabFFMnCGxO2hJF/btFpbxkHK3sZtFIcQnm
	JJxYvtaDTrkd/AdJ5Yia6cJKuYxnfjKjHEBEOXWTLcHaAJFrXlc5UHFsuKd6yX5B
	Zb2whAvbiTxt4Jigx5tkIMfFiI/82NzdnkDl577Z60yI5w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknkpb1mn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:57:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so216776585a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264230; x=1793869030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
        b=H2a/IXw8jtsUIgqoZC1MrJqTqTUsZB1FMUV0dDOex3EXft7ctiBgg58QSg0wi32AlG
         TMvZRk0c7PkMAsoAfR0/DVu//B+YLyqrY1vSi6LlRYM46Rz7xeOjzXWW0hZ/NrYJ5Mlu
         jbC//lLHwUyKL0v49Y03hlTn9i4/0ZQJH9BkeyImYsywOsQOCkXBGOU6cT0BiILX8/6d
         OtEka9ZS68lEUp8XJeCnsLDkcyr4S2d4iNf3deqAFSjK2cudSr10vN+b0hjnspFQAzZt
         tHgRqQH14DsCYqyoRKO/OgNGjdpN5kXHKZhTPR+q6XNM/5FHw2BiYVjmZQhbcOAC05oy
         quhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264230; x=1793869030;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4dVdmSFeRE0JHF6scWJ75ZgmMOz+dO8pL/chYBEZxM=;
        b=ISC8aVJ/W2qF/2W/P6y1PhgdLUba2V+Ret8U70wSwaJxMRSWWZxBGsogzBzks/TBFD
         QsdPXW9icrUI2sphPKbb485a8gOF4wNwcIz94w2e3UajrTpPUKrye8RTm+2tvp25DfXm
         gQvvRfVTRWsIcqD4zwcIIk9Q7bLFEP8uh0fmXVV/yv2v5XLbTkFP4+f6fzau13z6nEDj
         btk8rQdwbjD4g3u77WzHUYBCdOPT4MtG6wWYr/A6gumo6/6yeFDQQLrWlG7nFoc9aGEm
         o+MQ1GYQRw+xdcUCyQuoNmjtbAkjm+eSmgSOzgfP5dZikBBWKzDqkx/N+SIzMVtOkDHG
         306w==
X-Forwarded-Encrypted: i=1; AKwUvBz/TkQ3oKgTNckgX8Uj/wB127x/ULnUH4AR7JnNutQLIwAAMQmG2UHCGo9+JG5gky8Xq83eqU6ZwgEzYLw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgdqyDFZ5wOgNc46Lj/ySL8ecSaz99I1ZZ2mU4ZL8JTfs/DLht
	Zx4o/dnXBnD5TpmbuHMBoZP7EF5U5HEvD6YChSB+rP/qwOYULyElKV6NKF/jg54O7qlcHVkrdfh
	l+KfCM18B2cwPgMVQ4KEFVxAjAdvUPxPAkeJf0XPEa0/cUKii1d7aSn5SlZnF34yZdeU=
X-Gm-Gg: AYBFou0OiDbpZbDC63ywDRDOyF2ZB3RKieTdez7QZchSJ0Rg3WCjXxYq1lxFaPwHRvO
	rkYmYkncqlv046qWRnpqmIIBycUtr8DKZ6Z7rqVc8Z7po7+jhKV/VcGEBjKX+12WcHNmjbMdQpU
	8jaGhuPH4t4ljiKEEeLi+XGBU+B4EI0qxst8QBsex5RD6H7p2RTGcZN/lBfIcybEB6Ayr84p20d
	9knwUMnP6+LtdLA0asGgArzK3moWgw4M2mFS1X8K8sfVZXw7DgZw0/24cLwNqMEJd8ovRnuOYwO
	q2sTw0ghwXUVeIn4j6PLj/xWQ8ydJQXpjYCi8o1Tz61vCq78Bh0eLSetBe9jFX6u/bGTnUO6Ri3
	ECVHCMZMCSSduhI7gZjy2DFmn1IiGW9nb3XqBtDsRfT63Lz0TKjxtokh/ONMrbi0r
X-Received: by 2002:a05:620a:17a3:b0:93f:34c9:9259 with SMTP id af79cd13be357-94408cde210mr707301285a.50.1793264229733;
        Thu, 29 Oct 2026 01:57:09 -0700 (PDT)
X-Received: by 2002:a05:620a:17a3:b0:93f:34c9:9259 with SMTP id af79cd13be357-94408cde210mr707299085a.50.1793264229125;
        Thu, 29 Oct 2026 01:57:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm34947181f8f.24.2026.10.29.01.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:57:08 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:57:07 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dragon@radxa.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
Message-ID: <m2sh6dfakwhndlpxsq5kpg5nywk634vicyf3n2c6hcx4az3q7n@27cl3z3whwxb>
References: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
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
In-Reply-To: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
X-Authority-Analysis: v=2.4 cv=Ju9kP84C c=1 sm=1 tr=0 ts=6ae30a75 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8 a=__UjJjYY8bcpKF5Zf8YA:9 a=CjuIK1q_8ugA:10
 a=ZXulRonScM0A:10 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: ZLscQ08vm5RDoAxnmSeDyMtjjoc0At2M
X-Proofpoint-GUID: ZLscQ08vm5RDoAxnmSeDyMtjjoc0At2M
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX/TH1kRzKHmU7
 Dg8B+j+LFr5OMMCaxSmUPxFD/OAwetNRXh+bSP5CFjdeN5g5IzFBRVTMTY/cxaghUEsw8/IIs+V
 MGPRT8hVgsP+UPpjImzVnBb8Sy6zufA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX/Y+v97edL3UT
 tcBpFvGFb2aUktqO9ULfpfFxIgRv4Ma3iukccHeNMV+YTnEY4LAj+kSUv7pC0XDLRWip6LEN2QC
 QIclACStPCmOTaRO12bCy+w1mkjjXhQxevKewjC+VZ1W2PcyFXrDXXqmQPVkm/fIguT5wlmEgsI
 tZiHAAGVrSv6c6SoP4+CecB9R5TFy0dXDwOVlBtCNDy9TG/gVODeG8c2Pt7GglsfW72lUK594S7
 z748TDVjo+SD744YJy/R3qHWOKfXVZ1oGIRkE9piffMiJZH1fYQHgeeDHN1hX42+9Z0p5hASLT0
 zn+Ry1+72YuJhXjfaBZnLIxhYl5hSIXVZRxf/zdbr8jM3dcluUURAr8u3joNe8a4a4MBDhBsEip
 fZSfGDl2YWrEJlxw1/Sv9v/BJuQq1ir/1isb99kV8uVvuBSAkAOMpv74r1I8ee4z4YhRqwSByWT
 /Oca765UHG2AFaL2s9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290034

On 26-10-29 15:52:32, Xilin Wu wrote:
> Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
> I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
> Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
> the non-linear QUP instances, and keep the mux function names aligned with
> the driver-supported qup0..qup23 names.
> 
> Define common four-wire UART electrical defaults in the SoC dtsi: CTS uses
> bus hold, RX uses a pull-up, and RTS/TX use 2 mA drive with no bias. This
> matches the Bluetooth UART configuration used by the existing boards, lets
> them reference the shared QUP state directly, and removes duplicated
> board-local pinctrl definitions.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Xilin Wu <sophon@radxa.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
