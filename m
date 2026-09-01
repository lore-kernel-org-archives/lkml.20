Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E13837EFFF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272045; cv=none; b=NmIwIG4mtJSIV4mBHHHfstxNLkg8+BYeg+SMkhneMGMHb6ImIcH5cLejY0u2AfU1jb5mN7HfXEiCJscSkgvmKZ5NMAXQaDbB0gcodP7bvug4b+OyGDYjSIDj6ceZYcZZnqbYa0cQU0P7bJNNMsI2xR0k/DYNKfzI2yKX3jqD8GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272045; c=relaxed/simple;
	bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dxYry6V3uetU5mCy3FvyCGVHIojTm7on2whahFX+uU4i6XDZyaqKjHvTNNtKodYww6BZh0D+AfZf6+dlTZDeNxuySoQNhV1d2+JtEwLWWcr2fzqFJdSkZIcHQoNvdEMXCx++7WX8yB8CGvtvyqD2IggJdQ6BDMeTHuWQL7Zl9wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JIkhN0Dw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ov/BLwL6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JIkhN0Dw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ov/BLwL6"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8YuP2270330
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=; b=JIkhN0DwXxaGjOpK
	JlyvsTB+Y03yhK6pbIUAVyTVsTwTf5gci/euI+xpKunGRomDhwMLaqJXcZdKgDFW
	W4eqNHwpBkEtEt97tTtwvbBLq+PGqzhSy2GvoVvHgvuLSxe8GxBJ8kYSclE08D+f
	bW4jwSDvNN8TFVmr3xkll5gtDqnJFrJaKP2V+Bb0O68jzrUz00vt+axWoKM2DW9A
	biAHZhgFlOwFHiBirERwdnXKDE4mbmg8brs5jL1kro2O/L2UFy8KbicfXzathsOs
	3Vw3fpjhplHqc1jKTGaTMYxVa8okLRZjlFPE+UZAoJiUmx35f/bMy4iNqejUa2dm
	030/rg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdjtx3mx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:14:03 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so148402e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272042; x=1788876842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=Ov/BLwL6hc7GiDQ+PiwTilz/Vpqt/dV6z9/ozGIxJ+iPmNxVMrzkw3IU1U0wMB6Y+g
         hSMtr7ZNuulovQKcMGLjdhh2U87K1Y1x3xaMFSUvcgOrGKNIjNjQGTyS6zcriirqXKm+
         O1Ct7iVkb+6tks+LjwA2Vo/AhMXCulE2iWqo6UaavtloIrfBxOJvP67jy4ZjLvmktbbR
         Ae/FXDVq1AQID22Emd2uxiPUvzp6Jv7z+gUd5RQ/uDwNKl9s6dvOUEbkrd13SHt0x+u1
         JFCVbM9CgZU0Ybs1NYGFYsxAsUgXPF0Ty43BOSIfz/Tu0jvISBNKmStT5zKFNhZwmuCY
         drWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272042; x=1788876842;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFuhehz5vx1A+pJOU8ZcImxSZYx1uoaHVDtGkUlQ81E=;
        b=seYRkqKCVKZ1/ptmWlV7yA7J4KePo1NOq/vFOUZAFNNUqAqOJI/CZGsNDY5z8+1Xzf
         GumskRWWfd8XW9n7JqRDs8RAl3ZP7swwCiLkcVTxxAoFIrn6+UXYtHcA0j2Z9zoVBvHz
         C+7tbSbFL9eKs1N6Lh6W1FuQeovxqr27O2sCVGmQ0r9BJCjG7qExnMTtLOtbfWmz6ISf
         97n0lH0wBk/pYv2CucL7we1ycmNYQdR2MTxON34tFx43thh6hxGaPD9lLXoxD4ybdlnx
         9QZ2J0QUYJpyrsYdbUM51QmgoXXkCfRwEZTmKbek/keegA0NgjCE0rtGHgoEpLpSNuFQ
         1KpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqa62pSI3gHEF6sBCZXvKDyhTsniPr+HALT4ACH1ogexpVi23zn393ZgHj4zud5kdo6oTUlQxbjubQDEWY=@vger.kernel.org
