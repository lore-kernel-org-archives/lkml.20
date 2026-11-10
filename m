Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337744;
	b=P7QVOr5axgsHPEl77ZYnZFinxoddlbaT1GfBSJo0HVQZbeQHbLdVJTSqU9/2+Kqoy+Ka
	 dBFhxUaw9djEF8x6ZMWH9r6A4Kl8UsQOaLOOF9SVV6NOnMhMH0UkXaTJEm+ASBb7Ld8dN
	 OA1C8gYuY8HBN5FAElv3qmfK1qRvKzIoxYXAC/jpnF3rRdsxM+C40vESJ16xUx333zmdy
	 YnO75Lf2+LZqyBPCrJVwWjl8GTs89m04FWpWfEzr1D6afgzBxtfEfIzFpmVC6EMsyJdLn
	 oeV2PXX+CAJbSgDlLlLoOySKDDs1MYnXgE5OLiLWLT21Qc8SqXSPo5VpUAQ2aPCOhJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jkqdsLITYk8zKnoFddRh/o2WJGEOQO1+s840CvxG/Sc=;
	b=dsjqawKLYTcdQUiKCfYAanLK7Xdf7tOK7lAyi+9Au9aJ1J3C4gyA+3ikG6XHUEGIzzc+
	 I2P+g2typL5mExWQ8DYiSd1TLECw3ejqU/T3enMynIMPjUbpqHfYqVaxRdKBFVgwDtARm
	 1VPsp/nHkaHIEfWjh/3iF41sHuPYwK5ehQUn7oAp8aKs0ljpRuOPzmikHKGur7zE7c6hE
	 zb/k5qniwt4xre/Fc83rJ6sLNxsq6P91JeUCV0qkLXG1tCMjlKiyQ6DLIMLrrEtb7m0JT
	 W5SIbWm+Y64LGwtZYlfF8hKrO6SGzCAZL4Bph0O01Q0zSyDOhGd2kcerRvEqjHe9yMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8NdEG9H;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90CA60A2605
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90CA60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I8NdEG9H
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so27729725e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337742; x=1794942542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkqdsLITYk8zKnoFddRh/o2WJGEOQO1+s840CvxG/Sc=;
        b=I8NdEG9HiMKXwahr4pjd0R7bu3Z0N2HVz7YIXBo14wnGRo7lsv0CqGXftdCMtJckOC
         JO+bYEo1mIXTAGwE+8p1TAnH78yZPX1dem2Jkmipwq2UAXGPzEvyZgTkjGirSNSJLuRY
         TocCB2LoL++18hJZJPB4jfhBlAx6YiqGA/u+wxXUTj907YqEPX2ekKXnUHdfEvawQLVq
         7KekVHeeTXF+MsD7kZ51MDHvF0iATslCO718TD9ZrdrXjMld5mBkHtqA7caOXA5sE54D
         mjgV4cY8NNykhNnzy7Lk5LeMIzgclWV74e+wYByw4NXoUcoPpIDnj60cUu+AO1lwuAHb
         k+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337742; x=1794942542;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkqdsLITYk8zKnoFddRh/o2WJGEOQO1+s840CvxG/Sc=;
        b=FzSWOcs/TT0tg0MlNFgH0ckBR6HWOvY0qbdKkWL6NU4QAhje71qRhD8AKuJwHESAqi
         AKymkDHMyMIBQ5FluLPQu83t9PtEuXWPN+UX/qdQwkmGSGNoFEl9O1eOsl0hswvQqhyC
         fhVhWDgvwMVp3ZiniMY53WBMS4ohJ8DaOZMzxaweSZIuGiD0ah0gmPr8or7SQukn9XXn
         +N3In5UvjV8qgiBYj4urWFUxUx4Tw1BNWTwZ7jJaTiPKeeherFfusbKmbbhHYTlAsYIz
         A0lYa0OH6nLGYPuSuf3psDqf7qWZrTbuN7FI6viUShKIHatI2NVd5tc4vqCItB8rSeXV
         MSRg==
X-Forwarded-Encrypted: i=1; AL+hErFw+CJHZMFWmWMIw0CNOgNkz+3p3BWhGB4ipzFZtNSCzoy6ZKFyBB0YUiewN6ETOJtSUqXg4QOttqbzuiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tNiUirBSffwTHg3vrOgwiFV4ppZWSAAEqQYTl+88oneJaURJr
	6bWHyks/k6WVwwk3Zv40sWrZ1Kr7WSInUdrG/R0EdT3BUAAVR2xqxKsA
X-Gm-Gg: AYBFou21RnJqbJJfZ/sTKUkblzub0CLyZQk9JfSI0TjZgGZrm8PPliet8ixCNItQH9V
	KCCdUgSNkPKTY73vkpKwowVkfszSIQZCaFGFLOYx3DP3LcStUV7vAjsA5G9sHjpNdgcGurXr9u5
	GEVlCndWOi8QU+jniEUNZ9xLtfXerCDLFsXDCKal36tOrUpffjdUUMcadyKHiHxQrgSbjapwgwn
	0mRcudWZONW8nfIkSdHeCjcVvHueTXZML5WBBFvVUK+NkFpXaq5ikNPCgb+VhqipL6lQbpTxQ6o
	B33wD9BR7l7eF+LnAOexClVrJJCjRMOE2x7aqmi0Ivc3hadP4kQLpW49P6QHdWGkg0kOezhM8AV
	om25Vz5EJFKrhLugmOP5tadzm60tGNgf8XELfGJhnHMwF1zsIPfF3x76eZ1mQZMdeDvpjX1PJt7
	wMMohhnMJYT0UI02xG+vtL+0ZEtw3qzdb71TLLY4poI1dVUOYIiWncT35zoC8bSL+Yn+T1zTDNA
	yaW9I0uqAUROZF136hY+V6oy+7xhLA7K8zvfhyY/vfwT9hDcjPkJWPVa3GKO0oztOfL6Gt7X0se
	DKaC+oWjpyTUW1em3ioeRSJUL6hFtYzu50sVeicCRRisLTKi6v4CoHnTokFsLPQ4VbbB+4RRKWz
	7tDcwke+4DTeY6Rr8/SWljfm7lets4UQNJGJuSlOgsTLx408k9EIatsckeCtl3QhnDte5JddmRM
	nEW1QiOB/p7i23BlFsXbvSHwKSWpCkaMOWdVjduF8s6pAtBz0Z77HXoyjI2pwiEkKp7niiA1zPZ
	5O6lT6KQUE2+d597g==
X-Received: by 2002:a05:600c:b99:b0:4a2:150f:1607 with SMTP id 5b1f17b1804b1-4ba0938059dmr1127595e9.13.1794337742228;
        Tue, 10 Nov 2026 11:09:02 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm4309775e9.1.2026.11.10.11.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:09:01 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] bootconfig: Trim unquoted values at end of file
Date: Tue, 10 Nov 2026 20:08:46 +0100
Message-ID: <31f248f330e716b925add3a0ba76f62826527312.1794337724.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794337724.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com> <cover.1794337724.git.edumucelli@gmail.com>
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

