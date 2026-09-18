Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D12348463
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731096; cv=none; b=dwlKKUTu1FxTURxyQRdVNj9Qaul+P4jAIpIM3PErqRF2YfYQjeQZKjZ8s8VTIa+QCtsyh+/3HrlmppSltL7xGehSFyrT4zIyecErGRtmB784utz56h0/zloZ8nM4mdRdT9M1gRrOVYyMFHJHIxBZj8Xe6sULrPjRtPJDORYMOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731096; c=relaxed/simple;
	bh=nSJiNBakj4emOsSacF3nvZXhxu4+N+4Jm9sSlg+AafI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VRbKjmP3TFlBeImfzBF3mddDKvAY/f7GriXjoiTg1bt+a5dom6/pnSMXZDNVSHHzZ5wef5qpHDWHesG8w1bcq5TR8wA9q0vvhk9lstSox3bzFnbiVXxcioCGvYewLJ3lTQWkwc0ZbtaHywGtVftkaA8CIDfjyCHH/SwTSg47a+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n7VF9xQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFAMh6qG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n7VF9xQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFAMh6qG"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dab1385347
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:31:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=; b=n7VF9xQM70RRj+t8
	ENq2TnfEwl75DANZo2i6Fo+CSCDZjO+nhrCARSZ/IfO0Z+yqgV7k4aenR3OedW5r
	VrvL67T9eTu6BAIwz3nuAToaaSXzKHxoHlKsHlF+j836AZdrkfHpRyuGqlphXcb2
	U8awAxEWg5T5nXsW4OLxLJU6XCetwbRCGvfGMT8u+795CSBYkz0wD4B1EwTQ6Ffu
	r6GlloMdsSGhut2HopRLW5k1+QVESgJaU7+LtTsqqLNXjkvebBP9HS3aZfHB7lPd
	mMszHiWOMJuoLx4eSWFQ+WRtTuqAAFaFOZ/DPvs/v5criSr35F6f6NVRsB3SvY+Q
	Rq2L/Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsp5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:31:33 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e18af9f48so1020002a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789731093; x=1790335893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=;
        b=SFAMh6qG71wzZOKBabWyCCVC1EIRjEy0mxZV1jrqtgkdWYV7HcetJ7FrgDYQA8gsxY
         wGdSpid/sOWepC2Y8uzcrKf7u25hexNc/WsuHujT7KQZ9KsTMS6diwlKa3wNomg6CSgX
         oXCnxW8HMR4+27dRjS37NwL3uKbzi7AxKIyavhuqIAaXsTyfHa9B6Gzg380NLn/RBUZD
         0wsPSD1vxl1jhoIQVUQNW8gx6TiumbxHWMTg4Q6hRxITHjMXNz7qLZczesnqL71dKsZw
         kbZZfvzjQwFzgXXZataNA32p1UgOTN4ZDE0/deFeiztFTImiTNcyMOazcErpNBivgs0O
         ZpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731093; x=1790335893;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2DmYpDpaC3qX+0xz3L8WQVvo5LxyvhDx4KZp32Me5qY=;
        b=RED+XJVHGg5vgjpzxxxH9gLbzXjkcl9UpW+BoRQbb4XSeKdyeWjA0UI1PjSkEaZPtM
         +Jd2P4q0g07B0+YpZ34HP+kV4LXX4DXWSNGk0psMcwtObRqpji7XeTfO7pQ1SRZX9g0D
         uuDQH0bq8VqqSSGG8rlrZUV+9ji1DUKvQ4F99MiUimtFqIkUTCGU1MwluaygzyU5j6fQ
         wf0hNqFVi7g6s/VudHt4U8Rfz4InFArCimsG9GjsZM1tHGcH8n+FbjoClNNXPzKcjyCe
         Yk6EbFeCpb44P8wNjR1kYN9VJfwhfWMkWARgBLwJlNeuK7P4Tzp0I4/1pteiNRX0wx+B
         67cQ==
X-Forwarded-Encrypted: i=1; AKwUvBy1lguKTQB+RM2/FOM3qQZwxzGY244aKPPx6rC9YQtLfMm1Y9TGLUp+r4oKAgaRKxEL6Z1lMt83r2ZQIas=@vger.kernel.org
X-Gm-Message-State: AFuF++kAzT/3Tv5nYqXk2hPpp3FFo6PvtvylPseX47ddWA+MxwpDYT+0
	T9fm1Iqo1rjyZRPvf56X27MIV6wynoxoB7VZNr69angVYJ/ek2xzGi5ODDjS+UP5OvSpmtdKwGH
	2zHyjdMoSs6ox3IOWbElxXqNVxwIGqNF8xbbgR+XP5n7qGEKOH0p2ML2tMRipTjiisp7ynQUZHH
	w=
