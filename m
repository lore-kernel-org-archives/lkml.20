Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A122480DED
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792389922; cv=none; b=VvjWE9PROjE1xahYtEInUQykFpMDxUuV979lrwh5MvxzWbJuP+4NmPOAU6PDMsv/dLOkqipuwuRItJOn9xMqUbhUrw7V9M4TavpJuGkqeMFTDHmCCOkukgxPXa74MFeynkj6lfceju8sVKxstC7JzhCRIMWS5rghU8HGkgtkmd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792389922; c=relaxed/simple;
	bh=eVz2kOkeYGqtTtls5Y5pxyYcXl8r5yMKB0Xmf7FiKNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdD0VN+sNJ7Ax6qJlLwpBU+/Kg80l1rwqCT9ILGC3HwNEs1SwOB9N8a+METaWZFjZdAKJAPxoVWxniEbA436U+lIXiEVbC3rHwd0A7dRTpqb/t7f7R8N2ks7IvPYxdK8ozqSiWe/8xuaJ1wmWL8wH3ZhjG1MdyBidrrdX2zPOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRn2PdRK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gU3nyp2O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRn2PdRK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gU3nyp2O"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4j34Z1702763
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tB06UDpEriWVFySp15EJ7VgU
	Kt47g1OZ4M7wqg9CBMc=; b=MRn2PdRKSHF+PI/DJ8Vuoytz4ofplgtn766QFQ4V
	mMipqI1bIovjH5aX8IdO/is0fLqADjKaiMVkTmaL3Yv8kA7jCf31qNaUpzkO3LuH
	tG8h3W9BnayOuCpSwI9nkhtIMpp/bQW3XaHnEL8iT6iZ1XeaLb3PVo3OxZ7MIwdZ
	ARC6hxvNllK0ATcpMWjz4usXc7Mf63R2DPt9nAXPXdeoORBg8WtTODhsTifSDqbS
	5a2FruVl+611AQpBStzo1vquAxt0lyVz2eywYBVukCybhC4NETeFgBsTdVTNoAMQ
	HV5Rjxhrd4OqYdx6yLkWA7UuTNUtP94lbFIRRtvSY/cimg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5w197f0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:05:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3592093eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792389919; x=1792994719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tB06UDpEriWVFySp15EJ7VgUKt47g1OZ4M7wqg9CBMc=;
        b=gU3nyp2Oi3EYabVUfE3iYKrCCMxH7m34Fbt0OSjUk6/1LPc0VQAGdhqUKQRuAvvYr6
         YXj9Vc/dN37M6u3d7XB8ek06NHFj+IjrDiQIjp0hg0IBP5h7XRZQrTSAN7OlCV0KMY+q
         6EIe/8AFeM1QiKIus/2JxFBm5SvaSfssyNmaoo06niDYnVc+w4Szq5j+Mt1nJCEX/uYX
         MDI7oAhK7v0h+k9Y+uaDi8qT7kFBGGiaY+aGo8sN/KXlHnFbtPgo3cjc/lWMwFHya4Bj
         FuQvU5JEe27PejW89jrU6AA5X8w8fZQcw8rpBVJp9BXmwdkDJeG6OwhvbDSe8kKAKAgo
         64hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792389919; x=1792994719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tB06UDpEriWVFySp15EJ7VgUKt47g1OZ4M7wqg9CBMc=;
        b=gDH94nh5FRaFHSMnkGuiICrFoy1yec5+z/VpxF9SDKa8Ur1EhtKHCqnnJNoNqJcv84
         q02Bd3y8VCLjRMVYMvLZM2F0xwW1FdpuLfpv2CGFoWEnIDORCzQMo2SfcIO4DaUMTwiK
         h/6iLYbKd6t/H59SPntWPPoNvticngIVe11ujvosDbZ7D2jLMgJhcMAH9jt6JVWRlFk5
         KmY7dw0pNYIXutWh6XeTNTm9MBdx2WRLoFLWX5RNPFQiEu9XXRjmPWWy4uYNawqG0wdO
         IS5o0hkEWRQy8MVEi4upgfr5qyguaKRkNvFyteik+r0XMWayIMaPuVDG/zKJJaK/oZwn
         gt2w==
X-Forwarded-Encrypted: i=1; AKwUvBzODLt1HYgN1MC6B2L00N0lr90nIJI3HcqL5Xw+OJ2LJiQsja324bYRuOLgxYy5wi2G48Qf9WYgUtL/qUU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvmGPA580HUAPBGJR/NEO8dXqYfw8axz4C4VW+cRjJ4b+mTRWg
	V7hQ1ctfbKpW2jvTF2weUvLDzMxf/7fnLJTiP4cPfd2ibIzaJAZZlVMEuNd7kQsh58KZDdxCNoG
	wwp0qQ73zi8Dz2Py5LfPEWB1x+qb3PixH4XK/ap+FnNxFBhTtTfheg5m5fToGv5cog/A=
