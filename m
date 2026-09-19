Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06B439A057
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789856773; cv=none; b=owX7EQskUg/LcRHQ3eqFjveUi1w1E4voviRm5MloOvxcm48CMwpWNwfwEed9AHpmJJUlnzSH6kxejkSEOaeIWJC1FGE7BiKPpJdkNHzxVEC/xETdD0xswgofepM7xHkczSPXZVZ7I2stwLpEC0csRk41hqCO4u+pljWZgTLIT4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789856773; c=relaxed/simple;
	bh=PSDY18h/6p+CpldzH/+fu1Qf7z5F2c1RbgyeoKGE7hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FLKAjF9fkw9+cvPfNgAUIjTNf15slLfNjKtjNBkC9EFs60U/h95LLdyWvcxQZfd154yqD8V1CjR30LzIWYqlQYfMX/xI0JPZrhNdI+1zikagQxFsWXnSXEalb2wKYq5q4cqyN/f/XzNq87p8k6uLTWddAZLfP7m5bwtfLPRTNL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUhW9R1w; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUhW9R1w"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d8fbef5018so23883905ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789856770; x=1790461570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BOERddP/3wsRFSEkEbdiAeBbjAi0Tbkk2N3MtM1M3to=;
        b=jUhW9R1wMzkloWzLT6PALwxO57a9u3Sy8fmqyR/bnwxeAv/In0ig+tDlJ4EypnkkAQ
         ZHc4KofxuJBQWHunqjrn/DTeysh1cKzjPy8QQY0UKWbs5L0K0Ayv39rvSiilT4fBOUVg
         zj8oZzWpOaVjW5SiRaTax4i6imWJUwVu7W/wRidSteyH1xNLTkRSO1zcNjNyYkq2JnqP
         zstsGZhnea5zaELlrVH6+0gaQvddRWQBZNjwktlqT5SND3O91k3Tg9VGb1x8T+Ibfzwg
         Zo9BWdhI+N5ClJHcF79EYVZDTt5jXRkseqyPM+uE+XrRqfKmJZXFCZ91ZM1WKuFy79/o
         rqlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789856770; x=1790461570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BOERddP/3wsRFSEkEbdiAeBbjAi0Tbkk2N3MtM1M3to=;
        b=gZxWiET92WeO9wrT9tfvZ0n69tLMB7Eum7vHgc/0RsRUdnNQ6i9LX3PkKaC5zrlUN0
         l+kwJSdZRirZFJWE3wZPw/WSANITZ4l5qJAGEUBwvClIqv04UqPgsqpVxKiq3gVoA9K6
         hZXmuud+fcuRnuWW5INj7SG7TpmjDQJ0HzfVsPb22o1F5kIp3ea/Egy1ZTgqqJw3x2PH
         8zpu6d2OL64tDZgXi335LcQTYOucI6Ju1cJRzUlJud0laCI5Px9r8aw7+gzOCkN9JA8Z
         8RtkqoZ85TwWzJOsgyJEV+OP4bUtBwprNXel8RKl1G1oG0g10UgCt6P7XMdouZtrrrMP
         tRzw==
X-Forwarded-Encrypted: i=1; AKwUvBzW9ijW06zUkp1cqHVHibFhUMNieL9DgERoPn2oHFMKljiN3I1/0RUIcP2xkDfEGS84+VdtLQDaaDRPwcw=@vger.kernel.org
X-Gm-Message-State: AFuF++lv8UT/q6wImoyG8KmMC0shREwHDB+0q3C3gO9GGi+AfSdHn+TR
	4eQNvYlzzW7FDExKLJlnbrleIG4QO/b6xsf6ARu57m3pghFty0I/IYq0KPlYYsEV
