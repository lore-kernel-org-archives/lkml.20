Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075394EF139
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790613549; cv=none; b=NgJpuGCyi0W7vGKh96LdA/TCMIvEhZqYcwe/5IhLFhyfX6vtpe6DKVfd8/2Nz3yT9J2+XnISULQpTWClu51IadxGAcH2moL0OacX6VGp/dC7m2EbVUEuCdvvzwjsWzY3oYBG+yQH6H0irXle9V2dJgA/Emn4raZKSNVz+Fu4m8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790613549; c=relaxed/simple;
	bh=1OM0xxmfPlmrzLeXTiGMugRceyJZCw9goaygkV520jw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dV2F/RoRjAq4/zxzd64twSXynh9hicPM8IFbhkEqPvdDJ0S4PNsYBSBukDKIvVsoUEX7HpM046Mxbp/brklv1bXgMW4CAKWS9AK53dWyL7GBZ21Pybwsx7zqaN1artr8gSUVdqOomE1nMcBRIRUBwlQ+q6TA9nY1kmxUYAbatIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kpu1VRu8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYZv7BF6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kpu1VRu8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYZv7BF6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEdu2K1016603
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DUsMfJUwaksHlxsEcq32eVHfkDwBOF+f2hC2dQXfwWY=; b=kpu1VRu8p/NjWQbl
	7pu2zawB1/ZBkYSHAPg1oJ70YsGgnFF42ejSyx3pIjvVq1jV8m3peAyeZEqlckUC
	o/BdpwZ0UEcWWYobFtHcY6FFSqSFqmrLIQCC+YM7kK+4IJOp+bm1p2mDgwUY6ykX
	b1FCcXaBLwKbFlOSTR8C1aJ5NCIPG1e0mb3Mj/qpSoj7jteovf2BNEW1Q9iYPn8K
	0BkkFMe92ZCMwjAAaF9JFGWKTiVUX6MBuw3SlOw1iTL4EjizzrkRY6Zi/vyney7L
	ldd3BOt90BbVagC1owKvQccsZ9lDacZw07mUrmln1CuvyHAkL8Nkm8iskhBhV6Wc
	fyvsNA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq35mt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:39:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78a6d5cc851so391875137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790613545; x=1791218345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DUsMfJUwaksHlxsEcq32eVHfkDwBOF+f2hC2dQXfwWY=;
        b=XYZv7BF6qA961Q7esoMN2BEYDBySkEjaWDQvnQGrdvMKvESiSBWIRwDpfTAXbpZT/P
         4i19S7rD1odG9MxuLbey57iVgKZp0inYsO3lzx/OYSExXsv3hOQ1Lsfoima8ewnZ7VM8
         ym6HVWtb6PKlr5FgwyQBWDZ0/tzciK4M/IFB/+K8ya/IFpmwegiVOg72rz1jaQp0qxa2
         s5C5I8AXRIUfO/agFpdU3UvCXRqt4s30coHyjm+E/qHPJX13/Erku8Q9TvKo0JqDUUar
         mMTOaykvRhhhRLv5+yMmBRiRcs17VJVdHJebggkt9JdWPDnbhmtqyYpz1bsvgyETqMIh
         KmPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790613545; x=1791218345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUsMfJUwaksHlxsEcq32eVHfkDwBOF+f2hC2dQXfwWY=;
        b=CMtZMfIZfQTuwIDFBJ1EY1VYp3JJqSeg4VV5u9H9A2p/qvVH9NkLrv4Mn1/FEFYoT/
         WL+8TbZhBVIKFd7W0+Ji79Ae2+VjQvIPMQUOioiNehryFJX7a0BQMNu0PNRZvojx3dSu
         mwOS5+yygMk/6Fx0hgmM7GnTytnX11wKuhF2SsP/bRX1YVYvfUWeMHkXjXMFHepr4xZG
         9Zi1iQ+r4uEn7Yusq03qvfXad7a2Dp9ZBrFXb79MXpJqRsQSvQuicvheEogAWG147TVj
         NG1lEVvTDbQf7NPu7NdGMBZJvhcuj6aTvsOreZ8rWVyEVuLIH8dyE5J1FNYWs4ffqQne
         erDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzKfodVGpvsszZL6jxRxaJt5FoCMhg7ovPYfQTRCDb1u+8QiIGPVzN7gnXu94y2tzo3nhG8f8MaPTLvkoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJuIfA+GADdWdW6Y57T+hjCh17rGeevxtC9jdfby03myjvNabqz
	nLh1tXLEqUcHa/hf8ycvEazlasw/+zpeoH+lOZ+tB0h3gz967qurFcPi6k94CKKmtTxJY7/PMiu
	olflPO1IEGIUdkl1Agchs5FGkOWmRxNrGN+DHHXYErfGnP0jOopD0mGTCYOyExcTMuXU=
