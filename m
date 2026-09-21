Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CA5451991
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789979962; cv=none; b=LvzuJBKRwTsIZdWqHqtabx4IB4yMFuHzl/0HRvf1jeo4hv7gacgUcrlAHfMOS2y89y3JOPx9AHdZO/4puMEYSVWJA2V6wKYrW1VXm/TDWOBMJ0qi6/ntXA6b/Aj+UC4rK7k26m7iwSO1+f0rcY/mUG34Ab9n4MIoxL6T+ovdWdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789979962; c=relaxed/simple;
	bh=XTE0kn2MoO/iNGwudDMabaFjWA+xpSyJN666f3dQZbE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WOpdeYUemkrKPPBAhaomB1YO1nSBLNxwpKp6D9Er2KwpQij8xGNyEc+BDmnC+jpxyJGINhp1XBXCYhVLtFOiAKswow1aMA8dmRjjaAxoEuIpFWquSAiYcBuucbgunrUxz9pzUBlvSxfMQWlNG4rS0WfQowD/V2QV9kppYBgwoDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V7O/avnO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GTAdUcmH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V7O/avnO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GTAdUcmH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79pxr1095978
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=; b=V7O/avnOinz0Bj8m
	MDWMHBuCMNM0qt/ooJDqcxX084KssfcDxzEKco/h2pp46wfYTLsD4AICKc7j7TsQ
	53tQ3LZPEvl0fnqvNPHoHnDv0EXZHmaBofuwt755qsGC2YK5nrjyvVOY7pNXf4xD
	D41z94n4K0fJhkKjl2hUFTygKC94AKfnusJEgsCr8eyynao2o4s/6RtnTUDd9uuj
	8yDs2DBkMOMGCNGZf4YxRw30wuii6YqqVaqWK6anuc21n1irEnLdgg+Jlno/XV9k
	lZZFmWF2q1E8Z5JLmYwih5ULAmAyZnFAnd6nIw2pm9Ar5pGgCGGwr514v08DJ4Qj
	ruLS2w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw0d3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:39:20 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bf3eeb42cso56957285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 01:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789979959; x=1790584759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=;
        b=GTAdUcmHotNiJwur+ijsX+NyMuvJWO2Tot5+0lzYMVuEZunOnigHrMClLT0kON0dUQ
         GW3b0EyUEGZ6wavn4zZcTWc2mThRhdA0K8u9ZQuJl1fbOhXwZM324zml0kmnG27N3YKT
         lXgqVaKjKCTyIDXgZ2szkh1D5ONtbl6ICAtGTlQac59j3z7IklTrFRkE9kfWhODG9Zqx
         lKqtiqMpqLZemJEOy+9V1uavRzZyK7tXjzlA7uovict1YueXDE8W0lgXzSdsyhdpRqj5
         1ehyhP+dZSOTLULj7aICaBBlgk59sv3mLTqmk/AXqi7gI1HpQIE9VY6gdkmueBYxi6bE
         9yZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789979959; x=1790584759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QL8zsf25qI8f6OfYJqvNvrJ7OfAtYEj510v43CBRTMs=;
        b=YMowDl8SwlVDsx7MwjmbBOEihYwF7eQlVJvIaCB1BUDAlUOrammhXGCW9qgP6VnhoQ
         2Vu7sRM7LM/mEOMY33zteZZt5K9KCHbdfI4sYZk6opazIDbSsBaeByRFfUHlM/2FnUCt
         oNjpyIsihEM5CYyH0r5p2Ueox+VV1AFzRJTEAFpO394LiRSzAU1kj3S3Sfi15ytwgO7O
         QNl87yjw1/PgPm/J610foGgenrnM/zYzlt+f0FKcbK2BdTr4JhG1W+R/se2MD+PjgHnS
         E4KI1VHGD5UdZKx2/VxT+O2G/P4xcF+SljnclYVqQ2QDEEkd0yvVXr1YkTCEcu01OEXw
         M6vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMUXci6PIA7ZDV1vVYVHhh1iPP1a7c6ao3gjSKbdG9dOfl3WA6ayUXiz2OrIv3qWrYeDstjbtDObrkOu8=@vger.kernel.org
X-Gm-Message-State: AFuF++km9wKUKUVi6Chgs2yvo24tpS8iGqp+9F654MFYRCG17UUqk/I1
	5OHEvaupcGZB47zkWOtRpSJrCM5+CFmpu3JMFojYegvKSESJlEG/gt2/W1lj21ClgE2wT+B0Gy3
	i7TYbh1KtVBiBK7bImDzDV2AR0/tcsLtWfpGmwJSxbYtY3Px3KFaAHZt8j66/al6+2cA=
