Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FF25427E9
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953665; cv=none; b=DZrNHQbalImVMyqPhLstRclrrSe1gIytaSPDO9+MOhRegVURraZO+AwYvhGUdqWTomx5q8xA46ElSI5dUdzNmLFLYEu01OzW9K+cMnW7svlHrwMFr+7niOZE5GetL3clYeXk0ORbnL3Fy7jUZfVRA3qUVWXO2P9ums2c4ak35YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953665; c=relaxed/simple;
	bh=BDAFJuDlghFFa//FTOTLPnlGuO3PdxiOtfn+DAJGPPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=olt9mz1bQExlmbCWj/OOGkNBMqNXJkM4Bu4yDpI8qfoxRITqi7V08GAZLVbYmvk/ABfSModxrm+GEFM6581NBLGGGrvXY4X+XpG2MzeZa3JBt5PaDKaqVn3n/mB21iMNWxHymyxEjYmwACs5TwxS1+gJIoVbiHqWszwr1ob6148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CGYLol5j; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CGYLol5j"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48583cb7d44so532902f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788953662; x=1789558462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDAFJuDlghFFa//FTOTLPnlGuO3PdxiOtfn+DAJGPPw=;
        b=CGYLol5jIlkPUUKMa/gsEhmik+QgSARIt+ARLSXX9m1ba7qjiAkSDdUwWcw/g49+eK
         +I8n3TtX4pujOM05dB3sFEEaDQe5Jn7L67g+PeWmvW2KuOI/8cDzwT37+b2dQFT9ih5e
         QCI+Yd6wSA51cIGewBKpC7Wnnjr5m9/4SYj85QoUM+qZqap/6i6vrVV8tB15xOYw7e8o
         rmFwMcsCOZ/LLznqAbheVeDqnnaF9Xn72q6tvjI5UTM/J1n2UYMFdUL7/m3R9MF4LmGk
         +9vuYSewCPxVL7nRpEW68c1Lt4dSlhw9x2XuAmzXLH5c/1vMNmPoHHqP240W9SQr9GyU
         x+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788953662; x=1789558462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDAFJuDlghFFa//FTOTLPnlGuO3PdxiOtfn+DAJGPPw=;
        b=UgLr/3X0XwJmmk+e3CdduguVaCCEXBuOYSYxkZ5ZIMcDK2JQJBBZbNCY2C0tyuIdWe
         1GYD1ZOesGDTSXNy3j9HNclc2BWlbPgrYH56PLyBRlOiUrQyxr80DW9EBLNMEF0g3plL
         ULO+1wMqa1UwvZR0JZksCjxHArz3heNWKGpIBa2ZS+LHKYEoRQyrZyGQFKY/ahMv9L2R
         ExpVlqbyGfJsG7EfbRfjFrnICf/6C64Gn+w3CrwqIRCauFP223jyuWaFAz7F+8fJHOBa
         58pHv1Rl0wzjeXICGtgMT4gk259c2K5dyQotBdbLLRsbJr3y/4WflHsraqLV5fWRGA+C
         QN3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwkvpsb/gD6k55A5x4oMR0SBBKxQsv6Yt6Icotpxfnh3iW7H5d+Okw8YtjImmx0B35QYBsADw/P65/NpZk=@vger.kernel.org
X-Gm-Message-State: AFuF++lJBUXJudDDWjE00c+T5/BPk+GyH1y96JtV2vuF1ybkpGvyeA6m
	hiY678hKkjeVTd1Lu4gkVQf7BC8gIMnxw5K2aKn8k28O1VDMaJbOmMBf
X-Gm-Gg: AYBFou04ZrGPnYJ2wt3Y6qyTMGQM0Lh6oV4n35cuhjKa6bQnjhQzuw/Av7rOg0Y7e8M
	eiYhuOzY4ExXSpNBfcg9LjYmIMLZUeX0Horgo4qePyMT6n8v20hS++HK6fh1jJDqORs9EsQekqf
	EcILt4uF013Nm8BNZ6dluZ0xPryRRWN3GPaTByo0ZPIe9Mi45YvaFxOQ1Qxi4dwnqkfsM80aWzA
	GHR9YY8w3PO6tmd8WwVIxFSlGV7H6rmMjnecIE5yG2NzjHqwZfzKnvPdmnvuT6QYktSdeSNkjW2
	+276J0Heo0uIk6bD483GUCSqwhFc46w6H0idJtgZmwZsTilTDRXbp96GYs3ueAQIMKnuaIcMyCJ
	YtYThuOvWe0m3Ra6LVVnGDByYBgIpTuiayewEYBhh0qlBN5N7GffFRoawC9cTLbndxHqvlgs/h0
	vnYahwps/i0DuKvMgGZCy1m8Tb2mDi/m3AisOCv8vOm8FplYyKH4CIsgx78QlddwWyRB/4JckdY
	wzpZJ7EXrMsXf8NV925K0S/8dN95Q9LcxrmxFQoGWaljuEcSK5FIk9wqk0SLvfle/iIB2bOeFGy
	TghIleo5HcSbbQ==
X-Received: by 2002:a05:600c:8485:b0:499:5b0f:72b with SMTP id 5b1f17b1804b1-49d01dcc32cmr238211625e9.1.1788953661666;
        Wed, 09 Sep 2026 04:34:21 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B836900E58FC5516AABB3E4.dsl.pool.telekom.hu. [2001:4c4e:1b83:6900:e58f:c551:6aab:b3e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm364624455e9.8.2026.09.09.04.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:34:21 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: vop2: add COLOR_ENCODING and COLOR_RANGE plane properties
Date: Wed,  9 Sep 2026 13:33:59 +0200
Message-ID: <20260909113400.8295-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260716113024.15357-1-royalnet026@gmail.com>
References: <20260716113024.15357-1-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Gentle ping on this one - it has had no review since July.

I re-checked it against the tree today rather than assuming it still
stands. On drm-misc-next (8ce26b09f652) all five hunks still apply at
their original line numbers, with no offset and no fuzz, and nothing
merged since exposes these properties. So the gap the patch describes is
unchanged: every YUV plane is still converted with the BT.709 limited
range matrix, which is wrong for BT.601 (SD) and BT.2020 content.

One thing worth flagging, since it decides the merge order rather than
the content. Cristian's "drm/rockchip: vop2: Switch to enum
vop_csc_format" (10/14 of the VOP2 series) touches the same two lines of
vop2_setup_csc_mode() that this patch touches. The two changes are
complementary rather than conflicting: that patch tightens the type of
csc_mode and replaces the "csc_mode = false" assignment, while this one
replaces where the value comes from - the hardcoded input_csc is dropped
in favour of the plane's COLOR_ENCODING and COLOR_RANGE. Whichever lands
second needs a small rebase.

I am happy to do that rebase in either direction. If you would rather
have this on top of the VOP2 series, say so and I will send a v2 once it
lands, with vop2_convert_color_encoding() returning enum vop_csc_format
so the two fit together properly.

Thanks,
Igor
