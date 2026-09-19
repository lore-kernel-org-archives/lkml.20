Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6993F210B
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 09:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808849; cv=none; b=jS0x26D5tEHq+WOMNxkFxNNJfB/hI2DaaS+U4tzVTZ4pdOhnvd0DDriE9FVkmBl1xgVu7e9zivuBx4dQKeLX13qnf0poAqRQ+kVWJ0gU9+j/EZk4a/GUM9SGt3J1ts8ZQs9ma2lifDH/jwHjVeEYAVS5m/VD5NUn+A/paouPJp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808849; c=relaxed/simple;
	bh=3tnpDguUjpU0OTwXuTCZcXZdYiKLozNucM0QkHPIBHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsLXGLG3RAOtKFV+oCT2Avm7FrVFSR1o7dyJC1MfIOMeLtmoAronDuxZV/Ufj7nrQKsHzhP1u+8fIq/pO31SmuZZh2mxenp6u468ZOXekBmlzcz4QSO07tE5QkvoBSJ1/dnZuj6ERwHqcSUyG+11q76wZA1cpRlStjJlil6Dea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvxW26NU; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvxW26NU"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ed6d6eso15841025ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789808847; x=1790413647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M3rt7gCqaVMDmbKda3ivqNvr3crvall/7ClNC3F8Z0w=;
        b=gvxW26NUekpASVuxXLao/g1vphLJ3XnTrgzum33SOiYMni8Nu4qSNhuI/6yod2k5TE
         VMjTmeHIAvK93U9xogXugRvT88Ya2KB91FMvs+i4GM1NcgMB/0zSmwLd72CsIAuDMWRv
         mkrQTWnk2j4TuisPi6jM0HsQ4ikyV2fuVS8leC3Vr6eZB8iIBRa5V43A3uPTci3rks/k
         jpqa+BpAWsbegubdM/KkYYY6kOQ33jfdqrtLkCd2MLG8CejRG93MTPEOsOUlljSIS4gg
         m6bsPF3LTDD7BjLLN1OVAZIxpBo/rrbNaSSoytgfUdrKA8MBw0/yKkscpO0fTOiJF7kx
         d3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808847; x=1790413647;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M3rt7gCqaVMDmbKda3ivqNvr3crvall/7ClNC3F8Z0w=;
        b=kK9cqaYwL2Dk2RgyGM6jlTaf87caFRUn7AvvPdSCWSzXwaxWrS0tX/I7sWXi5csXK0
         S1jnbvKnJT4WDVnUvEpb+P6Jxv1BEmQg6JeCD4DPGLiw/vDPoHIHzhyXofWZFiFbjmBK
         9FbISLawJWWRkLSM6MXvD2F50qAImqIqcZgkmXuRRDsOYIcuPSVY86cu5mG1rzBa5h/S
         o7bZkxjLUnKVB/zQmhE2mNOwgzcUk9xQ6ycwxzrslc/0S0aSec1+d9QAYfrCe+x8yH/y
         khEuR3JLpxJb0pPMJryfs0yUPO4Ou0WVhd9i9B0cBPVjg8idvfUGYktWD0mLIOiCuEnu
         sXyw==
X-Forwarded-Encrypted: i=1; AKwUvBx0teuZ40Hl4k++47CN45xH0qdZLZKQD4GmT4GuwyL/pfXA33yRIAqR8jwELuH100q/QD2wxyPlZ+7DpZo=@vger.kernel.org
X-Gm-Message-State: AFuF++kArp67icj2CqjHYWukU67WqWQM/PKb9YuLZqR7pi3ndiD4yhXY
	Sk3Fxq+hrC+F/u/CbwQOOzJuvwNBRE+lskeojtlG4a9st5nu8CsIsPGa
X-Gm-Gg: AYBFou3zZVBPxfCWWvYy2fJ7znkjwj9TVl+zs4x7psDLX6g8DC2N5VqNOMC/xDv4a+8
	pmlzzeTV6x7Mumc9KiySLtABoXjZyDA+J0FVFrdRPq94qdz9eTidp534QKLnaDSjhZXGxufM9oL
	XXOwc95NDl9uG/uZwuCcosJXiYZWl6LmBopxjP7WLP0tNlz6Ee9zlJCjzwSHbhr4ssZnzuBkoE1
	gDUYDX36rjBKC06Im3GpxTDQwIsz/VlhVLKjgG9VXXM9UyN0J42CMpZRm5bZhWPPBXL3uRAnRTt
	iUCrhiXkOCIBaqhdqsw2yQT4ASubUFaPk3U+jIeAaM0xkCuGEH8Gx9MTFWGFgcWKZixZd4DHazu
	OGSyaGcs9YvOgCx/2IzJBfeIObjrA0PhRGnT1S88TKGHYuY6VJGQHWg3Xlg5Q0wPMVe2saHcHOn
	pKgpIPOyLUwT/C7RbXthih7H6GVfatkvFHrZdG5Wc0XqJfP5Li+6KpWnJ1cLcMxVfqlXIq9tYHe
	rUtCKRI6PnVIWL52kHjAxx7J19oJDzWCwGrWxzFBeM8p6SCfVK8UtMfUF1ZAj72x7x8XeXJkHq+
	3gMTBoe+yg==
