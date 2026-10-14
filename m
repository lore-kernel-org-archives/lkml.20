Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E16C525A77
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791985232; cv=none; b=ElENXNU3HBQQKM5V12Ut1Gkj8OtwJMGKib/7aD7B4FL/uoqeLc8Dxvq1K7y3dovj9ntrtGEFyf9DimvX5nbb7RDfLX9u+xQ9myrg8L8sTCh6PD6UmvAHbr/Cb+aOUF0VwdWqhT1gNqaVOf9y17uq8S9K5wJYgQxgOFMXvolryjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791985232; c=relaxed/simple;
	bh=hydbCaab/EWyoVk3da0dXjQ57V7LhZsKsoKJ0wzAONY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYfANkGg8RGOkuetLePYgcELylKYpXR2jgoHhowTcQVlzVGnzActjpLFe90OO302eew0OO/+F38O9uDA4is4ZKpf5ipHvhdj88pHXDMwzWbtA4sfs0Uo8sj+7uH3u/iZWpEdqTiQMUIKVDg+J4rMNf3h6k0sUahqeDAd7NovHcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1X+pYIl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1X+pYIl"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c02782159so2532553f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791985224; x=1792590024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n2B7ER7FYHITix5EMYlnelspg6YZbJ+Fz6NOFFuDdLQ=;
        b=m1X+pYIl588AdWfAAoWmtefNPdqEQXATnk6q1Gq+oRBKMtoS9xc6zAeLtnlq/Ut6VV
         kn314GJ8EWgy4CTYGE86nQhWvl4a38DXxH1wQb49QJ+X+sC2ppFJJTmAYOxEuTUtl70w
         Yr8Bnkf9/R1y7ImlRJnjMJGGtca4Trs3bNB29A/nTjr99a710reiGw4IScqbotd+yjAm
         8TL02ALLaFtQysi6To51k4uyNF84LsqVoFGVmKTVmZaflaiy06RGYlCEmHyjYx9u9u9z
         y6mzHX+7s74Gg9teZzW2SqeFWeyx0haMEVNsV0Jj5S7wcU0OT+f+s2NtLeMO0cRFkqy+
         Olrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791985224; x=1792590024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2B7ER7FYHITix5EMYlnelspg6YZbJ+Fz6NOFFuDdLQ=;
        b=tfjQFz3Ns29Vg+MM4H8+C2RDZhGUEELbu0GUMvxZWYGFJWxxApXEssOTONYAj2aAdp
         45BgE31lRSjbZn0QE0i4Ie0ZtETNCBTqBScvXIzvIBrT8FaFcn8HiMkRtQBhQK6moMb1
         WFILfX9KXh5VMi8HsWcFgbXgSclHnMS4vzn/C8vcvJ5mnxFMzujYOZaXe78tA4mOpOBZ
         XDxd4L9ArtgAZks4FkwphRZ7hN24gXKwcuLPFPOHCyEzEuC4eAx1TVu/ROiQNgFoKBy6
         QQ6Soz4CmvP9l8jGJWVGQpVFe9xIwRnvSUdEZUc/xoEqCw1FO6uPK217nlWJdfDDi7E1
         +OdA==
X-Forwarded-Encrypted: i=1; AKwUvByzqHlXL5eRnwy1jrnEiMyOVTnQduflxszW/TvI3tZAOcvGIxWE6EzZB3saAD5d0gSs2SxtGd6WTTPxpVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKbLdipdPXLbHQvv6uvHLQ6X7V1eMG3cTua7cagvRboV7KZtxmV
	58oOyRvtGltyAXl3EuJ1brLeOZQ3oYRmzIQzVBSB45yDgRzjsH1ly7YV
X-Gm-Gg: AYBFou1XAL8h9RREiQIJwDTExgi7mqLv6f8VQGnXOxpY75iiHb4VcIImYAHU3z2Om79
	NzYVUSxzrYRwoH6qxsdWOFwh7jN2GDpUwp7bgK3PPEAFUwp5UNgOhSbQeWQEKPQPZXs8qSRNL4M
	eIDOmog3ECBIpyMPJ1k9aZgaUcuN3YpYpF+5aSo8vnptQpxAfvAI+bCLIqFBao8wGzd96dZGopY
	9kTSC5As8nrsRR88kZR5B4LExoPOKOJGfwpeVCffjN8h98jhCBlcJwshgeBiCZp5Acp+w0/1CSy
	oyNWkp2wn4LqlqJ3Nun6SN4SmlMGQnDjYZbpjfsL1vhoH6O98c/2Nv5pYZas4zh/6ySHlEZwG7P
	XtXQr99ymFJVxDwi7g5VibVOnGNCiQKvRB1UFLnRmALFt2ywxwKiR8C5HEXm/mw8GrYfsMR5PsF
	mBZnkEhmbmabEYLEOWLx+k/dxyhsfoCAbesFNzNODFRtiuiq4OMpqcm4uz7wMmpddRlBJi3h86i
	ge2WeVzRQr8h9moKKImRpqhVAuLM/L0rvSWHzhCiPXmSNsIUsXozHJJSmx+j4zv95ppz3/FiQ==
