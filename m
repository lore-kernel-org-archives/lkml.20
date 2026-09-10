Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA5352E06F
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059181; cv=none; b=e3gz6mj1Bc+LarlazamMjNwmxfCY5x9t5Ricys9Pj3WsuSzpK73wvZ63S/vyCEOjq6XOyFROwB4fmFHadVLwWwPYPMPXohc1kOR+WnNnCFzpmSzkVIm4wVbc/ze6eGz2hDFHkGW3MGdYodURocyDYswDmaQp/m10SvFU0uyj+5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059181; c=relaxed/simple;
	bh=IUh1cWchmC0vld51ke7tyVFS0qPx15TlB96mZ8dNts4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVO0Sy2Ht8UdJMcK2R/AQTmBVM/17RdEDfDKc15ALB+VOWK8+BGroIW/eysmWc42I8Bo2qjnAQOM0fIlpeW9miD9p6YeF2IVb5Xz22GgqhoVIfohoEuygSZkONQwrA7k/SHnDbbGaA0En/RPDmluAqt9yj4RlE83NutBmrvl+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0xTAEql; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0xTAEql"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-398c1101c1bso6903349a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059176; x=1789663976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tyS0dUys65sGsGrVA9hi3CkVbRxamfGAlz/CIe+hAe0=;
        b=Q0xTAEqlQHR+lhWxzbXufxvdVq9tgLfjuV09WToxglPDJnPDwieUvc4jeXzYda7y43
         rl+/PQLWpHwtgnaFgEfNu3tbL/n48o7nmp8qbnCQdliNuF9zikCoTznFG5kWumjiPnri
         yTaiNDh49EWz2qjwhYgv8p+ga2a4G+BMWuMdOVy3JBKBloQITSl7bb0I3iCVNQCimCsV
         kfbXgqSvXjg8ZoIE7PN56wwUParWGpuJaWPomflRLa3sVZATienHN3LKrJZa3HNAhynz
         MIMOItOpzvjAzoamESmQ0uTKpPnu1W8MH/ERG7L8dnGxL+0hvIcPKmsG1CftmHNwG1go
         n+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059176; x=1789663976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tyS0dUys65sGsGrVA9hi3CkVbRxamfGAlz/CIe+hAe0=;
        b=dSgGYOPYmeuMOoeMuuq0AmH6H4kNBTGqynqOQHwVv8Ov5uY+7wOUaQRoxLoRVsiJet
         jybidsqtRNHHg3qIFGUhoOBr+DPTIPUiVmjxuDpObioWyWgv8cHJ7qZMl7zTcM7Ej78N
         OvCZ1r1Y3WGsWpQzzys+BxUASvULlL/ZHaOj9D49bn21l6YR6xC+o5kZWt86+9FlyMct
         UyLMaT1NVXR7GRin95eYNVC7uofw0OkUCqEcIOeFMEiQfAoUu3bEs+y9Va8O7/hqiGmh
         sWXUDmD6Q4q5ecB3mtcAYqZQjMKaikvMF0ZqR61Wv+9e2nMbSfk3XchTRsOfqIY0PZ36
         y4Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzpWYOsauxGTn0dReol9Wy1wWlh7CvdtAJG0Stuyb6ndDtFGCMDBuIOnCtLX/mf4cx5jQs7/9PU+Yn6uMM=@vger.kernel.org
X-Gm-Message-State: AFuF++mCpjRjMryZW4ICfFxaDMesprb1cLEKD0b6663c9y59I1tpbBBr
	Vqvearz7mBKX6HfE4kz6w7ZXoxUm7fyI6sRmtWRKSpyWHWnwooQ6EbrT
