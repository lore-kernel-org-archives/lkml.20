Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890722;
	b=wzSHWOarIppff/K3e4M+c8DluZPaUIcMxx3yL6wzJTMuWOHV3JmQ4QvsLbS4vMCPfaYt
	 udWcXSzCh0PtopmerIE+o3FcEfE1J1zOUyXlOVcSkRfN+WTZPsmcQlpXmOhtDf3H6iZPK
	 HM+x5M99PUMsHpC1iPyLRdXcucowhrTocAIX5PeL4neoezqihgsPMqRHLY70xWgFBDdfR
	 nVJa7PsDx9KutKdtrU51m6J+z7ArnYBq5u2Z8mLXi5Wr4x1MOJSn2JbpJqmFTdsa6Qa/p
	 ONQ8zWgKsehbbosY9C3QbWmZ1G3bWO+T6cK41oLAKhi+RjtqHUaItfVN9kZ2MbD4pOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=GXf1OlJCBQmaXmhy+CXLnH1C6s0TuF7O4mjKSnLUX/0=;
	b=QKgtcE/WXLy4NkZGMtMngBC/0N+gG0a5hIERtC/3OPmGwUY5RqbmC1mtP4S7LxcwedJu
	 QfqDw62fJ6Qb6SwPN1Gmla4xA3A79xt0AGRkWwiYifieY7BcWmCDiU9U+UdE/atDNNzak
	 DeleB8mqmX9w1pnEBsFm7jCVIt5GLGETdArkw0nvG28GfQtbMFsao3j89j9VGhEfH07+7
	 FA7IBgBWQd4sa9/t6lQyRPlUmDBIgi4Lo91i62/OjKfY0R64ACgu7mguOFSBYGbAEsTDL
	 /1bsiH4k6jxyizLlx0HLhsoiyANJSfRHBwT9T2sNnnNNe+DJGPGZFysJja4BuLIC9VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Q1YEybis;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FBB606A33F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FBB606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=Q1YEybis
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917aca1aee5so23982876d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890721; x=1794495521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GXf1OlJCBQmaXmhy+CXLnH1C6s0TuF7O4mjKSnLUX/0=;
        b=Q1YEybisqf9RratfUVhww3ffmdabO6RJUlY0jEz2D9vkyQxAVyei5+myI7WQhg0S+Y
         JCapHhQqvsM/oIYbE2RENSxJ3FGNEGWqDUFl03gN+5ev1ks4eXcAbamzT4rn9r7mcE1K
         TyN0WGwROnpEusPea82iudPWn9jf38feFz5JJuof/4EYyPSLtBgAzOjK0Q8LV78vt1yg
         J0WQdIKh6SpHrC5t7vgS5AKlm4eS/pI5S50AsRxZm7vRCoc+or1rjAbie8QaTkqUj3BT
         B1/Dz3yLnQxBOGH8CnxzPhQ3FYg2OFp/U3koyp+I/BYWI0C85CIEx///RwqiVKWi8qJ9
         a+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890721; x=1794495521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GXf1OlJCBQmaXmhy+CXLnH1C6s0TuF7O4mjKSnLUX/0=;
        b=Aml+Uc9bsH9+u9o2/SO6wJ7kIf1UaVpkyaNrKXr8zBiU8Ld1bp+ZsCzin5e52HIrA5
         SBzhJFKn7xHEfwtd6YThtxhE8yoqnA9TbDSO9kmkOkCO6wSLlkRvlpqw5a1uNHTRoaqn
         2oVeWjUrNG2TDYppLXO6S477MKcEXinlnq+NmMePOwthraOjZxJ1Yd0QtNACIY/RDkZN
         11MOkFf1CbXMEN6ewByxw/uJ682/lht/wTAmF7YNLS72+0tni96G4jdiXg8E81fzR0Wl
         uj71dwiOIjWcUfpL49Sf3wzZD+ifZR/LcOUvAIYswmgaA+ZAo8kkduUTB+aikmiI37SY
         lXgA==
X-Forwarded-Encrypted: i=1; AKwUvBz6S2Fxljd9e6ubmE7Jo9v9dLS+wNaVNEKtZX8Yw1WF4XpyR+XvQYBqgV21h3hBuHdwVFCTusL/bT9DZl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9f/89ZmnVEZ0OpTDnPQQJMLA16DCzQ8PK6Y1uVrN4vsZNlFXS
	XIAIqxqGq0gMutZHJdT5FELJFTImUXtrMJRq5Qk98EVv4FGWI+/IiHL8wLyINh0eg04=
