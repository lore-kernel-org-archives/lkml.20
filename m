Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D69D4A5C2C
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791967116; cv=none; b=dn56MJVEmdgODiGa9brtcT8/3ZVAg4vqRYsK0e+J7lZ5OkDYyM4QnHirsSMT3+L4/01IQC7WtvFfEbJU7SrkXRAAUW+KgxPoAmSuedx7x+yCe//N+++sRw4lY92PySI9/qkBCY3o8lFhtohM8yu1IF8JNGa+EScf4bN3Hw/TOfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791967116; c=relaxed/simple;
	bh=vFkUvNtpdQcabmgAkroImBy/gEE75d6PH35V9Ktd4aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/wUR7i22H/XuMi5vHX/yRkQc4YfvkK2ni8Mf5AR32btRDFScInOYuGUVAZBaayifaHMmYIx2gY1C/SZJL2wfyUyOAW4rdRhoBc6FjwYEFRNT/Lp8y5qCpd+gBQWgJIPW2hTFCA3UeuA6I/aUjQn3SDpysGRkU0Tb2FwBAGhr20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouDeDj3B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gdh5/PJX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouDeDj3B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gdh5/PJX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E5x41g3952148
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qd7vTo+EqGkYJvBcWwrHERRc
	H3xIdn95LuV1P6oCFuY=; b=ouDeDj3BW84QlyjGtamLIrXioL4/bWrdkzLfeWgc
	rHXtLz83CvQwVcoSe7CcGcCLoeIrAUpHyiL+Js8RRmGVpZWgGzymRUHkhZQNrfyA
	cYdlRf+NZGqnQLwI8Lw7St4/Lx9R89TkO47RMLnlWcRxuNwwD2nkUtChE+juRuNs
	B19LnKLGJnu2fWQYMRxPYfgvMGI1FQvGEJa2zT9fh2LW36fhSyO65AXAAKP12axJ
	DytlBUx4SBeGN042W9HxvrqPlrtkqd5A5mjWGoqvBfQxl5YvQJ/piRpBFteM8JF5
	FDfk+ZkjKKkCYhdjDRO6CYWG4T6WpJBbuI87wHYodBcNWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha42p0mn4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:38:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cb7f9bb86so775998485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 01:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791967113; x=1792571913; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qd7vTo+EqGkYJvBcWwrHERRcH3xIdn95LuV1P6oCFuY=;
        b=gdh5/PJXP8+o/Z+lqFrQXDbBJ4gWSK57xM/XehGDTfigeRY7KrvdE6zAJ8nRtWYe5m
         9R5jLUikyY9X/joakVtIuQppb6kGgbL4cvI153rkj260KBEkEkWZOaty/t001pXL2ndR
         Wa4lEq0tbwIW76baUcYu3n/b3/EQkbrH37UORp05WBeNVeg+Lv54taTB4gO4A4LgRUOO
         VucrtCX81YpQxC8FADzGcpNJ9oTU4jQNjPnEeV0+mYj10R5z9BgyfgTNkOCve3lR/lqi
         /p9vtH4PXgvUt3p8Zckid6Eq+XpgGME50PAQOatfLC1uJXIJXAhXLOS6TOYPPqEnLMdP
         emiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791967113; x=1792571913;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qd7vTo+EqGkYJvBcWwrHERRcH3xIdn95LuV1P6oCFuY=;
        b=iI8jv9AcYZHiAsphnKhLJaHeY86oeIsbVzh9FIan/Gf08MmN3T8ik4OjOhp+7SsFbX
         eBqDKDJJoPHkMEy8WnttaXFjmu/3YfWaOQrA4/4uDvD6qXnAUm+xK+oQzPP6xuKATkAc
         8TQpb3BXx5EKmIaL/yxyA9w73VMufRqpIcREV3KEH5lE7ST7lO31TQJ6n3rKLWK3aWzS
         n9XGsS3WIOaCnxsTPoOw5Wtwzp29W58SraX/8SUHj1rMG5z/2YmMAMBSrMWdRrd3Pxcr
         n5XjiMm2CGE/EVsDJWt7LcFFmWK5Rb4AGkFdIiiSmEebxKEGNxJels11n9gn7RLYFxaD
         rR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBz2VDG0Vw+OQYk10wsKWYCoxCYJBY5iggTQIQTEhB+9kKvL8NeG0cMn4YV4EI0HzQK1xq0PgBG7ULEnNvc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSoaP9PzbKrZVVCstvrq8B9zCEl4vD22xXlVx2kAY0++o1HIBO
	dU+x38hQOXmr0kq4BAs39JSdxfo7s+5D8YA+aJXB2GHtI0gF/5RoHt0e4ms0AV40y6TQ7ICjXKQ
	nDbj8hF8vKxlwNJK2+sUAJbR0mBntG98HCBcnvwlNadBOGTuSuqrJ42wZDJlNCBgeDqw=
