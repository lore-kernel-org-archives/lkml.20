Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792499837;
	b=42yEeG7R8zMM9eKGsyrWDdtNnBHFDMF8Ce18WKnAk2r6mwWRr+C7JY1f2IP/ZbJ6o2X3
	 qlKxMlf7kQYvANoUPfC/nQWBoipphz7/Ku8OmBOiBwQoYueafvJcq+NLw5aWTJJaAOP4U
	 u5wppOHGPG5NizMBUMROmsbSYres6lcdWr58Hnz+Mb3HQOYEQy9hcE9mrtc06JbYtyc5p
	 mkCb+OydB/b5LyttkiNilCfPSsqdJqW/iiSK4oNi7HSL7guCIa/7UgfbTWziifWZA+t28
	 4YFQhAS7Ex6Scps2z/zztwLZ1KhO+7A+GIFipUWUYh1kBra8ZZXmkbjMJfpT0DR7qcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792499837;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
	b=NV2K0nNUXJ3xbQVnaY44mJ2wa5Oy8iEl3G/UP15LDLh5fSspIYkOkXtsd25qJ/ClCmr8
	 H2MQHjiw4nzGtcdGIO1n4fr7eJTqd0IAJcXQoThHk4UiRwN9OpMnmo2SstMNsypW2cxGY
	 H4hIHVYg6mmVCFQB9cL35U8V4qccIzPf5Ba4JXSoBtboG23Kth40L1wJTnQSdX5OYzMQd
	 kWH7Z35wpoCEG9ENiLt8qIOzIJ1Rr01pzsNtYM7ew2lhZqr2RLKsVhKd0x0AOH2GWy65Z
	 V43H1MSQ8HdHU8mfCv++KYjKP2TFV/82mvBEP4G9gkQTX/GSPcArFaduVNb2F4/F11A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="YyX/vk8w";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ3PBRO6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F4D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F4D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YyX/vk8w;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VZ3PBRO6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAwu4Q1929070
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=V9/5S0k+CnWnpz/HcX+zG/F9
	NBsY/HCPRA/q3uYgiUU=; b=YyX/vk8wC1kHa9ETiDE14KStwzhsHnaxA9nuhlCy
	QxeEoRqD3VxV1KiNNtONMHSVnfLebHKFXQ60axbPnRXTjEOL8MQM44goE7PWKdjQ
	GRuT0shOvzwlOPuo3NAWdZjKeovgpxidjCzUpRaUF0QfhhZ30SEmFpaM69ZWk1Ct
	+pbNg2z6BNuDU42Qqa/pPOX7y5FAeyRQdwkfZz79Kva+oIbpB7g2N98/1MbehiRY
	DXTl8Dy+e2iZx1jIrrJTEScnZ49YjHKyo2WY9wot+Iu64mOxJrY+vcF0UZks7hy4
	EmUVaQw3qD71xKOFiaqjSCFP1OZpSZc1bYdo54O927hXng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5ntcv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:37:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a082c014aso149867185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792499835; x=1793104635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
        b=VZ3PBRO6uSVr02WhAd1n/MfngZxWDxJ89lZPGiuA3Q58S87hSVXjnccNb4fBpwJxS+
         nK9SgAHW9ZRng0gY5r3sWBJcSLhZtFbs3lRaclzJneu558ZejdvyZeQWp0XGyaoF2XZD
         YSJc6wnKfmW+R1ZDzM9BWYJBjc4BkDrZj36RV9RNYSHoJA5dlQej7FRi3Stgzo5lOiZ5
         2bTcV8UsUPy5BCo5Jd5jigbV6ude4S4JP63FjMg4zP7hLEIXUhHgNWMiPslkJg5syw/I
         kcgw0BlKPZCvtQCeaXeHYeaN8Nt9aXEWzTez456KDUx9vqUCAJ0fozGXZiMOFKCuwTyl
         UN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499835; x=1793104635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V9/5S0k+CnWnpz/HcX+zG/F9NBsY/HCPRA/q3uYgiUU=;
        b=a0tJQ4EcOaxfOD+wZIFIo7Zf8MpZ2qsi/vtjKekawJmyQQQ1dUsXrdjY0YXZ0DZnmv
         lOhum8GBiS5cjjG0SlaP678+iP7WpsHO3xJ1V7nKyvpWp+x4MZ+vEtm2VG6w8nqJkxtS
         ufKG+ADmKnH3JrezdvMnwo0xunsgtjrbWg8QujW21LKny0nR4/XWRrWEZZ7NekC7TcO5
         Sslrxvga2YBYfj/o2XPSbnhFVAKUJaXzyIR5yKGr+lnO9bOtRTj5Ggfd3eHWnisIbsvK
         /VtXUUYPV969hDQiXDFcVu6qREYm7qIpQp0PDPgktMF4awgEUa3FpyNpDWhTbHlBUEdm
         wK2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzzCtTbKoF2cL6+bIKh1YTR4J6vpz+CAOLUulDu2un7EfkLA9jaZ6+GX6kjWvAot2FED+U9+BJp6B2mdtM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLwoCYNYScrCD+emhFckz3N612UNIDHhXDUsIc3JxbU6tiPa8v
	/WLdUjEu0YR/Qk5Zc65iAFBkOcLuy7ljFYGY+k7KvaS5Z5efFRYlyIJ3/zKXUZ42T3N6vwe91xF
	D2Jn3/QAX4qe8jlF1D/S/WzoCWLzmTZqnfVhI/ImLPPYgePOQo9N1wkjShnSSISbGCAs=
