Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906078;
	b=SI7cXZk1jI4wobvLbzNHy4XpFCc88utWe/1KRmADCpV940NCvqQJOeO4g02Pm5vV3fsQ
	 ppmrZWF2DTjzplt3aIG4Jm8cfB82K4t2s7UOuvLbCj7+4r77xkRC0YQ2Xz45p+0rr8DET
	 oaDDBprJ0yBdE0A1fHw2GDbYGXp1W7U31Mje7U2levg05MdJpvjEHwKJ1V2jOTj61rJwa
	 Fxky87/LURhyI6IqYZ2TzUB6AJePNB2mPvXPv1dSiFaiqKfpxnJb5DzeMTTixo8ruhtC/
	 WD9CYNFM+Qlc0rv/7AffBstudvvU0tiLd9w6scrsloI8PrMA31UwryH7uKNBJdSFj/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906078;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bPmJ4vo//kCU2q63ATfdNeDCC0CouN1mZHy++b3Tras=;
	b=YA8d1V2AVe2Ht6/E4xOUSwIwO2B8OAshG82zl7aHhSIRDcCmRYmqOK0zrmLVjH75hI9w
	 70oq3IJzlx/bX0UkbiH6OY2k99I8n98fsAnX1ePsfhaaTBhfxasF3mC6GWVGMiqXAN/gb
	 Ju6DK4pqJu4ybctpSHoHzUL03UQUjF/r7WaBfSWjSwBrEHgg+AsWG0hI1NKka8wa3xAo1
	 evZRxeuaTv2jOv26m+UTTuQMGGZfY14BWYYfY5HWX177TwzYIB/r3RKoY0HnqU8Ze5u0k
	 QRhVjyQOHDqfMMotvV1LlfFHt+LR0XX9VlvTfFLV46jApI7Ec02Yx+2/M/rlO8hNejQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b="tRbV/qoq";
	arc=none smtp.remote-ip=115.124.28.170
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8022B606A31C;
	Tue, 17 Nov 2026 09:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8022B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=tRbV/qoq
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794906074; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=bPmJ4vo//kCU2q63ATfdNeDCC0CouN1mZHy++b3Tras=;
	b=tRbV/qoq7mnq+T5eI+6GcWDO+9vMZMMWFPzjWwFYlhMgyXe6y4J7x5jTHePvgLZci7YTsJnocwyBT2/d1lZocH0FhVs3AYeXVwtWou+rQNBcY5/P9xPWzqtLuEdRtnDc0VwFE4EXlucl4pZNojMb9FrqvJP8ccd2rgc0lrzCSPw=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07614725|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.015819-0.000583497-0.983598;FP=16842748703785717168|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.k3m6Acz_1794906071;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.k3m6Acz_1794906071 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 17 Nov 2026 17:01:12 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	khtsai@google.com,
	fangxy@xiaopeng.com,
	Randy Dunlap <rdunlap@infradead.org>,
	dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v5 0/2] usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr
Date: Tue, 17 Nov 2026 17:00:33 +0800
Message-ID: <20261117090110.3263592-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
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

Rework of

  [PATCH v4] usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr
  https://lore.kernel.org/all/20261106030605.576584-1-liuc63@xiaopeng.com/

following Andy's review of v4: 1/2 prepares a parse_mac_pton() helper in
lib/net_utils.c, 2/2 uses it in get_ether_addr().

The two patches belong to different trees: 1/2 touches lib/ and should go
via netdev or -mm, 2/2 is for the USB tree.  2/2 depends on 1/2, so it
can only be applied once 1/2 has reached Linus' tree.

Changes since v4:
  - no driver code change; the C diff of both patches is byte identical
    to v4, only documentation and the commit messages changed
  - 1/2: reword the parse_mac_pton() kernel-doc: @s must be at least
    MAC_ADDR_STR_LEN characters long, and only the first
    MAC_ADDR_STR_LEN characters are checked, the rest ignored
  - 2/2: describe the configfs behaviour change accurately: a rejected
    address makes the store fail with -EINVAL and keep its previous
    value, while only the legacy module parameters fall back to a random
    address
  - 2/2: name all five functions that reach the parser (ECM, EEM, NCM,
    RNDIS, subset) and document the accepted formats in their configfs
    ABI files
  - 2/2: restore a Fixes: tag pointing at 1da177e4c3f4
    ("Linux-2.6.12-rc2"), the start of the official git era, keeping the
    commit that really introduced the loop named in prose
  - 2/2: say "checks the minimum length" where v4 said "checks the
    length"

Changes since v3:
  - no code change at all, only the log of 2/2 changed
  - 1/2: unchanged
  - 2/2: pick up Andy's Reviewed-by
  - 2/2: name 331a2d82bcaf ("[PATCH] USB: ethernet/rndis gadget address
    params") from v2.6.7 as the commit that introduced the loop

Changes since v2:
  - 1/2: pick up Andy's Reviewed-by, no code change
  - 2/2: keep the separator-less notation "aabbccddeeff" working by
    falling back to hex2bin() when parse_mac_pton() does not match
  - 2/2: spell out in the log which notations stop being accepted

Changes since v1:
  - rework the fix on top of parse_mac_pton() as suggested by Andy
    instead of open coding the bounds checks in get_ether_addr()
  - add the KASAN report and the malformed address example
  - select GENERIC_NET_UTILS for USB_U_ETHER

One user visible effect remains: the Cisco notation "aabb.ccdd.eeff" and
irregular groupings such as "123456:789abc" are no longer parsed.  The
legacy module parameters then fall back to a random address and log a
warning, while a configfs store fails with -EINVAL and keeps the previous
value.  Details are in the log of 2/2.

Liu Chao (2):
  lib/net_utils: allow mac_pton() to take a custom delimiter
  usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr

 .../ABI/testing/configfs-usb-gadget-ecm       |  7 ++++++-
 .../ABI/testing/configfs-usb-gadget-eem       |  7 +++++++
 .../ABI/testing/configfs-usb-gadget-ncm       |  6 ++++++
 .../ABI/testing/configfs-usb-gadget-rndis     |  7 +++++++
 .../ABI/testing/configfs-usb-gadget-subset    |  7 +++++++
 drivers/usb/gadget/Kconfig                    |  1 +
 drivers/usb/gadget/function/u_ether.c         | 18 ++++++++----------
 include/linux/hex.h                           |  7 ++++++-
 lib/net_utils.c                               | 19 ++++++++++++++++---
 9 files changed, 64 insertions(+), 15 deletions(-)


base-commit: a5ebb76233b79db01e82e061173cb73c6d2b5c6b
-- 
2.50.1

