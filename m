Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586781;
	b=CvnEZ0Upc/r8CTKUYAlWf9zqmuHBslzQ0jxnd1NyVCz7FMQDTMXMR6fn1FtZ/AtQawZi
	 JPMBIxYiXRGfROXeRTocNQ3ibC4cnQuR0vQ0O5yvCrsW83qQ9L8rLgOoQh4m4n54YXvCb
	 bll74vtXK97cfmMhoSVLcebzaRAU+fW1zi4xH+9d7hGSCh215+H0mjZieXomAtL0OtWoz
	 pfO/gVzfQyJljB55ZNuIzukhLB/8hZ+Q3kQ2nvXgJQzDCj8MBmWi4AYBoRkviE8xnUk6O
	 5RE+1Y6CkPM8OL2ONHGeJncispN5fga1fRaHZJSK+zAi8goMoLx9vn+FT4bbpuUmNAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586781;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
	b=jdMwsdZLM4muvoS5ofcu3iovO2UvzjZw5LhiljaVkM+lReiLzMxl0PGZoOfTzom2pK3n
	 9fMJArLITFMAUfGW8jexljAGOZZyuuP9wQ+/cqGYnhmd0jLVsHbaDsNXA+qjr4nR2lBow
	 TgL/KOGv7aOC6aEDJ8BQHk7bNbCOM4ETuJ3Jp29CLLNMJ4QcfPpJ0/7ic3Fnk94P3Jurt
	 pFpYY2ENh+nTMNOZkqvs0u6KOpLyLL/c6E8WrneW3x0teuBxfTnSMqRZSPP9GdLRmGypY
	 fSyPbneA7uIhmcUmGDvUw5XG09zCZcx9jR4Gio6RkysjAU9mdguQEfEN9AxjKgruYRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5kZ1bE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNhIOhdU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1EF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 02:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA1EF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5kZ1bE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNhIOhdU
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20KC9h3310327
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 02:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ON33HfWPDSeusn2fBuQTwDOH
	kQdzOEPipmglvQYmFTg=; b=A5kZ1bE9RodCEQBCSQF2L7ee8xvo5K9EKwKOx0ba
	EGTkdB960RyLZXXNsHPwCRfJSbBRfUlkkgXZQUBoDoHQvWnLpQW/obcorIY9T7le
	+zcY0cbbohByBiftlw4GbMm4QNOszsPVI9ml+x4Yv+YvUGkzRoWwowEgeiNwKPjH
	xoZ93fwyPfWMv3ZynDKPHvglyT94OaYeB6sn5APBe+RmKfPbZh8m5gQDZrSua97n
	1PgTbRMZOMnt++4SPuLpaRY/xD1NGmS0/XWf47HsCysFWu7EPfCyiYUe7pi/rnVp
	w/dB/9loTfd8Urrdaa4ZVnMZ4Qb0+R9jv0zuCihRlu4KiQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rvy06-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:32:54 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso3572199c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 18:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586717; x=1794191517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
        b=UNhIOhdUZQ46PJUQtSFVP0QxK4qFPDT7LqEXQAEyJSCzv2GwjUEHa6U7cDW6D3lAbF
         oiewoYprib1LKaHY6KlLd0dXyMqKzQALjIFj+y1lDQGXb8mrcfrWOSbCx/Dh0DgSBADJ
         xCX5CmI7IiaZwfM3NxGZsg7p4qLGEpnSAICwzRWnzBqYzkCRMPS4DUjgR2R9jVLU63Hw
         oTFv8vwGLK6Ds/9KmuP99jxUuvxQ868BTVOmEgT+lS75C5DMyKvS/9xVDgoL8Lc88knj
         +UIKVPHQcNcnqtspzpo70NeXtz9Uvh0N/qqkri14EHHoYVfEyPMpKIwSL9G0TNOynxxg
         JNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586717; x=1794191517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
        b=i0dofF6Zhg8zd+LRz7Edrsfc0admsrB8rv/bi3vT3xfrwdT8Z+HND/TNn48lvWmmLa
         1kePwyfRtTwwKSJK06yZm78xlAEgYUnTwMWCA4Js89ExU/zD51+aAPnLwu5Wk6rbbDzh
         i3VZ18LlE3DJbr+cmdaIZH7bI1ipJoh/5MNGMsWGwWOV07t0WYMQjGa3CN+gSz+UbEAM
         Z70LKFPBo2LElXfgzFnkTr2fWCqq6hO/R8R3xDUM/KK/z2RBkqJKgOY8FehE5s++ULX5
         3fE5xEG1tv0sasq06VhWsnVQa9TXXnstHvM3ZaF+GSrRGED2Xa5ONUyXnsB0r/x3vVac
         9ABA==
