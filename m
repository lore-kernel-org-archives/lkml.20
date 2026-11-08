Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177592;
	b=WjzRWppnfW4mBWBpYu/3HZV/icRzIkvL4VkZRNk6mOyQKvl3uWGQtUFCEPUC00DXj8x1
	 am0KxEEebqiAL/exgKZ4gV9QWAOM/t1isjR1xBwTtYOKIP8tp3LzYpq24zQt6yL8sS5Tk
	 mhyVrox2PeJ18dTAELfx4S4ZeVPLyb0GcDo0J2nnHxE63f8TiYNO3PSrcMYsJ5wP1k+cV
	 j+BV2uhMRM92fBSSCAdhJ6q3tj9By57/u2Map8mN/g7VrSMAtWym37QsYedJNPRWERYa1
	 DoZ8uI0/AU2XRHaUJC2mB08+m3nzlk0JZBlay4LueGywVZkPdIXVuyATnxbcz3kcXCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=m1jLuLVTWvALNpXpZUUQEWDLYzqr+bz7MlMjOt9nJBI=;
	b=oO4AuEyKeY28xz70wlHJnTAGVo0wZPiJ4v2wo90f0rdGuMmBC6eav6qml/MN6kVhnbhz
	 ClkZwKmZ4Dt0l1rZe2v02TH1gV1qdJTzzc0bm8GfGyZZXUqP3Eum/8ZOru0rZq1J1uplz
	 dcwnu8FCAPtJwloMxprkNgWUY198pKPU3ATKn4AujnXD6Mi78bS6v7R8a0U4zA6J3zstA
	 1xtA0x5s1WjywbfuEQjNNhDPZEbrmn/BMZHTi/n7CMTuNaQjB4JttY53CrpL4McvYFCEn
	 xRmlkDb/Zhjqmls9of05j1VIsj+356lzJNJH6AooNj7IYymYFx1rG6l2VzqoQtMzZxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QTpEqm2m;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1631606EEB6
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1631606EEB6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QTpEqm2m
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso464101eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794177591; x=1794782391; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m1jLuLVTWvALNpXpZUUQEWDLYzqr+bz7MlMjOt9nJBI=;
        b=QTpEqm2mKR2cwNIGunOQXFX3iTOSw7HgjLW7M7pgOo0MwQwnBu5Vg724wVHWZ2PKRX
         KCo/bkFyceEZ04qIezmFdvexz51dq7OenhiDszTBvLZxR647hn4frrBB5Wfu0oC5IIdW
         HpqimFQAGvhz42pBsnFhJXYLxwL6uXINCbF6xKcQthJF3ClHIK4+wt/9aHcGcgovFvp2
         MqQXar4RqpPPDhL3n8td4WyJ3x9k5NIK0VQ8jOWuKAbwnGamEdAguHhTMVo4dVU/R+8T
         YAMFt3F8VCnX7OcyXDAZek+r+Q/B/CxU2uAVYfT7H+1h1EudU+o1ZnYTyHb7n81YhqzP
         Bjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177591; x=1794782391;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m1jLuLVTWvALNpXpZUUQEWDLYzqr+bz7MlMjOt9nJBI=;
        b=OrzavxAkbWhsBdIuQhGUlgmcASBtYTdtYS1Hck04m6ymxBvYdxBFbYvaPADlmopKR8
         W4PoGPJueDE3wXGkFv2mJqDa14R3wxbxZkZWWnA5iWacE0Aw6/v/1a7m2Nr2FE2LtWXs
         ihqgLWfhm/Mv0aV12CjLLF/n4WU9zYvvaRoI/sxWBvFjZJvJ89wEPxP8H+iNQQqvVqu2
         NzlmU5Z5hRMZiKDIXmGXjKkFhbTCVSGcWqSTmsbjRa88TCecc7ZVZMyY24xa2d8MjH11
         yVir8UkOEA7LEaZLJY9/+ADpwajANLminbs+YvWmfoKEFjO45jPedLKDAHI48uiAkTJA
         D5kQ==
X-Forwarded-Encrypted: i=1; AL+hErFq6WLAxEY+7SaKomPHY34Jc1cMzqXlgUqdARnn3xPw7/Q1ZI/SvqqGWlF07W7LUcKDrvRNWJ9/GUmgEJc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/SaRvKu1dT8hUKfNOzjH/H+fjBHZd2cAZVolsj7HNm97a2EGDO
	WGyWiKkxte7nCh6dvuaBBaJNfhZj00twUqUMVTRHv4Bkbs9hitCqbjm8DJ9SR51Gk4/Gwd3WMRN
	UEtceOqN8Rw==
