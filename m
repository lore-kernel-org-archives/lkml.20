Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C901330B51F
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071450; cv=none; b=t6LZ3yFksX0ZD0wLTJEH/6+Sqa3vrIjBCAYKgScymH51PCvJeA99eoGkUGM73LmWjwk8AVjVLCfu6oP+hYpKA9u8JgJ9Nh8z83uG4gG66ni1uGKFbiKb0qMy+kPe9YE30O0Sq1ARa2l56xUOQ8+X6YWRHYX6hhYil7n3hTqCdpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071450; c=relaxed/simple;
	bh=Rr8tKvuLIbHer4z70c1PEIP+GhIwwJ53fCRNir/Hv0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/Et9hqpWbOvQmgFtgf/IVrOmRj+O5wjW8uJR46zt3R+9Bbl1P4Z3ZsNjyuCI1FmWmdnEZ+RTE0Y0iZfdGNrgRUnkG8LoEPUluAc+1w8+M1FixlxpY7tGeKevw1ylEQ6MWfDjlpesfoFG70pWnUPJUgjdZWTnmSNf9hcGHJvYd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WivuusCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmkfxicV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WivuusCk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmkfxicV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jVVp2416893
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:37:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1F9zr9fE7um7OOUusnwc2n/ZgW8xRCM1buc2Uy4QR4o=; b=WivuusCk+hlbU85X
	hIv4ny64H3GiGygQ6IbVc0q/aBFvvqdSUwFVsAQR/nvNbetO++jmLBhlIZp7AK/x
	oqDSzjZd7vAtT4LBw6PJfbr9JarGoQkDcxaAlFqyXROOxKsVz2O4E/KANd9zT3B7
	Cg26D1NWl3VfUtPsKPhV67sq7zAcftR4/tjPerzM2G+yXMQd/WCQ8NMo0DLeVsKc
	jRKCftEk9y+/+1MOFwtRBZgjzAsQeCu3rh0a9fSSwQns9ovsJTE1Igo1FsLpo6fE
	SfmPxancjTTaJaZI6vSOW324RWAJ0dqL7RLoEAYz/+i4XJ6rKfJrnRJTEr2o9gL0
	Z1Xa+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjb0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:37:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so84072885a.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792071447; x=1792676247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1F9zr9fE7um7OOUusnwc2n/ZgW8xRCM1buc2Uy4QR4o=;
        b=AmkfxicVr9JgztxiLuKBMrJp0c79KZtDTTKqX9Hdgxs5v6Bc4h3KiB1DOcroY5rhmz
         9hN6pZlrMOuxj49Vn2Bu0n2wudELSn9JUfyRLyCfe4xbmUTWaA1E5V8ChuqsC5bfHZIS
         yZG+wGRImnrOJVjEGe3ZXd9blkr2Zkq2iptvKk1+WhKNTouZmxf0ikZhglheftV6PWKD
         diwp7h+lytm9GAq/2bLHL6m5wzncEPQOQliLflinqy/+QGTLXqHcVmxOILneaCxXBdNP
         W9OVQMBSZKNcBPgAt6QwfV5KA/cgBCJGMmj5unOnOIHwG0coQjaO0AR9fhonPSGLXS0J
         otLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071447; x=1792676247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1F9zr9fE7um7OOUusnwc2n/ZgW8xRCM1buc2Uy4QR4o=;
        b=VIHZs+e7ra13hBgzZwmhQZddqIiHTda24Xnf48fXelqddbdFFxe7hQ44B52aG3Dl60
         hX4WrWpy1pkDDtKpgAqjCKJ5pk3N6GT3/VAV7WytOE81P3kfUEEXqPua2FOc2AZdWfhM
         /nqEBisAz9aHUJmKgNi4nirB5x0TAe66CDzDyRFj76uW53SDEMAbRSjFRBzBp+/6vydA
         ym37xpxTXfk3U47pDOhkX13itdKOM+Ebm1smJ+IGPyEyiyqE2372ePDTZt0+PkM2wbjN
         4ubwimI9jPvjV05dgI05x2pl+vDfXgjTGYO5QnA2kkHF22qNWMVlcjlzbrZGRe56hYG2
         C82w==
X-Forwarded-Encrypted: i=1; AKwUvByY380vbyDYoqO5X1wFXPkP935ciWtY8PcZJ8giS+vHxDulI5pNCwe0zWm/61+tXeKAr6/FMJFVf5uib8Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqVliJbue/+KStmgE49Fl0c7N3w6WdLClYSVfThV1rfdZV72fr
	otOHQP2SMuHiGqADLn5NKn4+XfYUDDNGddbCgKJAT8TvK5ksT1P0Af7UYiRa6N+VbveC1gSX4ry
	EalWnYUY5GD1o4CwxOBuyJ1Ic8J51gpk/SlgnO0LMoM0nr4zrwQUdTM713XGPuQsffns=
