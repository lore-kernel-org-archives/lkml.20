Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46738134CCF
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791159600; cv=none; b=XwF0x0zb5OhvfDm2bMVy9uI8RnEx9lzWm/2sHLrPvZHp3c2xTBYgJq5LtRmD4f8QPYmLNI8JHTRkPd1okCn9HwleMxoZc0qBAgMuZAQUm8t7BfJmMqkT5sImOUZ9JTRVQHovCdIBV7Z9mAWstfO+ZGzirNe2UFs3BbxyrP5zPms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791159600; c=relaxed/simple;
	bh=/vqS67ZBm4z3Lyj7DyKHKo+hGK6JBe8Hby7kpXQmvhI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hBdt+BjnBy0BXnuEauve3cYZFZyoHplZI8zyE0fx8MwlY0nkZMfXif/ZgVpQmER+1cDrV0HyXMYoALoH+WpJvTo4ACwERN81bBDOxeG2QbczYbfNOp8rS2t7VkYYfn1HccisKkIYzR0ewlq8m3pj1ot9E/pI7aX4oTlcd64rjsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ScXUzp5F; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ScXUzp5F"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78dd412cfso367473a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791159598; x=1791764398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eyhjDtsive9z9y/5PUzMcRP2YBEJQnRy/rcYJL07i/E=;
        b=ScXUzp5F/JAa9hHKYvOJGaC9R+D66EwOMZI/PpeMWP0f9KkoXEZ2LxveIai3lco+Bf
         HWDq3n52NykVUAxaZRbSpr/NiozY/9W50IOoI19ibm4Iee3hIi52EswRNeSdOaS+nnar
         pUlvrlYIQR8ZdN7zWU4Iq4jPur+mxNDYdBvTO5CBPw7Gj6GOQsT8JNYkySZgzNDcErsS
         yP6eH2qL8XnkiJDVR0WaXWVSS0YchgZrAcCc/DWNLSmGDN01jP2eY3+O1J/N0EY/zXxi
         0u3PAjTycDN+ZeC93wgH5DjGfyKc3mEDyzmDTPAvrfJB1Iq5hEbOXjVnMNV5gj1kgzS+
         XRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791159598; x=1791764398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eyhjDtsive9z9y/5PUzMcRP2YBEJQnRy/rcYJL07i/E=;
        b=MpvyAPylQIjJiZoodV1T83GzQlboEMc0qQn7MkpT7G7B4Fo9b1gvmXFx+tMBStvS4l
         CVPRH7Ob5ZPcCfVB65EXYV8zejIW+D+sb4raWqt77S8JC4DkxwDNqhu7R5Frl627aLeN
         IqIgJngysuHewC9uV8rBu69KYPw23GgVV1AvchfYHvXb5kdamAYysFewFDxhHu+aLaU5
         aBVKNTQNwB18ISFMVvpACkPVVUpzlIei5DJGicOKb2HekD/X8VPRtzHfrjOoRxLyMKPd
         eTmnWp6+wur59ZYC6vc3mKEXP3yiK79vzJC9DZj6yP60hW/f1p0DqjFOaMyyKXCpBuyf
         MlKw==
X-Forwarded-Encrypted: i=1; AKwUvBzez6NZ+L2BNYWtIlM9bPqd64yo0FlhWe7uqEhCvcRHwBih1cPn4Oq42YJnIY9fKDvM/n/m5Z8O4vwL9TQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJRiljlYbZ/HuFJGi9xwDOmS96ozVduOYieVQg1YKZ5Nfw5rbo+
	KhheEEWy1SKn4anRm6l7Hd3TaMgbmn02IH8jXDv+XJu+VGIcNagsVsyD
X-Gm-Gg: AYBFou10ikRCDM40+FQIYDyaF2s3oBFuVVoKkkmgYEGEfhJvCsZKRX3/EEZ7k0w2Wkg
	gcpdnxpq513BAxp2PEh/CzbXqCSsI31GcK0u+ptW01xt/tB47UkVQdxZXMrEcZ/yjvt0qEULQTr
	xFUh/Q3spov6LDI1wVm9mxfj3U3/T85nBdScuUvCOuA28CVkAl+UuDx+BAuMEA3Dv4ibRUhKoWW
	I8e8v7tVJbuJxaXvPpbBlVUMjB45Y2Y0bHo+JwUu4XQfWtWzI4soLFcJbitFMNmFpLI+EuhrYy5
	6f8CGBZ/lS7+LjsKhHKcQkdUFyeDnZXYgvR+S5BDtsXoXlhxIGSWRB4gSCwh3OhlLvyCYNJBqNL
	C0/mPmsySvkzvg9C9Xzuz/jaE8FNk4sKO5paKz58JWHWJK50aRfGL1lCj2nAIVAdWZV+cO/vLN3
	7OZDeW5A2l3/UU85Q3UrsrnSDedUmJG7ajV6m2mRRD7Z4EXtRJR9rNuuWsXUnvYsfhN86+tFLiz
	tsiX4xc+acIceXrXuXI4sGbYSIKQqn/2OnOF/O3XRyVnOaLK1HPy+vXNqQeDXaCPJ5ZmbikGfFl
	Wh1BF5BL44FXCx3djKhSAhBgg0TlVYy6YYWCX82qmUyXmh66
