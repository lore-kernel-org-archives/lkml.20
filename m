Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739753;
	b=K7aR+ZHt7OGS3LjZNJ+gL1px/HaXY54D4fpfyD3MLGQFDA2yw5+ZJhkFYe520u6n3mg8
	 bIq3nRJDR9MQ8MYbpGbgKx+2/DxFspy2/cmedPi5+YLYM+PJs+wktW2RMJDHlgaK3MDUD
	 BMiKLcGGF5zS4lKb1W67tVH0roZZ+I0mrhG8emrnyM3NCV/gsc9lDO9dBPZa8OWryWrEv
	 5Gwd5RhvHWoqQ6Mz04xRSxVB1uVXuiN3YEg4yMksq6i4BtebcnJW5O6RaEnKXSc/rvnQC
	 WJTovxUBrqgEy2vK0GXAHvHzycvmxytU/B3pIjXZz06WUgmVf6sNcrSDGihP8oL7nmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739753;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=emVHzhFuBmzNbJfl8jaY3Tt35lmId6ThMENQGGl8GI8=;
	b=5j4rgCbLHd+5uYUC/x02Jcn8WYnC4s5pheEYVrB4gJdRi738+9Mg2KMANdPwlliVLhr4
	 gMse6j3tdeH4tTDU0cC52x+2Jpz+GyY6AS83CJ0AHFWYIm5zveJkkadCnrYTGtYYQ2t2w
	 XiG/9bXEpGt8Cxgg/qhtDzUd7DlQx9px6tVFm3oXrqm8vf+iFseM92BpvsavlGRx81OWz
	 JH02RrTWzEkpzTIA1ovSFyiF6FdUdVdHiN2s+HNXL58TwpqyMiLw1igsTLHwYBB/YQVy1
	 U3zP9WvhzyiT4f/f6weQxMaHi4twxNPNAgsoZnLK/ktGxKxZYFUWA6i+KClmJ+z/MPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JooB3BEN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdJ9sFtZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E806606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E806606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JooB3BEN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NdJ9sFtZ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F7AK3153979
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=emVHzhFuBmzNbJfl8jaY3Tt3
	5lmId6ThMENQGGl8GI8=; b=JooB3BENF2M6A+kMTs+lcpmhxo45lK1YVBhiiWUz
	6oOPEsndL57QUVmC25/WlQOLn6wEoJSJZVRWPGofaNphBkiCvQvIeKD0po9c8Lw7
	aCQkFpzl5zS3ui6GoqwJBdrockwrqRVuYGXvZ91Qa0S7nCUR24vQMk75J53f61XH
	G5n4SO518jchVGwClNlxe9epKA+DA2aFYNCemKjH3yTS9qdD/exFsOGlWimghTJ5
	zBxNtB61CKbLQHN2M6TcBgY0C8BPnDna+2vRg9wC9kJbzZhODMhKWv8k+DV57F3A
	+acndsY1AwMi79TKIpbPNQ6OrEMj8FDtz7b/SeBbQB7dMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmradtr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:15:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so123444485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792739751; x=1793344551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=emVHzhFuBmzNbJfl8jaY3Tt35lmId6ThMENQGGl8GI8=;
        b=NdJ9sFtZdSBjkiRWvDN1DDFmBZRlKH67dY8o0kMqfSB5Pt/tiX/0IdbtFX0H52MVJI
         NzTq96s/NV0ro8asGpaFFW4MfeyGXWB9rLXKtY9XgnEOz5tb6P698/c88mKcMgj2Mau5
         H2tOERfhYW5Xr05gzXYydo2/F9XvCJE+uCZ2AsdSSkLbBuaFu1Maf6S3Amb+mPP9DKuC
         VoN2lFnP8wMe2i8ka/8e2RmG2yq1dcnqF6Olkqa3fsJxrYuH70H2yN1o38YO2//q5Lqu
         eNS5+fZd9jDp9yfOTkm4ejlvxzRf/P7Xh6wHCvIxvrYTpe2dFcy9TsS8i8Nz55N5MM2U
         HFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739751; x=1793344551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emVHzhFuBmzNbJfl8jaY3Tt35lmId6ThMENQGGl8GI8=;
        b=YuPBwzzf/vRFRQrTDNPZZqU9b6gp147sAevjOn8OD32Kdl6Z9u4uZiuJfczmLby3uS
         bgYvDIgpJ0n/YUCqA/z6jL3hSC7P1S/PBtXPtf2wj5klDTCpIjb2YI5aqSmnrHed1x1/
         tgWP2vkFeDYDTttzxxiEjwMCgjfe+qLCHbo5xnpVPZgwc0xXREkvmcZCaLmj8wEiUXcN
         C+cz+LyK0QNZrb3NyUKxT58vBdDFUF5ZpWie0avL46i9GcsjEXWIigrc3XML5QGK+yzs
         FmoX0P3L45l/oypDEdTyYV+Ixs6uB5v+YrLzyDRLpwepd55Q3lNvqJvLfv92gTHQJpfQ
         r/Hg==
