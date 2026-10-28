Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224600;
	b=CnCvH6eHs3Koib7tj8pYtS1rdjLc6vH1RIdbp72Pgu5G2oyzrqMv3nnF1i7U5dFd3Eg5
	 lF6pdMthXmPU9TZNSTb+mKLxSUma4z6MNnTnF7EAqESVWrPKvrMX1DD93Xy9Ai+IInniU
	 Fv/i4PtjH5zJk7uNHdoDzplNO05QbL5AibamFc8OjDakDeKONeuKk12kEz4SE0e6tzY2+
	 5VemB1hej/KIGnJ5KgeDU6iZQnuK4R6TYJ1v9BWs23fgB4qTZijrJUw77AKsY0QdONYQ5
	 eY22+uIbuP+QurRD7vRAGvRarvM9xJe4eQCfQeGT/lvixY+Fc1M/vDt/+8O/HoTh4DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
	b=VwPwTB0uAjinWRpAFtZ4wt4vBEu3aQQSGHhFw0kByTjLG/u/0fF73C2XCBW6bvsxvxfT
	 /0RfiLXT0w9a6eYPQj7Gb8eUPf+5XUULSBeISUWe4+j6S4K6ENnFXbbWL7M8waLnXwxE+
	 0PcbguMIl1pbzJTaYTHcydz4OW4MIDaQ7gx2qp+h0q+t4XxxMnXBit1ycMYQYL/oHv3gf
	 2JnI2AC12KdvaFgW8tm3c51qVl0k65NvziwgbRtxUyjHsqG0pyCvVtiNfD+D56f07Ow5K
	 g+Ygpm/QNCE9qcEkCy6pNaOj4sHFAXptuV+1qzjkwbORXJKs3l6oE+mCh3BF+CcLP6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RbPng09J;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4F060A3813
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C4F060A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RbPng09J
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36a1947498bso47255eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224600; x=1793829400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
        b=RbPng09J1uUuo4smSeIG++PvHgPwDC+JSS6fKpiGKnMtAN7asPstkwl9u2USLxyWoo
         AEGOojCM8Ems6zlpK8UJmdCbh+ru0y7EPkm68M8tk4G0OgCIeH4zpECk2xDQoPIdDiV/
         bQVkazqXLH7RUxdQi+bv70Gl/T7yJY4p5ppiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224600; x=1793829400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RhCp/61kQDDZJEt9zu5kg04zSyX2rdFkpQ6rLDYQN6Q=;
        b=hS7GUFAp3wiKMHQ38HmeyS0aMqcR7SL/Upl0ewXwHpjoE1lCHkII8Q3h9o2zc+Ifwv
         JKjDqFg0jwBW4oVc1K/jHcjH6I1d/k0rYqeCfxAgnv72Ke4mjRHbKieUJWtlHAv8YqEM
         7AwywNRIhmmOgW5D056yhnr6d0FJETPiffcvOOKQeEJ1FLisbRiP7OnD4/tMjLNb0BVW
         HsFqlyGR0mllX+qY0V7UrgUg8mH3tDfK6ykUOaocSmhDsrUDhzsIkLBWXHCB9XeD7Pv/
         VIBPKl0yW0yGeb855T8LYeTtaQVzr29TNrnHRiGP3NTzW1c1pbQ14IGWjaNpkBPPTE/0
         z5og==
X-Forwarded-Encrypted: i=1; AKwUvBymvQUTCa/NEqWCRE3699Qhh4Aj/EVc8Nsg9OpoR9XrlPjcZGAmF+CEFiHqWE+LZVNtObq4Fh1Q3fyQFXQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKq/etUh1fQhIQ4FUr5SVV7yBQlWn6BnMKYKUOq9mCUipvJj/EC
	eQwIe1KgvAmYnCE1yPYb2bbZsSO6OIsmFay10Rp4yrNBZYiDQHFxajgkRGYRNSp6Dw==