X-Gm-Gg: AYBFou3/CRJV0xJTBoIZ6kt0Fbeta2X0b6BVGFe13O/JCz6gSnPYlUME3x9MgMzYxHj
	Qe97EFDwErNZ7AN6luQJJs8ayTuH2VsJtToO7QAiBUygwiLrchWHnb1EoLHt2d5c+UVmKg/FKZ1
	aWvAzZiMCR3ZxVHjDRY9DetXrOpm431WLgzl5+Xk5hB3Yary9tONT7DWHDemf5W2d93OeW0pt9Q
	6P/M0jhpbWwIBxZ2cw0jkUZLE68bAHlJYSwfppNY6FsN6nJ0fAC/N42I1LiBssvEY2CbQMGoa5G
	aiJ5kWVBWLDNjy2HmXK2a31DwT6mMJ30R7SO/xHAePvaUR5KOReu8z7NOFuaDJ7TmYcZcZtNpa4
	QLU4XPvn81hSEpKvrqXECrQ==
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr737092585a.0.1792071446740;
        Thu, 15 Oct 2026 06:37:26 -0700 (PDT)
X-Received: by 2002:a05:620a:29d4:b0:93f:977:5d9 with SMTP id af79cd13be357-93f097721f3mr737086285a.0.1792071446150;
        Thu, 15 Oct 2026 06:37:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed9b3db62sm124877266b.36.2026.10.15.06.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:37:24 -0700 (PDT)
Message-ID: <1be895b5-7f31-4075-9f5e-a6f4e911e363@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:37:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8350: Add CPU dynamic power
 coefficients
To: me@fromdisposition.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-sm8350-cpu-capacity-v2-0-67ce449becf0@fromdisposition.org>
 <20261012-sm8350-cpu-capacity-v2-2-67ce449becf0@fromdisposition.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-sm8350-cpu-capacity-v2-2-67ce449becf0@fromdisposition.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfXwKbANGFEM4Gi
 nS+0DsF3kzCwSaI4UbylkR6g7EtUtMLJtyW9XhWOe2rYQQHy1rb77wl/dh5uR9KNVbM3RAC2c6q
 3HWz+kBaKR8Z9P/3I0Oph+yIe8Y9hEIX8EKbs2oweOOUAVJSIYTkYecn3R2/EK0RUFzGlFzegya
 NUwNkUWYaNrUsj5VuiwOZWyZ67Bz/0f8wHjy6tcxT6Lk44/VKufPl94QAPndN1QJlSuR06SEdKO
 CXE0h+jYgI57v9R+rHV/5HRIZnW9eaWMa78q24yd/KLEpjQ1DTRPdb33vji5etn1pDKTl8s9Yja
 XrSgkTyvV/NKwUGKuGbn8btJPF4osmwdY31Mn52puRdAswJtLvYY7LAsOqDiSV7rlvcs+nT13dX
 BTShHyHwLUBq3GavIEXEwq7wjSKOnEufcgxcMUPb1ckIT+5tlAg6rrBy6EJfzFmwqhrrpY2GgXu
 ldKmdukVxkEyK4tLsXw==
X-Proofpoint-GUID: qSvJa54bLmu99jkji_paKCniE6pIQrWc
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0d717 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Tt5JBQAfAAAA:8 a=EUspDBNiAAAA:8 a=8gZnDd_Kn2CknuJoWdsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kpHMOrJS8sLNr5ru0mYA:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1NCBTYWx0ZWRfX6Bxbq8hx7lIO
 HFK3/MJPkyXCLW8YkIozaBodR/ASw6vTVXzjl1jkW+twx1CmMTk7ZiWeDwTABR9nLtCm6ACOswX
 /L4vitQMSoeFZ02TZx8Put4aaS1+hcY=
X-Proofpoint-ORIG-GUID: qSvJa54bLmu99jkji_paKCniE6pIQrWc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150054

On 10/12/26 5:56 AM, Demeter Barna via B4 Relay wrote:
> From: Demeter Barna <me@fromdisposition.org>
> 
> Without dynamic-power-coefficient no energy model is registered for
> these CPUs, so energy aware scheduling stays off.
> 
> Take the values from Qualcomm's downstream overlay for v2 silicon
> (lahaina-v2.dtsi in msm-5.4): 100, 499 and 760 for the A55, A78 and X1.
> For the A78 and the X1 it replaces the 515 and 845 of lahaina.dtsi.

I assume this mentions the diff vs the v1 chip. I find that a little
confusing to put in the commit message. FWIW if a v2 exists, v1 is
almost always internal-only and not of interest for upstream

in any case:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
