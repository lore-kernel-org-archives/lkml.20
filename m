Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884362;
	b=brHl4CcjrhmmhHLVDTaROAk1ndlZtZ51TwSbv1ZdRU2Gl0399kIpf3sAmcmsxhXWpeOd
	 thV9MemIz/jQstUMkrdcdIV0V6opF3yAoFyQIq174TTx4TLUYWbmZSB0zoQj1t1TGuKPt
	 2O7mcZ97mPZ/B+emjGEW5P4BiiKBvsQ/SWldefDlPr0lDz/dxmOE/55JDMjfx7Ywtpk9t
	 PlKhdxY9llqy8UCR+jtDyeLyQOXBR7tYiyByxwwIbVH4znICoEU9XCmK9o/+63QApbTJO
	 xxiFl8ddnuhYRqX9nSZXqgYu1iun+AeKrYIC3q6RLCCcMe9dHNurJ/4DA9DOKtVs+cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
	b=JzdMo3KE+hNlwB4hHpzv6IrHcLRuHqjtKVgY+6avZQgypM+4wCc99Vkzph23vMVeMPdV
	 z357cxSj8dw7TcHV/PDOa4sWnT7o164p096QnSkLe6T87mUu61TnYUMv0Wbwt9k1EtZCe
	 ifW/znyrc08npFLrtazMcbp0er+a9Vb0ArXeq23iL2J3yBXUyifWb0/0rqh67fAI9f2Wa
	 +CDyEwk58lhc84kLTf9KUQGsssC8K83lnro5yV4gZngWqfYd7yoqzUAMrfKw8014tsd40
	 Y0JEhLAeWD882DZsGpDlLuSH9etzmaypVZ9Cb/kjs5U59YnBjU5H2wtftmdPoXLtR0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4E606A8AB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB4E606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oeuzk5Ca
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b4d86f5328so11631477b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884361; x=1795489161; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=oeuzk5Cai02QOkBVatxcY76kHfgc4cFvWlnpleAHdg9txREH7h9S63Rah3Hf8VA004
         rApn2ryC7wf3wixS2C5v9d+nxrdBRPFsqQVsMHYUW69bs1hg7TZzFPWNolRXKDZT0zpB
         zrPI97ay9iTjEeY7smrBvfuG1B6aSR0zGUUy7HPPSnMD08IctZxQr2n8499W6xc0mIUf
         Z0zjBDXEktA6Hx6B1eUYH8E+Bl22URiq+HnqD4lo5SxWvmebTSRBVDIm5qwat9HfrGOg
         7RnQTCAMl7JbXkSYpp51OxYee5NMgFK41YUFAPRxc64TzWSYKIbkAqI4ffH7HTTzDUnO
         54Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884361; x=1795489161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbENZChveauVVgT6hKm3TIJcmjheLSG4uWx2lXGAyh4=;
        b=Jvze8qwLGrfb+Rh4ZDnix/1KyTrStnGT6Nh10Ul5RiiJukQZYgFWNvrALX6mVNtR8E
         fFPNehb6WjKkbuw32QG+MpZuIR31FyCn+GGFZIb546JqvvW8P51eblvxuz5YAKFdUCnW
         4B4TXDmVISv2s3nii/0PlIGSHyzbUN/+5pbK/1rOBfi+CLOqVNxSeUCUpvKalhLh7hqJ
         ZOevS64DXq4sPuvVhuq3CcoRbjQJ8k0rfQD/Qsl8RjxQEpDd7lFZt4YeRzyWjrUrx6Tb
         qNyyHWtvyuGLYJVo5vY43vV9BY5Ht7ucJhyZyXphLME9Y+wagx/ZgXEANitK4AMOlM8C
         18TQ==
X-Forwarded-Encrypted: i=1; AL+hErH6qdDE0yKwy4kdhh5drf6mKhEwyIH8A+XznBNd53yJwtadABOpqhhVFIsOxvrFZ5PdzOElaALJ8vcr/3g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKlhNENQhXBixdYSkGDfcxUlzYLE/10qSArjQhrwcTiUlSDji
	3TM6iZiyQi4RSYGTEPxtxSToOuZ9/+9G3l39z11KuaXGrBMGeO36KuJb
