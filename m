Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B224446E6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022685; cv=none; b=haYl22H+55NL7buvvIyNA9VS+XndSL94Bt46/Q3lKPPkIvYFdDlk/LyljoFPc+LQkTOxFdQ889h7o58x6IU6H/TUZsZyMlAtJaVa9yz1xbbWALkopkML7tdXewrcW4XdQz7aQuzrtgGEd7iumGeno0Li9UgMmDmACZSeaySYqPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022685; c=relaxed/simple;
	bh=pnayJK0aRKDq7Jbu/OHvzxsIYXYWlKbxE4eZO+QNxF4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XYOmMvhU3YD0MKDPoPTq6LLJd1Xee4KhupKM5JwY9L8hOrKSZGCIzuNan67aVo4qdJqMaTR4Jtb8m9oYFROCtla5cwcNWZfPDA2EmXhKqeGxEZ38J+TAOcXX7kdK6YquScrwvK0k38AAyVheX9+0ldy1DgzwV32ncuzKl3xk2og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU6gjPq0; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU6gjPq0"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398c066106cso2703097a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022682; x=1790627482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXhTgptF1Y/994bgKp5O11PBTzrsqIg4F70/24Jclos=;
        b=bU6gjPq0XEiy8zG46DMKRilD+2cvVMOnJA555n4zSq8tsObSBItUW+WB5mxhB2KHqz
         uAupoHmFYClw76OA7dpiqJ8uEBsAugEe1BCD0hPEl/D7/IYPZSvi4k/0IyZicYkIqN2e
         1ZYE9W3acdasc+I7iu+M+TyjpFMNvl0ZZpMLhavQ4p8P80XIypgCWoR+xXOsXN69/Owo
         hIYYyHLqoljLtWfvuu+lbpmOJoutvAjh/GLn7ueHK/YN5SCRVVsCsS4q7fC3tDcJedxG
         BvLu85ZtTJ1VxXX1FeikPoczSQHLsPjj1/qCAlXzrKHh3cYO4L2ZJNA0LYwXfdDgWMGA
         KNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022682; x=1790627482;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXhTgptF1Y/994bgKp5O11PBTzrsqIg4F70/24Jclos=;
        b=URao+pZmTUbeA23HsJ26aVsRjJkTK87yCYvdiZHOl7JPld7+oHsWmbntgv7wA9woCe
         i3OWTL3pdtGTlz23f5wsgx5cHKpV/zILvN2zeBCgCvo0HkaI2sQF+wFR6C0PiN5yo3CP
         49qu9e0iV368Jy2uUzV/stW9gBMO5Aet5Jbm40zdvhfSTl9A6RfnNbFh36B8FHUkvd0X
         +bFTg1U29PUU1AD3c06GEgbxDKe4s2t9mlq/aTQZ65XgyBUoauI77trcRxiALMK7CVRN
         +mb4APfZZn8J7knjEErYE8p1cZRD0kxKcyjekJBPlLRTkLbYC/mqBs7W9hONpBOLC+M+
         nuZA==
X-Forwarded-Encrypted: i=1; AKwUvBzGbIUkLZUVQlmQb5UjzNjSBvOoshyiHJrsau6WmfQh9DvP4/Dv7Y/Vj0CygzVm5r3K5Kn/so6rVv72MGQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k3sMoUEPteUw8n3NpEZKdyH8Xmz3dQdCdynq/GsUTrv+JEAu7u
	Um5tV1t4qGmOL3ra1R1HBvO2Vvm225NPxzdRVBOKwynskM7OPVKyYdn9
X-Gm-Gg: AYBFou1IZ1YMDawiCaWsxaPOicRg9vxyYyMZpbDVlMItNFgNg7BirugnJLpy2m+yztl
	h6QUqIwCr/rzcoJD/x4x4pvzs9yiSwLbwX6e7s1JMA45sS/KzSxdgKxSXrNzylgaAjPbZxVKR6r
	vjavGakqoXHtU1QH6VX2qCtcVzvLhCF56jrtjZyeO+3iPS/CSs0GOKA8D4QrLSOhg8ejc4j4hv1
	M2SId4PAmIWeqtC+UGFygB+A97tmwGecmzb9hwA624N9ADWgs8q1CaSctkVk+KqlBMaj5pcryJv
	smj0RjomrP/4tsu8g5GN958RETJnM0vKk5N4/FjKCo6fVFtezebFMZckcaiGStPBim/5bwoUZrk
	zxRBX69qpeDCvAPVNnr619cHQ8UMzlCIg/iY4MNV8DOjtSAL+u8q9lYCo9YPDYgADJpArcl6gkS
	kejj/zZWU5iO1WU3khwtNsXTE+hysnG67mXGfXgbKSB+Kk/r0wfZqDxWUbimlNi9sBrtW2Puetb
	a8gPWjJq1P3+cQ9bmdaR1WN/ZxUFimJqFs=
X-Received: by 2002:a17:90a:d005:b0:39d:ba21:fd90 with SMTP id 98e67ed59e1d1-39e54f2bf77mr24735119a91.16.1790022682323;
        Mon, 21 Sep 2026 13:31:22 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76c0:d30::4d0:61])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a069918587sm447247a91.4.2026.09.21.13.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:31:21 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 0/7] net: dsa: motorcomm: MIB fixup
Date: Tue, 22 Sep 2026 04:30:17 +0800
Message-ID: <20260921203040.1203911-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix (theoretical) MIB inconsistency and prepare for new devices. No new
features are introduced.

v4:
  - reuse port_to_priv helper
  - re-enable delayed_work on port_setup
  - disable preemption for u64_stats_set
v3: https://lore.kernel.org/r/20260906131414.2683362-1-mmyangfl@gmail.com
  - fix build errors
  - fix logic error on MIB buffer creation
v2: https://lore.kernel.org/r/20260904162952.709368-1-mmyangfl@gmail.com
  - split patches
v1: https://lore.kernel.org/r/20260903143514.532023-1-mmyangfl@gmail.com

David Yang (7):
  net: dsa: motorcomm: Hoist port_to_priv helper into chip.h
  net: dsa: motorcomm: Rename MIB stuff
  net: dsa: motorcomm: Split MIB buffers
  net: dsa: motorcomm: Split MIB module
  net: dsa: motorcomm: Use u64_stats_t for MIB stats
  net: dsa: motorcomm: Fix MIB synchronization
  net: dsa: motorcomm: Use safe 64-bit counter reader

 drivers/net/dsa/motorcomm/Makefile |   1 +
 drivers/net/dsa/motorcomm/chip.c   | 413 +++------------------------
 drivers/net/dsa/motorcomm/chip.h   | 125 +--------
 drivers/net/dsa/motorcomm/leds.c   |  14 +-
 drivers/net/dsa/motorcomm/mib.c    | 431 +++++++++++++++++++++++++++++
 drivers/net/dsa/motorcomm/mib.h    | 167 +++++++++++
 drivers/net/dsa/motorcomm/smi.c    |  30 ++
 drivers/net/dsa/motorcomm/smi.h    |   2 +
 8 files changed, 683 insertions(+), 500 deletions(-)
 create mode 100644 drivers/net/dsa/motorcomm/mib.c
 create mode 100644 drivers/net/dsa/motorcomm/mib.h

-- 
2.53.0

