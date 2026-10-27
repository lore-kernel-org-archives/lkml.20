Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115550;
	b=JF1Ip/AjbJTDZgybdib72ZvVou90Ey2D52D2ajUoTbqJOyA0JKNx2qrQXez6bwhp8O7v
	 /GX0ufZLe1VVaWosi0kEgbNfuonIeZhCh+Payg0RqBcnb8/PgRqHj3rD5LJxS9y/QeHVc
	 O36xSiG2NFEdmbxGP0QFKE+1WIxfIH9+I5fCQrhC8zx4X/Bci9j5+rqhMvDSvDdFv3yEB
	 dRewhHg9upFve4znOYQP0vpfkHyFtPzjLrogd+E5/uuWbEsX8Qr0W8eEWoEexhz7/qcSL
	 cvgNnUgA7C2DW9WrwwDL4HyUMnweT0punwXTSvsqkEejphJQwmx7VWw4wY5noieqV+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115550;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
	b=UmGtmBiY9TQ004yewukrIglePL0p/K2+hkHuzFcs4x20mNi3Ef5DAC3SUxvpszG0+ra3
	 ByXxQtAmbe2iAee7emajkGTHx5TbdgbgKV0TyHS66jzcypRmXhjigtgfbKZ3dfe9CRadi
	 PXncXPdWJAFyVsHWjYPliS1/RucMSXRJ1dN6Ljif5ctCG6H9kvwsI6gn6FsYCONODwi75
	 cv5Mbw/0h2MOp6xxDhLTRmbL81CqdH0p10hRfyVAPb2HHbzugS4iRVElZ+FFUy/l4LDCf
	 V41GKGNe0ntIMDwSgdaUaH7Xkk40KFTZ/U6C/RqvPj6pUSkLSFMGTX8jYDchBgnVstA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8gFv7xz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVyrVSjJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B6F606AA29
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7B6F606AA29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P8gFv7xz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cVyrVSjJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFL5p83153420
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:39:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cPUuvJa6t5ywKGHuerzirPTG
	KYB+uX1njxJG93Lbo7c=; b=P8gFv7xzUPPnaLk5NNPXANJeFnWlwmzQlk728piM
	J5GWtWXRLSTZRCb+O4F/+8vMULH5fuAOwHn7Jz//o98PxjD70k0JwCKhWCPFVJUF
	FUpVUa7MK/qvikQAOeqIT6zz3lwCnkyYvZtxvuuI0yjNSL+XS+NW0nfxIpYvFMX+
	cbqepRAmlDOve2zgLPTHA75dPamdAWkqLddGYrkoudz/vfafr5RnlkuXHKN2i/D7
	4HJaBt54EgiiUvcnkeYwl0wUM0paYBDJfO5L17St5sQ1D5/ywQs+FCqXvSSzDnE4
	IAp+WQPvDth4/9l8cyXpzdXz94FpRhIPo304+k7Ab85c9g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw21w5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:39:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so406078885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115543; x=1793720343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
        b=cVyrVSjJg+ZyvVakVuyRFyV+fmKDb06I34uvSmYJmXvyB3ebXvpd3hxqLf5JSF24MQ
         Aoa/EV4doK1C6vv+bZ7u35vPDt6G8MM9AwDkKWataaiScQUq84+s3/p1wrjLfmXRlqzW
         3gCBW7br8e/ojPzXJBhWImZcxKBOCdP7A5UuNZtxNcn47BViTvHaRg8plhtnAghnhLiT
         nNzLtiJjmBWVOtZNfDnKHtHoxhSgW9rhqo/Ek8bj8wrnfQ6ekalsqJh4IiJYEt8dENtT
         3EMhW81z9T34hu4neq/WB5Rvtp8MJPleuKlWzNA88WjuUcu+FLD5fgrd8aQvPd9MKrp1
         Z9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115543; x=1793720343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPUuvJa6t5ywKGHuerzirPTGKYB+uX1njxJG93Lbo7c=;
        b=yWu0tCr6+/EZfJAOQGOYJJ2yBTi2zbOC7L88Hh7hSiHbwKz6ES1qSgwb4s7aQLLdeb
         K/tih/htyKnQUJu0waKuTqYE7hUmyqFcRuNn53kvcCNSOG8rl1p85SGmW4rae3BC1/ql
         dAxickmDxhe+mWLzh8HmxbLTX7W1yR9L3zd0ISw513YC4OGcWKbvPRhjpveY0LGQblsd
         pDUtJinFc2BMLWEfQKSzqnSdt/mREi8cKPEYC5/p/poysQPj6tQ0LAv0Ls+j75vNrZKZ
         Dl4ry8C/7VmY1KTk1BXNhKKaxJYItXZ9wAEXtJb2KDWg7umbDsnERhuvxxGm5SKKXKqz
         lZPw==