X-Gm-Gg: AYBFou1GFcOvzeQBN7tVEU1+Qcu4QpSCyFkxVCIe+REszVCFHQlr2p8SyArEdzgADsZ
	D/j2PhBDkmfGAFNN0Pw8KJsgSbaTSG8WcM26fAEt1rXHDyFoJY2y4ax5/p4oMwWqQcRClTeJmLF
	+d6yzoQ9LRdzXvpVLQLaIRKtMasvR+UrYkUCflNIjBYoZT/NMhtoE+BYPR3i5peHYy+al+ZG6p9
	QOVMF2T20OoykSicQa+rpXQgAlZh6GimvgXlKxhj0WnP1tSWvoqiQAImdTV2PU0WW2KcfayDuk+
	zogP2g18tejByoay0UO7dbuKmSVeMC/ZoeYJ5oHSILmVjZrHMAQYuu2QRj7Hc4N+ayocgnQ9Nz3
	5iQ/WWQKYGiWyuxzwwwKZz34T
X-Received: by 2002:a17:90b:4acc:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39e36157fe8mr10059774a91.22.1789731092712;
        Fri, 18 Sep 2026 04:31:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4acc:b0:398:9beb:a2b4 with SMTP id 98e67ed59e1d1-39e36157fe8mr10059729a91.22.1789731092255;
        Fri, 18 Sep 2026 04:31:32 -0700 (PDT)
Received: from [10.218.25.214] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c2876965dsm5375819eec.19.2026.09.18.04.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 04:31:31 -0700 (PDT)
Message-ID: <cf538030-63be-46e0-8800-10dfb941a388@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 17:01:26 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver
From: Karthik S <karthik.s@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908075854.3015560-1-karthik.s@oss.qualcomm.com>
 <20260908075854.3015560-3-karthik.s@oss.qualcomm.com>
 <83509feb-8776-4f61-9bc8-aca27d7c234b@oss.qualcomm.com>
 <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ed2cba23-5511-4787-8cb7-7c8207c21f25@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad2115 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=iMoLkvK7-tmY2ETxFN8A:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE2MSBTYWx0ZWRfXy9hbco/E0pKt
 0ed4drWo6Av8gJQvNRrZu3w18e7RCihUsNmhRp21jQePffXnxNspAYTZSlsb9Mw/F1GjbFjbA0r
 pb7dFg0hpTpL7c+yfaKfJLKWYcjLU7D1t/iZgk+AHRKxSYiQ0HYo0wWZJmHTY3+ee7dkpKT+9/S
 cakrkGVnf2c1Enlh0TA8u06g9vSdpBnYmp/AUlBeHbPifGEFbw2isbc6R8C9jVOEPopK8mrP1rX
 n1eRmVA5EImXyQncuIagdSxBQUIIt0TbqVFXMBQ0K257xK15/TO37ptDcCH8IiLy4VjSwKPyCcO
 iVYwxOmtk3r3rmCyA9BasefBGqrzUuIjxCyBwkbTeuPqOBM0OBa0GCfa6K1HQWyeYjlOfiAsLca
 5rDshZwDRmEIImc0A1hsl1yyY3S+11b9t645fKf+m1Qq5MG5S7HuDUc4niwKVKPCTcD6+QNsN9T
 mmEp8mhL5Q0xDMb6+Uw==
X-Proofpoint-GUID: 1xoOB71mm_gR8MxdWMEOB0SeNc452CBk
X-Proofpoint-ORIG-GUID: 1xoOB71mm_gR8MxdWMEOB0SeNc452CBk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE2MSBTYWx0ZWRfX0V6C5VUeq2hq
 YReOl1vwAxetsk79+l84BURzYQBJ50I1zD5d8prGSwWNvj2+P3o6NXx2QCCIPFbTyEn6tmP9krf
 0xnT7HPuqvegTnZ/yPmynwTki9Bs944=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180161



On 9/17/2026 5:35 PM, Karthik S wrote:
> As you suggested we tried pinctrl-sdm670-lpass-lpi.c on QCS615 and it 
> works fine, the alternate functions seem to be similar between sdm670 
> and QCS615, we will use the existing pinctrl driver and post the dts and 
> machine driver changes for the same.

hi Konrad,

but we will have to add pm_ops support for enablement of clocks, similar 
to sc8280xp lpi to scdm670 lpass lpi pinctrl driver.

Thanks and regards,
karthik S
