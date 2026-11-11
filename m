Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420804;
	b=JKVaFSAktG0TR8cqZfFvZZVzmzvPnZEy4OggNXHyYmyjYddoF3kvgRPMPT8S05CN/4FP
	 TmSffpN1F9FeeBTeYuN+UDkGCL5zbb8qw6cxhKgtQoxLSOb5Qd5hd0l4V+1CAih2O76Kg
	 +EJvMzlx+vtX/mSQ75BND17dM26Ln25K6Her3BfpbAXvLB3vHOgHYhPnFG/r7hR3doghs
	 ATB32EZV3wSX+3U9z6Nt/v52TVN2HtOZm2gxm0A9NZKAY5clw1N4zteWtaPZob5u2DCM7
	 JTapRUHGQuWhnyPrsoDiE0cmN2M6MR0AjPkg7r1HZlxX1RPxDkAYv0X4KRCI5BgsRpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420804;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
	b=rJW8+7BrRU/seovQ+bQbStmTdtJKGYDmrtAVNSqlbVmfxfob7/PL8kSby7V4t94w5hbP
	 p2XX2+AeDztMPXhmk0DOKvQq89RfBz9Nnvjxj12U1B2+s+5Bc37T1PQ3FDlT6PzE7yMTN
	 V/us3AiSnds4rrT29uuhW+PLkraK92VSVSVp3Az6NZvwbcHv9MQfpIilwuaIcR4qSSVa6
	 57iwmxRqkDd1UXKToBmRN/dKVuNdcLnllD+HQOlN9LZ4JsKk0I/m6wkDayUfWOXfGueZH
	 8tSAthJZM72CqtFfI/duRtYZ3Zf9liUm7tTCClbZag9Jxp922JvQMK0bi2phVESQUjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgGAo6g7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4aIFWpU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C49606A9D5
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19C49606A9D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RgGAo6g7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O4aIFWpU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtIuV3989585
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vqwMgBBAIrIccsbaUs5qyWO3
	n3mmYzB8oRH1B9/XhhQ=; b=RgGAo6g7+T2CoN3qbu6ujPRQjGYF1EHQpIdnGAon
	UEDJ2xDBUmAp3zWPanKfxrYudMNGirThmjc8tUs6PVEiW/esgH1KUaeECz3CN4wh
	1oBhS5WHbfBLAle0TBgUTh8tV2RvDhAyqY7wskTOvEPOTq2Zh/RoyIO/haPNoB09
	Kl9B2obGL8k9BKH4uchwjUWdQ3lt54SHzQx3V8WtGXevYremtxO/C6fGKb9mLSS0
	pIdqwlkUT5uA1zLOSKl+jeRqkkhIGAjHNa8f19t4qaFQ3n5ReLTYppKIIZ+js6AP
	o4zxel37UKz2lFLWye+Mk2JcL4aZnnNN06u61ICaDc3WCQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1u90q5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:13:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so722412885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420802; x=1795025602; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
        b=O4aIFWpU/ZlST5KMk0c44Jd1SZ/ZEqe53RIBLtcbT8btufYyZ7/Zc+Kdu1TkMuh11t
         4VYUHdBxxfin8HKclTBH0T2Sm3mXK8lT/FQWtsCUb5+E6/2kqnUulvEc48y/sKtGCFvf
         ZOTmhPr2Lg89jV9UIyUKmJWOLFcA/+kpKXKJb64Er6TzykkKmJUFm0PSd0FsTmWI5/yA
         xw+zy//ITNO9ypet3EfHSN2KD0rFN6XAtKFMXmF7A0I+GvN/k3DcjOOj94KyDbEbMRK+
         vZhgAbrM1Un1sliztjsRH3MfAKzoTlX/i3pp9DlLAm30eGxzdkVjANnapnYEkj/QYUUu
         NuLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420802; x=1795025602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqwMgBBAIrIccsbaUs5qyWO3n3mmYzB8oRH1B9/XhhQ=;
        b=tnZPhTEB8KcesR9XiAxybDyNDFAZW27UwJLn0DAV2AIkicY9ytRC84DC3ZuqnO2zZX
         5XeA0Pg5hpocianNGh20wsPsAYD/xHgT+s+S7V2Xoo8kemsdbZzz7L6JbOw7ZgcVwcmI
         baPe/YOqnMb2agVPDPLhJHtfSGmBipoHnFDmqT7aE3+S6QwGcCDhTMynBqOMeCFsvi/O
         JCYjY8XG0CpLRr214YjPnvmGOVwnqcPljHfmKUY14Gb51qEEUJb2nUfzInE7whn0eKBd
         aWzODXh1YKAgw3TEsRNQdsISS+XgiSsf/MFGKRh5+9GnjSY5WybT19JZX3W0/67H95lU
         YoHg==
