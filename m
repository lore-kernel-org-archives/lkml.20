Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0CF326939
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 03:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790913529; cv=none; b=otK2vCIar7KhyLYu3LJ33g6NC+yyI3B6u8tvxnAWlPqS8Fl+PSlLDoZ9zaWkv+lVeiYIfY8a7AbusrcrwLo/3zO5S+Z1Uo7u8p96ZXmkRaZN5QfH2NngDW5hfms8JtwQWw7yTzS5dMkLsgJxLjB2TqKTuIF7+tAC82In+L/HZ4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790913529; c=relaxed/simple;
	bh=wMnyD5HW/0+oeOMABNSibQxEPNUGvv38NIwnLfvPREU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N/AvR1yN8OgT6fIeSQKNqz/BkaopYY0fN6l2OMvpv5f9hF8VRuhCiWEYafK9g80on6sNbHyHsJA2/pT4SCv+HjqVpFcYzRXUh32FpaH+/QuDPVIIXTPV7VwMVpTDXzTv/qHuw/w6Y7lZWgOWESViAyft7DqDejMCMXmxCmCctb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSn2eib0; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSn2eib0"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48afe625404so382774f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 20:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790913526; x=1791518326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vpDDKCvPSY4yYLTf3+YiBg6CMQROJc3t3myCmtwmjZQ=;
        b=LSn2eib0qtGgmZpJ4KdgS7VpfG/VVGNPNgx0Gf0x8QmjZUtN6vxfIsk863yLKXk8eF
         0N9tKcSQmzNLrMI7aTd2lTovYh9I//SHZ3+OpVpBk1QAiHkfB3IMKh2uPLO+2U50nFkf
         9Gr0UprDcWmrNADkolokmv5D727pZmTxciXnMUJpDt6EPKVbvrCBbKkedwJphK+/Gmle
         A9ybFe2AcMexdtvbUzlMtbhZqPjfJFI4t42FKIDzBDA/xxzCztLqDFe/IRVYuG1gBHYM
         QB2aR65qqBOCLiCN0dkBRZjIDt1AbShnXf/ewPQMKHCfgIG/1lZj0H9b4dNjKlKD5EL7
         yPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790913526; x=1791518326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vpDDKCvPSY4yYLTf3+YiBg6CMQROJc3t3myCmtwmjZQ=;
        b=otFu9vez+eLJUjqXahiqYzJOhQHCLRj8DtZxhBacIkHOyHxuGcJvUVh7q7wPr0Tjgv
         xRKHWfy6ODg7uvCFgtRYYVt7IoXwhkqXH1cfpK2VSSC2HBvAliTV0ngdkz6pKOesLidI
         sbxn5dod8bBiGu10Lc1gO9D1heCk6rQPYrMoXL7HI9W6g9Jv5tTkxy1jSTp1NVfmHD4m
         Ix+tBxxjW8AgEji2ayfws9YKNx/NckuRUoUDzirHE46nH4Ft/tfLAKd3RkWGBk6/KVkF
         fcYLIfEBRLbcSatJcCvWZk1xpYypaqxVT8sZ1uAiPR3uw2gBoMOCb32rcdNAOaz/MBPn
         FdPQ==
X-Forwarded-Encrypted: i=1; AKwUvBz8ZmZXlyWQx6We1v5iGKZcZu2jtVwjsUaB2/K4IiokL6uio4t8pcQaDbnPKJWv37RfLOtpuaLdRO572KM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+5LnFLHJ2KHpiTf7kTdE1u6BEt0SNn2Qcsqoj7J+faws1TPx0
	FGSan+mEPlugjw/sceBdFj/0+jxeCO1UPLmxRuh3IIt86Yztfsivc5gb19OIaA3/gnzDpzqT
X-Gm-Gg: AYBFou2PT8nJ+r3R6xQAeULno1NypNaNU7idiRceFp0/KxHIrQBv1PzG44gvXgIm7wF
	uCRbnMxMmanmFBK9kQnhEzx0ZKeMfAKvN9b81MvI3CVJQQMCSkz7gtViy5+iXNWEYCn8E4W347m
	O0ttnpAHVHzaKJGNo3F8mv76ZCmpYt4rDHuwnlyi70uPoKEdqcAXrVP0SVAM2IE83Yk80JJhL6v
	5ROGQXQW154HIPamsDwgA8h6L9peta4IS5CkRZw9SJ8sZaSepug00jvSH+v74bRwk1ihxC2AaNz
	NcIr2zqMRF3QsQh/li47+1ikCcVNysrQUBnFhaoxrR/6oPJPjQ+oDZ8QOvQLygPIyqqt1OwDn3W
	q0oerRJ3Fda4T7dEIGgOnHTeq0QrxtJQMGIf5U6UH3ZtH5gYqd/5nbmtD64e0xitlx40JH6bSI1
	pNI0iJoQbFPQ/FxHrWK0yqRvSWjTNX7s1RLgoKplWdxI2g0KZiZT/QKVLZoKYLFuVC1Ipn9ROpd
	JI29ndZAFgZwO/rAFijCg==
