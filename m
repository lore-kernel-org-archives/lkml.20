Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CD952FE51
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788869072; cv=none; b=Bdx+iKkrQeqx7AJWD00DO1zP1o1hPcu6Tes7m1lD5yDYaztkCTkU8B1ux1pAywQoglHv2SSxWQUw6iFT3P/4qx9K4s5XeCAYVeiE7FbY+XzgKPh7muuY7emxYPy6EOiKCDZ1vAhErMja7FeYDoDhAG540jAT27tm+h/0Lh9Jnos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788869072; c=relaxed/simple;
	bh=+Z7gOrM6+d068hznh0NTfalE7EDajgg3rW0Apn+UpFg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwgboX4vYvhI5WXbB/zigWfUxvSgb70/reSb0L2R1aPvygTNMN4dJ8X6iBNlOphvkFBXQS+EN1MxbnkIzReazCPN/ORrfEZJlcD/BgO7EPMjf5Ld0RM/wd0UG768LwgFfDw2Uro43822VZbbEoHP02RDonFPrf3FrxDjFfPM+j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YyaEjzf1; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YyaEjzf1"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b965570d7so52249175e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788869064; x=1789473864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nHaXAOzQB22k62cPhYcK673Kb5UPCqNoZZMm/VKn/iQ=;
        b=YyaEjzf16i4PlC+BaBx/k5vRZJgD+Ohlt6dTH8WEM4LK3N9kDbBrgtyan/BsX9EeFM
         qMw4TOnEWcZq9zM0Q8xQbqYXT35GvN+BxMK4cnbqixfeGZbpAAh8xRYDvG5gXOJR/Sw6
         R9wgDuwPnrxf0FSHPJqHICwA0IUFWnwxb1XrOWXkzGZkYLE4rsGVtbpQoR5u2Kan0q3z
         pw1SkdUOEz5gVnxQMA2O/tqScW3AJFP+S48FmOJGGGVXAqUTZjH0bekkYE+1sq1mZpxK
         S9EEiwS5GrA8WBOlCq101d6QqbKk4aErbmASTIKQkHsAeElgwEINTwJtlXuvS+S0jmsx
         0FcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788869064; x=1789473864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nHaXAOzQB22k62cPhYcK673Kb5UPCqNoZZMm/VKn/iQ=;
        b=sxvhm+lhpMBPZtCRtbJcjIRJTy3YpaYc9udkgUIwkRjHf7ySDn/RQFAL4owV6eZWCm
         Npln7w6XMy6cdD/LmVpH+zH0bcHCV2KwmgOEPdmT8Xs3umd46TKk5oA9c9SKRbKIbnkw
         oyVarzyEAa0aSSWY1W/XxhsqyQqaHy53eLWtoUxvJ8DToncAUzp12LFxB5xnk13kg9zy
         IrpZlPrWyJrSGCu7vUEueROtqdAX9j+wqqrbH8TLF8rYwvaHLpxXdKRr2gxEAvH6KQol
         0zrhIWTcAeVaJG8dHaj+J0rOuUpYr2FNcGHMURFUzcz32skv/g+Izc6wYNUmd6k2r1Ma
         Cqng==
X-Forwarded-Encrypted: i=1; AKwUvBwLKjN+jNfu/mizpIk80wstl4IL1kCYo60gmKplCSOP2KNZjsRB0Si2HV9d4uGapOPAUWrrAbMtYmDhzls=@vger.kernel.org
X-Gm-Message-State: AFuF++moZ7fojQykxduG7RoJZDKH9Qoz/gICH77IJFf8kHwvASwSCJq0
	wC7beFi+InnkBAE50yTHC9ztsc4qVAW0ezSLNqvWnLlA1bPGqDH+wGjw6E3eJSKobqQ=
