Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405973;
	b=EpllL9Sre9KdHOfss0AMn0TmecXrEMMPDaNsZCoYpDGCFtcnIaGmfwEQPvNauycVwKWj
	 aF0hlaCT2ha9ryHJyTP1ho/whNb0+0EMZAMlF7tZUvbwNMx1M+Dn8G0jlbMxlEL60Qt/u
	 /RcL17/Bjtgsw7db8FRUqnc6AYiOij4KhEE3QRchooifShtSSDkhFwSskr0RPOwvlC0X/
	 Iub8YGgxThh5l38gOt/XpfRz+kJMdmIjNElzMy8Qb/jdJxORW2Ock2wr7Co1j6o1r/dEP
	 Yidq4mLSMyMG3cIN1vN2bViqL33tiUsmvinxnJA3/Flojpk2ZZg8zU906zHndsP0uGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KXBhJCFqA5bIGvWFtXt6+Gu86y2tdB1JbBanpyQaxXM=;
	b=NDgtsLbVQdCKJVwy2U323nY+X9NoqVqLf9/Kid/HSV7Ob6KCJuuQ09w2XuoSdsaYdwjj
	 9kyKY75xxIDfsbT48eLGJeJtCLXEiU9SUOLBmO3r/OtZUMs97uCh5jjN8q9ymw2yDuouE
	 J0hxdVL1LOQj5PfLW5qwh05ZqbptmkP0qm98TESG7MdJD3MMbWOTYOsc8c9+LHRqiR8pR
	 TpFJOpu2+ORubSV1SJvBr7fJyALYg+2U64W1CPqhwSidtzCYlMWJSCc7htwy28wqc+ZGX
	 CEWpckB94J71luYd3ngvV4IE1IkBe8srfKLkJR5iIRrSPxLaEyl8e+H6/lPu6KaQptw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3Bdbnfa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsXpbN01;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC92D606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC92D606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3Bdbnfa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OsXpbN01
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZNFi3292404
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:06:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KXBhJCFqA5bIGvWFtXt6+Gu8
	6y2tdB1JbBanpyQaxXM=; b=k3BdbnfapFZUICnXw4zScnfcFSOPWBP3oRH1V+Dw
	eg2ahj90B9K7ySGaeK60xw8hqm92X3/AQ6W6/mwTuKiPLsgVVikoyWrlpr6xGWmQ
	L8+jlPtBHQFOWm9vFs/gQIltMeYtd01HYEPFCE8/qCFTVHB4sX790VzH2qer2XNS
	5f9YiSA4EKbVrxIw5WSGRWYqQDkZ4yyhTUlcgoC9CipCuXTf9XjqXRydX4TyQtYB
	ixkSGXijVhYT5Uf1I55xSIFZCfvWFWeyxjYQRIKUPYLqm6AV2xNlHW1Qhmfq8tGx
	WlLaGsi5227/L89FAhmHv5FGD5et1b60gIIFhLOs9KvIxw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2smp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:06:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ece45cb25bso980956e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794405971; x=1795010771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KXBhJCFqA5bIGvWFtXt6+Gu86y2tdB1JbBanpyQaxXM=;
        b=OsXpbN012QHt1MH+LJglpqx92wGQnAISfMnCfg5zkJqwth2RnmepxdUzarOyHpvZUC
         XZ9DSHIZCIqr5l+ymkf6A6OJ2IyVyKnWumtOQOCQtCwCp73ERZqoeICFtiUPbGe05WDr
         2GWn7mnjQGYNlnzOCxOpL9+jo05PJod680W0Tgmk1eii4RhY4G2ynrbbWgWvYdGH6Nsu
         4BRLqYMOHy7sk2kcYs7Dao406oa0bwZFeGjTkN9K3fsgSiwUr36blu2ROeHkGxxVOB6v
         3qRGOrzq8w/TJMKOu/1To3H3HOz8wQT7tiEdhrdRwcuZ0WFX9oz79i+Iq/qt2VaaKQrs
         R6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405971; x=1795010771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KXBhJCFqA5bIGvWFtXt6+Gu86y2tdB1JbBanpyQaxXM=;
        b=WGp1ZehCl2lOu5k1BhyhrpUcWdWmU+W4fWrpYUghe4rHJHYp+BT5gg1A9ijpX79cc3
         Mz1LNBiPiYbcnXK2BY7X8Kbc3MZVK6eNvshm6CZo1kXePDUfuOuKePJA0kGfYdK+HsRe
         xQ5Mq6yzXvLZMe2DKrsDNQAXZ47R5nPAZ5bAYeERsJEeEQ4nJw0mr545rsJUSege3lw0
         OOtZwQhmtCbJFPvk9diQyfCx10xcsvO/LE/KArNEmVyQ7+iesLUwlX9duQasyfDzajix
         6jTI6b7I0rdmv4ECkTQq5dtJ8zIsRW+XrdDdErxMWYYvfBZOTzN5DdCuJcimtq/HCoAn
         XjpA==
X-Forwarded-Encrypted: i=1; AL+hErHwIgH7L8hWd6comg+GQKST4DPlAXSwrEGYjZ1q4Fihb6cSRWhmSey5vVUO700LHtX8tWkXeFmUB5KmoCk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F3SWVFpq0LM+9VI1ByuWlMtWA6zbTD/Hfnzec0dCqxLceJpAZ
	H7sIYsPa3gyouI01QpmWGbrLyhagqUmscTJLGAf/Z5T8iaeIQA5mYwTuj8sKeQe3YDMIocZQXmU
	OBBdCqVaHOyXlTv+DgK3hgbbyl8ZF1M6/dOp6ekcyBlTmCukevxKdQE5CKt5PmI6F9SY=
