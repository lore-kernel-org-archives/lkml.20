Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140771;
	b=thvS4R39aP47dXORQIgVIQSKZvpS4VCsEbFLa4V6uigy4xR6RkckqkCekbi/Hr3XwsRy
	 9fxQQnQrjzSPuc2XLRxAkbmphS6l89S8FM7II4SVkt8p8sV2TjPrZUii93dcXgVRjG8Tn
	 51rxsqyiYidzjgky5rog15KVFD51gNRMXJT3dcifiDOCIgD5s4Dbj5L0q1wKVHO09b/pU
	 mMOxrjldkPYUkPO8MFVTzFbG8/LOGzhOWNgXJjAvKPX3PQR/UG0ORwHAbuZHymTehtLsC
	 EudKEhv2TdgjL1oVlFgTyFDzXmSTf831A1xcfxeo3YikP1GvfH86oAMdxDvvAwlWCjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=aItLXVgOXAbsJZn2OZIWl+3TQwb1N1Woum6UsPYCRPI=;
	b=WKq5swRNC9ljR+cUmTtWyZVi3/cmRBVnIaI4PyBDW7NH7MlFE1ntuonAGwkjqiPxBqtu
	 9ZKYLWgKhstP0YUDEKfhIfwciCFWOKrs/h0B8QtLACRfMk0o9NWR7M5de1YCCh+qbvipK
	 yuYHm6NWkmZOv9Tq6bRCeBn+NmRafgMOBKFkk+UHR8HThhvQ3ISbjhF0X9+1a8Ac79hAi
	 KvFBKVDDj7E02h3bLE7PWUAN0bJYLM7zte+dhUc+oFnhxc4P/oK239ApeRBc0khPFd80U
	 JHOSAlp1jPrOLm9bVALqN/CRWYAlknuf2Es/d4oQZJBVa/2gQg0wBH2T1eRyHLJ0qgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cqwNTjHA;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90B660A5BC9
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90B660A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cqwNTjHA
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a71dd190b0so299085c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793140770; x=1793745570; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aItLXVgOXAbsJZn2OZIWl+3TQwb1N1Woum6UsPYCRPI=;
        b=cqwNTjHAYXOy8Mi0KDVWON2iofqVJPaU9RstSleLyvA0ZnHHca9sgwMffgWuSP96Vq
         Kpgku/LZAhDRayOYk8QgB1Cz1AwlyVsDfvTjhOxiQE6MZPH70GmVtxnVpgC0CLWmUxK9
         IxTAqbdqAGbhhlKKZua67l8+9/SRZpDmPOIu25o5ZfY4arDHKBM3F+ILVqikbjfrGpZm
         5TcNRqJAXT0C8XFBzOxtasn4OfHvhdu19U4W5KHMuHF1ZKBxJJPSpLvE2u+ciYeZvDCh
         oo6FbSB5vK82QmvlGaMLVdVgDui47ubesXtV2QdmfdzgUkdxRwV6GI4rakX9wYnSs1Mf
         1abQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140770; x=1793745570;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aItLXVgOXAbsJZn2OZIWl+3TQwb1N1Woum6UsPYCRPI=;
        b=xZVcY0jaq0Pz0jlre8QPOTfGXChuG/BwIHGHV18038nVlQQ/9+fiUzlOf0DIrm2hLB
         Mwaok87Xd2a0R62deHHp6WAWr4pVJAZVzHAiiIb4cZ3v1Efh+qFVWt/JvNWgPk9l/1Ws
         zZkpMBv3U/bm2Jbq7Kec7YRm1dMH8GDJ6+jOsRfjq1IM/KRj9Bv97irv/pWQyUI/q5xd
         nVE3jedzbH0IjA/SrfdxtaEiM0Vli72kBSom2H7xtd7Kt4HZ3qRVMtixqsj+WCxYM7HZ
         V23KImeJoUydnUgt7DABQLz8tWuYSo7xau8KZHr/iHRLyZTVLVDupHjSEhIABkkNoUM2
         j4qQ==