X-Received: by 2002:a5d:5b87:0:b0:48c:5c2e:434d with SMTP id ffacd0b85a97d-48dbaae84eemr23223313f8f.21.1791985222697;
        Wed, 14 Oct 2026 06:40:22 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac52d3sm12036009f8f.43.2026.10.14.06.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:40:22 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: n.schier@fritz.com,
	grahamr@qti.qualcomm.com,
	rdunlap@infradead.org,
	nico@fluxnic.net,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2 1/2] kconfig: add prop_err function to simplify property error handling
Date: Wed, 14 Oct 2026 14:40:16 +0100
Message-ID: <20261014134017.2310819-2-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014134017.2310819-1-julianbraha@gmail.com>
References: <20261014134017.2310819-1-julianbraha@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As suggested by Nicolas while reviewing another Kconfig property error [1],
we can add a prop_err() function to simplify the tracking and display of
Kconfig property errors.

Note that the formatting of the warning printing is changed slightly
(adding a space) to better match the formatting used by gcc. This causes
a change to the expected test output for the existing warnings that call
prop_warn() and menu_warn().

Link: https://lore.kernel.org/all/20260917-proficient-swift-of-masquerade-0ff7ce@l-nschier-aarch64/ [1]
Assisted-by: LLM
Suggested-by: Nicolas Schier <n.schier@fritz.com>
Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- adjust warning and error printing to match gcc (Nicolas)

Link to v1:
https://lore.kernel.org/linux-kbuild/20260922163749.2031594-1-julianbraha@gmail.com/
---
 scripts/kconfig/menu.c                        | 27 ++++++++++++-------
 .../tests/err_transitional/expected_stderr    |  2 +-
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
index bda3e2650216..db5ba57125c5 100644
--- a/scripts/kconfig/menu.c
+++ b/scripts/kconfig/menu.c
@@ -43,7 +43,7 @@ void menu_warn(const struct menu *menu, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
-	fprintf(stderr, "%s:%d:warning: ", menu->filename, menu->lineno);
+	fprintf(stderr, "%s:%d: warning: ", menu->filename, menu->lineno);
 	vfprintf(stderr, fmt, ap);
 	fprintf(stderr, "\n");
 	va_end(ap);
@@ -53,7 +53,17 @@ static void prop_warn(const struct property *prop, const char *fmt, ...)
 {
 	va_list ap;
 	va_start(ap, fmt);
-	fprintf(stderr, "%s:%d:warning: ", prop->filename, prop->lineno);
+	fprintf(stderr, "%s:%d: warning: ", prop->filename, prop->lineno);
+	vfprintf(stderr, fmt, ap);
+	fprintf(stderr, "\n");
+	va_end(ap);
+}
+
+static void prop_err(const struct property *prop, const char *fmt, ...)
+{
+	va_list ap;
+	va_start(ap, fmt);
+	fprintf(stderr, "%s:%d: error: ", prop->filename, prop->lineno);
 	vfprintf(stderr, fmt, ap);
 	fprintf(stderr, "\n");
 	va_end(ap);
@@ -246,18 +256,15 @@ static int menu_validate_number(struct symbol *sym, struct symbol *sym2,
 
 	if (sym2->type != S_UNKNOWN ||
 		!sym_string_valid(sym, sym2->name)) {
-		fprintf(stderr, "%s:%d: error: '%s' is an invalid value for '%s'\n",
-			prop->filename, prop->lineno, sym2->name,
-			sym_type_name(sym->type));
+		prop_err(prop, "'%s' is an invalid value for '%s'",
+			 sym2->name, sym_type_name(sym->type));
 		return 1;
 	}
 
 	if (!sym_string_check_bounds(sym, sym2->name)) {
-		fprintf(stderr,
-			"%s:%d: error: %s constant '%s' is outside the 64-bit %s bounds\n",
-			prop->filename, prop->lineno, sym_type_name(sym->type),
-			sym2->name, sym->type == S_INT ? "signed" : "unsigned");
-
+		prop_err(prop, "%s constant '%s' is outside the 64-bit %s bounds",
+			 sym_type_name(sym->type), sym2->name,
+			 sym->type == S_INT ? "signed" : "unsigned");
 		return 1;
 	}
 
diff --git a/scripts/kconfig/tests/err_transitional/expected_stderr b/scripts/kconfig/tests/err_transitional/expected_stderr
index b52db4f680f4..ba317850c043 100644
--- a/scripts/kconfig/tests/err_transitional/expected_stderr
+++ b/scripts/kconfig/tests/err_transitional/expected_stderr
@@ -1,4 +1,4 @@
-Kconfig:46:warning: config symbol defined without type
+Kconfig:46: warning: config symbol defined without type
 Kconfig:7: error: transitional symbols can only have help sections
 Kconfig:14: error: transitional symbols can only have help sections
 Kconfig:21: error: transitional symbols can only have help sections
-- 
2.55.0

