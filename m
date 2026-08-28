Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5111443E2F
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787917407; cv=none; b=qRLaGE/vlKn1rK/k9Su+XLtJCGB/Gq2JgkvbJ3EtOT0W54ZGRKJxcrT1kzCznQ1jvE+R+M3Wz0GpRFB4nsecciQiHdOlC/wCsV4pFr0Cv09V5cmBpZoTKCB95fWdXIgBg7NDDNRvVTOIcSkibJ7Bu++GuP4v9N2sbQgJqd3uDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787917407; c=relaxed/simple;
	bh=HFcChH/r4NK93oSVruGnrec7/diczXN+uEa45YCif2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ds/jMdn/7hrbubXbZZfVpd8BWO0jRupXGKe52i1PmVQf3YmlMe3Dl3vuXXyJfD1dpo+TgebFFRdF0NqNxULnseygjO82KSWCGlwl0wYz6aMYUTacDntn6ohuzoqS9/n7EcLbrbPYkPuMpCKKuZRk41YvOrPd8g77MRfpiIkO4wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h1D06wpx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XqUc4hUf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h1D06wpx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XqUc4hUf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7Lxq2167618
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:43:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PlLZ/AW0rjHSgn2cU69J5W3enXVMl4VBxn8RgJOa3Aw=; b=h1D06wpxpEVKDU4C
	7MTvwoMGdtiiy/phDxBEwWtTkly7GSMQ8isO1eW8V7N6/MZNtJQaVhiQp/do/pn+
	Uuj52jXp+X1z79KtJG8Zi79lWVNgP84pWp8HuC31CZ1XQRT9/UlircoCa8e2kEjN
	acmq2XD+mKjTGPcsClYtNQ2EDouTY5gJROxsi1w8dO5Mbx55L/jFHg7V1TvArgvv
	mpLTOhJMrGLUOr95psY/K+eIg4pPsTn1YpI0dlXhu6rUgOZy3Q6TBjsx9G8dyf6I
	/RuKTeFonTmxxBPBdVxXLbk/k0DwKoEOhWwmPj07Z/zxaxex9Ym4RWFOhH3xNzKO
	55eYlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h00tg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:43:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-938fd633df7so21264885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787917398; x=1788522198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlLZ/AW0rjHSgn2cU69J5W3enXVMl4VBxn8RgJOa3Aw=;
        b=XqUc4hUfMRRgx/BkQb8aEQoPC+HGzTIibX+WPSr6BCk1ckI6ORXleKvGMN1+0G9b/F
         NKbbT3iuggr2Oj3BrDVKfmDLEFJCj7XCxOW3Nt7Csl8NUM2YAhi+XX3anFQAEvtSBfG7
         atGULgBDy8NyS1hFrUau8armm+wNbhXCgSMpSmz06w/dfqGU6NIStgz6b1b5SparClzr
         JMXcFCx9YuTc0IVqtB3JUBVdNfK3QSxg1eSemBoK0ruLLwD9kQkCOeVn9+e2Nd+vAqZP
         E6Rry7iu7qsGUvFlzM0eiTtXOV0/5+56tvje01Vch85VhHUDntMJWbjetMdemWkJZuw9
         l0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787917398; x=1788522198;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlLZ/AW0rjHSgn2cU69J5W3enXVMl4VBxn8RgJOa3Aw=;
        b=jB7soyHtvBmjKhuefE11zY0yKwUGamj4tbkLzX+c2WobLbPbldQe7H+3ZjB2e69uWd
         hHWN3z3Y4ZyqAjB4N+N8qwrZ433DYhhotaMTmdZ/Ljr3PBkYyDzvSIlHCgC+hkqfnLV6
         LQByHkdmfUUrDA5yGy4pzvz2NdBt/IZ4fY1O7zm0fR7kpSNHpMPXnrfygxN6VQWAJgZV
         UqoB5BDNIlW1kv8lod2ddWH6fRfufOnJxyRuOqsKJ8GeUXsg3IDkmJvvFUg7ctXJ735f
         KiP9lBU2gmLKd9KoEVT8rG4m/pFEukfqkE5NhJ+xdfOx9mNbb0AmX0yd+yaCzHYrYlE/
         S1/Q==
