Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570602;
	b=5TOwZaXnXRtDNV00cLnNAn4vcn0M8Fp1NUZafO61XwXGbT3DutjMTq9lsuQxbyB4PgWg
	 lP3v+glLzi5Xxy/Ye/BSslRW2vizgWWQe2oLWVdeiBVx1qQVHdbmzrFxWxO5KomBIY0L2
	 zGlpnw7Ab6JCkcDhiaCEPKv0dKViHahbKtcH0pn9NdvP9V0EdW7sj6/+zbbYMueuOwuiM
	 FdvH4p7YsN/+2VdeeSQ9nraw3pVq+ru+5T/bDji2lWDPcJIuq7QvryCjbON9xo7068472
	 f9CMS3Wu9cwRSMlxmr1UWL/bSN6DwseelX0up9xpoanVVs1HqQsvuao7SCb3KzH8law==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=flmKDheRArZmX/2v3f6eDFdui2G8g69FBXprbtqj4hw=;
	b=MP9Nwo2KKyOEY6X5mP+edzNfx8uk5fl+1dQsspRXrF/xH5eoKhGk6GcC3VjXQTovx32e
	 bHo6Buwn2vLb56JdFfsMNFPhUB4MfPFJecdqq7LkCK7L4pfTJ2i590eUMyc0EiHhfLJBG
	 mAyaSSAw6PmnrrzOsqM/zLdJkAHE6h3H3b4/NUs4C5LLs6CpKly82WCURALg92SskFsDi
	 GLuu1OKGhYJiWVCllGE9HKgN67H5U7cweIuB74chTvM5A0ErvdX3RlWGs6t8va/lGRTGi
	 tPVCRAJ80PHBIdHIyaAyKS90PylPETHYNvx/i9i1Fe+SRF6Zp8dSbTehLYO29k54iFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="Git5RT/C";
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DE1606A32F
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37DE1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Git5RT/C
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36a1947498bso1682563eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570601; x=1794175401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flmKDheRArZmX/2v3f6eDFdui2G8g69FBXprbtqj4hw=;
        b=Git5RT/Cg+AjU2u5XDvpUym5BISJATNTvCgGIeoccpQwXCb9/ElAloWjmSUuo9QFyC
         0eiPK6gfypqZtp8QKsO5hvMJe2I7RtL/DAnI72nGdg/eqRznkcUADHiV9lLMMpDNM3Ck
         sLRRRh6dJwCW34LGjc+bt8uSSSXqwNBCs8lcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570601; x=1794175401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flmKDheRArZmX/2v3f6eDFdui2G8g69FBXprbtqj4hw=;
        b=ofOdRK661FSZQ9snHCEgdiXhcqLYvLkxevC1CZ0faXvnBGbdVVIqZ5X2ctYxog1U6r
         6Rbu/9vA39KadQ6FXxs706SoAQK2RpiA+6hUyXbEQixT6ykyJ7rAZgVfRtSYoQVGnclB
         kEAF+nBbfTIzyRUHvYKL3j5viMsj/a3TFdMb2RTgwTQ/sjDK3XSr79mSGJavCxRT7Gp6
         cVtNa4yMkvb8u+gCvoCKo6ZYd2TL3P1PkD/bbEKcApYVPN1cmDfh2QGch5QT9/JEXm1N
         JpEDqGFluOjCJSDT5sMnufqLrYiG7UGji6cep9WtpvgaLd0ZOY7dNbwWzaWF19YH9O/Y
         m/UQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5G9vgoBlAAKGhtwNnT5GVU5Q8NAIiNW+QzoInEvqW/BiRYZI9SzmtAL2fbG2zxdA/GWHCRemMbBXnBEg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH+HD14kZYL9/cO6EVm/b+wwjps56GM3+gHKeR1v3vC2ZaZHXH
	ytkOI9QhWReDXMauJgQyG505WxKIoRYfGOdgBCGchMrjlnYCgRtCC4XeDoqkrPkJxcTw99T90Ou
	JUmQ4S11/
