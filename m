Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656815;
	b=Lbr1R6kEu3G62gz4higrD5bLeJ2HDAahPubQIQtXnCVw1i6zeK0xSUU0FOarfUyyzlI5
	 dQHJncCEnzTV1dbhaPQ135Yp71ki2V3yAVe8qAlo2GqI5P3u8n+L1TcY3baQ65JufTfpW
	 VazGKx/00QBGbc36PqT9vbleK4DWGhtTRZNZV9sqo+QneT8iyc1AeLkCCu5CapdePIYUC
	 p65FAfhkBCbviO8Sbt94NrcSIVfEjaTZFcj7/49+SDNHFMwXwbFBHkZW1H9IYfVXuf5gv
	 3/CtTpraVxwgHrBcYFns/jHPQWSFBF1G6yE7XNcBKA/2xoHVIPTHiVCAh/GiKMAjWbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656815;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
	b=4t7rcoz+9BVAk7eM4a5qdxrsUCQ3pSElOvkiJZ9B9ptHC9a6atcWGPpKRS1UqLTkocMg
	 BWhsHACx0Dk1EhDTjlVRYchr//MVqRG2EXFjj8EGAeDjX5fgSEpJiIKLcvDcxqL8MNyKh
	 wvsjNiI7XaBdyZrsECtXRg1B7HbZ2CfGes8lgd2sHphktrmLKmgYuxNAebTKfSNcUZOUE
	 cAxlE6bq3+E7r9+5S0k2vr9o0l85rdiaq8S9AGXqDE2OoTAZ/TiziyZEOUegGs2/A5Enc
	 Vj8F4k1MmgBfcXEfZZvhHzj9ZqkaX7NU8wNzh3s9fHUUXGEWM58PapLA87cp6oHNSgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE+TvT8Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CAD606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CAD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Os5qUXmI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EE+TvT8Z
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70VN82972406
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=; b=Os5qUXmIQbX3CzGJ
	FX1mxLp/kv1/u7jRnXp0HWIH6Ut24Traikrrr1Wvf5N/dydrT9MBF05BxfA6eQ0h
	fXRC6bC1bLHwGkT/z0Q6D/zCarbOttK/qmEEMmwz86q3YFE08QMvFQwbFCRrux5j
	izmxjzZntCi/J02ZPgKucRJ8mXPLESo+3gFuuHc85zZe6GhWxvxjJEZsjr34tXId
	/x6HpxgfaVbP7sEjE8Iswl42t7LEs1GLlD9CDrJQH1C827cvEZL5ce1vQ4fU5HEt
	+XSIf9q+uD4OhoTjnFMLzsiZuud2xEoZWBALdZFl24JCsgWzPBWgr/IlNzcQvYhb
	JImm3Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2nxpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:13:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5360b8cf8f5so4096121cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656813; x=1793261613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=EE+TvT8ZP6EKprN1mWdt0LJpE1dYUwjTDnVfLveq3pDGrKEDyC0XxmF2d7csWEtPxr
         XgPSKlYrnvFqzODXJsh4JhwMFjkjf2bskamh6hTPfo21eU0pU2lNGJ0hvm9BAFxoyIHV
         srOv7ACxwrvac69E2//+1yBLU+WyNDHo4MQUDEzgQayJVui0p3M/Uu5CBpsjHiDM3i0k
         lpIY/WAlhuFcSVx0APmr1tG6oKr54tyVZsuIApbvXrekv1DGZWho7vGKIU4DLyaUG/Jq
         Wh7kp4UhhqpRXO66luDx3WVKF+qI80CE/YiBFv2qd8cQY4H+tlL9octQyOpR8Txvcw1B
         RRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656813; x=1793261613;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNkHRZ5hfFDedWFqZKCKcGvHGWw/t1OJip/gAUhQAUM=;
        b=07o+eX+qVJSeK7Xl/r7li5ktUqYioEHupkBAPrrQmrrV081Y/M8J6kEHKXZCt0AM+r
         9ChP7N08A4sJ6t4Kab7BAiBLqBQdBeP8UscDrqjVcVYV8nNQLsYD5lrQ6HUn+dbh9sL3
         WDDxwz4ofb4VdBnByYnUt8XSBLkM3545VCsQRD2VGyVlJs7rmGS2ivBg6T61mr/z6/B0
         R7lQrwHXXcsCk55su6NtJKpv9PVI+fjIGi6RvRWwlAqS0mj+h463jNdJrCZSoGrh4c4r
         VcrszsHTZHlMG31L3KkZipqbBF3ABs+cWfqR8z0iHTQRZFmW6yW9LNlBQyicxFVNBPi6
         68Ig==
