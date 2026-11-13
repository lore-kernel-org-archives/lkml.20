Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604171;
	b=tyu843PBs1U4bNYSySGbRpPVQ+2tL+wWlYy5oo2oUCi94XR17CW9FDOIUagG3u7FiwSJ
	 hCAmsfxPv5l/zGik84/MU7DH2tZIAQp+XxN7HBKqHptniBW42b5/33G5UQLBuhKEzNiOt
	 iNsN5m2DNv9j3OeY06RRTeBreF2P/nO1OEmqM5LusGPnAWpteKuTbZlKUN2sWcMmiDJzE
	 RSlmoxVNp5maSKt/rqy7rwKSbhM2v3jJhp83RDsoOr3MDraUwec1HMuZTU5LXqSOYyMY0
	 96KwQYOmANCifcHSO07Q8xan7q9UlflLMb0Wk58E0/p45wZRRliypPhSzt2xrg4aodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
	b=23YPJGn73D3Yymn8PLbLg2lntCMNJDFZqwRaWHVosXmDHrrSGWe2XY3IB5GQsxV7fXpq
	 7aF1Vo2yd/KUR+Yl0uNfRMuSxvt+tDvbx8+FoYRYTuavwjqVpC8uY99r43PLwaCm8/thQ
	 dUTh4jPUcoMV6ffOLPgbHhymka47K6k4mWpdYe69LxGl7xBDbA3ymRCGx0RpE2s/wdXyZ
	 rZlRBeI6EsxK+lr27KWaLP2OFiXaM09afwKg0rbv6uylLafJ1mM3gLLJ/XggU40ybIXdn
	 hnT9vqNDsC7XJWJ41JBEuD99mMExE8cognFcQKTttOD5l2/7vPtDt6bm5FuhGg8dIww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="byh/3nmq";
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A353A60A260D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 21:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A353A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=byh/3nmq
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-170135e43c7so1745140c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604170; x=1795208970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=byh/3nmqI7QpjTJjL85XL36XrLVmQJX7b416OaueMm9iHjof1uYq2ZFN7Pfll3IAvV
         +X01S5m5HOaYZHlDiDaPuFiRmYKrPA+w+1JW7YhJqoVFFPJEGnEmqMTcrdwrPGVV8Zz4
         i1lGy4B/V1v3WY/ao6ofASJ8TCWkgzDrO6u/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604170; x=1795208970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=ovaiWzf4X0wR+608dYuGLyNFvRSvn6P64K29g1PwvCQyJry8WAZgd8jGa6sGwhRsNa
         lrmkf+eCO9cNe6yZNw3L9Au3Lva97sWIlPC1tvPUQS3A3fX0f1CwchlicFY5+Sj0T7Uk
         cCqwD2GEf9IpwDxAMX65/57uA7KVcVnuzm0OIqNQVJx7itJ1OKSGYYrOtVGGv5OLqczU
         ZaaqFqHx2DrhMZKFCoKHOuousqki5euMP4G2a7RyKLnrg3JJg/u2XaBtmM6ap8tiEX/e
         Gu5i1GeV9rY6Cvzhj9ST6b602T/ZieHBlxfSX1w9ihTv5/Yg33UFGZX1/n5C23HFhGNS
         uAyg==
X-Forwarded-Encrypted: i=1; AL+hErHiGS++fGvWhXaxx2ixzLCJG2QOcL1IlEoCkDBkseunPvMHijQ5dVtGdUGZQA4AjgfF9+mkRZtPmICoyS4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WYlYdhuzzNVIGskT5wEwRKR6+3HNys1AxITV7/2PMzb6aZanL
	9XuxJHtz28deahYZIMry1T/J/Yhv/CJOMkXJjDcrtPOuuBrv0RNVWi1I+UnOiJNz3Q==
X-Gm-Gg: AYBFou02QhAW65/2lm4ow5M+PFkrUWtIwx8eC3ioiq5z7VP/SeUhc90d6HqPu2pxU5P
	m5v1mLieXNq19HEdtNgX3ST5fe44Z8KkvHNzxyFPOWZzD1fbCGIVh6y5By9Aqt0U2idBS1wzbaa
	Sts24RFoHRquRNrjG6p5qLvpNrjCG6ODVkCbTJfGpezyZiYcpM7HN8faLuvepofzFY2zneq7tv5
	MfmKNMrrzXqDeM88QKse3lSbDYm2+6c6jJlS3oCRUhw3oymYRc33xH1pBVMWUwl+IXNtWKv+auJ
	v3wOpUVZlwKonhn/9SVQiY3OnLeg5XrEASVeNZMW82cj4FcPO2Q7FerfwNFI3aYALc+3Pf+M4cC
	GeM3uaZyjnmPKOTK7G+qeZfBcTmYQR0+W5cHqQ2jCmWf0hMfUIfuzHazfXGJSRLK7+wRcqMBl1Y
	C1A8ehRBnQ+6LMkQXweA9FOPNwsbH6w+73taM9AbbEtu8Y4MUbn5gX5BGxcC8IkeIBmw1dKW4zQ
	BSr1pTP1vtvk0kyL6Y0VVDFIKjdQ1/dDb0MSBqZRjY3LQwJ0z0E8XUDRcuG9EA11SNv5gy+5JVr
	Yjg6aBn/zkG6qVExVsiBL+h9llAIP/w6vJyrDnfRPsFy8kWD/pJE6EFP6q8UHOKtO1IV26mkIDe
	OXGaFXwgy2qsq
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr3160476c88.46.1794604169766;
        Fri, 13 Nov 2026 13:09:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/5] kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
Date: Fri, 13 Nov 2026 13:09:10 -0800
Message-ID: <20261113130858.RFC.v2.1.Ic9a4337a7740a76d78fb68d3763d36a35a3231a0@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

`FIT_COMPRESSION` and `FIT_DECOMPOSE_DTBS` can be passed on the `make`
command line when building `image.fit` (see `cmd_fit` in
`scripts/Makefile.lib`), but neither variable was documented in
`Documentation/kbuild/kbuild.rst` or mentioned in
`arch/arm64/Makefile`'s `make help` output.

Document both variables before adding new FIT Kbuild variables.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)

 Documentation/kbuild/kbuild.rst | 12 ++++++++++++
 arch/arm64/Makefile             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e71a692a559a..744a32ccbd1c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -364,3 +364,15 @@ LLVM
 ----
 If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
 of GCC and GNU binutils to build the kernel.
+
+FIT_COMPRESSION
+---------------
+Compression algorithm used when packaging the kernel and device tree blobs
+into ``image.fit`` (for example, ``gzip``, ``lz4``, ``xz``, ``zstd``, or
+``none``). Defaults to ``gzip``.
+
+FIT_DECOMPOSE_DTBS
+------------------
+If set to a non-empty value when building ``image.fit``, decompose composite
+DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
+blobs and deduplicate them in the FIT.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ed28f94be428..8818d6a2015b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,6 +223,7 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
+  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
-- 
2.56.0.611.g1030f0b940-goog