X-Gm-Gg: AYBFou10W2TsBDcZypPGQtVNOaHLe96UI5Q3dkZyvQlaeitt73aV3lUtStmmvY477DX
	IiGFL61QAxQXD+0blpn1PWrw+j98i9Py4qiBktdROBJ7qx3zDqRmATsvDZveBExbqQNEQwvfYDb
	Ms3VZoGEZ563Jl7GBuAC2bxzuoxIMlquYY+zuycE8EXfvPg3yrflNLiiBIpzU1ucgpPRhgWu6iq
	1rLQeZdRR6HvqsFM70FzRPpO2u0dz10uJr4GZunN8+Z7iV8jmJYZOTLZQnxn1aGY8SkMIdMrk37
	XDEGsQ4OmfQB+gy1Li2ZgspgCF8h4YyB25sQ4N8MO4IDgBS1pRTdenVj4n78GYZro2XHl+pgI9A
	KAr9aOfGguYrIPQjIGCfB7hmMgysdIM5YsYRWttLEMs7xQwwwq3kEpWhzu/kFkvqr7HPHFk2PDj
	pV5Ym+dvAYIHmE8qxGybYbGeGdLOPX9noIMy4lvWnLIstmOEb0qLQejdqMisuurHOHEm49FG8ND
	3/9U03rwmhBqOzbPGHKN/L2JtC1wjVOIqLd6umgwqD6pTH5fstI9TJBVg01kZJvBszz3xRmaWNj
	twMGwnkG/w==
X-Received: by 2002:a17:902:eccf:b0:2db:210f:c111 with SMTP id d9443c01a7336-2ddb1ab4ef6mr116979405ad.2.1789856769848;
        Sat, 19 Sep 2026 15:26:09 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df3c43bed6sm2186635ad.1.2026.09.19.15.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:26:09 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: mikulas@artax.karlin.mff.cuni.cz,
	brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hpfs: fix extended attribute bounds checks and get_indirect_ea() overflow
Date: Sat, 19 Sep 2026 22:26:08 +0000
Message-ID: <20260919222608.3795070-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix extended attribute parsing bugs in fs/hpfs/ea.c and fs/hpfs/map.c:

1. In get_indirect_ea(), reject negative or wrapping size values (such
   as size == 0xffffffff where size + 1 wraps to 0 and kmalloc(0)
   returns ZERO_SIZE_PTR).
2. In hpfs_ea_ext_remove(), hpfs_get_ea(), and hpfs_map_fnode(),
   validate EA entry sizes (`ea->namelen` and `ea_size(ea)`) against the
   buffer end and ensure `ea_size(ea) > 0` so malformed extended
   attributes cannot cause out-of-bounds reads or infinite loops.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/fs/hpfs/ea.c b/fs/hpfs/ea.c
