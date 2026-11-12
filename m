Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491464;
	b=q7pkHLWYmTH0amWKsKXQ5R/s3V348sNJCsOJIk9fjx03G5iWpiJ6EmeZhbGqbR75Hpey
	 JQfy6YsVcE4ofD1K1dj599/TcUlLCdw+ts0MctjWzzPSulORXhH5gnuaZ+L5Kx0Xa6YGN
	 VU1eNWNKmbU7au6UGCf04ib3MfxiWB76kpMulRnagAyZ7cVzPplM9HpwLOrEO7RG49eMJ
	 mhwSnFHQOO3JwJ9RCoXwR3kzZrrUMKZhhmAYbik8Bqa5SHgnMdb8BM3QkoRtoxNN/v4Su
	 BdvcI8rdzZ/IM+5YzhpkeGj9VNXN4B/UXulFkxjwKfUbvhJzM6mNEwb47rMuwWHP+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QBfpBqH9DfyEOdhBhH9UadavYWWE9bgXFu1+ss9tjLw=;
	b=dHwi024vQlnPmpWqbFOctrl/zzPOtnovSUdjrGEClCb8JRZWJZyVP355KQDi34hEFySP
	 OwI1jWD/n9nX2lldyny+BGPj7un1/+ke9vH9qjskQPozu7vWikE101Xm9/6P2wU+H0qhy
	 jvlpR7rD24vm/UTP+6v+ldgEoZoxwu4NBaVXaLXTypeds0PXakDKInD47XwX8oI4u6F13
	 0hsRKPnMKe/MM9ESJpMy5RRtl23SMYvZTqEdb/sTF6ZMYQWuGzzrSuuvUO5vcYylYOtUc
	 nhtQRPenAxa+wr3hY2LB22SPFiC/1ZiszV4oQbNCkL/g4wOiX6/ejx6a/GQ8XeZdMmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvOJsOzE;
	arc=none smtp.remote-ip=74.125.227.132
