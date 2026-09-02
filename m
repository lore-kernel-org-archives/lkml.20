Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65649EC65
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788357165; cv=none; b=PEHcjLSPbmZPCvcmEiVuuGrKQa1HiuEJ7BCxccndh8CuF4616iczxECbVtCAdza0b+bBz8hXl7TqU79AIf0QIJvnQnwRhxbEgSz/f3gIMlKWiseRvffnbc7WdlrJNLSjHgcATniKlMw2Gpf0uAFfocybdpVJUv8CsWOgkDk7MdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788357165; c=relaxed/simple;
	bh=jhVI0R+4vrT3l5buIfyfVPeaQvF5Do7MQWKlRsb+oaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJ8uUhDU6xDy2u2DjXmHlbT1gq8xVDO3zZA9DSIJ+u8nX/x2N+xOJL9UdXkbjFL09y0BWbBYF/MmgcAXsinXIx0qRzu1LOJclE0B3fRdQI01UTLuPN/XS4WNGgE5Q17vBp9aQDzq7EtLWVGjO0kJognjAyU2q0dCXRZWWp9MTvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQoQaAhc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KjhbEwSX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQoQaAhc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KjhbEwSX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682CRA8q1385896
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 13:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=; b=AQoQaAhc3WQ7s0LX
	f+JGdQKzFQGe5R5h56Jp+wetPEdXDwaOcySIzF4myt5OTHdGfnTab+iWNj4ZtQkO
	rLuNTIEkhPY0tly9rmrGa5nWApKtlvRyr8eHebFPeAXHMk7t1WXL0KAY6d1tI6DG
	cymAGk5FKJweF9OpP2fbuQsbyJGmzWegW2+FfG2vr3wy95KkvPk+Y0j74vSyywmz
	ezA6jo9aZfjwbsWuCe4au4jKMqv1b9QkcsApL4jUy/RR8vgzXaPT5qVbjwrhjZIB
	6+pBfKVGAwrO/423auc2slsx4MD+6DoQ+G1bHJisDFpNGZiGUZqYNG3VFiGnL3d0
	IXzTQQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435uwh5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 13:52:43 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7570225606dso39012137.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788357162; x=1788961962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=;
        b=KjhbEwSX5TJ1CTV1lMBeUgtdZvMYP26Hl8vyZtCnQRiyWkVMfqlve50wzwwYCEQ2+5
         KezSbdORGZnjhy2YehmBukvHiMn4EF78Q81X2nlbKv2qtggjNlNSYR85SvpjX8zCFT0a
         xFsYx8vFJmJR0QAe0ObxssQ4CMD+/d7FIX7jNP6thviuPHl7kU9f/AMsFBLKrSgnknj6
         bwrVdNxp3bdAkZ+ZRz+uSv7ikvy6er1jQQ/72LvTqwtkM9Ou4jReLnp598QD+JD991LY
         tp3y4pIB9llOh9qhXj0L2uUDBWcUG+ShhqSeh8LtJdFq45jhSwHZDswglqqvk1Dsbk0K
         J8jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788357162; x=1788961962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSF3yVtC19Pqqtk9b5wRKQJPsFcC5pMiKTVOCcKr7sw=;
        b=TfQaL6Q/y6g/DwbgfUClRegIZp6hkJeBVzykeFi25HwKW6tGWBKhaGsZnQLu7o9Bf3
         JiaW5lxI+NNo905tzHlWbDgTHNFbGHBudO52TJDMr5dep27uVfyuBsqhhJbzyF93niSj
         dyxrmISoUCjl6q1izSB64TOGA8F0XNTQyhBgSBs4OaA6eyRINaUAsIHkX4DpqqMr5HEH
         KNAJ8+rjjrPRqU03vCi9cBiFOZ/evEOMpOn9GQXvkD6wc2bEdhJH9u5EoiDnABrDlkW5
         Ly3JkKkYr+/r983njQ4PrIvy9VyR67MRj5cmrKAGpvJk8+JjeTjEmbOXDnpy4UL7RSgk
         m2uQ==
X-Forwarded-Encrypted: i=1; AKwUvByiarrVZJoNYPjQYSoKqibL8BDWtFRYarX51flH8w7nT25Q6fVSpw7FnlgHOFWC7WfiCwirBMoupscJN3s=@vger.kernel.org
X-Gm-Message-State: AFuF++lv8ACKk3JCluiNnrchDgovakpJor4XJo4iYhM/7vJtUY0blyc5
	ewefW1cV16T3xtABbsuGIy+LFZ7g4Hel1zh+1SFR34KNQA9lfEpyV6OEHKno5sz0CJyOYhZnPhy
	7iX3fy3YYmQa/MPw/JIAmWQmAuRQep2GQjdYxDD6clCW+0O/2MYxGI/orfSUsUEuLTGY=
