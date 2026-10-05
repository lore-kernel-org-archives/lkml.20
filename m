Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC824E021E
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231921; cv=none; b=SrwnmiHEQ26uC7Q8oOcBa3pm5kzinr7RD7gj0vIRyba3gVzBhsO5uFHDwRaJsokPvRSHjpJ51ex8e14gBdJBSJi+wKDXONhfMJrgan6O6mpHpOWe2u9krSLQ3M6C9RZ52540yk39QkFn2fQXOVhR4q3UHVl2ekyeRsbumQitvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231921; c=relaxed/simple;
	bh=PMhgNSXDiVdmizHWRIl6dKKFYKaYUw4PB8vY8udLJgE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fVgOqxnM2tsGC+KAEnzIsl4xE5sgRcVb6E+1FZEyaoI9rMhByalL985ZRpUrntSSYFO3I6Q0nt02NwcHeZk/ePZv26FT21ITV7oB9rdoZRaNSjT4r5PO2Y7iguNZrqc6SBOgjvwvT/n/RNihfOB1agdRKH2N281Y+QJ04upxli0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRTHEFac; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRTHEFac"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8247421d2ebso1139823a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231916; x=1791836716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1iNeqgRL89Z9h6pYYkWfI1GWRV4tMZ1ckcaMGOUQjYY=;
        b=jRTHEFac2muagbQRnDOLX3l5y7OvEJhw5RvZyWkGat+/QhE7QCgqAcu+mZJEOhA33o
         O340kFG05m1ysST4dFVcWWurWAuaLInKXDkTS8ApTyHJt56Jpji6TVq16tJAeZKnky5j
         RnnbJCS9b8iE8pndqCbifQe7bX5mFtxJWooT4YRpYLngMiZtvvuvwrlhfO5mxq+E1Bvq
         4ccAWmSUhc9UbOaWNWf+hJv40g3tkG8p3l1g2LA+DdIlsdAdPjyHKtiNfcfNyYSxR5St
         MtUdHOQJUOKA/lMOvusVJ8e0XbEP2+gPGJ+56Fc5AwC5q1TmwF/jG8lvVpiZ2iZd83dN
         6dNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231916; x=1791836716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1iNeqgRL89Z9h6pYYkWfI1GWRV4tMZ1ckcaMGOUQjYY=;
        b=KR3WIfCDEO1BGlzhpAukAU7pBznFvY5/E38EDZm13Rx7NpkGTw/1t5KXhyap2+FpRI
         2gsJ6qxhJMSD2FUr2obKI3zFtD/JK2Y2Zh59Rb98jaG9YiOz/lhKVzmWWWYi0awpjYzj
         gdUXX83weqWcU56ygTiJZ4onptTnOGHOKmDu+GAx6IThugUHRfgfw9V2dQ18O1JE21gi
         gJt+TtLUVC0PCioMuOk3sc1keMwVF3AwxDT0rL8qDi+qAFSZ4T06t0wZLHga587YIA8g
         agBGwKbFIKVWchDBmL96rjetjm1mqmNKiPPq5JOcwkv/Charv1XhlhRmRpJ694e3rxsx
         kKWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzL6aj1WZIHMOA/9DCKfkvkK84D1bXGpN5h2/URhy/v1PvuFqlj4iWiAss4qJtKfBz5lykjtS+7OpFpTUM=@vger.kernel.org
X-Gm-Message-State: AFuF++kZmF4hEZmRnBO1IeS+7mlSbc9coMukXq2P/O1N3vaMpl7r3xcb
	KuPhtZD51Z1f0Qj+zZdAGdhW/XnzXiY0u6M5lHbL494NRPSr43cqdnuIdvImVE0I
X-Gm-Gg: AYBFou2Gsx1u/miJeQvgB0H4rzy2Y1WuDxZhLcK7nAmljm44jlBAhDV/4SPHYJPitVj
	SjKOWwaDt99huDQQKX88fWvvq5yvluiJP5k35cotfmLygYO4feIoOWOaeON0n952fB8j5+ziKpo
	OtI+BPz4klnnezjqeJMfIKZCI93sk9FfRFoDaO/Ai5Gi+t92NnvckaDDENL4XuecE6UPGCB3PUZ
	b+XU7lUvCCtPmf2OA3G41eaE7ma3HkeKh3AcI/F3KZTchHD9TnnaVLNyAz/NDNuD73cJ7IA8/KV
	0hUid4sw/UKLAn22YYGACdd9AyI1jE/Yp6e7xwmE10oXhZGZ5IpfQAjNa8FBbn7XE7pSQTdcqwu
	jb3umFzsZDR+Sbr+1vubEH459h0mr1VvNflzmkCc2sRLD/yOxGKsuCYQT9NmZVg/ElZdyna7VW0
	6ZJYOyj7O2t5kP2pT1DSPgPMTGlw3t50Acs4SZKUCxn/fNTzn8gF6+t8Y1YtOIPSVIK2mw6QBgz
	/odqd1ahSZBGIUbVXAnx30=
X-Received: by 2002:a05:6820:c452:10b0:6b7:46e9:9705 with SMTP id 006d021491bc7-6df34680109mr7270463eaf.53.1791231915637;
        Mon, 05 Oct 2026 13:25:15 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-828209a35bcsm429277a34.18.2026.10.05.13.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:25:15 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: fix dangling check_top after an unexpected recursive dependency
Date: Mon,  5 Oct 2026 15:25:09 -0500
Message-Id: <20261005202509.3461632-1-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

If the last symbol of a recursive dependency is a choice value,
sym_check_print_recursive() pushes the on-stack cv_stack onto the
dependency stack. If the choice is then not found on the stack, the
function prints "unexpected recursive dependency error" and returns
without removing cv_stack again. check_top is left pointing into the
stack frame of the returned function, and the next dep_stack_remove()
dereferences it:

  AddressSanitizer: stack-use-after-return ... in dep_stack_remove

This can be triggered by an (invalid) Kconfig file in which a symbol is
a choice value of two choices and the second choice depends on it:

  choice
  	prompt "c1"
  config A
  	bool "a"
  endchoice

  choice
  	prompt "c2"
  	depends on A
  config A
  	bool "a"
  endchoice

Jump to the existing cleanup at the end of the function instead of
returning directly.

Found by fuzzing Kconfig input with ASan/UBSan.

Fixes: d595cea62403 ("kconfig: print more info when we see a recursive dependency")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan libFuzzer
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/kconfig/symbol.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/symbol.c b/scripts/kconfig/symbol.c
index dcb4b45e6..2e87af098 100644
--- a/scripts/kconfig/symbol.c
+++ b/scripts/kconfig/symbol.c
@@ -1181,7 +1181,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 			break;
 	if (!stack) {
 		fprintf(stderr, "unexpected recursive dependency error\n");
-		return;
+		goto out;
 	}
 
 	for (; stack; stack = stack->next) {
@@ -1226,6 +1226,7 @@ static void sym_check_print_recursive(struct symbol *last_sym)
 		"subsection \"Kconfig recursive dependency limitations\"\n"
 		"\n");
 
+out:
 	if (check_top == &cv_stack)
 		dep_stack_remove();
 }
-- 
2.34.1

