Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793477778;
	b=gSqW1tfj+mWMyLBNMbW3Sy1cfvKWMUaXOTVePtxo1vDP0LlL57EM2nlOgQxOiTgPAZyt
	 ULgQFrTHPQFaHcYq6aPT80WX5XZ7vW0e2nXx0oWYWctYWyJiFm8v+scP5EzmyqtSE1uZx
	 Mrzbmf+gL2dzTq7m1AtBs9fMno1IZTQjDioskPXIplVlDhlKxLaCe0LVvAPm2tpjc2r9m
	 ejPfHbiXrtvCj3LcRFAHhv+NhGsXnZmZ/uTgPpU8W/IkCFwoIoOHeZuwfFhDu5mMP3JV0
	 cD3NFKrD8kDEiCvgCF7nELPYOay0D+hQOf6Esphv3b9ArIeJQRZpv4REfF7gp7+sfXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793477778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
	b=glaCfGrkixGWpLFgtkEIi/Io4V6V09nAXAA8rkMDI/OU1cq1UzliFtYJJ3u7ZXXZlVnF
	 vs9L02UCsecYYgIj+VlRov8HqGf0Lwqqr9YJY9XKHlCvMjTltp/3tybRcU3g2TzKoJLMl
	 s7kQkqW9ivPfBLF1RfLh3h1fEDBKxt8/ciJZXT7qwEJzeggl5nrrdQ14T8oMRFFEUYVA8
	 nJ1cmpKQd6gC+S5y3DW5ODc2IIQzn0KmlwftMnR+oF1lB5NGT94kTy+cICfGhQyYp71aB
	 ljWzbeHD+izGxVJBtbCVF1KKMsFxjM69mWCO2GrzNvlJbNNcvPC7pJV1Hrpe7g7kQKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9627E606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9627E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VygcVeeb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bIVanoOa
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJFiTC2972464
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=; b=VygcVeebGI/ri9YQ
	fhErQBAM0zlmBh+3G/AO6X8Iht8tVCCqHroXDlWGB6A5COKcG7ZiiO8NAwwlh9MY
	y26uUS11faVLGvYd7XQqcamy+LLSsWunkK/qlm7Vcni7i8QpXdGZf6uzxxNC7iN3
	qjqCJswC6pu/TFUCIOIzw0OKktEhsxqyiGoKknSR+ddBhNfsfopYl+4nOoYJ1Z9B
	DQ5TLrLIbNOfcD2SpxBOdFlSkMHMVhCUYXVdGk3XDZnIwgZebB6f0Q98XaXTU+nc
	1lzPF9OZke8Is/ceATWUw2dG4/vW12NQ5+7cOSJ1tXI7wUssJR56QVSWae/93hT9
	M9rkTg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjcr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:16:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so294792485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793477769; x=1794082569; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=bIVanoOa0vzaexjnqqPTRZwjUB9qlv7AS9w0wC9RMCE2R+KpbKZD06ztEg71CvJhnv
         w/RDzNowSjy45ImSh4Wypu5s7Opw8lyspYrWaRqndA2qnqQaZcTj9w0HVOC5e85O2bfj
         at9F3ThFJUpL8o/qmSeuDyP8NVmEPuo6hfdDjRxhepTaJRsEiNG+DJeV0tyCm4b4bUt6
         P2bC53GnI42AzIarj5DNIg3a8Xn1wa1PWSA1i0wCc26lFlZzg7V0lBPNyb0GIB9yXbTh
         xvCpaOqVKPsrs+3aCVYYYA+62ZJOe3oHg+F8oVeA2/yqWMGjhpA82NUN7RjnGgztp1f4
         Jz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793477769; x=1794082569;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBj1fz6dn0KLQxS/D7NUgC3xxLKtXpvBo8Hz0gUq6W8=;
        b=jS7OtFp1mJRjcClkIxOm2DvYQPEp6YuaLIH5EOtMa3pcKarvaFIJVYHcbla7/GsIwt
         1pshPn/WHlbggUQz4a3OvDqNGuekRQPL14DeSb43qo+AGLvDWt+zZ3oGDDNEsxDc3Bkj
         w4YwjsuU2DYhplBnvfkSvYYscAGoZzGf4IwUS5r7f9NTa0XE2yvp/rah0BwTiWAxzwrE
         HjYc3rbG9KkzxtavATRDUqD38eudH8dO/f+nn6M2stAOJ5qkvsW7Drh+SUYwEAcujoXF
         dHB0ANvdvnv/6OgB/CR6Rg788QIRNztlLVv5826Gqcb/8mYcMCoMlBrtO4Psj4PbspTi
         jq3w==
