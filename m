Received: from mail-ej2-f10.google.com (mail-ej2-f10.google.com [74.125.228.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300D54A7C95
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790169479; cv=pass; b=r98C4hmljjqIuV5ECQrmXPgT5alVB11sb3wX65ENdsmK02o4mwKPx8gopETFDWfhuyhz1djWnR63cXaqJz/xoimc/fRO4v9917LfXOzOePeStM0ZllrZC6kXQes/o0JX/OPG2ZxN03mLzPQHIKLYlWWxgDpr0BeJaoRBnry1KK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790169479; c=relaxed/simple;
	bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmrSTnD7xxFd3EQu7By0PZsxckywq1zxqdEXdx8dVNnnWpOGjqiRBZMaJGw4tGw2HTRkuBgJYeL6nqPsabn4/WIIgiyeS31bKPhf0nOFK2Oi4ekf6H744djC/XL95ob4kp/L0pCHWMrm+BUdCtOnJX44Mj86fnOzlMYf16CZHCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEks3zyT; arc=pass smtp.client-ip=74.125.228.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEks3zyT"
Received: by mail-ej2-f10.google.com with SMTP id a640c23a62f3a-c2551bfabefso70021066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:17:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790169476; cv=none;
        d=google.com; s=arc-20260327;
        b=BrGyyuneBM4QAEByJlhxIP0S4HbuJS9oNOqHKLA7EMDR3WiqMEfUgZ2rCWOc0wN2r6
         x7+krKfMBsMJ+RHs1gRQe4m0MQemkEuSbT6sI1yNBZiUxA2gFkmexut+0DXMIIGfb+kW
         fUrdnxdjEK3xwKaCcPNX5CtOL4LGJQSMHCetLAee5DBXRROncHJMoKkn7IN7HdBLqsJ2
         8X1t4yMZQApg7aSAVzHkmUOqItW/dzk6k+OOgi3nZFVsIPV+oYqcjKBCsfhwIU47cACF
         R96PaOjxoXvxNm99RmSR8t0MxtPKdbuQzToLj96aBa0ga926ElXlgaV2WYlCjpiOzGhW
         YQ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        fh=k/DscqdZ7E0miG1DlzWVKxAmSZjAwFPepehkz3trLKk=;
        b=glt9xxSfiuyUoiIqYIdBUsLo9Ak2JVBJ4CxqbMARv4Ln0Ai+W+5UiJmwVo74u2MLj8
         SOodaX+EvNLu5JETIIfIJXiLLjzcM5911Wu9vfTDPQ+8rOc7IOV0Sa8OI9XK5jHYK02M
         IXYa/ZhBbwsJ0o6z6raf/Sa8XR4zTCMGZXuZlfP2zMgpvJ8+soSz3IVinLdedYzNVqVB
         RqzKwNFZnyMiBTfx9pMs+8qryHC80H32Jk9e0rr4zyH+lw/8XDX+4plsrxq845D9ALDE
         3Uk2+gxccHv++Aj/CtRqeMvJHyJiTDZF5inmuXPCZpMzoRaC0HwEHloc6NNXmOTKuBjk
         Yzvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790169476; x=1790774276; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=JEks3zyTKMevzI4WFusqHT1XBVoTE1QsMGne8r7dt0EIly1YMue8Yno7PA4WBVcy7c
         P+cuWtNuDyks0uJNgxI2ZtWH2lMy4luPF8Dr66MNfEfmAIMMcDxjbdvakiWS8/QfNNys
         0WiNQU1z67kNKE0+gvBOchxLnsr9g1ilrqwtjGiOSQx9B7HBawpEP2MiBbRnGhlSsYSG
         afPFKXlu2GCsuLBBAKLF5Dfk6itSZQhZ1L2XwvLbeQG8mUQdpSmDS5TU8mgS1uLILpr8
         kk71Wmxev1ywODGNWUQl92Ncj6NySLZpTNWGKmUwUDyWMvYcpZkMpb9bsnVlHRrfeUMR
         u5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790169476; x=1790774276;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DvrVvCJTQQOy2Ljw0fC6mFfv7ZDXIe713sZSc7YfmU0=;
        b=C5I3w5+FWYNB7/gsXE6OXRO+2DZqeBOwwSLU+gv0YjjPLtcPFMTw5YxOe9NYHJPzhj
         CM/S1Iv4PfSqt/6qoGo7hEzd0j2o9m8pKF4PoqOXQ+rX5SccQTITX+DNZ+d+bVDb3Dgg
         tWvehaD+bCBzUctSWZDnpAXr8pd+McEqGKiEckKFUZeXUer1LGY08hDizuniUqyu5U6C
         G6DrS7naCWP37Z63Qw77EfBBcT68MtCyBKiin18FDVd4KEimZm4nxqp4NdPAJD+g7jto
         qvNozMvZ2aJLpn+Dumm2+PiYh66hPcdgaIOo7tDEhaxhvbJE+bM/1YM6juZzRKQ8VGXJ
         /EmQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6FHN2Z0Jvt2qiw/u+lL1w87LNJCS6ruoFknmyaRmT+H6Ei5pii5+lJObF72nMeVWNeh4142EC2pgHb2s=@vger.kernel.org
X-Gm-Message-State: AFuF++lRUrhBT7blO+73ZeS3Uv7ZhJ6BShc7lNEDBPVAFQjaLfBavuCt
	WlxXa8wEAOwwoLKbnvlEou/z12W5WyyDg6nyOP3Be5zdCALhf+Bw114ZsbbldRq+BcC0IJXoaY4
	i1F5DEdlAeKdIgBhhXjI7/voe9KXnkWA=
X-Gm-Gg: AYBFou0/OYgUBnRoqeE12bttPsNBV3E7oI2SVb8pKoO524AnifjW35PgQLFVglAeANi
	R2aRcERx+n1kZzmp2jK7lgrHRBoAj9GOE6Fvl/nHBAUhUy3dPxfGn/yT5kKfRL/bPLqDpasldsQ
	QcOvKWabpD44kXerff5zPkTqoiEHqF3BKD+GUdOm0+SMdhH1nv7wJ8p4/ZWd+Uwf+n5KIlga9je
	H6nDKe+100P/c+g0sc9oTfjzIZ7MAJ71jAd5wZ31hBiq/qFnDCmsnbCXqz3tTmVHceu0PzspLHV
	zBxP9HylbMzLvUzPGfow9LZq9zLTbdvj//UsJ3a+ksGZgBTkHjzlt8oAWzdZs3JPpM5K
X-Received: by 2002:a17:907:9409:b0:c25:8e4f:6d84 with SMTP id
 a640c23a62f3a-c2aadc98eb9mr212676466b.2.1790169476343; Wed, 23 Sep 2026
 06:17:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com> <arOtU15iv5CWPUEu@oss.qualcomm.com>
In-Reply-To: <arOtU15iv5CWPUEu@oss.qualcomm.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 23 Sep 2026 21:17:44 +0800
X-Gm-Features: AclHuK-Nd-SsXdAr_w0eePSBz9cFeJT2YpbrMeoFm4kjMm3oXLxfgGRct4bNM9Y
Message-ID: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support and
 add Nord Ethernet plumbing
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Richard Cochran <richardcochran@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, 
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>, 
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

Thanks for the RFC. A few comments.

XPCS_ID
-------
Is 0x00000030 documented for Qualcomm, or is it derived from
NXP_SJA1110_XPCS_ID + 0x10? If it's the latter, it's a magic value and
I'd rather see it confirmed against the Qualcomm documentation or a
register dump from real hardware before it's used for platform
identification.

Non-existent MMDs
-----------------
Returning 0xffff on reads and silently discarding writes is what a
floating bus / unimplemented feature looks like, so I agree with that
direction. My pcs-xpcs-rk does the same.

Structure
---------
pcs-xpcs-plat is itself a platform glue driver, for SoCs that don't
need any platform-specific handling. Adding another abstraction layer
on top of it to cover Qualcomm would be glue on glue. Generic, Qualcomm
and Rockchip differ in power management, address window size (2M vs 8M,
...) and MMD redirection, so they don't share a probe path.

Pushing that into pcs-xpcs-plat would also drag every existing user of
the generic glue along: they would suddenly depend on GENERIC_PHY,
PM_GENERIC_DOMAINS and whatever else the Qualcomm path needs, or they
would have to carry per-platform branches in a driver that is supposed
to be platform-agnostic. A per-SoC-family glue driver, the same way
dwmac-intel, dwmac-rk, dwmac-renesas-gbeth and dwmac-rzn1 are
separate, keeps each integration self-contained and leaves the generic
glue alone.

Would it make sense to take that route here? My pcs-xpcs-rk does the
MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
help with the generic parts if that's useful.

Best,
Coia
