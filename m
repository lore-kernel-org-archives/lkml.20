Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874280;
	b=A+vMuetRZ5r7+cw5WjggmDIG82iRbzpQUN0dJFPfKqp13Dz0yZ1dwsfd+V8rUca6qO7J
	 /jCVff/QZV3Hk4K/opQUigmpkdV3D2DQU8WcOTZDLu43H8BiZ5NvyY8CmiyQ5TSI0WUs7
	 D6+HKQQoWf6q63Ahu90skkZpJF3OssELb94ykkqSYEZqWbzhg1cSMTs3d7eDYCFq5PnxI
	 dhcrqEW3glAROcMz7oYg10j1a7ctWCdAAysI9+/XfvIf9LiIpzrTadAbYsCsnFJC6Ffp4
	 cYcOgjzw1aThMtci+UKzUakIeWu6U+oKTbInxD1dfkPCn19+gPVf788KY9ZNvNI1rQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jy0aqYqPffPsEgUgZ+ky8X8Ht3XgsS1haHBbJLOfvj0=;
	b=PMlfoLEna2RAq7IRq6qFg01s/b2/Cgt/UrGdQgvkpty7LWzWBBZC3+aN9Q/GsRFPrvrx
	 ZE1y1batUXmjpmmr8GhmwIKnT73m9UxF+Qf74vs1utSbV+rOhN3//ZrRuK1WjQq3yFbTA
	 1/8ARm9pWZSX7MI1zAJIGUlwUHZn4xC7Jr2mHYDtGNU/qF78bUkuu1SWq8X33tG1DHgYH
	 aSL9Ngvv0qUTAlIjDNtV5blNE4G8BkdfKZ3c8xK29UWNtNyUFUAztkFqta/TzCW3nTUAm
	 yK1dwjNUFWkRWtHt+7CZv3p4GWcAXEt0fbiiXz1SFWb22eJMJEVr4RJtUhjan6KdQBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBj9O4M3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MASnK6R2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2743606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:37:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2743606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBj9O4M3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MASnK6R2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69OIU6wI798289
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jy0aqYqPffPsEgUgZ+ky8X8H
	t3XgsS1haHBbJLOfvj0=; b=IBj9O4M36aMO1P829mPhDfY5Hg9VRZiqFcvPawo0
	S2+iCs7gk3OqVjzA09/wH8wR4VI648b8e2AhxkrvUHeBKHqvhbeImHQ+QtAMm+Xn
	g86tZxDt5bf7bPVxso3LxlADeDZCYYOB8CDNOwpQYUX00WMdW940NB+mf2FB94eF
	n3tq3JbWWGWNTJ7NFRYSw3y28VxaJReFHjlw5H+h8HsmKTSAoawOND4E3a09C2uj
	EBAG2nZHtC5ZgoS+LuahgE4fHKQ8mEVW+AgB9VauoomXMOjznqggYdeD2jjeMxFn
	xlxDNpmw2CCugK3qpAWauTI6dMiKERLUBG/Y9k7phSt9jw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgnuk9ku4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:37:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb6391e89so405429885a.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792874278; x=1793479078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jy0aqYqPffPsEgUgZ+ky8X8Ht3XgsS1haHBbJLOfvj0=;
        b=MASnK6R2f97vwa+fHQd12H+F/3xgCQg5ozF/wTvX0EUXaZGO7ypCKwHWRRc9rUjZ34
         KP8X8AynjEhCshA0Gt2svtiy/j+7OX8adWwZgqP3FVnOSVaZ6aZL+FRp1D6pwiRLEHXH
         y3e05ulFc8YsTXTRay1pCQ4jfnEOA4mCXelcNJXLfjAKeIEcNpM+EUYjMrzBpPC0+INp
         Hcb+T1PDpFRjsHbKSv69fIDUAR0IUd5xr/CKeAKCGjTrcE+VGg5hG70lj1sWM/mMR5+u
         FFOpOaMQd67k9lokg25dLcE7rhM0dOaCI/r9IpigDCTKr/g1pANJw5yRVwJTeUnmxVma
         EoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792874278; x=1793479078;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jy0aqYqPffPsEgUgZ+ky8X8Ht3XgsS1haHBbJLOfvj0=;
        b=FkM+GDEpPe2Qp+hTilAmSY8X/sWmJKy6c1rGEc+hZNHdMrlZ4AxcJZulQSahjovvW0
         gHjgP0iqqYuQUhFMjdE427JOLjvNIIr62w7V91OSqxc39tiC3svAFqc50aSE6YaKYBa3
         JErUGnP1LKNS0mrTQzO+umP6Q+vxnfa7wAIikXayqWfX7FF/DROe9gklgAg4qbkFkp6z
         gmsuIorGXfNxeqXobn7gED1FKvD5Bgs85i5ts+EHZ70sT8gVMamzAS8/rW1gML3xp4EQ
         /lW/I3kSWerYyR4fPWBzhazpRs5BON8husjPvS88UgRJCLqDgC6giiYDdWyllUIajR3Q
         xF0w==
