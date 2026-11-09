Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794207157;
	b=FHcOlgv5mD8MxCvdQU2SeWafnlmjPvlSrpaj/mFk9Ww6WYHXpsJ687PTS7HBnBcbuhcK
	 o6xzmvGZUOi2Do9Wt7etcH0ughmUAfgowfjow6ZnqxninfJuMq1ObQQq4xY37aqIrWK/a
	 gYeXFbRV0Ggxto94CMKtizQ5VW4SSC2fqqFzyTx6MQZrdYURlKSVpgMc+VebJEzt+uhF1
	 96cgGXsCN3Vk94rsH2SgYwmM49NE0sXXF6EDKIN8cDgyYmQm7nOs6i68NITXbrm0CAxyf
	 c78ISz3xBhdSMJIQG8S3ONB1vWuCj/kHznCnvoRnZSukxfnjNrKV3vMNt2QGFOfTF8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794207157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
	b=GqkyJY0rTZRWJFa6jyIw1aAefqCs2sOJ7MYML2Qjo+nipAvLiwyNx1h1G2H6y5Fcu22l
	 NamUqoobDZE9x2V4CLdi0zdQ4+ZIjqHANWOD1C1Ebw8+Bd9swCIanRF1aXzgoC0+AFPmc
	 nGguG9xmv2P6lkB4VvxJIdoM4PeIjNxort1404w9jpMf/tIGUVq6Sc7BuRX+fAC1Mf62P
	 AC/Nz8/asxQ7sCG9gKGiUM3L12EXsLV3wlGxJJF7hLC05S3u1h9dR9UzIZzCctbfmroZV
	 iJGojD72GjVmecWS9nguPXuV1Ifcas6fihKSCjlk3ZnRRWcehxbcji7a8+Sd2vWQbfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV6BVpdz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F309606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F309606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gINNI1pH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YV6BVpdz
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A969w1d2668063
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 06:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pYBX0T5CKcwvZAIN9tNQTOFk
	9tmHNlr1/FpalyNCLYA=; b=gINNI1pHW9CSMWKrDmmWyRmeTudBSCkqi6vz95iH
	CRika5aaeka7jG5OOoGFPXtdQFmIcC5vYetU2L4Aj8gwCYWVkt9r3QWMlza+b4mn
	xUJcHJxK4om9TzDnULvhndId7yWE50tfZo0famGN0tZUQIyjqe82BHN9rXW5Epd3
	0XlFslXaen/RANdzKp2kcaj7oo3fjemoQj+aNXgvUGItUmSBokbB6+za/REnINHD
	npfpBU9CW212d4OC3H65KSYhZmFlAsFr24dK3dwNpU4vGTgE6aBVBS1ixrmGwZqn
	RKEugSn4HljBltNWyJKO/fMQUqSh0FPMrO0j7yHCh2P9+g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw99mwcs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:52:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36de26cb4b3so703949eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794207156; x=1794811956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=YV6BVpdzL0JyzulYm7zHFxWlCRmqRXo/fpz2ShEk9FF6LFYppayzZpa7NU0YTxX0Qg
         Zy9yCwk+rJulKxoeX++JUpp2YXXehiW+NJ29xgI30dbyj761PgdxbC3oID0EJkgUPXK+
         ITiZ2HyuAOQNNZ9e1bUzIW37OKuCyfmFk5V6cbQteNWgHdBnVSXrt/lJDVWyqqdbZ2Dh
         VJB7wek9yr7/yCxKr8zjUV3aeZSj5nIJLlhydAOA/gsey32e+Y9uYmNOvBjOWEsnKRzi
         tH8nbrkkxoboRWCNkcONZgBF1h3v1vkXdqyCerjI/nvZ/dBCAQflCaVAANRWkduUDx6/
         inUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794207156; x=1794811956;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYBX0T5CKcwvZAIN9tNQTOFk9tmHNlr1/FpalyNCLYA=;
        b=s7VIB31NHSFF/jsCEdBgGLRPy5Poc0Y37SQ8rux7JxkiXy5PHWUpbk6VBe6AliUXXJ
         87v0SxuuBPYLESbxrJMn/y3ukR+DqQCbbr87wVdlTMci6DqlSq81/9JDjmSBCQ0Zmtkd
         j2edU3OnOYuxdlRMtSIWTgdcXWgU6fVrBTWlZbhi6ei2lB+ro+N5uBsookUJQaPMFCD3
         JuaHNW6BTeoI4vQ8m+TdRfxBgHxqhugssr335h2vy4y4M/bschOWi16Y4ojhIHaSZV7i
         3kHB7Cz5Buqd/48yZ6tYej0Ln88PnjqIPuJtsrUoGBBUhIGcHV/pFzJ9fN40DVodsRtr
         LWtw==
