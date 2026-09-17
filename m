Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A1F4ACC8C
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659017; cv=none; b=B0pVqUCNZoQF4lLcIw3y6rwRMAo7BUnobSJCb29umvYHL6pd97VsfD5ZoMLWTAQlE/zz1BYFhzXcaIbTG3zsc18i5Ng9JRFgynWbJ5QdoqUiqUOWt6+fS3epEhIuNQyiYZ356BI3Vw7Ts8Okqhv9EeaJ9sXUl6fQFNBjzvtMulM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659017; c=relaxed/simple;
	bh=EWDDxvLh/ajUORqgSDl2rZ8ViAb2Wg2kGEU9j2QUOOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TeUejHQuqgic0W+J/39jLU1DDPFghtdf9NyRC5FxK/+J2+UBJpAcFKtWR7g6PnPDhJ3TYDrpE27Po1EfTbpBUnzmEnvs24PyoiT6+ToQeKueHnGYJYQ6dx19hOXY96r297pLkyFp0/IYsU1rNFesnzZwcifE7p7UegGBAGAakxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDsyaP0e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ea9F55tI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDsyaP0e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ea9F55tI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj3dV2777137
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ri1E8u+BKFp8OWjyXvh+uMJ4
	co8edga6jii1ZtQDCCU=; b=PDsyaP0eFQq0gY9bRGD1dBPRKI+Mti6Fa6Mjx9P4
	/khZUBYJ0eBzHeRoEwoD2BIAv1R1UYKV0L0YH6aTLI9OE8jA57mYaHLv3jelQ66Q
	2vN1baVoBfaUxZfXQRxJ/MWfg9+zKIqYi32F18ewUXW3XhPsDW8hgyuXpm/npdUE
	eh0kwUF0zhAS1AO10UaJngpkjcqIA6sQmOMEqu1EZHf5tTw+UyGNX1M69T6FYH3D
	uwGIaJSJ0XTUBI2Zmu0T4rdQOuc6mYtXsJoD+KwwihlcaBfW0YWoUGIcpm7N5LLS
	pvypELLWoJjYJxxdP5Alw0GmTnYKP+QNFEMG4ZsO5NFlPg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m38qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:30:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ae8e7e546so182774285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659006; x=1790263806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=Ea9F55tIesHlvoZwdOmr+SZodboh4cbKKpOksrbN69tQOg8jFSoP0vo20d1j8dEfDr
         AdwnltMiab+9W06iichSbAsbFb2OpVrhFeMMNBS5bsBaTzyehd8NFXqsNDyHLRQkkl0V
         0zP7R2k3BLgNOK3usz0idjOZGtVhx4HPtcVkbuVtmQZk4wDIXSquzZFbDsyitxKy2tGU
         Vq2B9ma5tFnMqUIZKWlaa4ad66LoKEteV+Q6YRfT4ENmtUrFs1q7RwMmh+kiDRPFVEby
         9mTNttCOmxlqWcorKp8O7VG3G7G0oH9ylEPMo8HugHIFi9wGQUewiSRY1SBRGheAZJN3
         jMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659006; x=1790263806;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=0T/p9dXwCOAJqDb2VhO/4SV9oGMuyoIXTv75LuJD5hGEWafPYRZE1nElWnnGpzFMEf
         3crANSeomC7+j1mmRV2sD/SuibPvqzrheabrZte1xLNG0myQ4EloaLFYiiCAvLkscq09
         UcIXoevOLqR5kCbydey7SAhO5T9PgO0wvz1x03MXX0l0v7wbc+42K93mgJMicGYT9GuX
         PIi4WpSwvlSxk+XeYGJfRZ8Pov89jkEyBVLJTR9DRPGycOm+tKnJ+iaQRTvXTimEqYOS
         8u0VdVK1ha4irT5a62z38gQTWFA3EzYTQEIcK92yEqn5GUkW6oH2mOVqkQQ7u2JhbMZA
         TXUQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2YusVLfhhX3EoHSG01nAPOoTxUKdGmCZ3UKng/ZuH/JQQlp5Klfszdtp4dezA4JbkooBh/fYF36pup+g=@vger.kernel.org
