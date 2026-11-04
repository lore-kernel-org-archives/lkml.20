Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781992;
	b=juWaFj4i6tIr+dX8eWGy2nYTJgD1vUi+M3CSywiA2KilNj3jEGkA4+Zr+CtQ3zyBRB7g
	 cv+TDWXPJNtDN0MXSwOxJWUgbmYc1FxW50CswTHGGbbkOU7In+QFXlsDu1JuPsvVHtSXy
	 +1Ja0mANM8Oq5o2rnqKjn+zNiveuWBTo0wCF72/mN1YAZJCyTEIQ4UkCPna2AX8gH62iX
	 JbZHoJUkeUXUKehLlKW+5joRjoE49l69qzKQChv6fg3F6qH4Rl/3ZykJHx/4j+hEGBjjg
	 8UpEBkCrNXm3OJ6Fqy6rRb8M853b/ZsKh8axyIi0hyGpQPHZsgK0KBc3LYA3GtMa/bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781992;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
	b=T6v3vFqVrkEFrj4pRN+mwy2THum0RNjP+pjM/IL26p025KA5u7g4WM3bQ9eVyyTpT9AM
	 2vexhr+snuaTQP4MhSPNEICLt3QJezDFZdea+VvdBsdaXfjRa/BWUV3tzHGkl8SZKf2Uq
	 OvLy4uLJfcG6gP9TpSZ0CpW8coAhbiJUK04q1J/RsFOi0BXZVu4ralgSvccEzjRm0JmQS
	 aG56xDu8EBN5zR2wmUMlADa7taXCgVN+OREwxIcyznCZYB6ououiO9fk3L/Tdl+kY+WVb
	 ms7lxkaHSSQV8EbqX/pAjA3Zdvde9N6ZGLBMbNV0VksUaIvYNO+LH414+pTAcC9CKyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmLQF2gm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHy8gpuu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AF606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D2AF606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KmLQF2gm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SHy8gpuu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48KeC01849253
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:46:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=; b=KmLQF2gmCqRZyP7D
	W0wtAFgQPucX2w7K+DpNWG7JGPJQYWUZamfyMHf7Zg/9TjmJAJBKvMopsfxD52BF
	KigubdaMNXRZFPI7L3Dg0Sm8J/+BuOQnNv4K9RxXnzESo2+dV637qCTd2DVOm8Mg
	RMIjgcxkSe+g3m6bsAX1IvtYUnO6cMNKviOhtkIQqlynaf2AGRg/TLDvVnYPfB6p
	pAZ3cqZB24qgbUXpSbXDxCNlbrqYLlIoFbICpdS+9nZTU/xh3z2N786YuCVHwqoc
	dgPR+p31yjjUqW/hdZQQBGNSIU/yiIslquwUDFC+p7/tBUWssBpVZ+ivPxzNJJXn
	ycozjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpbhky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:46:30 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so594688a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:46:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793781990; x=1794386790; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
        b=SHy8gpuut0sZahnvSdzw1SMYXQJ1fA2dVO75eN+eEoUjNlE7GCeAkA+gKGe4u4rtc1
         MZtuQofM3pkyFGD+YFtiY0488Sd8RV60NoMUeyt7m3WMyBZRu4CxSXOq5oVWOIzAP3pc
         hZhZLS01AeeBqR0Qd6PBzsw1EKW5xln2QrnlVY1OHr4nOK/xQNOcGPDkkj7mQ+xbWgYl
         wbh9ev7R/QU1Rm0pYb+a4qDXXjG05BIZa7LSx/FJqk7eWLfKDt0dmrjsD2Zl7gQB5Uyn
         ejgh1WLuYaQn6hyGFNwZtxuOT7ngmV9qiIlrELmrwSPiVyZXMy3I9YEgosZwhoy6T4A1
         D8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781990; x=1794386790;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ALd9EXZe9YZwA0IXa6VcEJit4b6zz+q/woGhLln47l4=;
        b=UNE7pEUqUTVxOe8EfTC82n6Mr62f6KLARMKDChTIMMC9sJcJtNQDg1Om7URuEdMQPu
         h9GQwnGZOti6uhBZhyyF6f6+1QShU5516lVU9ItY7lPjCndQQYab3ucDIFFLCuLi+6yD
         whCPpnqsmkpe8Iv0LiKj7pPPP/T7gkbKCmYkjY229SP0TZoLNhNO48mFgZoFywgBo++Z
         EQmaao8BxYwILAPjfgX+lHakN0iSEyAg9tMTUzaaJeR1QLxWiqck34aw9iG2hku2B7JF
         Ux/rrNkzzF8IQWOqrwjS+tnKfAfMssd1lZQKvloc3lRJiAeHWuqkaa/AZvun1g/TdACx
         OV7A==
X-Forwarded-Encrypted: i=1; AKwUvBzKw0xBA/0QnOeewkfYraC0B/lIDsAincojwZRppEAfoqd1LgwMJGE0pmr3LWAzhzC9umSuWpb9htfb3rw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m8Ygy8lkVvhOuW9aSTUf+Q5zdAHju8cT2B0g+JJiZbekRZbma
	q1+0scsSG8+PnSOj/sALD4Oy+aG3EB+rY57xS+mWnybts0SR1Q1Kr37PTkv3ulUlutGggLnNcFd
	F06m2Sz4mBy69Q6kVKeozikHjVjK+h/ruJ2s9bMt40j+Eb3PKp7TzeKYBSaa8G2bFm7k=
