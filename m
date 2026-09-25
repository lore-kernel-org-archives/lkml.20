Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC6A4AA03F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790345982; cv=none; b=s/g/AiA4mqvgaiSUpkBdO7yZg5rzUR8AtMXS/h3T9g8Kh7oyU5NNtauNmaow2SqMwxCYkKPqSqB8AmGJsQJoQiCIW9XMcao2MddC6ztPORp4L0DUOJW+601QSp42vPlYnoGjmD0e3KHer99OCyer6nrzj/19RR3Tz89ypyXlKQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790345982; c=relaxed/simple;
	bh=0IOCe0rhZkZk9loRRTF/Mw+l54Zou2USonDmfkIm3ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAcsgo6dRZ5Cy/94gYNfnsI8pH3y+sctirvtL/SU49hgTfRAw3tvHGN7QT/2Wci3/TvkZG5NQbw4O0MVSuDNG3zqxMNvcY9Em5fQ7RFr4ipTtG8n5ACbz2LvacJL+6Mr6/ajsXnMrOaR2fAe7tigL7s9F8Tgulh9AuEzcFsG+ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJy/xYTF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C39aNWM8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJy/xYTF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C39aNWM8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Biu609090
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Gs/Zp4Lyis1BUfei8WI1dbDL
	AbMPRkxp7joj1eNb5+8=; b=BJy/xYTFs1C+RCKKuMNXhfxCK8TqLvqP2uymw68K
	GQ1B3ulwMqZu18/z7ZsmtNvYpJGn/LyY3alfnOOvql+Xs0XH95oQRiCp8eOKPy8z
	Jiu4+C3oVlXCrC72+kpSocWr5BdlI/QJOmYT8HQoT5aYy+QeYaEtnGVTAVuQNrnL
	jj1a8Slx8POrx/C1xqZZMnoCBkIAEm0xtJtNXY+QpzlA3ZLfrBzYILNngtzaajG3
	gVYjviAZGlsxd9NUSFGZmw1oR/A0RfmCk1+QxkouzwLWjzavJ4AQ1d4IBThNcig1
	4BNMc3jgzrmqvOwipjHao1JZMvB7lJCkyPnPuCmBf9WQcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnrswp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 14:19:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a00c70d28so156317485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790345977; x=1790950777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gs/Zp4Lyis1BUfei8WI1dbDLAbMPRkxp7joj1eNb5+8=;
        b=C39aNWM8afpC26Q7dm88cOYSkTQsKePsmdnG2F+dYbjg2PEkDl9roa0arcFgFi6O12
         VUCJOY4jD2QKsfWJyTaNNcS+OLQ2ic695gLoXkF6P0NBLm9ZVDspywu+Q7yQ9UyYSCId
         +YbdlVtunV+EW/cwQ68X16ZkYNocJpVW09IGhgWsIzpIjmkMTyV8NG0vQ+v0XCFwo0ti
         6RiSjQ79/HLAH4r9eGdYQMbCo3yELiIAgP51rkFDT51rFYurWXZvlPP7fFJnlMzlYrqX
         wy5FbH7unWf5Qs/+6NXC4z0YUAFwyJ7ubDWK/Zj5BL50iXc3TFVh66aq9drQTotO/yTH
         CJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345977; x=1790950777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gs/Zp4Lyis1BUfei8WI1dbDLAbMPRkxp7joj1eNb5+8=;
        b=zX5TqkF4my5QVQ03/G3ymD/9eJ9woBtuhAZAKOUwmebbv6z62wB3Apd4OQaReQl2Jz
         4pc+yca+smNZGalN4e4jaZQbaQlsTvt9/xFCXItZkgagolYlgMjmcq+7e0bz2ETTHH/u
         7l6JecNfE/Ac2GYJWCTRd/WwD33bsDW1DkZSrowf1L60L1Q7FQEQthsepTj09HI1OTLt
         xjkv3OKlnnFAh2pCMYW5R8m0J/a5oU1LjbMPz9az9S0kWzGgME3MaX7+zTYfNjN4QW02
         o7/WqNF2XCALUza56op4Hq6zCMaKUKDspxxXBc7CY2gNTNzXdCT2Do9aVhjaN8oggSIL
         71/g==