X-Gm-Gg: AYBFou1iZ9lz94tbXCY+E98pHk40qiwl18tUqkBz9euiSE/8TCaLbVdJNyEP+fGrgox
	gCZw6svzhtiZhR0ynlX38tk5UtpHojFeR+4cAK9VJNx5Az9DIMlJFjaXb/KZqJizpqrWR2Jcn9B
	zQKcNfOQJz7QaL89ZPjF8YdGAyAcEiSB5ogbAwXWZC7nKHwrV4nKyKqJrBJ4O+goeSWeRFqbSM1
	mZZ6PZRLeIy434y0F0mbKCOe044Z+MyZ7C0Cew+jZInaf7HotWMFYA6jkzXiQYOpR3PdxWlwks1
	OME8q7Eh9IjoGQJY/3CjsB3siPR8yvDN77gx7aat+IyVmn8v7sppAbMrEoL8L1VA5QqLavysJhR
	iOg4AeNUKrrSTFdK6mBUZeK6UflRDn2vmLEymAWz/lMQtzqftotgVWAvmGKRPYZ8or3Tif33WfO
	c0WkjUfCTV8jxny6dwgbVxfyRGX0WtxW72Be5/LHv5WR15sgpvZn/YRD2AetIP1POhq6LF1Hxvj
	x0fVUmDt6WQsUyDD3m0JPtWep/RkK/uj0xxRVNT1J19oREWcIF4hf6m+G2THmZQZ1R1OYB33rrI
	TrF+bDNTGTXGXSx+XQfApD5eqvR68ONARZpyDJb4lJvyJI4vB90Se7NVoz2CQuEny7a2pvLYVIb
	lzl+ot047ZMfB
X-Received: by 2002:a05:7301:4683:b0:35e:51d6:9f6f with SMTP id 5a478bee46e88-36a20418ca8mr5788681eec.27.1793224599384;
        Wed, 28 Oct 2026 14:56:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Brian Norris <briannorris@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-kernel@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v2 05/10] libfdt: overlay: Prepare fixup and fragment path helpers for reuse
Date: Wed, 28 Oct 2026 14:46:54 -0700
Message-ID: <20261028215600.1713475-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
In-Reply-To: <20261028215600.1713475-1-dianders@chromium.org>
References: <20261028215600.1713475-1-dianders@chromium.org>
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

Clean up `overlay_parse_fixup_entry()` and generalize
`overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` so both can be
reused when updating `/__local_fixups__`:

- Change `poffset` from `int` to `uint32_t` in
  `overlay_fixup_one_phandle()`, `overlay_parse_fixup_entry()`, and
  `overlay_fixup_phandle()`, and parse into `unsigned long` before
  validating the range.
- Require `*(sep + 1)` to be an ASCII digit (`'0'..'9'`) and bound
  `poffset` to `INT32_MAX - sizeof(uint32_t)` so negative strings (such
  as `"-4"`), leading whitespace, or large values cannot silently
  truncate or wrap around in `fdt_setprop_inplace_namelen_partial()`.
- Drop the redundant `*sep != ':'` checks after `memchr(..., ':', ...)`.
- Generalize `overlay_split_fragment_path()` to accept a length-bounded
  `path` slice that is not necessarily NUL-terminated (using `memchr()`
  instead of `strchr()`, and keeping the NUL-terminated property check
  in `overlay_symbol_update()`) so it can also split `:`-delimited paths
  from `/__fixups__`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch tightening fixup offset parsing and generalizing
  overlay_split_fragment_path() for non-NUL-terminated paths in
  libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 46 +++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index f9d1a555ed5d..eb87b356145f 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -330,7 +330,7 @@ static int overlay_update_local_references(void *fdto, uint32_t delta)
 static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 				     const char *path, uint32_t path_len,
 				     const char *name, uint32_t name_len,
