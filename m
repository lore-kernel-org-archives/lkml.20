Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3A35650F4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 22:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791931237; cv=none; b=XHzVUEACN0J85cU6eKdn9w2tqpWLWmru5+YGcm+VjYsXng4p+Dv4kMwveWDtT06+3fzHnPFnYYQ4ngMcpmDS3QZpUv8jgAzm5TbMOdA7HVnLp4Iz+RaCNcaYPwfPKkcrv4zdxpPafIn2QNwCKdFoxOxqP6adjbSDrCEmlr/Ic4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791931237; c=relaxed/simple;
	bh=GRIZQKuwWcuCjR8A0ylF/V4G5/ojiWDtGgUJc8zlstU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bz2gVCOpQljyQx6hinHIr4hNSwZIgQxqP25Tzq8YUD7dtVGixd9pOJ/MCZhRasX5Qp2OwaszyRJ151vcLzWFdxbRsN4TwvxyUDkvxIv4WTMXlNHDZml4Eaxzb91JmNi4200dTzVBna2zvYHSY0SkkdtCGiRYQZGbpDVOKMv0IzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LLZQC176; arc=none smtp.client-ip=74.125.82.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LLZQC176"
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso5245473eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791931229; x=1792536029; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zqg4bcg4yTM1CSL1NV7gzxaOXxYgsDcagY96onRKZWw=;
        b=LLZQC176s1Ef4mQ4adKARyI+43Apa3IxBXu3faIYCpG3v5a7cb+aXuooqfsbCbJX+7
         FWrx9GIDZKUvDKWwTPQe4trZi2UuTun1mZfq/UMv3d30Y3x1s291xy+7ChZGIBh5Hj2W
         OoxuPfzruTuIBTQOGze/ucRooh3UPIug+xd0A74hTwR0zRBf39QASLFJQ1OA/bgn01yv
         TS9pq5kiLNp+aPVN6sDZTHL+mw0lDMrhTF2ImzmICSlXxxAhyI2ex0zNcV68cYqQQsOC
         QVvnCVsGGupaXn01437NlFicAb+gwNW3AsLb3YyCwvsgFJFll+OSob0L+3KGmvWhJ7mX
         zt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791931229; x=1792536029;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqg4bcg4yTM1CSL1NV7gzxaOXxYgsDcagY96onRKZWw=;
        b=qS/6ro2zGdcnZnPDKe6opsl8UFGFJ0TXxeg2DdcT7bR8uTrKaSzxrFCLIASd9BUWI4
         C8NHuqnSp7eK1OsuoUI1wFp6CBc2iThJwGInyo+iO3MgGJBOnBBNOc9iF8IGK8JOtMij
         WQMwx2eTFqP7Ec8C/DkV5yDSFxI15E0+XVwh2lKbV/vOkBCcLTST08NWqJDcoBRas3Ui
         yV3UpkXnwNIrgbGSRr62Y6O0bJcSPWUZ4TOYHDLyeD2pBl67gfW5r7e3WARn+ebwQPFT
         XsjccEWLy7soKhubKlorrO5jVcZ+xPFWzv2blU5ePX5EGMbKLOoVemSDqzjoVM1TbRoP
         hH7A==
X-Forwarded-Encrypted: i=1; AKwUvBxyaezWoT+xinI6lefxHQW7J1oYXBdjaEXhdrJISyVF2WH9vFVlByRR3fP0lyhun0rC+Kk2ILgBbKh9klg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL0TlIlZV2nOp3P1KdLgWi0zNs/OGgbb+sNaH/ui13wma3qopfB
	+ett7fLSUim26n7z3fYIJk7dAWmsgv70aI9gXym+2Evf68dFKLyWPioMfZ/slmtU2KSD4C+E9G4
	MUC20I/idwQ==
X-Received: from dldyq19-n1.prod.google.com ([2002:a05:701b:4553:10b0:164:47f8:a96a])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:4286:10b0:144:c128:4c4b
 with SMTP id a92af1059eb24-16a5e49c474mr18578865c88.36.1791931226644; Tue, 13
 Oct 2026 15:40:26 -0700 (PDT)
