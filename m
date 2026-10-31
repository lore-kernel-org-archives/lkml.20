Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793471753;
	b=fxnnR1pDHgGk+X7S0DmjI1cKCaDhcrazDLVqYZTErR17mNdlXItHEXgnjHIqJCe3vcL3
	 JiDnzg1KjPi8QJRIdntW7qdma8qTYpnkLhTVyTUSlm403ciONxuQTQN1bwVGWDsClrVNo
	 LenOU9o9pvGvczfHrOeShoncxW9RXrXi7H00i8XMYv6TIOierkgtoM6GPdVMy4F+04Rx7
	 OOCPjlpYRq6FpzIhRmht1lVnZtqC8kN4opSSqM/UaAzS/NNrFJugOpNmGWCB5uQfpAPTp
	 B7Kyf14o3ez+5L4hsXMWin+ORb890xP250a6hQ4JhQeuUtIuvR87VHikdXhSCtFArzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793471753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uM1TWnDaqn7LCDjuvyUG6xslJ/pzNvqVUkZmu6lToZU=;
	b=yHwemmHzd4TwrMl1xZ+AsQMBkawGu6Bl+TeNivemAmO9LmvTw6wZUPXfxmYnXO9cNosH
	 AqWfcf0WFqmbvje5m1e+6onGHw2NWu77Wz//PREQJm2t/6qBVK7ny6c7EWRPETf3yCSQX
	 6If0hHPtz68/Pu2NuS8ZDIgkx7zgAkKWMIH23bQQd4HvoyfvJoTEV2JmsiKvMDrsHnkeZ
	 wO45m4CBAuAHFIHZhirjQFTH10DvPnROFvQJqCBYP2RFNBaFf1Qx7pPQqnOBQXXVKoEyw
	 w0N5V32ZJ4oSupweStTWkSlIBbjaWxoqZM475RRXeeAg9PDKGVcqDQRDI4NA0lbXuOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTVqTvXO;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160EF606A32D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 18:35:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 160EF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NTVqTvXO
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so16159065e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 11:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793471751; x=1794076551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uM1TWnDaqn7LCDjuvyUG6xslJ/pzNvqVUkZmu6lToZU=;
        b=NTVqTvXOJEefS1SAYjWb/RbX7SxkXrl9MmKpyEFsV2YUyRdNUOH/uu5b3WCgoa4CVo
         nA69LhEoWoQiHS7hXpJB56hIoBP8ao3ZtAvv9UkzW2OpL0XSTga+uL02oOQsi2d/txQ6
         zcU2Mjo1DRubUotkURIV0ra6+kij0u2cXggzAeCUr5gltxZyZZ7b0insg1OH+M8wgcXq
         4tvBJSBYX54tLw4MBW7hl3agtpQuGy33AzUsqPPfdZMfjxj5TCGwFrPWbm9jH2fU5nfm
         H8n6a+XYXA3ghHsWx1e6qhZf2lxC/ext13NV06LdaouqA3zJToVFx6MAmlBGRvCWpPL7
         GcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793471751; x=1794076551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uM1TWnDaqn7LCDjuvyUG6xslJ/pzNvqVUkZmu6lToZU=;
        b=QSYYZiHq4o0aRrcZD3AwTZHFK/x3ziOdIv8t4zAyLY8W9m/RR95eBtzYUgGvra9NMZ
         GVzjrdpyLufqzu2RHS0N5TX/Equ40OhOQKNkV3KA6KnKZK0ERdwYpKxo7iv5RmjmQmSm
         JfM4yq/5XbV5wCdWVkzmnU33hvkFMOaWMEB/rSed0sahnVc0dDXwjmZYmGmYpHtvQ+lJ
         tGEXVVsdCa4FpRvl7R/XtICQYx7bYvOXcxRPChTk6Soje1FH7Uw3NJtLbbwmuEH2VMtX
         SORQYiBX/xHHuN75z4tlf3lslKDjkF+hd1NGQyhOJ6MIfspHgyFPI2SorNPbVOVZHnPF
         tPSA==
X-Forwarded-Encrypted: i=1; AKwUvBwQ4oJik78hakT3SrhY+l+l91CYcfwgEKEulDTlcczmPxEuOhQGpcrtZdiheL11UIxO+WiCDQtlu9C7FI0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKsNzdvHNsdegcxQeH5Ry1DpoxgplxUYnZzWBsccJYsBFX5JU1i
	AfBKSm2f2OdwMVDRMNdnZbnNmhoYAb9bItTJAqL+augBNvXCtEXNkVAg
