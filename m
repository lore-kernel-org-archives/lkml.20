Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862449;
	b=w9N5wM2Jsxc54liPe6kHGAeLgS7P0IpxC+OVXI2zE2LLaUZi/hn5bv7kd351VhCviMT+
	 3Y6+Uejo475PNYWjCniQFRi/eurD5dAXN21V7WTqUyOkGhmnNjqlAShVYNejIahhlEU4A
	 8llrb0uIT231Ce+Lv4f/Euh9ivmLsKrOSLISYw8b9ZSegsrkCTJkUcbHOTRFlMp3E7G10
	 +gw/GbiIfZGsqwdyqibXXCxSW2EwfQ3+M3Sw0aSeJvljpbFrFh5Q0vLRVC5tazmXCwUYM
	 00NxU9NZrLJewPZAYKPLvwaxdRyHuh8xmx/TiEPyjUspxurNXXjhOWguVBNl3YX9M5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862449;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cSp87YkJRrmwdFUaHDQmleJWcDY7Ulus3h1BaGKCHrs=;
	b=OEuu+CM0v85MbD3huGWWNB9ApgnNZvIQSyF0JDnDNl1lvGa0AJuM0A3D8fR3Vpf6TSXQ
	 M7w4rilHnR+CJ0f9nRNkm2sSVPhjUjKBxpz1j6RCbLI2wmxQqvh5ETUfcsHLSEYN7vN5I
	 sPj/zsnj1E69Q6rShBYCbYtsxBl1mIzuLcmhJPGKFThm4yxWEP3fwEiisy0bbA/WfLWxM
	 OzHNP4I0rS/zyi/EmQQE1qVpp4RbGYhCq/vlGSjuR/dgkVpPAyfM/dDdjniPxEZv1m7bY
	 1cG/3xbmMoXs1z6Ano4tRNKbuJjGJ7jp74srWl5/7uXHD9itVjDYUsfYEEb0eI96nQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LjsrRrmZ;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F00606A890
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:54:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F00606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=LjsrRrmZ
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40319bdso1160777eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862448; x=1795467248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSp87YkJRrmwdFUaHDQmleJWcDY7Ulus3h1BaGKCHrs=;
        b=LjsrRrmZIcy0kZJq4FU6TMY7PEwedt03ArnhC3yQlS8CFfuik2qNCTUulmIOjzR08K
         r05zp/zzpSTkfyVBxFEtTufcjQ48ODLLEhKAGQMu/ngG5bsSCWPSb2CvB5gqoZVJfAvI
         ZDNZy/NYUXrcOdxUeGN0TNssBl7RI2Gal7Fh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862448; x=1795467248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSp87YkJRrmwdFUaHDQmleJWcDY7Ulus3h1BaGKCHrs=;
        b=VGw9mgg3jJRvqSb6ad9AJHScOhkLbOaQzT3m5Ezrc4S69o7aoEHm4F1E/4W0HEvNvn
         bV8KnYqPcohvwe7sRtlK7mA0q7Kw+s5sV40Y6wmW7/RXkBRcrxhmMIL/GRK7gBUd+mYo
         clA0etLU3Zdz6nv83RyO+HhI5xV8fBtS3dm15bcS7/xq+3tjQuB+kp7lL8N9R8uk2Pq2
         B9uqkTc1R/GDlSb/gT0PDWYwgOvRZnIQ1xtspyKrKMQhnF7nVbPujtUAB8mu6wD5w4Ac
         r6QhcL50FAFzH9HRdkQaTga+Cjdv3/V6i3GZTstt2hl/bSawaUNCtb4+0nJ2Fb25TXAF
         Gz1Q==
X-Forwarded-Encrypted: i=1; AL+hErGJxQ+WYMEX+0dVFf4fx8btMAu5AJykbLo8EPD5GLYhhTxTO9vdNoUp4zmZR37M6d+3GqzBunPgZLY2Q9M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9F3uxWkYHUE6T7l8/8XJKqybY96/9G3zoiiP7PGpvfJvQ+DCjf
	hQ6rGw5nw14F93X8Ou9D8+LzNTd0ynJ54ptmkwYwgHNkuV6tqEQ9LfdXRkWRphCC4w==