index 4664f9ab06ee..a3b3e6c7800e 100644
--- a/fs/hpfs/ea.c
+++ b/fs/hpfs/ea.c
@@ -51,6 +51,10 @@ void hpfs_ea_ext_remove(struct super_block *s, secno a, int ano, unsigned len)
 static char *get_indirect_ea(struct super_block *s, int ano, secno a, int size)
 {
 	char *ret;
+	if (size < 0 || size > 0xffff) {
+		hpfs_error(s, "bad indirect EA size %d", size);
+		return NULL;
+	}
 	if (!(ret = kmalloc(size + 1, GFP_NOFS))) {
 		pr_err("out of memory for EA\n");
 		return NULL;
@@ -135,10 +139,22 @@ char *hpfs_get_ea(struct super_block *s, struct fnode *fnode, char *key, int *si
 	secno a;
 	struct extended_attribute *ea;
 	struct extended_attribute *ea_end = fnode_end_ea(fnode);
-	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea))
+	if (le16_to_cpu(fnode->ea_size_s) &&
+	    (le16_to_cpu(fnode->ea_offs) < 0xc4 ||
+	     le16_to_cpu(fnode->ea_offs) + le16_to_cpu(fnode->acl_size_s) +
+	     le16_to_cpu(fnode->ea_size_s) > 0x200))
+		return NULL;
+	for (ea = fnode_ea(fnode); ea < ea_end; ea = next_ea(ea)) {
+		if ((char *)ea + 5 > (char *)ea_end ||
+		    next_ea(ea) > ea_end ||
+		    ea->name[ea->namelen] != 0)
+			return NULL;
 		if (!strcmp(ea->name, key)) {
-			if (ea_indirect(ea))
+			if (ea_indirect(ea)) {
+				if (ea_valuelen(ea) < 8)
+					return NULL;
 				return get_indirect_ea(s, ea_in_anode(ea), ea_sec(ea), *size = ea_len(ea));
+			}
 			if (!(ret = kmalloc((*size = ea_valuelen(ea)) + 1, GFP_NOFS))) {
 				pr_err("out of memory for EA\n");
 				return NULL;
@@ -147,6 +163,7 @@ char *hpfs_get_ea(struct super_block *s, struct fnode *fnode, char *key, int *si
 			ret[ea_valuelen(ea)] = 0;
 			return ret;
 		}
+	}
 	a = le32_to_cpu(fnode->ea_secno);
 	len = le32_to_cpu(fnode->ea_size_l);
 	ano = fnode_in_anode(fnode);
@@ -162,6 +179,7 @@ char *hpfs_get_ea(struct super_block *s, struct fnode *fnode, char *key, int *si
 		if (hpfs_ea_read(s, a, ano, pos, 4, ex)) return NULL;
 		if (hpfs_ea_read(s, a, ano, pos + 4, ea->namelen + 1 + (ea_indirect(ea) ? 8 : 0), ex + 4))
 			return NULL;
+		ea->name[ea->namelen] = 0;
 		if (!strcmp(ea->name, key)) {
 			if (ea_indirect(ea))
 				return get_indirect_ea(s, ea_in_anode(ea), ea_sec(ea), *size = ea_len(ea));
diff --git a/fs/hpfs/map.c b/fs/hpfs/map.c
index be73233502f8..b2c571e71a60 100644
--- a/fs/hpfs/map.c
+++ b/fs/hpfs/map.c
@@ -168,9 +168,9 @@ struct fnode *hpfs_map_fnode(struct super_block *s, ino_t ino, struct buffer_hea
 		return NULL;
 	}
 	if ((fnode = hpfs_map_sector(s, ino, bhp, FNODE_RD_AHEAD))) {
+		struct extended_attribute *ea;
+		struct extended_attribute *ea_end;
 		if (hpfs_sb(s)->sb_chk) {
-			struct extended_attribute *ea;
-			struct extended_attribute *ea_end;
 			if (le32_to_cpu(fnode->magic) != FNODE_MAGIC) {
 				hpfs_error(s, "bad magic on fnode %08lx",
 					(unsigned long)ino);
@@ -192,24 +192,31 @@ struct fnode *hpfs_map_fnode(struct super_block *s, ino_t ino, struct buffer_hea
 					goto bail;
 				}
 			}
-			if (le16_to_cpu(fnode->ea_size_s) && (le16_to_cpu(fnode->ea_offs) < 0xc4 ||
-			   le16_to_cpu(fnode->ea_offs) + le16_to_cpu(fnode->acl_size_s) + le16_to_cpu(fnode->ea_size_s) > 0x200)) {
-				hpfs_error(s,
-					"bad EA info in fnode %08lx: ea_offs == %04x ea_size_s == %04x",
-					(unsigned long)ino,
-					le16_to_cpu(fnode->ea_offs), le16_to_cpu(fnode->ea_size_s));
+		}
+		if (le16_to_cpu(fnode->ea_size_s) &&
+		    (le16_to_cpu(fnode->ea_offs) < 0xc4 ||
+		     le16_to_cpu(fnode->ea_offs) +
+		     le16_to_cpu(fnode->acl_size_s) +
+		     le16_to_cpu(fnode->ea_size_s) > 0x200)) {
+			hpfs_error(s,
+				"bad EA info in fnode %08lx: ea_offs == %04x ea_size_s == %04x",
+				(unsigned long)ino,
+				le16_to_cpu(fnode->ea_offs),
+				le16_to_cpu(fnode->ea_size_s));
+			goto bail;
+		}
+		ea = fnode_ea(fnode);
+		ea_end = fnode_end_ea(fnode);
+		while (ea != ea_end) {
+			if ((char *)ea + 5 > (char *)ea_end ||
+			    next_ea(ea) > ea_end ||
+			    ea->name[ea->namelen] != 0 ||
+			    (ea_indirect(ea) && ea_valuelen(ea) != 8)) {
+				hpfs_error(s, "bad EA in fnode %08lx",
+					(unsigned long)ino);
 				goto bail;
 			}
-			ea = fnode_ea(fnode);
-			ea_end = fnode_end_ea(fnode);
-			while (ea != ea_end) {
-				if (ea > ea_end) {
-					hpfs_error(s, "bad EA in fnode %08lx",
-						(unsigned long)ino);
-					goto bail;
-				}
-				ea = next_ea(ea);
-			}
+			ea = next_ea(ea);
 		}
 	}
 	return fnode;
