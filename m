Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792840135;
	b=g6EF2ia+TbVaiV6JzPAc9js+1jOxcYJ/OFudWmVc687dCuOenINn3fzzyCJf1M4UTpY1
	 tgdZlgrBrGtSaZw9vSpgMsgwNhrMyzZfje8/qElWhxYcZqC1EhQdjLmjSH1UuRAG49zXR
	 NeNJs2u31dI2JS+yO4xgU8imKDKRB9hJ3J+43oEjCJ98JWiC2A//PrZeu9altb8CG0ZSY
	 PZ9Dcdy5+BG3drzRqSdpHu/W0mPgyIhG7V2om6PjlzG2iTjnO7HXSqjNqAGGAZ9bLJH4v
	 4Uh6QuiG0tRT/aGPaDepW9NW2/o5FAkT2yHsI2sLfZCHW56Qpmevk454oyZ+8Ny6zgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792840135;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DBxoGKJYSm5y6zQZcrOzfKzML+4D53ES05aRi6R6CCw=;
	b=0wKSfngI427OJ+Qzc+0P9jckZcj/u9SmyvHe1qjotmiY5ATMxUxdgXIFcjWPiX9OPgfg
	 AHWIfdUxEhDkQdfqYDhPqkOHseHYyv16cM2Mxzam7saub+RLUfBogXCpu1WWffLyH8INM
	 rqOFlTyKFh2TR5t0PenkfOqKFM7PNNAWPm6jSApMeqbfkJZMgD4B/ZbfhYShOicjYe4WQ
	 1WqJNFO4CFHz3LplrNQBHVOAYaZ1xpLV4CmQHXs2X04U/MolHCa/craq7yyn90rrvzRNb
	 EiAbGj1KaLU0mOacvVmfa4t5KGYSVoFuvgMP0oQbiKSCDTpzdN5XnViTdQ9PGsZOVig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SARMD6Wz;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB721606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB721606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SARMD6Wz
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso970428f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792840133; x=1793444933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DBxoGKJYSm5y6zQZcrOzfKzML+4D53ES05aRi6R6CCw=;
        b=SARMD6Wz2rx8Vsv8nE+p00dE5vyQzy8CodLwc2r2gAKZ3GKNHqLSwYe29oWTtRohti
         avI1p/H1Ljrdmb/1IIb/GbPuwfabK3idcGF8tc3Sr1nARkFW3EP+/z4flvPHPU+uBMx0
         H0EEa5Yk4RoFs+sU4cvdrMHB7Ma1vGGas4DJqlMGCxkljFNGRMOf5exAJDC618AvY5e3
         JZJxc28IDZH+uPXkZcOiTV+v4X6iuHfRbB/MU04wFiQaLXK4RD6OVgLLInUfqh1S0nxO
         XnxeiMgQFbI25QZlUHRh8VnUJrkL5VqN+rjoYinv5v2UChyxfSKanHkIViuvOtjFIOy7
         2aPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792840133; x=1793444933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DBxoGKJYSm5y6zQZcrOzfKzML+4D53ES05aRi6R6CCw=;
        b=uiGfRWdqZCpfh0JwWX7jUWyKXsy+zGi5sk9E0rs62Rmb3x1jRXkkNIMfm+9nnlyLhw
         89jTK/V5dAM13vtbhMy9lJFGaq3KCuiVJrXjf7mPsNsLJ6h9Tv8KK9NMIlpPq2a+tk/+
         IOp7cI0Zqmb5qsw4d+NsDRyKS3eobXo10xLJ8qsjjE1+y8oXqXZ0v7dHHOCXH6TQZpsq
         HAoCjHp7PaG0cWhsxPMC4MzOCSvs/bR1mjeeA7Tk2G5BHXADV65pCf0OxdNkO0dWNn9g
         LCMtMKAf1NIDGYDSlB7yBVgFQXC71Sln5sF1lZzpktOZEEXFk2inz8IKYeh7TM6Seaxq
         hGqA==
X-Forwarded-Encrypted: i=1; AKwUvBzVHX3zYlZ+/OClzJ9vuzZ8dUmtV3MjLut7Y35EVQDk0sMyFElMKbZg87AiItZT5a5oemBjvwhSH9J9TK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6TA2PkNvjUcRZnUs72wbBE2F0Z7z7FFTKG/Th5uDxKDdgJvX2
	avtEyoyuPkFea4eALrP4nCcUx3go97s3k2cgI8xCFn2vMdJ0QMne5iXi7KtDvV6Lv6g=
