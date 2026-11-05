Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890692;
	b=QZZAPnfSgyqRKVgueDT3YzaXQDQch0jRn3DTnvMDIX0W1uIKomvpTauFiqf+BoF1TN6M
	 NK1YXTxeNVuZfC/imMylnf6RVxDlU4rbNrCs3A8Drjfv80p3Vp06JZN4r/0DeJk5NRmI/
	 x1n5Fw4uTyICTOYt3KABy4dUiZzbYXhh3BkJODGA/6MaLmjq2i1ke7ca7CwfMXts6qKZj
	 GXMd7gsyS/dQlZX0wrGVhoY3dterGZPh407SUqb/hF3PzblU8VPLB/pgnTaTulQgQX3PT
	 sYjAdd87aqE1bOvuvP5QsjWFFLWGDz+kFK4KdOSdXVLGGTN1m8arqvBJQG3zoh0HuzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K/YG+aq9tXklCRb7yDJeFE3l+WkDZoCBNu+6Hf9fIm8=;
	b=0A5Uc7wB2XBWXs4n100QzGV6GX5reyjtk+xmcSscfZFyIUyf7JWfVs1QUU1qoZd3zNGo
	 Jo6WRGyx47nVBJLuEr+4B8/hcKbSCUm4hdEqyw0MUOAxWGl+4PgtVESV+TrJzfRnjYWr3
	 BhtRLWyJT08gv9Iy5kXN1mnO3p4hb3XviRgspB8mnm8dumRpF+EubTn5Cv+6vvMa9fCo1
	 lvefSf+d54LCiUDpkwwbruJxCn8dkIW5mptIDAzEqEgYbDDKPszjjmtDijDkCOIX7RXbk
	 WNHPb1RebCaA0m8erHiHNWHhI9AJbaE6gKVpdgbJJ+YnroK4gOz1OQ1D0tyAnfTO72w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Abp9Kx9Z;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795F76082BC5
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 795F76082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Abp9Kx9Z
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-854b6e2e41fso1118883a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890690; x=1794495490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K/YG+aq9tXklCRb7yDJeFE3l+WkDZoCBNu+6Hf9fIm8=;
        b=Abp9Kx9ZxNrYDvhuglxqLHmemMfbrR189lq8yhUDVpNUPsVUlBMqMHkb3wzhkQrIe0
         DMKRvb2qGKckX7FMWndMwmGJ4bfFc8TpgLgxpmFCQVKYlJ25V8+1HFuEjU/cA/nzbZPL
         /7wfJaupRI3GBTX79MpDaeqXPuvCfL71YDiAOLk/w4sX3eg6FVBVEJN1OECDX2og7iT+
         JqXIQ1z6M+/S51hBiYk0/3c47weWB/IOGNEl7IFRYi1CAo1Acj2pZz32rwIB5xyQDMQk
         yLL9r2s9GsjVU26+v6Gq6ddzxDmatFM40W/Okan89S7Q7qkU01zF/wxihSozMDMoU/nx
         6KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890690; x=1794495490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/YG+aq9tXklCRb7yDJeFE3l+WkDZoCBNu+6Hf9fIm8=;
        b=0i+S+40M7Z2rJcKZ5n5O/pNK6duBA5VUKYfggUIWo30KkKOOZbTWO8Jg63zc6gEyip
         EvrnbFIYfXZawAac+zBiA3wahNwi4H256cF/82zXSUENOmLEmdCIKz/i3o8q/yn3xqKW
         keswoWP6sD8krUu4VKYduP/mq9S5+2KBV/qlJ9YT/jgO6Ndq78NvDOB4LywoS2EFcoUV
         c65SiJ0o6I+tNQQkAwMjovq+T26nx4cnFCnJmjJCmUtTBCdmBsF87zv977nTjJOdekye
         G/49FgZYrbjovii0R02gQYIALESUtWI8C0r+kc8+7gFyKbfd2TW3RAlniXs62FO3M9+t
         jIDw==
X-Forwarded-Encrypted: i=1; AKwUvBwyZE276LSsqZDCPJdWE5oTJSwcXlBWpN6Bu6CVqV2fNs1sfvNgy/TPyi8MNid+91URIx9nj+/CbgwpOvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lIvkPmp+Ty2+XWpGsaorZ0D/bEU6Ia1aX1GFKUJwyhnJ2CM+A
	RYHeoAH96dvazxlKrc2ZTGRHz1lc8Jx5UTlVbbAaG0Fh2UeHKKyfodbbigG4AOoGHWU=
