Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862441;
	b=B6D6uafqYIESaYE39PRbuMLX9XQSlRXUQBVM0J0NZw/Kb9OWM1XI1U+JFmjo2QwltAje
	 hLLsbSuaiYgUu1carKEsodk7DaeKG5rCHergNHBKeNNYVDkRaL4crffbNOniAVg61vYhn
	 qDJETuwRKUZmlZnm4AicP7SWgkyF8SisIdnGWs5s94mr7bAmBlHeNgXF5UrIgMvartNmR
	 VkQApEha7piP/+p0XI//opFy8S1b6WvYgR6+0KYRWhZDV4UPW8E9bGL4tweohg/Ft90Wb
	 Q+GEqRwqSz3kE3xC+BkCIT3b1u2SFdZfrmjZrqiSI/CRwZ8MShOQuB3eZUdXt0qFC/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
	b=VgMJEQ5BYcD8Xzu/PqW5E6ltO/Ui0DkQemb4gB6lgKNXfKXuX7AaG+7H7iXqp1beueC8
	 Ny5PPRpbna1J70dzNBhEoIBn3S8AbTCDa2AV6VtTvHWIEdbFLS16pqIu5dj08/bKYeBbK
	 5fHtoUgQDKwoZmCP03g17dNAmgycICsdm6guIbn8CmeEheV2BhBNjCvSBoWfRHIIx8cMj
	 stQSi8EcCIaNIoOHvAORAgiDkOrMQvFKTgup+38TOvq9Bz9JEsqh/trp5RTw7gDVsnDtw
	 U9MEwmvsjfSC32B/6MXx/zCs7OJwiP/nGsvzm8UeUSrrSCvPTqL5R5xu31+dYoeHpbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="V/WQ14Z5";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575D160A2602
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:54:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 575D160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=V/WQ14Z5
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3791619605cso7363297eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862439; x=1795467239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
        b=V/WQ14Z5JsS299GMVO38nLTCesW0lZD2nRskeGbbhT6RTJz/XsPAzhwpwkvVmvVjSS
         l5OxNg1HaYGVQrA9bJeY4mXPTZVTSZHNUYMyFCxIbkas13W86sKNbEsiA6qzSBiH+vQd
         jBw9vYYYOoUOFDhvmirgTPn/SH21BNtQ3OBVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862439; x=1795467239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rEU3wqeOzNiSYTryYSCT989FnGz9Q5wgICHvgeAsaoQ=;
        b=VprRFYdZ4k/bDmVRBEjkrq6YMF+wRxP3biNFCcXqUjSB4KjH+43pIyYGbdsMrr1qbG
         nRNiHDyqnQziNR4yB8I9FYuLAe/DOeFkS3QvcyK6vo0oKAOdG5Pm/3snVYizM23ChLqx
         3GCdm/W6jA5yfGg6ePOH7jIUX65GTTn0KXzMRg5qRIE1gtVHk/fI6ZJGsChOcXYAvIwW
         eqjkdtcH62JE+HqfRKhAGlX90qsYZanrhAOGGoDGuWFrczztZb/jYmitzp6D6fRjfy9Y
         yKO+tF9HUXkWdoMJZgOka8f/Rc0Hx60JCYEBXb5564neNZ0Yavwq9RfCisdPtkRByt73
         YTLQ==
X-Forwarded-Encrypted: i=1; AL+hErFL22vQ8Q3jhOgZT4f0FANBxb6QayZbZ9BSQO5UoZo1ElFY2fpbmbisQvCOaPetM/qblKK1v0HkqdmCOtc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uhNp9UGkBmt9IhsYyRh0iCelii90p9OcHxPvRcWVcstgVXhIs
	6sfGaFB7R4CFYS7xwe8GfkAbQVmYQ1V/XtIwIOHNAyEoMHolftYQoTgqVn7hwwEPoA==
