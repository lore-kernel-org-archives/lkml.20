Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826580;
	b=ZX87klb8NmOV0pOO08lp4wIF7AXNx3VKWR1usgg3SBzfZwseQLRVIncPWgjwXErpaDNu
	 mBPoXNexkiX65Xm25ywNTFA6u7WHi3afgYagrMcuKXI4T8CyadKP9Yxw8nDmiSDuRkq1f
	 +IA4n3dpAHZJmStxS0L93/68/m71McvteygxqAIMb51B9KS661509wx5QpByuUzp6vCBg
	 o3v1Kg6iy6iYJId3pxzDDStMIZ5HfmT+/zoMxAmoX8tUNEykeUBVEPuUdKPVMh5hNs7xh
	 OdAcDKjX36Z/aGMk3/td+RH/vPHpDbwvMJn6w5g5PIIOsF+uiTDCs//ZMLbnriAlt1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=qQtHtLjeirdrtLdAQv/bdHNkyg2XU3B5gSMb9JJHLSk=;
	b=eNs7PblCcP4Mglm1OT9/BdiGULdZSpe2bh0Adf8lfpyAkSrCK8j+Sk+62i3MDumDjWSg
	 XHm4LyoodOlhR5OwyN4bu58HAf3JtzPjLoCjmSeZOGsbSp2CPopPhVCzQ4zdoNMpLZJBA
	 AFl/hNZg95ortzM1C8LzsWj1K9ZkC7qGhvJXR2h/nesbBscYMqbdmorW4Mho/QGfz24R6
	 9bYWJrdSYqbFMAi8SRAANe3PJ0rxdunXlU8CFt359C4Dp4xvXQDQ2PBp11qzVHX0yU/Uu
	 Cg30oYY2R2jQ6pNoOawGt38+O0uCpz0M4iUoIWtI385TgRw2zl9mCJFE1z0/J59OAbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXFAr6hb;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26955607F2AD
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26955607F2AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nXFAr6hb
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-49134c8509fso97778f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826578; x=1794431378; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qQtHtLjeirdrtLdAQv/bdHNkyg2XU3B5gSMb9JJHLSk=;
        b=nXFAr6hbJNZyEpoDanjCPM43/J7m0ZqQCSqGipufmLsCZZ6TvVZm6EJEwQ8nJUIA01
         7RybbeCmUtHjEm9Buh5mJuvj7vpQSGwbjWfGEzLn83QIRLmdv6Z2zJuErj9VK/vDjrsJ
         E4pLs/k3VZbZE6Q3jpGN+8CoQdZGKJLXnZ+sNJo3320QX9k1WjDEQZZgZE2X6nJ+7Fno
         YoR5UZycfuWGtjqAfJAtIQtFhwdWYbrkAIsAGoKPPP3I334URM/Cu8BrP/X/StRGi1jy
         95dlPE5d9Oyw8OYyA6hXzTcYyuLw0cY1o6gZ9cYPZmHIy5Xtc25SPKiEA3EaOSwdyn7J
         O5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826578; x=1794431378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQtHtLjeirdrtLdAQv/bdHNkyg2XU3B5gSMb9JJHLSk=;
        b=oyYQL7MFoQm159h3wVUbqd5YWToe1OHEcw+CI5EDstNXJgKO08foRa4UGWR+vHbvvw
         wc3C6hleaRl2G4tQrrENKvqX13zUwPGuEVW5HqxJr8vthon5U6AkBw+66aG8vsZLerYX
         2DiFxxjNTUacpuZbpT2lMAPfevf91RzW9N7BKl679/MoVrf2c+5t16qUAZil+aImpcu0
         Zoh0jaRNZqGWC4GBno2sXop8zPQZP3OrtdcjvVKj7kyWUbzjQC5C67F6Ilsuhb3gGtVk
         Dpjb3gkl3/DTeFSJgWwLiY0NqbQeo2SU/OGYncqpXu5Crgw2V0+TXTJkK6FGewFM6kHp
         jZ4w==
X-Forwarded-Encrypted: i=1; AKwUvBxIHo3YRO+LpyjVssSFY3mx5fLppdfeGl5hddKbpiZ/ry/XZkg5yjpM03UDnduec826KqdfCXwcsqwhJlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/m45Um9qRa/838yQLeIIPqN/yH7DAxdD5JCXEk8/eoqe60F+2m
	KkL/lv4dp27yhAT9LIrsHIZTIoqzlzCNc0t0RQegm7a3ZIyPU9Bxi1iM
X-Gm-Gg: AYBFou2fkpIznFyXAcLdae7kyJ7bVUTslAb7UerAbsmnDuy/9cZDe0Er2yZTRISx97w
	zf8MgSzMUzZLyYQCq2KWU9KMa1E45+29JCAmqLhBeVB5Je+5+1QaPBqQtadsUluhxNCaDdUXnn2
	znYCFsa7rKC0zGrfwNAoZlEk6apwOcgMiKnLgYbGb1FVlUa8iUqU/g4KKPf8vbaFvzkXGnewp1K
	pHzX/9ShJGTF+YNBjlg2cBknEz+LT65987CKoVO1SThqd4FP9HnLfTQLdkYK5s5Vyl+thYUiy8S
	FjLYrTDtV/0fqJaayLJ9Vj8j8K6/769nGe6V40CGHRAPq70cz8OD8P101Gn4IV4m3YpWCn9x/92
	ZsYSK0gGRAj8e/OYvoEuOFLyRKVf+TSji/jxZC6KbFL71sOnKsbWdqqW6uLAfXfa5vnRT9IQokW
	06hrjKTt3OJil8zGWr62Y5R3XsOiRZ6zH64kMjzsVnOnthCdWKmPooaU2JcpAVNp8Q51Cocl1A8
	1Ejb6IaVhgc/sWeuS1SeiEMQlBMfsHu2mt+NY9F72MMUZVCKaTTLrDAEEMAqGGjmhEeOjk4cP63
	l8guo/7UJrKe3YWqJhlESZ2n0BfHcE5CDjOv0yG2YI59STcCy+AExw==
X-Received: by 2002:a05:6000:420c:b0:48e:5acf:48f8 with SMTP id ffacd0b85a97d-48e6e302726mr38283835f8f.16.1793826578564;
        Wed, 04 Nov 2026 13:09:38 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm5726190f8f.14.2026.11.04.13.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:38 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:05 +0100
Subject: [PATCH v2 19/27] selftests/landlock: Fix off-by-one in
 regex_escape()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-19-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

The final check in regex_escape() was off by one byte
and should require one byte less to put the NUL byte.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index dcfdcfecde86..0df8ae88d4fa 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -307,7 +307,7 @@ static __maybe_unused ssize_t regex_escape(const char *const src, char *dst,
 			*d++ = *s;
 		}
 	}
-	if (d >= dst + dst_size - 1)
+	if (d >= dst + dst_size)
 		goto err_nomem;
 
 	*d = '\0';

-- 
2.56.0

