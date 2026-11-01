Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793570620;
	b=JT6vZFEetBavri+bq/Bkas7zg6GXlOfb6ZQK4JlXLqUFlHXDI+HkdJTEWxj9F166rU+s
	 aeojMoIMlqQfuQtxJJGcHNntfz38GFWKOnRvo0tA3B7vUhrJ7+xQZlBuX/utuetT4zTYP
	 vyoNZDnCzNawaAaBNzHERzKyHSqV6uMKeZRcpmAI/5B/rU/MGsN2FMuHZ1IkVzv605zON
	 mJsNS59dIIrJjpZBSCymZNFDXI9tMgw2t5Ts7srKMLvEc+m0Do/opPYt3WXRV01WB0qY9
	 lb30eoAyVqA0HhjfeD/Qic0x7mubiPCjn1hnCUVgOhDsHVnoqXrniQtE4Im+q3oRmHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570620;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
	b=bEe8Q0agMH8JPlpRtJK4UZ+iKExgYLieW+4aSI/5fa5f9UVql/j83guyrk8mBWFgV0nZ
	 xOr3R8dVtNAw2XhN5ZkYSqVGhNXdWCjLjw1IM3JiqvZV1nVZ7mrA1rnzB5Q9cS6vI01M9
	 qp7dFhsD2qnzekcYRGwpSzURdGHziymYz1eI2lOutbMvqNGmuEoeOyjAH1mCXgIMSg71y
	 xki+Yi/DLSyLihmOls4nZ6QA5XWn9kWRLDw7ElNcTf6nvSlspLGEXvt49n3FrHviU4GUP
	 Vaf6+xsOd00iXRx/jFjuszXgncc9zToz0+lsng50DDD3X5LJZ1MKM8c1fwegJahmgqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hAfr3Fei;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A90606A32E
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 22:03:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7A90606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hAfr3Fei
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-14394530ec6so2900986c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 14:03:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793570619; x=1794175419; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
        b=hAfr3FeijYYJxYYlH/8f9HVj0okG6peROjzlYSkDbyC2M1z0gnfPaVQplVuef6eE3T
         t/vhHt2MR8BF4UwsEB2IEEtnuGmh9NM2FB7vjMiAYGZ5cmxGDmJvZhLJbh6yPrzl1pCS
         fTXdOBvE5Ec/JxB4W3qtKUMLRpF0jWxQXB6aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793570619; x=1794175419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oX2lY0B1d+Uk+y09UrHk78EQVJf4wVNg8JWwEXhX1hg=;
        b=jhD/hRapc/0l1y/YODcwdUOBBcORYIbitfstWZxREw6+1nsmxl/mGbyTXuyM2ytJfS
         ywywYk5JVtc7Z3FRtUvOd0kTIZjwA45ccr/CHM/W2G15x2z0OlE+plIaoIhERB3rYz15
         9D4AqZdKXudUlIQyFKfcxxBeXt6bmRmYMvFiXWK4XkPlwSg9yK1E8rQVxrV5kN9lwg/8
         Al4PjuNsP+i5E1uYMXalLNgJh5otPa3Jq955UJ5LlFDUY0mzteHWk9L452fLPp4GU0Hn
         vRLPzLBMTJHUDdypCAPtqvXNnb8T1JEj1qiSzIPfJthSJiko7PjTtug1FFnW93Sq4ZbM
         i3PQ==
X-Forwarded-Encrypted: i=1; AKwUvByKR0cz+uSWyT84p2v4vbUsgdKyMDUzieCeVf/SrUsdaa1KKA41d6hZEJBsgegbtTwI6J0N+Qsl0nhZUu8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdK+92dBgPWZqy8ChuOPRQQldK3caD18lCbytpdo1McSfmZYDL
	RLHVv6dO7nXyNcViMW5S2ypSRISixKr1IKbc9ckh4D7gDRF/BFj66b7KWd68hUODWg==
