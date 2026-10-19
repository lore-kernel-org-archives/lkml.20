Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792435746;
	b=RaRB2g9mbWedeUYldiIumAEGkpzwgUZoMV/s4UHH71ia0N+iF09Rbz+7EXAlWGf1g8lI
	 S8s5SDSENh/DdNTbscCLIZtKlYTbeUJBijY/zB4/GqpaC/gZ3s8QhDlbj26MwOCASPMYE
	 UlAr/PR28lv2xaAK8TXtQKHekD4ASbfjGHEBENKkoZtAW8JQtsOHVc7DWVnPYoAbsEq5S
	 jtSNhhdhkN2H0VdG4FRwH3rs0bl3730VrTFs0iQIUVgi6tPtLIss3+AYcdY1NI1qNPzbB
	 9uw9JLyull+CmVev1a6ELi1j+yqM2NVpH5lKKPCOx4OJeYZRYNuhyN7cPMiG3HCMm5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792435746;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GAXZCV5m9JMQykLn0Ukn1ebbST4LlX+DTEB51yMeYSo=;
	b=GFrU1A4/cf8U3P7wL0q7+Og1KfKu5MDoSkpxlO/W4UO1ym6Z5v8pAXbQ2olh4mufLfee
	 k6iLBcxQcd+kFyhT/IFvOWPPia8iWMcncsMFFmV84NScZTUeKbLlj0d4x2+p2p6Z80/UK
	 Nyv+eNe/JZdy+Ijtb3qjO4/JVS1+0KIgtI+Gap9DrelIzfD3e+41/U/8/xJiw91PZlYFr
	 HCAbHgRMxfPVUYciQnw63jF1lObp2yKVK0Wsy+hAN9E0qA0YcpDWGF7Wc3PKWUNyHrXs5
	 otCHnVU/p7THLesS72Cxai94zysHV1hyNmniWVajyP/UL94YCfYhHDavZvvCDCCJK8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RJJP8MSy;
	arc=none smtp.remote-ip=209.85.217.51
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435AE606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 435AE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RJJP8MSy
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7cc2b6b0237so69797137.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792435745; x=1793040545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GAXZCV5m9JMQykLn0Ukn1ebbST4LlX+DTEB51yMeYSo=;
        b=RJJP8MSyqk6+vTmNLG6J3fudmf63oXBxtb4bAw28vBZ/T6JPfC0jcs6qLshzy7gXzI
         2B4yDwx7cSLLIjBVELGhYNcnsQ4Bs9FYBd2eGuwhZYD12RTpG48BuEB81wFPCvPqCryY
         YoL/kf+FMxFHCDrd5T4PFE12geD+FKi4gUmkKbNWN3Ack543k/k0AVyYvmSVqP0ks0wq
         A3XtxUZtGaxE0o4GHDJ4oPDv03kUrYH9JZWjblYVrSEGOIRKOTOq5iBU1OK2pJyqSEaT
         seUn9rQ3Beo73B78IiOhVBFjCQQqenodUU+T2Gll9LFTnsC2JEcKlKxNJxquu88x95mZ
         rtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435745; x=1793040545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GAXZCV5m9JMQykLn0Ukn1ebbST4LlX+DTEB51yMeYSo=;
        b=CbbwA3Kk3rOSM1XIeI3V8jut0JZtk7BowC3e3w2CwArY1MAiSxr8zcXYuxzGju6vjD
         vIGxV4exCmQe+VgE06Vmdxa91FIIfioczdCLJwAlKIm7Y5nz4JcC5niPL+yi6ddEyX05
         1J2S57NWljZqt4fpKoZIExWewGNfZYn4XMb9n6aYVJZChxru9RP94UZBQH7wveynCf5t
         t9wTGoP6WEM6sqyIFF5fSigS9ynkMO10fmiEl1vvjC4i9kuy5Mxkv1DtsK0nXttuC1f0
         B7CzQg7tlvZcfmlHBwArbYp31zd//49YGRwb8+AJHavl6YVcQKj0If/ZaP5pjiHX4MNy
         nY2w==
X-Forwarded-Encrypted: i=1; AKwUvBwnNy0uZfJba62q0rp1oGBUi+ocjTVWdamnrlypBnHE4u9jPYY6tq0O3MdQHXYtMhw6hC9w50O058CMz6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrkMgbiMLEdcKnrXYbTAk8AWeC9ut1qBzDENwPzg12eUEXCRy5
	LU1UzhmRqFBBNN3UtjSsrpoAgnR1zFq4crgag4lD/WaEWTjGKcsY2//e
X-Gm-Gg: AYBFou1M/AlLyYMa0dCFs6jL32zFQE2bUoM4binUGOd7WCvJPBzpuhqQTFJL1RStXBw
	5M2K/j6V/A4y2LRz456XHclKgG7D9Jj+sBkCmEIyI4plA5f6s5AMH1gYKHCJduz3Pcw8qyVrGF6
	6XnpuR+d2RTOV7OIweUV52HgepBLVPmApe5nRMILxO4IZN76Jr6/h4TDJFe2HZtBMYODo1B2cuu
	09xVOetWrUSjr8Em4MZHUGUQ1arvckeKI+VTn/d5BzAEoC5fwxj2QMhICWCZLli3KxyWhfXlnfL
	jjgePQQSpc+ZfKykk4mHDViRE4h/PzW0wfrGt/+VILOe2WX/A0UT0hqWItaGO3ibjPqlciIFScm
	fLKU6gDZseg3vWo25ersZbMOJsHQelaFSKSvHJ3644oZKfvKqilO9NWhpn/D087Enic+/RKMcoo
	5u/RZqXfG3+K4pa0M5eqSF5UG2Qldex0Bhlp59gD3KaIt/xJEp2Zn3RSMwM7ck8TbcR+OUNB8Jw
	oKdC47AgX4FhPe2eZprmsMwNQry+E2qd7A2U2t2an06eVg5YbSyywUv9IsYy9Ns/LN5fjGFc542
	R/qkr2C/M/j19Whzjn0=