X-Gm-Gg: AYBFou1gF7fjHxzqiyTYY+4Pf0SqiOViu2pAqCaxLAplKckfmJdMeR0mKxGUTMWo0Pk
	K1LNAJl8QbBzvCnpxJeAiEQBFyZ2ZjuUa8P+IOg7RcUkWJseKJBppYd2gyIq6bntbzleBrWyOVm
	ROjNmp90oZcRfFrXFfusXHTg4qS06oqHXz/V1AWBCjpybCG9hTJQdU5E17kAZR0piwe1NCm/F+V
	QqHQGwSYZGNvp8a/7x1DvbKO12D+/dmnNO9UoTAHXUqDjCIPROU/zONZIpembIXDLsptStdH4nX
	NPsw1830UX8jFeGhgzaHlXwT5yGepmY6LJL9uPSl1rQNrFhaK5KOIJWVJtKXztQEEoSRUuKv7l5
	+FBZS4nSQxEM/vI9dYp5Trw==
X-Received: by 2002:a05:620a:4592:b0:939:e9a3:3105 with SMTP id af79cd13be357-93bf58b5b11mr914963285a.6.1789979959580;
        Mon, 21 Sep 2026 01:39:19 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:e9a3:3105 with SMTP id af79cd13be357-93bf58b5b11mr914960485a.6.1789979959176;
        Mon, 21 Sep 2026 01:39:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dc582csm3864765a12.16.2026.09.21.01.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 01:39:18 -0700 (PDT)
Message-ID: <d5821380-3006-4eb6-86fd-977d6e17a8bd@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 10:39:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] arm64: dts: qcom: Add t-power-on-us property for PCIe
 root ports
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-t_pwr_on-v1-0-c9eee197d082@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX4h8xSEhLczaq
 VCCyQ4G3vC0BPgVqWiPpu4PJui4B9Dg8j4BRyxKPO8R44RoUjADkA3FBxW8QbF80uSxCnjjtfQh
 UmCKi6OeAlm1zFelFCgSMxJGZzqtDWfL/kSY4D3oRy18VN7jFJRnRtS6GPeDm7Zw5EUNVMETMZR
 7PttC4BrTogbGzD32ReIf9Lr9InVgHtC/VxVwXJr6UyegIl5/hnWfQiiuF1lcxttNOwwPA4SkQF
 tKlXGh356qW4SD+cRqwmZFtmbl6I54gyp3prOv+aznmiKrEGo/jdDRnPRk3nOoe7sXQhMXyF2r0
 pDhQTVxppXU5j1oTpLIw5LpTE3+nU3vX8ksmiT5Zy/wXXDhB6FaCCdrriNPWE2doA8iopaopEGK
 HCEJJru4jm9BvhkXFBhkL42q6SBoPtEzs7jxP94XcnxLQ2toIOfG7um9MSonwmJ46VoLxB02nYZ
 NRlMibxNqbpFyySUlsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEyNCBTYWx0ZWRfX0pBEbsV52LWN
 3FUWQasie5ij+WVemE6jWsJn3ooikhKK++nVaEb43IBgx3SeqgZ+EheJYGyDkJfJFdvXvwHbvZO
 4m1v5FACQ+Z9bbOTV7Y92tfmXWfKR4g=
X-Proofpoint-ORIG-GUID: wt_mT9GekQIoNE5reURbwv7UeyqteIFg
X-Proofpoint-GUID: wt_mT9GekQIoNE5reURbwv7UeyqteIFg
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab0ed38 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=zKUMnf7IFlsw2KSWKZIA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210124

On 9/11/26 8:50 AM, Krishna Chaitanya Chundru wrote:
> The Qualcomm PCIe host controller driver added support for parsing the
> -power-on-us property[1] from each Root Port node and programming it as
> art of host initialization (PCI: qcom: Program T_POWER_ON) [2]. Prior to
> this, T_POWER_ON was expected to be programmed correctly in hardware or
> by the bootloader, but not all targets support this, which can lead to an
> incorrectly calculated LTR_L1.2_THRESHOLD in aspm.c and improper L1.2 exit
> behavior.

This is a good problem description. Does it have observable effects
that could also be mentioned here, beyond perhaps lspci reporting
an odd value?


> This series adds the t-power-on-us = <80>; property to the PCIe root
> port node(s) on the following targets, so the controller programs the
> correct T_POWER_ON value instead of relying on the (currently incorrect)
> hardware default:
> 
> - kodiak
> - lemans
> - monaco
> - hamoa
> - glymur
> - talos
> - sm8750
> - kaanapali

Because you said "currently incorrect", it clearly applies to all of
these platforms. Are other ones that we support in the tree also
affected?

Konrad
