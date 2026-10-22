Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792665278;
	b=gMv9rltHV+lf/Wl1atisFhLGpeYt2+9+HScTMkNre/f47DVKS6TpkdeMp3qQ4KzY+1/J
	 8qjzOouSabVBHAdZCbl0VBNcTXn3hZx7Xn7+gx6cM8j9WR16YFfOlzmb5KdgP8MyFATbX
	 Fr4WHlDlJHhkKuf+CYnEiG+oNeefjFXkIi8f/IXtt7XwmUSiNkeIhKZiSGSX5P3U/+D3B
	 0iik2zgUbBRKzjIezCdWIxSMBdPQTYBEbNz7UqJYv/1Hm0AWBrnfZSXkNVk7345KoOCIC
	 Nw1Pka5K+lZSFhKScYgl3zYW4Ot5omNTqEL8AZi6RfGA0e7wAav1wmFg9XrbLDYXpuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792665278;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
	b=5WwXzlSRWIGm9SbUAq2cgc4lsYCyAnSPGRLjXZyf9JWAa5KZdcpuXOBPGxc1uY1d5W6x
	 68BMItGHeuReRJyQ0+UjCnLItwHS3aM3kmzBGdySxT63G8EgMdqPeg/jgfFAm4J8mfEoW
	 AFOB2KGTGSVRxFEhVPDbQZZNaYZHP+4UBsGuufFjOj1NYzktWXvncd3UPUxlJ46hbkyKl
	 4Lspw8hke+MPByGyPDq3Xh+KwDdtnKbfwSUtxoBP+B+ticPF/OYKQV2+57FUGAwf0OG8m
	 ULXAgEmUEQONu/pKwUA+Zc/iLnnaQoPa4GIQLq3aQb2knQPP1dqvpfNNdGu8P4sx4sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9e5OOz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=juehq+nP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A503606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A503606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DF9e5OOz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=juehq+nP
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0E6h3116058
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rshDlqNejxJRqysNErHRTceL
	WSA4tGMQL8Av9Q+N4/4=; b=DF9e5OOztgxDFBfoNZE41kJRB6u9wLpmPK1XzOZg
	oxLaxAl0b1ueQKf3DNODFKVFJ8MAkm4pdf8WFCJ6WjADdknDxIvm9UBMJvBBQ357
	wQky2aAKhtAsGUTPpmtY1YC6w+NuAlAfGF52yXT4fW3w4s6B/QGaQnvtcVd+7CV8
	fPykJt85SxqvASAV9tEiX0gccsQDSVFEpXg2OxuwaAcA52QCf3nwmYe9vfkKV0N1
	3r7wpiahDDm3aXpJvvDm/EJG7m2R5zmE19VnbhnZwYyg6HnBcE/E/7oWnWXjYOXA
	eWPnPkLRxjz5GnlBMnG+vqLGh7RF/+G0R6yx52GQowNn9w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bt2gs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:34:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso285385685a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792665276; x=1793270076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
        b=juehq+nP7MT/cbJ/3m4kgEFz/QpT4AG56cXY6ag5yN5huxsuP8TxHocCgNpB0XRnRm
         CNr47TBXY94VbFHh3VkUHQxwfsZMs0vkXNTXWjo6k9566M3nKrttfvQdAMFKu/RyQ/Ii
         Tl6iuSBNygxi9OXHbhb8Fh/FBXrDrkXQPci+MkVpnsPtoG03JBWVWQ+qzcxvY7P1V52P
         fvpIZ21lXtQ7Wl1ry8F6RO576bPTGOpVC0wd6ClLqpg0RMMP5dTAD5z/YCS+MBOhprrw
         zg2CIibAXdhDOTCORD+RzbrGjoAAwDEY1HljmUxlmYR05UlWYEYcwCR3VMJAWTJ4s746
         jr7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792665276; x=1793270076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rshDlqNejxJRqysNErHRTceLWSA4tGMQL8Av9Q+N4/4=;
        b=oYFTrMu0uLEI2KgMRqgzwSRU6q1bwvJVj3af6cGhTDaxJlIOWC1VviunZB35zHzzIv
         wv8dx6yn86FXQwWssxcd4s5Wnh9ss50j33QwGz3mdyKk/nRlYB5CQ2vCt/knk4DDwDZg
         6/iJViYxxmEurxd6jKfNkyKvCE2rJd07Rb07WD8u7t4w0syMjF8ksgWnebWj1OLV6ETc
         Ax4joWdw1MR6VARjux8ji1VPSLJgTjzOyHGTX61lS4AJslgJ9nso9wgQScQkPWZJ01Fh
         GMQsMBM2zP9vwLG6kSfXysSB5swrPqmE7zS97SIs9KPIHglQiYWD6iXf5GPtF2GnxJbz
         3uLg==
