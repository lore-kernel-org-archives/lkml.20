Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655859;
	b=1M3h6EFuHFiicn616n/MIExigDYxcHVdWgSlunFAxv0wpGRKjRWlHaS89zIvybUDKykn
	 Zm8N92m6q3nBiuk2pE6hbs3tM/jr6hKQ00kYQnGffHEDjHQbvGMsghcWBmIzd8SwreMGY
	 wnmtmSxF+SDOfJX8de0N0G9bcIJbn6YX/aAbeN04DcIQCvRB9uRcclaBJ3qZtZQ4FLjDE
	 alFPyc+F1HKPAXLYQfBo0TFRsKZmIvr9aVEceflwLF2khVth+JM9ThTYVHIRX7i4m689U
	 KCyGSwEzUmAKYeriZB1mHFVwCoROSV91nve8bceMdseQzi6/lTTTzhnA6pqkOtHYqyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655859;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
	b=t+PXIHoFiNFrlMxUqaxiGAL31r3m75jyAuhVqAqNWG3lAqXIbCoMG5xEXjdXeIRn2MAp
	 pksj4a7vNb+SHW3geP4JmV4wF7TNE38Qz90UJXdHYerrs1ybV5mhaaFWFlGFjxqoBK073
	 qEKDBj6lF1jUdklyD+aftT+t3uXQNqAxi4YB9XiXB9Pem0YB9ZpVeBPbYGCWB9mWXklbS
	 3wrWjIXct3lfN5/NZb6s50RO+umIcOylg4UtVoHehJ2Wm2YRxmziNTQssk9fReBu5j1Ik
	 5Q01+Z3nwHkbkDBHcirVhalVS3vXjoV1ekFOHzGKWHELC+1MEWiEL9xwRQT1JubN4LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPanwcML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lhh1YjOn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC75D606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC75D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XPanwcML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lhh1YjOn
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xtDp2172038
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=; b=XPanwcMLU450Nny1
	O39Rxj7Mb+9DMrJ2NOgxIRdOPoAcjE/+Kt0py18B2SJ7+Jz1KwERJV/AEUlk9eqE
	1B/F1FiErLSJx2NY+0dUlwl383iEHHzpmXuCosLdH6xtOJSJlRPVjQt50/lwXiwy
	Byhn27ASflHSvBH4TNJso80dtGyW5P6QEEpI98DFny67Q/eW/re1bg8bT35GVYsc
	xAXEK0LTnxqSPBXC3BiY6usvA9Fdt1sXYwpVDEiGb9mLQK42rggISvvFxKPngCg9
	ciHC8B2IZNpa+8fgijztMhpIenzrd3wabyq9MBdP96D7+LVTiPsvyRGW5xC1PLlH
	V/8p3w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahapn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:57:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ea6b66e53so39222385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792655857; x=1793260657; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
        b=Lhh1YjOnTO9ZrF5YTTqwhlurBw6ktKR7VWjTcRDjGGSdL4mRRS7iLAtcJFdVDPELcw
         vxbq4/S50QuTeZeoe/WQsVXY1RLcdzdcdl7IjJ5crnvb3ALDJJBd72qDLKUHGPKStBw7
         K9ZW3FRiAVA/g8bcpPDkO/7/D+FcDF1hnyjj3+SESEa5r14vc9tXlZ6bGEAtDLPsN5e5
         Wh+TQxOrX1cmkHsY7KXAGV6y/Bsf912fpWcwT/gw6OWqWbbnSkcSR4ZJy4sRtc8xZ6gg
         equD74pr2A/M3LUlaIlaUsNQoPQaEY1y29TBL0kp3JqaubdJ1o8VK9QWfpP5DTzg5NYG
         q6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792655857; x=1793260657;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiRHATSxZ6+mFmcvV/MbdPQRjk/Cm9bkHuC9LdB6TE4=;
        b=fn5k8oVZEIZ7F/OCg/Bm2PBmpuWdHmkv7IAUHwZd3dWk6cRuliLjnDFaiAqrbt3lZU
         FBmIYGnRopGWZHq0XXQd8vq0vSLA+kvWPUDoC6BaFVcWojSU7KKpwV/LeWzPhUSwS2dT
         77W0DqDJyHoLsC6gIyWlOWwa0iNh89dPkWelAuTyZqv8yGu+4D3QMzustddO0w3ZAYie
         TuUo49BBEV6CAOuo255MYOxHFrVeRAl9atY28BHMHdm4wK0jDA3TOLBdtT/EXKRpywHj
         5uhq60+lQA9qnkMseSfZccfOygVZpUcPQIXJhu9i25BBrc7u6rVpQiOq5MRePhROX1aR
         C/NA==
