Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890713;
	b=5fD5iVbo+NMlsoLAIfhtmMKWgckME1nqCfDbUrVVdNrD3vYMCnR6mwGW7oRpW52yo2d5
	 xpU6xLQhfTnnFbzlMgTXkT62PlwCD881DqS+bNlVfthNHn1XVCViJdxW/MkArkpFllL/6
	 +l05/eJK5qmW2VCNk/t87YblwoVeCLMNPby4gtD/87E2gCwr+kIWSdfuGVxTgZUUFwvKM
	 kDTFLfFwJA4r8VxCbWCTe2+E76VO9/+rL577fF+YtwTc/bgqcHKNgv8KYL74/AonKm7Zj
	 2LUOt1/oPctxxh5HycKP33lnwK2CS78rMkHyo/obbF7EaxXOSC7O0oXpkqbrYCAl67w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=MGaILMQfdt4chI3i7y0XG67rqkk49m3Gf84vXa5blcw=;
	b=JPJVQZmnxbYMqflaIMUJGAJSi1nrRynS2m3maFP0eqLQreHgziT3sViqAOVUW8X1LUtZ
	 rKozaKdnGiXDuaaNcvrLiMcAwCWClgZ5P0JgZ99kuBRqOovkG2Bn/M2AWJAIRq1nwzH0D
	 HKgDraPjP05XZ4ITC52dWfPFQn6JqZ6SpKdGcmrHUrbEuj9X8UAvdcee3KI6CpQz1cM/M
	 riJ1/dKgcSMQwrNDJpFnhXQPFWGF66ls1k9P+KHk1reQwoPgq/+YMKCxTA1PDae+R/EYW
	 Kj+F7fQ1p9uFRpivyoy1grQimOzHrlXKlaALEDqH3LtpUk8DQmnsR39caEqc9CoTUPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ARBGbxGY;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2311160A261F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2311160A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=ARBGbxGY
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93f3c89594cso177713385a.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890712; x=1794495512; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGaILMQfdt4chI3i7y0XG67rqkk49m3Gf84vXa5blcw=;
        b=ARBGbxGYZf8apk2d3UWc46lm8VDLjyKnGemvEZq1gKWSENKQGdufwjisYxk+ADl96Z
         99t5TzcoFXakO4O3xNZjOU8QtyKSPe4XlR/9ilMgfnmAno6DVz2tmqL+SLKbQLCB5w8+
         2Y5SBy2Zdb+nm7ineKqnXb48hNn7aQNQllIQ2zzEyghxHCWbPC0uISs0s4lAS4bYVFuf
         L0CzsoRdl4BB176KTv5EvU5zbf+VeLf1Q+BaFcJbqFSRNqHAE/cT3pRl+Ovteqfcz5CN
         LULJqd1rzBXwP1FDxfdJivq9VWGtmblhkL7+F1Ox2UvfFZBhUdUeCUtI5RbCgBnatjV8
         MxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890712; x=1794495512;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGaILMQfdt4chI3i7y0XG67rqkk49m3Gf84vXa5blcw=;
        b=vDHi9V/1T74KQOacIH9fPxXZ4OIAOhTDYyu/wnKgQjtoH1Lrds6ZKa5YZDVlok04qh
         4MGIbkTsbk80L7GbhFaDdds4qbCuYBEolWUIRlBOj5YSGtOeLkU7ueeltO+xX0r+xRKc
         OypVXxwo4HsvQ4sSkjkqTPQCIuHA6UvgtCZqt/W2Q0qlH+oOPgBt+s1fBHHpexnGDGQi
         PLTpE/YfvBUEuaA0Ixh57v//uqLkf2HVMeWBdpv6+yrZlsI7OGCFvXuQdnJO+g96EnFU
         3VAoR2Ih4jA5Y8Lg4uGs2Ugs3VIuel1O+l6W3dJ/ma4m3bwYwebYBAEtuOysqoDSsgjX
         bGPg==
X-Forwarded-Encrypted: i=1; AKwUvBwhG1zWVUgzxficuSzRKo2VCGKhqSsIS6bHCp5GOq/pzg/pCvMf7clyBH62OgJFj22Vpogv0kpnGUS7q9o=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xlwzagU1DycSBmM1MPWRxM0H2t/ivHTc2yzyO30fnTcwLiPug
	nB6jzOYxPrf04igw32CKWHF5moUw7EIZHIn3YAFNaXUy7yWK3O6O19S4or/3fGqg9gM=
X-Gm-Gg: AYBFou3CgiLlkLCxQTen7ciV61ZKX2KpDj+CVHca5AsOCbC9QfZR7aDcVZ+EFFOIn5C
	Swj+20p40y9H6a6g+Se79QRuyADEV5yUSzTw1col1aZ5oAc+x8qkMEsxciGnWMtfGFsXiGALn6C
	gdPwvGUcfSmwY+CiEIKiltsfnbrXAXkEcqssbF1PZ4fK0V53mipzCB57DjbL/rfanLUNh1Cwo/C
	izKEEHNsk9lIMA7kHkNDMdoOh+2jwVfHruxFAZz04taqbGh3QFx5FneY+1Rv0bfjQQamiefEs6M
	jOgRydfPjilZb7R3X2+5zPSA4bDg3IiwLdPqBKVzPn9jr6QlC0f6BUx85fXs10nBRuTndKObJY/
	T9UoCCqsaOQ5JhkYqeZQ2dHDeMp0Zg6qHrzUhW5zEmlLyfL9CRq88ig7rxmMZbl0/6IU3Cdh8+m
	x2GhIE2GBXwimykRfStZjaC6OmTGZrCTcde0kO6gqsVVjtW0+6oI0hYnyxEwi051G0whR2CRNJQ
	e3oQZ1l6r5Ilgt2vJn68WWlU23KxNXoVwHYjbTuGkcyOO0RMEXwlRVwKA9l4CK3LBUAsPgqOKEp
	Sz/e+LqKt8NF2zCO9AUaaUuVZzx0+sdUb9Vk6HQiLPCm1Q==
