Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794667873;
	b=E1wniGIFf+iC1SY8/WOMp3f2Xaghdipj3maITpWNg6tCwIHmx55x5uZL20avTn2P55M6
	 pV2H5AW7qmUW4ZD0JngAc3Ps+HpKyYyEY90/IrLW4PhL0YaKE8lDjb+qTfDW+DQ/lY4LP
	 /BRDSfCPmwxmwatlvmA30DHJZKoX2h2vB4SouRFPPL0NyDqawH3DHD3DJYiIbaWuJpK3C
	 HOeBgoILDAkHiRwco8lyUsgk12WVdpEG2TTteiQl/KwQ4LWjhQvekggQlPIsxXjIqjPxV
	 o3T7pSteC3p1n8ch63+4MdgbT1vqzim84GlhZfpOobKlwr2e59yFSewFUEtX8TdNlXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794667873;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W1bMu7Rz6hkLZBNOdVc9heqWFSUfEc1ukyfaafSeZk0=;
	b=fe/Sq7dbqOtqSX0S8hDW7wsaFLnoJiho5s4ubb7MNLt2SoAbzgMrE/Im+kB6Vq7xr33Y
	 0fDU4Wlm1RfL9wrQS5qoVqn7K7DVJCAxGZyhlOIGm4bnKbZprIJRsRulk6sfZcDvaq/Nj
	 AGV+v81ZDAaLGbbPWdGHfag7aNqQkRDDMSZRvyQ7zNsqg/RHyYScah+FOkQEsWNMCHHVo
	 DVKkNIC0quxte/C1NbyfOb8VIl1A9tatY6hHvqQ5uhlS4tNxnMNXq9jyDudECV1cgavbr
	 eaea8zl2yLxrs/ugFfhoLI7ROcnwDQ42viUVxc10Lrlxz67GTwYmcy5HETi0xfwxVTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEu+KK+k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBxWbeNF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00384606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00384606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dEu+KK+k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TBxWbeNF
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkZtO2214167
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W1bMu7Rz6hkLZBNOdVc9heqW
	FSUfEc1ukyfaafSeZk0=; b=dEu+KK+kaF3/zaLi33d6Of5ONtiknj4t4Wbwkzx0
	mBJJ7b+Sv2qr02yCn1iZEUep/VOgqCKry2kSLU0/2yEc66Lw85xMHhsv+rlekphm
	IwjAxc6mDCu8u9llGXTjYdV/i+QvIcG8ew7a8U+Jms8iJyWLgsR2H34BTVGP3udS
	P2Ds5vmXTxwRf7ltuPjlIKSeaQu+ZwvWuK+pTOERAwPkn/zLAK73L7YO8QQ5jYSk
	ftwNABRvIprGx7/2743OFlNyHw+W4EkB9D3ypv4DdM8NTTtyh9YObpXX7RPFzNoO
	Kd3aLpKAv25R0zrGnlZmuOYWpJEj+pwFieRZ/9Ig3t2WhA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj410w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:51:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131b4eso82736785a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:51:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794667871; x=1795272671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W1bMu7Rz6hkLZBNOdVc9heqWFSUfEc1ukyfaafSeZk0=;
        b=TBxWbeNFMCKPHbzfZX3SScaitLr2U3VRpdHZMA7rRGJR4FGyKOYZdEHFJJo1fc2soX
         obSuv56jLt//1QZsf/HmyiEFNtVSdA3icjOu5XMS0VVNy0IExxV2RDaKQPwUBrT7Odt5
         LNOq5dpMH9XhIL3yRf/jOUKCjNMeavdmvpozsez0ess6dA+sA969fCGln47I3tNpU2yb
         6usyyv+OqV7L7wlLmJeu1q43NNgU81XLNZubtruQQwGGQEt9Le1RYmaKlVQkj9hfvxVA
         pQhG0WCDdYwfX0j9c1U/MYeAReCw+U1Y9o1Q0klT2bXDSVeD5aamtQE/JDf58mc6QvzP
         h33A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794667871; x=1795272671;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W1bMu7Rz6hkLZBNOdVc9heqWFSUfEc1ukyfaafSeZk0=;
        b=0/4IvQuTxpTBl1NQQ4LdtUGr8rqN9B/pZ10ZOxDCjeoQMJbzo09dSbzEFMbU4JHFyX
         /BcO8ai4p+vo2QVR5rEq+hvJb8MxUsYIUDByTy9ZJtT6tEvMV/Ahfw2LLl8ysvKXwnan
         aWm1TP46FjqMkQBpWt3z0QuCyZQKpt6kQrFqY4VlQLy9xJ1EAlHD6DwV2TrFtpX+D/PU
         /jz4iC3EUb1dJcaqHdswrZCJSgH2tQl/hoxfFQOUH3dNnW9+wffdaKZZ4mwTOYMI1mQy
         Om7c6ml4znZIen6j5pXD100u4kSpUkYzWiHO9a0VuZylP+X3PDF75SxFcJT4P6S8tBis
         F6RQ==