X-Received: by 2002:a05:6122:8107:b0:5ea:b7b5:454 with SMTP id 71dfb90a1353d-5eab7b5070bmr1354058e0c.1.1792435745253;
        Mon, 19 Oct 2026 11:49:05 -0700 (PDT)
Received: from localhost.localdomain ([132.170.205.109])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b53cfdfsm10488632e0c.15.2026.10.19.11.49.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 11:49:02 -0700 (PDT)
From: Sanan Hasanov <sanan.hasanou@gmail.com>
To: Alexander Aring <aahringo@redhat.com>,
	David Teigland <teigland@redhat.com>
Cc: gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	syzbot+b2b8d04ec4914f618d23@syzkaller.appspotmail.com,
	Sanan Hasanov <sanan.hasanov@ucf.edu>,
	stable@vger.kernel.org
Subject: [PATCH] dlm: don't put an uninitialized lockspace kobject on error
Date: Mon, 19 Oct 2026 14:48:49 -0400
Message-ID: <20261019184849.24422-1-sanan.hasanou@gmail.com>
X-Mailer: git-send-email 2.48.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sanan Hasanov <sanan.hasanov@ucf.edu>

Commit 8a4cf500f1dd ("dlm: drop kobject release callback handling")
dropped the do_unreg flag from new_lockspace() and made the out_lsfree
error label call kobject_put(&ls->ls_kobj) unconditionally. But ls_kobj
is only initialized by kobject_init_and_add() after the callback
workqueue and dlm_recoverd have been started, so every failure before
that point puts a kobject that was never initialized:

  dlm: ls_6035_1: can't start dlm_callback -12
  kobject: '(null)' (ffff888027a28088): is not initialized, yet kobject_put() is being called.
  WARNING: lib/kobject.c:736 at kobject_put+0x66/0x550 lib/kobject.c:734
  Call Trace:
   new_lockspace fs/dlm/lockspace.c:617 [inline]
   __dlm_new_lockspace+0x1714/0x1cd0 fs/dlm/lockspace.c:638
   device_create_lockspace+0xc7/0x350 fs/dlm/user.c:414
   device_write+0x872/0xed0 fs/dlm/user.c:606
   vfs_write+0x296/0xba0 fs/read_write.c:685

syzbot hits this by sending SIGKILL to a task creating a lockspace
through /dev/dlm-control, so that alloc_ordered_workqueue() in
dlm_callback_start() fails to create its rescuer thread. The same
happens if rhashtable_init(), the ls_recover_buf allocation or
dlm_recoverd_start() fail.

Bring the flag back so the kobject is only put once
kobject_init_and_add() has been called. Since the kobject no longer
frees the lockspace, kfree(ls) still runs on every error path.

Fixes: 8a4cf500f1dd ("dlm: drop kobject release callback handling")
Reported-by: syzbot+b2b8d04ec4914f618d23@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b2b8d04ec4914f618d23
Cc: stable@vger.kernel.org
Signed-off-by: Sanan Hasanov <sanan.hasanov@ucf.edu>
---
 fs/dlm/lockspace.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/lockspace.c b/fs/dlm/lockspace.c
index a9c98b4f37..443421e945 100644
--- a/fs/dlm/lockspace.c
+++ b/fs/dlm/lockspace.c
@@ -364,6 +364,7 @@ static int new_lockspace(const char *name, const char *cluster,
 			 int *ops_result, dlm_lockspace_t **lockspace)
 {
 	struct dlm_ls *ls;
+	int do_unreg = 0;
 	int namelen = strlen(name);
 	int error;
 
@@ -567,6 +568,9 @@ static int new_lockspace(const char *name, const char *cluster,
 	wait_event(ls->ls_recover_lock_wait,
 		   test_bit(LSFL_RECOVER_LOCK, &ls->ls_flags));
 
+	/* ls_kobj must only be put once kobject_init_and_add() ran */
+	do_unreg = 1;
+
 	ls->ls_kobj.kset = dlm_kset;
 	error = kobject_init_and_add(&ls->ls_kobj, &dlm_ktype, NULL,
 				     "%s", ls->ls_name);
@@ -614,7 +618,8 @@ static int new_lockspace(const char *name, const char *cluster,
 	xa_destroy(&ls->ls_lkbxa);
 	rhashtable_destroy(&ls->ls_rsbtbl);
  out_lsfree:
-	kobject_put(&ls->ls_kobj);
+	if (do_unreg)
+		kobject_put(&ls->ls_kobj);
 	kfree(ls);
  out:
 	module_put(THIS_MODULE);
-- 
2.34.1

