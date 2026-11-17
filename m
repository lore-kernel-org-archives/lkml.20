Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794906088;
	b=twCUcwEA2G02d44xz+FKUGKUcSs3UHFPeEGoJ5Ky23sGWa5KwQ/kmg9UaEzwG8lMk7Hv
	 4fpz9Sbn8ZPNo3Za8raLqwkrIs1L+N0bKz5BiZaFvgo++ICwQo0yREMLvi8Y993UvyLYO
	 OuB05eGOYgU8SpL1Minl9PL8bw27/KK30xV2NmDGjQA/LzU5kJHGssTrUd928z5m92U3+
	 /9inBgPn1ICXdP2v8T+/4v/bSs4JnB3EbirlqxQsUg3i0oT0UTfMxm/j1bGKUKRBoahF+
	 NKXcmS9KtiLwzCZTuqT1PYnuEl1AT7cvRPglRAKiBr2qAjxdsQeSb0hm8oEYnIeb33w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794906088;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wEqvJgEr6hhrc1TKzzqAUfy++Ij29EJ1pS0hjLiOKLM=;
	b=CWmwV2D1SAQHxEr1k9XhaffPf2NHMwleZM5MnNmfLGJknVE//eZfm6oDREk/XdBnv7J2
	 cSLCA23xqysKTQL2G0mo/ame2IZJAUAOY9wH805uLwZrpD6oKq2hAid0Mm2nLJcUH+eRe
	 pilP0y7onDCCvMGfJGhCD+FI+4MyyON7jP9w5lLTPQoEUFvsK/MJYZQNUwvQTMZ+xcOVG
	 Q342xS4aImer2BDtyhUl83yY8b36/x7Xh5iupqM7GvWXdNNvLlNJdlKEOjbeVld3VmhQ8
	 E818IQ6J+lNl1ncNzh8po9Ldvdw/Nvfzh6Nm9R/ztq085pmm5sVmgQvy692xLGZub1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=PoDnjkT3;
	arc=none smtp.remote-ip=115.124.28.195
