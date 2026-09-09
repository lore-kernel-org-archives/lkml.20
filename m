Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F580569F07
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965709; cv=none; b=EYVawVFb7hNLJma0OkmSUZs5QEMWKdPjJBuzaJxNcuOPPep/JKen2DU7IHboL1G2WOkM8gk3Noljee3RLAW+NjL6PuVYqjEx3pnl7t56xw5cIf6i8iRdnp7YdvhOCYqGlsl3LSJJIABFwB2y1UwKjdLnt7DJ0wFnjW/BJtteBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965709; c=relaxed/simple;
	bh=BTc0Cp8Dso1c7YlVq7HUrCHive/vuDQehrCWv7Nl9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5l+j7xdlX82xKBG0yJXBwLTORQdDSOjKbneNh4DdML28VBEMuWubXo9jvtLgCtPnEhfvtzogvHTrQNjdT0gH6ABu9eCQJp/FvGoxRxhrELnoKon72YfDjPWBq3iobGLFdYDS48BMoViGEX44pWkD+iZpAHF7vWiEgxVkv/Ftkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i8YAQBn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GU6K0TdW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i8YAQBn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GU6K0TdW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU4UV1723123
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:55:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=asWMQq8NhdYswK4MkiaQeCqT
	pdZ0Hx/tpKkyEs/A5J4=; b=i8YAQBn9BKsroQ5k6a3O08jmYpR7a3+yMiaByjf3
	YD4EdWjbv1iFVTXYm4u/fU10kSUbb47CzZJRUn3qzpwW8Mo8AyntOxZw70moZNtP
	6A8ANYZtrpxojW6XfwOVDn3VGW5yLcuo6Vn05QwROBdmOex/qh/OaC9/ePh9p7ut
	9rRWj5AUna21160jWbg8ug9iosDTeXk4YDr/GgLbTlWnuB5vRczQByTuIn87rhQ8
	2/m2PTHmObEy/JNQdOFVEMqTKszy7lZt6SjYExJfDI/8caXYd9BlPsz/aitIJw2Q
	glvpdFeFdJUwo9jwn/ALLbRfK8jg8/GLDEO7UJzGbvXI5g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns6hm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:55:06 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc489e7a701so3809307a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965706; x=1789570506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=asWMQq8NhdYswK4MkiaQeCqTpdZ0Hx/tpKkyEs/A5J4=;
        b=GU6K0TdWX73d22hk+B1CB1dNxRDUDls3l/XZwqM5JbZYwEzr4GuSjxjhiWG0/Q7Epy
         cfJQH50dEGih2t6WoAPnlXxq7zERMwo3YmVMNRPQd8vUpvXuJWKwlxVJweOmpFB2f263
         X1PJogjcW3miVTRIDV3/z0bgNwFSe5oZJ2J3kd2ypFe/EJmh9pZkXFEgZfl/sDzTiwIz
         RT9dTdAFXwZr0EmPr/SuR9h/Z3RJk0b5RZkBJCUngd6O/NAv4Jhavw5/RIy9fP/r7OgI
         GQxQOAv93sEEt9UV8W/pfxBddBi71MwPEGMef6R3whgLbAMzbP0AuMCFfO5qdCsnGjDo
         E7bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965706; x=1789570506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=asWMQq8NhdYswK4MkiaQeCqTpdZ0Hx/tpKkyEs/A5J4=;
        b=BD6MgKA2EkGLJ3H3vu8E+NVrUkU7LIgodKDA4nk1DdQ5iaSxQGW4KR10mRn6GyBTdf
         azcxgipaWyEXfNnCxrM8MecGQ287stcoKMWRGHJ5sXhVWkYpxkR2ZSTyaaHQLTTc4DP5
         0CekCQ46taiWtkzqHOrine1oH2bxFpD6/aqqLpVfPEkhyeNx1hfp06GdGwpdO+yxUeKf
         ATCoEDO14thPwgiPDyVFjNVwg2Eme9YDzBW4o6hVY6PeitQf/Z4h0KpdxhhmqvjUN8iq
         muDrsN2zHRepWIesHWHDac+ivYpD041H5lrOAU0ReVfTsc0zrarxFrtCOfhcnM2U0wNM
         1M0A==
X-Forwarded-Encrypted: i=1; AKwUvBxE2WTbmccOpxOqzlgRf36y8ZNqCWC4kZQ4GjerjO50Gbu6jlrNbv8YQyBWSmJ939/feHmTiixvX2/l7hU=@vger.kernel.org
X-Gm-Message-State: AFuF++ldwCd/lol2Mtttl2ekCW0vfOoooC1zATErUPJ2UtgmM0rH6uQM
	dXihPqpHtLX/gzsj1gFzMAR7R2RQ0fGxFO13mwRTamcuiphr6bcMjSYV4KpBwCfkGd8UByZMgxP
	epfMWr9ggNEmsw5oy/KwBtEOSTWPitGe9TdublS9BasVPWwx+lr6oQKq2Aeuz6HAdQXs=