X-Gm-Gg: AYBFou3CA4rbr5+l9sQZTiugA2fYSxIFUe+IU0onbpFLO+bp0tbgfDLPt4wQllYnQGX
	YMZXrLCQn+dj2/q2p6aGTRtPWnE3TEBPDmbc5g6ldygyZ02CeFzwQHnI/3qy8/tFvbVLMKMXVo3
	J9z4sUYLJG4thCY+fu1dqiLF5I7G+RUz1maHCu9HKcL0E4UvIbLhNcydh52G+mWCNL3QZWvxKZ9
	3G3YE1z5q90OEg7JtRzPwv3vtiFFp/dGxSDMOcjsyEBqUh4H3qJwW2iUfZVGVM+AVo9Y8y96JTL
	rI0gP8gVMGachcw+NZy7ch0zrzYzDCfBdZJ1oRpNYKWefAf6FzLDT7iuVOh9Y49Mw9OCq7m6ziy
	7988TqvVq3HXpNBz6akZBL06Z0NcDL1QSKEs17J6aerRku/nfoaKDOWmhXdivRMMBhW9RsioZ6B
	FJ3mxEOWmKFj/FZFQVzlTxLHh8dMtbu6NZBc6xvfknHpAfhEQ9ItLqeoOj07eaJP7Acg8k0Ab9h
	FNRaYF1ZZ1rj3Hbyuj9Ymex2/4sbKP8hLJJEd2+HxbRwsKqmpr55pI0Ktnq9NQ7JJCvOz3aMo1J
	oC77FFxUZbyJHS713ZhMCakoic4iHOQantI5O+e982zbMi+knEIOJU1f2M+cX83dfN9bQ9b758k
	C1h+AJNiPR5LSAQx3QTgyE4K0wYKtLKWBI8toA6JYKHXUtafoCD/PQBQGFPpysBqNyp/ODVijJW
	zr08tHZxM9NpSuq82EU/nIjJIDBcbjb7mzH0do5+udN1Dp0d0L2rKcVjvR3PgckbCt+R//hhIFw
	s3UWmgwz6zwFpCq
X-Received: by 2002:a05:600c:34cf:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4ac150b3d01mr140074775e9.2.1793471751479;
        Sat, 31 Oct 2026 11:35:51 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-0247-bf06-1f38-d09d.rev.sfr.net. [2a02:8434:fda5:4201:247:bf06:1f38:d09d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm219745075e9.1.2026.10.31.11.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 11:35:51 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] tools/bootconfig: Ignore filter strings when resolving histogram variables
Date: Sat, 31 Oct 2026 19:35:32 +0100
Message-ID: <12880872dd9ffba9c334c3c2ecffca0b45d64b4c.1793471731.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793471731.git.edumucelli@gmail.com>
References: <cover.1793471731.git.edumucelli@gmail.com>
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

The histogram variable resolver scans the entire trigger line, including
its filter. A literal string such as "$not_a_variable" is consequently
read as a variable reference and the histogram is deferred and omitted.
Conversely, a filter containing ":dep0=" looks like a definition and can
cause a consumer to be exported before its real provider.

Remove the filter portion before looking for variable definitions and
references. Leave the complete filter intact when exporting the action.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested literal dollar signs and assignment-looking strings in
histogram filters in a temporary tracefs instance on my Ubuntu machine,
running kernel 7.0.0-38-generic, with recording disabled.

The original exporter omitted the dollar-sign cases and treated text
inside another filter as a provider, putting a consumer first. With
the fix, the literal filters were retained and the real provider was
exported before its consumer.

 tools/bootconfig/scripts/ftrace2bconf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 77ec17c94a17..8ba1a698611e 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -86,10 +86,10 @@ synth_event_options() {
 # Variables resolver
 
 defined_vars() { # event-dir
-	grep "^hist" $1/trigger | grep -o ':[a-zA-Z0-9_]*='
+	grep "^hist" $1/trigger | sed 's/ if .*//' | grep -o ':[a-zA-Z0-9_]*='
 }
 referred_vars() {
-	grep "^hist" $1/trigger | grep -o '$[a-zA-Z0-9_]*'
+	grep "^hist" $1/trigger | sed 's/ if .*//' | grep -o '$[a-zA-Z0-9_]*'
 }
 
 event_is_enabled() { # enable-file
-- 
2.53.0

