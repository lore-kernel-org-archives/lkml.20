Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268856;
	b=SdX9mwc8fJ2nsUhNKItuE7KSgsgb0vrI62KByRShfzBrz5OwYbh0FTYuW/sD+5XKi1Iv
	 I667gFghU/0KrGDCuqTBpQ0sYdtOgSUPuwQP2Z72Br1h6AogAMqkGMG0caPtsgsPdDFgy
	 HMyuEm6+cOZ0H5v4ywSSn/Pay6RmZWiEgVgnnNzVsTSbglt9q2nQ3NMVXWvwpqstZlaF7
	 tgZQo9iojJOjIrNGwoiG7A2em/MSKtoQytobF36bUtXQHb4n61CqpOKHRtkNT/VwNTzqt
	 /ZSeJzZhDSbYjqxcFh12KXDIzFcfrWYoWvOWBHfBlHa2nUBmkkwmjTmKmKWj8sqNftw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268856;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C6v8yQiRwIXyjVO4a2RoDhFAswA1B+x9SGkBxm38Q8M=;
	b=Zn8vo8WBUFNnNobhsR9ANqn1xETmRa5jCB/u+4W9oG2B/9PoN+EEHr7ki8Xsr7iVrUzR
	 nJF6KOO/O4B3odZFUUNO4ZjxkRYXZ7GIDmJVmVOhw7VPkXgseX4Ek2t1ur5IEBugLc+ms
	 pm6i4cRbLZLX2fSMx1gKefXs2vHvqttWUA3uo55ocQ0pWSvursVrZ8NNhi70LgpUEtwiL
	 AESnlpcsYcPn5OcMDhjvNOxgdLDXdvfT/wy3/0wfuQTPJBd6jQZQqy4m8RrPJl+tOjCVJ
	 8JBULeKoW+a16cNVbqrsfhh+kRH9g+4Q4q2Gk1ESXFi6GIlVNZYnuPF2g3uxF7S9DGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPJnytAt;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D486606A332
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 00:00:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D486606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OPJnytAt
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-53dbe9b8d6eso1192613b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 16:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794268855; x=1794873655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C6v8yQiRwIXyjVO4a2RoDhFAswA1B+x9SGkBxm38Q8M=;
        b=OPJnytAtrZ+lmd5q6j8qQvodlISbdEptBXRcHBqqmcF6HwF0V3HZzMzJzqmTbLq3O+
         fP18zRwfcJTF7Ax8klYWwgkGSyHJghSWj+1eHnxTYZrCt2+SDtbPoblWDYdfv4V5zZQa
         GXhcRcBUrmLEriYbS11Q2zWio4d2UIDit8p1a3RVxtr5R/lswQbcWH7gKRIXB+nzQsTb
         ncT+uL2KXQY5H8Kepkt1ENSIihkznYwDz23S+FIW4gqh+q/crCMZI7kY7tQwHNnOa6ZE
         E0bdOdkVnmXSoX0EwieICtSLbLULCfHEl6iwJyv/p12pVKhQa1V3SMEkKoSAuTYo/y8/
         yjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268855; x=1794873655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C6v8yQiRwIXyjVO4a2RoDhFAswA1B+x9SGkBxm38Q8M=;
        b=bEa7Yfe+ui7MLobSYWIigR8rlpRAG7SWQb7QUjmD6dTQC4vc5H7wFO/aS1v79sDSYi
         o1xXKaCOidsNOJV/nNcMwO9J8M6Dosz1wjDoCUXcYn9PQi3Ut5iK18oinFWs8l7iQyl8
         XEqsTQPSel4CAX64Iyr+ozDIblGRgW69wcX+a/NkRKF6tIuMQnCkne1r+3qpeI5z040c
         pAPe36dYlEIUwX34PhS+gxptaxAToC4kW5f8S+eUsPWusU3j6R7JsqjRf5Gi2aAah/ts
         0jB6anWvqx9fy52MqwdMj2uQsuRAXaVJ3lEK0VbdvFWWZXFMTw4z5wTLKNOIWoZFDDFz
         tstg==
X-Forwarded-Encrypted: i=1; AL+hErEesJnnggeSf6HxjSOLr2Teg7ILt90N0+zuCuKDGax0Xu4ZGIqLOOJnne9I5Wtkh5KJYOchqnr4hAlAJrk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zXz6re/IdotKGrmHZOpFhhc73gtD+gQ3ziQwPnw/Hyq7H9vHQ
	wMcLPy4U+ES9aRQpknVocd8JIGZdanv6h95ePrKFDxREbs3vi8GHj4KL
X-Gm-Gg: AYBFou10jGsvauGP8VJYl1X6mGn088lnmvUCEq0LXfxHtyZuSsE95M7SAOyimUkDX4p
	WrqOqqj6HE81XSYyXXmJ7MeKLo4m2SzL8ILjVkKjYqNrJ7A3fCVOQ3q/Yyb2H2dKkejLe+4x+Yx
	kK4INK2Qm+rBrA1v011p5rP8+4hufSzMZv+5DesxqX6iuVJACB0uMIB0ObaUZ4PKMwEoWsEva+2
	dXa2zcY2h7f2BlDLJ+SJpSPeAe64kRfSGKSkHinZ/Ob8Do0IxspVosRio81egP2GPXufxYToUZ3
	r1PnMi2BG58C1RsVUEp6Vk9gMc3DQiqFlK/B0Bbj+cejIFPzqMT/oCJCljZ7kC9gAt4W0Ji486h
	wW77drE61ScaWyY/hrW59N74cXzlXuex3ajnXf6kpmY8xqYVOG0kMr8HGKWXEEhG6EtF7jfVxgJ
	7Dav3ls6obrLnWNMA1W/7yIhKd7kmrVUujyPiEoA6ScsHQ1xnldherr1QPUfxvTg875IF7IV2gb
	Uuk53ARrfqRR/aAZZ8yNsQzRUiujHGpkWHeYmG6VvlFaiGCI994c2GDR01zFMUBYRuyJ3QetWYm
	pQRBygn3/t4abdchj9dTF1TwghV8Zx6VZBgJJ6042XE=
X-Received: by 2002:a05:6808:124d:b0:4b8:4703:db92 with SMTP id 5614622812f47-5688130178dmr490167b6e.27.1794268854914;
        Mon, 09 Nov 2026 16:00:54 -0800 (PST)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905735edasm623697b6e.7.2026.11.09.16.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:00:54 -0800 (PST)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: masahiroy@kernel.org,
	ardb@kernel.org,
	rostedt@goodmis.org,
	hpa@zytor.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leizhen Zhang <lzsx618@gmail.com>
Subject: [PATCH v3 1/6] genksyms: fix infinite loop on declarations with parameter lists
Date: Mon,  9 Nov 2026 17:59:58 -0600
Message-Id: <20261110000003.1719966-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110000003.1719966-1-lzsx618@gmail.com>
References: <20261110000003.1719966-1-lzsx618@gmail.com>
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

The problem was found with ASan and UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
 scripts/genksyms/parse.y | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index cabcd146f3aa..7cc0336a7954 100644
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

