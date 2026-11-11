Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433494;
	b=5NrD/94hPhkHz6UVz9NRvvz/mj/ccor8og5fMGobSxurtVVh9PKURyjnKH1wGE6AB1jd
	 EyhqgXbq+v7yTRVjFS8JLM0pAbm7jUJQGNGUZkqL7Ty53/u/MfsQEs7ZhCHCGUqrLlaYK
	 8YdiuEAvEEkeZIpBY1ZigaRsOMSipucBmrxouG7bLGMwFwr8C42gd9DGpIWtZPm3JYHPU
	 9ssWD+/v9FQi+VH+rHXvU6ZpQ4urWyehexO57PAWDjorJ+rTL9XArPNtaLfWTu/uHyCCy
	 leGazHPw1C0mTohTz7jnFwVAShnIAHRYdotjLKE73c+gbKFu+9iGuuGTUf/RykEZ6oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433494;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ob+rHnVcyvihM2cjsMId5sTJmUmQkH+KTxRLQJzqkyI=;
	b=NXUlOTPmeGj3BeRk0+IWjlAwq+7KftRtCnhee9FYJrTNg2etl9rvaHOLfDmd5e2A3Ffa
	 O0KfzjnrmreAwpfAWlr2Ei80BNLbOhrZOSbR+XmSSxN7B9l9m8A5WQ2vSdrEeLegnxU6t
	 PVuNbtDu4up22q+ZgirlPgt3JYrc5cJfy8PqDU6Sta1n55sklhY9Dcp4Bx3GvaBvZxiNE
	 9HFavxAIoIJCWB7Sz28VeS6Gxpg+G+J3xbEk0IfLa8xifwRin+6Gsv73bFw0mSqRM14ej
	 SoNZuxMu0HxZHCIt+XZyAit1I2b5kXcc8yyniVjeVa4zHMUvJY3cO6i+wOUMaqkvJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1GXhTJD;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992CC606A32E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 992CC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1GXhTJD
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc758830601so2229298a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433493; x=1795038293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ob+rHnVcyvihM2cjsMId5sTJmUmQkH+KTxRLQJzqkyI=;
        b=B1GXhTJDLSH/sbuUa5jSEc+ggEJT593kzWdFrcMoAqEoM6d3UXG6ql5ltwv3OrBuZ0
         cnlFkbVj9eTIzQn47Oj9GCJuhTNYrbJa0uhwQaZJKceq7u1OS6q5PpizzHsHhD+3IWpm
         ntIgZSYAXRCivMYSI4bXIsqQXp41ZJY4jwKgdwypUf2hI8uN17gXzHnqqcI0pFnZsNjY
         yP3TX6XN6I5gMij+OlupZQW06YhzGt9HL2s+uz3ekUDWQGmLKm9QuKeWxBENxYGbZFj8
         Z3lpXpG6iJ9wS84sHBVsd/+1L8uBs3vYpI46cGQn0QRyZ2zq8Yims5Ns6GADY0JQAos6
         5t9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433493; x=1795038293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ob+rHnVcyvihM2cjsMId5sTJmUmQkH+KTxRLQJzqkyI=;
        b=f2bmOgUa3TPeLGY8OMr+C+OlWU9Og6MUW7kZjvCxUCkrYp9p2lqd2cg4HiKpBC1sc2
         0qP2LOyDOJvA+IhW26Px1zXqIIaP5JGWadpzKLPFK9ehPeZ8JRJZMhs/dya5BLrKfM+a
         bNv+mEF/w9+8gZLkswYi+4GZfMTbZ2GzP0ksd58sHesqol38ONkrrW87A2uzYGw3lxmj
         QbOeVcVhJyL1X/zN1IRpXO5qghFZMiY25QSmfkZwg7zzkmakhu7pGiNnKCrOmFyKs4vc
         TTZ46xPgWjhs30D81Hb7lFv5PS5keadx4PEfUZ7aMqO3EeN8PsFTnLG6/WLq5kn9KdJP
         CCMQ==
X-Forwarded-Encrypted: i=1; AL+hErG3NXUzwrbB7sS2EADpSkr8xk7LP3P54NvJhaHXgQ/t0zrGm3h75otWYPpoYwLh4xtGjZJrNJSvq8YDSOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eAvZY4JmyoXhuqg9wZOUexNc4S+n3/SnXiXmWT7Te5gRycTJ9
	hMtGY44jIEjRFULjKV9RFa/7Sm9gYBzQDJcaqbvi5j/WOGVSqBSvdy9a
