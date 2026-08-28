Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01D36B903
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908174; cv=none; b=T2m36MwD9zVakJlR4MJ8WF/OHrsPUsrjEhQJmWpuTwMDogW7WNCL98jSuv7sXXaeC7rLjePEA7G9/9ef38hLzxNwlqM5vO0n0ThUbY822pSfLEpW5uENvkyekYX69g08mtObemIe2HBHZ9wRepyIR1Q/BvyQaZiHdczLRbQ+GkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908174; c=relaxed/simple;
	bh=vtduYSnIjayzNxB+nJZ+UNHbp4mpe7trHIHbjV3ngG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR7r3aMIOmnDO/c5lfYBReGXTSZhcw1f4vAGJq+cv/jZaua3prixco83DZY3iueHd0b99VBIzD4V3HCU6McO668B4Jx/CEr5DdpNjKdrnZI2d3Mly135T7rNUFDtqeXvKEm6OGHlGw2nAnYHL3lMT2W1fmCI4Wik7oE8yfjNb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f61kBGYT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AmAasHwG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f61kBGYT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AmAasHwG"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66gTN1605965
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:09:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ntgQVvTOIQGY8J2ZeSSGFzBE
	pXgFIQN+dLFgAr5cAXw=; b=f61kBGYTW6erpLMAeSD5mRxKuge9bq0mavJtByWv
	kvha5JSen7vN6+YgjrtdQekWzrcuxqlRnMjqWzuCTTTvaP1XeLH17e3bwwhmm78K
	3a6kfpVD1Vj7A2xINdaOG7TLBk/9Q0fvnPfwYw1MwiusylSxly+Cwj7nojGmBeXB
	ckpTUTqiC8/4QnYva1YoxKzSoWEmCvNezivRLfy7sYoIgwiMKcKq2rJkRL2a32BS
	v6hwZaJl0gqTx45iu+exi8HVBgWthUeFqnOMk7VhVBZ/+a4wra8VTADk/6D81Gen
	m2Uui5xYOH4eLO89Xx+Zn0TK9pHJb1M90Oi53VXfZRZJIw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r8w75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:09:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52f52ccd459so12054321cf.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908170; x=1788512970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntgQVvTOIQGY8J2ZeSSGFzBEpXgFIQN+dLFgAr5cAXw=;
        b=AmAasHwGKirPV2We6wahu8SqCZRck1TbiAAUOgcBdV1Hv0mRQWvwfKRYE6tDFax9cr
         oz3vO1FuwiClZUx0ijrjFOselddC7p/TbzgjoojEw0+sB6RIGGDLkPbY7mGZGJMu8BrJ
         O3RYdns8oXV61Wp1uCbznuN53l9FkSCkibMQd134ANA/gxct9mE5HD8Mwf28Hc4/d82F
         w5Y6bggkEDZxFKZxfy4HvgH1nHYcNiLY7D/PUgEoLPgtpeLnUzm6kyqIssL6WysLiV33
         u8iS+3IVekaBb+DjhVbTDTrJiFfm3zAS+rVD8izTrBjFTaptAGx/D3GoZieA9+pBG20/
         /lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908170; x=1788512970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntgQVvTOIQGY8J2ZeSSGFzBEpXgFIQN+dLFgAr5cAXw=;
        b=CsqwYndneUKJOQJmYymsC2EBw2iw0kS2OJ1fSgdbuWfYyTz0D8pJvy08mfGSD+nLa5
         AKDFqEb1UaKpP4TOmrYWwQYASXBSAFPaxwtwWYPRQC1TO1t9QIRzX7Xsq+JQwg/F3IES
         n/359EmsXgAb/JAGSVmFKGFEovUs5PGBzdunRyLn7X/i5SG5Qw/hdywzghZfAbXntWn2
         gUG+YbHFX7vCNTma4xDObEfIijIZCAmYDFMLvA6aewhVsbC3INXSbSdAJyvHcfOlJWim
         fi7u9sZQ8nQdr/7OZ3g56ivcttcSTf2Ab0qLEaDqd5zJDHp86KFvD01O1YdLQpU1N0Tq
         ZlQg==