X-Forwarded-Encrypted: i=1; AL+hErFiisOgssBkVeIBuLgvoMuclwOWGTfp0bwo5x0EpDI89hBxrbuAI0uAd38e5zWQJRTv0Tpr3EhY9cAesJ4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mdw+0YwTcRXdD3EcROvdoZ+t8tVvC3PbxnUxYeUqg9LsZkiRn
	n63GpFQWPmkxRe7fLZzjqobQ/rxD8RCMI0C0d+s81yGcwPOE1feeD8XVesfL0cOvvj+PpXxCpP7
	SlUPZ9Z8m3MDERJ2oWVxy60EvvW9WyNrEl030nAGlXUWh8jgrQHgoZ2WiKLyjGmdrAao=
X-Gm-Gg: AYBFou0tNqXshRJUS0FTGhSpmVN+B5Xx7HHGLnaRh6xWXZqDPTtwJ2EJHwjFVqr72Zp
	2FBqlOu9kHL5OkgOaJsEL9o2mf2huTG49vH8tilaRMolLpbxmhz/XF9kqBqAEHyWzOkLgZr9CYR
	BqiQ6coydZe9BW6DbMH03U8O3LsI7lxQHWwD26h5EItwfX68b5WUzEE0o5nX+8MDCZaGrt7YjoJ
	2hi57nqGJNbpa5tbIA8q8i8ug2EMKRG+la3szWONO1A98pc4XUkINwJh6ZLyb08wTMNErCFGZml
	YP706NTXgRwsyvofZpBpsh/bNJcbGcT9j4eONhCzOFqcRaI7jlgYj9vfArVINmyhAT7yWOfOEgw
	QQ2x13lfCIgrI8P6QYjzVblnJ6x13RnvCsy8AxFTmqn5DHR6s1NwidQtIgtjJ8m28PFmfst2XPq
	mP6R4=
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850910eec.18.1794207155653;
        Sun, 08 Nov 2026 22:52:35 -0800 (PST)
X-Received: by 2002:a05:7301:231e:b0:351:29c8:643 with SMTP id 5a478bee46e88-37256bf5b4amr5850874eec.18.1794207154898;
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm10502754eec.17.2026.11.08.22.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:52:34 -0800 (PST)
Date: Mon, 9 Nov 2026 12:22:27 +0530
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] arm64: dts: qcom: talos-lyra-evk: Add display
 overlays for EVK board
