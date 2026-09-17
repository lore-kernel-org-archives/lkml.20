Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CD64848AF
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659367; cv=none; b=sELUvDr+VwpDYgxV4ax2UR/zgZSPyalCbhP3FXhW8iwlKjwrUmi6gKDjoDVxuBrA9zeEdx7FgYqKB/woNWQ0Gs88a93pyhx97ATq8bVjas34FvE04q3S780bYmt9bvy7l12joPm5SCWQXnvryvksPuD+j/+B/W36ANT6gyTpBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659367; c=relaxed/simple;
	bh=+iHkduZZMvqiS4zbkORDMTsoPplFs+u6nA/atCreelc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZInROBgHzP80AWZu274CY1Y8A1RzMaiTaXZaH1r2Xp72e26EflvA9KBoQVcxhPJsp4DHu7lBALY9/qphaZG8Cx+CeuJdIU26wlUAzxCy2BsnlxEECYQExvOUbXAzX8ZPqbAS89bWdVeQ/WX4YO/+IqfizVi3KGKQYM3Tl5qNdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ786Q5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZG2k37V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ786Q5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZG2k37V"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDj6QB1175864
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1eUp/uF6ojAgjILcRmjqb2zT
	qv0dimYWlgVlrOGW+6Y=; b=kZ786Q5G695b/pL6vZ7QOnUdC/cWpDY84dzlRK4C
	FUGNKVqiM0lbwsNt9427tCsXZQoR/q5Avr46Al0s10NNEm9tquVT1Y/NioDzbUuO
	g2HKXoVUb/SQ/e/QYsd7fRRlZZ6oiD97RoQcnk6X8cCch/eowjjeC2KzzsnGcIIg
	WoMd0MRsaFDXa9kQWaoptXrmgKiuV3UWqi6C4giuhK0TvZ37g/MoUGIIZw0CPpRL
	Xtj9JfvZgdhleGDN3xIVg25j1ClI4GCb2rYvPiGhOlFnXnrTsd18d/BJvvdljntA
	2MsZiMnm8YKXXzHguEXtqAc243tdqyL07w6z2UTo98qsrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0t0pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:35:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0b66ecd9so120251485a.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659359; x=1790264159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1eUp/uF6ojAgjILcRmjqb2zTqv0dimYWlgVlrOGW+6Y=;
        b=IZG2k37Vm6c+y9JD/ofhZkzN1Ea3GamLtMOPvZTYZd55yALWBKtCM5G5CIU13e25OA
         hDKfcEf+lg03RvQoradrRHq0EQSLiKa6/xbxZ2nmRM8uTwe4/INkq0O0LFtQW3JXeKWn
         OWsaAtpEgF8wnLySNeWpsKqdtDZxU9RS5mwjb9YGqCRzkaiJTT7kaspAwjVQbGkVbJCt
         eNocUpnXKypurUj0KV/oAhy2wYRunJFeZdjfsvJKhIKEMrPu3lOS/XFk3qNM7jXEPKnh
         ySBFOp9MacgQ/LlhlDzqb5VgraGpE2WghMAer7aaWcFiM8DSHFCMKrhgIsQH4gDy44Xu
         lduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659359; x=1790264159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eUp/uF6ojAgjILcRmjqb2zTqv0dimYWlgVlrOGW+6Y=;
        b=APfoGKWudw95Oq7G0KX1e+5+t/Fms74kIsHAJLnPacj0FDwC/mrSWjE1pGq0vpA63t
         hUtYZ83l/iEqUg/Nq3m5QWSXlBv7+hGDPI1eN8Ezn0Ekp4ggPEs9mha5cJ6PuuxLcfuE
         B1bH22ad9mOvXq1ruYhSo6XexbTA5VKPBq0Xbko+HpEahW50U9a7tvSGVVSASLf+KsYT
         Zw/FmtB6tIutXmcQsrleNa1JbK8cfRQv+hGuPh9LC3FwZHG0XvgywuK3ZPV84XrB9tit
         VyLbywacZ/6j/g5/tWXv0lBaWLsj37V+sUjXKpcDuDlvtFKE/S0KWmF+KV9W4GuVRqIN
         gasQ==
