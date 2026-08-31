Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BCE4B714A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788192504; cv=none; b=BIW3O1kI099ILULNqI92KFdv0f1/HkCFjebu+3E8beq4MAWxT4ZccbEm62TlBbYzrSLOX/80eNj9s3wfvU0RwJcAujcrHjTcJV3DpXL/lck1vlyzXACLHmTfDzSDQvEtk52RGdmkjfGanCzPaTED2VI06Y8gT5xF8Z7TAzGM0UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788192504; c=relaxed/simple;
	bh=GIOR13Vau//QjAP6pJ8tBGbxO1q6YYuEw0n2DA0RMB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tanktXtjrTgD9iy1jnYtpVgn86F9aCuuOSoCDYmhjceM4tiiR9kGMjN1FjeHrEqP96B12BTlThRlxRRtBdKK7g7DdLlYEwdAgdYCaowQOHuNbFvTTxqPKcCtTK4zYlyTEVRzUALCZbTGxjiNVUOq+g7fvF2j/ou9OUMXnaRGTHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBIr3F8a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIR7i8aR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBIr3F8a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIR7i8aR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VFppVw3477053
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:08:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=52UHJM028Rn+QiJdUqrpXvZf
	vhdocUvIr66ANCnExAg=; b=KBIr3F8a+d6CM7H6mBmIEkMo3Wc3Mu45/cGFFZEA
	YCv+i0W5n0zNVo2zkvmEw8J4rcafCSLGyav35ZNUZwZkK8B1klCUkASzG2fDyIp9
	37mcc45bqM0iga7CAIEhTOmtjn0aKWzHTePbo/3cITUKNeZ1FSFbTY6R6RLMbmBB
	0DszzI0J/q04cF+RRZU6auFF1GoyOtDN0VTZ6f7PGrVxpP3KxqZtDdZVBEU3IE9u
	Ikj758URRXgfdKA83a40Y4yonGmJWhtDrBOWGkbpygD4g/iWvghNPno63TS/R5/U
	h6fk91Ecz2nH5y/Qlte25+8W1krKwP5GKYcpZPUTazEyGA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6ayhw09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:08:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930edb4362dso493693985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788192501; x=1788797301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=52UHJM028Rn+QiJdUqrpXvZfvhdocUvIr66ANCnExAg=;
        b=SIR7i8aR1iMQSXHqL54XO6D3X4s+FQToeU9wu6ZQJUtl9iOnk2xntrvNLr9qoDni3w
         8zEbhXrYUfRJYKQ1N3xOUXeeYz0NIlt/IRdUL5+PeFv4/QpID5ZXWIPeIUDVDpxRYhnP
         0awT18ljnK4YUIljM6hCSJEEGq6UA4vEVEMdtBoauhdz6Ge0mc9FEnpxbFPr6qDBvTZF
         PPh0hQOm+8jKiosMv6i1kkpaNMQQe5uxk6Ihy8BfuW6efmELva9kcNYGzwt91hiYZMf2
         7Tx7cAybWAe6AItTFpLaRI9IkjGgk7rb/IeDG0sB38ONaf/u8Pmp8OEwyFvQFhsTWO4h
         MD1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788192501; x=1788797301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=52UHJM028Rn+QiJdUqrpXvZfvhdocUvIr66ANCnExAg=;
        b=Mi+Fb1YbPVAG0qs4eSqgz991S/tWMOQrF7k9molU0ooyUOcrJYDFpkEGMHlLUEyPqq
         dCA0kjV+wvAySO3ZppFSbgMZYdzNqX91yqzYub0KOFN4E/oMUxog1irA5t4hky49t8t0
         G90QJIex95RBwWETqSH70xn8akq6Iioc1WbtfBJMGKQAvZGECNzTiuLlKto/+1alOXui
         hxqJbASyine1dsjSSLexGP7gdVv6fbNEzJh4l8HXaNySTmyXCwzmyxHNNquqBJWTWMxO
         4TM4coiiJJD/7EdrOy2Yi0DiaPAb5LJnNqBJYqmdzCoxwZUaxgkEtClNvgwQl/RajbuH
         6SkQ==
X-Forwarded-Encrypted: i=1; AHgh+RqD4KwbpXdlpXH9C03/L2hoHR/sg5gKBjGxo175qHFOKkgIcgxxbKGN6tWHjOBm3l6kAmz6M5G4O6b7wyY=@vger.kernel.org
X-Gm-Message-State: AFuF++ns50CybV7XdomPdfXi3zFHYsNvL3wNYUV7T/I6QDRD6JCvZaKh
	Q/o9EePCJg0k0wFDcyQeUlaC5KBaWF6uVNryIWm8xVznC7Zo1lhVIH++dgVkOaWZOAd2p7INoXT
	U5kQSIstmS43DM8yVH2KqtUcx4DZmADbTcG5ghZ31p8b8Ly5VWyQKuXaYnSXmqMAZvKU=
