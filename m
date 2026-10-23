Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.96
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775738;
	b=0fDrqUEy1C0EGJpMo2v3WQ9/8F1wQetDT3tYpbSXIL5SK1cVxVvnESHPb1jDXMQNfPEB
	 Y54bCe/tGXTr5zYvlUjJ85PqPZ3lUxTirpYntG7RLa47IN5qSdn0VA2o9RIgYd3xUpXiU
	 VLuOLymb1rgGma9dTJsantdE/Chcnz+KnLizKyS5kv9ixb2dIm/Xt2hwannxieErq4vUi
	 4dZM+9+37J/XAsH0f5xtteSZLMtzV/gmvTGxhjbp3dvf4IcbCw8AxemSL8VKjMF74baKZ
	 GPXXwq2JYeS/iRa2lguwA6q7vL1YrIRTi6r/A2LHJuTRySbGFhDHq/YP5roT3qRBHwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775738;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uOTjqmyRNUWkFdydZyKOHkZPBvFbPtsWEgtGBpk+JSg=;
	b=KKbxEprBwlwKpD1Rliwool6sBPMTvKwq+zhnjTg1qB8bcqQsbhAeyI9p6S1QM/Cck21V
	 qeC6pig3cAGG5JtREeOOqg7GtV7m21q4qyz77n3pw1lmcOcNbPClfz3geUosGfsLFnrFD
	 /SP8hC2V2AxSOSHgDljrUUQXDOg+2AAKpDZY0g9OoENUwxLZd5dWxwR+hz1+anW4zBvGo
	 3C9oojkpArMoqNE2fC0+LFS9f0u8ScnS5IXsBaN55sJimJlMrigsC0vM8CNifvn3xGITQ
	 Vm/8DVQ/qwUsjYIBL/QOaJPwxnXMGM5cb5mFHjhOOU85K3kqxuuoHdqL/501MAKlqDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=waldn.net;
	spf=pass smtp.mailfrom=waldn.net;
	dkim=pass header.d=waldn.net header.i=@waldn.net header.a=rsa-sha256 header.s=key1 header.b=hXUsRcAY;
	arc=none smtp.remote-ip=95.215.58.96
Received: from mta1.migadu.com (out-96.mta1.migadu.com [95.215.58.96])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C004606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C004606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=waldn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=waldn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=waldn.net header.i=@waldn.net header.a=rsa-sha256 header.s=key1 header.b=hXUsRcAY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=bK4TXPNXctxarcSsHlGeHHSHsHKJGqcOVwvu8B7oRYA=;
 c=simple/simple; d=waldn.net;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792775736; v=1; x=1793380536;
 b=hXUsRcAYPMTmuSnqXSpWvv1LYNBQ97VYJ4hbo8V5DL03aT8VHsW2fLV769m4UQrOr6TauIPz
 5rEi2uFrnvZqE/NJ8KGbAYFprrNbZKj18NkWIH+6YcTf8twfssHQFU3UZTqlQj+3ibMad3jfsJ6
 eWZOprP7bI3bkI566EVrfFBJM0GokVhVVQZQNIUXBLnF3BrCmwmV8zxpdALS2QH78zEeMRQpaPT
 dj3B89xfu0Hmam3sGnZ0ibjuPeQKKQqB3T9RDol4R71JG8k6u8GPDWEZh0r8RN/SMbdfadYe1QA
 H+zVBlqYWlK22gfLEWq856eoco/+8icp2Hsl8OiW9N88w==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 118033012f27832e;
	Fri, 23 Oct 2026 17:15:17 +0000
X-Mizu-Trace-ID: 118033012f27832e
X-Migadu-Flow: FLOW_OUT
From: Amelia Crate <acrate@waldn.net>
To: Kees Cook <kees@kernel.org>,
	linux-security-module@vger.kernel.org
Cc: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amelia Crate <acrate@waldn.net>
Subject: [RFC PATCH] loadpin: allow untoggleable enforcement on filesystems which don't appear to be read-only
Date: Fri, 23 Oct 2026 12:15:08 -0500
Message-ID: <20261023171508.3460300-1-acrate@waldn.net>
X-Mailer: git-send-email 2.54.0
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

Some filesystems, such as composefs created from layers which are entirely
read-only, can't be easily detected as a read-only file system. In addition to
filesystems which are read-only without having a backing read-only block device
I believe this is also useful for cases where immutability of the filesystem is
enforced by the hypervisor or the host, such as 9p shares or virtiofs.

It is still desirable to enforce LoadPin and disallow toggling enforcement in these cases.
This patch gives system administrators a way to disallow toggling LoadPin enforcement even
when the immutability of a filesystem is unclear.

