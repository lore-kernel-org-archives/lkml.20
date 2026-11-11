Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794420276;
	b=ZwijImZifj/bly1NyDL9BDC9wXVVL4gjKQYDfpvf981Z+W+1dImz3FtoPUvfiBxOQwga
	 rUDM5sHcqgUaAZ9tp2CUGcoXCbig+70RCgnpvrr9vxrZbbYQTcupCl+ik8zMDqfIaysyv
	 eDDFDjxecfACW2d2xBWSrRCYJQpZ2n+OBBa7slvpNVLc0Vev/Ti+wErPkECTIfs0sTHR+
	 Q/pb/dTHd50/ruCCfkivbFxFjlBFJ/ZNOWi8hDxo8wmdifjSIO6GcDPNQJhmPc2bCSp/0
	 Fpg9SoJNiL5fGBWXQm2ODfkWboON3QTE1V4/QBYh8xMEzbC3axeI6YpfNf+RCidiFrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794420276;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
	b=uu7KvrD9+tPXseZ4zFDWnA3DCVAVsPN/zoetR8zilzmMBVHzv5yLe/JuHQbKqzTq6nyq
	 3GjZJJdFareDMfnTl0qBkSnIf5RezZves+1Uf2kMV1ZsX+uemEBVlN6ywZwU4CJQ3b1ca
	 ArSOEktOHam8NEw7ZgbmWE9pgdl4AkKO2U5U2cHoqV7rv9h4Z2dLHAHgtIxf6Ac5W/aTE
	 zqkhfCGDlIqodRHasGyZCgM84CSpOhqb4UGVIv7FZ3rTxdZlL6EZFxnFvxPErgOmDV4Ag
	 wBt7v6sMlxA0es1EuAn7+he3amzlpp0M51LDd8Lv7gdz6AID38IO6v5ES8kld2kSO9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Tg/jxDjT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdGMCfxW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218BE606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 218BE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Tg/jxDjT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdGMCfxW
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtZ0V1399977
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yMzNv0aTJrSt8UYD2LUVyq/F
	8tblmivrrCSb6+nO2Ts=; b=Tg/jxDjTx75J68MDIuAo5nCo7HnZ6v19JjFiBW4d
	1q5066SF72hwrQeUo1kEL+D/Vbg36y7iYcH8lEoIYlLioWpOu43iFDFpXKOo1OVW
	DKcYeCb1gtKuzqPcB/K2dgUbUlKhawt1ASywinxrRLQkFxMYQJkYhE8gaB22ftj4
	OITHIfoXK8kD4QNlPhZvIOSGn0CP6BpMh3Zddyzam+pzwDkgQzqkZzrKBUBvEYZs
	3UwpA8UpTMFsZTd06CqAWYu91z1j+YU25Nh4RkzmUUa89yGEkySRUBrpUWKU0kkF
	HlgQKxOaufXnYbur8AZ83pwDuk/C86D9lZh6nvA3e5+RZQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv9b34uf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:04:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so3250287e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420273; x=1795025073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
        b=BdGMCfxW0qml5/UbPKV7+wMp8pM8vLh/0QBYyuK7eccEQzfzsnWDbqBqam0lMaGvTN
         dqcZn5BCpTsvrF4Y5SdZpKkD+u7WkiBYoLCx/v+elbfidtxob1vgOb2II/8pGKoD+nOL
         tdiRHi0MczRAYGylGuR8/qTc7inizX+d4E8YvcwcgN5k7+91ES4aD1kWKF5ygGjbGFmN
         f/VdvKsiNSoTiQGciuav6CfGy3Jvz+yJmVKepMMmKVlqfEWCKnWFe7VVBYdjzzOQC81b
         g/u/O9PgKE465ONkNizgYHduX+tJN6zfD4i2xHbKod7wXijkZnvPpe/yvEBHJxS0X2zX
         w5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420273; x=1795025073;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMzNv0aTJrSt8UYD2LUVyq/F8tblmivrrCSb6+nO2Ts=;
        b=JlvcmTMazWEIqpOWZ7s+lvPZ4YhwoyKNa0M4seKNX8hgalZMoRT241aD9cx208J2Tz
         2voBFmHmSaJ//ON9DzSHndhMfQQPnoI4zspsyx/D3vfMgFAH7R9kru2L8SfVRKditq4K
         CZcy56WI2ItRFsT2et8ubOiFxpVyNAbTUvTcrLAvYNhDjczBHB5CslfUd6ZCkbwNjYrO
         VcMhx7jT5+BpjFk/nVU5JEdxjI6+tIWcKDRYFQyUv7h5s20bH9FFjKTMCAc7YdmeZDkT
         J+iKEeYVUuY33OQ4KRhUZPSofs1D+Ncy4SOaPfkCvsbYjqaOIZKxt2yRgOk2ZF5/ZR6O
         dR9g==
