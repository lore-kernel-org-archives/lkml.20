Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570633;
	b=T4rvGGigraPttCtJskvpMUWmf60s6GT/12hG5wpeay4+u1wu2CskgRUKQ3f0bzXCPtSY
	 vHh+qGDSqEqY7TM5LykWqTuH9BiiSXUKNCJK1mnt8HqGPx5tOfP8YPbPqv2/XxbOYLKeb
	 P1HguRmGGD2mvU3zG4097W5Zjr/KD3HFQ6p3ap5FKig+MwXLjpYFsAVYHcdxfdWjZiJ07
	 6GFlNMLyKK5Y/cjvm7/m9LDjmk30IbiujD3pv6xNZOCFnyPgipDncltmj1XFQO8f0Pnro
	 EgE/zYCo2/hydGVIUgikBNhbNFqbTy9+wKZxyA7OGFJI9QuYfgFYyOgLDMOQ1YWdwew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ua2VboypW5aNhhHvco3/R0nCLYZnZACPiM6sk8Dfv1Y=;
	b=h5DB1ceDSccivKC15TeUvbjOfIZuL5Elqe0QLwOcbfH5yrWUhLxBn0QwV57TMqmajli5
	 yVMsJz6MdMOPgyxa2wZq0kMffHMpgFUy1bBJZyZVYuC6X4aESCG/FvtUleJc8PCwq2q6y
	 miq20EX9Exkjx9LClJPqMqgU4tyembZMv5CKnA+aw/CLQ9H0B82fFsLu3Ex7spzdIbKs6
	 zkRoNksFgvBHLrk14otEVlxPR6ZSR48g11GPIs4jMIS5HkBCtFdOMfJb0aUMNjQi+G8G6
	 Gjq7mwvoefjtl1V/Pnp45CA+j3pz+bkcGzXDlmYo+Q6yf0KTpimUT0VD7/3JYnZp3gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="E9h4+K+/";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEC1606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EEC1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E9h4+K+/
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15dd124bbe7so2678926c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570632; x=1794175432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ua2VboypW5aNhhHvco3/R0nCLYZnZACPiM6sk8Dfv1Y=;
        b=E9h4+K+/4l/lRhF8Jk06ZZDPRZsL04sH5a9ZhX0bDRbWTHoZ6CxGgcBUd5WTsHwi/0
         TOxVeK4tfj8TsJmlIU8jRIMELSbHqeOEPjdQUtSaaywGbVe1eHO02FfMXa/c7s/VQ9Fb
         MT/xpgivNIkvuqaog6LKOvL7po+iFYcyeb/zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570632; x=1794175432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ua2VboypW5aNhhHvco3/R0nCLYZnZACPiM6sk8Dfv1Y=;
        b=zhjEfbpUe5SFtrWg311WyOASkjabrhZjSR8TAiGKlY0O3uSgUNxECqRXwiYx+vuu7B
         sF6xsTXYtQwEWbZ9sdkJHNA+gmH2IML/33TZ5nP8tyisjFy74u7Hlv4UXYA6+GHLXYiw
         e82uG5yMTHPgDj5iBlzA5JAsONv5x7VgtXGtwufeYeWAweSlGxGnO1ewcltZlVUEcLPj
         wWTzr6iKJApU4UOKz3+ReiBzLQH1Ju+zLzY/jYR4rKwx3JBhVRJKebwXrrjWCpG5zjQu
         v3aVpmdgZ9YkUSQw06kqLXBuphE8wYOV9NUF8tOmYCHCmLgE8cUPLUT6e6vLamtzQcXu
         8FVg==
X-Forwarded-Encrypted: i=1; AKwUvBxJ7pnSPvf+qkS+EIQvsUJfVmfVKhR9/+h5JmyoYXtZoknRyOjyvay/EWhX8HoLYVEJbPG9+V8cUW6HtY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOlxvn15V1dsa7jWcaOHw0UJAHqswcPVrAlJvqxeF+pVBbmiRO
	3wEk+81nlCxE8YtDsitmOYOqjJ64wgqjknUgFK+6uF2O9KjqJD5YjydXILK3vy+rSg==
