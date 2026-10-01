Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7911237B3F7
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 01:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819847; cv=none; b=Cu86q8hevB8OtxMYAMkwWn/2xhGQtvrGrkGNXhlG/tOayJ95are0N4mMc5jDuODxDEB5iydfSVp/6D+BJNHNxYlCXY9C9jyX8zpDpxJ+O2QPFVYi7DdqyhJHnJiGw/rONEjJP2U5MJqg/2U7IjurxQatZNevR9qFj/ofb3cJL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819847; c=relaxed/simple;
	bh=dc23h0DAzeahU2YQjWsf1UtM8H72KH4uKWQYNEb1GJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKfjk2fqfHTrndV1i++/ZFE+GxzpjR9F8tET4dZs11I0wEApi5dG5JTLt7wl9WGc0UtQyxhB1xrUm8WUEtQIgkhuGVZuu2XBFWn7hXS9s42M1jdrCuSsLIVFz87gFOSPrx3rA/6mz08Pa8o3Qmjt1GI9zA+q1slcrp5dp2bdMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S50noS3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3ugecIW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S50noS3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3ugecIW"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910joZM3802666
	for <linux-kernel@vger.kernel.org>; Thu, 1 Oct 2026 01:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uoVV9AMom/z0Z5MeMxOVZrJn
	fnZMhEF3YGoQPtJPVgc=; b=S50noS3aCk+5o+zo395zaz85DH4dKB/5pNEcwflo
	sOOZu7Jf9Zf4L6f2HIIt2NIOJgaC39THUFZ5YJQLhQ4ZIA/9usI4JfGvnfqc0Asx
	0xG7xi6Lyw8j7eoN2QXXDGurmww8SjMNhIrwf1pzzU6/MY9DDL0mYa/WUwzLZHFG
	g4UtuhHxGQaXLZgYMOuLaVke4M013uQinV4XXShCcGSj49b9X216TkJlJfrLcDEf
	RYCTetkmOpdbhFL5iw41bl7O5SOFH9aLRSRNyUAwQctTN9BoBgAK6UMluDs70FK+
	CdnQXuFv/CLkLPfdszF6bWnckNNhN3iGN6k+73VZ+TnnsQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1bh58jg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:57:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb93c874bso48733285a.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819843; x=1791424643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uoVV9AMom/z0Z5MeMxOVZrJnfnZMhEF3YGoQPtJPVgc=;
        b=B3ugecIWfPCyYWci1T30GWIM6J45zSEjj6EFH7hpByKPZ0mpcumVoGHtvzVp1SDNG5
         +nszWC1CNppg8jqGiucCc1tqfiKXVjiS7/nrcJxEnfeeFUHcWXLaQi+K7zrR62J3yuk7
         /Tumm5fF9dglVgzqSKgJaN9P7W3z2ebTt6gcnQ9rbiUJdwEj+8r5d3RRenBBFFQUGyke
         FbyXRQx9t7uMe7zUzY6Mei+GwAVyBNe+ZoFvrbUc6ml32FNVKuV3x3C4O3SqEsnwAVju
         ogXESl00SBq9ItVufo/GXeOpmbtPKL9qT8OFETWH0fn2xutE5cZrmJnlvtpeLY2bTy3A
         gjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819843; x=1791424643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoVV9AMom/z0Z5MeMxOVZrJnfnZMhEF3YGoQPtJPVgc=;
        b=LHWMCejN766vYr8ujMjz+9vYL83d+PP8xinIMjzuaXnbkVal58BGBNIG8VmA6TcZAC
         oWhH74tphbe/5aSliTpxlcZ+WggyfTQRd14ig3mnHPlmK+ngZiJfndVeIE0nsqWh2HZq
         gVdYuAblTiOI9hBIHcyHkR8L4tZjN0RjsU8NhmFZdu7XhD3mvaccq8MIdTrFFaSeyc41
         tclDv4mvnLXfBWe8NjtdlNvs0Ssxzgj/jIG2/taF4kRnLW6GcZK2CMnkGObpZKxgwVw4
         X/Zq/9qLXsN9gEIwWAUYX9+/lEyx51+qFTgkzPJH7vsDUq7/cTqj6jR6P3/dBAdU01gm
         2QyA==
X-Forwarded-Encrypted: i=1; AKwUvBzk/3LWJvVoovFc1nNCT/fufDwNwGHKUS5U2XFIYPtfYBiLpQU43IPVuVZm9K/ZND7R5LIjV5UQ8AAPwVc=@vger.kernel.org
X-Gm-Message-State: AFuF++m/P+6wsfdnHP+rSViphGUaKW2i1XCt29dL9turlcciekSeU2ij
	ydrCpV2bb9e0c0wxdTDc+pC0mfOfq8Hm0wjJTZGw8r30onwG8rGr8QfN7fvm3+q3ft4qi1EIWgw
	F4kjgikSNXh9EkLyiMIoA0NN6sYNyLq9kg+5TsXY6b9RUZdV+Up+PCMWzN4v/YySzA4Y=
