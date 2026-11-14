Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667817;
	b=U/qGxUO2KD49ulutYD+TvccGs4YWcMtuXKanvEQgjgHti20Lw2ejZqdqIpFRW9ql4Vf8
	 sCnZob7HTdwsmtHKS4pVvy0pm0WqeuPw/YZL+iNiHmv8pLMM6FXcY3SV6lZyO6gNPF/SZ
	 Ws3l1PbV7vzaf7geUYt1AMbniCY6NfUoV7i375Dpj4ZI2dov+gxP0ZJvOF9lUm8LcgHti
	 Bvrj930ZoVXJ/K+Z+N0qHiWkbpzsXR5ZpllB2uRU1y7xvIHa2ggFxsP6grXiLPcwvTyzU
	 Bo5Fyqq741pJv0Mku2Em5Wefno8U+5iiggWMjYePPJLM6ehAdknmifjWYJ0D5pyGQ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
	b=19Bm0GRIVZSsi42UWOnCHiD5RhKYItXMkHSQI4Ia5r6rv3EuXYDrPLIa/0w7KWI/rlXw
	 zt5IBVRsp3qEH+OyADOl2n5hi0BqHrwVEgYxuu0LOFCzxOTgeQD7HRB7OY7GxdBRllKez
	 qptmIFfrbaXvDIlmPak9ilhM6vfZaPooNJMb7eJMpEiRTvUDMQKXuuYnYP6Nwe18hXImv
	 vgQ/ZB+iaBWBl08U7l/NoaOhzzkAcw5sjsfwKWnPycLEd7Uj5HpVcr1VndhTKdqgCM9e8
	 YrHP3bLgVKok7lNJ6N4HICL4zW9zEyGQYx5x9Un9nNWgJhJjRjeK4fDDYs9sh8WBSVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nM9CmwQC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="R/4r8wfQ";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26E4606A331
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26E4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nM9CmwQC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R/4r8wfQ
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkhQn3741417
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9jDnWKJJ0pLAld/G+MaxErfb
	Fghz6SX2FaTcRT+rzJw=; b=nM9CmwQCDWM1Y68yxe98uv8Shx2fbbvjArambs3C
	ov8quEOMm+Dbu1yylZR9bjJNfEHXlDDKAo1hPizmYDAtnK0edBLTfhHulQmRe3W+
	YLgJVAbaJJ6j3IFQ6DpliFGKu/YEstqcivf+2HRS840cmGoOJADrimWdKjJF/RkQ
	apK8ZdOPQwolgelvS8ItdFU1ImP8PcfAdlFs8+J5eXHPNjd/cdopnwCTidNYiZ+O
	LrveVt1ay8dbt7c0HkXbUEbKyO863eiyl0HFa+pXVriQwud9urWfOH8R3V1X4xV7
	npOe5lzlf9GpxRu6X8rihcJ3Axf+JsXamAaHDXCBTXwMCg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqh3xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:50:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so38823285a.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667815; x=1795272615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
        b=R/4r8wfQZLCOmBdjUFepWd30POpqYihRSirArJ6RJCvJzqvIIhnxAyKdnEp09go3Q9
         TIvFvo76FRD9pcJGe8UJ3ylmd7tfBWdeRFtfZ5ALZZY07Fs2Ba0OmKdyxC/eBk68+pUG
         y0CxgmPdTSlnvpShLvKAT3lUkJ8ckEYuDXM4mT+GtBnniRAQmtibQ6WNrN61BZK+r3yX
         ndo3//zifDlj+JliI4lC1QKJwe0h0NNIW6Zk1mquvNHzY3ut6jRHBbDWGElV7XSDbfTY
         qTSSSj722RdtpgP5IVI4juqYOGabMRNzDF8xLFhQLvNM46u9kSjbudEjPl8yz/AFy8VP
         Ub8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667815; x=1795272615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9jDnWKJJ0pLAld/G+MaxErfbFghz6SX2FaTcRT+rzJw=;
        b=YziSp1foJozU3XwU0DzdmbOdcuNYFjZloTlS2RbTqykId7Py6ygOfg9ouNKx0TibMs
         5xwLYzOh5OUgMgjBViSxzVeGFcZWNPKdZaQEEOS0oXHHOCd/BjBabZmjJZ4yBu4w41KQ
         u6z8xHQlWavpy+KF66isF7jTA2w4Q7vHQvJp3s4lx2a7m04+yZT6MSrFNvKXp7Bbo0fO
         QcsI7fUQEcV/IxDo9ZNgPYO3HoZKtktH4Qaqb7bbCYKCdo+6X7qCSQELdFR31EWtzGjP
         3y3nScbh+TBZiGhJWKTB3FiIlSpK87s5jf77uCvR8qF7jN3AcPCCrgfWzidE+RS+lXGp
         nlcQ==
