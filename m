Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793197376;
	b=PvZ/HV/W5IQyR88482ZOzXXC+nFVkN/b5n0lfArHEuskdB5Sh8kkQt8c5Y8fYS1kq7fA
	 ftEB1RjAOa+Q9X5t/BYMFXNiynBFX/g4ziXesQPCN87e5lIxBoFlN10uebMGXmhncYjVP
	 7vEydBOm1TLEE5PGlZJuA/S2PGHWykl5TThh13bp60joe6P28AaqlOQhqjmKBy6q6113L
	 pNrmFslEOFK4HBKtWN8wzJcg27UNlMIghm924ZgqQA7mV5iaqQ2WLXDkgog6cLScClHT1
	 dVqwVAPbPyclskLRfwW6JE/4fGpxH0NX5ZjfQDf+Yo13njBoppHTQ9oioX4vRtnSCUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R3r/3ZU1ASS4zexAo6qBQYoR9NBo3ie0E+cmGO2ebcE=;
	b=BPf3/3/IdNCtmXfWU7ivS15gc9ybdAeynaEP6qWd8B9/TmkUXNvHwUfq7gtia4Xd2mEP
	 7JVubANYJR7hdbkE64p7I1x5XZ269NjZzzJtTIxsDTbxiJIOZ01F05XCPwfbgjW7L9P2f
	 H5FhxZqEA4B1H72jlYI6NWKkibXsQcuQp/Rs2f/NzbOPhe64cbzwUPjRmii8ldFrCHTJi
	 2HIA86LHKeqLn4pFgLjeB1As8fGsB0aX553/mS8/1d/W+oO8nuns8qPVeXk1hxEx/h+7P
	 jG1K9y5TiV5Km6mdpjAnOyS+e6eWm/TSyzOexTeuWKD9939TstDjAH813GKmXFvyGgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjcfw3PA;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59039606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:22:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59039606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjcfw3PA
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a089dfee18so1333828b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793197376; x=1793802176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=R3r/3ZU1ASS4zexAo6qBQYoR9NBo3ie0E+cmGO2ebcE=;
        b=gjcfw3PA9hInUgM1/7h/j9oC2YHnkcn9OVoO3vBpXmAhWqvMOplncuF0jZhVSA64lq
         muwaNSN3eWHCy32PpAxV3l2LD2znF8xz+HN/+FtZ5bKJ7oPTnyG3ferbD2yWEjpbHGJT
         fOrz592h6KkbIurx7vayadNEk7tXXcpkJRvKyQdp2UlDP4pFA1F9YeBewcquw1QQfrVu
         rwfPTPXl6eU2/IlRBzqWIzNdiq7zWfFcf2ivaMpGCz/sAD/Ph15Le9V9y+dkbeZDtYOO
         9C+Q8v/HReRAVMIXPQ3PGfDakfNqRAISnC9nLoe1FkjFg0BaIc5QgtBw/z6d0HjYfwns
         m3MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197376; x=1793802176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R3r/3ZU1ASS4zexAo6qBQYoR9NBo3ie0E+cmGO2ebcE=;
        b=LE4aotsJ3J8e4Y7F6Qd7wMRKyp7QgvnPd1NwVDWYwkeE+FLWljXEffyfloh2bAij2M
         pgf9DCDbnzEnd4Lcz2x8sD9QAyFfZ1uSyGYbsleNQgpmjBX/Uz7mkUqTZ2vgj1NIOWt5
         AjgLrJLiwTD6+l8qYi7QL6Co+il7Xo6z6Hbw4L3SdyAkK3feHeF63hcAs8u8WTK6i0s5
         dHzzVbD1iGVw2UfXtSbWKviQwbYGyKeMSNxRQjVvvY1MnsO/oTKHDLdb9DwQOwWMiUFb
         3nXVZ0BKxrJnw8Nv9rLKiX5V/D0+mrXOodvSZPWWhhB3rXAEZ4ORtCRRQCt5Oj1Zp0/f
         TfMw==
X-Forwarded-Encrypted: i=1; AKwUvByWNtwsTONNJ9jeh9jnO/cZCkGJMeqIm2vjGc5L19EgI3GOSMeKsUu9rBRMQNiNyLVNaoQIeO45/xAOlqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdkI7Oa7f50zES2kfGMCncT5M9eWBRreU/QhY1comH8hbEE0+n
	Y8+0ieuSTnHqjs+dG3fJ67LoCxZsBaOVjCfb5d3z9rBpNOOa3FexyswUruayGVs1m6I=
X-Gm-Gg: AYBFou3DB+f0PRV42NPHr3z41XRnUWBcx6e3idysFnB87/Dpe9NIYdR2JgONHYLzJnD
	kav159DsZRWepFLFx7/AOtVvXeea3+BOCFhh20Ztp8okR5zk70QPldgVPkaX20+Oa3KfaaxOEh9
	+/88il+okb5rx8zt424FMxz5BCDkgty0f6acA12PJBakmOF2CsbBgyVm3OS4nla1iU2+2p0CT36
	ZTGMim7DxJI/os/7jC2GdD8jFIoURPT9lye6TfbwU7RtTrVbWgDLfWVpAEElwwp3kbq0uF23CS5
	oQ6QfavxXA3iQRcbYeWFfhQb9UOLEVrLtG7S7Hqhu0qpvpt51Q++FZ2fi5XfTWgivIJDbINHofS
	uSH6H0AEiLelagijDYElc6VmzSY1fqYB8o0JHbC3y8X13DaQeQpKtrvsA2KQIEnfTaOsUNbQnID
	bos21bR/s7TCqP3cs+/cCU1aUZHhco5lqigIotHliOJDqK/arULwq7+2jdFTrULUHqjSlgT79ji
	G3KQE+HiK/M+PHlqY6Ni9P8txZVZbHh+sbgoah3Mca55NavEASzhtwQBn4l9GkoKyij1TpNLEJK
	upRIIVF/uJsLd0XK7HbRTfu+QBeMdtvJWtK0M5i+lLfHgFLAnia1CWujiVAatPBrwu+j
X-Received: by 2002:a05:6a21:b8c:b0:3e1:2c06:3a51 with SMTP id adf61e73a8af0-3e908011755mr790326637.2.1793197375307;
        Wed, 28 Oct 2026 07:22:55 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a662ba00sm1245181b3a.23.2026.10.28.07.22.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 07:22:54 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] wifi: mac80211: enforce IBSS station allocation limits
Date: Wed, 28 Oct 2026 22:22:33 +0800
Message-ID: <20261028142235.15428-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 prevents the worker from installing more than 128 stations.
Patch 2 bounds pending station allocations to 128 per interface. The
patches are ordered: the insertion recheck must precede the
pending-allocation bound.
LLM assistance was used to review this series.

Zhao Li (2):
  wifi: mac80211: recheck the IBSS station limit before insertion
  wifi: mac80211: bound pending IBSS station allocations

 net/mac80211/ibss.c        | 21 ++++++++++++++++++---
 net/mac80211/ieee80211_i.h |  1 +
 2 files changed, 19 insertions(+), 3 deletions(-)


base-commit: 25e73f1d6868c759c8eb56cad4e411692c5341b4
-- 
2.56.0

