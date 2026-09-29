Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23A4219E8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790688076; cv=none; b=XyBvfGRwzc0n5QutRyCeNcXlhH5AbgHVtBrYrafd7C4IgC8dsa/6KI0o3fWKQav2GgTgWU5qeaZ1pmqCFsxZKe+8F5rAriGNLp93PBojr8kEc4BHTpZ6zshubeg/bHcb/F9KJgdlOWlUaC31UsVdcDsf7um5yA9YWcY5DLg0pDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790688076; c=relaxed/simple;
	bh=3h/ymNXYlxSl9RL5neHs+6kC8pmPpSHO2JHkaaK92w4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HW+Jejl5wjVbsfQC7b4lr3+tA9kgGoqObL9syzbrQrfprfpUTUNL3deqgYeDp5dQQs8yTaMYc4okZm01hZTEtswo7vBYIvjAsVjprXoYTGB4AYCWXEOcG7EsdJf/y144OF7BHTbTs/NuogQUbXUMNwiHV6LG/J6sqRiN0wS2f1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aL4/0DBD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbOV7l7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aL4/0DBD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbOV7l7A"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqkSu611721
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bv8dV17W/c4BxuznKaxP845l
	r+CLIZxBiDhUC0dcTy0=; b=aL4/0DBD4c385VnMkk/tES3H0IUBRk4V5rB5MLoL
	EUzZnUa8lCvqsND0aFQZrIhv1RirCP3RtfmtafD5Q8tTTGLy0kUT54r5dBTAE2eJ
	pdtG9RvL3YgGTmp6omDtkDFXsUzv7wNj3sWuYlNWzHIUSmslMMQVESuTemyz/EsR
	By95bCbOVQXCisNwUbbG2TWLxBjbWcf7opqCMEZ1JeQ4WBjOKKiDJBzOFgOSWloN
	b8tbmhAmMXoQdktNonpfU6z82pIAKUUcGMVoGx/I/LGZzbwfftxck1jKgijEUmwK
	qhUqTCfSAqCy0qZagDB1KNoUNh5yxeWNjM2w9w2KkSnVFw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u8ec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:21:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso956290485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790688072; x=1791292872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=YbOV7l7ALsC2IOol7M6eprScU9wp12+QCFhnpobuxn1fC7h8ZplDbuA/hO+31jkM2b
         3/yThjKCwmcUf1GW2fTrSEg8Elk4HpKK8f+W7ek7TdrX3nCeuDRZmagHyU+GxnZdj2Q1
         TWXn3DyJdICFeGpfK9ej1wsAqI/iCOQcpwn58Cp08yB1ty0vZQHCYzSeT7Gz/zG9+RY5
         MG3JfCj/mJVjQv8IHAcKs311KLqug305W4SCfgvPapqF3BY0ltDqnfgVtbp/EDu98Zsn
         LTR6yC9ZMOsdt5V00byAQFB400cg9o3VVS/bqPSgoNiSdYkrj0+sSF6qVFxe0KMIjNt2
         z6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790688072; x=1791292872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bv8dV17W/c4BxuznKaxP845lr+CLIZxBiDhUC0dcTy0=;
        b=VdFz0NJZwUAZJ5LkYMp7v2VdCT8ztvOjLYL7Y3AWgobbETDMm2L44s576CUChwj+2D
         AAAx1PJ28BfJT60VMCRqOz2PypQRwpzfNCVhdmf319WfWTl+C30LYof91H0GrP/fltSt
         cHogsKRtwjQ/tpM5lE4H46Tz66cOScCWkIhBYumbd9DDazfO25FWxCSwQzTXtE2qmG09
         QM0lUgy72ZgsiqQboKlqqNa6SJmJmbwNEazVDaUHOgKOQXiQX3EtmGFmc1H+MuIpgK29
         +ug/CxIWdcmCWQP2ssQwxVaMruwg9uXTCC+t5b8Y900QkoLuUP22UlaGdNnh+YnojafY
         3q5A==
