Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243284;
	b=xIJ6yPfKvaOVh6GTDKug9AnB4H/Vqz2kXVL8soMfOqKeVFcrQbybjiu+Ogg8m5uvMSB7
	 8xNPA3LKb3Ph5cEHR++Lx+HkIdMhR6XIaqRM3Ey4cD43hRC4QmjPJAWBTmHnREhJ2qNMV
	 duf4FVkRI4agwA199yicTAjm6Fc18TDOjMDlIN7qV9dRjPgrQmnVzklpRWGeg5UDMJVDZ
	 QBGknjnrLeikjABjeUt/d3WTbUerWY5HWFcaajb7rot6qYjIanOMaiiqy7+FtwCCd05ym
	 JAIh1whaicZ+gWbBovvIG4B4Dh+w8PI5HSgyEhcUHvt7i8Vo1lifTX6tS+jVqV3c4pA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9Y3kCsYcaDY5qwLaKX26SOy2iD45ozQ8Dc5QEanJuFg=;
	b=Ex98YjOgFnfHfWTYrEj66HoseLs9ZYtt5Aa/Vhc0Wx43L4c6l/A+3lSGZfO+aVnQZPum
	 rjmeHKxJBAphM2My+7DRUnvp+PH9B3JzMeuxYaBEESsn+D8pUOKf1xH4dYCW8aJ+DBHmR
	 nNQV+Y/h6fmjOKwwVknpVaLB997N30NlCxCWsIGZvSh0CNaRCqqxoX2j294NSAaK/YgqX
	 pnM1XaeXyep5gIksZi3OUcnWKpj+7TZZO748Sel7h/uALpKtnDoYg/AxkxHB1siFqJ2CQ
	 81jL7kqwnrBzlI4NgxX1ltDF5U4/q4pY7KPJ6JZ8aya7X/r0QQy1LYumWMkTPTvNiIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="v+t9/+Xs";
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DEE160A380D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DEE160A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=v+t9/+Xs
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8302215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 08:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794243281; x=1794848081; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Y3kCsYcaDY5qwLaKX26SOy2iD45ozQ8Dc5QEanJuFg=;
        b=v+t9/+XsD2NdVTBBlS/4HDEp0YNRAfHx6ph2E67Lah+TN7FYohTAudGJKyyjjQmZkO
         NVbg3tc4ojdTCyh3jkD7ZsH0aTWqdXrCLOWDvwrlfRIkBTxnsMWxuatv6JeFnvX0pe+E
         f2zlCZduQFPF7rkwmjcFE9NVjRakmCfHtRvkQBWQkzay0vC+p88BvcuhCW77Y9LQEVNm
         WGC0CSbYfoD7Gr55PjxMRAVamQ2a0pfj63tK1aesX521AOfzPdX2WeiD/ztiuccJ8ybO
         QpY9vIb5TPfe7/upKVlCTzkZVX4GcXGL2g6IOt0xc1E6Jy5ffK8OH0CjQkNyp/zez2FV
         CQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794243281; x=1794848081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Y3kCsYcaDY5qwLaKX26SOy2iD45ozQ8Dc5QEanJuFg=;
        b=KJbrVN/cRzrXeZ5OxgdMWR9dCMbRTq/WO8oWKZREXBFfxpe4r6+7LIDFuJ//mmsauS
         AdIxcQJHa4YI1cK1CO3VZFuVs1bUCQ8KW8RyOKXPt3vfRpd2/i37wZWFix8DTcl3Gxtz
         ylVdjHz140L+h+QXydWri/hTMW1Dt2zb+HElnDXVe1ypyIJetCBhEdS7jopPQFFTg+/6
         NA9/Tadx0SS1tjApotxbnTuRmDtoDtWsuW7thXFDSo+3Gm5QqslAh8fp0g7zpF7uw7rn
         gA83hDhOCkvyxBRV30G6FVRVPINOEP6SRjDK63WUlL+HowEPNE/NA+PcKuzpGcdlXe1s
         UA+w==
X-Forwarded-Encrypted: i=1; AL+hErHGu958Q9hWlJJr113oN+HtqlYafWJDWzmY2FK8mSA2iiQUfi4bpiyaHLdb49qqvEnE7agYYNNBpzN189Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8O0XiNjLHoXDjuVjhPLCgIAS7H7VkZnL9aOEw9QZcuyfQAd20p
	/XjECdZqUR/pgjZ7RkMyFQTV1c25HNHU7/XWfa1axx7Bq8TKhVFa/JPw
X-Gm-Gg: AYBFou0e2OTFnXYxiERuVo/+m7lqu9FUSLnqpNxdmYEAufySp8epLOwEK7Xyc+0fL2k
	3EM4zzXiGfnJ0Fwdasb+xdo+h8fJ/mfGtmuhSR2Trd/QkYOotLowJPGE5eEbPYxLp+RhwD9xlXf
	ILU4VXWIYBmw/MAvyTczf6dRaSwPdMyxJgiIJylnTzCTyUcCi4MNb+oVnYT8jb7YwDL67ymdrU/
	NluenAeeBgOa6r0clkZ4ejHM6lMROgzVBnEk4tG8FOrpus5nto2YVdfPBnC3YpqRQU9AlkhKdW3
	3gFEjlA7LtwGG8GcZF/Vb3HWFtQq6hftJrDVGSwFalv+uKnNIe8e+YLhUSn5PcrGXz4OV983rr8
	hvdpI+fElxoIWPrYormL2P702q/TKxWJvtU7rcyMv76bDCde+B+zj1UIC0Ag3DMgO7Fz4JtABGo
	U4d71ZKZM07C2E8lBz/LjYT7Kpl/gnZcAThUe1Qc5HNJiCdgTlELSFuLM76Aq6BvqA05vm+Gyuc
	cjPP9LNrss2oF8MQATXg8IHir2GWA8eemcOkLla6Wn5Zdb1N8J3Zcebb1P3NNxVw7JEcxI0uGZ2
	kX8LHfQ4opayxBjsF54uupoqOSpxbt7RwiYmMsBjJJngTBY=
X-Received: by 2002:a05:600c:6c42:b0:4a5:a5ca:de1d with SMTP id 5b1f17b1804b1-4ba001d0e71mr15885685e9.30.1794243281388;
        Mon, 09 Nov 2026 08:54:41 -0800 (PST)
Received: from localhost.localdomain ([2a04:ee41:4:b2de:1ac0:4dff:fe0f:3782])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783fd04sm11392369f8f.47.2026.11.09.08.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 08:54:40 -0800 (PST)
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
Subject: [PATCH v2 bpf-next 03/18] bpf: Build fmod_ret target sets from BTF decl tags
Date: Mon,  9 Nov 2026 17:05:23 +0000
Message-ID: <20261109170550.141443-4-a.s.protopopov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109170550.141443-1-a.s.protopopov@gmail.com>
References: <20261109170550.141443-1-a.s.protopopov@gmail.com>
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

