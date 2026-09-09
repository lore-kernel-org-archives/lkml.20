Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019B5492E4C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914252; cv=none; b=FL8Fr1lgYOVyfFkWWviVQxDZ5Ty4BWHscYhDVahtLylGyGRaYeCZOumnT8GS5agebPS7t6qgT9gcNPcDiUwxYW2iIo81ar2cFdQoMRw0ktGh6Irjtp7L3BJ9Fjx0Hju0c72lgOENTaGhoPNedHnS6RimXqDo9uMeDVJxDaUXTXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914252; c=relaxed/simple;
	bh=nW+m5FcMuWjbmlFwEh/Oh+T5aRlIcgn+BDl8NAXN5e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cRp0DepUODPus23fxA1iPDC2ojL1KRB6yj63MX75IClRG07gvXx1NNt0eysPDHLQLftJXteW7d1dyY4dn9SE8lz8XzZDUpbYI452NYtwW4PSGKfh1z1zvkTcL8DRzKWsc9xviSlcgj2OuURt2TMxVtqp4pj27H4rRG8EAEJf3SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IsYrPX0P; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IsYrPX0P"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db858d60e0so11029675ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914250; x=1789519050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l2aWiKsurNBx2CqD2IBEMy0PrGzIHEYiSv8/glhDUeo=;
        b=IsYrPX0P75i93cr9wzRTqAIrzfIiCcydQLYqkSwaXh7i7RDmfxeCRSb+ALlSC3SI8M
         SZIJzXxjTlorfRsdBmwg0FgqXFjm6Vf6LKsJVYqj6LSjNKKOfFCS8EaIXvMMT2/FMvf5
         ZzJmN3+YPbsHYZo+AbF6Kb3zAM1dTWPnkseAeQMPDDb0tVv9TofGTPHRaAOkxhEtKMdU
         Ze/BlUpVfLdUeZ826Hwg+oNxgPLBrS559VU3ltxpufQajgaR8Q6FHrT975P7LX8nLeE7
         XmH1muA3oVpdeJT9VzzflsvZO+Sf2jbEYe8UQdxenBqsJswX+xC/6WjxLyaZhso9LNwY
         +zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914250; x=1789519050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l2aWiKsurNBx2CqD2IBEMy0PrGzIHEYiSv8/glhDUeo=;
        b=KehlF6HuHWzg9vAonauGY9IR7PL900Gw4y8RlxVcy3c+Khm2qW7p4KPL1X9ta6i+Mr
         ehSKx1cEm5iwgBem0+yuU6Uz1GZ0mL39d6Wq9E5DgvbZOH0uLORO0nU+RhK7KyHSyWlN
         PrNx9sEXaOJv10JdjbkoF6cFQJGK0o4GTMM1Ukq8ASZ9si3bRXecduVMCRuYgFsnGDjv
         DvTs4084P140h95PwoRA+e5IxsMQijT+GNDBVyUHiV8wkCucmolDJD/Q+I41+1+7OCTH
         7mhEsCo4jMIERekm/Njp5DsiQSyFbdNJc+rbhmYgokSNsj9ME6Z3U+wHOSujst9RDOSN
         Zp8w==
X-Forwarded-Encrypted: i=1; AKwUvBw1WQ06ZZasiyUAUAxQ4yaUDrdd/uF5jiHHsLJPYLTQ1PmezFaoftNEFyP1r+ByCgC5r2uFruJ+qAqc0bM=@vger.kernel.org
X-Gm-Message-State: AFuF++nbZrS75I7aHavMAisvEsXg6+S+CypCw5rjMAYWQswI8K+b07dD
	0gbneoksZ22ywY/ytJOStRv4COb7jiCSu/8Sj1s2M0bu77rIpLoeySMz
