Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826559;
	b=h6GSh9QQbQmhuhIjB7L+xjTLso7YSzHK770AAz6nuZvEomUvLvhj7C6rdPBrYF3pdLY1
	 2jOHwMX/PJ4BjWQQArovNHy4LCK20KMtn0Ix9b7J1KxVnwpwBmFmnW7/OjvjKjNT+07ap
	 t5HXIFOIYOGQk2I7Na454fxhBrR+5Seco5VXFAZfk8xuHB2B3Zb4Y8MDHmlpmtJ0BJsRN
	 1LZCgc5TrcEb5lFZQ85IOIY2ayD9qHmU7A0jCr46Kgzn1q3YMAJpWNTtpdVjpUQXcGckV
	 IHvjMml2dI5zwsMhWd3+9VZZKAWEwuKUOgYeuib24cvcO9fty0ykb0PevEx+p36IasA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=zyZpk01DLf2QnC58+UQV1wk4CBVcfTT8UP8IdGyE7ZY=;
	b=H/8yc5KGqoQ3kUi42rQ8baxgA4lGueDeg3NPTFA4Nq5Op9GU7VjSItFj0bpxbmChHJ85
	 hZnrsFRbME0047SwgtPZbOxdDvaTezeHAz3u7ptqnoba+pUQ6spGBk5T4FsFAk3E4DuQP
	 uRd0gBGybzWjd8OOsPKdXG/v+FebpcBKzCcUkKUCBHv5iKSbpQuHX3eYAEAFwOIbGfuNg
	 OJjMmzeoR6sAHlehhxFjzuBS8R4YoZhLHrsT72qAr+sfsMMf8MMHgEN6f373xwm++6LfM
	 yYelFPy3VSnu2lwE0G6jh0YsKJjPxSrVHXJSPmf2sIR5Q//Z0km3xPhsJwl5Hluf62A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmPUDHJn;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEC560A67A5
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EEC560A67A5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xmPUDHJn
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e00eee27dso656097f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826558; x=1794431358; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyZpk01DLf2QnC58+UQV1wk4CBVcfTT8UP8IdGyE7ZY=;
        b=xmPUDHJnkAI2JpFOCpLn7lbCItH22ZZ1DeIqLMRulnAOuDv4bnFCWi0nCkut1kpz+t
         Q8lcYX71cv2THd452ojIMF7hyqTlxoPhhF9UsnBQU00ZiqVsW+uItNBQ99Up6NWjzMZY
         rbV4d2NaZWDCEHJumFJXbbSYP6GfzQFxMoTnl+SIv68thPTInzWVLzig8X386MGJpTNU
         pwhdPqBI3zD1ewhdNW2j/QRKMi3dAp35SYkNwBNazXqK8tAXtYmnh0kiSSo4NwBFI4vd
         kMnk7V+k2B9lqBiChIwp9pW4JxMG2G1jf2J3g8S+n+NOzVxoS00Mhc04WDeXnFXki7v3
         F4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826558; x=1794431358;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zyZpk01DLf2QnC58+UQV1wk4CBVcfTT8UP8IdGyE7ZY=;
        b=T3F2hlQFDFTKbnIVGorN6AJgnETUauo509f3MqMpnWkqqScd9vcPlzygrU46QC6vz1
         ytBRUUUKw/OxBOwpGY3z68mRmqc0yfoJepJkMAowrhWgZWZGYuVu8I9PVbP3ME2XEHQI
         dhyJ8cSAQEu5QuUybuCoNkHvqC/CJTHDeA4a/F5B7xLcLSoU4PWqgXIDwNUEcVSQjdgS
         pWSuGV441nIsKmuguw2JT3zJ3tq6FCliqqmi3EDejKrlNYPu8QFlbQvVp6rRy309z3PC
         J2MC+9RJYS5YPQM8nZKPTNKiVwAThqjEiD/1Lw4Fgjn+wNd1aCTveM1s36nm1dzen1M0
         BTmQ==
