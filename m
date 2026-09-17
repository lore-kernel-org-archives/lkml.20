Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A97E4E73DB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658178; cv=none; b=I1MG4+w6wqV7aGswj+eWaQwX78aIT/2ZJ9l7yaOzhcIDgQP14QQalH6KYFcP6l9oJIoQSNM8qDJOZEVWM6qVgVfAuPTG0PSKsj9qXhJ3dC285ig1tfrXlLli00Nf13OX5LFAxV3mDbiPc+vZDwZnsTxUh/O1v8dgJPe6xCCESHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658178; c=relaxed/simple;
	bh=lrvkzk4ljiq6+vQAa6UbqIX0W8hWaThfBZW4ANi6ELw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pdx01DHPak/26qcFbDLbT6wC+Dg7SfRQtbQ4l2spkaIPoD5PSbOYjhFGN4zzq3zw/dfMMfTF9UHeMAdLKua/TGa6mcfSnqzBmNTHeCIfJPE+n+fEeTRLQ+XGWaAHug8+h+fKM5LAZK30MYqeH7po8qWFXwlBzWAQUvopewRgT8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GzC2/7Bj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MdgRzXOt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GzC2/7Bj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MdgRzXOt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj0eP1137938
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tvI67hzw9WhPRXd+QjB4vXvb
	G5CPBUup1u653u70yoM=; b=GzC2/7BjkMlj/U+Awl/JTson5NlBOsyyZjnrhsQL
	xdkRSixPLGnvOw6XAcBg/qKpIQCSys6rmDaY3ZSJmA/KzllzpD89LdI76cDgftVn
	Nac7tGyUKw/3t813ghO6THmxue2jm0FuW1wcDlmGcP/AwAlhfULzH29wsv/h+peG
	Y3QQZXtRT0BHlfSRPE1rtvDfCFqfrWo0RWSDYafB/FZ3SDi+sD6MNQPTY3Qqa1D2
	7E3EnJuq0vGQnv0twG3DJ7O2NNR4xD0d1hpWClchHz9dxPIo/YpRrB7gmrlFJfAZ
	wwzPb1oW3Bzxu8Ya2uc55OZ5IK9QW5LGdJTNU/Btc1P5oA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr8uw2ty7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:16:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53124d6a362so32036771cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658164; x=1790262964; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvI67hzw9WhPRXd+QjB4vXvbG5CPBUup1u653u70yoM=;
        b=MdgRzXOtEycaUdaWorHg2PRaYop/Jwe7sVpxm9MdDyaeyypWFlGP8rfOJsKkPyFkPH
         r16VoFoB3A0DJid6aX2PNJxu9cWaDdfNek0aK+Iin8kMDfWnhqa4SSNhsgZlCCyqpCQc
         yxler/a7vAcwBLOsfKC+fJsGhesPOxVqd3w9ZEKW8Je+2myBxsdxFSfhof2eSNvwPxQI
         2VAflBMbD5N6bIYZlGAVLi+kK/neIJWOXnT0CgZrPWH+0zuO0fbbhHlROBNvsJO/w9Px
         +NmSMclcQGqCGwJTC0qoZ4N4U6MfjSg6u/fyUZz3KY66R8FnNE4QIsFbBb3UTfs3Hm0v
         ZZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658164; x=1790262964;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvI67hzw9WhPRXd+QjB4vXvbG5CPBUup1u653u70yoM=;
        b=Zf+wyQ8ItrpTBEfRJW2SL63zKD03wD6A9oEb9tEUnwZkjjG1Lk9njsIKAA2rSy/6kP
         bExQ2xE1LC2BjWlc8Iecp60eUcYg6ivHlVAoJhpLRe38USGzVweakNDlEWRuzsqrjh1N
         gzTaJMM0wxsSKapfleZbpw02poISpTchSYeGGXjyIBY8js/AlSLcq/Ap6jbmrsueNhzs
         ygAiqG9ZEOlfrRO294OWqbexlqE4xZUHSSkePFPRhdEqjf2qDsxdhBqqBpln1k7+xNIi
         NsEKIo5WnXg3O5/tAIFD1StkrEAsL0cbyvWgSwqQWcMAgHViFD6fRGF65Iizd3pogGUf
         2x6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw7pP6UEEIn2Up8Z8yaFehMUcU1RahZpp/nxzWZ9uwGcEcZkFQj3GAV+3hTAF1bzBkUSjc8gkQ/wt7RG58=@vger.kernel.org
