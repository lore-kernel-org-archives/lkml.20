Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8911F282F1C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788655175; cv=none; b=e0+wQfwVIVptIH0kJMFfO7o20Q8J4hjQDOIi5Dkowo9qVvlqUJvWQYZpx+wc2LUQBCU8CJC3tZ7NC93FuFQmYVYX9cfvlB9xRwNdGDmnXTQvAYLc6aBSFZTzrKcmjCAWTSRU7Ww/MBX2cHwgd4DuF8JoF7571L7mbqc+phZ5Ghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788655175; c=relaxed/simple;
	bh=X/xRmr4GqSFunc+sX8Q9MZBpCDeItpD08dRwHxnF2ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VWM3eT2DV00eA+wYWgMIx+RCadyZGctJvf4jpUiHQIHFE9a5/qqX9qhTX359ZFgJPNDs8lKTckLLMJO4lQu/gvYfH1RvjzLaI+3EmnidWBgFVWeV7F4tz0Nd/PqQqwwCmRxaClZj3e5c95nLzGiwUYSDnnt5egbhYJCZucaeSuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NJiSjcih; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NJiSjcih"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-484392e3d33so1479048f8f.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788655172; x=1789259972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pcaDcOTwZKz9h65XJ4Y1vvTbk/7+OUqBRO3ySthF/ls=;
        b=NJiSjcihjURX2UzkgQzSq0Pdbs8S80fLRnciuDLxT737lprj4ZgGjIZa7bzMwGQ82F
         06zXPQHhwqKGM0NDJx38lNh66UdxcY5r4vGsrY+ogiLSGJmiRkTtSyV+RYRocHYa+Le1
         ZNVqtgVHjuQ1egvl82b25mhwztHmyyE+sf093KG1lKc/wNi02ZMOoA1Adp+xsbM6CKbu
         RGL6ex+R+AotwU6FoewlBSAAXglfxLpzK4pAOrFE0fUTXd4EjAK8r00nPxBJFxmVgXMo
         4VS/L007rRBlhV+0elvufupfp7EA85gOeb8wRGv4qW20U7Z2IVHD4wz+OckoXWEq6xsK
         +aVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788655172; x=1789259972;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pcaDcOTwZKz9h65XJ4Y1vvTbk/7+OUqBRO3ySthF/ls=;
        b=hf2aA7I3i2YtR+DxDqSipO1lcpQNy8ahzoT6LDSsykew5ZZiFU8ZHXPiT5o0O/N+UH
         ycNSrDaFWFnKKOPWCxEwC8+EkiPgwiB37bKkjUBRr3pjLU+SWGbz/feKy2Hhg4tKDZx+
         xiZsoDTD/tk0G+Ri0cjJXtV0OMgIFRRrG0r5v7KZ580RFvVOT5er3YYnl5b0r0CWGY2a
         km6IL+mEN2w5sWeLonZNr90coUMlJwe848B/36u46oeqCThp7GwPhW/8f4D7Qt1WNC2j
         uSyjNHX6q8XvwR6xUIg0KLQ7L+1o/oIvQmq+Ks9f0lGJeD7FJHon1CO2by2mgupEv51g
         jKhA==
X-Forwarded-Encrypted: i=1; AKwUvBwYoJcej8i3QDAQyhkTR+sVjuyOU+gdtqaqVUk+LdvCMxDecZV6lb6+lrVNsA1CUq5b/iGVOIWuSoR7g+A=@vger.kernel.org
X-Gm-Message-State: AFuF++n3d0Mri3CT2vISpraXKGjfr0ftRPRI1wFUqj0tFOf2ly8+Odfp
	Xq30BxfShz3TfbrCE2Sd7d6WwvWUvdf2USxGMB81TiMuNIF69blNjXs7