X-Forwarded-Encrypted: i=1; AKwUvBxVUbjzib7tizIn9uXtLgIMFVjRLfO0rBBJFWPdcej06EHL/VztvMqJ1xJvXmuCgPEKNRQk6Xxmf087o0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kLs2UgexMgxr99tmWGTlAS6GHH7fgGUSz/lsHTYCICPg4uTnA
	PnarNrx3ftX/wpuaL0P9U54SX1l0bPLhCzsBPQhseLpr4q05mNU+PQJ3qE7QLTSo
X-Gm-Gg: AYBFou2eqT+BhQp20h2NTRHmbYT1amUdO4jhDoycb/VHizURyt1HPCVQ212YOE1+Q1Y
	01+/chnQOYVFYR5l/eng66cxRaPgkMYqYof2eP/XrGlUxYa7EVEqfV92kpRZVtA0zgL47J5r1W0
	iP8lkLo0A5c6q4mvm42Mowvrcym5eJ4Zk48UB7xoemYF/2jjhlUIpx2Kk52RDurQ03g6EFz69hc
	Yxknb7M0HQMgdpJ6fTvKeXwqutqtB/isB90ygCG1oKH8gUqAK+PrDi8qjTuzzsI7V6w7H2Bm4ne
	wRZhM+AYmhRvqki3ZbgtcTsRjIE7tE3P7/Cni7sHC3F+GkDUGzjIvPw8Vrn06VpqmR3typy0JMy
	rL8CDZeulp5FB4EOUdi0nZ0nTTUi+w3RXFEE2tcG31HfiH4ha0wroP8DgR5e4vpbIiIHc0n6OJr
	9/BNwx/A9oV2n/9NIMtaueoftOk0C97ciFoWRY0tenO62IM0sE7uSOA2Np4TJf3ZsGhJifumMky
	IFgoB6kVdMN9S6+jm3dbuXyusR4aoyfcrfQ23F6+i77rahlr0r4pqBbI/XA8U8Sm/q/fKUng9t2
	MX59Oe6roIVVY9k6buzlzvhmGLxvKJXMThshGR5xIM0ErGqrLsZql6I=
X-Received: by 2002:a05:6000:420d:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-490a4817c00mr3361546f8f.29.1793826557552;
        Wed, 04 Nov 2026 13:09:17 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm6643541f8f.45.2026.11.04.13.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:17 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:00 +0100
Subject: [PATCH v2 14/27] selftests/landlock: Make audit_message large
 enough for any exe filter
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
Message-Id: <20261104-selftests-refactor-v2-14-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

audit_filter_exe() copies the filtered executable path after the
audit_rule_data header in struct audit_message.  The message buffer was
sized as PATH_MAX + 200 bytes with received records in mind, but
struct audit_rule_data alone takes 1040 bytes.  That leaves only 3256
bytes for the path, while the kernel accepts up to PATH_MAX bytes, so a
long path overflows the message.

Size the buffer for an audit_rule_data followed by a PATH_MAX string.
This only makes the buffer larger, so received records still fit.

Also check that the request fits in the message and return -E2BIG
otherwise, in case exe_len does not match the filter's buffer.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index 1e533b4e26db..173dcd1088db 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -41,7 +41,11 @@ struct audit_message {
 		struct audit_features features;
 		struct audit_rule_data rule;
 		struct nlmsgerr err;
-		char data[PATH_MAX + 200];
+		/*
+		 * Large enough for an audit_rule_data followed by a PATH_MAX
+		 * string (see audit_filter_exe()), and for received records.
+		 */
+		char data[sizeof(struct audit_rule_data) + PATH_MAX];
 	};
 };
 
@@ -171,6 +175,9 @@ static int audit_filter_exe(const int audit_fd,
 	if (filter->record_type != AUDIT_EXE)
 		return -EINVAL;
 
+	if (msg.header.nlmsg_len > sizeof(msg))
+		return -E2BIG;
+
 	memcpy(msg.rule.buf, filter->exe, filter->exe_len);
 	return audit_request(audit_fd, &msg, NULL);
 }

-- 
2.56.0

