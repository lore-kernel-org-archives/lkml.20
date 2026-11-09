Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794214020;
	b=jUwsXutExz+XSKeKF34p46stiYhf3XZRpPLxrhNo9bYTAXKnexnogcDr/fMHef7hH/EF
	 mJkAn/FKwl7thkpmRi1JvtBkSsglEV0px1Fu8kGvs8xLZfDWMzXFOw5UywfQDQHy9ecPP
	 6E5ygfp2tMsJgeRwlstVfcx5PsckR6HcSnbUS8V2ISgcxzBHZ+74jYK+rxhKe897Kbkre
	 hR8uCuleVwScYt4n4Q1973LDfpba8eYyA0fI/lGtyAs+ignzf+QDOO4NN7LnuEnB8wSMN
	 AuwdXNrkQmjBTmP1EjCxlgsK/3VxpunZOYEK/owPYIj1EvzyEzBctSssYDCoQXOinUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794214020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
	b=jv3mbE0cMkKwtA5xPIFvcfCRgjLp2AW+2CTeb3bid8nIsu2Amy8UJLki7BW/dwaIY3uw
	 8Wd5w1seVyJe+xf4zwOcAxp2AEt5iEsh9jBFCpovTWsQxkxluntJNCBiNWSTTwCphCQQ4
	 XoRmH8qf2pOyLT9Cl4/cBrKzuV8Q1Bpn8TNgQwZnpX+8HU+jbQRQ+hdJp2XI38uddy4lt
	 3IM4eF4uX/j+YWxDqjod2k08FxDtiyUEmvljfztyXLZgdTrIkzXGphYjlITotV8vkPDBL
	 r2VLw0BmwEtDCfL6FcM203Lo7fXRCtgcwWoDzd+WuC3ltRoUvujOgcAAcxyj8bycwLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNta3G6+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTTKNEuy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FA0606A323
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:46:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11FA0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LNta3G6+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MTTKNEuy
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969vRs3580921
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 08:46:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v2huvmdc8Y7zILI1SgjJfTFp
	WXV5Q8d3nrEA5tfFZCQ=; b=LNta3G6+vNq49vsha5Dm7qofdiX0TFXxieRRNgrf
	awtXi4t5otY4knjAvKlqY1wZ+U26SQGKiS4LXHBzRrcBkZYYBPyM6+9WBouD8qke
	Oe+8QaSHsLCTVfcsng8RsHiZq34HMvPy/wO7sUWZ2M2kFvkLgWmW6Q9wmT6Hb6KZ
	DFGxNFoU/l6n05oAG2+DyIqoQiSFnMNKx84Wc9l677V+7YUrb9e1UguEycIi8M02
	W28a7BUden45rwwCF9se/jZw5EzpEjrzP0KfIQx5HK8WGPmOQr/QrZ1gL4tv6AlS
	QJ4WacI/tiOhc87hycgafowvXhc2vzTFHeNRbbCqkq254w==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsv735ekb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:46:59 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99b8fbf29a9so324192241.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 00:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794214018; x=1794818818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
        b=MTTKNEuyMBqSdml96P8JXaMu8LhAWxS40XVL6FIJxjmJdXaWTwNEpFXNZyAG5UO4Ir
         dLTHNubgVL0kQ8uZ4hPc4lAF7LNybNxJ3MtRC3fJdNLNp13P03iy3hhgYP4YqUTui+iW
         Z8B4EMDbkurIteXENei9MaRPSYhKl2zA3cHt1VYev5d7NbUDRK9UQbo7jwB8s/+nnH4v
         cfCsa26vke90kGp86/uYuBULrP5UQY5KDpYIN+H4WboKugvw9SUbOerT6mkPjQPAwKcl
         7DLgwvPnqBbCk/ROqB/TLhdmm/c6Ozz67CFOZQsNT46WZabdGS3uZDaaixUXZBm4QeGL
         2e9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794214018; x=1794818818;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v2huvmdc8Y7zILI1SgjJfTFpWXV5Q8d3nrEA5tfFZCQ=;
        b=l99tAxkIyKJCJ7+rllESDxONDbtbDagNNTZ9hqJpz1U2drEL0O/tbSOGuNty3AOsoQ
         ih8/JWhUAUpcfeqMHu5hveocibk9xvfYcKvhuaef5Pv5QnGwtuh4yygUNNn0PFWOHSnL
         wsC0B2SRjBAOA0q+Hwp0V+phtnsaaAgJllBWHWzSixuEwyC7/hGpZUU+XAL9K9x0LyRl
         x1S7951S6u5putUiUr3ydiKfBnpx+fra9+ZnnwIQKI1MRdnTW8u1zPck/Y63eFgIJicI
         ZH51Bh4J32CV1VKuP1Hr2n9B66DB6BYfUsvgueRAio/EuLjYK5H8YDv6/ZYgGqUJSFqI
         QEUw==
