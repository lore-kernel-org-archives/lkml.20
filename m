Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0AC17B50A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071382; cv=none; b=DqfwuNCcpTsei0ZsUyV5ELPBbkmCrDduh9gPiQW1/HVEDpecayWpqi7dW7gATNm2eRtDqjJh/ejQwMB8PZgbDzwaVKFy96LWr6QbfoTtZeiF8LdpUA15BPltogHrImu0hfeSvvXdqKseVkCcl03uKHdqHIf+m2Hw3OP9qqKQPGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071382; c=relaxed/simple;
	bh=+orYL4MYtYLUDMbwG2VQZeEovAixQhGy2YvJUA2lGIk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/YtjoO4v9DFDZIncc5EiF0TQnl4nNF2viXxRbGV8tTEAgc9iv3trpzKT4omJOsOJtGYqYEfer3oGMRpt3QDMu0s3xQZs2cKC5kowe2EpVJzh6Djih3oPMu7cP/R/08VkFOHbeoVYJ3mjUQ2ovVQxufbjD/6qHJGqf8Y+tG0/ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tzi5pE4j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPJHxLml; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tzi5pE4j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPJHxLml"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kEBP2999156
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=; b=Tzi5pE4j0MRX05D5
	WhR2HvtgeNRFQUMkXW8b0jcs87yRCIMaiuLRIvf16r+3yFaWpafgll45Jgfa0PIQ
	alOfACFEoittMnyA+b+PdjY7JZPxah2hOF71N/oHTdiyY3bHneWzrTGPqkqkQDik
	ZDSVM7yAzZjRcxBlxXj+Ei7SIFOql38s+RTGH9rcYXq7mVWhPESvXdToSsD3DNuj
	BTCn0sKlcQ8BR499Q73n6/S1L+ARXX6NwyHTH3XpUNQWFuYhygd4ARjZcuPz+TRB
	iuge8C997R+hkqPU/MTvWNArdlpEdLGgn+8GZiXUn4z7XYf3G2hSDvfLuoen++98
	lBOGFw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm15yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:36:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so41599785a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071380; x=1792676180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=;
        b=iPJHxLmlteINvSydCBDO+SbDSmYeG+5UHNpIIFX6ZXkg4HtnoeqMHDWNvXVTo3HkJa
         GMLm1xZRAdJTZeEWQrvMtGnVQ9DfynFfhK+bMvmZ3EckaCQoc1J8yz/5LngA2llV6kIE
         uXnUhgCckQFDhAtlCrfg+Yk5s0o/TBR98nKfG8O4XSS/ECcDBpvp8fmO3M5pD/gZM3v5
         uhEEX+v/J84EV2GbK660dCSO2OWJF/9R2J3MoW0tsQhoSLpGISkGCC1kgjuz5wRi4BNc
         cjIpCF/bKdXh+QH13evq5oo0FGCqhbuWnn1YvlBsSHDeW9nhZipNA9ttTr35b9EyliZM
         gVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071380; x=1792676180;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S6Qd4a8NqN7DWD9LPdV15oWruFRO9Nvhiys5+d07zYk=;
        b=rqqBv2BsciIjJlAVijcWop4PokPiw60K1oyqwf/u+yTUajf9ES7GJOdoFALffV7AKJ
         lJwQsrLiw7mlzfs5vOykLBYXnjiUnKchDECMsDWDRzUrfSvAsDz354VftkM10PA9GVU1
         bwczEai2OdphfmDhQvaONj20oj5RN4LC77FAEqH2t5iwlGHK0yzv/C/DlNsSoHVPo7gL
         De1DVsIroPwb9X+ev/X/xD9GPAgneze6xzFwbpQd6CYM5p7Nf2qGvwvdN5TycfGnFZp2
         aqk7QjcLjKDicAyCxTuRh2q4cEnVqC2FNeXemkvQca0BQofjDU3Uh0gLLkjSqkJBa9P2
         TIxQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfSSrsfwDNvw8i9sodxhxJPBDpehIEGZ0kTQ3mEw24u4gYLVcqL74dX/y/0ah9OoMa+8cIxee1ae/NyTA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLph9Htrg1HJJ7k/d/OlQSe4ya4tEq73v5aSyT5VynK0auhLObR
	MZkgZreBIwk7MOuwFjtyM097n7I04BvGSr/4hvrDCvhS0rRpr7Ls7fNHZ9RaBrdMDsbTRxg92as
	qCBDIvJXQ6rTudngV9nPGi5aF92oF4AF/RY0f9aYybT6pt/fv+8eClTNg9MnRwrwx778=
