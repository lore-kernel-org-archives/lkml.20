Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D291A4D179F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109442; cv=none; b=N5r5HGwrO3QKIDUjeFM8GC7gV8m1vohx9qPgbrdss6vEixbwqx/ri1/wLTykdZYmtePtnwyFbohv/7uKbixL5ekmY9CzO8yTCnuCNtvNe4Zab6VmxsfitM/AQsa2bcL37KMH+Jzlgg68wrxMIDT54q0Inb3n3GVz7e/zWCiOCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109442; c=relaxed/simple;
	bh=aK++3JbYzV8XbA4SqPzyNT+HdEqpAKIXLsDfXp5lw2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+OU0Jt9+y/nqY1qV6VIAyoRZogCWjfdhOURR1kf32fsgX2Kc1S1J4rwtFcBmQ+5ToWPJ6eFTpCA6rdbagO8xC00gujcxsljH4CnfsV8GlENiNU35yunHEAc83cF5KGMlv762tYWlsPzmn1QWlyYKWP1LsZNIJY+QAxIiiPuJak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gR0h03wv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JhLdyqu/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gR0h03wv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JhLdyqu/"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI6vuc1873457
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cXyXo8Mcq+VUz2SeeRLSBrOs
	vJpMR+7hdf15S3RqYeo=; b=gR0h03wvvyQo3q6TcL0ZjtimSbeIzENyUxLSv4BG
	xMjb0MN6qBwVymsXhcAGlFstwr5MBzLih1JyeyRh4uGwajk6e6Yc21gSwlDNCX+p
	wVeSBk3lTwKG0CQjlL6datOFsthDKcA/K0Cyb87gf9jPYvD6pCKP7JHcNsGDAgnu
	FDratzjSfvKyP7F9wBnCNEQ7ZFLj4/meOKZiIY7rWdYn5msiXZ1l+3XV92zn1Wdd
	GXs3ujfcITSeOY+9IwZslID0aeUaH4rfgTAQScTFV4Jqq2x5uZRlCGjUUXTR1ERf
	lTLYYOBVvBI30LXH0H1/Xbx9K+ZexCP2GUCw2XDtVPDrVQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4u12u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 20:36:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7a04805f8f1so219197137.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 13:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109416; x=1790714216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=JhLdyqu/WzTulXreM+9Nwq3DjWPPd51GfyKX7AuLy6TEoyBQN2fOGF4nvqpxcAddNe
         es258lPt7UQM8c78LJosz/ntLEOXCTs6IkggEohClVryVbsSkDJSHL/RYnsvPgpm80lZ
         yK8ehnh1YmeXyf97vDjeAmYcWp+MF0jsAysTlcs0Om7BkdQrERxOqWOU9M8N3U19KjIC
         9Rk4SaEfiwdYCCNoWrA0E0EpwtuickQ8ucvoFnDeq+lFYBLmk1+0tbg+26ipUii2UGiq
         EsqMR18T9bKarQvNbgPfwQj+N4zM6mvBbtidrHThbLPp6FTN79Rs0Q4SrRJLvN2J7Vsd
         fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109416; x=1790714216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cXyXo8Mcq+VUz2SeeRLSBrOsvJpMR+7hdf15S3RqYeo=;
        b=BqsJMvdaeBst2iH9ipFKcNB/XwHnV7NG9AcRjl5ofMA3WRWlBnkmdPNw+MMm3VfU8f
         cvzHTiAgLOiRN293UKA6cQ2HRlOrNJja5f7BiBhhnAD3Gln+Aiq3BoOQYslPWOZZz8Rt
         hrLNyvpkDpayYVslDtNar0xd2VcfdIOmaKULnfKZ8Bio/F3A7BxNg2W8xbqCyCYVT4fb
         d6CJK8Qs4DHY4stpugbUh0nCXicIAlFnTu3Zs0FakoNLcwID3W03HWVnSY5OljV2uiJU
         zomFFYjx404RXvw+2Mv4h+wRTDW/K1516HMm4C3WZ9FC0Zo3y/xHtCo/rVetg6+urmZq
         qVuQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6mzFOK3ptrn45qArDp+I4kTuwGgKhNCRNvvAWK4lqK6Pv9/Bm+iKuIW45GpKWWBYH5LHlvSE3QqAnNPQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ldnWfXpyyvyiLqvePsPMt1oDbj8l4IcOq6kCluan09xCcGamgq
	vOGkqF/4aWnsbC4jsenqOQBVJ1W8RmocwUV5X02RPCFDca9QhrMgLW3Mpgi0lzNCrTpPbiLak8z
	NNMIrt4ty6RMX4QhjPeaRpTPlxXxPOPVXBAKxZ6OjQMQFVzM2ABHUQ2CHHCzU2eG14I4=