X-Gm-Gg: AR+sD12VSlq0TnzI3WNtFGKIXWG19nlFcy6viLUzsXxoa0xusb4r31INuv8FVOL+++M
	elg6stv3bMqaYjrNL7tfT2+2y/HlCS+HNd/vECoVo6k93cV7P9McbGNILwh50sDs5m9+3VOKtVl
	RkXcWcU+aDJcs82M9P3VNCsgIjIlqsNvlJFz6wdGi+l9ZtgR0bJ0kiF5x5mgkM2Y09GPa2X6nSf
	haMlNw/iRBLJ4q7g0NvqpQnm9kX0/wTtY2fo5vtERbcdUXgCF7Tqrng0EOmEmGAc9X0BOL6mEL9
	BTCX8OoV2yvrSZuXV7tqlL3VEn4+vVoP26aRuJ7hnMC2u5+FvvOEq7OOLfb5qR5zP4d+bHiMI97
	QRdHO2OH3vv4r7A==
X-Received: by 2002:a05:620a:40cb:b0:930:b4f9:f327 with SMTP id af79cd13be357-939138df3d1mr2695991985a.33.1788192500420;
        Mon, 31 Aug 2026 09:08:20 -0700 (PDT)
X-Received: by 2002:a05:620a:40cb:b0:930:b4f9:f327 with SMTP id af79cd13be357-939138df3d1mr2695976285a.33.1788192499764;
        Mon, 31 Aug 2026 09:08:19 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9266be71sm632091255e9.2.2026.08.31.09.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 09:08:18 -0700 (PDT)
Date: Mon, 31 Aug 2026 19:08:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Message-ID: <uwo6mb7tfgir7k7yig3w4ych5rvx6gex5zzaeyvbjf5uv6coga@srxc4jbphri4>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
 <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
 <mwf5hq3gnkesmccede2sa5ni5lyxg3zfnxvwchts2nxh25zndw@uyn4dqehfdpv>
 <b7658f61-17d2-4788-b635-ff2021d2033b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7658f61-17d2-4788-b635-ff2021d2033b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEzOSBTYWx0ZWRfX3MT2qSpdC5nU
 KxNTrNzb1d7U1Q9SnXqmXD7ILLv1fw1oTDj9fYpzhAi5KdDsclKholjDVWYZgTUFUWN8dK33WCH
 PbhrwE3owh+3Ggopq7u4zC4oW/UrjDc=
X-Proofpoint-GUID: Upe5CPHXVhDsI14BRASrVqPN2kmJU5bh
X-Authority-Analysis: v=2.4 cv=CYE4Irrl c=1 sm=1 tr=0 ts=6a95a6f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=onLGS3NSUnbtietV6iIA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Upe5CPHXVhDsI14BRASrVqPN2kmJU5bh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEzOSBTYWx0ZWRfX30GniAczHyRA
 m+1n4xSNB2wycGdEncd+0DvBpA+vGcEYakht4aO6jCPOC1DsFjEKfPIJL8P92smfZsTlcxs80xB
 lmtfB1saS2t1Klg6eE7e6Kj8TzXO0VdWidwnwrpL5kKgO85wkyPmWU4HOeEJRTPel2w7J7Ah+69
 UwPPLS33K6lBJu8K5bjSYqs8qMYoI9LGeCzM5qvpoCGf3z454kKW4L/wdH0yIJ/Uk/RCofo8fi1
 T/0kQ8qtaHtDCeqCgy45q7VSdkQfvw5oCVT6NQcuDAvOegNd91AnN6jBBSRkKmldF+un20I3aeK
 8F3zfwiu19IfUITi0nMtSNLjhOQxSXPcCVW4+Pwvg3DI1AzkyO4mq35BF5mqJcwna8RX3/D+HOI
 kzMJf1QI5427fRSyCqgyHkV15WudWELwnaUqWhorvccgcNjy/+SArTj73YZ58ckYvyz/lt6utE+
 Uj1gRfgSsGSLMF7Bc6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310139

On 26-08-28 21:07:24, Konrad Dybcio wrote:
> On 8/28/26 2:57 PM, Abel Vesa wrote:
> > On 26-06-30 13:25:13, Konrad Dybcio wrote:
> >> On 6/30/26 12:23 PM, Kuldeep Singh wrote:
> >>>> qcom_ice_probe()
> >>>>   -> qcom_ice_create()
> >>>>     -> devm_clk_get_optional_enabled()
> 
> [...]
> 
> >> On the developer/customer experience side, would you expect having to
> >> manually enable what's essentially a sub-feature of the storage media
> >> on every single board?
> > 
> > Wait, don't we do that for display nodes anyway ?
> > 
> > Also there might be a case where you just don't want the ICE enabled.
> 
> I can think of literally none..
> 
> > So I suggest we disable the ICE by default and enable it only on boards
> > where there is a consumer.
> > 
> > We don't normally leave stuff enabled just because runtime PM will
> > disabled it for us.
> 
> We should because the hardware is in a state that's otherwise unknown
> to Linux, I've been trying to push that forward, but many things
> currently can't be enabled without side effects.

So interestingly, on Eliza at least, ICE isn't left powered by the
bootloader. Are you saying that, in general, bootloader leaves things
enabled on Qualcomm platforms? I'm assuming that would be ABL that does
that, right?

> 
> With the right drivers in place, the hw can be safely powered off or
> at least parked, instead of letting it spin in whatever state the
> bootloader has left it in.

I understand that point, however, this kinda makes the ICE a one-off.
We do not do that for mdss DSI/DP controllers/PHYs on boards without
display, right?

Not to mention that, on an end user device, the ICE driver would have
to be provided as module for the sole purpose of powering it down. It
doesn't make sense.
