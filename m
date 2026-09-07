Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211AF432304
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788767946; cv=none; b=L4fWDkydzRThtzvXEXmDoknNEugGacMRXhSUL8sB6JT1ZS2cfqlU+iVDsdrYANsOW1Au/YzZerXw4iuX6A9zwbqqbPxbgaFKbqVIUY6wvsCtibUuIjTLtcpUzfV2IObQFSK41N14TS6BoKIyX+dWYmk/swwu7kEWfbQlAaDx9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788767946; c=relaxed/simple;
	bh=SyylDsQDIUbzKF+su1zxsOWvOHQVcOWya3vOlSyDT6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VBlgz+ovE8OVFQQZ2Ki6YXeZ/BhmLEYwrz/tOz4xZAeQQZdYMdZqP+fNCosZNQ4JLh8Ir/tP17Yf53E7PQPpA5vfvfRzSI4oDkdpc62BIp6NlURAqaqnsO9+DU6uPPajUPBR2BARMWxfYWf6T0ayqetlSda8E0Ml9YMtXtgXx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JZJgmXW8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JZJgmXW8"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce98cb8165so32169475ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788767942; x=1789372742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ki/BSl1uDM28DM7EGgocp0IxhtJCInGP+RpfNAELt2Q=;
        b=JZJgmXW8JSdqX8cgoYgSajOQhnrPMA00kOAX+i2UddWavTzUs308C8h2e758STI2ED
         X5PYAarof4bLfG8ze4CzPkIO8CQVwHdSrj71WefuyObOT1JPOyWHRUKpJzWjlrGBqNfe
         /XaG8vsa6aul3RzMukUrSInd0g3zVW0wUxkBYTkT35sIqg2xi/gQBaP/WLZOgGaBRlVt
         iOEgGiPFF572PPgfx/x20gDnlj/YAp5MHK82z3MYcAg3f5u7GLc2hfsFf2VPj06IuFJn
         gLf34A05NVnHnHS2xiLhm2tpx4UKVOXsnqE+MW2LFvzOBqS3wq6b1awZMHp+VGnf4g6n
         gIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788767942; x=1789372742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ki/BSl1uDM28DM7EGgocp0IxhtJCInGP+RpfNAELt2Q=;
        b=VNeMCvcwf+N8vkC7wHhywY4k6MGwawd2PezkD7dx0Y9QqEuHJMhxiDpcqTYojlq0Z5
         AKDB/ZRQHwSPu+hkl09sRU6A9uoaeSVSDVOdAbJ+WRyiZVmY/ohjyllZFn3OeR4IK14k
         2fWV0b4u8bWb0RGmtQZhUM9rl05VKkNwN1dIs6SWqdd2kvhNXbw0J1S3qoyxGt9fOvhB
         Lc12Iy/2kLIRZhTI2N6DUBjv4Tjx7DqZK+EGesx8My8TriJ7NadQFV1hxUYhgVq5VNaD
         4hMnYYB2Qk+s0zZFqOw1JqDgZlxgLnUJ229HulWHKmPacWXHehK74dFlKZZ+Z+SHi3IT
         PGCw==
X-Forwarded-Encrypted: i=1; AKwUvBz4aYvRA5WoHI4b2Yn5FWwau4dXJVDhK+D7DnvvGjqVS4splFa8TbCdDPdWBdg6iD4lKGpJ9VkSIVQc2FQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lYx0aC6UwRHFeQ34+uI7cpEqI5lUxGkxobqA4NYfqZFKRYF00s
	VtPqYo1rFaDVKzwPaSVnNTsnwhwBsWoaD+oUSjhkEwiTgUdc3sxtOspp
X-Gm-Gg: AYBFou2GHMYx6WtHy/AzEkMNyD5VdctPOMBpJnwSKGtKIPBikLJAJD5mMjrGdcTc8mD
	RDv59PrJkrKhzpUCrmntf1+jAxMZl1fxVO2cw0Mj+qBc+t//nwYVDXkrrCJeA2yQnDp2cE9CZ77
	2n/NGKwBR9Z7Q3/iAJcHzNLsfRvaBDgg9McYwT2eKY3ZQBgFEsOx9myiuzaoaqvkKz7oiw63zOz
	peOF+cJc8eDFmdVMSByemYmVJ3Ndq3V1ENEWsXXLoc26Ukq96UyxmBqFkakdhG2eYemo07oAQ39
	SL+NoLVaolrGiV5+gULLjF+C7y2XkJYhUr1dPjgkciJAb6hlB8kMU2SKMuEwkrWmwbLrVTgReqT
	FcJlhfOVmIPA725ckLlxb280Wy1KVbZRefuwiaFDeoAbGogXNfZVTO0fPIEblRMhpNjEuK1w1Ms
	C/K5sfySIdkg1s/Ta5rTSs0BjupbJWWudCRND+liK0d8509RosJybI6uIQtulgZobkz7zD4fU3o
	kcWF3Y=
X-Received: by 2002:a17:903:19e4:b0:2d7:1cbd:9ceb with SMTP id d9443c01a7336-2dafb0af1f3mr246588805ad.12.1788767941401;
        Mon, 07 Sep 2026 00:59:01 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae7637sm40945595ad.79.2026.09.07.00.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:59:01 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: paulmck@kernel.org,
	jiangshanlai@gmail.com,
	josh@joshtriplett.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH 05/13] srcutree: Honor is_atomic in check_init_srcu_struct()
Date: Mon,  7 Sep 2026 15:58:21 +0800
Message-ID: <20260907075829.2073224-6-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907075829.2073224-1-kunwu.chan@linux.dev>
References: <20260907075829.2073224-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

check_init_srcu_struct() drops its is_atomic argument, passing
hard-coded false to init_srcu_struct_fields().  Pass is_atomic through
instead.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/rcu/srcutree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcu/srcutree.c b/kernel/rcu/srcutree.c
index 533607de5728..2af36db37fa9 100644
--- a/kernel/rcu/srcutree.c
+++ b/kernel/rcu/srcutree.c
@@ -522,7 +522,7 @@ static void check_init_srcu_struct(struct srcu_struct *ssp, bool is_atomic)
 		raw_spin_unlock_irqrestore_rcu_node(ssp->srcu_sup, flags);
 		return;
 	}
-	init_srcu_struct_fields(ssp, true, false);
+	init_srcu_struct_fields(ssp, true, is_atomic);
 	raw_spin_unlock_irqrestore_rcu_node(ssp->srcu_sup, flags);
 }
 
-- 
2.43.0

