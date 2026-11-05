Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892669;
	b=OUOsVicnngr/yRUcHBwa4BlEQMjuVpkh/eb4igfWr59t82WYX4H6HVAm6S3n9UrICX7A
	 XqaXMTruy1IdC51iYf9sibETvQO10N47W0qnLx/bYRJ1UAtyX4mK4TuAZdJzi3c0rxVko
	 AAczCVTamztK12I/QqNReWpODRjqJU/uLlpRYxTPfwsrrXU/VrKoz5122bSkgGsJ/DQHu
	 gERQXBPY0ayNPdNKTy4GpzKbDW0pZCtKPObtb+PkpCSzfDqaq057FQB/y3DFY1lwzHFqn
	 DWIhJHCqMJz19XuV1CtJaVjcz/UEBnk6AykTFn6av79Di2lm9DMsyjpIl8OzbSb4orA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=3R2czUSj7k9mXzWp34vQ+UPKLXJTAziTv8XQt/Yq6WM=;
	b=jqNNQLoOr/wYQwVpdpQU70oT9niQcW/kIIOwY0ErbCQrXOz/ebxSz88LnM4pWp8Lxpmr
	 rZDIfGTu84WqxuZLDBSqZhHhktfUks2A163TuZETjx97A29nJvxeA66UpNKGoWNVlhfEC
	 t4FYVIKBw7aUWVxGkV8Fnug6Oa0Y+gBwgHxtS0cDolPs9oZBci0tRLO+RevGLzi1ke1+9
	 gq7/LJtjmXEkEhQQ9UiCjd/Zs9XbaFc/D274soaLPknWmCBNg3ZUDm0Y2zv7qVNCsKTJR
	 eK3hVAdM7sfS1vuN1WUwj1yqXbwpWFvS1NNhae6adzV3lbXq+ly6blgGlxsmQNeyJkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pD2eQjz9;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2F3606D805
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2F3606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=pD2eQjz9
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99911ead46dso909890241.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892668; x=1794497468; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3R2czUSj7k9mXzWp34vQ+UPKLXJTAziTv8XQt/Yq6WM=;
        b=pD2eQjz9nJ80ro07vuH5pQfZgVRFavWnMBp/qjChaKXURhrDaFD5wSK3G2H0eVv1Nt
         J+t9nGT8sOwIHJ7NrLgByIcN6dXJbB0DgXc5OTyerpuGm5DDGfOlORkCzDmZR233/trE
         BuAR67NhYb+TW2XPxyNbVkVmhX+zOF/a2mrVCTaTi3ncUshlMAZSySy92cy+O4sZiBXI
         z05WQkQJdU3jKwaHIbMUWy1v7XxmEAA1zO5TJwwnyycTXhXRLWXYITIrcWwxq19YoFvk
         J4a/1Ok17SjAebJRN+8BId6giSDYlVfN2Ugafwjr5+4w0HuqG6KpNjHi+KDTZOT1IWKo
         cU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892668; x=1794497468;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3R2czUSj7k9mXzWp34vQ+UPKLXJTAziTv8XQt/Yq6WM=;
        b=hDB34Gc6QASo9/3OocRTwyefxHyXQ/yPzPmGlI3OUZJn6oHA4Q2uipiidQH4SOAD4t
         WF+15OFXa0h+dH3FFu3AdyNEm0CaGyOjCybnwySxFZWruIETyUKiwKSvdjQLXjQBcNDM
         dZgNXOpLMwJbLPiDoPjUQ3AMhBh3Zp5Sk3IBVo+Qe6O5A8iNVr1QJPllbCLK6VX5TQ5k
         CyzqnaHuBS5TUSkgqzQb3moPYSQFRMICnJLDJ8VP84XfVw5aiv/8PIwreYohTQpjGvV/
         BbtF3prVUIcPFT7SnTgUQeKNec8MN7VbgRnMG4a07CL/4dVIIzEjCSOxI7zbm2FywP3y
         BJ6A==