X-Received: by 2002:a17:903:b07:b0:2dd:c100:4b82 with SMTP id d9443c01a7336-2ddc1005f4dmr29944515ad.57.1789808847381;
        Sat, 19 Sep 2026 02:07:27 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dc83sm7626355ad.33.2026.09.19.02.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 02:07:27 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH] usb: gadget: f_tcm: detach the gadget in usbg_drop_tpg() to fix a use-after-free
Date: Sat, 19 Sep 2026 09:07:26 +0000
Message-ID: <20260919090726.3256229-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A target portal group can be removed with rmdir() on its configfs
directory while it is still enabled and still attached to a USB gadget
function. usbg_drop_tpg() frees the struct usbg_tpg but never calls
usbg_detach(), and it leaves opts->can_attach set, so the function
instance keeps a dangling tpg pointer and a subsequent bind to a UDC
happily attaches to freed memory.

Enumerating the gadget then dereferences the freed tpg from the UAS/BOT
completion path, in softirq context:

 ==================================================================
 BUG: KASAN: slab-use-after-free in usbg_submit_command.isra.0+0xbe7/0xd50
 Read of size 8 at addr ffff888107493478 by task swapper/3/0

 CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Tainted: G    B D    7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <IRQ>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  usbg_submit_command.isra.0+0xbe7/0xd50
  uasp_cmd_complete+0x83/0xf0
  dummy_timer+0x1337/0x2d60
  __hrtimer_run_queues+0x2a3/0x640
  hrtimer_run_softirq+0x1b1/0x3d0
  handle_softirqs+0x188/0x4e0
  __irq_exit_rcu+0x62/0x150
  sysvec_apic_timer_interrupt+0x6b/0x80
  </IRQ>

 Allocated by task 1:
  __kmalloc_cache_noprof+0x16a/0x380
  usbg_make_tpg+0x243/0x580
  target_fabric_make_tpg+0xb1/0x7f0
  configfs_mkdir+0x4e9/0xe10
  vfs_mkdir+0x2ed/0x790
  __x64_sys_mkdir+0x6f/0xa0

 Freed by task 1:
  kfree+0x159/0x420
  config_item_cleanup+0x148/0x1e0
  config_item_put+0x90/0xb0
  configfs_rmdir+0x816/0xa50
 ==================================================================

Detach the gadget in usbg_drop_tpg() if the tpg is still connected, and
clear opts->can_attach for every function instance bound to this tpg so
that a later usbg_attach() cannot pick up the freed object.

The forward declarations of usbg_attach() and usbg_detach() are moved
above usbg_drop_tpg() since it now calls usbg_detach().

Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
No Fixes: tag: I could not identify a single commit that introduced
the problem with confidence, so I have left it out rather than guess.

Reproduced on Linux 7.3.0-rc3 (5dd1818b15d9) with KASAN under QEMU using
dummy_hcd: create a tcm function and a target tpgt_1, write 1 to its
"enable" attribute, link the function into a gadget config, rmdir tpgt_1
without disabling it first, then bind the gadget to dummy_udc.0. With
this patch applied the same sequence produces no KASAN splat.

 drivers/usb/gadget/function/f_tcm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1756,6 +1756,9 @@ unlock_inst:
 
 static int tcm_usbg_drop_nexus(struct usbg_tpg *);
 
+static int usbg_attach(struct usbg_tpg *);
+static void usbg_detach(struct usbg_tpg *);
+
 static void usbg_drop_tpg(struct se_portal_group *se_tpg)
 {
 	struct usbg_tpg *tpg = container_of(se_tpg,
@@ -1763,6 +1766,11 @@ static void usbg_drop_tpg(struct se_port
 	unsigned i;
 	struct f_tcm_opts *opts;
 
+	if (tpg->gadget_connect) {
+		usbg_detach(tpg);
+		tpg->gadget_connect = false;
+	}
+
 	tcm_usbg_drop_nexus(tpg);
 	core_tpg_deregister(se_tpg);
 	destroy_workqueue(tpg->workqueue);
@@ -1776,6 +1784,7 @@ static void usbg_drop_tpg(struct se_port
 		opts = container_of(tpg_instances[i].func_inst,
 			struct f_tcm_opts, func_inst);
 		mutex_lock(&opts->dep_lock);
+		opts->can_attach = false;
 		if (opts->has_dep)
 			module_put(opts->dependent);
 		else
@@ -1832,9 +1841,6 @@ static struct configfs_attribute *usbg_w
 	NULL,
 };
 
-static int usbg_attach(struct usbg_tpg *);
-static void usbg_detach(struct usbg_tpg *);
-
 static int usbg_enable_tpg(struct se_portal_group *se_tpg, bool enable)
 {
 	struct usbg_tpg  *tpg = container_of(se_tpg, struct usbg_tpg, se_tpg);
-- 
2.43.0
