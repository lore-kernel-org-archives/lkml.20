Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6B23E4C99
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337845; cv=none; b=dxvRyhIqzEP6LVkBWz2PI0fxYjBRi3XEj2z6BSzdfZhgtx+zTKdaqqg44t464Yt3hOfAPPiXsR1EOgICg1RtJC4yXk7XwVXuhN1OHMHR6dfTl+9A4tOl1t8QKLYPJM3RYL2cmIkMyitykJpuAHJHYpNz4mN2JsDLNV0foqdbd84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337845; c=relaxed/simple;
	bh=tkMRAwynas0vtMmEmk69bfrUgLXT7NgugZ7PdKriSXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QllqnMqgsjeHjTZqEPmnR4R/5NwUVjp0eWs3ymuIPPrzhFEAlEV5bvF07dacpfZnHHzVDwemEDvFo4qta7u4qgTL8rUR2jm/noxVRQvbCoQ8lImvyPrFZ2xDND1FcDAaWJaNRGQNXWVC9tyfWKeFeT9PTcao7mhxdRhgihFelow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LICu/EhZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/iLbhjE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LICu/EhZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/iLbhjE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826Wa9h695566
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gNPfBF8VabNh4FXD7C4aFmUiC641VBjKV3b5yFILptU=; b=LICu/EhZU6y53ZF/
	jJXKK6Oayi2TWiH4oGlKIAJy9+sEghIgaP4jVcUoNLTAqgpn2IK4JkeuBEf2c0/e
	lcaPYmBoZrwXLL8HukNtXyxDljcLY2cS3hZTTp7XBJN9ZdO9019KPsrwj8GX6a9I
	gK4XNIeyLMR1cD80rdJfmzF819hmVJzLweHPNy6WrPpM2o3pKR5YMDcrJXU1sHZI
	cmALx2hGrBH6ugr1V0DxXDGodpfVadMHGTvTK8IlM9t3cMjlcc7bs/crZNoHtKmG
	V0KNqhjBb0dmxei3OGLph4IOeM+NF6q2FhrOQvH/h6xR8Q3YI1NiRq2eR+pCcaWf
	ww5RDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4geb56171k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:30:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9390890ae83so22515885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337842; x=1788942642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gNPfBF8VabNh4FXD7C4aFmUiC641VBjKV3b5yFILptU=;
        b=K/iLbhjE9GQYsS9n0dy3ddpupIZcVT/7Rfy4N5C8UIAu3eXBndeVN4xewd9osgWw29
         xzJUCRm7VhhOTVxcjLLVZyGVdLJ+nGkdymnh3DaWLa5HPj0+9nvVVnRdI2C00CFg6JxG
         IUKgCW9TnIDdbn63phi2vpKTSHH97R3ra2tCI5PLPdNWUs8Bcv97I107ZDxGkj7taMVd
         NPf4yhm9eVe8I8GYQ4/qGSrifnl1hwpyPfqL3WZ2OFQGaFgrbyM+2/bwbEqFxwwQUNac
         Xq+Hb68zYnyBFvCUWzeCfl6yDWHmat2gn8WBRsGMwVCXig40akE1Iuvs5Lq5eJVn2Q8I
         y4+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337842; x=1788942642;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNPfBF8VabNh4FXD7C4aFmUiC641VBjKV3b5yFILptU=;
        b=bRuJOFX1cPhLBWNqxGDo87lIYO0pmSZvTi7odwIs+z0dus2KMcIOnBPIuB4b3vNJ3U
         cmnZTloDkHSBhypKz1aXbZ8fIiAYoo24RYAhpJl9NEcXI5xfzlSdvZPKtcZS7JVdTypM
         y1jBzHNpbWEhJc9yhZIuGKMOa3ubKESDITa40JanuBXhLNffnT/D7kVMhxhBIiqeHRiv
         EMaPabCInyFkMJVfzh4eI97i2cEziYF9by9DdjJiI5EnO9+LQe2GHEeIgBc1xSBqDldi
         XOx+XPL07DBbRNqFX+PtYdL722pAZsUbVY5C7mTzWWGEzC7kVjrfDeblq9kQ8+8efUcL
         wDlg==