X-Forwarded-Encrypted: i=1; AKwUvBz+/A8nPR2koqPRMC/lMvJh8j8h/x1ms1cjHxZn0bKfZtNz+dTnlQwDLLCd/xuhp5CWy1jBPLlZ0JkySLE=@vger.kernel.org
X-Gm-Message-State: AFuF++lmntA9hG6Ot1EErtDph/ppAMpoIn0YOHeGqBq8EjEwlaZ+nGYr
	woJszBvr6icGi5XJkmlZPM2Qez3mqoZQriVUSPOf0SDTbdCQ4oxtqkTcowQv62atCKnqXRVPAbP
	JNeLLeFxz2XdlCWwXnoUIxOjwvtB0jsKousnjS2LaRiPO7nNJhr7e4mDpZis5GZ+CpBE=
X-Gm-Gg: AYBFou0xd6TwdmBBrEkcbSC2hJQ1CarMJ3fjtz2R0BTjar+DEKZEjHREFCcLnHDowg8
	8DGcObaOTdxP6fBjwmQsVqzPFq1SeKaP0TT1fKtN1xHleOxfUKrymZQkRaVTaUehz/bdYBLw8Hy
	997Tv7+e7FQcW57ovGU7vweTRzDvib+Zr0Y9Lqli5A9ZcCQIfk9CExyCd+AopPdu4zXhBFzemVk
	ma/iJDxcdvVjcZtAGQhnKwVkJS7rZYoki5LOsE7c1Fv65RuLDJdCcvcNfRiW8Xo3vAmNwq1CF/T
	KF/vn6hI6y74jGn9XdVDiMoyOIQ2HsZ6oWusDrTh484wC+ADqYn+MzeRYvIkQ9Pjd0v+nJu/NqI
	3kPmpCBRWsfJ1EL5/xygQIAjBhX26IKJz2EPIJSTj4EXra4KxlYfOeEyVRvcLjy7JNg9wCrnZiM
	I1hrA5GlraYSGM
X-Received: by 2002:a05:620a:710d:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93c43be5048mr477718885a.24.1790345976478;
        Fri, 25 Sep 2026 07:19:36 -0700 (PDT)
X-Received: by 2002:a05:620a:710d:b0:93b:ca79:3b0b with SMTP id af79cd13be357-93c43be5048mr477713385a.24.1790345975854;
        Fri, 25 Sep 2026 07:19:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8e6b0795bsm567008e87.64.2026.09.25.07.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:19:34 -0700 (PDT)
Date: Fri, 25 Sep 2026 17:19:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>, Val Packett <val@packett.cool>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi/phy: power up the digital top before
 starting the 7nm PLL
Message-ID: <hqdsikuu7tgbkchteduzgno3pvzvhxahdrv52qy2v35qj3w7ms@qhsy2cot4uuy>
References: <20260924-dsi-7nm-pll-digtop-v1-1-c2b24c8e218d@oss.qualcomm.com>
 <DLNL4OAG2D1L.2EI2N80LMZV8N@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLNL4OAG2D1L.2EI2N80LMZV8N@fairphone.com>
X-Proofpoint-ORIG-GUID: 8RFsoOMJ4FocUfY_c0scieKSoirBqFLT
X-Proofpoint-GUID: 8RFsoOMJ4FocUfY_c0scieKSoirBqFLT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NyBTYWx0ZWRfX0ocFdfmIQbBc
 wYbL4N4h/KnWXF0QWLWHg9pQm29dlqWMOhXVTLO0d5cPKEzcZeQtWEppk9FqiSPkIjcGL25QXkU
 frPGT2mJeAgZrmXMTQZDRs9CJBZiG1A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NyBTYWx0ZWRfX4cpdDPyuV4w3
 u5YloznY2jijXZqROPdpiUp7BD+USS3T79cAA7pFZm/+YElqbLEn1UOvAvRF0ooUregRF6oy2pP
 ZTrtm5mDxunjdBzAzgnuCjNEZOCCVnlUqDNAoYH/aenadlR931mdM7LuBw4qtVRCXdV6Zkrfwrm
 Crew1QoPip1e6MiZ0hmq9+Xn+l0HttSFpOOAiEaUZSh6YEnlfqtcLzz9b/1BTMo7GTh1xD1lQwO
 KuYrU4IEY6nebP4xCqTgxqG9/9QFkhlgCqkcmIG7ycctlnt2GSFn43LXFLilbSYn0+b3upEku+V
 LrD97xOf/+QjxRrhd6JnakTCZjeprKzHFyx/HVf0rMVv1wHUW2P78I8GbDmYaFJheJZWhPRcGFv
 bjN8J9Tuxgn0R1ImFT3YlzT7PV93hfxigW5urcnk9BDu7PWOaNTvEXfPNOjoZ8jTxiv97wy8Th6
 MEmi+NDNDRr1WTPkm1g==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab682f9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=BDs8z1iCgLwJFp4fgFUA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250057

