Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BB79479888
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791196870; cv=none; b=PypHcAWIVY/phJGwJPoOMyRzfCE0cFnF8EIRSt3adx/6zAJRLRpc11H9T8Gvz+Q9/wkHUwLiWltgiXpL0p4B0uBfK/qmsSyyfmEZHdEhR+EldZkfmNgUOklSjm8xxCbfQuAtryPxT8+ihKd7+V42/wic6bXob3qoatQ1oHiNQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791196870; c=relaxed/simple;
	bh=nUlNpxfQLN1JPu5KxJUeuk/Osh8Oahcn+fOYVShy2rI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kUM+AcaPBy3CRNiu8HYOBjgqM1hgPOwbfBa3EaiEmL/EuLmca3bxQWa0A9oBy7WZH9MyEuU7aLeiHsp1aXAQBPgTLOF4MkYTFWL2SrCBzcQpfaYETsQktPgJnMlEiKmNhwjnxJiog1Rs9kbr4coYdoNvmyZBokaTMYxlpRrGbME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EXQ/SQhw; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EXQ/SQhw"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d8709e0de8so873107eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791196865; x=1791801665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZhHzhhPSH6ZBx9FFnfKGA3Llu0kvfbFvc0BwoW2QhJA=;
        b=EXQ/SQhwCuDC2iKlg5gLig8hVV2JXoiLiYJQqP1HDuPVekjv+XEkuaJw6jESQ5hu1A
         ypZA2KJiJWfr8O0NuRUn91HHCgVXxzGI7KwiVtyXrDpM2/PBAwKCgh+bOxV2CBIrih6r
         Xhf6/FoHzWP6qatIXsnmJ0MvyHZqD24qHq6ITy0DTUOSyu2s+24VRXLKJJ0tFjXn/Ixj
         l184b2fmsJnaD3+5lTkEsA8NLbYveIezAaS8MeJq+L8seikoNSgk2auTObgVML5GqR4g
         ToxeCBjzJkq3NBRcQBjFyXe6SEzxq2GOMxbSk0ozZk58TC1p1erTRaqpRaQMNKScE3sj
         ZCCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791196865; x=1791801665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZhHzhhPSH6ZBx9FFnfKGA3Llu0kvfbFvc0BwoW2QhJA=;
        b=wRYLL8KDfMg25Qy4X3Hj1rKgfnf5SqxHEF9EbcoTL7AKIFYrGOXiTLs1FQEL9lher8
         Zer8MKfC/gPftmjCoMcpXxf6qP3T8yFi/C8yFWWel/VqSEWY3CNuzKOr+ME850VTkESU
         t1Tt4o6jra2aqP7AgNTCtXTHyY7TJzl9APJmnCsvgXEsEpQMxgtPlasWu5g50yRYrqIA
         Y0tFS045TU3gJClQaKWQBqrSezsviD+Ay4WRt+U7qSb9Ha53hl28QGVdfOd2rbihO4K/
         UUhViXHocF80l2aw9LJJsRPlZJTgjC3+CRau5rNp6zlgzVj/3yqDqEphAq7nfUSDnNeh
         Hr9w==
X-Forwarded-Encrypted: i=1; AKwUvBwfw/3UmyfqTYpWTEcvDTv8ZcjFIIWA+2fqq6Amtlj8Uksp5972ijS1eQT0VvNiWtyVQWNHlQlBxq6B2ug=@vger.kernel.org
X-Gm-Message-State: AFuF++kN1pUowUu4XIlYOeddtIE4tHlZF50trZp/jtvWZVklkLx/9YWb
	leTTpd715xH9gxq7LOo8v5roevJeHRHb0VhROOpCSAkJmzrtPaIWQk9R
X-Gm-Gg: AYBFou2q6B8MRnjnKgWaiAIHS9iAsWq1uQZ0Js2HW7Fzmf571rsBnSCBUir2C85vYWs
	+tX9DWvkx6xFCHgVQGR0V31x9c7Nzf6mN7EiQX4gq5xeJ2vJfkzvAtHPcqT9EgOSGKQXMB2gGDz
	ohIwUw+dK6vkYk6xv0fcY/IVm7J3FBYayFSoqzqQ4TDSxXlcgOT5R57iCv6NEem4ls3wIRhPxHY
	piARd/dIbwr6/vYCwiXxIymaV3RkmViCxilz/AT/BWU92Aofxmp5Vab5XP5AvNZVoPTxCu/U7Tx
	ihTePU7/7/8DTrrowq6PQ+x9YDRQEay5xh78VlD86clUOCZv1wNH/0FvfUcagXZkEZ8Gni0unEi
	fQvvOhWRjgI9rCxV8Mp0uLlFtwaCAKSZk5iIdV/ZDwjzpxYH7PcfbBTULQgd4acdSeQaMSzGEKA
	PbQJpk0qRWB3zVLjVa0v/8CNjNVvYGVGyq5Vcamn5nqpxKPfONJsiTD40Cv1hffd1wyCUitweCw
	5RWzEFDOXju