X-Received: by 2002:a05:620a:6483:b0:93e:acdd:acd9 with SMTP id af79cd13be357-944214d68bbmr2945212185a.7.1793890712094;
        Thu, 05 Nov 2026 06:58:32 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d479e107sm478675985a.7.2026.11.05.06.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:31 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:11 +0000
Subject: [PATCH RFC v3 20/90] cgroup: root a cgroup namespace at a given
 cgroup
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-20-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=3752;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=5CSluj2vtjSNuvg7pODJ3ZESLlCLSmlnzudcUt7/8ZE=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QBSG6WoCW6bZ4VZGG1EWakfC2ytxq1dLYNArlzrzqVw8OIn7HD8k9GhL5QGy9uKe45yMZiCoq0j
 0sur/aYbNVgo=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

copy_cgroup_ns() roots the new cgroup namespace at the cgroup of the
caller. The builder of a cell is not in the budget of the cell and never
will be.

Add cgroup_cell_ns(), which creates a cgroup namespace that is rooted at a
given cgroup, and cgroup_cell_cset(), which finds the css_set that it
needs.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cgroup.h    |  3 +++
 kernel/cgroup/cgroup.c    | 17 +++++++++++++++++
 kernel/cgroup/namespace.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 57a4037671c9..af467b402448 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -154,6 +154,9 @@ struct cgroup *cgroup_get_from_path(const char *path);
 struct cgroup *cgroup_get_from_fd(int fd);
 
 struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gid);
+struct css_set *cgroup_cell_cset(struct cgroup *cgrp);
+struct cgroup_namespace *cgroup_cell_ns(struct user_namespace *user_ns,
+					struct cgroup *cgrp);
 int cgroup_cell_chown(struct cgroup *cgrp, kuid_t uid, kgid_t gid);
 bool cgroup_cell_kill(struct cgroup *cgrp);
 int cgroup_cell_budget_put(struct cgroup *cgrp, bool handed, kuid_t uid, kgid_t gid);
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 75f8367271aa..051b220e2850 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -7163,6 +7163,23 @@ int cgroup_cell_budget_put(struct cgroup *cgrp, bool handed, kuid_t uid, kgid_t
 	return ret;
 }
 
+/**
+ * cgroup_cell_cset - the css_set a cgroup namespace rooted at a cgroup needs
+ * @cgrp: a cgroup on the default hierarchy
+ *
+ * Return: a css_set that has @cgrp on the default hierarchy and the root on
+ * every other, with a reference, or NULL if @cgrp is dead or memory is short.
+ */
+struct css_set *cgroup_cell_cset(struct cgroup *cgrp)
+{
+	struct css_set *cset;
+
+	cgroup_lock();
+	cset = cgroup_is_dead(cgrp) ? NULL : find_css_set(&init_css_set, cgrp);
+	cgroup_unlock();
+	return cset;
+}
+
 /**
  * cgroup_cell_chown - hand a cgroup to somebody
  * @cgrp: the cgroup
diff --git a/kernel/cgroup/namespace.c b/kernel/cgroup/namespace.c
index 76660332ec64..987ec8cd5db6 100644
--- a/kernel/cgroup/namespace.c
+++ b/kernel/cgroup/namespace.c
@@ -87,6 +87,50 @@ struct cgroup_namespace *copy_cgroup_ns(u64 flags,
 	return new_ns;
 }
 
+#ifdef CONFIG_CELLS
+/**
+ * cgroup_cell_ns - make a cgroup namespace rooted at a given cgroup
+ * @user_ns: the user namespace that will own it
+ * @cgrp:    the cgroup, on the default hierarchy
+ *
+ * copy_cgroup_ns() roots the namespace wherever the caller happens to be. This
+ * is for a cell, whose builder is not in the budget.
+ *
+ * Return: the namespace with a reference, or an ERR_PTR().
+ */
+struct cgroup_namespace *cgroup_cell_ns(struct user_namespace *user_ns,
+					struct cgroup *cgrp)
+{
+	struct cgroup_namespace *new_ns;
+	struct ucounts *ucounts;
+	struct css_set *cset;
+
+	ucounts = inc_cgroup_namespaces(user_ns);
+	if (!ucounts)
+		return ERR_PTR(-ENOSPC);
+
+	cset = cgroup_cell_cset(cgrp);
+	if (!cset) {
+		dec_cgroup_namespaces(ucounts);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	new_ns = alloc_cgroup_ns();
+	if (IS_ERR(new_ns)) {
+		put_css_set(cset);
+		dec_cgroup_namespaces(ucounts);
+		return new_ns;
+	}
+
+	new_ns->user_ns = get_user_ns(user_ns);
+	new_ns->ucounts = ucounts;
+	new_ns->root_cset = cset;
+
+	ns_tree_add(new_ns);
+	return new_ns;
+}
+#endif
+
 static int cgroupns_install(struct nsset *nsset, struct ns_common *ns)
 {
 	struct nsproxy *nsproxy = nsset->nsproxy;

-- 
2.55.0

