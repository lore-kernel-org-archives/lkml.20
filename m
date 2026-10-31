Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483407;
	b=um0GZZ97dKGUA5FSrj3F2jFtowDGhLpxGQADa6/ydZnbijpKVsN7sRZJuDlMgRyg0TlK
	 e6Mxpivr25LoNhT37YZCphveS58PoCRM7GJGlETolbtJ0wmAvFzY6XDaYck51EuMRYU5O
	 OTs6mQjlN2RXhB/Yj9YqHlMI3xSY83ETmQtm4D8HD/rarhuJvek7nG/ut4dKjo7ff/tZw
	 qDTBW0NLggzsTBl27RL5WcquHJi2Yvo2ePg0u59sNyuBgR63GHWuUDdiB+uxY67xjfP88
	 qbdsN9cG5NCXIv+XMlEJEmIhjEswBlRNDuqnmpMMnL81K+IlgkLSTIC/SggqrHJBJPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483407;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
	b=TfczguzX0ecDOiNgIyc1U7+qPeeItRTAXReyixE8jqCgQfsD2ByTzjkxQzR377e7/dau
	 Oaz0QwmJS92mWEuwrwB/m/FCeAAb0o2fUvat9zeQwm+4M4xzu3FVbgUTm26/vqBG689UY
	 cL3pkvyMNE6YDmDQHn461Z2xGKPoeiVEdrL//DYsbv608xzfVmOb0AnUBko4MUPN9JRwU
	 P1cqWurWfyfxGJnviqRVTBGcHgErjdHTByDmFAyB8Zip/bpjBUglSav89FVoIxLpOeJ2w
	 pT+7Hd6tfMDGee05oZRNmn8B2KYkbI5HrDL6ZH/+gEXzwdMz/uOyOOkFatlZx+DM4Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZjYNNiC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE9b3j6F;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5E3606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:50:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5E3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZjYNNiC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kE9b3j6F
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJGMD31894860
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5CEYrl9haMjCN2sIMSQLbd9U
	GHWcTYC3p718awO/Bk8=; b=nZjYNNiCkssu1Ro9mj3WH3/3eFnJoJb0o9HszMMb
	TRWBC0ZDzXKevMibx/BZFuM2yjD7n3wwuIK8771Bd1h5kHW05cViQ9RrH316eCjW
	mA3zPP7KG3ZdaG6ebevmvZl1VtWzyK5yyNL6bW3L4A9l8TuTg9JP2k5kom1+t/kF
	iinJwfP1BGi1HG/ZoC4dOV8xMohSQ9PdPYDfZT5NEx7FhWBbW7w8LJqBL8bLSDRj
	oOzenK4Kzk+ugl2XqD4HtpIDo8FD8lHRL3UC80z7GW1VI+21u0tjp5hgbr6VNnG/
	I6PKxjNt9Th2ftFMiz7GJbkYnaMPc6d0jdLWgxX2nHBBHQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7t2xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 21:50:05 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c046843f1so52720776d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 14:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483405; x=1794088205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
        b=kE9b3j6F7rHcBPtP2oI1uoyCHAoWHPCE1g2ROUBzFrs+LES3htK9ipZcQbSV5/HNV5
         rLaWcuOc4Cn6DRyre0wfN8CzFVkgtChA0ttd7pts0mcanim3gtQg3QjcJGcVhKS7N/Dg
         cGjTGMB3cboC5JkC1MvOAGTEQykMEq8eVfsTrdJn77jr5NLhj10yRS+yl5wTA1H7iBkS
         L0NNpyddAZTh0BxsXZG7FfAoCSbtWb1lclRCRsZnbCkq2VxuNhiaSgg+3jBiBvXbjJ7q
         fzm7qflIHCCPKvdcJAhq//THLsSSRtDVe/Q95vhygCNZRblhYBVi3gT6f7+nbk2oDNmT
         mASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483405; x=1794088205;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CEYrl9haMjCN2sIMSQLbd9UGHWcTYC3p718awO/Bk8=;
        b=hd51i+HLYPspD6WxV2rV/cYGizs42es0c9gbbThjc+pJgnIbwB9XW5YYeBRIjTWU7Z
         saWabOfDXERmyJ1gCrtLVvxr6yz42fxGi9tVKUpq2PNnThbkYAJqhwhXlDebfOpUB+0w
         pvLODtgBF4mvMvqfka/yCEBNMnf6RdcKSj4l8qaLpp3Fn5+qgMLQYfrOgXrUNPT0Sbpd
         NbUOFOouIIwn4aJL4HZagVhQmkZ7xot+8M5rqh39/9d42hA3fvc4g3LOZCB5tSR6Us+t
         DMBMv4D/j931dZ21mJs3PGK+cEZ0G5j+It101vsPwDGUXr8t6GFeZR1HQWbe+t2JRC+M
         jaAg==