X-Forwarded-Encrypted: i=1; AKwUvBw4otKZFCBKLoNL96zPQhGrQI82hOPoASweMehaeob9WPMjyVHgI+g1I9l507idu4r+tAroFwjVZ8r6wVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL+IOumJG1w0w7ldCVwkeEKBj+c8bif+fnxg78wO0GZuKKJ1YC
	Vg9oMNCzWWTqR3TDeX0UP2K2FF0oe9AcrZnpUNepyYAGbhQFSTvu1Q18tz9kcPSDpkX/i12vvd4
	waTV0ZR2wT68DhBeVaZMck6i23BJu0387tFHCks8AMghBQwLXsfq9dxz3Snwn4zE472o=
X-Gm-Gg: AYBFou15plZZbDsJi14lK3OTrjGJYuS13S9jPk1VS0q7kqMGfdyh2j3p0hMyBSOvpOa
	gzP789FjgaQt9Q9pzO5UkslSLZI/0Kf09V5apDKMiUa9J6flLwvgxl5umnB37R+h0b43dSbXA5/
	PCZ7MDUDqZwr20E6hsLZAQEUb3paR8X+7VV+7kAnhWr2+0Tpkz9D61/xhmV985UZQC+ACOe5F5X
	LPxqC4d+fwspn8IQxYwp3QLFTBX58aYvWxBxEPn5tjLCviYcVm3CEFJCr7dpRsFMCeGysDvPNOf
	JV/0eJPfIF4+tYnUK2NA5Gdd0TKd4AGrh5vFjpeIpQiUsnv/gBt+F9yxYputdxikR5cvyVCvmn3
	cBHsh0AFAvHw+AJDJ
X-Received: by 2002:a05:620a:470f:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f6f420cf8mr281437185a.0.1792739750566;
        Fri, 23 Oct 2026 00:15:50 -0700 (PDT)
X-Received: by 2002:a05:620a:470f:b0:939:1222:b9f1 with SMTP id af79cd13be357-93f6f420cf8mr281432985a.0.1792739749888;
        Fri, 23 Oct 2026 00:15:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211be9660sm36763725e9.15.2026.10.23.00.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:15:49 -0700 (PDT)
Date: Fri, 23 Oct 2026 10:15:47 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Harshal Dev <harshal.dev@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Selvam Sathappan Periakaruppan <selvam.periakaruppan@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 4/5] soc: qcom: ice: Migrate to the generic ICE service
Message-ID: <52xwxkqrbleq3upuvyorj3ikr6xefpqc2izkdqef3dlruzftwi@gmqsgo22ik47>
References: <20261021-ice-migrate-tee-svc-v1-0-b035be7aab0a@oss.qualcomm.com>
 <20261021-ice-migrate-tee-svc-v1-4-b035be7aab0a@oss.qualcomm.com>
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
In-Reply-To: <20261021-ice-migrate-tee-svc-v1-4-b035be7aab0a@oss.qualcomm.com>
X-Proofpoint-GUID: OLBLbFrsgWF7Dh2y1D9uLwuHlRbKGo2D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX6/cgCQ7yuGu/
 dXy/C1HUySVvvcdw5XYlkhVmiRSOFnsvKy5zfKm4UeB4kRXm8PzPpQ3hQgb4iBrBkBEaP/nsrFH
 QjrMotiVj1MuvXhkwN9ot3gzqYdzaqY=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb09a7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GPN60YVRCDtHV3IpRhQA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAyOCBTYWx0ZWRfX0zaBZqWXGe/a
 aJ8ysxJbwqfvkmS/bmqXxkrJ3q/hFFGJopoLh8nW7l4cOAP/Z8CP6ZKPZE0CFBMygVx9QXm688W
 qd0S2wSHCLUkvZdl73h6YUECJ//SwajO4mhEDfWULOAbMU6mYpJwH5C18HawunaIB8XDU/0Xt3Y
 clHMOFMWppzvGoOa7jN30pEIKJYUkfh1N/jb4tJGiosfT887+Eg7xt0m3lR2VXZrOoBWiyiHUNr
 6JSVFoikWcOnyLfpqUcRu57XOrfMBShMf6KgiouK2cfuA5Iii6UJrpe2Qm+XdyZEeniRPZgk4L4
 o6+njj29vrVpLXMY0NL2aYSog5yVXQRhfLQtdxzXhjAK2Q/0LsLtT1//zgAIeVcFN+XH/KQ1wPC
 0ZAEa6eP9VdBbTpSahGcuRAGHe7k4gCat+Iqf7oyMtop2p7nEvsfumx8kZ1rrGHedbcCt1D/LS4
 j69OJN5SA0JizCv9A8g==
X-Proofpoint-ORIG-GUID: OLBLbFrsgWF7Dh2y1D9uLwuHlRbKGo2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230028

On 26-10-21 21:13:10, Harshal Dev wrote:
> Migrate the Inline Crypto Engine (ICE) driver to the generic ICE service
> which re-directs calls from the driver to either the SCM or the TEE bus
> based back-end driver at runtime.
> 
> This makes the ICE driver agnostic of the TEE firmware running on the
> Qualcomm platform.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
