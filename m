Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794265429;
	b=FS9EHjf57iqWEDWYXGpd3MritdYUuQrTv3juOmeqRsDYqSSNWb2FOPQoFY7tYQV8m7W7
	 foLJC6oVC3U3eJ2so5BbHVor/FWPzDzKKOY2AAH+BDhKD4Zg9XE62rXtZYhbUDqFqfhkI
	 9cr+pknSAqtVfl5h+YAvjeRqGB4/JFWwUu22ws9EgvaERaIiefJPeK8uqBNFzW4yeLJva
	 gBHmzN4lsUUOglTvUxWcEKsnIaaFikZ8CAGOz79+aoyyidDpoUInhQ6ro2iPZnt5gQFO4
	 y1W9NC7NSGUKX5hJ51dS8GDwY6/qsnEG4et+v3pQQtSRJzGVTEbddsQSY2ksv8BG9ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794265429;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=av3WRFVIfYOqlxtYCbtCUVyRZTi6ahIEMlQGBL6IcHk=;
	b=YOGjt792bhUy2mINYu1qCsZoSaVMQMKEk+VKN55JaBbV+LfM0xWI4dPlaAjmIUNC8UtH
	 4pk4wVosUoTtwu1DGTf0PNbFp28veb/tSqF1ipqKAGvYy4fxnTVHsReddJ9a6G2zPBOq/
	 Hrv7bax6VRiPzcaoDHRGJDEsVGY1ynf/7zUvTjI86fF5uij/QE1Nu0KSPpfE20WK0kORi
	 UGgaSXJhKOXc5aOF4xO+llJNtfGFMCnorAX8TzCBQUBI0Xv5M9fZZeSBHPT2m2kKU3pZQ
	 ZhjQyr7nKpXcAqlT6FmCm61zYXwtuoq28OLIcU2HA/4D1Kfu5I5UAbt5Xi/CNptxqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Ul2/H7PT";
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38544606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38544606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ul2/H7PT
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5365e86c939so1119401cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794265428; x=1794870228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=av3WRFVIfYOqlxtYCbtCUVyRZTi6ahIEMlQGBL6IcHk=;
        b=Ul2/H7PTQHZU4/4J3TdO9pgaWgdh9x5pgKCAmfi1bvLen4mPg1gEyDDN2b/VoFf+fx
         /wByzrCct5JucAi55IogVhtPjf57rIDiTsZHt24dH5NLLmTR0OR/PBv1rOxY+dcGvhgM
         Mpco9DO5l55ewLEKpLR+el31jYdBNWWW1IONhJ9f5sFqk/dMI8lLBsreRe/JEdTu9hO4
         bETthDF4S4QM4S/XnsDvvCyEDezaPHNvT3OF9y0XVz7jD4VjV/fn+F9jEFjQbH8MXD5o
         HZ64as2+rKOgEbd69TqAQrhLqvbPG42NiR3EcgLvY++gdnuHHWAKRNwzSDLpLCG/e+gn
         LnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794265428; x=1794870228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=av3WRFVIfYOqlxtYCbtCUVyRZTi6ahIEMlQGBL6IcHk=;
        b=MFXvWctf3AHpXk/3BmBSRLpXRkeKK9rqMcGtAaP+a580cppU6u25aZPXig9446css3
         ZVGMM/Tbrnn5cfVIqyg1mn3JfXQnN6qb4WcIAGIeXo1BtnlQptsvNmqNgTnHYdqTWjU9
         q/HU3XyIZ5X2YcJjoUb++r7PsFzvP30gLH5nBNUPiYv67cGyPMkcvfY2cYfZUwi1GojB
         RD+3XGaucHYrRqHalp+tWSult6k4am0f4CAXNriasSo006q5NtkHCfVQlecXzDFPhtkn
         iCUR6WFmifwQR3/kYJSkJCthCKUkNyzvhOfME851mlPH9TGJtIKNV4wi44GXsKYII+Xu
         hNUQ==
X-Forwarded-Encrypted: i=1; AL+hErElwGGCH52F6Nn3SEO4WAwpz1vugbAUIZo26c5bn8tGORu01HWEi2S+8HfXu5AxrH7K6d0UosYOUyixJqg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/8ELvmpoX6LAXLPKjR6FKsDTu0HnyE+zsyvsUTTjCVAqgyK69Q
	ILezUMzWY/Tu0pzAMQwnUsFlXCqfl64vvL0qt94QIusOjQNjWNxPt2Rk
