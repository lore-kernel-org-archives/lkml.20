Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2698481ABE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789397715; cv=none; b=H1DC+xm6G7qhcHztybU5FZEatn67tGeyvQm4bUW4IzgoeF9DU8cXHEkb6eQmsTUo5FsZyoTftHbRZ1za/0trTBq381vdJk4LUghnsAgvKs+hb/rAa+1XXw3Qr4yyw9azFnDGfkU6r4Ecveef+iWIXlLgeqW/2wWALoFGXj4ihzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789397715; c=relaxed/simple;
	bh=7RPJv7BhuOaAk+Mo0IOhmSNSIZQ5l94dLDpG1fs2pa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8QFzxTjatb6SbfdceSfEpn28F34Lod/Pqr1qWGsbUnA/swnjODoXSpgfboI3LjAGl2rhzyHnO3Urf+sgUvh5hNQYgcn7LsRE05LFJWAIoMkk2KjGLID1W2LGTtXxU1U2tAu4cao9O2i18Nb56Z53FGO+Ijr52QRgITjZfIM7EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V5k7ZkI1; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V5k7ZkI1"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8692a856865so2545569b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789397713; x=1790002513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mmvklgvi0ef/+u5dzaWwSRR1qwVq3sDKvk1AzDRlDKI=;
        b=V5k7ZkI1exdUJwB0QQ1Mamh3QBtnjzpKGTJWi1tE8mRHrgf/KWYsJLBixMnJrWNjZT
         Ewa3m5PzP4hbPv06vOMq8W40FPR7j79Dy5gZS1VBshz7PLzuGIn+OgEGVwRHeO3G6SDe
         edAYhvqxbrsQXK5huw9QNASL/kmuYBRovLFoeEDVG4fjwtpYV+jtnJUExz8uFWT6RM3/
         B3BC3R5WH1jlDteHRv4l8lOT97RQ4xopf4OJD2zOWNBEkn2UR2jnH9X3K0Z3QnJnEsz9
         4pKCFbyWx9EaNaKgXdguJHVYLFjJVAMihpJodGgHipRp+tC6NGuYSfpNGofuDT6XSuIe
         Z0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789397713; x=1790002513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mmvklgvi0ef/+u5dzaWwSRR1qwVq3sDKvk1AzDRlDKI=;
        b=Y/budyjm+Vaf6iPDUr6ypIn3hdVa5AzUm7xKru6P3vCXhQetoDazOq5rmU9CZyF4p1
         fccL+5CzV/d6eynKajXwTUZd6j2N2o0jtTC8B+1PRdLjf13W4HdPgrRbWuBXNyKLOBJR
         d39leM7Wg+0/Gii5xEbdREheRhKXlk7nt3CeSyImmWXhCRjqyp0gpqUWUXYcoLzYq0Yy
         uELt2wbfKIvd2NJXdJV4UnZQ2zKIXE3Kyvn1QmWdZzHEDSjQrnz1yN4LpgF3DrqYGtgG
         tTmcJkk6fYsJdKv2qGP2N/DWl48K0co14WmY8dKiKyjHvX0RTLkxV7MEshUmm4Y3QnhK
         T/XA==
X-Forwarded-Encrypted: i=1; AKwUvByfsYFoKSivy6mmccgSY3Y1ZYSJjZ7LvHBaV06H77mr7r3yRzRfs/Vbc6Ql5qmIZSZ7UMla/+PXDgX3vrw=@vger.kernel.org
X-Gm-Message-State: AFuF++n1kEDDmjgYqzUNwgPG2JdtM0yoYKlpgn3qyjZ9u+l89y1W9IZH
	CpE3gHbdADafjrzL8S10opVwm5ZKU15bsCFT2vfMvTdp2LxzhkKOJzyx
X-Gm-Gg: AYBFou3WP52Im8FBUP0IcjKwwPRkDUH46GtZZnFkswWnyYLwvvw63TDFV88rOnhHXMd
	P6tN67aww0D1iT5edobzuDH4+ypK3wMOfwcp3VNRznEIMntUjbCeSo9hWulCkiV+biNn1+esZhD
	OQ31NaFxyYl59OO8T5NPjpiMsQB/ptzHu/qGcDIQvWa9ldIZaeV6zrq3QigaC17E7EnXsnrRjh8
	IForOf/6FGA4A0XdlIh7SympIasXcLqSCoctac1+GdsfPQk+E2y1lAVIwrIXgRS3/Atoiu80WUw
	5kcjT8mZe23xS9KrWRS6aGmpI/RtWvz1P2ffb9XhC98+VQuSMYK8iqs0Gj4QHvC95h2uHeX5zGq
	60FsCVUQRUb+IAuXcp384lVwmuEb5hKBQUcc63xpsNOHhZOIT746P6j057J7upTsAlbeTiupb9j
	XO7jBdLoS4UujzkwRCZWzf/PpYOwiZx0InxMb6+iRK6hbK1glNG+rJjUZ9DUpb0P1mFRQyvAtcE
	1Oj9D5dCDy11hH8adXkBGQD6YuHeuSlG9lGWFM=
X-Received: by 2002:a05:6a20:a105:b0:3d0:ba81:79b9 with SMTP id adf61e73a8af0-3db4052bebcmr5751503637.12.1789397712639;
        Mon, 14 Sep 2026 07:55:12 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c615a65bsm5338805a12.3.2026.09.14.07.55.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 07:55:12 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/3] wifi: iwlwifi: mld: defer freeing PTK PN state on key failure
Date: Mon, 14 Sep 2026 22:54:32 +0800
Message-ID: <20260914145433.42830-3-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914145433.42830-1-enderaoelyther@gmail.com>
References: <20260914145433.42830-1-enderaoelyther@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PTK packet-number state is published to RCU readers before the key is
installed in firmware.

If firmware rejects the key, the error path clears the pointer and
immediately frees the state while an RX reader may still hold it.

Defer the free until after an RCU grace period, matching the normal key
removal path.

Fixes: d1e879ec600f ("wifi: iwlwifi: add iwlmld sub-driver")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/mac80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
index 3a4c8fda68d0..693f2092a781 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mac80211.c
@@ -2265,7 +2265,7 @@ static int iwl_mld_set_key_add(struct iwl_mld *mld,
 	if (ret) {
 		if (ptk_pn) {
 			RCU_INIT_POINTER(mld_sta->ptk_pn[keyidx], NULL);
-			kfree(ptk_pn);
+			kfree_rcu(ptk_pn, rcu_head);
 		}
 
 		return -EOPNOTSUPP;
-- 
2.55.0

