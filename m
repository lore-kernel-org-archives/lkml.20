Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793086645;
	b=JsFbwJbAhj1fZGIyK0o6nFcAKKTJWBBhTj9BQHIsadX5UuKHQz8jmlnItWJncwIPm073
	 QFcNLT24ZmPELqHs0xvrHBcDhh+CYTdoNVRV3mGrcIaBCfl9KFBtlsIkJWdxS6WM5UGDp
	 v0JphXO8HUx6jQGJWaN6HCsbCKRc6OaRMiRh4IiZ1HlJzNV4RG26RTQJdStQv9r5J9a8K
	 YvNwD09cHXspOwlVjvaKdrr1ZwFd2812c0bDJjcS2C+b3lsdH9tvnKcStJ3Y2AsCgJmW0
	 tkBovrGd0YCehbK8T/FV37NQZqGxp3op97Yl2vVaRqu2P/NlE8ZM/Sz0DBbATcIa6JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793086645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vsy575Qvc3d/MeFu84YL8sRbt5XUdIJ7Cg8IpCyNi4I=;
	b=PcruA1XCHCQMdl9G84qkffpePnUFbVTL3MgV49Wa7/GGAD9aChUZ5Ud7AAm/uQQl76Fp
	 dOjPm9Kunn7x1yKtdTl0FWLyw5TIJnPfXWiCeMLBc2Y6stp439RCzE3fL6V7TLNWGfuhT
	 9tPE8Qlg/lLRaW1lYMvxplDvow81nZ/t7wqMSBWXHxKoIxygOk3rgMEAXNLBNpzyrGETx
	 MBujTIHo2kqP0aGhcB+l1ptIU2WKCRTLd/as26JA2NjM9VUPjYQe92fu18TVKr1k0jwv8
	 5aQzRemlYc+UD6xtjrWdDpQZUm1sDEOusq9DV57MAXngLXHyXAEN718LT35oeKxP+2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tHB2uq12;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB4D606A326
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACB4D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tHB2uq12
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2240011f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793086643; x=1793691443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vsy575Qvc3d/MeFu84YL8sRbt5XUdIJ7Cg8IpCyNi4I=;
        b=tHB2uq12SvGvkhaMBcCMOUo1ISJMmuSVxAqzVxC4t3mT0eDWlTi/hrdbv8EJdvcTXo
         GkGJaSvdgAOYLUnveWVIGWNhlG90+iOn5sJUPqDgkwrQxlwq9tvEJpcKzPGAuvPGZJGq
         NtWpg6FdiyZrKPAl9zadgoQ4APyC+BlPK0opOrUGQM86ZBzVJ0kWdc93rfkXysDiaLiV
         j7qNKsONJtIQ+Bag58VRAWqzMjcepnKjWHmLB0OScVtTHKmtMUpA2ZBbKnP676+4aXEt
         hoY/uaFWAfvo5Wj7eSiAiR+1nM+x0k90p8XMehMxdjY1dlj5D0pcO0aoaSc3efCVwzqo
         6RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793086643; x=1793691443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vsy575Qvc3d/MeFu84YL8sRbt5XUdIJ7Cg8IpCyNi4I=;
        b=vpoaZePvDEaGq4N7dppDC+Lq3696Wj/UoW4OVcMoLXHYmRXHxET4Ft8pNUS5FKW08X
         UtQBd9bDNAuoHNDlKxhJ2HTWWhMmqFeF1HuLnaXoRSRBhrpPKj5d5g/t4qGSTEaPFSWh
         ercg680+2XEV6Ya/VslUG9YWK5dfm0Pi3jqYHQAi5s0w1nWNB3zJEWx+MB4QmNmQ4QOV
         BTETXTiw2F9mVbmYqOla77kOJ1CYFhxmPM8jOZiZtVUUHhXbocoYT1eB2lwi/HShJsKu
         yRC9zEYOmJGiwVenaY07mls60iZUFwz/GWaalHE4elX2GrcKuvvZryOu5A8ec+1fraHS
         qFow==
