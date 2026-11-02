Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626525;
	b=vFMNXhzkq50OiTXfRCsN9cR5TQaU2rr3kylMbHIOdYoUuc4Z8oxjdUZBwUM8mtMi4BJ7
	 qQ8XrQeQjQ5h+4aT9D4Q/O8lK92gadIOl3rm6jqBSH3qIPNewYMF/naKXJZZ5YgnCaS6H
	 TqMvexK1fIggmYU2sMBFKf6ESKCgnSHGNh8/kWA5WElam8TiLrBb24Bf3ircLLp2vRp14
	 NWMxOtXH8nL8o/wX12V7XZtkukTbU9zgqI52HZ4xBKZOGsMoy2zfZXhL44F2qfzqYRitJ
	 rNqEn0rDHfsGrzr2h5rzfQvmdOzAxDwBNWnemnGezQ1eKK+f94OyikOYS5rlTuJY48Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
	b=4ZiEa8vNSEBTjGr5TZwabUlRwQBGaD0dN7WOXFB7AkzZC3XDnBxnPWC0P+HxWiOPfniS
	 WVY/f6haErFR+FQ49FurdaB46nBDw5zY61I7MjHJc85HCj+upms3TEWtjdDc6F6fPr3zT
	 BbwjlX6H7Zs+XI9TKalss/XARuwNZTU9IR7Kc34zH55zqgyZ6//7A2YvbPqhJm3pNmoyn
	 3Qz4MRSXZafy0ZuE7+s3cKSDDdWhcHNiVqe2p/su/IOuxDQv7diRw7C1CrcqKvebymW/L
	 85uI1ZmowF6rWngXv2HkLyEYD5zQbPukj3p9UI5iQ8uvDo7Cp1EL39AWd6RWEHWbwGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtD+KjNR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c83ex4td;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29798606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:35:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29798606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KtD+KjNR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c83ex4td
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DAWPa2902451
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XiJjr6MHKIw5QEvJXljJWlEb
	3Q+VDlJLUff5S8aekMA=; b=KtD+KjNRqA2EuR6t+EaQv2KH09GgnbCenwKpagKc
	HgOdpwMeIQdbBCzXfOkn9KQETsMPIq2io646X+bhshL89O1KkbL2p8YzTwhsXR98
	VrBH+YnpNTnqeuofVDXo/+ejOmdw9v/sIQ67TnMs/sQLBHjGygT5os4+MmaP+DLZ
	qAe4nyLwO19s26NhLw6rHAyxXpKP8k8aGgv7YEBRAXWfVezENXhPKSS/kVuFz5Bb
	3TkOGV2WVKPT+OwuvLbw4QKqIfiS+f2HHi0d7kF0fpQEucBZVvvdMAwXE+EA8+94
	Jl9DeYn1vhGgSEUJz7tgXyGsNhzppxIq35Si6dcCpYclMg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavghc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:35:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2c0e6653so527084685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793626523; x=1794231323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
        b=c83ex4td/bh7JICeUC7hcqsq/LW+0tCNqiqQyyU6ZyxfYb8z52XDuLSA1sGEGcbgtN
         qiEzzGnTfXLOF5+/Mxo65mfF+ahLDiSsGRpAvZc5lKp0bQTxBlHs8MXFuWl/OXX7dO2z
         nSCJ8PtorHj959w9limZyagK41GhUeBBA4fZfPuUsUWhBF0TsgiwA5n7AcS0QZZWLWq5
         3MkcbzHty8vwGmyqUAEfTCA5Bv2uSom2xh5pi745DgCExn5/YppnuBCIM8tsVbq2w4nJ
         lBRJBIx65MkEl37x0yDN6ZBack8ERrubBM7fZKv3zWi69km3o6ie3JyDC9M8PWu4FRGX
         WgGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793626523; x=1794231323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiJjr6MHKIw5QEvJXljJWlEb3Q+VDlJLUff5S8aekMA=;
        b=2Xi24gBuoavNz6aZf6CMokvOf6Uld4VItwlCFn/eODHHqtrFp3u3cHpkTR15G0e42/
         2ABFltb2/zDk5VnNCv01YHPotn5LD0hf6QQ4UofVnLR9aFgEbNac2166Rr53SDC/SyXQ
         OqlMVQknR6FM6DJFZqdudtWJxcYzhc4lfWd2ze6afM6xoGiC5P+f4bmQZreaZ6chqWpW
         FV9RQ+83K8Tmg87g1+ByeZYgjWnHlretUkOZuoBCLzHLTeGJdepfIuhhbMtUTRoleMEM
         oGFwzOKbfFDxxP6jR41yW+Jtvgw8ySainKStidCkuf5trguo403ddPxsaSMB1cZHDlYC
         J9ZA==
