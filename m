Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570635;
	b=fxzzjxAUFKKwEMdjbY6ZFM5UGHH5vV0RnWzczT/tytKM+x26UyzFf9m+TtlKm2/qCx+G
	 PtQXoproGPCtakoFUIvAVXCl9UIYCZa1GXRZxsH+KHGxT/pc8bbl58f9Jo1v+8eikcs7j
	 M5UNWysT0BNvX3K2ClY5GwZHGr1rMOga1BpasTsxTmUGoaZwRLUrDeYqWIpkv0p4tW/+k
	 6Ob97tJBGg9m79sf66hVVbn9s/w4xTGMjmgYriXIL/zSz1Jp0zI5redH80ZN/jVMGBdIr
	 Nqk8Fbm/RCZaAexy8cDpyGmd3f1yGtU2ZigxLALyGdkqJchqgv1HyXFo0SCEK4J+SwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
	b=3uG3Hi/alEQ36gjwNHqExTceWEkUte7t2K9+Oc6jRAvxYZJweBy72eGxRJos4egUgXEG
	 9pnt1MrOUpFiYimykFeeJqzaNLNCJRqznvZf5e5H+8WJlFM3JqxUmHpmCW0xseVsheCpe
	 B7VyW7qN2GGBuwK5b062724w84X3iT6R6dNTUVslFILp9QBCM/MiQy7g25bPVLaW+rg2l
	 KjE1EC3bhG4fJGaAlNwXfhpO0eZ2Y4tEckO2awE7SyDPKq07fprVlFo1pSomc91kSQ1X4
	 HkEbUhjvIxPDZkgBCiEPj09MpEC/eLZnEKe3dIIQJWyZynwCr+w/l9a0nfZIKU6TAkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NDbRPLIW;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5589B606A339
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5589B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=NDbRPLIW
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1931ff67a29so3965212c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570633; x=1794175433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
        b=NDbRPLIWhu00ercRXlZ71a+tzkP7hVAIAQUnLdJNmeFgQEpqbfzDjL28+khq0RpBmN
         /i78gByfpNvPgN24KJ4BAJX+XlMx+Apoo/KlqJCwzJiTbxCl1HnrWJo9svW7KofJjTX8
         J1VS0XADlvhrFz7SioNX+Mm/BbRrRGY9zVEig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570633; x=1794175433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FTgirQjK8v+h6bBIdw7yINH0jFX7wTeSxRtCfIzO3b0=;
        b=p/UgKSyd3cfOLYTb9li9WDnKG9yDCp4IRL8d38VVzTDmX6U1XrBzNqs4f0QBcwSVU2
         RRbKn9IkfH/OP5NnxQ9uHUWsMrtZKsu8CNu6qSGxX1U74Dc+YpjYxTQOmRMv4SHFCDRf
         kAghav4J0eL8/YPK4un2NE8FDnvEWOLHPwV9EVKevHyM8KDj6x010eaFpOnBKgYAelRC
         3WROSw31nzkvWsDh7M8nblqNGb9H5s3oQGY5mvYHTGAPHAvF15EDFcxlauClYtgG9x37
         NhrihaNlp7ZX+abI/Hm/LAITNnT+evF8x0J+WYEgugkxp4+KdxKwwbJiRj0J8SgUQ0c7
         Rkew==
X-Forwarded-Encrypted: i=1; AKwUvBylieaglq/WSpH/x4Ee6ZoBFtBnMr6TGD/9zIEJhJOakadB9AZw93s07klztgBr8uIIzC3YXvTV8AFZ/PM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLa9kqjYjo7Cejos29PVSA8VKYZUDgg3HogrOUjo8uqe7g2egtz
	nblYW8rvKRpoTR2+rz3sqKr5ThJHpjZVT+YK77wMPqiid+3ZzhCSK1CbuvBnlQn9bg==
X-Gm-Gg: AYBFou345CrD3G0kZG31GFztNvk8GHWnpJx559bnkuQVoJX32Bx8DrJCQlHh9AxtTkU
	5Q4pkLo15D7AlBUEW38lc1CHqxbquDHRHqNJc3kwNBmfrIwN/O1bDuRcL2iLgq1nXKade8s4zT3
	PSL+QbwxDqQX1FpIMf1uao4ukHMYIpQx0hcXEdVJKtxpMPhsRP0FPLU+54xW09EszVgGgTLACUT
	O6ioOrkrcW9Ar79lm7BcA6H5QmC7mh+5vZ5PVYoXY6ddKkpvV4S0F3qrzspcYWN7vLKcDzGdphB
	biZ5XbUriWx+HFoqrmnkyvqlNtZ+bfrowzy1OrWhkKVMTLGxEZU/gfcCOz/K6qVbGzfKjYDLbuE
	CW+tOI90f2de3rBUSE5RKXMI50SOQ7TbZJKbUHyklsWt2WtIMxAxsSlpSDVNrK/Jtc0PS3UL7yD
	d+YhR43LmybWcn9RwUJei/FANjXRLzoG+sUVrapDQJvE/fGacqwwrhrf7XMkAKQ0wqKwVKeRX9K
	muCr7LesZyTvIpE+i3l8kc/B4pocGLUeVGzJFHE39mjZz/Lh3x39hiVoYC1PrRV24p6HVdwsuvy
	jb09i+bKzsOV24woQ+abWEpEHd3P5fQ3kpbZjf7R5Ru0w5NEeJS/5yJRKmfA08mxOSEqnFICjhk
	n79ef/Oo81cwQzEk=
