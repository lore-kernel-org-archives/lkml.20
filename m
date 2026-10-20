Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506469;
	b=bDffGNG5PFBpmmeSSPu2jZd/zsheL3gAn1A7uIxx0Nhxm/xusUY27ka4ds/2rXmOPZGa
	 4EeVebfRSqJQLyB8FjYmtSEyBjicf3p/+3wWd+LhAmQbWvvWLEQ0R3LJn1sqp8u1XuHIS
	 xHNhVx1hlQJ528ZPk/44Aw5JxB01h1dNFH1I0LwPNUnJfd+/s0XLqi3qqhm6gofY6+jRH
	 P1Lm3S4VngrhbHj27E+lm1KJ6SkJKw9KMcN0mgHLXTJnIvUEQSlgAtd++ddy3EI2agyNU
	 aZFLRjNd0e4+0qqoHfoU0KwpYQHCCpFgsOV/zIE9UolJpQXsqH8eNBQB0r7mO9GzHTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:To:Cc:Message-ID:Content-Type:
	 Content-Transfer-Encoding;
	bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
	b=mVZpwOEroAgxxqg84UIBnVSRcBfRWDFGSTFkS38eKqlxA0CeJr9LKT0k0Cg/WDx0950g
	 qWfHjSjgTzSa/dEDIBYuG2y5SNI01l45cRPmR10NEnu1DjyoxQyAMrAKBV5gfDNfPMtaQ
	 Og59m4LUlBQoRTo023Qo0srrpBEmivL0rxvUrB/78NiGmwupiRRpfCeXDWXuTeI8+BAla
	 jSPGRvE3mDbVR1hGpONolKHw2NRr7Ihy2KrvLeMkpSwI/R9nXLUQDPlogqWR5u+weVWD1
	 EBk3Enp0nqgA1cFqq+jA4R+gZCIYJCTfM+wfVZJeTeo+mq20ej88dh+I0VQhXPNTWzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DE0606A329
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54DE0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X9eOmd0M
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93c5b7f5bfaso75266585a.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506467; x=1793111267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=X9eOmd0MHVJiLpZa4cT4z4LcM6QV6Zh8LasqDEKQJryNFrsyTpXe8C2GA5JHRHRHUh
         f+ZY8STqPP2xvorDdgtZk0o66VY/FBMgPeWW7xqkvAdiUkMAoKSsb0pRX7tvB9CHyP13
         wnAdpSHEfxZywh9nfSmm5LX4HxOBN20HZHqqPGQlhRoWAymUi2qAXTag5wzaxZRG550I
         JrIgYHtIemPegeV/UT7fEuu5TwjnCcBKeLrx1XFirvxvM294rXTV3zP7Z3dteRiDJLzr
         GUj0jcgmXRd7LGzhej/7j4h9DLv64Gh0YdJp+yb4Sh8mS/43UoCNqxaFNqCTEXJ9u8xa
         Dcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506467; x=1793111267;
        h=content-transfer-encoding:content-type:message-id:cc:to:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YYdUJX6CxNd1qo/rBqP+LkzXmW73u3T67hGKBmDRpeQ=;
        b=lEi66r8WhW/t3v0F3fuGvrF/b1quPFkDZENZETKm/58/M8D3PkaInDajsk6acudKXd
         c4EXCAvpOVnpoihy7AI2ANQwibAKphNWCIcmK/qRjiT+/f094V98+gz/GYwrSD6Y1jeM
         k172oULry4HVqVklFI20HJIbDzcJwzvnH3JMu2aEcFHRhE+2hGRBN95mo8vZDY1bdKbs
         NSVH9zT7BkXlTBoCbEs12YVlIXfxxFLg5K7DzGDHJId3gzi049PR7Fqr3qr4IGKoMU1y
         nR9BDxT1GefQWPULxzKPwxVg0iJzeGZJ7dHygmShvpjSbyt5HFa4gZ3UOjMITCjbYBwY
         BhCg==
X-Forwarded-Encrypted: i=1; AKwUvBwC5ZVrmJyf8i9QJx+ESlk0ab2Fj+6TwzBLAD9u+s1lmbtvE8X1pFrQHhZwWTRXL4/fHHaMaVCmHaNdLmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiN14lvrc6aBunwDKGWqoZdj4ccEZ/EsP6VL7grJXjM6VTQGv2
	xp4agiIAHdhb6FkrQZdzEUWjS5wfTsKhleRLntEkItL3LUiZaJlQJU0=
X-Gm-Gg: AYBFou2srINNpTnSejhnLV4dqjnRH/1FFnkjnzdLhSjk/WyYYbBGRBtij7jPH7p5Lwu
	MC3hxuicyR+5j1Hm3ySTzUkEHQP35RhkipE4kD8CqBycWo/cLk1se9d+ytW2Bt5UJhlATt5UKGi
	thpAGOqo4lLYgWtSzjDNowG5gkybst9v0bKvRKOGvKVnl9pGYMx7BtdfUckR1IrKYcME1GHXwYk
	4Z3Ii1DT2PBtuDAw/9LKfEcJSRNNT9MljE46557cq6mR27Q4JzEpLNXmmQSQ9iCbbvZqv4MhKH5
	YNE6WmuYDbruCtH56G4GAQejSByaTpsSuKgekRPr302mv21c8Zqot3pzf5tmakPDa4caloBpOoQ
	RxuRH1Z3UzcGNMtoO1cniZYXgley8l9nvxIIFIiLPq/y/VjouTvGKEimXXWSGMF3um5FvfpaHVK
	C+Tyiq5MXJiYVt3JIfqEmymc9iu8SNGI+C4939vdFabZps/ZgyCY8lfrRmxFGaaP8NRpdOPY8GD
	D+JBWaXRdKnNQImdex/ppfWjmmz3obxVjUo/CkPrnVvV6RBSCTdb54te6YDhGWgeou+QB0Getc9
	W6KxzhFcsWKxvhCYSMPUF3QIUREzkuliMoV4QY8=
X-Received: by 2002:a05:620a:1a19:b0:93e:7156:f814 with SMTP id af79cd13be357-93f4c1c5518mr352969385a.11.1792506467179;
        Tue, 20 Oct 2026 07:27:47 -0700 (PDT)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b0d7c74sm234996985a.35.2026.10.20.07.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:27:46 -0700 (PDT)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Tue, 20 Oct 2026 12:10:33 +0000
Subject: [PATCH] Documentation: kunit: document --summary and --failed options
To: brendan.higgins@linux.dev, david@davidgow.net, corbet@lwn.net
Cc: raemoar63@gmail.com, skhan@linuxfoundation.org, rdunlap@infradead.org,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <179250646543.2190262.8632957027583518623@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

Assisted-by: LLM
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
 Documentation/dev-tools/kunit/run_wrapper.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110a..641ab50a 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,14 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary line for parsed test
+  results, rather than the result of every individual test. Does nothing
+  if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed, along
+  with the summary line, once all tests have run. Does nothing if
+  ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