X-Gm-Gg: AYBFou2+BBpXToix8GL0NioipD0IV26gkl1nRviw883FOXCgr0VzjYo221UQOSPYcgg
	UxQY2ZxKTcgYLupk3ac3q3jbjvztketl/V1C1HmM8rZ3Vp22U0o7tgxNu9x+Tzl4FTexBRGS2/m
	t4W9oWH1jwjzef1TPe4AH9/Zr1NxUqH2Aqktdl+CBhqvZPFcwnuqNFsoPyavxKsVQtJfNmvom6n
	JtiG0WJGj89fI08BRboNQ376c0Kd3Opx02muNOum/yhvBhTzQVlFrF9To6qnL5Phpo7/O4Mhx6/
	7YTGEDHnYhLJw7wRCnmwn5djtMPLPEcEcGIgydakoljebay6xYfLYW+gx+qp/Je3gKNJ8773+Xv
	oiBPF2CtdyRoWmFtSPNubhuYCokui5zW24K9Rl8XxYOoxvDKr9qfM7ECSlGzkglNIvTJDMIVk/7
	+4lqIeaasJEbWDmgLuU+tv3A2a5MkfABvflvPO+mO87ytPIaH6mCmF7rG7xw==
X-Received: by 2002:a05:6000:18a8:b0:485:8c17:975e with SMTP id ffacd0b85a97d-4858c179915mr11914158f8f.32.1788655171649;
        Sat, 05 Sep 2026 17:39:31 -0700 (PDT)
Received: from metepc ([46.197.185.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm17088363f8f.27.2026.09.05.17.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 17:39:31 -0700 (PDT)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: netdev@vger.kernel.org
Cc: david@ixit.cz,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>,
	syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Subject: [PATCH net v3] nfc: llcp: fix slab-out-of-bounds reads when logging service names
Date: Sun,  6 Sep 2026 03:38:08 +0300
Message-ID: <20260906003917.627282-1-omermetekaya0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905225211.596366-1-omermetekaya0@gmail.com>
References: <20260905225211.596366-1-omermetekaya0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

nfc_llcp_wks_sap() and nfc_llcp_build_sdreq_tlv() pass non-null-
terminated strings to pr_debug() using the %s format specifier.
The buffers are allocated via kmemdup() or come from netlink
attributes and are not guaranteed to be null-terminated, causing
__dynamic_pr_debug() to read beyond the allocated region:

  KASAN: slab-out-of-bounds Read in __dynamic_pr_debug

Fix both call sites by using %.*s with the explicit length to limit
the output to the actual length of the string.

Reported-by: syzbot+1e3df0852e82c21ca418@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=1e3df0852e82c21ca418
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
v3: Also fix identical issue in nfc_llcp_build_sdreq_tlv() as
    suggested by Sashiko review.
 net/nfc/llcp_commands.c | 2 +-
 net/nfc/llcp_core.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/nfc/llcp_commands.c b/net/nfc/llcp_commands.c
index ca89fe967d6a..1213946ce91f 100644
--- a/net/nfc/llcp_commands.c
+++ b/net/nfc/llcp_commands.c
@@ -135,7 +135,7 @@ struct nfc_llcp_sdp_tlv *nfc_llcp_build_sdreq_tlv(u8 tid, const char *uri,
 {
 	struct nfc_llcp_sdp_tlv *sdreq;
 
-	pr_debug("uri: %s, len: %zu\n", uri, uri_len);
+	pr_debug("uri: %.*s, len: %zu\n", (int)uri_len, uri);
 
 	/* sdreq->tlv_len is u8, takes uri_len, + 3 for header, + 1 for NULL */
 	if (WARN_ON_ONCE(uri_len > U8_MAX - 4))
diff --git a/net/nfc/llcp_core.c b/net/nfc/llcp_core.c
index cac1b5487064..fda236e4d9fd 100644
--- a/net/nfc/llcp_core.c
+++ b/net/nfc/llcp_core.c
@@ -341,7 +341,7 @@ static int nfc_llcp_wks_sap(const char *service_name, size_t service_name_len)
 {
 	int sap, num_wks;
 
-	pr_debug("%s\n", service_name);
+	pr_debug("%.*s\n", (int)service_name_len, service_name);
 
 	if (service_name == NULL)
 		return -EINVAL;
-- 
2.55.0

