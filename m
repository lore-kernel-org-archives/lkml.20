Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AFA4AA58E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790595391; cv=none; b=fYKbQzBPfb84vDw3UHl7BheriE++eLnf8YtuV/yZVVt9/e1dxwRe4yzfWKgY9otglmHdV7dNowoRRUwE3m0JvO+DcuBCMrwOZplry9peyBnpriq4p8vIsNAckyX1k6RXa37NPkQ/REGAb9NDA6yTwih1dVc0EdHss6Bbzv6HRBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790595391; c=relaxed/simple;
	bh=ehKSWvL0hxT5BEnXgdVsXrbsUARCc1Wn1UwZt+x7T8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TCN/tT42JHo1jWc3uUgPqy6pTnw9fDcJZ0aDqV0xsrr1OTZdO6gNagf9dQYgagHaCOoNtZc9hTfLud4jVKhRmiVzY+4pzEM1+ALvoVCg2N3IKWHa9c15uV2eevosECCT0fOEqJj0yJRTvHwy5BQ5+gfMlTAwWpUowplG8ewEDBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8uy+MKQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyrxlphV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8uy+MKQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyrxlphV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBAViq4115792
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=46+rz0Sh2HfpjIWSfCxKOuxQ
	neQiiSNP8Sg0b+IGsVI=; b=D8uy+MKQ0+DsEdIvquSifssaWhQ9hOiEX3kYkuDM
	M9jjZsh3ZBZAM5kFZmbUf5bxyv8yFaY5M3sUxI+VYkbiMCpCk46EnN/f6xzgigP2
	fv7lg1ubUIxw+KoyHnxeFahyTD64f3g3app4f7Y2MMg7CokmHMnzy1jv/iMnQW68
	4oqvXvqLaR8+CfGHNDLowr3r/mllw47dZm795VNvnLrQcHVAHd7wyQVRApJCdaK/
	n8t7JjxG1RLcIC896SLfSDyWDiLStCynwcbSRmYOPe0RBlw5oD184+CZYQDjkdUC
	mawMb9Q+q6wVGvyIGzbl9UIWEFVZjF0AY4jSCwa86as53g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jwt30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:36:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93bfb2da664so873713585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790595389; x=1791200189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46+rz0Sh2HfpjIWSfCxKOuxQneQiiSNP8Sg0b+IGsVI=;
        b=LyrxlphVc7UURQOhkYXsS3lWyJuDEcln1fNJwMsmxsgt3rvINtfuZu0MrOc9nDQHS3
         osDAaEsy0fPirQYpeipR5WiVmmjir7/AKzLx2e0z3kiYtpLkKoHr50ZDsKIR3fQFrJW+
         xULnnTO8tZAJ/fR6HDZIZs83lco/jAIvloyj3IKZ33VpRaEk8fCq4pzdChbS+uCbtdXP
         Eqp08qLV2uprIxBXkNzk20qY65btSrSODjqVfLgepPXNJW+kU1B4BSKNddxzYRcaS7Dv
         C0it3/aZKeLpuLNn+9Q6+DYk9OkmT4PbC2Wg99xUlnM4EwoT6mzzEHmWvOa52dOCwuKH
         K4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595389; x=1791200189;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46+rz0Sh2HfpjIWSfCxKOuxQneQiiSNP8Sg0b+IGsVI=;
        b=Itwg0MUU3c6Mi1dLTO/ivL7tCCJ3Mxmn7fKedFcm1uHIpPmh7VCyWckAzWrLLtI6VB
         V5gIdTOrDPV9q1aZdcpfxTRDFeO1WZWtyq2THpJ/7vr8SKd4Dl370OFxoYTfQYZez9jc
         Si4hiTKkcRqKBmqEg1CQ+ENTc0xarLbKW3RO6cevOWw5JEQPynIqq5LChwqBYW170dBS
         8K5m5hadCnQlt2stYsYRnhoi+jw7vUPVs8VHcAICwiWe+b6pfdeQzlnigCpldzAsD/GQ
         j4kRbzqbt6Ql1qs2eSn0eiKrT4EfzE5KxDmkXpnjVSlAZefFikrYME6nY14Bjfmt7aRr
         0/og==
