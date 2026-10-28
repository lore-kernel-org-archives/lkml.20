Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793224590;
	b=zVMkho+4pEw3KQl3AfAD5LlCT8sSRGl1nOFL70rCnFX1H5lNMyLFBHhf88nENU8BdLev
	 DBWiB/SSYYHEMCZTt1EZpKcYXSWiR4uZOpn7edDp3IIk2ZRaaiZgalQ5+Ppl1ap4UHLew
	 u9zv7RiQ5Z2cQy3pRzIK0z5MOdxD8zFXnHWnsxx3QEGYjcZ2DjmdHqRGUMnfjj15CWWws
	 CbWeBRs1TNX3YgDC9j75MAERv/hrfQp/aegc0gs6X8YlfOmTXG1IST8zLIFteF7YU8t0z
	 sdxyUhRgt6WNtYK9XUiZmpiSeBIH1aOTNZTlJT8Yu1aObgyeQKtwjaWScRPnuqCe58Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793224590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
	b=ZGOug6nCtyClrUHmhsKSg7FvXNdli+nnGdTlXsprfR9aBbL5tu+tO7KzjOULYkuD5ua8
	 N2/wP52v1bS8e/i+cVqW27VA2ewrayDMkaAnoBoZfHz/Aioi/3E/UZggME9CJcu0ynpa7
	 UIHQItI8zNTh7HXL4EngjYF6+0Fjxa0Ppv02aOWilEk493yC07g0MasDESl1sNq4W24Ko
	 LLkydkh4qldhjy4BHXDfUZtsBs4yywfEr+lRUfmvnB1e69XAUinuZMzOXRjHVVs9X8kr+
	 pQ3B823OYXAy8dw9KmvNjO1gfznPfv81jqz+1/N1Tfet1Yf352MzF9dIWi5/anHtEXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnLT18oH;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503D1606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 21:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 503D1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=PnLT18oH
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so2139025eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 14:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793224589; x=1793829389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
        b=PnLT18oHCXAMfz3A6UxJ7+6+7m4vVBG6m1yn3t9WOYzXb6GHmVOe8Pgz6xzkh7aT1E
         wcqDZjHqJBN4M/+f7MTso6YoWzpfSjAGNm40BRQU0ASkPH1Vf582AmC8ItEPS02eE6pq
         AvZg9tyonmALfffiWK90CkcnUfrzKuaNLfxPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793224589; x=1793829389;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MM0KvfFyAbh8VWSliCEimGsM/uJay/dgVTHB3JwFRmU=;
        b=q4ohNrAzyzSstMvqxym9jqQP6RUxbaQFH0w8AYr5ISWDtDYnGd9+lj9XLCmji8tvBE
         hQ2/SYitgbk2PUT8bRbKrel+o8j8Yl0xa0+EFt7VbKBwb9o37jmmWOgKkwhpsIvTEAWR
         oOZP8I5g8/3B3RYfjVipLX3iyqQmpBZAT+jHZcu5ZsTiKJJPcc0GXt9DuMIyVjNE+Rqz
         tx2yXWNj5/BxjcokVEU22m6LTyolP2SHWJOqwy+O56JVGk8xJYH/f2beeQ6kr9l3ZR6X
         B8uYqeR1AX9jtx/JPjrWPN0iOuVSr6kMeHUdvGbd4hkPAKE4jhffV3sUCeFpE6gID9W8
         tJVg==
X-Forwarded-Encrypted: i=1; AKwUvBz/PUm0aQcqofQvXaLiZDG9Dn9o/tBh11JskRAPZSC9E7N2ZVmSr5nIPSDJuLxHO4z+4r2J0JlPc4VijAA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLza+frDHf5iP/XEwVQ4EMBb9iyi7No3/hycfWY7Oil2Q47llN+
	mgAzhrtmGx0McDY/SCOeuOA4FV3xW2nUg0S3PvuA3G4VpBbdHtk0jGf2/F3iGuYFGQ==
