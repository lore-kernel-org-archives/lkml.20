Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665320;
	b=h9CCb0qoJt6ckkDFIvwPJN9NSJRtFzWAghB32JizMeSzKtUPFI+InugGg4IUwfTpNaDV
	 swOb8VecyBLvmp26QwckG5XqHoz21cQP+AFUHMDF5o8cIL41EImMbrIhlZo5otFsXP1xr
	 cFY4bZvBNa+gYq+Jkz0kgzx5+UbkNFcpvqrZZeW043sb66WRDyBLOmtZjQSQ0YxREIAiI
	 xQwNJvHLqn/OoOFnxLtvIFt4VU2hgFZTvNgnCauh5DLF2M5ejy9/vvcreBs2O4RpE0YEE
	 uw6WtywwG2fGcuXtXqRz5HBd7DAiFm3FT9MuJGFII8vAH1tucur6wsdP3M88HQEOoZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
	b=XqJ+2el9adDkxZYiiDLKarNXn4N3p+TrzyvqXqaG/NDwL/OObZcAHUm3mErnUdcLYe7e
	 0bqZXCsLjEA+T0XROyRhnWAmDLy1PCjkQjfHnjVX7mVfx5IG9v8bzJnvTQro/GV9WqVQm
	 Omm2xJywmm4vFfDp/pinWUktHTz8W/0s8Wz7eI3JvAXk2I7D56nrVgsZsW1dZ9CLrgV9b
	 ORuYH3f9hoV4nCzR/K53Sxv9fjM0gadIO8J5Jo+8A5mserYAvGK2dI8X7qjYgoQ3eb/nk
	 k5rPqTJ8GsLZTeIveC8GBmHFvleZOZKLTTuoqqZLzBNn/UjQd+R0htiQXJQ0twCt/Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNi5VkQn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJOfSVxV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3299606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3299606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JNi5VkQn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJOfSVxV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA09Um3115688
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eMMlBkiBglKEFlIFcMpO1HS8
	+5XdfdFxQcz6LUDiswM=; b=JNi5VkQnrtvQpSiIzLwGr1FQui4AhDWIsK2hjoRA
	6GxG1jH527R+2ir5wlhLxQj7vi41bJh2lR3QPYJ4L8NRHg/Tm5AhCHBk0wdRhRJ8
	qxeW/C8CqHzS/2OSDJGBbWMx9/5M6qOYubOtqiJABz1Z/viV3MkaG+76cE8LN4Kk
	qA+GFUO878Ymoyz73H9DYJl1ThUUlffcbOrlOWBvjHnQYFtBwtV6vuzODdfgonpV
	ubFi2KqQVCHq4SaTupEXTiu7ksCPYIXBWjbdaKDIadMWV0UB0J6wQOY84p+MuFlr
	0FZylx9LA8BBdnTRTL87zPf+2LVUl7wcNl4pLaS6iPA7uA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt2ua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:35:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so382938385a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665318; x=1793270118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
        b=JJOfSVxV42wRqAx4xZKEN0UI7ltOQZYSX27xRtzPuB21TFGfOdYb9I0DHSohFiboKz
         okcc3YEirS/kSKmkvb7YJ9irNARsL/I1aJ5HnmiPDzDp7WWhSjx465oRSVgxeHFFyHat
         ZKKO/25lL83F0DrWzUAUdaC8sepsoK9suk3A9oRUbT8kr/6fT6I9d2WMpsAcOlAsTTPf
         oEOknIbhNY1hi7hIJJxdNn+xMDsPtGl3deIxk++Zj1leF/0o+k0eWe3kU5NWgNU2YgR8
         rf1j2qeVsqCEXN/yXhbvuip/h5Cq1bXyohJHEgudtM7KIN0dBVP0SOALqcy8NI11FhU9
         S74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665318; x=1793270118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMMlBkiBglKEFlIFcMpO1HS8+5XdfdFxQcz6LUDiswM=;
        b=geXPhefk2YnZKYneAiZFQg0BW5u7EonkWE++4xMVjOxOWqUtArmr6TuLVNoSOdW+wn
         hcqho0X0eHQbS8l6RLrTKuh+YCyJNDbzLfaPT0jdGsbWoS3bGWqlDLpuzSsR5wUaZnRE
         lsoVYYNWSHqVjIW35I+PnZdsLnXFpjk0/SyzTlzL6bZB3NKBIHUWm5HH8G/77I/HOIG0
         q4Y8EhH7Kp80ZXnF6QOhwAesme+wpDJi7Ib1iRxoeRx8vx5MT9P+23jCSZCTUyUJdK3G
         U+GjEoX7lDj+wo9DMg3P/lx8CFIkiiJX4LFNUvK1wuorHPqh0IK5je3WO+6DbHLdGWOa
         +S8A==
