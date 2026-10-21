Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572044;
	b=kO0qvlpZSIgywVAgjcfuIDhbDY65pqIYgc/tE6vjRPyUPGBuzjvsKAsFrAoyiVIfod1Y
	 lVV2/0I7LeoBbUeTrsI2mOTg3o5b7RngiIl3xAqaDdKKQ2yIPrMfXy+uvp4dp0Jhj2Zw8
	 cmWCitd1NGuQJ/Iqc1ai+Azwl8oZLxRvSRo6824b/TyCn933kQ3LrSTaq640B3v957+6Q
	 WImhCRGR9TRKDDGYRfY9BpoQAJ2thP5oo1iYGmojMM/oExpsQ6Cv/rMKKw7HxeAca8FUO
	 eHoy51kXTGX/1GbFOECbvoD8fxW03cv3fCtYWeo7FFo4F8y8lL0N5xgGVk8es0Y6/YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
	b=Rd6KNDiSVffE7YKuiuEW9m+1/9N5lVuU+L/fWgajb0Dtt8mo3gNdGYrMT1u0sPdLTymB
	 cV2V4/S506t9ciODHlMjQZuBeVSxDUJl5vscsqcDTnX5xIzxpp4M7aQiBmiYzqQDYkXgZ
	 yjMdflXO1dTQ8OWkARjGkf8HJUue2qRclI/OG7InvE4FDlZqGrLTQr2BJa0G7l/QdlGFa
	 Xxi2RZkxoFS535cMq5B8qFS23uKgQM4Tv9pMspGTwE4T1pyTkdiWBINWjqz0gvrP/Kml+
	 aOWjse1USGBzMh2xsviXgEbR14f5wLxoo8CElnzAl6IgspJDgfLRolENBKx1j7NtAdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Z/Fjub/m";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww53EGqe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D80F606AB26
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D80F606AB26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z/Fjub/m;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ww53EGqe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jLBD2848640
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Nfw0PUvK6imNS0xXM3MSxUot
	zC6eCCqH+vuYtGmu7X4=; b=Z/Fjub/mbGKMnxjJc4Gt1M/Pzy6QnFCS47e7sML/
	6xHjYNHpVDW+eZRMU9QFaTkI7SJ1y58xzx0nGOtJtPIXGGTXRLIYfmUo6tEsp8m3
	7Z7QV4ErCtI4Qs268zbiRPqJKuEJwIJ5Vea52NQbS2yiikCKuWeyvP0q9i0lQ9qb
	CgMaB5aMHS4h7CAXCq+w7WLGwqWJfG83J0vcye6Qtp7rqArQGJUuolXIQMKZ9OXU
	q0WvcaBy5v0fVtNXa+hrhInHeHRXb8VEhz6mUvdd1jZQU2fZmxlKcl/0zQFgqqaF
	4zGCMHRYTiOB2r3J2rjwOjl14l/fykY6uSU0M/fyx1Rliw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ar8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:40:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so166765885a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572042; x=1793176842; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
        b=Ww53EGqeTH+CcS7tZHZmjPzWG6oCQflZL75FcS1YhxAHX09J0uSAFs3ztZ/bMG3DAp
         A1g5T+kZ2zqzaxL8Y+3y5Vm9Jj/aKjFZqry4poZoQdYlSltBUQNT9ghx1S2JeIgOmOGd
         W9uOZvgilc16e0r8yZ7h2mVnkHkQpw2Gneo4EHFt9UhWsRftmm0EZW6vj4gf91bdu0Ro
         GU5Byuv+03adbuHhh0tauwkg5m/UYgpyNmb4CpPrYNEHW4SxNuALkHjgbCOaSaSaQ/vC
         JAHNjTamq8piITm7U4SMJlHuIq31KNmbj1koPr+7gC88s0IaWnlX7jeYyYZCryLH3gbP
         V3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572042; x=1793176842;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nfw0PUvK6imNS0xXM3MSxUotzC6eCCqH+vuYtGmu7X4=;
        b=MBWltS6xn0gMiU1WyjyyBdKGGcJP7p2cii6o6H7Y9Eie7qL9ftMO/3wF0eVesxA/QO
         sqAxz0yK6mlqleISRb1f+Ocd3K9oeynXslMqtiVSf4AtX2DCntzQ/8IdM+SD/t5Ix5VS
         wxVCKSPWNSRzv4cvNOB2j7QReqvki1Ti93ZmZbVWPt5qm77tnqJ3z0W2MgAxiZC7KsgR
         HK77OtEj2ZsQm//ySlN84wQXFpKMYOWwb/tvirEihtCjPXINxACgQqPn9JZepb7oK7Qp
         yfCNGIiwZvLr1hYQUf472BfyPmWJPlmGdpX8TCBzcPjQVMORuZDJWd9MCeFlvdxqrU5a
         vmsw==