X-Gm-Message-State: AFuF++mBcwlmL1KVcjyESYUgU4CRYn/aDPto6CGNLumS4XPC8uemzJw6
	dyyfc86XKTO3RIjFH2PTzfIXs6iI3DowgpMHbzWMBBa5hEyZcD+QcQ4bK49L5bVmARVZqPZHMSq
	b1jJC3/oK9UhAT4/y/i8rpYCEpzTA+VC3LlK3rbxzcJ59yOta4GqdMXke2bSgXlMTA2M=
X-Gm-Gg: AYBFou30oxFuY+hq7enL02RoP/Eo8HvO3gRCvnMusQjBTe4PMqC8qCD6Nk9SjRbexs6
	rMDqUXz9rnn+0zvVxd6bRyvH3k1WuX/gbXxr14CammydY81n7VXd1SfCIOclU/Hdi34TDZJoHaa
	tWYB0hSp15gCk0zh2wxYVBQuXtVjcdCF4fAkiJ+Tf1IkXrdpqW0QesYqc8/+sjKI1VhkQ2Hotoc
	d4G5YvRi6GzgWQeUS+lttAJvonR4cX766g8WrtbNEtQEhOwecqaWvNIQnmih2Odv4ZqsSucBRfm
	pjJEHLhY9jz4hhSjmvgvKXp8YjbOCMtR4kqeWKyY/0xAMaCsEWHKtKLArDcSUawoYEnp1l6HyM2
	UwgOBWD+ZPAbE2X0=
X-Received: by 2002:a05:6214:19c3:b0:90e:9229:3dee with SMTP id 6a1803df08f44-9123d71d18emr133494286d6.1.1789658164182;
        Thu, 17 Sep 2026 08:16:04 -0700 (PDT)
X-Received: by 2002:a05:6214:19c3:b0:90e:9229:3dee with SMTP id 6a1803df08f44-9123d71d18emr133488056d6.1.1789658158895;
        Thu, 17 Sep 2026 08:15:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7659sm17152679f8f.3.2026.09.17.08.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:15:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:15:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and
 GPIOs to root port node
Message-ID: <qsnfyxmqun5ffob6g7dtfi5babmafisdzuxig7o622i3egrq5m@qf2zu7iabstp>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Q1UDGIRc6xohHH4WJO997OR-Mi9qxuqf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfXxxrAte3psgM7
 TwCfW5DzCFKKovxdEUhpDWkNmfGmlPXKLDjE5yAalbavH+PnbI24+OxjdS1F+fItpOCJVHgFpgR
 +6QZE+wsoEyxwytodGbnuFzGiAu2uMLUYhqh6L1AjVj67Vsow/tOsr3DI+lWyZun8K4pfKlf5f5
 MPmAV4Gm3frFmCZM2UGQV0R4ObT5g1jsEzU7bYpTPnw1rWQM5GnOr3+Asj7Rj1KccEzEUo/6f9K
 l2+B+8sby686LZENZmix/vL9vGrbAnQQtZ+pxhDDVfJdvHVVlm2xruCdvNWIBAmWfKZVgSbSIzU
 zDA9QNNilp8+eG59xuUrbukqyCHOS875d/O6x1kR60x5Sl22D1seqqpkfrqvGiIpSKvUtgsiHCw
 4bAAgcwdarpaHcVxVKtHnobd68KKkVY9VS8oCK8dZzcPPttxZhd1azvdUS7Mk2WACCXnp5zQgZZ
 4F5PwsMeSJOsAs25z9w==
X-Proofpoint-GUID: Q1UDGIRc6xohHH4WJO997OR-Mi9qxuqf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxNiBTYWx0ZWRfX43yAuGflFdq1
 ehZqv8rVrmYBcxrJekKejeMel0jJp7Fz5Vx4ERbCEFs2/ObEHx4Yj3e1Z9QEkhUoxw+Y7+TCQHQ
 jcD7fIjjfimkfWeWiLgK5xb1c4Ku4lQ=
X-Authority-Analysis: v=2.4 cv=dMUzC+Zb c=1 sm=1 tr=0 ts=6aac0435 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=adJbRHicXYsKkr84VsUA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170216

On 26-09-17 17:55:28, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcieport0 and
> pcieport1. Add the missing pcieport1 label to the pcie1 root port
> node to allow board-level overrides. Move perst-gpios/wake-gpios from
> the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
> &pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
