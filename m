Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862421;
	b=LLFYQWd8iAYPXbgSPhmzQ6cIMhAJ0dTHblVzWqD+Ili2hx9tHZnF/tNScH2enzzlLBvT
	 GbHDVBHxYbIrYzVdKj+P7n213mMfYx51wi+bnANnguYAhWFUe0QCDTluf1sTQQq2UfWGX
	 hNKbOMf8l/s0tWQm1UGByEL1iTktyN92uRvvokuffUEX+kmAe5qT+aQxh+JIKpkvvY1w5
	 nRkIDoc0ikOORPRWZHmDfQT8Z1MNpGBeWNPQTyg9n8F/TeE90YPyo4GANX6hIrsDWLG+D
	 KUlCg26ruzNlguWrUjz1Rg8Z1TPLqOfyvMCBFvecUte+daW83NyJ+rZ96rZKfE5cLgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
	b=IGWW5U1BD4GtaCFT4LOZZk1eazKiTrZ43WMpZGiiHF0Rkkzaee9CBwZtN4336H0whFK3
	 WOCps29yTCLypV6wh0MCYdvzSvhJCs832eUgTxD84uPzpu+CkX5yHee8YRklcYMDQsBpM
	 4RxOT8QieSx5CRU5OT6VduAyr/8KoL67KfpWcH877/+0bKJvjQzhtVf91gjK96hW8BsPI
	 Cj80JmlUr69yW1vUNi4EiJg0i3E8G73qwl0VogSv8jIQjEZOqYLk0+mikFE7wA1Iz2j7g
	 I6uIZq9BfVi1OtVeSDs1+FnEt5NPD0aYibUi6GTgxdj57EkZIaIEtBD0RuT3cyRWeUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=guJzdrk7;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3E2606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 20:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3E2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=guJzdrk7
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37198ed3727so299298eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862420; x=1795467220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
        b=guJzdrk7VmvoXy4eRvWyqWXKP6t5/9dN94YSAHbzWYcmW+bS1TUFisS4TWEUTJw2Uf
         8vi81Cupj7meIi04/HsZgrorewGhpJ90tRztofu3vFKrg2iAUXr4SEasGJMvyZyzrtqO
         fXRn76HH2M+gcq2QT9Ht7q5p49QmMm9g8eUaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862420; x=1795467220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvVNvu1S6dbncJSuthsRoeoeI4Q+KNIALnJGA2kItSE=;
        b=u4bjMdn69M/r84bgPVMmVzsksokK1kM0eJ+mZZ/2iz6gVJK3q+7nzQ+XMuRk3zKvMu
         CFhHTiV6RWuqWr29Q+l98nawsYmXpVbE91lk+8JJ1MruQ5F5ZP/hzMaAfYcmlyBpJBa4
         vsXI7sEGXKJNGJkAIUU1zN8A5v8ddc2inPxGbUZm5IWBVbR8vCpOKjZNTjnCNe5RdcVZ
         uO4NSXkyuZzO/wrKHkUol5teIC2K8GwBPF883wm6eZNd1IW5TnhdZns/VThKwsVbcmPl
         su+SOR6X/24rEkbvEOGn/ShfmrUCIKpqEIhaBgJS6dxszMGpJeROajUfBk6zM6Gn+w0X
         rE4Q==
X-Forwarded-Encrypted: i=1; AL+hErGT771txFOYusYk5v+1ATkneK1fuP/QoOh5Q9nXr54o10gtu1rs5j1+pCUf+w9hZ6ZuGGfdI6Mk06Q+2Do=@vger.kernel.org
X-Gm-Message-State: APuU4Z824cb39TO0gUgb5EB40qb6nL7SHNA2VMGJvDOkWOb1HYr9O0ng
	Max3ioPq1/SCI6AteVWRlUQxiFSee4e2WSe2O0jyNgYQOjWIGIruvyVqfcBWEHfGxw==
