Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155D550DC3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961659; cv=none; b=vBcr4ocp5vBybTOsJzyDpblzEnbtVOggLva48CfdSmET5RQkfYxk6FmaqrXdvYMJ4K/A2ZA493Mhc2z1hAtf85u+s07sgOkNzXAT/xsnAT5hWo/DTkyZGAcOypjjj16P33vIWIaG/L22eYmZg4uwT1RTTbVTmWAsNodzpC+WemQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961659; c=relaxed/simple;
	bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZF4ctWvylgjx6r02NrLM/Cuna5m/eNmXZHS16QqtLPotwNuBdQqLOFGQMxfnbHMk1nAM2pRsQp1u9pw2A7BoHKTCPqeLqUj4bVevTn0v/Jt/m7vi8xyeptvRR9PXPPNeSTrlZepQZ/Bio6Xt+3xEFGsqowCi3fHHdahw4+vD4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JUR6OybP; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JUR6OybP"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c86945164so60619061fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961655; x=1789566455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
        b=JUR6OybPqamijSbijCLaeZ0PPNmC8kckffNpbSNDXwDfqetDAH4WrUf6O2Y/z62ab/
         AdwiohKxoxZUQtO8HNsrraBWb0q7yP5XbbIa7vmbQePyeohGnLk2g4T7us9z603f+YWK
         5s3y+A+cQ+6Uiyj/Gh2obsXae5WYm83xbUCP5Xpp2rdtFKNMRNdae0e8d/ypzLBj6NCy
         VJwAEdon30vpDlCWvyj49v92JXAA8p8R/hdYjIrCFN+4so+aSC3z9Wh/5PJ1e6JVXSzT
         lFs7F74nywdROI5Th0Vow8kD1WOap6/iSLfotLL30JQQswe2+E79lK8SvkV7S+Jz4GQ2
         eEMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961655; x=1789566455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CK3Qd7JtwaCS785oIL9SXaJ5indJD5W5VLAi3IhI91c=;
        b=lZRbcfc5ah+IqZ9Mzmm/6WAKrHD34694fcdU375PVP/aZJZL+AEjrLcXAhuCDNgeSn
         KkOJutKs2XFWTGBxdTDJUYCPlrhHYden7h+T/jI7CHYFsT+I/CBrz5lAM1sU9dWlUbOr
         sAfwbDAvIZDHu3sOpVxvCYLT/Y0kS9G8yrW74++Q4p5Jhv6Kmva6cO5PIMklfR0DbAaL
         htqs7M3YoU73+acPqkgQV4OSHsQ7IVez4KPtnWn4kj8yzhV37xTLPgu7/xWXPyfV8LAE
         +LXru/Pa8x93kgthFXrf2JSD10wkfnrKWE+D45wZ0rBguFV4W7YoMqC0jSeJU0GuFycq
         U4zA==
X-Forwarded-Encrypted: i=1; AKwUvByvAfWdUBv3J02fv/mRitQ2DogbiuQkA+3mTcLHDmzWw6iLfvetTQ2k61WG9NdodfGSoiWJZh3rZCZckrQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mcdWBJjUTcLz3pr++bOgc44e3zYyWvCWK8Vt00IguswKLpKBte
	3gCp8UD+iAl3F1Vy3TW+tk/ZZ9URCJWAcr2/tG4Ga3Cbpn8CPnGMbi/+
X-Gm-Gg: AYBFou2LExrAXUFmPNgEQwJ54WZMKAYayQ6OMZDkJDcEEUG/GhsYDB1GLsuwdcjwfTW
	pbE7xrzuZskTeZQ0KIuPq75bivaTZ9D3nKVQgzKnzgBfGQ5BoeggRfAC/PU5BvwJmjsGpns8al0
	qXG8kFrY8/88ceZUN9D/5jLJCxgOt4bSljJnzurS4xDhuKpq5Nbhh+BSdzUnQszt6j9n+trKCBB
	22hNGQd0NmXbjUUXh2AJ4/bnYbLih63KxOpFnXEVzBRaS6FpBedSm0NBR2uXL+YcUGSGejQEPI1
	ga0ljSV9seh5QAMqKAXrPbLgUKzgb6h8drpZyz6c8FD46hbb8cE0UX+GiBZLbRjoM/ed/0rrOSo
	WDalLU+XqsU8a1DqCH6VgSAT5seVpNdEllzjNtecb+H/+kLzm/zNGFkiYDLg2MNbI+iIkoSh7vv
	EvwcrZcOPNpiDuyIhO/1wCUhL9h7UieBaMbyrxOfAIv6rJGOBSv7jaMpH2NgIT8hpJf+h7GFxu5
	57NRNZbs69afw==
X-Received: by 2002:a2e:9fcb:0:b0:3a3:7681:6d72 with SMTP id 38308e7fff4ca-3a37681756fmr35983981fa.27.1788961654972;
        Wed, 09 Sep 2026 06:47:34 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a58f539ec8sm136161fa.12.2026.09.09.06.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:47:34 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: diederik@cknow-tech.com
Cc: heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add FriendlyElec NanoPi R28S
Date: Wed,  9 Sep 2026 16:47:31 +0300
Message-ID: <20260909134731.364-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
References: <DLAPRUR4Q73F.1KIBGA408LQSJ@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed Sep 9, 2026 at 12:29 PM CEST, Diederik de Haas wrote:
> There's already an attempt in the works to upstream NanoPi R28S support:
> https://lore.kernel.org/linux-rockchip/20260907-r28s-upstream-v2-0-21ab570fc91c@proton.me/

Thanks, I had not seen it - I searched lore before sending, evidently not
well enough. That series is further along and covers more of the board,
so please drop mine.

I have the hardware and will review and test that one instead. One
finding about the PHY reset has gone to patch 2 of that thread.

Andrey
