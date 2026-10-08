Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9033D449B3E
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469667; cv=none; b=adJKZDL8zKQFTijzlV/VqkToSwi889xkTa6/1yJAlJ6DfxEdDkS32LN9YbS+1ix/KaGYYOUJIE7J0EUKme65O59mKS5dOhztAW/CDJYs/TY427L9krWnqshjXjbZcmKRDbGfnZ0Nacp4czoJFTTz8F79SBdiUIZlbL5+f9RA4eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469667; c=relaxed/simple;
	bh=m5ow1J9jdoEMi1CXJk8/S4UkgRL/ss96Vuk19sTxtY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uj66rukUv1n0L/AktvjWAWTTTjL/KPbhvV/SSdFJN2lD+mK1UcpoU28L6vOXU0G5w0Agtus08xGTwyaKCLoev5DT9zuy24QuCPUNX3CPkLGNHSgHaU+kNpnkPdQZ/SeTDQaG1bxw2I8xpvMGRM8xQdtids/zTtwz4qeaoDtpUqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ei+sdUeB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ei+sdUeB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49e73611928so5903145e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791469664; x=1792074464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZISr/L9O4I7MRbnn9NJb2XEWKkc1K5iiNHqgDIFDWo=;
        b=Ei+sdUeBu1qLgwTVVj2LrRNhBdlQStMypGTqf3C7xtNblB1TVX/dUJMVb0St3F7P+g
         acC3ay1aoyeiQQEmk2K0MTBsfRAsMcs6lKClV6zga+9EzvVL5puFUCzx5MauWIsIbG/c
         iv+AgUdHds1ws3BQ3Re6DvazqpQ7q7G0JHY5uY+H9cUkw9ay1fGbUyDGksr5HseZAjkO
         1PhZ8BMN1xPPdIhN1A6AcikOL/ETtIFFpFN2pmGyju0czYEmuTrmE/lFvDEzu0JaIxKA
         ygzvNXDbt7be/Wzk85AkaysVvTSHJDgri2cPs30Bcr3OSCLJbR6WMvVuuslCXTRGvZjq
         epXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469664; x=1792074464;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZISr/L9O4I7MRbnn9NJb2XEWKkc1K5iiNHqgDIFDWo=;
        b=XYtULtbYi9I07a3rJhYvYPWV2o3w9gdmdB7nAj226uc8uZm/fA6dQ6IeLTxYQVkMF5
         UGSANqDANH8ATNlxvoPI/XBMmpR9K0JRmRZZKyAl/urw3m9KtkCHYrBmYsgCf+eX9rPg
         Iwh2Z4xQncKn9iXvqB+ttKQof8n0FwTdN2t1kI8XT4kPXmJNtBxFNir7gLV0UGu6eb/a
         WqpGl5855LeHGLCYGLOqDKNhhASfJz9d7VZ1aWBCP6K5uVNwoeq/q4eGrHW16AaiGrhh
         ZwbqpvCEQG1lMQ8Vrfp7aCqdJzLdOFNt8PsDFqKtJH8ylUHjA9jOPsRt9ukAbIo10lzM
         ApNA==
X-Forwarded-Encrypted: i=1; AKwUvBxfmh829LsbcAfT/eSl43fBJh0o/tFp37IPAeYZFekpFs/Cu7U8if64c8KT4e2Orlo3saoel3fQ7cW2l5o=@vger.kernel.org
X-Gm-Message-State: AFuF++kiHfZWg1NXYQnDBE+WMNBksBLLGg4tCnlFtpB5GGNF/XLgzv0m
	6w32k7floNUqLjvN2Hnygm/BKXMSiEB6hQvoECAJGg+Ys7rBRIpafT0k
X-Gm-Gg: AYBFou11djMGLdYEyVnGxxb5VZ5TvK3v1B3wUTIyva/JUA7sNeDu8T0hLbP5cYr13b+
	5Wxk7Kf6h3EoTk56lVQJRdUbo/S0rDqRdrm+T1OHRRQ2W0Zg/t5g2KhcM28ZNFGueNxzKjwSPYx
	TAatOkTTsSZgBXp80T6bpnaqqHaRjIkjDHzR3p2l/7L5yIicqG60GtEP9rmFcIjz9dORrIyfTge
	G6CBOFRKtD4d4HCiMfXhKfRlJyC/7Gb5I+bky0AtZi3iam3rmU+aMQvv96fkcbCWlqt3vyV3fE8
	EPgYhgLFCGtppMQVp62cafJG+6MHhthAxQCxRQSkKwE1bXsORtp3u91Cc0Me3lfGAwNa68bp6U4
	jCfS4tyuMJHQzVM6TmEGPP5+4TA4Vp/dYzPnw6ZI5/uzLydO3UYoTJBLejiroh4iuxVs0q850x+
	P9jfgEzg7OOMxnxlhkUVtKqFaeWKYXAlQlnG2xWE2gQjJSWk2mH+RUbVKWm8A2fqqppvPNUeyFY
	ERnyFJRTMXfdhbwp7jfdBQ=
X-Received: by 2002:a05:600c:3e0b:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a1851c7355mr52692635e9.17.1791469663731;
        Thu, 08 Oct 2026 07:27:43 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4480a4sm112187905e9.0.2026.10.08.07.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:27:43 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: Wang Yan <wangyan01@kylinos.cn>,
	linux-kselftest@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/27] selftests/landlock: Fix stale comments in common.h and audit.h
Date: Thu,  8 Oct 2026 16:25:52 +0200
Message-ID: <20261008142604.39107-25-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261008142604.39107-2-gnoack3000@gmail.com>
References: <20261008142604.39107-2-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* _init_caps() lists more than three capabilities.
* A 64-bit hexadecimal domain ID has at most 16 digits, not 17.  Size
  the buffer accordingly and drop a redundant domain_id check in
  audit_match_record().

Assisted-by: LLM
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
index ae6a0eb8e343..f0e8d3a498b3 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -34,7 +34,7 @@ static const char bin_wait_pipe_sandbox[] = "./wait-pipe-sandbox";
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

