Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793625275;
	b=GjoFVjYy36OR6Ldz5z8RkHnvUSl4hwHfDQ+I2gzs7oV8NDtPTHK6ODYm7go5YjMW+TGo
	 b2oa2AJZ7/VNEWz++Axun341GGxoWL8xf1ksriGD+33IJ0yFlblYseolii+ygDtq5ygKr
	 XSzHP1hn6fd2ElGnpTj2PP1byrnSwfKbjUc3CVRVtxANHMqOlYAmbxFwxGv0Q+jZNTk7e
	 kCaEZHCoO+8m6StF8np5S4uOWo+i0h7sOHtnoJNMyZqBHOVql+HYo7YJ5xTqvQYlBHqqw
	 2YxQEGoSRtF/oN07rSTAb44u0Fy7U04qgIgZB4dH9mKNMq2rTP7xTJd5HwZDcL1aVRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793625275;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
	b=SI/mNr5/xQwsfincmtEsZaSmrtNIoUSpXI86339OBHHBy7HktgjixUJqJFOtnyz/IGQO
	 bVGRAWn0QNoTeZ9/g056imlGQR13XoZIUsPZ0SGGWAtskZXH0MyJfDUnfEt51dKBT1lij
	 t8tJDmFJS3f06yyp11TITVmD/gJJPUYvLJ3iwA/i7CVCAk4GFWw5KDTIfGc2glg3Q7EIz
	 gedvA/knS9qGPeJ/Dny+48cCmS8ecSgljllbdBKaeK6L6aFL5mGxWU57O7F2yheL8dghM
	 pS6t5Zk4QOBMe5z0NMaZETVGxvyRLYWYZZ3szIp/alOSF7zpkKalkdbEZpqDvqCgDRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MgzXnOOs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agnzEdPQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D93F606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D93F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MgzXnOOs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=agnzEdPQ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DALZ83944303
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 13:14:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqtLM2a2ytKYSIAtErO6FqAV
	i/KPJ3AWszNVgliwiz8=; b=MgzXnOOsvV4OwGyBIi1oroFTmcVswy2tnA84jEMK
	0vPTXjs3wezeQzuPwW7Tci/cpr6bBp4tV9ArEGb5BmzHWkTeZOfa+PelSfDhgXjU
	7uKMnCPMafq/aa9hgOM3Bi6d0IWg36toRiMTFg7Dau/XOrDT4vbwk9EJyRCris8C
	eKTQf0DrvFMkDuYKv5oWTnuei6xvjan+CUO/wTHTAu19B9YMDqBNGELVNKaxCSNY
	kB3Sg8ghJqYkrS4OCw1EodhpmGr1mS5iImh9cN1qiasKEu9V6IBcbpxqgCZ41O7U
	rEmAFHrQ/bgM0rbdg2aSvUb7WMx70YgpQhzsr1jMFJN29Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe983w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 13:14:33 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98f0cae5b9cso330596241.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 05:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793625272; x=1794230072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
        b=agnzEdPQvaDmVv86RMRQy10rqSWTRQmibhTTUUv29ER+mmLJnGcEDu8DZTMllJYllq
         FpjZWrBcvakp6eoLRbo1vyW5azB+2naiPXGX4yQesbL9Qpi6uEnea2e8yRBgzGt4h9iT
         8ghxZAwvFy3Ld3G51HVGbileMnrsfVI3yWjCGbao+aqBvSUMgJFhnV6qILah7t0bsONt
         JEB/k9ZUWuBhpaRfNWIHySapejvTLEznof8hm6UVmgLeKaXOnYWCi7EbLCBeOTOUXOuj
         vMW745X0LmNWixawdqcnNpJwBORaT7K6DwGYgGfUoIJ9aOx3gyV3kdAttdc7Jnr+bVAA
         uq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793625272; x=1794230072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqtLM2a2ytKYSIAtErO6FqAVi/KPJ3AWszNVgliwiz8=;
        b=cuKHVK3llYlLWYwmjk0VRr73fTqXgeKHM77Cq59DSZNgKuGx7LOpys6zwpNDD0tZHP
         n5TkI+hNmEdGgy5UfAE9sDKD9zP3a/1jMpfS/BYxjBxGP3KT2adEbQAsCXpXMlN9ik7d
         ODDh43Pu702O9YbF8eMAyyrxTAn+tqP5wbNtKB9slzZRz46amOqlUD3YCt5avZPaAQXE
         iOBltmMPzGqU4EqLrQFeo4pg2Tc0A4/sjmtXWToSqElvZojqfyDW0XUAfiE1NT2xyBdh
         saK/FGgD9py5EsB0vNVpE54o/CgoEr1qLKuoBBjslbvynRY0UA5NfYhAwLwODOcy8K9q
         c5GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmAdCRjTYi2uaKtwZ8sCWbshjRa8s64wE3Xy194chy5BIQpSpD233sgKwCYu6oP+v3fgzJDFvv2TZTryI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CaTnMzOiVKI2rjJTFh4Cd9JQHYF1Eaa+XYwd3dsFw7UbF1Vdr
	t+rOc2k6VLMOUYJPx43tyPYTPqPJKAk4CvtXMnK4W6NBtEw0mN0mESXBT/0ORgL3X21Gfh+Qg35
	QfTPL47iU3wibdpUr81ovAvINS/HvDqDlbixcxvulQyqQ+uAHfHAiVm70d4k1jtgbvJs=
