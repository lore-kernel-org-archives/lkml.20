Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A053A8B3;
	Mon, 31 Aug 2026 15:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189831; cv=none; b=ef0+k2zkc21M7bFP5t6J35forcFpZvKnesSt+rXFVS17B2yXaIENz5pM6WxZgjLksrPeULausSnaBq1cTu2KK2OcaaS863asUwQWwFEb6W0qw+YvOb2ULOFwLML13X7Heu43SueIiJQaDdZ4ajlCzhAzTQY4JxOzNOrAUFeuJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189831; c=relaxed/simple;
	bh=l97lPo2vh7YTVsQ0tdPCJDGD61Vb7aU41sbmHApYtyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OVM4KZiAe5qFCeSlT/pK+Lo9bM04W4n4qa6yHP9iHxX9nleuBcyrkZbQRFF4qTAJF7EN1D33pK1X0TrMALY6hmRxdfxhNEA/iTuFLa24dAZ3sw29BKb35jPVoObYlySvD+qs8lM5u/4P/nNY8b0IOXzOn6yxhn1+XtIFCsp/d04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=LKfZqw1t; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EUa2eJ95; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="LKfZqw1t";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EUa2eJ95"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hYXnl4T6wz8twy;
	Mon, 31 Aug 2026 17:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788189819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcReytiFHSfgAL9vHEFDd7IHvg5fhlNXFFhcmJ/wdpo=;
	b=LKfZqw1ts7u3RECwN9nWCSNDzgMEiNFy/pabwwrmkRdTDisTr6/BBkNL0/zAcTTaTikUka
	clxrZaO7TTEaZxVp93jZEGkS2mQirtFHEUe5ZstiK4jKLTJ0exQUZW/l+X9Hs5XJwGZP6T
	l3C6Wo60I2f50KeC0/AUy5QzeQpgt/IXYzfPpxsFOHyLjE/lIcCIg2hudvyEoZtYODRVMr
	HmvTk8QwGvd/wIOo4AeS0ZMZSpgUN3E+4Q91rtIZCd9AlNljkQIXimO7WE+Plx3Cl8Dm6b
	KSpI+IE0os94Supj4NKdExAGNc54yFRkWLrkiBsFeaI7q6rMPlC6Peagy6MrkQ==
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788189817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GcReytiFHSfgAL9vHEFDd7IHvg5fhlNXFFhcmJ/wdpo=;
	b=EUa2eJ95tfUe96Y/fc91Du7Fgs5IwxQbe//5oyS+Z9Q8WopklAEjiGNzeLGgCGv7ZKBkE9
	qZLaES3fy2UjD2Oqu7LZ92UJIJpt2VoFybsyZveBdMo6V9NLauVBR0xigcM68oHhvjxcos
	mrHEwUrKA/KmB7qboIQWcj+c/zKYAIvdzYLX/gjReyfL3ktTs2GJjEW/hohb8pF24lqy48
	3Fg9nHP7/uYVnYlRUspnPr9ZUEGRXmW4SZjqCm6lePaG5NxVANh93z53hwYeicatTYJibI
	Zz/QbaBEuJmKaecMNB3lDRbeKa3cVie8lIAmC68Xvd/VvZ9lQYkCiQEI7AVzyg==
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] Docs: changes.rst, ver_linux: add tools
Date: Mon, 31 Aug 2026 17:22:55 +0200
Message-ID: <20260831152256.638615-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: py67gbufmu8u94mip3f4pf9red1r9sgh
X-MBO-RS-ID: 0ec0d5d3a8d1d66a6e4

lzma is required with HAVE_KERNEL_LZMA set to y
lzop is required with CRYPTO_LZO set to y
iproute2 is mentioned in changes below.
"ip-route2" -> "iproute2"
syslinux is and genisoimage needed for ´make isoimag´
mtools is required for genimage.sh

add tools to
 changes.rst and ver_linux

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
should edk2/OVMF be added aswell?
it would be for arch/x86/boot/genimage.sh
---
 Documentation/process/changes.rst | 10 ++++++++--
 scripts/ver_linux                 |  6 ++++++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index fb5ef7d743ba..b3fa980b63e3 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -41,17 +41,22 @@ Clang/LLVM (optional)  17.0.1           clang --version
 e2fsprogs              1.41.4           e2fsck -V
 flex                   2.5.35           flex --version
 gdb                    7.2              gdb --version
