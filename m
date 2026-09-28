Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF0B35201A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578078; cv=none; b=eRvS19lvKukEmEqleWR8GEsr5FD+xqDGMuQKBkWl1FuNbbvFM6LDqAOLG7ai1DDpGi0L0V4Pu2bj4qe/mQgZ2mxlt/KkGJmruNbbIRYqI/e67NVLnKWH/ZDuo14LMunRHCoVnRTcdXTCV2TJcJXlDKOCVGARx2Amu4aXafRy00Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578078; c=relaxed/simple;
	bh=Fr4ebETLMZgjwwgGkKxz9glNEMFGLumMxiYB0XlQAkE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e84MIpjWJ61h2Dl2KcUQmpjcrchwHRhHRbny1kKJZJ6zOc8zA8g2JeZzQDJ9xpWLb0LykmHr6JXSpBpi3JFfzTTeGo9r4colQQ44QnoxWK+gHSvNMuyhQ8LT0iQBYsRu1wi+ZohK1fZxz7NybEvFG6ywHljRc/rY9Q02fJ8AG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGYC41qi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JkE6JsNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGYC41qi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JkE6JsNo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S61c4n772122
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gbYFA+1BkYtOZzx1tyomDBYy3XmO5Z4hiRS5GgzngGA=; b=WGYC41qiMRMlZyng
	SDz6ia3skH/hVKVHEdbc9A2EdE+ukSfMgiJtSs9Mhoyl1E2dGF2pxDWkPj2PT+B4
	HqBsOxb6C7X9qlqYv8lgu8v/pfkTo2oAEUGFcpbv4GzkBHizrB60nXF0mC7TkIuU
	FmDgKVeK9H+znK/3Avsmayy4PYUuf5VRl3wkPyAUU3ExRL4F3pmnjQA44oKCp7mx
	TOBHSIIDQB3CAU74XFoHDanFgBsl6I1AeN89oedo31NprKGPrCrwG46VEpuXFh/P
	zd50UHPGyBLNlkj5aOIj8dwcX+6cCnurqtdZ9g3oU1/1bMXQ0tXLRp0O29n/NyCX
	tI7hRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjkxg4qw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:47:55 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-916cc44720aso6084426d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 23:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790578075; x=1791182875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gbYFA+1BkYtOZzx1tyomDBYy3XmO5Z4hiRS5GgzngGA=;
        b=JkE6JsNotZM6ErV2Il89roBK1ZEslzm0qDxyI6ukbo0eOlSHs53P48VsNcR/up58YF
         BOxa5cUaRKI7uX2H2xcHdyP7g0RPuWDiu01ietahAv+KE1cV5u9BQtdNRdfhUTpGX8m0
         e37pM/Yz2VSXjid1Xb+iGxetD++jvM5nB8J5C+nr78tjre4MLn/TzRBBLYX7Dv5eImgz
         7YWJb7KNPaymQm6GkNqgQDPtBIhHVffo4xIa1Fev23Lk0wooZQ56WMLwgnDO3PAs8gBN
         PoQRZ8wI0jcHLlW95t8MUtql3XCezeg92VgJbzBoka3aOKWwTRCUVSaXAh5JO4j4uk/z
         xnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790578075; x=1791182875;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbYFA+1BkYtOZzx1tyomDBYy3XmO5Z4hiRS5GgzngGA=;
        b=Pv6Qz62UTuYKJIZutBUytvrAGxCRAboAa4QZnNqSmZ9T3DQMdi1Rp/Gd5kJW9DJII+
         D1PQj7ny4qzs0Vea1fJTVEs8BiYo1bXIrAw1W0Bmlf6SpCQo0R6gQUkEmhT+1SdHLmZa
         jxCPF71xlUS1uHm5jhXeACRbQ2Mgf5N5N0eMwSyytp0O9uo6N3ov0oelEFpxLzAiZ7D6
         s1ygFYoMRrB8AfS8HydrglCtb2xyW4VT0IPkchKqVyfnFwBkjAQUPW9eG0y0Ez49SA1+
         9EG7xYp9SbRKOgyT8aM9fl6mCilXKz7TPAsRLXpam8Liba543w1hFKokYVRBjsZg9yRU
         /CNA==
X-Forwarded-Encrypted: i=1; AKwUvBxel8HHm7ygzwnKzeMjtbWhmmFUcdP8rkk7Ku70AmNmYVvMslWKmLdGg6HcBBZAuY5ed//0my79uimKNdI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtfXF2XXU2qAz9ODLKMR8g/phLA266W1OToiS1k2IMgjk/HRnc
	4GZxMyryuOpq2EIBUmKoV/CaglDIOFUxQMpU9JVWeG8CgCQxzEGWKrh4hHvlVqjTqQWMskvhqeQ
	dK9QraEAieOq7yGsAyD2HLq+Rqhgzj6gdAIB85vB794+M7tSLZJ2T4DHoAkBNL6QOHY0=
X-Gm-Gg: AYBFou157JtaE/SgDtc35H96SSPWVPKO9t0vqmTyhmdbivl5r9Hjr/I05iFqZ8o2rAt
	n9EHGtZCmFYnAG7co0DcXhXoWyBBNisROLTOiIbOYDgRBAYVi/Mb1EC2bOQsyLxTeygfsvoix6c
	NHtlNXprIrPI+Xxj6wi9Fkp3gVq6afWV+WFkV6ImGAgPAOX4rP7DQ4mpW4VoFSINE+fXd3W0V0P
	5+pi5U3R1W28IZ2uK+ZPXPM4irTmYlgvbI0WL8FjQX2ICXuNf+RSfXTP4AXCawk13A/XUHKEUVa
	l7EY4XYQt8vuyxOEY5wkhlRwe4IorVTwm3sGS4/4itSp0cgvwOnIG6oXq1zUjiJWNXO3J8ZsES6
	me2ehGoKkMqCFeV4/AIyN1Zk3tigRBKw9SPxEjTR3SyFCev0E8GBRzw0b7Q5v69HR