X-Gm-Gg: AYBFou3nbSlOaN84RQHgiFqCBPdfJAP26Dw/Uztv7s3XbfgVoMUlOXxKJYwo0KWWlxL
	ECzLVIByLV1TyhmbwJUqd2Oi5gGzAfISXjSDUu0nVQSPo+ktIcPKo6tKBt6dNjECTV5lhYQFgwu
	DyiGEcTnzlmQdfgTO47ompbO37gWPgcKocmm3eV7FeBdY4fOg/oDCQp2BIWMgeTbMArR1jQYQn7
	Gp/2MCstEWxc29Q43+je2bxIBWtqCqNBD5olfCxY95CvxcC8gbZ/6WUX6G9Vxp+iduxq8K8hJw9
	50qk0gSmxMdZ0MEri0fBN9ee/hP6sirS30+jEmq8hPdaJS7DThSgpDBcmaGRckqkyLo9TCfSjxK
	S27QiXBvg9ZwxGUep3y9FMmqg+45bOCOfe8r/GOgKSL4y35+pYJ2aWjVl0HaFt5wkNQnAI1WUq6
	eP8H7JELLe1P6XL9Yw+LYIYSx17+Epc7BDZy6JPmGnlDzz2Nw1ljwYHqedgR18YMehe9oojY8DG
	SoHSWDsyZJ4z6k4sWIauldtObi6r3Hnhb0etPCYMqKZd2l60qIIOldDnUM92xQkwX5e4mj2CvcQ
	gbdrjTvxaG7pw6QdeQ8rLEF2T1Ko5OHLc+bIwMSWo6ap5Tr0HD+W8XQsqrg7FcYkKnT61Scuxtd
	2271PzZj+GZyYN/Em6KDv0MMwo2LYONxRcUHOG91vh31o0D/dpqqe91DOHfqhfsEMkz3sDkTgsZ
	beUooHPkHZ
X-Received: by 2002:a5d:4642:0:b0:487:2777:6354 with SMTP id ffacd0b85a97d-48e3eba05b5mr1690355f8f.48.1792840132867;
        Sat, 24 Oct 2026 04:08:52 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-2477-70a4-825f-3684.rev.sfr.net. [2a02:8434:fda5:4201:2477:70a4:825f:3684])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3555sm3575035f8f.42.2026.10.24.04.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 04:08:52 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools/bootconfig: Recognize underscores in histogram variables
Date: Sat, 24 Oct 2026 13:08:37 +0200
Message-ID: <20261024110837.696216-1-edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The variable dependency resolver in ftrace2bconf.sh only recognizes
letters and digits in histogram variable names. A reference such as
$start_ts is read as $start, and the start_ts definition is missed.
The consumer is repeatedly deferred and eventually omitted from the
export with an undefined-variable diagnostic.

Include underscores when matching both definitions and references so
that valid histogram variables are resolved and their consumers are
exported after the providers.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

The histogram-variable documentation even uses names such as wakeup_lat
and us_per_sec [1]. These are valid in tracefs, but the exporter cannot
resolve references to them and leaves out the dependent histogram.

I tested this in a temporary tracefs instance on my Ubuntu machine,
running kernel 7.0.0-38-generic, with recording disabled. I created a
provider histogram defining start_ts and a consumer using $start_ts.
The original exporter reported an undefined variable and left out the
consumer. With the fix, both were exported and restored correctly.
A separate pair using ts0 worked in both versions.

[1] https://docs.kernel.org/trace/histogram.html#histogram-variables

Feedback is welcome.

Thanks,
Eduardo

 tools/bootconfig/scripts/ftrace2bconf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index f8f288f90c74..de1d387a8efd 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -88,10 +88,10 @@ DEFINED_VARS=
 UNRESOLVED_EVENTS=
 
 defined_vars() { # event-dir
-	grep "^hist" $1/trigger | grep -o ':[a-zA-Z0-9]*='
+	grep "^hist" $1/trigger | grep -o ':[a-zA-Z0-9_]*='
 }
 referred_vars() {
-	grep "^hist" $1/trigger | grep -o '$[a-zA-Z0-9]*'
+	grep "^hist" $1/trigger | grep -o '$[a-zA-Z0-9_]*'
 }
 
 event_is_enabled() { # enable-file

base-commit: 22ab3094befd6ef37135e4a252c0da9cd755f75a
-- 
2.53.0

