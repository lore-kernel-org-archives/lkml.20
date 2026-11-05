Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890709;
	b=tBIu01HQdR5hEWHJJJ8VS6tai9Qj6xYS4D9K/c/KTi7V7xjnwU+9MTtkiMcDQpULcVUM
	 R9U9kIncW5A7RqVJflOMdJQXVQkUuW60tL0Ha/1EUALhfBFTE7/16HfWs1rugTY+ebSEW
	 rhb0bHBLE/z3CklGJTE6FyxXuNM7U8zW/noPCpysar6ou5tdl62MPndXVgDjQfp0glIdp
	 /jg8boLygMVZ6FlN4EBsjK9b0dqLr5wiC/H0Yz3VzCSQFsO20Fw8sikeQ5iIBUVNmhVyy
	 jT8sqogX1Yh42N32DxrqouDHW9IzsH5C/adwddBrfHe+mLJ42t3bAQ8G3X6dUyKBTTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=LU4dOUmsl/B5Tdxs3wxAiXTWWMfymKaeaVEzCu9fZtQ=;
	b=uGd0eN0kEu5KCgsLykQgfZtextfuaFREhL0bMYmXTQwlgtPJivtbZmazUlpjqwcav8a7
	 U9iowvUY50gHCegLI+A9Q7IwwxgR5L0ccqne8e1GUMNdesKPRY+fMNVXXya5PFzduyPDB
	 deMxvWXmjmaYVwJO+eBcb3a1Xk8mYSCc5GT47Ky1SoWoh9yGQVbEF1mualBM7WbGYI0Th
	 EoMHEtA4bf17Mpm7K+Ih+orF1JmSczLm/gszb/xOTpQY9cvFG8YhRCdCHB+E2u7nWAkFz
	 r3xIT/vaCjwof5tQCscdUNb3LB9kI84tMRvRkAGbpEzzKDA6LMtRBHp5qGlXusH5Kjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fxlOoeR2;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B0860A2608
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B0860A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=fxlOoeR2
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5365f9a04c5so27415551cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890708; x=1794495508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LU4dOUmsl/B5Tdxs3wxAiXTWWMfymKaeaVEzCu9fZtQ=;
        b=fxlOoeR2Kitk0N9nkf948rfF1MPm/jmyD/E6H6ASot99aPgCEr/2nq06EborePeFoP
         TK6WRP5Qd14vkATTGz+fkKw9j8TnqeTOw5v5Ud/HAlAn52lKC/Jeg1GHUXbLndC13H8R
         RwrNZ5u6u5iJTyrsvdsOMbnDJPyJWT5U9slnyPFpu7ZEZwzsIOmFs/v7ARPODR0fVKmL
         HrpHLVMpM8mxtthpVh1ehgg90oZmQtGocEY40jEhJ+WeK1tgQ7BxNlrQRC6UaK6cS9Pc
         zWrKQu35iSo3HsVxpeJtPL4Q9Ou3AalThTtKRkVj3vdvl0gC4fcrkqvrxVQ9wEak4Jfu
         mtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890708; x=1794495508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LU4dOUmsl/B5Tdxs3wxAiXTWWMfymKaeaVEzCu9fZtQ=;
        b=Ye/bxqgVVaaRx8h1t5wGkNvbqXs2sX68zk+ClLjKQKd5wrJ8I19SJojpJW1GF2YXhu
         fR5Za4U0WlnO637dRabUZcgX5GRgD3Nyi2F2VtWjUgjHGcbmpdO5MlrYvhJMybyN0EkW
         u3cOc6u/ISNYxYsEU0u6FR3cAaLMywYdXU+/0QuKhioSJ0zaVKEUggsvw32x/XBKZAHz
         fnWwYiYjICTx6pWXKqm0KA2zEuSy1Av3bTc/kCjdhfp0xCEPJIe+CzR34JGJHhzc49DY
         L9FjyV4WPBnTK1oTeVjClsgNO5QHTF3XoPTiT1472LuYNisFWUIN/Pl3vSoZCI1/1opv
         i9FA==
X-Forwarded-Encrypted: i=1; AKwUvByKvvxedY34LojOEw3BU3dvHArniYbfUr4tnZ1zW2YpCXEkuSNLAKyU17wIk81Fw7jdlaa7KeohzUzQhic=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YKdHCOJSITpKnVmXD7kUEJrdvR0LTTX9+zBVq60m0wtPIvBp/
	yuIA0u8qbMB4oVomSEICg7Xy55dHYggkTMHK2g9Y0OLfNl09vXT4liH3w8L+pXRgmMM=
