Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC14490C01
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991193; cv=none; b=pRRsaKZHuNQ1t6ftddk4bCxSBp43lqyopKDH7xPsOkRLpxKUEsCYGDT1laUmo/MGa45tFepOhLrCd+LA+p9/Y4OJUbTfXGCArcfvlF16af8l8Ihc3i6QB0QFOzo6MxXtLeqt4qS9OyapZyxuj0094n8t6rig5NYxxQHzk55GeNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991193; c=relaxed/simple;
	bh=b4wQJ2VD3XKr0VatPTGksgV+sUzbD7Mn9xfsUOwE2pQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fkx3084OClx8bDX9LdGJ4N3bLf09tKCnK2uEQvmCujbvwtGqiuFg+b3wUuSvRvBEjunh+MAhquttRK/B+/LiTCUvOb1eZ8+RnwyT8Fa2gc4bQ7XTlkx/9njxlRjnSnRPRjigr0Nj6yZDTgjI8DhQ4QZFdcfNqA23IA4G1CVscUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B9Ytn4Vo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H5+coWGt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9Ytn4Vo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H5+coWGt"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeDkB838010
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nyH3aN/JsW/ONYaDE57+9lAD
	VN4lin3yudBnNOcvlfM=; b=B9Ytn4VoaDfbxxPTOm7SQBNAmz84WpqIcexHRvt1
	UE0NfU1VSBAIEk5c+c2iHEOIUfSygU/ECvWMfW9IGDIhdwJPzUcIU8L4HzANDqAb
	w9+SI4RCFqCdEAqSxmQijq0JWmdxYUBCbiFRH3BioW94wb4i1JfCWpQKxCW6Cvsg
	rHqGjVrEO3ZMCx01ULzQtQzm9Pj/5LUsxR5Hxr3FUTibv9wKoUXrN9eldp0OjQYv
	VBW1jBTU9uZTn7ECBo61jT/dy91JcqQg93Y37nA5J4Zihvo5ECE6g5+qe2uFrHM5
	dSLyF8PQsXcfGWNVYpG2Rfjb/hK0vpE7BawzWnah/gg0tA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hmw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:46:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78f4d6af128so861697137.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789991189; x=1790595989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nyH3aN/JsW/ONYaDE57+9lADVN4lin3yudBnNOcvlfM=;
        b=H5+coWGtPWF2Mh9HtAP4dKKCO/cg/RGc5vTud8ER0TPp/+Givz4tkylqria5S/mGot
         NMfhwdLuhEES0537j8uvSzYmc3jIY+rA00ZxK9wll8go5KdhFqNRR91a0xFdOTlFHZE5
         7UZ98leyI53BAqJt2UEgC5QnsNIZS/OaAVuSKPStLyB8wy6VyHJd1vNPyMmfNS2rt1Ok
         FfqPuYgdQRg0J2F6Hpzx4aZzqo6Q1caeiGZBd4tlziWRe0GZgigbdKrcxOOhcn/10guD
         +yMuYkGH1NiToS3t+E/W7Seu1Cb83KTdyDHj6qfdBg7/P3r8GtgJDMCtbPfF+spQMhIc
         um+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991189; x=1790595989;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nyH3aN/JsW/ONYaDE57+9lADVN4lin3yudBnNOcvlfM=;
        b=sccM90raIiLoOODLR+Jvp4tPDw7i4Bv4NmOY2hznnjBTn3adpRUMMKDvib2/GDljrk
         SbZqKY2Nf3j9BvxrBxdc75uy1xfuFX2WeZq1GHiuose57aYd2QexccdU0iTMHdq+A/pA
         I5HHqn99xl11HwMuJ+UBt+F2A5EKA9WZY/30T1ZQ5ptjBg5UUDM1VDN45zEVpBHCCIYA
         CX2lDBhOv0dWDFdZ7GBVYlRDQG/tkjawGH1GFWjiqqzchBS3r3RulKlEOho4Bbr3QfeV
         uDsLFjs/JhvtD6N/ytvUM6DpBq6XwFFxWx3BQOkF0onN9HXg3aCx7SBhljw3TRYdo3q1
         mEaw==
X-Forwarded-Encrypted: i=1; AKwUvBz+iVKytr86Kkkn0Jvh08JqNxj8JXLsRtpPyeI46DBa0gLhMqqx6TmfyVBCQq8tpAq08WXfNo2aHdYXs2M=@vger.kernel.org
X-Gm-Message-State: AFuF++m6a6yAdCZy8xEahYvD9syoMc48NNvK+/cf5/ygRTEbMWNZoss6
	GGAY4d67y/Zz0eEU0jXJvwcBCS3KLtuDloZSe4s4yn7xUWS3UKAWWgXaJvOFmN537qRkPC67gYL
	VjGnVwIZb1ORok1O+K8bXJ9SVOM6TUjixVauclwiamoPsyo7kDzcUE56uf61c6JsblOo=
