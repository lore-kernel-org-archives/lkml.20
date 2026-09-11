Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0685735C6AA
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 20:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789159226; cv=none; b=EtUFEfXln67mcI/tRWdXZFtigUeomBACHEPileT/soPwYfunCo4rq4QxcpvVYv6oeOaK8Ohq4kCz0zPRWFwXH4HMLDbtgEbTNLdOmabSzFOHNNcZw/TGmx8S2EaxC9U+1EJC+In83U1zKXXO+guCwBzdR6auIl2yRdccYYz+sXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789159226; c=relaxed/simple;
	bh=yOHxJv7/hycz6+JN/DFN4bKkpmVEZPmrKh4UqNfOU6M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pZSlkFfbqZpGDnvMqMy/uJzBXC4J04sO6C9locEw7uZBbLbZZtF4hNebqFFZ2Fy37I634pXuHwpCGu+tDq6aQoqn33JEz/0gtAMS4y/Db1IxpABJQUjnIoKXsSY3TfNeZ4StwSV0KjSiS8Kd+Fn/IvqPHNYn861lXheJC4T3/1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7q6OGkL; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7q6OGkL"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49e651e83dfso8243945e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789159223; x=1789764023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4wQKJNxifNdByk8MBibmXjCRQpHWJtfW4Ad4PWk7cY=;
        b=D7q6OGkLEHp4Y0O3I31FGWW8LlvvMkQiHgeXhdkNNoT5nXnJlmVubdf8Nfgj84uYvi
         V+ApotCmGUCIgKxcS4C9WQ1yjfw1yAwmXd/8LxmwmsVz0Ptot7wJhrhiCSV6xxA1yMoi
         fD07N9nKNR7QOCGSotd/sbVlC2CK39Ba9ZQau1pKf0oatzzzwqR8KdM+Q8CI4smIKNEe
         lu9iubwzMVFHVFA8aJ6trQvdwHbIXXtHXGqmGAtbS6gvfoz5IadJiH27l3nvK3KWLM+V
         SfDQntIKyPEdcDmM3yJo1LgXfEThiIvBjYBwQR1dMnq5/mn0msNm/2ytW8NAmzaLPpu6
         WFtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789159223; x=1789764023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4wQKJNxifNdByk8MBibmXjCRQpHWJtfW4Ad4PWk7cY=;
        b=hspltribWjUc2S/tDsZpSAhBo+HsCRQ0eyd4nzb4lynjVJdsvzcGmLV9GPvJNG4yQq
         KLfUhAfmvVvVjemLR/VQwCtY26xjkZRJQJGBlKQbwxQRIhprfSYyhC9o80LCoMU9asc5
         BTlGVlCcCVkD6Ie4pCQcOOepZKFzdN4wbDcK+yJ5ZIC4ZNEiWEHCFRrIprBRhVKHA8Np
         h81yHHhCqD88WgsBmrbu/YCsSawIo388pMDeh1geI4KTNn7ycmoNoIHsaZtzYkflGk7h
         uUBvix9IB0Lgpr/kAWyndhDeT1I5HuEDiYR0Sobi+Be4TVnEclhpFV/syLDbxvSdIJZ8
         u7kg==
X-Forwarded-Encrypted: i=1; AKwUvBw+oOpCrOpYBQ1jDMw+uUs8enBdNWhpOsoC2r02b8MiDAlgHJaBHoOjIwwMghyIoc4iX0/MsCru+A4BbHM=@vger.kernel.org
X-Gm-Message-State: AFuF++nlZZ7gbsmiTiC6pav9qq0SwFSDd3NMymsB2MtxcOhRPFPyd5gi
	ujYjqx9ObJUqM4EJfPff9AbCX84KD6PnNIund8rnIRGMjzm8VdOv3CAN
X-Gm-Gg: AYBFou36xyT0VBnzDSDZMNo2jg7z0kw5blmvDNE4e+JXqFl66LZhFlWmkQpkeVY+TfB
	IIqWMj8xFFQmRjgafDb3b4qNnyt4/EU0BlUppWGhc0Jc1vShgylkcTRNOoE+SuVvCdgVWQXTUWs
	qHbhiolsR/j9r7yCtKhN1g0Dh3XP8li7ikcp651VWeAanni6l1LOtkpMF3Hw/Z2E9EemqwJ0qeC
	TTPhjVMSwaGCk5fPfK2yzObZYGCx7Poz+Hx0sBm5CIkWkcdZpkJ5WL7ximOj2CB+DIDniUwaESX
	RL8qdmildu3pMYatIBx/SLArPeFnr4er0EN2O3cXUyZKNuTUL3PeYLaY/wJJdS4L/kp2HAYb770
	NqRqeG4Pyy4tLnS1gtiEwcVKoF4HM0UE1YDX+SWQV2HDdZ+w3HSW+7191DfWq86QamCkfldxSqm
	FgNjZLuHisSproS6SWJvQwkzoOZ4dO43hVrjRmIQN+lsNAZzttBG80mUK2Nlyvticx6FJcaaFyr
	VCnCfIf65gpLglD1edQLylmt2pjsu3g5JtufNpq78VBi+8J0nahAmkGcfcodyovTppePdVCdBgS
	uBpwHoKjc4t7UM5lsbfQPVAdk+9xPxolqv/r
X-Received: by 2002:a05:600c:19ce:b0:49c:fc6c:be04 with SMTP id 5b1f17b1804b1-49e619f67bamr68164805e9.27.1789159222962;
        Fri, 11 Sep 2026 13:40:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6499d57bsm114619865e9.3.2026.09.11.13.40.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 13:40:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Marie Zhussupova <marievic@google.com>,
	kunit-dev@googlegroups.com
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kunit: Fix kunit_register_params_array() reference in kernel-doc
Date: Fri, 11 Sep 2026 22:39:01 +0200
Message-Id: <20260911203901.95078-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of KUNIT_CASE_PARAM_WITH_INIT() refers to
kunit_register_param_array, which does not exist. The name is
kunit_register_params_array. Say kunit_register_params_array.

Fixes: b820b9077b7f ("kunit: Enable direct registration of parameter arrays to a KUnit test")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/kunit/test.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/kunit/test.h b/include/kunit/test.h
index da5312e0dfa57f37a7e96c9e618b03b0947ede8b..55548dc54444f8c9f9e9319fbc263d93c0a56093 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -239,7 +239,7 @@ static inline char *kunit_status_to_ok_not_ok(enum kunit_status status)
  * that were not managed by the parameterized test, and any other teardown logic.
  *
  * Note: If you are registering a parameter array in param_init() with
- * kunit_register_param_array() then you need to pass kunit_array_gen_params()
+ * kunit_register_params_array() then you need to pass kunit_array_gen_params()
  * to this as the generator function.
  */
 #define KUNIT_CASE_PARAM_WITH_INIT(test_name, gen_params, init, exit)		\