X-Gm-Gg: AYBFou3KnxlOUWOMLImQdpDirH7fqW1bisxZulI57eWoVixzgU5mv7Z7X6+qoBrWlel
	vkqTtUudHwFlgDLbqIQ5O04wWRk725AGZjMGYqprPsbzzeyrfJ2CVtSbF7iakf/9Js07wwMTgyh
	PUP0jMx/kMrHxdJMpyE/WuX5UsY5ax/R+OETJZ4aBNpLihLo1jpT/tFh65/vEsj6QbxLHar26iX
	pdYbxq+1hMEmQRCWBQxomerL9SmEtVXe0UdUfmPB1LR6eSocKT3AAHfpuh9HDXEclOrChlhdMwX
	qdD9zR+DrX4wcpFiTD2KuB2Vuat6IlWfCxdkgNVpnn6hCgTrWqPs6/VBnxl//tMtCpBnRV+Z6rS
	v+DwXJWiKGWFh/koNhu9ev2OcqbDLsfpg9JIdA4eZXdlBHa77z/4WbDTHLIxnqbymxlcI1OHjlE
	6BeJkGWl0pp+cst7+VQGYGzAFLYTwflXbp+pgJ4ThuiXJdN2WxFDBPNDbPKDeiTwdAidftVflcZ
	a7fk1yL0L/IZEy+GbosMT854DPjTb/uWNkYf19ggkJV43GV2cILjkc2QH2Mjv8oo7zA7ny7HUVk
	IH3hSMTti9oY2ytSW8pnaoQikJ+3VIXJslGXHTW4FU7QkQ==
X-Received: by 2002:a05:6830:43a0:b0:806:dbd8:9929 with SMTP id 46e09a7af769-85d3652ea54mr16022799a34.15.1793890690360;
        Thu, 05 Nov 2026 06:58:10 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e170absm4744674a34.15.2026.11.05.06.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:09 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:56:59 +0000
Subject: [PATCH RFC v3 08/90] user_namespace: let the kernel map the ids of
 a cell
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
Message-Id: <20261105-b4-cells-v3-8-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890669; l=5731;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=oV96zWzSgFL3jNXwinYKrOo2cM9oFlK4P6S6oV3cc6k=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QIaAb7GwO8ZBHVxrWC5ZqzAX/7cRkPe1b/gujCQNJ6TOjJBSgF0KE3r1Twdu2cXWR5gqDFlzx3j
 OKPhTFz/xpAA=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The id maps of an ordinary user namespace are written by a task, and
map_write() makes many checks on that task before it accepts the map.

The maps of the user namespace of a cell are set once, by the kernel, to
ids that the kernel chose. Add userns_set_cell_map() for that. It takes
one extent for the uid map and one for the gid map. The checks in
map_write() are about the writer, so they do not apply here.

If the cell has a single gid there are no groups to drop or to add, so
setgroups() is denied permanently.

The namespace records which block it was lent and which ucount the block
was charged to. Both are released when the namespace is freed, not when
the cell dies. Every credential and every object that the namespace owns
pins the namespace, and may still name one of its ids.

Add userns_retire_cell_block() for the case where something that is owned
by those ids could not be cleaned up. The block is then never handed out
again.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cell.h           |  7 +++++
 include/linux/user_namespace.h |  7 +++++
 kernel/user_namespace.c        | 65 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/include/linux/cell.h b/include/linux/cell.h
index 6a65d035ffca..37fde4bfea44 100644
--- a/include/linux/cell.h
+++ b/include/linux/cell.h
@@ -145,4 +145,11 @@ static inline void cell_put(struct cell *cell) { }
 
 #endif
 
+/* The id block allocator. */
+#ifdef CONFIG_CELLS
+void cell_block_release(u32 block);
+#else
+static inline void cell_block_release(u32 block) { }
+#endif
+
 #endif /* _LINUX_CELL_H */
diff --git a/include/linux/user_namespace.h b/include/linux/user_namespace.h
index f0b0fe12c2fd..4a48ead45820 100644
--- a/include/linux/user_namespace.h
+++ b/include/linux/user_namespace.h
@@ -123,6 +123,8 @@ struct user_namespace {
 #endif
 #ifdef CONFIG_CELLS
 	struct cell		*cell;		/* whose namespace this is, counted */
+	u32			cell_block;	/* kuid block + 1, 0 for none */
+	struct ucounts		*cell_block_ucounts;
 #endif
 } __randomize_layout;
 
