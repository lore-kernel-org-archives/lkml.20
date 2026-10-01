Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18F1277C81
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 21:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790891232; cv=none; b=j6PO7Gs9b7lq3gwkNzl2FP/YgolYjC6K2G+wAUfQcQjrdq6GYm94PbUcRBocAic9T0JbMwJEVaZ1XuRH0vz7BUWdjnKYk6kBtA2WMajvnSrvfzUfzIP2UFhYttEk/fs/gFgkHjexjXSps4ADrPk8k0JvaPfjxQSsnPSGxYxb/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790891232; c=relaxed/simple;
	bh=RZsztg3jkiifg3cVjsihK7n6NEl2FN8zMw/g8/qclO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XDCZmebS13w2E4UHvHqiOqPbMtB+F5Wwj1oG0RWTHewjvEkF1Kc4K85Pig9rUHZZY7q38UX5P5oqswfNlYThpeDyhexH76IPBO1g7VraXJJ9tRSe+LK0noQTGWxvBnGVz9jq1CnMjzdgSuCwNUHbH3qmohxuCiw/jgp9QfzOGPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sxbgX9b4; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sxbgX9b4"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so53065155e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 14:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790891229; x=1791496029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0A2nj2lNZUIfwGZPfuk0b4oPVUIthHX4d+jYvMnhfU4=;
        b=sxbgX9b4gOrZ2QQE6GE7F+WM0BsidFX1iUyQG92FhpHiCic0/t3bakmJrixjdStm7a
         2T77fawX7obW2XZIZgK4bGf/z8ZQTh5mvOdeXRz5sozIWNrbuf7wqDpWcyI112xXQr7/
         D793FL2QyZ9+JyvEjjp7a5PyKO3/JV1Xtr6dTMDOg9iIcO/7geiysK2rrnjAg5eSgXYL
         nWK1LkBVFKzLc1AwxHaa500ZXewpUq/FYiF9xbDp+CU4RFsPBPDtkQpu67Ex08EIEF0s
         Tv12iC+mjfsn3Wp7b0pXaVBeoIljSy8u8Arlb8MC04gpgwe/7oil6x2Xgl1At+wPjQt8
         AO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790891229; x=1791496029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0A2nj2lNZUIfwGZPfuk0b4oPVUIthHX4d+jYvMnhfU4=;
        b=J7QIhYQsLUN3jJ2dD+Ew9g+/L2EshP/LxzXx91zCBlx4U8wfurS7OUL2v9gtv2FnhC
         6MVPI+MNtjRUuqKTT5FgLEucHgXRQCJ9RE9nbXrp89UzpSQKZw/nmhwBmraHRABOmzN6
         It3KE3sNl+hiPFH1Ri3Yr9of3ImaUszjyGP3tNLMQTbzZnnUyLeNqIxBbDimCNSHwpTu
         aGaG3TAO1V90AJ/N2Qa9DlgGY5IZXZ84/+gwkfTCXb/N38Nyuk2woRXyOX6u/26/OuX/
         DMFDGQ18+8RJ9RrGaPmXvkx/p6Sy+lLoLF9e6Ow4FoZeVvr3i9vAJpl/yn59C5RgWy0v
         sQaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHaSUjCayd+Fx3nBMgPgejkv9YJmmfC+YIFC4jV90H9hplBkv2Adg3r9HEjhP8PAJCNYPbeffbFIB5djA=@vger.kernel.org
X-Gm-Message-State: AFuF++nrVOmk5z7DzCiiJaSjFWNE04Z9OH/90DO9ZeYOGnpcOEZmwgIq
	FeJx7LUVhgqP6KRvg/D2yxFc1Ulhl1bMohh6250XwP5gBvvVsdur0V//ru0F2BJ2+j5hoA==