X-Gm-Gg: AYBFou0n3RxMW2pQfnwMkh4yS6W8Gc5P0hehwYZ2dUV0DgpqCsNLU+dCpSFtFuDyYgy
	CGLLrxAe8PhfGhDfzMT+G0tghNIKRGfKayoox/kKHDk1eExF6rc3lr+v/6WaVKZeSEJDfYHu/vB
	oo11pB+7clC2zHF0EMLtv4I0FCGfyE6Fk6++nKEXzlst0pgeIHD72iGoACOPISGDhhajhpgcqqL
	Q1X2TF1gYCEnttrIwn88iDIKaUjZIDAcMrxe9DMXC+ChpsRq0m3Kn13bkF5hVpg0a1idLrasPdE
	x2b2I/Hhoqw+QHELWDRRKmHFPqSG77+mSwVZRmkPhxaCR3SRvqcbz7HkjzrXj6Zs/2KaPD5NUtA
	vH4W9vzNFN9fdfbbdmppPEhfud461lsJMkW8xZPv4wgjFXfSd+b5ohUTd1EOQnt68/3CsnSxCIa
	CAMuZ+QokeU01uLHV1klWYKw1OZP63BcuRBU9ewLBBvotX2fBa4sdfodYEH1ZSFS6QGFSm8JMSU
	nfXj9kHViZkpNYPhBTeOVIA5QvIgLJN0wbVI8KUREnNdr+TxnMJ6aOQUp4mevmS4cPj99Xd+UFK
	j+6MLVRDIzOc79Id2mlQA/b2iBMnkqoqzwzxlF7Zg2iJBg==
X-Received: by 2002:a05:620a:a90c:b0:945:d852:15fb with SMTP id af79cd13be357-945d85226ccmr643932285a.69.1793890721539;
        Thu, 05 Nov 2026 06:58:41 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.242])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d4691a76sm480799185a.4.2026.11.05.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:33 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:13 +0000
Subject: [PATCH RFC v3 22/90] nsfs: make open_namespace() available outside
 of fs/
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
Message-Id: <20261105-b4-cells-v3-22-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=2897;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=Cpw5XQSfeFmZprja2NttUNWqBgRPkOiqn9DKgMo3mh0=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD+MLZs/TNSwTZKPOX+qke7bv+zAZmNRB+WjjWQ7blBmR6YEQpDrGqRPyvBZlkRia4JYKMoU+gu
 W1AUe+gcDXw8=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

While a cell is being built it hands out nsfs file descriptors for its
network and pid namespaces. That code lives in kernel/cell/ and needs
open_namespace(). Move the declaration from fs/internal.h to linux/nsfs.h.

The name is too generic for a function that is visible everywhere. Rename
it to ns_open_namespace(), in line with the other functions that are
declared in that header.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 fs/internal.h        | 1 -
 fs/nsfs.c            | 6 +++---
 fs/pidfs.c           | 4 ++--
 include/linux/nsfs.h | 1 +
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 2ce49dff6ee1..8446aed78466 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -251,7 +251,6 @@ extern void mnt_pin_kill(struct mount *m);
  * fs/nsfs.c
  */
 extern const struct dentry_operations ns_dentry_operations;
-int open_namespace(struct ns_common *ns);
 struct file *open_namespace_file(struct ns_common *ns);
 
 /*
diff --git a/fs/nsfs.c b/fs/nsfs.c
index 8179d69da038..2c7165bb6739 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -113,14 +113,14 @@ struct file *open_namespace_file(struct ns_common *ns)
 }
 
 /**
- * open_namespace - open a namespace
+ * ns_open_namespace - open a namespace
  * @ns: the namespace to open
  *
  * This will consume a reference to @ns indendent of success or failure.
  *
  * Return: A file descriptor on success or a negative error code on failure.
  */
-int open_namespace(struct ns_common *ns)
+int ns_open_namespace(struct ns_common *ns)
 {
 	struct path path __free(path_put) = {};
 	int err;
@@ -142,7 +142,7 @@ int open_related_ns(struct ns_common *ns,
 	if (IS_ERR(relative))
 		return PTR_ERR(relative);
 
-	return open_namespace(relative);
+	return ns_open_namespace(relative);
 }
 EXPORT_SYMBOL_GPL(open_related_ns);
 
diff --git a/fs/pidfs.c b/fs/pidfs.c
index 114d2713a79e..ef305cc359eb 100644
--- a/fs/pidfs.c
+++ b/fs/pidfs.c
@@ -709,8 +709,8 @@ static long pidfd_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	if (error)
 		return error;
 
-	/* open_namespace() unconditionally consumes the reference */
-	return open_namespace(ns_common);
+	/* ns_open_namespace() unconditionally consumes the reference */
+	return ns_open_namespace(ns_common);
 }
 
 #ifdef CONFIG_COMPAT
diff --git a/include/linux/nsfs.h b/include/linux/nsfs.h
index 731b67fc2fec..4cb87c7644a2 100644
--- a/include/linux/nsfs.h
+++ b/include/linux/nsfs.h
@@ -23,6 +23,7 @@ bool ns_match(const struct ns_common *ns, dev_t dev, ino_t ino);
 int ns_get_name(char *buf, size_t size, struct task_struct *task,
 			const struct proc_ns_operations *ns_ops);
 void nsfs_init(void);
+int ns_open_namespace(struct ns_common *ns);
 
 #define __current_namespace_from_type(__ns)				\
 	_Generic((__ns),						\

-- 
2.55.0

