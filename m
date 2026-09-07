Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB0F42CAF6
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778029; cv=none; b=o4ZyzJdMVMigB98S2OmiHoOoIUtWSfQOBb+yS1SwHt4bgf0Xt9Oqdw7eTHHIXECIS0HhU4Ee7L1FrwKLJ3PE5u/LHE94OiMdh1G3ZtwOSERyYMXK4IqGA42jnrYRqlu/ITdYN7OOc+OZdqYs3n2I9ZFtMC7yKCnCezApq3bfBkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778029; c=relaxed/simple;
	bh=+i+zXQ5586774T8K2GRTlDVSGu0bz4SCi8qD5SMzCJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FrElzUWlL2GUFSe6dDSBhBiW7/bMv6ZP3tfG5SreFqSV0MgNxak25gDCrspR4MCOu+44TIm5X3mew0TUWdQrovTHuKUhqjCiwqo2GnByF4FAC+ofg0HdA0PNnv7XKa6gvpjQz32/OP0F1RlexNqRorvoRh5NUNqJGXeguuhyYgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dwtg7XYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FgnAeQxD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dwtg7XYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FgnAeQxD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bTHg648880
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 10:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h/N8UZOVsckiv89Lme+lJY1A
	LoQPT5L5D3e4T2uxipo=; b=dwtg7XYyBNMsGggC3WpW6yrshyx1qDEZeUUcn/El
	3/aCrOFx/Fg4XMn2rwNJiyUYXsTJu5SgTdzAiqdnL7l9+uOALv1mWH9guPa7tD+V
	RY161bl5uNZuiOoCS7POY5WlQaMXWdsQWMJ6PEMz0+8YIrIA6LAveIItCqqART13
	2u+gxAby0YSxnkfIO4ngUu8PK1PelysupUdzsjVq09S4Tr8sm3CG3Ekf7HbmDlzJ
	g9ns4saso7qZkr29uhU2jF0XyV+gZ6jy8dmDbwCUNlIu3qmx/IYSMTQ4hW4b1186
	nYSzUxuQAXz0BRT9uh2Omszi3lU25EoazqQLQCGbLy5Vjg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua90y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:47:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9396e0515dcso175086885a.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778026; x=1789382826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h/N8UZOVsckiv89Lme+lJY1ALoQPT5L5D3e4T2uxipo=;
        b=FgnAeQxDjolQk/rXL94W740jNb69yyhGzPJl0/asAs3OpxVk9HOQH3+UDYqcJh+S4X
         J6KXKXqJ2MICpz+lYnKatvY79xThltYA6BKvavDlHr7onqg2nDoNrMzRTVlWQsUx00fn
         znnCV3eG5t4O/hCUYD+DDTBs7Op1Ft0ff+y8V0OGvaojH/vkb1IYbn+Ec3wnVcIOKaEM
         WnzOrscgArdwuODKvClY8S6aT2hg7sg5lUzlFmLZAuvhW1xB3H/QvWly925i7tKJR6Gt
         GJhB9dpRdfMkEtKuBCQEY9s6k1+pVj2W+XRPVyVAnS12ApsR35P8AnhmkMXzuivXCmDO
         lMqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778026; x=1789382826;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h/N8UZOVsckiv89Lme+lJY1ALoQPT5L5D3e4T2uxipo=;
        b=W0N4biBD5//kd6R5SkvdWJ9z1/aMOsjsg03euu616HV3N8no4+x2FZ4BpXci4mijnk
         4wDp2/qUe95n0YA+N5LA5lCbebobBch4RYQDAWTrrCrzkmqcvVVDMSxFo2h9L4bIZX8P
         5JrqYSEvz/apivdD4cvTTE8ri6IS8+Tk8hgaMQ147DTaUAOc1KDVUv/CUvbjf3KiwC8E
         E7ExzgKhcozOP1cXeAemEhd4wj5f3mu0yaKtZ9wOQrlrWcNeQdNnsgihzlsZy/hF+cic
         AedY1wzaUuPFXYdzLMzU1S6LMRh9bLJ58YIXWC9YYwG9d1wGcy/cu5icxnsx+SeN0sSV
         dANw==