X-Forwarded-Encrypted: i=1; AL+hErEUq0FhROPt2NRlwT67oYbM5l9cYi+0UrI4s3s8e2mJ6NFOTA/BQ+K9ajvaygfBcbUgh3xqVcbHWvrKP7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Kz218dX2g7MHy45DIeEA2BXLHSPhp6pqONmlvlwd+KwF25K8D
	tMpjXXIoQTTJrABOJz+1839Bk1jkkRk9Gb7O3+Eqv0w+s2MeTdkuJImalQLwSP8pKzYW1Kl4Zy6
	olSiCGr+YgEXZCBqWZ28PekDGazLaLgbN5wgxlw7FXUE79swOQ2DMzt+t2BtRsRlBjzk=
X-Gm-Gg: AYBFou3eo6NgOd0MQinlbrHcgjT1zRJyqYW0J256SGSutWPsfSyVqsfp8dfG6nUAAbw
	nOPTIJ6oUK6+mlyq5PV1WhPLtS4bAasPfplbPXAtPMpyldYpm69e5jNxV169EBlsKWre/IQKEK3
	+ySEmgRVcJBi6syNlQR+50k/fARmbu7b8ay2R66k4z74Qw5tRvvrOswU87FWDpNFI/dtrQGyeZf
	38uzA+pl1K7mLHZ85ZehrvTSb62KZC/wXd4+y+37FnsDJs9jXcVanvyfm+6Bg0AndmNLDURAJv6
	5Y7NfPY5Y5/fsEZCTgBoFk05hAYz3cklcLGzbqfbhtXh2dFIjUtK3vCUbpU6b89IRp70/stR79e
	O4QT3MJ1rTflqHjEonVwqLL+cS19t89yTG6AxqrMGevTXzhZxdn3NtzIE0Z2muzvF37jSRt6OEj
	ye1r9wZie3JVddn3L98xQV6qvVStS6klhtXLJIgE9+hc460/Loii23M1Mfp10S3Q==
X-Received: by 2002:a05:6122:3c44:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee1c4ae46amr1391407e0c.22.1794420273183;
        Wed, 11 Nov 2026 10:04:33 -0800 (PST)
X-Received: by 2002:a05:6122:3c44:b0:5c9:c60e:3a4a with SMTP id 71dfb90a1353d-5ee1c4ae46amr1391338e0c.22.1794420272673;
        Wed, 11 Nov 2026 10:04:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baa637sm1056344e87.33.2026.11.11.10.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:04:31 -0800 (PST)
Date: Wed, 11 Nov 2026 20:04:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove
 bouncing Mahadevan
Message-ID: <2gfqgoiyvspgjj246a5go5ij5yrq6kvgw3vv2ttdbn2iobvbqs@bronlyxmhjqh>
References: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GKGdgeNK c=1 sm=1 tr=0 ts=6af4ae32 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=euJXWGPXM6RQpXQweeQA:9 a=CjuIK1q_8ugA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX9l0EitU2qHLz
 BjkFhwh7jqQZUBGroMltVyC9qRnC7KWfYw52xO9uICRZT7WAR+U5NNu+P+4hbj66E6vrVuY5LQV
 1g4e0hA6kGeJ4hAitIap6Ey8862DN4tmCdNGSgmKBIuJ6Vg0kdj2Em5F9/ro75cCy3rZRxfJplt
 5uy26xBcnMIPIH6Tu5IVlZ/QT7eg5ca6v+qh569RR+nMXBCdTUL/RcOKjXkngkFnkbtTHdA5x0E
 bopA2Qt+1gZKZgPSEj8mmIKCjp3K9t7N7ucXOxZRN7Idd31vVcDlywuX7PVN4mrp9jw2Pt7rvNS
 pLPqNvzgdlegDfQQMdvbmHDgMZjCEaFlluWrJwcRRDJpG5Fh0VrgExE1/RFTlNhQUM276m6NquV
 2zBvH+ussrSHbQwojf6xaOf3EWqvgbkg09KD3TnQPRAMSN/tWS0wfBUQ6SwPpS2i47rzsvFy5cL
 FbeFFot2gaZOezNfKJQ==
X-Proofpoint-GUID: lGfJRfKFX6pCVceEcv3W8vsMKDu-P-ZB
X-Proofpoint-ORIG-GUID: lGfJRfKFX6pCVceEcv3W8vsMKDu-P-ZB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX9lIMXF5sBXxl
 HIe9oxZFv/pqkvH9CT+BoGA490k/W9HhsY+gMkR0oFSlKqQTu+YjOESGuS20oiDQt08OHvGdnVB
 rD5WJqK0mHG7IITBRGkBgdHtLGcVZDQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Tue, Nov 10, 2026 at 02:02:56PM +0100, Krzysztof Kozlowski wrote:
> Emails to Mahadevan bounce permanently (error 550), so change the
> maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