@@ -193,6 +195,11 @@ static inline struct user_namespace *get_user_ns(struct user_namespace *ns)
 extern int create_user_ns(struct cred *new);
 #ifdef CONFIG_CELLS
 int create_cell_user_ns(struct cred *new, struct cell *cell);
+int userns_set_cell_map(struct user_namespace *ns,
+			const struct uid_gid_extent *uids,
+			const struct uid_gid_extent *gids,
+			u32 block, struct ucounts *ucounts);
+void userns_retire_cell_block(struct user_namespace *ns);
 #endif
 extern int unshare_userns(unsigned long unshare_flags, struct cred **new_cred);
 extern void __put_user_ns(struct user_namespace *ns);
diff --git a/kernel/user_namespace.c b/kernel/user_namespace.c
index 45699a0a0bfd..4155e2e77497 100644
--- a/kernel/user_namespace.c
+++ b/kernel/user_namespace.c
@@ -78,6 +78,66 @@ bool userns_is_cell(const struct user_namespace *ns)
 {
 	return ns->cell;
 }
+
+/**
+ * userns_set_cell_map - give the user namespace of a cell its one and only map
+ * @ns:      the user namespace of a cell, which has no map yet
+ * @uids:    the uids: .first as seen from the inside, .lower_first the kuid
+ * @gids:    the gids likewise
+ * @block:   the number of the block the ids are from plus 1, or 0 for none
+ * @ucounts: what the block was charged to, or NULL
+ *
+ * The kernel chose the ids, so none of what map_write() has to ask about the
+ * writer applies. With a single gid there are no groups to be dropped or taken
+ * up, so setgroups() is denied for good.
+ *
+ * @ns takes over @block and @ucounts and gives them back when it is freed.
+ *
+ * Return: 0, -EBUSY if @ns has a map, -EINVAL if what either starts at is not an
+ * id.
+ */
+int userns_set_cell_map(struct user_namespace *ns,
+			const struct uid_gid_extent *uids,
+			const struct uid_gid_extent *gids,
+			u32 block, struct ucounts *ucounts)
+{
+	guard(mutex)(&userns_state_mutex);
+
+	if (ns->uid_map.nr_extents || ns->gid_map.nr_extents)
+		return -EBUSY;
+	if (uids->first == (u32)-1 || gids->first == (u32)-1)
+		return -EINVAL;
+
+	ns->uid_map.extent[0] = *uids;
+	ns->gid_map.extent[0] = *gids;
+	/* With a single gid there are no groups to be dropped or taken up. */
+	if (gids->count == 1)
+		ns->flags &= ~USERNS_SETGROUPS_ALLOWED;
+	ns->cell_block = block;
+	ns->cell_block_ucounts = ucounts;
+	/* Pairs with the smp_rmb() of the lookups, as in map_write(). */
+	smp_wmb();
+	ns->uid_map.nr_extents = 1;
+	ns->gid_map.nr_extents = 1;
+	return 0;
+}
+
+/**
+ * userns_retire_cell_block - never hand the block of a user namespace out again
+ * @ns: the user namespace of a cell
+ *
+ * For when something that is owned by the ids of @ns could not be got rid of.
+ * The block stays marked as used for good, so what shows is -ENOSPC and never
+ * one tenant owning what another left behind.
+ */
+void userns_retire_cell_block(struct user_namespace *ns)
+{
+	guard(mutex)(&userns_state_mutex);
+
+	if (ns->cell_block)
+		pr_warn_ratelimited("cell: kuid block %u retired\n", ns->cell_block - 1);
+	ns->cell_block = 0;
+}
 #endif
 
 static unsigned long enforced_nproc_rlimit(void)
@@ -273,6 +333,11 @@ static void free_user_ns(struct work_struct *work)
 		retire_userns_sysctls(ns);
 		key_free_user_ns(ns);
 #ifdef CONFIG_CELLS
+		/* Nothing that pins the namespace is left to name its ids. */
+		if (ns->cell_block)
+			cell_block_release(ns->cell_block - 1);
+		if (ns->cell_block_ucounts)
+			dec_ucount(ns->cell_block_ucounts, UCOUNT_CELL_ID_BLOCKS);
 		cell_put(ns->cell);
 #endif
 		ns_common_free(ns);

-- 
2.55.0