X-Gm-Gg: AYBFou2LDm8TzZuRyicuU8y5qsHbXVfxwip3Umg/DuXgsugf+leQnohJi9mIq65xy2Z
	XRfJS4/ZV00kc/7JFJHGA0CLMxPchAGtZAbrxaCa6SB9CS5fGSZ+YrMIpMfaJxXDp/2IRzeU60y
	BmJ4uYPj09mzVfw+sWmk3xwxG9Svb4hu47skfzBH9FzIDDPfTMrN3PNIVGtGpupKcVTiCuM63NX
	37uPr9CU/17wf8qTocJJ5li9vnXyBRW3DbWfwlgXWEpfbP2RI1dUthw5QvjZxAXY/jOdcbyPy1w
	9THI7Eb+vWLy2+QWEsncWGpSEta7bBlytiO/q/BpYPwiNzHsF3FuSdL0mJ+bjNjcT7PeE/l2UyB
	+GDQMtScv6p8t2Q==
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739406137.29.1790109416136;
        Tue, 22 Sep 2026 13:36:56 -0700 (PDT)
X-Received: by 2002:a05:6102:6882:b0:7a7:198a:c2b5 with SMTP id ada2fe7eead31-7ac1d2d4830mr739375137.29.1790109415566;
        Tue, 22 Sep 2026 13:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf3541aesm5332835e9.0.2026.09.22.13.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:36:54 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:36:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: qcom: Add support for camera clock
 controller on Maili
Message-ID: <kjj73o2paa2psrd6lsrszmavkog36v5slrxlctr6d7byyyv5xz@6ecvirwrodan>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
 <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-maili_camcc-v4-2-87704b664dde@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX29o0XEllz2jY
 72n7zlfENE+YJUQx7x6p6/N0YDumkX2FxXZ55jz7zZ58tr8r/rwzTqeP5T3LB71Pxt3pieAwzjq
 OaNKRpVNWnoN8KmupfD72cuLJIwbK6g8A64DMDfGf44QZvvn+NIx/BGGIZMjEFachMS7npiUPAy
 ZlHc/O3OyKBgdFpPD5bg90qT5wdzGOZE4fc/jefdVTMC48uFGBrjbvnZvchLbKubTsJ2fJlap1S
 xPbCtnSDi6vl0yNLvkRyHN2fwx4CjCVPt+dgL96RECgZ0gS00nXoMp6raHYzILP3s7U/8otQel8
 9ZCkKN9NOb79WBRAGeivcrSQ3lxxEyi8J1658TiXXfst8QySuRz+6bp62WHy/gPki+xB550dN6n
 leoJzrlwCasbSMVmnqh6jSIddZI4FkYqskEKpoUAEywk3mfDqFurRUcUYDW1OrSla9WOEZ5tZwZ
 /YPf4jkcUQgK5hPTTkg==
X-Proofpoint-GUID: q3H4yR-6kisFXQA113S_foJwa50n5F7N
X-Proofpoint-ORIG-GUID: q3H4yR-6kisFXQA113S_foJwa50n5F7N
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX2BSbVlWJxaa1
 TBBO+Gur2Od5Mx9Ig83hYm2d93+EQnBM+je8Mmd50rN4fUVTK7wXkavk9GyQe7oUV7B+rB0iVoE
 B1dEnMLiawXGlbnz/WKmqOLsksa8DTs=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2e6e9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3jvcJnBrcLkHgcWL8XUA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 09:26:38, Jagadeesh Kona wrote:
> Maili camcc is mostly identical to Hawi camcc, with a few clocks
> removed, frequency table updates for a few other clocks, and PLL
> configuration changes. Hence, reuse the Hawi camera clock controller
> driver and extend it for the Qualcomm Maili SoC.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