X-Forwarded-Encrypted: i=1; AL+hErHnrpgep0mI6RRyxY//NrJTaEh6dfOUJjChLQJTyipn/GNWJ2hnk7MugtG1moSCdLDNEYwKBRa0xnlXhZk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wSZu8A31EmBpntTaqXoFWGE3iQLRdfzn6c0LM3qR8EQ7+eKX8
	2pCuRsZThQjlz8O6jtGgh75TDNpDWB04FMQa3jzatGI8cHzn6s8l/riBI8Lw62lUvAyLc6iEiku
	l20pcr5RpLdGwZnnA2uZOI+tWu0Al4K6hrXFZDBMQP7jCr5g8MhdsIZ1bSm3V9b2TES0=
X-Gm-Gg: AYBFou1Wh3haPYUlqNQv39gX20nrM7guiXiRr4BmZeXgZeN7JkC2tRV7AWgPE2c6L6f
	I1EO/0zsGZkuXQKc0x4wvepks/9Du03Vyc1eROKI5KebOnFFSFkN7hr2e0P0Gq+Eu4jFjJr1PFF
	nmHiiwjArF1IlaUw5g0he7ZyGakDWTidTv6IqPZwVpzS5UVfj8ZCwIz88MrnviUVAYv1bgDIvoc
	fVKdTfh5a9AfjQzSnGtf/5YbolRXwnoh9d0tAu+Bo+DlyoGnXMaEFcei6EvBwEXisLwUL/R2Tyt
	pyh5QsA9qtGwECwSPyDixPv/arvKTxSsqmr+6u/OMITAGwCsfQerzGQn/Rm8GSk9DDCzESrpvU7
	BfcrUAmXS3SacGGNhbVja95SbDUap3ANfez84hE3IDMHTwXdy2O0/JYWSSdFwpbDvZApUViZrVV
	2OG8oh+H4Qr70+HK9A6hiC+Y5pS0KViDqJRjTa4/l/25ppyqbZDsG+21jcAlIv+Q==
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr564281085a.19.1794420802277;
        Wed, 11 Nov 2026 10:13:22 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr564271585a.19.1794420801627;
        Wed, 11 Nov 2026 10:13:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0924f262sm13151041fa.22.2026.11.11.10.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:13:20 -0800 (PST)
Date: Wed, 11 Nov 2026 20:13:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
Message-ID: <ft3rayikzieiuttoaqz7lcgv2sgn73cslgh6urur3pud57sqqg@aouonlfb2klw>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfXzvKyZS8/cflN
 DWNNdGf3by0OBIdZqusj0xedwIX2vyt/B+iRFM8nnUVYrmDUHfSCv8yzBVpfsMILoKlxXcwjjYG
 OAHvfX0/DN3jPG+pZ45GOvEoNIHCbmU=
X-Proofpoint-GUID: 57zFr_87yH4zgdg1iGTRIX6QQQjrgSF9
X-Proofpoint-ORIG-GUID: 57zFr_87yH4zgdg1iGTRIX6QQQjrgSF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX67kcSAbY+IJe
 KOSuCGYkW/y4l1ppPYbXKfqXnZqxQT1nepM6PDSSVVOPZ9wLRPfsocG5ldU5lFsbjkuEIQdfEtc
 f3eEbyISxBvfBWYXbMgE1W3/YGN+VwlgTchVPqHNuD4bkCeaAeKtcoFLcv4UWC8rr7LK+6k//Hv
 AaZ6dsr16pdmA+x0VmCA0IlbK0OE7PpbZavvWWdAwx3bfjzfry4eWcxF1GEyfcPFt7wL4+C7b8i
 C+WnSWrGqua+GIZdrCaD62q8pX3+YkoIT/xyd3nYW5UHTeUTAbEvHUT4wSwQpk3lKu6DH1NcemC
 iOdIgEm6GvxsX28nxTTIOIXLps+lp7SnmQD6SVjQydLxOSG6GHKJPWulEOxPLfTDbELdbhldXbA
 f9PE4ia8wsuU4yTGi0CkKBrz4Ielt9szOGL5owzvsRATaMWZoL8tVkRv38vdSYAiLOdGGH+BTa2
 qJW1KyNIXTha9/39+8Q==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af4b043 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=udFPpGrmtiWedX3Zxo8A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:00PM +0100, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dts               | 4 ++++
>  arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dts  | 4 ++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dts   | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dts     | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dts      | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dts | 6 ++++++
>  arch/arm64/boot/dts/qcom/msm8916.dtsi                  | 4 ++++
>  7 files changed, 36 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
