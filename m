Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FB438DC6F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 23:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788564304; cv=none; b=c/IeXMowzyISexveozvRc/RGZqFzT2r9jLinxIEv6Ei3v+E7ZEuRPa9pPRpSfMzqz9UC50O9h3CYaUYokHzsOXILonLcFXP7z3XJv9HXWzxNhjoj1mTvvxjSxvCn+/BBWO1ARCOCoFYCUfvWHAYelyX8WH0b8kt6gy+Fa9nF7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788564304; c=relaxed/simple;
	bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KWgQMuc4o4zuQcBw9lu+++CnKWvbD4+lZkIydnccLmLLydGJ05AUylj8niXLJQSl+mhCxJV+nE48yQAF+HHcfGxlscBCCyNX2A1VePMJiGbabqiinIRiavduh3Mn6fu/55EpEqN7EMTIFnpa2TdGZwYiRcHQa8PA4KIhNvkkXek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=N3zRa16v; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="N3zRa16v"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482f9309813so1431653f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 16:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788564300; x=1789169100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
        b=N3zRa16v+cz43pk6LTT/24nkrJRqiMgJf7RCCzI6PVa08F9SXLe+Ob5E/XCQq5FlT4
         iDf6+Ho7SC/QcxGAhSyPnuLHM5qu9yBRNloHTlYpjpdk/4pWwEj2URKMWghwV9aOAcHw
         PnDBhxys2tLUovBqn0OjbUDXXANcPRHmr0bOa761CzNBW/WIjNC0qh7zmbMVXBaATLYI
         m6OPzMN8ft/kR/nEYz9x1f6aflYc2iM3RPyTz6wFXesanNukdGJXSPqPl9vvIgT3e46d
         WEBh2xi2AT9D1jjoQI+GT0hV3TLD+NQm7SvDthJr/mLHf0P+KVl+tU2t+0bUO7kdaozv
         ZaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788564300; x=1789169100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K1s3LaP7Jy4m4cGgbuRjp7GOXlBBFK1CH2OoNIQ1nqo=;
        b=OYWjWObZx6JZpwraw9O03ne+QjpK+GUilvcptI15ryz3W/p/JBJ+rOyrcDvw/ph5ap
         DaWJphF8djY0NR64Akl8nMt8qJOSddIaIJl2oEt/bvQy8cC0vlC6+cFLVmYUeF208myk
         5ktRrdOC7253MuuQqz4YiHN6UeVJYF9geTyyXOpsWv5VOXD0/Dttq/jRG0R2HaETPYKc
         FoDmKWkE3Fcf5Moq3pTYmNHQtSCMnYQkk2+gf7fffcG6L8KLVf6AcTviz5QIvR1rtPkI
         boZsumUC8EQ+P/DO5Sf9yZvJKJbl4fmDWpg7zygn2rxKyC/YpZqi/OpvTpvMexagYcX2
         x8Zg==
X-Forwarded-Encrypted: i=1; AKwUvBzWCcaHZA/u7N5gYmwAlVk8OLhx9bZvBbm/cjXaM621YMXkvZrob5XxlCBebIiIdIZu2yu26vC+zcjatWA=@vger.kernel.org
X-Gm-Message-State: AFuF++nhk3M8ZpfN8jCFwUVGJIZVTu4TxnNiEqV4TxriHY/5yr1DUpj3
	b0K0mR0FyRwN3Ae8/eAA3JYSmP/ayzHctPpPQLdujqH77R7ftFQIhRfanCVSCVtgC9c=
X-Gm-Gg: AYBFou2jf+79sy9/CJSHo+1+ozc6CV6t7I3+ccvCY10zsjmkR4e67dWi9zMA01AVIBx
	5AJfugA0jo1d3xxvdkkzcjx/zG5V8wrWG9X4mT+adXrXagmrkjY+0S3CroarjAr/OZgMz/JFusF
	AtY767on2hxoqhiAUFRoCIiz9pO1ZFRjqoL2XWCp+PWQeNiB8XfeMwPlRVxw25KBW0vsPbc6CQa
	PjOVq1oUvdKvxC/BXLmtJtfKWHrtxWkEx28hoQSu8mjK0rV/GtXTn6Pwb6Yfp1rDki9gXnL1bIk
	CE6Eh7xQA0MZIi5zikUIyZBO76/30tjy8ROoWzstS6Ge2/00Dbbb4FMC3wWbigjxODWey1yt+yM
	fpG3fuex5qS6o9DL/W5DWfx1r6vbhUX3HtOI3pgz2JrLzuRgAqt00yDC+ea4mIbXAA7G5v8AhUW
	fMtFyDFXCYzlAVt7B/QAe0XKloaaxJ308HNrQ9Frc=
X-Received: by 2002:a05:6000:2508:b0:485:8c16:5ee5 with SMTP id ffacd0b85a97d-4858e8bd21dmr3475598f8f.31.1788564300124;
        Fri, 04 Sep 2026 16:25:00 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm461764f8f.5.2026.09.04.16.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 16:24:59 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Vladislav Karmanov <vladislav.karmanov.dev@gmail.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	nbd@nbd.name,
	lorenzo@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux@armlinux.org.uk,
	dqfext@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v5 1/2] net: dsa: mt7530: populate lpi_interfaces to fix EEE support
Date: Fri,  4 Sep 2026 23:24:54 +0000
Message-ID: <20260904232454.391138-1-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
References: <20260903123644.23800-1-f@lex.la> <20260903123644.23800-2-f@lex.la> <780c9e93-ca6d-4481-8709-c8e5058f0073@wp.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 5 Sep 2026 01:10:33 +0200, Aleksander Jan Bajkowski wrote:
> I'm a little confused by this patch. At the same time, there are patches
> floating around mailing list to disable EEE on the MT7530 PHY[1]. Does
> the EEE work, or is it broken?

Both, at different layers, and the two patches don't collide.

The MT7530 internal GE PHY really does have broken EEE, and Vladislav's
patch fixes that in the PHY driver where it belongs. Mine is on the MAC
side: since the phylink managed EEE conversion, lpi_interfaces was left
empty for every mt753x port, so phylink never saw the MAC as EEE capable
and ethtool answered "Not supported" everywhere, including on boards
whose PHY is fine.

They compose, and the PHY wins. phy_disable_eee() clears
eee_cfg.tx_lpi_enabled and fills eee_disabled_modes, phy.c:1027 builds
phydev->enable_tx_lpi from that flag, phylink copies it into
pl->phy_enable_tx_lpi at phylink.c:1997, and phylink_activate_lpi() is
gated on (pl->mac_supports_eee && pl->phy_enable_tx_lpi) at
phylink.c:1583. A PHY that disabled EEE keeps LPI off no matter what the
MAC declares.

So with both applied, boards with the broken MT7530 PHY stay EEE off
through the PHY driver, and boards with a working PHY get back the
ability to turn it on. Mine doesn't enable anything by itself, LPI stays
off until userspace asks.