X-Forwarded-Encrypted: i=1; AKwUvBzfj0vxyVgC02JLRCnGP1v9qSGQvgs0wuzTTERpJNG79hh7f3HZZfHNTF+vvzCOo+F+/csMjR0J1yMwGjk=@vger.kernel.org
X-Gm-Message-State: AFuF++nfu7xQ386XmxSxwylnquBxP3DGk2kQtJkyXYdgwlRupD8iyi7E
	elMZkvyvZajCKDih/WQRQx6iMff4GFK0cLWuAiBJaVTiPPio2cXY2fkrwFEJzDZ1+02rf2B11x1
	QUSko0nFxra4V2uKQBy2wZCWSkcdDMh4eBtULU4eWZiJV/KqIvkJbRfqI/1nYL9rS1TY=
X-Gm-Gg: AYBFou3sLEhad64a4UZo19ZVayO1xz4bdzXbbDOP7mlV60TuqL+DRiqYCLT6BrJXmfP
	kXXsVoxPzmdoXXm46PsqYMcHIFqjZmmVl0QkCVgu8E6rkD5ljY9Gi5u3BPY7HTjcoGG1bpCc+dP
	j28qHtwjutzcld0Z23/KpDAOUlncMYmMpL34RAaCQOsVadGS3UXvSvmqOVlETClo/MzTpsHjNct
	ktXw9aWRzs3cA5TWyGp5opNjKgcsM1sujEspwVU3zt/OHkiImAhjt9Fo/iBXw90mH+SbexXdFc5
	Nnh6hFDQ+ECeilR5UCUCc3WGstmyQMyvlUVKXCc09HhGKr92BNqf4HqJ3e+leDAOacDDA3V3+re
	MZGhw90nPlinXmAo=
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688510385a.59.1790688071996;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1d08:b0:93b:d7a0:d9e1 with SMTP id af79cd13be357-93c43d42a19mr2688500585a.59.1790688071199;
        Tue, 29 Sep 2026 06:21:11 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm93403535e9.0.2026.09.29.06.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:21:10 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:21:08 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
Message-ID: <2k5k4qouibqyynstutn5ffohlti63cblnatvhwjbo2e5vok3ww@yudt5aofkc5o>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-11-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX0BDYu4dFOUM8
 Wm9Vz2ZK12csSryT1xdQ/Fe+y7voHIc6xRGOlNRSxeG7DD6Wj/JZOGR9oLMg384Zg0T8ccSSXIk
 D79vATnCTtSz+cBHI2tLX5J0rkodUqE=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbbb4a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MyBTYWx0ZWRfX1LaQpeFzkOUs
 jEJyM7eZHpN3CAxB64iJ7/cfzctr77rzZk0yUkLG8/Kg2H+QBPAlbjbAhp2wKE2lqCpnwQ3Jk5Z
 Vt1+rhJbzvAy5dbCdf9F1b/vgOxw+zlVoQCQYtKOGr3ypqv9p1cYxeFjYWUKXTidET1cQq90/Mb
 7pUHMBGwoTu1ls7OKtydwS4o9YPak8piopjYjKSbYiS3T1NYfE4vcFqwlUUlGFDuIp+/9gZAjXZ
 Y/VTMwsz+v5FCkn+SJHOf3W+ZtSprm87m9x5rym2Ob+XSam7qIVaZW9n2D/D5A46H8t1u9Y1+Y3
 0jEUPcSHGHKDEUUK8qBw4WRoralXnV4fvc62Dqw7cc7XquzVcuLES9Sa2PNT1xu4jhqkIDe9+st
 d1BmIpIPf/EmZoVxmnM68pzTuOSQT4ro7N6oGU1GQFBMejY0D+nZdMHd9MMAW9Zn533t7O7nZik
 tZ7lLWTdsGjRi4jA8KQ==
X-Proofpoint-GUID: eDTizxgrVjnk3xa0A9Spx1hr3CMHxZB7
X-Proofpoint-ORIG-GUID: eDTizxgrVjnk3xa0A9Spx1hr3CMHxZB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290053

On 26-09-29 18:39:43, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
