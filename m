Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264105;
	b=DwdEGSB7j3c3QGtouTwryuLZXYqgfWuEpNJnAZvUTc47mciNbC+1Nbc85cJU+StFrIhI
	 HqEvYycYsbKyuelvFK8LDoA4NS7COzcBJ2qXGAuSPC6ti08T2LWHl6YITlOkbXea2PXQg
	 VGHcy2sjZlNmgrsedGKRgTLcWXnmXdGyUP8ToMo1NTmH4+/CszsJ4Hs4kF0nRIVFBAmFx
	 3A5oBQ0JWXey+7VF9O9tt+XTwfuJMLu4MBKMJ8OBozEtrwVgPJO6f/Sz49XWnf1ZofhjA
	 OscYSfTeDj39PuwzCa7rHZOrx84/URsOERWNnXK1z/RgaHDZ17YkVZ0+e8uLUFdlwgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264105;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
	b=PudiNTYgb+lwH/DFt+gkH0KJpZxf8WwFvGkcpYsN8D4n64ruxgv2TPNgJBzWSKLgch73
	 F+NQYMaPvZfCeUsik3egcNRQ60Wi8JUB3JOow7lxoHN6dcr07wp0b9gIA299sVWe4XkQ6
	 O6p53W10Vdz80KYi/ecSNPhQ7A8xrmbeE6d0N/BtDsBRWAwREiy2oOQ01B2QPuOh4a2bm
	 xlxM8WD7/rAKqPdcqDr+73qyHQgxT7brvPxIjiT4Yp9jcy8IQEaKDjNgC3JKMIkemK3of
	 kr6O8vyQL5GaH9gye1o7VMLmbVA0D8su0NhK256p741jICL5FA903zeOMY1YynPEihA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPLapMnh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW67NKSC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DCD606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6DCD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPLapMnh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YW67NKSC
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5GvDu2793109
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QQ6HeVU5GVVFeki2uHOI6IzD
	nII3XEbjMrhu7Eabg10=; b=ZPLapMnhHmGdrXnxA4Rls95VS0sKEZlR5RS85l7X
	PbpqNW59wmy01D/bnk59t55nrV+Y3krpAFsh0fsy+n/G7UMjAge6wOSikB6GGQlO
	5pZhQnM4yYheIjOcKgNb8PsmemC/dzXWZgHn1QzIJRtt3TpvQDHH4xTEoyRyieG+
	g8tB5QYa3UENUezmhJJgAXueg+iaaFxRWojakxpqYCg+qcHMOyGbCOFZ4Tze6LQl
	cWnXXQKuBoSyNq8H9ONkjlGu8uWmk+nxTtqRLPOXxAj53sS5aaPiIlMY6Z+Ved9h
	f4ckNPJCfG0JRK8JUyDcpGUoawQDUzsiEfYpLsG73VVXOw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hks3na63b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb98809caso306258685a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264102; x=1793868902; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
        b=YW67NKSCZX8bqCPC6YIXhSdbNA1PDWa8lIkuZTQr/q4ciDqcN4OAtX5bNjS5eJPYm6
         ptFP19rYlfn2F/B0p1GusBZEpqfpjc8HULuRAdirGrpAFOgjyHeXjZk+Gq0f78UX/4Qn
         erW7RK316CGovOY8yWjAJsZfPbbCawFdgSB+ra4EiCEHlzdrw65Pk1bCGI6jv99agNkr
         1QITaIR2iNwZbdYS2hgZMPynb2iwryanNbQ04vTh770EMdwX3xFUJynhg+jWfghHl6St
         3Q/uRaIklHN3mr9p2yTSxBRuCd6eVyNqXsRMG4+7NSd6LQiMtHWCwaqpIdqE7bFurxt4
         k28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264102; x=1793868902;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQ6HeVU5GVVFeki2uHOI6IzDnII3XEbjMrhu7Eabg10=;
        b=jWoCKoNkwlgNaiNNnEaqelK7zUfbU8hBt9Ei0LfdQJD42XaAJIADKq33fycYNl9bM3
         LOs9nK0eHxwsMfPZypWVpteOnIfw71MKJNLwrtH3bZ6BJJRKfA5BwPG9FtQFDwqSwee4
         O3fZ3YsMRR3nDI1KYrdstnVExnzEtDZ0jXHy/YRGBfjurvKWD8fh38lJdgV0ZyaiHAfB
         suzBfLjC9xo+usnwQghiOm1ql7AhFsc60vng4uuutFzAkG+6GPC8WhWlRQAP11+F5/1z
         Yl5+7jkhB2jAZoYYH/Vb3VSrZAUVAoRa1biwcfqT7z9TvOGXnW6q/go1Ie5KUOqchN2+
         gSFg==
