Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794328167;
	b=wq+Pbb3mCEAYBXQ7NuwovvP43G/qC1uaTxE8dSibY1FhljVMVkl+YpXBnsrZz6X5OKCI
	 NfBXXZCSKBsgKcOKFtWMo+47yCV1AeA6/I6XmGGtOLCv4eiTRv/Tf/H0Z/Z90u0ti9vCH
	 ITFzwykKf5zPz5mpstui2MDLjhi8u/qnuanSv9DQxkbm3nLBF4VG6JDZ/K3d4P+x10zgV
	 C5/98MtRO1eESqpdYlrCuAAXp1OqxVE/yqyK9dy3YWA6W/0j6q+b6Zq//FQMQr9HnF3oE
	 dSFU1tIB1JafgbJj5lPFvecLjNxZmybtptQuJ57rGHwXBU8a/bdiWP+PH3ZLP22Xhvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794328167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Y3kCsYcaDY5qwLaKX26SOy2iD45ozQ8Dc5QEanJuFg=;
	b=XpcOGXxWdWGT1Yg1d4guRdkwtdb2JVq8l12YJtoNCbXDzce8wQtaXWVafLaY21l7sSX/
	 rdlxrNe5dTm8LnDx7B/iUknbrMnPmIpwyGt6x8v77vvGe5nACQncsWnX4Vmbt6+e6UcJ7
	 AqJvyfJ+s72Vy4UK3imzuGbZpt1ErPMSFDPD+lKUjTbf/u+a3HXoTUnY9YC0bwppY/OUH
	 xg5uV8rs2wki3VTODSH39uET8zlH/qcqCGk2CsmShx37XJYqcey2RWSZcfIa/gKrJxK4s
	 XDzC1AkvCzvvc/Svcrzf4lBLqlKGbjDi3lPE1H/Jv3dFK+0VWaLLnoybL0YQR3QUCJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eoDw+66o;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CE4606D7F4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CE4606D7F4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eoDw+66o
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22208025e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794328165; x=1794932965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Y3kCsYcaDY5qwLaKX26SOy2iD45ozQ8Dc5QEanJuFg=;
        b=eoDw+66o++3nkn8TX3g4q9VedazkHPxZZsCWZHjrpN77f0oykuvlO+tAXtlamuJDs/
         ta0q0w4i8LL8ynAUj3BRe0Tn5UsEheHaQEL/WZSmE14aZlKAL9W1ymV6hDw7sFLvxEAr
         JE+qNl3PYMh0W8mdgIy3ly8pPKbcttKSfgh1cRDz9bKgCDjg/Lv1ucfQ5tKu873IMj6o
         QVBcmFkvKiPCn/BMhHDv0jd/V1Pjp8FnNabsCh413IesfSLhqirxBVqDfb+OAc9F764Q
         wkaPaZsLhZSdFEmz7Y+1IOscRc6QmL5PwNLuFfCANU5WJxgjsTL9SWx30Ut1QBwcEG/0
         WpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794328165; x=1794932965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Y3kCsYcaDY5qwLaKX26SOy2iD45ozQ8Dc5QEanJuFg=;
        b=CoXCi+TFOD/fqNuiho3loj/Dtigm7J0Ds8DvLuDgxLbReV7zROdVD4T1iF6pTwJnIl
         HZlx3YXVa/zOZjZeEl/mrB35KmLuTp/NsdnKh9nNqE2eb3uubkrvuWREA/q+usVgwMre
         4eE4Xa92hF2NNNEJywNWhMVuevERiR21frDxu+/YYn20pbbE15Zo5JzfTYeEP4mdNDRP
         +hhdqkaw4FX/oiRzWtgwBSw1/ilpBT/QT8I7KcHRUGQ7BiSfwA1HWIbvGc1lZBD5ecAq
         PT7dHjClUttXV8Uj//IG4ukXDW/HyqcMfbQ3/GDOw+0GHwhrVrP4Vl9KdupE85dh/5Mr
         A/Bw==
X-Forwarded-Encrypted: i=1; AL+hErGP/MGKgZz7zjFPbd0kdbDINLSo6K2geSEYYLL9oWJ59kqPkra7eJksYFTvvceXj3fd8xKus1wp3IIyjbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9raA9lhleVFB57rdviRyRDzA6U5Bh4FoiridshK5zYxN97g3Cx
	Z6s6hpm7mhbLk/VrZTVgUCLiRWMsydMTyY5UDRim0ZnA/+guwtYbBScR
