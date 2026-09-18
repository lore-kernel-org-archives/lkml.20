Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13734FF62
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695305; cv=none; b=O/2ZXHJDNz7HmVd6pUJS2NLhODvvNnnrIYPj/+oafmm0uRkx5mmTIqAChno51pi2CGmkkztBdNXoa/QVV3YK4Pf3DhbWBFR50WzE0ptz3EA1OPVnIvCqW+HFOjvjhs+V2nb0hIEyDuCTxF0OHbU84RDCvb77+0KuUb8B8pz3r6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695305; c=relaxed/simple;
	bh=M2ZinG0v5IlQpPy62KPAgLbDB1o3IJFDY9jQXBEHmNs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iMesBnnqR7W7OlcezZwdX+T1KRnulcK/zvTL3p/XcRyNrcNJ+WjqxMgekM5+QwdOQAgxx2vMbS5gv8xKNgXj197J35+T5MJjT2AuAZohA3fur7jQIjjbWV3u2Ae/fek60C8qwUpejC2hSo8cQxjpihZ1gvKlTW0Izav2VrKbhOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn; spf=pass smtp.mailfrom=mails.ucas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mails.ucas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mails.ucas.ac.cn
Received: from fric.. (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACneu43laxqbPxECA--.11692S2;
	Fri, 18 Sep 2026 09:34:47 +0800 (CST)
From: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
To: Petr Pavlu <petr.pavlu@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Subject: [PATCH] params: serialize lookup_or_create_module_kobject()
Date: Fri, 18 Sep 2026 01:34:45 +0000
Message-Id: <20260918013445.1849655-1-xujiakai24@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACneu43laxqbPxECA--.11692S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1xWryrXFW3Xr45ZrW3GFg_yoW7Kr1kpr
	WYqrZIk3y8XFs7Can7A3WkXa4fJa4vvrW7WFZakw1avF1Yyr1vvF17KrySyF1UCryvyayI
	gF1UArZ0krWUAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9F14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
	4UJVWxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG
	64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26F
	4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS
	5cI20VAGYxC7MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFV
	Cjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWl
	x4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r
	1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_
	JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcS
	sGvfC2KfnxnUUI43ZEXa7VU1nmRUUUUUU==
X-CM-SenderInfo: 50xmxthndljko6pdxz3voxutnvoduhdfq/

lookup_or_create_module_kobject() first looks up the module kobject with
kset_find_obj() and, if not found, creates a new one with
kobject_init_and_add().  The function is called at runtime from
module_add_driver() since commit f95bbfe18512 ("drivers: base: handle
module_kobject creation"), which means two concurrent driver
registrations for the same built-in module name can both miss the
lookup and race to create the same kobject.

The loser of the race gets -EEXIST from kobject_init_and_add() and its
kobject is removed from module_kset by kobject_add_internal() before
the failure is reported.  The error path then calls kobject_put(),
which invokes module_kobj_release(), but that only completes
->kobj_completion and never frees the dynamically allocated
module_kobject, leaking it (96 bytes) along with the object having been
detached from the kset.

This is triggerable by unprivileged users, e.g. by concurrently issuing
the RAW_IOCTL_INIT ioctl of the raw-gadget driver, which registers the
"raw_gadget" driver on the gadget bus:

  sysfs: cannot create duplicate filename '/module/raw_gadget'
  ...
  Adding module 'raw_gadget' to sysfs failed (-17), the system may be
  unstable.
  ...
  unreferenced object 0xffff8880188dacc0 (size 96):
    backtrace:
      lookup_or_create_module_kobject+0x47/0x100
      module_add_driver+0x73/0x1b0
      bus_add_driver+0x1d9/0x340
      driver_register+0xde/0x170

Fix it by serializing the lookup and the creation with a mutex, so that
the second caller finds the kobject created by the first one instead of
racing with it.

Fixes: f95bbfe18512 ("drivers: base: handle module_kobject creation")
Fixes: 7c76c813cfc4 ("kernel: globalize lookup_or_create_module_kobject()")
Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
---
 kernel/params.c | 29 ++++++++++++++++++++++++-----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/kernel/params.c b/kernel/params.c
index 8b25133fed242..78f00d3f6a165 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -20,6 +20,11 @@
 /* Protects all built-in parameters, modules use their own param_lock */
 static DEFINE_MUTEX(param_lock);
 
+/* Serializes module kobject lookup and creation in
+ * lookup_or_create_module_kobject()
+ */
+static DEFINE_MUTEX(mod_kobject_mutex);
+
 /* Use the module's mutex, or if built-in use the built-in mutex */
 #ifdef CONFIG_MODULES
 #define KPARAM_MUTEX(mod)	((mod) ? &(mod)->param_lock : &param_lock)
@@ -754,13 +759,24 @@ lookup_or_create_module_kobject(const char *name)
 	struct kobject *kobj;
 	int err;
 
+	/*
+	 * The lookup and the creation must be done atomically, otherwise
+	 * concurrent callers may race to create the same kobject, and the
+	 * loser of the race gets -EEXIST from kobject_init_and_add().
+	 */
+	mutex_lock(&mod_kobject_mutex);
+
 	kobj = kset_find_obj(module_kset, name);
-	if (kobj)
-		return to_module_kobject(kobj);
+	if (kobj) {
+		mk = to_module_kobject(kobj);
+		goto out;
+	}
 
 	mk = kzalloc_obj(struct module_kobject);
-	if (!mk)
-		return NULL;
+	if (!mk) {
+		mk = NULL;
+		goto out;
+	}
 
 	mk->mod = THIS_MODULE;
 	mk->kobj.kset = module_kset;
@@ -771,12 +787,15 @@ lookup_or_create_module_kobject(const char *name)
 		kobject_put(&mk->kobj);
 		pr_crit("Adding module '%s' to sysfs failed (%d), the system may be unstable.\n",
 			name, err);
-		return NULL;
+		mk = NULL;
+		goto out;
 	}
 
 	/* So that we hold reference in both cases. */
 	kobject_get(&mk->kobj);
 
+out:
+	mutex_unlock(&mod_kobject_mutex);
 	return mk;
 }
 