X-Forwarded-Encrypted: i=1; AKwUvBxxPWGFALUkWB1N+H7NcapJPi67DOG1gH5CZCwg1jvfknlZdT8kl9aRQjw+Xfsu8i3vJN44RQEuzCIIRUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyfXRbLZOChHrw5Leo00iVGBWFFpluJhczgvUmZz5hNOlGhbXs
	4bIBO5oReZGDatiPgON6tWnExzyM1SY9653tExJcixZSi+elkBS28zvemJAV88Id/DeC5t1qJOS
	4YADzXdFI8TtiD2EZaz9Ppdb/uaP9UhPu8qeQvPMZihdv/HttDZ7qcuAwJeHzsgVAkRc=
X-Gm-Gg: AYBFou3JD+eOZmLajKpkFG1zxOlj9qdCZyfkXpa9vIxglqR2jLaYAWDLHi/QepD+rD/
	oZ0OiUYAhAbxCWMSyH5hmpvYXvnN3F7oByKyQ448KOVvG6fSK47PXJp8rEZY9dd1NYQg/s918WI
	w09ZqWTCgXqhzvDg0T0lFuo6xFrzeIL3wMhPFYLjk9eLx/fTQiPpJSMMLu+DpQrPkypLwMbIGqc
	+AGBuzw6jsjtVah/DGI7ws5LjGlsFCxo9QuQ3IIoGcsFBaz55+vYsLM+V7pAC1/v/C83IwwnnSp
	iIdhsI960bI3AaPnYRIXzyGD/GX8lsIKJnCOba8CNtJjvpuOjUdHJV74r8YLx5oFPF01KDginL4
	zUp1YkiqUSAmZWOG/fcwjZ0JFMjY5YYpD492AaRjP1jisgy1nHx15pVUorqKybYsK+cgsoIQ001
	ThM27IAf5bmzGY6M623weD+ZUN+V7KWCVQqhU34H1zxe5qYjSgwk168OZkSNqhCw==
X-Received: by 2002:a05:6214:4302:b0:917:91bb:c63d with SMTP id 6a1803df08f44-91ca4b9e629mr106936466d6.38.1793483404834;
        Sat, 31 Oct 2026 14:50:04 -0700 (PDT)
X-Received: by 2002:a05:6214:4302:b0:917:91bb:c63d with SMTP id 6a1803df08f44-91ca4b9e629mr106936276d6.38.1793483404449;
        Sat, 31 Oct 2026 14:50:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbbef03d4sm13068941fa.21.2026.10.31.14.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:50:01 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:49:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/6] arm64: dts: qcom: milos-nothing-asteroids: Enable
 UFS
Message-ID: <h5psr53lgdjyypspsxhsbnaq4xwxefchr5w2us5cmllouhszyf@coule4xj547e>
References: <20261030-asteroids-dts-updates-v2-0-66a56c537749@pm.me>
 <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
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
In-Reply-To: <20261030-asteroids-dts-updates-v2-2-66a56c537749@pm.me>
X-Proofpoint-ORIG-GUID: 9SoDU-q0o0DNJDlU1lROi9qHVT0CQ9g5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfXyuZuAwn1f5vh
 Aymmn7ev47EOQ5uQ51nKNVQx/hYunF+etOQxRUJjzCkKOQ/UhUhJbSpTF2XTmXG2DUxPjwGMI8W
 oEFjdoLR8ri6A9EREqaCMRk3WRnZFFY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NyBTYWx0ZWRfX79R95h269BQl
 Q5SrhFjMIyGkgmoE1MxcOQOoKmMj/EmtvFmaJp+1x/vMZAfOkjiQg29os8ZcKHnDZe8O2qsGp2s
 +lBaRlFmhMDmYMdgRCgNw6yWf2yB0+yPEnk8cYa1IS32Qi/tiWWkS30KpTYWPQZ8NMIDvesXBJG
 9CoRR+mDxQtSvSg7+YoI2HUS2R8S975i2IErtvLun8Dhexra3CHik0/b+IYqejjLXGLMt15BMgy
 Nnwesx0YIELU86PIamlnhqoCCfKi3Z6ormusBgzPKb7aWTydIZsRglVnvcaSer7xDTLKniTDVKx
 g5v9Y/7Zru/XONixRHD9CfZid8PyMNWNBuC3Mb2htjcDRPWOnwXHBtr1+zG0vq7HGDRaLb03fcl
 peGXzzXNeyHRRaYGC4CEtwDprA75rMivfahNeik5zZzNLCLd+2Jhta7CjxdKWZJ8M4jjdfdck9d
 w4QHY7MT36oE0qGL9yw==
X-Proofpoint-GUID: 9SoDU-q0o0DNJDlU1lROi9qHVT0CQ9g5
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae6628d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=STFXn1ACf7ZPQ-DneOQA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310087

On Fri, Oct 30, 2026 at 10:41:33PM +0000, Alexander Koskovich wrote:
> Configure and enable the nodes for UFS, so that we can access the
> internal storage.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---
>  arch/arm64/boot/dts/qcom/milos-nothing-asteroids.dts | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
