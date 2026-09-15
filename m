Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BA2480DD3
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466265; cv=none; b=Ag3ZU8C8QXwQkufXTWmyocN0S9cvVMGUVnS6/Nl6UEv0o2xgvElsDMcpsWmvm231aMukF5+tKlv6WocNSAeVDI2Jg3wgEp1he8kHNkxPooZuBcOKeorx0smbTgVORspJk1YcNDjiOQIWgpFG5t5jr7bC/i92votebiZZ/vzLF4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466265; c=relaxed/simple;
	bh=V/hzdH2QkH3VAqZiBtIzZeWx577pOOceqTjQ9JXOVaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tENoOFLizHhEdht/F0JCSlo6ooIuSNZ7N+c1vkLjv0qjJRojayzBGkLHFanuCDq7eFBRosAWOGVypVkbsyVq+ojOups8wgu5SnFpPHXscSMjIMNeMKmD3FDUJQFbQPnEFk9gorcy11siMPTvosjStBn06WCUYG2HkqpBHcb0vYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2JYTq7t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iLjjAFNm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2JYTq7t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iLjjAFNm"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9guhQ275470
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vHivB0Etmchj894r1qph40xT
	L7+4vfphDOHMRIbg5ac=; b=W2JYTq7tU/pjhrI/JNfOkqi7Z0iHotWtnxjjGKSy
	zhRFM7EvImD6HWCVv7sOG2AG3/Mo1TcbchrM2rbOA90KtE7OwDF0miG2euSHvGi4
	m49goRS3yR/8csREpKa093CtESrgDFhTR42mcpAa11J/bkjwRB9Ab3p67L6ovma8
	dYuPrDNyK4ogokfm50bCTR4VygnQG7XWxOfe4eyfnllJeck1bNhI4eF6TYVRH1Iq
	PoHIgy9MMqZ/109bJpNxlDVwuB5mhJgVCgOULiV1mmpkZXqgLPQF66gSbe7uJz3J
	emwTgKbNCzNzi+XCxHG/oMucb2Tr0oXuXT+uw4eUNExugg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyea15rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:57:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso688623085a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466262; x=1790071062; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vHivB0Etmchj894r1qph40xTL7+4vfphDOHMRIbg5ac=;
        b=iLjjAFNmXz8xu/ggwuL9VQlpugp86hANlu+HRQjCZ85mz2UyYbJT1NkTGZNGOlgeu5
         g6tWxfekjNqJe2gqR92Az2tNcAZw+FW4Y5kbIz/pJ+rSe22MCCJIUyyVIVCt9r4Vat3K
         MFlago5GN4AOkkfO/h+voHADxYsx0LM4NHwIRhIta2AELg7sgj7Ygg3a2XW1t7Ay61+H
         WpqBVF0s+doX0EsgQhE/JOQPNLwVP7I28Al6DWcNIaFueigxCBQ95UyeiSfSOsf9LPVT
         4K5OJW0V0+nDetg25itgo4KRbg49VO2fmhq6c0pEbVk0xN8NyDF0FhDLRjt1CnklQd+9
         R+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466262; x=1790071062;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHivB0Etmchj894r1qph40xTL7+4vfphDOHMRIbg5ac=;
        b=shCOzzkKtcv9gQCDzyydK5s4lq51iGFZm6WLaiTljhyXFh7VIavJFXyQvDOR1OrCc/
         raCxZ6/CQhTAIDJ2VORExwMC9iV7iMZ58EOMTY20hvoziAi7Tvt0URE7xkYLK2+bh5RT
         uLq1DDEEAlLfSjjyqZJSCCsJJJDgxF+zzjzgToMlt0j0GhwfJCfmkiN/KUmj/elf/Tcp
         AV5Vk4g2jwtgKWN+/MgxL+xIFJLFCDzTbLY5CFvlkELs1cTmkik90MRaJRb7cxg+J6hV
         /Yj/utgbdXYM9gUBlTAKmf2yZAzFcrzBmQgiCU1ymJ+GIhSQx+9i0vpglTIGy038LswJ
         +Vsg==
X-Forwarded-Encrypted: i=1; AKwUvBwNERcpeeSPsh66Bgv95rU48l6/2EQ0WPon8yAA6L7WoBN5xzB9CucJ5sS+e6XRgLarP73OR9Z4+2Sy5+E=@vger.kernel.org
X-Gm-Message-State: AFuF++mFmDrzrZ4qksfDkhjbE+/g+xN1tIbhBs3ir+rIFzbEyt7gqMEo
	1Ui6OoL45F2Z7T6HJb2+7na/ZwL5awZHmTLPORzaosQTGymHd4ld92lez31f/c9Um8qW88KlxC7
	Khp3kdku6quCMRiGRtg19Co3sR6bvYBBC25slt1DorbNSJpKDwRqGEeOoDiFpPMsmVY4=