X-Forwarded-Encrypted: i=1; AKwUvByqQ1BrZompSmrQAwWPfpjtAYP6p2hYCBD+eQvzK348C5YIs9oN9BIrg439CrL80t0jkIwO8e9zM5Xw73A=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUV1VcIS+PGkAAjzu9xJXkuuJOzcGp28QYnEntNX8AdXXqsiGj
	9NSAvxWQ8dsc4GMprNRt0dubgkgMr4jFppdK+8t/3sFJM5so3KUfQttTslc+MKTOvle2LWYrdp8
	LmadRlfxaB+IevcLN9jv2aejOm3KudiKaBaahDCrUVQLEzdjuPNpYvXrvpGhPv8OpYgs=
X-Gm-Gg: AYBFou19bgIKtRjmrkk+NjM/B/4KxlRaCOM419keh8Ukl2xc5vMasjTPkPdfig5d9rp
	ip08loLptMGZi9QtpBIPEOKSNw7OOX3bOtu2JfgHHexSkKV1AGSNWR0JyyY3t6brtRhCSDiTlTX
	akzhRFh9HRqcNEZYuPhd1NX99HpD2J3xnayJJ9/OqdPcxaBAmHSFZrkQ73+B74ClAQF0iRN5n9s
	opNdGGw9XEP5e4RB+kzFZnXl0upp9ADuaLc5IvV083XHJ9RhvDeIhf2MCeCq0bdf8YP53oEvsyK
	GUilljLCs1fRViH3kAaih9+MT/xLpcLHa0qsLrL75DFaapTWdtFuXGrDHxg3zvM35mLxxyLtPpr
	57N3jdSVXClkjg92XKYT5VN10jQZGPRtr/o8v6YHJC7exgd/guE7gJGTMGU4dRdc=
X-Received: by 2002:a05:620a:6292:b0:93f:26d6:d70b with SMTP id af79cd13be357-944217108f8mr1545471285a.29.1793626523381;
        Mon, 02 Nov 2026 05:35:23 -0800 (PST)
X-Received: by 2002:a05:620a:6292:b0:93f:26d6:d70b with SMTP id af79cd13be357-944217108f8mr1545463985a.29.1793626522749;
        Mon, 02 Nov 2026 05:35:22 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf0b36853sm259158135e9.0.2026.11.02.05.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:35:21 -0800 (PST)
Date: Mon, 2 Nov 2026 15:35:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 UFS
Message-ID: <kf7tlseo2i33u2yewgk7iq6dbgunsgyrta5lolustoopowxmee@vuld3isilsoj>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX2Ezz5zQ464sh
 mzMha8kgcHgUXPFWTRzVZtXE+w+l5yw5WdiRBZFFYJTelYThtTuBCExxy4j+0jSttVk3X3oAnh/
 fWDp9+AR7dh1CF3cGFsdegFKhU4woA/UDmT6KgNYJXL69qHXlt5wjif3sqUkqNI+nW16Jk4PLaa
 NIGfRd4wefYL8v2ZsTujg/KxBQBCpN1QpLgh87ceFIZk04R9Z63olPgMgtTYZiLMD2VhgUil4py
 3/EiuuJ/wYpj3uWGrouUlhjuEZGQCoO1sSwc8ayz69MzZE/j4hiosmpDX25bnOQMnjs7Xr188lF
 jeYwttFUxefBlpaeyM2Aot2X7AXxISn9eY6S6rw01u/z8EwbMkVYr7tKuMGqpBNvSJqUvCTKBV+
 GcX9DeYZI6YG4il71ICHf/Dp1CElWItosm8YazCLc07AkZoepoykkGGrCf7sHmh956EflNmuMfj
 wwsjOYZsX1eK3OkoSGw==
X-Proofpoint-GUID: xoyWA216V2p5XHjG5tZ3BUyuk327W2IJ
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae8919c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NCBTYWx0ZWRfX+3+I50vJZtev
 1e86RJc2WCDSQmxCcf6ljJBapVYMSPq2p87BQvPXr80uJymqXUKHhu81TPpJ+ZzB42uUoNyEWap
 BtyEbv7BcbwAwAn5Wxh+v2qWSEPv6f0=
X-Proofpoint-ORIG-GUID: xoyWA216V2p5XHjG5tZ3BUyuk327W2IJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020054

On 26-10-30 22:41:33, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