X-Gm-Gg: AYBFou1MozYwmlA881QBLmEErGBzcwejCBw1syM1eHPe7K7GYyCVHmKlS7e0bd7YdAz
	bxVjU55qbqj3CdlIX3LOhFRyDIjzVGESxueys85943pkpeZEn1Y/YmLXfp5fMyokpSgWc4nV8ee
	5SSCeEX49QbXNBiv4VTwaP/NlXm+JF7JFVwyHcALKK5dT1toSzoJodolOgv5DuXnwjM9rsmGN1J
	EQhm5qUkBPvypVvZl0I37U8Qh+ifx74vdFJ7qAHwOb9YZ5rV0VcBHxuycR1vMFvN7zH3Rkijijf
	q/ytwdSZ35FEnCn0FpB1Qh4ymGTuJtYCRhrkvTfGoyDwrIBvOattcolYjfzEvftT71B29HmFlri
	Qk4Xn+awuEK13K6MKQsw/uRQ1Zzj1zi0F5RN7C/Ql+e5fQmENPS23f//EeVnxqMemHXSFFTWidr
	yOC32x32egO+l9MKWg0uTuj0eVYDvcuL2xJ+UnRi/QMG7BHLIGm3ErrvqERWVf/TyaNdB0+McFE
	J5O8YknpjX7W4LlhxS95X4UAHAAEACP0hQJQPfK/iY2JpVXly2AgVQeubNpr9XscGUU4ptYWxN+
	hjC8qT4EPQC3gYqIiC8n798SrPLVizYR3CJ9uK9GHdwbxak=
X-Received: by 2002:a05:600c:630c:b0:4a1:7c7d:8881 with SMTP id 5b1f17b1804b1-4ba023473c5mr59385725e9.13.1794328164502;
        Tue, 10 Nov 2026 08:29:24 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm71287485e9.10.2026.11.10.08.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:29:23 -0800 (PST)
From: Anton Protopopov <a.s.protopopov@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Alan Maguire <almagui@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Quentin Monnet <qmo@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Sasha Levin <sashal@kernel.org>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anton Protopopov <a.s.protopopov@gmail.com>
Subject: [PATCH v3 bpf-next 03/18] bpf: Build fmod_ret target sets from BTF decl tags
Date: Tue, 10 Nov 2026 16:40:23 +0000
Message-ID: <20261110164046.454431-4-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110164046.454431-1-a.s.protopopov@gmail.com>
References: <20261110164046.454431-1-a.s.protopopov@gmail.com>
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

Mark functions tagged with the "bpf_fmodret{,_sleepable}" decl tags
(added by resolve_btfids) as fmodret targets. Add the KF_SLEEPABLE flag
for the latter.

Do this for vmlinux at fs_initcall and for a module before its BTF
becomes visible to anyone else, so nothing can look at the set while it
is built.

The IDs come from the BTF after relocation, so they are final. Unlike
the IDs of a set registered by a module, they must not be relocated, and
the set is installed directly instead of through btf_populate_kfunc_set().
(The register_btf_fmodret_id_set() keeps working, it will be removed by
a later patch.)

The set shares kfunc_set_tab with the kfunc sets, but its flags only say
how a target may be attached. Skip it in btf_kfunc_check_flag(), so a
kfunc which is also an fmod_ret target keeps its own flags, such as
KF_IMPLICIT_ARGS. Otherwise btf_attach_func_proto() finds the flags of
such a kfunc inconsistent and attaching to it fails.

Signed-off-by: Anton Protopopov <a.s.protopopov@gmail.com>
---
 kernel/bpf/btf.c | 114 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/btf.c b/kernel/bpf/btf.c
index 61d2df6776a9..2c45e5fa1d7b 100644
--- a/kernel/bpf/btf.c
+++ b/kernel/bpf/btf.c
@@ -9307,6 +9307,8 @@ enum {
 };
 
 #ifdef CONFIG_DEBUG_INFO_BTF_MODULES
+static int btf_register_fmodret_tags(struct btf *btf);
+
 struct btf_module {
 	struct list_head list;
 	struct module *module;
@@ -9476,6 +9478,15 @@ static int btf_module_notify(struct notifier_block *nb, unsigned long op,
 			}
 			goto out;
 		}