X-Gm-Gg: AYBFou3gtmeorzkL2LNPHf5K3r/HgxhGmXgTLUnEBRCe7RJ2iNDfcjDTiZVVOh4IUzW
	FmSz0ubfSCOhUExaA+Dp3J+DuaG2Wo3kYqodAUcfAyqGioeVOFich2Hc4RuXFjLDmdYTxUEwcYI
	gIEWCOijH7PirWmVViHFzPeBOfSIZmzflIEMLxXJpVe26E37Zrh5xMWPdoYc/J8ioYPd+QJK7uH
	birJR5jsH+duT7hmSu4je5p2OppJgHDyPhwMpukEFYFYIwQ9NhXCprHsPjWAb42TIcAbz+CUwlH
	rvadk54WNx4WVLBPi70TeHszAke4C0vlI6XiKjQ0dj3LCCE7A3tFiUshi3yMRC3LbYWTH3KqBcy
	vIwxQpb8VSCeZJbapNXMt3Q==
X-Received: by 2002:a05:6102:38c6:b0:784:a169:1925 with SMTP id ada2fe7eead31-78a1f3110b0mr583906137.2.1788357161507;
        Wed, 02 Sep 2026 06:52:41 -0700 (PDT)
X-Received: by 2002:a05:6102:38c6:b0:784:a169:1925 with SMTP id ada2fe7eead31-78a1f3110b0mr583898137.2.1788357161046;
        Wed, 02 Sep 2026 06:52:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b606b23fa3sm604620e87.32.2026.09.02.06.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 06:52:40 -0700 (PDT)
Message-ID: <9a7cee1d-1058-4184-a915-e7e943b4791c@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 15:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] arm64: dts: qcom: nord: Add support for ADSP and
 CDSPs
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260831032103.341633-1-shengchao.guo@oss.qualcomm.com>
 <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260831032103.341633-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXxXu6DB0PLHba
 KJKPiO7rJG35WuqgV4dcBWIibpj3A37fSLgM2p9EAPnkTeA/TmqZ6zHtDQBb4BsZNVEM11AtwCP
 2Akeau/HDsloVtKZdmMPwrAYx5qvxF3WE8dNkbJph5hZgFvIDL5Vk6c6d3CNsCJioB8QpUtlW4Z
 kMfIlk6FuKTSRgnOw0/m6q0py09uTMSSn5Dj6i358iAEbvv2b2vAFSBZ4rkU+ggg6iFFrSdvhyG
 nJTL7WtqOZAhDfZBgN1LgizjQhPoAHjJxKcsXvbUnP0ME9kSiC32pMkCBic2NFh6QvPlIWXVMlL
 YJ697Vn4zPp6sc12zmyayaBzN4oHciLXT8/mmvOADjy8Jl8TCtjQ0u7OiEWJyiyS2o4YAGSTA3J
 EALZ+J03mrnktOe64W3iqf3ynTtEUj3TCrOG9G2HgIbTZoA9Gc/6g9Yk4NLxapWJR0wJDQCvFxJ
 VQutGsPZuKgCrI3rPhw==
X-Proofpoint-GUID: 7ECEnyY4cWL2FB_-v1-HRnS1ukJyXmPZ
X-Proofpoint-ORIG-GUID: 7ECEnyY4cWL2FB_-v1-HRnS1ukJyXmPZ
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a982a2b cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=uLxBzBmvjvUxPvobmToA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDEyMyBTYWx0ZWRfXxnn/ht3ai0vW
 fxoIYV3t5CfhSatEjBtqMG/aQISVJURW0FBy8HwfpUDhkoqiw7+jxkePXCloAxQ6ocU0mhnm6fP
 fAo6kiEYYn/otjTcoKt4FQOZhvB4HIw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_03,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020123

On 8/31/26 5:20 AM, Shawn Guo wrote:
> Add device tree nodes to support ADSP (HPASS DSP) and CDSPs remoteproc
> on Nord SoC.
> 
> This includes:
> - SMEM memory reservation used by the inter-processor communication
>   infrastructure
> - IPCC mailbox controller for inter-processor signalling
> - AOSS QMP node for load state power management
> - SMP2P nodes providing stop control and fault/crash interrupt signals
> - Remoteproc nodes with a GLINK edge and FastRPC compute contexts for
>   userspace offload
> 
> The embedded variant specific power domains, XO clock, and interconnect
> paths are filled in nord-embedded.dtsi.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

With our previous discussion at <ao5Vh_d_dAlJknpl@QCOM-aGQu4IUr3Y>
in mind, can we reasonably assume the ADSP description is fine as-is?

Konrad
