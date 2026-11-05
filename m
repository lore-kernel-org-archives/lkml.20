Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890695;
	b=wRZ5VryFJfyzK9LfGfEpZ+U9tHfOkQKEo1SS8PnTXqewdsI8kJL+0qrNrbtIDaV9vykP
	 HxWoQdK9+Z0p2d3+PUt2vzIK6Bd9IuQRot1MpBLKK4GtD6BRIVfhPSqrYG4RiD3h3dsmt
	 oJzDdsdBvWPXMY1ACTxvLNXM0Bybama7Vmlho1YG0R1XLztFTiyzQ7E97NxNnXdJD1Ma2
	 1p8uib1I1im3OoEHdl1wfL9wcgv3lKa2iEOqPanKCKibLkOGdSfgsSCCYedaOsTLxVQeU
	 b5/eF5Xd/u/ZHLteUit8rpo5KcEB4eoEWZIpWoeXZeey214856vfqZszcA7WDPBEpBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=n8KlRql37zZhzcrWtiUq/YJzuLrtZ3+UZAwWXCQZmLk=;
	b=y/Q0W4UvO3gCOJMfIYe2XV6NKO0IematgT1rUuP7w2I1BFeGuQp47bgl/V2ROZ4b2zLP
	 JsMpH+PJRXRquCPXybBrcc/lNsSOKPUs4QzPBi0TEVTvFl/kx2PWJAFDm8ofg1KWvOtFY
	 7GqG777sSUgjNugZX+6fOpQH59F/uZrmRiaAPdau15ZcpJkIZ8SkLkwEeAdUta7ShtxCh
	 bTDASwUWS4I+IFO5+bOu9LTPAK3PKZPZTfiVZpmNCDRaB661AdijRLtUrYOvPRILN3AtO
	 252Qdy61v1i0N1tkC7sehxLATifWmIA4zuWfAYHIU1I92UtbXo07vL0TvnTohmzXKXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=nsnvqRkc;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D521A606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 14:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D521A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=nsnvqRkc
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-823e4047037so1411206a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 06:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793890694; x=1794495494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n8KlRql37zZhzcrWtiUq/YJzuLrtZ3+UZAwWXCQZmLk=;
        b=nsnvqRkc77TVsfXyMlj6CiiKo+ONWgJ0s/rKHnhL+CfnjAoUQiNPJg8suJ0xmaUIVk
         eq8d8VlQoIGKC7D7MbwbzPGETJpUeI0/TB/qSHZhHSC17CD6T2EUPtHGkSThuOi2j0Ue
         idhvwi4f4IXhh96MHL9TmkJjhNRFxLGRQCJKrlhd2xAl3r9MqLaPW8XfSqDiSELy5gHd
         RVuaMlRS9CVFnPP+YI+tj6rbapS5Xq6K0gvhh3LWV2ofyBUu7i24FvICTn9AaoBr7aCd
         Kk8Z0wGxsgSJYiopKAMQJ2OIwFamM6uL9Lt51fwyR3khnxXH2NUAkMf9LWq+Lxu8frwc
         UCVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890694; x=1794495494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n8KlRql37zZhzcrWtiUq/YJzuLrtZ3+UZAwWXCQZmLk=;
        b=YvUtrQo6BPI24z/nwGCMAZG2/KNaT8ZhTki+Ndm9zBkkDgJTmVB3lnTzW4iYIAjkR1
         g0LjAGoV79xU9Btn4A+r3Q9pn7h1Fl0rvFAV3U7tUvQ0/GHY9RKt4HDVaq7Pc/G7F8/G
         TgfvgqA9nImXuKl4WOTgmE2NghcYBtNyls5PBOqrn9LhGqkaiBnMtmUFbLdJ/N1c2dts
         6vtNTfwlAtM1mbUS/C8ajJ+/s8hlOE5T1ha+n0GBZWo/othAL14ZBz8HxJdXlQEtuA5U
         bJXTv4KAzIUzkFnUUkx+rUDKZYz2/B7H0CSNpxEZ+CtkS3XTR6B8/j6HSk7Wg1EwHAau
         6dtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRirhbAlFQPFtWbiKtiKdIg+aPYKnPYhjXlAIlLCuJsXl7AxyDJ1+dHAg/ICNkhe211KDvVTvBDTPBOW0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8X4J6ojTNQNgXAGu140Gpnbo7d5vCwwtAWNw6GnCU734RH7wkF
	TD9JiUK1sE28e6tVyr0du1mjuGIN9y10CcfRPuTHthsFo20dVE6TsM7gazOdBjD4JH0=