Message-ID: <avFtq61Hwzjk2f7n@hu-anantiwa-hyd.qualcomm.com>
References: <20261102-lyra-display-upstream-post-v3-0-7f660c3b622c@oss.qualcomm.com>
 <au_BvH0rEKpgTpc3@zenbook>
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
In-Reply-To: <au_BvH0rEKpgTpc3@zenbook>
X-Proofpoint-ORIG-GUID: 6VRplOcZZC5OZrLdH0aBFsAeWWGnRksN
X-Proofpoint-GUID: 6VRplOcZZC5OZrLdH0aBFsAeWWGnRksN
X-Authority-Analysis: v=2.4 cv=CMq/zhrD c=1 sm=1 tr=0 ts=6af16db4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Q-fNiiVtAAAA:8
 a=JfrnYn6hAAAA:8 a=YaO7I9Z_RSUIAtd64XYA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=FO4_E8m0qiDe52t0p3_H:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfX9TrEUd9cX5N3
 yq6DSBX8s+DEs/auqHFE2o4yDw7QQD3BhjytNsurNWFEgKFD0SwY2fVIAziopxseny8OaPyEVz1
 EmR/GLG1j4TnPRFZkoDQRzWruFOikzxGht+s04dOJHoDgyQuMM3iDpZe0azX8oOW/J7wUncF4Zc
 NZB2vtrzAaLSrVhVIU2cfuRc3lBRyJNi+m+y5BXGa1Mp1mgNz4A5xhXHkGy1sGF9HtTDoLC+UZv
 nWHbWSJIpUx5SQ6CVz9qVKgCHmTom1DUskkRTE8kpMPi/oIpAxRUyA52EPWXABXZZaG698Q9NcP
 1i6W9o2KV7H6zMqlW3w6tgxWS0EQK11p2n1cpSskf7RDy+JjXOzOsMieVmIFuYUoElB63kP8Nqf
 7A3BBwB4sdyVZiHRLVJ5Si8qmrP7kaPcmFBpooc143eIK1RatlpWwLgOgp85tkX9halLRbUcM2L
 kQ9awiR7EFgNor3c9/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAyNyBTYWx0ZWRfXwSAsCx+PCXqQ
 ECs0pL40+NUCgZFoKENdnu5oVpkgfiNaSNUNFqAtOXXricEa2InDGgOubkpYEvJUFLfR27mrxSR
 m2oIe6U/ixZQc/z6Lsd8pBsUfD6sY70=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090027

On Sat, Nov 07, 2026 at 06:29:41PM -0600, Bjorn Andersson wrote:
> On Mon, Nov 02, 2026 at 01:01:30PM +0530, anand.tiwari@oss.qualcomm.com wrote:
> > Qualcomm Talos Lyra EVK SoC card are mounted on the Lyra carrier card.
> > The DSI0 interface from SoC card is routed to either the 22-pin DSI
> > connector on carrier card named as JDISP1 DSI0 or to the DSI0_B2B
> > connector, through a MUX which can be selected by a hardware DIP
> > switch. There are multiple daughter cards designed that can be
> > connected to this B2B connector.
> > 
> > The below B2B display interfaces are enabled by default in base DTB:
> >   - DSI-to-HDMI using the LT9611UXD daughter card
> > 
> > Below overlay DTs are added for additional display configurations:
> >   - talos-lyra-evk-dlc0697: DLC0697 DSI panel for Lyra with DLC
> >     daughter card
> >   - talos-lyra-evk-raspberrypi-dsi-7inch: Raspberry Pi 7-inch DSI
> >     panel with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-waveshare-dsi-8inch: Waveshare 8-inch DSI panel
> >     with touch via the 22-pin DSI connector for Lyra
> >   - talos-lyra-evk-lvds-auo,g133han01: AUO G133HAN01 LVDS panel for
> >     Lyra with LVDS daughter card
> > 
> > These overlays are applied on top of the corresponding base board
> > DTBs.
> > Link: https://lore.kernel.org/all/20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com/
> > 
> > Dependencies:
> > https://lore.kernel.org/r/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com
> 
> This was rejected 3 weeks ago, so sending this series wasted both your
> and my time.
> 
> Regards,
> Bjorn

Thanks Bjorn for letting me know. I missed that the dependency had been 
rejected. I will resend this series after acceptance of dependencies

