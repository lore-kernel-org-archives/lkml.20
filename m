Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9703750D6
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340975; cv=none; b=NDqjwFHV+6XNIB3NaGoa2tEz8zrqB8DFO9d+tQz2ntxVJiuRP5vAUDlYlAKWjCx6MJ8t4LpZPHknpZrnGadlN7CHVKDBU36zv98JkY6wOyDreFLDsD+G8fJ15CTecgF1EWxxvPnAjgoTHIvWj8U/gkwJWNfxw4X4AVpNMeZPyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340975; c=relaxed/simple;
	bh=JGXgRYjd8yDyKai/4QtwVt/3NsYTXnlmyDcHu9Y+x90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMvcOo9rTJGfxUebb2ag+kQCttxSxmgXy1u6BbnuyDyxhtfZR1qvdc7YHmNHCcYPLPVEqhwpkQeqKSEPBwdEzEGrC1x+6Ok+o/Of6QuVRE+Xg2msuxaVaaFz5uMJsWp6WI/OEU1iggUATRUTXJhkFnwDxni9yn/1NBEsIW2xz0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jtNR+3qJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IS5VqTBL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jtNR+3qJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IS5VqTBL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YVBp289457
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kYLubcSggVH568urXptvuU1LtJ2UBHszAH+bCVk4Uhk=; b=jtNR+3qJEGeBld3g
	yVZDEMLZpkMX0d1+TPWGPWF7xcD2TIv886zKD/Rp+6CF18AzhSfgple9M/Hrukbh
	0W8pp7VSHjMVfLcG0AWPsOYBOu5mp5ojwQoNDbzVOD1h78s1yRGvWvTlYZV0SAD8
	+cgsFBi5Tm2IZLBVNbDrg0RpY+/MVWK7JVMnzNK119b5UKT9QLWcfRbJRs+q+o3l
	P0Xxwk93EMwI2F30UJCmS3ZMfrA7xcdtkeuubrytiM1clGypKQsHQl49+e7kSW+X
	GeerUfBcUU4q1SoLg2E7Vax+ouROYchqVDpnt0VxPNZSp9Lj0Vno6JZY52+px6Bz
	hvKijw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881uk1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:56:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c29d85d0dso6756685a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790340970; x=1790945770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kYLubcSggVH568urXptvuU1LtJ2UBHszAH+bCVk4Uhk=;
        b=IS5VqTBLCwAIFlQ5uTKRyYfqhPh/wF4/iWHLjnYSUpmwb8ckwPShZObiq0qkGwgzlR
         DE+oSnDHfKjXsWWm58yvdDDo/bSP1APW+sNlBUIIv1H7tEkIc+29nvv2ERm9PM47hqls
         MKp0bL22upCrvlLW1590fLLyWBZLX+zx1NBGtJ796lZOMGndYwHuOxKht3okmVo73Oh1
         mNcAmqaC4RXfHRVaS+Nbi38dEL9MzCHtS7jIqlb8WlqlUVPMz6Qiy1vCIUcvOYtPdrC6
         Omg2u38/YSiHgDVpclek4AhWkgaEpW/ixP9d/hf4We2BkIr/+78DKKbeMU9OYpTi1Sx/
         U+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790340970; x=1790945770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYLubcSggVH568urXptvuU1LtJ2UBHszAH+bCVk4Uhk=;
        b=eZUt+G6gzWdyXJr7Yj10rybmdwHXZ21Bk+QsrYbcjYoshbwDEOS46YxXZWVOJ3obU4
         jcFKGHIFHmzDb99c1D8TVlNO7AqudZIhRtZEQeCB0E52vefvJp8CmCNli/JqWMpsDof5
         MJ5jlJ0NJfqSXeIpo/yDDXMM7giUmrbkO66bdgZQw9+gRU0jhpEiMxTww08EDshOZt7K
         IuepeX7RZulBwuk7FcEui86sMu4JxE76jDOkwAxS8L3LZSfLwANty4IujGldTVmS+YXk
         BOEE/oBx66SF6lYXCdCvWnQmlAejjYrXnGPfEx1SJ4hMMABzDBlJEa2MLYrisNOkU3hb
         X3Qw==
