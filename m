Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201954;
	b=CAM4bN0pjeHhCL+8AYdRx9zWIp1PimHqaxArfgNFSlEOvppRTbum25XZqKVxGdnq2XvI
	 K5XdBLP5D49BU0yaDCEIxddkUUnNeJpuoZCUq6HE/ADx4XmNWBhyH5s6SW2hEMBEir88E
	 SqOIAIl45hxv+dH5uTociw3puj9jkMR6YWz00Ape9HzkK4wvqqwkxGVfZAPCuOBggqYQ/
	 2VrQeLzD0BtJrwnzJCPQ9eZW2QMTLNeNY2GNvAy3me/kiBOXFkSEf6GamgFu5KL2rzj95
	 /+iBaLwF5P03t5yKi5pKQtv44qKgRDSyX5RP3TWXV9V41yvl2yvGlAypLmxvZPVzoVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
	b=Vt5NwlPdMr3q3HPuCvGxWN49DrKEXSrFYPY8an631Vi5kis2Hr/8DDJvRtCyiDkfWaPZ
	 AmClU0tHrwh8aHb+gKrwS9+pGj0Q46l96IDRcE8PAj55kI6H9R8tzcGrea9sXk4C2VGEQ
	 tQQlv/tdZP9lTnN2oq6l15kOmj1fl5e6AJDgOOHjFou/wqXyW2hFKcdGiivvYa3XOTs0n
	 i7KeNE2nshWRZ3MScFM8/fHkVy/IEZVqiE29kbHEdrP3ytFjjtdwgfkno4y7aPnM63IQO
	 71lddditP9xejwiSNg6AR5x5Xyr1GqtFSlmf0CaZFpdDg2RGzx6ABKcNw3JLeRrTOIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWXwGDde;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D16C606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D16C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b4gG80mw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NWXwGDde
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA0km966241
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZeWqgO+2lHgeB2G3uZ2RGo9
	7UeDvnaxq8shefBQPMQ=; b=b4gG80mwz9eOkArK4wem2b/toBhwdMRvOpAazlgi
	QaGwu0u7Z+CSUeIm8cDdiaaaV6VPEWgJxDRpRzAyAmTESsDswyDXDYUdkgWFpKMN
	ol89qlux3BGZGJZaY7AvrxsST86HegLkTcj6z9xbhhevMKdSPQGIByzkP+jkBj0w
	jf1Ptq9UU6sm0/nXAuWg0egt7G9f1xDrnf64iWTmA8ikHndHH+5RZonOUPOuClp5
	k2/cbTn/BpNvlDOygac1DXQsbksoTqpXRWUSAAVJb3eilEOpaGQJdw29PQwUCt3E
	TDGLOPe3B6h9EpVUWVdOBoKUcya3aTTz1yUpU0PGDIKjXA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgn39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:39:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91c7b175e38so23348856d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201953; x=1793806753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=NWXwGDdeUYrW0vxKh0u+YtFQy5NyGqqae0Xgw7S1XyLKN8HkoUDzq7ya6kWXZCkmDB
         ob6u2Wv4TkretpHYeFRKtfdgW7Jn8XzuIKU6ddzgIfJMMTTaUwTAyPxZqHQ29ZGCWne4
         sfm+fo2TrhhnviSfSYPvtzkUgcWpF5eTiW+vw5VZ46Ssopk9hIxsU2OV4TBgLvRs8dTo
         fo/Wev2RT6sc6sW8E6vYkfyDzZUP6wXP//fhTm1vliTXCYDGI5Nx/lq4JynNKCX26YFO
         F+umLlXiu6Op5gsmGG5gbu1FuzTCPpFpHIS9uqqJUqZtkQgIjcnLbWmwJAZf3N+foCEq
         MNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201953; x=1793806753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZeWqgO+2lHgeB2G3uZ2RGo97UeDvnaxq8shefBQPMQ=;
        b=SXqASg4LXEKX8cA+wLjoGKaCuyKZEj8+jDxpnGxZ7HJd9kqMugVqdVi7TCLkQ86Uo7
         F7760155t3gIg3h0W5rShY+tlU5/Ih7tybZDg0nCIh8ut3489xkyEiWXRJHWWMR8oGaq
         DzcnYuVPv0Msv4nreHWS3x4UqsSkNElBgS3/px281Ro1MvQUDRgsZsNi+pJRucuvff9L
         DScqBKG5+xBFXHSS1pkptshGlV5F2PkRw/TLJd0KFXNfCzWE/8tubekGInCiiZ20EsJA
         m0GL/Ce4K0/NyKBHlcUZLjXkjeiAAyqXohYh741sJw+EMYUvHTlJW7CBWsUwOEoVS5t7
         ZSpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYvHnG+JckmUtoiBZ4yIBFOCH8PrQcqkkJIqmROALIcVLPQOtmkPJZ8Ba8uO6yfgkMciyMlsD/itM7Dm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKwMXqqsZIp/LO1DurmfVLYYrZTHtsxBOSQ7neCHKUt9ecEwMs
	J/eAoX39oCo086cFtWiHdtLORAvd0wlsiTVqHVvoCnQl6dwLjUJCL69J3TwNt3VLYGalCv/V+Ky
	VT+wp7ua9HeLKLDuyXqXY366aAdkrZg48rHZfNFWMhH2X8adLPJDJ3sX20Og/IX+HyRocKb3XCB
	w=