X-Gm-Gg: AYBFou2qXeOJT3+UjHlPA7yL5rY0n3brflnr65XQih4LEElXdBz6h1f0XHdJEYX0TxE
	sQy5u2uaO6PE8aZ3N6F9MYiT6SlmoorLWUmNx/dKZAoDxqFF+RPi+B6xccnPjmGZhVJ/k0b/wMN
	jZpx3auqIeFLMy/nYJjbjqVbBR6A1cBZO5tCk6PjGPS2BEMDBtyBnqWmTl7LmvC5YKdnvzmupLB
	c5ftcgkxDK8I/2lN+8RBouQTiZEdmlzHdgQ7IDTvL0wm2XD5+TQ/uluecSYIMug2Tg1OFMflvDu
	7IzBKVvdEzl20IZI9KwYF6dsCoKrQSffqOgm4wswbizEfVfoIoo1M79dI6iUFWC8MRWVwRanroC
	QF5o+/DepUPhwog==
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr896732885a.2.1789466262027;
        Tue, 15 Sep 2026 02:57:42 -0700 (PDT)
X-Received: by 2002:a05:620a:258b:b0:939:e5a3:10dd with SMTP id af79cd13be357-93a297cac1dmr896729885a.2.1789466261445;
        Tue, 15 Sep 2026 02:57:41 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm33238115f8f.31.2026.09.15.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:57:40 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:57:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Xin Liu <xin.liu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        jie.gan@oss.qualcomm.com, guodong.xu@oss.qualcomm.com
Subject: Re: [PATCH v3 1/3] arm64: dts: qcom: purwa-iot-evk: use on-board
 crystal for PS8830 retimers
Message-ID: <aczv4t7v6rk2cersl44iadrzvbnhyn5aebwn7jcjvo263au62w@2yccbdq4enpr>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
 <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914101233.981643-2-xin.liu@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: QtTMG4AmgN_mE68yCqDkhd6epdndtEz7
X-Authority-Analysis: v=2.4 cv=cehHPXDM c=1 sm=1 tr=0 ts=6aa91697 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D9jnvxXfBeoGJ7MCLz4A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: QtTMG4AmgN_mE68yCqDkhd6epdndtEz7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX/1bgW4BwPEXU
 UWgl87QCzutIiOViBRv1DPTXjqos7wWlJkKwweuwJLkWRziyvdoBFlByJAnrlkv8vnpDg6TrpaE
 uDN2fDzeA0ZG5jepVCr9dmpt644Oo2Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0MiBTYWx0ZWRfX9Y9R5618IKXM
 Hnt2rYfZC30KWPaegOuKSiRd39v9zPE7XhNKN3LcCt0pi+3yx6s4KbLH+beQLDn2Zg8RSj+tBb3
 fIzpkHYX4sHzcei9lNR33etpdK51BM2rdTUl2kStNHuIhsJokaA0nnd7H/c2BeMZg4oMADngc9l
 h1WlQxu3IMMm7s8PBQEt0wwQU+NwaVs2F2VQO52Q4J0HlxSbKXGj8vTSY+LoQln74daOOuhniNT
 upD1gnRwS1rwYHT9JrdyZp0MkpyeNnMVDWCyyWU3FfObGWjnKjy7nMbbhCK+RrpHhbBPeJtz/M4
 qAjvIygoIvYjUi59dQN1OzzA/mJOaKI9TAi9ZBj3T5LVS9ZNBCa87/Q6d/d+r4PryMPmdB/EgW5
 ZCZRD6E0mfehECpQ+OyrQEOJmCprxzH7wkEpkUcZZDhR0UMMahG39BmM0mt7R5vXMPqxlfHAqKK
 F1THEMgPiGGZVJNL5cg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150142

On 26-09-14 03:12:28, Xin Liu wrote:
> On the Purwa IoT EVK, each PS8830 retimer has its own 25 MHz crystal
> wired to the retimer's XI/XO pins. The reference clock does not come
> from the PMIC, so the RPMH_RF_CLK4/5 references in the retimer nodes
> are wrong: they keep those RF clocks enabled for nothing and describe a
> connection that does not exist on the board.
> 
> Remove the stale "Left unused" annotation from the vreg_rtmr0 regulators
> as the retimer is actively used.
> 
> Fixes: 9ed20e877239 ("arm64: dts: qcom: Add base PURWA-IOT-EVK board")
> Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
