Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333979;
	b=F8NWL7LM4RjGa6Be7l8PfGDA7vgmOPgiUO+nYA2YYCKksXcxeEWTOMNZgJd1kaRwhGhA
	 qmDb1T9zfHvGbuxkYgOp0YYZ1iGE+01h7oeMKgj9rTM4Y5+0QkboIyLq8QQ7/Kaahl9dK
	 9k1uG/Mmw3TZzm7HLXBnHGcvKwb3speeHrz6QoKtBo0PRD/Csj/cmnXGVp2Nr4RE/3xTe
	 DEkjVS+I+xxi4f4ju0+oLBzcIo8ZgdhcveGRPIVd7taw8A9rdwAE2L+esaEekah/zqEHu
	 tG73WjdVGnYbeCsT8jv0nVIiGU5ptQmlW9nv2N2kTCQZRiQ9NI0v9SigZf0darYpkrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jkqdsLITYk8zKnoFddRh/o2WJGEOQO1+s840CvxG/Sc=;
	b=jeL329v9qhe63DGy6tB2dJHlx6U/4ofo9yPN2jrfEn744x0aNZYmXg14PRBFJH99I4E8
	 k/rtN6smlbuKS0lK3aaT/OKHFWwgDB3V2VAjiUIU18dUacEsQjvg12psXw05fKDr2gXOr
	 oPj+fPp3hYCI+/RdM8fmwk7lvY/+kR7EsKvsr1qvDqnXu6hBa9hkbfXY+U59C/3zpiDDJ
	 Vw9fd4Fqyq8AcHsWtoOseo6Hs5R5KXn0AcR6NwC02gws3Dy9vT4VYzSuqvuZVS4JuGPaA
	 rNNNth1rF+CJG160PLG3iv9Mjgyo3ERkAik/eKoZGEhuSRlOqLPEldmvVb1jzP5YoZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amSO1ZbQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F4606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD8F4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=amSO1ZbQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4b467581b98so21970205e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794333977; x=1794938777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkqdsLITYk8zKnoFddRh/o2WJGEOQO1+s840CvxG/Sc=;
        b=amSO1ZbQHtnTZxNAFRbohBeeOIU1DuaSBF2/upBYkRmkLbe3g2ZoiBDAmZ3CTIuvIe
         7RlKGDSph78lMZPCOW2urdlIjt/8FgOPfD2djcIfed72a8AyQN6kMo4Yvfi6hIcsp1hH
         7c0339aeiGRs08VRlZi6ZvmD3AAlzCfX9xH2HhJnOV4VOSaMv62CyTdsBEEaOnIFrHZf
         XlzC9ZkMVv8xmyFAZsePXZsU9zPnGz7jNd+53IMhbT5NxRg9wwMr13/w7zaoIXywBzwk
         MCRLevSNd9BlELR6ZaQpWskZZknx0MrSTDm80Iw576AhO2x/VJk/ezul0pstnj68Qwz4
         6FNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794333977; x=1794938777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkqdsLITYk8zKnoFddRh/o2WJGEOQO1+s840CvxG/Sc=;
        b=XwANbrtQXyqG0IzClne25PuQBLAXMKVUW9CJ4PoCeck7tTq9x/mgbkmgPB+7Xe0Ga8
         yGKaBNyHo+ZY7oyanIzQzG6zQtzeZNLJwquyVcQ87ow8Fzu9FqSB8rU83NtZBSEkScI4
         3bQAVvKf9ujA4LdgYEEl7xcsaGpkCpThWeDNBdXlv0K/nZGDCNep/h51SUlO0YbjbVpz
         gL/3JROsyCLkrBn55xklcDw7FDOnm+lrJmpdrfAe8c9i0jxVA8wfMcew7uKKEHrCD1Bl
         VEp6NHN22uccUS74B9CAPoaSBR99HkgiHDY5/87uQGmvxKIIaYu7vTGhR7GjFOv4iyV8
         L1cg==
X-Forwarded-Encrypted: i=1; AL+hErHzEyjpx3tmG9WfORxhT4ndZU61vI3XvxjM3STfCr0SxRbMZp0sZFMEiBkPlYAZVA8nRExuCdek0ZZsZdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Yx0sQdXJWT2kZPHz3nTbsExkNfnfZeSgDCwjLED8evwVpBE78
	deVbPAM72v9XQU0MhxtLzjyywXLrlDWjVSuYevpC4A/Rbz9AfNhSlxB7
