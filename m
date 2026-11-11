Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408491;
	b=5IACJYH8OoDpdlGS7qQ9SC02dnH7DikDZ8aKptqvGp44YJRuKuRCPtpxwdasSBFQxdgm
	 sLIZTFOFMbZG7G/YLoQj4ejQD750yGpndklNrjj/7rNDiHpu5mNwZwNXT2njfePWgMPYN
	 1yQ8DsjyTm6Rt10vkKfoeVyyeY9AMsDNqa76LoijuW+3TdKRiIbrXNqASxNrPGAou0Ie2
	 OIT4xRq4Ex0hhU755/aCuEDYMPjtfxO1XWPNXABnMDt2Y0Gw/8UXfne0oLO70HGEEq4QW
	 ROHi/QrCSXFOCdxZl7RH53WRbMuWkS24eaN25hV1u1NQ5AsXRaEvM+puESe8kC+bkOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408491;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qX3b7mQNELxSpZp5mVmlrq9OPoeMPx5UD59wpN8yb6M=;
	b=ZmAo4+P3bcwrbO2gnPwkR+XavTXt+t2ziYP9sWaZGjbkv9/6h05i9UZMWeD1eZQEgTuM
	 qALV7xP3Dseo8AAeajBm6IGijjLiTk+AxREwbkBPGmsWHlYrTYf9c0DbWvdbIBJL3iSIT
	 toBFlQnrq3x+RX3mbc9lwuvI+WkNbVJLLkVhLmadppNWRD4imQDoXEQW9SVHZjZ/qKyRf
	 zeXABKNpi/BHQ/sETOXzIO3RRvtyBZoY1y4ZOWp0RFgtMnsVNUU7E0cAPd/gUCupYdhNk
	 zjdmf2YYXu6bqv2lJE1ybx0UDa7MeTlZ42kmy/gs636SabTbATN0MBBXAIn4DAn/gLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoVmomvi;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jT1ijWtm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB5B606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FB5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AoVmomvi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jT1ijWtm
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEHSTP2556284
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qX3b7mQNELxSpZp5mVmlrq9O
	PoeMPx5UD59wpN8yb6M=; b=AoVmomvizF1l7f377QDbRDNoulbx9eyKJ1YmXZyh
	uvxGsXnNnOu6t78U9/HukjPPHOX54n1EQsc7NM4WPVv7vf3DrpQIDTYKW4lZqSGB
	cP+9wSEL8+muKM83bEKG7MW+ULX3fHhYBJvm4zjjxSFKRMmFx91rRm6PYCD9EPPE
	64j5L70e52VAHg3+q1kEFsks147c25fBjgvvMJ/noNiXZOUfu9lYJTQwzkEiQpga
	VzOVcM7rebK6Koi/JlsUdVBmYlEi37QcsZGRGp6qO4fT+u5NWYWYDxd8FV3smueR
	elpZHOkF8VuxxJGZY9UKSAHRsyxq2pu01ePf2pMqzD0pzg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmb5mf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:48:09 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91f0938c499so14488646d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408488; x=1795013288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qX3b7mQNELxSpZp5mVmlrq9OPoeMPx5UD59wpN8yb6M=;
        b=jT1ijWtm7rL11u+gzH//OiIeBxCAW5uz8FcHBjpty9n7jlJm77aDdqwtctfey+lgS4
         qW0yxTLPZvo9ICau/C4zrmkOAk8dBNNaxm317B+rbw4TUMehwsqhlCgEw55AH8FCbBhJ
         yMQdTlURsYoKdFsXqbcQcxNTuDDQCEiqDPQhqncTqy5CH8UuY4O2PWJecI1qxAlg0uBq
         1LMug6CUQBAEctamRa+jc8qjVzUbskmg5WgOfchQPY30jMAe8KMPZu5Z/IeqJubuDROz
         Faw9aDhuyGRQjaGw3uW64LDxegoP9dvsK5G2jGzsXeRlZCaRoqvfeZl+mLfFOeg9eyu5
         Dl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408488; x=1795013288;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qX3b7mQNELxSpZp5mVmlrq9OPoeMPx5UD59wpN8yb6M=;
        b=iEmG56gU4Tp+r0o+y94ZLsbe4qz6cK13a0DpHVGHQz8tszH40kAHcQTB9ED8fUTh7j
         OC1QJsOBqsd1tfE+m/SMFahdFjlpEbKW43k88hrDdXPJ1q06d24XrN8A9ZVcJXlUmnmN
         ATS4hslOEnB0ZzQ+cxdsjBSGTPQZ6utMmNzzqqLtKdZ0vRA8+X5UVg9neXH08iunqav9
         Mc70pwtJc4FASDINtn2A4Y9Lga6r70/3o4b3Iuob9JLssJ4DUxiW+VQ1DsB/caKR3Qy8
         9YsFNsVEfShUcVqD75ULy6oj+TmHP7Kj6XQIoIqhp9IC27SFIlyLVCIUTGN1R5b+9H3a
         INug==
