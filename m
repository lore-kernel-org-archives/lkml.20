Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCCC2D7DCF
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791847852; cv=none; b=sWTRQSUwq/ij1ti5TGq2NiVn4axdhRjhuo1hfFxWeS1T7CCIXqCU4Yffe+6ALYgOrjcTqyBvAfVheQnt6YtJQDQIJtOX+OYN2T7NW3oKxlfLFwn0T2XP3X1XXfETySRevPa5BlsxWbF/F1aKEdgCFBNeUXq2yGxhWtYkkwegrXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791847852; c=relaxed/simple;
	bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbUWLhBqR05ix1oqINaDoquMtiWrovjVfau3RakfYwl4xdSJ4uQNUCaz0f47lw7RUY+4X50OMC2WrOtgyVeUecYSxkp7mRsyGZfzSfi+c/FBo+nHHivSTLy5f+lb2LYGISfc/mMSWPNUZv4gpESUfd6Z2ZIrzS9lvyN6v59NLH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca; spf=pass smtp.mailfrom=metarealtyinc.ca; dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b=ulIy9y8o; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=metarealtyinc.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metarealtyinc-ca.20251104.gappssmtp.com header.i=@metarealtyinc-ca.20251104.gappssmtp.com header.b="ulIy9y8o"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-917c04630c2so32139226d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metarealtyinc-ca.20251104.gappssmtp.com; s=20251104; t=1791847850; x=1792452650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
        b=ulIy9y8o4O2E94fwzxN7U9uxpuwYDq7AhA1xg6LvzuQY3SBl/y7kQRRst3bI1oZXPk
         u4mHEfl7mjwQlcXRS0Iklp7AHkrkVSHYrYiq+qOfUZkFg7scSiGz7X7CmHAY+9RF0TVA
         R4lFbTHQ51iVXVNhUda08YHingt6vy7kZlwApBxAGvDCQiQ3ZcQ5VnE8uEdE5xXJFkb9
         n+rROulP13L3dLWk5Knv18e0mE8I/gd/gDEU7Fg/n7oh0bZOrSZfUxgz1WU2BeY1nQxp
         JrFW8v8CCQorMM89/K0t6LPTe2qxitk0ZcHfGu6IcAx/ZFJ6i4nJ3Fn/o69zfeQ76yTT
         ma6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791847850; x=1792452650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CfunYNfp8YoHmHdRkHWuL0TCzYiZC7UIKmuNtNZSoPw=;
        b=rLjS0+9S5AxN/hWluiHcddm5NrcO7/E/a441uDzEJhjka3kPA0kxRyl9Eii8t4evBN
         2Q9uviVEZ8BiS5xOgCZTcB9hi6x3Ze+DSKenlM5qC/YW0SUJBI6RQ5KP3TRu+8vrLCk0
         8dp+0zdImzMeHn/ALx4TQJmQALTt0Jj0anTKdzC3wMDjSdD2n5LQ75OaFTah36jRq72D
         ypzALm18wTQsBD15LTo5SnaUMKtdcdUamPJYu8iwAmZnSmdpa63J4F5knlwvNXQMPlGR
         hOOtlty8zJiI6rTL8KNOpuv+lbb8Rf73rp3SoCK5tGunWQ0ouSoAs7Gjzh5nO+d00+Od
         7vWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmOpINFCpCcVZmRyeAoRxL9Kndp2nylk6Q2XLKRblZCh/MtSOehTxxxANDymUy9qKgIJ6eByvbn+6BUf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmBLtv/iQE6oBYrbns71JGJyqRxnx0DJ253Z7FfBwLgyJ71WnN
	N1a0UyHqnQv/Yt86TzwWl3+/MhT3AlbtIAybx0n3p94aU2mRpzQ3x7ycYzOStpGMsgA=
X-Gm-Gg: AYBFou1SYgH9QE56YoDyVDO0vmYBuyHRgt8oeCYZO6FXQiPIpVHA969UUOEXfx+Yr05
	AcTxwGm53UGmpLI4hSN8S1XQVT1HZaVGU099t/wK8oK9HgXsK4E9fs0t6i/YMjTcEDr/SNB60oy
	+Rx4CsB9V4ReYAK4VTyGEM86huxOVN5ZEqGonO9Zoob28M+MqzzEO61JYaoy/ZkBuOmc4E6h3Ps
	l9wHT19QpucKa+wS6oXKl3H481iZ8+6vRMVtKYs5U6QpmJUsBRblFb8sCsFHxVicyNXaUV+gY9N
	XaJpyrW+EGBjawP5Wy5ntkfg+6Sa2CkLxBLeyxhAMwBMXD9BcAdkpUz90bRMCIJkLHIoMmWyWFx
	/rG4KL4Tf0TWI7bOEFZEBAL1bBHSboYCHH+O4VZJkDKM1qNwjD23y7mBYsOcBIIGAItxEhLxjsP
	oEQlq8R1q02mhmgC9xErcSQCjBeIxWCk6I4Y7FRQSJPo5s8YPoinovMwemX5bQRBuRgMcnylOMA
	8OEDWmIxgh2/GvwVBoTEcBG8S9KgkVsPzKnHrl08jZTaTgl7ECCYncEeqFyFgmgJ/cuofDns3pG
	0TlmfwfQtBb83Ik1TW1dUngsi9PmIbNc5mVbbo7Zl14cLu5X8LUZJQ==
X-Received: by 2002:a05:6214:328d:b0:91b:5d3b:4abd with SMTP id 6a1803df08f44-91b5d3b4da4mr183530656d6.50.1791847850247;
        Mon, 12 Oct 2026 16:30:50 -0700 (PDT)
Received: from jake-laptop ([2607:fea8:e5:500::662b])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm10654626d6.14.2026.10.12.16.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:30:48 -0700 (PDT)
From: Jake Steinman <j@metarealtyinc.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ramshouriesh R <rshouriesh@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Eduard Kulyk <kulikeduard89@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: staging/ipu7: Add 10-bit greyscale capture formats
Date: Mon, 12 Oct 2026 19:30:47 -0400
Message-ID: <20261012233047.1026925-1-j@metarealtyinc.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <as1QTFB1CRDNxAEY@kekkonen.localdomain>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com> <cover.1791608336.git.j@metarealtyinc.ca> <5423f57000600f27626ff785f80f94d3e7ad1106.1791608336.git.j@metarealtyinc.ca> <as1QTFB1CRDNxAEY@kekkonen.localdomain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sakari,

On Mon, Oct 12, 2026, Sakari Ailus wrote:
> We're about to remove the ipu7 staging driver, therefore I'm not taking
> non-fix patches to it. Can you se the ipu6 driver instead?

Understood, I will drop this patch. The ipu6 driver already has Y10 and
Y10P, so nothing is needed there. I will retest the sensor patch on
Panther Lake with the ipu6 driver from media/next and send v2 with the
result.

Jake