-				     int poffset, uint32_t phandle)
+				     uint32_t poffset, uint32_t phandle)
 {
 	fdt32_t phandle_prop;
 	int fixup_off;
@@ -368,7 +368,7 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 				     const char **pathp, uint32_t *path_lenp,
 				     const char **namep, uint32_t *name_lenp,
-				     int *poffsetp)
+				     uint32_t *poffsetp)
 {
 	const char *path, *name, *fixup_end;
 	const char *fixup_str = *valuep;
@@ -376,7 +376,7 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 	uint32_t fixup_len;
 	const char *sep;
 	char *endptr;
-	int poffset;
+	unsigned long poffset;
 
 	fixup_end = memchr(*valuep, '\0', *lenp);
 	if (!fixup_end)
@@ -388,7 +388,7 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 
 	path = fixup_str;
 	sep = memchr(fixup_str, ':', fixup_len);
-	if (!sep || *sep != ':')
+	if (!sep)
 		return -FDT_ERR_BADOVERLAY;
 
 	path_len = sep - path;
@@ -398,15 +398,17 @@ static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
 	fixup_len -= path_len + 1;
 	name = sep + 1;
 	sep = memchr(name, ':', fixup_len);
-	if (!sep || *sep != ':')
+	if (!sep)
 		return -FDT_ERR_BADOVERLAY;
 
 	name_len = sep - name;
 	if (!name_len)
 		return -FDT_ERR_BADOVERLAY;
 
+	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+		return -FDT_ERR_BADOVERLAY;
 	poffset = strtoul(sep + 1, &endptr, 10);
-	if ((*endptr != '\0') || (endptr <= (sep + 1)))
+	if ((*endptr != '\0') || (poffset > (INT32_MAX - sizeof(uint32_t))))
 		return -FDT_ERR_BADOVERLAY;
 
 	*pathp = path;
@@ -470,8 +472,8 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 
 	do {
 		const char *path, *name;
-		uint32_t path_len, name_len;
-		int poffset, ret;
+		uint32_t path_len, name_len, poffset;
+		int ret;
 
 		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
 						&name, &name_len, &poffset);
@@ -925,8 +927,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
 
 /**
  * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
- * @path: Input NUL-terminated path property string
- * @path_len: Length of @path in bytes (including trailing NUL)
+ * @path: Input path string (need not be NUL-terminated)
+ * @path_len: Length of @path in bytes (excluding any terminator)
  * @frag_namep: Output pointer to the fragment name
  * @frag_name_lenp: Output length of @frag_namep in bytes
  * @rel_pathp: Output pointer to the relative subnode path after __overlay__
@@ -935,7 +937,7 @@ static int get_path_len(const void *fdt, int nodeoffset)
  *
  * returns:
  *      0 on success
- *      -FDT_ERR_BADVALUE if @path is not a valid NUL-terminated '/' path
+ *      -FDT_ERR_BADVALUE if @path does not start with '/'
  */
 static int overlay_split_fragment_path(const char *path, int path_len,
 				       const char **frag_namep,
@@ -951,18 +953,14 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 
 	*is_overlayp = false;
 
-	/* verify it's a string property (terminated by a single \0) */
-	if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
-		return -FDT_ERR_BADVALUE;
-
 	/* keep end marker to avoid strlen() */
 	e = path + path_len;
 
-	if (*path != '/')
+	if (path_len < 1 || *path != '/')
 		return -FDT_ERR_BADVALUE;
 
 	/* get fragment name first */
-	s = strchr(path + 1, '/');
+	s = memchr(path + 1, '/', path_len - 1);
 	if (!s) {
 		/* Symbol refers to something that won't end
 		 * up in the target tree */
@@ -972,13 +970,13 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	frag_name = path + 1;
 	frag_name_len = s - path - 1;
 
-	/* verify format; safe since "s" lies in \0 terminated prop */
+	/* verify format */
 	len = sizeof("/__overlay__/") - 1;
-	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+	if ((e - s) >= len && (memcmp(s, "/__overlay__/", len) == 0)) {
 		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 		rel_path = s + len;
-		rel_path_len = e - rel_path - 1;
-	} else if ((e - s) == len
+		rel_path_len = e - rel_path;
+	} else if ((e - s) == (len - 1)
 		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 		/* /<fragment-name>/__overlay__ */
 		rel_path = "";
@@ -1049,7 +1047,11 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (!path)
 			return path_len;
 
-		ret = overlay_split_fragment_path(path, path_len,
+		/* verify it's a string property (terminated by a single \0) */
+		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
+			return -FDT_ERR_BADVALUE;
+
+		ret = overlay_split_fragment_path(path, path_len - 1,
 						  &frag_name, &frag_name_len,
 						  &rel_path, &rel_path_len,
 						  &is_overlay);
-- 
2.56.0.313.g2479322e68-goog

