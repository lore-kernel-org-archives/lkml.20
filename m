Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E514F30F2
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568632; cv=none; b=EG+2xHgAJBodkQIXD7V6vnC/RllpOTvs4JdOYxIxDPpTU/iJYtS2YNjY0mwKkihXLdFYuxorl3zyGCGzBF6f/LnoG8AHqyh8CkU5H3R5dZyDrr1MJaMJROJOva/XX8PHCKBhE7+lGkfwOiIU5cJneraaENgolC/GufcbyzRlkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568632; c=relaxed/simple;
	bh=Bjsr3xCjRh+8NP48nDCjT0VwEkPEFn0qIrSyn+hcM/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B3FZK6ivHPsuRtKz6FyffiE506fzcIKXHJyIIKMhMDr7f+TfG/2YovekCWq5JTzwJrr5aKbySRHJOhYCkIx7zdZEAsuJuGSkqqu1yj7J8gvyrAAmJu2S7Zn4Pxm0GvzhXRICzE3Y/OYww/uD3YgrsgW5Y6DPRfuo6on3Jsh/fio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fs5ItpXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h+GBjQ4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fs5ItpXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h+GBjQ4g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Ha0XY3585035
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 17:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nffAJXTeBwjOSZqgpOqFZEPR
	9rRQOvtq5kKplAVEyx8=; b=fs5ItpXtZ6Z4fUIdclaIlttdaiY0b1K6omQx6c19
	Kza4b+OAIueYLYncnT5jrjtATSbjlKwbWpbYstvz6iBEFEpPabydHiCs1e0jM70t
	gUSdYWl4HdVbxGFXDQlMP4fqW87x08UMANQw9d9iEXy8NLOdE3WlnT3llrOg/GRD
	otDWMoaQhUEwsUdcbq8pmrmf+kwlu8ymSNXEfXSa7O8Kio0LZB7BuiImnGaFstEW
	VY/5rw1CHoINxONjE0t4rSEOQtB3cJwjNzgNnidQAFK3DkFesXdQ3+jaFR27m0Fm
	4GwPD1Cyi8XC5FhuBbFsf2JFk2Z8aZfRxB2T+f1rYr72Mg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t702t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:57:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so1452721685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791568625; x=1792173425; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nffAJXTeBwjOSZqgpOqFZEPR9rRQOvtq5kKplAVEyx8=;
        b=h+GBjQ4gXFHxJJwxOeTo/T5eDQzYmvW2bHVc5U6HNby9WJlLLTh8Ypfftjqdo4zF/L
         ae/Czjse4fO/bM67XAimW2R6kzfUHiAydqIHcr2ZpFMvqjMPWZrjfiG3mT7kxO2HuRr+
         BWiFvgQ558aYP8fWNmdGCX6lkQrh3vcfoY8dVQEjdTv94V9Y4n6Zwy+DChoQEb4GZ94H
         vekmJbpJR7NHCzXO0/GmnkTnD1Osw1SHK/FiqVnWLQ9vyM26dv/Ms4nrPLs0D6+SfPAQ
         GwFA5Y30X9iCJA2RTXazBYkmWtYO0R4Kzz7cSFR3IBbvyA+xsZYmsHeu574IJjdAO9hY
         a2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568625; x=1792173425;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nffAJXTeBwjOSZqgpOqFZEPR9rRQOvtq5kKplAVEyx8=;
        b=Wyd3abb8+BWj7dzC2WpBVz7PJXVd6zzxgItHXRL104B1hP4FX1a4eZ+jKYtgZ1z1fM
         8lo5i8LwZo0trM7vew09pYq2w9devm6CRBtzzfUBdzObb1Lm7KMHi1SobCEM1bxcCExT
         ICY//uuuUoNr0KNjW7g8qtksuGxJQA6I2hH2VuL8P06fR0BPdfzxQ3b6r0zOaSUFQBIr
         GKV+B4pEYFwMRBRW8gzgTEn/+Q9Hqpfxypz82d8Nx3agehrP5LjAgKT7hpO+WE9hZy3L
         7g13IQVypqGmDKMPYuIHKt0DhXPrIiYzfeWy6n3ewWLfL/6V4HI995Cq+TcUtYeXNBPo
         uMwA==