X-Gm-Gg: AZFdTZdZTCVIqW/NAMaQqh4zS9b6cs/yt8fyV+hCvDXrEr5lAkDGgdfEZXeq8DAxtyM
	M70jNKlWhYhYyZkjlkv4XUbNgghPh8HWBjsF/fpWd4NCoY9gBBDog5p1MC3rOumRFSRCchqn/0B
	zDIWQJ2X1F+nlHn626TvZqqn98ddeSHy8anRKyzXPEleQ2T5+0g5ifA9pxYiwZjHu2CqOt4GUMP
	HUxI/mvLffaaSm+4DaO9jnvNp7oIsepCMfhm5Jlp3iB2nJESfkHmwVucrsEhim6UO7WeUPA2Sg8
	TeLKx9Tmjtn4onydmQrvKlvvk3lfhSJVis2cQg3O81je2SwF1heDj4bf8DwouLPIAPRkS6Dnb4D
	l5P5UQ/GPRSCncQM08sIKcFxxHMqJjOS3jYqaXWCJ7o0B+SzGgA6oknelME2dm1AGTDQ5/8QyMG
	Z01jeeNT/7jCBBl3JxWUgPzjom0RdQ8VVcXBEIZez7dV6nnH2fzmLOphGdEfOza3Mz0Y6PoN6h+
	gmR6hfnVY2UkVG2LGK4vg0xTOBl9l1BaIMdBZNzLqk2c5j1y7+tbkr9H4PMKqNcsDrpNcoKPkWB
	t+SsUakGXqGzW9a7uK9hhP2vbwm9QDfQxgS1YYDITb6AWGjxVPBMNjki46T0fNNMCrQXD9stPoW
	nBgkZl/CAKWSG6k95/m6Uw74yvP8zPkPlr4bjco7tT1hwf/oXl+VoJuXJD4mkIJyB0TnQPXLYsW
	SfTQOEvRnFRQr3dP2PyA2JFEZ7m1GnyrCAwe9Heik=
X-Received: by 2002:a05:690c:4990:b0:8b4:d9d2:df80 with SMTP id 00721157ae682-8b4d9d2e1d8mr21916577b3.24.1794884361016;
        Mon, 16 Nov 2026 18:59:21 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4eb7f0530sm14639707b3.1.2026.11.16.18.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:20 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 16 Nov 2026 21:59:12 -0500
Subject: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=5M8/bkKqDW1fR0jpsWeEFd603SI7R5txSS4IygbKcb0=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/rz1dCx72xPpqbywdN/3jC0WtSu4M80OLKmd/7El
 AgfxeiSjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnmYj8jwxzzhKipG2
 N+O7z9d1t8U4jUYsULYuzvNq/rvj4tJ+ug4C9Ghh8JOjw2RRnhLwsj5R6/2iVcqOzztbHJa9uZr
 5vvnlHhYAIA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Register a "marvel_env" platform device on Marvel systems booted from
SRM, for the hwmon driver to bind to.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/kernel/core_marvel.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_marvel.c
index 7525f3ed6b62..169a1df6adb2 100644
--- a/arch/alpha/kernel/core_marvel.c
+++ b/arch/alpha/kernel/core_marvel.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/memblock.h>
 #include <linux/workqueue.h>
+#include <linux/platform_device.h>
 
 #include <asm/ptrace.h>
 #include <asm/smp.h>
@@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long offset)
 	return status;
 }
 EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
+
+static int __init marvel_env_init(void)
+{
+	if (alpha_mv.init_arch != marvel_init_arch || !alpha_using_srm)
+		return 0;
+
+	return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_env",
+							       -1, NULL, 0));
+}
+device_initcall(marvel_env_init);

-- 
2.56.1

