Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220B29D291
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025503; cv=none; b=PjmIpkkZsa+1Tvhc3lRtU1UDWWTkkod6IFK18E/u538SfZgX+uEN8uZ2MV2tqmj2wdWt+Xmh4jgqUqT/iB4/NYk7GoCceb6MUO2bziIQn2RtL/nwYXxHuwpiCIyAXOE5pXdkKub+3bWOqm0VAVbyI2V7AgYOSXat70xGAPgcOO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025503; c=relaxed/simple;
	bh=Zn+Uzhi/j2vF5DFJqXH0N4ZBNMY4utcDCtgBbqStyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjTz4GG7JUtAqcpe63YHqhgXY9nC/8l2lnfxnJZTeFspM744AtQ+RdpVeCMnSubqSwDVJIJidZ7KlT02SanybCj25BQuyNNvbiyChZHIjx4M8kkaMI30ZSzK+cVA/uKHhZa4UXEoiOYjKe4IpCIWPcbQqNDIpJ5IGcY8FExc8fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GTrWvSZg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xz2o43te; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GTrWvSZg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xz2o43te"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A5Gu7B319266
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hklCZ9GNU8o98OBsdb7gZIJS
	dTreZ28T59haFWN6/Ek=; b=GTrWvSZga35TcpEgGTjZgPIOZPuWBXll1tN5hXU1
	6RMcTzL1hgvUNdx3HM57YvdNxe05/eZbxRieJ+g2dNyfFxm+yefUwfCiswhPzmt7
	4RxKYmRBKhaZxhCWH5fQmCuRM5rNGZKPk6ZeJCpjVIimv7PwPgwJS9iArH6CcTjs
	IJWJwXzxD11E7Fe6UYAkfJTE3vuKqWsdIXVll6Pw/vys6FiPy0OBjrMG7quVvO9f
	SrfADFMsti2oaUVv6niG0f3z4ZWDjr8npp2G1pHea+1QbEeSw/Jsa45Z5Yg7Uu8l
	ZdSqvShZ1gl21oRN4DURDaeFST30fGgf4HN5Te5PuFFD7g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyg2n7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:31:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c82fe2ba8aso1411653e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789025500; x=1789630300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hklCZ9GNU8o98OBsdb7gZIJSdTreZ28T59haFWN6/Ek=;
        b=Xz2o43te8tfJvAAGPBEbqDrBU+Lps4DpJ6Yf3fn+ojd+XdKjwclqsRn9uMFHzXISrx
         TZ3VQbDWBZKE0ZhU4OzgiCcBqEml/lkDXCTxZUGUnYFy6smwoxXV/nXCLNk5ZKpWQ+VE
         8vYsdzhQzyyMWarniQXG5bbpk9IWNGZri2x46QGivGHPZAc6OmWjPGyZlQ6vXMHl593U
         +rBaAY+CG13UTn+wId18BIWv/8d96cjfx5II/RXbFqzwQE3kEzwMNxMx+WymY4Q8Z5ej
         BxoURklqyQmIV8LqZ1NxfCgVYNkFir7OXYqmi3TNmo9490MWLi8qDgaPMlVWesz3/99r
         wb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025500; x=1789630300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hklCZ9GNU8o98OBsdb7gZIJSdTreZ28T59haFWN6/Ek=;
        b=ZV/M4cOT0YBNVIJgHH+2sUNC7ziqWK4q0Vd8bDYQUOE/cQG9Bc/DTr8G1iHOqcIePw
         oBXCUJIKCvXJGHd+SnT5bvNVD6knT97+CgBFdT9/mYJ86ir4s9r3JC4C2BRLRrYENRjD
         pLUTZwRA7xCjnI2+++ts4DkyBl8LbfKMIBe/e9fns1N7IY8kqmhAHkfMY7gwi7d3J7yJ
         MwrC93yhESP9tH58v6phWsImmw/TjoiUaM+AV9InV1Vt9mENSTOegF6Sz6ODXSBq95Q/
         CainbTymVO7Y9skfyXvgDuSkrFBensAwTAbF0bwTLNXg7ca0g+C5ia0LbExmf39ZSIcw
         lwyQ==
