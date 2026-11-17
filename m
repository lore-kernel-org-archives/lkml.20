Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921921;
	b=hRSuVhpIuU74ZXvJMMg47ud3ZrNcpzTCdj9I2HoJU8RvOXtoofG0yMnFy1MH7l8+z3ft
	 9JQeOXlowgB3essX/mNUnERc++f/l//YjWX8AOEcExWKvzw4dDA0a/UUSM6LVntgCGbpP
	 RwISnFAQpN3FcMfwH1BWtwEJ3+3AagJ9+BrD3NDYQVg2e/ZrBv409QOL3Lm17ljBzIQ7h
	 Y/ZkqZ3HyVjfkfRprlv0EpxtcB/6Fr8WdmZBgHqgUR/bP6Hi70STaYQLpo/u1ODPWkvi8
	 C15vZahpZwl/I7hAv8up7eNjZIxia8kGNEIHsjRW2UESKIgpHSLBkBW4fpbzb7tDqsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Le4QssKPABWAq1ih1ZKZB5XX87P+nzixsfn1EjFrKs0=;
	b=r+rArdwOfVbrYuIGRgbSVjrK9pBDUv0BwYdlT9PMRETFMrhqwetgt1YQstB1/DfCLLAw
	 LmxDdd1W9SPKPXTxWzMso012UGAVnsk/UkCZZgymJDmqoAmneuUnHn+SGuvfuSP7k1hh7
	 /dMqGruH15LyaazCkkvi9M8vTFZQrcOanoZp9kD5aKri9Y5MPoFkRJR8b3+J6iDirLMC3
	 UUHXs+PY98vlUahBPV+8G+KA571urGr5mXn0HF/c3eHAJXUtDw4h88J/WTzjIvVeZCTJN
	 /EJg3m+NVU6cERnh804bF5JQlmMY9tWUCG5lPNVWaeAqquXN2xxbZLeL3n3O56rMUFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfAZQmx4;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4FE606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D4FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VfAZQmx4
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so14756235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794921919; x=1795526719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Le4QssKPABWAq1ih1ZKZB5XX87P+nzixsfn1EjFrKs0=;
        b=VfAZQmx4SRCE16v1YR3uSwYO6FBC21gouM8098A7kCmFvAMtgRw5OyqNlDWLkipGKs
         ZfoNQGPKoPb2us2hDGmllmtxNLF9+zSoJGxuqKnOvIMNWOoYrHKpOgACBSNsMXX826sb
         WbhV48jmfRsWrrh2MvuXPkggZhvCXpC7GlQWIHTAPisDTWGYDrXbEhbh5M08qAdm2KzO
         w6ICKS96pXkmHfJWwJD8rZEyG8h10H2HpnOaY51+PccVFaaaGNNZg5qVMlcUUtmi3ZiQ
         pFUdBHv4HQ92StI3ZinRoQiZQKk6VZ8/vmrqgn9v0Jk+rYRs6Q6JZNCEinq3HWErj55M
         +QKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794921919; x=1795526719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le4QssKPABWAq1ih1ZKZB5XX87P+nzixsfn1EjFrKs0=;
        b=t/nddZVHf2PXl4jJ4Uj0qd1Vk/WHDhIjzZv0oDfQ52233JWFxKp49R1e/ndvZB31nE
         NfXUdFwRrIuWNc2f/+079T8lQbxYEKaDL6KqY5gvXXUAv7FQLckRvOego0Jnw6ppq1z/
         zQCFxy9fnMz7hABgbLbGbRJNgHvn8sszm/AaNo4hzCBlxppd/KUBs0oduBaSenLhqQ5P
         ov8T1Qc/vBTvKmKysy35MTM2/z6cyrd6AvIHC2xXQjYQchlrFcy9Q6tBf+eJgsRLNgOl
         UlEIb4MBv5yTdFKIXCj1I6EtEMTSimGKOoSxbob2ZUjmQv56KHbFvLcKl3Ly7JuxWFQ0
         UsAA==
X-Forwarded-Encrypted: i=1; AL+hErFBu3sWZpWiDk/le0aR5G6QkDj7p1fcww34Kzl05+xdZKZWDTqTB8kRsQG9W5W9TV64q7D+d0wEEWhKi0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jWXQ3/ml8gA+tfSv3ITjB96E4flX91XLFCI4/gmzo+MZEmdHw
	UeSRAs7VFJ5N3LwJ+aqRBd5lRZchHUnyUOLAsmkU9eqBs3k6QKkUAX/f
X-Gm-Gg: AYBFou0FbHXTpC18eP5/+VwFR9j4Fvqk/DDrzwmiINrFytnKzjkxhWOJaDH9fwTbBiP
	CoZSdHTWIRvClKrUQTI7QUK942ovXazheQzLj0NNAcycRK2sk+b2dw4n5lTJk8uyBjzbcuMlCcX
	IX3mqtAjeGXzLji0BZyjuHX7gKjy/vxYgmugdJ+1KCmoT5A7lY3NNksY17sexnLz1VA3vU3cPRG
	eF2THDrhP8vvJAVR99MFv9klmU+gqPzP8QqAx2IYIcL34Rwa3iL62VTTuulxQeDNBtMk5kORrgK
	TOk6uzmN+PE781CfVM84RY9VSYA4OZh5dLrQJ1CFWj4U+EbSzWs1sj3gYUVPPcnpiM77iuHuNPd
	drp+00+qUmdMhR3ZDU/pONa1wI3kmnilQXAF15koeHc3CihEe3hDpO6upboKb4U6bJkEPs9ne6a
	J9iysdkNZMTdscvHBJRUN/MnR65GR1uY1e25/VbF8unjoCxSgCaH2y/D9h9qegqFSFFEyzNWQMl
	AzjB5xj7XC2NA3PyHK8p6oDaVhYvrTCAjAPoJjr5lWEt3rCr2lasMguIeZNhGPxq7gx7Q608CFf
	yxW6HQkSUJcY0oDtkWrDW5eYQ3FKJbgePLTT6f1ucCwf6OwlefN+2y/5JNSxYplRqoGaB6+1rSY
	39JNmxGaQMAZL8RNzuHvkASxPlRE=