X-Forwarded-Encrypted: i=1; AKwUvByIuglYfUdMCrD8mEd0qthRsMiNqxqxoGuDd4dcM5l/Ij8ak/CrfuEabsbxqGOt1xWfCViH2Msr3ug4rpQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKUdtbXhAsv6qvtOmgEk3m+/7H38THP85oRCV1e/xNebGByRDqH
	RGu9rvEU96O9iBiaDLLf8Krt68p0t4wO0b7DWcNtZ76iOz34eTDCZcZZQWUgHa/agoh+nZa4PiK
	TRtgnBfMp5A==
X-Received: from dld12.prod.google.com ([2002:a05:7022:30c:b0:191:45cb:f8d3])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:607:b0:166:af48:a2ba
 with SMTP id a92af1059eb24-1a6c2c71125mr1317138c88.0.1793140769446; Tue, 27
 Oct 2026 15:39:29 -0700 (PDT)
Date: Tue, 27 Oct 2026 15:38:42 -0700
In-Reply-To: <20261027223847.652884-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261027223847.652884-8-irogers@google.com>
Subject: [PATCH v2 7/9] ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
From: Ian Rogers <irogers@google.com>
To: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Sumanth Korikkar <sumanthk@linux.ibm.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Richard Weinberger <richard@nod.at>, Liu Shixin <liushixin2@huawei.com>
Content-Type: text/plain; charset="UTF-8"

ubifs_kset was a static struct kset using a custom ubifs_ktype that
had no default_groups and no .release callback. With
CONFIG_DEBUG_KOBJECT_RELEASE=y, unloading the ubifs module while delayed
kobject release is pending causes a use-after-free on the static kset.

Replace the static ubifs_kset and empty ubifs_ktype with a dynamically
allocated kset via kset_create_and_add().

Fixes: 203a55f04f66 ("ubifs: Fix memory leak in ubifs_sysfs_init()")
Tested-by: Zhihao Cheng <chengzhihao1@huawei.com>
Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/ubifs/sysfs.c | 24 +++++++-----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/fs/ubifs/sysfs.c b/fs/ubifs/sysfs.c
index dbf967dcf26e..e20931e3a62f 100644
--- a/fs/ubifs/sysfs.c
+++ b/fs/ubifs/sysfs.c
@@ -80,13 +80,7 @@ static const struct kobj_type ubifs_sb_ktype = {
 	.release	= ubifs_sb_release,
 };
 
-static const struct kobj_type ubifs_ktype = {
-	.sysfs_ops	= &ubifs_attr_ops,
-};
-
-static struct kset ubifs_kset = {
-	.kobj	= {.ktype = &ubifs_ktype},
-};
+static struct kset *ubifs_kset;
 
 int ubifs_sysfs_register(struct ubifs_info *c)
 {
@@ -107,7 +101,7 @@ int ubifs_sysfs_register(struct ubifs_info *c)
 		goto out_free;
 	}
 
-	c->kobj.kset = &ubifs_kset;
+	c->kobj.kset = ubifs_kset;
 	init_completion(&c->kobj_unregister);
 
 	ret = kobject_init_and_add(&c->kobj, &ubifs_sb_ktype, NULL,
@@ -139,18 +133,14 @@ void ubifs_sysfs_unregister(struct ubifs_info *c)
 
 int __init ubifs_sysfs_init(void)
 {
-	int ret;
+	ubifs_kset = kset_create_and_add("ubifs", NULL, fs_kobj);
+	if (!ubifs_kset)
+		return -ENOMEM;
 
-	kobject_set_name(&ubifs_kset.kobj, "ubifs");
-	ubifs_kset.kobj.parent = fs_kobj;
-	ret = kset_register(&ubifs_kset);
-	if (ret)
-		kset_put(&ubifs_kset);
-
-	return ret;
+	return 0;
 }
 
 void ubifs_sysfs_exit(void)
 {
-	kset_unregister(&ubifs_kset);
+	kset_unregister(ubifs_kset);
 }
-- 
2.56.0.313.g2479322e68-goog

