Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8733A3E78
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477649; cv=none; b=nOXkfCgOd6iPaoO7njYGUXCKflZDTrByzj8gp8X3VEPZQVN+MM3VCaVosAvWO22/xHYlBX6IRLWb/rCS6HIRzexjf4PxDLync4gt5XKc3rgqJXZT8P+5Fe+8mte+rmeU7qVaOb3QFhQYk4F1hDxLdPhl8TKXdUUdVdcWh0XDC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477649; c=relaxed/simple;
	bh=nTSUElvav/B7C0i2SfQbJmtMkYgxdqSu9+/cbg/x+Kw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WP4QBPbni+JZCgAF7l5rdoDhLd04dFe0MrbEVu6alSC7LPKH6anQZW5puRIJIZe/BfmsRCNgeI/4Rs7VCPOVSMP4qtBq40GTlCgwHvLhC6OYiQk0bkB0bxquZdlkREhiFuT+D5oZgNAy5GmkB0S3r9nXyIEAJqYfidsHPPwDS0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAsnbnlR; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAsnbnlR"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6cfed5dd083so3912828eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 09:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791477647; x=1792082447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r/1rFcmNXCnnMZLlSh42dy2a0QU3arkNufkFJbf+SQs=;
        b=PAsnbnlRsYzM1X0By8oKwCmx7vQfc+JH9lHAjL1vj6jK5IQ9nR+ZxwuGcE13T8Xrm9
         /+/cthG6zWiYznLJwIffGs6uRotX7wmFobW3o1Xx41BhJveBkksoS7OWfWEsiyrGM+8+
         hzR6rBQcRGlkhCi1T27oNIeYviKpPbbSQm6xh5XYjnr7zKdnQA4Lkcnt7QVZmGF4vsRl
         0ZR3K/KpVxxB3RGAxPZ3+wZ6jbHMPjToIRZ43sAyMntYT01FUiPCTQmc+lRjStFRe4Pa
         qh/0YWgyD/XCrpX6O/kTS59BYmFBkuhY3/go7TzrGHSwPnijZillleNwiEnHyObvMX2E
         /ffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791477647; x=1792082447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r/1rFcmNXCnnMZLlSh42dy2a0QU3arkNufkFJbf+SQs=;
        b=aaQmeO271Qfm3mHY5Gbyb3KuVUJywdVkRPyIaEo21UpsCyq8MJhMAsnZKVzZavXSo3
         NMf+NMXuNrm4fdO7+j3Fi/fZy+udBNn0Qgo9i13gAtVRfwjI9UuJ+GSE7U7x6GK+D5Wf
         c0r/2Tu/qrw+fn+Y7A1HmuIXi1J0a4HKTzXF6Ys8pI+wRhyRcb8rcU3auL+Lssn2TgKR
         VMTw5hwg0gXd00zDVH5AyYtrx0zOxWq4dxLZZ1t3jmz18Zl25Ci+Fd1C3KzsY1KBQrB9
         D9R7qjiTOp1adoFdCiXfJMUINjHJKNWAL+mV2v2oczYRZSKlvbIZgnLwLeMmQjYAvnXj
         zP6Q==
X-Forwarded-Encrypted: i=1; AKwUvBzELO8R3j8pJ+07WPYzGxrqQ4y98JeQsCvdh+XzvAXxxLYKfz1yxNWvUSf1Esxu72I8GdUtU/3Y3DeRJqY=@vger.kernel.org
X-Gm-Message-State: AFuF++nshN7HDNUb8lW26R1imu3WNvddlCSXqBciQ1z+D38X1gXK6o1d
	g7jeeaCAoT4n6v7Z3/54c5UIhHrAKeXQLQ3z/HSgHRAZK6w6mBRSkFJk
X-Gm-Gg: AYBFou1vtDWW/1hEhx6Q7F7Xyb2HQAJQpoFQxRtCf0zbGaBHgEYtcBDbhcRGYE2BiXM
	w+2EqwhMkAFbprirgBv4FGsY5qGXDNKTn/cacpk+T298uIxum4xXre4ptAxrQ7gGN2GqksMIGq9
	0rlyYMq7oZgcuCPbWcXL8MIr7w3z7zwutjfFAg4+boQSUdLnCja+d6shaLliirZ1U2/9DtHXbHZ
	g6zUfY8vXPheKUwG7MHAjMpkR9ZbDvNxKVF/18mpHSqaWcy/+sfrXQTs0x+vdvYis824PapjnNY
	uZfXzXCaGBokavDF7+voMnkjDJbXiIvVWt1QSN6xuNtL6xlyuzX99yK9t4bMc+fqlCvnAodl/1/
	EMC6s4U5HEf15KNefZu1UCH4ZybavoD3ey0zlITT65JqTGev/HIbfoxpd3hs+XVp89rd9LWIgYx
	81/eT/BZ9akMCpYlbHeY5S3Uqfk3MsujIvBi4Yx6sc5ShKjHKyYdcThhEzGTIFo2qpis0/9W5Rt
	oEfiUpF+2V8
X-Received: by 2002:a05:6820:1996:b0:6b1:a812:9871 with SMTP id 006d021491bc7-6e7a65ce1a9mr5282168eaf.18.1791477647336;
        Thu, 08 Oct 2026 09:40:47 -0700 (PDT)
Received: from sheng2080.cmix.louisiana.edu ([130.70.15.5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ee7a7d8f63sm45928eaf.9.2026.10.08.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 09:40:47 -0700 (PDT)
From: Leizhen Zhang <lzsx618@gmail.com>
To: nathan@kernel.org,
	nsc@kernel.org
Cc: rostedt@goodmis.org,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] genksyms: fix infinite loop on declarations with parameter lists
Date: Thu,  8 Oct 2026 11:40:28 -0500
Message-Id: <20261008164035.3668885-2-lzsx618@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008164035.3668885-1-lzsx618@gmail.com>
References: <20261008164035.3668885-1-lzsx618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-opus-5-5 ASan UBSan
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
---
v2:
 - Use my real name in the From and Signed-off-by lines. No code
   changes.

v1: https://lore.kernel.org/r/20261005104050.1786222-3-lzsx618@gmail.com

 scripts/genksyms/parse.y | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/scripts/genksyms/parse.y b/scripts/genksyms/parse.y
index cabcd146f3..7cc0336a79 100644
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