X-Gm-Gg: AYBFou3bXrOi2EYg9g1Uv+KX+JodsnyMAsf2Lmiplf6GIWk3xsfbH2nd7KisUVxLGeS
	/7XzH8OwmEoT3tRmZKvQBbrwWp1pKrxij0SjqbLT6ExGC5e95oivwcdL2ySDR6EsUGCcNuo8cKk
	zveMOrhDgR3Z69R0ikLC+Sd1hIizddy3CNbXvixi9SkIuJOu3R3xSFO+VryBihu50kJLv/r+s/J
	M2LfcRyq93Xq21uElLAcvFUJslQRqm9niF6lc+U/X1ox/8NHAb07v5/ik5kv2uKSlTG+UOz9DH1
	xxla+bl6lGqjXQIJ9XYsPYdLtU5kHMlhJNkuYOFf+6+0rHm4tgiyld84SIlax4eajGTHBo5s5uH
	ry2r2pGxVzvApG44m
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2495229585a.57.1791967113318;
        Wed, 14 Oct 2026 01:38:33 -0700 (PDT)
X-Received: by 2002:a05:620a:31a5:b0:93e:920c:bfcd with SMTP id af79cd13be357-93ebd23d1a8mr2495227085a.57.1791967112714;
        Wed, 14 Oct 2026 01:38:32 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de77606fbsm4193764f8f.53.2026.10.14.01.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:38:31 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:38:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liviu Nicoara <lnicoara@thinkoid.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-hardening@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Message-ID: <po34sdy26aqq5ze2bmbufqcbwwcmzdyhmpyyude2e6thtn6evv@rwulmq43yljd>
References: <20261011-dell-xps-9345-ec-v6-0-2a66a364fe70@vinarskis.com>
 <20261011-dell-xps-9345-ec-v6-3-2a66a364fe70@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011-dell-xps-9345-ec-v6-3-2a66a364fe70@vinarskis.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX3tksDgpzYJEO
 0GfsvPz4wwve9AB9qdF6cSIYbrc0ilwouARzhCpEEuJflZJw8qkh7OC3GjMcfgSyNQKjUUoUrlT
 +9IcrtI9NbBCQt0URJRBEJ6nOncR7JU=
X-Proofpoint-ORIG-GUID: BIhhr9Ztc4cTn8N4x5xAEiyxpGG_u6Yt
X-Authority-Analysis: v=2.4 cv=aeb0Dhot c=1 sm=1 tr=0 ts=6acf3f8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=I76Qk8w-AAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzNCBTYWx0ZWRfX8O3X4gN2xgj9
 5xw6CHDrRqkP74y0c3tx0cHmRJRVDQD1DsZ1s8cbZn76r1xNibJ8Ytzuk3mo+QUWR+6P3LdsJc+
 C2kfX+Q9hJWYG19LEpec4c/SG3gRTFDp+gnSP0RmzHg7YRPhbeMpLwCjSDhcM+hw0bwzZU8gR91
 +x64PoLekpDoOZIoCQiI8SCElG2BexbG3d1o4+QO64DG9HmUswT9bP1FDr0W7IXTWZWaQUiR9XI
 r31k2yBQhhnBgbFmeyrIvDVyTQW+/THd+TUS1CQyZ/Y4M4FdXkCZBHzdj2xCtPCVz+pl38xdmr+
 RV0cdyRI3a3GxMeSShw204lXkENSHoMaJuAByQKfYCkv3t95/yS21t6v7cob9XKW2hRa5udaLWp
 z+Eslvcybbz83VrHwfs45vJLtlE+tg9BmTrvwBHSeLQHIenlduUJWPKbfWsOsUNcMbZaqWMs//t
 4t+TkOxqQjvl4mP5Adg==
X-Proofpoint-GUID: BIhhr9Ztc4cTn8N4x5xAEiyxpGG_u6Yt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140034

On 26-10-11 19:50:10, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
