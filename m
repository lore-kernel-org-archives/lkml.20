Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475348F85A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526116; cv=none; b=bpVWLbT/Cf3YMCZHAX7GG8CFtF8xi6+/YHqPWKiBta2o905MdvcTAMx6cb48oaQW9Ba5u5IccrvsHIEf0EqZ7LiUoQeRoEtnDdJMA/jmbTXHTCgjLqJrXo8grkQn79wAKz6OqfDBmTVU2b4gOHL6WtgyVc2Hk/3sr74nKiy9U6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526116; c=relaxed/simple;
	bh=zVE2F+Q1jzi+4s7GEnyAJlcwVF7Z8vYLbY2cCvFD2h0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pOerp0w30tBqviJsbXfc6z/2UMFRGaw6XQDMj4zZxNHy7IagUONvqc4F1fMrWTJzv1l2w3yCTKa3X3HrVv/4aojChiLacIrjvkKkzwmHcxIkqv1pty9lgt2/5omufgBUfGVNvFZ/AvD5f5ABGwsr+ZOJjvPusQgG6ZSOjHbpQKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqQz6Nld; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqQz6Nld"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so729368a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526115; x=1789130915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jqQvXBnpuTjdY51Nwgka12FoQyHZLRsODERgLeADk1M=;
        b=HqQz6NldXuAz+4A/PzdijuhBCtvZoxnASR1uwDRc8sD2GDJqgnYmxKpm1fDweInbPH
         p1wtWJXImoidCRIw8uXFYWq/UNtd9KsGiMkShJ/SFNTEM5cyY91WbyXsVBHacnTCT20f
         NykST7te5beNkDdf7yqxoh7+NZYAkcfT3XsySWoUb+ko9xgwPukW9Wk3pjyZ0gH+G4uq
         O39vCqFg/7nbaRRinYe00Gs8eBiP7clFF41iCXISNGTFvcKwSGyO4/IdNI+OnMUFPODe
         smMp8NYCOFIJFndhiUoAzygb7e64knHumZalv6TPpiFr0ngdBuSpUHOW6p/sLaz9K4z0
         SbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526115; x=1789130915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jqQvXBnpuTjdY51Nwgka12FoQyHZLRsODERgLeADk1M=;
        b=i9IGtRVQKyw1TIdNZd/PAhp89fxDkEuodyao13fkJjuaFO5uDFGnHir03NeCRuDG5s
         xfgSfMjwNLSolJvusZKIDdS5tjmfb8w+NoupqzuwvJBVJ8pVqKwj8zbcmWtoV/dBbodF
         Dp/2DoPlUA89oEWrrTOR6duVHlAegtjW0S1iUxpsb3EyzEJAhr4yFGHAr0AQ28HqIu15
         d7UXJE8Yfn+WJKaJ/BZESRxyTI0nV/uqP6GkgCsZv8j+/xYu1Wk15NvKB37x9ERT/Mrz
         wCe3yxdvNGiw6LSA3cV1+/p/I+JK8r4WYkRgd1VCKirXRADgSllxxLD17Q4TE2q2q4R+
         5ErQ==
X-Gm-Message-State: AFuF++k84LRGbjiRmzIyYdf81J2Or1q6oiy3TQ7ZXoH4OzNqYvVoIIhp
	Qan87Yt8w6jAmnCydFB+6BRrK1462Z3ji+ORjciENA1nm/UNIhaamzQ0
X-Gm-Gg: AYBFou2zzpjBuakme8TU0g/suFgoPmXy2WBIRYoF2tGlwkRoFMJeSjqsvmOMrvMhGpJ
	ergd3WLL9d/OuJhyr4tQyI4ltYgnpJSmB3I4VDyKPyFoyvBIH8kLXxgaFpeU6bKYruqhwX12+hi
	CcaxCqNzTN6cuVATfOKqDFcEu1bWiqjcQtLMJ6JiNVtxOsVcFutDWb8S3/FUMFTm4TYqLWyh/IK
	VbYj/MDvdqj0OkFA4HrTw/PY7UjAKStDE02wx0JNachcCrwEYxns5RDcDofg9fuORLYzYQMVUSU
	AqrGvoXD8HdncRAIPxpr6lHS6/VsFnYq4dQKlYaqcBOx5QacWCaM5oBQOvOtXhzaReSObstTgcr
	+ME3U+zJqfBpCaoZ9hob+KjN4gd4p+055b0hA5UrnX4FBGIBPjj+RYNmMNuqcyw3rIOros919UD
	C/qLnMfCaLlkr9TFnj3arZPayki01iPFB1qK4yurZb4W1eKEGHHYnBevVKxnWE3Iz9YqyC8HcPR
	LfFqLe2c49RrUFha4PktNblfg==
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr7594249a91.4.1788526114583;
        Fri, 04 Sep 2026 05:48:34 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7322412eec.30.2026.09.04.05.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:48:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 2/2] lib: fix repeated word 'the' in comment
Date: Fri,  4 Sep 2026 18:18:22 +0530
Message-ID: <20260904124824.9585-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124824.9585-1-hemanth.selam@gmail.com>
References: <20260904124824.9585-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the second 'the', reported by checkpatch.pl as a possible repeated
word.  Only touches a comment, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 lib/raid/raid6/algos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/raid/raid6/algos.c b/lib/raid/raid6/algos.c
index 011aa9d0eb3c..182ab9844ba9 100644
--- a/lib/raid/raid6/algos.c
+++ b/lib/raid/raid6/algos.c
@@ -66,7 +66,7 @@ EXPORT_SYMBOL_GPL(raid6_gen_syndrome);
  * This is used to update parity in place using the following sequence:
  *
  * 1) call raid6_xor_syndrome(disk, start, stop, ...) for the existing data.
- * 2) update the the data in @ptrs[@start..@stop].
+ * 2) update the data in @ptrs[@start..@stop].
  * 3) call raid6_xor_syndrome(disk, start, stop, ...) for the new data.
  *
  * Data between @start and @stop that is not changed should be filled
-- 
2.48.1

