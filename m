Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E0039DBD3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790161914; cv=none; b=Z78Hrd43Zxq/XxtjKhJhESKeZnvGzISfzbqgyJR4lwWxvoYy1mVni9GM+V9EZV2dxOD9pD4IiWiDZKpBMTzKNT+dHIBkwsXXGPQVyFcyGx5aMLC1/0YkGWQMFiStkOY4hutNkHZzw/CeLSgGh7zz0JAMN+DdpwIwOBS8nUJqJoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790161914; c=relaxed/simple;
	bh=712VJTrhRjWyawggAv5BwpI1HWm8an6QzbFo1+kwTBw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=AngUSHgQJk1MOyzwZ/0xMaZ8W+xZ+Qo1MkfOJObOrXY44ruDZ3GrzX4h8RXY3Qt8hrrh3qb8uILS6LggDfq8uOwX9s7MoMREHo85h3jL9h58UmFGKYGEEd8G8rBEadNknsSVFROsEBHeMkWCB8U2glEhABQSAEUTKqG5blJw6Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CgzqY+tG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BWtNRIXA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CgzqY+tG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BWtNRIXA"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NAm4S43663775
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6BhKP9QpCX/PwI4kb4Filcl2CHH4CD7BRg1MvIHfgQ=; b=CgzqY+tGCY02wBiJ
	fAPq0wU7ZPtaf8PRkgnGfuIzE4HuC/DURFIy+KyssTg2rE1v2bxGJ4prGDObXNth
	s5klDNXaDz+3IM1fUWnuBRMOCxrouhLyzPDP0mPubVrH7kPOMA8KONo9jJK4b/i0
	kewWmkVqQesML+1SxLWOIV2cvGS517ZemRC6wAm4781sS18a/RVaweZhtfymMBnX
	03Ri10tPyy8z/YJvUn+TwP0I3gyg8FKo9vARlbzcFO4BGBoIYVRWgQ5Ph+66/KUJ
	Spku3kQPWpVPRodz6sLEhrRKi4yPqR9Ogb0Q0qUnGpTPNUhjLj6TY5Y4p47YoLlC
	Xisv2g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvdb603r6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 11:11:51 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-334f782d1abso2723043eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 04:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790161910; x=1790766710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K6BhKP9QpCX/PwI4kb4Filcl2CHH4CD7BRg1MvIHfgQ=;
        b=BWtNRIXA3g35GcyvICY/XTJ2bzprjSKN6cz0hI/qaqkL8zZRTaPzwPGjLVYJUi3zUJ
         Te4HfhqBQfrn5ggXDG2vpZnhKDZt738/EiQl3C/3cjUiMc/m4C/rsPhAG9ge5xZQOg61
         HgRGPcWjKsG6ckv2JIq4DFGPdFQoxspbyxWQ8r5J/1Y16Bszk13ZW2a8O7qUpJcz7MId
         m74UbYUV8b02hFFB+8myE7IkixqWEB6xprhtVzz72bzsDQV21CbkOEQdCT+yVf6AHvGv
         ivBDTf8KTJZ/VRp4Xani+znlDRz2ZBX53ePimJuWFrXtExiULeq5R+2wZOWLZsLJHVie
         uk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790161910; x=1790766710;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K6BhKP9QpCX/PwI4kb4Filcl2CHH4CD7BRg1MvIHfgQ=;
        b=SMd6kG+njrz89f8AJrxFp8oTV8+7DawunyicyKp3LOixztaKVM4h1EXHay0+tyXe8C
         lLqCK2BnGriZnRzTr7stEbGHm8GRcxFvbBsIg76s66+gbEI9eiPBAvjfTDKDBBv+GUQx
         yJ65Y9KK1QdH+Gu7AdciW/479UE0gGVOaiZt+o3YkPDFlNK0hn/pIGGPRzQ2jy9nuFKc
         Vvx8bzDTY3ok3YN5on1uHCoM4WW5kZICsGwyJn289T5pUXEEuiuOVC2+V4TREg4wPWRF
         TOIcSm9c07MW5zO24uno1lFy/bSzYYDoTOkGJhuPSErGV0iY+nIR3paRSIyWNmokt3I6
         9xRw==
X-Forwarded-Encrypted: i=1; AKwUvBwuYeIzrAFpzpiL9kVNWWZp8u1BJ1gstmzrZtBWDwwOYheJfs9GoLmLfgpSjvpwMI8Y3dF5qMSjRpiGjAo=@vger.kernel.org
X-Gm-Message-State: AFuF++kYyXLfbBYxcET0ovNSk5qUVg85RmRHRdfHqdkQUOVHhL5SiWU5
	w9MYL0URQaffP0mAuvUvxUThbJHt847Zb76TzFiI0Azo06RPz+Vnw6Tq+iJmKkU0OmBA9lex2+t
	dSurBRKS+MyvnADoxice5+MllTLSaPUORORGfve+q31mAjVwDCICbDIWmrfb/L4Gi/7A=