X-Forwarded-Encrypted: i=1; AHgh+RpIjycG0BfyF63ReXuC/RwDuvwcY6LmWni67mZbCawcBeyuyUtmTqW6LyNbZkwABSGkkNDLCnBwPXU7Ahw=@vger.kernel.org
X-Gm-Message-State: AFuF++lKsMdA8k3dOafw0nDDFhEq06VEuG3tVYwywjfMpkyQeLdI+nTT
	GR4fxKW+gb0Ks0Cyl6DRjYlAsTh2eCo+azIPyBzjg/pFZ9GP2/rbiJTJPY1WCB8MgSNAdHmvrde
	IlYla9Dl9GJZAh+zIDoARMe42C4UCJdX8F6zl1ulDEvvmilBi0iBZQMvRMJ4iSL4F0v+0btvb4+
	M=
X-Gm-Gg: AR+sD11ZDefGTWBjcS8H4UAuLTlqFDQOoYnaEmkvbEkca248+ADhNdETLPhbanTktm5
	4DYbCscYSJ0I3nX+yk2wodn8Ai/HrqqTa2f9XeFogwmObcyOusP1m3I81Q8AGFoKmKm8Tb8STza
	bfhFXTuMRsFkCcdSCdUHYndyLHYcTILkIU5pRMQU/CwkqLbIgF3Eymc2QNcgl/W7c23TjQGapZl
	tnsoOefaMdEWUZTiYgmTW31clp/Xv0+ccVRlpE/cUSX+DOg+L9OXG/eDC2ix8YkC+z5izsSjaCY
	Gsq4Kxs1uexjAmG6pQPHGCUHodmO8h49YLI68RBjGwQkhoiffp5Qp188BPP1yWYMvn9iyuCGgdy
	HoLLGSf+2yDUq
X-Received: by 2002:a05:622a:5591:b0:527:7842:72cc with SMTP id d75a77b69052e-52fb965b596mr63617001cf.39.1787908170353;
        Fri, 28 Aug 2026 02:09:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5591:b0:527:7842:72cc with SMTP id d75a77b69052e-52fb965b596mr63616551cf.39.1787908169872;
        Fri, 28 Aug 2026 02:09:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a8e0657sm10339485e9.13.2026.08.28.02.09.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:09:28 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:09:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v13 6/6] arm64: dts: qcom: Add device tree for Nord RRD
 board
Message-ID: <75yyfte77zwekiznfgo6z6ig7wxr6fz3vuhjyk2yqgo6x4hmrb@yshpp23uqbu7>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
 <20260828034958.3165-7-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828034958.3165-7-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-GUID: l_jG9STtCjTXHFjb4bfSFoPCG5s8x_zJ
X-Proofpoint-ORIG-GUID: l_jG9STtCjTXHFjb4bfSFoPCG5s8x_zJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX1ANpXHWkF+qp
 Y4XEPX45VabFqUAWGrlSScTmxIneNDbKIRkJnSg5pouH6BzbIXVFRZth/xb3SPop5J3M/UxWWEj
 Dl7YqQRXZt4Guc0TTdtIRw8s16QVMkKvDma08A+qZuOnv4I9Fz4aLSe117A8ALbTN8jmgmrIMQR
 KxfpsEl6bqfFq5bbSXnBczA/fnKP2xnQRo6kgaZAiXLKlUO6BoB9eBtwQpTBKXHBX9BaFo3dloq
 KNDvWO4o/PtDBtU3SyLbriIk6EeExB3KKBY41nGh9dfJ8iiTKwkuqJ0YfJu1w4Dn4Yd5IgJGlup
 JNmNtHDtGzW+zQKS9XjFLJ4nrxc1nXP5XMpW0fJsVl3gsuFYUbaju6GGtn+2a8P0cA51aTuWso4
 5ituoETYWabWSM40GnEH/absCcxWTZkKcoR3P52BzkWD3+f/4977AeaPC1m9E5C97eSH9KQnOdl
 FdTOjpwpehIeRxnkpxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX5LuoMsQ1/KMd
 3F2l3L2wAbnF2MgcidUyWVJYHu4TMRhi2ZkzSqeYKuVFuDmV1lVKoi1M7KfTLDtH2QT6s4IafIR
 DncIAogaOr2YGmA2LQ81UyhBLOw4jrc=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a91504b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=iJW0tgSoxAKxT-fYOhoA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280077

On 26-08-28 11:49:58, Shawn Guo wrote:
> Add initial device tree for the Qualcomm Dragonwing IQ10 RRD (Robotics
> Reference Design) board, which is built on Nord Embedded variant. Enable
> the debug UART, UFS storage, PMICs, I2C and SPI.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
