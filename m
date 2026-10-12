Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C593B14AD
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806496; cv=none; b=neo9g7xWwjlq3Ph//5mdyJNQ8FQ5L9vC7/QrzwYwpHygLWZD5fdvfQGWbEKfLKvi6axhwlxcqvW3OFaarw8uYuai31X0JN04WXzPTGkksWIcLrDnRXY517pJqxJ5zviO3KxW4Om6kGTozA5H8Lyyy0ywE6lwZKkt9b6xwGooNRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806496; c=relaxed/simple;
	bh=Z5sJhmFXLLRBr6ct0ASzImSOYf6PD/pJ035AWH7eKmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=COj7Tlp/FhewTP7+QDcOdtCUw7W8q5rRgApU4Hcahxm/cqJfBpzFCQUpZsfgndNnLvkODhIY+JkuhXwZ8nnVgCYC3l0H6D24WNHQYHFYnsbDDcPkOVbSbS2JkA2b3YOxY5XKadguEsp6N4tEucQNSJQYAt81/Z3ee9xtVrVR738=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IYdVptU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EprVsPee; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IYdVptU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EprVsPee"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC08hS1686255
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IrhbNqEncl4QgLdWY9y6kNoy
	1o0cUezfb3qsSmxywFc=; b=IYdVptU1X3ctYZlug+/fezFcYqfNDBBu52XN8al0
	c9RscLH71bIGCzoDebkynxcyhIXqysLpsNa98hIdbTtK9ja8Aje4NNExG//5Zctd
	4Zq9SdFya5NZex3cpfWW/ame7QTFdJZDrxYrx/wR1JWfQHU8bYOh1sScmj7Gt67Y
	y6NpG8IohRPrauwJmlIyT+RTkrPints9vvDiSbh+F0eHfp2RwmVtvmoVt/hHO2fg
	i4By1JCaJ30kYO1jUwurkICJpNTUNLpU9XX3Sb4RfMkX7OU8gRDlJsfqn+pYbCwp
	gbciaxfsJQMTDAZMUg8ybXS1goVA1RoPpRdUvpAXkOvWYg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wbc0mru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:01:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso133329e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791806494; x=1792411294; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IrhbNqEncl4QgLdWY9y6kNoy1o0cUezfb3qsSmxywFc=;
        b=EprVsPeeNUNnkQ0lb+sN86EtAx8tEQphorN5vZlpx8hiYets4MODErvhgNs9BztLfu
         xGwqGf6/1taTUU0myDJoO8XYfyl7BeJENRJIvoiBTahJkP91ffT4uZ4bmlE/62kkv7Rc
         pPJpqaxRXw4ZPAUKjpuYqF/aZhTeeLw+ZBmrzJq3XXFuY/9cq+IaQmPeUuqO7+ej8uJT
         XHweg5iuGrX9R4ZnvwdsE6slIORByitmElHYAUtCgFpsh4c1XLA0Qc55YqdThzcLjXU0
         mzAtwC/VLIYSxPLti7ZKyqwrJZ68Cp7zkr5hHBUFiOolcHxELdL59wVgUXsKKmtw9Yf9
         E+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791806494; x=1792411294;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrhbNqEncl4QgLdWY9y6kNoy1o0cUezfb3qsSmxywFc=;
        b=SkBPDnJ6WDEaJFmjKIk5YfgNuJrdqTo+QFqdsV1ttYjxPFFU38mQAw8aNvUQ4bsZ2Z
         9RmV7zB+iAys1xhublFTfOTmpeMpzr5fc1LuER+VRCIyOrhGxJpRqUDFPlZ+FHup+F6B
         fXQkvF4HxOeUAT9MQn2jlTrAll0sPBwbW2Jkww0YwtE4pJuuaYjdb45mGtqNhWDIOd+6
         3VttEtQB3uq17DN/2eavvExhKmhhlLMvlqRPUJkYrCs1MMdSPC1358tDDD3LGu0wTAPb
         miALU+frTw6g4sxsOiHEPJx+C91V1LCQJM4JW0dEz4WfKVgFsnuFpBELhrwzWAWUPJfu
         bpsA==
X-Forwarded-Encrypted: i=1; AKwUvByQAVVox9Lxd/tSMTRkqmuue2L3hBqP8FD27cW2iHFKbRhjADHOAcBqJZp1fIoMNsU1N79Bu7uXn4lyMtA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUO87d17leg3OQwCBH+0B0jvbzlklYkvz47rcddXxd6J+Y4gnK
	XfIAI28wvYwqZP0sG4kFuPW2MQx06/H/ww2RgvYCRybxaOY05z0CKjgf61tLDNWc6oQxr0ZkVjZ
	c+PzcqawBTqKycon7w6JDI9KL8T53Y2Po3yNQSJC6TP8ilXYmXLcstS/HckN3DJmAeSI=
