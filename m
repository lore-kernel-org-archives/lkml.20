Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739213;
	b=C/LW8LDS6JibVy2AhC/n4hMed5k8ShQT070ByAbEjJcOPho/VPgsSqaBQgjMeC0Uks81
	 nHmnpyVGGKmCf3xGQfhYxGRw41fI2KIgQokrT7cYPKLNyclrEU4I0oJhbs4nzTvpcH80Q
	 1tFls5iTXJ8fcKR7TZgoZ1WRfkE+7YI/KuQB+1F6RtFAuXLI/SfEq4Gq09kQCeXgjgGz/
	 f9e8WyZQCm3qfiiivU6MYEWVZNl5gtwbqeswBfq7hqmKGOcQi0hyuHeKiri93pHEIdmBa
	 as1u1mwpiuwnfG5UazLom/w5/mB5GKg5e0beoEcIroR74Vj4R1iyy6e9C/23sPuCvmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739213;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=1er+HG2BILvztOapsYBpIy58le3UOu55avMYSXyvdec=;
	b=pH8yzSeE+DshkCdZxt69fqgcyNCKSM1U0461bL/DLyE3evf41WvSZhFlSFpX52madKDN
	 4v8Z6sIR4o29bbaOkbXMqysHpxzAXIhDmsqEW7GOZ1hJcxQpXMHRDHIyd8fSEHBBrvPA1
	 0DkrRzKKX6v17MlfEgZpn3Dgg6d+APrhaWERdG2/ufaCUEfZYjbc5NM93kO5+yFhHKm+Y
	 QsSoUACtFB0+zRufdUILEMABofzPb6Oar4Mh68YW1rPj37Ma1qIUT0smpeJJyEVIUHPkM
	 C3h/Xe3JJzStokxwz2TWVdtNFQF67NlkrR5FubTrNyXRygjHrDMPfCcWOBkWQK0XkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq5fwIgS;
	arc=none smtp.remote-ip=74.125.82.194
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC61E606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:40:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC61E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xq5fwIgS
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-37600b0db49so3131501eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794739212; x=1795344012; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1er+HG2BILvztOapsYBpIy58le3UOu55avMYSXyvdec=;
        b=xq5fwIgSSnYkDerS3eFasT0CTvXunq8qmhdP3DIedRAZyTNyAHXLRXZqGVgAtE0yif
         oHIknYlEeP15v1zJbXbzXrIOr0u/lfaxAJwvsxcEufCfUWPuUFeJpeZtXqrTyke1Q/Wu
         0IsaFi1wv8wlqjfayIJVfGaSpfGhm+q48Ug0lMeAPX6S6SOgG6SzGQKY7T/unxKsWG5c
         QeSX226phgcmAxed4MUQQSbTrhveE7Ks8rhcGMhuwGRuNCk4qMZbM8/PLa4PoQFrhz3o
         Daz88FnLOcj7cOAvIZuIPl7Uig2yVmj3wJ+/aso+NqeTJ6r9ttdyfLYauu7Iizt7l5bw
         gaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739212; x=1795344012;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1er+HG2BILvztOapsYBpIy58le3UOu55avMYSXyvdec=;
        b=BslXqMf2hFYnueSS6LuT0DHzgegDMUOY0q1FPOepu341aIN80TbZlqH9wwP8V6Zyp7
         EHD/KvDPEhQGlUPkiGreFxEhtHZ0qQzdtj5Bozh0WktB3eguZQs8CD7T8r/Z/8xDuBYE
         lUR8T+8zxn5NTTFZMqJ2lN8JfivjOCoc68MqvTdB7Fu646itK+iI8fYgTD+3iEk5nw4h
         euPvnuk4TwnAEmQvmVB22SU0h64J+Ec3bmisaj/poqU49ljxiTXWLk+8RQ5+kkQArcIh
         y0Mt4/JQutYzE4i3drgTn8Te1UzzkphI7Hmog34G9nIPx716EGfbSN+lEm88dFty0q5V
         DJZw==
