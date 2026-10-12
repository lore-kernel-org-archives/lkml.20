Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B13379EF9
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787073; cv=none; b=u8UnZ2Zun7FPUEMlnIVHjWfrI2c6eVT3nohuqyt08K3ligyG/0Mec03YIcuL9e3kxZeBIVmrb87+Spj1QwHp4Dizx9QmaSfIAGkelk13f/D1ltSwltI7ke4nHjL5LSIvBTjIpdq2xBcezoECvsS8tZAl43gLGPvWuAtiR9XmRmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787073; c=relaxed/simple;
	bh=73XcjV9bXO4RPERKoq87ZwIqnfQP4Ht816lp6dRQ2RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BV8pyPrkvyHGDL5YKXUcT0Z0UM4Rp6AFw3IAl08gjTvdcT7SNZ2kMNNJAHu5DFwXrcdPVFpnI8Q8d7RboFXESu0VZA3wePqNzC0+WTDqoL9nu+Y8hiY6FCxSXKkx2WBW7CJL3ajD2Xo+MrFufO6YoX74LWXIwCVP8kCjTaaT4xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+0vi4R6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIM2tLky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+0vi4R6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIM2tLky"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56Cl41340469
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qzD2ofBbH48sX7SGVfDMPXA7
	lQQucAWBhVFrsmWjP0I=; b=L+0vi4R6Fud73p4TkzI+lHBHxUCIGO5Coal5J0C3
	95KBmUaDxvcatOEQNmUU5VGC0ZqlvA2Z3uKYX/9vWzo7sQmKH1dW0lN553xOtS7Z
	r7Gly3K0SalD0CPfBnqLrFqjhFEpyeQIqws4ZgfdW2fzJIcb6agbWYvA9bRXHzNK
	N4L2U0mo8HUO59u05JLtCmkmiMzzZXrCYSNpr/G3a7Mo+wtj0guZJ0awpOS7oMnP
	xFdSq8O1u/ZYO9RcmNcnyekHUcVhuuZfNMVBiOGWBYewbGQL3a7EkhGerwT0duWX
	fDQGk549s8aHx6MhwViQNMigvmXVHbBkmtVSQ9KpJvYx+A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk255wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:37:49 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89a4e8287b0so128375b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787069; x=1792391869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qzD2ofBbH48sX7SGVfDMPXA7lQQucAWBhVFrsmWjP0I=;
        b=jIM2tLkyZNg+m9/3JnWwNgcGEmKQxDR6MBcLdBMBiAOl8qIqS00XhPhT21+rQeRaRn
         Mz5gIpxmdGZZwUpVi/sRwsiv38PV26pmC1wBwVjBIkPB0XOyYEkfYE7vBwoQwrwGsXtf
         0R4DoAh6tQ81/lTdOd5Jgr3D3u1yl7ZtjdMhtXCBV18oY3vZfth/kg9fKVzZ+7H5aVwA
         ere7V4pyTTMQEh3zKC7T7UBOjh1A0nNs9qOETJAesvSHsAAdhOUV+2n3eabIRE9rI9/8
         p0K1s6Ye2+nuU2NnrdKXpfQeDJYfaE0E8zpNiUQjW1nnrgWVeP9zBPTQD9vb27cGa+zJ
         CZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787069; x=1792391869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzD2ofBbH48sX7SGVfDMPXA7lQQucAWBhVFrsmWjP0I=;
        b=jHFYgq3qGJDgqU4wL56vvYCRah/mWILyU3EZ5qQHDp35bVxnBEWWOw8yj+k9JW2Jr8
         iWf/cxRi7W6wyVMAiZQw1ALrjlf818DwjrzdmL1FmsqctDGUj/9AtDNQK7HJ0zV86V22
         t6BtWr5a9JVy4bgiOuXu10cipDGDubxJVNJgfwRqszM9ozkPVLRY3Xon41KANhBqv6rH
         NgDgtRgtpH2pCl6zhLzuDvh6i/wt/8XacGAlxM/BD7c6ziHLC76pWr+DCMAQ7WteUnu1
         chJWkeU4BWqKzR/3KQTgSeR26D+FR3GetPTQh245Wr/iJd+0Qf9q33LEpNdx7r4wz/ej
         VqUw==
X-Forwarded-Encrypted: i=1; AKwUvBxB1w3oZVEwxQp/anpajX+PX1lnO2vvkKwkoUOKxUEu/lzm6aDHAImBqTAFo/cF/17dqjWDOeMJLAUsw0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKAcDtrYws6HLCi96WJAMiRjeTumLXf+u/ucWJuZ1kviihSTvGH
	yOX8WTHrLmBWGp4dB/r5z/IbSJHFAFWVzEa1d68ih9y7U751b03yLO+xrjTR1ReWaBItjSbIbyH
	Xv/au50hQ1ttdPCZuGYkXJrQdvEnhFfVk0DVOlpdEYOi9fS5G8Z7V+9hK2+O9ao5E9/I=