X-Gm-Gg: AYBFou2AXGHZRSqq5xie5pVPFXt0zH60CTwl8pUbBNOGRrmhImPoG7Tkn22HgBfRuP/
	z6qwoRzt+HzGoqmuaNCfE0BMNDaDcRdSN8NOFJpZDkEPJZUEeDqF3nu2uto2s0ctNeE/SeO0tZs
	PHDxFkoiiUJqa7ew+Q8z+8TB6p2nwRQuUipl+p0OI2DfxXFw7qIvjJqIOYyedhz4VL8x/utoDOI
	R1mnSDLOVumi98LBbFjz2G/baW+zU/AsdprNCVKRg3Ty3D3jUcGQf9sG9+yDt0iefyKWdfkpkuq
	baB+aSzCR57W8LOMUHqtOgxtTiNjjNOuKNIQV08z6mQ+XAWSfeerDyozY6RA6NrF1qfYmG84xnK
	CIWq+BWcQOUz9q6CCyhBpVRdZj+DuTF5+PwBtSdTr+0ArY7jVKAY3ocF2YXpEg5GM/DkPXNVQTI
	/wHjc7SNfOxGozitJpYBuUhkqpPBPc1aL9wIoQi4YwTME0lsZ/LvNzL6CfDJ+W7Vgq+3U9231O0
	m1X/U7zpdw9dP3aucXM7FeoSSs2OUvWDKTAo+7H6idlTfFQbtmAUsgYmYuzOOXN0hkmwkRGQt/Y
	IpI1beuck/TGNmso3Hpfh4RTKfy975nWnXASzlWDJVl2e9BhuGZtdqB8aEYy5dK8eM6vr+UFTsH
	4BrqgGyagpl51qUo=
X-Received: by 2002:a05:701b:451c:20b0:18b:755:ae06 with SMTP id a92af1059eb24-1ac5c555461mr11685834c88.37.1793570631444;
        Sun, 01 Nov 2026 14:03:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:50 -0800 (PST)
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
Subject: [PATCH v3 08/15] libfdt: overlay: Factor out fixup and fragment path parsing helpers
Date: Sun,  1 Nov 2026 14:01:15 -0800
Message-ID: <20261101220224.1436242-9-dianders@chromium.org>
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

In preparation for updating the base device tree's `/__local_fixups__`
node during `fdt_overlay_apply()`, factor out two helper functions in
`libfdt/fdt_overlay.c`:

- Factor out `overlay_parse_fixup_entry()` from
  `overlay_fixup_phandle()` to parse `"path:name:offset"` entries in
  `/__fixups__` properties.
- Factor out `overlay_split_fragment_path()` from
  `overlay_symbol_update()` to validate and split
  `"/<fragment>/__overlay__[/<rel>]"` paths into the fragment name and
  relative subnode path.

This commit is pure code movement with no functional change.

Reviewed-by: Simon Glass <sjg@chromium.org>
Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Document in overlay_parse_fixup_entry()'s comment that @valuep and
  @lenp are advanced past the consumed entry (David Gibson)
- Return 1 (under __overlay__), 0 (not under __overlay__), or
  -FDT_ERR_BADVALUE from overlay_split_fragment_path() instead of taking
  a bool *is_overlayp out-parameter (David Gibson)

Changes in v2:
- New patch factoring out overlay_parse_fixup_entry() and
  overlay_split_fragment_path() helpers in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 230 ++++++++++++++++++++++++++++---------------
 1 file changed, 153 insertions(+), 77 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 8d96428af04f..978c9c23bd56 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -361,6 +361,81 @@ static int overlay_fixup_one_phandle(void *fdto, int symbols_off,
 	return ret;
 }
 