X-Received: by 2002:a05:6820:1a06:b0:6dd:d40d:3ee2 with SMTP id 006d021491bc7-6df35f300eemr6916461eaf.86.1791196864849;
        Mon, 05 Oct 2026 03:41:04 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-49e16ebfef1sm7881883fac.13.2026.10.05.03.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 03:41:03 -0700 (PDT)
From: lzhan011 <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] genksyms: fix infinite loop on declarations with parameter lists
Date: Mon,  5 Oct 2026 05:40:43 -0500
Message-Id: <20261005104050.1786222-3-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261005104050.1786222-1-lzsx618@gmail.com>
References: <20261005104050.1786222-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lzhan011 <zhangleizhen645@gmail.com>

decl_specifier_seq updates the global decl_spec, which is used by the ','
action of init_declarator_list to give each further declarator the
specifiers of the declaration. However, decl_specifier_seq is also used
for parameter declarations, so for a declaration such as

  int a, f(int);

decl_spec is clobbered by the specifiers of the parameter "int" by the
time the ',' action runs. The action then links the parameter's own token
node back into its chain, creating a cycle, and copy_list_range() loops
forever while allocating memory:

  $ printf 'int a, f(int);\n' | scripts/genksyms/genksyms
  (hangs)

Before commit 45c9c4101d3d ("genksyms: fix memory leak when the same
symbol is added from source") the same corruption did not hang but
silently recorded a wrong type for subsequent declarators (e.g. for
"int f(long), a;" the type of "a" was recorded as "int f ( long a").

Only set decl_spec in decl_specifier_seq_opt, which is used at the
declaration level, and let decl_specifier_seq just return the last
specifier. Struct and union member declarations use a new
member_decl_specifier_seq_opt that does not touch decl_spec, so a
struct body nested in a parameter list cannot clobber it either.

The generated symtypes and CRCs for 149 preprocessed kernel source files
(1128 exported symbols) are unchanged, and no new bison conflicts are
introduced.

Found by fuzzing genksyms with ASan/UBSan.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: lzhan011 <zhangleizhen645@gmail.com>
---
 scripts/genksyms/parse.y | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index cabcd146f..7cc0336a7 100644
--- a/scripts/genksyms/parse.y
+++ b/scripts/genksyms/parse.y
@@ -201,13 +201,28 @@ init_declarator:
 /* Hang on to the specifiers so that we can reuse them.  */
 decl_specifier_seq_opt:
 	/* empty */				{ decl_spec = NULL; }
+	| decl_specifier_seq			{ decl_spec = *$1; }
+	;
+
+/*
+ * Unlike decl_specifier_seq_opt, this does not touch decl_spec, so that
+ * a struct/union body nested in a parameter list does not clobber the
+ * specifiers of the enclosing declaration.
+ */
+member_decl_specifier_seq_opt:
+	/* empty */				{ $$ = NULL; }
 	| decl_specifier_seq
 	;
 
+/*
+ * Do not set decl_spec here; decl_specifier_seq is also used for parameter
+ * declarations, which would clobber the specifiers of the enclosing
+ * declaration, e.g. "int a, f(long);".
+ */
 decl_specifier_seq:
-	attribute_opt decl_specifier		{ decl_spec = *$2; }
-	| decl_specifier_seq decl_specifier	{ decl_spec = *$2; }
-	| decl_specifier_seq ATTRIBUTE_PHRASE	{ decl_spec = *$2; }
+	attribute_opt decl_specifier		{ $$ = $2; }
+	| decl_specifier_seq decl_specifier	{ $$ = $2; }
+	| decl_specifier_seq ATTRIBUTE_PHRASE	{ $$ = $2; }
 	;
 
 decl_specifier:
@@ -456,7 +471,7 @@ member_specification:
 	;
 
 member_declaration:
-	decl_specifier_seq_opt member_declarator_list_opt ';'
+	member_decl_specifier_seq_opt member_declarator_list_opt ';'
 		{ $$ = $3; dont_want_type_specifier = false; }
 	| error ';'
 		{ $$ = $2; dont_want_type_specifier = false; }
-- 
2.34.1

