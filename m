Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793167732;
	b=0gPU+gOKBkkCN9c5plik53JecRTdP7fFKD29GpZRYt9uAPFF8a0QcUZzJhfjiHp6XZXu
	 LlSgRD5oQikVkJlbJ6yrF+8ankKwhyKRlAZRv4PEVhJOa/uH0oP+Say4mAVTmZM5iN9PC
	 J9ks56wvvmVfuJNEBNxoxsFGEK/iMNhbJ1Cje/mFPprhWxoSIVk8ooZtiXfeGFOc1t97Z
	 kHD81yF3b0hPMEUdL5TGSyUhy46njhimRsRwPDOfevYLneFkxu+6Gh//W6v8uzB/S9DlO
	 2gpw82xH2M+F9OqhnnN2sM5+jx5VkrFBg8qkJLqJxinaPT+K+m+AboErujOvEVbXAfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793167732;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
	b=KCRLXNnAZgiUyCBvGhdeHNW4fG+DC1d8WXNe5k+8OD6UGtlad0pBOvFhpFXxiSGaZNCZ
	 9UiF8i9y7SsOdE0zcZnLCsqEGWwMPxl3tX4CBA/LO5mUL/zpTt7HF3Uab1lg3ia6L+JkW
	 6arjVjRcw1EBOu7qtfEPfzIrnPzalXC4Tpcwrgjz26aCp6mQUjXibnoPkKYdW9zUwOIzV
	 bVNU5gyXEmxX3ebFUzafLXJ/RPkI3ZadCG+kHJZzbsErsBXggv78XQqCn5rK/wg0BQVG5
	 dVAv2uJRE8sGGxA+NzQa+/kLYVCmCtcmZFaA2Ov1/75C4UZfh0VAkNEu9+OY7MReKhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMEiLgWU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B9B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:08:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B9B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cOuO7Gas;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GMEiLgWU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4Ph093209253
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uauo5EdXcDHHpx/dkq/cusNt
	5B6yHqZfuqoNAuipezU=; b=cOuO7GasIJQDmxJW6aX7tgMxZlEkZ1xq2eVbeLBB
	wxfIcm9jEyr2Qwv/wJ5bAxlJjEXvUhAN7x4Ub8wruvzLUq25a9jeDZaKoFadl3ur
	jaa7zXEpnUNFtDOweaskDDqvtMsGsB9AaWq9LHdo0tIjmfE3/s/yv/L1/kXextN7
	G8YUJS6lIRuMmi+LE9+ioRO1Ndo+hI2ewQShh1E7EtgtMk+ChlgHpdhj9P4F8Ku/
	b5+TMt04d9cDmpQ7yYrvb1ex1P0FUVWUIFzUtdy575jHFHScf2lZlIwU+Ja8jFd8
	IVt0JdtQh694kjn6feVAxQd/1lXQIzG7VSe3t75Azujpng==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9bqpa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:08:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ea63087d79so5389975ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793167730; x=1793772530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=GMEiLgWUVTzX2VJeEFMlscx4BH0YhGPJspTJvFKgB1tmzxqfdv2C8r1N29KqRzaWQs
         Js5e/+2J2c1BycTcOOr6hYbwgU8lli9129xe3mqRchuEK3l3VSPKuVlfAC2epJ396TIf
         BZTVK2szNZjZxA7Rrd5j4YAeZ2O1VcUpD/8BeCL/wc4vPtmu2ySSccPLXsmAJzkY90oW
         avzuLN89MhsE9qcN3Idq3p4xX9CGDVJboaPrnywXXAPQq5ng+Fawz2C1JwuBwmMuv/px
         VZ4EbvZIC9AJ2uKvBIRS/9Qq355KZ37YncmXVvCybzHhVBiu0b7JKXW7xBgJ0gZD5hxb
         q6Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793167730; x=1793772530;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uauo5EdXcDHHpx/dkq/cusNt5B6yHqZfuqoNAuipezU=;
        b=klAnGmiW2F/sbmkynzKejFdu2ZXbrA9rOjaSnNNeNA48uww4WbnpFHaXBF16RTjtGF
         lZwVVlM9FpSn5JmCupysWv0xbz3sy5CxJXwdkKfQxwHj235wsz09CgeOpjJdktfbHBU0
         3cXZt/oSMtYXyWLfaiFmzZqCwZXZUmIcJqo3CQsZg8mkFmyx69UiCnagd8E2oyg9agoN
         fJZVcBZ1tTu+CqinW9lo3minKS8qsyPlD57ITcLv0JX+LT+76wfu1786Xqsh6Ub1T4M2
         KOjAQg8lq3JsFwvel5/3XBxpy+s90BUPSkQOPWIjOnEVkDEkZ/Un057sfDUX6Pm0hmii
         8BiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxWOcyAkm7xiHrZWsnqGsSH2DgRkyq+emKbkYMvryQv52r62OyCLICawGqwOp0wYi8NthRtTjlnalNTTBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIX9fT/EAGMhwv0USmoG29k3I2Qy5pfKJLUmcPaXKyFKtl9bZyS
	kaMi8O5uOGQJgmtDMPTyZvMk+bPbsUoEhB3wgYG3hdWeIikmfVS+5I2QLM2yJ3ufR7XPa8wlT8z
	hEvCpTr7T6vgH9D5zpJk52nCY6NZywB929E0pGSeve9yX3I9I8Gs32/qh+kvfh7Y57BQ=
