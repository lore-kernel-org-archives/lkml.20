Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7A283CAF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466685; cv=none; b=GcukjpjfL+1w4ZVk/qZhOLMcKDyJfye3W4D2MTpeWuF6tLDDVZDwbvcP5PQvUXAylJZw7/kRplPHUmPqqJkePSnWpqjmb1/TScs++rxhkP9XK+lFrYYUut9h6figuO9CfRyXIdH/J8PXQO4adLRFlZaBVdHqn0vhCcCdsGCyvD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466685; c=relaxed/simple;
	bh=PteV6l7Bxzq94VN1jmz5vOgiHEW3TRNyd88pisBgOaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3FaODKlHQSEmcVkwsDvlQin269eqH3O9mF6xRdaG192qvQqwXSyEvkxjl6R2FleiPrKem3e4GDEtY3iV00Rmd04Ic2ch9xrDKinuxL02kEku+Vai4PIHta6K5Q2HklmUfEqhU99WoV7JckjCxgN4qsWaoUY1b+bR4Vs0Pf/ywM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a+emWJZZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kq+kwAHz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a+emWJZZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kq+kwAHz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hGaI3912039
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UleAVLVAdU/hmYZIAkmupw03
	vXUyan1+fZkjxbM+C1k=; b=a+emWJZZZBJHcidphzH6jbNdZLftPgClo+zVssSm
	3+sWgL9KSYkWpLjtn8e+T9N9u8t0t9nJsdlhD89oP3bhssWnRWJge96ajaQeowrT
	kwP71zhZso8gAgcjU941hy4hBARBVAVnUsEfIzomg3rljaeg0GO+sEk2L+wP6TmI
	tqtxhqm9mOEVmbwuJ681LLqktYeIRPUgmDzywwMavvQRoYuXzRYdrv4CRvoXp5kT
	DtjWFWWK3KcxB2Trxnf0C+VmXPP2WTczwdNeg1JSkYOVs4MqyMm+BStJ3eBobJoM
	fGlXiS6zx1TOyMB51AWLqm5MDB8QzIRnu7qaaUXM7RzRmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jerycw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:04:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso644130885a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466682; x=1790071482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UleAVLVAdU/hmYZIAkmupw03vXUyan1+fZkjxbM+C1k=;
        b=kq+kwAHzdHoAyZ/pUcjPJxgH0izU869TUiCa8gACMrFg8e6iGk/z1gvC7UolmiJKxt
         rjBzCeNW95o1BO44kK9qJKILbaqCnhgbVimgVuz3zccHBy2EjeLNCvWsK2/hWD9rqYpN
         yx63S3iktadJePuU4Sn7F+scd7XANxctHfRNKOHGjLTB7nV1KvLAm5FMZialY5tQ22V/
         c+5ox+uHmjl7OIuIGGU0PbdqhMu9wRWFY64zWjd0v1Hf/aJG+h+xu1onRR9fObj1lRyC
         epTnwDd22bDV72c6ZFpRjxmj9P5b6kv1Xd0mTRSvaagRsuD1/tuGsoJf0BAkufQnR5XG
         a99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466682; x=1790071482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UleAVLVAdU/hmYZIAkmupw03vXUyan1+fZkjxbM+C1k=;
        b=Kx98B8xotq9IAmudlSUpHYGLixRx/ZGUY4fLVrjeKZ75ST4actZqc0KMmQ3BVPSlNE
         UR1QeEiWf0kZjoRL/d0eKhzrsV12Fb7t/uMssleSuq8jvcO23J/TfCyfZCyc6zHfRr24
         ooSPrvL3K9i7iVj618LCRHEJNDSBFFL7WKC+v2uQqRP1Fb2TzMfysY6Igipq6KGELElD
         Gmngvka1PBZddR8nvicnFBh+mgL0DDSLhOprwqH9mMr5Dr8b97171f6wIDDIrNXV9UXQ
         i6NJvuZxZwNgx6jvtIp6SHOsxv4sNNpv5P+I6vwpUZuJLd/7O13fgPS5KgxT2OttsZpq
         VGKw==
