Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442351;
	b=kttG2Hu2jzO1CQGXdunTlAJS5ShBFmOVrUlDLbN5OJXs4lct7J1TSuBkVTkYVkqWeIt5
	 Fw2qTJV6SH2NOEAlw/0LhkGlkHADD5wfVs+kFaRj7ADGJ/+1BWVrDVNzbNObQ4vsUj3SK
	 6Tv5WP2q8oP58iE1Zf3pqZxXg+CA688T/g3CCU2/MWIPcJ0qiM8FLdEzLOGSeBVdmWe4C
	 ER3PvAIpSTpV3nH4/QLAef+gOksLij3OCHEyeloOOULTXf5cOXFEMIKbFgpolQooej/Yq
	 PcEbBgVSVS5IkyGDHMcYN1lDNsTm00zhveYtkPXIv2VboDbxKQNrUf7QIqcVtSePQjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oeYhlfE7rmhK8ThdtZH/4PQ05A5yeiUNR2Ne6QHI8a4=;
	b=5o2tRgKHzViLpqHRV/XGbKgEHLSpNBd2x0+ZE62rjsT2/e4Ca5mgBj1P5jD9DkeAaoSJ
	 +IBZ8mLkKCgQNrCrZBofCUewecjULPKhaPT7Bu7rE/1P7CvSXvKgJn1sSvQiZwVf7xlj7
	 E/AKWkn/56HipPMZ7RiWC5E+vYBUrM2aoXnS7CMt7xuyGgtiSO16aQoxjPZn5RgaNQhEw
	 iIGuW0fA5muhUB19S40bstn4ORJ0tsgKm1bYAY4l3Os81TgJTMR+Fh41M8t3xSQLjbpGq
	 yAC0gggas+vxzl0Fxg0mjJYQ8IEx+SWYQkksSdlQDwdDSuDYJVcznDaQcVMgslNGKzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PVllOt/M";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C5B606A320
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5C5B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PVllOt/M
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so9439165e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442349; x=1794047149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oeYhlfE7rmhK8ThdtZH/4PQ05A5yeiUNR2Ne6QHI8a4=;
        b=PVllOt/MLnWJ+5eOi1IQ5f20cGfgFzmlHjOgY5yEjoM7FYpCUMomp50i68GAaZCNGT
         KxKZNntyjvq4AKlmXZHSOh8STsZsypNoABT7cDKLDI63xYgtLxp3GokA1zyIqzPkgUeJ
         rT0HQujYWz+rQFbDwlZdLkh+imZ/CkGgm9W2SfyYlAOxp8PTLleiVlscxsNgoo9YNU5X
         5BctWlcchf40Z+fHGjZooptwd2w1F0K39XT3zWm8V+f35c42tkFV+fyveSLjUwgxqU0O
         aXHsZwlPdHt6kRGrdrTgoIyN61scwAs+Ob0UEM/VGJanFPot7XaMTWEkPPCsM0G/F28O
         8Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442349; x=1794047149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oeYhlfE7rmhK8ThdtZH/4PQ05A5yeiUNR2Ne6QHI8a4=;
        b=hiOee9gQNt76wcWwWdG3ILf1gUlNk8xbgAXy1IEz6A2qTiMIYiWCX30cXqLCzXkDXB
         Hdq8xE0em5vU0Y1t9DtBi5mN3pCZAHOnBUM9Thru14WwS0ZnbaTm9CAiO9PQhk3Kflfj
         6+szv3DwJmTGfsjG96JCTi5FApLbpeFU7DRZpQYuipyjpw3GbuO+NZhOSbnwxL7sIVF+
         UJbJtLZmTnmnzrAkhLIMcut/Irmb9rbnI3efqLyyyhoB+t4mI+8yXGKhoa8qS5VhyUQT
         VOuEbR9Qjxk98X79JMLLbaWWnNNJ+MOB/bgcAk2LpedCiDmdTozyUtUoma/fLZMYRW5z
         /Tag==
X-Forwarded-Encrypted: i=1; AKwUvByUfQJmrGaPLHHbz0Mw8SBN5ulcmG0z/yT9SI77MzAW4KY/idr5H9+mJqd40hKSc7SdU9jae3ynN4Pk5iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIToD1p8nKUtm8DxB6SmJ+j7otGw03z7HGuOfDAroPOufTnHXhC
	+6e0VUQYWh5QLhpEbtB6Gp3qIpBUZIjEnmcVbgXgt+2gAAhCh5MKSxzCbL0urEtumybW8w==