+genisoimage            1.1.11           genisoimage --version
 GNU awk (optional)     5.1.0            gawk --version
 GNU C                  8.1              gcc --version
 GNU make               4.0              make --version
 GNU tar                1.28             tar --version
 GRUB                   0.93             grub --version || grub-install --version
 gtags (optional)       6.6.5            gtags --version
+iproute2               6.14.0           ip -V
 iptables               1.4.2            iptables -V
 jfsutils               1.1.3            fsck.jfs -V
 kmod                   13               kmod -V
+liblzma                5.8.1            lzma -V
+lzop                   1.04             lzop -V
 mcelog                 0.6              mcelog --version
 mkimage (optional)     2017.01          mkimage --version
+mtools                 4.0.49           mtools -V
 nfs-utils              1.0.5            showmount --version
 openssl & libcrypto    1.0.0            openssl version
 pahole                 1.26             pahole --version
@@ -63,6 +68,7 @@ quota-tools            3.09             quota -V
 Rust (optional)        1.85.0           rustc --version
 Sphinx\ [#f1]_         3.4.3            sphinx-build --version
 squashfs-tools         4.0              mksquashfs -version
+syslinux               6.04             syslinux --version
 udev                   081              udevadm --version
 util-linux             2.10o            mount --version
 xfsprogs               2.6.0            xfs_db -V
@@ -336,7 +342,7 @@ General changes
 ---------------
 
 If you have advanced network configuration needs, you should probably
-consider using the network tools from ip-route2.
+consider using the network tools from iproute2.
 
 Packet Filter / NAT
 -------------------
@@ -557,7 +563,7 @@ Iptables
 
 - <https://netfilter.org/projects/iptables/index.html>
 
-Ip-route2
+Iproute2
 ---------
 
 - <https://www.kernel.org/pub/linux/utils/net/iproute2/>
diff --git a/scripts/ver_linux b/scripts/ver_linux
index 00bdaf30d590..7495177843e5 100755
--- a/scripts/ver_linux
+++ b/scripts/ver_linux
@@ -29,6 +29,7 @@ BEGIN {
 	printversion("e2fsprogs", version("e2fsck -V"))
 	printversion("flex", version("flex --version"))
 	printversion("gdb", version("gdb -version"))
+	printversion("genisoimage", version("genisoimage --version"))
 	printversion("GNU awk", version("gawk --version"))
 	printversion("GNU C", version("gcc -dumpversion"))
 	printversion("GNU make", version("make --version"))
@@ -36,19 +37,23 @@ BEGIN {
 	printversion("GRUB2", version("grub2-install --version"))
 	printversion("GRUB", version("grub-install --version"))
 	printversion("gtags", version("gtags --version"))
+	printversion("iptroute2", version("ip -V"))
 	printversion("iptables", version("iptables -V"))
 	printversion("Isdn4k-utils", version("isdnctrl"))
 	printversion("jfsutils", version("fsck.jfs -V"))
 	printversion("Kbd", version("loadkeys -V"))
 	printversion("kmod", version("kmod -V"))
+	printversion("liblzma", version("lzma -V"))
 
 	while ("ldconfig -p 2>/dev/null" | getline > 0)
 		if ($NF ~ libc || $NF ~ libcpp)
 			if (!seen[ver = version("readlink " $NF)]++)
 				printversion("Linux C" ($NF ~ libcpp? "++" : "") " Library", ver)
 
+	printversion("lzop", version("lzop -V"))
 	printversion("mcelog", version("mcelog --version"))
 	printversion("mkimage", version("mkimage --version"))
+	printversion("mtools", version("mtools -V"))
 	printversion("Module-init-tools", version("depmod -V"))
 	printversion("Mount", version("mount --version"))
 	printversion("Net-tools", version("ifconfig --version"))
@@ -65,6 +70,7 @@ BEGIN {
 	printversion("Sh-utils", version("expr --v"))
 	printversion("Sphinx", version("sphinx-build --version"))
 	printversion("squashfs-tools", version("mksquashfs -version"))
+	printversion("systlinux", version("syslinux --version"))
 	printversion("udev", version("udevadm --version"))
 	printversion("util-linux", version("mount --version"))
 	printversion("Wireless-tools", version("iwconfig --version"))
-- 
2.54.0

