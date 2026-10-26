Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793027085;
	b=EpNSqCPM3vGvnIowOlM2bcTYlnt4ObKIJ9TqXGuHdXJpWXdn+OU1d1gip6gfjlTrcJsd
	 yKSK5I0tqK7/b/yuKEZd7yN5809S5q9ILBm5CDF228tvvJj9b00HUqxb7bY4YUavBgmsk
	 xClECKHBHTRMnT7YL3ATaLifVl0P9aSLApNWIkV0Idxj80mlxdzuTIFySNEvm0q0MxEhA
	 jETmtX9baXDt/pTL5nZ1UaK7NU1YJvic6gQoIsJ8Dz8H8n08O9GtvmUOEmiOHOJ4vl/11
	 H9oNggZm+1vfr3I/cgYuY7HR0qpYwd5joZUHB7TwheGnn86vgwBs8GfiAxNJkVmlI2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027085;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
	b=rq+osxoLWd4x9vu4MzaC0yqmCCyKMo3fDadTpo/dNl/tUKMqMvbOzKPJ5rLNr5dXaw2J
	 4YV8rVWyNn+Zsbo21D+4U315iS5Rqgb5mL3LCcJKInlsv0hvDEFUxLP5Qy/A5S2KZwDlR
	 VYfpIRkWicrIw4A+wnBPZPul5XOq9dvo4HaMfWyyM0izKnLB1dF++lRTxH7aSytVWkdgl
	 j9FCkOOYUSK4CYX5ukZ6OauJa/VhdCvzXAIOO1fkeeJPCkCF/dhtIRgnWW2CKhnrwJrh2
	 Wn0boJeuWIpRY4Smeo7Jg4u/JY813vLYr0nx/3kpH2q6+0ENjhnBiz91qXSyaGjnXug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E676F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E676F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wp+k3qrI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VjmFmoeX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEw6bo3584367
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GcaOJI2AGlsc/iw3sTAv3zZN
	ex+qopC3DMZYd+jAZ68=; b=Wp+k3qrIh+YaEOH3QJzYJFTiZ7PA6rrOlmzaK3Om
	g0UQtEA9Q2m329GTlC66MyOtkGxhNan8rDYhGD29qFbh3ruypWMjsWZkeB7N4V25
	PVDGMXx2FRX7zkhbe8g03lJrugJOSeokhLe+NQBkLkKWvh6ZTmhF7FVg3oz15MSe
	s4rzCO9TKJi4nRt5HmUeuZ0tN6IDkXvxQuJo4rmVXIu9B2t9f8HzvWqepL8RoPto
	DKIgDkFd4WL6Tpxvo9UD7qZ+fgYSJgdY2NTb/3SDs4Fl3wdAx9GD+VF+JXynZlfz
	97b/FgepqeH7Za/Ssajp0IW3600ju/57XVxoaytBKsXkCg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvddaqpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:42 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bfa915da7cso2933675137.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027082; x=1793631882; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=VjmFmoeX1gIg3U1SLoYXjP5pHsJIadjcDDRtukuCP6P7oLFt001C33ZLvqCA8ksUhf
         X4UITAixns5Ghdpj0oQokP/6kCyKxEIZC3St0NjOjOIN2QELdAddve6BGdE6HyhKF0dY
         lr/lLKpMIp4CvVmBWWByaoja0GfjFgFFuJBBtCHdX7hr1CIM8j135sK0lks7TnKhEs0U
         4pPaf6UKbdaSFLezt3uRO0yR9FX+3eETUKaZgV+5qJ7Hh8MPTN1DXQxk+jSIxx0bjvpt
         zAX+WUssAVM2kKHFHv82pedZPd6dUXhXzZP7eYkFPrBiccc+Q22zIR2CU3RSAcpHYBf6
         GmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027082; x=1793631882;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcaOJI2AGlsc/iw3sTAv3zZNex+qopC3DMZYd+jAZ68=;
        b=haMMsGTvZ5Ethc2tOo6c2q+tPs2Sbolw00nGb4bzGq2mkfuIuvcjlBs7myhZu1Vzsj
         yrhBzW58MIXONxmU0+0K0X1QsCmTA087NEjD1MLlKiSZynoHG+gATrvLMxDRp9DknyQL
         XmyYHKwhgYOG38eCOldV+TlyVe3jZYd5uvTapP1MnUSvLs1YeEsz4DSI8NZ0+n8TIxFJ
         BXJdhm7hNEZqJ2ZSHiipbPoQtwAa2zpxk1/5wwVzi+/cVNrRkAd68Xd/p8YgIo41ehk9
         rpVuNXX9iJ0FKGMnnH4GuQEM+5SKpsloda+UnGhiFb9L+BJwA+jCgk0vz2zd4qTU0VQa
         bTzA==