X-Received: by 2002:a05:600c:3152:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb55ac965emr310628385e9.35.1794921919140;
        Tue, 17 Nov 2026 05:25:19 -0800 (PST)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd59:5c00:c5d9:a054:49af:d8f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ad9430asm37297915e9.15.2026.11.17.05.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:25:18 -0800 (PST)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
Date: Tue, 17 Nov 2026 14:25:12 +0100
Message-ID: <20261117132513.52725-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.56.1
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

If $KBUILD_OUTPUT is set, use it by default if --file is not passed.

Fix the issue when the script silently updates a stale .config in
the root directory, while the user expects ${KBUILD_OUTPUT}/.config
to be updated.
Handle properly if the config file is a relative path.

The problem can be worked around with --file, but this is easy to miss,
and is inconsistent with how the Makefile and other tools work
(e.g., scripts/diffconfig).

How to reproduce the issue:
	make mrproper
	export KBUILD_OUTPUT=.out
	make defconfig
	./scripts/config \
	       -e CONFIG_UBSAN
Error reported:
	grep: .config: No such file or directory

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
Suggested-by: Nathan Chancellor <nathan@kernel.org>
---
How the patch was tested:
	make mrproper
	export KBUILD_OUTPUT=.out
	make defconfig
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config || echo "OK"

Test the basic usage:
	./scripts/config -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --refresh picks up correct config file by using $KBUILD_OUTPUT:
	./scripts/config -d CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "FAIL"
	./scripts/config --refresh -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --file takes precedence over $KBUILD_OUTPUT and a relative
path is handled properly:
	./scripts/config -d CONFIG_UBSAN
	mkdir .out2
	cp .out/.config .out2/.my_config
	grep "CONFIG_UBSAN=y" .out2/.my_config  && echo "FAIL"
	./scripts/config --file .out2/.my_config --refresh \
	       -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" .out2/.my_config && echo "OK"
	ls .out/.out2 && echo "FAIL"
	ls .out/.out && echo "FAIL"

Test --file can accept files with hyphen:
	./scripts/config -d CONFIG_UBSAN
	cp .out/.config -- -my_config
	grep "CONFIG_UBSAN=y" -- -my_config && echo "FAIL"
	./scripts/config  --refresh \
	       -e CONFIG_UBSAN --file -my_config
	grep "CONFIG_UBSAN=y" -- -my_config && echo "OK"
---
v8:
 * Nathan Chancellor ironed out the patch to the acceptable state
v7:
 * Adressed https://sashiko.dev/#/patchset/20261006142337.821859-1-voytikd%40gmail.com
v6:
 * Per Nathan Chancellor's suggestions, simplified
 * https://lore.kernel.org/lkml/179121581235.2275809.12565811683284940522.b4-review@b4/
v5:
 * Per Nathan Chancellor's suggestion, improved handling $FN path by
   realpath
 * https://lore.kernel.org/lkml/179097210878.309835.10523307262544578337.b4-review@b4/
 * Documented the new test scenario in the git commit message
v4:
 * Addressed Nicolas Schier's comments - dropped the change how '--refresh'
   is handled
 * Implemented conversion of $FN to the absolute path which helps with
   '--refresh' and relative paths
 * Documented testing steps in the commit message
v3:
 * Added an example in the commit message how to reproduce the issue
v2:
 * Addressed comments by sashiko:
   * https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
   * use basename when --refresh is used
   * remove echo which can be misleading when --file is passed
v1:
 * https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
---
 scripts/config | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..13b87b7f316a 100755
--- a/scripts/config
+++ b/scripts/config
@@ -144,6 +144,22 @@ while [[ $# -gt 0 ]]; do
 	fi
 done
 
+# If no '--file' was specified, use KBUILD_OUTPUT as the base if it exists
+if [[ "$FN" = ".config" && -n "$KBUILD_OUTPUT" ]]; then
+	if [[ ! -d "$KBUILD_OUTPUT" ]]; then
+		echo "KBUILD_OUTPUT is set ('$KBUILD_OUTPUT') but does not exist or is not a directory." >&2
+		echo "Create it before running $myname or use '--file' to specify configuration file." >&2
+		exit 1
+	fi
+	FN="$KBUILD_OUTPUT/$FN"
+fi
+# Turn FN into an absolute path if it is relative so that '--refresh' works on
+# the correct file. This does not use realpath, as $FN may not exist yet.
+case "$FN" in
+	/*) ;;
+	*) FN="$PWD/$FN" ;;
+esac
+
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
 	usage
@@ -200,10 +216,10 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
+		if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
 			echo n
 		else
-			V="$(grep "^${CONFIG_}$ARG=" $FN)"
+			V="$(grep "^${CONFIG_}$ARG=" "$FN")"
 			if [ $? != 0 ] ; then
 				echo undef
 			else
@@ -229,7 +245,7 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--refresh)
-		yes "" | make oldconfig KCONFIG_CONFIG=$FN
+		yes "" | make oldconfig KCONFIG_CONFIG="$FN"
 		;;
 
 	*)
-- 
2.56.1