X-Gm-Gg: AYBFou1anFjTY1Td9BheNBt2ZjY1F+DTQAoJrTTeeC650JfXvOsmN/egJAnqGVTA7c/
	zs39j7dvRFy9GFO9q7Tt4JLLt3ducvBKLTxrG8FOCFb0ZeyfGqvR7/xhmncAi21PPm42YondRku
	/vjjwoiA26nioCupDFZndouD5kGYJqYY6Oxe5wn7wPabdSMuyCCtEOJqjX5jzE4gcNsWec/njM6
	dmIvrUpprh3myOty2A0eejGA5cOpehZE2u6hwvbdTmvfgRkUDWVjYvPMn2ayNENbQ1BVuiSeaBl
	LKXzFsEY56XhP26r85jHrfbzUBuw2jB2gu/hcW7Sl0VVqw8S92/NF+ty+T6rq/6uBGclkY1jqnf
	stuCBNMwL73qjmsj5PBkJmnqA30hjD4nIcnJoe5H7Zvu+2NPO2T4QrlwoMRxTTnNkSJpjB45gQ/
	8utDFqUnJNbqrz9f4c75JW/9Isx84iXkR6QkAmNAqZFZ6HuhXmU5FIqqYXgEvbBC9nKrfTsUA9B
	HZ8dn/pQzVsJpkWFhPXQD/iM3xrb5kcwt3VQ8F+0+2JsP/JnBeEu2EddqeNND1WXtPJQBiG67IL
X-Received: by 2002:a17:90b:4fd1:b0:398:bd37:6a49 with SMTP id 98e67ed59e1d1-39b261cfd8cmr63877483a91.12.1789059175828;
        Thu, 10 Sep 2026 09:52:55 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (202.176.229.35.bc.googleusercontent.com. [35.229.176.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e602d8sm64821a91.3.2026.09.10.09.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:52:55 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: song@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	akpm@linux-foundation.org
Cc: jolsa@kernel.org,
	ihor.solodrai@linux.dev,
	martin.lau@linux.dev,
	yonghong.song@linux.dev,
	emil@etsalapatis.com,
	mathieu.desnoyers@efficios.com,
	hch@infradead.org,
	jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com,
	marscheng@google.com,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 2/2] Revert "lib/sort.c: add _nonatomic() variants with cond_resched()"
Date: Thu, 10 Sep 2026 16:52:21 +0000
Message-ID: <20260910165222.1186628-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
In-Reply-To: <20260910165222.1186628-1-visitorckw@gmail.com>
References: <20260910165222.1186628-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit e2a33a2a3258794891cdd6ca4b1318da6594d157.

With no remaining users in the kernel tree, remove sort_nonatomic() and
sort_r_nonatomic() to clean up dead code. This effectively drops the
wrapper function __sort_r() and eliminates the may_schedule branch and
cond_resched() call from the inner loop of the core sorting routine,
slightly simplifying and optimizing the code.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
Build test only

 include/linux/sort.h |  11 -----
 lib/sort.c           | 110 ++++++++++++-------------------------------
 2 files changed, 31 insertions(+), 90 deletions(-)

diff --git a/include/linux/sort.h b/include/linux/sort.h
index c01ef804a0eb..871775978af0 100644
--- a/include/linux/sort.h
+++ b/include/linux/sort.h
@@ -23,15 +23,4 @@ void sort(void *base, size_t num, size_t size,
 	  cmp_func_t cmp_func,
 	  swap_func_t swap_func);
 
-/* Versions that periodically call cond_resched(): */
-
-void sort_r_nonatomic(void *base, size_t num, size_t size,
-		      cmp_r_func_t cmp_func,
-		      swap_r_func_t swap_func,
-		      const void *priv);
-
-void sort_nonatomic(void *base, size_t num, size_t size,
-		    cmp_func_t cmp_func,
-		    swap_func_t swap_func);
-
 #endif
diff --git a/lib/sort.c b/lib/sort.c
index 52363995ccc5..8e73dc55476b 100644
--- a/lib/sort.c
+++ b/lib/sort.c
@@ -186,13 +186,36 @@ static size_t parent(size_t i, unsigned int lsbit, size_t size)
 	return i / 2;
 }
 