On Thu, Sep 24, 2026 at 03:36:05PM +0200, Luca Weiss wrote:
> Hi Dmitry,
> 
> On Thu Sep 24, 2026 at 2:51 AM CEST, Dmitry Baryshkov wrote:
> > dsi_pll_7nm_vco_prepare() de-asserts PLL_SHUTDOWNB and starts the PLL,
> > but leaves the PHY digital top powered down; only dsi_7nm_phy_enable()
> > sets DIGTOP_PWRDN_B.  The PLL cannot lock in that state.  This went
> > unnoticed for as long as the PLL was only ever prepared from the DSI
> > host's enable path, after the PHY had been enabled.
> >
> > Since commit acf7a91d0b0e ("clk: qcom: dispcc-sm8250: Enable parents for
> > pixel clocks") the clock framework enables the PHY PLL on its own while
> > applying the DT's assigned-clock-parents from of_clk_set_defaults(), at
> > probe time, before the PHY has been touched.  The lock fails, the failed
> > enable leaves the pixel clock with an unbalanced enable count, and the
> > retries on every probe attempt stall the boot for tens of seconds:
> >
> >   DSI PLL(0) lock failed, status=0x00000000
> >   PLL(0) lock failed
> >   dsi0_phy_pll_out_dsiclk already disabled
> >   WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x244/0x24c
> >    clk_core_disable
> >    __clk_set_parent_after
> >    clk_core_set_parent_nolock
> >    clk_set_parent
> >    of_clk_set_defaults
> >    platform_probe
> >
> > CMN_CTRL_0 reads 0x20 at the failing attempt: PLL_SHUTDOWNB set,
> > DIGTOP_PWRDN_B clear.  Setting DIGTOP_PWRDN_B alone makes the same PLL
> > lock, with no rate change and no other register touched.
> >
> > Power up the digital top together with the PLL bias, and power it down
> > again with it.  The normal enable path is unaffected: dsi_7nm_phy_enable()
> > holds the bias reference and writes CMN_CTRL_0 in full anyway.
> 
> FWIW the same fix seems to help on the 10nm with this error on bootup
> 
> [    0.503085] msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare] *ERROR* DSI PLL(0) lock failed, status=0x00000000
> [    0.503168] msm_dsi_phy ae94400.phy: [drm:dsi_pll_10nm_vco_prepare] *ERROR* PLL(0) lock failed
> 
> I've also ported more commits from 7nm to 10nm locally, will send them
> soon, since anyway they should be good fixes and code quality
> improvements
> 
> drm/msm/dsi_phy_10nm: Protect PHY_CMN_CLK_CFG0 updated from driver side
> drm/msm/dsi_phy_10nm: Protect PHY_CMN_CLK_CFG1 against clock driver
> drm/msm/dsi_phy_10nm: Do not overwite PHY_CMN_CLK_CFG1 when choosing bitclk source
> drm/msm/dsi_phy_10nm: Define PHY_CMN_CLK_CFG[01] bitfields and simplify saving
> drm/msm/dsi_phy_10nm: Define PHY_CMN_CTRL_0 bitfields
> drm/msm/dsi_phy_10nm: Fix reading zero as PLL rates when unprepared
> 
> Unfortunately some other warnings/errors still persist on bootup that I
> can't figure out... maybe you have some idea?
> 
> If not, I don't want to bring this thread too much offtopic :)
> 
> [    1.197104] ------------[ cut here ]------------
> [    1.197113] dsi0_pll_bit_clk: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set

This looks like the read from the unpowered PLL block. Check that all
required bits are set. It might be worth replacing this standard
clk_divider (and the one in 7nm) with the special version that doesn't
go to the registers if the PHY is unpowered.

> [    1.197134] WARNING: drivers/clk/clk-divider.c:145 at divider_recalc_rate+0xac/0xd4, CPU#0: kworker/u32:0/12
> [    1.197150] Modules linked in:
> [    1.197160] CPU: 0 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted 7.2.0-00088-gddc402c24fff #86 PREEMPTLAZY 

-- 
With best wishes
Dmitry
