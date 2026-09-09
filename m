Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921EA270545
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914230; cv=none; b=M7mMrY/Mc3hgDaOHAVuDlgvJXtbSOP0JcnkBoJg2fO2Do2RDOznye/WgT70i/22uKIo3/UT/FTKjG6al8XOGSLaHq1JR1yYOITGfiKSbr6eTCcgaNX8EpVyBffo3D4u9DvAcggaXo+F777MZDRkjHukMZ03nZ23dgL0Q4aL/8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914230; c=relaxed/simple;
	bh=N5/gPWjkuTr3queZIO2GJXBXWpGePJxyaZgnB61ci1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGe/Pio//UCvbMdqU9gkqNRrCq/geKVyo7f1ElIIZp9qcD4fSn3cwa27Mlf9xZpRQeJw4uN5ZAk71eajwIIZreznqyNwR4IruuR7/Nr+ziCnF7UGsacN5kAwDqm33u2X4WjdQQ3jQDQOhn0xCXbWXAAXy2+v7TgvbvbhnbGhjqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHIlNOau; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHIlNOau"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so5195656a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 17:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914229; x=1789519029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PHLyrOgPUSLsTNtUF28QqgZ2J17TC9aeZzxCirbE9U=;
        b=UHIlNOauIuemstFJHeM4T82DR2m4A1ZVqHim7TsmzNaBv7XXlfs7tC2EMS9LhP/VNq
         xi6HSChrhdwHcJeMOw5j5hkLZ+WHP5sx1izdS1zKNOc9zoLkfuZYHiHj5YO3creRXMQ8
         UK+CaNOw8RDUaY2taZU4LJjmkTDlUsi52rnUabSfBON4myOg4lkX3SQeI+xlsuaWmP+l
         /DyCMi3KVNos0iLHLjyLXcMCo/m2IW2klBUDCOOCW25cHxvX0+C/WxgESymX5qcMPHBR
         5OSngr6oxduNpYsuUTekFAA5VAU+QRgHLcKi7gw8jVHvX++uebDIubR9PEvVLQglTdaF
         XZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914229; x=1789519029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9PHLyrOgPUSLsTNtUF28QqgZ2J17TC9aeZzxCirbE9U=;
        b=YxoT5jyZT5zi9CyjvMVF+t5c9+U8uh8khnFCg4/eilxs45d2aVoJw4Ds63dhYoS1m6
         sfTDij4E0zufdfPxl66aHEfgxF+Y+Xq7IC5Fw2+clI1iJCXDWbLh9RRMl7688juarX4w
         GflAB/jCdLvyhHHTigyyLMeZLrZrLz78DHuP29lqjyd2XP9SSVH457FX/o3cZELrWDKu
         +ZzEJaEY9HSWq7ge0XvlEwYHviKGfGN5Ek2r9rr2wfweAcAfJbN7jAJeXB09y2HIzgas
         Mmso1GTopk75+cIbAOpBrfycwDN+JxH0UcwwoTG3dCfdZpJQuikYz3LmwDtugOs7nerC
         TBaA==
X-Forwarded-Encrypted: i=1; AKwUvBxSIiKC1W8A3ajVHGfr4ZPSVBlkTseMh5qkMBTmQ6OM9E3o80OnUsX4/yDRkxSslhjtRreH0tLSpl3mpfo=@vger.kernel.org
X-Gm-Message-State: AFuF++lQIREekeZHZcKAKJA0WoDBT5c84iLm8G1pU4pQBp2n0jbuqluU
	VeG5DD1Q82LRyUtKb0uMrR/UrLAYDGbsu0xq05N21gjMp1gd4t/p+/Sd