X-Gm-Gg: AYBFou3z0uoTq3XlrHubmhhDzwIItUiB5w/Qs+7I86XNCx492HmsZXq0U4dBp0qqGEx
	dxd5W9Tu8k/GEl5rwIzZvnhgOQu+jB7p1IWOtAk/aCwEt4tIW2rxsCgajI5E2/djvF8CK+48wbr
	8YnqXNxYH7z1ggwoTq0MD2rpdm3DzM740slBsifkXNEMMjZFx2IlBBnpkAKE/l3gVw+St9QjiFl
	Ybc/EgUHKk9nG59nw9p0SnsIkwyvTpHamcoaMtzVyr2P/BcpHHrxSmXvnSNlwMJ/PEnAqnXpxtr
	iB9aj3o47XOz+ITeHuNY0GCGn6rP/PwozFJS3y+e8+lchjn41uOdDpgBbbli/e49Zvg0Z3bpLPR
	8hb98vgE2+MoYH1INrBQErcU9BCR+9m32MQujGWSxBvux/Fr18CYG5iPnvQLmdUafI21I9L/UQ1
	lLxSf8zS+8o18VQzUNo8lVGEhlE2CFl2pbmyvankopE7jUCShiYTjMEd3XLdACz9nJoClkQIzlh
	0hQ6T9Z1X2HcyQAFudA7L6Kt3RxXJ3iFdulgsDDdRX2PyHswGxc+lzIjRCXg2WTEbLQ8fWv4BLb
	crvI2FaOTnXwQ1Ybj8LIXlxFGxLCOZDPMJBoKL/yRFqhnye698KSdzQTeFAYvQkjSENlYcZv5rF
	ybo5adiemUZrL
X-Received: by 2002:a05:7301:1708:b0:369:987f:d15e with SMTP id 5a478bee46e88-36a202871c0mr4715544eec.2.1793224589274;
        Wed, 28 Oct 2026 14:56:29 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:19e7:c87:2527:4e12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2393cc86sm8845224eec.19.2026.10.28.14.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 14:56:28 -0700 (PDT)
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
Subject: [PATCH v2 01/10] pylibfdt: Fix FdtSw.as_fdt() when buffer is nearly full
Date: Wed, 28 Oct 2026 14:46:50 -0700
Message-ID: <20261028215600.1713475-2-dianders@chromium.org>
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

`FdtSw.as_fdt()` calls `fdt_finish()` on a copy of `self._fdt` without
using `self.check_space()`. Because `fdt_finish()` appends the 4-byte
`FDT_END` token, `as_fdt()` raises `FdtException(FDT_ERR_NOSPACE)` if
fewer than 4 bytes of free space remain in `self._fdt` after the final
`end_node()`.

Wrap `fdt_finish()` in a `while self.check_space(fdt_finish(fdtsw)):`
loop so `FdtSw.as_fdt()` automatically resizes the buffer when needed,
matching the rest of `FdtSw`'s methods.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New patch fixing FdtSw.as_fdt() buffer resize when < 4 bytes remain

 pylibfdt/libfdt.i       | 3 ++-
 tests/pylibfdt_tests.py | 8 ++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index b41c03f4932a..46f28f67290d 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -959,7 +959,8 @@ class FdtSw(FdtRo):
             Fdt object allowing access to the newly created device tree
         """
         fdtsw = bytearray(self._fdt)
-        check_err(fdt_finish(fdtsw))
+        while self.check_space(fdt_finish(fdtsw)):
+            fdtsw = bytearray(self._fdt)
         return Fdt(fdtsw)
 
     def check_space(self, val):
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 0e1660753477..1b65961491bf 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -646,6 +646,14 @@ class PyLibfdtSwTests(unittest.TestCase):
         # Make sure we did at least two resizes
         self.assertTrue(len(fdt.as_bytearray()) > FdtSw.INC_SIZE * 2)
 
+        # Check that as_fdt() resizes when fewer than 4 bytes remain for FDT_END
+        sw_exact = FdtSw(76)
+        sw_exact.finish_reservemap()
+        sw_exact.begin_node('')
+        sw_exact.end_node()
+        fdt_exact = sw_exact.as_fdt()
+        self.assertEqual(80, fdt_exact.totalsize())
+
 
 class PyLibfdtRoTests(unittest.TestCase):
     """Test class for read-only pylibfdt access functions
-- 
2.56.0.313.g2479322e68-goog