X-Forwarded-Encrypted: i=1; AKwUvBzJDq4QdV6ZSPaSQVxH+ArvYYWSNVDxpy3xMSi4NNbyssf8uGu9tGYnlivwNdytNNYBlKff372VsS3LKws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbSCj/mKoVuai3rR9NppsunDymhWEg7Hhb2pbBt6uinoq9R0bP
	jwYWkLgQtxRDPTkek8yg9H2axm2r8W9ti1RaAgnrTnrG//tqPN2Z3U3qbTAGtS72RS2FuEZuyh2
	GHBAmkovFf4FJDABTBAXjaqgjRsFix4uv2DyUuhLFziA5se1lJ2I60HqB4yAsXzrfIsY=
X-Gm-Gg: AYBFou3H1arTjIqpEw8r9cfJ+lWM/wgOD8AbgrYbjPfXh07O3t/69M0v0sCtcp9773X
	YhstVbL+SpxWnqjLtQs/GND/t7OAr4rmJ+e+VoROHFep15tnMAIFhPSSqdtiUonJIsu0YvTKFmi
	Q1g3n8zhSbe7JohGaPc9L7aRyMyTa8Vp0LdBdOFfCu126FL0YNZ5Nizq5Xv2hh6HXHA6+OQnOPN
	Uon48ryfyGT7/4mP1RFwSZ5JPR5uu9B755OovQlpTI+jItLtUgOzr5JYInDQFB4eIwGpfU2emuo
	xTGk7eIPJXKjmn+Ig53G4Ey1iI9IOvvuzJbQL3geRXOsrrZWJjbwDY+KF7PFuYQwMTKvTNwuh/m
	53LEsg3YMa+9IpzUS
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr408948385a.51.1792874277865;
        Sat, 24 Oct 2026 13:37:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2b82:b0:93f:5f83:2ca4 with SMTP id af79cd13be357-940ef97bd9cmr408946485a.51.1792874277315;
        Sat, 24 Oct 2026 13:37:57 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0bae01sm97518475e9.7.2026.10.24.13.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:37:56 -0700 (PDT)
Date: Sat, 24 Oct 2026 23:37:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 2/3] arm64: dts: qcom: nord: Add SoCCP on RRD board
Message-ID: <rkqht55ldjidesqvpimk3uuuagali5kaufgh7gdwgy5wwrfqtk@k3p6hmrekpga>
References: <20261022-nord-soccp-dt-v3-0-1a69a4d54c42@oss.qualcomm.com>
 <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
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
In-Reply-To: <20261022-nord-soccp-dt-v3-2-1a69a4d54c42@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Z8Z5j3RA c=1 sm=1 tr=0 ts=6add1727 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=Hy__DvbY7olCP01rSc4A:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Fl3G7uomR48XWUC8Fg2cnOWp2-wgf6fA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX05j1DIIoAVMv
 Y4r2QzqkmMuK8tLZF77vp+y3w5dJcQxZBcMyLZQ3lDxRxZZu3wFxszmLgtUjdfCdXZheRKzqA0w
 XnXV/nUCA2UletB4hdrOdNA+nVymZoWYprn34FehC+RVHXo9KOB0+qvKL6lzP7bXnVwaYlabHtD
 WKlE32wSaoYSLhPl47ipRvtvC3gUUQX4v07wByHrkQHkey7JmTI+zt7v2kRmd2nsWeJ/1IotKe8
 Xguc/biPHSS6GwhuZwtGXix+5M0WcIpEC38SK/Ibg1HNkgA5p/uegtlvhPrzAHPO11tpYDydoJT
 gl+PmPIbaAK0iDbY5G/S84ZURx2PfMlgraq7HdNz3m8GaRyQYORVIoHq9GBpikS1zj+dC509DDB
 1PTq8KaQqKQFMuV/fNZkPSqs2/xIyLzjmJQdGewXm1XUL6EtZOwh9U1U5FZRtI3TfTrppfQ4p0S
 vhUOmX7995aZ2+DcuZA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDA4MiBTYWx0ZWRfX777z9bhSjawy
 Mc+QwvSsnDdMVAS2y9djo370RoVyUJmCbLR63Y/wg0fIxFqXk8514Ph8WtyXF6XjecjEQZPniGW
 cjNbOvZPDF96+eAuukpbcDOjZhYwuwc=
X-Proofpoint-GUID: Fl3G7uomR48XWUC8Fg2cnOWp2-wgf6fA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240082

On 26-10-22 17:27:02, Anurag Pateriya wrote:
> Add the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