X-Forwarded-Encrypted: i=1; AL+hErF5N1XnzBO7BG3iJlWAjk3Ok2XraAdy0Ag2gq8exG40TafS5khQutaE6YepQo76jrcC3n4PEoGhmkLGsmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+UW16T1PMCPWYcAHExjtZeMU0B8n9AYL5tCmk0oRyZgB6ix3AZ
	xJtWDHlg0atoBFNlV/EVGFrVFJjOyFpNs7xPF0xrIl+AsErKaPbgLxLQm/TSJdApQx1k22Xrr31
	2LuI1ljHtItp5Yd6t4sQ8JW4UD/bEFJdkSBEsVwC2MM8FL/DWk9m+Is/U8vAeI08SAuc=
X-Gm-Gg: AYBFou2RUPm3DnCJUSWBOJRfrKJctqH1RD05DlXBgVmSIrlHxcz63LDVMx64/j6CFOi
	avWdM71Lp4iznVbdCs2m+jgqIeyXBLyFPjj2e4RSAkATefm+D7zEdwDMM0uqx2IaB5njFo38yK0
	vvv/r1M7EbQwhqneK/SnNWXsoilBE2Nm3KPfdB9gnSXwxx+tyDGZj3Gd9svvO+oq3X5Oxy1Un4J
	ysth6vBDTcOhsuAqtVfjPBm0a2yYvZeBiP4LpfDRc6bzkNrjRXm8Pyd9EgROxgNJ+6Dph+G+/ol
	8i5icFTGV8jVT1dq5FG0JOo+tbaCkK0FLu52RI76dTHJzP1jVIorppw/9Kdy2uohFXAGLkFojnS
	qZDYaUNF92k8uOHpQAisJK5rQblVcjKxgJ96xJciN0mvphEUaIpJ/qZ0pSX3ngWCboxs0c839zy
	WKRWCm0fe0EL5B+4nf3NRLugHZ+N5JJDTXQMTVYEgrmzc2ADYdQqc6gpahwjP1vg==
X-Received: by 2002:a05:620a:1a1f:b0:93c:e83:6ba4 with SMTP id af79cd13be357-947afff2be4mr420475385a.25.1794408488393;
        Wed, 11 Nov 2026 06:48:08 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:93c:e83:6ba4 with SMTP id af79cd13be357-947afff2be4mr420472385a.25.1794408487992;
        Wed, 11 Nov 2026 06:48:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157b7a63fsm1027158e87.9.2026.11.11.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:48:07 -0800 (PST)
Date: Wed, 11 Nov 2026 16:48:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v8 08/29] drm/msm/dp: replace power_on with
 active_stream_mask
Message-ID: <yff2ymxuchwtpshwleockscsxerjwuy3zmwm3paspu7rvfoyza@pxarnmxbdidw>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-8-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-8-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CZBZYAKAs4DTqbVEEDMHOBAHaMG25tZp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfXz4jkGJRFigA1
 1Z3KlmrCfjr/H4qn4gNobuB7eWCyaJLrLoXD5T1HlbBJmaaFeb3Fq9feEO+3UuUBvjdch9YD/Gn
 E7ph66DlDXadS0sSw+6V+4preB0FZtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfXwzWAduDB8PMH
 qxtVLz+cmhzvrxpj/bQXzzGsJnXiNlDPk/yUCIgNUpEcDPaYb7x85vWZrnKnnMJpshZm2Tq+Sf+
 NAQwt/thQdoRKHDFxy5gDvasc9ta2+6VO1CuaGrj/UhHsQT7/i65HQqy6EPq2vjaCuc6Z79LS2i
 XCxRcWu3IWmzAlFw/OnafaWE6Hvoi1TtW6as1AJ2rZLqnJyZRSXvwxtLD0o+ca2Wu8jHqKscd6q
 Gw3bGuJPzc9bw1qjx5kgtlB/Z709FqZI1HR752p3VOXGGv8BicTaw2jUNHK9mLMWRllBGlXBBAp
 hMxfV433KGkVyqqZIRW1h+EI30UboXuRjfVCAv1BDYlE49Spj23p2PGzLFuO6nda70Q0ynnbWgO
 JFTGPq9PbB0RJp+ymS7XRISHkZuLrlqzp7BMah41MZ9D8YpNtT4IGtBbrcRvNNRVBMdQzveqSZC
 zN/3KfhyVKOUbbUhRMA==
X-Proofpoint-GUID: CZBZYAKAs4DTqbVEEDMHOBAHaMG25tZp
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af48029 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=8J1jZnWIjLQ8iHHXRFcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:29PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The power_on boolean cannot represent DP MST, where multiple streams
> share a single link and its associated resources.
> 
> Replace power_on with active_stream_mask, a bitmask of the streams that
> have been successfully enabled, and use it to track the lifetime of the
> shared link. Link initialization is performed when enabling the first
> stream, while link teardown is deferred until the last stream is
> disabled.
> 
> A per-stream bit rather than a count is needed because two callers ask
> whether one specific stream is up: msm_dp_display_disable() uses it to
> stay idempotent, and msm_dp_display_disable_helper() uses it to tell
> whether that stream ever made it through .atomic_enable().
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c | 56 ++++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  3 files changed, 32 insertions(+), 28 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