X-Gm-Gg: AYBFou1L87PGPwwaXpk7tcZ5fOPulxXj3R83txVWa7BUHvWEsH2h8VAY3airWrpCTcU
	Q3X7ZatZvhAgtKNCaQJ35kK5XikMpeu/jr6rhZoYOwab2pKcBUD7PoKS4tdpOWKr1nD2sl46+4w
	Znt9r/M9dzkeuH5Faf/My7AxZYOJkc5x9jt79l+ZNqrf8zAlMKeGLxi1zunvQnDqyHP6ffZS6St
	EsHXWbXc9Sw7E3DHI2RqqATsiZIs0xPawWqI9bLDMgNTqFKFi+HX1ma1WLZKDbyvV+K9p6qjK04
	SmPlgTFqQLRqKKR3ryApLLEvlF9l45lbi5aVIPktGtnGVU+06bc1VZQfM50vFnIPHcuJfhBl2ZA
	Wrpc9gHFPgIG1+PKzfGEIQywi6rPNeL5NA5WOyRVH0iRFEmm4Rvx/QuH10IIiy3My7W8/CQB8Wl
	rBa83W6o1RSktoMW+uWM6NkvvvmIG1eDLanjupdO+Wyfp0ofLMbld7wlWJrfForlYvcaspwA5Bk
	TSVAVaVZlOVx77avitbHECWk619o8wMjZeevr0IATQe7HWPdMLhUH89CTsNJZNsJMGFf3Pet9T3
	B2nFVb90/02Jidg0U85j8xBui6RsGRKP2Tcojj05d6dB1N9fYpREPKY0HkLmJcKAkygUYcUaYS+
	l6x4huegE8sq9VKo6sj7iMGSAmmN7bxKxJttSQLlJaQbLpXJit6BdanwWkZS7QD9cSbHKaHsRHm
	iGfXz2KNTXZfUUBT7FN28BpoJVMg92FX+6gEFzznUEsySrCv4xy9RK3kdivd98C5OZcxcyXnj+n
	1h/pFInQYypar3ZQQ==
X-Received: by 2002:a05:600d:82e4:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ba0234efc4mr66874305e9.27.1794333977040;
        Tue, 10 Nov 2026 10:06:17 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c500asm6270450f8f.48.2026.11.10.10.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 10:06:15 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] bootconfig: Trim unquoted values at end of file
Date: Tue, 10 Nov 2026 19:06:00 +0100
Message-ID: <4ca280f8050ab5313515a5e4e73025c0a9e0f2af.1794333957.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794333957.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com>
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

__xbc_parse_value() trims an unquoted value when it encounters a
delimiter, but leaves trailing whitespace intact when it reaches the end
of the input. Thus "key = value   " has a different value depending on
whether the file ends with a newline. The extra whitespace also reaches
the rendered kernel command line.

Trim unquoted values after the scan finishes, including at end of input.
Skip trimming after a closing quote so intentional whitespace in quoted
values remains unchanged. Add checks for scalars, arrays and quoted
values without a final newline.

Fixes: 76db5a27a827 ("bootconfig: Add Extra Boot Config support")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested inputs ending in unquoted spaces, tabs and carriage returns,
including arrays and appended or overridden values. The checks compare
the parser's actual values and the tool's rendered kernel command line.
Quoted whitespace and inputs ending in delimiters are controls.

The original parser fails nine of the 18 focused checks. With the fix,
all 18 pass, independently and in the combined series. The full
bootconfig test suite also passes with the regression checks added.

 lib/bootconfig.c                    |  5 +++--
 tools/bootconfig/test-bootconfig.sh | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 819685d6c68d..bd071c394c36 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -793,16 +793,17 @@ static int __init __xbc_parse_value(char **__v, char **__n)
 				return xbc_parse_error("No value delimiter", p);
 			if (*p)
 				p++;
-			break;
+			goto skip_trim;
 		}
 		if (strchr(",;\n#}", c)) {
 			*p++ = '\0';
-			v = strim(v);
 			break;
 		}
 	}
 	if (quotes)
 		return xbc_parse_error("No closing quotes", p);
+	v = strim(v);
+skip_trim:
 	if (c == '#') {
 		p = skip_comment(p);
 		c = '\n';	/* A comment must be treated as a newline */
diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index 530ce7e28d63..a2e8311d4d19 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -171,6 +171,24 @@ $BOOTCONF $INITRD > $OUTFILE
 xfail grep -q 'val[[:space:]]' $OUTFILE
 xpass grep -q 'val2[[:space:]]' $OUTFILE
 
+echo "Remove unquoted trailing whitespace at end of file"
+printf 'foo = val \t' > $TEMPCONF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+printf 'foo = "val"\n' > $TEMPCONF
+xpass cmp $TEMPCONF $OUTFILE
+
+echo "Remove trailing whitespace from the last array value at end of file"
+printf 'foo = first, last \t' > $TEMPCONF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+printf 'foo = "first", "last"\n' > $TEMPCONF
+xpass cmp $TEMPCONF $OUTFILE
+
+echo "Keep quoted trailing whitespace at end of file"
+printf 'foo = "val "' > $TEMPCONF
+$BOOTCONF -l $TEMPCONF > $OUTFILE
+printf 'foo = "val "\n' > $TEMPCONF
+xpass cmp $TEMPCONF $OUTFILE
+
 echo "Showing correct line:column of no closing brace"
 cat > $TEMPCONF << EOF
 foo {
-- 
2.53.0