X-Forwarded-Encrypted: i=1; AKwUvBw29mWRjAPSS5HONsx+f4fPHeuvAwmBAKsZ8R8hekue0N6StPD8LJbLf9+VK1jLKt5BACoJT9t87B/eqaY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVn1aNMTFb1MSjPxnkDNq+oD6lwTBmSH6a2d2bE+0l/d+Q9Ijx
	l4D5ziL+ZmuoKqNj+VcR70DaIeZOEhfyqHHfM5nbvqxlcVqrMkrQbXBCW5wjiAWfboF4l55gz4f
	+tsieNc0a+Yjd/p0bgBvjjZxVgwQY4B0jWqxLbedRzpvdGR79CCNzecL6Ksoz1efMF4g=
X-Gm-Gg: AYBFou1UsPmrgVMIsTnxRYfCUe+Vbn21QXao9Zcf31gWKmDEwsfFaRe6X3z/XY9kyQT
	PTFGHJU62r79mo54Xf9XTi1Gq7fu40ndG2zWevvEdlW3aoICHDDnu0/2J3iEEdMf57h7ZWf9LFo
	opwWFHSvIsZDdhMP+u6dpeV8Wr12+osloENGlIBQilBC1UKwuoi5s/v2uvoxH0w+GGRCJYIwJ3a
	o4VWK+Y8uUDW80NRidmPLVeaeiPL8wJY0YGaAshS7XRAQUkTglv5/dJWMir5vVAFmjA38u2WCk3
	IFi120p/lKX8t44J7TNkhSIfQrg6+HqZwLVxliDAcOJ6f3V4qx3Qo+/7IXKTndsK/4+IUBAWwKM
	IQnrnV+eBw6Gwll+6W/58uL47jv6finZhenhNQtjl9+09i3Kp9dzvkQ9rFFTUTZ6RKQ==
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr1459354085a.47.1793115542397;
        Tue, 27 Oct 2026 08:39:02 -0700 (PDT)
X-Received: by 2002:a05:620a:4542:b0:93f:2bc8:283d with SMTP id af79cd13be357-940ef95fe8bmr1459347385a.47.1793115541726;
        Tue, 27 Oct 2026 08:39:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f387sm23240126f8f.4.2026.10.27.08.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:39:00 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:38:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add Mahua QCB
Message-ID: <gdo6dqplzniqwxpk5dlkghn5ha2vh7staziddoa7frxhxfqj3h@6urgosis4rgn>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
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
In-Reply-To: <20261027114955.1266499-5-sivansh.gupta@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX2GRJaqeUE+sE
 TT0TUYURr3tlX4XeImE6SxbiKOABXuaiimm6gk/XByss/rx8KduIue1B6KUH4oAnPrN4I0thnMa
 9/q3PSU883PkN3c/tapGM5rAquBNe0/pP+9/er/ImesUmSiEWeyeHGHwTEA1G0L+wRGVCZYty0J
 iaWQBj1RkvQDIQul4U7jfugsmJjNuFgwdXXhmTKa0Y0qa9Y1wY3jPpTaWo3vORlahQ1ChTgvpCU
 eo7Vdhv0vRXI4dlCbnQ26yjiNqyAcxuSlCTyuRDvlYXW6HHG9CzRfofj2ryHMuoCOWreoEBVbm5
 SIgT5Vog3lZXCEUco9qavpO839HzKDag8OGEzwUfSqD8FJC33h57SoSYiDyxUiPlIJ0vPtUPISx
 abGbrpxGXCcKTxi1jPNz+Zh4XIbTWgLgzujE92VbqPcHoN7cGW9WJackUkTih9TsK1jUIABv44z
 tn5Syf6BLuaBMsC57cA==
X-Proofpoint-GUID: eBoHCdw33uaWGFx4C9wzxZPYuv4HbCpz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfXy9H7UEiklBFt
 nwnX0yBfhWcoIdTBqxqIiyvmSzzkCVifUoq0ZtZWxjz/HEnPlyMcdAlR+M//Iec/0BG2iKa5OD5
 G82z0LxudVlOPoDvsyjTPfZQ6g6I0jI=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0c597 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=4MzwNv8qEO_iqFDzjXMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: eBoHCdw33uaWGFx4C9wzxZPYuv4HbCpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270062

On 26-10-27 17:19:55, Sivansh Gupta wrote:
> Add initial device tree support for Mahua QCB. Mahua QCB is a variant
> of Glymur QCB but using Mahua SoC instead of Glymur SoC.
> Mahua is a 12 core derivative of Glymur SoC.
> 
> Unlike the CRD, the QCB is suitable for compute workloads, power
> measurements and oscilloscope-based hardware validation.
> 
> Includes glymur-qcb.dtsi, adds Mahua QCB specific board compatible,
> adds tcsr regulator-supply properties, removed cluster2 PMIC/thermal
> nodes.
> 
> Co-developed-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