X-Gm-Gg: AYBFou2UgJRRmM/WKKzU3TaSNnV9gophmRtiLiNu6uO5zcH6SS2J0wY7rAb42dgLbnk
	npPAtS7QjPEFHCPbZ3oX3/v7OYfLQLkd9u3tUoDQf4Oh35/XK6PQuymXnNO4jl3t2AixhJto0Tp
	wkTrQ28V4A2/k7KYq+xy42pJXOkJ8pCmDXWCKlaPVXLZ849DOQ5UxlPQ/Tn3HGo0qgZaKqRqytS
	ieVW1GNc/gLUS42zpNj3dF/64nik1rbIH1JMas15E6ryEAydSWgfgwHOEBFhBuJT80CEzz1tb8R
	VC8x1awR2wBKb5R2oiUn5eB9PG7vEb9YmDfubKQ+nvJad6WGumzSTgedjQfnjx8pz71ygAM/Vsl
	SQ45bGjAJKHsnCr0ZZkZxoU3Fh0O7qnEF6PddQc0mfM1vjrvfy3anEcHCI9aW+p9aXQZnh3vVIB
	Sm6ibusJkBtWpI1gUwD5jPiC3OPX7ujkLYgPQPwTB8oaKvuMfSGhRzHNttSyv7
X-Received: by 2002:a17:90b:2542:b0:38e:6aa7:68ad with SMTP id 98e67ed59e1d1-39b26101402mr44510446a91.5.1788914228871;
        Tue, 08 Sep 2026 17:37:08 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd15asm28871165a91.4.2026.09.08.17.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:08 -0700 (PDT)
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
Subject: [PATCH v5 2/9] crash_dump: Read the number of dm-crypt keys from reserved memory
Date: Wed,  9 Sep 2026 08:36:44 +0800
Message-ID: <20260909003657.1570544-3-coiby.xu@gmail.com>
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

In case user adds/deletes the keys by mistake, it's safer to read the
number of keys from reserved memory.

Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memory hot-plugging")
Reported-and-Suggested-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 kernel/crash_dump_dm_crypt.c | 37 +++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/kernel/crash_dump_dm_crypt.c b/kernel/crash_dump_dm_crypt.c
index f638fb4b8554..3a416933979f 100644
--- a/kernel/crash_dump_dm_crypt.c
+++ b/kernel/crash_dump_dm_crypt.c
@@ -88,21 +88,31 @@ static int get_keys_from_kdump_reserved_memory(void)
 {
 	struct keys_header *keys_header_loaded;
 	size_t keys_header_size;
-
-	keys_header_size = get_keys_header_size(key_count);
-	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
-	if (!keys_header)
-		return -ENOMEM;
+	int r = 0;
 
 	arch_kexec_unprotect_crashkres();
 	keys_header_loaded = kmap_local_page(pfn_to_page(
 		kexec_crash_image->dm_crypt_keys_addr >> PAGE_SHIFT));
 
+	if (keys_header_loaded->total_keys <= 0 ||
+	    keys_header_loaded->total_keys > KEY_NUM_MAX) {
+		pr_warn("keys_header saved to reserved memory may be corrupt\n");
+		r = -EINVAL;
+		goto kunmap;
+	}
+
+	keys_header_size = get_keys_header_size(keys_header_loaded->total_keys);
+	keys_header = kzalloc(keys_header_size, GFP_KERNEL);
+	if (!keys_header) {
+		r = -ENOMEM;
+		goto kunmap;
+	}
+
 	memcpy(keys_header, keys_header_loaded, keys_header_size);
+kunmap:
 	kunmap_local(keys_header_loaded);
 	arch_kexec_protect_crashkres();
-
-	return 0;
+	return r;
 }
 
 static int restore_dm_crypt_keys_to_thread_keyring(void)
@@ -432,12 +442,13 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	};
 	int r = 0;
 
-	if (key_count <= 0) {
-		kexec_dprintk("No dm-crypt keys\n");
-		return 0;
-	}
-
 	if (!is_dm_key_reused) {
+		if (key_count <= 0) {
+			kexec_dprintk("No dm-crypt keys\n");
+			r = 0;
+			goto out;
+		}
+
 		r = build_keys_header();
 		if (r)
 			goto out;
@@ -450,7 +461,7 @@ int crash_load_dm_crypt_keys(struct kimage *image)
 	 * ARM64
 	 */
 	kbuf.buffer = keys_header;
-	kbuf.bufsz = get_keys_header_size(key_count);
+	kbuf.bufsz = get_keys_header_size(keys_header->total_keys);
 
 	kbuf.memsz = kbuf.bufsz;
 	kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
-- 
2.55.0

