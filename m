Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7242D382365
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250016; cv=pass; b=Ww34pCVAffSo8wveB+OdNRMsvPoQ24WBM6CRqLZfEus8CplW8ZWSLhf8j+yHxHBnXwX/itUeGaigWdSR23+0hsuvKxrtddU7oTqrxng/+eObT5SbElpEYi3WAtWNGFaxcvPmbUEs2B6vaD1RtCt+cNxkZ05MsCgbBFaGdLS5sBY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250016; c=relaxed/simple;
	bh=3mauDt/3krkR1odRMOOidZDtXzlE4qNU9pWDtPfeHE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mpLqZzxVkctngrfqjPIPIW7B2DsDsBXRWq7x6ubabDfdXPK8dA3NXO3t9tz1u71xQ6fUXTlYeASIVw2vpidqjnWfM8Kp8JXZfVyaIWkxQySSPrfVFs1hX35LIBs9otfZfXPBkDVB12k2h7aDvQ4vBCJVWGw3xKf4iOJ9jzI59yM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgBzkLz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L1Bl2kj2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgBzkLz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L1Bl2kj2"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Jxw1709548
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 08:06:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jDBl9H6dewCwJQNERd8Hsn6H
	z8VwyR9WYLsgYH0ezrA=; b=XgBzkLz3MlJoKyfrHtpS1De9Q4QNV2702ypZzShb
	qfVcVJNJIobk/+aupqNbdMcLvAMN8tZUvWLGHnEhXQonYP/jS4vzv2XEuKIX8Hnp
	cJ2+e1LbfRl94AqjpSAiQwKjt0wG8g8PGcxqJWNweDJpcdCFT6EcrCzVxxdDnaea
	6OevVZgo/OTELdPXyA4SSJ19IoTsj63sUDV10kQ6v/mKVT3/uq8kJTRWSnMnicqW
	FTBRPup5aVE72p6Rx8A10MtY5gl5OtArnFCusfiLWIe/n97WXncebuH3Y+kx99CK
	ee9msLtYQuh2Y9y/BO6NAHZDTt5SRb/1E7TZBpBqrk1MJQ==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fs5es-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:06:53 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66c767e23f6so5775985d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 01:06:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788250013; cv=none;
        d=google.com; s=arc-20260327;
        b=YO8FGTVaO5vZnupxhJ+jcJH7srv4gY1Tqs+MFlO0DXJ8UYaOXOD8/ZIWEJo/MYF9ae
         G73IL4Cewvh2hrLSQdpZCFBXZT6nIbDk0yBvtk8si3stCGP/dOyu2x44FxIPlO57n3fp
         f+vdbm3WAZKvK+2oTODlEeC16uDPeWMGhnzK27qdJZBQZan6bQMCt5uY7gjGWJjizMBg
         V8ViYh0JHHJN5ZUJBFVROFHixuYQvG1spwElctDW1c/u3esLW6CwkPFA1c154cwJgLjJ
         ncqpHZ749wTCTBR0TeBnVRmTpy66kB5MloLpSO+DUYBua+j2rPl/tboyi2kOJurspzGh
         jdCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        fh=8wA25L//kHGS+IXhmXpONiWWnfV7d0EtJqT99T2f6/k=;
        b=nGYi66paHPzUZyB+5KjTQ8RHfv9DiI/O9FE+UwRpXV6lvZi+r2nxYilZDtYOrIy9a/
         idr9W5PKgBMHVL/bbSOZEK8K2iVdKjtMvm+lMnshJzimAhovYwisFbFEZgLq15LiXzDH
         0QzryPV+tFOnzf6hweEsGxGKcClMUpFYp8ZeX8VK2kUN4LUPtWPYR25mHOI4btzbGUkX
         PF3CP40huT1hGm8q3dK1K4+AGbK579QItAw0ZuXvtpc8xKuyjHfh/rriBzsY+gaxgIz5
         kfynW7Pu6GoTm/BPB+eDA+pU4ooJzMXd1NQXpSDdtdxJgpIrJ20ngrz1VV0i0iHIP6ko
         sp+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250013; x=1788854813; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=L1Bl2kj2PK13wWk0O2t3TV0gsftswy5MmxvPrAXdSy2BhdS8ZHeHMJKB6MWUl2yHzh
         D0u+NtDCmxnrSZ3xke1JDq7Dryb4d7UG0BnexXOq16tys+WdtS5KSKKpTP92sdyIudTl
         4CkgUh6vn07PHMEYu0AVsZF1Ts3sZh6N5RAAq/v/tYxZxzmK06Yc1xRZxj2JGjaa1Rrs
         XHtDF3EHH/kPmO0ahCHPywuMiK1m8N7F6t+SUf1/HyMW7LPtyKCKFDuvweoebtMMb2Il
         zkRdlgvLww50XPF3HNUbGzTW4XHzB4xV6sZEgjWY1LerOhZ921b27C7iOu0BIlghk2YI
         Y0YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250013; x=1788854813;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=RvgpzAwJ+YGtr+MnWC2xqeY+cAAoiYi4FSs110LMBQ6L/37FJQxLj01KyYNaDriBz7
         0OEhFKPaQgIPgR9gzE3OcyfB0m7u6OPI6txwKaJ2WWKTDQPGUVxgtzdLgmF17pMvv8ub
         96NHaCufln4wNMBFeSbsDZ/7ys0kl9XRMBJ5dhOo1h2+ha+u6mxMn6QhIrufOU6ucjBo
         N+9yWPwjqoQbpKTlxTJhiNca5GTw1FM/9K+L77uoLB4uOalJu8okcSWykmAQ+VCrz1U+
         eS8jmNazjjjhhHid1vrmJRMHQ8ZZDukLJc9yQXF3+bFTwjw1HGLAkuYCRYzMAErL8fgo
         DFOw==