X-Forwarded-Encrypted: i=1; AL+hErEA7K0qqvD+flehnD6MNHeBe1E/J3d203V1TEEz63UlZsoTN+y+SJTBmcIJlrrsArRkDP19rEd4OVSy2mc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w4YXnlEopvsMSkbz66egKCZOT7wzv8GFGyZmuCdibCbIk2BwT
	rkKXA4o8vF2mcTQmcjQ8089VhRKCGjdfqVLLdlhPWc0D9bsz+TGBeztJ4Z0XS53YFL9GDfUi7fh
	5bx8UnyiUaPfkEVnGF4Mu6hAa/nEYFQk5bMfmSbiTPeBJJRsisM8jtqFIKPusWPPLoQ8=
X-Gm-Gg: AYBFou1Qs9yW2qRv2c0OXzYUsX9eNvs79GQPDJWTkB2db7VxKt0MWBchvkl1qt2VJpJ
	kU+36xWhivyRVFch3gU35myKsnwUmUy1KIiRsdmrZOloHtRwqRL5YiYooK+sawWZJYSp99Rta1V
	qX6/tkTGCu6jQc+FtEx8BUfmzm7Pirb+83A0N6IYYj2scVeb/FLIoHQzb1/B0WoJsz9/d4KZlO3
	MMZrCPf97besBLGcIXRu5W2g092We/ojCJKoNkaP+YKmKlDSvdHNmiM1BtxZM8i8kIBd0AgQ5Yk
	yqJjmydTsa/E+QaYpqcChb7Rpto4cm4On5BUdWo6DI4fjgrqZiFGgfx5NZViDJ++VPWTlI8p7k0
	izrKJBKQuz52hoE1MwEyalin3s3C0CDOcSDIAdY0z8Gs6DQHTE7GRWGk6sy+/7cMU
X-Received: by 2002:a05:620a:6c81:b0:93f:baf:279e with SMTP id af79cd13be357-9494b9c9243mr950600285a.8.1794667871056;
        Sat, 14 Nov 2026 06:51:11 -0800 (PST)
X-Received: by 2002:a05:620a:6c81:b0:93f:baf:279e with SMTP id af79cd13be357-9494b9c9243mr950596285a.8.1794667870373;
        Sat, 14 Nov 2026 06:51:10 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d03b10fsm12774350f8f.1.2026.11.14.06.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:51:08 -0800 (PST)
Date: Sat, 14 Nov 2026 16:51:05 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qcs8550-ayntec: Use hyphens for
 nodenames
Message-ID: <ojcxlpuhpkjupcq6qnpcpox2zkn3jfmzdd74yyzqtwjsebtrju@6mv3wxkulmy3>
References: <20261113185426.183501-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20261113185426.183501-4-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20261113185426.183501-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX83P3/bCtsBY0
 RlPXoCoD5ixNQmZDHIqKn0WaAMSwvOMWoZNrIzErtpI8Ny9II/4HN3iHwgIElnKN29//uKPkN66
 HpdH38kQg6MQBllAEBSag+7Dgb+Imy1wL8xLJdAKof5QTwbS0IjwGFdVIsWT67Sp/vNIarL18iC
 LUvYugN/gE759IAV107IeIK4tsCzOd9YCUXT7ulwJn6+drDVXVvRqGCNEdDXj4+3uIMHNE2rMRO
 3wNBR/bauPRAp/WptsvQ08c4HJdTg296VtcWw65u/pRUxhWeVSm2JJ/quDhUXOtIuIzqzL209yY
 LJdMQMVc1O+VIwSRK1Yi2LUfzTSV04126/ZeUL1U+NLA4/7SjLJReCOAvgDwpJGKFZXcdAePm9O
 JuHRiygNt4qspWIU8IUHnIF08rktZKhwJNi5gtB5HG3i1JCh1AhhAFRxFZyMAy2AEAg3drwQ1mU
 YFEGX3ZeshA5fjhC4ug==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af8755f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=d-X-sIwJgli8_2Se32sA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: M9l7oalBw77sD6902Npjts6Ap_dk3IeF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1OSBTYWx0ZWRfX9bbwW4zdWzX0
 Q2cAKKvxxK9ms2Txy4LhKu+LhIE2sSne/NysakRrkYE3aLS0Z402tiuVDBrWqILJzyIWKN8yWmx
 lDAfmDL7MPvnXQezO00RQkFXvL354n8=
X-Proofpoint-ORIG-GUID: M9l7oalBw77sD6902Npjts6Ap_dk3IeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140059

On 26-11-13 19:54:28, Krzysztof Kozlowski wrote:
> Correct minor style issue: use hyphens for nodenames.  Drivers do not
> use these node names, so no practical impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