X-Gm-Gg: AZFdTZd/PYAO3DFQiVGoHLj3KcBqYEE2aFOw0iBnHnYItEdESvq0hz/8xoIGLR/FE8Z
	dYFoL60PdmGEICq8Qbvsfb/yPpzDAnC296h//AxJDo9hRFRo13eCgwsaNqpEpD0VcwqzezRLG5X
	G5oHWmUImNlf06778g8QmTUWK1+xWwRVgXASbhLfTcLaeIgty0H6uvbcQkjW6HrRSL0udcs0sr4
	heVPl8CB1Lpcg7DQiJMX0ISwtI1jy5W63g/UczjytY6+tPKkEfuaAEjEUodzv7eG9eR/iYsfbLJ
	1KtevVfJRzaVfYFynzm1M1e7zOG+KHFRCEcq+H9qmNABg02urWqSKe+Ehu72jZBx2sSTaTeovqi
	9POwK12wX0B9Q5z1Qv+V6hhXR6OKR17jI2iHR5iJREsfWTwCsOKVw8W9O1/t930r42FsPxBLk/F
	xp1pxJe85CTuna+Mf44tK13S0fsKNYkgGLrzxvT4Z5xZy8EFGv+h7CITHeTQEcjrpfBHLxV0TyC
	nDyOLXRQwpZc2YnZmXL4MeToFJ20y6sCDlr8wDYP/I3scz4khVcgjYafjzl//pzwZFFaElP+Lb3
	5SK2y7CFvDeAtVCJtSFj2ImX2jS9JPFZTb7ZPCMooLDmzvP7uvy1NQbIsGcPNbXOV+3JIrXZ4je
	IUAsaT72+WqbJoA==
X-Received: by 2002:a05:7300:de09:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-3796676b135mr10855894eec.19.1794862448196;
        Mon, 16 Nov 2026 12:54:08 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:54:07 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 11/14] fdtfactor: Add -S/--strip-local-fixups option
Date: Mon, 16 Nov 2026 12:53:08 -0800
Message-ID: <20261116205320.1621386-12-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

By default, `fdtfactor` preserves `/__local_fixups__` on `base.dtb` so
that when `fdt_overlay_apply()` merges a `.dtbo` overlay, the
reconstructed device tree retains full `/__local_fixups__` information
(for instance, if an OS kernel wants to know which property cells
contain phandles at runtime).

When `-L` was passed to `dtc` solely to help `fdtfactor` locate phandle
cells at build time and `/__local_fixups__` is not needed at runtime,
retaining `/__local_fixups__` in `base.dtb` wastes space.

Add `-S` / `--strip-local-fixups` to omit `/__local_fixups__` from
`base.dtb` (and therefore from the merged device trees produced by
`fdt_overlay_apply()`). On a set of 47 Qualcomm SC7180 Trogdor
Chromebook board DTBs, `fdtfactor` without `-S` reduces total
uncompressed size from 7.69 MB to 932 KB (88.2% savings), while
`fdtfactor -S` reduces it to 634 KB (91.8% savings, saving an additional
298 KB by omitting `/__local_fixups__` from `base.dtb`).

Add a test case in `tests/run_tests.sh` verifying that `fdtfactor -S`
followed by `fdtoverlay` reproduces DTBs compiled with `-@` (without
`-L`) via `dtbs_equal_unordered`.

Reviewed-by: Simon Glass <sjg@chromium.org>
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- Use 4-space indentation instead of mixed tabs and spaces in
  tests/run_tests.sh, and update context for -o/--output (David Gibson)

Changes in v3:
- Include both non--S (932 KB) and -S (634 KB) Trogdor size numbers in
  the commit message to show the savings of -S itself (Simon Glass)
- Pass -S to the negative test verifying that inputs lacking
  /__local_fixups__ are still rejected when -S is used, and move the
  non--S rejection test to the base fdtfactor patch (Simon Glass)

Changes in v2:
- Split -S/--strip-local-fixups into a separate opt-in patch (David
  Gibson)

 README.md          |  9 +++++++++
 fdtfactor          | 21 ++++++++++++++++++---
 tests/run_tests.sh | 19 +++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index 9a8be74d47fe..198384cd8456 100644
--- a/README.md
+++ b/README.md
@@ -228,6 +228,15 @@ Options:
 * `-o`, `--output`: Output directory for generated `.dtbo` files and
   `--output-base-dtb` (default: alongside each input `.dtb` for `.dtbo` files,
   current directory for `--output-base-dtb`).
