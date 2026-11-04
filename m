Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826587;
	b=dyP9nzJkVGkFeoXPw/8U8Ko98entlUK9fPJJtzsd84N2XQRYsKQS+d26tpIko8B5Vl80
	 cxeCrodVr8rSUIndkRqgXjXRo+8I82AyccQZhGq8p+6DuxVfeQK6F31y9PeIG246FkI1X
	 8gaUtdiqIRDoB/DGo4OmZCwocS0vUA7BpIoOOZarCPt3SKecxueBwSDp1nmu/86ipXmP1
	 +OYC9CfckWCsIP2lTeWVqIPC4a8qZRzxb7iK5tP93/XM4fGrNVSMc4Ol72535twHezd5N
	 a1akHIZl9KiW4r+CnxuuMZQnyy1oRktoVGMiYK7by8qTL3CkIYgOqx9WiS7X7XDMOSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=PFZjTRUWdaKfWivVftRvXEOJccYw+XLzyzCwbiaKvjY=;
	b=Nve/w80WfvQ/80S3JQYV/0qHI6VKdnqBK+5sWHp/bH+G+aL34G/3rA4PYZ3rumcG3aHi
	 CEtXkGAqv5gTWoZ000KWDTZh7ABIvWgiEHPnzj3Q2rqFPw6xMGHuBUa7Ka1gejSy7ByUp
	 4BVf5Mu9tNeMbOTKyFwjCxOPVgnKzeIsqk5VKyvyxNlYg8KiO+npn36WiW8zlWBpfX0CF
	 LG9Jj8EAiwTAFmeqw+m3CmLEkSQoY1HKsHnTOgyrhvRPzFW37fgp89wHS40IWxRflU9es
	 hyr5OMEl+gncrdlBf1pIY5X/epSC+v9cRmBv4G1+FPsXylUwfWPfrSu2/qNIsF+DJMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6n7oLqT;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2002E607B9FF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2002E607B9FF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L6n7oLqT
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso1000688f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826585; x=1794431385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PFZjTRUWdaKfWivVftRvXEOJccYw+XLzyzCwbiaKvjY=;
        b=L6n7oLqTe/+BXJyAs0QY8eUk3qcZ4vKBgAjjrsHHtPP/KqSep0aWbQAdocebtNn3WP
         IAxqjH3uJOeAgLuVz4fvWK55RpMdzhOiSfgCxFoIujsO6QTdMtcCugGgb/8oSwrbE+bM
         /IBGAIAUOj+1sML6BJblUv7SK7TG1mY6pGdcKx5K7StjZUy/yeTLNTIXO+zIrUlfgvZG
         ChtgMSQCZKIM55YIcwZ4W7Ynb+IzBELdo+l2rtFhX78VTxYiNoioHADyjn9w7/0R3ZMl
         j5OVp+MyVkOFlLHrnxPQLDQeJcQg/yS2+Wm7WWD17+8jZ+5d3t6XiXjHnrBkxnBLAF0l
         PvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826585; x=1794431385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PFZjTRUWdaKfWivVftRvXEOJccYw+XLzyzCwbiaKvjY=;
        b=upu8Vf6A1s8m1gFQoNcudfwg37JUECo+S15OZWgKCSVS3MttyWkvXd50fiSzr8qAxa
         WojSGWl5qg18WbNXxNBD6VtzvORLKAaaj4vemv+u4EyjFXrjBw4kr3saIHwRT9IYvXrp
         mIQvk6YXJIGIP6rM+2A3T7xKEc0YaJei09igJKL7CWl//5lV54e1/sIpBwA4HaaT+Ftu
         H/RCiEb8p2ah62RYPnodRbIjZtK9NNjvi8GjzIBRN13CiJZzS2zTilSBAMl8stsOfOVh
         Y03bpWQe30fS1GznFQSWLBsKrGT/RoZatdkN1cdv4s6PeiafoBDVTKVD56A1Fn8kBe/r
         aytw==
X-Forwarded-Encrypted: i=1; AKwUvByzeoAoRXq16+sCWkXasJusuYSi4DbaenjLM77I13McZny6KYuSqvIr91KLHiVJQ5B2mFDE6IUNXqecwRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iX6lTE6vwcZ184FPNHcfAeDWdmp2ijSgqcymk/lLMQcWsQ+Lc
	o6AV5q8fgIV/kel7mPbQ0GcbPDPjVmfU7rOY4pf3VJ3A5bO71rO5jJ5U
