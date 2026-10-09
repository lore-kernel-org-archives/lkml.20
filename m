Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D6447127E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532347; cv=none; b=V64F0zxiXbdh4C55bBfmxsoanB48qgAkxmyBMOzBtjWSRcvzi3tl9NFd46ukEmFmpMdkHQ3TThG3GiS2EeCMh28mdARuPLrlMtkH7j/5JIYXppwjb1aOHk87mn/cBbSuouuXOZFSZG2jSHu30DB+Gsf0iNTf0TB+uSE75jyFrD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532347; c=relaxed/simple;
	bh=kFdS6UjgyZ+sc5RdW9BqWyrb0+OVvxoQt9fazGBVrPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iMbL+ct74LDJjRTnLvT9shcohhR7gng49FhsJWPDvfcUUGFSlN8QsyOxksaL9TXEF605N1mpIEyKi7L7k/a3z8Tyoynmf1t5EgJiqhnjNtbfg92RYtPF3ct63k8b4U9jtRDxauBfjMv+qhmqSyBpMBdxQUpHvGdFrP+h+8nPw5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY6O6pkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H2Ho392a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UY6O6pkf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H2Ho392a"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HY253943485
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 07:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBvSfEAeglow5QvR1GvNQDQm
	2rjRQlHlmGnHZrTDfZQ=; b=UY6O6pkfp6oOYJPmunQih2TlVC8L6CiIP42BNa6i
	puhIvcuD5xX+pv+5QaIGSoV/gzMloKAvfcLdHuQc0Pdk2+5epDBnxTBDDrk4e8WS
	0iE+7qZphXf9+KlSWjgVY8YgVV3StbhXo0rHkShZjyh2FusofBGa1KLoMSVmnbEP
	jYXc+Lq+O8lnomumWzzgagbG2vnz/WLJpSnvoxundV5pL1J+tOl6MJGDWbZFtXFq
	cctfsBpQ3krFKJHlfriwh0WTvVHMMdmmDFD/AdBmdD70Hrobi4v6FfD01UrleVzl
	gEjbsIzohQhRM1nMA7avPHhM/lBM2k6ILAQixD91L/KKNg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxk2je6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:52:24 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so22100178c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791532344; x=1792137144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=H2Ho392acNyLfGhVtMWGXlKwkUYsAGTcW4GpvV2EKd9yYgOgnxb3t9o0Fub3qYC6k5
         mX1KeOoji7SlefuBpvfqvp+V3mO4LCjzIWGcVzxgHGict1OyZMb9vHs6PCYg1koZB0vy
         BCnX53hNCY/G3PBcEwFyYTHBi+u/uVs1YKq5pDCaKSRYCnBACnMdTKfua0SlNzX3qhRT
         MA8k/vZ5gkI0QzWuaI0IXn4ICfZZwwJ88LYsfz60KMtQcczEnUnjJE4iPYPOwXlkjIho
         px8MEFFG2D+W6AYqe0K6VoCCWSRAyrS2O8EbWHuVf8rZ8c2rKilc/Uh3wWiuaRd5qm5Q
         nYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532344; x=1792137144;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=kTBmlmsux/i50hOiOm3CFvIWNPZlHSmE+NEkDQ0lJ5DrKMpdSSFDQd6PV0TqCnsntt
         8XXE8u+wxHVou0qGgq+GnVKyAuxLuZ8mFLVdXcPVH8gTAADXbG+dk+IpfASME9mEAr9T
         02pduV9zelZIOfRQbeaWju3LzKkYUeHlEPN0ZoyLJvuGN2hBQMzLi2Hp7Bjw2z+jkX7y
         SAUIzRWEcYgIllzo0xXfLeDtu51duouVQfba5zZsE/htNcei/MMdL99uz0CXrBHJT0/d
         72fF55DbrijeXhik5eIHLbdVqvQDQzs8krbKt5aZIy3jBqR+2dKyE25H6hvpdXeFITHr
         x1sA==