X-Forwarded-Encrypted: i=1; AKwUvBxsS9kuJLt4+MjG1le463oigoQ9Pvc35A7T4dj/5DDevdPhxZVuLpehx6Ru+/Q3BzY21uPv3eoxEtjPm1A=@vger.kernel.org
X-Gm-Message-State: AFuF++k+cTUjkfTx+qNxGQTEB9TZUqMtHG/6jT/dNvsq0iAtKVMAsV6R
	q7qKu20jpm0JApmy1izDfUyQP+k5zrBl9tWoSRSleF62EI1DqcSKgg1z7eH8n7FhP6xH7hKRS2k
	wUBqiWHuEc06LDTcB/utGgSVexRDrxahDkjy0G9w8aFAkgahLxnsBUuVTHk1q4DJM8kA=
X-Gm-Gg: AYBFou36mo/rLcom3BtsES029cGtF6PM2lOAgGi78ImQZUkD3a7EIW7jtGSRzJV/9PF
	qYwbGyyq4v6XkM4PKwdYuX5HZshVmgq2s7CjQqBMRnqoBvhRdbplK2H/bFI1QFw3guL5DJavXvj
	za7Sl6Ft42/ucNgVy3moFk4jwNRKCqWtAYLL/dl9eAksnVxJB635vNytabNFjwUDN1vsAeOIYX5
	hs6iCXNXXBnPFVWMe/K6tFygSd023Vf1Z3QE+hr25eF3gYTT3+4tDZf04Oav5p+pCLWzAKVZkoA
	o+IHHMDYEy+dKmZf2dl4u1qE8jwBG6aIPi5N9QGupPD3ijHPlixWDKdnahcZIw4lhSxyRASSHk1
	GLNaAJ4k+a6jV4Q==
X-Received: by 2002:a05:620a:4725:b0:93b:d79a:c465 with SMTP id af79cd13be357-93bd85f0415mr78852085a.61.1789659359295;
        Thu, 17 Sep 2026 08:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93b:d79a:c465 with SMTP id af79cd13be357-93bd85f0415mr78847385a.61.1789659358745;
        Thu, 17 Sep 2026 08:35:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm134249535e9.10.2026.09.17.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:35:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:35:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
Message-ID: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: K6WKEX1H0aTDHf_ccXU1WdJqkm12a1uJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfX+YytNvC4Gqd6
 yOUJNZkX2SRg8YofHyhEZDfHPYaFqhtcWvE61DPEDAG9LNK4wK9Akvil1/MQ8zM2ngdseUBEbqa
 latczhgr4xDkUoS6+rHb8qE+DOZHWZM=
X-Proofpoint-GUID: K6WKEX1H0aTDHf_ccXU1WdJqkm12a1uJ
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aac08df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=mXbM7gEZnszqHwy1qK4A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfX0cqgHeh05QMO
 BKiTQ5Kz2ocMfcxmx8ltyTgMq9vjQ4pOiwN56VEQb6fvM5inHCgBu6UKvDdULQ6/WBkz/v067os
 CX92u4/M0MpzU8baUSEusQRxGYkCI44bapdCjcZLD7ueMLznWS5bORzMi5r5viZRBC3WEddVAm+
 lqUWx+c6OxUHyElUsegD/weSA6L7/X2tWGv3SvhON1vdkn3cQMZrIhJoLGG3OVkqKHQiOjYZKex
 hpYgcnXyKMq6w9zvFIYzd+wJ69BDKq8nszO5k2CjctiU+JiM+CEpL+68jVVE0qni4pR0L8qrivE
 guYWVzMATJf5Goe8BzRqsUeJlBRE4b77nKcZuRDxYlpPSP/eHD5p8x6dx7pDd9nSCXD17hnP+PM
 6NRTZfPm877/J3L6vTuBxuotdhn7jyrMBiHc3JMfDmFaKK2pvcczXvj/poaW5VP97ppAxoiYPEf
 MEAZ1/39QHlTg3E3bQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170221

On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.

Don't mention subsequent patches here, please.

That is not a good enough argument to disable it at SoC level.

