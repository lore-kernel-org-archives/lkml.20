Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792949753;
	b=n8glQHLm9/1fDqL8I/GjEuHqG4VTMciXA9aI3mH+WkziQ38+RbaOCxu1ppezPzhtNWyV
	 zvfXhfV3zOqaU6kyjilzww1RQHjaxxwAMHB25hCMDw18AFnJdX28agS6/4AuJyYN34FKa
	 mS3/a2FvvKxkqQuhYvzkw9JgSaXxv7ck5oVi3JPOa0L/+ec4K4Lo+h8Zm1U2gl+JTlyL4
	 GyuUBbcP8jYrs0rKb1rZqcA2bJF450AAmOq2MXd8uLy/hG3FtHcgc9CqOTfk9lut3z7rw
	 51K/cgJSHcGY6Sb8724Opdpjz39Ob/JTVOHoOjnQ1RneqxHDCx6ofejF5CzipK3yfJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792949753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=nluO+KDJonnXvVPmQXImi9sjBFQpJ5/zuHQkNadSdV8=;
	b=TZqXcjXH9abUreLsOms9pHDd6j1GCk6r3pl+Rua+5nO57v4+dqQPLRvxxztG0D4+BYk7
	 LFdFVuMWo0ax4Ny1rcI5xK0axNT02x1uP6g/AFYiHa0n7a7T6AdfKyVxpjDWL7ubh106x
	 ILork6zq/7tJcGqSh3+ZfmwH69O7TTl072F5iM6luNuasRePkIg6z0BMdhE1Jtfwt4+Ta
	 IMRofruQRo0IxYsSCt65998emvjCrl8gqusiCaYQmUyuLS//d7KUubkhU0EYPeu6lvMrO
	 G6I5XIIZsHjizyxi9LV4FmnZmK6/KoOKK374AkyvHaU2yCmUCJLi2MoKzwy3oiPGHmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="R+8/FDb5";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427D5606A32A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 17:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 427D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R+8/FDb5
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e46e449e8so482796f8f.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792949751; x=1793554551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nluO+KDJonnXvVPmQXImi9sjBFQpJ5/zuHQkNadSdV8=;
        b=R+8/FDb5fxrpNY+uCXHRxKSTrtMrCfHqll3y0cSL4iHIOGhtsL/5TE4O6C8OZl4I//
         XkOtwCviFy855IMbLA9RvrjezK41mwVyWqbe91M5UZFHufp66alXpDQKn9XzEGiLXC2x
         HhLFmlObZzsEEe33GqIDcVrovCEwB5JxdqNII0BzwHL87Bk1g7wPxF+DLmtKN6A5JUHO
         alJDec5mV9LJpyt2HhxAn07Lt8NG1wiGgtEr+zdtWReWQGDLkKIVlt7qy8LoJbyEErf3
         5Fr/Uthydv/NlrHrEl04evb+eatpZAvwnJ5gZVQRzgidJYz5IJoUhZcT5U+/qAH+BNyR
         5zMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792949751; x=1793554551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nluO+KDJonnXvVPmQXImi9sjBFQpJ5/zuHQkNadSdV8=;
        b=1hXwygQSNXKWRVn4B+q5L12oqMct/RY6Ygh2hcv3q8Y/NrXf9oIwD2RWXV7dA2UhWO
         Msxd2VCF2nhpjQsaj9KKpU1UOO8laagGH1YXGT7n9xpyCQOBK/Fyk5C5QWbBuWSXEY88
         gykVbpv9Lge1u+EgMzZh2pJpfhL9iCr7JUqOg8N3TPEmj46Js1sKVUYN1/Gjbw98OV6f
         bjVFLyba4YKtvDINPeKeojs9d+/NkMEUg5lY028oEwN+ahswOHnUJIpv6uSVVdxp0FYw
         KuWk2jZP8kHZZWCHQWiSsYwrq1EQ3aqzDS7tPbfm/vxc7LlOR2GDmDoy2A2FrkwXoxRi
         MAgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRrsN1IiUwg1DSuuqwfjXbIvWcbrpJLRHvFB+34ISvbhYve5n99T2iCc6klMxTZa/yw8fDriZP0b8tYMM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ27oJ2ft/HZVbvd4yij9aAUi5m+KwooYvjGX+Jef4TM7ymX6GS
	LHnZ+r17iVOTEyDxWbLiekBwl2WQQa+TiEvOUxxnadhwS4TFhPGsRxZt
X-Gm-Gg: AYBFou2o2SIiFZycHCFD9JmyOT2K8gH9IsXEOJWnNU/G9Yz+0sNhgCI94VRR4hlWvKM
	HhW+9egUT8JgzUvY5Q8aKtrUYevdDgPeLW9MmFgzNPjsyuINPc8C2BY17Op99lqx4cC/TGuVMtT
	yThFOl9q9eozzj9etLwRASIv/0Ze3AC+miG6gj16xCofLEng4deeL88RexAR8dpx/uCepVkSMhb
	Qid5N9lYQ8jH6bppLhjG7fQSX2AlZck16NgOYKP5l6NwOB86LsARDF3fiubSmRcVsia5iMpFEN7
	VvcsPogsHRSoamLJfp5ul1bpR+bQsFMeyQIHj/0aZZ34cGPIusROL/eH2dU4SbwAe42yr8ABUen
	d5OMPOyEi7XL5iFjlOmZg3lrp4yB5400p6brM6vebz7SRnXNiAQYNTqr2FRJzaURKG9t9bhjznB
	5FwwiRr4gBjlHZhm+pOEdIuuUhDq9NWjnpL3R2g62xXzTwAfmC+BIKQMNoZ9EJ9pyB5LXt/uH2S
	Dk2eeyRtjG2dvMPMthpEmadwm1sBkJ1vSI5KGIwrSLln+OhbmIwhh15kH9SAuDPJQvM2rn5kZJ7
	7OOpEpJkl8mKddCnT20xE5Os0NKP1MqCw7SJ/dn8B9eMSjBa6AOM+t+NgHZ+pZyVVzXWXACVO3y
	mbjeoKDi2n0Gj8aOtFQO0kHa8pDhv//erPc/tTzx3/Kx1FSeZrb4PrfIV0Be4LFGheI+8BG2A9e
	zFp1f03q+2
X-Received: by 2002:a05:6000:430d:b0:48d:ffcb:28e1 with SMTP id ffacd0b85a97d-48e3eb780b0mr7726162f8f.11.1792949751568;
        Sun, 25 Oct 2026 10:35:51 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-ce3d-9b69-45b1-5da5.rev.sfr.net. [2a02:8434:fda5:4201:ce3d:9b69:45b1:5da5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb90dsm10234070f8f.22.2026.10.25.10.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:35:50 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] tools/bootconfig: Recognize underscores in histogram variables
Date: Sun, 25 Oct 2026 18:35:24 +0100
Message-ID: <6343726e630448ee14c091fe369d8ae5331a0345.1792949723.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792949723.git.edumucelli@gmail.com>
References: <undine-1792936915899334889-d965251e73c20670@undined.local> <cover.1792949723.git.edumucelli@gmail.com>
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

 tools/bootconfig/scripts/ftrace2bconf.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 032ac5b10a4a..b01297217cf3 100755
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
-- 
2.53.0

