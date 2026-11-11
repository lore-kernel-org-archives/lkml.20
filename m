Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794421000;
	b=L9j9bP+0y9ppmFPb5gb9aQxza7Gasz2rsOR6GCJUURL9urJ+PnNAzmFnLrIHDxyiwYb5
	 O97iDMDRM77bPXFEn7z0k0ScK/PjAgNUwoqzrpp940G5eDfCloo62+Fzkr7A9xT9tzXba
	 r3r1gA342SnwQp6H0Uv1tgdhXBYdufWFii9fN+DN6K0ovpc/zsprxXW8DihXqNRVo0c4Z
	 lGuIAxYRnYXum3dFDBaL1xbxT8Q3I08CLSs7ul0vcBdLt+Wvz0kmXWRKKOJC8dsbsRif9
	 hpHyIgXAoGrPn89g/h5puOZIg2pRq/Id+aiAJ4VNgI56/2kdWDgL7QbPMAP6u7PPmtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794421000;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
	b=Gw/UKDhceNPzjgQvynlnoShhKeTdRcsulKYqIC2Cq3L7StgpqIWb4DmWpwB1KQNLQMkt
	 VQqiDashbmToP2NtXXawokDs1tyH13xVMH92UgS+2yQm+bc+tgFEjJvc2oq6VGlPgI7//
	 CXx+wkIiMo/pWEwskVffpyIMpGLdYJZ6qqZI9u+u0Psi8zETSWCkLT+R2BURCHBWFb8X4
	 VTKk7nLqk40BSMNqIFyXFC2tuhZ90qEZZDpWt3x12Vxnd7cxTdZdQbXUCGB/w7h2BNo59
	 u2tDKETyw82PAU7rNMxHvK0VsVu3rVcN1M8QtIlDPmwGz6gz+mOniHb106ZogB/MtNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOWsr2Vn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6giKNEN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF194606A886
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF194606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OOWsr2Vn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a6giKNEN
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABHtF683041586
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TLvjr13IKJDJEa9JzlYzaF9C
	td9oFkXJXsX5JfawbUo=; b=OOWsr2VnYk++zL7ab+bpCiDSHWgjPYre8odEWsJj
	0D/jrVA8HnVJu6uTeKMEUgoR/SoiiXCzyExVur1XTLBu+S8/HsBzIZ2IZGJxKXjc
	3J1LAummLuql+ejpzrm0Mh3Wfu3CTQi5Cnz4tnAFsMHPrBivdIIgCX5aN4XF/X2F
	Msfgoe/fdaJiJ0VorMmqZkjXxqfZeFF/o40MhKpc+nw/EhMB5aV90OyojMTiS0fA
	wa7lPpLrNidjO/LhqX/pAKrGrcJUs3s8G5VXQn8ml08PpSHniHFhydHvfBAppix9
	nG8y8sS7EKIzgxhiYJpSKRkCjSJ4SWCJ4J9Mh+UBCoV0hQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmc4sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:16:38 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ec3e192929so773140e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794420998; x=1795025798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
        b=a6giKNEN1AYUjHnB59jnC05WCcW0Sqa77IH40uWlxsVLWjFKhG8VhcRekLkACt40Ac
         5cT4QbcBQNL5ZiPLGYwoL7MTNOSgAJ6/J9R4eb1mwSdSf86cEaV4ZOvMbhiHfy+j4Cqk
         j/RNbGmqUERxlU8fnOfXnnFEinmnkWcT2qQxnsUTsXKi6NnS/7gdCNFe45g9/yzCaHW5
         XWgEEkKE1FdfemQfHQtBT7E334e68TRBy2cfMQ1A4lH2uM7Ay+9hWoFQbKGhhPAo4846
         MfE7tdnv7rZCYFdP/CK/vMWagqmgYnV6SUF/zK42YYNxjdCN9/QqNfocJrEc3sgjnnNR
         m/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794420998; x=1795025798;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLvjr13IKJDJEa9JzlYzaF9Ctd9oFkXJXsX5JfawbUo=;
        b=KWBRw1wjaODfg4T17aGenbTeKxbDUtHKnViMeBlcPavqGquz0TXYm2Hpos807zzlXt
         c21vQsFTgrbmwTwl8xb9R0+wa7jlOI1393tsxypUZSVLiZgOZ3Ozsd0vHXpfDqR9ktXz
         /lFzbvK35Tr9JMrBNG1jT+gPHpHADtHFgOEGSQLLtBWet2Ce2KxnV1l0GRgavUBvn+Pz
         KMvfA2dh8bNi21YIUOwXvUm9ce1Pe8fEFjhGm4WP2ko6m8fwJFrKrDCQBiok8xaZKOJ9
         s/NcLlIRGNZchfZvZeKKoCIb0t9et+gMxcwRV55MSdjce+ve8417a9v+dnElFEqMQU1T
         Qf8A==
