Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA964AFE25
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554915; cv=none; b=ctZoMxGSutDBtPho3lczi6WKDub4DLFDL+E+48zrdZvONIWSL/HLIRaRsGS6a7/DuX2w1sAddw3oMSvRo4rnLntnDjso5uenq606D8nIWuau8RgzHxFzt6k5uWZatgwTpcP0hPOSF2Ff0/9QC18c2Tl6ZnwxPFy5skWgojnRDc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554915; c=relaxed/simple;
	bh=rnKW4otznhYYxKyvoMqtArvWEdZaaE/10Lic7azmXbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgkgNtjcYb5CMdvCnmRkZ4Kib6iNKYaCQP4gxrymbM2MdGk4TuDD7yYjiGOaKmW2gLNxGAwx2bqVxEG0di9qZccvXBFjrh2xkczDje32MhDDo5ugi3PDK3I5BIIgX3yd5/fTkDsBHhNLsPASjUXfqdupsadyRkdPQKIjG7tN9Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p4izwLC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MvBklJRH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p4izwLC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MvBklJRH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93Ace2658312
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z55CMID7Tr3N5z1gzpPlBem0
	1Rigw5Xcv5g8Y6+kKC4=; b=p4izwLC1Kx8jEq827ruZiD1mS2WDTVlahRBffk0v
	EH4YSngSUcsZUkLBfZGxxpzHNDfNEZkqGehdW9//cS/M+6YN5ePq8kRYGtUHjY4/
	pT1REhit3JmjEFJ9fCcjlV5LZU2z7EjT2niwbrlsNTri6LHTDI2amcL57+pLUq+d
	RuW98k8bT23SaCiKSjF9ooMsiCU7OmRalKm9m+nf5sicecUaRn2jfc4ReF+Szft3
	eLQSFiTd63tB0X4oUvce/dUpUcvSoJsnK9xuTAORKE+/Jze5Zs31BgW5Hyn7262S
	SjnR8GVa2XfyqF2OVYPo7XhPz350UcDci5QzC1peeuNWWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujbct-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:35:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so22685985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554902; x=1790159702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z55CMID7Tr3N5z1gzpPlBem01Rigw5Xcv5g8Y6+kKC4=;
        b=MvBklJRHclXDCjuvZuHLOX1rNXuemhw1N8fvHX4RNGI5Ce9NyoX/Gtvv91pv+w4oX/
         Z+DolG3clpDZbgPvWv7dZdeBJjGLOY+J+BRIKt9+c5+7oacZGBRNK/TSN/VW+N8upDix
         bwWR0P8tdjMWAzuQroG8m0Y3a7RpfRoT1y/k3aK2S+r9lCpEYCd8el6IvN1PWvXP/Vjz
         /6vVNOURfeCiio+H1lPT4jRFCY/Q/ItoTesWP+zpKbbArw1otZ9VEnCUAMuxAO8+vZSU
         pKoJw5jlJuHvM2z5gP81FKV+JSCzi45JhEo0N5xnzgHIdKGbvaYYKj059sMzKmiHuzU6
         8IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554902; x=1790159702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z55CMID7Tr3N5z1gzpPlBem01Rigw5Xcv5g8Y6+kKC4=;
        b=1hrKDZ8KCRaXtT2PK4yV2SEWKtiMzeW/FmxsPxhSamha4j4bvpzQI32KVDLh0Hmuqh
         jMRbYCUpefRLENIVR+y7w7Ws5g5GUICieUviVcqbV91GxEZCKjPsw1+zSKm071oPBxLj
         B33/ew+U2n2nHWGhqX2sbGqJrMLRC0Lc8lki7+ZSLtB8JNU7zu/V/5yX7fBHyv/seGyz
         B+EajUhWxjGA6zNjoxPDkpO2CE6TjRHS02ukbsYvOosj9ntiEHZgfScxBSYUjW3jSqLT
         3bnjy27VtSVuyiJZXGU9iGKSI7MBXwsm9J1gEsaunS14UDkdI+voCJxSe28HCQoYiYNq
         QrSg==
