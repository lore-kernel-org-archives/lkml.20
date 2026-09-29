Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A285519E0C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790683652; cv=none; b=hOLkRDL7eJjfQPsDLxmassJYCTGQIGW38w4n2C+gj5qSlQT2XVlZ0rJ3kRWeka9VNpzrX4oR1GZG7Ftowgo3uvCl6QDKU1QOxXSY2mtAdX/iJ+AshWq5ixW5C4w1HxJ6Qn/FLbkvecwvnlnyGeyHHxPxC/5uF0GyvHfIf8WfXS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790683652; c=relaxed/simple;
	bh=FB6fjG7XZ9ej9ISK5B5YmbddSVmCaLrrS7kKH2voXnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fwjvjy8FN5U2Mi9RfLysZUGYudQJ4iRYa2W5OfD2NPQZGRQJagWWdSujS61oX10mdFzsKlJwXsxLp6tjzVYl317904vuJds7HHk3uAU0tCxEjfj0Hlf+YP5tvQRa5VfATqKRRfnyyqKeb/IQAyFHAVIUfY4jnbHBiVGmPWGgf9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OuWpsHWL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OuWpsHWL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so2331195f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790683649; x=1791288449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2RVL5cQpzx42xZUk3SCgnlRPuoRijtWKagfjtofMiIc=;
        b=OuWpsHWLnid5jiDneDSzrGn8Xd/xTT4bAuTEIt9prYgGrgOXrxyM1nc5ZZlQcA2U3R
         akw0/J0cKOW0miFC1KNLmOHVB/Ewn7ufrgj25Vh5C8ataVcpcBC1jYkVjFqdpiNgM7DW
         U0s25zhSpEHsltAgVBU5QfoBOluyYuZueebBRvfxi3/qxSpK+kXhfyOM3gy7S0EaGwAI
         P5JAjJSXWIqzmtsfhfLr/E7m+UDwDs19nHwiaR8YVwrUazqNeJ5I3b7tUS+O7OuX53L2
         qPHrL1F0EyLwSpWJJTQfxEFDlsyrvO7EoJB6vcRsWt//oP7+bgeUrQb3giP6mxg+z6Qz
         f8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790683649; x=1791288449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2RVL5cQpzx42xZUk3SCgnlRPuoRijtWKagfjtofMiIc=;
        b=IeQSasblvnbyetAwME3RhOrKIeL1IGTF15GlNrPu5A1PHpo7xbzjSjhv6RigLVKRVq
         QQLUlOLvOHMrETgJ2uqvyTBjXeI87CveqjPjmJ+1rVYeKtl90e58vru5iVUy6onqxCB8
         8rzjO0Ea6zUq368AYC6Pr0zshS2vswPS6Vwi79FP/sjRMO/BaNv20i/dC1DirNWaGCRm
         b9UUORnowfisGCpfo9dVBY0L+u9UUh9Uv9X55CYXdiajLdWpIiOsYXj6HG9EmvoDeBkE
         ZCc2mb/sOInsFr/5oYqVDovRDwJEi6gCkRGdFGcxONFQl3LI4ubTOQOOTwuluI9GD1xK
         1B1w==
X-Forwarded-Encrypted: i=1; AKwUvBxEAR4EjATsw8FUws+qPUDEylouWDzW/71MFN3r3jBwHTcrzMkltP4jbNSZX/wHl4x1AKY1IfxV5PSogNU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRrQJYFQSbuJPHxONYyVPrXP3m23dj9AyMJaq8pEFxKgUwnsyJ
	uuEGlJWJGSuDKqxWzPa6GoExQFlfDkjWgL3haIE9QQprqsLtpMeO+9pY2mohzkwV+c4=
X-Gm-Gg: AYBFou183mByLboMfWLwiFs2XtWvg3vnDMIm+kQ7Ll4xZI0Ep071yfh4nhVOAhCjcvk
	taQnM+jA7ofujwV95Q4ewVuxYpDU5PdygkscRuvPBBjNyc/AaN4ZvOQnqyTXBRuEB726g04RwJi
	6qpVSP+yNHsDb8ileQ67L2rQtKTkypzB6DgZ9uoUVNRtDh57Wq9bpr2HrjsWoPvrKJgr4Czl2f8
	5Y1vzrU6Uqg5zpdTgJb/xMWPWJ8pUE+HLEgVGQeZcAVa0dGs70+MRwfxbpi1bn9jm/26iStv+9d
	G0YA7P85X1FnITm51ckRktoiumL2tU2/g18ytxWXH6X0q4adWnbs3VWwx5xQi1QlwZ1SgrQhEw0
	KpvDYNoFl5L86/ChN95m807Wx2wEzSaw/nL43MK96YyGSfYo6n/Q3R5UQlo9mxVpiwLzcr+bfjw
	WKfVPV314wxjT8RGRpI1TRqmH+534qzRRNc5xOYxtsboLZBbl8C9+jKAqeYLco4JOTN/p3oyLm6
	+oTdZU=
X-Received: by 2002:a5d:64c7:0:b0:487:27f6:a4df with SMTP id ffacd0b85a97d-488716b8a05mr30953798f8f.47.1790683648425;
        Tue, 29 Sep 2026 05:07:28 -0700 (PDT)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af50a410bsm3500024f8f.36.2026.09.29.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:07:27 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Chris Down <chris@chrisdown.name>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v5 08/16] printk: Do not quietly ignore adding entry for a preferred console when there is no space
Date: Tue, 29 Sep 2026 14:05:38 +0200
Message-ID: <20260929120546.328616-9-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929120546.328616-1-pmladek@suse.com>
References: <20260929120546.328616-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is hard to imagine that anyone would want to add more than 8 preferred
consoles. But never say never. And do not ignore new entries quietly.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/printk/printk.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index 0fafc579bdd3..4670787195d1 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -2575,8 +2575,10 @@ static int add_or_update_preferred_console(unsigned int i,
 	struct preferred_console *pc;
 	bool is_new_entry = false;
 
-	if (i >= MAX_PREFERRED_CONSOLES)
+	if (i >= MAX_PREFERRED_CONSOLES) {
+		pr_err_once("Reached maximal number of preferred consoles.\n");
 		return -E2BIG;
+	}
 
 	pc = &preferred_consoles[i];
 
-- 
2.55.0

