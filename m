Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890682;
	b=jTAuvV4vbnWleEMdzESJJDGiiGlR/Zd6Jzaf+kAOS1NXyhn+012R3kGVBpcQxz/vD7+U
	 2fPAEXELk6BLoqnrKf3eGdSMK+pY5HupD+0xD8r0IC8KJpg/0Wq54igb41G96hNZn7Ugn
	 J/C/OD0B6/6u+w7vsV8HNXXVGSFmSLmLRI48d68e0/sqEzk8EAzVCbnuK44MbomCFa9wk
	 stQ+7UIkW4gFKSuEHm86g33CVXiQdcHNpuv4LcoFCpHox3pmdqqB2r7cAe4zffgEemOgt
	 7k3gU5qEVoVsbR65Tb4lUzr6IRl4w3jmhp93HmKvSxakHejORiLwOh9LXSkUWMnYsrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1Oa27i8jHKKaCqDgAvABan/T7W1O2wDNoFWitJ9cz5I=;
	b=Odpn5yRxBYM8M3FFVJjo3+qmo63lKSd4dPN1EwZDR8/VEUUFWdA8CiUQOoSN/QGyYU5m
	 rr+SLtXN+xziLjOsdAH5p3xTbFcpNUWREhSJ8DhNgPym446IKqDmqWlnOW3d+24hZ3+33
	 c2FgC5T4U2/OJZMyznxGdVyotA8eUoABf2f30qG9txUs7aPwAGmJthGvQrhySQammpd2K
	 NU5eiWat9DDxgDogD5nTklnIeat6uhPcP++dMWXgmUhbHApe/+tyj9iByczxGwLidihjg
	 rSvqveQyYjboVhB/hDyeYKJiTEkIkTTLvXURtZB5oDmmRax4bHxjAkRxm1BZQbYNBpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hxjM+qWr;
	arc=none smtp.remote-ip=209.85.161.41
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD5606D819
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EBD5606D819
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hxjM+qWr
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-714d57774d8so1143457eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890681; x=1794495481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Oa27i8jHKKaCqDgAvABan/T7W1O2wDNoFWitJ9cz5I=;
        b=hxjM+qWrHYYXdnWv7PFW7hcHPLPOdZ0im6EzNDt3mqaXOk8bM34ni57hsQUKgV9aqU
         nzwaQl0I0S/QQuX6DfE0wblG/vhO8XTeTyIXhZsQDYMmbde9qXSBBUkQvYvWn4Ukx99t
         iW6Gzi5hr3M4DJmT1jvz54V/RlpVUTYnlq9SiXniN6R88JwANoacPgOyQWB6kG8SgxD0
         arOgdrKoBdRq+HkgGqnNske6p5djcSV+qsmtgWMA+6rYnqG+NPtBg/Hre7qjzRmzwXl+
         eIk+a981/EVv+b5BZVWQpWOiWVO/uV/4YU6O70LjQc/HSkyL/76+XlKHJlwmB4xuea6I
         ryGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890681; x=1794495481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oa27i8jHKKaCqDgAvABan/T7W1O2wDNoFWitJ9cz5I=;
        b=RXw0JtFdhgZkH/Gos8DSsL0TDXLFf3DRw6Wdki/zLZCro6w7ND51XNxJgGzZSmZMqt
         WZ0hR3gS3I9zupJmS8gLiOWIkY5Gh4NmqOqBbxisGUTi760T6oC7yJOG7n+F6XMWsfhj
         ow6DrAFvTaXKNZyzfd+Eav3JKcOXU2ay21PqtpR101cZ1nU1SrBRHcSfRMoc1cAX7RHx
         uVaO1p0uuUcBqm2a5u3M1ozRbm/v7Nrcc7yQwl2/LEiG01nDt5OSrROJHD4JP3mMwVWQ
         ax5628+Xk0Jax2JOHk8FObrCPPN1SRVltM0UsFURdlchGHW7S6+0TYXIryOpRxvudBzE
         6Mdg==
X-Forwarded-Encrypted: i=1; AKwUvByonazbOq0Tc/svbnsKup6hxxWmmycK/xDTG5OdpRguucOFKDBzXtxS3BIbsDQbr8WNddO+z4iRGja4r4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vmx7SPWZ79nH3oFUF1UA07jCmLzerQh3aG8oFfGNeKGW5EeKo
	tsAHsWKT7gI7ps0ziIsRirAdtnWfSTb+sr9dPSMQfqq9z95Ma4/LswAMPVNmeFQa2q0=
