Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03F64ADD8F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869063; cv=none; b=RGGrrHbaI6NC5oGYhFYch3kXCY/twjq4uaj7R3wAp3kfz/ke7nIWakQ8Rk1t9IAB80KMEiHL7kdXNs7sOfZOA6TkGp1/oTo4xWjy5Or9u8GI+BX3COcXO+JPESlko7r6DJCU2LSc6nI6sb7kedtxrkEQVeXD47zcfC7wgMfo/Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869063; c=relaxed/simple;
	bh=fuQOCFjP8UkL1Qqt1zyRFi9QdF7VSvTkUwrEl2/BiJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QoHcw/cy2rdYgc3mIS51BR0cou6Vu96Iut4EpigEQex5bWjOxOKBcmG56S8aHlOdURNs4BTOM0RXsWLRmchzm6PapGQQHKx2dd6OgLaqkj7fi1+lVQ4AJrvO+RoQ5VGEMkH+GpQF9WE+9QU4AcHK9KuvDwXaOsABECnhSpGasXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fZ3rstIX; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fZ3rstIX"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-485850cbac3so2930897f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788869052; x=1789473852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Sj5DuG2I5WrYzkNIww4uEg16kFBgrgPS5/z1js5sn8=;
        b=fZ3rstIXQK39bJJqeN2HNAUYyjqG5Hcalr+gps03z4PvfYpcMCxfV/sR6pyOI1EcGf
         Xc2cUml4yCG/dNg7NNA0RJs2ZKhpB75wl5Y2mPJ+qIJoU7qr11/iVXYl/wJFbgG3cbEw
         sv8xKGY18PSuh4EAxQlaYVQrraLDI/8B7uyxGr3AKtIf49A5+mpfTpbuOZwcnxzwIZp8
         dHaKpCESJuPbXmDuIcrPIHviOC30Xxo6h5Tq8lv2XQwQJQ1ktzMTeHsRB00HWZEOd3qQ
         IlsrvaQvJKiee/zU4/ozrkpLDf/R4BlKOnjVYWXPEzex81GKz67OR33CP/5e1L2fvGdC
         qm6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869052; x=1789473852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Sj5DuG2I5WrYzkNIww4uEg16kFBgrgPS5/z1js5sn8=;
        b=R5r7d8jSpn9wVqRi4xK2Rif1CSF7hVoft8VJRAyCnwbeEG7L5wzPayBGtPV0E7Lhs2
         w7p2dwW0hCiDFC1SeZ/nYQW2XGf2Ieq5Xn5eHD8X2MMReMdKSqjDXQISPB4eOQMlJ6xx
         Qbq4H8ju6dmS0qX+u2b9Qy1G05+OEJB/OVEmwPXXfzGCzdhir2BunuoRY23lnIuWrzUj
         KosSUP3rB05qFjCkKceqprmVoWl/tfjK0bOunQH7HSJp1QZDrnnw1T0HjQuMUpZqyvqc
         RS7ug2e4PKiMu8eP1sArNbIujqPvN7/x+5e6ahUMGzu7RBQPQsMPJowhY19nSnW55utM
         RYEg==
X-Forwarded-Encrypted: i=1; AKwUvBztdB3JBHdKVjhhCOn+7lJ0FGBN1RFIL2spoRxAVp6AiZgokui6FN9Jpu5btxFFFLn5EjuTg2Wx1gwbhzk=@vger.kernel.org
X-Gm-Message-State: AFuF++kACqUtx4D3xq1GbNdva6QlnrZwTEQM0BBRMgShmts6tsOQCXJX
	azPW1hyG986z234c7cl3BsHzFrMkq6VdjuR1vPL0y4+HHQlOJmuFsogbmM3LjJzyOYI=
X-Gm-Gg: AYBFou2YU/dNuhpPqOcJkd8tjkc38Gn0eRKTmiDsgyz4dFf/aLBw6JT+N4MueiL58Z7
	OAr4P9pshYlXhQQokErCjaC58CvgUsF5t7ru3B9E8ndopnAw8m5q5o3/WMkczxmmYet59AZZq+N
	f3ncgl4dPDqJWB7niAS8oZiiygNf7wky0OafOHN53fgCQk4SzafHgz+AsImP5wIYbC/pEY23rs4
	C0E2Z5dESgmdwlbf/BkhKRFr3oQLLiCu4Ej7g0uEVmQKz2K69rdjZbXp/OmPF/jXczFfdv2U30y
	dk1gGejXGglaQZ83cw1TK8ke/Ggl3xrrQT8lzDPXaJFMUMDzv/9h8pmVlwyXd7yFa3UHatIZ5a9
	IjuaKiPfgKjeUj7lbVScKHVe/Zd8gGWrnkxVNtbEZAHtvOwm+NdK4OIVi/PSKsRNw7e7rSM9J6J
	MyheutwDCrXvd4EVnaYcimybOKSvAlqjXn9Hl5hfu8FYtGE4QJidE=