X-Gm-Gg: AYBFou2ZDhePgCa+1pnV2p2YhASTdwLofnVX1acjie5FW26Oax+lsF0XyThIRIQ8Nle
	d8ChAcATaPV6ZXC9eyJ2eMkuKIsOs4UJjzNzbd1vRnZ2pjB/Kuf+lNYSMXia2G472DlTUQVJRsc
	5kVSpWUKB/OdZqFMLsNhIIx4nkrLXq8e6LPQScz9WlBnZveQiB88IfCpn8SCvA5ujSBepevWJ+g
	G3cIUuwgcDxFckxIXasvBwWFVmditBgsKORSlqTGJOyCPUWBnW5isvvJv9PnPS8pCMm0ysdWBCq
	pNpereT9OyZXEhV69EbelxNsaPSPv8hy905bRdfY7JlpoxoK5/qUwvko8WS2K+aV07zWMW+W8V2
	AfqNmGR1UWvp4Uwn4DY/fyj2MCbHmnz0ZF2PAGNXcQs00JceLrKDjxXpt9zHsd1qLIlgPFmubcl
	drRQLO5YLPj2GSzK+JgoOb+c3VZNtfXQHNyMY8Enexum5YCO0x8wg=
X-Received: by 2002:a05:600c:1914:b0:49c:ff23:a6d5 with SMTP id 5b1f17b1804b1-49cff23a70bmr243819815e9.0.1788869064334;
        Tue, 08 Sep 2026 05:04:24 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm390099035e9.0.2026.09.08.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:04:24 -0700 (PDT)
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
	Petr Mladek <pmladek@suse.com>,
	sashiko-bot@kernel.org
Subject: [PATCH v4 4/5] livepatch: Clear relocations when klp_apply_object_relocs() fails
Date: Tue,  8 Sep 2026 14:03:24 +0200
Message-ID: <20260908120325.299649-5-pmladek@suse.com>
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

When a module is loaded, klp_module_coming() updates all enabled
livepatches. If an error occurs, it delegates cleanup to
klp_cleanup_module_patches_limited(). However, this cleanup loop skips
the partially updated patch, leaving any changes made prior to failure
unreverted.

One unhandled failure path occurs inside klp_apply_object_relocs(). On
architectures like x86_64, apply_relocate_add() performs a verification
step using memcmp() to check that memory contains the expected relocated
or zeroed value. If relocations left behind by a failed patch are not
cleared, subsequent patch operations or reloads can fail this validation.

Introduce klp_write_object_relocs_limited() to unwind and clear only the
relocations that were successfully applied before klp_write_object_relocs()
encountered an error.

There is no need to clear relocations for other objects in the failing
patch because klp_module_coming() operates strictly on the specific
module being loaded.

Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/r/20260830175608.4BABB1F000E9@smtp.kernel.org
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
 kernel/livepatch/core.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/kernel/livepatch/core.c b/kernel/livepatch/core.c
index a6796cd6b65f..714f97fdd271 100644
--- a/kernel/livepatch/core.c
+++ b/kernel/livepatch/core.c
@@ -342,14 +342,17 @@ int klp_apply_section_relocs(struct module *pmod, Elf_Shdr *sechdrs,
 					secndx, objname, true);
 }
 
-static int klp_write_object_relocs(struct klp_patch *patch,
-				   struct klp_object *obj,
-				   bool apply)
+static int klp_write_object_relocs_limited(struct klp_patch *patch,
+					   struct klp_object *obj,
+					   bool apply, int limit)
 {
 	int i, ret;
 	struct klp_modinfo *info = patch->mod->klp_info;
 
-	for (i = 1; i < info->hdr.e_shnum; i++) {
+	if (!limit || limit > info->hdr.e_shnum)
+		limit = info->hdr.e_shnum;
+
+	for (i = 1; i < limit; i++) {
 		Elf_Shdr *sec = info->sechdrs + i;
 
 		if (!(sec->sh_flags & SHF_RELA_LIVEPATCH))
@@ -359,13 +362,23 @@ static int klp_write_object_relocs(struct klp_patch *patch,
 					       info->secstrings,
 					       patch->mod->core_kallsyms.strtab,
 					       info->symndx, i, obj->name, apply);
-		if (ret)
+		if (ret) {
+			if (apply)
+				klp_write_object_relocs_limited(patch, obj, false, i);
 			return ret;
+		}
 	}
 
 	return 0;
 }
 
+static int klp_write_object_relocs(struct klp_patch *patch,
+				   struct klp_object *obj,
+				   bool apply)
+{
+	return klp_write_object_relocs_limited(patch, obj, apply, 0);
+}
+
 static int klp_apply_object_relocs(struct klp_patch *patch,
 				   struct klp_object *obj)
 {
-- 
2.55.0

