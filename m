Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC60126056C
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 06:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791180725; cv=none; b=Zx9qS0GTxnn4E/+DHlYetjbypzGlvWfP1pkRavLeBiTTlnHV6IhNsqwyVpm6l53JPzqzDht+KXscyV+yzp5THyxgKSLe9IkxVuSxj60wvrqKBj0/At5j5IwblX0NwFcN873MLka2mROuEI3gCE6mWz41y8eDqv4tdM9BxDoDTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791180725; c=relaxed/simple;
	bh=evaDksZCbNvhc6Mnf4AYlqA1W+JNzFob57YVPbru158=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP7CfDPipttTEFDzlm9kKCnARdAV89AQ/RdDiTRZFt5m0+W56kQ+fP1nM87CNrwgg3V+VIkBnzOKp56B5zMf0FemJGJZLbpcRQZY/GOYcNskLR+bZO2+Qi9dyfRaLXDJUaD7v/wtFgABQRRd+HavkSRQ4CX8M4WvftD7nNE6Iz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXZK+4GP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ioxMEQp8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXZK+4GP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ioxMEQp8"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69512AAA3245599
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 06:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7hb38lOShKOX4DAhIwGSWhb
	0M9uMInsEx4DUw+3QwE=; b=YXZK+4GPpzMCvnrdxr/eWpCSzCoK2Lg37phfzFk5
	zkBHHg0RCOAQ9RgdZfwxHuZRvGJtMuxw8BiPvOX5UDlHfo2X65BfVsIz7tuctDlQ
	WmPE8+lKb/pgizHDJKrexbNwQ4BKfMBYIUWfe0RI+fxJJCABR9epOgppauBeW3sV
	JxX6wGbDPkLo5GQst1OEUa58hKtkBIc9XFTRf/J3xaCY/nfHKSFJgm6xOIEIvIG3
	zuyOimWGNpjoKhhlhtafxUvdnxR2sXpilQw7ujwtM9PvqMuWxYTWb6d5hupo9pK/
	mPHKFLcN+BQB2YOgnt9eYvzcC//p5zczmmxbrGImHdBTMg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2tvevhjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 06:12:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1296068a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791180717; x=1791785517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=;
        b=ioxMEQp8uL1VBXI5qM82m9Fj+nQnI/uEJBl4aXoi9uo+kGu/PPCrEIVlCGYfMQUKrs
         /AG3A0yOm9otvfRIIg64iTfShr9C2IDW9X5sAK0SCywoTficC4I4ixVTkTtqtTaR2IpH
         CGKWoIyLnEhMwZHIRd+dwYD3LlUMpLDZFni9TKRBFaj5Cv1C5Tg4Mhitg3pDOIkp7XQP
         MbEMpztViU5f+I+6vz2AetMGa95vafvMilDQFTfXlr3WN1jBcX3wiMdS7+6EsDxbB+SJ
         ETGhFEMkFetRc0izvGePf1c0RxyjSzX++k47VVsMz0PV51f5CaYsy+TV0wgXcYKNprGx
         MI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791180717; x=1791785517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7hb38lOShKOX4DAhIwGSWhb0M9uMInsEx4DUw+3QwE=;
        b=SfcZt90fGfShMhy695n8xfQy8rPXhRU8vGqZ/tCxijQJyD2/vaVx5lFWRn8LSC0sgt
         zg7MOI7iNZAZoCoYL5ZtT0KQu8ZLpX7DEpsfz6TUCr6nzo3+XRqH+xY+AoxtbmBW+SzE
         2oXO3KguDDoRcxOZx5Hekmyt9KAn9Wt6i2C/XP8AnWzAjCRkSRycoXE9e2EgGSM/KwYz
         Ui7NmNyUPFZB9JszYHYmK5Dhnq97GHcC7ADPOY5wnaDtOSIbplETtfEnbteC/KSdFWuY
         Ku/gKptYgmohifaO4ddIc49rNCWPbNQK+6/DLdABzBQZLbpW58nzQi1VVuDLmzngOgkd
         sqVg==
