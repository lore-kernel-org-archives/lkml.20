Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862414;
	b=vs4BQOyz53OTZWcxSP6har0jKDS7UMd1BRXqotot4qUXt285EribCSIfSwz/Jy8bWlhy
	 0gIDhpnkKIK+TqFsK+mcBEH0uXnZJu5iCLbQWuCNyU0Qx7ARIhVU56eI6aUzII4cUS3mi
	 QvdZiLtEhQ1RbJV++GENcJ0DO5lcrLr7LrEO56SETRUmmBGVIDHHVWHVyhn18clLW4xwE
	 JSPioAtXuVA0QWGisL6BPiQHww5b6KSwgTKQ/KJXFjiat/88y4ZRk9EmiuYYwKhyd6WgP
	 h1CB/m2KuUbPj3RBpDIKJBqLU2accme/Z9BBX0U6eBHlfT4yuDpG3ZCMaoLnAmN/Z4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862414;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
	b=vxHsbAuEn0TN5HxzCZ6Q5Bhz5ZmR99FLfBldOj3ywQAq/SM1qnTgPboHAImOwfGirYQB
	 1CDrsYCMAPQKmSpSqFkAYRzBE3pv98SdQ0W0+J7SHFAS3SWv1rfYYbKBFf924j6BN/Meh
	 bLHA6XtQcAB+o6E/95V539HPG/RWrD5lIp2vEZtTZJN1Vtypf6oWqqH6e85ZWy2AU447H
	 H8wNIdc80sYI7p9ineUriskGmrhk8xq//4ndt5ZD2kGxlyUzyHzWjS5beg8ySndLSAoAG
	 4DI7Pu+LynpjQ3gijD4OkvNK3N0wkSNkPSxdWbk/1i5ZJQyGOSBntinnOx54SmuKUXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nCuNFi+1;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04038606A886
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04038606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=nCuNFi+1
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-380b40319bdso1160062eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862413; x=1795467213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
        b=nCuNFi+1jkX3+7y0KieRNcc1ZPYxF5feR9EqTRBbKdFSf8aj4dllCa+xbU8+oB3JTf
         2DCX8D3cIDue6bSHWzfTY8YBOFRrKRjGlISMg5jDVyfQ79vajKoth8mF0cMgjBI0mT21
         XsQv64ST+rxLF4dSXI7XOo7kqWQ0/UecgvABs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862413; x=1795467213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kwurbT6fkm9GVYAy5srXA0bWDXvBD9gCK9tTWZEe7Ok=;
        b=vi/A/mRWsRNcz8JlCtgdgJDvPAU/xTCu60DqxTCvow5YyOmLemaBANfDSAx3jwoKuj
         +Z6YUvDfTA9KR3hjQHI9QbpvJ1SAXJcNnZcmwsfrnujHZTFeheyU7dCQ2zt+Y0et3PL5
         NnEbvYfiUvCdT8FPZHp+2RiLSN99ecdy2ZTcPyIQKuHHNy/umPkAvDxokWUvYE9VAdRY
         ZycbP7BKy1k1BYmiXZVWX4YUUylV1eQ6hqxxPEn88+iEyyTNu1uQwG610FWOAg4IuOUh
         JvesOx0q2+i6GryTNSFqwBEGMXd9aSDVxrYW/tDSTJNMrf8koIP3LwaNCqhmUxa9/bI0
         yY3A==
X-Forwarded-Encrypted: i=1; AL+hErFSuHmPoLjDPUf56dpzV9dB3762BcaW4eptDECPdJCVvfT71wY4dxkW59i8AhrE0dKso3Pa7JmQLXWhwEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Tc3ci9P2+Da5Ih+IWieqkFOsntoPpnfLXBhvONbguCYHZeqHq
	oB7f9q0nVNhoHpP7Lt61eKOlDnT6XCYKF5W7C2v7RqXl1k5wPmVk5qaE2inbEuTqJw==
X-Gm-Gg: AYBFou1u1pwyQZ9ZsLJQjmGJvepPmh4iS8m4mOwRgOVP2UWKYWXkpg3kGE736WBSxlT
	bkyY03/Jw/lElc76eB6/P0z4jpTk+MNPZ2SrUDEQUgsAW0BjiRSQTrTTz0tWYcN7DYaEPZlgGiG
	hQ2gaqJtjYXo4KOKfgAQchGt0AnwyckFZcFSw9CO5KB6d9Sav3+XWGxqscNzX3GmT1zY4FP9Sra
	7TkPqtFI+KKzCwQdHM0jrSkaaFpRRwON/Ru+qRsTgm76J3xBxIdNgxn9UMoGE95OIfVQRqwal10
	Sk/tUsLzspKA635hCXkcZrztUL+twKdJpTxz9Ng7KYhzHx2DS2FsjbUf4kpVddQoIFIbm7Yksfr
	dLsFfI94X52/UwMLLnv50fvGfg3P6LIxpX93VxWkEbdk+PJxBmfIrciNOI2t5IwE7wzQS2GUDn0
	WyFAAQxJMbYBME3bIIwhJoIvpm6dfNGxPIloLyDVRR76PBwDXzOc1u11G0rZW1xb8IBHNgO8IJ1
	xHJ7FqV0SwZk1FddOQmCXDwy6ASRjCZKo5ByrM54iHJ1pdiN6JLPUEUpvcbhXUMBWYybm2uXZQ7
	qJYBo4XNGtTUvNzlJYk/J/lUDQS8sljpsG12wSpZFfnab5UyQk5DL9pwllXcJgQ/eppvLRRXKHe
	Be9dOYqsbeeF+G/jXEM08WWzIxcPBM5MsD9k=