-- 
2.34.1


-- 
Below is the crash report:
BUG: memory leak
unreferenced object 0xffff8880188dacc0 (size 96):
  comm "syz.3.569", pid 12998, jiffies 4294992047
  hex dump (first 32 bytes):
    12 4e fe 86 ff ff ff ff c8 ac 8d 18 80 88 ff ff  .N..............
    c8 ac 8d 18 80 88 ff ff 00 00 00 00 00 00 00 00  ................
  backtrace (crc 8dccd85e):
    kmemleak_alloc_recursive home/zzzrrll/tmp/kf_src/linux-7.3-rc2/include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook home/zzzrrll/tmp/kf_src/linux-7.3-rc2/mm/slub.c:4696 [inline]
    slab_alloc_node home/zzzrrll/tmp/kf_src/linux-7.3-rc2/mm/slub.c:4996 [inline]
    __kmalloc_cache_noprof+0x1bf/0x420 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/mm/slub.c:5559
    _kmalloc_noprof home/zzzrrll/tmp/kf_src/linux-7.3-rc2/include/linux/slab.h:991 [inline]
    _kzalloc_noprof home/zzzrrll/tmp/kf_src/linux-7.3-rc2/include/linux/slab.h:1312 [inline]
    lookup_or_create_module_kobject+0x47/0x100 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/kernel/params.c:761
    module_add_driver+0x73/0x1b0 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/base/module.c:46
    bus_add_driver+0x1d9/0x340 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/base/bus.c:767
    driver_register+0xde/0x170 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/base/driver.c:174
    usb_gadget_register_driver_owner+0x50/0x140 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/usb/gadget/udc/core.c:1752
    raw_ioctl_run home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
    raw_ioctl+0xa26/0x1830 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/usb/gadget/legacy/raw_gadget.c:1307
    vfs_ioctl home/zzzrrll/tmp/kf_src/linux-7.3-rc2/fs/ioctl.c:51 [inline]
    __do_sys_ioctl home/zzzrrll/tmp/kf_src/linux-7.3-rc2/fs/ioctl.c:597 [inline]
    __se_sys_ioctl+0xbc/0x130 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/fs/ioctl.c:583
    do_syscall_x64 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/arch/x86/entry/syscall_64.c:61 [inline]
    do_syscall_64+0x12b/0x350 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/arch/x86/entry/syscall_64.c:84
    entry_SYSCALL_64_after_hwframe+0x77/0x7f


<<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>

---

