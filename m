Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFC23AAF73
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789718338; cv=none; b=mU6vRvLUno9mwuSVy3UqYXDEXQ3vcKC91PvyLeA5kd3Ms864qLTlyAa7BmKYU969w0tcAhJdYNYee0mqA/mMMAGPKIT312BtnaGdqykNzNBFNhQgn1V5WFM+IDenhAGX8koyGgMno6fgNbnEDVY0Ykd77sluyMYqqEk2TVQ+FmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789718338; c=relaxed/simple;
	bh=RGpT3sxjgWbmCMFX2I68gEn4A3TOcCWmHnfsknCtbJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oldVtZmxQzDvhQcglLIp01ADzpu1P5+5EZJYW2c3C/G2hso7YD8QuDeqAt7nYFGHgFn6SS43diosThtvm+0EYtF46VNn24H2n18he06uNHh2cUz+D31lq+V0u9GzHJx2xuCW4LzVJVZYWNeaDGJsiDTR1AmMbXKKtghm8Dispko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bBNfBQIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HTc1hQw4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bBNfBQIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HTc1hQw4"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xxZ12660297
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HM5E/LrBKbwT43HaG1MhZG1G
	QSq2jkFM3/MQ1ct8JKg=; b=bBNfBQIBRpR738A1numkUW9Jxc8hKcBwGuybnwDI
	7HYqUuCAjTcV3LXM9MTDzI5pY//hhcdZVaku5wW/XgGa2U2lkplRzPtv38hJp/Kw
	3PvTmnhNxv402L7VaxO3/uGWW7jcbEBSvvczw2wLrON5kBw64ovU08RtaG2dtL0r
	5k8gEcGM5PWPHkv3K8Czs272hCC6v7NjZD8in9Gq8jAQlf8kH0NxHZ+a5E6Asyvb
	bOWa4uLF8HixGemii6IsFzFnBtf2XHS0EC6b09muTR2yHCcPjMW/sFDNoCJDxC6O
	xbKgcZE3rSAUEHnv4HoOLRzP19BuEwb5p4ZeItuDyBAiAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttut03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:58:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so88851585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789718336; x=1790323136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HM5E/LrBKbwT43HaG1MhZG1GQSq2jkFM3/MQ1ct8JKg=;
        b=HTc1hQw4CVNx/DplTSS8dRESaIXo0HexEqNoTpf+JUOSYFO3UUCFohxELb4UZvzevf
         nrQcsn8Yz27CYfIBQw9FljjcTv+s2xkC0q4eCNZWXFdVyYWicqj5QIZMScLJmrW/Gctj
         oCfYaXUZ7yaeVMuYbTx0QmNK5lihhl17+9s+gD0iittjypMr7S8fnJ6FXSoWvXwdgSu6
         0bf8iMW8jfse/Yc/mUvuhaQRrr+N5YXCak4anw+pN4e3M5Mzpx3ZuqnBvdKZkg43rKyf
         NH7UnlMnbnnvr5xmDNdr5y05e0vo9oXgKTMT2KPgvhYBLw4TDoMswv97nHIUMHHrshnM
         Flhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789718336; x=1790323136;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HM5E/LrBKbwT43HaG1MhZG1GQSq2jkFM3/MQ1ct8JKg=;
        b=Ha67jfvSyyNx7/wk07U52T+13KCuM4fCzwLfo0xpAT00vaCkcZijgmdQFPuzwWJGHF
         2N63WWjd3J4LaYG1nNQ+guefgl+ggCaF9a3z7wwlX1nF9ha/hCfoVgIsS4maVaVJrZ93
         GyvUhWSAt1gzKRq9wOmIa6TqJnsXE2Ua60w8wdnHTVlJXzNRsJG/6AlxnQXhLXZrIwqd
         PRrmaeyCKmACPWEIwDF9eNnabVxSbphcO0FzwR/QvA6mz9x2FEdoQ80yF65QDUuLeKGl
         W+yvpCvDsetJOMppxHOOWhgtRbiBRtSMx/X03lBmnBqkEG/klGggNcqTRaEIjCC1JHOj
         C1+Q==
X-Forwarded-Encrypted: i=1; AKwUvBz6eXIeWxNnyzjwssdppWpaYD4HiZihSRD+RKmzHs3T42o4WYxNvuzgCJ146m37CCK820JtuI3Ztv8nQBE=@vger.kernel.org
X-Gm-Message-State: AFuF++llB8/uOerV9Wj/JlZwM2avmkAwQOueI6YtbXHMCXpkmcmGMncm
	l3nZboIwCzDy9VCFaPBpPGZFDnaIXVvK4UMiaxuo59guydkqsAo0jX4H4SwlZ0AZIxXiN9BlA7i
	UUA167BMAZXzCn/UzC4LIcuyKJboMWXLzv/PJShof775+kVGaoMw4XOn385jmRzakSPo=