X-Gm-Gg: AYBFou3YiPB4IcEjjGEPRqZyugycbj5rPchQhh0vT261ktrnvaYdbATPSGXR1zzdp76
	owntAWGjJpDTKGahx9heYWhuj8Cbq0PcgUTzqMfPjXpRCdHQDwSa1I5ATZEUh2Q0D4EArUqDpxh
	kPOY8Ay+siHz4iKSdAp89VotyN2WCJDDd7Q0jojPIXsJi+D6u2WjY/cI5iBRhIL+e9rUDcAZRdY
	/q4rrpt28dL4Q+2YLipevtm6NThJ8BAYKQG7+h99yZFrei0WEjCMPWE0KHc2bwxnO6tS5MLelyK
	Sye7qbWHafDzFeEcrKpS/PAexkol4YtvgiPgBqGrCn7TT34SdU3lh2j5/uFHUKi19vObG5MpaC7
	o2y7gLP0xMeLowuDFxU8VtyBIMlLk/277FtMHE2u3BQ==
X-Received: by 2002:a05:693c:8353:b0:35e:fd8:3201 with SMTP id 5a478bee46e88-361a136eb6fmr8863445eec.14.1792389918678;
        Sun, 18 Oct 2026 23:05:18 -0700 (PDT)
X-Received: by 2002:a05:693c:8353:b0:35e:fd8:3201 with SMTP id 5a478bee46e88-361a136eb6fmr8863359eec.14.1792389917130;
        Sun, 18 Oct 2026 23:05:17 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360820a79c7sm28638345eec.18.2026.10.18.23.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:05:16 -0700 (PDT)
Date: Mon, 19 Oct 2026 14:05:10 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Dan Carpenter <error27@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: adc: qcom-spmi-adc5-gen3: Allocate unique ADC_TM
 aux device IDs
Message-ID: <atWzFlOgRICAGM-R@QCOM-aGQu4IUr3Y>
References: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008031154.3440632-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX+gxVhHKkQP+Z
 K1awLGUf+WfnQ5LlFMYW9ptIJAlb9ldS+bjma/ziHWVze9/L5hOshvxURTCdzXNDT+kXPE2fio6
 3s7Agrov6FdM77DDk3zTPUtIphUgASo=
X-Authority-Analysis: v=2.4 cv=KuPYSmWN c=1 sm=1 tr=0 ts=6ad5b31f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=sqrxk8c0NW8lVwhiI0QA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAyNCBTYWx0ZWRfX/xscq+NcoLB6
 TamOvR58HS75u/pjpKwgZBQQ8SUpVJQSxFLgHId+1Za3a+JSRV1uT3MCXZvJUPEyuG2jZLpX7tr
 Y3iKXcXucAzgIoOiaMq4uqIiu1HV4EXbj3/8JCVGAdMtuBK22QaPayBUIHcNrzC3Z6hprkck8QS
 E5GF/W+dKAYDqy6V1j/tgpsyKCDb1yzHXdiPcFZ4aLARdzrKtxbGM+OlFrBhuBUZ8vd5F7MsCn7
 XTEgpC609Ubi2npkttK80I45VknYbu9NmDGU6kofz1k5TYpPBbdR7N+nZJwicuoF77orj/mWLg9
 4qiIy7k0kuptugjWYvAUosC7mgxQP39fzg9EDl/XWCQAX+eVYsUhoe69waDuYp3r1R5xqbM0HAs
 fiBUx8uxWirZq7LA1ZW4OgXPRVJjo48LDuxd6Z5Sl2lDar79RDXItiPCoez6bp+/W//1oW/GLaO
 LVFsRnQBTk2khfWbZdQ==
X-Proofpoint-ORIG-GUID: qmS0wM4O9eiC4o6oBME__CYP_Gjyr6hH
X-Proofpoint-GUID: qmS0wM4O9eiC4o6oBME__CYP_Gjyr6hH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190024

On Thu, Oct 08, 2026 at 11:11:54AM +0800, Shawn Guo wrote:
> adc5_gen3_add_aux_tm_device() never sets the auxiliary device id, so
> every ADC5 Gen3 instance with at least one qcom,adc-tm channel tries
> to register the same device name. With ADC_TM channels on more than
> one PMIC, the second instance to probe fails:
> 
>   sysfs: cannot create duplicate filename '/bus/auxiliary/devices/qcom_spmi_adc5_gen3.adc5_tm_gen3.0'
>   ...
>   auxiliary qcom_spmi_adc5_gen3.adc5_tm_gen3.0: adding auxiliary device failed!: -17
>   qcom-spmi-adc5-gen3 c400000.spmi:pmic@8:adc@7200: error -EEXIST: Failed to add auxiliary TM device
> 
> The ADC probe then fails as a whole, so that PMIC loses both its IIO
> channels and its thermal zones. This shows up on Nord, which has
> thermistor channels on two PMAU0102 PMICs.
> 
> Allocate the id from a driver-wide IDA and release it from the
> auxiliary device release callback. The ADC_TM driver matches on the
> device name only, so the instance number does not affect binding.
> 

Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")

> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