Date: Tue, 13 Oct 2026 15:39:41 -0700
In-Reply-To: <20261013223946.1836757-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261013223946.1836757-1-irogers@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261013223946.1836757-7-irogers@google.com>
Subject: [PATCH 06/11] dlm: Free dlm_ls in kobject release callback
From: Ian Rogers <irogers@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	David Teigland <teigland@redhat.com>, Alexander Aring <aahringo@redhat.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>, 
	Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org, 
	linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-acpi@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-s390@vger.kernel.org, 
	linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

struct dlm_ls embeds a struct kobject (ls_kobj), but dlm_ktype lacked a
.release callback and dlm freed the lockspace structure directly via
kfree(ls). With CONFIG_DEBUG_KOBJECT_RELEASE=y, freeing ls before the
kobject release runs causes a use-after-free.

Add dlm_ls_release() to free struct dlm_ls when the last reference to
ls_kobj is dropped, use kobject_del() in release_lockspace(), and drop
the final kobject reference in free_lockspace().

Fixes: 3514faca19a6 ("kobject: remove struct kobj_type from struct kset")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Ian Rogers <irogers@google.com>
---
 fs/dlm/lockspace.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a9c98b4f378f..1d226b27d8e6 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -179,7 +179,15 @@ static const struct sysfs_ops dlm_attr_ops = {
 	.store = dlm_attr_store,
 };
 
+static void dlm_ls_release(struct kobject *kobj)
+{
+	struct dlm_ls *ls = container_of(kobj, struct dlm_ls, ls_kobj);
+
+	kfree(ls);
+}
+
 static struct kobj_type dlm_ktype = {
+	.release        = dlm_ls_release,
 	.default_groups = dlm_groups,
 	.sysfs_ops     = &dlm_attr_ops,
 };
@@ -355,7 +363,7 @@ static void free_lockspace(struct work_struct *work)
 	 */
 	rhashtable_free_and_destroy(&ls->ls_rsbtbl, rhash_free_rsb, NULL);
 
-	kfree(ls);
+	kobject_put(&ls->ls_kobj);
 }
 
 static int new_lockspace(const char *name, const char *cluster,
@@ -436,6 +444,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	atomic_set(&ls->ls_count, 0);
 	init_waitqueue_head(&ls->ls_count_wait);
 	ls->ls_flags = 0;
+	ls->ls_kobj.kset = dlm_kset;
+	kobject_init(&ls->ls_kobj, &dlm_ktype);
 
 	if (ops && dlm_config.ci_recover_callbacks) {
 		ls->ls_ops = ops;
@@ -567,9 +577,7 @@ static int new_lockspace(const char *name, const char *cluster,
 	wait_event(ls->ls_recover_lock_wait,
 		   test_bit(LSFL_RECOVER_LOCK, &ls->ls_flags));
 
-	ls->ls_kobj.kset = dlm_kset;
-	error = kobject_init_and_add(&ls->ls_kobj, &dlm_ktype, NULL,
-				     "%s", ls->ls_name);
+	error = kobject_add(&ls->ls_kobj, NULL, "%s", ls->ls_name);
 	if (error)
 		goto out_recoverd;
 	kobject_uevent(&ls->ls_kobj, KOBJ_ADD);
@@ -615,7 +623,6 @@ static int new_lockspace(const char *name, const char *cluster,
 	rhashtable_destroy(&ls->ls_rsbtbl);
  out_lsfree:
 	kobject_put(&ls->ls_kobj);
-	kfree(ls);
  out:
 	module_put(THIS_MODULE);
 	return error;
@@ -759,7 +766,7 @@ static int release_lockspace(struct dlm_ls *ls, unsigned int release_option)
 
 	dlm_delete_debug_file(ls);
 
-	kobject_put(&ls->ls_kobj);
+	kobject_del(&ls->ls_kobj);
 
 	xa_destroy(&ls->ls_recover_xa);
 	kfree(ls->ls_recover_buf);
-- 
2.56.0.385.gd3acb90ef8-goog