X-Forwarded-Encrypted: i=1; AKwUvBxOLrVc93yxDWPPzCIj3isrJQhEEPLoIyeieQW//iidcZ664I070HFuTCV7v61eMulSSBsryshgimpmxOw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL29bYSKYFHsU2nUy9Jx58yKnZvXDYzbPYqGrsjckXGs8rcY/Jx
	wjsH248T9IeXXbwIWW4XzhyfGKKm0ojqcCJ5wvWbFcrblX9qZvL8jRNhgwln/gYpva2fRJmL01P
	mJiIVpaGFigPgBQXutcGAvd//iYx9WGoZuhFI/L8wrhu078Af7h7miWmEn7Ud5J2LdXw=
X-Gm-Gg: AYBFou3ONIePW3jZyAWiZdIgqHsHPfgMEfUR6lrFJQK+Jtce3f7bEurygsM+5KlP7u4
	A0+NPu1EHxIV3AQFFhCsoXRjM9XVJt+AbNzlttIzqhGPtDrX8zBk5ubSfoX+PpfC84bplObd6pd
	BNZHIkuNxVSuu9X2yxAAKQkotbDMcelyMMbIgAIw9OJQlIsLP2W+QjhFL66g/HdQl26t1fB5CTX
	FwtWXyCIqihq9zho6rYnUo5vx2S+GSB8ORCEnsbvvkj49xHK15+Kl56JkXbFwvnNqC5BTw68JEE
	5RMwdy6GEJtZ12mtUfsFyu+3Y4xis50TTN0xtMzwqgMbfJhaB8HUZoxeVgZZhqHjpAbyZid7GPv
	7u6rVjTaVIXEmTMCgTstH2A==
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255581cf.4.1792656813205;
        Thu, 22 Oct 2026 01:13:33 -0700 (PDT)
X-Received: by 2002:ac8:59cc:0:b0:535:1a83:1251 with SMTP id d75a77b69052e-5369b7bec04mr85255271cf.4.1792656812768;
        Thu, 22 Oct 2026 01:13:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e6e33sm77669266b.75.2026.10.22.01.13.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:13:31 -0700 (PDT)
Message-ID: <f74579a1-11ca-4201-9bc2-369d5c2dc58b@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:13:29 +0200
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
Subject: Re: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
To: vishnu.saini@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
 <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX23mcZxb+Iq0Y
 NhNNIUmSKNX7xy9dhWYroff01v5ZmxOR2pU10jkpISPTdnZZpCHu4xrLOC9IhA3/BXCqV99Exyq
 iW1IEr7n+Wif0l//zF5H5na98JqeBfk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX8DrS8mmWgTlP
 PMjXsBDhzAAPpfYiJe6yoHIWG+HvnZ8SX1S4nAb1v2vGDDxJZC0dU2caz5DGdSL1a1X5niaiDZ0
 GSvaAZNg02l7ClytbPXRWyRdxA3P2mtv0b+geL4/HaWBurn7YhcaEFepRRZovYMEtpG6GbY0aLu
 GBMtxKK8ViVsfO0+aN5H+KuMeCimyZz7igRulb5yGkge3TeLQmMSJCQ9nPEly2B0YBInJP0WFVd
 sX+FBRF/10mVkPHyRqdfvIM+iEckII3d5RW6GYNvMUNFfhrO7va8LySpvMd8jgNrGyrZhqYeWsY
 7oHnxZc4W031qKH/bGN+rm2qY4fcET6u2X3SIwKh1No/tgUenO+dOabREq3K3GiYdC/RdJ9g3ek
 aYL7223ucCYNRPTZkxZyS/ibWduDkjFiHdiNQFcuH3PFqHn7INSOHyWBQL7j0rgCAcAGM6lgkOv
 xYqB+NRfjLam+TjDURQ==
X-Proofpoint-ORIG-GUID: XhUujC4rKykUy9Dz1URK7jmGz2IH_tv5
X-Proofpoint-GUID: XhUujC4rKykUy9Dz1URK7jmGz2IH_tv5
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad9c5ad cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=SyOgNX5fRjsOj9ann1gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 4:21 PM, vishnu.saini@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
> DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
> LT9611UXD is connected through I2C4, with reset and interrupt connected
> to tlmm GPIO76 and GPIO85.

[...]


> +&mdss_dsi0 {
> +	panel@0 {
> +		status = "disabled";
> +	};
> +};

Please refer to the panel by its label directly

Konrad