X-Gm-Gg: AYBFou2r66mixepXcx8CLhbb45sh5z00howtWvLepq/Kdw3wv8kwpXU51hByaNZ0UEp
	Duo6G7Xp+wez33SwJ6uHHRceev7LtR49LkXFdk8OKi/50LdDF5Xfi/ufyuqyP/TAgScUCzh8FiH
	KCzX9vGI3TmxQr60tcjDwS8tlhmKWV4OtBlOlBylPI16K+mEo7FhWbghVEChslPX8ZgG4VDXmbn
	OdLB3X7A/THpG3rARuKrakVd52052HiMpmBeoONPZUfreaYNSB07aMK4M5ivq5I3PLJgBxikL0Q
	X47hr/bRK2bSzLNikH3AdGSu+jC1hgFHAaSul3BvULVuSmngwnXgsJgMqKaktCP+RbO5ajB11J4
	O5PL8pjGknhOX1OEX2qj7uP00cdTGG/GPyRgE2iyoBAppAYKHqvvpaEiu2pp4lj+E6v14NYWB7b
	T5j1gr4aCB385V
X-Received: by 2002:a05:620a:269a:b0:93b:d7a4:9d49 with SMTP id af79cd13be357-93cb5a1468amr287213385a.28.1790819843451;
        Wed, 30 Sep 2026 18:57:23 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93b:d7a4:9d49 with SMTP id af79cd13be357-93cb5a1468amr287207785a.28.1790819842965;
        Wed, 30 Sep 2026 18:57:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a77192ee13sm12526111fa.30.2026.09.30.18.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:57:21 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:57:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: muzafferkadir@mainlining.org
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
Subject: Re: [PATCH v3 13/19] drm: msm: mdp5: Add MDP5 configuration for
 MSM8952
Message-ID: <diibislcaubtwwazmkjsv4y732har2eskayle5mxpdkr5npana@uckh2yzblzxp>
References: <20260921-msm8952-initial-support-v3-0-b96fd3fe298b@mainlining.org>
 <20260921-msm8952-initial-support-v3-13-b96fd3fe298b@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-msm8952-initial-support-v3-13-b96fd3fe298b@mainlining.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX0sxa2G1050M6
 9q2+YQtAbX6iKf/JlMYCm94iR6WDEjFHvSpFngkYsZJk2I4U3K79cAA2IexnElqnNz/xKOi+lDI
 TlJcdzyi/EEaNeT3UY0PlxYhkpptayBMlbjo/QaqZYv0+J78IF8ESWVFIzrSqUy5YtEHJZTC81u
 N7he+H4f/Sm8htGyHst+Rjo5oCgQfkKcfuEdInjTuPw9ZylXbejqT9UZ2trDCHrf136/Cgok5zC
 2RHoNEKKoDRP8Xt9Kii5cGvUuHOSlxz4Hb3k+5DTLEAMfiEzWOuMbaaJo0aVx+RFxXgaMiwFtdR
 EtGgtnVA16b4x1VqbCxNIR6qxxBDMfgKttQgcYQ25vazHDkNz6+qjzX4EkzpsslTI3vlAZ+q4Uk
 K/buYj9ai00yATxFx9tFg8arjvE3LtCoUYPqXls5kfyxL/RgbS7YhnV8gHJ7MjF61I6gPYHuovP
 Iu6eyjHXj9RA65sVReQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfXwdeh/Y/KBaET
 oLhNSniSyOYNLLEb/WFCJO9AyXW5/sicfr6Es+9qG70QhZoIIUWBtYaSZ7CNB7nCG97CuUcVg1V
 iuIOECGN7zd4emr9tf12eBh0GOD/gR4=
X-Proofpoint-ORIG-GUID: rLobqSPXaHAW0G9Y3aw_g1Z9aO-BlK9R
X-Proofpoint-GUID: rLobqSPXaHAW0G9Y3aw_g1Z9aO-BlK9R
X-Authority-Analysis: v=2.4 cv=NrJE4MdJ c=1 sm=1 tr=0 ts=6abdbe04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=OuZLqq7tAAAA:8
 a=EUspDBNiAAAA:8 a=YvXxkWmvim7rQlE-Do8A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010007

On Mon, Sep 21, 2026 at 09:19:04PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> Add the mdp5_cfg_hw entry for MDP5 version v1.12 found on MSM8952.
> 
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 81 ++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> +	.pipe_cursor = {
> +		.count = 1,
> +		.base = { 0x440DC },
> +		.caps = MDP_PIPE_CAP_HFLIP	|
> +			MDP_PIPE_CAP_VFLIP	|
> +			MDP_PIPE_CAP_SW_PIX_EXT	|
> +			MDP_PIPE_CAP_CURSOR	|
> +			0,
> +	},

PIPE_CURSOR is invalid and should be dropped. I'll do it while applying.

With that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