X-Forwarded-Encrypted: i=1; AKwUvByGqKfHusnBinVI5WyrzQBKfAFU/AviND5TApCPF69QNcwEGoSfMABzMtGpw5cYmPfxsb9Rn1glo/O5+xs=@vger.kernel.org
X-Gm-Message-State: AFuF++kvDS4Urm578Y0rW65kMjmctUqX0Vw0eZnFMmwPvZxZaL4rMocA
	eeiDllEsWWBXymswXM3xB3/hx0pV8BpkXT3WaUhvTE84xTXKzKQDktof3YFXPAh8YnlS2F4hCs7
	RxafLFkPziu1236240VCFPx7A4n01292ayATzgUjYxsGMljZUnjVGj83NrdmI8IFi0qM=
X-Gm-Gg: AYBFou2hd7S7impcFcrQ7L6KUF2IQs3V65RPtKtawZzLTZq3DSsPxePJvWUKf7wS2HE
	LpJNdOW9aDqWCBMjkQsHiqLm+tO+hB2ewoS+wJIYhxy4O2ajksJQjrrrEs8engXGUV/vssEUtfL
	ZBltE4eItUxvh60+XeOIHuKYUcSfvkfLPS4pB5ZXP4MfuC6+qpJph8gSsIFgY4o01yZPybDzteO
	EnBFQM1wX5TFpLX5MxEXmSGgPJRWVO1YP20TJgGau/oFLEJNGGSel/g9z+BkBARczkwPb9OnKn4
	6z8qdCuA9oNEH+PDP6OFUjbAlIhUfVN7HJwEtrB+2bLBbJMfIoUIz9YY6FculRxzSG22iYGFu6Z
	syydKTMi98Mc=
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a500mr158534e0c.7.1789025500382;
        Thu, 10 Sep 2026 00:31:40 -0700 (PDT)
X-Received: by 2002:a05:6122:8f8b:b0:5c2:b01f:e503 with SMTP id 71dfb90a1353d-5c7ed81a500mr158506e0c.7.1789025499938;
        Thu, 10 Sep 2026 00:31:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm56091475e9.13.2026.09.10.00.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:31:38 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:31:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/6] interconnect: qcom: icc-rpm: Program SMD RPM
 auxiliary QoS ports
Message-ID: <6xhje5yh7yqfabg565uhcch3vyyisvn3y6ylhfhocgh4gi6noi@of4g2ekj74pj>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-4-6dc5b5e97626@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=YZYodARf c=1 sm=1 tr=0 ts=6aa25cdd cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=qOZR5Tkgscv2fS1d6PEA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfXwSqSMtydNnzL
 cNovNzxUkvUixm68Nc1YhWhSGBWQBNEfeDAmVcF+WAa3w69A+BTCmYz3N7pQ56Ls1av7N9V+oiE
 7p4m45bSjBhx3prArst20E0k6QS3GNA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA4MCBTYWx0ZWRfX3boykAdh43AW
 552Xtz9FdFK6nBpdf+fC8mZo3aGgRKG+/AggVqWJrLCmY+v/gFuUk8BJeAtJHxC49C+4ge+PcrW
 W11ycZWFk8752MAoOghSt4QnMxZ0iLkhbIur7VA8WYWpmVvObdV20eVfBYxCrtI3FveCHLNkahu
 SPSHEUWxidKlkQIisQ0QMcI9iHWw+mafkbtDgNHatGbLOtR2cxfeFDXhikpu+HGAlosQc57t8hf
 GiNdMhyIUuKJsnJYxRcp8uQERzpqWSghFgWiWi86YElTGHszNn+Kh6I31/kt3S4d9lz4uf4Zj/p
 C/oyovsYDtLG42k7gbb8KvXPCBoJo+KSz+wmCfUrVGGE3kRbIrjuBb6Ny8O6humr+pMiNhya7jX
 mKsR6rJ1HGEilepSF3xMIz6FUaG93SHdW2HGEEZCfJAlOhAKmApgmJXxe0Pmibp29UGgiGeHf8b
 wyGDhOXeUtLo3co1Duw==
X-Proofpoint-GUID: lHAO5gXtVMFoe0dN71GVHJnj5I6s9vhQ
X-Proofpoint-ORIG-GUID: lHAO5gXtVMFoe0dN71GVHJnj5I6s9vhQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100080

On 26-09-09 18:41:57, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some SMD RPM interconnect nodes own two QoS ports. Currently, the code
> only takes care of one, leaving some endpoints partially unconfigured.
> 
> Keep qos_port as the primary port and describe the optional second port
> with aux_qos_port.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