X-Gm-Gg: AYBFou09AadFLUVsXQgsqCuk89X5fn1NGOCT7jknCFVtQNoyZmt052LGqv1QBV1GP42
	kgucV4JDwqt3yWV2l1yHwcpZB1VUtTLFod2U+fT5D8UMz4HexqR9gNBDpO+Py/q01uS1bKWcG5B
	jc1Z0UFKkcJYbrqZRJ5NyEUMdF5F3B5gz8sLkd5K8GK4d8Ca6/2AxvjbC/ccprB71oJ/V6QskNV
	WbT7rgLPwjl/lpzWfl4OD7oX70fIhfsmyW0l1dHtyKq+wT/6ld7E6SKSXD7L6WQnluWZGtc6zFo
	44OIhdpnjvOeNUmvz0i2vDEI/kM0nuvHUheM9dXWGGcDqVZU0vMSWUyW6S3qQ7fUxGEC0OSGiq3
	cRxjZLxdUlAYXUdHmCLvtF1Q1gfSWQd6ylNGolel+a5a0RGJds76VtepFIUUAFUUAOw==
X-Received: by 2002:ad4:5f49:0:b0:91b:f698:a409 with SMTP id 6a1803df08f44-91c7d1abab8mr46385896d6.40.1793201952477;
        Wed, 28 Oct 2026 08:39:12 -0700 (PDT)
X-Received: by 2002:a05:6122:e208:b0:5c9:a60b:e5d8 with SMTP id 71dfb90a1353d-5ec4ccfee2dmr1553631e0c.18.1793201562412;
        Wed, 28 Oct 2026 08:32:42 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd4be6sm26641291f8f.37.2026.10.28.08.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:32:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:32:39 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
Message-ID: <iw26iktbkxacfgbt6btvh6nd7u7b3wvogh5c6sgdt47ve24qpi@wsc7vilt3bge>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX7GqEyUPCWn5I
 XAFsWcucKGtpDmGaZbD5ZT3CBOCYe29VEGcS1gmSpXJobikvx2fkkOdsbHGz/h63iK9HSJ7W9gv
 enRTMkgz+j7YV7ul3dcC54dH4r2lBfZsLA4KLhSqSEy2MX6CHuNuW6TMjwT+WrSVBLWVEhPYAsQ
 CvYqOaS7WUNRhPCAFjTisRS206oNhKu5E35PznfDrxQJpeexHHYnn0ktRwH+12eRalClKECduYo
 rXPLj46oHlZG5YXrN2788e90XnEb+AYZ8gdQDPAe9sh3zxl25VxOnx0vzUfhIn8eWzNCC2JScUQ
 gG3MlAL11+2YZNzeU0av3HIsdgXIlpzXMez1eGVE9+bfW5u3TKDh9gNwKXerrOPLAMAv+h3d7Xt
 xFsCgOxEU9JDNLDAJF6DFzQcw9Tl713HjlQPUdaiKTK/ccHc2h8/L7ZbU4YUbvPvcy5aksoejrm
 1GX9UAh6aSx1Y0FwLVQ==
X-Proofpoint-GUID: PypAITELp4aKAqne-Kxh4q8ibD9P-_yD
X-Proofpoint-ORIG-GUID: PypAITELp4aKAqne-Kxh4q8ibD9P-_yD
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae21721 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Y5GSmcL30hd6fLb0oHwA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXyZN+Jl1HfdgJ
 h5CXtq/kdXUXXlBrNHXa1Sd0/WCi9/2EBE5IMY5F1B84aQptoQYXXUDgdDVwSkV9YoU3s2JDrXC
 FCqsrtNEsGGAsCQF5bOsqCvYnDTiZxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-26 16:59:34, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