X-Gm-Gg: AYBFou1u0Iey9/w1f/jEEWYEyvHjIZ5GaRe7FuxVF/pWCmtHbaGOFuv8s2YiTEfJJE/
	Zp9//pIYrdAh1m3TFRxhym2U/xS+8laR9WmSPjhKR9KMuwLS/pyViTdMZH/zGdG9gkA20Lzj4G0
	SGQC/mtAlS+/F/nqGLO91onQfVxsa8YhHXrY3E4g9LODZxYj6N1NmmPYQY6RyhLI/0CfDPc/mxd
	xepcHalb9gma5u9WcqSSvEGDRVqnCo7JqL42QCRmIM5bwA7maLWnJTQr4UV/0h0/PPXjJHg9zfD
	ttyTg11FV424MZlZ54lRQNTBOsHyUokN4RauKpOOjqjuZ8irQZw+MYujxFR2ZMw3gdQ739MZX27
	hIg1H14JVhdHSvax0IU6IVFgdii6fNupYlonZ5It7P61Jik/nnTtBnQw/7lk5Vrs2dyAJ3au4hj
	2zbo8dSZT6TnKt4oyatatBiv2lC5DQYPG0peM1zP5uFd8i9w3kcr31ANTONB0ul6kbdb7lUDrMk
	IMECouNy41o7QE8bctw50t4746UZoV5QVYv7j0C1wKMsWq1lBAgkIpUL7dkYrFdYyorCL/alXkE
	6OIsbT6YqZwQsvlL1/kneD9iPjzqyxqK4a0oxdOhSyhpeA==
X-Received: by 2002:a05:6830:2e04:b0:84b:c230:c2c1 with SMTP id 46e09a7af769-85d36400d05mr20652432a34.18.1793890693809;
        Thu, 05 Nov 2026 06:58:13 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.243])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3dd8e0bsm4540509a34.11.2026.11.05.06.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:58:13 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 14:57:01 +0000
Subject: [PATCH RFC v3 10/90] user: add uid_range_in_use()
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
Message-Id: <20261105-b4-cells-v3-10-bc9095937a84@toxicpanda.com>
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
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890670; l=2228;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=A67jx9CN/4Nku0qN6fflC+v+zmDOHx7clVwYdMOrGpM=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QK3+61hDWhWuF24XmZdX33PUUniNQ+qb4CC024OSRK4VSnZzOg/HR+BcK7Hd02ot1g1Di/MY3iO
 5QtAcjdYQCQg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

A user_struct is looked up by a bare kuid and does not pin a user
namespace. So it can still exist after the cell that used the kuid is
gone. If the block is then lent to another cell, that cell would find the
old user_struct.

Add uid_range_in_use(), so that the block allocator can ask whether a
user_struct exists for any kuid in a range.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 include/linux/sched/user.h |  1 +
 kernel/user.c              | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/include/linux/sched/user.h b/include/linux/sched/user.h
index ec262b605437..5966e355db9f 100644
--- a/include/linux/sched/user.h
+++ b/include/linux/sched/user.h
@@ -55,5 +55,6 @@ static inline struct user_struct *get_uid(struct user_struct *u)
 	return u;
 }
 extern void free_uid(struct user_struct *);
+bool uid_range_in_use(kuid_t first, kuid_t last);
 
 #endif /* _LINUX_SCHED_USER_H */
diff --git a/kernel/user.c b/kernel/user.c
index 21bafdc11379..b69cab2a5a3b 100644
--- a/kernel/user.c
+++ b/kernel/user.c
@@ -154,6 +154,38 @@ static void user_epoll_free(struct user_struct *up)
 #endif
 }
 
+#ifdef CONFIG_CELLS
+/**
+ * uid_range_in_use - is there a user_struct for any uid of a range?
+ * @first: the first uid of the range
+ * @last:  the last
+ *
+ * A user_struct is keyed by a bare kuid and pins no user namespace. The id block
+ * allocator asks before it lends a block, and before it takes one back.
+ *
+ * Return: true if there is one.
+ */
+bool uid_range_in_use(kuid_t first, kuid_t last)
+{
+	struct user_struct *user;
+	unsigned long flags;
+	bool ret = false;
+	int i;
+
+	spin_lock_irqsave(&uidhash_lock, flags);
+	for (i = 0; i < UIDHASH_SZ && !ret; i++) {
+		hlist_for_each_entry(user, &uidhash_table[i], uidhash_node) {
+			if (uid_gte(user->uid, first) && uid_lte(user->uid, last)) {
+				ret = true;
+				break;
+			}
+		}
+	}
+	spin_unlock_irqrestore(&uidhash_lock, flags);
+	return ret;
+}
+#endif
+
 /* IRQs are disabled and uidhash_lock is held upon function entry.
  * IRQ state (as stored in flags) is restored and uidhash_lock released
  * upon function exit.

-- 
2.55.0