X-Forwarded-Encrypted: i=1; AKwUvBwGQH0wD42A2kCAvoMldTT/rscyOv3ofk6QtSnEIUsg0+UqULzD8TkyxYePkZaVzwOeuy2Gzlmk+no0QfM=@vger.kernel.org
X-Gm-Message-State: AFuF++kv/dpB/T/bMpksvLgM1AqmLGkwDjLhdStsWr2aM8rc4B4oS90S
	1o0966wva1SESeLAQpaH7bNZnbmyEEAdomzoiGAydrAbjxmU3lgeY0+c3T7Q01f/nIxPUAZ63y7
	urAnrrkuYaK6ld+ZiXdu8NwL0fCX4YBIebc4neij+9qQ6kZL04mluTk23vKZ6ZpxUKvhkO7THHE
	o=
X-Gm-Gg: AYBFou3MsBKNPXlM63qE5Yahdnutdkol1Tr3NwBy8WC9ZSfen1s74uWHlhXV9OPaTY+
	FtmXdtMtOJSk6o1OsReHz7lvj1sNReeuFDFEBTMWx4UYfCD1xmCD0ZlXj6S6EAM3oK49jQrkVIk
	V8OYmhB3DJL9FGQPrAEPjcju7UsVD53slcy0Rx+6wDTJj5eKrc4SwZIJ383pyBTA4kbTCYUya0O
	Wl2Op/xpDyyskMQiL/dNh7kPKNvYwbzIW7Vy5ITltGax7zclM/UQKZ44QxJj+ihBilZ7961Jq8d
	NmAJ43Pqr64ybVCgCOhqwLhS4e/AhUQ34Aexf0YfyIl5FqUX0RAyUEbqgtqPG7M8ibVj31ePksE
	XXvU84I6auRJDHzhY0VS5V8905WsLm0T3CJNvU0sNow==
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379207c88.43.1791532343550;
        Fri, 09 Oct 2026 00:52:23 -0700 (PDT)
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379169c88.43.1791532342879;
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm4230189c88.4.2026.10.09.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:52:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Add Nord SoCCP
Message-ID: <asidMCpsXHY62FFT@QCOM-aGQu4IUr3Y>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKesTpae c=1 sm=1 tr=0 ts=6ac89d38 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HvrnEgK54qzgPO-vPg0A:9 a=CjuIK1q_8ugA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: OiPMjtx7a-MHKaeI3icH3rgS5K3uUWIu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX4f0aQ5bd1+NO
 CHAGlCy3MnPCdIUnVQnK8Ps4vkcYW6Yj5rpieExtmbGrxDrCLzCEutIhtkEB4wtTlTnLkz1GfcY
 BJdZw4LeX0Jht2TnQcDjc5OlPR1YURw=
X-Proofpoint-ORIG-GUID: OiPMjtx7a-MHKaeI3icH3rgS5K3uUWIu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX1RE4jGrw/xqL
 cHAPMsq1Tlratr3VjdrwmNfI2Rni8tRKY0qufjMIiUTzfM3HQFIMc16kAwmzpZnMpoXkT0nR946
 1kG5XupjTwh/z87uw43X6CB7xP5yDD84wOTuU00KKvwA7AqzXT5Op0v7EgQI9ISKcGCqYL44qor
 zGWz5dhWKEEYNUZk5ndP/vZb0uLf8SkMx6YY9t9mKqi73MSt0UGED3IdPuid0O9lc5Sq6y8QDSS
 c9Qx+jDAudJJEshbC+w9nJDn5p4S19clIqMmhHWx1fuyMotxMieP8xI+xS3pZ4QQ9S9wYpV6oH4
 gYqAQ9HDEG3R4a8oP+Dn1fJqkdikU57P+yXUzfdA+LDNHwvhP1CvvWeG4NE5MLfpn8Yasgoq8j+
 YOg4mNV5JuW2S46YtyBOzKvT48f7n7zUAUX4s4JPjr0Twwxsw37n+tyOxsXXOb0RVj9qiBsAJ7r
 O1gdJFhIpfDFLh6ax8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090031

On Fri, Oct 09, 2026 at 01:05:39PM +0530, Anurag Pateriya wrote:
> The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
> display and other use cases. It shares interrupts, SMP2P states, power
> domains, and clock with Kaanapali SoCCP, except that it ships firmware
> without a separate devicetree image, so it cannot use the Kaanapali
> compatible as fallback.
> 
> Add qcom,nord-soccp-pas as a standalone compatible with a single
> firmware-name/memory-region pair, while existing SoCs keep requiring two.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