+		/*
+		 * Do this before the BTF is visible to anyone else. A failure
+		 * is not fatal: the module loads, but without fmod_ret targets.
+		 */
+		err = btf_register_fmodret_tags(btf);
+		if (err)
+			pr_warn("failed to register fmod_ret targets of module [%s]: %d\n",
+				mod->name, err);
+
 		err = btf_alloc_id(btf);
 		if (err) {
 			btf_free(btf);
@@ -10100,7 +10111,9 @@ u32 *btf_kfunc_flags(const struct btf *btf, u32 kfunc_btf_id, const struct bpf_p
 }
 
 /*
- * Check a single KF_* @flag on a kfunc across all of its hook sets.
+ * Check a single KF_* @flag on a kfunc across all of its hook sets. The set of
+ * fmod_ret targets is not one of them: its flags only say how a target may be
+ * attached, and a kfunc which is also a target keeps its own flags.
  * Returns:
  *   * 1 if @flag is set
  *   * 0 if @flag is not set
@@ -10115,6 +10128,8 @@ int btf_kfunc_check_flag(const struct btf *btf, u32 kfunc_btf_id, u32 flag)
 	u32 *flags;
 
 	for (hook = 0; hook < BTF_KFUNC_HOOK_MAX; hook++) {
+		if (hook == BTF_KFUNC_HOOK_FMODRET)
+			continue;
 		flags = btf_kfunc_id_set_contains(btf, hook, kfunc_btf_id);
 		if (!flags)
 			continue;
@@ -10182,6 +10197,103 @@ int register_btf_kfunc_id_set(enum bpf_prog_type prog_type,
 }
 EXPORT_SYMBOL_GPL(register_btf_kfunc_id_set);
 
+/*
+ * Targets of fmod_ret programs are marked in BTF by resolve_btfids, see
+ * BTF_SET8_FMODRET. A "bpf_fmodret" decl tag on a function makes it a target.
+ * A target which sleepable programs may attach to also has a
+ * "bpf_fmodret_sleepable" tag, which never comes without "bpf_fmodret".
+ */
+#define BTF_FMODRET_TAG			"bpf_fmodret"
+#define BTF_FMODRET_SLEEPABLE_TAG	"bpf_fmodret_sleepable"
+
+/* Return the function which T tags with decl tag NAME, or 0 */
+static u32 btf_fmodret_tag_func(const struct btf *btf, const struct btf_type *t,
+				const char *name)
+{
+	const struct btf_type *func;
+
+	if (!btf_type_is_decl_tag(t) || btf_type_decl_tag(t)->component_idx != -1)
+		return 0;
+	if (strcmp(btf_name_by_offset(btf, t->name_off), name))
+		return 0;
+	func = btf_type_by_id(btf, t->type);
+	if (!func || !btf_type_is_func(func))
+		return 0;
+	return t->type;
+}
+
+/* Build the set of fmod_ret targets of BTF from its decl tags */
+static int btf_register_fmodret_tags(struct btf *btf)
+{
+	u32 id, func_id, nr_types = btf_nr_types(btf), cnt = 0;
+	struct btf_kfunc_set_tab *tab;
+	struct btf_id_set8 *set;
+
+	for (id = btf_start_id(btf); id < nr_types; id++)
+		cnt += !!btf_fmodret_tag_func(btf, btf_type_by_id(btf, id), BTF_FMODRET_TAG);
+	if (!cnt)
+		return 0;
+
+	set = kmalloc(struct_size(set, pairs, cnt), GFP_KERNEL | __GFP_NOWARN);
+	if (!set)
+		return -ENOMEM;
+	set->flags = 0;
+	set->cnt = 0;
+	for (id = btf_start_id(btf); id < nr_types; id++) {
+		func_id = btf_fmodret_tag_func(btf, btf_type_by_id(btf, id), BTF_FMODRET_TAG);
+		if (!func_id)
+			continue;
+		set->pairs[set->cnt].id = func_id;
+		set->pairs[set->cnt].flags = 0;
+		set->cnt++;
+	}
+	sort(set->pairs, set->cnt, sizeof(set->pairs[0]), btf_id_cmp_func, NULL);
+
+	/* Each sleepable tag marks a function which is already in the set */
+	for (id = btf_start_id(btf); id < nr_types; id++) {
+		struct btf_id_set8_pair *pair;
+
+		func_id = btf_fmodret_tag_func(btf, btf_type_by_id(btf, id),
+					       BTF_FMODRET_SLEEPABLE_TAG);
+		if (!func_id)
+			continue;
+		pair = btf_id_set8_entry(set, func_id);
+		if (pair)
+			pair->flags |= KF_SLEEPABLE;
+	}
+
+	tab = btf->kfunc_set_tab;
+	if (!tab) {
+		tab = kzalloc_obj(*tab, GFP_KERNEL | __GFP_NOWARN);
+		if (!tab) {
+			kfree(set);
+			return -ENOMEM;
+		}
+		btf->kfunc_set_tab = tab;
+	}
+	if (tab->sets[BTF_KFUNC_HOOK_FMODRET]) {
+		kfree(set);
+		return -EEXIST;
+	}
+	tab->sets[BTF_KFUNC_HOOK_FMODRET] = set;
+	return 0;
+}
+
+static int __init btf_fmodret_tags_init(void)
+{
+	struct btf *btf;
+	int err;
+
+	btf = btf_get_module_btf(NULL);
+	if (IS_ERR_OR_NULL(btf))
+		return PTR_ERR_OR_ZERO(btf);
+
+	err = btf_register_fmodret_tags(btf);
+	btf_put(btf);
+	return err;
+}
+fs_initcall(btf_fmodret_tags_init);
+
 /* This function must be invoked only from initcalls/module init functions */
 int register_btf_fmodret_id_set(const struct btf_kfunc_id_set *kset)
 {
-- 
2.43.0