X-Gm-Gg: AYBFou2FnptYrDU3BWKS6igdN8zlYNdeMYtMFvywcwxxJ34gVPM7wh8c+P/M9ReXEK0
	5WDN7iVLJlssManYbAP6tF4SpUCzuVEZA882+xoAv4EXDLJbb3AVrGyCneQtEJ/MTlHj2xvtOf5
	H0TU792M4UCt0hN1T3olCn39jAd4rhrk1L48DJoYkv76ey2ZAs2+llvZTUMQ/sx7O5b8X8isEvV
	D17YcIekpdy1jjoGiOIm0Kioo9oa5HAiUjEqlun9UVdMenREKn1ltya3VbNGf8XHfJzv3MpYeGi
	Gvbb9i3XylCQFRy49j/uZAZ4vl6E08XZArbbVoZyBed2pjKl0sKZBN0Vm2qSyL4Ar0vB9ULLtBK
	o3iX0S7qRu8IRl1KOV2+V/qp+wPXzgWtrpPBIhrcWmssf6xSHUuSpCtObROap9ojfp59loTiLUp
	pe8klLXKEENsNeyK5qmDzWbf4bws5p1rp0tfaqHVLUoskwP7ldzz9UDhHsYI7UwX88CO5fjpX8F
	S6Gg+00nb20yQ213MQXCO97JXKABjMKr2SG+Tg2y3gTt71i+7MkYwg6t+aa0j7+KE18VsxOePws
	dox0RbE=
X-Received: by 2002:a05:600c:6094:b0:4a0:1efa:c748 with SMTP id 5b1f17b1804b1-4a027559c53mr14153455e9.15.1790891228774;
        Thu, 01 Oct 2026 14:47:08 -0700 (PDT)
Received: from voyt-laptop-dell.fritz.box ([2001:9e8:bd6a:f100:18dc:709a:22af:b78b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027734b49sm21624425e9.10.2026.10.01.14.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 14:47:08 -0700 (PDT)
From: Dmitry Voytik <voytikd@gmail.com>
To: Nicolas Schier <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>,
	Rong Zhang <i@rong.moe>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Dmitry Voytik <voytikd@gmail.com>
Subject: [PATCH v4] scripts/config: honor $KBUILD_OUTPUT by default
Date: Thu,  1 Oct 2026 23:46:18 +0200
Message-ID: <20261001214618.283635-1-voytikd@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
	rm .config
	export KBUILD_OUTPUT=.out
	make defconfig
	./scripts/config \
	       -e CONFIG_UBSAN
	grep: .config: No such file or directory

How the patch was tested:
	make mrproper
	export KBUILD_OUTPUT=.out
	make defconfig
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config || echo "OK"

Test the basic usage:
	./scripts/config -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --refresh picks up correct config file by using $KBUILD_OUTPUT
	./scripts/config -d CONFIG_UBSAN
	./scripts/config --refresh -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" $KBUILD_OUTPUT/.config && echo "OK"

Test --file takes precedence over $KBUILD_OUTPUT and
a relative path is handled properly
	./scripts/config -d CONFIG_UBSAN
	mkdir .out2
	cp .out/.config .out2/.my_config
	grep "CONFIG_UBSAN=y" .out2/.my_config
	./scripts/config --file .out2/.my_config --refresh \
	       -e CONFIG_UBSAN
	grep "CONFIG_UBSAN=y" .out2/.my_config && echo "OK"
	ls .out/.out2 || echo "OK"
	ls .out/.out || echo "OK"

Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
---
v4:
 - Addressed Nicolas Schier's comments - dropped the change how '--refresh'
   is handled
 - Implemented conversion of $FN to the absolute path which helps with
   '--refresh' and relative paths
 - Documented testing steps in the commit message
v3:
 - Added an example in the commit message how to reproduce the issue
v2:
 - Addressed comments by sashiko:
   - https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gmail.com
   - use basename when --refresh is used
   - remove echo which can be misleading when --file is passed
v1:
 - https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com/
---
 scripts/config | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/config b/scripts/config
index 32428ea909c2..0b28fc498195 100755
--- a/scripts/config
+++ b/scripts/config
@@ -130,6 +130,10 @@ on_exit() {
 trap on_exit EXIT
 
 FN=.config
+if [ -n "${KBUILD_OUTPUT}" ]; then
+	FN=${KBUILD_OUTPUT}/${FN}
+fi
+
 CMDS=()
 while [[ $# -gt 0 ]]; do
 	if [ "$1" = "--file" ]; then
@@ -143,6 +147,7 @@ while [[ $# -gt 0 ]]; do
 		shift
 	fi
 done
+FN=$(realpath "$FN")
 
 set -- "${CMDS[@]}"
 if [ "$1" = "" ] ; then
-- 
2.55.0