X-Forwarded-Encrypted: i=1; AL+hErF7S07TYvyu9Snh7oa0BkxgcphkNuO+mwFe8qwSGV9iDi4wxI87HjyjMvtCiatvsiKOY4Qz0iOCmz+lQ2s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8wxr/G7d57pXTRl1HqQqghqs+FA0E99lqsI1EFf89Yb7Ewe2TO
	iQkTtn4X30aLeMJ9KQAH8amZCGRsVLlh98io3Tf00EUBxuWrZ08z4nMlGj7Qkevdgw0ahyHGJs2
	CgB60K28uadjtwChX8r3k32WtVDIU5UQVgggB7fU9lgf/oTcjOCGeKFGKPYTMTug2E5E=
X-Gm-Gg: AYBFou36Ugv1DuTMbtr/0Ir6aIZij5MRFfFte5pqf5vrlVQhbhy0tJrNRTpVEJYI7Of
	ovR3EjhyOI/tlGZS4lXwDxBjwc63QOPS6j9i8FFBb7txQA4AGJkxJ8EFJEET1NkO8Fp8rAP/rqS
	N8qkR8lWtgyOmUYx62Q6K2bIbYXZaGUFVePWKyv0prxIRIZkGJivQpNM2pnHnAVRCrAMWapTM+8
	2yaLg3njDVFCgRHQbpAhSO/flMXugCG8G5q2yXcgrF+djUmxAIkNt/z053FZGwDSGSfIso0ZD/p
	DzzZQas2ufoud1DFV0MBqAKg67rieNi2+s/TTR16u2S3z6mEorxj/xrOyAwmPxG7o5xBvBPZINZ
	bgS0Akgmzb9ecQWO7H16yIL+wwVS0H48dsthaGM9bSUpCfU7lVJcgziL+fuKQVXmA
X-Received: by 2002:a05:620a:46aa:b0:949:6a51:5643 with SMTP id af79cd13be357-9496a516960mr173679685a.6.1794667814718;
        Sat, 14 Nov 2026 06:50:14 -0800 (PST)
X-Received: by 2002:a05:620a:46aa:b0:949:6a51:5643 with SMTP id af79cd13be357-9496a516960mr173674585a.6.1794667813989;
        Sat, 14 Nov 2026 06:50:13 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c7da37b19sm11025041f8f.5.2026.11.14.06.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:50:13 -0800 (PST)
Date: Sat, 14 Nov 2026 16:50:11 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: hamoa: Move the PCIe and UART graph
 nodes to the board DTs
Message-ID: <egxevic5xnzmjxikmr2hsj2tuvco7zjktbyiw6oifjsprgw73a@vflocomd7qds>
References: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
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
In-Reply-To: <20261112-hamoa-dt-fix-v1-1-55efbac840f4@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af87527 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=c6MnNOAcyMoAY2_djnMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OCBTYWx0ZWRfX5QQEPUBy2M3W
 1b3XLftiSE3m2aoAEUuGwHSFUPN1GIb3KRvP+3LbJYYQZQOVbe3f5Vm6KSCp2BUfnBBCVXlbiXR
 IF/+N3kIRmFC0ZzQnbzSBQ68uRCf6U0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OCBTYWx0ZWRfXw1Cnc8g9YbUS
 acFPhq+Z+2eXA8WO4SuqTuSLGDci//9Z/IWbKpvLHtGz4h8p7lgr4weIR1EwxL4Y/ZhsvVH1+M0
 LTvM1GuiPFRwFneHb2P/4wlgdbFO4qnhHk6l3zdRioQna5Twji2WC1XgajvPUf1KqbnJHhR0CFu
 MpwH0YP9G+2zX+YznVji26axbe58JnluRhv4yo8gEgmrH48bXW5FId06RSE54jK/QC7p+L2x/Oo
 Tb7NAJQcspbeNSPP3RsWTm9gdEFaHdsqaB2DcLMIRMGe3rqus6n1VSBbgdom7jHCmrwdJnD59Us
 sKpmxLXF7ByEVwi0LjQHCN0+Nqjd5PFQpJn5Yp+9NIUQki06qnuxshtoXmtNFilp7GGQQwt5tRL
 4LkExUZE8GExkFqjWN/VW26jPshUQ+uuJb9WFn+8GgkpdwEW5As10wiMNspM/x3d5WCYqEP01cl
 1H0Xt6GujBt4Ml/3XCA==
X-Proofpoint-GUID: upmLvcXCuvUqEZ9nqzEAmFsNpRQErw5U
X-Proofpoint-ORIG-GUID: upmLvcXCuvUqEZ9nqzEAmFsNpRQErw5U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140058

On 26-11-12 16:00:25, Manivannan Sadhasivam wrote:
> hamoa.dtsi describes an empty port/endpoint pair under the pcie4 Root Port
> and another one under uart14 node. Both belong to the M.2 Key E connector
> and only the Hamoa and Purwa IoT EVKs ever wire them up. Every other board
> including hamoa.dtsi inherits two dead nodes they never connect.
> 
> Apart from the dead nodes, the change also confuses the pwrctrl driver.
> 
> So drop both pairs from the SoC dtsi and describe them in the two board
> DTs, next to the connector they belong to.
> 
> Fixes: 014501d141ed ("arm64: dts: qcom: hamoa: Add graph port/endpoint anchors to pcie4_port0 and uart14")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