X-Gm-Gg: AYBFou3i1khVPJ8SWWLyq/J75CoyuI7gOUaT0NEGY/tTTAnNUDM7XEEMM1cYmDS23yn
	DTs3wP3tYZnXjzEgHJ7/Md4QzwAMegAl3459duetpHTnFRIPfYoBtEUI5vKlFdhT6oxk51S7+xK
	WcQeuWbIbZTaVNW+UNZ2PBZJ2F/FDtfutGYsSi892MLeTHORPySpbkNmsuBN+Ik4eUqKv264jMw
	rcRW/nofc48EhxH1YyWiWRtR9AenZ7w4TxQbRlOA8H13Tr3HBoCwjopkjXIztIlpL64Y3fHYaUx
	VLa1f0+Qa9IhGbjPocZs/ppr8gHsgRJdsr4HBBlAV5ie9lH2sYwsSDPL9q78QCA59A2gL1D0EZo
	vfOldlKCDbijNHhNjcjecwugBJiIBnALW/zOFta4mcZU=
X-Received: by 2002:a05:6a00:3391:b0:852:355b:2430 with SMTP id d2e1a72fcca58-86946542bcdmr2560656b3a.10.1788965705525;
        Wed, 09 Sep 2026 07:55:05 -0700 (PDT)
X-Received: by 2002:a05:6a00:3391:b0:852:355b:2430 with SMTP id d2e1a72fcca58-86946542bcdmr2560577b3a.10.1788965704982;
        Wed, 09 Sep 2026 07:55:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045f74sm7195955b3a.10.2026.09.09.07.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:55:04 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:54:55 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
Message-ID: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-GUID: lbJ9s8L-_-dc1FzohnWbGedyL4fn-RBO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NiBTYWx0ZWRfX9rpA3dz6eQwn
 n9ssQG+R+vAYwrh6T423/Y2ChP3ewhfVrxNqu7CyUhKBhKG9JYSFDxGTJ8OhhkdH3rH9K2r8fZZ
 uteyIug+H34HQLI+R6HaZIQkskpgxGY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NiBTYWx0ZWRfX/L4v/6PKXbys
 z9YRrYo3WZXMr8ETNRH8U6uJmlGa89VzqApZYa2Dv7msqmrZHss6sjWPocqEDCo9fLzNJSI8IrI
 yR0Ke3Fw28BD/QD1B2GBgkgIJ4I6CKx9dcUqnntZSiifMn4HcA8zRE9euPEXyWjLNIX5XappYHm
 t/x6DSy4d1GDLL9tn2yZnnmIq4ZVcKMtVgKJDZJ7v9NyE90gXv6hVF93Dz8NJAggbpfIqtVvpC/
 AUooPhUiH/rIfxrK93TaQg2wFFqy0qJRPgwwcBvQZFcBkSoFFcfT0q26IqpM+Sq74ujWM+cBKgR
 FxQHolKzRkbyhmj4v2sTyLE/iHl+9QbqWI6FWswbPaE8CguEmMlq3ag2Nfct9O3USH8ctoklpjX
 8I/FDo/v5T+jRB5vVnA+q082K0bqtuuVH/svPjPVipJd83ZBOx2Y5Lh+Aw0AgMCJNTsUUfVa5uk
 NVmpLwzism98qDowTdQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1734a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Wwyz3RtZpYwf1FArlg8A:9 a=CjuIK1q_8ugA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: lbJ9s8L-_-dc1FzohnWbGedyL4fn-RBO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090166

On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
> Document the bindings for the Qualcomm Nord Ride board
> specific sound card.
> 
> The bindings are the same as for other newer Qualcomm ADSP
> sound cards, thus keep them in existing qcom,sm8250.yaml file.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..bdbaa8c822fc 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -38,6 +38,7 @@ properties:
>            - fairphone,fp5-sndcard
>            - qcom,apq8096-sndcard
>            - qcom,glymur-sndcard
> +          - qcom,nord-ride-sndcard

I wonder whether we can make it SoC specific like qcom,nord-sndcard,
so that it servers both Ride and RRD reference boards.

Shawn

>            - qcom,qcm6490-idp-sndcard
>            - qcom,qcs615-sndcard
>            - qcom,qcs6490-rb3gen2-sndcard
> 
> -- 
> 2.34.1
> 
> 
