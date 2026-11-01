Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570627;
	b=wMo81eo20+ZA3QaIWR1wZVLX8wSq9WuHpCkVMf8+i0EbcZmxmcHnnLYu4sE17fasPlJa
	 JRrmRBMyhfufKU4P+PfiqPlNdOnnrUDM+aFEZncStQ7VJdwYD+l3p/nZ/8BXcPF9WlGmW
	 0oD9HUIVwscwQxX+gdpK0uNPNjDPSFAiwPXMqDuhYeaf/jVRkaXQKAcTJ2SEuL+2VZoHN
	 2eTtChlq91MIMnyFW+egcc1jJSpTw8zLdPLktW0sEKOJvWFWq1l7zI2v9AUXV8kBBHdto
	 Aja1GxfFz9E6cii0gqrVboR+8hbH1UR0AqTr51Ut2rLpTkerLp2yPx84ZS/WX+K18Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570627;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
	b=5BZO9arDPJcf9NsdstA/BuI2RUBobtWrr/WNsz3OHiLSaQdPekTimXnhBWCFTGd/vHOj
	 DzL7jTxzO5Gfcur81WockSpCYYh5QqT4Xe+Kb0k39ySu1N2lT1HrBU+KHRh13Psz6/eag
	 vTOQuYMLd8zqpjmu24itgIWr2LtkWxBao9k35okj7LmopKcUeooQbgCtVkyWwSPKeJF8p
	 0die7/3LJzt9OOYwE89eyod54E4KGiSQrxaTHoN+RLL7TJocT4T0cMw6sUrLlIzgVayX2
	 gYq0WDXkSR0AuQFUgvHJnQzADVuOzd5ON7/FQWhWiY3FBkDS0ggW3apoyH8WCIvXZWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="KWaWKp/g";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0979606A329
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0979606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KWaWKp/g
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3514b90bb89so4857260eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570626; x=1794175426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
        b=KWaWKp/g1f02H64f+Vky1BX7ykbEgRPr6AoXFyf7+kgULvNutsHZdD2SyzChAy/92t
         tN1u2aQaDU6jKxUs2UqvzSqu6opWzNVLiVwNH0jPj+ZEvwG0UwyXJpDJb6R/PRB+lAi3
         n04+y+WoXL6AI4zjFmpYpA+kFySpdqir9VC9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570626; x=1794175426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VkblF9+hoJMz6dpel02wGz0tGUBGpJN2KDMF6wCO9Bs=;
        b=sxrSU4R9kHv4obJsAog9PT0C7TaQ3nwRppCCmWqbOT6PYs98Tev5+DGOvL4pQXbnhA
         gxSQQDfyHTxy15CVLykFsXz3vC4nWivZm2uZEdwUBQlkdgW+uXKxBkJuyQCFuTaRb7sz
         wFq6hxC/lSspFSP/ngBen4RvgxKHWJQZA1kNaaGBw/MoXPtrdjuKR+tGJGEQ56LGYHWa
         QaKR0t2vSqVltQ80bM6paBlsrKaz2ExvaAPHkD4cGawjDIeHG3ahzyC1jYfPYk4wAsqu
         4DuRD3jIPYhGOz3Tbw/MLLb2HnpAsi7t6NCeMdz6TUg1r9OhMr7pr/IMeTNJu0kX3awM
         H+tA==
X-Forwarded-Encrypted: i=1; AKwUvBwGfSCEe6mQENvGvxwfm+ZhrUsqBNdvnoyW0dDRTiX21/lKvKgCzHSrbsoSqps0KewOu5PqG9zytEWci08=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwcuaK+qJQwTUS1V6Af86yoFpShqgEnIpAc8Azi0x/o6IGvn7q
	mmDn46Cklrz032FPWzivrl3NkOXBgoVwK9CImPPS119fJekz2YPa4/NLo0igYdPqcA==