X-Forwarded-Encrypted: i=1; AKwUvBxhG2L+TLEBzYKLM5jvHo6Yb7Azs9jL/cu2RLUG0HIN0x4vxGtydxq0MiQsqyi3NxJ/ofuf+mFGK6qbmXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIulidUP0LjJ4cBKM0a09MkzU9MPO204VLeyR6NqUODOgsKnQgf
	4slm+nMP5dERQOYZDV8KVrrHQ8KdUKO9a7ml8jC6kJhgB1K6Ud+gWt1ODTOSBihBE+Y/3NfM6YO
	DLdjvms6E/ZZhh5PIQ9xvE1TPxDV9wPPu3SkwJYNZABVadWazJ+BECyU4YyaJg2V2bcM=
X-Gm-Gg: AYBFou1hEzEduUMl0ge+vQzv4teqi7wdYREFxau507jT5pwCT/tPwI33g4Zi45/RdND
	cGhrSJ+G1CiGIb8px5/NCRIxa3jajS45QqJjlb5BhMi2GZFhpYF24qzBs5gaBGqm/9wkpDUIY+9
	rm5S4x31Ll7iAx0crSO9hnIY/ZVMLVLUjpayajqJjszrh2VSONmBplC07BoM4LKErqYGjGkB+si
	Y86osNOS5rNAsiVdcm62rAs6wDFCG+bPMTKXdvpiEKcX76gfPrmvs/heJfgGSjmIhs9Cmk+gRhv
	E29wVqFOAhYigSMGpUbjIrxeK023kg4mAcat9cdlsYHnzRQYxKaBNnhyz6mpTChZKiIHIblNxJG
	yBCnmL6dpy9VBYN33ELn8NPuU2nWaR2gp07bS/AI2OAa3TTlbLZ1Znd4BIB4RBbno2OqEFzD3aV
	N8hcBdBPxp8prwYDGf8pMo0eCYm2NqrAfJMiiDXivaqlhik2RiZ39zL87gdNqIow==
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055213485a.76.1793477769075;
        Sat, 31 Oct 2026 13:16:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4611:b0:93e:c12c:9dcc with SMTP id af79cd13be357-94421760e17mr1055210585a.76.1793477768621;
        Sat, 31 Oct 2026 13:16:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe0752a30sm731130e87.78.2026.10.31.13.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 13:16:07 -0700 (PDT)
Date: Sat, 31 Oct 2026 22:16:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnaud Ferraris <aferraris@debian.org>, phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: sdm670-google-common: set chassis-type
 property
Message-ID: <ucyymr5uvakzqalebjvx4cnxaqi7d66urnjcogjm7jdgcmohu4@63uj25mpulyn>
References: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030-pixel3a-handset-v1-1-0ad9b0d17a76@sigxcpu.org>
X-Proofpoint-GUID: 3Yc_ix7NSLEFaarMyCZFXzB_jFKwYEPT
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae64c89 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=xNf9USuDAAAA:8
 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8 a=2Uk1DsieHeZNntOzPjsA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=iBZjaW-pnkserzjvUTHh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX7vvMDX/xCdCF
 PFhsRPc5GPY7cleKTvR1fMJwZU1Qa6SO8Q0ila1hBotHLBfywcWOUjWiOznlrIgAk61BGA2BFVb
 xVRrpKUKB88hE7QGklwpJ7rXCJZyaXw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4MCBTYWx0ZWRfX8KLePzkQxu5J
 B+Nf+NFH3VJ/6BKsDeQC+Uev2/08N0oWdfA+zF7Py+kLxBQr9uIhyqKW2H4kFYz2ojcr3L/5HfS
 3AzLza/fl6njvJiEoD8sQ4Qza4AfWEkz0h+CPkEOZG1Scr/0PR8kG1uLgSTwWUenINAqgs2df95
 Df6DfA2OUts9vMimbK2JewsVswg4uDzh+bh/CmypYRQ1FryEpPtk8xbLel+3DCQj0ymJ5izFpVb
 CmiJMniSC43VaOahVa+VjXa8a3ZZKQraSKm/mtBC567sZ3vmIfA7jb7a4DHVVapfdUJQKunT9p2
 Wh94kE1q/dfnVSB5bqUy953qlLJYDSCDPl/pMdCu9SnP6wTfxuLbuQPvA544XtKpeLNCuO1NCX5
 +T9VqqLaDnxiwbvTzqxbUmf93Mul+tBdtgfg9PBrwAci6anBg3ChGerIO2Jma3Fm7UnrMGXvd1j
 ThoTjRPH0Y6AAdIOXGA==
X-Proofpoint-ORIG-GUID: 3Yc_ix7NSLEFaarMyCZFXzB_jFKwYEPT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310080

On Fri, Oct 30, 2026 at 10:27:38PM +0100, Guido Günther wrote:
> From: Arnaud Ferraris <aferraris@debian.org>
> 
> The Pixel 3a/3a XL are mobile phones, we should ensure userspace can be
> aware of that by setting the `chassis-type` property.
> 
> Signed-off-by: Arnaud Ferraris <aferraris@debian.org>
> Signed-off-by: Guido Günther <agx@sigxcpu.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