X-Forwarded-Encrypted: i=1; AKwUvBzyvLMxfi8rkBscTphIVOoFwQkqrZmEG+XoezJ0QqYeqeEjcgrcE24nh2k+AHH4MBBtQQ17QUxIoDdY58E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBlydBbnviibCPcV62tlYFHnh8/BTgVxuToy3O0adjUj3dFioW
	b+IdRyU7MVb72K8YfiKwzEYcpYXlyMSFhQev0kkVRBuE84fiejWCSdVHZLkmtJFrlxuR1eOT/T3
	0nxO802AWpzwHqXB5ZCLH9zMy113XumQOiSWM/U4yq/4AlIvvF8e/qvfkGnJvrc9+jvo=
X-Gm-Gg: AYBFou3jRvcaNutnbUpWP/EMzGKkX+Dd+XR8FJLbQeAhsX3krrqo/2J8cQuRPz9Dt/d
	SlSIqPl3HqH+WoPxt8+SxaUsLbpVrFQ7KNfav+svPZ6TaiCRS2YEn39sNfD/M0Pwp0XRL+3NRAn
	KirP27VA/TtjQSVPsZqAfgrbOhuTvnURFc/r8MGfcBSeJqumTy0mutzPwtgBjiaIKCqSSFzdADP
	hljOz/IEGv7BdhqCy5sqcS3McFFg7TgbHXGK/sE39/oaVMsTcBxlDCMqSfy/VpQ+yZMbMPVdmTj
	D9rtQzUsik0W6ahS4Cb2Tf7+0P6z7ArVamG4HSflrldFJXiHYhj1DzIiXru3tcHj8GqYqWEqRD2
	Gm59WTQ12vpz4TK4CvgUR1CNYkPALPxmrUoAU
X-Received: by 2002:a17:90a:2d7:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a6d02b0fd3mr4447673a91.4.1791180717186;
        Sun, 04 Oct 2026 23:11:57 -0700 (PDT)
X-Received: by 2002:a17:90a:2d7:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a6d02b0fd3mr4447663a91.4.1791180716723;
        Sun, 04 Oct 2026 23:11:56 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e472b48sm9294888a91.8.2026.10.04.23.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 23:11:56 -0700 (PDT)
Date: Mon, 5 Oct 2026 11:41:49 +0530
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: Add RPi 7-inch DSI panel
 overlays for Monaco/Lemans EVK
Message-ID: <asM/pR6C0RpmUR5y@hu-ssmaurya-hyd.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
 <aqLGFfQ20mCGFkfl@baldur>
 <aqt72zoSNVGrcY9t@hu-ssmaurya-hyd.qualcomm.com>
 <arsp-8KPqD_skD5D@zenbook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arsp-8KPqD_skD5D@zenbook>
X-Proofpoint-ORIG-GUID: hjGpQ7Uvnsd-6D1Ufw81tdPpJFr0zP5G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfXywHfZVGObyO0
 yTRyzFoLVUiK5UTu+TlCSjVTauiaa316SsBVhFcG3h4e9Q6x/2BL9lkl85/gYw6blWJ4+mGknEx
 qY5brN7Oaxln/X/eaoBCuU5FBeqq/qw=
X-Authority-Analysis: v=2.4 cv=YoGa1IYX c=1 sm=1 tr=0 ts=6ac33fb2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=Q-fNiiVtAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=D-uZpU5vEzOSoVvPSTgA:9 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAyNCBTYWx0ZWRfXzHXXUfVPwLDL
 ZezhKRuBDZ3z8EUiIvuE1Xa4DkkP5Qp6siSq/Z1uTXkuDr4vWFCqIYbyEEyOy3W+lqXMUdbtnma
 nux/13WkpSoA+5MO64FXqhVJUTEG0xZhH0PCpjsHxiwQYu5BvtAJA8b/bjGp6PzbCeo+bHqodYD
 txVXLYgODZ3/BL7VbakinhIiAb3OsE+x5jRYn3LZaXf5O+bl3APzvmGsJ0yz7VUCvLOT0u+agnQ
 ewdrSjz2/IROGmsYoU0TdMPqnfXZXg7/1e5+mLgqHQzpEjl5egrb1RVcMOFaGuMxti2ZrhvTXWP
 3GJbojIo/FwrhDtOzg2QpTsWXXHmrD3y3WpZT/pGqhugcY8Qme+yH33NF70xtEpV3glJehW4VEB
 ilPpGEQ+yKS38+uO7c1C2ATP0VKd6pGvS134eibOo8a6o81zy26qFckPef8aEOGv0iroWK9RGLk
 +FU+jRKfyOxNZZiHt9g==