X-Gm-Gg: AYBFou3KMglrX6h51khpUc3FHLfCJPhpE3NMp0F/RsPHSMWOJ7kIo8o+gKehkmaPWtp
	E8yI5l9ieS4lJA8q3U5fjvAnefvWZ/+yXaLYykdQYQ7+TwfoCcZNnTItTdsefdCsZ+Uw+R9RsGZ
	4yGYvJ6aaDPu90kEIYpvz4Ih2vBSb5LBKiEQYXSeYxM2ZBaeWTGlESpVgM75vSPqSIHuYEH8xY3
	TF/44bP2EFVJ3tz2FfUUkQShtTMJGGZtTTgX0mCrJg6rKAK66WS0Nkq8j5/CNm9A+1DmTgF3+Jd
	CU6QEwtDpC7MUS++VrH7/4InGBX4K5qlkbxa7QS7i0K+7GtegbN5u4AzBu7KDIr/vOp4f7X6WKU
	Hz70rPI2bunbPMDmas5qXNbH0G30oMj0sU8jqcSJCNdQHQ8ZC1T/WNGZJhJeoJHDh42bn/PcM9/
	JHsKWe
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183335ad.31.1793167730203;
        Tue, 27 Oct 2026 23:08:50 -0700 (PDT)
X-Received: by 2002:a17:902:cec3:b0:2e9:6788:937b with SMTP id d9443c01a7336-2eb0054cbd6mr14183035ad.31.1793167729742;
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bdd5cesm17410795ad.30.2026.10.27.23.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 23:08:49 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:38:41 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
Message-ID: <auGRabyU1mLKsgNG@hu-anantiwa-hyd.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
 <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
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
In-Reply-To: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae19173 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=YnGuxi4p6G6sd6deudQA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Zuq5U9Kg4-ddsglVzOYoigcYA9cfJV5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfXzsS0SG4axnbn
 lN4uau/WAcQkr5LUSb9zgUmnFpXJFJFqwvid49R8jy0A3XPvV99W/wZ19+HG8SCQx1tV1ED2EBB
 4iTYatVlD1KQwqcPwOow38NRCZkikzdV5TQhHPPUUg107p4QTzkE1j1ZmpjVm36xheFwvlMlRCC
 9EnEw2l2vlXkqMeK8NP7ZUuehXdmc40pnsqAapD3ZQiGerQsLBLJnIltoJ2vx/eqAgrdq5xMN9R
 P0Hjnx9+hwMimzDZyipaw2EfdOy3HVu80JVQYRwbDyVyEpHDCo236cc+Z3WXmtDtTMXMYQJgDOC
 iAIaZFAK0vL5fUmS6z88js4UHnH0cnHrjS8E+aQ0NehdCH6uWWPu0bFBFWNVG/y3fLJuUOF0btY
 F9v2cHBwEmwshzEwEcNV5s5mMIq3Y3aJeJLvMyzypC8k5zfrvxs5xpxTyjAiFGaqOPWETL01rFx
 TNYTxyE3yv5M20/VGkA==
X-Proofpoint-GUID: Zuq5U9Kg4-ddsglVzOYoigcYA9cfJV5t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyNCBTYWx0ZWRfX9MdtPbajZQa9
 CnNhq6jSEzqoqm/WVx14kkWBX7MaREt4Fgri9DMO15j7x/uRubmqCKKDvJFAZLLP7oXijwnQ9Dz
 9gYdgt+wIZbtT+FNnv2x/Uind06fjx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280024

On Thu, Oct 22, 2026 at 10:04:58AM +0200, Konrad Dybcio wrote:
> On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> > From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > 
> > Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> > default on the Talos Lyra EVK base board DT, to provide HDMI output
> > on the DSI0_B2B connector on the carrier card.
> 
> [...]
> 
> > +	vreg_disp_3p3: regulator-disp-3p3 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "vreg_disp_3p3";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		pinctrl-0 = <&lcd_bias_en>;
> > +		pinctrl-names = "default";
> > +	};
> > +
> > +};
> 
> Stray \n above

we will handle this
 
> Otherwise looks good
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad
