Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A5C4915A1
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992033; cv=none; b=i85zqtxw1W0M+xRmTAc/gnAhZnhkt0GAmR8s4qu3picXMVe6ZZCwPw0MSLQOQyXHZ2sxl2X4fIEPKU+NFKQpgQjHxZqft3AmqQa2sLcU+gO+UsIHv3pMq+rUOZy9OQMsRJuTiwBE2I7S9ulWtelePd+mIBv5Vid7VjdtvANv/uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992033; c=relaxed/simple;
	bh=28oo7UN8FZcgTrgLbSVyQctwz3dUuWC1rnC1t2Tx1Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GjbZCpFsfowXKGgH0eGvjUUxPS4oPsEoUQnTiMDMIlAuiEQEBsJuGmiNodVDC3eVMbrCTbPfp0PeZoVvNt3WAZpXE2vVPL7WAw/U+US2MOum43W+9ac8HanlWkQJHCm4OSpG2Nxc8W46vZW5gyFoUlxBLAgLznKp/D7q8TXvC3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eJcKXguN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TgONr9aP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eJcKXguN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TgONr9aP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeEeA838021
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:00:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5hds0TdhjMv2BFxmZw8drlMG
	gZASdjiaOg7eKPpN1Ss=; b=eJcKXguNAJYFDldZqwNECB0yy45dEqxPmprFFhyw
	05fQbLK9cBtdu32Q35kGSJOVDproPqldruARFjP+oiTFJB/oxDp12TX4vdCmlFOb
	ga9TNKnrJbTB9iNFbSF72HMTuh4JJMLOY2+DUGiRCAHFiNtAeeadV6Df6CZfCdHC
	S3YHP/edD3Me1L+AvcBJCGEmSbRci031VMJnvroWxyO3RVH/vWQRuIf0KER5unpg
	MdnpO5WTNE07qZIjbbWjSCCvDTJsQFawjBhK6UHrw9kkOnvR8B5QC4aRhQQWy7g7
	v0zXvjhWfMc3HaZuOs7Q3xSL3Dupy7gEp4xW2kkzRI2gKw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hpc2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:00:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936708f129aso470388785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992029; x=1790596829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5hds0TdhjMv2BFxmZw8drlMGgZASdjiaOg7eKPpN1Ss=;
        b=TgONr9aPiz33ybgKkXP3NLBj2folFfhIDmCG2Kk3iYC/c9yjT4GG91YSqh5c/Phm/k
         FojbWvAgg0ALdxqhDMXUNI3SuVMr0lKNtj5m5pQIUUklpXSnO5hQSB7f6//UjEjGSU42
         TTjRiPIlufRE0/hNzoq3xf8M740PEUVk6mZtEntsEMQQ4mG8KX2QBe59NW5L/7kiQJfs
         h03W+R6RlnE+eQ1BTQzupgkN7MVflART9j8W5ppW0DcQD6wgdyGbbjjbMN5N7+rAjUCu
         SVvpINfg8PRoRLf2hENql+yMFvSbpVr2UDIbPLPYmTuhvQzh262mk+cZ+m6lYSBbzyX6
         Zz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992029; x=1790596829;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5hds0TdhjMv2BFxmZw8drlMGgZASdjiaOg7eKPpN1Ss=;
        b=isVaoV6ACVjrO5B450yR2xh8ZyxY97IcbvMT3amzEz5bCEiAcbzPFHNaz6ZyDISFgc
         ja4sZiELCRP2E8/HY+hR7QXiMXtOQkGvlVLUkXeuGVA1NCl7KL7Iw3SasKoSn0vGkhIV
         ZqaSEFNiw44wNyUoeuLrRyVQwv3o/SVZL9hEzLNSffJj/hrQDPxvjEBp5hUsNWTMV6qv
         PdeAHjPuui9bM6BiQq5/GPxmtZrhVQi1OeppVUkl8LDfSQbjiUw37tFAxlLI/x04nxmy
         S8tjUkgX5g013qzjOa7hkCFXQVUsxuV6idBvSdrhMaOWKyuByv3D0cv6offLmU4tDSKA
         m36A==
X-Forwarded-Encrypted: i=1; AKwUvBwWB72e6GH9AVxUuA4UL3RBnsijJR3rMTgWDgMxMFVCxSd5xjNvlJEL4r2t5/iEhCG0UEC4YoYLpsSt7Ns=@vger.kernel.org
X-Gm-Message-State: AFuF++mazzzsbgVhdhhazebHagDglEMwoqU+7cI7Dns8MDxJlNAvkfGc
	12UDR9NArgcGAh+mFa6goai6NTr651oU3flYVEk0kA89hdlzWYEU3RIVfru6KfHxPWiJV+TE5gt
	KhzhoRRsMJz2Hj0aS09BFyiRw+nl+dubPdQQ0Mex/tumQBVACC1aSdho3y+TiPYNf3ZI=
X-Gm-Gg: AYBFou3sOOasPKsHqBaJFwURpLPMoVGp2s4yBeuqnuCMUhsEF7eDYaa+32NEy8qyLoD
	qTCP9PZPFEzPvU+HV6lCfwbaezW09iAREvvDgEX01kGPvRrRh9q9+QFpCBimuoiuDoC9y1cyT7x
	GdzUKOA0LLw71P7t3PeTkdoBvNYMELIejSbSmrXNVa4XMylNOO+bG0O+Gw6Qh4odR9nqMT7QwdS
	iwbdfcGlrunWk6oAiSqCn9lN990oy0vTcbO9XSQDuj+PAtFb75MFDbkriHCzspvmn8i/k1R8HsE
	w6GfvQxXMqbYc/ZQ8qYc4gWkNtmTPpUZwX6rWfFX6acHlbi9YnaQJamnpZsebPXZAZ/g8hV0nEk
	2xFqjamCBnHh8wg==
X-Received: by 2002:a05:620a:460f:b0:93b:d79a:c45f with SMTP id af79cd13be357-93c15ea1ef8mr20045685a.55.1789992028816;
        Mon, 21 Sep 2026 05:00:28 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:93b:d79a:c45f with SMTP id af79cd13be357-93c15ea1ef8mr20035385a.55.1789992028117;
        Mon, 21 Sep 2026 05:00:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724422790sm21382516f8f.5.2026.09.21.05.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:00:26 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:00:24 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/3] drm/panel-edp: add CSOT MNE007QB1-1 entry
Message-ID: <wgj5qfghiglcwzg5ouhjr4hv7mgsb5zlerwrmouq4kt2o3ywsl@wkt7trsfjygh>
References: <20260918120515.595782-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918120515.595782-3-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab11c5d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-iAOE1hZoH9ZQyiuzH4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: WDqNGxA3N3MoKto8lS1yo6dnJuAPM9sq
X-Proofpoint-ORIG-GUID: WDqNGxA3N3MoKto8lS1yo6dnJuAPM9sq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX7ujk1l+os3n5
 QdWQP1xO4/Nri0W2hzUYTcIbkompv5Tso+u8MtYLozc6YH+j8Kl4/2gr9kldI8u81h7FsEg5nf8
 a05zMPJGY7HFiRTzHzUMR+vKzv+1Jxc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXzvuncwawAIWo
 dHeyfU/fQtqkqTv9URs8FR23MEgeGbBfxg1TPxX9YHsBaiCzvSpXoD3Z3yYuo2yCYlrylsyqr9Z
 TptRQQ/y/hF0JPbDWF2qQZrSC4fAbWsEQz51/VEVZ41zlheG63MI7ABmoL3XaARIPEicwLK4Z1W
 cra4b8TLgLIoU28zMSRn5B3eoIYeqIZFlCCu7Xdx08wLpuIPSYc8pOa7KP6XPe2E5lCohAift25
 F+niR1DT291EdgO5HeJwHQC234tpuoTKvTSX0sMJrczru4yKdp1iNvb/BBsYaUx68iecFoMaZE2
 gUQcoI2+xCpNa5K/ns80zjAeFV94VQ1CLGooo13ye0sj/a0j87HaEMbxXC+OTgTsRJapND1WaJg
 68/X0l6oF4Q0Gg4H729fcbwT1BpXxJfLBTAupw+YKyvnbMPdfJXCkfb5uH3FDxErWv0IyXyP58/
 fqWAKooS85StEabuqMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210174

On 26-09-18 13:05:14, Srinivas Kandagatla wrote:
> 14" 1920x1200 IPS panel used on Lenovo ThinkPad T14s Gen 7 (Mahua).
> The panel identifies as CSW 0x1465 over eDP AUX and is not in
> edp_panels[] today, so probe falls back to conservative timings.
> 
> EDID, read over the panel's DP AUX DDC bus:
> 
>   00 ff ff ff ff ff ff 00 0e 77 65 14 00 00 00 00
>   00 23 01 04 a5 1e 13 78 07 37 3a a3 55 4d 9c 25
>   0c 50 55 00 00 00 01 01 01 01 01 01 01 01 01 01
>   01 01 01 01 01 01 35 3c 80 a0 70 b0 23 40 30 20
>   66 00 2d bc 10 00 00 18 00 00 00 fd 00 1e 3c 4a
>   4a 10 01 0a 20 20 20 20 20 20 00 00 00 fe 00 43
>   53 4f 54 20 54 33 0a 20 20 20 20 20 00 00 00 fc
>   00 4d 4e 45 30 30 37 51 42 31 2d 31 0a 20 01 6a
> 
>   70 20 79 02 00 20 00 0c 40 8b f6 65 14 00 00 00
>   00 00 19 00 21 00 1d c8 0b 5d 07 80 07 b0 04 00
>   3d 7a 54 cc 94 99 66 52 0f 02 35 54 00 80 00 80
>   00 80 12 78 26 00 09 02 00 00 00 00 00 01 00 00
>   22 00 14 0f 5a 02 05 7f 07 9f 00 2f 00 1f 00 af
>   04 22 00 05 00 05 00 81 00 15 74 1a 00 00 03 51
>   1e 3c 00 00 00 00 00 00 3c 00 00 00 00 8d 00 00
>   00 00 00 00 00 00 00 00 00 00 00 00 00 00 11 90
> 
>   Manufacturer: CSW
>   Model: 0x1465
>   Made in: 2025
>   Display Product Name: 'MNE007QB1-1'
>   ASCII String: 'CSOT T3'
>   DTD 1: 1920x1200 60.006199 Hz 16:10 (302 mm x 189 mm)
> 
> Datasheet was not available, so timings are not datasheet-derived.
> The delay_200_500_e50 preset matches the sibling CSOT MNE007QB/QS
> entries already in the file.
> 
> Assisted-by: Claude:claude-opus-4-7
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