X-Gm-Gg: AYBFou1DWOkUNUqenNltU5l1DmfxF2RjRRzAV/afqIoX9+ooHauM7NJDy2PrUwGHLxS
	5DzG7rN0G5YaUYWzVkjM7AvcjOEsfmgMwbtESaa3EPl9A11zBJgr2NZ9q8abhJgGMZzvIHHkSx0
	qIY5Ej6ZaP7UH8j/v8KQOrhd3SdmfwsVYTK+zEh/Eis/Pl92INVywlu608j4U3RXhEAdxITKRg4
	DRgMPiZf1uHIr+kvsO7id/8yyWZH18spe+LyNMXjggWoxCqIpstm1UyjebwpgL5cvUf84TIJLZ5
	91U0g7Jp4hn+/QX4OpoWD/Bj5I3FfzlRml24aR5wCmOuj01Rj3pcnvdQ8mA+qz4lJOeAyYgflNP
	rc99JpDk2OshWk2EDPOnlTjPkpvTjCjOtlIA0rAhCq1XMY56jAj6Du+/5qyCUYYG3EkypeVCFd2
	zKt/uolbbZooBQFIdcuml9yGAeAjqvoYHtc6UFpACpWxiqn8x57/5CVVcGoz5m0a47HWsYaY+HM
	BSNz//f2W1G12Soh/shJR52uj6h/4K6FlDN7J3jDN6UuAJjbZEtOzo4ljcwbGW7dF7752/zLyI1
	Gw0qR8UKdMbuO4K0WPMGmjlOEhaWQD7z0h077/EM675h+ImnDVw5rVTvxxH959x1dE+BCLFp13K
	39vMjVhRUBvtGRw==
X-Received: by 2002:a05:701b:4589:b0:19b:39f4:88c9 with SMTP id a92af1059eb24-1ac5bbb487bmr12469921c88.10.1793570601027;
        Sun, 01 Nov 2026 14:03:21 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:19 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	Brian Norris <briannorris@chromium.org>,
	linux-kernel@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 01/15] libfdt: overlay: Fix out-of-bounds write on bad fixup offset
Date: Sun,  1 Nov 2026 14:01:08 -0800
Message-ID: <20261101220224.1436242-2-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
In-Reply-To: <20261101220224.1436242-1-dianders@chromium.org>
References: <20261101220224.1436242-1-dianders@chromium.org>
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

A malformed overlay with a negative or very large fixup offset in
/__fixups__ (such as "/fragment@0:target:-4" or
"/fragment@0:target:4294967292") can cause an out-of-bounds write during
overlay application:

1. overlay_fixup_phandle() parses the offset with strtoul(), which
   accepts negative numbers and values larger than UINT32_MAX, and
   truncates the result into a 32-bit integer.
2. fdt_setprop_inplace_namelen_partial() checks bounds with
   `(unsigned)proplen < (len + idx)`, where `len + idx` wraps around to
   a small number when `idx` is near UINT32_MAX, bypassing the check and
   passing the huge offset to memcpy().

Tighten the fixup offset parsing in overlay_fixup_phandle(), fix the
bounds check in fdt_setprop_inplace_namelen_partial() to avoid unsigned
wrap-around, and add test cases covering both negative and overflowing
offsets.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split the fixup offset overflow fix and fdt_wip.c bounds check out of
  "libfdt: overlay: Prepare fixup and fragment path helpers for reuse"
  into a standalone bugfix patch with dedicated tests (Simon Glass)
