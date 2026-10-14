Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEC0568FDB
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792000692; cv=none; b=GPge2Y8FQFVo5CHiV6igAASvZZiYosyKvLaLMUiPmNEhtbHJ453FP+2IRfWxVO37h9bdB1/2dStC9IKm38N1vjhf5ylGzhrlOXRMYSidO3iKW9WMbQ4jb/7M2snjs6DKto+52yioClBSCs8xjVx/yvgWI0m5HhkvKdGmb9qjyw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792000692; c=relaxed/simple;
	bh=dtUsJXWeSz1xVwH1+9EeXPGbnhI+hff+JG7zlK3YZqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=loPwtElob7n9QhOz4yq2voC4T/HhLy0iLlwVK8EG51sfU5rkW3EMm20pYhFz7xG5i2V5hacoLDQh9rRxhbZhluvogP1LuQ9tvTM2MUj7ZHLloIPGnojlv/PKP/ucwyI/GympcHfH5vVdwWgNw12KQsfb6rBr9LTLmfpA1MQxieA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mBSJhznH; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mBSJhznH"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-917bab38b14so7354296d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1792000690; x=1792605490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hG1OkPWuMhUm94pHMuNzy2S0Df1yx93ZBtOMVZJLjuQ=;
        b=mBSJhznHRtXxbKIZVZ81KM5wfc5kRAQLnbb/jY9vVOSxzZXfQ1UtLPoi50u9KiAOXP
         WmtKQuWEzlS14WCG4fGC+nwA+jHI21Oom1+wUVSiJ6yG8oTthFDRL7LgpDZ4mCyTGXZd
         JTU7923W7ga8DFcLiSRec73UufkUFPRenbd2pKAPmuGsJKm562C/HWoWhHA8wbsXtHls
         aOw/XeGHyXifxxZIIq6XFHFxJ3H6IQWblN41AKtJv29PeksaRk0tT/RA+OUMDE5YjAiz
         Sd5GgnPZpftyI1d7R6d6CjMP5UeMTYGRx98Byrczw1Ogzv9m9ra4u74bHbNxQh6wv9ky
         fLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792000690; x=1792605490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hG1OkPWuMhUm94pHMuNzy2S0Df1yx93ZBtOMVZJLjuQ=;
        b=BJMb987gOEhHXv9BpJ41Eso/kIj5YfNKm8VZTbUBBW0zLJ2M1Fu8lqwjzDW/VKKq30
         a+H7Ns5K8n2rRaEvxb3kXR6jIRMxQq+CwnIscyoxWnQD42s8uqzWyLC+iIoBCr0FndJj
         qUBPINJHqxdNPx6UL/YN9f7ZbQpYVz5/gYKfJfdRx5JOkJKZfD6KtDosi7O8O3ioiIrb
         X1OgiIPLzdO2ngOqF/Q1eUxs/XUphelwmkeQlAOhnNmVxysX9hx5zG6ADbNDCZq3sFIl
         Gqau0AvcHvZBm6Dxk/h9VxadmMdtd4gYbnMZg1LTIpILvvMUSg1QlBXkV4mm5d54UNGP
         yeQQ==
X-Gm-Message-State: AFq9FYI8hS03U9D+rjCk2uTmNtl9RzKKISG7rfMtBB2AF0Zhlrm2ecVP
	BXIY72n+OLEgmAtr6x0qUuKtTCwul5oZYsbl2pnB+yODBXDpMUDFfruaMYud1opMgOs=
X-Gm-Gg: AYBFou3Oh1UEkFnwdcEnqNEw6C1aVw1GV8f+EULhnKKIXj9Br8mM8UJvzfRzGmAOnos
	vzPoLl5gVatatGjf/pnHNXR5jyrmDweDD7janOPnO7vV4iiBTMJOG2rRWUCkPxyC55Ps4lL+rfr
	Wm4z5LoIJHF0k9mliu2G2k4sCtpa3S0WbAL/achMVE7F6f4vNkqgFoKNNKgFLe21Z9tcnAmCBeM
	zZ8AJU3EHvtqP/tNceAKVzlEVebsRFLDJBYOlD67ftf1l2yPu2JSoNfNkoCDZNNunTh5BVkOaki
	Ur/VzrAqfuvH6Gdv+ha5hdvf8dTViIpfw58i5ZRdEv9fdZa5sZy3QlZP9gCUTWyp7g41whxnfbj
	JP0qjwNXr3u4w2T5BzHZrBMektBHDSXQEb+bgoQEbG6oxzLo/0iW9uFpQI++J9k9pHt9JiihXrj
	hJN5jA4E1QXDnGjyavRS8a0UseNh91XUcVprqMoDw+g9KJfrt41lEXOc+yrm9MrLf23F8/wxhOG
	p9svKvCDKrtCWCns7gZN5QplZHZUNEEAtA2kjc9YFXMYb+zAHCLMsRpf38x
X-Received: by 2002:a05:6214:85d2:20b0:91b:5e33:9858 with SMTP id 6a1803df08f44-91b5e3399d7mr195582466d6.54.1792000690352;
        Wed, 14 Oct 2026 10:58:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b95847sm58498006d6.32.2026.10.14.10.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 10:58:10 -0700 (PDT)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org
Subject: [PATCH 4/8] selftests/mm: check that MADV_COLD and MADV_PAGEOUT reject hugetlb
Date: Wed, 14 Oct 2026 13:57:52 -0400
Message-ID: <20261014175756.2035176-5-gourry@gourry.net>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014175756.2035176-1-gourry@gourry.net>
References: <20261014175756.2035176-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neither hint may be applied to hugetlb memory, so madvise(2) must fail
with EINVAL for a hugetlb VMA. Locked VMAs are already checked here and
PFNMAP VMAs by the pfnmap test.

Check the hugetlb case for both hints.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 tools/testing/selftests/mm/madvise.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tools/testing/selftests/mm/madvise.c b/tools/testing/selftests/mm/madvise.c
index f122154fac05..bd78f63f1314 100644
--- a/tools/testing/selftests/mm/madvise.c
+++ b/tools/testing/selftests/mm/madvise.c
@@ -127,6 +127,29 @@ TEST_F(madvise, locked_vma_is_rejected)
 	ASSERT_EQ(munmap(mapping, page_size), 0);
 }
 
+/* Neither hint may be applied to hugetlb memory. */
+TEST_F(madvise, hugetlb_vma_is_rejected)
+{
+	size_t size = default_huge_page_size();
+	char *mapping;
+
+	if (!size)
+		SKIP(return, "hugetlb is not supported");
+	mapping = mmap(NULL, size, PROT_READ | PROT_WRITE,
+		       MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
+	if (mapping == MAP_FAILED)
+		SKIP(return, "no hugetlb pages are available");
+	mapping[0] = 1;
+
+	ASSERT_EQ(madvise(mapping, size, MADV_COLD), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(madvise(mapping, size, MADV_PAGEOUT), -1);
+	ASSERT_EQ(errno, EINVAL);
+	ASSERT_EQ(mapping[0], 1);
+
+	ASSERT_EQ(munmap(mapping, size), 0);
+}
+
 /* A zero-length range is accepted. */
 TEST_F(madvise, zero_length_is_accepted)
 {
-- 
2.56.0