X-Forwarded-Encrypted: i=1; AKwUvByl4luP+oo09hiqG3uPv3AZtT0vokpnlbiRhrECwjSy+iWQu+vNRrrmLlaNXYW/DX+WjvbGw+X25qalI0c=@vger.kernel.org
X-Gm-Message-State: AFuF++kFAS17zjRet6ItWMlTjZ8H9EyOa00T2J8Jsn47NYpS+cSAnRLX
	GAVbAkbU7LV27pJZVtNFw8Nz7wzlhY/CIGWroUj4+4Hm8Ip6QZth38BJqwLYJ8PxKqpU0Ln86Di
	GjuR0K2yUMjZMEfbFYXqxa7HXwwMDRLDm3rQ7MIhFFDCXjaM+OBFYKpl1ZAwGS/TrBvg=
X-Gm-Gg: AYBFou2BVGBewBJR85k5eMwGUs6b/W5FTHHdDIXny/UyIex83lqqNsDpt+UZeZeFL+I
	d7DAkYA4G8/URzsZb8//OgJ99pc+C1gz3uZI7CBPHotPZxpufmEEujtaSo0SOvsTC/BvoTIvPNN
	M3NpcPifYZaKwRdr2+/AlVCQ7Z8wkGI6pqwvRS+xHRXh/T1p46lHjICBHYr4aeEXfJGx8fP9zSE
	AJmTiL296MryiRoJkbVwVHusXPbSB/2a7WGy7R5NAK/4ZGKhQGqyOSJN9g2BqSLB/OZpK8BNaTd
	LX+mtCaGyAyspGOdT/Q26mSxqL1sOPRy2M0m/F8K2J/peE2Yoelj41+8SmMgHEfan9lHlIAAn2X
	SpDk09fh0cvNOblE=
X-Received: by 2002:a05:620a:4414:b0:93e:c12c:f13c with SMTP id af79cd13be357-93ec12d0615mr322004985a.70.1791568624508;
        Fri, 09 Oct 2026 10:57:04 -0700 (PDT)
X-Received: by 2002:a05:620a:4414:b0:93e:c12c:f13c with SMTP id af79cd13be357-93ec12d0615mr322000385a.70.1791568623867;
        Fri, 09 Oct 2026 10:57:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be97d1esm108846795e9.8.2026.10.09.10.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:57:03 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:57:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
Message-ID: <nolnhsbkk5w2djtvzzxkcq6lrb5xixlpk4elhk53uccgjyt36u@hnpu7gxzoy4n>
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Z6Ygv1N6vUUVBJutxLq_0VVzve3rChDz
X-Authority-Analysis: v=2.4 cv=Mbr5KJ/f c=1 sm=1 tr=0 ts=6ac92af1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfXxhb5hiTDeT4W
 XxKKtr76DWPq38oBTfMzxxMIBMfA8BDTU/LkRlpcRNeahYMNACYbR5iZBCNu2SRhtsE1n2cWziV
 b1WfF0KfJzOjYVrwOJPtDVYOAxTuyoo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfXy04TaMM2izPe
 5Feda3vEkgr/QBCbZ7ED0HWFbUBwgwQ26Gn1oCSVt5CfmLvJxuP8bbn4+mL5+vlAcYtwkWO2+zp
 gLFHy6cy5Pm7wiE2TCVdotVHCJR2TIwJ4f8w8jmWiWVBia6fXBSIoNnTj9nC9Y+PsTCMwM4bDbF
 OrKEO+KucU18fANSyps2KlM15S3mwL5ObeRpBRoRikWtAMRKXpIZgVHvEB3DQKXAgqq3+xaIx/m
 XBu0ReLUOIZRzC91AmDiyKogjR3nKnFHUaW/H4chUZaKaBzU0oCubSenJ+Y4c1tXrocmKAjpFJR
 v2cCqaqkfyWaTSob9RUrRy+DHobmr0bbBeiIgctXyf7+ZLAa0OoOkI4VQpgUAbilNMdo5u/xqM2
 7BAh2cHgmI72j5Ah6X/4Wnx08Coc1CHCG+TgBQANBTW/QDUL19tOvmIY3zFxVSzUtVFkCF8xzWr
 kipfYQm2qCfS42ArRVQ==
X-Proofpoint-GUID: Z6Ygv1N6vUUVBJutxLq_0VVzve3rChDz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610090071

On 26-10-08 16:10:34, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node passes only the first two.
> 
> Pass the board sleep clock as the third input. No functional change,
> the video sleep clock keeps the rate left by the bootloader and has no
> rate consumer.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
