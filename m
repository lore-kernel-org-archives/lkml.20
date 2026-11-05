Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891381;
	b=iopXeESQeFhOFBphPiBwSj49ZRMFf6m4gCu0bTFYJkeusRC1+IfRBmQZoA2JbMIc58eZ
	 9p28wpINFfbfT4xvTTQ8cu2sLVk89aKndQvJcM4XDOor0a+2Jqy3nXyKRI38OLO24FVQ9
	 ObTLB5YUFB3Dq4L/zu2RyW50GqXndO841ChMGKSRmk0MQHEdjk45bfaRX7xaiZBmM/IWp
	 2GpqkeXnWMYB/93eWe4fifRlzzX0dHoIn1jxtXF3Vl07qkHeBX0rrEDa9zN3vDi3Zqw3j
	 rjvEwg7o0VJgmryZr2sPpwJw/Kjd4NzdzCWpgFvTO0r/yeuKVDL4Ft1Lk7HZWCxCPYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WFfIYKlEcfzlG/dWEIHjKozgVZ74AbCqPxapNXqYqH4=;
	b=x5Y28gBlDLMrTroFeGDXuzvkHP1diUDJogT6LYgH0KJXrqNGeMxGJbXBFn2zQ/o+pjys
	 vvIeMyDNGDmb9CGjI0EaHPrrmLlmjsc8TshrChLUi9YCX4rI2DJZsFGCLkXbK4L2lRcWp
	 XGvn/MgldMBIDMVSy6iBVNiNC5sBYBDCal/aafA/2Huwmw7yqk7HgdjBQowcuwr0MHH1V
	 tUXyENvyYZAYoQzpm1WZvf89VGofOXhrcVcUNAT1TZODRScCLTtGH7YOqP0NFjn0dzIiH
	 /2ZZiHtrvdRvbpKaVVVzyXDp0ZhZ8EoMnMAPvQD7UJVVTBEsaxAr6uWPaAUwftUISXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mlTeXDfm;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEA7606A338
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEA7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=mlTeXDfm
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b305e10ac7so20000257b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891380; x=1794496180; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFfIYKlEcfzlG/dWEIHjKozgVZ74AbCqPxapNXqYqH4=;
        b=mlTeXDfmxXMDjL4Lb6C2bOLeeONksppw9Bsab+fkg9io+99V1DUrBKsgA+1GcXqjVz
         rl1Mgdv2wVEzsEA0SMzHw/M/FU2hNhXYoCjh6A3Tc8qkl7H2Gf0QL5f9gfiOghW8nns+
         ItDhFmCHlgdfoMBZuDyuF0GYfeKgwJUtZGkBnFvloFBF19P9hnGzkmvf5aNjUSamEYLq
         KiJbZ9N60tlX+izYB0kfnhR01IsDYknDzsLzi19P7/e+/XfevQqtRKZiSLfcm2ISBMxr
         qC6FnlQu269Abddef6NLtEX6YK6Mhq6ODP11Vu46NDFZkL4UW9ECrpWgq2C4SR2gwjFB
         0s9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891380; x=1794496180;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFfIYKlEcfzlG/dWEIHjKozgVZ74AbCqPxapNXqYqH4=;
        b=23KY4bJ0huHg/kOXr8+j3GuQlSzUC9wtsYsdE4L/QC7cSDTPcIs2FoDkmbRi542Gn0
         nk7j8zJck35Ds+WAbYiI6Dzcpo5RAYKPRR6RMwmesKhDK55svLSQJuFxlpFtlDpcBik0
         HXzs08MngeaGIT2vlCxAQm66YkmL36toMjsoBKICl4HPh2zzbUbPvswG/9Vkq92i+cdQ
         M4haLBT6caz6JEKWlUoQCgXy3hLYOrrdF3fV0dmilxI2qt6Jwf5ettZCpvVazCzKYcgC
         nxaXwB+JTUieGZlrOiq+WApmd4HyhPAvK3U035RjuH9DR1u9m1CtWfD9XvpOR9+B6eY4
         RNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzbp5+iliWf7y6HalrGzz8tCh1+NluCrRZDDHb5vcxriTHZl3wxhvDmYVQeRVi0tpPmNIs+0mNGdjdPrsc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HbIW5eozgVgSuMpwNR00j0M921v95ftQkKs8o4M7KGayVnZBw
	zaESELjBg6xxA+1lxYOVVJ9pnoi6rskNdLdzXWej6cYG4tk8Bmr/7JNFxFuR7ZmIYc8=