+/**
+ * overlay_parse_fixup_entry - Parse one "path:name:offset" entry from /__fixups__
+ * @valuep: In/out pointer to the current NUL-terminated fixup string;
+ *          advanced past the terminating NUL byte to the next entry
+ * @lenp: In/out remaining length of the /__fixups__ property value;
+ *        decremented by the consumed entry length (including its NUL byte)
+ * @pathp: Output pointer to the target node path
+ * @path_lenp: Output length of @pathp in bytes
+ * @namep: Output pointer to the target property name
+ * @name_lenp: Output length of @namep in bytes
+ * @poffsetp: Output byte offset within the target property
+ *
+ * returns:
+ *      0 on success
+ *      -FDT_ERR_BADOVERLAY if the fixup entry is malformed
+ */
+static int overlay_parse_fixup_entry(const char **valuep, int *lenp,
+				     const char **pathp, uint32_t *path_lenp,
+				     const char **namep, uint32_t *name_lenp,
+				     uint32_t *poffsetp)
+{
+	const char *path, *name, *fixup_end;
+	const char *fixup_str = *valuep;
+	uint32_t path_len, name_len;
+	uint32_t fixup_len;
+	const char *sep;
+	char *endptr;
+	unsigned long poffset;
+
+	fixup_end = memchr(*valuep, '\0', *lenp);
+	if (!fixup_end)
+		return -FDT_ERR_BADOVERLAY;
+	fixup_len = fixup_end - fixup_str;
+
+	*lenp -= fixup_len + 1;
+	*valuep += fixup_len + 1;
+
+	path = fixup_str;
+	sep = memchr(fixup_str, ':', fixup_len);
+	if (!sep)
+		return -FDT_ERR_BADOVERLAY;
+
+	path_len = sep - path;
+	if (path_len == (fixup_len - 1))
+		return -FDT_ERR_BADOVERLAY;
+
+	fixup_len -= path_len + 1;
+	name = sep + 1;
+	sep = memchr(name, ':', fixup_len);
+	if (!sep)
+		return -FDT_ERR_BADOVERLAY;
+
+	name_len = sep - name;
+	if (!name_len)
+		return -FDT_ERR_BADOVERLAY;
+
+	/*
+	 * Require an initial ASCII digit because strtoul() accepts leading
+	 * whitespace and '+'/'-' signs (wrapping negative values to unsigned
+	 * long).
+	 */
+	if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
+		return -FDT_ERR_BADOVERLAY;
+	poffset = strtoul(sep + 1, &endptr, 10);
+	if ((*endptr != '\0') || (poffset > UINT32_MAX))
+		return -FDT_ERR_BADOVERLAY;
+
+	*pathp = path;
+	*path_lenp = path_len;
+	*namep = name;
+	*name_lenp = name_len;
+	*poffsetp = poffset;
+	return 0;
+}
+
 /**
  * overlay_fixup_phandle - Set an overlay phandle to the base one
  * @fdt: Base Device Tree blob
@@ -413,52 +488,14 @@ static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off,
 		return -FDT_ERR_NOTFOUND;
 
 	do {
-		const char *path, *name, *fixup_end;
-		const char *fixup_str = value;
-		uint32_t path_len, name_len;
-		uint32_t fixup_len;
-		const char *sep;
-		char *endptr;
-		unsigned long poffset;
+		const char *path, *name;
+		uint32_t path_len, name_len, poffset;
 		int ret;
 
-		fixup_end = memchr(value, '\0', len);
-		if (!fixup_end)
-			return -FDT_ERR_BADOVERLAY;
-		fixup_len = fixup_end - fixup_str;
-
-		len -= fixup_len + 1;
-		value += fixup_len + 1;
-
-		path = fixup_str;
-		sep = memchr(fixup_str, ':', fixup_len);
-		if (!sep)
-			return -FDT_ERR_BADOVERLAY;
-
-		path_len = sep - path;
-		if (path_len == (fixup_len - 1))
-			return -FDT_ERR_BADOVERLAY;
-
-		fixup_len -= path_len + 1;
-		name = sep + 1;
-		sep = memchr(name, ':', fixup_len);
-		if (!sep)
-			return -FDT_ERR_BADOVERLAY;
-
-		name_len = sep - name;
-		if (!name_len)
-			return -FDT_ERR_BADOVERLAY;
-
-		/*
-		 * Require an initial ASCII digit because strtoul() accepts
-		 * leading whitespace and '+'/'-' signs (wrapping negative
-		 * values to unsigned long).
-		 */
-		if ((*(sep + 1) < '0') || (*(sep + 1) > '9'))
-			return -FDT_ERR_BADOVERLAY;
-		poffset = strtoul(sep + 1, &endptr, 10);
-		if ((*endptr != '\0') || (poffset > UINT32_MAX))
-			return -FDT_ERR_BADOVERLAY;
+		ret = overlay_parse_fixup_entry(&value, &len, &path, &path_len,
+						&name, &name_len, &poffset);
+		if (ret)
+			return ret;
 
 		ret = overlay_fixup_one_phandle(fdto, symbols_off,
 						path, path_len, name, name_len,
@@ -905,6 +942,72 @@ static int get_path_len(const void *fdt, int nodeoffset)
 	return len;
 }
 