X-Gm-Gg: AYBFou0AGVckJkS5vJVS/Bdl5lXBIHoIWALy3SkMKPdKkjGqyzWlM5wiUVXJCn8wiXD
	7zALGy+0zddR11L8Z9tWDoDkQ2CErHudjbmnpIajkMbKXlGsRkQXbtFSZrp8zAGLG8jJUENelX1
	e4YdY3hkWrm9wtvxt3NXEJjLwl9GgwPVmP94rOIeUiP6vxr1pZlfArTDqxwWVBlvTlWIoS84Wo7
	fX0HtkRdqFE5hP4lZV5TDpGHZeCAVkPtATiJvnklELjHeunux3kzNce4PY9jZkCzpgMjo/udeKq
	xztULiTUc3As4tDQsaPxQCB1hNcjE2qbJP9XMMPMwGbOkddAfknmzB//gIETSqdL8NtnKBZ0I1b
	l+Pd1ME8TBBksM3C/1fLjL/ptJkk=
X-Received: by 2002:a05:7301:7bc4:b0:333:f2a3:5517 with SMTP id 5a478bee46e88-33e8d9cdb24mr3305871eec.26.1790161910355;
        Wed, 23 Sep 2026 04:11:50 -0700 (PDT)
X-Received: by 2002:a05:7301:7bc4:b0:333:f2a3:5517 with SMTP id 5a478bee46e88-33e8d9cdb24mr3305840eec.26.1790161909758;
        Wed, 23 Sep 2026 04:11:49 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e972395f9sm5368121eec.30.2026.09.23.04.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 04:11:49 -0700 (PDT)
Message-ID: <f653e9e3-6426-4e20-a095-5e2490afbbb4@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 16:41:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] media: i2c: Add Samsung S5KJN5 image sensor driver
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org
References: <20260914-sk5jn5-v4-0-386e84cfb2b3@oss.qualcomm.com>
 <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260914-sk5jn5-v4-2-386e84cfb2b3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RTC5qOa7NP7zO_3I6RNi27G17Snk0dzT
X-Proofpoint-ORIG-GUID: RTC5qOa7NP7zO_3I6RNi27G17Snk0dzT
X-Authority-Analysis: v=2.4 cv=QeXzLcbv c=1 sm=1 tr=0 ts=6ab3b3f7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=NEAyEa2pAaJLIrQk-qUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXw7iaj+l8gRZI
 8dES0V3b/Xkb6vFkecr9IXEoXA6yMz04Dj6wiZWG3QGkFvaFWifHY6+duvU33DzhpdSN1Rx4c+g
 SJwl+1d6a6ecbqASgpkNQcDE02+Bvgs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0NCBTYWx0ZWRfXxCtlv2bud6l3
 XOYxI1kviSQ1Gx2zDtzufntrg43PPtn5ztzyqXYQlhujY1RRgnrFM1wTEjBasJ5lq2U/akzG68w
 JAZeUrlULM32GGVjCU0G8Ptf2gkk6fEThs1fIdP0tsd4RBpzdSSjIOzK34QV50GsIv+GWQKs5+e
 mhg0wuKaSGBLZbzeM0u3vhV8jdCFOmntTol9ZUzCp3UMDXCac6J4OMFps+9NSnimBYtHbz1gg6h
 S+uxcFqipu4Lq/bcbFak/vgkuRhGzVmMDjTWKHx/xY1jhgtthVO3n4k/wjWmvYcW94JqaP/BdYX
 SQD1XuxueW1GkCH8NDd2n+eOPwbdH5DjAUbrKTddZXjJkBmbucZFMDPLNAQKdAw6A6Aht/ZnE1/
 As+hi6YwM2nV/ySyJxND/5klHptGeWcrb6snSwa2ixOO/pXytXruxSONi9y4gd9GuknvTPe5oW9
 VVG4eHPQsIA2Wukr/xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230044



On 14-09-2026 16:40, Wenmeng Liu wrote:
> Add a V4L2 sub-device driver for the Samsung S5KJN5, a 50 MP 10-bit
> RAW MIPI CSI-2 image sensor. The driver supports the 4096x3072 mode and
> exposes the standard controls (exposure, gain, vblank/hblank, test
> pattern).
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  MAINTAINERS                |    1 +
>  drivers/media/i2c/Kconfig  |   11 +
>  drivers/media/i2c/Makefile |    1 +
>  drivers/media/i2c/s5kjn5.c | 2861 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 2874 insertions(+)
Hi Wenmeng,

This series fails to build against linux-next(20260922) after:

7eef49c16461 ("media: v4l2-subdev: Add struct v4l2_subdev_client_info pointer to pad ops")

s5kjn5_set_fmt() and s5kjn5_get_selection() need to be updated to
include the new 'const struct v4l2_subdev_client_info *ci' parameter.

---
Regards,
Nihal Kumar Gupta
