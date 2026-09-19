Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8A47F794
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789817303; cv=none; b=hcndfMDhLBtpXi7TJQbL9iT/WaIMA94GGjpMl2oLsFy3NV5K9eT8U+5nT7amTYTOCDoSlmXy7+p/Fv/VC7AmLVQQnGIu6GywfIn+/b97wHYxs3F2PHq7KdBzBLeuMG6b7xSupSJnohL8b7XjTLAT4WOk5enm2nkSiMRBOQGP2fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789817303; c=relaxed/simple;
	bh=du5MWoLbM+0gyFrUg834DzGYz2aJ0D3QobopYOku/Jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LcuMM8qANxIkNpKot2dTogHxajBPwuXXty/essTqHr22GoIGFdEAdNaC2cYNoMy8IGtGlB31gK5S/QLNXKyxb/jyyEBDQ1oN/P7clzbf6cBLtAfOOoU4BeFCbEVMreGbu94kzbSHwnm43zB/ADYJ0pWT6cKtcGfcGRMalRCYuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhbU/atS; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhbU/atS"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df38376150so342935ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789817301; x=1790422101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WAvD/ItpcOk6pZmSWxxDXKSBAv47PCdbRhyAuFvQ+sg=;
        b=qhbU/atSA3+H9oaqjg/zt0P719K5w5RrQVYroP/SxpnNJ5LohW4DTr0aRqL8REOxyg
         pE6L5eVdeK7Bly8zTUQInXWrLYGTPejeM1q1zUzFFMWC4iEN82KaCCtiP7pBrH7A1G8l
         9d4pl+5dC22g8A4EvV2ysmlI6WQOomfpKtbIuOWtipzhDq6Ik0U/+ixpEcmfD4Adcyxd
         FWh0x3gGE3XYxKfTUxyVNn4YZM3oihdzaWhUQhG9pNPcWMFyLA/hzKy2nTrIACcINRey
         dKmw6gpJfHfIJfNtI7pDl3mqtznHxiUifOX1u2byMIEQ9RjnLSlv8o/MLKmwhA4+Giu8
         ZFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789817301; x=1790422101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WAvD/ItpcOk6pZmSWxxDXKSBAv47PCdbRhyAuFvQ+sg=;
        b=vKeD4tVzlns3um6G9FG2/ojr00bhSzdr6m59JZfexF19h+Ao4mdNgsVQENR0xmulJt
         X7EC8W6+pwKSZGTHqyCrsJ/Oxkj7Bw++AFeGGeirzhO9w4D1skqWMZPzGn3CFNDTtibv
         F7koAuuhJCPHNAbajKlyxTZdGbDIHEp97eOYZ2msGA4i5JtnBZr91rFFZ8DPb0i8Lnvk
         6v4+KwXqUtpsFUvRVNg4dgLP987e1+HOkS2wDJSD0xguTh1skz5fyUfryq8qtCeTnfPB
         yh4XyfVjHBH3nTFTIvKNUAhcmnoaXEtS+HAA/6k9sdvqQQ8y2/rJggCVN3o20s059vDT
         jWgA==
X-Forwarded-Encrypted: i=1; AKwUvBwwKT+lBp/QBF8oN7uqwLLr0yNzZGcJ1D5PUR2HHf33CjRg6ftJZoDIptj0e4SQu25zqu8GKa5NeygfIWw=@vger.kernel.org
X-Gm-Message-State: AFuF++kcDiPgJrHyVmfuke1BsvcbA9ngmVh/Le8mXRPRWMyhUFCqsbui
	uAylcQgWo8tuXAjCzVbnVN8v2epnk0i6JM/DEhfjHn7CEjLlY7Nl5asr