+* `-S`, `--strip-local-fixups`: Omit `/__local_fixups__` from the generated
+  `base.dtb` and final reconstructed device trees. By default, `fdtfactor`
+  preserves `/__local_fixups__` on `base.dtb` so that when `fdt_overlay_apply()`
+  merges a `.dtbo` overlay, the reconstructed device tree retains full
+  `/__local_fixups__` information (e.g., for an OS kernel that wants to
+  know which property cells contain phandles at runtime). When `-L` was
+  passed to `dtc` solely to help `fdtfactor` locate phandles at build time
+  and `/__local_fixups__` is not needed at runtime, passing `-S` strips it
+  from `base.dtb` to save space.
 * `-s`, `--stats`: Print size savings summary.
 
 ### TODO
diff --git a/fdtfactor b/fdtfactor
index dfbee0aea2d6..a083a8c380a0 100755
--- a/fdtfactor
+++ b/fdtfactor
@@ -675,11 +675,13 @@ def _build_board_dtbo(dtb, base_nodes, base_dtb_symbols,
     return bytes(dtbo_root.flatten().as_bytearray())
 
 
-def create_base_dtb_and_overlays(dtbs):
+def create_base_dtb_and_overlays(dtbs, strip_local_fixups=False):
     """Compute the base DTB and per-board DTBO blobs from parsed DTBs.
 
     Args:
         dtbs: Sequence of `ParsedDtb` instances (at least two).
+        strip_local_fixups: If True, omit `/__local_fixups__` from the
+            generated `base.dtb`.
 
     Returns:
         Tuple of `(base_dtb_blob, dtbo_blobs)` where `base_dtb_blob` is the
@@ -694,7 +696,9 @@ def create_base_dtb_and_overlays(dtbs):
     base_dtb_blob = _serialize_base_dtb(
         base_nodes, base_dtb_symbols,
         dtbs[0].mem_rsv, dtbs[0].boot_cpuid_phys,
-        emit_local_fixups=any(d.has_local_fixups for d in dtbs),
+        emit_local_fixups=(
+            not strip_local_fixups and any(d.has_local_fixups for d in dtbs)
+        ),
     )
     dtbo_blobs = [
         _build_board_dtbo(
@@ -757,6 +761,14 @@ def parse_args(argv=None):
             'current directory for --output-base-dtb)'
         ),
     )
+    parser.add_argument(
+        '-S', '--strip-local-fixups',
+        action='store_true',
+        help=(
+            'Omit /__local_fixups__ from the generated base .dtb and '
+            'reconstructed device trees'
+        ),
+    )
     parser.add_argument(
         '-s', '--stats',
         action='store_true',
@@ -841,7 +853,10 @@ def factor_dtb_files(args):
         seen_paths.add(abs_out)
         dtbo_paths.append(out_path)
 
-    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(dtbs)
+    base_dtb_blob, dtbo_blobs = create_base_dtb_and_overlays(
+        dtbs,
+        strip_local_fixups=args.strip_local_fixups,
+    )
 
     if args.output:
         os.makedirs(args.output, exist_ok=True)
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 815233227df1..4f5026e363fc 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -1305,6 +1305,25 @@ fdtfactor_tests () {
     done
     run_wrap_error_test $PYTHON $FDTFACTOR -o fdtfactor_legacy.test.dir \
         fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
+
+    # Strip local fixups (-S): verify that merged DTBs match DTBs compiled
+    # with -@ (without -L), and that inputs lacking /__local_fixups__ are
+    # still rejected even when -S is passed.
+    run_wrap_error_test $PYTHON $FDTFACTOR -S -o fdtfactor_strip.test.dir \
+        fdtfactor_board1.nolf.test.dtb fdtfactor_board2.test.dtb
+    rm -rf fdtfactor_strip.test.dir
+    run_wrap_test $PYTHON $FDTFACTOR -S --output-base-dtb base_strip.test.dtb \
+        -o fdtfactor_strip.test.dir \
+        fdtfactor_board1.test.dtb fdtfactor_board2.test.dtb \
+        fdtfactor_board3.test.dtb
+    for i in 1 2 3; do
+        run_wrap_test $FDTOVERLAY \
+            -i fdtfactor_strip.test.dir/base_strip.test.dtb \
+            -o fdtfactor_strip.test.dir/merged${i}.test.dtb \
+            fdtfactor_strip.test.dir/fdtfactor_board${i}.test.dtbo
+        run_test dtbs_equal_unordered fdtfactor_board${i}.nolf.test.dtb \
+            fdtfactor_strip.test.dir/merged${i}.test.dtb
+    done
 }
 
 while getopts "vt:me" ARG ; do
-- 
2.56.0.679.gc527c65306-goog

