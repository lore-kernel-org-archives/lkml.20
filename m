Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D40B488231
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062113; cv=none; b=Yc01jA61lynwZnHstk7MUWtq2ZR+/scHu7LBBIA/X2ldbetoVvGcqAruGlyVH1Glrn3ZsO7W58eRiWKn/2zJrE4IXtzsORCLrvGtaJ3obnIz7K/77ecVGR4Guxhtk2ApI1XptYBXD3wh2ss/T3tdg/mCLaVx+1DvdxPUF7CiY7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062113; c=relaxed/simple;
	bh=YZHvAvN59dgFZAlMz5AbtDARiD9t1W2atA1nr6unSmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hMU28G7rL+/UE2JVJoFKgIIAyCSLFkBrPbCk57Spizv0eTqB+KpdiwSg/LRdGaMyE0REyw59m0832AOEfSFqHSwmLn8guAdaMn6tiIDG5LsnMY0TEyJbsjnkF4djunPL3LnUQg9cPWpf3S/E2h9xvV5izJsod1nyo+5DJKrRAuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inF0ZugA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXKmC3Kk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inF0ZugA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXKmC3Kk"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9johZ3408864
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=; b=inF0ZugABga5RGmA
	b4Qmke4FwoUfC+XVIxjurdcCzGSwf7QhxL/3X/Ioly/djFzk0nhIQHb4Vul+Bzr9
	oKIyB85mItCzTHLhoc51NT2JpOe6U4FnVWnscSY11P3JrVqryr6SUd1TPFmCV3LI
	NAywbpMr2Y9Yi/pkxRtj09QDipYT9qmeuxdLItPklwLAGEkZhBHddg3OSxsUE1Cc
	A5gIOd9mVNx33EY0dBBx49uzOsg5Jj9Upbtm5U/Mpr5NwZZnoEreL3sTXEsO+eZ8
	OC0B9fMOnSPZN+WxRmddZxYMglydLK3pBW6PcKQTja9aQCNZOnyxP3E1/mzzTr6y
	8GPRVQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn2dg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:01:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5d44237e2faso265366e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792062111; x=1792666911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=;
        b=fXKmC3Kk7+o13rEhMm3Ht8hEiMNWcyACT4kMF3xmqH0PtcgfDrOpjXDhPiZjff8MjX
         d8dnuT/U9WeGEKCxDRgngOIp2R+5IxId5/MWPtpYlcCSlPXhPCbcMncP6wYVfVpylGhB
         aB4xlku/Kf3gS3pZSX14j3G46oBXCWZp+4XcubegOrdKRR770Ac+WVkhRO7eIWFmiGtx
         I509O2Gwyc67CUoLf7u4GRR9GLc6xzXz53vadl3y8Dy8dTIrtHOEJpN9VMDQnKYMzrrW
         r4cwZwbTwHXuZuQ3+LAmE4RrzPdw1NZ6Cs0GuGvaW5gne87GfOBj4tlJbA4HIodg8Bjh
         EeQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062111; x=1792666911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27RadkhSngOPN3cixnSOE+ldf4UCtEE46PlRVZAmFzY=;
        b=lWhwQJgfUk5CH3irp8/6ayQ4kutMScdIRI//EuNNTt/8BERN2NbgxXrikymslLXDDt
         bbmc83/fGmYwYis42Gr4kiAuYOgDJ5BJWVZPsLlBJrKwo63KSCLuUP8PX3alUI264cVI
         3JBk3RzipNBOD0HKkqmBdprDlYsevoJIkJ1w7YWLyxj4Idp59NUdF2RLLpwOVv3OEQ+p
         5VgwXaEqzZ/Hh3QalLMkt783RQ2Dwc8M7qvrkHuTQ2RJpdhzwyY/W2IwwmWoZBbgdSeN
         QLgzJ8Stvl4CK2ZtGrkROl4IXQ/TaCId4WJCg8iyUqctayM0qAyQ5SkXfVuVZBAyWgXS
         9OUg==