X-Forwarded-Encrypted: i=1; AKwUvBzUV5fNc59PIg/DBtSRUOwautrBloLWWiCVGnyINoy8WZwErsUsPRdNIaALMwBqqvKdST53Zca/fulSRAs=@vger.kernel.org
X-Gm-Message-State: AFuF++m5/szjrfirWTZ+z89i8UHtK1qib5EnDcZ6vezhNLPhMGQOZOhF
	y9mY7yWjk12BKfnm87k+A63RHW30Lirr19iR1htWk8KmR81qwI/Mu3Wgn6Mj/f05+I+NrGPG0hW
	JnUaBo3sqULeQ1rRIwYqlr8yq9Wg+xae1BnB6hkyVqlx1y23x5TGJFIBZRtEZ9JgqscA=
X-Gm-Gg: AYBFou3f/xuq6+ctw5DPQKcrfLIu9flOf17h1rroi7YWszIxiKddNPey6swM5Wqm/i3
	EmKD0A3mLKUJzIGOF9WbJ9maH1nDmF/Ly9BE/AFt7/5KT4z0ahzn/ydHAQof0Z1VGyMIn4dVV4d
	YRtR2yzMtKiUgkRrOcVAQ4UqPT6OuHK9ztNZ5yAohg1VrhpZ7hB0sh1igyg2VlQKMErdupCtwmb
	AKQ72YO2+k44+4Kov4MPSeL39f8H/BG3KEnQGa0x7zOtbZ+NfWDFbAGg3156EDGnQ/JYJcy+/ax
	FctqgoSIQBUQOyAbZiVP7cl7LisXd61Hhdw1ChJU9Po1DQt5FMs/gSgAjMHeo+NnbJS42eDs74e
	h3F41U7PGZ0mteA==
X-Received: by 2002:a05:620a:4622:b0:939:9e38:5d with SMTP id af79cd13be357-9399e381a2amr1033008585a.1.1788778025940;
        Mon, 07 Sep 2026 03:47:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4622:b0:939:9e38:5d with SMTP id af79cd13be357-9399e381a2amr1033002385a.1.1788778025398;
        Mon, 07 Sep 2026 03:47:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm15868982f8f.0.2026.09.07.03.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:47:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:47:02 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] arm64: dts: qcom: glymur: Add CCI definitions for
 Glymur
Message-ID: <juafv4cwo3vd2rvs243v4k76md2u7ragbc77siom5rxscqrjg3@czdyhn7wqxer>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
 <20260907-glymur_camss_dts-v1-2-6c2ced5ea5f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-glymur_camss_dts-v1-2-6c2ced5ea5f9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 3wTYDYvYUrAGAKmyJlHBKG5-EaOzXGpk
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9e962b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=BT2McVArkgQqC3YsW9cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 3wTYDYvYUrAGAKmyJlHBKG5-EaOzXGpk
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX8daBZf+KhBrG
 xi7zVA71iSCNUrzLAYfYD6nlypobfIHIO3r44CCAjol6wcKCUINtGfuWi8pPn3EHrPo9CNUFdbX
 ZGOaIeyqw7RKQkMRBGE/gXCtCNNvI54=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExNyBTYWx0ZWRfX2sMLEDQY3hJo
 gyMNdPrPNwDO2VQZmee/64dNTicnGK2vMdJiVUxzVopYOLWChYaoDwOUmH6zDTto363pYrFWDeD
 LGgClnCY7hNn20uCkmGC4ChZ67uzNlUCeH28zRSZS7cVDywfZLBq0NrDAv4Fm9bbP600Z5yrGR0
 z9NWl0ud/3w8raomyIoj2tfZVFwcM6Zs01zNd/QMmJmYbGY7Sv1v3iPxvLBIT0rGfxkQ0YRNzlv
 GmwI/UIg2W+svodswSKxXKc4JVNWq7bNDrBdtZL7/Q4zgRhas8LQeaKCIKxulbcxsefeSjPRa+8
 nu8gtgj3rci52jqsyxFyL3earCQPDnmCdSdQhcj/DRjziVh72r6NwuB9y1TfAtZmsVyBvR7Seca
 s53amdy7VOGhQjh+CHbOVJfyrvOFtdMaUe5EMQqb7jh5GfjJd7Ma93Dp81/uxFcG9jQIj/epSJN
 UvCNJyh56Gkm5Uj/89Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070117

On 26-09-07 15:37:45, Nihal Kumar Gupta wrote:
> Qualcomm Glymur SoC has two Camera Control Interface (CCI)
> controllers. Each controller contains two I2C hosts.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