X-Forwarded-Encrypted: i=1; AKwUvBzCOVbSNKyEI0XvbH4rcfLdtK2G/3y93KFUQmcdgL3vGI1fukS1yc2WS4N72ly7jOK7fHJQJA6v0xPkp2s=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvGyChh+WB6W/wwPfH7VQ16WTZ2uXh0L3aMTPiFKCsl2p00PBa
	EDV1grKWT2H8Tj86qTsupV2fcNjCWmMycDJNHlBkcQ2JKW3Z/L1soPlggcWBH4CBun4hsqdYNcy
	Z+48qdjd9WCqSHCD1Oxuf+zymsOEoCHJ9WNt42R0xQdv9xPfdIb3uOzdjMXK/hjGH3J8=
X-Gm-Gg: AYBFou0bODu5way+68gdzAvFL2+aXN79Q/bbaQy4n35A8CJw5+GXU6G66ZeBdqeQUw7
	7TkoLT7kLhQdLWu0vxuZRyM3CHP2FDR7pYzjkpMZ7QnOj0uiaeOj9zuZQ7yhum8QB/+L0OYktLX
	t5dVEWGcmotRvqHqFkxj0xGz7GUz26iXoBZC0gwQWFSAuwHl/RNgFx4msleEBJm9CRlW93A2/LJ
	0t7L5L2O1uKCZHfsfMEY+D5e8zs4fpSNmXhOg09cqqjf63tHYr6C0RDY24UP5mRFQcWnReo2MQE
	vaYyu6VvR4tR0iF2lFiD1lXCQAeiJLSD3iK1hikTPwHGXL+NS2+StCCloIVM0adt3zofkFtftv5
	hm4+cSq/rEGuj4IuCFcnDQ14nulurQ4gaUeEBDQw+67RxbNPrsRyTS0Im3tX3JJvc
X-Received: by 2002:a05:620a:172a:b0:93f:3e45:a419 with SMTP id af79cd13be357-94408a96943mr696890285a.38.1793264101736;
        Thu, 29 Oct 2026 01:55:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93f:3e45:a419 with SMTP id af79cd13be357-94408a96943mr696887285a.38.1793264101109;
        Thu, 29 Oct 2026 01:55:01 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05e4e4sm71726295e9.3.2026.10.29.01.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:00 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:54:58 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
Message-ID: <35epdbgc7rduuwrrn5y4kygqk7h2wv33d4tr77qzd37xlhomi3@2764myqvenzd>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-2-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: feR65rjf-Cj3LS4GSavbPPPSJJ5xQYOP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX86yjtMMZ1E5T
 envToNKWYFVSip6OICk9QGNFG4yTVclwPxdztRhdd2HBT3kaYZCyczX2SeS+g/3nB5J+0ZbwuGx
 IqbPN4ixNZDWniuVmJlWmhz/rVmCXABxgmL78+heYoHjeU0FhODWmX2331RRQldlzlHk9pWxShC
 9V3A+rO9ysgidJ1ephuGgAEcDN76Ubysa29w7ySJ3360OCDglsR0wfBu5n5D7EyxXekjB7XScB3
 FAdMnd6I8nTCoTpSJgSpvcEvANH/bfYGoNpLTRLwDGjDvT1k9h8FIHmyi/7ablpgtncdJ5NwrqZ
 kUE9eYHblcxqa+eA84tVMAjrrFZI3EeDBaGUIYuoIM4U7T6/lyqU3gD6v+qDwYeIBqkJnTwjGnb
 KkGr8CAJY3jhdYeSFHmhOaS61Fmw/ph1OIMuOa6lz9uIqeJg6fn8VropF6CbrPor4/e74ZfeHxr
 70lVCHj2lsMScWdc8wA==
X-Proofpoint-GUID: feR65rjf-Cj3LS4GSavbPPPSJJ5xQYOP
X-Authority-Analysis: v=2.4 cv=XZEcX455 c=1 sm=1 tr=0 ts=6ae309e6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mY-c6RtcwyEVXP3PGRQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9O02gZ1bSS+5
 GB7nHL7RdB2255vZkuBSeIY+NnO8TIoUVifEnk5m8nzPM/RslQGrtFg725sLWrpqqHUje9Rhq9F
 pQ7PRduFTgIJCE9k0hI8VMj7iinoU70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 11:47:26, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