X-Gm-Gg: AYBFou0oTqKgK7X5zlh3XCmBLkjJUY23DIO8ET4pp6hWS8fQm/rttcuf/mEa1GIWzgR
	gAS+izxEkby/QPhWv7ssrUp5Sf6H4kKNw91dWr3mSzMy/GENSlFsSsuKxjeuKeaaT38ixWqK1Hn
	mzoOsCkBUeU2n13lQMH7KTxusy5ZGaAtbmae+EZZt+V5euIwIf1KZm263EhfJ81EBa4rLfqlqQV
	UAqUf+KiYcJoLVbrOj93auBwkn7UDdI0Fgi1gldsNctCro9Z5iMvGDVQ0rDYiRyPIBqYgIn0Zxx
	Ev1bQWt22hbX1/qoxzEi8w7rGui7+vhVX2IazVutuVWPitECrJnU1fuZhjJeN3idSTrp+Zh5uCd
	OiPyVAN9zTmB+QNxXQsr/tntmSCLFdw64WnV73X7yrnP9gyhwDQI2M3UhZrUtM+wM1Tck4seNVd
	C7LE/83JtKqAPakuZz3k0wJyGL3uGlXpou4QrcCZoqUJ8PYQjbLRyLwnDURcAXZw0MhRkrElDNc
	asDbFL+S6TVpAJAGFJdcfYrB3K5aatNAmmP1Nv2FeJeYYEnu3UVY+rYw7cnAPY9Z83/abTpT3xy
	s0QlhtHaU14PvML8H90aG6sB80g9k1ESXcSmqxJTpDBT7do0abbg5tPN+2fF9sknurgAXXEZVS/
	2D6kl5Qbdl7XDD0jNJaEz7BAloeSWcu01DlM=
X-Received: by 2002:a05:7022:3f0a:b0:151:6e80:ba7e with SMTP id a92af1059eb24-1ac56c9ff26mr13705215c88.4.1793570625752;
        Sun, 01 Nov 2026 14:03:45 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:40 -0800 (PST)
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
Subject: [PATCH v3 05/15] pylibfdt: Add Fdt.set_boot_cpuid_phys()
Date: Sun,  1 Nov 2026 14:01:12 -0800
Message-ID: <20261101220224.1436242-6-dianders@chromium.org>
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

`FdtRo` exposes `boot_cpuid_phys()` to read the physical boot CPU ID
from the FDT header, and SWIG already wraps the underlying C function
`fdt_set_boot_cpuid_phys()`, but `class Fdt` lacked a corresponding
`set_boot_cpuid_phys()` method.

Add `Fdt.set_boot_cpuid_phys()` and test it in
`tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- New patch adding Fdt.set_boot_cpuid_phys() to pylibfdt (Simon Glass)

 pylibfdt/libfdt.i       | 8 ++++++++
 tests/pylibfdt_tests.py | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index eb14312986ea..51db9535bd39 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -684,6 +684,14 @@ class Fdt(FdtRo):
         del self._fdt[self.totalsize():]
         return err
 
+    def set_boot_cpuid_phys(self, boot_cpuid_phys):
+        """Set the physical boot CPU ID
+
+        Args:
+            boot_cpuid_phys: Physical boot CPU ID
+        """
+        fdt_set_boot_cpuid_phys(self._fdt, boot_cpuid_phys)
+
     def add_mem_rsv(self, addr, size, quiet=()):
         """Add a memory reserve-map record
 
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 20741d8f2df0..18730965bd02 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -300,6 +300,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         self.assertEqual(self.fdt.version(), 17)
         self.assertEqual(self.fdt.last_comp_version(), 16)
         self.assertEqual(self.fdt.boot_cpuid_phys(), 0)
+        self.fdt.set_boot_cpuid_phys(0x42)
+        self.assertEqual(self.fdt.boot_cpuid_phys(), 0x42)
+        self.fdt.set_boot_cpuid_phys(0)
         self.assertEqual(self.fdt.size_dt_strings(), 105)
         self.assertEqual(self.fdt.size_dt_struct(), 564)
 
-- 
2.56.0.317.g454f8302e1-goog