X-Gm-Gg: AYBFou3eFoVpeyHVCqH/9DGADhFBei82SvCxgPssPplgyT4lq2NVNtjx2iEliLX25So
	CGMvCeSBNfehtAk8AlUAZgBbBBToGc2c/XXvnnON0iIHSIvFRvb3xPHd2vDdiq2ZRHtDkZHGszD
	konyl5eGt5At601P1h3jlDa0hdLX8vHUG2tK2ZLOUS/2VgE6kkduHceEG90PJfieOvYK2RRS9Aw
	ULu1lxWSGx5Cchyc+urEttqjtjePgBo6XFCRWQ/E5mOUvLIYuCTB+HdRXwX1GmkBNC+wep970/i
	WpgJIvZRw6wW9Iv946oNiQiVSG6WNt/xIyChgyrJ/ERogzjsX7c9CweKKeEsYK9CySghPlMs4HK
	DHSAxoEcrr53bK50jZEasaKsuVSAPf2ki8VKUYQQVhx0UmXgaWi95s3BRvHI4ET8FsA57gs/Dp/
	Wj96g+caH5xPi8W2Mlye6BemuNWqgckH5DkrAZROYi9H0Y7TDaj+E9QxrRz+vDnggrgwy5TxLGr
	+FQXveOPKdHO6nJD8lAJf90EEvPrbgV7peQKyPb0s8DtAJiE8T9yVGgccs2pu7RSkQBv8jhcC/c
	GE0kJEN0Ic+2X/sfRUI7Sly0yQSkzJHxlJY1uEdca4Pe/Q==
X-Received: by 2002:a05:6214:d6f:b0:91e:81a3:d459 with SMTP id 6a1803df08f44-91eef96b9e5mr23941996d6.3.1794265428066;
        Mon, 09 Nov 2026 15:03:48 -0800 (PST)
Received: from yaozhao-prestige14a10sc ([198.58.190.97])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef051dc53sm7031306d6.32.2026.11.09.15.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:03:47 -0800 (PST)
From: Yao <dragonlinux@gmail.com>
To: peterz@infradead.org,
	mingo@redhat.com
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	linux-kernel@vger.kernel.org,
	yao <dragonlinux@gmail.com>
Subject: [PATCH perf] perf annotate: fix annotate crash for fused instructions
Date: Mon,  9 Nov 2026 18:03:14 -0500
Message-ID: <20261109230314.627013-1-dragonlinux@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: yao <dragonlinux@gmail.com>

Function is_fused tries to find the previous fused instruction with
the current conditional jump instruction in the annotate_line list.
disasm_line is the container of annotate_line.
The annotate_line list uses list_head and the head is in
annotated_source: notes->src->source which is not an annotate_line,
so it couldn't walk without checking the list_head.
If so it will read annoted_source neighbour memory mistakenly and most
likely cause crash.

Fix the case where current instruction is a conditional jump and it is
the first instruction in the disassembled list, the original code will
walk to the head and treats it as disasm_line which is not.

Signed-off-by: yao <dragonlinux@gmail.com>
---
 tools/perf/ui/browsers/annotate.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/annotate.c
index cf36b5347f72..07449944fa2e 100644
--- a/tools/perf/ui/browsers/annotate.c
+++ b/tools/perf/ui/browsers/annotate.c
@@ -155,17 +155,26 @@ static void annotate_browser__write(struct ui_browser *browser, void *entry, int
 
 static int is_fused(struct annotate_browser *ab, struct disasm_line *cursor)
 {
-	struct disasm_line *pos = list_prev_entry(cursor, al.node);
+	struct annotation *notes = browser__annotation(&ab->b);
+	struct list_head *node = cursor->al.node.prev;
+	struct disasm_line *pos;
 	const char *name;
 	int diff = 1;
 
-	while (pos && pos->al.offset == -1) {
-		pos = list_prev_entry(pos, al.node);
+	/*
+	 * backwalk to the nearest neighbour instruction till the list head
+	 * instructions/non-insn are ordered from head to tail
+	 * head is not a annotate_line/disasm_line
+	 */
+	for (; node != &notes->src->source; node = node->prev) {
+		pos = list_entry(node, struct disasm_line, al.node);
+		if (pos->al.offset != -1)
+			break;
 		if (!annotate_opts.hide_src_code)
 			diff++;
 	}
 
-	if (!pos)
+	if (node == &notes->src->source)
 		return 0;
 
 	if (ins__is_lock(&pos->ins))
-- 
2.56.0

