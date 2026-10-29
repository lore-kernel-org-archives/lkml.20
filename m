Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264158;
	b=yorpNVxGWXPMqI/41DcQYg4EGZ64zgl/BmPdgkDEkkncb5e9gqbfhHyvBh5Agn7evcEL
	 RSus3fyDbYe7+YUZhh5jOmVQVR6pdinXegBiob95+9908YAB8OrEP4tgJC84h4AjcXitV
	 BGxQ5LD96mQ0KbSE7JPVe8GMka8kdrP5E26lUPDc9yPZRCRRdQbMtfKXzGSKJseHFLuDd
	 N/MRBI9DMRPhaAs33I1MQQdTBHCSU7IyHyAgZjRkY0c7YZxWuOwMelCAuGIRs7cpmpb4X
	 vvKa3BOtcqR5WLcOm9mI7ro1mrrTs+GwDdtCycKvvNVu1FF8Ycohqd/QkAfQP39IC0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264158;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7JpHYPGvzX/GtA+Kzl1Herg1jZ1BKX3ryxPkV26eesw=;
	b=waSoaR9ANmr3wz3FTzOqqJetOAi3TglyvKkzZ4xRJETdHd0KuMzINUK+dxfXnGXhhAv1
	 pk67yuZii8EjFvtrq/okPPp7NUiMDNZ5Z8b7y+qN5/wt4hv/iw0aQcPEqLJLjHHdKW+jc
	 6hzn2oZCIYx8IkeXA1yr4NqSgsS/oQyF6nPU5+N14VQAQnp25ScDf6zh7f2Rys0j5gOiU
	 noIccPRQFhe96cJCCUnda5mBjbh46uSO0ipWiw+i14/4pIUdMjYHvD2YVg77i5UQ3P7Mi
	 TFldVqET84ufvtu/+sALZwP3ZtlUagG2k4Em5acZ06dwPuHYHjp9eUJMUdw36jeO6FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfk2Opma;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd9aXWLH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D960A260D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 291D960A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dfk2Opma;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jd9aXWLH
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HAWs3889628
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7JpHYPGvzX/GtA+Kzl1Herg1
	jZ1BKX3ryxPkV26eesw=; b=dfk2OpmaE6WBnQifpSSJARYMDBW0Nt0+3h/e73u1
	R9595DQoFkMhfFkOhfwAVSwJsgAo3jeo9B+x3MrtLPOyvPeD9ufa43qB30Vl7awj
	i5eMC0pZ0NgaWKH7EoLEY1WFZ2S4ci9Ouj3ZfVOnzrmMTXSiuH9tTP16n3OXm4x+
	ym3mNtSP7U7TNc48LPCO9+wH1S8PVjvQTvrmHtggpullVTHL6TFE0l781cj8QiC+
	PA/VjeWxikhauvEG8Cr8ex29L+oANrBH9ZRcWs5Nls8AG/dBm+wHPMXp3muCOvNv
	iJ6bQtzcbWvog+csYBlo1Ox/egYa5xi5ql0NE/jyuCf6Fg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc2qpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:55:57 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91c046843f1so22856226d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264156; x=1793868956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7JpHYPGvzX/GtA+Kzl1Herg1jZ1BKX3ryxPkV26eesw=;
        b=jd9aXWLHF9DjDC4s+7DkvQV4vq5AD6aLZM0kuYJWRl6DogUIENEnz7Izd5RknarkTz
         cl7oXwVZAQc9GZLXtoY5l2gbUL/pApnyPvG/qDaKD9oZDDpu9Mzdq+nl5OhlsAzMHCXS
         akUeIFlkoV5RfpTbnmILJAMhMB4ES5J0HtHiq9f4fZlmaZ1aXk0PUY2/0/9vvMr+gLMW
         B4kGNvw58G2Hyu4I7QykWzVpoN1sggwwA75cmOIC4Es00LQs1GfYaGYqu7HYZHI2G8jI
         s+1aZz45W6Sg7yGP6ALrdBP/PKy+8v4j0Ffmx5PrcjH/+ndib7RTxKmbyUSXlbSkJ/2/
         0sKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264156; x=1793868956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JpHYPGvzX/GtA+Kzl1Herg1jZ1BKX3ryxPkV26eesw=;
        b=FEJZ823Ga7++9qgwyaD7sTOELT7e82LCFonX1Gwa08glW6If4BEOzgcd1NYicE6pXY
         Qo8YMiq7cHRdO8rgcQhycD1MYaF8AFkgZW9hhrCnac+WyscqE/ZtYcgqLVZ8beh/Zvvc
         QbFBfAIOJJt5hJXskdl+7ny0Jms9JHHEO9LLJe6xCC4J5U+ZVYcojWojPa3yK4Z2nXss
         NufomA56v8bVtCYC/iU/Na3TSoWTKnuye2/GjXgkSYQ7oXZpSKeppC+t47PY2YiDJbQk
         GkqG9OB6ASCBMd51GektQFqD3DolYOqg2Tzwa/KNeCJ4Q7W8dFVy0h9ryN9ioN0+rPU2
         w2Mg==