X-Gm-Gg: AYBFou0SbhzNtUdgFnVRDQfzl9qGyxX4JCx5OjTfYxL4UCjn/l3qxgS2grAN3AEHWRb
	/Pia12q+5vk3YBE2gYw4DTXhlA3n64vlazuoccghX+byONL/geo3iUhx6PlmsXPYSjv7LT+Zlhz
	YrhEZjbbxLvZeOwMLLtF7Hkh4mYWSDZAyOvo3QRFStllxdrvjRxP9PromQKvFLl+vjiHwZEVGr5
	68587K3xMF1aynqFzBGxDZOMQ5K01VPf+QjH7awEvBAJMR5gThV7JFEOB1VQPYpZVgumaDpbiSK
	z7bhlcXFBwAgvtXWZDpWNTRaY7RGY2PEagp4WBcHrPTgLaj++SZspAmwT6BPpchhAa9CO/I+3At
	liajCBSJmUwyX/YoP1g==
X-Received: by 2002:a05:6102:4b11:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7af1f6265b5mr3903282137.36.1790613544864;
        Mon, 28 Sep 2026 09:39:04 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7af1f6265b5mr3903273137.36.1790613544417;
        Mon, 28 Sep 2026 09:39:04 -0700 (PDT)
Received: from [192.168.10.46] ([37.167.7.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf869c4sm4848055e9.2.2026.09.28.09.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:39:03 -0700 (PDT)
Message-ID: <65844a7f-62c0-4a68-8034-6f74a43e32e2@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 18:39:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools thermal tmon: Fix signed shift UB in binding
 display
To: liujing <liujing@cmss.chinamobile.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260903082858.5273-1-liujing@cmss.chinamobile.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260903082858.5273-1-liujing@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mb1e9aI3SReKvTxS7TKZLObYIYYG3rco
X-Proofpoint-GUID: mb1e9aI3SReKvTxS7TKZLObYIYYG3rco
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX3IUoHQOZEOKM
 +5pRNSVzs5cwLUGykp7va/I3RMrPHIdvyDjro/qvSIsgUP3e9W6w0OMc3bYviMBMesMjGkrho1M
 OOC9rEAdzfhyBk9CnF4dwe9H6qGYxOE=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba9829 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=K71sKCzDSiMJbZmyObbiAA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=R5C9hjxsAAAA:8 a=zsUnVIdILLzLelk_SzUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA2NiBTYWx0ZWRfX8l3ygV0W0RDc
 e513wm1xkDFIWepsxNCRmfMRvj49Jhx1JKyvxRas5Ejj7f/GRJEH0my9eoZKVd7ZYdvQIEfCRZd
 7RPH7sgn9cAK64ZS739Ki0UFPoVcRWCHKnPIkNFlDhMuaUMtY6Tl6XNWHacdA3wbTwE3bK8CRwE
 uCozQX0JEWDfrX37Y69H6FDxn+Gp5s7xl8RKxd+kUBNyCHsw6Di37SyneN2l+cwQD0ziZG1Pkl0
 ++Rqp2/WuiRhGivSILcJ5E2LkRNhr1pnaNamjpMfGRBcxo+zUFLDnY4lJaRIbyW9YG5YfK+ptSE
 znPiVWGbtLhCNj445dhjIzcxQsZpuoHfmhNCqEgWLOgodYyBXl7ZHhBAiuP3oQA2Zg6k0Tu+LFs
 oa0Rc37DVNCI2ydv413bG2EyX+eeNFf2F8kVrpnjVKUV0PkarlBwOAw9ho6DeMXu3K9rNMOsfRi
 6eGu9cb8XjNFOMJYuRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280066

On 9/3/26 10:28, liujing wrote:
> From: Liu Jing <liujing@cmss.chinamobile.com>
> 
> In the thermal zone binding display loop, the expression `(1 << j)`
> performs a signed integer shift. When j reaches 31, this sets the
> sign bit of a 32-bit signed integer, which is undefined behavior.
> 
> Fix it by using `(1U << j)` to perform an unsigned shift.
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> ---
Applied, thanks