X-Forwarded-Encrypted: i=1; AL+hErGP9/etR/ll/gmq2qTf0hvxiYWaIAuMnyi3aD/uh1AaiO8CwzQltmXSQhmwjvywY6+7f8cTfofqh8OG5Vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XUoG17DFmtvbaHOAQP9Gtsz4R7l6zxGCv0xZ7/lYrgxyvF3QT
	hsKgwHhw+0p8LyaMnaKqQWOo/+0drf5Nq6jsvBXpzA3nIxHdzsXS9V0A89YIwRljwAjh6MKOBha
	wkahLhPRtdyn1kllm+YW08NaiCc2EdqNA1lQzGsq995oJrqNaASNMKp+TnAmE/rzImmE=
X-Gm-Gg: AYBFou0y6e+adY6SbmkaWSon5Bh5aYMiEyASgtDVZmAs8i3+axgB1VxG2e+WNdEBUGE
	GnLRFblcEoYp9KUWI5fb05o1X5zLQumEHO/Nn7/RAT+EdlPp0Pe0OgZhoDM3PUpG8J5QBejsWv0
	e5yCyO94VTJSY+ZyRzGfchLpLqVQbwrz2926tpDTSYZs1grW2Yg9nD7tTYGSpl0maGxYIXxIHex
	yBwfll6DWag/esrVvFtUyrnbJq4whPo1rlRurP//vdBz/F4kgBz7gER0HXNx1FtC49G+HuTLzCb
	ucl0SiUA6/BYKVdbCfYeolNohW1dBiNEWSTy5FCznTPixyeYzRr5QaAfOj6QPBGLNZLu2oXxV75
	gKPYsaJOdfSC9PsMZPaSKo1PRC7TrJIqtDnr4YC3CnKdtwvKa0MQHIZvJQkGWoes=
X-Received: by 2002:a05:6102:3911:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d2db20f640mr824642137.34.1794214017922;
        Mon, 09 Nov 2026 00:46:57 -0800 (PST)
X-Received: by 2002:a05:6102:3911:b0:7a7:196a:84ea with SMTP id ada2fe7eead31-7d2db20f640mr824622137.34.1794214017296;
        Mon, 09 Nov 2026 00:46:57 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597b1f969sm8482016f8f.50.2026.11.09.00.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 00:46:56 -0800 (PST)
Date: Mon, 9 Nov 2026 10:46:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: Add Glymur SiP CRD
Message-ID: <aeeobsllptndjaljsblmdgayckiehg5md4wlowigtvnjjj5cqe@w2bzdxofvtr3>
References: <20261106-topic-sip_cob-v3-0-52cd3826ab49@oss.qualcomm.com>
 <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
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
In-Reply-To: <20261106-topic-sip_cob-v3-8-52cd3826ab49@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfXxvLApU8t0B2V
 s6EhsdWL6CSnm5FOyd4CIgGRZMEWeV/KOu6ejH74xLBkr8BhyNL4auyipWlUVir66Wpkg5k4429
 TSlpznViZxFsI6s7fthRtXNztVRqKjnKYHs38aoHcUqH/vC5jGdMkEXvTJHv95sXQXm/rZ210NW
 MpmPRziu2NReGhUQ+IntSgIcwIxrsyoQhBY4sUrjGMeVBst3jcx5yCaQ1IWs44B7d6+j+qq3kS/
 48QZj3U91M/qctyFAd6rulScTmTB9BHiP3siSCVWrw06Lo6Zp3jtel6kyLCEu8f3NHPzyPDL8WL
 N1TR3uSJKqEFtRoF0mz3i+dDRulbPv+t0w8d/Gx5ozBqUqEm/ZXNgVAl17YbqUm4HoVJeVv8C16
 5XjLOGu2a559XY+4cdZxBdxfSXa+tTWkGdwZ+2z19Wxt+Ms+Z4n9zRk0+Rmyy35x+Z5LNvFb4YB
 PYNTOuD7BO4lgjLDcHA==
X-Proofpoint-ORIG-GUID: nxu3ekyVejt4qNTw-W6jyV6K6eW4A3VG
X-Authority-Analysis: v=2.4 cv=bcb+w+PB c=1 sm=1 tr=0 ts=6af18883 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ocqbc99-3qkDWcjWXscA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzNCBTYWx0ZWRfX/8q+xIKzSgrV
 wpajHCHqKu375seYuVOqnFLgFOikpMV6seSLRNeLyWbAJKM5eYE1dbfwlDDq0Vc/YmzW9SYxlTH
 NMHcszlQAb3g+K9IbbxtrExThMmzVm8=
X-Proofpoint-GUID: nxu3ekyVejt4qNTw-W6jyV6K6eW4A3VG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090034

On 26-11-06 10:29:09, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Glymur family of chips comes in two flavors: CoB (Chip-on-Board),
> where the SoC is soldered down to the PCB and SiP (System-in-Package),
> where an entire module is soldered down instead.
> 
> The SiP flavor is used for the couple highest-power SKUs and brings
> with itself a different power grid. Add support for that.
> 
> Build it on top of glymur-sip.dtsi for the power grid and reuse
> glymur-crd.dtsi for the rest of the board description.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