X-Forwarded-Encrypted: i=1; AKwUvBxsVXhau9T3biajsfh+YO7zqc1FXUBN/50TLXa8jynS3XcIDIudEmzScT77omlgL1GPPb3jSYQoodZqLuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTAF/lVADPXChDaqV7BPGBLSSuVUMa5jTVZ/dKBaIZMzk64t9G
	GJHRZo3EVCAPZUhjsn+77ne36U48v2CTI1tNYq2MYNnfWL/n5/Hpgu0XIwdXZoAYDhrt5KDLA2s
	eP/IOF7db0auKeSsB0XZFiy4X81fHzRsn1vRGqDd9jyvlV3Vm1fYff0g7tYxk1CfN55M=
X-Gm-Gg: AYBFou2XmHTF+oncPy5XMCyC5VU+fcZpLMAACjTV0ImhbQEHRVdcgCpJm7uWxZjgOBG
	69zOg6jfbvgM3zYf0g5ykjZYc+/VDT3Yd2KZNfpsHeCgB2oq2bqYshTwLJwI9zWeeb4ZWd7EdAg
	3efvp4S4PrvAQVUL31fvThNioaY3RpEnayuzVBuXz9DTRhZxIYhRh2DS+uhGwm/pYcTD9u4s0Ag
	vZJ3b5Js74Deb868X1nEP45u4aKwS5cTkSazKfkXEqhN+oJb9jNwtklrB2vCnm/4qVXJ/XCkktt
	zS6svEHxLtsKXQzFpArvj9c/Ypg6aW8ETnVqA80sn6njICXRymakhaCaihtrYJ1R1nSgES6206o
	COUsmgoRbz3tjD/O7BVxS+d84tomAhWifsByCwUX56WRyXnSPtjxF6zKUh/mgD8x1F4W/DUpUEt
	nHaCvCKDAx6pG1
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr836390685a.57.1792665318316;
        Thu, 22 Oct 2026 03:35:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1a:b0:93f:2aa8:c555 with SMTP id af79cd13be357-93f57fad39dmr836387985a.57.1792665317902;
        Thu, 22 Oct 2026 03:35:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f563b9csm7087601fa.21.2026.10.22.03.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:35:16 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:35:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8650-qrd: add DisplayPort audio
 playback support
Message-ID: <u7odzamh4yvuw6c4o3arswpxf3g4uf422pjhioryqxjpsempeq@u3pulod5wuel>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-5-8a189c71938c@linaro.org>
X-Proofpoint-GUID: oDYa-kxbZO12HmnZeVRE6OuzdqM37-mo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX14FAq+8T8YjC
 L06BpFY/EOpEJZv5vEzX3wTrE01TGAPYX0vtrFskigS4lA4LUHCvgUfjJneOM/+VVE/rmK3Q3df
 j4OYDzZEzxAfMHyWMy/oQLEuaTh5qcDlYADpbVhpAFx0t6Zsml9YRvcGovSjpcXfTH+wvHQ5lRL
 yUyikZjA7xAxuKx+zXbAFP25g7aaxIYZI7wE6ciKu0WQtcizBekZ2ZpLBxqdhAIBotiCA/jonOf
 7opZ8DFCtZTfzEHBmaW6R3XG5W90tjnU2W2c0oZGu0ai/m1iLstwbdrJbMoEwc+MGv1kzuWPAAc
 LxROsrmT9Ij+/ck4jDSrezeS0/gBrUfA3uULJTLFNkC3IoGAfKbL4X8Dihn194Afia6vFrolgc/
 O4G2ODOkgCTurnbYhKFzEDADOw18JV0fHDRW1Q/DEgwcuavMUBhcT0pKYSXZIBeyOcikwzOl6hr
 D0e5kXE5sKdm4Q7zsbQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e6e6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=lwKPvcPLtPgdvEeQYCQA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX3VPhVnNPZt+P
 QVKdeksBlhqe+nWMGafwbTxALtmND6YSoas2WpdExFoPzCvBu+4KOGW/Gdk2dCHfqZ+iKD7dFr8
 R4SBzyRluh0DgyeqkEWJcUVXxiKUS1k=
X-Proofpoint-ORIG-GUID: oDYa-kxbZO12HmnZeVRE6OuzdqM37-mo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:25AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650-qrd.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
