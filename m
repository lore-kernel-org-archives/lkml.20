Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891542;
	b=hk3axb4zSfH2v4OMCF+PkmjHVcVPo2khem1bpSl2KDoyW/Cweg5Y2sCX6+pnVdh0HU/d
	 BYSK7M5P0ePWQ8qYFjZgfBXpuiMoNU2xxxi2iGlIzUoCRMUTOKDJRRyVY7KwlK2/1DV8C
	 he/9RDju6WhmTwgkFQ3BVfEwqw7C2wkHwvzbfAIuXJzvJgn2CnDqJYMRdnVXSBefzZtgp
	 UFeBtP5Pj1oV0Q/UaUVPyZrt+dgl4tTTmOuJx88+coL+9+Oe1c6d9B7N2QjpZM9GmRiOn
	 o360XjO+yiXVWphJg4vj6rTDH7iyHrLc8ZODE5fjeIAedmeRSt/nRdtKHFHEHSYxzbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=V4WHyIvQaAdoYwRYFnVyolgGRmHVGVpeDa+ix25o1vs=;
	b=PLGWOWuiFpin9kl1FmkvzHVi+OsqgxdJhPVubzVMW2hIROrlWI0rPZ+5UhVJbjThAY0v
	 k1IC8m3yQR9dY6Bnx0B5c2YGPNpGCh2XD90Xl7J2TUIDRxTi0IJ6gV/pQfguiPVnN5i0l
	 9wu6UKGEw4p6D+vipq59a03IhphdJZRje7As7S8J5P0R73W/NQQMZcpNdKtnaoT3sB8Wj
	 e3mCo58zVtGi0PG4GOXOQhToQYWt4psY/PZJr9Xgw3sWBIcqmpdaq4A+AmEu2EElTzACP
	 ZFjAiQZScgSTxGGWpEfpatE6uqYAC/goqY+en1nEuKBTF92p2BLPwyQrtf4rrFWRuEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pGbHnTdh;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB331606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:12:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB331606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pGbHnTdh
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ea0c05c92so3868886d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793891541; x=1794496341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4WHyIvQaAdoYwRYFnVyolgGRmHVGVpeDa+ix25o1vs=;
        b=pGbHnTdhsok8r9OPns1EZUkpxWpon2zuI/+n+6I5fvXSyKNz+sRiSKiNZYiunH+5Fw
         r55ANM7Y/X8ljRrrIBj6zPtCiMn7Nh6AIhtvQKCPdrWp8vDKg2NsW2OdYX0hAIID+8jj
         EUmLmujGpMS9tsYmughyFUFJE+kAQoiyLWj4608HOKgYlBAeo4+bzY7Qlhdnn2mIMI7w
         GYLZziI5o8FvtCCxrPLhVFK8hO5CZtCxsic6z0DZeXnKhzS/6XkHNvoqdlO5NHmptKb1
         RwVB39w//ZvJxQZ842rN06ke3Vli6MG/ysyKQsFboGZVQkvLiYme5nQyaLw6PHlEq6KK
         BzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891541; x=1794496341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4WHyIvQaAdoYwRYFnVyolgGRmHVGVpeDa+ix25o1vs=;
        b=H+l1iAyhq3YAEREVAeJ6KEBubiuiWFIJh28KKJ+QN9/3q/wtdXKYxflEV4kwYkgQGO
         GJwpBPnth/XG/i0eLeL7biA3DoRaZv2p56BMtBTVaNmulaMhIUFspCf/kScBIzQHnsUi
         9EfJc4M/ZNC2toHQjRl7C9RlE41yJo7oEiZBDt85YvqEsu02nuKW+hCmgCIQGmdjN79O
         GQQLno952rhfin4T/5LPRGuVFVpU8l8w07lNUKo3LCbKOgG6oItD8hS438voGSDR/cMB
         HspDK8kPRz/V+9mHccierDjjdwrTGuPI3Qu43FE22UbitPQxDUqpt7iXBNWngqFjt2xJ
         Nedw==
X-Forwarded-Encrypted: i=1; AKwUvBzxnD+JgsBkrGuqM88fDhG3QeJQv5jy59ev8VyxExRynTPHpwEKVdJ05uCVh00dZvm1imWYXnYS9QUYZ0s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZFZWJr49Gq2Om/YnWd8+j1Zqgjyb/ehhOf10iCUDPxxS75Vn9
	76i2mO00I4MuL0Q1LxLlispusWxLPmtC9A1U0ewIRNBeqYZY+RI88UTOFBjFS31ZuIQ=