X-Forwarded-Encrypted: i=1; AKwUvByxHQmRGQUexd4C3VUF3Om3rythLdPKTi8Bc3sP/7IATbCfWlB6LOlyoKHY0arlpkvN6d18uuTK03lBN5s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7R4+CZUHTZyyjuEGQ42GvqeTerGgF8Knyj5Ukt4lmG0dsMCmV
	E1bS1qvCnZoRXLGFYsdxTbC3DgboMJ9T81YgeFm1GJPjKRtO/DtiDS4b3QdWRiv8YDMN1B35BBp
	TF6Zx+2AJ9g==
X-Gm-Gg: AYBFou0qnPHsfif1R3HMyb6wFu6YEz/vf5wCRNnFSpa3Dw9l4FjbnGHr9bW6qIVid/V
	KbFO/cAqiQadwdG6P9K9NazrA9/pteghL2HM0srcQnR4Xx54UhvSWvStGrYtSmcXUOksGKf5s1E
	/AILaOoQ2Jrd7EncN/tsViXm2Hrgx6xKfxS3hiO3WFHOejTiNoQNvqxYDQZm5Ieee6jmTdByXym
	RSiR+XMtSYT7wpLbGWY5EgQTqfxsjtq+8UyoneszwTlr8KGs4OgFSSWIPvRnahEd6Jf5fvuEGwl
	0C1txl8yJGCrpC6tTg3W3+B6gm6q9kdpW/X+5e17Zmkbwg365tbvh/+PrepYj6WrjAkUBPQOiWM
	V3p1XODlvS0S76KZ1NSnWLwxQGrE4SkYl8lRPPKN4eNw8JOnX+Iy5d9bx4HfLzQLfj2gUZGpbkj
	HuSwdocbOGh0/caI/aEbAScmsiFjbdWOqM9NXJMJrqnmdRGrI4VBYXeaSTf4w2DvbMp4EykTuGI
	D0TICDJbfEgTWtn3KYxGho/5gz8TUWPSdL3KoppXHfTO9BTmmMgmEVJD4ATbFavV8HRaudOtVLL
	A7F3anc8eM+4UJh7Y3No8mJGBMoIoBXTtAspqo8F8cWl/WakwRcHPi4WvSvp8ozHVto=
X-Received: by 2002:a05:6102:1623:b0:7a7:b6a:b022 with SMTP id ada2fe7eead31-7d072ca6f38mr9775854137.22.1793892667951;
        Thu, 05 Nov 2026 07:31:07 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.249])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d277d13753sm3795969137.10.2026.11.05.07.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:31:07 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:03:16 +0000
Subject: [PATCH RFC v3 84/90] net: honour the rights of a cell in net_may()
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
Message-Id: <20261105-b4-cells-v3-84-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890936; l=4670;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=D8ckwWJwKp136ciWrSD/HHJY/nLRMwaP+d/bPdHDpiQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEpr6f5A4Th9ZAWOY4nnbD23a0amnyyfbAhKTCyZjxYB7yn6nKNcLP/3gcgqiYL3XvyG2WExMfh
 ZneBF7LiTswU=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

net_may() requires a capability over the user namespace that owns the
network namespace. A task of a cell never has that, because a cell does
not own a network namespace.

For a task of a cell, use the "net-rights" slot instead. net_may()
succeeds if all of these hold:

  - the network namespace is the one in the "net" slot of the cell
  - the builder granted the right in the "net-rights" slot
  - the task has the capability that the right maps to, in the user
    namespace of the cell

The slot decides what the cell may do, and the capability decides which
tasks of the cell may do it. An init can set up netfilter rules and then
drop CAP_NET_ADMIN before it starts anything else. A task that is not root
in the cell cannot undo those rules. LSMs and audit still see a capability
check.