X-Gm-Message-State: AFq9FYK0pIVBuvyln/7LTKdL5jWeXAsTwiYaFMz+aoWMG+KyMBwMAp2M
	C72aRXwERXT7qLIWHRSWYyAVmh0cBqeFvhrAjr4pHvz+p2b32GtYdPaoNnoFaHkyoXHAmYzVeVm
	s9oxQt0Ea8w7q0/uYINsmA6UHx3FuXqli6+Bdsd590U03AZYmYQdNpaDeoLxWJN5uTzA=
X-Gm-Gg: AYBFou2/MTf17J44aq5WT9EbB0Ji88Yt6J4RKWJ/RSdJ03DSXPGiJX0CjQxLYFtjKnJ
	I/kV4NuRyox8cCTVvf4zJVB1Cwc1/91yXop5Er/lFsHg/rZIe8UeuQ48oc3euIzeyDyGf+loxjN
	pFN0ip6i38/d1J2Nik8rb7D0XHBF3Ar+aHJfUFs7EzzidaFIEjEhXe8UVkKwSQSGu6egVxmql7d
	xGVJEqHVg/L9DeEIefzjtG/f9gNV3ow+DxAbXgjTtZMDatztDP87N7ZGxBEcjuE9WKxQ702CH99
	2hcQBH1kMi46GmiCtzBtfvOj74NWW4X4k5OOvnXdfudniyFY59Xos1tKqNhj6C/cAvw8fgM9cXh
	1Vs28Vxv7VYOEC1n/HWLiHg==
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1758683e0c.2.1792062110390;
        Thu, 15 Oct 2026 04:01:50 -0700 (PDT)
X-Received: by 2002:a05:6122:6857:10b0:5e9:6763:368a with SMTP id 71dfb90a1353d-5e9676339a6mr1758621e0c.2.1792062109804;
        Thu, 15 Oct 2026 04:01:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3f8557c767sm45945766b.50.2026.10.15.04.01.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 04:01:48 -0700 (PDT)
Message-ID: <b422b3c2-ea11-4ee2-b3ac-9e58f486ccd4@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] arm64: dts: qcom: sm6350-lena: Enable PMK8350
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-8-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXyGqi95pDag04
 R6WB9aPcu733+6NBJcB4Hn0L/KuECIN8JSMGCgaJq2v3N9ZwMQoaPW/uXO8PR8Ku9UOAYKXRb0y
 pG0IOlCDNrVxg/hid1flXsRHiAR/gCp0jMqHqSCiMFrElY9JiK0pB0tKGiJ4jNUQm5K+UUG/qee
 a1nVzQxBBsasbBKoru7Zrh7oZsCL/1oXz16hQcOz56UCyMgjJasJXXGUj9NYE6bJo9clMHo61wZ
 JuJdNkE3lCE/D1Pv1ywRImRlkatpfORIitm/FukDMmJgVPWdysMAs5xiqR1Ap/nJsFLbTS4aEmx
 J86L189p1YFQWat6Ya8ndIPxQhwWQ/AUgtVvIjZZq2s1lVCL7DklrfgzPoywR92ihG3wK6sLsqH
 YpNGbBf6cmemI0rIoteJ7jP6Lny15FS7+3R/GDh87t4jSibBwMTgbk4iZt/KAJjh8gAvraZ7Tcu
 WxeyMXJEeZxp4vTjnIQ==
X-Proofpoint-GUID: Zf-hzf_8IVO0Wbq8KhhJOHeE0K6Suq8f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX2sq4wgfUNRyT
 yGw2oqw4LiBWT0pW1A8rFBWSbB/O8YkesBj1uB/5t/71MZKGJrx51wa52JiXjOwQ5RezmAyKb2q
 LEsJRu+1sa0oOn3vlHBPLWmQu4IJeDE=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0b29f cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=JHwpSSwbIGnF5Ym6y0QA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-ORIG-GUID: Zf-hzf_8IVO0Wbq8KhhJOHeE0K6Suq8f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Configure and enable nodes for PMK8350 on the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