X-Received: by 2002:a05:7300:7481:b0:375:c5e1:931d with SMTP id 5a478bee46e88-37966e3aff8mr16186461eec.25.1794862413017;
        Mon, 16 Nov 2026 12:53:33 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:31 -0800 (PST)
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
Subject: [PATCH v4 01/14] README: Add overview blurbs for dtc and ancillary tools
Date: Mon, 16 Nov 2026 12:52:58 -0800
Message-ID: <20261116205320.1621386-2-dianders@chromium.org>
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

`README.md` currently jumps directly from building `dtc` and `pylibfdt`
to mailing list information without mentioning `dtc` itself or the
ancillary utilities built and installed alongside it.

Add brief overview sections with basic usage examples for `dtc`,
`dtdiff`, `fdtget`, `fdtput`, `fdtdump`, `convert-dtsv0`, and
`fdtoverlay` (along with a pointer to `Documentation/manual.txt` for
full command-line details).

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch adding README.md blurbs for dtc and ancillary tools (David
  Gibson)

 README.md | 89 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/README.md b/README.md
index fcfc2e55d804..9d38c7e79fc6 100644
--- a/README.md
+++ b/README.md
@@ -112,6 +112,95 @@ $ meson setup -Dpython=disabled build
 More work remains to support all of libfdt, including access to numeric
 values.
 
+## dtc
+
+`dtc` compiles device tree source (`.dts`) into flattened device tree
+blobs (`.dtb`), decompiles `.dtb` blobs or `/proc/device-tree`-style
+filesystem trees (`fs`) back to `.dts`, emits YAML (`.yaml`, when built
+with `libyaml`) or assembly (`.S`), and runs semantic checks on the
+tree:
+
+```
+$ dtc -I dts -O dtb -o board.dtb board.dts
+$ dtc -I dtb -O dts -o board.dts board.dtb
+```
+
+See `Documentation/manual.txt` for full command-line reference
+documentation for `dtc` and the C utility tools below.
+
+## dtdiff
+
+`dtdiff` normalizes and sorts two device trees via `dtc -s -O dts` and
+prints a unified diff between them. Each input may be a `.dts` source
+file, a `.dtb` / `.dtbo` blob, or a `/proc/device-tree`-style directory:
+
+```
+$ dtdiff before.dtb after.dtb
+$ dtdiff board.dts /proc/device-tree
+```
+
+## fdtget
+
+`fdtget` reads property values (`<node> <property>` pairs), lists
+property names (`-p`, `--properties`), or lists subnode names (`-l`,
+`--list`) from a `.dtb` blob. Use `-t`, `--type` (e.g. `-ts` for
+strings, `-ti` / `-tu` / `-tx` for signed, unsigned, or hex integers, or
+`-tr` for raw bytes) to control formatting, and `-d`, `--default` to
+provide a fallback when a node or property is missing:
+
+```
+$ fdtget board.dtb / model /cpus/cpu@0 reg
+$ fdtget -tx board.dtb /soc/serial@1000 reg
+$ fdtget -l board.dtb /soc
+```
+
+## fdtput
+
+`fdtput` modifies a `.dtb` blob in place: writing property values,
+creating nodes (`-c`, `--create`), deleting nodes and their subnodes
+(`-r`, `--remove`), or deleting properties (`-d`, `--delete`). Pass
+`-t`, `--type` (e.g. `-ts` for strings or `-tx` for hex integers;
+default is decimal integers) to control value encoding, and `-p`,
+`--auto-path` to create any missing nodes along the target path:
+
+```
+$ fdtput -p -ts board.dtb /soc/i2c@3000 compatible vendor,i2c
+$ fdtput -tx board.dtb /soc/serial@1000 reg 1000 100
+$ fdtput -d board.dtb /soc/i2c@3000 compatible
+```
+
+## fdtdump
+
+`fdtdump` is a low-level debugging tool that dumps the FDT header,
+`/memreserve/` entries, and raw structure-block contents of a `.dtb`
+blob (`-d`, `--debug` prints tag offsets; `-s`, `--scan` scans a larger
+file for an embedded FDT). For general decompilation of a `.dtb` to
+`.dts`, use `dtc -I dtb -O dts` instead:
+
+```
+$ fdtdump -d board.dtb
+```
+
+## convert-dtsv0
+
+`convert-dtsv0` converts obsolete version 0 `.dts` source files to
+`/dts-v1/;` syntax, writing each output to `<filename>v1`:
+
+```
+$ convert-dtsv0 old-board.dts
+```
+
+## fdtoverlay
+
+`fdtoverlay` applies one or more compiled `.dtbo` overlays (`-v`,
+`--verbose` for progress) onto a base `.dtb` blob (`-i`, `--input`,
+compiled with `dtc -@` when overlays reference symbols) and writes the
+merged blob to `-o`, `--output`:
+
+```
+$ fdtoverlay -i base.dtb -o merged.dtb overlay1.dtbo overlay2.dtbo
+```
+
 ## Mailing lists
 
 * The [devicetree-compiler](mailto:devicetree-compiler@vger.kernel.org)
-- 
2.56.0.679.gc527c65306-goog