X-Gm-Gg: AYBFou3/PTCeXzQU9hEZ08SeGjhg215g0n5ejsQvWbc2t836PTDld4JERCXoOD6QYXo
	ZwzfvuB7JhrzWKNeM+ZGwHodtfqWd3gE7jIDWYwQty6ILxMUiaedIoQtuvPSnjbfA1a0j4DOQSZ
	yRo+KKA1V/ebVemmYyziQVqor40BL6aZ/dpv4UX3J5RwXZdZeNziICFOZxRxEpFO5ORWIpsawwv
	cdV28AjdaZMa8tnwAMfcLsST8+s9dcfJYK/nedKvST7P0fUzGEn7tVEEtQ7jjFdb4tI1qzaswjf
	Cb4oJhsl6KykRzgy4garmoKIwcLCbPB2KdbK6EUFXXE5TzJawu6R+/BpVSslal6Pb5lHI+hnBV6
	sB0kP10fVRgT9fIQ4fIUvYd92Ek2KZfx9F9NRScMX4VtDdBX9qPRHiuszXXZxVr94SGTuRHYH6E
	5nIUVxSSAxhj6wNUAigXFsx3hu1lnzS53mQ2zchp1oQRUOn+jB3oDNgxD9h/tKag==
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr713181e0c.14.1794405970681;
        Wed, 11 Nov 2026 06:06:10 -0800 (PST)
X-Received: by 2002:a05:6122:8f89:b0:5c9:a60d:327a with SMTP id 71dfb90a1353d-5ee1c443198mr713132e0c.14.1794405970186;
        Wed, 11 Nov 2026 06:06:10 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c15776f2bbsm966580e87.0.2026.11.11.06.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:06:09 -0800 (PST)
Date: Wed, 11 Nov 2026 16:06:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: naidu nama <naidu.nama@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
Subject: Re: [PATCH v2 1/3] phy: qcom: qmp-combo: delay Type-C mux switch
 while DP PHY is initializing
Message-ID: <xby27hg6ajesijmdclu7f2sa2swv4ednmokka2pbn7uaufm3za@czdij7j2qcml>
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-2-naidu.nama@oss.qualcomm.com>
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
In-Reply-To: <20261111104434.2222182-2-naidu.nama@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX+df5H3zf1i+E
 eW38c+wytvzbvKlm57BP5Dzqjuq7Ws6zxgoZi0uOysDDzNkP5SHvNF7mlpAUg4PxawhT5vfScNz
 OX6U5imwHdEEmtR0QEFhLjHh+Sn8CdQ2akp4wNJ4ZDbHyJTbxq9GvHSNs7JEpdGfZZBBjwyWM+S
 iPI4yNm/8+Kd4h2oe/iNGvO1zPiwG8mBXthcvpbVp29E58AN/q1yM9Z2fL99UD8obnyrsbZat2i
 MvMuNTe1LBUSOOiU+2DDqMjZzhbMuaSNhXvOo3VrPVpwHoVkb7XMaBmCLuhDhfaL+mXaDyGJj2G
 NoagsZPKz3+EyZH7vJjPPXOrjkPjBJENGfrHrTtTpQyGa6ZH8K7G0oRuiO2S+0xphaqSk8auqhd
 tMwAiITkx5QjOC0lDw2/ZR15Zb07oVMbzRJxpNzm1eeQvQl7aPP4GRH0siEb8zMw3ZsIige2ukG
 wICx+1HdnhcbDx5aoZA==
X-Proofpoint-GUID: 2gH81894XBiGicH1rNGkAR_FV23OyhEH
X-Proofpoint-ORIG-GUID: 2gH81894XBiGicH1rNGkAR_FV23OyhEH
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af47653 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hTi17YcZWSOoB4cLaREA:9 a=CjuIK1q_8ugA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NiBTYWx0ZWRfX6nU9v0m75tCn
 vYSOsYvJ1VFv+mLOt/CxVjrxKh4qARJSN915he6jw1pNJxyiblU9KvKxV1v7thhC3uOLxmH/kYY
 VNy6Nl1FhhvCw2VfFz05OZQ/iWQGaos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110056

On Wed, Nov 11, 2026 at 04:13:53PM +0530, naidu nama wrote:
> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> 
> The Type-C mux switch guard only checked dp_powered_on, which is set in
> qmp_combo_dp_power_on(). However there is a race window between
> qmp_combo_dp_init() and qmp_combo_dp_power_on() during which dp_init_count
> is non-zero but dp_powered_on is still false. A Type-C orientation change
> arriving in this window would proceed with the mux switch while the DP PHY
> is mid-initialization, corrupting the PHY state.

How is going to be handled then?

> 
> Extend the guard to also block the mux switch when dp_init_count is
> non-zero, covering the full period from dp_init through dp_power_on.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>

Naidu, you are resending the other people patches, but the SoB is
missing.

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 61d8b7a5ce8f..3f93043f94e5 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -5163,7 +5163,8 @@ static int qmp_combo_typec_mux_set(struct typec_mux_dev *mux, struct typec_mux_s
>  		return 0;
>  	}
>  
> -	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
> +	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY &&
> +	    (qmp->dp_powered_on || qmp->dp_init_count)) {

Can dp_powered_on be dropped then?

>  		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
>  		return 0;
>  	}
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
