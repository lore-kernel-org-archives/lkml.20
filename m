Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751176;
	b=fTuQDOHRzD1eywBxuRz71HzK6kWw5s2nQcIRd/6iBOqjNdDeCPBseznHWBaG0JZL4iAL
	 jHxBs8mkXvqpLw/+PND21+Zihq0g4RgWGzp3IjxYhZJeNDl88RhNsrZuQyz0ZPA3nrVLP
	 1P46r9eI2ZQ8kmPi0uygAfH35ep0WEfuN3M6apXYAej8PkcdRcLXXaAxv/ZpSIG+UEy4K
	 CAmVdbEI8c/SCGUByMNo3eGjDRYgIB7xbK97GzCMUXP6B3I5IZFVe4OCAha8g/tMYUJim
	 dL6rJg8Xyrt7k4zq0yeyDnH2NDeWbIegWdpvEJypsOPu17SU6V3aMJPJ8sGsYEJe1TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
	b=VhvZvW+c7Whn5QCMjjDPeLx2kK5Gqfe17+PxXS8mfFWRTh5lAszs+Siwnfp2IM4V02nz
	 Qc9qvsC11LeMpZzjRB5RPfQyS1d1iWbUREZRjhF2Sp1jOF+z2Yj9gv/lmIiy9ALpvrsRg
	 plAZkr0N2260LDuAvCjA0yFBffMbWSkf5JioHxXEvAY9HR9S9DuRN7X7PHIx0gkmcVIsv
	 PMHI38haG4bmVUQ5RruUY8F3D2JmJgHn4WJ2jv6Vr83Vp3R9acrVk7+FzGkTPGM2XG1F0
	 /CeTdVy0bxVY3pWsdq0rMMvpifq7cqU1heuzDl6eUJdJrUn64rdE9EyHEVefxqpEEgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgBLDPCZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwbdT4rw;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DB5606A326
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12DB5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgBLDPCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwbdT4rw
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUnL1948369
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=; b=QgBLDPCZRKnWFt7R
	GQySepEZHhLJwvp9cpFc1+XalNBUIf+bv6eGjktc3F7///EVijMuSwVuBL1OzQIU
	beDPm6e3dZCXtad1VbQ7ZrjSiwtQKRX7TGDlo4YS+Z39vTRkJOoEue4ztF4To91h
	oNPxy7VHMwdnba8X0SQrWr1nXsUIny61g0Yb5wJta5Te6CVoBLbk1msoBPew4e1c
	NOprPZKQTHaN/t6u4bbUuvmW2zRsl5W78TKWZCifjcLnkybNEp4GPBjUCzhx59tD
	50pMBcgKYPWhJ/wpQvxcyotIspPglT7QnofnPr9nHCyUkdh8ieEGNhBmGjJ9W0m9
	qxJ/Pw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtu7qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c4d46037eso1665576d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751174; x=1793355974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
        b=jwbdT4rwDiC2J6hxTHfvkqUXCsjVoFP157nK197lidnh2FgMeJMDyefrhyFNwwpSOM
         b13u9VC7w8sRHTazYLjNWRbXK02QbI0/9RTXgzvz73wi85bOyqH8NJrZbhS8cDDrt6vj
         mAcdfqlIUspd6e5ySasfAw6dqe4nxksr/uCL2suATiC0/mV8xBsz6Rma/wS5HvRvH5Lu
         p43a01I54kFbeuFUwdE94N3CDEaAqEPHsQXdDp5iFapmOreKisp3vpihc16c3Hif7uSv
         XKm6G0XFVZqzlEHC0soKCHDqOhvzOsDl/PYWHR3wqN/pBFEEhx/hbv2G8JhkXSJhhQL7
         j6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751174; x=1793355974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
        b=tiQhtKxvZRkYn6Rd6OwXKvbxelACCRaM1C4FJp1O5oFHFE5ilHUm0FxvF67f2iq6+9
         cCv73z8JuXv8nt37WQLCaKbWQdjvtI82jIOpf1qxNrq+u4S6KZw5zMTtP/mjQg4frymB
         qQ8C19aBMtXc1CXekfo9omgQTFgUpCUGlFQuMbwojgwzgiad2TQ6WYJG1sA2QrQclA9I
         0q8ILXmf5cBN6F3P1t4qk/T4ZrnZBNnY0Z+gQ53pyJqZVdjnoZ5I/OPlC2BOm2hK2Hvo
         YwnYpta696RHI5xcu037uKME+peHv6LdBkPguZgcH9FGhPV3nTHBnkGyu0jWo1aiX6i+
         n/KQ==
