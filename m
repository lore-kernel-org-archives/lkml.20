Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760750;
	b=huIW5VSbBypNxVojDpIH8IdhcnZac6GyOmePCGDB8TnrAVUQbFVCFIXHJ64CXTZ3+ZMH
	 4kqJjwYoG8BbC0YndSvTtrYUxHXeaB6ZAenOMR/mpH0R5jXNFDzwf/JfM2HvrkMwgtnBr
	 2SzqvkvTlt1/50etovyAOl9pcwZoK5BKOi3Q3sMjLc+rSR5BYhvuxXg2xUom2/Jxv2SvL
	 e37CVWp/ED/M4j5wRb0DMisQ/toz1Kk6vJqylj0CGeESB4F61oOO03CbyuqW/YcvrSeBs
	 qbHmnu87HyRO3H0dQ48nyHT7D92u2px7Uf/lgQWm/T/KGkgexL/OaoSr9AThExHkgvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9VPkQYK+ArcltobtxRhPWHglK+BKsS4JRse8H1VWFAY=;
	b=dvBASJAazI2HIJNn1y3AT+e+k1s1O8Cc/8cqttApy+RXs4DGX1xhRlMfclY8DVkUMqak
	 HDezSjCrr4lqZIg8ieav9cwdc3JDhE4gCaGVsXeFR030Fc3m+3e3/pKgNnn2Oc64x1Y3a
	 l20rdPLCFy4uR1kgvSGnahu/aT9aSDlEHnqcMVIcpIKt2B8r1D0H2taAOay52arYBBtHg
	 sOhEm5kHewlF7LBqWQhAYnEa8MnKG15LEC0luB59fMm4asjqZPAyvmxwNGEi2SWsgxo+y
	 L5TBlSWqqlfSqMjIsG1WMhseD9b6+Dgq3DXEUtbPC/mgkFLakg3tX898l6y10J/UueQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EJSW7Uwv;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62840606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62840606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EJSW7Uwv
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48dd3367198so120831f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792760748; x=1793365548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9VPkQYK+ArcltobtxRhPWHglK+BKsS4JRse8H1VWFAY=;
        b=EJSW7Uwvc9VIQKX//Xz/6190XnWyzJkG41GalNWHkkritdFp3zIu+bx2yHo3g+xkFx
         iaFym5hps+GZ+aitaPXu1JReTXQex7xjzzn4ITw1h5ygd1/iThAHYYeb0Bn2qMQlxnyB
         KMI+MvgVf371fv8FpwyXTk4AB52s3DAG2WoWRGVxMKat8V1QT7t1BEQbdPoADsfkw5zU
         BO91XcuN7JQ9xLLf73Ip29ETexYykRsaUuwlUIcDnxDe4h4Gw7BqM8XxybPqYZUylQxA
         OTFHGLq+AWf1UyfPvyV3Kne5gke9DM3Y2Kub5I3o2O4tqjgjSdj8HBwNpbc9nMitKbg5
         iIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760748; x=1793365548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9VPkQYK+ArcltobtxRhPWHglK+BKsS4JRse8H1VWFAY=;
        b=Vqp9RDNoo+bij8If7rqhb0BDt1h5KRSltOis6XyoLdl3E7uJo/GNYoLp47st5uNdYE
         1MQwxvJAr2vsLTxHh33EgyiXfkoSXRRnLRXVIC9LqYH4YYXO9IBTS8nfpXqxn0B2+3J4
         ulgo3fsHo3yLpy200tdQcLD8qh1pMbrNp5R8oCJpQood779nF6BUJOog/ZltJtuT5P3l
         8jSPNlQQAOB9bkw8EOhwbWN1hrpO0tNa5g6FZw5hUUSryL+iIFMJktVnHzmb/Cfyn8Bf
         qT1J0no33grSsT+2T/JWVLEc0prRpPo4tzeOf961zPIHWBrsA8gQJLrkOG5t0LBGcW8p
         5ikQ==
X-Forwarded-Encrypted: i=1; AKwUvBySgIH/vLweTUCjqkJIX8hDzUCHD4RB845N6pmJjoqWtHd9HNCmAdS8Q8F8SaV5U41ATpFhw3JeUKcqhzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKIQNTTB4/+wqytY4flNK5U9ns0qKMNkdHUuo7YgMopSLLpyzl/
	YsRugW4m4mNVXFmApDRR8R1aL7y34EbUGrLpcqlFQQU9eg8HIdoco6Rg