X-Gm-Gg: AYBFou2eTWX0boss49+5Yxy6PAAycRHgFqHLEeQb03Q4uLoNDtUpq3DJQbKGNisxa35
	+xEmdQumFNNcG05PPRygvNVvdnWSIxcC09IMtJKnPcr6ftHWYM+D884o9CO8bSdA+Wso3wdIxzE
	Y1IEASS1qLl314d7E+bnm37GXXyp/C10u9yj+zmraIiTeE2sqDrYHjTMVqf3fYUm7zYYmE8pu2E
	frfuEVVqKqqQeHvFaWJ7/dwsDkTGyZDOYq/pT1EvfqCcGv3qRNCrL5Rh1uMGUFwCDmO/zajgze/
	2lDBFudY/xPUI/6rr0KSLVEfQxGUGyIwM3kUP95bUXnJo94lk7wMY0TRvK79adeNUedlpqCW0uJ
	5LqvkS8TxArIAfQ==
X-Received: by 2002:a05:6102:5785:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7a55d38a3eemr3187882137.26.1789991189333;
        Mon, 21 Sep 2026 04:46:29 -0700 (PDT)
X-Received: by 2002:a05:6102:5785:b0:7a3:833c:49a4 with SMTP id ada2fe7eead31-7a55d38a3eemr3187866137.26.1789991188740;
        Mon, 21 Sep 2026 04:46:28 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd0eabfcsm231778785e9.3.2026.09.21.04.46.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:46:27 -0700 (PDT)
Date: Mon, 21 Sep 2026 14:46:25 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/15] arm64: dts: qcom: sm8150: Move PCIe phy and
 GPIOs to root port node
Message-ID: <bf6b4mj6qsipargxnweemhf4fbiooyusnbrwajq2kcre2g7mng@itk5yojodzra>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-7-6272b7caae9a@oss.qualcomm.com>
 <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83244e82-1f2e-4b9a-a85f-1dc704a91c3d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab11916 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=o--Rd85XcoaJmgBzmWAA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: EUIE8h5rwRSlBtCen-Lcqhvsp2WqNPvF
X-Proofpoint-ORIG-GUID: EUIE8h5rwRSlBtCen-Lcqhvsp2WqNPvF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfX5zsZS22EZkK5
 7LkeHkptb2o+Bb+57tCk7BMoWKW2wH0tbqHLdmvOey5JcjyGcsNMJsq6TOzKPVWrD/2CU7bl6vt
 JF9Eaz5Dqh4OucX7CqxspuO8Ys8XptE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3MCBTYWx0ZWRfXyVrCPg7ikxJW
 qLGErC8b6FCVnAZkmylolo04qGv5AheURgVlG6gg9uBlLoVuEQDIzXQYYFLxf2Kw31xTaBcA+jr
 yOiVxK7SMrprS6C8dnc4gHBYCni+S7A7j9ercQOQrM071isL0bJwosK8xIb7etaF5WvFhJO1poM
 yh2Ps2N5FuSR6ja9JftYMQ58Bw+yahlyH1KDv7Gn0IL6dOQtq0X3j0yoDOf1vF9VREfi51ATvLh
 5iw0LbmSoubNv/1PZZIxoQ32WrCT5q1nDy0ccmVdBBMj007KaI1HBA3kHirRNlQlCYtuPAnzKwT
 XDxcccUgh7tIf2oQDgW+RPF2AFmnOYX86yBNtu7nVsjenUH9kM5BrIIMNlz/qIlt77BsDyGFjPh
 +yWRpTT6rDlnSLfhnUvgsIJocjSTovYwrN/Qzyr37NF7/lYPcG+o19+UHr24mMl9qO/8RCqXlCe
 i50bzDisQmNFgZBiV5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210170

On 26-09-18 12:06:15, Konrad Dybcio wrote:
> On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> > The PCIe phy reference and the perst/wake GPIO properties are
> > per root port and belong in the root port node (pcie@0), not in the
> > RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> > from the controller to pcie0_port0 and pcie1_port0, adding labels to
> > these nodes to allow board-level overrides, and renaming perst-gpios
> > to reset-gpios to match the binding used in the root port context.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> 
> > -			perst-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
> >  			enable-gpio = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> 
> I am mightily confused as to what this GPIO is.. bindings don't
> explicitly allow it but don't seem to disallow it either?

AFAICT, it isn't used at all by the driver.