X-Gm-Gg: AYBFou2nIgTcKN3Rvj6z5o18u5Z8MAXAeinC1hGzrqFhqeHrBgQhf2LeNEy2SI4MBXl
	+/mjGtdZ6LmyEZ1Wwwm2LIX4kid5Xjb4CUUiC5ce0WUsg+qD8LsutfXZAGuSL1L4BFWs6WN1xXk
	99aO/z3qz6c6BYFxcIT1w2mcuh8yhBAbghNRIMSonm6y33CuQZtfweAJoj1ATjzNL3f0yJ0VvIG
	Da8Cu13hlSRWnaxDox5wHKRxKSaMqI4QObgCiE59qNz4JCk3ogbKE8mziWkLOdVWLMCvqrfZ6h/
	JG+BGh15Cns+5qZqZiS8CwQlUNuq4vukS7JBkMOEWacHg6x1y/MlkQFfY7mMXppkENODADjcxSu
	v9iSGOIOzMQQc9QXQt001/uwlkUO7i0NOensJl4TjB14lUxSY88UYcpjnQfHdUek+zJx4FLU+Dl
	opwlrXWvFMZUnjNxH9wVls/fXbpxIrfzh547ABCHM7JjEhBDkZHZZYov65euAEFa4zZ25ABt9G4
	zstgx9HT+92KZ9vIARKU89AN/DTszFZPZSAhMVZpKiaFhywWQP+qeTKQN2dXlzF5H1scHwqwLHX
	8+2zEfD9cwZmfLskxxgFYfpQhfFFJzEpVe0br6kTABjJpSw=
X-Received: by 2002:a05:6214:8085:b0:91e:a362:fde4 with SMTP id 6a1803df08f44-91ea363000emr7929156d6.58.1793891540793;
        Thu, 05 Nov 2026 07:12:20 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e896f09e3sm39078106d6.25.2026.11.05.07.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:12:18 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:25 +0000
Subject: [PATCH RFC v3 33/90] cells: add cell_open()
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
Message-Id: <20261105-b4-cells-v3-33-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890933; l=3051;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=B2imLtKNARjJWVxJxwFWtkVKDNE3L9yp4pb6wUxpIrU=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QDKtzBzGvVrcBEkDqKW7vDWS3rqDDM/GYdB1J//ywLymILBa3r1bwCqd6RPt/C9NCmMUepLYf9f
 CqmoPMyB/IQI=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

Add the system call that returns another file descriptor from a cell. For
now it returns an nsfs file descriptor for the network or the pid
namespace of a cell that is still being built. The builder needs these to
move a network device into the cell and to mount a procfs for it, as it
would for any container.

The namespace is created if the cell does not have one yet.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/uapi/linux/cell.h |  5 ++++
 kernel/cell/slots.c       | 61 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/include/uapi/linux/cell.h b/include/uapi/linux/cell.h
index 22337cab3da1..3c10c9179289 100644
--- a/include/uapi/linux/cell.h
+++ b/include/uapi/linux/cell.h
@@ -30,4 +30,9 @@ enum cell_state {
 	CELL_DEAD		= 4,	/* Nothing left. The status can be read */
 };
 
+/* cell_open(): @what. */
+enum cell_open_what {
+	CELL_OPEN_SLOT		= 0,	/* An fd on the object in the slot named by @key */
+};
+
 #endif /* _UAPI_LINUX_CELL_H */
diff --git a/kernel/cell/slots.c b/kernel/cell/slots.c
index 81f43744e858..0a406422ce34 100644
--- a/kernel/cell/slots.c
+++ b/kernel/cell/slots.c
@@ -302,3 +302,64 @@ SYSCALL_DEFINE5(cell_configure, int, cfd, unsigned int, cmd,
 	}
 	return -EOPNOTSUPP;
 }
+
+/**
+ * sys_cell_open - get another file descriptor from a cell
+ * @cfd:   a cellfd
+ * @what:  one of enum cell_open_what
+ * @ukey:  for CELL_OPEN_SLOT the name of the slot, "net" or "pids"
+ * @arg:   nothing yet, must be NULL
+ * @flags: none yet, must be 0
+ *
+ * For now only this: an nsfs file descriptor on the network or pid namespace of
+ * a cell that is still being built, so that the builder can move a device in or
+ * mount a procfs for it, the way it would for any container. The namespace is
+ * made if the cell does not have it yet.
+ *
+ * Return: a file descriptor, which is close-on-exec, or a negative error.
+ */
+SYSCALL_DEFINE5(cell_open, int, cfd, unsigned int, what,
+		const char __user *, ukey, const void __user *, arg,
+		unsigned int, flags)
+{
+	char *key __free(kfree) = NULL;
+	struct ns_common *ns;
+	struct cell *cell;
+	int ret;
+
+	if (what != CELL_OPEN_SLOT)
+		return -EOPNOTSUPP;
+	if (!ukey || arg || flags)
+		return -EINVAL;
+
+	CLASS(fd, f)(cfd);
+	cell = cell_from_fd(&f);
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	key = strndup_user(ukey, CELL_KEY_MAX);
+	if (IS_ERR(key))
+		return PTR_ERR(no_free_ptr(key));
+
+	scoped_guard(mutex, &cell->lock) {
+		if (cell->state != CELL_BUILDING)
+			return -EBUSY;
+
+		if (!strcmp(key, "net")) {
+			ret = cell_make_net(cell);
+			if (ret)
+				return ret;
+			ns = &get_net(cell->net)->ns;
+		} else if (!strcmp(key, "pids")) {
+			ret = cell_make_pid_ns(cell);
+			if (ret)
+				return ret;
+			ns = &get_pid_ns(cell->pid_ns)->ns;
+		} else {
+			return -EINVAL;
+		}
+	}
+
+	/* Consumes the reference, whatever happens. */
+	return ns_open_namespace(ns);
+}

-- 
2.55.0