X-Forwarded-Encrypted: i=1; AKwUvBwBeXaH775TPI0wfJ7fr0Dxt9wL0q4ZYj45hfYfvpGLe3V185Go+sgQAuwa6CaQDz/hrVRCGXDuCgkvz/c=@vger.kernel.org
X-Gm-Message-State: AFuF++kQN62Lk2YjrAwvpIuh7CzqeHz5zszFPc7cva6SSxIpgChdEujD
	hiX9V23zmdInVPPW18K2OBLRAvZl6L5ZXPHr4x9rF4Qjrl9kybu1QAvdJ4qL56ZZYJlMYXFm8Up
	GyHrhRBvTIhL0+7XU9vnaljzEAsu28sCdVLGx2xKOPigQS4th+8jgi1qa+b3itGOv+KH41TME5H
	c9VCh/X0JRh/he5Vnyekj8cSE+oHwp1x4V11Z4u2skAQ==
X-Gm-Gg: AYBFou19mjCIaDTH0lK/PIrfkNL+D9YjU6QISWVtURpzEcQL397YgHswrrq5IzOLQOG
	ov/TEnZo4LDDA9lz0y9KwKkcwyQoRjPXC5+rf/UpzKVRbL4uk8bv0zXSghGExaCV5t+J1vLoU+2
	snApoRprHDRjEBrQhtIbElSdxXbPDeSCDIptJ1P8dsjFjfFb/PNKppWcC/BA==
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id 956f58d0204a3-66f87439adbmr2317495d50.16.1788250013395;
        Tue, 01 Sep 2026 01:06:53 -0700 (PDT)
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id
 956f58d0204a3-66f87439adbmr2317463d50.16.1788250011999; Tue, 01 Sep 2026
 01:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
In-Reply-To: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:36:40 +0530
X-Gm-Features: AcwNN1Vrra9J9RcWBYUJJ7qw5Bpw3Tp2UKjVq7_wLN77WCaIz4OfWXHftpcjZXg
Message-ID: <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: vFsFDxRrTWNUDuJamEgGrKHWMSF0DL4t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX5vd8B50cFpBg
 BbhhHXOhLl0znp9mHr0X62F/Vwb32rcNOO2S3Ox1i0B55QYqUR/GVbZrWHUaKptaASglBJVywIC
 p4ppH8yABE4nvJ74u+/y8fkAycnL0bU=
X-Proofpoint-ORIG-GUID: vFsFDxRrTWNUDuJamEgGrKHWMSF0DL4t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfXz/d/cz2hcKq4
 i5ns2oJOkJpVvWINns7kxrNpb+V3/Jevr0+52a7jQLG52YaDustS9q/E8hIdSsNgsxikloBKN4k
 9CGqaAJomKfkbSOZ8WXZ4N7BI754HYe79fU/dLd6qJTXDr0u5WJnHwWaqHk4fNZVLpijKsJ0yIC
 mXCpF5olGVPZZZFzQgg+FAbyr+iJ+uH6J6/PlawdQKUzXFzU68jRP4p1HZSDgncx627dWc7KAto
 ZLjHAugbp1dB+UxCjLadlqu4EL/9XY3R7oaMACO8uPswcnkATL64zpJpK+RA631CiGoxVcS4PMU
 VdZExeFdRF9LhidArw+E47F6qvt+uSxX1wSfilEl+erpZbKmPmJj2Fze66/unDq/rVaZVMEeCUC
 ZcNYpxjRcFS6rCqLEzns39iir63p+sZsVZxFcP43AwsAhccDQxtf7CBAk+JDaDH2L54BPPnpRBe
 uh6wrGyvb/vziEpLwjA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96879e cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=qe6_PsajVfZEHvrFN0gA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010071

> > +        qaif_cpu: audio-controller@a000000 {
> > +            compatible = "qcom,shikra-qaif-cpu";
>
> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> Usually DT binding filenames are aligned with the compatible string for clarity.
> Is there a reason for the naming mismatch?
The filename reflects the controller; the compatible is
variant-specific. This follows the same convention as
qcom,lpass-cpu.yaml.
>
> > +            reg = <0x0 0x0a000000 0x0 0x20000>;
> > +            interrupts = <0 331 4>;
>
> Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
> Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
Will update the example to use GIC_SPI and IRQ_TYPE_LEVEL_HIGH.
-Harendra