X-Forwarded-Encrypted: i=1; AKwUvBwIERzyVF8wmR7kSJ1RH3GCKklDhGwJGWnsCaK5aRobY3wq253AlEv/Om5DjVpxCbTFRc/efWUMbqXLUlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoU+o5ere3cZymuk5F/2N/lI/VObtC8GicGI0JTYi7MxAkki1j
	SltUVhkKpi31jB42GANca4Po3E3SD07Ir8Sp4g/ozXGDLEz+7CX8jxdM6aiUCFmm3jJEfSJIqUz
	XYmJcboA+WOaf+1dFIqZaiouyPoviBhXJgGDXK2BWwZBUgzREOV5nOt0rHrRU90U6p/8=
X-Gm-Gg: AYBFou3AL0zzaySzsg+tziYF+dBlThHwxmG6HBGeElAt5SRHvW4ldrtzPYNoGTvHojR
	2SOiyZEZ6UPgVufgAOL4QtORtYKjVnmWklGi9Xmxh+xzf7PCDgpD2i2VnZSvszETwoH3Fvpbo0S
	oLFNk0Ot9Q7rs1xVHymdcywgWppPEl4bl4+6fT5+5sF5GYvS3RwOhCTWmC6dfA3i8mOPTRORdOn
	5HeDKNBuZKVoeYPUZe/8rcgiUrSN3ZqaVd6FEnE+IZ4sAV6G9Mw653CiKzvmhSLYgB2FcT1OUtV
	5ZKAUAntdARFGR4DN8QN7z9bj3Ekjq11FvhX52CLOfmkUAdUmNWTmGPZjLjK+DypjV4jU51WkXy
	SXqaSNv3hPwtrLattVRT6fzNy36jlM0M5I1GNkICSgvmiQjaa4g5IibMjLGFMJL+7LGZMsOXwgY
	2oGWBNGMZR8QP9Gw==
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10957234c88.9.1793586716869;
        Sun, 01 Nov 2026 18:31:56 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10957199c88.9.1793586716340;
        Sun, 01 Nov 2026 18:31:56 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm26876256c88.12.2026.11.01.18.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:31:55 -0800 (PST)
Date: Mon, 2 Nov 2026 10:31:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <auf2FHHbto8lAf47@QCOM-aGQu4IUr3Y>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
 <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
X-Proofpoint-ORIG-GUID: n2ie10kPsPZcORLL1Ce9VQZFuPu2bvTF
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae7f656 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eYKOoy56NPTa7UcXW_kA:9
 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfXxhKivCFFN29P
 q0Yjhbm6r5pWMqRRYVBMYORhdWhYjv8Kx4ZABspYxlmIK0h/S9Iok2v6Y0fQqwoP1u+R1CwMqh8
 iGyk7to84NpPXxBvBmxOv/QGVeCm2Dk=
X-Proofpoint-GUID: n2ie10kPsPZcORLL1Ce9VQZFuPu2bvTF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX92K7q7b5I9RD
 9agGOt5sumVCWfKpd6fUSF92EFfBVVGSy9uHHj17r/xCO+8U00LNHIMvD447BUeLb9vbe6OxpE1
 oVuhgx0ah4iHvj9ZPEiGd6Qltf1N7pMl79CpGQ5L57bBa6hdPlv05OmLWSPH8+rIqfikeP9u995
 RmCF5MIOKTzXdUJ/Z6SgmleAx9G1HcJgO9mevBSEJqF9xEIlRK4Y7hgzGdzlfvs0lLTDNfqLXTT
 mczEVroWokWL41sPBfUxXRvJDBDVvnuaOTQ5cyjOOIcD+L3++uJiyMv2UvkJubxo58w4e0jrdgy
 ACF7VfpRWXpXERFpxsiSPESKQZHraljwaq5CGkRo0AGjJhq/InzNJn3KtgXJN4XpWe+bJtNP1aa
 uaqtVkWK0w4BCKRe0hhTUNiVVnK7wfc8vU2YhB7GD35ETbS0cLj3uvqYKeoVLbXf5TKVW1nYdrN
 h8gCjfr9c5EOcY6PbLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On Sun, Nov 01, 2026 at 09:28:41PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2026 14:10, Shawn Guo wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > Document the SA8255p SoC and its reference board: sa8255p-ride.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Drop. Binding cannot be tested other than build process.

Ok, will do. I thought dt_binding_check could be part of the test.

Shawn