X-Gm-Gg: AYBFou3l3R+3Lu2evYvq/X4j9j4COPT3USen4WRTdoHfrOfhjq9C2C7zY85sAYcH3yS
	YtSGguoekEpk44701eAqo6HA/LmuKq+2t7VCPq8Lv/s2677iDcmL0OpAPrlQDjGdfhlA0TRpEPd
	egd8I7dPh+zvycUqQcibTLQcde3JoAj/HcqLwjO9GhUw7V/1j0heGBj5R9j1h1gP4mGzmVFVBSj
	enUmJim/32oS3R/MqiMxo94QAosL/VjB/owpN9uNWLoRaZBQWIYKdaUf+sw435cV5JBs6ipd+CO
	K2D0C9/RVJY9PTsvjDYKo4BPx3tgFmgrh56Zzel0DJA5qWgQEz1RHpOXHtkgEoxRPhWXThnJODy
	BqdH7FBbki7t/dXQWfYN7mMGq1Mk+rNhgoO2Fa9c2AQ==
X-Received: by 2002:a05:6a00:3c93:b0:874:705d:f64a with SMTP id d2e1a72fcca58-897c7ad8986mr6262610b3a.44.1791787069053;
        Sun, 11 Oct 2026 23:37:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c93:b0:874:705d:f64a with SMTP id d2e1a72fcca58-897c7ad8986mr6262595b3a.44.1791787068518;
        Sun, 11 Oct 2026 23:37:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ccc67asm3738084b3a.32.2026.10.11.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:37:48 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:37:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
Message-ID: <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
 <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
 <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 5GEy1L3jC6tndsqTk7u1gRLs5lDcgsIM
X-Proofpoint-GUID: 5GEy1L3jC6tndsqTk7u1gRLs5lDcgsIM
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc803d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=v2e4zakv3qIv4HXwh4oA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX2HoQdtnwzK5G
 BD0D6y21U2XtQEl1ohaBwPmdEIWRYyH6SoALGD6bqD2+iR+UPoQZ0SfMmbHXCmg9P7d0vbazU7C
 f/2PYJNRv/iP0ersh6F8wizmA4MYb86rIsrsohHlQdk+yYdGGD4GLY/joWGjnFFuw7dmHhBrNvP
 6NFvL/6ybSgjsO7W7IHmfUO4ctdHtGzWjbjk7XM2geamCyxmhZUGBpm5+ZXsNGp9G3fcIgK5d7t
 X+DOe0vWkWAFG3Zjk9zI0eXSoPovJw+iJfBWJhfmGvvjfq0Zjq1KCK8AxwEHGeP5lxCG3op61dd
 15ho6v2UfGkPtLzkCu5vkkO24VEdKcU44JzqslpeXWi2/97cORfgXciNz9gT2auT24afvM2JpY8
 Kgmq8i4afbdep4Ax/r1tOJ+AOVgAnno/QCI9gUGEFcznDiWN8v+oR0B8XvPPeCYWeemAmJNEG2K
 jh6zKCERGn+E0tIjU2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX5GmbaPY+Ggd3
 2jsZL4DhYjvkHRvnAhDMKriJV1SPEkrnuf4gQRORpSYl9tmb/nKJLjQB0RHumZrbftmC6IoEn7g
 Oq2gDNHfxIQ0BDSaAwYYhMyPBnl+pNw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

On Mon, Oct 12, 2026 at 10:52:34AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/10/2026 8:04 AM, Shawn Guo wrote:
> > On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
> >> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>
> >> Nord has four PCIe controllers backed by a single quadfurcated Gen5
> >> QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
> >> can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
> >> topology in effect is selected by firmware through the TCSR link-config
> >> mode register, which the PHY driver reads at probe time.  Describe the
> >> x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
> >> configuration the boards ship with.
> >>
> >> Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
> >> with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
> >> and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
> >> also become available now, so hook them up as GCC parents in place of
> >> the <0> placeholders.
> >>
> >> The controllers and the PHY are left disabled here and enabled per
> >> board.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[...]
> >>  &tlmm {
> >> +	pcie0_default: pcie0-default-state {
> >> +		wake-pins {
> >> +			pins = "gpio0";
> >> +			function = "gpio";
> >> +			drive-strength = <2>;
> >> +			bias-pull-up;
> >> +		};
> >> +
> >> +		clkreq-pins {
> >> +			pins = "gpio1";
> >> +			function = "pcie0_clk_req_n";
> >> +			drive-strength = <2>;
> >> +			bias-pull-up;
> >> +		};
> >> +
> >> +		perst-pins {
> >> +			pins = "gpio2";
> >> +			function = "gpio";
> >> +			drive-strength = <2>;
> >> +			bias-disable;
> >> +		};
> > pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
> > stay here. But wake and perst are board chosen GPIOs. I think they should
> > go to board DTS.
> Shawn, I don't see perst and wake gpios are changing per board, for that
> reason I added them here, but such requirement is coming we can move them to
> board file.

Well, we have only seen Ride and RRD so far. We never know how other Nord
based boards to come will choose the perst and wake GPIOs. This is
simply a board level configuration and should go to board dts.

Shawn