X-Forwarded-Encrypted: i=1; AHgh+RrggN5PSSaa9vu9NBfdCW9qUQGzQYg6DOTUSEZl+n19Y6UIa4Cf11enM6HyJwKxxl2ilb+0XENJ8j4TnH4=@vger.kernel.org
X-Gm-Message-State: AFuF++nDQXMjO9QvigBrDUFjxMr9HE+t66DSyiqvh6vXONCVrwLllV99
	DMr7O2t1/dni6Ml3uRSfNZNpHGkrN5EPAC5A2toYvFOYi8b3N9h4XFGw8MlH1YZWQ1A9wVFvdYI
	Z8b/J+ilqVsTomWcnPb2uXs/Zo28RBjNGG6AQIZqowHMW4PNkJwN6Wx2UdRAwu/FHPW+ypsRMxs
	A=
X-Gm-Gg: AR+sD13GddgUNOAVukKhOqSEydvjGJvUgVGZNKquGYRWv2d69HyoUFFbUvJtF1Arqxx
	TdtDToJ01uUoITcy0POrD05oYOX40NE512nxQFJeSfjhe8VXJCRmb1fr/wSh1EB/T8MBY1LpI8a
	Vq/BPgzdZnJ7iEXvqgvmna1Ti217UwalTC7DiRtD4YhFbS9OxGoL45SRU8od6D51uUAtlUtxqy8
	CDKidNJ7Daikn2dYmehITwezSaEfBKfQCKy0Lel2BV3SafiMBfhofVGmlh71ONpkb2eTne4AUM+
	KP0r2tyhmCCGD5Kui9PFViug74TWMGxQei8asORl14RrtPNZ8w2sBqC8cBEjgBW4LDRJ5vQgCkI
	vCX5XSObg+6dTuDiagqNQSg==
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr199844085a.4.1788337842226;
        Wed, 02 Sep 2026 01:30:42 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:939:216c:59dd with SMTP id af79cd13be357-939610194bbmr199840285a.4.1788337841661;
        Wed, 02 Sep 2026 01:30:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d039d2c2sm88944066b.32.2026.09.02.01.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:30:40 -0700 (PDT)
Message-ID: <bb5e86d2-2525-4abb-8ebf-75ba7780bbd5@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:30:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: eliza-cqs-evk: Add power and volume
 keys
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-dts-qcom-eliza-evk-add-volume-up-v1-1-0cee16886d43@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3NCBTYWx0ZWRfX1UnLNz54K0/7
 pWPZjeD9Xbp/tLlanJ/oe9ih7GiKH2jEBXRZccr4G0oXxCWzr3WOAUOg7s4Rx3fuOu42DkP+efK
 9P9o17WbdWlPvEsf+0W3WYCEra+rhoWUtvFSYy46y5iynypZN5AcBZei0tFHOGQPkbEV6nDk7Uy
 nLUHiI0jGq5UbkkG2v3Okpbvg1M0Fon/O5WCSKorYq6SdXTk+KNR9vS/pt1K3Ao2yAb8frQE6Np
 dCU65VfD/02nUg6CVCjqjbyR7Ym+34TS6tfERJ8TH0ibgToyi4Ip7EvN9TH/Q97UTbtqx6FIorr
 yse+UqwM1A8rxW9HRm+4vh4HabDW6cmLmrt0r3BUOclCdMMn/TfC2SIPnSA6auaKaqnn1XZdh2X
 RX5vJs2oTCthchGIyApy6/NOIW5Vm+sCSL7NoLADSD/sf1TAATDobXGkohMDnEcbAkBv/Dsoa+E
 7+4H/xil4jNgxVj29iQ==
X-Proofpoint-GUID: 6hadnp1szQ6eT0fwCsqHrC_GK41qMgf8
X-Authority-Analysis: v=2.4 cv=D8N37PRj c=1 sm=1 tr=0 ts=6a97deb2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tt4EhrpCxE_TwPcet0oA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 6hadnp1szQ6eT0fwCsqHrC_GK41qMgf8
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3NCBTYWx0ZWRfX2IMSWhCGb1n6
 gGyEqVBnZydhVchzWJBylzcG75leuznRfdxEuY/2V7ghhPzxURWozeCyX7jBv0y86u6knXWOMjU
 YhaOOML0rSeYbGvrzqzo4PICbxDl7Kw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020074

On 8/24/26 3:45 PM, Abel Vesa wrote:
> The Eliza CQS EVK has three tactile switches: SYS_ON, Volume Down,
> and Volume Up.
> 
> Enable the existing PMK8550 PON power and resin keys for SYS_ON and
> Volume Down. Describe Volume Up, which is connected to PM7550 GPIO6.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

Can this go to eliza-evk.dtsi instead?

Konrad