X-Gm-Gg: AYBFou09ribqnFzUNJSEIdbdC38O3bpDqAdxdmDUx9JfWXJWuCzYZjBUJJGOq3Moztu
	VN9MnxEYPnoipDWF08LrLeSbvz6RtQxZkJmBzrVcAyykx6iW1ijjWcAZcCmNB/y2FMLD2L5cNrM
	S0e7Wykj1sFA7bskw3eckPG6R6+tw5N5EdM6IA9nMQJw3m4heoNCKcaGFXeaL2lBT34bqT0Z0yh
	vI3MHZxXqmMLtVF+CXCnfzENoXc6mSSGDLG3svyiKOp0cIu61enNQnrAje71zVuVKTfMDRIUnNc
	aiq8q6zzDI9NzFTDQ3g4IMGumweVFIEOumGX4jtgKbFIzA/Ynd0tp4h6AEMstpstI3k2EgVxuPj
	hkMer+nLnuFN8j/M=
X-Received: by 2002:a05:620a:46a0:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93bdc727a81mr231693585a.21.1789718335675;
        Fri, 18 Sep 2026 00:58:55 -0700 (PDT)
X-Received: by 2002:a05:620a:46a0:b0:939:ed4a:dd75 with SMTP id af79cd13be357-93bdc727a81mr231690985a.21.1789718335164;
        Fri, 18 Sep 2026 00:58:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871feb5645sm1900468f8f.4.2026.09.18.00.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:58:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 10:58:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Amit Nischal <quic_anischal@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: qcom: rcg2: Propagate force-enable status errors
Message-ID: <wqehomyzl6qtc5xsde6x7kpht3lxujtvaftmugspwqhthqhius@jop2a6bbxim7>
References: <20260917-topic-qc_clk_fixes-v1-0-5531cb00514b@oss.qualcomm.com>
 <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-topic-qc_clk_fixes-v1-2-5531cb00514b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX6un36T+ecCJj
 xZcPp9MWSbZOorEhSFsBg7bJRZTuntYJ6p/vlFNCjsSWFRHMVwW5oQ5Ndcc6GilXFzkI59d+dNk
 Ky1ikXR24FkKyk5DlOfNRwMool40SL6+pmPJ7jp+5X0piVkwmWmHqa1lurrfkyXadfz5uPRFOi4
 mMIm7wlDfVKoHymRv8V7BRYLzgZOukl6TphGWGtH9pH6AN3GRwG2FRHHQ0OCv9nuQbu9wPHtFF8
 +VnXatPt+eFxHBh+9pWg2Aqo5+y7tJ9CHVyCldYFIhsziDWxtA/qttKKtWdJeY1HFfB7IyWhzzF
 8982gQjiVwJItXphLGlNteV6xlz3vpbNDXyVUrmYDdZ+ic69UXAv7rGRlceAwWRtTP1yxTMR0QG
 ZilqijEz1OL0n5Y8/+yVt3rTLE3kMl3+0wn8wxgQahFjxJEeyJpuIm7GaDruEP6PbNoTXPVu1yt
 kLlCGBkwupgKqA1A5UA==
X-Proofpoint-ORIG-GUID: 24-XUZDBZi9XwrPmj4YkIPM2XItRsLrq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEwNyBTYWx0ZWRfX1Xz4ukBjwfH7
 oIqf2F69dIijQ0SIIMHLdYqIT8E5/+HSmcbt0FtLtrUpRcUrjLXnplcZQEO7K9Zy1WDpF7GGtMh
 UqRGgL7L5tPiyaQCwvIniKzCiyHjLd4=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aacef40 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Nbw49Jzf-jmJWK6uOdwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: 24-XUZDBZi9XwrPmj4YkIPM2XItRsLrq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180107

On 26-09-17 11:06:54, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> clk_rcg2_is_enabled() returns either a hardware status or a negative
> regmap error. The force-enable polling loop treats every nonzero return as
> an enabled clock, so a failed status read is incorrectly reported as
> success and clock reconfiguration can continue with unknown hardware
> state.
> 
> Check for negative returns before testing the enabled status and propagate
> the read error to the caller.
> 
> Fixes: 7ef6f11887bd ("clk: qcom: Configure the RCGs to a safe source as needed")
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
