Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6DF85013DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658920; cv=none; b=WG9hk6PgW9cWeG8e/i76aMa30hdqEsaKPFv59+tUNtZNqYbNB/sjxtST02rZQ4r6h3MBcjP59XelLeHSbGc3EmutX0OwHCVEQR1F9nMy3P0X+q04Mc+LTX1k36RHxTh/edyVjkZ0sH7htYeFu/4K8MvOBL/7/nq9COnvS9zldrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658920; c=relaxed/simple;
	bh=qwGaYA5J8cQoMsVQMVZn6rsA2VlKVu1tTczIgrpjkX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCCdAwkwWc8gPYy0VRWsPCZmWA5dF+8pTd7VoRdBqsyMKNYghd+QJ8eeb9qWvg6y6ZWHbjYCqO7NsIN5avP5EkPgoox7pBXmIoK621cd8Y7JXxSqm2ZNj3FnIcLSluMKv5Uvkwb3mohEMeCh/fVFQpoD0dkSdmmQokKn2W1U6C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SoDptICm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASzlukID; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SoDptICm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASzlukID"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDjdDE1307344
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/+Kdrxqgr+DvSDtGHpmdyPJ+
	B7JjcHm1WIvNra5tjA8=; b=SoDptICml04LDj+/Hm62uX9L2Hm9dE6SyQxVys8Q
	k7ktWMgoOV8o+O/EpE8Qp+cXlre8FEjO/SdNH3MwBzXNJGtMoIrI6g+s6U61AQ7T
	37sYmKtsXOOYyf+0vxHw4Zkx/DAXj2rgUksaIzaS8YDdQ1RYSuIz7WDHtg9tOZtp
	uQQBGFuVRb9ybhW9TsaznIgeGGrYljvpNc4FqhDc3R/2u5yOj0kHA8VoZEfelkFn
	aPm+6x/m22buDEGhOAbyBBsu7QHewNMActhvFlBDUN2LjS2ijS0PaB0uKAevdswT
	3p9MyAqJVqWMTrNpTIsXcFnVAALR1pKtR0bo7i2f76CM3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grcra9vwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:28:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso160038085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658901; x=1790263701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=ASzlukIDuxICcITl9iPYDV+3iYdUNDfD6gkUS5UNm09dMB0oKW4FQUuQXlVzfzoaAs
         8GSpjmCKTXVkNopmgvqh4ievCT03QT7L+ozm2IcaxZz7ms4FfUWG693BSA/GBSNlOevM
         CFzYLdpphC4X1fW8mAJsYpt3PCaNu3Dke0niWDDipfvFVRM8SaVgm8/1+YQpqZLXRg8E
         5P0F3b9GZnWn/GyP3x9tjdpCMxYuHikEw60C+O7nC6Gw4wtQWSvnKz/7AdYseAvfXExx
         Bb2TOg+32dpl/x7EhJS7d5C2dlDyv7FafrI6pjOIW40qNrB1/sIAj1YI4rLnhJXR5Kwz
         OoPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658901; x=1790263701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=KnAVEQRsW3rW+LS09mAA0yM7ZO6/DOeNyRz63RK65/Nw28bmR5Jk0jVT4Mi3AEikfD
         JuCIE1af/C6JBczdUBGlw/yHfNHOV8MnQz8AyVeUqE9lW85GfrvK+YJfGOgYS1WzKAK1
         7YARVJGQe2OVginRQtSZnPr1W+auSPiO6LJ6dOO3hMrmTazITzIRuHzdnAKoKtslHU5b
         gO/DW8QEQgixuCSMPGyVbpzdOuSFlvFpcY3aKahlwLnO2ScxDL7F+/ecWZG1uk4shq0O
         LYZfHc6ieKWy/AHwybDwvGKbsKCIz2gyzLKn9WJEZmqZpG7vC8UYvLjefDT9EhlYojrO
         ELdg==