X-Received: by 2002:a05:6214:19ca:b0:912:db2:8b1b with SMTP id 6a1803df08f44-9142f640517mr195914936d6.9.1790578074866;
        Sun, 27 Sep 2026 23:47:54 -0700 (PDT)
X-Received: by 2002:a05:6214:19ca:b0:912:db2:8b1b with SMTP id 6a1803df08f44-9142f640517mr195914766d6.9.1790578074378;
        Sun, 27 Sep 2026 23:47:54 -0700 (PDT)
Received: from [10.111.171.191] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9143d30b437sm61592196d6.38.2026.09.27.23.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 23:47:53 -0700 (PDT)
Message-ID: <989fbae4-5faa-4731-9cf2-1ea3d8e5e0a3@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 14:47:48 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: i2c: og0ve1b: Add support for OmniVision
 OG0VA1B
To: arthgirard <mailarthurgirard@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260915-og0va1b-v7-0-3a4b6d7360ec@oss.qualcomm.com>
 <20260915-og0va1b-v7-3-3a4b6d7360ec@oss.qualcomm.com>
 <20260928020355.86012-1-mailarthurgirard@gmail.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260928020355.86012-1-mailarthurgirard@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6I2hwcU9xuLW4NHCf_hkNWgk9yzyeQ33
X-Proofpoint-ORIG-GUID: 6I2hwcU9xuLW4NHCf_hkNWgk9yzyeQ33
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXz0EIgPRjC09A
 vEKQhuSADZqJwXsl/oLdJL/KaON12cKuw2RXQnRXIvM6bl8Uc9ZtYsazP6Pv7viX8jzbfbEk+YX
 pk03yRUbDVoKfr7zVSpePcN6FeOhx+4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX8VnqNRKY2r/y
 2aUeEq2fdetAiwva8GawpyFkpqu1SSxNBvUMCXnyy03qHkM0t2Xu4yS1ozy4G4uMD97P2kh5+TU
 RimIQGLLO1prQtb2kBONVz+0esBZCIMtAVc2YWV5nMp/2smmuGr/8LW6txMS80fc6hkyfkoLKhQ
 3JMxIHyiawk8pFWdw9EV08+GpnXJ0yqfjFMxjSkPZtXlM8VK39VDxCyDLixMRQBHTvQyWUZtDUC
 YMV34tsZrXw7CBGXwUB5EOTRCeRVInyojCxg3bvHkvRygHnhCwrKy2aQbgcNv/nEbjfQ0CymRvw
 70tJoF38N/uOTdSRAkBb1AZL0XgKJk+NFcId2hJnv5WKS0HJLjJ980pjYDOeMM9aKyJ3v+FwoA/
 RopmOPdqGRTKzZk6uCSLseJWynZS/GSJpWMM1AXB7SXOf0j1o+TbfnLh9LB47O2FEpMEQi2FOqR
 X8EnUTNDoDl8NfCW3LA==
X-Authority-Analysis: v=2.4 cv=QZfzLcbv c=1 sm=1 tr=0 ts=6aba0d9b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=VgBCoK-8VLnKacG1t_kA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280026

On 9/28/2026 10:03 AM, arthgirard wrote:
> From: Arthur Girard <mailarthurgirard@gmail.com>
> 
> Hi Wenmeng,
> 
> On Tue, Sep 15, 2026 at 02:54:14PM +0800, Wenmeng Liu wrote:
>> Add an og0ve1b_sensor_data entry describing the OG0VA1B together with
> 
> The OG0VA1B is also the IR sensor on some x86 laptops with Intel IPU6.
> I tried this series on an HP Spectre x360 14-eu0xxx (Meteor Lake),
> where the sensor is ACPI device OVTI00AB: 1 lane, 19.2 MHz clock, same
> as your og0va1b_data. On top of v7 applied to 7.2.7 it needed three
> small things to work:
> 
> 1. An ACPI match for OVTI00AB pointing at og0va1b_data.
> 
> 2. An ipu-bridge entry, IPU_SENSOR_CONFIG("OVTI00AB", 1, 480000000),
>     so the IPU6 creates the graph endpoint.
> 
> 3. -EPROBE_DEFER instead of -EINVAL in og0ve1b_check_hwcfg() when
>     fwnode_graph_get_next_endpoint() returns NULL. The driver can probe
>     before ipu-bridge has created the endpoint, and on one boot out of a
>     handful it lost that race and failed for good.
> 
> With those, the 640x480 Y10 mode streams fine through the IPU6 ISYS and
> the images look right. I've been using it for face authentication.
> 
> None of this is needed for your DT use case, so I don't want to hold the
> series up. I can send the three as follow-up patches once it's merged,
> unless you'd rather fold the ACPI match and the deferral into v8.
> 

Hi Arthur,

Thanks for testing this on real hardware, and for tracking down the
probe ordering issue.

All three points are specific to ACPI support, which I can't test
locally. Point 3 isn't reachable on its own either -- the driver only
has an OF match table, so it can't bind to OVTI00AB until point 1 is
in place. That makes 1 and 3 one logical change rather than two.

So I'd prefer to keep the ACPI support as a follow-up after this series
is merged.

Hi Sakari,
is there anything else you would like addressed, or is it OK to apply?


Thanks,
Wenmeng