X-Forwarded-Encrypted: i=1; AHgh+RrsEphhCxq3psNnSgwxmex6wjkn3akoADjkUVPd698rHSBXZV7rYnwLMROy4fsyFJfniIF5yCQp12bCvfk=@vger.kernel.org
X-Gm-Message-State: AFuF++kVEXfUxYMi/9Q+zSR4V/EaGiS6pJiqnSrZmc0ZEfLhD03ZF/sO
	RNK7mAhgGxSc3VGwo82Gy7ADFnsBFZjCVb4ZbYiIqB18GNhM7HsW+ejAwVlrxc789ePMiVEjXU5
	ODKbDVuAtfDARsuPvdY/0l0OxXTmuYYt/ZbPc/lS1/RvWdlNxkf461sLeoUt/fo+j/po=
X-Gm-Gg: AR+sD13+EN0Q1/uR7AA0MOAEmAPbN0ORteQUhfAsMbK0w7sJyZYJ15Tn1Wx+w5ER1An
	E57svqoH/imyAkSjxR1+pF48UpU1a0Tf7OWIH5f5cxeO8FtfIlZyrFsmArus4mc3Eb0Fsg+pbLW
	lIf2QY4wjCoeyF11kd1fVJwEhtJfW9bL0OCyqwJFd3y0C5P0oZoulF72Z1x2eN6DF/I4TG97qdV
	HxpQUW+sSzp9Uo4e/spxKcg2n4/l+OVnxjTf/Lm6RpXSo8x+BogBEnDbyu7sCPMbuifGjDQhXG+
	w1y7nPz2LMzH+hE1rOFyh4/Iu9EztKIGqF96P+dFzapdAhTLQoE4hMqYQys4iJjR500k+U9E6G8
	0zQslhuUowS+j5o1P1br/Hf4=
X-Received: by 2002:a05:620a:8399:b0:939:fe9:4310 with SMTP id af79cd13be357-939138a057fmr374113985a.2.1787917397970;
        Fri, 28 Aug 2026 04:43:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8399:b0:939:fe9:4310 with SMTP id af79cd13be357-939138a057fmr374109885a.2.1787917397495;
        Fri, 28 Aug 2026 04:43:17 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b59ffsm71808066b.34.2026.08.28.04.43.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:43:16 -0700 (PDT)
Message-ID: <213b039b-8d2d-4c67-bf7d-2f2b063dc793@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 13:43:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] phy: qualcomm: qmp-combo: Update DP PHY common
 init tables
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ARc6lVNAoihkF852KIZjuQ_om_DpjIx3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX8L8z15BACDj5
 z4SKLG0hkxcHczqie4+vfVD5tBo1XrrWTEn3mHuDuaKDddttGaacRKqxGjPNGR8lc/i53fS9sua
 yq1n++kUrDxMeKSMINERMjx/GO0hLAU=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a917456 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Oqahiz4U4qnBBrGiSRoA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ARc6lVNAoihkF852KIZjuQ_om_DpjIx3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwMSBTYWx0ZWRfX9U/gkDVltFAM
 bx6yzBbcUGhCQuNj2jk5cIaCI9iGj0rkr7Tug6Z/rjHs2ZQTNfWhZrtac1gmx80LFaItY9COefw
 HQkhtRHo+oZ6g/QnELoYUA0XINg4eyJjMNo/J7v614UCNm+zPVnshhjz4B8ESCfxt5PR0GkKTKU
 f7FB495aH9fEBlXOmDTCgpE5g4F+07vmcP+eIFiRGe6H4j+oVFq3rxr/ch+rlsXV8TcmWr/SacR
 ylydjxs5wdQuBoHqlqr3yaEWcG6+m0ooTfYM8WqXhb/tuyoHMXs67DAGtqBHpDGJa6SRzPwa5pE
 WxfBf/myBPUfOjbBrJOcpy6jSuDZr6OYLPGsGDQrUh5kaNQjS5upe6WTeL5enzpZPhhsPQ17nvj
 EM9OT1cBTpxb+E0wj8C72yrT4RRNwpvHAbTbHHjThrRfK5xSK30bCgb549Hrx2BB9y5tJ5TIexR
 qNtFiTcBZEz9BcHefMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280101

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Update common DP PHY serdes and TX initialization tables with
> corrected PLL control values (MODE0 instead of MODE1), updated
> SSC step size, reset control, and various TX lane configuration
> parameters including emphasis levels and driver enable settings.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