Signed-off-by: Amelia Crate <acrate@waldn.net>
Assisted-by: Codex:gpt-6
---
 Documentation/admin-guide/LSM/LoadPin.rst     |  8 +++++++-
 .../admin-guide/kernel-parameters.txt         |  7 +++++++
 security/loadpin/loadpin.c                    | 20 ++++++++++++++++++-
 3 files changed, 33 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/LoadPin.rst b/Documentation/admin-guide/LSM/LoadPin.rst
index a90fd9dac960..f1e8825d0fe8 100644
--- a/Documentation/admin-guide/LSM/LoadPin.rst
+++ b/Documentation/admin-guide/LSM/LoadPin.rst
@@ -16,10 +16,16 @@ boot ("``loadpin.enforce=0``").
 
 LoadPin starts pinning when it sees the first file loaded. If the
 block device backing the filesystem is not read-only, a sysctl is
-created to toggle pinning: ``/proc/sys/kernel/loadpin/enabled``. (Having
+created to toggle pinning: ``/proc/sys/kernel/loadpin/enforce``. (Having
 a mutable filesystem means pinning is mutable too, but having the
 sysctl allows for easy testing on systems with a mutable filesystem.)
 
+Some filesystems may appear to be mutable, but are in fact read-only.
+In this case, ``loadpin.force_enforce=1`` can be set to require enforcement
+of LoadPin on all filesystems. When LoadPin is enabled,
+``/proc/sys/kernel/loadpin/force_enforce`` reports the state of this option.
+This option is independent of whether LoadPin is enabled.
+
 It's also possible to exclude specific file types from LoadPin using kernel
 command line option "``loadpin.exclude``". By default, all files are
 included, but they can be excluded using kernel command line option such
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1b2ae71def21..df8c145cc63d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3540,6 +3540,13 @@ Kernel parameters
 			Enable Live Update Orchestrator (LUO).
 			Default: off.
 
+	loadpin.force_enforce= [SECURITY]
+			Format: <bool>
+			Force LoadPin enforcement until reboot, even when the
+			pinned filesystem is not backed by a read-only block
+			device. Requires LoadPin to be enabled in the active LSM list.
+			Default: off.
+
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
 
diff --git a/security/loadpin/loadpin.c b/security/loadpin/loadpin.c
index f71861f98e1a..b260ad299a2c 100644
--- a/security/loadpin/loadpin.c
+++ b/security/loadpin/loadpin.c
@@ -45,6 +45,7 @@ static void report_load(const char *origin, struct file *file, char *operation)
 }
 
 static int enforce = IS_ENABLED(CONFIG_SECURITY_LOADPIN_ENFORCE);
+static bool force_enforce __ro_after_init;
 static char *exclude_read_files[READING_MAX_ID];
 static int ignore_read_file_id[READING_MAX_ID] __ro_after_init;
 static struct super_block *pinned_root;
@@ -60,11 +61,19 @@ static bool loadpin_root_writable;
 static int proc_handler_loadpin(const struct ctl_table *table, int dir,
 				void *buffer, size_t *lenp, loff_t *ppos)
 {
-	if (!loadpin_root_writable && SYSCTL_USER_TO_KERN(dir))
+	if ((force_enforce || !loadpin_root_writable) && SYSCTL_USER_TO_KERN(dir))
 		return -EINVAL;
 	return proc_dointvec_minmax(table, dir, buffer, lenp, ppos);
 }
 
+static int proc_handler_force_enforce(const struct ctl_table *table, int dir,
+				      void *buffer, size_t *lenp, loff_t *ppos)
+{
+	if (SYSCTL_USER_TO_KERN(dir))
+		return -EPERM;
+	return proc_dobool(table, dir, buffer, lenp, ppos);
+}
+
 static const struct ctl_table loadpin_sysctl_table[] = {
 	{
 		.procname       = "enforce",
@@ -75,6 +84,13 @@ static const struct ctl_table loadpin_sysctl_table[] = {
 		.extra1         = SYSCTL_ZERO,
 		.extra2         = SYSCTL_ONE,
 	},
+	{
+		.procname       = "force_enforce",
+		.data           = &force_enforce,
+		.maxlen         = sizeof(force_enforce),
+		.mode           = 0444,
+		.proc_handler   = proc_handler_force_enforce,
+	},
 };
 #endif
 
@@ -436,6 +452,8 @@ DEFINE_LSM(loadpin) = {
 };
 
 /* Should not be mutable after boot, so not listed in sysfs (perm == 0). */
+module_param(force_enforce, bool, 0);
+MODULE_PARM_DESC(force_enforce, "Always enforce module/firmware pinning");
 module_param(enforce, int, 0);
 MODULE_PARM_DESC(enforce, "Enforce module/firmware pinning");
 module_param_array_named(exclude, exclude_read_files, charp, NULL, 0);
-- 
2.54.0

