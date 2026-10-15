Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4C049EC40
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792053856; cv=none; b=NyYImFsN1QRLyHD79rWhz2OEsuC9Cbc0G+c3X4E5Y5av4FAbmfOudACw6K6sybgkuiYzkXO0Gzk93bpdSMRNa+7g6yBOTtQtoVMqnp7t9rcre4XzlXo7+Uq3QZUtng+4lasNz7ckAI6qXpgj7UvRGrPFzICvKCt78Orz/vO/giY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792053856; c=relaxed/simple;
	bh=SlB68F3f+BdlirJUEjyixhDsOheZ/zyFCqTY5noaKsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=akA5Sx0eUXIxrAE3XNl4Sv9b0tF6wBZedGptjspITHvGoVpipB4hDtaBrGLKjMa0nTn7qSzl6pDfQjtNOKi/QplQDt9gLtukLA1NBQrbxC31NMfP0E/+t/EJ25Ecki2OZDc+K4ufvP27gDbbGnGxIUmxR1XEmr1Knt1hClkhgxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Qu38pjZv; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Qu38pjZv"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso16364515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792053853; x=1792658653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7CSJIT17g58+oITTv0q53z5VUcT+bUH2Z8uN5LCucOA=;
        b=Qu38pjZvJ/9yhCQf/QKDuagSkuepfr5Kk4tIXVsmZhlVJ/NmU/xNH8es5/NAEIsURr
         yrmv9zxxVdZYiRB2SrFmfZYTl/wvPWUtOWhcyZdQI+x7U3A2zKuZwiWQ6z/t0oDn0xw3
         nUXE/xKb8VNb9VQF7TLqOuEtHg4nMfke9frKMXzHZLx0M0Y8b4l8Qst9eiJ9uIfrkqVo
         7SybQMAYfEgETv8MPcq2JMabHLhSg2gR7tpiMCubNSVkLMl5J7vhr9gf5BavxFLBBiog
         cnLE8Q+afMWLx4G8S2fD59alFjbU2N/25/ZiDwdvWe9CFq4QBDFc40wcELPL/AwHOq2g
         PcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792053853; x=1792658653;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSJIT17g58+oITTv0q53z5VUcT+bUH2Z8uN5LCucOA=;
        b=nYPIkMzmaSoig3oyASK+a75EqJDBLIx03ypOWmCUgtkJargbmP8RiNlhjq+KUqn4TS
         miCvo9vBEf3rfNkqMPuyn6oefbD7WuJ8NHLnVoVAxBTpApN19sB4IjZWr2DZDrxYCegB
         ThgkUmAyorw2zIzMJ/rKxHQ4ITdfid64SFvjx/WtgDHzgeXisDVS2ZfG0R7XuZNP8pwR
         WEhS7qsY+0Jh1gua3xRfROEQ4TzdfAZn60KzMh3RemFXX6vxRpYU3qLhbOv0QGli5GYJ
         BPbUDFqabW7SWcRrrgn+7Jhe/WtTpD5yAL1/m3j0BXHxwGyZ49xesq0HVtdwK/oXgeEC
         LPoQ==
X-Forwarded-Encrypted: i=1; AKwUvBzBM9yFdUaH4ykIPxmmxYqykedhhj7ngm5+u1zLyDolSbp4nhyPvDi2PKov/3oKi4K72mt++wyJuS2AsdY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOTKsXYRdN/nc4Vk1c6NI3m5ZRUQRACwdM323HDTjZNZk5kHwf
	8Y182dsH6iqhQF9yyiU+dkYPGOpyGaXvb69FF9kGAWHUcjJhGtDw6j/+c3dET1EgwRcFD1gXEHz
	ae4yW
X-Gm-Gg: AYBFou3Ke3fw5kTAeOOdV/n8hARq4oi8zVAJBRTHGLh/cOIEZpH/9CeTc6U9uhJrZ7r
	0QA2XK1+Iqy5mscaM36CEtDclc19zgTb8hAflGRmxfHw+O9wYz32X2xGvu9tEPHHisl2rflNoKD
	Zn9wHlp7kfT6je2a3qOUiFt+NLHP69cSQXKfo6/vxd1zEosfkvGEyj4xBR+9S2Wn1wE+qMY4ZfV
	FP/OHT5WZwO0zXGAPTc7+91cPChqAn4xOxanHnnT5kFm3bVyZspuHtWK8dCqJIsDBKqd0u4rOeI
	gxUrgA300+MCvucsbThfqbPYSzTq7SzP15T3Pa8nlFXcFwM/gCF9O5okEpYufZsu/9wBgVKSKzI
	hGEzqk1+VNaWW0LIXgqxtb0BCFtDfEmt+brMXlcwo58CTen5l8b67M3s/5a6b3LQT2kt1d1iJeh
	llcvouuaz4NYHpwxftUlZpYkCJgtVHaqz5TKeEvXfb5Q9EOoah0s01/voGyVO78mcTosIeL1Rwz
	bKinzPFZVUM+AQ/pyUD0VKpuRherzoy7vP7IvUutrvo8PJs0YTA3OwcA/4+VzTZskEGr0bnu8UD
	ucysv3Rav/kWw5vjMR7bGfFVlgU2+dPd0q1wtLWouIY1EQ486BA6CuY3NRU=