X-Gm-Gg: AYBFou0oqRtwjMy2YjGOnwewxXZCyT43g+2AVoAQ4LgyzGBPZuMGueBHK/HZOPniqm8
	ykDuADkw9JCO869nQsi74qGzzJANIE83EFh+o79Iki/ZHdRTvncBOcB3mI+UxyVVHeQHzLszswv
	Zaru/D5UAYPIcVwyITyRnOl8aUKZ6AsoWihmYRN+7t0YGR1wOoC/85SAd1jKkIH7U8VX1xITgdW
	/BFpu2d0RV5jF09iJELVLCxid6lkL8je7SqUpzXjWw/SPCLt02wwfPwxC8hlcAtNLt7C6Dpbg+d
	SKoyk+YyWkBz4oXprlzAV2EFqpR9dGc7vDAkvi7ari1D4RdtU6bdsHXm2kbX+m91t5apuLMGfsw
	y5sZZqGK4hzw0C/fjAyW9IZtQHQdvgpb1UloKDPvh5X4aFP1bENnLvfxoE6mHN+ZVAKknrgq/Ml
	UVGlqbjX/wnd85xIsCddMz8cVfYUFr71IwjMTuZEprhZKfTvr/exUOJOxQyT2AVKAdE/eTRnjo3
	ZC2tHaznmZwdC355AJf1cqrezDN/nUaw+QYfE/jYvoYnyPfL9f1PY3xait4QKqWyR+ycFHBYMCX
	HfOHJZVMXLozMUKMdwqNZaZVi52PzCYtXPCLyQVwEdTzDCOM7NaPnDAu8bP3G4pplX/Mu5NujAo
	jqW3IwZleaRkPTw==
X-Received: by 2002:a05:693c:4146:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-379e16d093cmr11060171eec.32.1794862439198;
        Mon, 16 Nov 2026 12:53:59 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:57 -0800 (PST)
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
Subject: [PATCH v4 08/14] libfdt: Speed up fdt_find_string_len_() with memchr()
Date: Mon, 16 Nov 2026 12:53:05 -0800
Message-ID: <20261116205320.1621386-9-dianders@chromium.org>
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

`fdt_find_string_len_()` currently calls `memcmp()` at every byte offset
across the string table (`for (p = strtab; p <= last; p++)`). When
building or modifying trees with large string tables (such as DTBs and
overlays with hundreds of `/__symbols__` or `/__fixups__` labels via
`fdt_sw` or `fdt_rw`), scanning multi-kilobyte string tables byte by
byte dominates serialization time.

Advance `p` between candidate first-byte matches using `memchr()` (with
an explicit `slen == 0` check for empty property names and a `tabsize <
slen + 1` bounds check before computing `last`), preserving identical
suffix-sharing behavior.

On one stress test (running the fdtfactor tool across 438 arm64 Qualcomm
DTBs) this reduced `fdt_property()` time by ~5.6x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up fdt_find_string_len_() with memchr()

 libfdt/fdt.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/libfdt/fdt.c b/libfdt/fdt.c
index d9ccb70345d0..c7cedfba7815 100644
--- a/libfdt/fdt.c
+++ b/libfdt/fdt.c
@@ -348,12 +348,20 @@ int fdt_next_subnode(const void *fdt, int offset)
 const char *fdt_find_string_len_(const char *strtab, int tabsize, const char *s,
 				 int slen)
 {
-	const char *last = strtab + tabsize - (slen + 1);
-	const char *p;
+	const char *last;
+	const char *p = strtab;
 
-	for (p = strtab; p <= last; p++)
+	if (tabsize < slen + 1)
+		return NULL;
+	if (slen == 0)
+		return memchr(strtab, '\0', tabsize);
+
+	last = strtab + tabsize - (slen + 1);
+	while (p <= last && (p = memchr(p, s[0], last - p + 1)) != NULL) {
 		if (memcmp(p, s, slen) == 0 && p[slen] == '\0')
 			return p;
+		p++;
+	}
 	return NULL;
 }
 
-- 
2.56.0.679.gc527c65306-goog