X-Forwarded-Encrypted: i=1; AKwUvBwVaRGkCSQTfA+fQgmcfYg87xzIaNmzlacfZiIwV2rLbycAzCNsARfGP1fVyrB673Z3OmiUGo+u6DB+n/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKH+d0iU3ckLyAiyR907S6mrjpDZEQOP3SDHZue9QgYQKyB1NWW
	+TX2Wds4SFt/LH9ctBP/XeFkmj3Q/0u1pd2YKcpP2lhxExj8ocPmZhO01/rigc6FpfFRs6omkTC
	nClERsc3xYnVuMaWt1a0BnWUFCB9qDKjUfknHUfjTYESjglfOVBsecWGavC5uX2nHpU8=
X-Gm-Gg: AYBFou0kRtCv2AWRs6nb6Mjiy+xmdzotai9ptLBxeSudImmXSl48vib74kJBInYI5qP
	1yn7C/TKfHXSNk1Lr5S/gn2PC7lkFe4dGpIJQcEu82vN08sRsl13xQglopxQN4gTGVtWk/3r0Jr
	lcJB+ACDYHX05YFTuA0CfkhJHFvGf0JUUEJMKXIRgPW+HYn8G7el91XaT5WB/b2kWhAvh4HIcXY
	pz8NqU7cSQkPj6rsVrhS9PlNWc9t6jRpD+bZabZRszemcCDqTqhYB0grZMzyampp7/Suf4q386b
	i9OD2KUl/EKPfcWmepT0eRCbtz7XeVs4a5BOBd+oEzMNAx4bcQphCjHxOLQd9OE3IeM8iYu4zls
	3Y6b8vZhnK2feE5/hzlSJxL0b3S6lFOhXSnxS/jGIeZj3ql8z5VRGF+8UpoIV7KPH
X-Received: by 2002:a05:620a:6483:b0:93b:fde4:4923 with SMTP id af79cd13be357-94408dd228dmr691149485a.63.1793264156293;
        Thu, 29 Oct 2026 01:55:56 -0700 (PDT)
X-Received: by 2002:a05:620a:6483:b0:93b:fde4:4923 with SMTP id af79cd13be357-94408dd228dmr691146685a.63.1793264155698;
        Thu, 29 Oct 2026 01:55:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8ddasm36081184f8f.48.2026.10.29.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:55:55 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:55:53 +0200
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/3] arm64: dts: qcom: nord-rrd: Enable eDP0/1
 display output
Message-ID: <dqra6dq22a5xnv3eg4eneyubgeb6cabzlw3jjxg3bw6qrhleqq@ish2ptiwe7qa>
References: <20261029034728.633495-1-shengchao.guo@oss.qualcomm.com>
 <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261029034728.633495-4-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae30a1d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=wx-G1DhjD7h3rq9mWzQA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: NJqJDuDMvzUs9tmm3FwWAPTXcKnEsBxT
X-Proofpoint-ORIG-GUID: NJqJDuDMvzUs9tmm3FwWAPTXcKnEsBxT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX6cHEbc7VRAZu
 CRBXIxgPW3IJnigHDwsPHFUKiFU0HEBvuTx7kkqzDuqut2JyMYk4St2SI3uDU1fDMXBSvFam/si
 ipQROeND91u2/+8Kmi5fkm2qekts7DTzzyy6AXpSEEtqFU8ESOjt1S2arZ4SaFIVbR6d7hsBOP+
 dxlICHoDuSwiarKjlH2LIcuLCIZvfx9TAMQxAvmZtlQQU0t2YjtLEc5QvM6pWkYIiCdMo6ww6eJ
 kHIfDYoToS4B2lr5x7P0HYrlXfTMkIQZ6fUeqaRlTS8de90QTdR69PXrg6F0nzkkKFz4jouwRVm
 aBYlI4FTwpMwB1jQOZQrjiqCPVifmNkIoeHtZJgDZxDuAPY6uwEQcVp/CfJlT1Lg37YYypoEVaM
 cJmgDEf6/owJzCRpfT1vyayCg7Caba3adhXoBV/lULBAjZlIQURBGiqJIKeftRtzkUICs96m73g
 q9RFWSycY4Wt0hBPN6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX0oxGsYQviaYp
 jQLXVKWdw1P9WNZC6hlxcJwGpwhDu9ypu1kVfdUJzlMrtI2J8ZL9IwBhmSAjjMYGGPM+N7AHxR2
 qfmEZq87aVbio1Ui8itRqWgT9nQvpvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 11:47:28, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Enable the MDSS, DP0/1 controllers and eDP0/1 PHYs on the Nord RRD
> board and describe the eDP0/1 connector, its 4 data lanes and supported
> link frequencies.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