X-Gm-Gg: AYBFou2dcWkOW2FE70akJ32+grbD2U7acfkefhCoaX39GzXb1SKAazJhx7A6hfQyQTk
	iVAMrjy6Wl/2ETPvLFt6ezzaJ6Zgad7LO9EY/jTwTdGv1dm+MRN1lgk8KYE4/DM0P0IvpwZdU12
	PBW7EMQfEUJwQTgmDXJ7zFvQwCNa/Pc5rQuEva1aDXAVAnpyfwCqc7x05Y/Nxy0+bwn4bNS+QMo
	pXvP4RxHgUTo+qvGVbPGaUYEgUke1/bOiYvg0Sbcv7h4nsNbVcnO6HYhwollplZ4/QqL0vtfy1x
	ZzCjEiTzOgFP7xVT09WuUUDODoWt9j3/j8EggcUg0cDC+GvozAC19bMk3D8b0TfwlxmekXDTTUD
	oz4441v6j903r/y5bTy9kKg==
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr3512778085a.1.1792071379688;
        Thu, 15 Oct 2026 06:36:19 -0700 (PDT)
X-Received: by 2002:a05:620a:44d5:b0:93a:2bc8:61ba with SMTP id af79cd13be357-93ebd0c38a2mr3512772785a.1.1792071379101;
        Thu, 15 Oct 2026 06:36:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042e95sm123771966b.52.2026.10.15.06.36.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:36:16 -0700 (PDT)
Message-ID: <99fc9e58-0171-4840-b836-e66a0f3d10e9@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:36:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sm8350: Add CPU capacities
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
 <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-1-67ce449becf0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fa1l3D-j_FI1FwMbeOtFUDpwGQ14bCO-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX/vCGLDAZUpbk
 4nacTOlLsoHSlTsruXZBSHwRgfD5k4S2ZEgry5WKR1Telg1krU/1tAcUnZ14+r5AyeVDZt7A/Mc
 buCrBOlCc3/1nIUOKZxRssmDiBHt7Mu4TH5E02STYfibwTWbdopeUdMI+IzL61r4j7qn1NaG2um
 7B3YBJGH6H0IAmbgHalqBAwuPfSNKczT4kifcJUuhmQb1vzNiP2KccxzD65JnSy0RqPlS17+x6B
 PoEzGNjW49bt/kNtsV/xZvS3S+nbud38N67anCxYBnSpRsxmH1YuPBSKQaqk5cs+1FtP23npuv0
 uiwWzLKi8f8zXF1OGvNcCXixqnOOejglp6K1zZzgNcxDcJWu2AcMHGm6aqrzN6xX6UAlyQ+HZXm
 Sp+hHZjV/J8wgr7s2ljvZi70HBD8niyLFpN1IIg3Uk4SiTzdzUAGHT+PaSRbQsl5JiUzlPFUfll
 TU2kKwUOxrQxMsDZfWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX+b69uANDNjMd
 PG9bxndkX7cc+j6zp++73FdoEIxnwg0DAqohbXXJFa+Vxa+WtMro+JRSF8lSDphxSX2STnRanGf
 BwGQQ4K2Ht9TMlaL+2Kh3y3x8RxawlU=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0d6d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=Qd5qHVKo_rp75_W9aWIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-ORIG-GUID: fa1l3D-j_FI1FwMbeOtFUDpwGQ14bCO-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

On 10/12/26 5:56 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without capacity-dmips-mhz every CPU reports a capacity of 1024, so the
> scheduler treats the Cortex-A55, Cortex-A78 and Cortex-X1 cores as
> equal and sets up no asymmetric CPU capacity.
> 
> Take the values from Qualcomm's downstream device tree for SM8350
> (lahaina.dtsi in msm-5.4): 1024, 1946 and 2048, halved so that the X1 is
> 1024. Only their ratios matter, as the kernel normalizes them. The
> downstream overlay for v2 silicon (lahaina-v2.dtsi) keeps them.
> 
> Assisted-by: LLM
> Signed-off-by: Demeter Barna <me@fromdisposition.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