X-Gm-Gg: AYBFou2Lyms2hq607zeOCl/RyCtqsRwf7oDlgCTDDbYwhGFSpFmqzHznDx/vIouzLFd
	J63LE/2/6Ibt766VYPeZ+RkjdAsIOenmxZ+8f49aisVYjMGvDxUUmF4/7sIVKrUu29F468iSrs+
	V7lKaRAAYVfVJO+y9w9kqJEuzeuKEQxVvdMhehim9Gh3SP63mbGrvp51T+yFuB33Yq0HECoYzLS
	6aiwOhunQH6G1bEyXbISYqoaWIUZ/WnCgg6Ddk1OGSFiZ040UVw+ijoeZ3eE7bdnHGsN6Cl972U
	+n/OFXQQgdFs8p2kl4IlMe5KcjN1X5pAPXeQPfQiHGxpxbd2CCg9NpeDzqPkw5cbm4O5wMwqBXa
	eGEcfIVn9hCoPTyJPeJt091s0FwONoxKAZD1eC7ffMKKfSCzQhXOBWCdB6gcwMMIWdxssmlxXpG
	CGowqH7z50WnAb
X-Received: by 2002:a05:6122:510:b0:5c9:a60b:e5b9 with SMTP id 71dfb90a1353d-5e91f47b4b9mr2298496e0c.9.1791806493747;
        Mon, 12 Oct 2026 05:01:33 -0700 (PDT)
X-Received: by 2002:a05:6122:510:b0:5c9:a60b:e5b9 with SMTP id 71dfb90a1353d-5e91f47b4b9mr2298466e0c.9.1791806493076;
        Mon, 12 Oct 2026 05:01:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddeb5604sm2853885e87.63.2026.10.12.05.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:01:31 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:01:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Monish Chunara <quic_mchunara@quicinc.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Sayali Lokhande <sayalil@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: talos: Add Talos Lyra EVK SoM
 platform
Message-ID: <7sumgith3zgt3yhkv7ztlxwv4obowr6ed3vxshfg2ineiiakjd@n6a4gvnvksng>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
 <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-2-dcc9316ebb59@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfXxGGjEWionUJ8
 EC0OhAZIxRe0fpCjXJ52jrodiRYWEpuGi/yjCbHq2diX7vtUGJxgq0HeS3EM02jIrF/yMmZ9I54
 5CvX4ZzCWmsIvqf4dTDD87XtlO3mXfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0NyBTYWx0ZWRfX9qHu0gcYnWq9
 6ITtMscQ3wKSlr2KbVZldKmKSW2PZQ4kE/QIQgs46sNXCZEMpM7bt8islA/hToNeH8ezIZUmL59
 VRQvBUDBh5H4FHn4x7qYEMlduvL4ycwFMkrMhWFbSiWSyBEpSQACTCr3jhKidIfOw9mwlv5QyyZ
 eI5Oa02k1B8//QJW65CtdRk3OGiK4wAxccR4QtTdsXssLHY8rmDKDy4UccbPGJoacx+BcsSI82/
 df097kNfRzSIC22W+uBa+g9IFnAJd16wVXIHnueijSwb2TEp0S3ULpbm/v2pMFwcYm1OmPwRvEV
 3WeNqKbc0SO48FmYNrGkI6g2tLbE5G93puz3nbJvgDxWGpZoZ7I8U5rOHtP3lUnsLQP1twOxdYY
 eUoYSQWJV5RLd9+QlfPIBs5SAZCW+Y+UM61u5FZR5WMl61adTOfkf96qqzYnFA12JCaLnDdy3yj
 h39m4rJLOuApBpJgS5Q==
X-Authority-Analysis: v=2.4 cv=C4p8WgP+ c=1 sm=1 tr=0 ts=6acccc1e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=AFMKbBOjxLGfIDlROosA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: hbUfHtnC6dvbwlVJbrtuaDLRd3VHwyUI
X-Proofpoint-GUID: hbUfHtnC6dvbwlVJbrtuaDLRd3VHwyUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120047

On Mon, Oct 12, 2026 at 11:46:27AM +0530, Ruchira Revdekar wrote:
> From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
> 
> Introduce the device tree for the QCS615-based Talos Lyra EVK SoM.
> Lyra EVK SoM is a compact compute module integrating the QCS615 SoC,
> PMIC, and essential connectivity, designed to mount on carrier boards.
> 
> The initial SoM device tree includes basic support for:
> 
> - CPU and memory
> - PMIC and board-level regulators
> - UFS and SD card storage
> - QUPv3 (I2C/SPI/UART) instances
> - ADSP/CDSP remoteprocs
> - GPU
> 

-- 
With best wishes
Dmitry