X-Gm-Gg: AYBFou3Vo4Ff+ezbcIOWyHW3Tw+Nn5od522lK2QLZo7w8XHa/vYPd2nuYsS2p9zzn5H
	JtPJAlUBs6zcmQZBxUW3LbgHgU0F94lucDEQ5yM0913HR3yg+oSO98oJ7EHrceo0i3SXv5hTZSo
	7nWWq0mcMBinsE5w3GJiTQPaWnZfMzci5ewUJxUKT73Udmh1qe9GPYiyuo4sVLBIKfN+QZEBOQC
	/Y96KOhgP/37bmPIN5XtPFj9Sa+19J6jdBBcO8lpeChCBrttZjWC1gR22i40MVby1M/aiqM51MX
	V3sZdfGKCzAdjnFTuyvc3t4/wO/vVMdM1NIbI9uIlTXR0zOeScoLEU3IIIF1JAO8Ullsn0eexmj
	shYTLbIuJo2mQmXWN4MeXdlAURR/5+wPlbK6DLtjsg6zmgXU7Kl79FXX98V00146Bmb9gLA+X5H
	WyqHNjfcDNAyLopgcPLGr01FebaNbgP8K7qv7MNqRSuzXpE0i/UBXru8IlakzD7iOjMI9Mu7Wd5
	5Dgs1PGh7HC4yJ3c2UfdfWSML+KaWe+RDO+bNaYR5i/Slfm1Z46R+r/ybXEijLnj9ux0GzdewV7
	uQjnbxj3jL2r+3+hz+K6TnZwvXiz+N1xaG2SqoB4iWrdEw==
X-Received: by 2002:a05:690c:a858:20b0:873:5c0f:28b with SMTP id 00721157ae682-8b2b67dca42mr88447657b3.53.1793891379721;
        Thu, 05 Nov 2026 07:09:39 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309936bd7sm42386077b3.20.2026.11.05.07.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:09:38 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:18 +0000
Subject: [PATCH RFC v3 26/90] cells: add cell_configure()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-26-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=5832;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Q6k1QdhI9pFIL/cTBXzkI5uE5xkaLe2nKZ9LLtyadOk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QMLONaDgV+onnmlErxqSlnu7qr/dtXWQZ02TtBvZNkJxv3iW/+tD4IvhqUTY8hEgWo3VydYUjuB
 vMOLPUXHHEAE=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Add the system call that changes a cell. It is modelled on fsconfig(): it
takes a command, a key and a value, and data only flows into the kernel.
Reading from a cell is a separate system call, so that a seccomp filter
can allow a monitor to read and deny it to change anything.

Holding the cellfd is the only authority that is needed over the cell.

This patch adds the framework and the one key that depends on nothing
else, the "hostname" string. There are no flags for CELL_SET_FLAG yet.
Every command requires the cell to be in the BUILDING state.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/uapi/linux/cell.h |   9 +++
 kernel/cell/Makefile      |   1 +
 kernel/cell/slots.c       | 136 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/include/uapi/linux/cell.h b/include/uapi/linux/cell.h
index f3589a23a596..22337cab3da1 100644
--- a/include/uapi/linux/cell.h
+++ b/include/uapi/linux/cell.h
@@ -12,6 +12,15 @@
 
 /* cell_create(): @parent is CELL_SELF, see <linux/fcntl.h>. */
 