X-Forwarded-Encrypted: i=1; AL+hErFmVmaegd1SFt4TzjPgt9b9Tk91iEwY81jWwHOL10SfJVO7BsEI/LF1t9+yi+i2DkXi8QqUyGGwIecZpUs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xiTE/8dqH5hvwiZMh7ZslYi2fCppm5EB/9fdHHObLVmMrjGiX
	Iu5FfB5zwH52fu611HnUBpVHFO3IjsCoQLnTQJUYdUlOfEY7KiiO51VWvte7G3C/eut/W5d+yKq
	7uCasITi4dmMfITi60iBpGqHxcV8PaZZTJhna5qWDxnYoy7E6sQTN/34orRKmrYfXVoI=
X-Gm-Gg: AYBFou3caAK7fhdFwVjkvKebomMxEthshqJb2KFrkz+k5APOFwKzpAzD170NM5LXLGG
	S2LTUBLa1m2TtYnY+xnQ91bQ0Sbx80n9TJoES22bpVzzekRkEAThTzsNf/6O1sF6xBTUIxS9mky
	9InWnKxFeqabA1pAXSGKYTZdy4hTXKeUtocDSANlMzmCYFAAQpUP12VRKGazLZy+kCLK/DxA5Bz
	Fo9p8GRJr13n0HIuApCTzhqHxdO/tZzNzEl4tNgSmSgdj97D6RQQgGNUWIWMa5aLlNbT9jclDpn
	lNKGbHOZNeGKmtJwWT2V/dU0quDi3GptC4HbmcCgEYH7fE6omCmciMRdwx3TbPLM3mw2WHuEZRS
	MUdVgqZStZ9R3xK96L/aH/PkpHwCU7vDNGVQS+uFVgK1UinpQOgEal+ZoJV3Lqi8hYvX3jUgyCr
	PpO0QGu61w6WG9Z7J1VNx4WfP3FT/0+ezwGanV3F4DrjQn7CfpUKqLNlw1UAXrFQ==
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr1196139e0c.1.1794420997976;
        Wed, 11 Nov 2026 10:16:37 -0800 (PST)
X-Received: by 2002:a05:6122:1d12:b0:5ea:bfba:f540 with SMTP id 71dfb90a1353d-5ee1c2a6763mr1196076e0c.1.1794420997470;
        Wed, 11 Nov 2026 10:16:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae092053cfsm12797171fa.8.2026.11.11.10.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:16:36 -0800 (PST)
Date: Wed, 11 Nov 2026 20:16:34 +0200
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
Subject: Re: [PATCH v2 3/3] dt-bindings: display/msm: Require DSI graph
 endpoint
Message-ID: <bxmfcl2naw645t643b5c5lomlruhpv73reawmxzgmzn7jvazkv@fkodaq2ga4hx>
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
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
In-Reply-To: <20261111-display-msm-of-graph-v2-3-fdf8fd97f49d@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 7Avea3bbMsBnTDi-kEoId-v2Oe_SYNvG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX70UjTmjOI/Rm
 QU7hWPBpP6vaaMom1/hVTUilIGEn32CCi1auF2TbgurSyw2bV1yTDd0Sva8/IvHqc0xCM/pdEi3
 IglPLdEjZw4O/pYkTdyuIKElQrXM2lk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3MiBTYWx0ZWRfX8De0habE8blc
 nPFol7/vt8Luny1TET9azkkUmMKBK1a7osEsfj/m+7ip6osr3qh/IogaqhUIrK2DBN18qIkrAU/
 sSjOQB7jJ7Rtim+bLp/Sl+BfdD/hX3bv8oV6bj/49/SggXR96ibBV3wTkw0xjLEb/ayLo+FDCiD
 MhVD+3WCDhQ08X1Jc+NFyRB8IwPOyM2oisWpiOEHWQYUF9d23JidTmwELJaVK66irNehLOVMfZC
 8K7s2dlna7VNC9Pe811WH3ucvFvf70UhLk7FJoHV1T1QI/K59bPoYsG9+KIb5KImXpwpTJH7xa5
 mWMkfSolcum86afaJWq3erIyhGI6iwL+fkvH07qbnLA6W/umzvlreDdM5+6q3hat9KZVPmHqovV
 Ux2Mp7XPQB6gCSeMb6oyduJMOdMrhHWZkeMkmZtqWGyO3mK1lBi+wiVB18Kc5uVSVrOKQc/uBBN
 OwBF4nDh+qLYJP2s+IA==
X-Proofpoint-GUID: 7Avea3bbMsBnTDi-kEoId-v2Oe_SYNvG
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4b106 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=lYOVpaM7r1jpJQzodxMA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110072

On Wed, Nov 11, 2026 at 06:45:02PM +0100, Krzysztof Kozlowski wrote:
> Technically, DSI controllers do not need OF graphs with endpoint to the
> panel and could rely directly on their child node (when panel is the
> child of DSI).
> 
> However Linux Qualcomm MSM DRM DSI driver never implemented such
> approach and it requires a valid graph endpoint pointing to the panel.
> If it is missing, the drivers will silently accept such DTS in
> dsi_host_parse_dt(), but later fail on dsi_host_attach() because number
> of lanes is not initialized.  The number of lanes is initialized to safe
> default only when there is a valid endpoint which is missing data-lanes.
> 
> Extend the bindings to validate existing DTS to match expected ABI.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Please apply after Qualcomm Soc takes DTS changes to next.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