X-Received: by 2002:a05:600c:c092:b0:4a1:9831:a69c with SMTP id 5b1f17b1804b1-4a19831a9f7mr220004565e9.30.1792053852671;
        Thu, 15 Oct 2026 01:44:12 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd993caesm110794555e9.12.2026.10.15.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 01:44:11 -0700 (PDT)
Date: Thu, 15 Oct 2026 09:44:09 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Alex Elder <elder@riscstar.com>
Cc: Andrew Lunn <andrew@lunn.ch>, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, donggeunyoo.kernel@gmail.com,
	ansuelsmth@gmail.com, mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com, danielt@kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add regulator
 management
Message-ID: <atCSWZQAyqvz62_K@aspen.lan>
References: <20261014172300.292324-1-elder@riscstar.com>
 <44a96544-5ed8-4bdc-8757-d7413e221f40@lunn.ch>
 <4c0d9a12-6236-4bc5-949c-62a092edb0bc@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c0d9a12-6236-4bc5-949c-62a092edb0bc@riscstar.com>

On Wed, Oct 14, 2026 at 03:41:20PM -0500, Alex Elder wrote:
> On 10/14/26 12:36 PM, Andrew Lunn wrote:
> > On Wed, Oct 14, 2026 at 12:22:59PM -0500, Alex Elder wrote:
> > > From: Daniel Thompson <daniel@riscstar.com>
> > >
> > > QCA8081 appears in embedded board designs paired with GPIO controlled
> > > regulators for its power rails. Add logic to allow these regulators to
> > > be turned on during a probe.
> > >
> > > In order to avoid the complexity of tracking state for suspend with and
> > > without WoL we take a tremendously simple "always-on" approach to
> > > regulator management, essentially relying on BMCR_PDOWN to conserve
> > > power when the phy device exists.
> > >
> > > Signed-off-by: Daniel Thompson <daniel@riscstar.com>
> > > Co-developed-by: Alex Elder <elder@riscstar.com>
> > > Signed-off-by: Alex Elder <elder@riscstar.com>
> > > ---
> > >   drivers/net/phy/qcom/qca808x.c | 30 ++++++++++++++++++++++++++++++
> > >   1 file changed, 30 insertions(+)
> > >
> > > diff --git a/drivers/net/phy/qcom/qca808x.c b/drivers/net/phy/qcom/qca808x.c
> > > index bab26e4c61408..6e2bd753257d9 100644
> > > --- a/drivers/net/phy/qcom/qca808x.c
> > > +++ b/drivers/net/phy/qcom/qca808x.c
> > > @@ -1,6 +1,7 @@
> > >   // SPDX-License-Identifier: GPL-2.0+
> > >   #include <linux/phy.h>
> > > +#include <linux/regulator/consumer.h>
> > >   #include <linux/module.h>
> > >   #include "qcom.h"
> > > @@ -181,15 +182,44 @@ static void qca808x_fill_possible_interfaces(struct phy_device *phydev)
> > >   		__set_bit(PHY_INTERFACE_MODE_2500BASEX, possible);
> > >   }
> > > +static int qca808x_power_on(struct phy_device *phydev)
> > > +{
> > > +#ifdef CONFIG_OF
> >
> > Does this need to be conditional? It seems like
> > devm_regulator_get_enable_optional() should return ENODEV, which you
> > already handle.
> >
> > Making code this like conditional makes build testing less useful,
> > more combinations which need testing.
>
> This is a really good point.
>
> > Another option is
> >
> > 	if (IS_ENABLED(CONFIG_OF)) {
> >
> >
> > 	}
> >
> > That at least compiles the code, and then the optimizier throws it
> > away when it sees  if (0) { }
>
> Yes I like doing it this way better.  I'll modify it
> to be similar to this for v2, which I'll plan to send
> tomorrow.

Reading things back, I think Andrew's first suggestion of having no
conditional might be better.

devm_regulator_get_enable_optional() is log-silent on failure. I suspect
the reason this code was conditional is that an early version used
devm_regulator_get_enable() which is not log-silent when it falls back
to a dummy reg.

I suspect I was more influenced by the log-silence than the marginal
code size cost on a CONFIG_REGULATOR && !CONFIG_OF system.


Daniel.