X-Forwarded-Encrypted: i=1; AKwUvByHd5Umq5wi9KJkwKKyKlAfSulMMKYsO0q3xoRXB7RY3cr00m1aKTK+n0ymD812+tSRcaRIuLltOnaqrLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNXA+1028+ZVVY2S7Mh5pYsseFsbW7CDB61XzOxc8r51mWztSL
	9o5oh4JZtjQcLfpAmEzb7IQ74Mtu9BLwMQDBWTNhs5WVkwwjTz3q74ySxt0z88dV+F0lSUYl3g8
	F+v2L/docny9o2GpVyAaGjoqqVYFeKGsfnsx+TC73s3ypNNQYrJJPaDCS/MevYBvbhdw=
X-Gm-Gg: AYBFou1wpuHIG6VjDcdUVnCPIY70MVPnWQAqC36bBayiNDeg1XZfoCBaOjbB5wUxdFl
	3yyZ9XpycQkZKDtzgmv+ytHuwox+onIFCDOWK8jIHArMEBOMC0cpjQBhcKzo6oQ5ODLnytC1i0A
	w+Jfm3oBRd9rjP67kIdMig0j9Xms845m6w0rVaHUO0iLT0XyBZpfaW4684lL6nzUnCahSDjex7b
	Nqlz6Bw+yc5/fzE5TXu64vh60r97v6CYMYrMMDNW+ZOYPSI8esLfyi+ZluSZo9Mmw+ttmx3C1Bj
	B18YxnwsNUeURAFba8+BHeHobbUXGVvdhcil4dKqS54OsYW7ZxvTiXvqkHfWFu5l41bT+FBF6nW
	kC/0q1UlMe2Ei3SR81WvX1A==
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr930075085a.2.1792655856923;
        Thu, 22 Oct 2026 00:57:36 -0700 (PDT)
X-Received: by 2002:a05:620a:6084:b0:939:8148:1e3d with SMTP id af79cd13be357-93f57eecdc6mr930072685a.2.1792655856386;
        Thu, 22 Oct 2026 00:57:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4030dafd6sm1582801a12.7.2026.10.22.00.57.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:57:35 -0700 (PDT)
Message-ID: <8bd5b87d-b5e9-4594-b3eb-cca14b8b9667@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:57:32 +0200
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
Subject: Re: [PATCH v2 2/3] clk: qcom: camcc-sm8450: Retain flops across
 camera GDSC collapse
To: Sushmit Singh Rathore <sushmit718@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261020142157.1749-1-sushmit718@gmail.com>
 <20261020142157.1749-3-sushmit718@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020142157.1749-3-sushmit718@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6IcDsr-kuIw1wG1YPkTz4-gxtrxhFvQb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX7nnKy1JZJ6Q4
 veP6KNDc22unZX6YxYhb5BW+4ppvXTFp4Xg73q3UPZrouIFjy17uKansw88DpIE2vSrxVXyWx7o
 rQB4E49Y7UKrjqn/wclewxRsm1LqtVQ=
X-Proofpoint-ORIG-GUID: 6IcDsr-kuIw1wG1YPkTz4-gxtrxhFvQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMSBTYWx0ZWRfX15cz1g78zyv5
 YRaEfIh16wD85Ud11tNgbiYeXKv8+/wHM/WBw5RE+ghm4MxPVGTb1f8IEyYxvix93HhHfTh8u0t
 qesjV74dPXBk65NRtGB8jvm9gCzUcbt6WwhMfe2MYNAnjREwo7RsJizsb8LaPpTHsTZfkYBt1Hs
 nx+3M021mJrImwYgS0TpyeAPY7WZtgUOGd/EDE/h74P5VyDY0tSzAkIblG5jFUiNZNB7XK2fK5p
 uOax8M3r9+xBC0BR4EumeWDtjNgw0GSk1WNR4uoWiQm/2o4Ajw7s6Z7r4kuPS41/qcW0SZZXHAR
 12f5pCr/VPEJFP8aDYE2Zs6C+thFTPpiTZ4ewfQpnbRfUrzvuSpD9vKvam40R8Q4H0oshoyNffn
 9bi0r6s7b9+6yoaBflaFLbQJSeZAfGarMALND5fZpuk9/jliQLNG44ObPbSgM1pynP5Jg3V3oKE
 aMsUW5bvA0FKrUG17VQ==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9c1f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=UF2wGm-gxhqBw71OckEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220031

On 10/20/26 4:21 PM, Sushmit Singh Rathore wrote:
> The camera GDSCs are collapsed between camera sessions. Without flop
> retention and with the default clock-disable wait, the IFE GDSC can
> stay stuck off when it is powered up for the next session.
> 
> Program the same wait values and set RETAIN_FF_ENABLE as camcc-sm8550
> and the downstream camera clock controller driver do for these GDSCs.
> 
> Tested on the Nothing Phone (2) (SM8475) by running repeated camera
> sessions.
> 
> Fixes: 6082037fe62e ("clk: qcom: add camera clock controller driver for SM8450 SoC")
> Assisted-by: LLM
> Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