X-Forwarded-Encrypted: i=1; AKwUvBx8/2nn0FPdWcTcOT8ppFIZgsynK33RGhmOTpViuHKOPYuSGN7cVKjaBjbkpRNs0ImjYx8GUVC/gqYOf5w=@vger.kernel.org
X-Gm-Message-State: AFuF++kbU1TgZO2zSUYjvvfJFEVLXZJUYp//LVdPRJz8789hNCJZAm6z
	cIfwBWlnEErACgSmMPohMQtsVa3J6mTBYFHVC1ifmOflnSqYj6PXxEyVELwEsnSYJr1fU4ecJCh
	vMCUWMt235hZ6kC1TLm7bK2Cqa0V3XKrBp88mBhQdDw6oK9BdagX127sp4VTyWypOKBM=
X-Gm-Gg: AYBFou0vjdBkMEvqTS0M25QntdJG7aeXDjmA3I91ScGNdCLjE34Muv7Yr07/bEAQwJ4
	I8glRjqi6qKJ5r1aByNQtzXGck3gnLOgAOC0snPCQ792RFvCyTXwkfP3nHmkk0fTsC4VTa8MpfY
	jnOTeCvkDRxj/7EqzodlCQSCvgq2Kigzv53UrZlI4faWjxKqP7SDfM5dx6bU8srI8r52lwidOhz
	EstjDFCYj21GlYUpkhAN9cCmEaN+8B9tc3IMtLP/PyK1FSZEuh+zfZtRbOIXpo7Ut0S7u5QDwyK
	aEpIJ/EMpSHzV1CGlPef4ZAQZTvOoWLB3gtIM1auGkLHX9wKt6qMs/88UpwniqDS+9GGrZU1prE
	IIan0kkYL1Q5xvyo=
X-Received: by 2002:a05:620a:2b9c:b0:939:57ca:7e08 with SMTP id af79cd13be357-93a297789f0mr1063092085a.2.1789466681516;
        Tue, 15 Sep 2026 03:04:41 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9c:b0:939:57ca:7e08 with SMTP id af79cd13be357-93a297789f0mr1063033885a.2.1789466676279;
        Tue, 15 Sep 2026 03:04:36 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6b6261sm70213915e9.14.2026.09.15.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:04:35 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:04:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
Message-ID: <mynbkpoab2rwz7b4wa57jvw4q4aaye4xc4uzedzd3hn23lmehe@6tpd4o4gz3vh>
References: <20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com>
 <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-aw8695_haptic_fp4_driver-v1-3-156f7549149a@fairphone.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfXwd4XdM5FlRGP
 sgMnhz+lfpw/4jHwj9xBR6PZSSLx3gwqzpMugtvBu7uxT0wyhCgepKk5yTtV9f/ZAK70kyebK6W
 LBXhjMnHHczdW0DXA5t4L3fuzViKYuM=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa9183a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=e_63XvbMukAsnnsCD6UA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ZHBzf8NLLtSolyZ0ZOvx4atLEu4K_iV2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NSBTYWx0ZWRfX7dGdgESe19sj
 JAKU5jHSbq0onXu7c/nDn8qyQNaLUXi7ZTnC//VQa+qDp15+OzVjmG/gkpd7iixGf9FpZFVGUCm
 Xda76z6DDtYgJa4rGwsGrl7QazPUj3BacsmzjXg1a+2GyCi1Nt9l8mjSdw4bhYqSn5GeqN6lTYd
 x40N1wbUZ7BIHmR8bFDQjWU2bY8C2Oy3DswAyax7B/Mr2Fh85qP1DqSYZV5WVpCqbdY3nF+uuFl
 fr6jWK27c4LcL1+SCBsVO5to4nmQQRnjunT3ywjNCoxBoop6qyP9tYT4653CB7Y3mI214n4/1lZ
 sj9R3H6DpLx50GqPB9bYkHImgeSnD0Aa1NOMVBUdCqw5ksq4JmTiOvDtgV88sMSkLz2hzckxSS8
 ISaXrnazPbwZ1M3namDlXbm5u9l4xp3hfM5/3gJN9b6lRUIgAl9ApzcK8LESNWPl4vuxWc5MNJf
 KNWT0+jI9tFODA/9I/A==
X-Proofpoint-ORIG-GUID: ZHBzf8NLLtSolyZ0ZOvx4atLEu4K_iV2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150145

On 26-09-14 16:37:49, Griffin Kroah-Hartman wrote:
> From: Luca Weiss <luca.weiss@fairphone.com>
> 
> Add a node for the haptics driver found on the phone.
> 
> Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