X-Proofpoint-GUID: hjGpQ7Uvnsd-6D1Ufw81tdPpJFr0zP5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050024

On Mon, Sep 28, 2026 at 10:05:20PM -0500, Bjorn Andersson wrote:
> On Thu, Sep 17, 2026 at 11:04:19AM +0530, Shashank Maurya wrote:
> > On Thu, Sep 10, 2026 at 02:35:41PM -0500, Bjorn Andersson wrote:
> > > On Mon, Sep 07, 2026 at 12:03:52PM +0530, Shashank Maurya wrote:
> > > > Add device tree overlays to enable support for the Raspberry Pi 7-inch
> > > > DSI touchscreen panel on Qualcomm Monaco and Lemans EVK platforms.
> > > > 
> > > > The overlays configure the panel on the primary DSI interface using
> > > > a 2-lane DSI connection and instantiate the panel MCU on the
> > > > corresponding touchscreen I2C bus for each platform. The changes
> > > > allow the Raspberry Pi 7-inch display to be used as an external
> > > > display option on both EVKs without affecting the default platform
> > > > configuration.
> > > > 
> > > > ---
> > > > To: Bjorn Andersson <andersson@kernel.org>
> > > > To: Konrad Dybcio <konradybcio@kernel.org>
> > > > To: Rob Herring <robh@kernel.org>
> > > > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > To: Conor Dooley <conor+dt@kernel.org>
> > > > To: Florian Fainelli <florian.fainelli@broadcom.com>
> > > > To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> > > > Cc: linux-arm-msm@vger.kernel.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > Cc: linux-rpi-kernel@lists.infradead.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > 
> > > > ---
> > > > Shashank Maurya (2):
> > > >       arm64: dts: qcom: monaco-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > >       arm64: dts: qcom: lemans-evk: Add Raspberry Pi 7-inch DSI panel overlay
> > > > 
> > > >  arch/arm64/boot/dts/qcom/Makefile                  |  4 ++
> > > >  .../dts/qcom/lemans-evk-raspberrypi-dsi-7inch.dtso | 83 ++++++++++++++++++++++
> > > >  .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 +++++++++++++++++++++
> > > >  3 files changed, 169 insertions(+)
> > > > ---
> > > > base-commit: ed2647532a225739e86c7f236a2ce82764ec2772
> > > > change-id: 20260907-rpi_dts_overlay-58088ffce047
> > > > prerequisite-message-id: <20260907-rpi_reg-v2-0-0c59aa60d31f@oss.qualcomm.com>
> > > 
> > > The two dts patches in this series clearly relates to those two
> > > regulator patches, which has received change requests.
> > > 
> > > I would have sent the 4 patches together in a series, but as you didn't
> > > you sent this series with unmet dependencies.
> > > 
> > > All I can do now is reject this series as well. Please send v2 once the
> > > driver changes has been merged and you have validated this again.
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > prerequisite-patch-id: 5212bf185b35c36ed8857a67f29e60386d59ac60
> > > > prerequisite-patch-id: 056a90b913170106a6f8c1feb2366ee83c4375b9
> > > > 
> > > > Best regards,
> > > > --  
> > > > Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> > > > 
> > 
> > Hi Bjorn,
> > 
> > Thanks for the review.
> > 
> > The regulator patches and DTS patches are targeting different maintainer trees 
> > and therefore were developed and submitted from separate workspaces. While the
> > DTS changes depend on the regulator updates, the two sets of patches cannot 
> > realistically be carried in a single series because they are reviewed and 
> > merged through different paths.
> > 
> 
> In reality, Mark has shown many times that he's able to pick individual
> patches from a series and the 4 patches are better reviewed together.
> 
> > I submitted the DTS series separately to start the review process in parallel,
> > but I understand your concern about the unresolved dependency.
> > 
> 
> Please send patches that are ready to be merged, and when you do make
> sure you send them in a way and at a time where they can be merged.
> 
> Thanks,
> Bjorn
> 
> > Regards,
> > Shashank

Sure, I was not aware that Mark can pick driver patch from here directly.
Driver patch is already in process, once driver patch is merged I'll post next 
revision of this patch after valdiation.

Thanks,
Shashank.