Received: from mail-pj2-f4.google.com (mail-pj2-f4.google.com [74.125.227.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C1606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 981C1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvOJsOzE
Received: by mail-pj2-f4.google.com with SMTP id d9443c01a7336-2e96b8bfb43so17862085ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491464; x=1795096264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBfpBqH9DfyEOdhBhH9UadavYWWE9bgXFu1+ss9tjLw=;
        b=LvOJsOzEgbgl7nXZFUpikpO+sPH215DynZNktvAHyYkp3yom0zPzdYGSDcZkvgaOUb
         MtTwYR9abNDhvoSjpVwNtwDHT0X3B8CRNwvoLRgoBnhyT/9JHadf/NWhIzJ0bGfA8oW8
         RKpb2E2W1KcLaw+dyN74Nc7nTgA+4sELAebw4GDl6EvRaZVad7aZBdN1UQjh11O73qPX
         i7WSeVw9YyHuU2zdGt3fkV3uUQDCtIHCvcAtl+B8vrGWYU2XLYUhOoOo5s+PMDUwxzY7
         hLNf5oIFViXMTUUnavPGDuHMpr1Qa0JfInwKPzakXge+I4ZG7CqlnEA5bOVOTB6YetFZ
         9PPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491464; x=1795096264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBfpBqH9DfyEOdhBhH9UadavYWWE9bgXFu1+ss9tjLw=;
        b=xwgphUQBFgde1M2uPCDj240de5GswOVoSchVSApl1Ihk3xL/jCBiCve+C2BnhA2eDg
         ZcITWe4Dv2aG847DksgOAlSIEqzSf7A1k54E59+5RcDuobw0RBcnmSKe1DOYaYhCIqqd
         kWnKCArwTUOYKv72Fb1CYufqiJDzeYVtj1x0q6VfCfZyFH18LlBo+tUEGU0vOrr5gQYl
         CTxDsBqpZTMXlK2D8Cks700mQpD4xLzZynYqm6iNFkxPT2KLfgXhzyj96Gtfkvu65c9c
         99JSddE/uLs74rwUSTza+FbKCQDxhI716/OdHXeS86WW1sJNszHkFk8G3h3Baw24zSU9
         FEUg==
X-Gm-Message-State: APuU4Z/kuX0+GV/6HxCys4u7X2nhT9xl+DnlR2bqf0f8F0xZhWiHsNB6
	1a1FyA+ZmJxrU0TwxyiezMhBsXkwsYatqt3p8B8uaUJsnue5GuycUK3V
X-Gm-Gg: AYBFou1XVGb5nQbwckNLparC3t5zYreomqjJ4orKsNiLQ+H8S+HmP612WwKnkc9fOli
	zj3Sf0VK8qW5OFH/WTL0DH0jKihvFrNN22E2llj/mIYAvzFRakx4O8UuJda3mT1HovC3faR6tFM
	YZVqL8wGnJy1QEPzoA19kui2GPaGyPdzA4jnJu4B7ezN9FlZvvY+Qjz12XEB4cSOezWxzvtuCKp
	1M7/yWr2PNcJpRdUEbbJfxs1q7F0xhDT+O+nhG3NHklzhnmL3qqceqZ5vmBXgjjBq781XNFCq9M
	+/1oPoqKz/PKvsDm80qjSXZGkf4u8nxMKTKG1JbVudNV1L1RIVRBT0ve+3HyntL4ZqvNSVLWXLm
	JZ4FQA3JewyFSyp90v5HMYwAeXizGQXNj/0TZpYZsoc/lx1ylnMahSjFMENZSjGp+K0DC7LD7lJ
	mnKBPX1qZP+RvBRQa4Ph7kVNhMIUqzRJf3FrhoPcmMmHOry8tTTGigV0T44XMLTUmkFmkooQZep
	CV5fxT8d/AvMtyOVUrH1jWROL1hzDSfY16X24TGfVCa4gpWDLo7wd8Q/Xws432OTJkc/IM6uWkm
	7mR+wxvwxzkFq8ZBPI93c0v9JS3xW5kglGzp/CCISvE25vI=
X-Received: by 2002:a17:903:3bac:b0:2e9:8510:6acf with SMTP id d9443c01a7336-2edd7748dc3mr60985655ad.25.1794491463730;
        Thu, 12 Nov 2026 05:51:03 -0800 (PST)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0f9ffsm35078015ad.75.2026.11.12.05.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:51:03 -0800 (PST)
From: Shihuang Liu <shlomojune6@gmail.com>
To: bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Shihuang Liu <shlomojune6@gmail.com>,
	stable@vger.kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Tadeusz Struk <tadeusz.struk@linaro.org>
Subject: [PATCH] bpf: Fix cgroup link update after a failed effective array rebuild
Date: Thu, 12 Nov 2026 21:49:41 +0800
Message-ID: <20261112134942.288831-1-shlomojune6@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace_effective_prog() uses the position of a cgroup program list
entry as a physical index into the effective program array.  When an
OOM detach falls back to purge_effective_progs(), the detached entry is
replaced by a dummy but the other entries keep their position, so the
list position no longer matches the array index.  A later link update
then writes the new program into the wrong slot, leaving the old
program pointer in the array.  The array does not hold a reference, so
the old program can be freed while it is still published.

Translate the position to the corresponding non-dummy entry before
writing, and use the same helper for deletion and replacement.  This
covers both regular programs and cgroup struct_ops entries.

Fixes: 4c46091ee985 ("bpf: Fix KASAN use-after-free Read in compute_effective_progs")
Cc: stable@vger.kernel.org
Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
---
 kernel/bpf/cgroup.c | 42 +++++++++++++++++++++++++++++++-----------
 1 file changed, 31 insertions(+), 11 deletions(-)

diff --git a/kernel/bpf/cgroup.c b/kernel/bpf/cgroup.c
index 57a785241d42fb..db3f173e83c693 100644
--- a/kernel/bpf/cgroup.c
+++ b/kernel/bpf/cgroup.c
@@ -403,6 +403,28 @@ static int bpf_cgroup_array_length(struct bpf_prog_array *array,
 	return cnt;
 }
 
+/* Return the entry at logical position @index in an effective program
+ * array.  Dummy entries left behind by a failed rebuild are skipped because
+ * they do not correspond to an entry in the program list.
+ */
+static struct bpf_prog_array_item *
+bpf_cgroup_array_item_at(struct bpf_prog_array *array, int index,
+			 enum cgroup_bpf_attach_type atype)
+{
+	void *dummy = bpf_cgroup_array_dummy(atype);
+	struct bpf_prog_array_item *item;
+
+	for (item = array->items; item->prog; item++) {
+		if (item->prog == dummy)
+			continue;
+		if (!index)
+			return item;
+		index--;
+	}
+
+	return NULL;
+}
+
 static int bpf_cgroup_array_copy_to_user(struct bpf_prog_array *array,
 					 __u32 __user *prog_ids, int cnt,
 					 enum cgroup_bpf_attach_type atype)
@@ -432,16 +454,12 @@ static int bpf_cgroup_array_delete_safe_at(struct bpf_prog_array *array,
 {
 	struct bpf_prog_array_item *item;
 
-	for (item = array->items; item->prog; item++) {
-		if (item->prog == bpf_cgroup_array_dummy(atype))
-			continue;
-		if (!index) {
-			WRITE_ONCE(item->prog, bpf_cgroup_array_dummy(atype));
-			return 0;
-		}
-		index--;
-	}
-	return -ENOENT;
+	item = bpf_cgroup_array_item_at(array, index, atype);
+	if (!item)
+		return -ENOENT;
+
+	WRITE_ONCE(item->prog, bpf_cgroup_array_dummy(atype));
+	return 0;
 }
 
 /**
@@ -1175,7 +1193,9 @@ static void replace_effective_prog(struct cgroup *cgrp,
 		progs = rcu_dereference_protected(
 				desc->bpf.effective[atype],
 				lockdep_is_held(&cgroup_mutex));
-		item = &progs->items[pos];
+		item = bpf_cgroup_array_item_at(progs, pos, atype);
+		if (WARN_ON_ONCE(!item))
+			continue;
 		prog_list_replace_item(pl, item);
 	}
 }
-- 
2.43.0