> 
> > https://lore.kernel.org/all/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com/
> > https://lore.kernel.org/all/20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com/
> > 
> > DT bindings:
> > https://lore.kernel.org/all/20261021-lt9611c-v7-v18-1-4978b94896f1@oss.qualcomm.com/
> > 
> > Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > ---
> > Changes in v3:
> > - Added GP CLK Frequency Dependencies
> > - Reorder the &tlmm pinctrl nodes in the LT9611UXD HDMI bridge patch
> > to ascending GPIO number.
> > - Link to v2: https://patch.msgid.link/20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com
> > 
> > Changes in v2:
> > - Fold in the hdmi_connector port remote-endpoint indentation fix.
> > - Drop the per-patch Depends-on trailer on the LT9611UXD HDMI bridge
> >   patch; the dt-bindings dependency is now declared as a series
> >   prerequisite (see base-commit/prerequisite info below).
> > - Drop default-on from the DLC0697 backlight node.
> > - Add the ilitek,ili9881c fallback compatible to the RPi 7-inch
> >   panel overlay to fix a dtbs_check "too short" binding failure.
> > - Reword the PWM_CLK defconfig commit message to name Qualcomm as
> >   the SoC vendor.
> > - Remove a stray blank line and non-ASCII characters from the AUO
> >   LVDS panel overlay.
> > - Link to v1: https://patch.msgid.link/20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com
> > 
> > To: Bjorn Andersson <andersson@kernel.org>
> > To: Konrad Dybcio <konradybcio@kernel.org>
> > To: Abel Vesa <abelvesa@kernel.org>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-rpi-kernel@lists.infradead.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > 
> > ---
> > Anand Tiwari (2):
> >       arm64: defconfig: Enable PWM_CLK for backlight PWM support
> >       arm64: dts: qcom: talos-lyra-evk: Add AUO G133HAN01 LVDS panel overlay
> > 
> > Mohit Dsor (1):
> >       arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI bridge support
> > 
> > Shashank Maurya (3):
> >       arm64: dts: qcom: talos-lyra-evk: Add DLC DLC0697 panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI panel overlay
> >       arm64: dts: qcom: talos-lyra-evk: Add Waveshare 8-inch DSI panel overlay
> > 
> >  arch/arm64/boot/dts/qcom/Makefile                  |  18 +++
> >  .../boot/dts/qcom/talos-lyra-evk-dlc0697.dtso      |  77 ++++++++++++
> >  .../qcom/talos-lyra-evk-lvds-auo,g133han01.dtso    | 133 +++++++++++++++++++++
> >  .../qcom/talos-lyra-evk-raspberrypi-dsi-7inch.dtso |  88 ++++++++++++++
> >  .../qcom/talos-lyra-evk-waveshare-dsi-8inch.dtso   |  75 ++++++++++++
> >  arch/arm64/boot/dts/qcom/talos-lyra-evk.dts        | 101 ++++++++++++++++
> >  arch/arm64/configs/defconfig                       |   1 +
> >  7 files changed, 493 insertions(+)
> > ---
> > base-commit: 4eb2586bd40db27d77cc5b724ca9386ed0c71d53
> > change-id: 20261019-lyra-display-upstream-post-24656268a902
> > prerequisite-message-id: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
> > prerequisite-patch-id: 0dfae1e9d0c620866489eecacb4b7201b9333621
> > prerequisite-patch-id: 94923ba8f57911649364a7e0e5494c7cfd478367
> > prerequisite-patch-id: 660755293839baa7364b4baf3a2dd6b4018de48a
> > prerequisite-message-id: <20261021-lt9611c-v7-v18-0-4978b94896f1@oss.qualcomm.com>
> > prerequisite-patch-id: 49f1e01bb5594ce9c4301ce4b16715834ece7f41
> > prerequisite-patch-id: 21cfbbfd71515961501a768edad476740336c13c
> > prerequisite-message-id: <20261016-talos-gp-clk-freqs-update-v1-1-17c9a095063c@oss.qualcomm.com>
> > prerequisite-patch-id: 37995c88387ff54737dc82eb7c3b4600901ce061
> > 
> > Best regards,
> > --  
> > Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> > 
