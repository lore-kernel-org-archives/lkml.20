Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69659390223
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045497; cv=none; b=exr7rb6W4J6VrWDbJnuTQ4wh4SnLXYa4FQtC4lzf5aJrsIQFXMUUscZ80YM5Du72LyQlFLYeJtYIw2ySWU9da3zLFlYqbEr8eRN0L0azLFrciwbsAVRnchtdtanu87Whjw/7Eu4+SAoNWMEs2aQ8q6iDQCPyFflB/fjCH16pxeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045497; c=relaxed/simple;
	bh=k7WY88xtG/dMZrHKXCX+znIjVRIiI4rzbq+8jyS+OCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D83b6Kx7+jxbVfUsUiKyZyB169HOedE2qN19s9dzMvhbYUFAN1mPHA27FlfZeXMgWdeyzM6TjWNnXDuX+RhPV1vaAMnWtHvXjrKcQTWcBqlwmyxlwbEeqqqHVGGE3IjPNaLN5q5iE3WqE/wILOZo1wFaJuGbUk9exU8zlMnBTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mVR1/yhD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFypGFB+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mVR1/yhD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFypGFB+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M00GZl2824298
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dudJJoyUyotIf/gAM3eNUXI1
	9n6+S8WkBaQO92/4Yqg=; b=mVR1/yhD7zT0X6Z3YX1Qoz0IQ6sQdIzf8jNh43OV
	r3jHoTQuuF3CsMFTSVzULxzB/XOlEf640SvDQc89BffOQdYV+t2mX5QtWDcFbFGw
	31Hst+j4qePrJsZF/3D6nAI+mgbLYsS6W24zLa9wQzG+5M03SbnMPPyP4Du54/eJ
	QzNmOGDiizUyCmB+n/vZPDvOLv7Z9OdDLeWSKB13zBASsIberRYXQ/zqUpPhDPf6
	l3asoTH7ulsecJhQZ2kQezapcUrw7g5Qbj0FhAli2+4fcORAnl679k9HX1ZiUOHc
	v0xxUmA9U8u8ExfBPOxGl9Ktf2X3niIzF7BG1qS1lM1AUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3cskf79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:51:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94f086fedso53022235ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790045495; x=1790650295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dudJJoyUyotIf/gAM3eNUXI19n6+S8WkBaQO92/4Yqg=;
        b=kFypGFB+R5/tNjqUBvaxzuULs5LpJRklYWfZUnVFXwlTbOqgL26hjzhl5awnrQjOx4
         gUY4p5zPlE1AXqVzSwpvLJLI0+bKiglvo/jTZ4ulHQb7RW/lUGBQdTDiC1EpO+i7wnoH
         ra+8mkWHWRR6dTyanabaufMZHZiqhlGKW5MNnA1p1jCn/1pQ94EbkO38PnTewZJR1+0l
         VNYuBITYCIb5REv7udiNI6ylMdhFkrgqRvFhYA+X70l99fTY4Hblvwu30ZNuuT2WtTg3
         /GmS6jNSNmQKW5aGX13D4K/Q0EK+XmijV/jLHZwKFNPPfupt7coCs0JbTfOt6iovprxA
         fQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045495; x=1790650295;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dudJJoyUyotIf/gAM3eNUXI19n6+S8WkBaQO92/4Yqg=;
        b=mHeEP8rU8ledmvCMqrbVUzBLdcs3ET6hooh0q1qg5iWM8vWhnA+gReXT8EwLyv68YC
         BiyEE+Ccg9pH1UdfElnVtDGlzywQ43aPLaoc7daAwGxSAGY9vhvkcncEge0YSG0DG5Ev
         TUjCSsswtGbk4ewlHghqd4T8xRXp2z0ZfMrBSkGwAfCxcPwWmazrKbkuJjRlYa2W4vnQ
         IrfsWlvVwaru1hnfBqkzYLnKDTvKnRiRw2ayQWALMNCRbuZhfbzRwnNNZg59Hju4Puuz
         nDojXnspRjL3/FrvHmnFx4BRLJ4WoRvOWNmUAcZgbJFgDNMKLmJWCK/yRcCMfPOvZ7M7
         Togw==