X-Gm-Gg: AYBFou2DkgV61l8F9zNQxg2hRuRuAptIoDxE61ZxjswYqDMdUdK2MAilxTWKEQpOhgP
	MvIvruabIyR7Azc0ln6WXMmuMd9ohCgwxsmP1TAMf2TiTwYfZuIjLiKoyo7J4Wf6Do5kTJlBONh
	VDR+pP8aCtbD4RvCmp1gqJTqbJ4HTBaHH8D8QspiaI647UKLhvn6D9hakxCqbQgQtBNHVXv0PSZ
	AmMxygzmTXyfi3vOARtUXsZKJ+Ll/f0UlkfDA+FMG9mUQ/BAJDx0pFPqJDXvFhExY0onUfGrRsa
	8KBFdU2b9GrQeunTPdDu39JytXSjcW6tyHpwuDH1+UCAJ+e8c8ejwOtYHE7FmofeZ5xX+g2P7JN
	wZvgUX4GFWDSpaSbC7r59DPC3X1Hje/JzGaBJjtWFkH78TL7c6/fsegyQMoeSQLECPOFhhP+N0f
	Vx0p4tuQH4pTPQH6CTEKL7DHi+nsuK7XJl6Xo86S3671RdZMW29bzHeV3oNQZwG/xAP6ypGzjXV
	p4oOp4Qo+gMzRTc5U47v6SN8zD9gBDY1uuljvMm6N1g/AUK5hOtGXu2tlbWwjeA+cRBwSQN+cmj
	lIXG4P06+0m9e8RgCCJEX3ibG1bgXF9RRt/ptPz2Doq7/6qox1NTbA==
X-Received: by 2002:a05:6000:2c01:b0:48e:7e15:406d with SMTP id ffacd0b85a97d-48e7e15413emr30075956f8f.11.1793826585471;
        Wed, 04 Nov 2026 13:09:45 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feea5d4e4sm5738727f8f.57.2026.11.04.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:45 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:09 +0100
Subject: [PATCH v2 23/27] selftests/landlock: Fix stale comments in
 common.h and audit.h
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
Message-Id: <20261104-selftests-refactor-v2-23-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

* _init_caps() lists more than three capabilities.
* A 64-bit hexadecimal domain ID has at most 16 digits, not 17.  Size
  the buffer accordingly and drop a redundant domain_id check in
  audit_match_record().

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit.h  | 7 +++----
 tools/testing/selftests/landlock/common.h | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/landlock/audit.h b/tools/testing/selftests/landlock/audit.h
index 173dcd1088db..d23bb2ad3a30 100644
--- a/tools/testing/selftests/landlock/audit.h
+++ b/tools/testing/selftests/landlock/audit.h
@@ -274,15 +274,14 @@ static int audit_match_record(int audit_fd, const __u16 type,
 		*domain_id = 0;
 		if (matches[1].rm_so != -1) {
 			int match_len = matches[1].rm_eo - matches[1].rm_so;
-			/* The maximal characters of a 2^64 hexadecimal number is 17. */
-			char dom_id[18];
+			/* A 64-bit hexadecimal number has at most 16 digits. */
+			char dom_id[17];
 
 			if (match_len > 0 && match_len < sizeof(dom_id)) {
 				memcpy(dom_id, msg.data + matches[1].rm_so,
 				       match_len);
 				dom_id[match_len] = '\0';
-				if (domain_id)
-					*domain_id = strtoull(dom_id, NULL, 16);
+				*domain_id = strtoull(dom_id, NULL, 16);
 			}
 		}
 	}
diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index 0df8ae88d4fa..66d68a92c6cd 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -36,7 +36,7 @@ static const char bin_wait_pipe_sandbox[] = "./wait-pipe-sandbox";
 static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
 {
 	cap_t cap_p;
-	/* Only these three capabilities are useful for the tests. */
+	/* Only these capabilities are useful for the tests. */
 	const cap_value_t caps[] = {
 		/* clang-format off */
 		CAP_AUDIT_CONTROL,

-- 
2.56.0