X-Gm-Message-State: AFuF++lLzQXRiQAXjVogXawk2zm2VWwrEnfpitaVRBek27KQd10W1CRg
	E3NXO8Y9RSHCujnzDC9lOGLfurWdZoAhpFIz0BJKLLJ1cgGzL2WnLAXbQRlRjKqpe438MetUTiX
	mlLqIePe+D89skPCPUm6QXg0rrI+AWnzD8ZWBZb+uFs7XAnnfYr/G+Jv1gRblvBjWagI=
X-Gm-Gg: AR+sD11eN3+EyfZHRWFWzWl1nGFjsq/Z/97sYH+W3MLwWdhORsMjGI2UsTKIsJOOGcU
	qW5RB12mMnZskjFkCg8RVIrHdbOGTdqEw7YfMYAolYzJ/u2QonrbtPCWRBrUYbdMqJvv5MKWY+p
	52+DfOBS4CIBcyiBJNwbtnuH5EXigggHeL/rJQBKHEZenWukHd+MmDHG8MslzQeBazx92gfapbU
	Mbd6Fr30jAz5LkzDNTIyoNq3XEw9pTo2tprAHXqpyjlcU+wc1kzDK+Nx0WqNiGwoTexEMTW36UK
	sGV/cj9II8P/56ru+XeRWo1NbuGh8pd56cW32DusrS6WguvIpnYiOK7zzE8fmR2ukAuuTjxmAsl
	boyzAGpKNfNa6OuwbkaJxeA==
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868044e0c.3.1788272042343;
        Tue, 01 Sep 2026 07:14:02 -0700 (PDT)
X-Received: by 2002:a05:6122:6b15:b0:5bf:73a5:3e05 with SMTP id 71dfb90a1353d-5c681477d5fmr4868034e0c.3.1788272041942;
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm601716666b.28.2026.09.01.07.13.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 07:14:01 -0700 (PDT)
Message-ID: <43a9b8e1-2793-4fcc-b378-6ce09198cf2f@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 16:13:59 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcm6490-fairphone-fp5: Add parent
 supply for regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260901-fp5-regulator-supply-v1-1-189fee0c1dba@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K78S2SWI c=1 sm=1 tr=0 ts=6a96ddab cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9ibpQ1FT5vEG8fXDfu8A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfXzmK5kB1e24o4
 etg70vp+77KeI1fd9+q6t9HBd4HBr788fYE4w9GSlFLJklDLthAqKacwox5myPymXGRkmf6d6F3
 819Hjzj4moJ/TQjwcXiWUcVq/6O3hmU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNSBTYWx0ZWRfX09GFPG5jDBiW
 GfINoi2TeD0mtPf8WrDO1O+6GFHXdhyHVDuLEGSNzLr0ppnRdf8l2P0dYbms05N018yFnwzS/ra
 Fm1jSThLFzArhmCApo2JYhoUVV3Af6MMSZfqD/dl180wQXiSQabWkRrGDEZJD/HlIbqlWNBz8KM
 5pW357cX4Ms+KlKzavyIq3Ed1mym7a95wZo6Csnd1FBykJdwXiONigtFmIvVQQiTyd/5Ihvy/+4
 1WbfrWVoBtU6kQDpDXNIwNLkfze2o2FdNo44fyg0fQtvSBIb9KC3rQHEXzFE4gkLfhyZNNvRuZH
 5T+l1Gnyz7CUsjwLUL+u5kbqD4b0ckT+acd4r45abawiVT/46dWcIIqT62c1yNdBJHxiQjBfNZT
 E9p2DswDgfK0/t7pJ9/P9D6pwzKftXbGbPfiKDk8F6EIaJdFAjf23Bw6OxGpInjR6abrPJfvx5R
 jvfts+M8/e9lyuoBzqg==
X-Proofpoint-GUID: uGhKl5C1yPxpALUxc3r_su5iRMhjIWoI
X-Proofpoint-ORIG-GUID: uGhKl5C1yPxpALUxc3r_su5iRMhjIWoI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010125

On 9/1/26 11:20 AM, Luca Weiss wrote:
> Add the vdd-*-supply properties to the rpmh-regulators nodes, so that
> the parent regulators can be enabled when needed.

FYI the firmware is supposed to handle that unless the board design
has been changed without making changes to that fw..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