X-Forwarded-Encrypted: i=1; AL+hErGEN+QNRe2BUg13vF7xKcPp+AOgtURRg9e25lGAegS5qFJbPy1blL65+pVrnaeBPZR6ZPsdkicElJe5Tgc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8AIKtNaS2CjIasr0QZGOhgtBiVkCjwVcfomDb3IBJ04ZIIyUB
	i+dnzNhZn5/JNNqdvgt5d8jq71SGKtAkM2MH5IAPIR+f0M16nXNNvpa8
X-Gm-Gg: AYBFou15Q63UfLyy2yzZ7WyvntaVOIqAIyUtYy/njf8Hhm2CWURHzXgghSjkYmJBjUm
	Z4PlA5HPz6Y6fbvL2up4qG7C+DQw6gC+XFjc15T0ej/aKUcw77TvZhua7v8WKo5Y0O1+MxCkjxD
	ftu4jMIsWlDAZqwpOwEBRZ1PTbp98J2D2XZMoRxjuOwtw2dwraucr4yjTQIoNeS0VPb4vOnKIua
	W1xr22g075j9L/nSkzLcJl1eC71Nbpk9B21qcpCiendisfXcXc9GshrUqbGcYJWSq/W3Ro9qVU9
	2WFPTee++obnsOODCAkcyfHau6vIXgbYLTnL1P646zKxYKWvYE6twd/w7G5yFmh1hkl3DZJ7To0
	repYYERRVQzL4guKgEqKKiqiFF+MiuccW/lVPm0vV8R3Gyqa1SqBTFTn9uorn0zJe+7ZI13UGBX
	epRwTcfmtHtmf40fCYuP3pkBVcWakTkc8SJdWH/BqGzzFsjtsLpLqEy7sJxEgRpp+/g9BKkv0lP
	MXh6sDnKjY5V/Jvl2t6x7Opb8JfjQoMa4zc5ot9IqGcTYW+BoHn8MTeZOaFfQtWInUS7m0TVaDC
	uVmFmdhYJ9LNwR3Ee0Y4jMOjpbgav3XBKfOMGziWpjNoJ78bglYdM4LlMKyqGIh1vEQrLHzEJv+
	RH1hsM8XsKRMLUZM+IlJ1ff3JW8chrKlOfnU+8g==
X-Received: by 2002:a05:701b:4594:10b0:1ab:cbd0:1c96 with SMTP id a92af1059eb24-1b4f5f1f344mr9022632c88.4.1794739211963;
        Sun, 15 Nov 2026 02:40:11 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031bc518sm21315758c88.15.2026.11.15.02.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 02:40:11 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: almaz.alexandrovich@paragon-software.com
Cc: ntfs3@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com,
	=?UTF-8?q?Cl=C3=A9ment=20Smagghe?= <cle.smagghe@gmail.com>
Subject: [PATCH] fs/ntfs3: disable the 'ads' mount option by default
Date: Sun, 15 Nov 2026 10:38:45 +0000
Message-ID: <20261115103845.56074-1-dennylin0707@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit be310476e886 ("fs/ntfs3: Add basic support for alternative
data streams") the 'ads' mount option is enabled by default, and
ntfs_nls_to_utf16() treats a ':' inside a name as the start of a stream
name. Existing files and directories whose names contain ':' are still
listed by readdir but can no longer be looked up, and such names can no
longer be created.

Make 'ads' opt-in, so that volumes mounted without it behave as before.

Fixes: be310476e886 ("fs/ntfs3: Add basic support for alternative data streams")
Reported-by: Clément Smagghe <cle.smagghe@gmail.com>
Closes: https://lore.kernel.org/all/CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/ntfs3/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/ntfs3/super.c b/fs/ntfs3/super.c
index 29aabdc8a801..0c317cda836b 100644
--- a/fs/ntfs3/super.c
+++ b/fs/ntfs3/super.c
@@ -1949,7 +1949,6 @@ static int ntfs_init_fs_context(struct fs_context *fc)
 	opts->fs_gid = current_gid();
 	opts->fs_fmask_inv = opts->fs_dmask_inv = ~current_umask();
 	opts->prealloc = 1;
-	opts->ads = 1;
 	opts->ugm = 1;
 
 #ifdef CONFIG_NTFS3_FS_POSIX_ACL
-- 
2.43.0