X-Forwarded-Encrypted: i=1; AKwUvBwR3SQnUY1jJaNgySjqP7oJhw1A8O0nO/5FMp3d4bwLcEBeIVlPaBmYV1vGrx4Shw6DabMdx1fLMzIH70A=@vger.kernel.org
X-Gm-Message-State: AFuF++nOoTCORIladVHYKrjCjpK2jKxK7CLc0WikxVbpx/IV6Epk0WoS
	6TK36luGIm3xJVr5860c45NuYxrdP17Px6W0a6+kd5ldLsIYLeiC8A7XoTzUtgeaXON3emouz9/
	f4U2Oianv8hsL6AeUiSVHgoi36P0Q3+nxaNgv7P3FmHDkQbz8BXQryigLoAGBdHBm44w=
X-Gm-Gg: AYBFou1sPK90hXpLqeYBCio5Q7Kr+yaD+pneyNvgTRTvf+7HyjYC7T0QIDHp2sjbYL+
	4L2+IYtVOjyTZkp6xyKaGQu1f+M1XJULwGNfFDKsBuc5XCnLU9ngrMPJ4TXDsB7DaMCZlK3Vdya
	1RFZ9ea6gB0b2BZl3+YE2ufjXd1fVii5BlKRmRweIYZyKQQ3bGcdw7cULVCdWBLNCvmTScVd7vX
	5FVvuBKdBDv1xMA7T9GN1K3evsyBSKvFeD/dpJ4RhinRS0h3AX7XscFVdiwF4cVnpj+VHOr0E5G
	a5PA6RJQLPtrfn+072jSqoxe8D8DrA9M1pt3rZtKuKYAGInWMmTA9ZG8UriX8GkYVgpy8cMsQSS
	8xwrz4H5PC39UXn9kPQk4qQ==
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr422142185a.1.1790340969769;
        Fri, 25 Sep 2026 05:56:09 -0700 (PDT)
X-Received: by 2002:a05:620a:370d:b0:93a:14c:329c with SMTP id af79cd13be357-93c43b93796mr422135585a.1.1790340969110;
        Fri, 25 Sep 2026 05:56:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae77feea6sm110852766b.50.2026.09.25.05.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 05:56:08 -0700 (PDT)
Message-ID: <c3a7b4a0-e569-49ac-b18b-c6c63df0777a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:56:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
 <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab66f6a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=amNV6NwrtHp0R1nwlYkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfXwr+IZh8eAkYg
 bVLj6HydttZlPbPBlUVwy9xox+PhVlf/Q9y7zzzqAvSZ0CcxTIq2+ZXPljLWRjcT1oKLHP2wBfr
 auGXnyZJDJpcttu8ji63SNbhLyuwtchaU4RJ7G1PHl6TQnVg16hPbTLMMb6eT7c8OsMO8eHqrWH
 Pna3QwUZEG9/aKYgqW6aOQzYeUZINCOWaZalJoVJ/QaQAS1hdM1S9F3gb5Szh7fei3R+gHJ3CCh
 G43reED0YoeVArDixJSB0MrkHTbnwoYds51ZMD6o60gNO95zWY9XK+LggUJ9VypK5xv4/IRuJ7G
 fBMWcoZuQRgyazuV3yQGplbFXVCfuNzxIKvboZNwRgCxSJ6XjJPJrh9JIweZoJeX5cvIYD3A1mT
 J0H7GBzTkhQmsLgwTobjl75Th9c3fmYFK7yKcJPtRjKa7lay9LRHbyANELuqqJI83AMXe37UOQn
 5RB3hEM2MRI7euJMHvQ==
X-Proofpoint-ORIG-GUID: 6p6f_z5ibeFoHmzkFfpZ0Mrdb6TOhAfI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1MSBTYWx0ZWRfX9gxCBp4oHK2Q
 FzsTqaknWOrnHs2DmxAnwXkEvi7fqebQhgwGUuFOVIgJf0Qu2RlW9KoTNp+4s/wu8/zeZriwsmV
 nybGqYdwkAvQz8W+OX6vmmUKktnkaHk=
X-Proofpoint-GUID: 6p6f_z5ibeFoHmzkFfpZ0Mrdb6TOhAfI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250051

On 9/22/26 5:01 PM, Bartosz Golaszewski wrote:
> From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
> eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
> fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.

[...]

> +	vreg_per_3p3: regulator-per-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_per_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
> +
> +	vreg_hub_1p2: regulator-hub-1p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_hub_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +	};

Please touch up the order


otherwise looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