- Add a comment explaining why an initial ASCII digit check is needed
  before strtoul() (David Gibson)

 libfdt/fdt_overlay.c                       | 34 +++++++++++++++++-----
 libfdt/fdt_wip.c                           |  7 ++++-
 tests/overlay_bad_fixup_negative_index.dts |  9 ++++++
 tests/overlay_bad_fixup_overflow_index.dts |  9 ++++++
 tests/run_tests.sh                         |  2 ++
 tests/setprop_inplace.c                    |  8 +++++
 6 files changed, 60 insertions(+), 9 deletions(-)
 create mode 100644 tests/overlay_bad_fixup_negative_index.dts
 create mode 100644 tests/overlay_bad_fixup_overflow_index.dts

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 51a3859620a4..c6dc4774cff3 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -330,10 +330,10 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
-				     int poffset, uint32_t phandle)
+				     uint32_t poffset, uint32_t phandle)
 {
 	fdt32_t phandle_prop;
-	int fixup_off;
+	int fixup_off, ret;
 
 	if (symbols_off < 0)
 		return symbols_off;
@@ -345,10 +345,20 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 		return fixup_off;
 
 	phandle_prop = cpu_to_fdt32(phandle);
-	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
-						   name, name_len, poffset,
-						   &phandle_prop,
-						   sizeof(phandle_prop));
+	ret = fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
+						  name, name_len, poffset,
+						  &phandle_prop,
+						  sizeof(phandle_prop));
+	/*
+	 * fdt_setprop_inplace_namelen_partial() only returns -FDT_ERR_NOSPACE
+	 * when poffset + sizeof(phandle_prop) exceeds the existing property's
+	 * length in the overlay, which means the overlay is malformed (not
+	 * that the base DTB buffer ran out of space).
+	 */
+	if (ret == -FDT_ERR_NOSPACE)
+		return -FDT_ERR_BADOVERLAY;
+
+	return ret;
 }
 
 /**
@@ -409,7 +419,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		uint32_t fixup_len;
 		const char *sep;
 		char *endptr;
-		int poffset, ret;
+		unsigned long poffset;
+		int ret;
 
 		fixup_end = memchr(value, '\0', len);
 		if (!fixup_end)
@@ -438,8 +449,15 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		if (!name_len)
 			return -FDT_ERR_BADOVERLAY;
 
+		/*
+		 * Require an initial ASCII digit because strtoul() accepts
+		 * leading whitespace and '+'/'-' signs (wrapping negative
+		 * values to unsigned long).
+		 */
+		if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+			return -FDT_ERR_BADOVERLAY;
 		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (endptr <= (sep + 1)))
+		if ((*endptr != '\0') || (poffset > UINT32_MAX))
 			return -FDT_ERR_BADOVERLAY;
 
 		ret = overlay_fixup_one_phandle(fdto, symbols_off,
diff --git a/libfdt/fdt_wip.c b/libfdt/fdt_wip.c
index c2d7566a67dc..dd163d91498c 100644
--- a/libfdt/fdt_wip.c
+++ b/libfdt/fdt_wip.c
@@ -23,7 +23,12 @@ int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
 	if (!propval)
 		return proplen;
 
-	if ((unsigned)proplen < (len + idx))
+	/*
+	 * Check that idx + len fits within proplen using subtraction rather
+	 * than addition so that a large idx (or negative len) cannot wrap
+	 * around 32-bit unsigned arithmetic.
+	 */
+	if (idx > (unsigned)proplen || (unsigned)len > (unsigned)proplen - idx)
 		return -FDT_ERR_NOSPACE;
 
 	memcpy((char *)propval + idx, val, len);
diff --git a/tests/overlay_bad_fixup_negative_index.dts b/tests/overlay_bad_fixup_negative_index.dts
new file mode 100644
index 000000000000..02ccee905e85
--- /dev/null
+++ b/tests/overlay_bad_fixup_negative_index.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:-4";
+	};
+};
diff --git a/tests/overlay_bad_fixup_overflow_index.dts b/tests/overlay_bad_fixup_overflow_index.dts
new file mode 100644
index 000000000000..d7d05267d7b3
--- /dev/null
+++ b/tests/overlay_bad_fixup_overflow_index.dts
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+/include/ "overlay_bad_fixup_base.dtsi"
+
+/ {
+	__fixups__ {
+		test = "/fragment@0:target:4294967292";
+	};
+};
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index 5bc7817dd12a..0d815e307909 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -274,6 +274,8 @@ BAD_FIXUP_TREES="bad_index \
 		empty \
 		empty_index \
 		index_trailing \
+		negative_index \
+		overflow_index \
 		path_empty_prop \
 		path_only \
 		path_only_sep \
diff --git a/tests/setprop_inplace.c b/tests/setprop_inplace.c
index 61a0da16fce8..48182169fbf6 100644
--- a/tests/setprop_inplace.c
+++ b/tests/setprop_inplace.c
@@ -80,5 +80,13 @@ int main(int argc, char *argv[])
 	check_getprop(fdt, 0, "compatible", strlen(TEST_STRING_4_RESULT) + 1,
 		      TEST_STRING_4_RESULT);
 
+	err = fdt_setprop_inplace_namelen_partial(fdt, 0, "compatible",
+						  strlen("compatible"),
+						  0xfffffffcU,
+						  TEST_STRING_4_PARTIAL, 4);
+	if (err != -FDT_ERR_NOSPACE)
+		FAIL("fdt_setprop_inplace_namelen_partial() with wrapping idx returned %d instead of -FDT_ERR_NOSPACE\n",
+		     err);
+
 	PASS();
 }
-- 
2.56.0.317.g454f8302e1-goog