X-Forwarded-Encrypted: i=1; AKwUvByTj8gyhe1Y1LH4wCyXRDTRGu9LwxZsjVDaVBF1S0m9nkb3uq5BWR9Pfe/nwpbcIgWlkYWt7BqhvY8vKsw=@vger.kernel.org
X-Gm-Message-State: AFuF++nLu3r2OZsocbo7JPlKLOurZABT1LOYAypvRfB1mtfVh+Ug1jsZ
	AK8m33WkGhnBcUiIQoGCy5+xjMgbXgBCf3U0Buzy17Buo5Qj2HMCSgiRvMq8yVotfA2AY4IXVfa
	Rak846YdLoFN61tYdoe8qgWsU1vctOjf/RfS1Zn5AjN/A9u1mUxonTqEF3OQWn9NmMGw=
X-Gm-Gg: AYBFou02Jxsg2BeRyfzeMWryoIHnityFVZGRUsnw6NwxVyJEQUuM+IDnix80DZkJ7lG
	bWYaShDobUVY21ZJw9bFnXYmfJqoLVygj1uueKhfHsxUK/x5O2x0536QCtRao0rH4iJZZzcyBay
	2Pok/Dmm/CbEPjuOPBFAb+I046izrkHij9gpWknysLCpwUdCiMZJTa+wP9dhWOBv7YBc3z2zsOx
	cxHUm+G4whB1U1hr3n0VoSWGmZUvAqSaHDddtLXoR1jzehX0YcByER+uJbveal8urvCf3ISrsX4
	9DEkmQ1+H/WSy66Yf2V08F+WeaxqwM7HMuS2YDHFSCt7ZgH4fxwPyXQ0v+EC3lD8ImaupAS8HTe
	S6a6twiWGKHVV0oM=
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300810985a.11.1789658900978;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300804985a.11.1789658900484;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm135817625e9.2.2026.09.17.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:28:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:28:16 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Message-ID: <o4tjzh6mufahuvhllyxse7p6vvbmbnw4mlqg5zrmgyqa6ated7@m6rmnyse42g4>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX2+3UT/6tF6+d
 zTbLpOxXxa3tbxD2GAmrT4D1FrqGUBT1W4ShcmBGuKRAKZiLkTf1TlJZmR4JsA2Y+p38uIl/OU1
 vVYrp1JO5Q1/hJZZGD+Ox2cNN/sstPM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX1THGWopg+Elw
 nb4bcZKlU/J+B6pxYod2E1LkjyqkG0DFs9+sxQucD850Wzdfls3CCV8kboL/9bpA4+w4PMifqRV
 OPaGYYoK+8HR1bIEdOEaikdOq9fVGQxenVi4AX7wFt6FYk9OqYdljytcFnSasWpmb/ScNblPK3p
 ds9I+pHj4vC95ECzWucsz3A0xoMfAHZjFXG3Eja29Y8H2DPrrKZhABa7qhuM/dQsa/pdWoaho5R
 Aw65Ey3tM19bdgrrCHnn8jNqgIBEQtQjSGxS0gTFtjnDHxx5iESL8yuM3kmaFtQr37CNpukMeUs
 mY53UsOsw8N45dwVETNLqNw3efO2Ak6wH0egJFJ0JuBnaab6B0k2/E1sIFij154Wbl1RtIKYMVw
 +Ye5F33X+cP3nMJjj+zD/7mQqZcSEt5YgeWyE7/HNJagMXOJP8KnK8IpsvKdfGmtaq33SScyeTe
 c4DvH4DaKtsvhJq+ZgA==
X-Authority-Analysis: v=2.4 cv=WL/qzXsR c=1 sm=1 tr=0 ts=6aac0716 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -6mYB2K7LdJL90wTM_EjQSK_TfNnGwY5
X-Proofpoint-ORIG-GUID: -6mYB2K7LdJL90wTM_EjQSK_TfNnGwY5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218

On 26-09-17 17:11:02, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