X-Gm-Gg: AYBFou2m4nnANliOnY2VIW7VFLiLBd8g98qM/weJFeZ3h5/HNfwHSPyivPnfruJt8sL
	HYAy2NqS2VyPdoWyMoGKWrL1GI6fPtbTNp2V7F1FIiYikRirDQ7X2FVznFZxZF6/K7xGm3Nb/Bw
	OuSg5EjfM0l06B/OawGYPuRqpnQo9+EHdWV1KQaGJA49kc3iTvxuISiB1LTGCgOdfWLKGR70D29
	Zi6ukb8bmaRzRt9m4VOq1TYsGXJceeoq4s9cVbYzMg8przyuewqXVnGS2sv8rWfUdNk5e4ISeXK
	stW3OKC52ZWLdp0YvHxlUoM0mjV+TeHPvd/bwpTakh8J9yvN4fo9HHXgqiWXGt/rUoYNzrkqYQ9
	IWIBxIAFg7mg7pBTowXd+vcHJTFFobXhzuJAwec3vELRCpbpyx1DSWOFp08W1Oow7FgOJTcJ23n
	PahVNgXIn8g/uIEHOwcPIs58aYyXMXESTFMqnCqT900NF4SX4WRQ8tqsMIjYH7Wfv4tJ3O6Zj61
	VPpF7Mz/lRaM1oQudrIuHmwKHtuQQj7WfBxw3HtXBF7OBKMtov4mJboLmLZvmQoucEI2k/FBuui
	mp0=
X-Received: by 2002:a05:6000:bc5:b0:48c:698b:502c with SMTP id ffacd0b85a97d-48e3854bff8mr3167307f8f.1.1792760747709;
        Fri, 23 Oct 2026 06:05:47 -0700 (PDT)
Received: from Nuel20.localdomain ([105.112.97.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38061c7dsm4658755f8f.54.2026.10.23.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:05:47 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: mchehab+huawei@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	paulmck@kernel.org,
	linusw@kernel.org,
	Julia.Lawall@inria.fr,
	gary@garyguo.net,
	rmk+kernel@armlinux.org.uk,
	hemanth.selam@gmail.com,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH v2 1/2] docs: kdoc: handle nested commas in CMatch arguments
Date: Fri, 23 Oct 2026 14:04:14 +0100
Message-ID: <20261023130444.26270-2-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023130444.26270-1-emmaonana18@gmail.com>
References: <20261016231148.7b5a88ef@foz.lan>
 <20261023130444.26270-1-emmaonana18@gmail.com>
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

CMatch argument extraction splits macro arguments at top-level commas,
but it currently also splits on commas inside nested expressions.
This breaks transformations that capture a macro argument containing a nested call.

Only treat delimiters at the outer macro argument level as separators.

add a regression test for a nested call with comma-separated arguments.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/c_lex.py | 3 ++-
 tools/unittests/test_cmatch.py | 7 +++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/lib/python/kdoc/c_lex.py b/tools/lib/python/kdoc/c_lex.py
index efbc23c01abd..532e2c5a815e 100644
--- a/tools/lib/python/kdoc/c_lex.py
+++ b/tools/lib/python/kdoc/c_lex.py
@@ -430,7 +430,8 @@ class CTokenArgs:
                 if inner_level < 0:
                     break
 
-            if tok.kind in [CToken.PUNC, CToken.ENDSTMT] and delim == tok.value:
+            if (inner_level == 0 and tok.value == delim and
+                    tok.kind in [CToken.PUNC, CToken.ENDSTMT]):
                 pos += 1
                 if self.greedy and pos > self.max_group:
                     pos -= 1
diff --git a/tools/unittests/test_cmatch.py b/tools/unittests/test_cmatch.py
index 109141cd2ab8..978e02acfa4d 100755
--- a/tools/unittests/test_cmatch.py
+++ b/tools/unittests/test_cmatch.py
@@ -259,6 +259,13 @@ class TestSubSimple(TestCaseDiff):
 
         self.assertLogicallyEqual("REPLACE(arg1, arg2)\nbar();", result)
 
+    def test_sub_nested_commas(self):
+        """Commas in nested expressions aren't macro argument delimiters"""
+        line = f"{self.MACRO}(a, inner(b, c), d)"
+        result = self.matcher.sub(r"\1|\2|\3", line)
+
+        self.assertLogicallyEqual("a| inner(b, c)| d", result)
+
     def test_sub_mixed_placeholders(self):
         """Replacement rule for \0, \1 and additional text"""
         line = f"{self.MACRO}(foo, bar)\nbaz();"
-- 
2.43.0