X-Forwarded-Encrypted: i=1; AKwUvBwiTNc5G+QzAk+RYkf5awmc0hoIYNGUrVxVZjmCOSt6K+hIP01XU7XkVvD725+lH48ITCDePY5GIdPBffI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8izZfJYJ9KsAc6VQ9Vq5WHZce+HDnExccHT1wrynq8gyuK28O
	Dl5FV0FsfCx+WoHyqWxyRltPSDwYVQW4n2/kMZZzTuesrSrbNQpIyUS/
X-Gm-Gg: AYBFou1aaYkTbAp6KPVIZRpg4GWDoMwR/wRhCwG4WEk/SH7j9Grupwrj1EkLb0bSs8G
	Ug4mTQhuUrYgtkehvhVO5H8tX0gWu/H/PGxJwq5pbhUIm/uTa38JLd9zyDog4yy6kw0AK/VCw9P
	FT1Cb0+pJQ4Uo6bagOgMsgKmTnfpuB56BIL5o2u0GBVKgZiUNB3W7lvA7qWMxP1JLogfGI2M9Tj
	uJlmWP0J/FzKBGucD+qSezPNPgoYknVmudUZDqOLyXvKRvxcI4X5w68UbWmCebKhOwa1+zsDv/q
	UiaxESDZvDGWh6GG9RFsVKtPtIJMm5L/GVD0oRbP9+zLVTaOmZObNqvGEaDGZhuft9LqoTk3zXZ
	6SR0zOAerJPyLexKDMTKZE7IcVCcJoGhJAqhj4um8ZRmAAh7VAPSIftjxGyLB1aYtlmXDIFUuZn
	mWpCKH+GzjZciEKUNP654tcRs0MfxToIaLp02UhcDIAQ8Gq+R6JNvurHaIzBrEYpt3FSmTF9i/7
	Uzy95hgpmQPzdxg3oHRcDmyD6D/L1ZfOpe/uTiyzAt8BZClbzTamdq8jN5zMng=
X-Received: by 2002:a5d:6a89:0:b0:48d:eeaf:d2ec with SMTP id ffacd0b85a97d-48e3eba554amr11424295f8f.49.1793086642855;
        Tue, 27 Oct 2026 00:37:22 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:5658:786c:2fea:4768])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm21393430f8f.52.2026.10.27.00.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:37:22 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] init/bootconfig: pass init arguments in documented order
Date: Tue, 27 Oct 2026 09:37:20 +0200
Message-ID: <20261027073719.4010659-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
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

start_kernel() appends command-line init arguments before
bootconfig init arguments, while setup_command_line()
places them in the opposite order. As a result, the
arguments passed to init do not match the saved command
line, reversing the intended precedence of options.

Parse extra_init_args before after_dashes so command-line
init arguments are passed last.

Fixes: 1319916209ce ("bootconfig: init: Allow admin to use bootconfig for init command line")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 init/main.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/init/main.c b/init/main.c
index 27f4cb392349..3a270bb96aed 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1089,12 +1089,12 @@ void start_kernel(void)
 				  __stop___param - __start___param,
 				  -1, -1, NULL, &unknown_bootoption);
 	print_unknown_bootoptions();
-	if (!IS_ERR_OR_NULL(after_dashes))
-		parse_args("Setting init args", after_dashes, NULL, 0, -1, -1,
-			   NULL, set_init_arg);
 	if (extra_init_args)
 		parse_args("Setting extra init args", extra_init_args,
 			   NULL, 0, -1, -1, NULL, set_init_arg);
+	if (!IS_ERR_OR_NULL(after_dashes))
+		parse_args("Setting init args", after_dashes, NULL, 0, -1, -1,
+			   NULL, set_init_arg);
 
 	/* Architectural and non-timekeeping rng init, before allocator init */
 	random_init_early(command_line);

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.43.0