X-Received: by 2002:a05:7022:3a06:b0:1a5:1c15:9ea3 with SMTP id a92af1059eb24-1ac5ac4b77amr13607573c88.17.1793570633519;
        Sun, 01 Nov 2026 14:03:53 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:52 -0800 (PST)
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
Subject: [PATCH v3 09/15] libfdt: overlay: Prepare fragment path helper for reuse
Date: Sun,  1 Nov 2026 14:01:16 -0800
Message-ID: <20261101220224.1436242-10-dianders@chromium.org>
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

Generalize `overlay_split_fragment_path()` in `libfdt/fdt_overlay.c` to
accept a length-bounded `path` slice that is not necessarily
NUL-terminated (using `memchr()` instead of `strchr()`, moving the
NUL-terminated property check back into `overlay_symbol_update()`, and
rejecting a trailing `'/'` after `"/__overlay__/"`) so it can also split
`:`-delimited paths from `/__fixups__` when updating
`/__local_fixups__`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Move the fixup offset overflow fix into its own standalone patch at
  the start of the series (Simon Glass)
- Move the removal of the redundant *sep != ':' checks into its own
  standalone patch
- Reject paths ending with a trailing slash ("/<frag>/__overlay__/") in
  overlay_split_fragment_path() (David Gibson)

Changes in v2:
- New patch generalizing overlay_split_fragment_path() for
  non-NUL-terminated paths in libfdt/fdt_overlay.c

 libfdt/fdt_overlay.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/libfdt/fdt_overlay.c b/libfdt/fdt_overlay.c
index 978c9c23bd56..36f2377cf7d8 100644
--- a/libfdt/fdt_overlay.c
+++ b/libfdt/fdt_overlay.c
@@ -944,8 +944,8 @@ static int get_path_len(const void *fdt, int nodeoffset)
 
 /**
  * overlay_split_fragment_path - Split "/<frag>/__overlay__[/<rel>]" into parts
- * @path: NUL-terminated input path string
- * @path_len: Length of @path in bytes (including terminating NUL)
+ * @path: Input path string (need not be NUL-terminated)
+ * @path_len: Length of @path in bytes (excluding any terminator)
  * @frag_namep: Output pointer to the fragment name
  * @frag_name_lenp: Output length of @frag_namep in bytes
  * @rel_pathp: Output pointer to the relative subnode path after __overlay__
@@ -970,11 +970,11 @@ static int overlay_split_fragment_path(const char *path, int path_len,
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
@@ -984,13 +984,16 @@ static int overlay_split_fragment_path(const char *path, int path_len,
 	frag_name = path + 1;
 	frag_name_len = s - path - 1;
 
-	/* verify format; safe since "s" lies in \0 terminated prop */
+	/* verify format */
 	len = sizeof("/__overlay__/") - 1;
 	if ((e - s) > len && (memcmp(s, "/__overlay__/", len) == 0)) {
 		/* /<fragment-name>/__overlay__/<relative-subnode-path> */
 		rel_path = s + len;
-		rel_path_len = e - rel_path - 1;
-	} else if ((e - s) == len
+		rel_path_len = e - rel_path;
+	} else if ((e - s) == len && (memcmp(s, "/__overlay__/", len) == 0)) {
+		/* Trailing slash after /__overlay__/ is invalid */
+		return -FDT_ERR_BADVALUE;
+	} else if ((e - s) == (len - 1)
 		   && (memcmp(s, "/__overlay__", len - 1) == 0)) {
 		/* /<fragment-name>/__overlay__ */
 		rel_path = "";
@@ -1062,7 +1065,7 @@ static int overlay_symbol_update(void *fdt, void *fdto)
 		if (path_len < 1 || memchr(path, '\0', path_len) != &path[path_len - 1])
 			return -FDT_ERR_BADVALUE;
 
-		ret = overlay_split_fragment_path(path, path_len,
+		ret = overlay_split_fragment_path(path, path_len - 1,
 						  &frag_name, &frag_name_len,
 						  &rel_path, &rel_path_len);
 		if (ret < 0)
-- 
2.56.0.317.g454f8302e1-goog