X-Gm-Gg: AYBFou1k/sxMXWXZ5qSMLWOgKLREVc+jnlSldDBR3w5jzY4KFpVCDWSjm1dSb7iHkom
	DUFmoIyweDRTyh8g6nUvDlQqf/pGfpOrdvCRvZ3czz8w1QbQHCiChvZI+4L4qAfn6gBdQPbWaV8
	63Z2ptrnv/a3UoH98uwBXtGaghDXr0oUVWQFLDK3JZHROm3ItbToH2VzzWu7+kTuj+YiNQT42L5
	rW/JWogj0NQlFxxtZv7sgMgmCT5VX7gqSQjojl2sNMSAknalJOu1ul1gwLZmAHmaDkSr88SZ28a
	O+Ck1oSA8zCv5vcxGV5AyJm5lTjtxSKTNuoRW6zmfnInfqZnXJdRr81xkW6x7woAV3V6A0dei9X
	Slk7/Ef6p9G2NHQfS08cXBIFv/Hq+47KZ0q/oOQS4NtiXazta4jG94FIuJGSGrasqHz/utCl1IL
	LW0I3DlUK55kjdrvjBLedDTQhaSmWD7T8p3gxHRn0B8ak23iGVHRvXNapXL5qKkHlOqkjHZGl3L
	4uLTURMPrfTRh8kWxdgzx0c7aLn4M7+wjKp1KCXNbV20r8RcXQSvh4tGGvqx9ojQ82F+BJiW3tT
	0Wc15sUrBORY83OvJtPXJrwl8vyd6zkfHLvjVWHfAzvIcg==
X-Received: by 2002:ac8:5f08:0:b0:536:6013:bea6 with SMTP id d75a77b69052e-542b3a795e9mr327766541cf.2.1793890708025;
        Thu, 05 Nov 2026 06:58:28 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e7dfb2f7dsm49266906d6.9.2026.11.05.06.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:27 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:08 +0000
Subject: [PATCH RFC v3 17/90] cgroup: add cgroup_cell_chown()
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
Message-Id: <20261105-b4-cells-v3-17-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=3057;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=C7OjEBtvUCVisXbdbWldloZn3RonvyOXbj/wk//BDlM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QOlwUnZj7vY01RAHvY6vvksbJPiN17kq2SPgu4uHpXYpmS1jnzvyFpInyruLUtjk+nmOyxfPM4h
 SUhgTzqBBYwU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A cgroup is delegated by giving somebody ownership of its directory and of
cgroup.procs, cgroup.threads and cgroup.subtree_control. The builder of a
cell cannot do that for the root user of the cell. It cannot name the
kuid, and cgroupfs could not store that kuid through a chown anyway.

Add cgroup_cell_chown(), which changes the owner directly on the kernfs
nodes. The files that hold the limits keep their owner.

The function can fail half way if it runs out of memory. The caller undoes
a partial change by calling it again with the previous owner. That second
call cannot fail: kernfs_setattr() only allocates memory the first time
the attributes of a node are set, and the nodes in question have already
been changed once.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cgroup.h |  1 +
 kernel/cgroup/cgroup.c | 37 +++++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index a5ef01688e7f..0e45a5a1afea 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -154,6 +154,7 @@ struct cgroup *cgroup_get_from_path(const char *path);
 struct cgroup *cgroup_get_from_fd(int fd);
 
 struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gid);
+int cgroup_cell_chown(struct cgroup *cgrp, kuid_t uid, kgid_t gid);
 struct cgroup *cgroup_v1v2_get_from_fd(int fd);
 
 /* Was this controller blocked from v1 hierarchies by cgroup_no_v1= ? */
diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index c4bbb70f490f..fb2775006087 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -7124,6 +7124,43 @@ struct cgroup *cgroup_cell_budget_get(struct file *file, kuid_t *uid, kgid_t *gi
 	}
 	return cgrp;
 }
+
+/**
+ * cgroup_cell_chown - hand a cgroup to somebody
+ * @cgrp: the cgroup
+ * @uid:  the new owner
+ * @gid:  the new group
+ *
+ * Changes what delegating a cgroup is about: the directory, cgroup.procs,
+ * cgroup.threads and cgroup.subtree_control. The limits stay with whoever is
+ * above.
+ *
+ * Return: 0 or a negative error, in which case some of it may have changed. To
+ * undo that call this again with what it was. All that kernfs_setattr() can fail
+ * for is the memory for the attributes of a node that never had any set, so it
+ * does not fail for a node that has been changed.
+ */
+int cgroup_cell_chown(struct cgroup *cgrp, kuid_t uid, kgid_t gid)
+{
+	static const char * const files[] = {
+		"cgroup.procs", "cgroup.threads", "cgroup.subtree_control",
+	};
+	struct iattr iattr = {
+		.ia_valid = ATTR_UID | ATTR_GID, .ia_uid = uid, .ia_gid = gid,
+	};
+	int i, ret;
+
+	ret = kernfs_setattr(cgrp->kn, &iattr);
+	for (i = 0; !ret && i < ARRAY_SIZE(files); i++) {
+		struct kernfs_node *kn = kernfs_find_and_get(cgrp->kn, files[i]);
+
+		if (!kn)
+			continue;
+		ret = kernfs_setattr(kn, &iattr);
+		kernfs_put(kn);
+	}
+	return ret;
+}
 #endif /* CONFIG_CELLS */
 
 /**

-- 
2.55.0