X-Gm-Gg: AYBFou3KQYZqhKi5XCPDQUbV2wj76FLQP+uacE11KirUNSIj/Lxc3k2WEqzkOm9n5ZU
	QkzPMLvkA7vWY0KH4QpOO71Ui2nMRkFd3GzROfqcYuFGJ01UUBwKnv79WpLnnFpXEVgbhDu1cn+
	JcxP7X/3jrEpop3ShTwXYWXf9q2Ak18h772QawTtU3otOrbo+goG7TZ9iETFiv3tkPCk1UhC7s7
	JkGL7jIwmadimJoK4UNmGD3Qbgt+oaK6yEhtSoghkhsclGItmdurIrmMjcE40IyvqzY9AQQRxDg
	JCkXwu2mblSYUQm0Cc/zyH6iZTnTlGJy9hop2FXa568tKb2CVEXLC4JayAKh1RDVp2SNwbMC75w
	hTmetEaGoBX0Mfwmq9OUB/Enp2N2IiOMYXStudX7YzGTReaJt69zALAr/YGqPOC843WliTJiaWT
	8mkvz/ONcXsI2fbuFpQkn5p/IzTVVX4wNwNLMRPI0NW3ae1pjwBZlk7CVN9/0euey82BK6S+Pvz
	tcS6L8dxMPECFEyOBuTFWhcNPte+BzLdW7RIuII4/YH89yweeC5I6Ac9Ed94hu19BKw1YANvA5Y
	ovkHQsJeZrrNCZKIriUX1uvkxx71kGtMOltecOh9s4qxyWDGl7XVNpd9GgR8tthKWi+a62M1cMm
	9fSGRDyDPPp74r6vyhrgznPospv7ot7yhf7NVFUWj0NiksLWczDt2dwaoVATGVUsGy8v/EQzLf8
	VH3Q==
X-Received: by 2002:a05:6300:670b:b0:3dd:85aa:452d with SMTP id adf61e73a8af0-3f2fe0a3583mr3945379637.31.1794433492804;
        Wed, 11 Nov 2026 13:44:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdd8d6940f6sm2042637a12.12.2026.11.11.13.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:44:51 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-smbios: Accumulate supported commands across 0xDA tables
Date: Wed, 11 Nov 2026 13:44:40 -0800
Message-ID: <20261111214440.5473-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

parse_da_table() runs once for every SMBIOS 0xDA structure and assigns
da_supported_commands from each one, so the last structure wins. Some
systems expose several 0xDA structures where only some fill in
supportedCmds. On a Dell Precision M4800 there are seven: the first six
report 0x40361f5f and the last reports 0, which leaves
da_supported_commands at 0.

As a result dell_smbios_call_filter() rejects every call made through
/dev/wmi/dell-smbios, even token reads from root:

  dell-smbios ...: invalid command, supported commands: 0x       0
  dell-smbios ...: Invalid call 0/0:      5c

and dell_smbios_class_is_supported(CLASS_INFO) returns false, so dell-pc
refuses to load.

OR the field across all 0xDA structures instead. With this change the
token read succeeds and dell-pc registers its cool/quiet/balanced/
performance platform profiles on the M4800.

Fixes: 1f8543a5d602 ("platform/x86: dell-smbios: Add filtering support")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-base.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/platform/x86/dell/dell-smbios-base.c
index c8e93c12c445..f79847f0bfe2 100644
--- a/drivers/platform/x86/dell/dell-smbios-base.c
+++ b/drivers/platform/x86/dell/dell-smbios-base.c
@@ -406,7 +406,12 @@ static void __init parse_da_table(const struct dmi_header *dm)
 	if (dm->length < 17)
 		return;
 
-	da_supported_commands = table->supportedCmds;
+	/*
+	 * Systems may expose several 0xDA structures, and not all of them
+	 * fill in supportedCmds, so accumulate rather than letting the last
+	 * one win.
+	 */
+	da_supported_commands |= table->supportedCmds;
 
 	new_da_tokens = krealloc(da_tokens, (da_num_tokens + tokens) *
 				 sizeof(struct calling_interface_token),
-- 
2.56.1