X-Gm-Gg: AYBFou3oaCPilP/dejLb86uAVNo04kabCYMLZG1LJKkVCe5wcJyQfbnQxze4EiOle3X
	6QJU78n8+TJKyK3P46KoPthlKSooNq/oLXIdZFjiL7sFNpMGEQZNvJfd+KWRId/Ps+NE4giDoQk
	jVkA4ujMvLg4SpN3rhfk4WZmBT+GRrucQsBA+382j6Vd7dS/Akc9DE2HVXukmFsMXZYQ5UEHB5v
	n88faNY7+ma5GpfZSXJTBidgAmpLEkUvWrwcga/Vl6Wwr/pqYx3gBtpH4U6qq0m0PqWkR0NNFIg
	xg9sQ5hQS8vUxxNOXyc4nl6sH716Sjszs4FFRdJabmyyvXQMB+nny68NZPFaI7j4fArzvJkx38C
	jFv8wLv3wa30vWP1oQCWex3ZyhRq4ieIJEOglI6QZB7OlPUBT+1Tz9NJljwKFseo=
X-Received: by 2002:a05:6102:6c4:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d072552c25mr3482925137.8.1793625272290;
        Mon, 02 Nov 2026 05:14:32 -0800 (PST)
X-Received: by 2002:a05:6102:6c4:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d072552c25mr3482923137.8.1793625271709;
        Mon, 02 Nov 2026 05:14:31 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm19577646f8f.25.2026.11.02.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 05:14:31 -0800 (PST)
Date: Mon, 2 Nov 2026 15:14:29 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH RFC v4 5/7] arm64: dts: qcom: nord-ride-embedded: Add
 WCN7850 Bluetooth support
Message-ID: <vao2jrq2ftiyj3sz3jkwoyu5ec4vrnvflfmpjuiwor5fwxuix5@7kgukgpijjcq>
References: <20261031142433.1212809-1-shengchao.guo@oss.qualcomm.com>
 <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
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
In-Reply-To: <20261031142433.1212809-6-shengchao.guo@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae88cb9 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=63jK1YcbmW3W_hZ9q7UA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfXzXlcc9eJP12z
 dPG69o/UK9reEANwfr96oTPn3lcwYZRDAtKAN7k+GJ43rWvoJ0FSYQQN06jGr1Tmkrg3EjHa2k1
 vgipR2Nj90A1xJqtyXTvsd1hDB+irinG8G9tVw0QeBgvkC8kUy4Z4AFMj1xzKPhcu1rkTrzwmPM
 I983ErsaLDdKzPGOZ4Nb+bo6wlQD9oV6gtzCySEEG4CRpHGIX310Y61SC3G4TwKeoGiaxlAY3Ty
 +HI7RZeBYNDX4uEAD+M8ej56DfODOIxK2BJYGrTI7/PyuotHeN86q9mRxiJbspmd7/msU9MG2Wn
 qvyGx0tN6qabk+hWp9nHjMU/T1IBUC1JeXaUJlwRj0+uBmWjmSOqpKrJAEWwN1s0Z6cZ1e04BzP
 0KeKu5YB52AWonuIrqkasfY3vrnY+TGP2fSPycEDEqehITylFvXLc4DXCkN9M2JFsEixisUiGzh
 m0r69M/6gxuoI3EeIqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX69PrF4SRWAvV
 pzBthA7KpTC69uC+XA9BlKkGk/yz4DaBetiHOMY6pVMNUHGSQmASSgxl4iNxfIyCwm0V/9Ct5t4
 RWJwKyaQeVr4tjapqqKEeWwbeCcidTs=
X-Proofpoint-ORIG-GUID: b6TmWBrmepWenFk0SI8dRwUk7T3MuIo5
X-Proofpoint-GUID: b6TmWBrmepWenFk0SI8dRwUk7T3MuIo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 26-10-31 22:24:31, Shawn Guo wrote:
> From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> 
> The WCN7850 module on the connectivity adapter card exposes its HCI
> interface on UART17, and BT_EN is routed to pmau0102_e GPIO9.
> 
> Hook that GPIO up to the WCN7850 PMU, enable uart17 as serial1, and
> describe the Bluetooth controller consuming the PMU outputs.
> 
> Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