X-Gm-Gg: AZFdTZepHtLVSnLSwu8VjNXZ5kqD+ggxqhi2Es07C5ykwfg/OvV52dsV5OHW+5a5Qc9
	6k7ztEebeKodnKh67uQCySxLoTkaYa0ON81p9dEJ0zTv8N1oKH+QzV49P2XJb1fVqXJD2mLoVgU
	6RWVqmvlq+ScH9trdHTEPbN99izjKaFy6wOvQeyUPDoBxavyYdc2qR7LrB86U9AcAeICSZAsLpw
	EeOWwvhPYqModlYlb34pbN521SFdXLIGfN3cgT/pRAJucByyBx4+wjCluOQUm3QTNXkLy7znLdC
	3CadeI4sY1BrW2KKGEt3/uiCvUuHbgzpazBw1QO2bOYnU1pgGrItDy4iK8TO6IbUoEbHqI1dJ3Y
	iMmLcXyCydl1ctrjCZgveAg/YIzm15zkjWBWT0hDTCAOq5qXbA0oMo3jgvStjTHUMoIHbrSsi+C
	EmbtJb7JX8hb1EO+jYhkM//U02ijKowzh9g35S7EHgc769fOBXXt8DfnSWN/yP/uVVipl1OHYzm
	dfhzAaiuG2mZEFWcbKKdmPBNwc681otyxkfVlazwSiVDDYYyI9iUmtMELVOLXtrhnUoYPXzRxiC
	+zTLwC1M0Z0ppW8r/5Gwd2fda8hDtL/+1JQoGOjT4AH7aSkoK8iNUkqccFH5rcJcRE6N/6wNSOC
	RzQvsWiHIshQAzw==
X-Received: by 2002:a05:7300:1895:b0:358:c5c9:2661 with SMTP id 5a478bee46e88-3810cd4c1bdmr660553eec.10.1794862420309;
        Mon, 16 Nov 2026 12:53:40 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:37 -0800 (PST)
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
Subject: [PATCH v4 03/14] pylibfdt: Trim Fdt bytearray to totalsize() in FdtSw.as_fdt()
Date: Mon, 16 Nov 2026 12:53:00 -0800
Message-ID: <20261116205320.1621386-4-dianders@chromium.org>
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

`fdt_finish()` relocates the string table directly after the structure
block and updates the FDT header `totalsize` to the packed size, but
`FdtSw.as_fdt()` left the backing Python `bytearray` at the
pre-allocated `FdtSw` buffer size (with trailing zero bytes beyond
`totalsize()`), forcing callers that serialize `fdt.as_bytearray()` to
call `fdt.pack()` just to truncate `_fdt`.

Truncate `fdtsw` to `fdt_totalsize(fdtsw)` in `FdtSw.as_fdt()` (matching
`Fdt.pack()`) so the returned `Fdt`'s `as_bytearray()` length matches
its `totalsize()` immediately.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- New patch trimming the returned Fdt bytearray in FdtSw.as_fdt() so
  DeviceTree.flatten() does not need to call fdt.pack() (David Gibson)

 pylibfdt/libfdt.i       | 1 +
 tests/pylibfdt_tests.py | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 8a7dfed85f15..68f22e316ece 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -1026,6 +1026,7 @@ class FdtSw(FdtRo):
         fdtsw = bytearray(self._fdt)
         while self.check_space(fdt_finish(fdtsw)):
             fdtsw = bytearray(self._fdt)
+        del fdtsw[fdt_totalsize(fdtsw):]
         return Fdt(fdtsw)
 
     def check_space(self, val):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 78d8976c0cf3..26915a015ccb 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -684,6 +684,7 @@ class PyLibfdtSwTests(unittest.TestCase):
 
         # Make sure we did at least two resizes
         self.assertTrue(len(fdt.as_bytearray()) > FdtSw.INC_SIZE * 2)
+        self.assertEqual(fdt.totalsize(), len(fdt.as_bytearray()))
 
         # Check that as_fdt() resizes when fewer than 4 bytes remain for FDT_END
         sw_exact = FdtSw(76)
@@ -692,6 +693,7 @@ class PyLibfdtSwTests(unittest.TestCase):
         sw_exact.end_node()
         fdt_exact = sw_exact.as_fdt()
         self.assertEqual(80, fdt_exact.totalsize())
+        self.assertEqual(80, len(fdt_exact.as_bytearray()))
 
 
 class PyLibfdtRoTests(unittest.TestCase):
-- 
2.56.0.679.gc527c65306-goog