X-Received: by 2002:a05:6000:220f:b0:485:8c16:a350 with SMTP id ffacd0b85a97d-4858c16a62emr27247710f8f.40.1788869052365;
        Tue, 08 Sep 2026 05:04:12 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm30329290f8f.5.2026.09.08.05.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:04:12 -0700 (PDT)
From: Petr Mladek <pmladek@suse.com>
To: Harry Hsu <x90613@gmail.com>,
	jpoimboe@kernel.org,
	mbenes@suse.cz,
	joe.lawrence@redhat.com
Cc: jikos@kernel.org,
	live-patching@vger.kernel.org,
	shuah@kernel.org,
	song@kernel.org,
	linux-kernel@vger.kernel.org,
	Petr Mladek <pmladek@suse.com>
Subject: [PATCH v4 3/5] livepatch: Move code for updating livepatch object relocations
Date: Tue,  8 Sep 2026 14:03:23 +0200
Message-ID: <20260908120325.299649-4-pmladek@suse.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908120325.299649-1-pmladek@suse.com>
References: <20260908120325.299649-1-pmladek@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

klp_free_object_loaded() is supposed to clear changes made by
klp_init_object_loaded(). It should call klp_clear_object_relocs()
which is currently defined later.

Move the code for updating object relocations up.

This is just a preparation step. No functional changes.

Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 72 ++++++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index a6762cbe74b7..a6796cd6b65f 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -342,6 +342,42 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 					secndx, objname, true);
 }
 
+static int klp_write_object_relocs(struct klp_patch *patch,
+				   struct klp_object *obj,
+				   bool apply)
+{
+	int i, ret;
+	struct klp_modinfo *info = patch->mod->klp_info;
+
+	for (i = 1; i < info->hdr.e_shnum; i++) {
+		Elf_Shdr *sec = info->sechdrs + i;
+
+		if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
+			continue;
+
+		ret = klp_write_section_relocs(patch->mod, info->sechdrs,
+					       info->secstrings,
+					       patch->mod->core_kallsyms.strtab,
+					       info->symndx, i, obj->name, apply);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int klp_apply_object_relocs(struct klp_patch *patch,
+				   struct klp_object *obj)
+{
+	return klp_write_object_relocs(patch, obj, true);
+}
+
+static void klp_clear_object_relocs(struct klp_patch *patch,
+				    struct klp_object *obj)
+{
+	klp_write_object_relocs(patch, obj, false);
+}
+
 /*
  * Sysfs Interface
  *
@@ -823,42 +859,6 @@ static int klp_init_func(struct klp_object *obj, struct klp_func *func)
 			   func->old_sympos ? func->old_sympos : 1);
 }
 
-static int klp_write_object_relocs(struct klp_patch *patch,
-				   struct klp_object *obj,
-				   bool apply)
-{
-	int i, ret;
-	struct klp_modinfo *info = patch->mod->klp_info;
-
-	for (i = 1; i < info->hdr.e_shnum; i++) {
-		Elf_Shdr *sec = info->sechdrs + i;
-
-		if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
-			continue;
-
-		ret = klp_write_section_relocs(patch->mod, info->sechdrs,
-					       info->secstrings,
-					       patch->mod->core_kallsyms.strtab,
-					       info->symndx, i, obj->name, apply);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static int klp_apply_object_relocs(struct klp_patch *patch,
-				   struct klp_object *obj)
-{
-	return klp_write_object_relocs(patch, obj, true);
-}
-
-static void klp_clear_object_relocs(struct klp_patch *patch,
-				    struct klp_object *obj)
-{
-	klp_write_object_relocs(patch, obj, false);
-}
-
 /* parts of the initialization that is done only when the object is loaded */
 static int klp_init_object_loaded(struct klp_patch *patch,
 				  struct klp_object *obj)
-- 
2.55.0