X-Gm-Gg: AYBFou1L4MujmJK9q0jzauBkGjiw2N6YKPhkoAXW5sJYOot1lLcyuYPPUID627hsNq7
	V0UyJIl/FAPpLjHaf4YCUrEC3Jn5KsL1UBGxxGy156cab4GmdNQzwEjSdn+PxpdkdQwgaL0Vvwp
	cEzWNBSDU9eXhMzGHGxEROkZaex/aKwkMZspxLWsTYBiFJn/zuxgkGVR3EGmghgsiqcV6whXRMe
	FwGP9aGtD/W0sUUJ7gmFPPAZuY4YY9POFFkeDXAVPsxZTT6jjL2ADAWY0awf07ow/PH4BEAcIIa
	mrCCd4SoNT80QHkjbFHmCRTE2Nqlc8xxixwoG4PSCeAm0xbJpC56pcFafq+VZnG3/xYwDwBujYJ
	pVAHM7PbcK6KMb0spoviuYEyGgxD65hDJnmvj1in/bvvAafL5qiZx6BhryC7skdOcip8wASXExG
	lX5JD+BiMosyd0y3BwcnFqN3rJqZ60ZgImZg==
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr13607855a91.37.1793781989791;
        Wed, 04 Nov 2026 00:46:29 -0800 (PST)
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr13607836a91.37.1793781989166;
        Wed, 04 Nov 2026 00:46:29 -0800 (PST)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0951af0bdsm3130106a91.1.2026.11.04.00.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:46:28 -0800 (PST)
Message-ID: <9d370f12-9e4c-4b80-9d28-ff8085ce3aee@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 16:46:24 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] arm-mpam: Add basic device tree support for
 resctrl
To: Ping Li <leeonion.muyu@gmail.com>, robh@kernel.org, james.morse@arm.com,
        ben.horgan@arm.com, sdonthineni@nvidia.com
Cc: andre.przywara@arm.com, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261104081302.304667-1-leeonion.muyu@gmail.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <20261104081302.304667-1-leeonion.muyu@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX1m/bCrSdW0Tr
 s/0XpbmyuVHmY51svQXUp0UUBeGB0pT2nrYVcCYvaearkDTagqkRoKf842Y+GXZSnRBg45Bumo3
 +c92rWFQbKMFji++zU352KkKkDY3u4DuzI6rUlJ8hLZIAEUPGOP/5tHTkpoIr+HaI9bfQVY/jGM
 oisPzY4g8G9SEz/SgExMCw41qY18g2jLngeqjuMgjmAlY6rw3JBbIR1FBkHL4Xb5uYWOOF0zN3U
 Ph/1KJOtvOWKABAn5HK7uw6GxghIc8CieJHPmL8ID7R6ZXx8LoDGYxrNrX74PPLYEraVZeu94Ew
 47fTfvtvDwnWC/kEzbcBtHzwVO9BCev22DNASfU8JTna3nLYISuXBUbWm9Zvzb0YBPpkULsYsfa
 N7nvikf0bGcuHH3GEkZBpVnUj0J9g3dtrqJGucxYeE9lQaEGx11dkOX2kW7ErmlWQfGyE5ftBFf
 FDJaEJ1A0WWU6lcpYfg==
X-Proofpoint-GUID: gSdpjDMeH251MUakSHMt8MRCoyIMUJFA
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeaf0e6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Nb9Ewb-VQf6xNOhztzAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNCBTYWx0ZWRfX3wG/EGXurSNd
 0ypQ0E+7VNGGHqnvp4CoTVUm483gAtTkztmeHZERbc3AAnJ1TSD8SEldPmumKO3SOTN71H4Yi4T
 m96T4YXHuFPnpr/xfZc89Uv3DbFYAnc=
X-Proofpoint-ORIG-GUID: gSdpjDMeH251MUakSHMt8MRCoyIMUJFA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040034



On 11/4/2026 4:13 PM, Ping Li wrote:
> Hi Yin, Rob,
> 
>> Changes in v4:
>>    - Drop memory controller MSC patch (no concrete platform user).
> 
> We do have a concrete platform user for that patch.
> 
> On our SoC we have implemented an MPAM 1.1 compliant MSC on the DDR
> egress path, which provides system-wide bandwidth QoS. The MSC is
> described in the device tree with the "arm,mpam-memory-controller-msc"
> and "arm,mpam-msc" compatibles, and this patch is what classifies it
> as MPAM_CLASS_MEMORY so that it can be used through resctrl.
> 
> We have verified this on hardware with v3 of this series (patches
> 1-6) on top of a v7.4-rc1 based tree: the memory controller MSC
> probes correctly from DT, resctrl exposes the MB resource backed by
> it, and both bandwidth allocation (MPAMCFG_MBW_MAX) and the MBWU-based
> mbm_total_bytes monitoring work for it.
> 
> So this patch is genuinely useful for us, and we would like to ask
> you to reconsider dropping it. We are happy to help with testing, or
> to provide more details of our DT description if that is useful.
> 

Hi Ping,

Thank you for the feedback — it is great to hear that the memory
controller MSC support has a concrete user and has been verified on
hardware.

Could you share your DT description? That would help us understand
your use case and ensure the binding covers it correctly before we
decide on the next steps.

Thanks,
Yin

> Thanks,
> Ping Li

-- 
Thx and BRs,
Yin