X-Forwarded-Encrypted: i=1; AKwUvBwF7N1m0n4hG+BS+j2dTomX9QdgMAiIL3Kgr7KA8qBqtf4fr3CkJsUwgtbwPpHExk6VeCyNpiH4gjfdVIE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIzFf6CwrijPwZ+f7cpY0AUFy/8u3fhBiX4YpaPC7+EJRrJ9b1O
	Oc9v37z8C3FvsJBk/tKOwdhTNePXdlDIcaVacpaCoAKBUkiVZqQu/WG7ALLF830IsJe54NI8CyU
	uS1NNRm64X3SB5bIBR7FnnDq+LRVBsqVsEUHv0G4UGazkI4YbjeaankvFmWsH+uuJTN4=
X-Gm-Gg: AYBFou17OdLNzsv3WyJWEsh9WArKhZ17IEtDNMATvo2qStG1Vli6FBScJ7+JY8itfUu
	yrXvyhOn/Awe/T7VZyssev/Y6kCw/pGWUAqmXTSKI5CDf/3eSPyfkTs8khip5rn9AGsJ/FXkZMm
	Ipr29k4NudJRTy+SIKsc5nGSxZNg3BBUtj44DCVe9qlc5bO/71OJ9XiUaRLTTs896h1l2R/Z3y5
	642R9DKGSsh7UYZCokOZRVgMfG2HfAyH2ZiGBUHvmSR26hQvseb6ELOyoHdqF7ckGc7LyjIhn1d
	w1pgL+yavUCmoDXFB3byBHSxHT3zh6gLGQqMzRpAQW8PcpaKJ/P4CHygOdvrL9U6DFAA4CoFvIe
	vGDy9/uvqt3b5ySa9
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr279115685a.81.1792572041615;
        Wed, 21 Oct 2026 01:40:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:93e:c12c:fbc4 with SMTP id af79cd13be357-93f57f9f3c7mr279112885a.81.1792572041068;
        Wed, 21 Oct 2026 01:40:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm96917225e9.5.2026.10.21.01.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:40 -0700 (PDT)
Date: Wed, 21 Oct 2026 11:40:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sushmit Singh Rathore <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] clk: qcom: camcc-sm8450: Park the camera RCGs
 when they are disabled
Message-ID: <qvoigeiju2ka265iqjazauwcjv7zkl7d3in4cfo5im7a2gp3ss@heo6u5sphmew>
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-4-sushmit718@gmail.com>
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
In-Reply-To: <20261020142157.1749-4-sushmit718@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXyLmRLoYaPHFG
 apgBUagte9lmAR8Rmtz6IRl74A36H2hjQPCzds09q/Je6cv1zMvY3rlWUsYyNvhex3nq4iFMyMr
 G8bKJtedXljv2YcuNSt8mFSiJUtY5mg=
X-Proofpoint-GUID: Avvzy3G4K-inS6O5SETlPRjRPeZZ1g3-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXywXF0TzDwPNw
 eVvq4V2Kv4lrTVdCcLzdlzL9XxTjKRlc/Z/pepC+vqsQ8a1KvDduYbXOW7D8+oisvn4uV85cKQy
 xg5Hpyf6jh9dl4nddMk98lyiPDzkjUFyzykNGhADsxKKWSEpPlB3Q2g+TfpQWsK+Dyn+BjOrDSR
 9T2FDo7dnMJD4y13PjvSUXUZa6gQ9LkhD3lbnOZGKkE05/UlGiAx3G/zxJWMGUKQcWYtHMRt8Tr
 POCQUPJj/aGMRujU8umUC21xaMD1hXd1Pu1358SkX93jNenHWwziRoBehMKlL1U+kBHExVzfZAJ
 6vdMu5zl2JgSL6nwXeNPhNtomoJbbFaHVjw1x2VlgkNqM/fULBpravOMNomGI/IHtFmqrUTD2Bs
 8d2zK2rEr2bRIHtWIdFG2gKdY5c5oBra3mhGDY0nXMp+4/z+VCFwSg+848VviOaLvAOr7MjbJNC
 ptVLEZKe6NTy8MsvC3g==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87a8a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=xW1KjDN5FDO35nT6SY0A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Avvzy3G4K-inS6O5SETlPRjRPeZZ1g3-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 26-10-20 14:21:31, Sushmit Singh Rathore wrote:
> The camera RCGs use clk_rcg2_ops, so a disabled RCG stays configured
> on whichever PLL it last ran from. When that PLL is turned off and the
> Titan top GDSC then collapses after a camera session, the SoC hangs.
> 
> Switch them to clk_rcg2_shared_ops so they park on the XO while
> disabled, as camcc-sm8550 does. cam_cc_sleep_clk_src runs from the
> always-on sleep clock and is left alone.
> 
> Tested on the Nothing Phone (2) (SM8475).
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
