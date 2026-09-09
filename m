Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD0D26AA91
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914239; cv=none; b=KmTbnfV/oEfT3yDNbkFWQvQ3xww6wlpFsjQ0bQl2rAIuUHLTOl5U7tOhtA1S7o2LIdDNJZRVqYuW5omz+HvfunbyIBqxL8N9nNbp+P3lju+VVe71nhlw8kozcw+mmp8jUGx2+CPNGnNYj+s+KmryswDigYCIr0NfmmvQH06Uk0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914239; c=relaxed/simple;
	bh=m3GEUOgCSooqxd20FR5pAP9Qje7N2rXhHtCpCszdSMU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RB6zObD5Ck4JQzFW9P/pX2qiStiM1EmfkuBjlimh5wPQxz0qo54CVwTOxKKk3JFN2rJKv9hsQ8og0fm+kJ6g5oy6nelEe5m8zuh8CR2ooozTjojJiSYGltLEksAte6yH4ekLegr2eZzVZZOp9Co9ni26wNBncB1fHzr+LhyN1A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1H/FUjT; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1H/FUjT"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d28035so616764b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914237; x=1789519037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3DIfLClOscXDd9KVxJaaVjKVKAOJFDQ3rKOe0P9cdo=;
        b=m1H/FUjTYO/tvxuQywuzdaTrnnmHwg/EDWb5VoFI3K28ItgtR/Ud+ciRlzVdcHEm54
         zK2OV8yS1aNhdBjEuFGaFq7Wg/Tnyws4rEqAcq3idC8OweWupq63/xrujF7te5cP59A7
         qibkBDeYySPvVpH/mU2NKmper1HOBIvDU8JFJ/SHj50vJrT7nWchKA16qjsB2faX93GX
         nfRU8Eu9dWIkThJHWSRXyMMaudwsQWhRhhH4YT16bhXQAgZCQlBTTymOX0/jComjAn5M
         imt0jcCoez7UxscUVAL8bHy3y4PCYsf9vTj1cBu3e8NKj5INv3acR02LfJHXuNMLBE6c
         rHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914237; x=1789519037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z3DIfLClOscXDd9KVxJaaVjKVKAOJFDQ3rKOe0P9cdo=;
        b=dLcWzzTUHsKAidKMnsB5AuXXLAx0TunLGxVI7dP7G6cekpn4HqAd+RwcDHsJbMqM1d
         L5DnfBuryaXZwlfNcUic/3SLkdVYCcPmqvav4eseEIH2KTYb9Hipsjq7PG4BCuNy6wJt
         BsUb9u77AMuSzWQYxBB0dFQml8atHv1kJko2u/SV4AGP6OL4CYFoBM8pV6I1BWsv3TMd
         UhmXsA3ZSRRE+KpKxjDOnx8VbByXLdxlXaY0eII9B4tYCO2Q+mgCRTOikEWfVwcyqNxT
         dv2Ch1Zn10rTJdu2qvJpoC1QOMZJviMUO++Xc/ZXM5uYCCUb6Y4AaFiPw1fYP1wHJfzm
         buFA==
X-Forwarded-Encrypted: i=1; AKwUvBwpgWF0kC0R5VwijcMw+/THMQEzJe62ZvmOfkwYGqIpCoQ+V/SiwNGQA1oroUxPNd56/+ZGQDoEtke4i0A=@vger.kernel.org
X-Gm-Message-State: AFuF++kRxAmQU7fe7nNPR0UBXNSQdABP0Cz+zQfniMVtk6Ln/31zutNp
	fERVQUCWE0/6EQn9V0/W1PFuCSXDTCzmq3WceGgEjCwI6NbWli9vr/Oz
X-Gm-Gg: AYBFou0hhAVHWznNBVFYZDebYSPca33LiZe2yaBcqrdOUp19ZVJEfrtExYfnNujTt9W
	K2l5Yc9QWzM3zOgI36BuFs0ClBpDHWvEavSG2YbckKNUVcT09fdmvORqk56JcC86GzMEwPbqjwj
	Yzyc7NpToN7LYlK9WVEkCgtF19XzMrdg1wgvJ5u5dWYolvPpj46qst8usc1HHCkXRzn9ILqujn9
	6y8kcATcz+LRHMYpsCtifJzzWoEGWc1c1vO6aR7SkT2aRUFjWn5QNMjc7xt+P6Y8UynYB6WdXwH
	F+SCpm2inSMnbmtx6nMHiXVBPoHvJzV5kc73UugX5Haa8Z16cybr0lRJqprAXpcfwFUJcFDJtV9
	2cnlL333CY9zEXYJJJOwUG47fseFojTBZ/dCOWVX55EdoHU3X1ObGGpao8dD3UEPab/zxY/ExbQ
	NNL7CZzgFzxDZCT6T9MRZTa1SoUFjzNGcKxBhk2rTcMCE8jvyKCIMEfzHkJBc5
X-Received: by 2002:a05:6a21:710b:b0:3bf:b9de:8557 with SMTP id adf61e73a8af0-3da9d98d1bamr9827360637.9.1788914236936;
        Tue, 08 Sep 2026 17:37:16 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc46da5acabsm4326371a12.8.2026.09.08.17.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:16 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 4/9] crash_dump: Free temporary dm-crypt keys_header buffer in kdump kernel
Date: Wed,  9 Sep 2026 08:36:46 +0800
Message-ID: <20260909003657.1570544-5-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although we expect the system to reboot immediately after vmcore dumping
is finished, it's still good to free the temporary keys_header buffer.

Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index 580534d43b66..ff6055a97a4b 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -118,6 +118,7 @@ static int get_keys_from_kdump_reserved_memory(void)
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
 {
+	struct keys_header *keys_header __free(kfree_sensitive) = NULL;
 	struct dm_crypt_key *key;
 	size_t keys_header_size;
 	key_ref_t keyring_ref;
-- 
2.55.0

