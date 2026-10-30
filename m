Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364666;
	b=OO77EftrvMhNxD0+JcC6hhc7O8qtioEpin8FK1kD9n3Q6Nx3UXg616J+kzhu7OBjovGX
	 LJOsrmPyL9GzxL8gccr9DHGf1C+K11g1qq/1QGyfetWZ7QKOtETA+ZcADoQOKif2k8m9g
	 522t1WdDX0Q/BEUBP0+aIIzz5vghL8N22TBKlU1X5icmSX9KGnkfDCiMACoAsZJ16uQuU
	 DFnjCZHZyPXB+TJJmI7Zg/0eXVRRz36Sz1Z7xW2TSVkFj2cKIZ+mUqoOEecMEUNXIBHW1
	 mLdZ8CFmVJGxkHd9xeKMnTud4GXRXb5Odn8DmUWu1B4mxy0McFZU1fT/50WphxXNK/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364666;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
	b=b9IlSQW4GVyemv0jzLCRKXP9qO13SElwBHi9mP4U8k0NjCKSJn5RQ6BruwrYVtiun27M
	 ojmynANG0cSxAKktqi4RIpIFytsLIU5nAx1T0z0Pu59zQzsDeK1Yu/ElvitHo6UyiyeZP
	 ixFCsccj5Z3mqlYM93EsUzDPnQXe8jFzW7oQZdEarl55Dvw7CmutdLYrkbNTMi6dqJtcB
	 oimAwzM2HQ5Umrrx0mCNyoAatjhG/xs0kepEHKC8IEoxHvz7JKqGGZDoz86a72OzUzdz+
	 VkAj5LgejnF9qSts+Uo3LCslXZxGB5LMRUFV1RHjHXGjOdZbc2KRxx6cMgmkBskzZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUl0A3x+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSpqk4UO;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E234606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E234606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nUl0A3x+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZSpqk4UO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UBGJ5A3142383
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=; b=nUl0A3x+80g2PDHd
	YSi3RtvkUmndK/cWEi6mFBgVt2+sgpGUi8wxOqJNpJTUl88fXpS8UKnxLqWyzpku
	NF8G4AZ8srlzBAmizvsDxaM0k9KJei0QiZXxZSGtSNJX3ALvHriMIxONoO1NITAo
	dQ+aHcDPMGscUY3jEM8+rqWr7/6Odd5DAyDgJl4eB76MEmu3MnC+xtn7njoBhAem
	c4R3Uy+DKAkAY0DCQSqYsRXc2yHGZvJnQbHv7+bO3F4xf5UL/Mifk+Y/dEgnoslO
	s3gZjhk1sJR/gBhP2znsOGsi32d9AfAQGD3iqUXiW6UXP6k/0O5K7nlWgp3ag/Nh
	MMV1zQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qk29g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:51:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92eebb130dcso14843885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793364665; x=1793969465; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
        b=ZSpqk4UOjmuRfkVfmxjiNernb5Jffau3mWzsjSdi+FoK0168afTXSpU6pFFGmhpbkd
         2/pgz2hV22xzgWo18MCrzgO7Jfp0wqcvHa3bv4Kvr8BNBOSR5aT5cNksXsS5TlOadcNV
         MnpGFdWu2e/uitKA87xJKz/pbx7lfGnpYAKo9PKbEmd+iXjnemL+FvL0qOe4USLkVwoB
         9A3bIjeMU2tDrnma/Tchf+2qg/hdiL8fqGfq2UBbrx6EF6NYFQ9Bp1Di2pI8Wae1L10/
         c8amOZefKKgl+yjZS/Y3FCatYNr3qhdtWWCu7NZ4g1ZMGwFd8pwvwIQESf/H+rkpNNsP
         vy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364665; x=1793969465;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XphpQpFJsEj2QqhW36aSkIT3Y00nbckxn13CU38V6to=;
        b=Nt9UKudKhy/xPRwe2aZmatY2oBzhc4fTuRYN+Gy58hJ56LoLD5+Oqkuw6BmlkChELY
         E2vbR6YjdjiYrRmLGj3Yx0iBjdpSoYGxRXCiGAt8fJ5Wx32cii/zNngcsoMxLRW+LtMb
         3GrE4XLYoUHepzKJzfbmXiVBFHcCAMkP9iGd4z5vZLlmx20GsBid2h+OFgxr93xEhpsk
         cxF3Cv+Gapbm6hT6QRA6dYpqlzPaL+OpO8vRzsSKAQxGumXY3nzdmzKExw4KSYroSzuU
         ufFY7Pkr6h3/rnjePHQZYMy4G20ivrvSrU3U3dHDgtnsacobkFMtMDTeD5Lu0bTeW+3P
         CwWw==