X-Forwarded-Encrypted: i=1; AKwUvBykXWMBYte7zMV7zItrzw5S1Dhto43XoXG+439nJo9Scpq4qIU+5UqxqRdK/l/8UrU11a0yr9wgwBuuj6A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdFZI950UFk9qtbxxGI6uOYjtflNJFgVVE9Va2gN/eQE1Skfk6
	qvaIKCyOHS/ubkFD4sCv2DO9Cmx1Xj5x0k7VQJMce2p86JtQHJGPyGMMh+TAANMCgOgTMOCctSY
	1Z+8tKckSnY5Js1DyYr5PNAp1AVSEkUmDnaxgkMWo24rJXhmQsVpGL+FowlWBaeBDGrs=
X-Gm-Gg: AYBFou1IK5yOOcmErY6TloJmAW8bab+l3Aa5H5SBGKLniEJEpINbuTtDv0Sk9rRToxQ
	qQHXpAdMZvfghztrtJQSAFYoG1g9oTuw1jpLH3Dnd1zrPGEvDLB42FLinwbHMY6BfndNrFB3WML
	a4hxD5Rtw0QZwkgdeKnisF6nA/okorS3bdtT7preWv1JM0Gy//2nVTpfkpdi+ILN4KRga9xCepx
	OlhdeaClSd+a9mmABL237yGBvg/0qHAX8EAbBnM2bsEa1qSgZenup3xy8PvG+v4Ye+UgODZn+5G
	FNGNBAxqpGJIT/4UcdwRvFhTq/Y2EqVorEtcANC2xVR3Y9C2nfJHnorUz6ZiLF+xXavTw4VLieA
	WS/nATGfR+1qxbs3Dqtp/4l2SWf4oQGCaZi/ednXvl4utnqgZB9k42PqOhwYJOmkVlPnbhx+8wm
	FfR4r+hQ0H1fx9
X-Received: by 2002:a05:620a:31a8:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-93f57f05947mr842711485a.16.1792665276331;
        Thu, 22 Oct 2026 03:34:36 -0700 (PDT)
X-Received: by 2002:a05:620a:31a8:b0:93f:3d2e:6bdc with SMTP id af79cd13be357-93f57f05947mr842707685a.16.1792665275869;
        Thu, 22 Oct 2026 03:34:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1227da6sm1020083e87.64.2026.10.22.03.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:34:34 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:34:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] arm64: dts: qcom: sm8450-hdk: add DisplayPort audio
 playback support
Message-ID: <aihlxadn6dtiskx6ge3li7h2ixmmio72zgipovlnllzjybilpl@wiwzt4dkw3gl>
References: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-0-8a189c71938c@linaro.org>
 <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
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
In-Reply-To: <20261022-topic-sm8x50-upstream-dp-altmode-playback-v1-1-8a189c71938c@linaro.org>
X-Proofpoint-GUID: D-LKMHgtVzjrxr8jzGF_QJgxcE4c8dxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX/d69Pz6F9jtn
 Rg0O76ktmhjwh5AhhRvYR+ih69Ef5fOIeQiwXwq8lq566KkvxYuCGUyqlxsTm29ueHs6onMtkCy
 +Ke3XUX844rKHm0ZNrt/lcpjVzQUcEzHLD8eDp2jMQCIq2feyfAgQEQaI95u+i5Y8DAskMjm+Sv
 Q0O5XohsoABva1GQ1WB5xSRWphJQjAM4SNuCKudOT62Q0NR5AfEKX3hFc4Sz8QReWbAbh3Z4Gd2
 ardofVUGagsY5dFWP6oX+bGxRrvh4pz+09dVckOCYXyqlYAal8RRoGMNw3dV8qrUiARErq16OOT
 BNWFdHD0dG74iow80sYBulWqPyWE59/BeItw/31A9A+6y4wr/EN7JFkAT03J9SQQgs+ZDzgrUrc
 pZ7V1GM0//4NOU5srsGN12Fw4k92P7G9UAEdrzEMZLMVCwP2/yVtaYXnpque6yEWeUMxmtarAjm
 XCT0l5tYNBUcYSaiZHg==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9e6bc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=DIY0J-lBf1P88TKvtt4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MiBTYWx0ZWRfX034d9QZYbbbC
 MRFMvJpAN0Ba1AThEb+v7mXz5YDc6kibkVJ+UOD6p0tNYdvNYn2u4NNWRq5OIoWdQM4tbnKksdm
 FYuG+Zzm8va3t0qocI0b9qrpL4FOjcs=
X-Proofpoint-ORIG-GUID: D-LKMHgtVzjrxr8jzGF_QJgxcE4c8dxg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220042

On Thu, Oct 22, 2026 at 11:36:21AM +0200, Neil Armstrong wrote:
> Add the DAI link needed to enable audio playback over the
> DisplayPort altmode output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
