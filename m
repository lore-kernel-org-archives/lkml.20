Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569991;
	b=xFKc8k/5Iv681Vl7W7NSW/vTsWjKb4rJFFPv0whrNowtDcFPO1r1ktbJJU3G3aoBV0pI
	 ETS6JJMPWOA2TMSfugw08JjPTAOJ8iW7eGoUR6eXwGDEfnDqJtToTiS7YQMxICSe6ExgH
	 Khgf3uPuahxS9B9s5fDSJ2NLPk2Go1p7FetbEOvlyloYQ0ErLco7e/2srvhhnmmVkJhqr
	 zSNiJ4pUzNnV6mkLVTVKnHTZiMX6vrWcxU08AgjAhGoL3Y+I2EcuP6kk5IPl2UlwkIjsa
	 cz24Lw4DpUGsWvkoRtEhE0iUbOTa1abZXwAwZ6QWlCJE7ul3bxsI2SwhfwsGYyKUZEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
	b=sXpTIHIZI+ELdrdvQFyMS2hSUvd1q20tJQiVSV/thUUWBb2WPv7olss+14MMsS3Aew28
	 vZoZ4T9E5v7xgfv2EMUszg4W0L8nQFAoYkjxVInEgyCVmWKsoJP/qNTGlAn12TAL2pHWE
	 MrCzgwSUzJ/mHkU0+snzc6TyD5dsqrvejbw0fVRVM8MDoZB5ESSQcMjBU0k3X4GN/SrHq
	 RRKVJ72G22jb3oR7v5CFfSIfDAlzEmC+P3+iSb6SxvenDhCgXyWDumZfX8NeuzwO6Ewev
	 qHMB+rSmSIvnfHqV8gOPsuMcEoqjKu8hLiQnZHYRF1tPY5K4TuKLIOTVmG8mL9Ku0sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eG1X3yM8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtCTmcEn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F5D606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:06:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F5D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eG1X3yM8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RtCTmcEn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j6Yi793346
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=; b=eG1X3yM8s7cBfup+
	7FRm0p7sGm9xEClsivOl9XKgz7XNgMjPqlUJvPg7Jye5BKzc4qZhobz7R6wn13nI
	/IJsVf18d1knSYEL4RTqmUuNr35MdgJ+xOnrl8KgMulRlxQmsQB6yll8IKFz1wyi
	/bcOwwoOipOMQv8VT03eUe4/iZR9YZ/U+5bt2xwWkF4482Jwj38xc8OBw8sG/dxj
	D2qe01p7KnPp+A2V5HQzLK0uz8fe7THidg3/fnLWUH7+drWLlYsPd9eM1tFegSRG
	Txdz2z12phDT8f3AVePuSIeZ0YN10DGV2XRvGvNjBplzrLfCU3b1UWdU+9MrqdoB
	RDoIRw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabjrvh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:06:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5360b8cf8f5so1394521cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569989; x=1793174789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
        b=RtCTmcEnPaovq+c7Dpppil+HcJ4fw9Q0ifYsA0X9m9fpybEF6+GRltr1RvxGQ5+47g
         RV7/GbG1noYa2LMyGgAXLlqstBI1a9x6cfKXFJMmP8GvBWW8Ng8g2xY5nJytaZY6WmB3
         DDa5usiPHkUXZIlsdDyBOGaGFIYPICZxp+Zv4v4D4QbvW9lXOtsrUEgyFhz+xP7NG8RQ
         QvUjQrWmid9V0KfwWoJPB6J72uS0f8ba4wFDRxxCgIHM+FgPH3L14Nvh4xcTva+hPeU6
         NK6r3t6VGaj7uhqbRGAg3iHjfPS09krLhm6w0pszFSuzEPadmvfqB+nUPgb4dcOKEAat
         PJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569989; x=1793174789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LiOs04YGXLTIFXmdwEgbkoJICneWkcQrh/KS3klkgwI=;
        b=Pul4OkwrVhQ66ByVgOFriOznTTSVMPSa1H3EPjA6UugG3VX9f23TwwL4HOJguGd8H7
         NDT5YLfH6AN1yj4O/cqsdZ2aHImcz1WPEQVBadImJsd4hyP4oVGvDNzYAjlG5aPoN095
         NoZmMhpxKWqUf2O2/E8ZT3qdqKOYnqGQSDPqOuRdXACePRnIieBUtnWKifiBCzmrdIq4
         PbleMQSEzSjRcZQUsCpMIZGqY+ZqVEh7BYQ5AFLl8ixWjj4Dyk+nI4skcVlKbWxQiYO8
         yyLSahdKFgy1Dt/RpRqkB1+NFx9qq4pu/ftfks4dRaM6UHBo8XqxwLewV5ELZKXSnqVw
         3Qkg==