X-Gm-Gg: AYBFou191O1jfZjwQdMKo3BbBx9pkAabmrbJQBWy4nCUEg3tdo3dcPGfnb5py0xGvO5
	joVdQTyAuoAVMGT4RmTAqhHwY9t/t6zzydU6JrcDRlI5ALJ9xa367qW6N59ajipZk++kxHlPhXN
	pkVFNgAwIatuw2QiJRSbKfgKvJJT/KZjEekJdE5S0dX0OLtUszpm1VMHLM7SGlKyy4kjio+QotO
	FMIGDX1wNK6Ia1MgFhkydoVQFEZqv+zZahfklti638ydxr0ew9H9ZgxAsJbUzO1O2Ar8ETKGq9O
	3nNz1p0evcXOfJ1Q0MYOAPQsSMeo4pnRL/MioTJzD4NtbiTqobkNhF1vciBWt3taezC+nQJe4VC
	ZdKQ8kS28wwn3Ezfc4700Gev1Dyn3/qyyFG35jwXxksCD1O5KaBvUUyjFXL82O8dFLV1dxKBbWx
	TeR5ehQHoj8Cn5XuRfUjxN8/W1sfxiiRyrWdKtKttW6MQi3EkU3+T6RDKVaGyvq3KBx0UVMQaS7
	FgS+dqDdWgeBkxeIjpr7kv4p06TD54EPBSsazE/XOVmpPMVrmbgzvXHUNLV5mmb+mUdDFJoBwtQ
	Xt6b4yA5EEZNHGRD245GusuH8BeXSMVU3tPA3ojZVXhq9XtByxK32kwxidBYgszjICuv8Yp4DRy
	8IiOTbTO3vGAQlQ==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr6889873c88.38.1793570618814;
        Sun, 01 Nov 2026 14:03:38 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:cbd8:5ca8:653a:11f9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm11097266c88.9.2026.11.01.14.03.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:03:35 -0800 (PST)
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
Subject: [PATCH v3 04/15] pylibfdt: Handle empty properties in as_str() and as_stringlist()
Date: Sun,  1 Nov 2026 14:01:11 -0800
Message-ID: <20261101220224.1436242-5-dianders@chromium.org>
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

Currently, calling `Property.as_str()` or `Property.as_stringlist()` on
an empty `Property` (`b''`) raises `IndexError: bytearray index out of
range` when indexing `self[-1]`.

Update `Property.as_str()` to raise `ValueError('Property lacks nul
termination')` on an empty property, and update
`Property.as_stringlist()` to return `[]` on an empty property. Add unit
tests in `tests/pylibfdt_tests.py`.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split Property.as_str() and Property.as_stringlist() empty-property
  handling into a standalone patch and add direct Property unit tests
  (Simon Glass, David Gibson)

 pylibfdt/libfdt.i       | 4 +++-
 tests/pylibfdt_tests.py | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index 5c8859b37df3..eb14312986ea 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -932,7 +932,7 @@ class Property(bytearray):
 
     def as_str(self):
         """Unicode is supported by decoding from UTF-8"""
-        if self[-1] != 0:
+        if not self or self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         if 0 in self[:-1]:
             raise ValueError('Property contains embedded nul characters')
@@ -940,6 +940,8 @@ class Property(bytearray):
 
     def as_stringlist(self):
         """Unicode is supported by decoding from UTF-8"""
+        if not self:
+            return []
         if self[-1] != 0:
             raise ValueError('Property lacks nul termination')
         parts = self[:-1].split(b'\x00')
diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
index 93408745c575..20741d8f2df0 100644
--- a/tests/pylibfdt_tests.py
+++ b/tests/pylibfdt_tests.py
@@ -423,6 +423,10 @@ class PyLibfdtBasicTests(unittest.TestCase):
                          self.fdt.getprop(node, "compatible").as_stringlist())
         self.assertEqual(["this is a placeholder string", "string2"],
                          self.fdt.getprop(node, "placeholder").as_stringlist())
+        self.assertEqual([], libfdt.Property('empty', b'').as_stringlist())
+        with self.assertRaises(ValueError) as e:
+            libfdt.Property('bad', b'no-nul').as_stringlist()
+        self.assertIn('lacks nul termination', str(e.exception))
 
     def testReserveMap(self):
         """Test that we can access the memory reserve map"""
@@ -523,6 +527,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
         with self.assertRaises(ValueError) as e:
             self.fdt.getprop(node, 'prop-int').as_str()
         self.assertIn('lacks nul termination', str(e.exception))
+        with self.assertRaises(ValueError) as e:
+            libfdt.Property('empty', b'').as_str()
+        self.assertIn('lacks nul termination', str(e.exception))
 
         node2 = self.fdt.path_offset('/subnode@1/subsubnode')
         with self.assertRaises(ValueError) as e:
-- 
2.56.0.317.g454f8302e1-goog