X-Forwarded-Encrypted: i=1; AKwUvBwFqPBJZzOFpROZQ6rzxjcc0rpa03fgNfGJ8iesnEbcWB5fDqCngovkpKfbgb7SGOUD7/nxt4Usjgkz3Jk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLehzGQM3r+JQHPTdEoNOyV+aAGJfsJBc+uNfbbtDHKqmDxDHNx
	wygb6yZc8UVv3/j8id2Ha2uCVuk3b++igH2UgB34ZuSS3fZxTedQ1DA1AUcgf39nvfJRiSn2P2E
	SAFRXBmUEJKZbqmJDaU075eGsuVYBCq73Si66yWPWW0pkbwVTRpW86CjrEf9zPTF8+ks=
X-Gm-Gg: AYBFou1dXJXSpOy9FgtKaazsc+JVR1bJPpBLzra5DtIfBUF9upkl1FwMMrsV59q7hhm
	5usZx0D93QVfJ22nRn0lffIxY13qwOBZ+D1GyWp46ILO71RVIWW/1MEacRwtFhUwZvLjkhM2B8c
	ubZ6XGfh8TcU7ZXb8qm7P5RQEIe7QiTdqhdQmFbSv5/oijc9lt60Ypkscv2Bi/FaG9YFs/7HLc7
	gJg+jRO7/zsfPxSPZdRD+cIRCpcO1aHgLWFQXCo3pGeLqUDVMwQ8QAUo9rDxcuZdxzw0dQSuTM7
	anGJiAxJKROtJuVZ7HXu7aDtJOBCnuXl/I7sOjxbo+uduWeVRdVJ+wc/hvYP2usRTmN1mgKC7oy
	ZpiKUs+N938k5+4A3
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188353137.13.1793027082064;
        Mon, 26 Oct 2026 08:04:42 -0700 (PDT)
X-Received: by 2002:a05:6102:1a1a:b0:7cc:a4b:b0e3 with SMTP id ada2fe7eead31-7ce5ccd81admr1188337137.13.1793027081345;
        Mon, 26 Oct 2026 08:04:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a5698f1sm200370845e9.8.2026.10.26.08.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:04:39 -0700 (PDT)
Date: Mon, 26 Oct 2026 17:04:38 +0200
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
Subject: Re: [PATCH v2 04/12] clk: qcom: gcc: Add configurable PDM XO4 div
 clocks across targets
Message-ID: <2zv6vf3kvlb2k5oopypae6fby72ykqyg4pb7mgiomzyptolez3@namz2jhghdgz>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
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
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-4-ff8e4bc8d567@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZXDtNzQVmKpBJfSZAS2QdjK8Qy_enqe0
X-Proofpoint-GUID: ZXDtNzQVmKpBJfSZAS2QdjK8Qy_enqe0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX8aOLOBdQNytd
 TQSlkdujyPwF88Enm2orjuOQmrAliVzfR0OE/AF6HgAkFngfNRPCizp1GSlbx3eoujnFopW2686
 7D4t36xsLZk8AFoEN0bOec6FnAyy78sxz9dcrqMAQycis9Z0BD5P2qfHyewi/UAMwwH0aTODB7y
 IpA+0cl4dRXcNo+wBTCC7FdPLWQ0CMRwCcAxpidK39GSR98b2/bRAvrRPxNShoZjscG17onMRfX
 qpUu9Ztkg7VBPfeGKt+Coq03oM3BgvAQCI0r9XEbgPbJ04nhY6QMpLsll2d42AIMZWjhHp6Xmve
 enneMU4zAfwdUD57wof6Sz0uPMk1QnI670OGdoMpscYNyEyDw3N9Q8Igql6Glgx5FfcH3t8sskH
 MkxQCC2n3CPN/JovfM3zHoIVGVgErJWo3AQYI2sSyv+8iL/K6Ngc6GePvCwAGAmbnEa7zRySOfP
 HJtLLySTS4heIiubsbA==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf6c0a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=X4WHrBvVKYo2O6Nn5h4A:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfX3AuamGGVcMGu
 oxFZQoN1mG9u1PRaQE8bZn+pfR+2+5vgfHT4wXWewBecvphQdeUSKnc1I+ELh0Jx/OnaN2s351h
 k0GhCRKp65AmwEq0TplLofcUVXu6Z+Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260059

On 26-10-26 16:59:30, Taniya Das wrote:
> Add PDM XO4 divider clocks and make the PDM XO4 branches propagate rate
> requests to them on QCS615, QCS8300, SA8775P, and SC7280. This lets
> GP_MND select the supported PDM source clock rates.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