X-Received: by 2002:a17:902:da8d:b0:2e5:3972:7ba8 with SMTP id d9443c01a7336-2e539727cb8mr45845925ad.57.1791159598333;
        Sun, 04 Oct 2026 17:19:58 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a7ae260f19sm3589351a91.4.2026.10.04.17.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 17:19:57 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: ceph-devel@vger.kernel.org
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Alex Markuze <amarkuze@redhat.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCH] ceph: use a flexible array for monitor addresses
Date: Sun,  4 Oct 2026 17:19:55 -0700
Message-ID: <20261005001955.589395-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ceph_alloc_options() allocates the monitor address array separately,
always sized for CEPH_MAX_MON entries. Make it a flexible array member
at the end of struct ceph_options and allocate both together with
kzalloc_flex(). The array was already an 8 KiB slab object, so this
only drops the separate allocation and its error path.

num_mon is the number of addresses in use, not the capacity, so the
array cannot be annotated with __counted_by().

ceph_compare_options() memcmp()s the simple fields up to the first
member that needs a custom comparison. With mon_addr gone from there,
use num_mon as that boundary; the compared fields are unchanged.
Document that num_mon has to stay first past that point.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 include/linux/ceph/libceph.h |  7 ++++---
 net/ceph/ceph_common.c       | 11 ++---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/include/linux/ceph/libceph.h b/include/linux/ceph/libceph.h
index f92fdd853f1f..e585d6d11303 100644
--- a/include/linux/ceph/libceph.h
+++ b/include/linux/ceph/libceph.h
@@ -57,15 +57,16 @@ struct ceph_options {
 	/*
 	 * any type that can't be simply compared or doesn't need
 	 * to be compared should go beyond this point,
-	 * ceph_compare_options() should be updated accordingly
+	 * ceph_compare_options() should be updated accordingly.
+	 * num_mon must stay the first member past this point, as
+	 * ceph_compare_options() uses it as the end of the memcmp().
 	 */
 
-	struct ceph_entity_addr *mon_addr; /* should be the first
-					      pointer type of args */
 	int num_mon;
 	char *name;
 	struct ceph_crypto_key *key;
 	struct rb_root crush_locs;
+	struct ceph_entity_addr mon_addr[];
 };
 
 /*
diff --git a/net/ceph/ceph_common.c b/net/ceph/ceph_common.c
index a797c7360e3c..95dc18257056 100644
--- a/net/ceph/ceph_common.c
+++ b/net/ceph/ceph_common.c
@@ -133,7 +133,7 @@ int ceph_compare_options(struct ceph_options *new_opt,
 {
 	struct ceph_options *opt1 = new_opt;
 	struct ceph_options *opt2 = client->options;
-	int ofs = offsetof(struct ceph_options, mon_addr);
+	int ofs = offsetof(struct ceph_options, num_mon);
 	int i;
 	int ret;
 
@@ -309,17 +309,11 @@ struct ceph_options *ceph_alloc_options(void)
 {
 	struct ceph_options *opt;
 
-	opt = kzalloc_obj(*opt);
+	opt = kzalloc_flex(*opt, mon_addr, CEPH_MAX_MON);
 	if (!opt)
 		return NULL;
 
 	opt->crush_locs = RB_ROOT;
-	opt->mon_addr = kzalloc_objs(*opt->mon_addr, CEPH_MAX_MON);
-	if (!opt->mon_addr) {
-		kfree(opt);
-		return NULL;
-	}
-
 	opt->flags = CEPH_OPT_DEFAULT;
 	opt->osd_keepalive_timeout = CEPH_OSD_KEEPALIVE_DEFAULT;
 	opt->mount_timeout = CEPH_MOUNT_TIMEOUT_DEFAULT;
@@ -344,7 +338,6 @@ void ceph_destroy_options(struct ceph_options *opt)
 		ceph_crypto_key_destroy(opt->key);
 		kfree(opt->key);
 	}
-	kfree(opt->mon_addr);
 	kfree(opt);
 }
 EXPORT_SYMBOL(ceph_destroy_options);
-- 
2.56.0