Received: from out28-195.mail.aliyun.com (out28-195.mail.aliyun.com [115.124.28.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA08606A31C;
	Tue, 17 Nov 2026 09:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AA08606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=PoDnjkT3
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1794906076; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=wEqvJgEr6hhrc1TKzzqAUfy++Ij29EJ1pS0hjLiOKLM=;
	b=PoDnjkT3SfjC45ZhIwTAdYm9JQwgEn54po7rob1mzD0KzcYcF9LwGB7gq5e216tYM+6q2OXMVfga3mt1tYu+Op8ZuKfGcsf61qqMsDH/54o7MkZ4g14r/1/tia343qLLIu/WoIDzyjn80Re1Zf7TIUo4oBQgSl+Gi+DBCYZyWEg=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00409698-7.81501e-05-0.995825;FP=16763631471610645680|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037028158;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.k3m6Agc_1794906074;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.k3m6Agc_1794906074 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 17 Nov 2026 17:01:14 +0800
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
Subject: [PATCH v5 2/2] usb: gadget: u_ether: fix out-of-bounds read in get_ether_addr
Date: Tue, 17 Nov 2026 17:00:35 +0800
Message-ID: <20261117090110.3263592-3-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261117090110.3263592-1-liuc63@xiaopeng.com>
References: <20261117090110.3263592-1-liuc63@xiaopeng.com>
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

get_ether_addr() walks the MAC address string with a fixed six iteration
loop, calling hex_to_bin() twice per iteration, and never checks for the
terminating NUL.  A short string therefore makes it read past the end of
the buffer.  The dev_addr and host_addr module parameters of the legacy
gadget drivers are copied into their own kmalloc'ed buffer by
param_set_charp(), so the overrun crosses a slab boundary and KASAN
reports it at insmod time:

  # insmod g_ether.ko dev_addr=ab

  BUG: KASAN: slab-out-of-bounds in get_ether_addr+0x1ec/0x230
  Read of size 1 at addr ffff888009f91f53 by task insmod/70
  ...
   get_ether_addr+0x1ec/0x230
   gether_set_dev_addr+0x6b/0x180
   eth_bind+0xfd/0x3b0 [g_ether]
   composite_bind+0x1bb/0x7b0
   gadget_bind_driver+0x229/0xb00
  ...
  Allocated by task 70:
   __kmalloc_noprof+0x1d1/0x4a0
   param_set_charp+0x4a/0x220
   parse_args+0x267/0x5c0
   load_module+0x4f6a/0x6600
  ...
  The buggy address is located 0 bytes to the right of
   allocated 19-byte region [ffff888009f91f40, ffff888009f91f53)

Besides reading past the end of the string, the loop ignores what
hex_to_bin() returns: it yields -1 for a character that is not a hex
digit, and that value is shifted and OR'ed into dev_addr unchecked, so a
malformed address can be accepted as a valid one and the interface comes
up with an address that nobody asked for:

  # insmod g_ether.ko dev_addr=aazz:cc:dd:ee:ff
  # cat /sys/class/net/usb0/address
  aa:ff:cc:dd:ee:ff

The configfs dev_addr and host_addr attributes of the ECM, EEM, NCM,
RNDIS and subset functions reach the same parser through
gether_set_dev_addr() and gether_set_host_addr().  Their store handler
passes the whole configfs buffer on, so an overrun there stays inside the
same object and is never reported, but a malformed address is silently
accepted all the same.

Replace the open coded loop with parse_mac_pton() for the delimited
notations and hex2bin() for the raw one, and keep the existing
eth_random_addr() fallback for everything both of them reject.
parse_mac_pton() checks the minimum length and every digit before writing
anything to dev_addr, and hex2bin() stops at the first character that is
not a hex digit, which the NUL terminator is, so neither reads past the
end of the string.

The notations that keep working are the byte pair ones, ':' and '.', in
any mixture, and the separator-less "aabbccddeeff".  What stops working
is the Cisco notation "aabb.ccdd.eeff" and irregular groupings such as
"123456:789abc", which the old loop only accepted because it skipped a
delimiter wherever it happened to find one.  Supporting them would need
a parser per grouping, so such input is now rejected.

Neither of the two should be missed: they are historical notations that
are rarely met these days, and the commit that introduced the loop never
said that it accepted them.  That commit only explains that it resolves
a FIXME by adding module parameters for stable addresses, so skipping a
delimiter wherever one happens to turn up reads as a simplification of
the parser rather than as support for non-standard formats.

How a rejected address is reported depends on the caller.  The legacy
module parameters go through gether_setup_name(), which keeps the random
address that get_ether_addr() falls back to and only logs a warning.  The
configfs attributes go through gether_set_dev_addr() and
gether_set_host_addr(), which return -EINVAL, so the store fails and the
attribute keeps its previous value: writing "aabb.ccdd.eeff" to dev_addr
used to succeed and now fails.  This commit documents the accepted
formats in the configfs ABI files of all five functions.

Select GENERIC_NET_UTILS so that parse_mac_pton() is built in.

The loop is older than the git history.  It was introduced by
331a2d82bcaf ("[PATCH] USB: ethernet/rndis gadget address params") from
v2.6.7 in drivers/usb/gadget/ether.c, and commit 2b3d942c4878 ("usb
ethernet gadget: split out network core") copied it into u_ether.c.
331a2d82bcaf predates the git conversion and only resolves in the
historic tree history.git, so the Fixes: tag points at the start of the
official git era, commit 1da177e4c3f4 ("Linux-2.6.12-rc2"), and the
commit that actually introduced the loop is named here in prose.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
v5: no driver code change.  Describe the configfs behaviour accurately
    (a rejected address fails the store with -EINVAL and keeps the old
    value; only the legacy module parameters fall back to a random
    address), name all five functions that use the parser, document the
    accepted formats in their configfs ABI files, restore a Fixes: tag
    for 1da177e4c3f4 ("Linux-2.6.12-rc2") while keeping the real
    introducing commit in prose, and say "minimum length" where v4 said
    "length".
v4: pick up Andy's Reviewed-by; name 331a2d82bcaf from v2.6.7 as the
    commit that introduced the loop and note that it only resolves in
    history.git; record that the notations being dropped are historical
    and were never documented as supported.  No code change.
v3: fall back to hex2bin() so that the separator-less notation keeps
    working, as suggested by Andy; drop the Fixes tag, the loop predates
    the git history.
v2: rework on top of parse_mac_pton(), add the KASAN report and the
    malformed address example, select GENERIC_NET_UTILS, drop Cc: stable
    and the Reviewed-by.
Link: https://lore.kernel.org/all/20261106030605.576584-3-liuc63@xiaopeng.com/

 .../ABI/testing/configfs-usb-gadget-ecm        |  7 ++++++-
 .../ABI/testing/configfs-usb-gadget-eem        |  7 +++++++
 .../ABI/testing/configfs-usb-gadget-ncm        |  6 ++++++
 .../ABI/testing/configfs-usb-gadget-rndis      |  7 +++++++
 .../ABI/testing/configfs-usb-gadget-subset     |  7 +++++++
 drivers/usb/gadget/Kconfig                     |  1 +
 drivers/usb/gadget/function/u_ether.c          | 18 ++++++++----------
 7 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/Documentation/ABI/testing/configfs-usb-gadget-ecm b/Documentation/ABI/testing/configfs-usb-gadget-ecm
index 732101ca9d0b..076567aacf16 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-ecm
+++ b/Documentation/ABI/testing/configfs-usb-gadget-ecm
@@ -17,4 +17,9 @@ Description:
 			      - MAC address of device's end of this
 				Ethernet over USB link
 
-
+		host_addr and dev_addr accept a MAC address as six byte
+		pairs separated by ':' or '.', in any mixture
+		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
+		hexadecimal digits with no separator (aabbccddeeff).  Any
+		other format is rejected: the write fails with EINVAL and
+		the attribute keeps its previous value.
diff --git a/Documentation/ABI/testing/configfs-usb-gadget-eem b/Documentation/ABI/testing/configfs-usb-gadget-eem
index 178c3d5fb647..fb2be6ac0864 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-eem
+++ b/Documentation/ABI/testing/configfs-usb-gadget-eem
@@ -14,3 +14,10 @@ Description:
 		dev_addr	MAC address of device's end of this
 				Ethernet over USB link
 		==========	=============================================
+
+		host_addr and dev_addr accept a MAC address as six byte
+		pairs separated by ':' or '.', in any mixture
+		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
+		hexadecimal digits with no separator (aabbccddeeff).  Any
+		other format is rejected: the write fails with EINVAL and
+		the attribute keeps its previous value.
diff --git a/Documentation/ABI/testing/configfs-usb-gadget-ncm b/Documentation/ABI/testing/configfs-usb-gadget-ncm
index 6fe723effc78..a98ba929f2c2 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-ncm
+++ b/Documentation/ABI/testing/configfs-usb-gadget-ncm
@@ -13,3 +13,9 @@ Description:
 		dev_addr	- MAC address of device's end of this
 				Ethernet over USB link
 
+		host_addr and dev_addr accept a MAC address as six byte
+		pairs separated by ':' or '.', in any mixture
+		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
+		hexadecimal digits with no separator (aabbccddeeff).  Any
+		other format is rejected: the write fails with EINVAL and
+		the attribute keeps its previous value.
diff --git a/Documentation/ABI/testing/configfs-usb-gadget-rndis b/Documentation/ABI/testing/configfs-usb-gadget-rndis
index 9416eda7fe93..775b32cae136 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-rndis
+++ b/Documentation/ABI/testing/configfs-usb-gadget-rndis
@@ -17,3 +17,10 @@ Description:
 		subclass	USB interface subclass, default is 06 (hex)
 		protocol	USB interface protocol, default is 00 (hex)
 		=========	=============================================
+
+		host_addr and dev_addr accept a MAC address as six byte
+		pairs separated by ':' or '.', in any mixture
+		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
+		hexadecimal digits with no separator (aabbccddeeff).  Any
+		other format is rejected: the write fails with EINVAL and
+		the attribute keeps its previous value.
diff --git a/Documentation/ABI/testing/configfs-usb-gadget-subset b/Documentation/ABI/testing/configfs-usb-gadget-subset
index 0061b864351f..f67537fe53a0 100644
--- a/Documentation/ABI/testing/configfs-usb-gadget-subset
+++ b/Documentation/ABI/testing/configfs-usb-gadget-subset
@@ -14,3 +14,10 @@ Description:
 		dev_addr	MAC address of device's end of this
 				Ethernet over USB link
 		==========	=============================================
+
+		host_addr and dev_addr accept a MAC address as six byte
+		pairs separated by ':' or '.', in any mixture
+		(aa:bb:cc:dd:ee:ff, aa.bb.cc.dd.ee.ff), or as twelve
+		hexadecimal digits with no separator (aabbccddeeff).  Any
+		other format is rejected: the write fails with EINVAL and
+		the attribute keeps its previous value.
diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index 76521555e3c1..b83c42be686b 100644
--- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -158,6 +158,7 @@ config USB_U_SERIAL
 
 config USB_U_ETHER
 	tristate
+	select GENERIC_NET_UTILS
 
 config USB_U_AUDIO
 	tristate
diff --git a/drivers/usb/gadget/function/u_ether.c b/drivers/usb/gadget/function/u_ether.c
index 59d85d6a84a8..deedea8a19fd 100644
--- a/drivers/usb/gadget/function/u_ether.c
+++ b/drivers/usb/gadget/function/u_ether.c
@@ -686,18 +686,16 @@ static int eth_stop(struct net_device *net)
 static int get_ether_addr(const char *str, u8 *dev_addr)
 {
 	if (str) {
-		unsigned	i;
+		bool valid;
 
-		for (i = 0; i < 6; i++) {
-			unsigned char num;
+		/* Try the delimited formats first */
+		valid = parse_mac_pton(str, dev_addr, ".:");
+		if (valid && is_valid_ether_addr(dev_addr))
+			return 0;
 
-			if ((*str == '.') || (*str == ':'))
-				str++;
-			num = hex_to_bin(*str++) << 4;
-			num |= hex_to_bin(*str++);
-			dev_addr [i] = num;
-		}
-		if (is_valid_ether_addr(dev_addr))
+		/* Fall back to the raw format */
+		valid = hex2bin(dev_addr, str, ETH_ALEN) == 0;
+		if (valid && is_valid_ether_addr(dev_addr))
 			return 0;
 	}
 	eth_random_addr(dev_addr);
-- 
2.50.1