X-Forwarded-Encrypted: i=1; AKwUvBynWejSJP59O4h3jyul/9D+xmHzT37a2DOXk9mfvqvDATnTkvyk6dwVQVsLFxY2958kYG7oIaP+A6gIojU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLXowt2tyeXMaQ4W8LjHeScM2WGKAKy6KboB5phnpz39I76+j0w
	NiSUvsN6CPpaUKMzO6tUpCUguv5t/L4LQygBnjCdsEy7epTqmGTC3KRr2l13sCFGtG641YarSQ7
	xoCiuhi3ZSC4iNmNlPFPQjheMgb9Vw982t4349kK+3hQb+WIZbpVqYq3bm4Yc81Z5W9Q=
X-Gm-Gg: AYBFou2sbLJbomGCA+ltmI0rgiZ+hUPir/EDnB63cLn+gWQtx7aX9oupplpCHxHSZeR
	Qav4YFjmD9V4HZlghWJOQTiiGNyZD0qxeidN4t6yYtb4U62+eVglPhuWFo0e4ZwFIdITfjo4M9m
	U0UGgwzupZArp7PKJUREMF14dfmmiyVj+S04L76j+9YYq/6CvAyuA2G5wk3OIAGOjXwo2Mx654M
	CEgunuroae16YZbHRXULCl20/TO+Or8r113r1j5OEC5k505Vtv53R8GW3AmibD4/66q0YMPp7Xo
	w8Bo1SahGe/OZjgXGTw91A/I+9VqLj5uzggEOxLev3FrT/UHA5orf4rrF0jexeDTphLcjkQSv2e
	eCRM3IB6jgrXU/vd12Ag0Zw==
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr361782885a.5.1792751174345;
        Fri, 23 Oct 2026 03:26:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr361779385a.5.1792751173857;
        Fri, 23 Oct 2026 03:26:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf7164sm85473666b.76.2026.10.23.03.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:26:13 -0700 (PDT)
Message-ID: <2bcea2ae-b79c-4138-98ab-aa401466f9f2@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:26:09 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb3647 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=pYsF8wcMre0XH_84TdcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: nA1cEDns_gviszl-3kIsPw39GwyUBrFk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX4JSJAyB1mqKf
 jjUPFTuDZAhaMUDi/p5YIbvEZ6BczAjxOSTXB30rcEmeQkyhJb7cWrOef4SCbMkLTvOpgVybDJU
 xPzlDLK/bXzSNnniw1vL5C++y/92Nm5CBFjyKyoJSTWq+MbAq+WK3TOnAi+KTdigHQK3ksNEYYD
 UCcigA/TLZsOs0Eytc1mLDCaqabhfCBDlUD7c0q5Bu2fJqOGCm3XJk0DErO2Q5krtCbtZuEBsEi
 cirImhTJkIqAc805QgvUJFn8RU8uk8i/IjNaHQc+vqncIJb0NberY4Ncw9ltsfDNlK6AoNA4bbd
 o1t6Ue9San1irJMfHglfd9VmE61/OmAf9Ne2q34W/7N747bDxKRwoh4k3rr99aIHiA4JbiaNLSX
 i99gbGbs2AgAHUbFneMBxYXZfoNybn0IJ/NKo4xdT0hNo+ACPBMfxt3DaDoG6Uu6XfJDsJg9U7T
 pg5d/y6t5996eq2/72Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX+MoKNynRLpzC
 iMv36y+5xf+Bc1mn0t78CnFCUYku9ZhOi/PpG9uopShh8JGCnWqIiaIcg06r8Aj4f0srt9Y/kdR
 QZRAKK2BLlGJv5Zta7dX0yB3zda0ttQ=
X-Proofpoint-ORIG-GUID: nA1cEDns_gviszl-3kIsPw39GwyUBrFk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

you lost the tags from v1

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