X-Received: from dycmv11.prod.google.com ([2002:a05:693c:280b:b0:36b:c499:531f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2806:b0:36b:f09f:924a
 with SMTP id 5a478bee46e88-37256bef587mr4546874eec.14.1794177590507; Sun, 08
 Nov 2026 14:39:50 -0800 (PST)
Date: Sun,  8 Nov 2026 14:39:09 -0800
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261108223913.3624571-6-irogers@google.com>
Subject: [PATCH v3 5/9] dlm: Free dlm_ls in kobject release callback
From: Ian Rogers <irogers@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Srish Srinivasan <ssrish@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, Alexander Aring <aahringo@redhat.com>, 
	Felix Kuehling <felix.kuehling@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
.release callback and dlm freed the lockspace structure directly via
kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=y, freeing ls before the
delayed kobject release runs causes a use-after-free, and unloading the
module while the delayed release is pending results in an instruction
page fault.

Add a completion ls_kobj_done and dlm_ls_release() to complete it when
the last kobject reference is dropped, waiting for it in free_lockspace()
before kfree(ls) and in the new_lockspace() error path before module_put().
Also delete the kobject via kobject_del() before stopping dlm_recoverd
to close the window where concurrent sysfs writes could wake the stopped
recovery task.

Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
Acked-by: Alexander Aring <aahringo@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/dlm/dlm_internal.h |  1 +
 fs/dlm/lockspace.c    | 26 ++++++++++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/dlm_internal.h b/fs/dlm/dlm_internal.h
index 74c2e77d1b55..95b3bff0cb57 100644
--- a/fs/dlm/dlm_internal.h
+++ b/fs/dlm/dlm_internal.h
@@ -576,6 +576,7 @@ struct dlm_ls {
 	int			ls_create_count; /* create/release refcount */
 	unsigned long		ls_flags;	/* LSFL_ */
 	struct kobject		ls_kobj;
+	struct completion	ls_kobj_done;
 
 	struct xarray		ls_lkbxa;
 	rwlock_t		ls_lkbxa_lock;
diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a9c98b4f378f..2dccd080a10f 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -179,7 +179,15 @@ static const struct sysfs_ops dlm_attr_ops = {
 	.store = dlm_attr_store,
 };
 
+static void dlm_ls_release(struct kobject *kobj)
+{
+	struct dlm_ls *ls = container_of(kobj, struct dlm_ls, ls_kobj);
+
+	complete(&ls->ls_kobj_done);
+}
+
 static struct kobj_type dlm_ktype = {
+	.release        = dlm_ls_release,
 	.default_groups = dlm_groups,
 	.sysfs_ops     = &dlm_attr_ops,
 };
@@ -355,6 +363,8 @@ static void free_lockspace(struct work_struct *work)
 	 */
 	rhashtable_free_and_destroy(&ls->ls_rsbtbl, rhash_free_rsb, NULL);
 
+	kobject_put(&ls->ls_kobj);
+	wait_for_completion(&ls->ls_kobj_done);
 	kfree(ls);
 }
 
@@ -435,7 +445,10 @@ static int new_lockspace(const char *name, const char *cluster,
 	ls->ls_lvblen = lvblen;
 	atomic_set(&ls->ls_count, 0);
 	init_waitqueue_head(&ls->ls_count_wait);
+	init_completion(&ls->ls_kobj_done);
 	ls->ls_flags = 0;
+	ls->ls_kobj.kset = dlm_kset;
+	kobject_init(&ls->ls_kobj, &dlm_ktype);
 
 	if (ops && dlm_config.ci_recover_callbacks) {
 		ls->ls_ops = ops;
@@ -567,9 +580,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	wait_event(ls->ls_recover_lock_wait,
 		   test_bit(LSFL_RECOVER_LOCK, &ls->ls_flags));
 
-	ls->ls_kobj.kset = dlm_kset;
-	error = kobject_init_and_add(&ls->ls_kobj, &dlm_ktype, NULL,
-				     "%s", ls->ls_name);
+	error = kobject_add(&ls->ls_kobj, NULL, "%s", ls->ls_name);
 	if (error)
 		goto out_recoverd;
 	kobject_uevent(&ls->ls_kobj, KOBJ_ADD);
@@ -582,7 +593,7 @@ static int new_lockspace(const char *name, const char *cluster,
 
 	error = do_uevent(ls, 1, 0);
 	if (error < 0)
-		goto out_recoverd;
+		goto out_kobj;
 
 	/* wait until recovery is successful or failed */
 	wait_for_completion(&ls->ls_recovery_done);
@@ -600,6 +611,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	do_uevent(ls, 0, 0);
 	dlm_clear_members(ls);
 	kfree(ls->ls_node_array);
+ out_kobj:
+	kobject_del(&ls->ls_kobj);
  out_recoverd:
 	dlm_recoverd_stop(ls);
  out_callback:
@@ -615,6 +628,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	rhashtable_destroy(&ls->ls_rsbtbl);
  out_lsfree:
 	kobject_put(&ls->ls_kobj);
+	wait_for_completion(&ls->ls_kobj_done);
 	kfree(ls);
  out:
 	module_put(THIS_MODULE);
@@ -740,6 +754,8 @@ static int release_lockspace(struct dlm_ls *ls, unsigned int release_option)
 	    dlm_user_daemon_available())
 		do_uevent(ls, 0, (release_option == DLM_RELEASE_RECOVER));
 
+	kobject_del(&ls->ls_kobj);
+
 	dlm_recoverd_stop(ls);
 
 	/* clear the LSFL_RUNNING flag to fast up
@@ -759,8 +775,6 @@ static int release_lockspace(struct dlm_ls *ls, unsigned int release_option)
 
 	dlm_delete_debug_file(ls);
 
-	kobject_put(&ls->ls_kobj);
-
 	xa_destroy(&ls->ls_recover_xa);
 	kfree(ls->ls_recover_buf);
 
-- 
2.56.0.455.g6c5a503b38-goog