+/* cell_configure(): @cmd. Data only ever goes in. */
+enum cell_configure_cmd {
+	CELL_SET_FLAG		= 0,	/* Set the flag named by @key. There are none yet */
+	CELL_SET_STRING		= 1,	/* Set @key to the string in @value */
+	CELL_SET_BINARY		= 2,	/* Set @key to the @aux bytes at @value */
+	CELL_SET_FD		= 3,	/* Fill the slot named by @key from fd @aux */
+	CELL_CMD_SEAL		= 4,	/* Validate everything and seal */
+};
+
 /* Life of a cell. It only ever moves down this list. */
 enum cell_state {
 	CELL_BUILDING		= 0,	/* Slots may be filled */
diff --git a/kernel/cell/Makefile b/kernel/cell/Makefile
index e343e0fa72b0..ac48bfb289d0 100644
--- a/kernel/cell/Makefile
+++ b/kernel/cell/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-y += core.o
+obj-y += slots.o
diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
new file mode 100644
index 000000000000..905672db9936
--- /dev/null
+++ b/kernel/cell/slots.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cells: filling the slots of a cell, and sealing it.
+ */
+#include <linux/cgroup.h>
+#include <linux/fs.h>
+#include <linux/mnt_namespace.h>
+#include <linux/nsfs.h>
+#include <linux/nsproxy.h>
+#include <linux/pid_namespace.h>
+#include <linux/proc_fs.h>
+#include <linux/proc_ns.h>
+#include <linux/slab.h>
+#include <linux/syscalls.h>
+#include <net/net_namespace.h>
+#include <uapi/linux/cell.h>
+
+#include "internal.h"
+
+/*
+ * Slots. All of these run with cell->lock held and the cell BUILDING. Filling a
+ * slot takes what using the object that goes into it would take: holding the
+ * cellfd is authority over the cell, not over what is put into it.
+ */
+
+static int cell_set_hostname(struct cell *cell, const char *val)
+{
+	if (strlen(val) > __NEW_UTS_LEN)
+		return -ENAMETOOLONG;
+	strscpy(cell->hostname, val);
+	return 0;
+}
+
+static int cell_set_string(struct cell *cell, const char *key, const char *val)
+{
+	if (!strcmp(key, "hostname"))
+		return cell_set_hostname(cell, val);
+	return -EINVAL;
+}
+
+static int cell_set_binary(struct cell *cell, const char *key,
+			   const void __user *uvalue, size_t len)
+{
+	return -EINVAL;
+}
+
+static int cell_set_fd(struct cell *cell, const char *key, struct file *file)
+{
+	return -EINVAL;
+}
+
+/**
+ * sys_cell_configure - change a cell
+ * @cfd:    a cellfd
+ * @cmd:    one of enum cell_configure_cmd
+ * @ukey:   the name of what is set, or NULL for the commands that take none
+ * @uvalue: a string for CELL_SET_STRING, @aux bytes for CELL_SET_BINARY
+ * @aux:    a length for CELL_SET_BINARY, a file descriptor for CELL_SET_FD
+ *
+ * Shaped like fsconfig(). Data only goes in. Holding @cfd is all the authority
+ * it takes over the cell. Filling a slot also takes what using the object that
+ * goes into it would take.
+ *
+ * All of it needs the cell to be in state CELL_BUILDING.
+ *
+ * Return: 0, -EBUSY if the cell is past CELL_BUILDING or the slot is taken,
+ * -EOPNOTSUPP for an unknown @cmd or a reserved key, -EINVAL for an unknown key
+ * or arguments that do not go with @cmd, or what the slot has to say.
+ */
+SYSCALL_DEFINE5(cell_configure, int, cfd, unsigned int, cmd,
+		const char __user *, ukey, const void __user *, uvalue, int, aux)
+{
+	char *key __free(kfree) = NULL;
+	char *str __free(kfree) = NULL;
+	struct cell *cell;
+
+	CLASS(fd, f)(cfd);
+	cell = cell_from_fd(&f);
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	switch (cmd) {
+	case CELL_SET_FLAG:
+		if (!ukey || uvalue || aux)
+			return -EINVAL;
+		break;
+	case CELL_SET_STRING:
+		if (!ukey || !uvalue || aux)
+			return -EINVAL;
+		break;
+	case CELL_SET_BINARY:
+		if (!ukey || !uvalue || aux <= 0)
+			return -EINVAL;
+		break;
+	case CELL_SET_FD:
+		if (!ukey || uvalue || aux < 0)
+			return -EINVAL;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	if (ukey) {
+		key = strndup_user(ukey, CELL_KEY_MAX);
+		if (IS_ERR(key))
+			return PTR_ERR(no_free_ptr(key));
+	}
+	if (cmd == CELL_SET_STRING) {
+		str = strndup_user(uvalue, 256);
+		if (IS_ERR(str))
+			return PTR_ERR(no_free_ptr(str));
+	}
+
+	guard(mutex)(&cell->lock);
+
+	if (cell->state != CELL_BUILDING)
+		return -EBUSY;
+
+	switch (cmd) {
+	case CELL_SET_FLAG:
+		/* There are none yet. */
+		return -EINVAL;
+	case CELL_SET_STRING:
+		return cell_set_string(cell, key, str);
+	case CELL_SET_BINARY:
+		return cell_set_binary(cell, key, uvalue, aux);
+	case CELL_SET_FD: {
+		CLASS(fd_raw, slot)(aux);
+
+		if (fd_empty(slot))
+			return -EBADF;
+		return cell_set_fd(cell, key, fd_file(slot));
+	}
+	}
+	return -EOPNOTSUPP;
+}

-- 
2.55.0