X-Gm-Gg: AYBFou3NNnV3ZJ5IdVr8RZs7GOBgUdVC315SIGCkuo6ddK7F2kFPeluutsKuQ3O41k/
	bt7mqvqLzP1ru8Bg0uoNlg9eLKuHtz5z3a7j9lftrQQQ3OKrqZROoVdeNHVcNqTXyXUYP0D4Coq
	mfPM8bODrQF7Lel2cIB56V+WtKFYSUOL/kQUPCCHR8qNqR/S89VK0OuUFJpmj96TwDxYoy1lcvD
	r3gn6GMTVk6E4cOXsxpjdM5Fae3QadlMRDGWR7aKcPPHZ0mgfjotFQ9XUHbm6TtjZiqdsSN1i2p
	K1OKGhKnRQM/ZOvJKCPaBP5npJUF6xbs/pJFa9pgsmv0ASSoWrKfG4atcwioFwSpQDUaavdLEt2
	Qhm61DdfrPTcJDRp4aunGNcjxONwVbqpqOAlt+d3cEuLzcyUlts+RNkpsyNtjEn0qZXeWpTccP9
	oiDn6JPOtmFBUoEPR6cYahxUJL3OJn8wotN4kl2atQn9CSKYwUjdNjPcamYqvAbFcE/MJGzcHkG
	a1ghkEg6g+Ppv0rR0rWA/e3wf0wnxueQ8YD+YHFCE5qe0SpHOWvZRLG4RWH6cEa0ezU+tWrDwK1
	L9Pzl8XdqnNeM/J5Omqvl64nFWlXlKKcOCeQeEuNK4uaYRqTp90lpAk/GVp949r4OmjWkRNfqGi
	mGeuYj0EanUwkwhGTe6slLDnUF0+3oVq8FhnYbbopCPVyQ802jqnmYjNGK5rPoXyNooQez7Wul1
	d7JyDN+4YksQin7QngFOUkdywkLjRp59fN8ZyyDrIe1GjvhwUJj5myvedVCA==
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4ac17ffb07cmr106396465e9.8.1793442349085;
        Sat, 31 Oct 2026 03:25:49 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-994c-f615-42f0-2afb.rev.sfr.net. [2a02:8434:fda5:4201:994c:f615:42f0:2afb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f3229dbsm195363135e9.1.2026.10.31.03.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:25:48 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] tools/bootconfig: Quote event filters in ftrace2bconf.sh
Date: Sat, 31 Oct 2026 11:25:31 +0100
Message-ID: <8cd8a184cf719c75403507c186331d12500b803a.1793442331.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793442331.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com> <cover.1793442331.git.edumucelli@gmail.com>
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

ftrace2bconf.sh emits event filters without enclosing bootconfig quotes.
A filter such as prev_comm == "a,b" is therefore parsed as an array,
while a # truncates the value and a semicolon or closing brace can make
the exported configuration invalid.

Quote filters containing bootconfig delimiters so that the complete
expression remains one value. Choose an enclosing quote that does
not occur in the expression. When both quote types occur alongside a
delimiter, bootconfig cannot represent the filter because it does not
support escape sequences. Warn and skip that filter instead of emitting
invalid bootconfig. Leave filters without delimiters unchanged.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested event filters containing a comma, semicolon, # and closing
brace in a temporary tracefs instance on my Ubuntu machine, running
kernel 7.0.0-38-generic, with recording disabled.

The original export split or truncated these filters, or produced a
config that could not be parsed. With the fix, each expression remained
one value and was restored unchanged. A filter containing an ordinary
space worked in both versions.

I also checked the mixed-quote cases from your review. These now produce
a warning and are skipped, while filters without delimiters still export.

 tools/bootconfig/scripts/ftrace2bconf.sh | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index b01297217cf3..8f3edea79ca0 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -126,6 +126,19 @@ per_event_options() { # event-dir
 	fi
 	val=`cat $evdir/filter`
 	if [ "$val" != "none" ]; then
+		case "$val" in
+		*[,\;\#\}]*)
+			case "$val" in
+			*\"*\'*|*\'*\"*)
+				cat 1>&2 << EOF
+# WARN: $PREFIX.event.$group.$event.filter cannot be quoted for bootconfig. Skip it.
+EOF
+				return;;
+			*\"*) val="'$val'";;
+			*) val="\"$val\"";;
+			esac
+			;;
+		esac
 		emit_kv $PREFIX.event.$group.$event.filter = "$val"
 	fi
 }
-- 
2.53.0

