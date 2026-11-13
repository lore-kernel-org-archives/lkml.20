Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584536;
	b=nIGjdznUhZcI8ghnjViJnBUfwcYmU3RP6mgdbbCh1mMbW+r+cgII7pQoduNXSnztfjXq
	 QiS64KVcPM3nEWLAQch/3OG+6xfWAyO+Yspj5CEqfRlyoLXCFto0AfFUpnEqrRsZIiJpu
	 06dAWpmtcka3ZLMKP3bsVFxxlhbVW7tAfSityl716gwLhCrz7KPLkmYjAAgBqeqJR7GSm
	 RwgezasifB9fBhgt9po116uojtzX/poJY1G02Q5hfBBIJY1ktoEGzd8r7JF4I8n0hpSdA
	 GkhNgJcFwSAivnYMerecICqJvb+Q45qaffXPuTWIcMzW83jrK/vyQXOTSJlXE5F/2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584536;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=rHB1s2IjKO7bwiIKX5FWkoy/jmzbxhzjzTrvBEzLn5E=;
	b=kG3ldf5CvFQlLA6SdPpW5OqlYNPg/XDEIL8gmVgjx9kosAT0TNBG7fK1kVcchpKf+iTb
	 lHpWWOeaD5oyWsiR/gFd/4I0GcFup+KFFyY2J7JLLQQ1oFgcrmTXiWOIAa1Wr4eEL9FIH
	 ZswfJerNhSYO1m6ZkdM2r+jC/8OreEQe2HUyxG964J4n29G/pIfoRuRceIK0y3nsxXaT/
	 E8DH7XBcShtlyWy3Mhb3ODR42pVkKbqywblWXxnUK1crRuc1EnAs7d13uKaW0IWBv5PBR
	 gD10DwhQu6QD/GmENJr8k+NQrLIKr0GOf6WlOtRqZ8dSEODXCklCJXOl19MhT7uV6qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nFxA6vUo;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26B2606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C26B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nFxA6vUo
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 951FEC4F755;
	Fri, 13 Nov 2026 15:42:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C707360015;
	Fri, 13 Nov 2026 15:42:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 216FA11BC11E7;
	Fri, 13 Nov 2026 16:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794584527; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=rHB1s2IjKO7bwiIKX5FWkoy/jmzbxhzjzTrvBEzLn5E=;
	b=nFxA6vUoH0x4DTtoCgCXxJmVcI3pdkHLUk/3kmd7oD/49D39QXUjVuJLZLwTecCZkhIcNl
	PXCqJZXRvM/0ZP12N5JH5FNHiMRoDWR+gPyByVcVZ6HeiMGWoCNIkCLClvZFEwvruvfKI9
	ZzDTRQoYOrCsfLu8mtNiKhKFbw6z1FlP5h2DnU/dTUgLuHPXxJazAMbnatXFvaqOOqF2Ah
	DZEReUJk6f4zc6HkVPom4VPQXb74rha0hpB6vWrFE/6v199j1bALFfj54wht54zFUYswX2
	SvwVzQBX6uUjEBLD4nfOUhIiIHGHUp0/Tlb2FwSbVdwqlImG9cF39sUgOlkdvw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 16:41:56 +0100
Message-Id: <DMU749TMB523.3OCGPYVI4NZDU@bootlin.com>
Subject: Re: [PATCH v3] drm/bridge: analogix_dp: use devm_phy_optional_get()
 for the DP PHY
Cc: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <dri-devel@lists.freedesktop.org>,
 <heiko@sntech.de>, <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <luca.ceresoli@bootlin.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <simona@ffwll.ch>,
 <tzimmermann@suse.de>
To: "Jun Yan" <jerrysteve1101@gmail.com>, <damon.ding@rock-chips.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.22.0
References: <385a67f0-e5cd-4dba-9b9c-5b766462c6c0@rock-chips.com>
 <20261113131248.2804840-1-jerrysteve1101@gmail.com>
In-Reply-To: <20261113131248.2804840-1-jerrysteve1101@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello,

On Fri Nov 13, 2026 at 2:12 PM CET, Jun Yan wrote:
> Hi Damon,
>
>> You are right, this is really a valid concern.
>>
>> If CONFIG_GENERIC_PHY is disabled, the old code could still proceed and
>> keep the driver probing, while the new version would return an error
>> directly.
>
> -ENOSYS can only come from the !CONFIG_GENERIC_PHY stubs in
> include/linux/phy/phy.h; the real implementation in drivers/phy/phy-core.=
c
> never returns it. And the stub for the optional variant returns NULL, not
> -ENOSYS:
>
>     static inline struct phy *devm_phy_optional_get(struct device *dev,
>                                                     const char *string)
>     {
>             return NULL;
>     }
>
> So with CONFIG_GENERIC_PHY disabled the PHY is still treated as absent
> (NULL), exactly as the old -ENOSYS branch did. With CONFIG_GENERIC_PHY
> enabled, -ENOSYS cannot occur, devm_phy_optional_get() turns -ENODEV into
> NULL, and any other error is still propagated - same as the open-coded
> check.
>
>> It should be better to keep the -ENOSYS handling to preserve the
>> original behavior.
>
> Overall the behaviour is unchanged in both configurations, so no separate
> handling is needed.

Thanks for the analysis! Cna you send a v4 with that explained in the
commit message, possibly in a more concise way, maybe with bullets for the
various CONFIG_GENERIC_PHY on/off cases or so, for readability?

Reading it now, this v3 commit message kind of said the same things. but it
misled both me and Damon, so it's worth a clear explanation.

Thanks!

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