The network namespace still belongs to whoever built the cell. The builder
sets it up with the usual tools and can enter it at any time.

A check that has not been converted to net_may() still requires the
capability over the owner of the namespace, so it fails for every task of
a cell. Anything that nobody has looked at is therefore refused, and each
conversion adds one thing that a builder can allow.

The rights apply to the network namespace of the cell only:

  - A socket that was created in another network namespace and passed to
    the cell carries no rights.
  - A request that names another network namespace as the place to move a
    device to, or to create one in, is checked against that namespace and
    fails. This matters because such a namespace can be named from inside
    a cell: a veth device whose peer is in another namespace gives its own
    namespace an id for the other one, and any task can read that id.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/cell.h     | 11 +++++++++++
 kernel/cell/boundary.c   | 19 +++++++++++++++++++
 net/core/net_namespace.c |  8 ++++++++
 3 files changed, 38 insertions(+)

diff --git a/include/linux/cell.h b/include/linux/cell.h
index b12e2f124769..e79ac7e9ec60 100644
--- a/include/linux/cell.h
+++ b/include/linux/cell.h
@@ -256,6 +256,17 @@ bool cell_no_net(void);
 static inline bool cell_no_net(void) { return false; }
 #endif
 
+/* What a cell may do to its network. */
+#ifdef CONFIG_CELLS
+bool cell_has_net_right(const struct cred *cred, const struct net *net, unsigned int right);
+#else
+static inline bool cell_has_net_right(const struct cred *cred, const struct net *net,
+				      unsigned int right)
+{
+	return false;
+}
+#endif
+
 /* A mount is idmapped for a cell. */
 #ifdef CONFIG_CELLS
 struct user_namespace *cell_idmap_userns(const struct file *file);
diff --git a/kernel/cell/boundary.c b/kernel/cell/boundary.c
index af67ef68d4a2..dd49a6e4b39c 100644
--- a/kernel/cell/boundary.c
+++ b/kernel/cell/boundary.c
@@ -104,3 +104,22 @@ bool cell_no_net(void)
 
 	return cell && cell->no_net;
 }
+
+/**
+ * cell_has_net_right - has a cell been given a right over a network namespace?
+ * @cred:  credentials of a task of the cell
+ * @net:   the network namespace
+ * @right: an enum net_right
+ *
+ * The rights of a cell are over the network namespace in its "net" slot and over no
+ * other, so a socket that was made elsewhere and handed to the cell comes with none.
+ *
+ * Return: true if @net is that of the cell of @cred and @right is in its
+ * "net-rights" slot.
+ */
+bool cell_has_net_right(const struct cred *cred, const struct net *net, unsigned int right)
+{
+	const struct cell *cell = cred_cell(cred);
+
+	return cell && READ_ONCE(cell->net) == net && (cell->net_rights & BIT_ULL(right));
+}
diff --git a/net/core/net_namespace.c b/net/core/net_namespace.c
index d211631f8c42..be29eddaa9a2 100644
--- a/net/core/net_namespace.c
+++ b/net/core/net_namespace.c
@@ -16,6 +16,7 @@
 #include <linux/file.h>
 #include <linux/export.h>
 #include <linux/user_namespace.h>
+#include <linux/cell.h>
 #include <linux/net_namespace.h>
 #include <linux/sched/task.h>
 #include <linux/uidgid.h>
@@ -371,6 +372,13 @@ static int net_right_cap(enum net_right right)
 static struct user_namespace *net_right_ns(const struct cred *cred, const struct net *net,
 					   enum net_right right)
 {
+	/*
+	 * A cell owns no network namespace. What its tasks may do to the one it was
+	 * given is what its builder named, and who among them may do it is whoever
+	 * has the capability in there.
+	 */
+	if (userns_is_cell(cred->user_ns))
+		return cell_has_net_right(cred, net, right) ? cred->user_ns : NULL;
 	return net->user_ns;
 }
 

-- 
2.55.0