X-Received: by 2002:a05:6000:618:b0:48a:f41d:846 with SMTP id ffacd0b85a97d-48b12719b80mr2478947f8f.3.1790913525869;
        Thu, 01 Oct 2026 20:58:45 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm1998601f8f.1.2026.10.01.20.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 20:58:45 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: ericvh@gmail.com,
	aneesh.kumar@linux.vnet.ibm.com,
	jvrao@linux.vnet.ibm.com,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: ericvh@kernel.org,
	lucho@ionkov.net,
	asmadeus@codewreck.org,
	linux_oss@crudebyte.com,
	skhan@linuxfoundation.org,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH] 9p: fix kernel-doc warning for enum p9_session_flags
Date: Fri,  2 Oct 2026 04:58:37 +0100
Message-ID: <20261002035837.39703-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc cannot parse enum p9_session_flags, since its documentation
comment is followed by #define lines instead of the enum declaration:

  fs/9p/v9fs.h:31 : error: Cannot parse enum!

Move the three #define lines below the enum whose values they are
derived from, and give V9FS_ACCESS_ANY and V9FS_ACCESS_MASK their own
kernel-doc comments with the descriptions they had in the enum comment.

Also document the four enum members that had no description, using the
corresponding mount option wording from
Documentation/filesystems/9p.rst.

Fixes: 76381a42e4a5 ("fs/9p: Add access = client option to opt in acl evaluation.")
Assisted-by: LLM
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 fs/9p/v9fs.h | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/fs/9p/v9fs.h b/fs/9p/v9fs.h
index a462bcbfc7da..2f18e75f0ed0 100644
--- a/fs/9p/v9fs.h
+++ b/fs/9p/v9fs.h
@@ -21,20 +21,16 @@
  * @V9FS_ACCESS_SINGLE: only the mounting user can access the hierarchy
  * @V9FS_ACCESS_USER: a new attach will be issued for every user (default)
  * @V9FS_ACCESS_CLIENT: Just like user, but access check is performed on client.
- * @V9FS_ACCESS_ANY: use a single attach for all users
- * @V9FS_ACCESS_MASK: bit mask of different ACCESS options
  * @V9FS_POSIX_ACL: POSIX ACLs are enforced
+ * @V9FS_NO_XATTR: do not offer xattr functions on this mount
+ * @V9FS_IGNORE_QV: ignore qid.version==0 as a marker to ignore cache
+ * @V9FS_DIRECT_IO: bypass page cache on all read/write operations
+ * @V9FS_SYNC: flush writes synchronously to the server
  * @V9FS_NDENTRY_TIMEOUT_SET: Has negative dentry timeout retention time been
  *                            overridden by negtimeout mount option
  *
  * Session flags reflect options selected by users at mount time
  */
-#define	V9FS_ACCESS_ANY (V9FS_ACCESS_SINGLE | \
-			 V9FS_ACCESS_USER |   \
-			 V9FS_ACCESS_CLIENT)
-#define V9FS_ACCESS_MASK V9FS_ACCESS_ANY
-#define V9FS_ACL_MASK V9FS_POSIX_ACL
-
 enum p9_session_flags {
 	V9FS_PROTO_2000U         = 0x01,
 	V9FS_PROTO_2000L         = 0x02,
@@ -49,6 +45,20 @@ enum p9_session_flags {
 	V9FS_NDENTRY_TIMEOUT_SET = 0x400,
 };
 
+/**
+ * V9FS_ACCESS_ANY - use a single attach for all users
+ */
+#define	V9FS_ACCESS_ANY (V9FS_ACCESS_SINGLE | \
+			 V9FS_ACCESS_USER |   \
+			 V9FS_ACCESS_CLIENT)
+
+/**
+ * V9FS_ACCESS_MASK - bit mask of different ACCESS options
+ */
+#define V9FS_ACCESS_MASK V9FS_ACCESS_ANY
+
+#define V9FS_ACL_MASK V9FS_POSIX_ACL
+
 /**
  * enum p9_cache_shortcuts - human readable cache preferences
  * @CACHE_SC_NONE: disable all caches
-- 
2.43.0