X-Forwarded-Encrypted: i=1; AKwUvBwvyYdQ9IyvdXLPO0kHHdMruQLw/AVJlqhRlH2B0de2bNlOZiAsss27vJ0bHRJOdBJXhlSwXEqkC7DAiqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCM0FKCGaLVMqDVgEB90JQ6DOvv+hTIHag78J+kIxc4oDbBzIH
	muxKRgfyNMZ5qlERjk3KjEhV6fiLgQhZrXCnvwolr3s4f1jmfSfJ+vfxzwq3m2GsFblF4MIYgAB
	VZa2zi8kwbw/SibSt5mVrCv1G+4a9Br1hDsEEMnhs0oJr8BwduMrlUR056t2/pfxL6Mw=
X-Gm-Gg: AYBFou30cMORkTHWeHgK9NITP5BRjbIkb11eUzc0I8eQnfB/GELBYoClHW3P2pOgpkH
	QGlchnmJ2RaGoBdH/3mkSlg4R1vRzw59LCgLh8Hs2kq4tVf9w0rBp4XML5wcKYeWFqqblKNin44
	HAVXT/Y3yhezuFYNXwIs0jE4+dQII8pIOAwhgPzcO0fl4nlITulHmKPgl24QIBpQudzP2PH6+dE
	yFj3k9V/h/0IfNpWfMRGbqdwLmVxJJ2p0ErjxYbhJBy2CkUn7ov9CmXbKQ7S5CmJg/WV1Ly4YP6
	OoG5mb5x4AGCTrEOKHu/xcxtUjm/zNNbcbr7HUDkBo/ORGZM14XXZ31i6mPEh/t75gze712bF4Z
	FFBqj4H4VzQIpcE2HDpqICg==
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr26472581cf.0.1792569989419;
        Wed, 21 Oct 2026 01:06:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8e:b0:535:84e7:5a86 with SMTP id d75a77b69052e-5369b15f2c6mr26472251cf.0.1792569988977;
        Wed, 21 Oct 2026 01:06:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4678f77729sm50471066b.25.2026.10.21.01.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:06:28 -0700 (PDT)
Message-ID: <9699033c-a9e1-4b11-a55f-b1aa216c700f@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:06:25 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias
 PLL parents
To: Robert Marko <robert.marko@sartura.hr>,
        Julius Bairaktaris <julius@bairaktaris.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vladyslav Andreichykov <vladdrako007@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020065430.1251541-1-julius@bairaktaris.de>
 <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <30c21159-3008-463c-9cd2-a07f26668a25@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX5EFERyes7CH7
 ZNmRvagrF42QJmWGwzloLzsqa8rndPV0l5p/SSuhjJHuyqHHN2Tjq1N2rzFDp2RPtvxDDaDlP3a
 8FWWwjT6j8kFjrQx0/FpCq8H0Oullw0=
X-Proofpoint-ORIG-GUID: FAdF1ZCA2D2EJk0CnD6ry_wLP8Fi52mE
X-Proofpoint-GUID: FAdF1ZCA2D2EJk0CnD6ry_wLP8Fi52mE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMiBTYWx0ZWRfX67vqaWAvVj6Z
 V8YlEGla/apFwUVHuZE6BckfDQC6c1SKI0rV5cbvApMl6JqykJTvC1ddVJo1mG6+gLIGwKikvbv
 s/Xi+Xx5/F1ABI6BKkWHBaMC2tzfJcy2pi1ilJ2freBlGdZfKMWdEtlWdwWd2VLIsVI8kt/e+4V
 9xsvVy/d5jRq6sfa9fDfK58vDcTzzGyC6MY4tcAryF4/3MvZJ0PqKzx8wd3rBYdD5P+RCja35jI
 XVmDYC9/m0Iy3P2bPf08a9XeamWUqnTEecYM6GFCpdwaoEYslxes/vfEMxYYeNmDRwoLl5Elm4t
 G/c872TZHgyTQ06rAg5qyOUUiLxy9p8EFsCZHAvDkWIUpZldHzanV7u4IKVFA6GXsXxDmNsdRYj
 4XQMjr18gOOevsRTa8nIqQR9rmUnvCDPlf3/3zoDxKPTdrKeJlSXtJT8Iq9x4c5h5i7DuubADwg
 FMHAQPScsqvY+oiIyRw==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87286 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=8NHwpXmQIE9AyX7o414A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210032

On 10/20/26 1:39 PM, Robert Marko wrote:
> 
> On 20/10/2026 08:54, Julius Bairaktaris wrote:
>> From: Vladyslav Andreichykov <vladdrako007@gmail.com>
>>
>> bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
>> which takes its AHB and SYS clocks from GCC, so the device tree does not
>> pass them back to GCC. With only .fw_name these parents never resolve,
>> nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
>> -EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.
>>
>> Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
>> as gcc-ipq8074 already does.
>>
>> Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>> Assisted-by: Claude:claude-opus-5-5
>> Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
>> ---
> 
> Hi,
> 
> This issue does not exist upstream, as CMN PLL is not yet wired due to missing
> networking, even then the solution is not to add global name matching.
> 
> The required clock inputs should just be passed to GCC directly which I have
> just pushed to OpenWrt.

Just read your reply after writing mine, I'm looking forward to seeing
that patch!

Konrad