X-Gm-Gg: AYBFou1QPrALy7hqMdIYLTqsBXmYFXjJYMVE2fT8gKVQA70MC4m+oJZITpT6aayjNsI
	1SDbEV3jvtPuv3vcNyLBddcarlRPYOv9gCz0vLFcBZjmuTqTzAtFqUAn7uGOT9CdlTkn15tAXaA
	hCrlFSlcdd916s9PE5EKPcsJTxo0MhWBcQf64qYYYwROXCGE3QULscmk0f58oVW+/qh0OTLANGH
	Uz8gy7Amv7JaR7bx+jcEsjRo9bjDxR9huC2BH/uBfNdyvY+X3oAj6csDiJjPZvfGQRE4BEzj37H
	BCmlDf5xiaK9FqIVSUs8LfZmCP5hBQ2s4buvtWUsSOn/cJ0Vtonn7dXEDCP0PwuOqOvXlOMN2Xy
	qk2LmNUealHyz0BmOPFX2bG7fYoyBEYhwGeLl0vUTcVSWqowOvgnHcO5GCAqlj4fWRdugEs4Aby
	u1MQfXVLML8PtZgGufeDQRyycg2NbmggG0elMoUZ1LS+76wXfg09jW+l746YSUulNy8sBuuZsZL
	hBzHA8kIFbDrKFQGc3ViGC3BCToMsCbEOLF9gUPmWKSaskeRUV0PLfBk2uWWj4sgzUk0fqa3mST
	Kbed2NFVFl7FNIZRsB6tO82358AI2WdJwKUzXJmDItq2UoEY2li6DE3Qgq6pNMxIjNgp
X-Received: by 2002:a05:6820:83d7:20b0:70b:8148:92b with SMTP id 006d021491bc7-714f24e7804mr8959940eaf.62.1793890681047;
        Thu, 05 Nov 2026 06:58:01 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716c134ff86sm4261668eaf.14.2026.11.05.06.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:00 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:56:54 +0000
Subject: [PATCH RFC v3 03/90] cells: reserve a window of ids
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
Message-Id: <20261105-b4-cells-v3-3-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890669; l=2655;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=uYURFlGP89RDbq5t2H13wY1pbXbymFIdj6H++R/Kjxc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDQNC3zLxxRe7ukNn89rleJLFuizIwJ7EfSDVIS3gJlCB2pATqsdHif6i+tM5R6Ir6BIpCSJgkm
 OU6JAGpy6gQM=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A cell needs uids and gids of its own. The builder should not have to be
trusted to pick ids that nobody else uses, so the kernel picks them.

Reserve the upper half of the uid and gid space, minus its last block, as
a window. The kernel will hand out blocks of 65536 ids from this window to
cells. Add helpers that tell whether an id, or a range of ids, lies in the
window.

None of this is compiled yet. CONFIG_CELLS is added at the end of the
series.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cell_ids.h | 61 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/include/linux/cell_ids.h b/include/linux/cell_ids.h
new file mode 100644
index 000000000000..df0b874d5788
--- /dev/null
+++ b/include/linux/cell_ids.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_CELL_IDS_H
+#define _LINUX_CELL_IDS_H
+
+#include <linux/compiler.h>
+#include <linux/limits.h>
+#include <linux/uidgid.h>
+
+struct user_namespace;
+
+/*
+ * The kernel hands every multi-id cell a block of kuids and kgids out of this
+ * window. Nobody else may hold an id in it: a legacy user namespace cannot map
+ * into it, and no create, chown or ACL stores one in a filesystem that the cell
+ * it was lent to does not own.
+ *
+ * The last block is left out so that (uid_t)-1 stays clear of it.
+ */
+#define CELL_ID_BLOCK_SIZE	65536U
+#define CELL_ID_WINDOW_FIRST	0x80000000U
+#define CELL_ID_WINDOW_LAST	0xfffeffffU
+#define CELL_ID_NR_BLOCKS	\
+	((CELL_ID_WINDOW_LAST - CELL_ID_WINDOW_FIRST + 1) / CELL_ID_BLOCK_SIZE)
+
+#ifdef CONFIG_CELLS
+
+/**
+ * cell_id_in_window - is an id one of those the kernel lends to cells?
+ * @id: the value of a kuid or kgid
+ *
+ * Return: true if it is.
+ */
+static inline bool cell_id_in_window(u32 id)
+{
+	return id >= CELL_ID_WINDOW_FIRST && id <= CELL_ID_WINDOW_LAST;
+}
+
+/**
+ * cell_range_in_window - does a range of ids touch the window?
+ * @first: the value of the first kuid or kgid of the range
+ * @count: how many there are
+ *
+ * Return: true if any id of the range lies in the window.
+ */
+static inline bool cell_range_in_window(u32 first, u32 count)
+{
+	u32 last = first + count - 1;
+
+	if (!count)
+		return false;
+	if (last < first)
+		last = U32_MAX;
+	return first <= CELL_ID_WINDOW_LAST && last >= CELL_ID_WINDOW_FIRST;
+}
+
+#else
+
+static inline bool cell_id_in_window(u32 id) { return false; }
+static inline bool cell_range_in_window(u32 first, u32 count) { return false; }
+#endif
+#endif /* _LINUX_CELL_IDS_H */

-- 
2.55.0