X-Gm-Gg: AYBFou0TvOldQraqzZGGjw5eoaiE+jKGfLEFmLnZhz8Jiv98X6Fc45Bu6lTLe3QtfrA
	bfDvOExaSteqWzshTr6c6l6yUVljEVCl3lj+JjSaA+bzymmB6k245YTheMQu2Sd3GXIBpu1heLp
	I2pjy8Izpt7v/svktMjxw0vU+VBtK9kuK0MaYvqeSjMlLx+D06n6CTw1t0JA7HdbulQNH/e/2wU
	kXHbP1LpnzRLEeOcAqbLk78PnlVKZ1oICeRdYz3KQYobf6OMFx5uO700GO18AKIWRc7K/7GRkNp
	fV24AprZ1EvK0ibtc9oG1gETxK+TRLWjXd/h515oqXdtZ7qux+yIyqklRrk6Cb5AFA4n6QLZ/WN
	X6vYLZiu2xGkxlFwJq7QiiuM8H9xU08poglRHx+Ib8+VXXWiXQg3H6B1XwEEOWX8+VHPaI5sdVI
	OKsciOiES+F82W6hI+ABJSJtN4n3kLdToBwd9YcmEDviW66IQdox+YChrOlXJG
X-Received: by 2002:a17:902:da8e:b0:2da:eb8f:b4e4 with SMTP id d9443c01a7336-2db124c35f8mr434654835ad.7.1788914250063;
        Tue, 08 Sep 2026 17:37:30 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db2c0f1daasm51431225ad.5.2026.09.08.17.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:29 -0700 (PDT)
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
Subject: [PATCH v5 7/9] crash_dump: Check the function return codes in restore_dm_crypt_keys_to_thread_keyring
Date: Wed,  9 Sep 2026 08:36:49 +0800
Message-ID: <20260909003657.1570544-8-coiby.xu@gmail.com>
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

We should check the return codes so we can abort if keyring allocation
or reading old memory fails.

Note there is no need to refer a key add_key_to_keyring, so delete
related code.

Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index b8fe630462cf..bc70fbb79e0f 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -66,7 +66,7 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 			      key_ref_t keyring_ref)
 {
 	key_ref_t key_ref;
-	int r;
+	int r = 0;
 
 	/* create or update the requested key and add it to the target keyring */
 	key_ref = key_create_or_update(keyring_ref, "user", dm_key->key_desc,
@@ -74,8 +74,6 @@ static int add_key_to_keyring(struct dm_crypt_key *dm_key,
 				       KEY_USR_ALL, KEY_ALLOC_IN_QUOTA);
 
 	if (!IS_ERR(key_ref)) {
-		r = key_ref_to_ptr(key_ref)->serial;
-		key_ref_put(key_ref);
 		pr_debug("Success adding key %s\n", dm_key->key_desc);
 	} else {
 		r = PTR_ERR(key_ref);
@@ -134,9 +132,14 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 	}
 
 	addr = dm_crypt_keys_addr;
-	dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	ret = dm_crypt_keys_read((char *)&key_count, sizeof(key_count), &addr);
+	if (ret < 0) {
+		pr_err("Failed to read the number of dm-crypt keys\n");
+		goto out;
+	}
+
 	if (key_count > KEY_NUM_MAX) {
-		pr_warn("Failed to read the number of dm-crypt keys\n");
+		pr_warn("Read %u dm-crypt keys (max=%u)\n", key_count, KEY_NUM_MAX);
 		ret = -1;
 		goto out;
 	}
@@ -151,12 +154,18 @@ static int restore_dm_crypt_keys_to_thread_keyring(void)
 		goto out;
 	}
 
-	dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+	ret = dm_crypt_keys_read((char *)keys_header, keys_header_size, &addr);
+	if (ret < 0) {
+		pr_err("Failed to read dm-crypt keys\n");
+		goto out;
+	}
 
 	for (int i = 0; i < keys_header->total_keys; i++) {
 		key = &keys_header->keys[i];
 		pr_debug("Get key (size=%u)\n", key->key_size);
-		add_key_to_keyring(key, keyring_ref);
+		ret = add_key_to_keyring(key, keyring_ref);
+		if (ret)
+			break;
 	}
 
 out:
-- 
2.55.0