X-Gm-Gg: AYBFou2VOtwGnIxNTfz6d0OR2Mgc3sUoJAn0fAL55t2zyBH4nBeI+9xi64TF0UTAGNq
	576kURCkyxVWKMS87jwS5fNI5SxFsHChnBeJ6x+7Z6BJUU+B4HN3Nrx805SZVzhxHUTiA6qletY
	3pOJXMV0wmc2IGOTmgKuRFhLU9w6JHO/rNxQTAgsrxuSCVMMeym0aTTxRuxAyXPboTfS+iOVfxI
	P1Rbsgg6wNxAokogpSg+xNRSttnGYtj/42XHFveTQTnXax7XHiY3HtjoCHAdCaxk0YLJyBKFJaX
	FR3hjBFMwRtzHLk491078Tsa3zIbuvzKveOsbdM1gBhvml00+KPQD3i5thTAyYWpvUBNMBGLz57
	pbBv/CBIYI1P3/7bI
X-Received: by 2002:a05:620a:2788:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f4c7882a9mr276510585a.26.1792499835014;
        Tue, 20 Oct 2026 05:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:93c:891b:90f1 with SMTP id af79cd13be357-93f4c7882a9mr276505885a.26.1792499834370;
        Tue, 20 Oct 2026 05:37:14 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1e0632fcsm5146180f8f.0.2026.10.20.05.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:37:13 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:37:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: redducc <sushmit718@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to
 bi_tcxo
Message-ID: <2gpomabi43eos2aprz7red3m2cmdif5srdq2eg7c3o35pp3y44@cfhcrixurzs2>
References: <20261019161740.2384-1-sushmit718@gmail.com>
 <20261019161740.2384-2-sushmit718@gmail.com>
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
In-Reply-To: <20261019161740.2384-2-sushmit718@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX24OnOH7kmV1u
 8L7716No4c2zz1BPsXE3QDS/LIwchhISj/2r/mCrT++2GnM4FIdjFkEw9kTzMpXiZaVFberVuqf
 7nFNKuZnidBHNw1lmX0fz/jXOqFXTlE=
X-Proofpoint-GUID: FxJwABi12wHzT20DjSN4whmO3Q3VzQMR
X-Proofpoint-ORIG-GUID: FxJwABi12wHzT20DjSN4whmO3Q3VzQMR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MCBTYWx0ZWRfX88rVy33nRrVY
 0KjPRzmVSKBHvPRA58D0RIJW9P/WOiVJpWqnuJBxbaeF8W3unTSsCpvaFkvj5T5ayWY59tNhK6W
 vpFuC3BPcxmhqF9ioY+o8toQcdxKhHnz6YnTFdygAGT4JZkCdz/tTrYKGLDwnuGS6Wi8o4PHtIe
 U8AuXn/rLKPVDh/2BFpofbb/gN5iOq4twpc6gU8sl/D4hawPCmi939VHTQKut1UJWPLuRX5ZjOI
 vaagjhImcVT23qpHqSVF02JOQOil6OhdnLV3dp3M12hBfQJq6F/d0sg3lJnXBgxAH35+GBrC59J
 1gUQM9m+WdH3/5IwVXkEMENunmX/PwizoLUR1CvHj9WBRQE63pPlHZ5eHbZQCp9zMvdwafKNsnt
 06ykgnHXcuLFcCIJdSGuQzJuJZl4/h3FO6F3e59hf0Aqdk3JQg4FRmv/FErdwMQ5HT2hexzfWwF
 eq6JjNNubflWl2mOeQw==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7607b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=KyWEcasX42xTa70S7QMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200050

On 26-10-19 16:17:38, redducc wrote:
> gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
> has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
> takes this clock as its reference and rejects a 0 Hz rate as
> unsupported, so USB doesn't probe.
> 
> Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.
> 
> Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
> Assisted-by: LLM
> Signed-off-by: redducc <sushmit718@gmail.com>

Full name here please.

See:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