X-Forwarded-Encrypted: i=1; AKwUvBzGc7A6gf0rFPVuiE53xtp5gQXERF/C18eLpQpw3AXqpc/qhUXJ9XEKx06AO2Fa9A5UkoucXQWpVdAub+4=@vger.kernel.org
X-Gm-Message-State: AFuF++ll+HMIToj2qPKxPxWNEz4tUOVtfoxqa6SuQ2SKGy4oewA9RfwF
	xPF0UIbytlK554Gqoongi3pPXxRnkRtOmnLDpVJMDGEiRgTvKue9t7VH3skvI7Oq3okj0lzcg85
	hM1POMz/ggQRzZZCiEc5uNvxIsbPAIL1+QfkMH0kmSqddYsjIfp08Gr1noPcVjd8CbLM=
X-Gm-Gg: AYBFou1Amr66xTFUVNaDI4Rz7ayeiQbrRzHJbNj4Kd8G7DW/36Vxe7f5HJ2UPIcpPJe
	p8CwVXHqN5A6x+SEMqle9cMUzb2r+A8zHVaDS8wd6pgn9cic6lXyqPxQ0ShTASDIy4zCNwHU57b
	glgHaGNJf4bUHCrUDY4JPYHkKzc8I6mfBjtRxu2MGoVD0/9XH2NYhOW2op0EADdWHYbUPZAecfe
	lD4/M58JbNjQWdokIbCPOcj/7lvz5FhMndpbwFQn+EvA5nfsX+W1jL7Xg90PyITBznSh2pd+4Y2
	melZ2Wtm8zmAfNe4ZwAFjLDRwQRcYnIpK9VJEXkODNngjKI0D9xLVmbf8VaUVaUQKV2BtV7UHtG
	g5SpNJvh72LNAP1ClRHzse9wragib/gGEcVfOuKkedA==
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr187471265ad.23.1790045495098;
        Mon, 21 Sep 2026 19:51:35 -0700 (PDT)
X-Received: by 2002:a17:902:d48e:b0:2dd:ad74:ac2e with SMTP id d9443c01a7336-2ddb1b9a0edmr187470785ad.23.1790045494503;
        Mon, 21 Sep 2026 19:51:34 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e61311f86sm1158375eec.23.2026.09.21.19.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:51:34 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:51:27 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: nord: add GPI DMA controller
 nodes
Message-ID: <arHtL8M9SL5WCX_q@QCOM-aGQu4IUr3Y>
References: <20260921-nord-gpi-dts-v2-0-4f297c983b94@oss.qualcomm.com>
 <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-nord-gpi-dts-v2-1-4f297c983b94@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX3Br45BkeVXZ8
 3R5gFK1+sT5vzilxgNFmo3vQXZ1xA1HhYZ9KBK3r+dv2lWfHNc2rNiY7/YruXn44D+rT5jrj4lM
 1yPDrodZ3llaXJJxfNq4jLUzJtO3gTU=
X-Proofpoint-GUID: V_WPbwgj86l-a0jICIPuu5y8GG7qVkkt
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab1ed37 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=svJ9ipqeD9EGsNKrb54A:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDAzNyBTYWx0ZWRfX4fiOkv4Eauex
 o8GwTR1UOzpVggqrdSo2xl7qf7QKZ+BfD2XfDDmQSdtqM33gjzpeZj3KwQx/QIY105qVff4axgd
 ljRB20jzWdQT+EEMRYtOowKFsiJSLrNmcrwmOdnZ9DiiOKuzKSvbuHBTqoHdxxHcXN1qGvCGKyD
 YXyr+3cIdOCalxHJTyUrc/Pc8pf0Pt9LiBzpFapA1E370D+8L7r1IE/r6kJWhAdgNEHEXJp32vo
 HH6U+BAxvMt+03xbZ7kFij5PPLGTd7UMKevRC8ilsSwDws8FUKaIuYtj4oMzKbQ9WVPUKBwrOy7
 b+hFH9Ql2ATdDYnB3TwHwK0U2knOWKjeCd2eO3jZl8o8FQVitvJNC7ICTvaOF6BGokD+srJkVuP
 oPl3JntFQrNGU0S4C4glTuvPc5sIMvLd+1KeWcot4/lzk91psQE8ZToQSS5NnRr2ncSgpkM2hfV
 /UEIhotlhINg1RTOiVw==
X-Proofpoint-ORIG-GUID: V_WPbwgj86l-a0jICIPuu5y8GG7qVkkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220037

On Mon, Sep 21, 2026 at 04:46:58PM +0200, Bartosz Golaszewski wrote:
> Add GPI DMA controller nodes for all three QUPv3 engines.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