+/**
+ * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
+ * @path: NUL-terminated input path string
+ * @path_len: Length of @path in bytes (including terminating NUL)
+ * @frag_namep: Output pointer to the fragment name
+ * @frag_name_lenp: Output length of @frag_namep in bytes
+ * @rel_pathp: Output pointer to the relative subnode path after __overlay__
+ * @rel_path_lenp: Output length of @rel_pathp in bytes
+ *
+ * returns:
+ *      1 if @path is under an __overlay__ subnode
+ *      0 if @path is a valid path not under an __overlay__ subnode
+ *      -FDT_ERR_BADVALUE if @path is malformed
+ */
+static int overlay_split_fragment_path(const char *path, int path_len,
+				       const char **frag_namep,
+				       int *frag_name_lenp,
+				       const char **rel_pathp,
+				       int *rel_path_lenp)
+{
+	int len, frag_name_len, rel_path_len;
+	const char *s, *e;
+	const char *frag_name;
+	const char *rel_path;
+
+	/* keep end marker to avoid strlen() */
+	e = path + path_len;
+
+	if (*path != '/')
+		return -FDT_ERR_BADVALUE;
+
+	/* get fragment name first */
+	s = strchr(path + 1, '/');
+	if (!s) {
+		/* Symbol refers to something that won't end
+		 * up in the target tree */
+		return 0;
+	}
+
+	frag_name = path + 1;
+	frag_name_len = s - path - 1;
+
+	/* verify format; safe since "s" lies in \0 terminated prop */
+	len = sizeof("/__overlay__/") - 1;
+	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
+		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
+		rel_path = s + len;
+		rel_path_len = e - rel_path - 1;
+	} else if ((e - s) == len
+		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
+		/* /<fragment-name>/__overlay__ */
+		rel_path = "";
+		rel_path_len = 0;
+	} else {
+		/* Symbol refers to something that won't end
+		 * up in the target tree */
+		return 0;
+	}
+
+	*frag_namep = frag_name;
+	*frag_name_lenp = frag_name_len;
+	*rel_pathp = rel_path;
+	*rel_path_lenp = rel_path_len;
+	return 1;
+}
+
 /**
  * overlay_symbol_update - Update the symbols of base tree after a merge
  * @fdt: Base Device Tree blob
@@ -925,7 +1028,6 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 {
 	int root_sym, ov_sym, prop, path_len, fragment, target;
 	int len, frag_name_len, ret, rel_path_len;
-	const char *s, *e;
 	const char *path;
 	const char *name;
 	const char *frag_name;
@@ -960,39 +1062,13 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
 			return -FDT_ERR_BADVALUE;
 
-		/* keep end marker to avoid strlen() */
-		e = path + path_len;
-
-		if (*path != '/')
-			return -FDT_ERR_BADVALUE;
-
-		/* get fragment name first */
-		s = strchr(path + 1, '/');
-		if (!s) {
-			/* Symbol refers to something that won't end
-			 * up in the target tree */
-			continue;
-		}
-
-		frag_name = path + 1;
-		frag_name_len = s - path - 1;
-
-		/* verify format; safe since "s" lies in \0 terminated prop */
-		len = sizeof("/__overlay__/") - 1;
-		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
-			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
-			rel_path = s + len;
-			rel_path_len = e - rel_path - 1;
-		} else if ((e - s) == len
-			   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
-			/* /<fragment-name>/__overlay__ */
-			rel_path = "";
-			rel_path_len = 0;
-		} else {
-			/* Symbol refers to something that won't end
-			 * up in the target tree */
+		ret = overlay_split_fragment_path(path, path_len,
+						  &frag_name, &frag_name_len,
+						  &rel_path, &rel_path_len);
+		if (ret < 0)
+			return ret;
+		if (!ret)
 			continue;
-		}
 
 		/* find the fragment index in which the symbol lies */
 		ret = fdt_subnode_offset_namelen(fdto, 0, frag_name,
-- 
2.56.0.317.g454f8302e1-goog