X-Forwarded-Encrypted: i=1; AKwUvBz7UDONrqnvU60Nbb1UorVoe6PXFo+Dy9gxfLbhYv0rgl6nnchxX6gaKCNO8Gl29zI3FyEm5XUL8SiVKCA=@vger.kernel.org
X-Gm-Message-State: AFuF++lLCpMSO3e+5IzHBP+ep5/TEx3Xq9F2riORaupTZPt49YhJeL57
	tXSez3YtMy2Ia5g8769cnbn9MF+f9Gi6RD0bN0bEg1Lc0j4Jw9XeMfuV1J9WDawxKBZYeQVakhX
	pggecukMNeeSskPXaxoi6hisPjLSPAOI+9pVsH3uy0lxpK4P3HgkfqNdIvpTYZRawtv8=
X-Gm-Gg: AYBFou23CfT05hexp5SnPsm5/bxMx4GzKMewabL/ww5TgFzbw65N8WEQ41dU3E4QxeA
	ZqAamxQQsaqJziz+qbnV7AhwvZ0q5KOAKI9CLMehA3u3eY5i9JfTdZX2QBOt6jM7UCTwcJkFHUY
	M95K70UJNS13jKMsSM+Hs2XbPHgubzG89SB8koCU4C3trYgoGgYXBGKVKG1pP3Aan1nctUtC32c
	2mKSLpkTCuPn+cEidkuXJm2Lzl0sZSr6rz+MremYF0furm0Kpgg9hN0SCVGLlRBF0qntm06NSo1
	HegV78Nf3izJxEh+D0vOlKu7BDehJqnaXJprabfyTc0GYvDcenKuI8/4zIPrbOvlNzFpcsdiq7D
	1GQsKkmV8wrvrhXs=
X-Received: by 2002:a05:620a:172c:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93bb76c24damr299726585a.1.1789554901715;
        Wed, 16 Sep 2026 03:35:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-93bb76c24damr299721885a.1.1789554901212;
        Wed, 16 Sep 2026 03:35:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf413dcsm6116706f8f.31.2026.09.16.03.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:34:59 -0700 (PDT)
Date: Wed, 16 Sep 2026 13:34:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] clk: qcom: gcc-x1e80100: Don't poll the status bit of
 GCC_USB4_n_SYS_CLK
Message-ID: <l5uzxnxbhmnmnsutvtfkaoz26t3el3vy2vsylx5dtkwaunfgt2@kk3ky7qb3f2k>
References: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-topic-hamoa_clk_usb4-v1-1-5d8d5225b598@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzOSBTYWx0ZWRfX0/sBul50/rhu
 YYnwLwArr92aUrldUfO1YNGg7YdQbVv6VNjTtShEVhtOkw60VGIZMG631NIOjTkboLvI9FXGsMS
 Cfv3bgEgznMcDHEjtaTtJev4Aeb1GUcGTq+k9RMnKNH2XQfmlajN2ydQ6McvpA+jLkOKbJNKNQc
 s36fvyUXbm0LYRX9OEmFYADR+g2phM60O4jQdYPYuyFgA/J5/uHBm7mkdxvCBAQvuwPT7IrDBsV
 71BIEkIhmewShiPK0vSxucHcxPGAoyyQDSPSlCwlr8GeEMygcYI/0D7d5xPA8PooQQZ8G5gQKQ/
 IFxZMVwIm17eOesQp0PJY/wcIQi7pyCwBJeJmM0zzS55sOaYtB9LrRkXRdA9M0wFoYWdma7mq1C
 yJ5RAHdelno2ey8DIsa6EiYNKpuCI6dSt11t/jL/LN6Hl4TjnoXJe7kdHM/fk7qrTjfzpjZj/87
 7VUDqj8o4JwBXu+EJag==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa70d6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=iflI50pWzB_WzTeptnUA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzOSBTYWx0ZWRfXyLcCIHy+cSdx
 VhgKGy6SYPesHVW9oM+I01VDlRjt1LipRyF7wQcyn+hhukWTgVC9yBY5NQmrRypBebcBTngNuOa
 /imxX3rDZSIKaDqAQqTFC6ScUtVcXFc=
X-Proofpoint-GUID: d2wB4qbWg9NYggIPg5wUXoKmsz3rkuMv
X-Proofpoint-ORIG-GUID: d2wB4qbWg9NYggIPg5wUXoKmsz3rkuMv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160139

On 26-09-15 21:18:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> These clocks are PHY-sourced and their halt bits seem not to update
> reliably. Ignore it to prevent spurious warnings.
> 
> Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
