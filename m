Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7A833C1B6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192825; cv=none; b=tOmo7J019E8ZzqL+9WKDPJDAkZQbiAzwpVJ/Hxrg9gthLg93Fyl76w7DZiWLT420e1DV7zvHMg4QXKuoU84DdxN404bfYtZfk05tCv/MH0LIDlRJMn/cRiH774MpT4ca5vq0navu+YMovJKBkosfZuqGyEMpMlOZxLYn/ohHPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192825; c=relaxed/simple;
	bh=fAIaiTDWbAaKC2FvkE6RW/ZZkKo7oGownZgGjuo30sE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A59FtWTj33aszCQaOvHQyMcAX8pF67+LF6LYIUeHeeL7AvYptdUUWr49vIRaZyY46dNarughIbibDUyYQWVdZzJL9u8JJVVoQxOC820J6k/+LO85zAsV+cQesMHhf96WXXdgey3KPG59VUadHsKw3j6zrrslQPc8AB1MWmXG1PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLqh3usi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLqh3usi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48586861639so628203f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789192822; x=1789797622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zrxe47ZDJR0ZZ0e38jkzInleCbu1SGnjFyxJKHf75s=;
        b=YLqh3usiW3kKQGGy78nQNZr9XCPgmlDty/31iqpCAWTv1Moi6OXqEtzi3O8uW8i/x4
         iHmaBK19NdtCCRHp652WmKgAYzr2sxnqvJeNiVykiA9ehXcq45rLOcNLGW/fPlOqVzcD
         J36ZEX1Y3GoWtCViXGgl0mXznoJ5hoqqYUGEcfkWGa+GowIH8ObZEO5jjKCjpF5eh5sH
         BWBAIC4pRFijHUW55urkN3h8jVQviE8f3lnu0m6pCytY8Ks+hQo3BHafTRt4x5FCrcA7
         zP5UWu3Xa/JSIZT4i4Y+zyNk8sPuPrOlFhZZOMQ7ayrGplHX4O0mqhFxV1JevQn2DS4z
         OotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789192822; x=1789797622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zrxe47ZDJR0ZZ0e38jkzInleCbu1SGnjFyxJKHf75s=;
        b=IX3261S4XnNYdx1V74+xL3nO2Zmv6Yv06+hTYBkcQWyBKufBeBtv1nYAGAZX7uFyUQ
         k3TQIy1yj614gq9maHAwNyUa6OgVhOg1KEE/iseCUpCgU0Lla8HiXzQDKp+yD3jiUDfM
         7i86MbL8RiY1iEOQA4TVZGe6KG046RrKnvaCjGsTycSYQBQ7e0GlebXHJ58QA91jqduy
         qzX1XD6PRgRU9HUgRV/GVZ+65WQKwRjsHbsapPY7npEJCs5AySlQ382LHeoajYZFBjlY
         lsAYGeoZhW8zByHYk7fcmHqrGT7HO73CzR0Q7eIJcM1tpuemeYt7aCItt2IAdz1N2w0c
         HxTw==
X-Forwarded-Encrypted: i=1; AKwUvBwKJPX2Tqv0lkljS5TeHlpIR9DmJsAYgeskJpLuEqpXcTcHKO/cHhhGoIOmoR2c+Q1K7vZp1coVicozysU=@vger.kernel.org
X-Gm-Message-State: AFuF++kkxAYMAMXby2f9oJJB9VyHWUjKP6bXQP9/2sZ5zxPYhLhwn3iY
	pq9ffew7UP8HY9K6UWrvaRJi1XfjdxzWqeaCG5peNLVRz5pqAnYYiNWW
X-Gm-Gg: AYBFou2VMC4qA5CQvaMVPR+gG13d+LoqU0ze4gUGYNqO8VyRl1u/6lomDj62rZLe0ph
	r8ae7OkQTiRpLM+4dbjAZbnNN9U/9xka8kcE78isxC94tYZjHkjhF7dR+NrWLZqH23mCOvS4RKv
	kPcT2VjfAzoLYUlvTlpllrgRStj6Yj42Hwa3/7tXBMn+NsU/LQAnRfa+FdbXbh4wwWdfAPmzxY9
	QBpcwkveXIrTIuscd0LR2SPRhh5gLX1W14MKIAiLXJIgNPpiMbaWYpPvB/2MHM6AOooaA3b28aH
	k9TFP93PfnCvo2D3IhWF+8JadqeklljnN+StHdBiAz6lIdrDB9zmeDv9hZ/V+DwK7rJF5DrV6/N
	hHXHG0dy72xm5GYwoqk/X0lb5O/5Z7JM0aHOKowgI08jIFq4srnaDLb6o1P13V6+ZXzn+HeCw2X
	3m9tnBvvubcyKSHVl+E68kzM8WrqCVz/F+leR/WLchnY4AMYCzPl5DfsEUbFTCCYuv3C35JvXgu
	klQuYTC2HYbQCl3fW971WO7k0gAS1aBwyEBdZHmgD1ZwgcwrUsAXb0Kv0fJmuWsKFfxUwYv+vVs
	ZNZkIRpwYG/7QKIiRb+U9VuPCl2tPqs8PxRtfsWae0K2P5g3G6eistWYOTRUKQAcXqKUp44CVCL
	TofBP8VQ=
X-Received: by 2002:a7b:c8cd:0:b0:49c:e0e8:bd94 with SMTP id 5b1f17b1804b1-49d26d72858mr122826695e9.1.1789192822406;
        Fri, 11 Sep 2026 23:00:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm9654062f8f.35.2026.09.11.23.00.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 23:00:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Yunsheng Lin <linyunsheng@huawei.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] page_pool: Fix page_pool_alloc_va() reference in kernel-doc
Date: Sat, 12 Sep 2026 08:00:19 +0200
Message-Id: <20260912060019.39902-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of page_pool_free_va() refers to
page_pool_allo_va, which does not exist. The name is page_pool_alloc_va.
Say page_pool_alloc_va.

The wrong name came in with commit 8ab32fa1c794 ("page_pool: update
document about fragment API").

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/net/page_pool/helpers.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/page_pool/helpers.h b/include/net/page_pool/helpers.h
index e2730dd273b2843b790811d1a6a5f5acd68d3ad3..87a4e13886e15edd4942a933edee63f26bd15a80 100644
--- a/include/net/page_pool/helpers.h
+++ b/include/net/page_pool/helpers.h
@@ -417,7 +417,7 @@ static inline void page_pool_recycle_direct_netmem(struct page_pool *pool,
  * @va: va to be freed
  * @allow_direct: freed by the consumer, allow lockless caching
  *
- * Free a va allocated from page_pool_allo_va().
+ * Free a va allocated from page_pool_alloc_va().
  */
 static inline void page_pool_free_va(struct page_pool *pool, void *va,
 				     bool allow_direct)
-- 
2.39.5 (Apple Git-154)