X-Forwarded-Encrypted: i=1; AKwUvBxT1kjghIeqvVwQs+ELV5Usc5jj+eftqLLYhchYbKuF5+dmjxvwgb4kRdQkYHlYPGtH+Fz7zu1JeB7gfng=@vger.kernel.org
X-Gm-Message-State: AFuF++ltIZkDQke4zPop+KbulE6LTLJRllL91rU+wMWu1CRsTHCqb0he
	AveCcSkjDAC2sKcOtQxvcIPKMvhvm8ut/MKHVl2HB1mhXoUSWtfB71G3iAx1zF2a5QsLuWEeMgp
	U99SWHg68wc2raJbjNFGjiLzejXlhXnmBlesiYWXSaVa5XP0xuOfQKUUyDJda5btuTP0=
X-Gm-Gg: AYBFou0FwhpLRZqxsuZWGfxFPB+9HTwAhjOw0rGiUV28Zp5GrsG4DH7zRDl314r1C31
	Iv6NMApL860cSMU76kHEzUnAHz+W35XRens+n4HZvfpHRdPchZ9XNcQIkeEnx3cJH/L5EL6sE/u
	TcfJ1DC2ZGJTKq/80X1xtxmWB3S87zN1VEP4HG9U1FdcuIUJItQ6RpGX28Gud1UTbuQ4XKgtL8x
	4vfun3TJJG2aVgrBtBhv/tYaO39Jx0kiBavMuxs1tb9cs/wSSa1JW0U5vpAHV5irW+SiMe0Wj8W
	qAhltOFk5J1RNt22ExYbHWkACGJuGChRsyi+q6SmBgb1I6wZX7SslKWRrV1d02L1pWZiOlNspil
	28ststhQWLPFW/bU=
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr1785438085a.49.1790595388397;
        Mon, 28 Sep 2026 04:36:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4809:b0:939:6de8:43dd with SMTP id af79cd13be357-93c47511ed9mr1785431185a.49.1790595387711;
        Mon, 28 Sep 2026 04:36:27 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a008f7f1c2sm43908035e9.1.2026.09.28.04.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 04:36:26 -0700 (PDT)
Date: Mon, 28 Sep 2026 14:36:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
Message-ID: <cjxdoxqc7744q7gbgkbarcuaujkesa5sd4zhwhi4vzlhy2s4i4@zzfalkwc54qs>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfXzpm6+W3IeOZP
 DhC2B0rCpKrT/rgY04CiQjAKqKnaaEGqr0WPl2giy0CjCNvwtv/+FMXTpfAFOZg4RxsGS00+zM4
 GKVmyGQpCn1RmCSTMynVwaYFoN0Kuuw=
X-Proofpoint-GUID: dOiD-6IWVysnwQ6N9xyn4uz4AhKFKAMo
X-Proofpoint-ORIG-GUID: dOiD-6IWVysnwQ6N9xyn4uz4AhKFKAMo
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6aba513d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LJH_WNpccHY5IcrVEfcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0NiBTYWx0ZWRfX6gT5QeTBk7Eo
 tRBDPvmYOl8vPaZvtkN37WCokaYv85Na/1KxtAHOKq9puU6Hig9GU5j2+6umbdbJTeAkm23e/5K
 lKiqbn/AbXmG1E9yAvJfQ7BCYYMOU6wJoIX5hFmhnFqDN2kXbmdFxfF+a4lJPZSZbpAt+QlLEFT
 E7kwWiXABihA87DV060LMzkQAS79lCaV9Qq8usaBAyi7LiSKTVWt6723FAfkRJPNa0pYdLnAkQd
 qsae0FzMK7b+MloHuwwQy9hHhm7zN4lv8qGyDxwY8guL6TIHTsvoNQvIKB0oVNgkeUwPkZatzQB
 5poESzJ67ypOfpLZes2dmFXvwCe7OXFuXDkq4mKFO0uVhGvnNJW0pVuKQo44M7xjBu0TMLoTkdC
 erd5z+H8XcH0Rxt72ZQTNH/46xEXy6vIQLw8D7+l7ErsgSUc3EJqKt2yOHDe+8pJ1R2NLIGCWPR
 4r4n/afQT7qRpP0tFuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280046

On 26-08-31 20:53:44, Fenglin Wu wrote:
> The PMIC arbiter in the Qualcomm Maili SoC is version v8.5, which
> is the same with Hawi and compatible with Glymur. Hence, add a string
> for "qcom,maili-spmi-pmic-arb" as a compatible entry for
> "qcom,glymur-spmi-pmic-arb".
> 
> Reviewed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