-#include <linux/sched.h>
-
-static void __sort_r(void *base, size_t num, size_t size,
-		     cmp_r_func_t cmp_func,
-		     swap_r_func_t swap_func,
-		     const void *priv,
-		     bool may_schedule)
+/**
+ * sort_r - sort an array of elements
+ * @base: pointer to data to sort
+ * @num: number of elements
+ * @size: size of each element
+ * @cmp_func: pointer to comparison function
+ * @swap_func: pointer to swap function or NULL
+ * @priv: third argument passed to comparison function
+ *
+ * This function does a heapsort on the given array.  You may provide
+ * a swap_func function if you need to do something more than a memory
+ * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
+ * avoids a slow retpoline and so is significantly faster.
+ *
+ * The comparison function must adhere to specific mathematical
+ * properties to ensure correct and stable sorting:
+ * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
+ * cmp_func(b, a).
+ * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
+ * cmp_func(a, c) <= 0.
+ *
+ * Sorting time is O(n log n) both on average and worst-case. While
+ * quicksort is slightly faster on average, it suffers from exploitable
+ * O(n*n) worst-case behavior and extra memory requirements that make
+ * it less suitable for kernel use.
+ */
+void sort_r(void *base, size_t num, size_t size,
+	    cmp_r_func_t cmp_func,
+	    swap_r_func_t swap_func,
+	    const void *priv)
 {
 	/* pre-scale counters for performance */
 	size_t n = num * size, a = (num/2) * size;
@@ -263,9 +286,6 @@ static void __sort_r(void *base, size_t num, size_t size,
 			b = parent(b, lsbit, size);
 			do_swap(base + b, base + c, size, swap_func, priv);
 		}
-
-		if (may_schedule)
-			cond_resched();
 	}
 
 	n -= size;
@@ -273,63 +293,8 @@ static void __sort_r(void *base, size_t num, size_t size,
 	if (n == size * 2 && do_cmp(base, base + size, cmp_func, priv) > 0)
 		do_swap(base, base + size, size, swap_func, priv);
 }
-
-/**
- * sort_r - sort an array of elements
- * @base: pointer to data to sort
- * @num: number of elements
- * @size: size of each element
- * @cmp_func: pointer to comparison function
- * @swap_func: pointer to swap function or NULL
- * @priv: third argument passed to comparison function
- *
- * This function does a heapsort on the given array.  You may provide
- * a swap_func function if you need to do something more than a memory
- * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
- * avoids a slow retpoline and so is significantly faster.
- *
- * The comparison function must adhere to specific mathematical
- * properties to ensure correct and stable sorting:
- * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
- * cmp_func(b, a).
- * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
- * cmp_func(a, c) <= 0.
- *
- * Sorting time is O(n log n) both on average and worst-case. While
- * quicksort is slightly faster on average, it suffers from exploitable
- * O(n*n) worst-case behavior and extra memory requirements that make
- * it less suitable for kernel use.
- */
-void sort_r(void *base, size_t num, size_t size,
-	    cmp_r_func_t cmp_func,
-	    swap_r_func_t swap_func,
-	    const void *priv)
-{
-	__sort_r(base, num, size, cmp_func, swap_func, priv, false);
-}
 EXPORT_SYMBOL(sort_r);
 
-/**
- * sort_r_nonatomic - sort an array of elements, with cond_resched
- * @base: pointer to data to sort
- * @num: number of elements
- * @size: size of each element
- * @cmp_func: pointer to comparison function
- * @swap_func: pointer to swap function or NULL
- * @priv: third argument passed to comparison function
- *
- * Same as sort_r, but preferred for larger arrays as it does a periodic
- * cond_resched().
- */
-void sort_r_nonatomic(void *base, size_t num, size_t size,
-		      cmp_r_func_t cmp_func,
-		      swap_r_func_t swap_func,
-		      const void *priv)
-{
-	__sort_r(base, num, size, cmp_func, swap_func, priv, true);
-}
-EXPORT_SYMBOL(sort_r_nonatomic);
-
 void sort(void *base, size_t num, size_t size,
 	  cmp_func_t cmp_func,
 	  swap_func_t swap_func)
@@ -339,19 +304,6 @@ void sort(void *base, size_t num, size_t size,
 		.swap = swap_func,
 	};
 
-	return __sort_r(base, num, size, _CMP_WRAPPER, SWAP_WRAPPER, &w, false);
+	return sort_r(base, num, size, _CMP_WRAPPER, SWAP_WRAPPER, &w);
 }
 EXPORT_SYMBOL(sort);
-
-void sort_nonatomic(void *base, size_t num, size_t size,
-		    cmp_func_t cmp_func,
-		    swap_func_t swap_func)
-{
-	struct wrapper w = {
-		.cmp  = cmp_func,
-		.swap = swap_func,
-	};
-
-	return __sort_r(base, num, size, _CMP_WRAPPER, SWAP_WRAPPER, &w, true);
-}
-EXPORT_SYMBOL(sort_nonatomic);
-- 
2.55.0.1003.g10538fe699-goog