X-Gm-Gg: AYBFou2hXNUh73aQ37pgBSR+gzxp1vRPA8CcObZMk+XzTQdSSFHACbOa5xh8TosN3K6
	f3S8ZAUFDKiWiGRlLdL1wgOkAqbWDn1ltML+EsgDlbN0SC+MH2dT+kZbUwLBQEDhgwXwyVbpqWQ
	YlTAyJQk24w2fxODuSDF9o3xYpsEb6fDyqMMIETxbg+5s0MZMCWGDO6JVVcK0IPSK9Zdk1XIBHB
	AYrTujZkVgWQ9vX/bILU2IdSy/6vEGyLY+JhxXXyyUsC3nMKGMVVrvCS32AR4086Y9Fo57Iszcb
	XzLbsxY76IZfUCx/pX1DvOrzr4gImxnXF5JJMPMYNsqPp9mDVlD89KwWYgJVdL1fmrplUZrop7/
	UK1e9XO2TqWvd52fr5mHEQeE6yLzjPLF2xGdxkfUUC+vK/67DQ4Z4qommCal0ggE0kD+k4G0gnJ
	3GMs7BYKuVKILYhJsklbf3WFQLUMR3mw4DphH9YR6I+Z44Q2L7/brtUBgskp0CLLIiBgefvVbBz
	nTxdZehIAAwzw9R+qgyLP+lSTUXgHz5xQfaU6v+nvRHc62fc9RlaotXhylwb/s8vP5RGOtiHp8n
	Z4y2SX7SOQ==
X-Received: by 2002:a17:903:1786:b0:2dd:c053:b9c6 with SMTP id d9443c01a7336-2ddc053ba3amr29382185ad.23.1789817301267;
        Sat, 19 Sep 2026 04:28:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df37b8c8basm3023915ad.61.2026.09.19.04.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 04:28:20 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: gadget: f_tcm: detach the gadget in usbg_drop_tpg() to fix a use-after-free
Date: Sat, 19 Sep 2026 11:28:20 +0000
Message-ID: <20260919112820.3885842-1-benquike@gmail.com>
In-Reply-To: <20260919090726.3256229-1-benquike@gmail.com>
References: <20260919090726.3256229-1-benquike@gmail.com>
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

Fixes: dc8c46a5ae77 ("usb: gadget: f_tcm: convert to new function interface with backward compatibility")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
v2: Add the Fixes: tag that v1 said it could not determine.

dc8c46a5ae77 introduced opts->can_attach, the !opts->can_attach gate in
tcm_bind(), usbg_attach()/usbg_detach(), the tpg_instances[] table and
fu->tpg, and the version of usbg_drop_tpg() that tears all of that down
without ever detaching - i.e. every line this patch touches. Note
git blame points at 08a1cb0f65fd ("usb: gadget: tcm: factor out
f_tcm") for the top of usbg_drop_tpg(), but that commit is a pure file
split out of legacy/tcm_usb_gadget.c, so it is not the tag.

There is a defensible alternative: 4bb8548df632 ("usb: gadget: f_tcm:
add configfs support") added the callbacks that set can_attach for a
pure-configfs gadget, which is what my reproducer uses. I went with
dc8c46a5ae77 because the legacy gadget already set can_attach
unconditionally, so the hole was reachable without 4bb8548df632 - and
in any case both landed in v4.5-rc1, five patches apart in the same
series, so the backport target is identical. Happy to switch if you
prefer the other.

For completeness, the underlying "free the tpg without detaching"
shape is as old as c52661d60f63 ("usb-gadget: Initial merge of target
module for UASP + BOT", v3.5-rc1), but f_tcm.c does not exist before
v4.5-rc1 and opts->can_attach - which this patch has to clear - did
not either, so dc8c46a5ae77 is the oldest commit this patch is
actually applicable to.

Two things worth a reviewer's attention: tpg->gadget_connect is read
here without the target-core configfs locking that usbg_enable_tpg()
writes it under, and the opts->can_attach = false lands inside the
if (i < TPG_INSTANCES) arm added by e877b729c649 ("usb: gadget: f_tcm:
out of bound access in usbg_drop_tpg"). If you would rather refuse the
rmdir than auto-detach, note that fabric_drop_tpg returns void, so it
cannot be failed from here.

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