X-Forwarded-Encrypted: i=1; AKwUvBxZwugqj3CJxMVOoIZ/sMTpsvRRN2cp9gNt8oT2icQLoX/1cNUaDpRbphGtcvfZnYUcotJg1hryYqCokII=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWmOWb5xuu5zVXZ5UuI0vfTBTWWif6FqwRMgdVMr3TAnAE5Cex
	cJIOYVFwNVRpVfNNk3g7YZu1G4wSW5rmVHMye2A220CDNLGzR/B3xUMhFQfdEIKtrQm3OWMVCre
	Zjc5iNePjDTDjav0nj15oBC285u3B1QmxRJktIptmJw6Nt9KNsu3dPhWQA1l/zoGV/Rw=
X-Gm-Gg: AYBFou0c/Z79nx5FNLuojhLw5f3iyBVndhcj2rm0V0MEvnwVPc+tpwDMnLrN8lBuaa3
	kCMJct9zvmOGkcoKK9DYWAiQpxcp8NQ8RCMBtdnv+nw6e7qASUuU7NxkAuXZ9faTciv6g8Zmdjy
	Qs5SXfPVOx7Z++cop7Y7xxf+PHvC/jSAv5yoe9ila0S5UQrlaq5ap+IiRc2qydnd0s7/5bjCbdL
	0gwhWTzPEkx3JR8XMpKSKsoqBvSnV+3lvpxfGypESbSIkDmCLEpwOxHdwVM5RdJQMQ+FVizF89Q
	0uVbt9lTEhyq/hUMcdtPykK5tdbWVmuvz4qHRTBcTjvrHKAughkxa2dxMj5dyLr1Gu6LykuyN8i
	A2maa0tAZxBzaJlF+04pviARCkJy+jngdjXKjuO8bjiv2yfQU7/eR+85Z31h2guoy/p24FhA=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr347960785a.4.1793364664897;
        Fri, 30 Oct 2026 05:51:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr347955885a.4.1793364664241;
        Fri, 30 Oct 2026 05:51:04 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe5006dsm60694766b.64.2026.10.30.05.51.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 05:51:03 -0700 (PDT)
Message-ID: <4e578d56-f865-41f7-9189-7ac15f7a835d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 13:51:02 +0100
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
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-nothing-asteroids: Enable IPA
To: Alexander Koskovich <akoskovich@pm.me>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-asteroids-dts-updates-v1-0-79351337d681@pm.me>
 <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-asteroids-dts-updates-v1-4-79351337d681@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RitJiPdjAVvAnC-FC2W3ZOGqC0Bxiiht
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX8loVe/nWj0Pm
 s26iFKoLvXEY44qciXeKHcgGrPk092W+v7i3kypfLt4GU7gWwFcvRV6W3mu9FRWDwOpsETLLs+h
 leslIgK2lJ6NkIthn55M9XCCu/3Cwwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1MSBTYWx0ZWRfX1h/YIpz0q6v3
 kwprKkgfPOgzaZM2VqMJaSKelMHhN9p2vZEf52hGmlTzKuQXy3yPpy0iLpNWloUBVQV32J7GMPp
 VSM6cTpz/xcNiBBS8zz6NOk3hMexneW2z3fP5WP709UISjw6Z1w88kVgGDWdLEbdpqZ/YkiOsOv
 0t2SFQsPetbHf/lk1ioNmrroOBYoAmyLQ+m2oWFPbpbtv90xbicdshrfjJ7CEOEAInyMsK46Ooy
 xfxHjBL0qhR9f9WFaxlNfbTpjBfor6VkeW+7/3D4dmffqcsmjIzDaofU6oHL19k4bx4ATznHTY8
 DRushea30z7XZwBZ5JYX5Oy34j6yxXbIupS2cntAZQxZ9QbmVl63P4W2kzKsdEajRbqw5d2pwbP
 9p5TIWW2hc8n/xxeRCGQx47JMAS7oIVDmOVLqVaDWapb7gPc3/N7ptbC/T7GdGEVZB6hvtZ9aAS
 GSD84Hyt2xL+V9id0aA==
X-Proofpoint-ORIG-GUID: RitJiPdjAVvAnC-FC2W3ZOGqC0Bxiiht
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae492b9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=dMdhFRwUw7ASlwpx6HcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300051

On 10/29/26 11:33 PM, Alexander Koskovich wrote:
> Configure and enable the node for IPA which enables mobile data on this
> device.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