X-Gm-Message-State: AFuF++narW+7yF7u/tE2Yu9WIJ71Xc7GQpvzj7iS430Bq7aVw2Rfdjy0
	ZcDTmXXSE8yvcu5g6H6umz/Y+2dur4+e7DEdjR3siuywlg53d3q7grvt6t8VP7PY3gbogPq393H
	FVXSfEGvFVONmKR6gkUCDydYuKZ2KfyCqofG9Skfq1wf3xJrUOfNugSmY9pINDLPAfm0=
X-Gm-Gg: AYBFou0sg3l+VLHmXOCDfC0OHUhhO++356ZU06xvLZbN69Z7RA84zHteQp3Cvfazwa0
	hKt5ETjFWtwMD0Iiwr9EhOf5E0ynJdNH2DCEFp7ZMUIJG7XQS1wUJ9MKYo8ZEZMqmW8DS6nOj7N
	SEQBk5SKWod2hHjS+dF0hpIjSwjuw4bTCUPOigEBDhdH10RVaz51WiGP5pqoV9d/ATBJQ182OgM
	yJ9H0w3MjDY0M2FX1IWg4tYN8Tj39LgR9Nfn0EoYRvfEwYdlkgYbj4+zFtGVJiJPGoHt1ScQy8r
	WWBXC9HSsM+Dyj/bOTKWtatWJ7k/fIrSsTUFruddTvyEHT8Jp787VEWEqB6anIiSLVUfGQhWvfJ
	6Bo+8z0VyBmEG2Q==
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288318585a.46.1789659006309;
        Thu, 17 Sep 2026 08:30:06 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288311585a.46.1789659005708;
        Thu, 17 Sep 2026 08:30:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm141129705e9.11.2026.09.17.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:30:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:30:02 +0300
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
Message-ID: <ok2efl2jwkpm4etywz2w256gozewohaznorhhb6b3zed5ktr6f@vvqtflnebftn>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aac077f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 7ddv-NXjr3PKeY9i6lkvgW5ckFC-7uDI
X-Proofpoint-ORIG-GUID: 7ddv-NXjr3PKeY9i6lkvgW5ckFC-7uDI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfXw/karjFTYo71
 /9xwbrUkTW/VV5EnTdt1rDV5Fm4XiMwDmT7yhW52H2Ri8aLpsMM5aSXlOuX90MphYcY/S9vU611
 aEwO91XfHtV1jdRbAH6Vw19qGQP5yx7HsIxdFIC97bAx9Wfn39y7TwnDtX9zM/v9wgyf8A9cPPT
 lVqQbgDGBMWSyhHiK1y9lEuYM9XJj0tfhacdXj2blBsnh+VPZ68BojRrHLfVZixiJwU+AuAErYd
 1bvw59C/umfiH/cSPNq1LjCvaTqcGPnJjDvJtmiUWK0i5wvBmj6hoHBmA8il5nrfDiDGA44szZE
 F+ldLlexI6jsYq3e4q0TIwKIBbfswW0S3YecPX4cOVqVt9hluBgbJBUFfV8psSsrT7fqXigeqpJ
 mTOe7SQXMxjozL1jTlw8ESp2mHf2/3tqVNhYj3ouM6Qjq96QiVBcicdl6Juzk2GDmO9U4AiVw8E
 wN57ZTBHgwA60fypFuw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX9gap8xGRjZaB
 bQPw64yXs2QiETtXJlEKCU9DuXLU1Ysyd693KtiK8s3kZA/aoJHhbsfBpKiMnEdHsRpmUcEC8T2
 HYNlvWmbszLSedQSPT1M22vbYIrPym0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170220

On 26-09-17 17:11:04, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
