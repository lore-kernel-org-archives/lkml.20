Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A924E781B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731412; cv=none; b=k5rulYcgAZvMXPsuIy3qZ9kVPh2mOBifJIvMwtg/sPkbkV9H6Gd5gFDz2uvYiEL1Ouj6twdaJXXcXVRlKFgXTDmnJD2b9XHG7NPRDdTEMIb69q9E9APmcHFM3zLO2VFP2GxlmhnmjV9Iu+1N4W1lsbIxui5o6vDGEHdoZh3Uj7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731412; c=relaxed/simple;
	bh=3ET0knDUgnDsJMyjwUdtJJUBQcdsxUvwQA8gNlINT5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZEa02/dN/gkXQoflgR4uQ/lOTleML4Hl4C/IxwC8jqJuNArBV+Too09duVvyPciX9DaP3HcikG/yqt+i3+XjAw1U512/BrUwhH92CXnoS/ih5f5HsIfQLN13aUm63aeEzuEJID0N+mPiW6IIIDsjCAs11TMS6M7cALdoFac57UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AIGlSG+V; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AIGlSG+V"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dacf053eeso457326a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 04:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789731410; x=1790336210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EiY/TSJNOxMMy8e6PlWLzVlCOoeYw1PqDh74a6kOopk=;
        b=AIGlSG+VgagFYtuYU4jhf9YruN9U5c9o2xhM4onteqi5c5YKYrQ4xexFnyFpBlJiUN
         PHPe0VrGUk3JfzJIwrUdViEXnI0+W2WEl4gnHRnwJSpv89b9Ugdkdubcf7LfRvS9TIsD
         sNAPZnzptsn5fsmSg8PDz0bKEQVi23Pqswvg9De+p5vjuARn/lseVORRtSSNyNDpNcI1
         blEvVd1eQ9MYxPivOZq1kfRubWClFXmuGbjTdx7Ld8GHEd7U/RcaP08sDTc9cnI8TomM
         cgvs2LIdbKXswOIAMD738+m5tymxfo4diOFvpmb+g+L8p1/52/LbBtBrHT6PmR3UvBZF
         Y9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789731410; x=1790336210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EiY/TSJNOxMMy8e6PlWLzVlCOoeYw1PqDh74a6kOopk=;
        b=SnhiGltLSqSr90aX1/DNUB+OrCOPToyfhEl2RAzaJIkOejsnXDVfDbY1Lzf+VxkZh/
         xcCZjhQ6R/QZOz7f2L3cWNUKPiXJAF6N6AG3TUBJmh3zkdQfGsZ9abfbANUFiMJZZHjd
         tepL0/92/ME2+bCN8s3U6PVJ3+L2oI/rZ7u0gQu4teoMUkWtaDZPKEt2R/+4n9dOHJ9f
         AIwwAdEInQbCcwVbdXhHWzPN/P/e/EK3SD/KYsbEsteUs27THJk34GniC8nHtFXKAOwi
         ipjIo6i/r0zKUrAIJqo3Pk/gkJKgRrxDTqh+Qg/78TN6mg4f3gQxUtqjlRwB4Ctr9liF
         J5qA==
X-Forwarded-Encrypted: i=1; AKwUvBzYluq9hqvuL65/WYomylCe42RjvFXLOlsqQo0o/b/m6qiczrsp6nDVf2f4K2ZGdxJE3Fk/zREzYISAPYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++ngVeDMdzQwFX3IeNtvo4CbzdbmEyfIRwiooXONIrxBcHtqFNdW
	8Cobiagi09QBzZ6sxaYRhzOaMuIxs5BY7r6iP+dYZpKzvwIoafuHjUtd
X-Gm-Gg: AYBFou36Lx43fDDFyItjKpowxcQICw8+5JUirizazosU8UHuHIdne6ikYcKclDHOSID
	rWv9pwTd2HN6TdIrA+x4w/6+QEt4ouTCjalVBXVJXDK9o1yvH63//qBI4ZmpcPggTI/pM3l7KjP
	58cHDsgizAlXB6DfX1BSb5jsDCEhZrKiB3aBYuvM4XP7NOTfJNxmYsgQRe9EGuhZEIYMBtZVshP
	JkRhzhba4CfFZRAiJd66m6q+X7jJB3EQf+XBP3sJa/7bH6vHTZbTeNwvcRHZWCRMslM/Gjmvpxv
	vBOICqcXWRoRvxsXc+EZwwHB7+5z3vVSY1tmqfNUE/1v/ejs3djvw3DJR5B/N8Ui/emGwzMna2e
	n5RS2QUPhJhaPNHXogk/dpt+JU5BbQ9tBCDF3/vh9SccEn6Q4Mi/hTPdGQRjjzbML61biBOTV4f
	wupNDbPLdwKL7FYi2hBW1iNjnBz4wk2tSh52vGdTu/C6QYYoHsVL1SIMuIZK8hCllyM2iRy/Vq4
	gd/0u1t0KBv
X-Received: by 2002:a17:90b:2b8e:b0:39d:f024:c7ee with SMTP id 98e67ed59e1d1-39e5500a842mr4964155a91.25.1789731409674;
        Fri, 18 Sep 2026 04:36:49 -0700 (PDT)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c28723bafsm5137011eec.15.2026.09.18.04.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:36:49 -0700 (PDT)
From: Gokul K <gokul02k@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] KVM: selftests: Delete the unused sparsebit copy and count helpers
Date: Fri, 18 Sep 2026 17:06:29 +0530
Message-ID: <20260918113631.634233-2-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260918113631.634233-1-gokul02k@gmail.com>
References: <20260918113631.634233-1-gokul02k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sparsebit_copy() and sparsebit_num_set() have no callers.  Nor does the
FUZZ harness at the bottom of lib/sparsebit.c, which exercises most of
the rest of the API and still builds and links with both removed.

sparsebit_copy() was the only non-recursive caller of
node_copy_subtree(), which leaves that unreachable too.  It is static,
so keeping it would trip -Wunused-function; delete it as well.

The comment on the num_set member gives sparsebit_num_set() as the
reason the count is maintained.  The member stays - it is what lets
sparsebit_all_set() answer in O(1), and the dump path prints it - so
point the comment at what still uses it.

No functional change intended.

Signed-off-by: Gokul K <gokul02k@gmail.com>
---
 .../testing/selftests/kvm/include/sparsebit.h |  2 -
 tools/testing/selftests/kvm/lib/sparsebit.c   | 63 +------------------
 2 files changed, 1 insertion(+), 64 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/sparsebit.h b/tools/testing/selftests/kvm/include/sparsebit.h
index e027e5790946..8a2ab11dae6f 100644
--- a/tools/testing/selftests/kvm/include/sparsebit.h
+++ b/tools/testing/selftests/kvm/include/sparsebit.h
@@ -30,7 +30,6 @@ typedef u64 sparsebit_num_t;
 
 struct sparsebit *sparsebit_alloc(void);
 void sparsebit_free(struct sparsebit **sbitp);
-void sparsebit_copy(struct sparsebit *dstp, const struct sparsebit *src);
 
 bool sparsebit_is_set(const struct sparsebit *sbit, sparsebit_idx_t idx);
 bool sparsebit_is_set_num(const struct sparsebit *sbit,
@@ -38,7 +37,6 @@ bool sparsebit_is_set_num(const struct sparsebit *sbit,
 bool sparsebit_is_clear(const struct sparsebit *sbit, sparsebit_idx_t idx);
 bool sparsebit_is_clear_num(const struct sparsebit *sbit,
 			    sparsebit_idx_t idx, sparsebit_num_t num);
-sparsebit_num_t sparsebit_num_set(const struct sparsebit *sbit);
 bool sparsebit_any_set(const struct sparsebit *sbit);
 bool sparsebit_any_clear(const struct sparsebit *sbit);
 bool sparsebit_all_set(const struct sparsebit *sbit);
diff --git a/tools/testing/selftests/kvm/lib/sparsebit.c b/tools/testing/selftests/kvm/lib/sparsebit.c
index 4d845000de15..8ce230af4f14 100644
--- a/tools/testing/selftests/kvm/lib/sparsebit.c
+++ b/tools/testing/selftests/kvm/lib/sparsebit.c
@@ -184,8 +184,7 @@ struct sparsebit {
 
 	/*
 	 * A redundant count of the total number of bits set.  Used for
-	 * diagnostic purposes and to change the time complexity of
-	 * sparsebit_num_set() from O(n) to O(1).
+	 * diagnostic purposes and to answer sparsebit_all_set() in O(1).
 	 * Note: Due to overflow, a value of 0 means none or all set.
 	 */
 	sparsebit_num_t num_set;
@@ -269,39 +268,6 @@ static struct node *node_prev(const struct sparsebit *s, struct node *np)
 }
 
 
-/* Allocates space to hold a copy of the node sub-tree pointed to by
- * subtree and duplicates the bit settings to the newly allocated nodes.
- * Returns the newly allocated copy of subtree.
- */
-static struct node *node_copy_subtree(const struct node *subtree)
-{
-	struct node *root;
-
-	/* Duplicate the node at the root of the subtree */
-	root = calloc(1, sizeof(*root));
-	if (!root) {
-		perror("calloc");
-		abort();
-	}
-
-	root->idx = subtree->idx;
-	root->mask = subtree->mask;
-	root->num_after = subtree->num_after;
-
-	/* As needed, recursively duplicate the left and right subtrees */
-	if (subtree->left) {
-		root->left = node_copy_subtree(subtree->left);
-		root->left->parent = root;
-	}
-
-	if (subtree->right) {
-		root->right = node_copy_subtree(subtree->right);
-		root->right->parent = root;
-	}
-
-	return root;
-}
-
 /* Searches for and returns a pointer to the node that describes the setting
  * of the bit given by idx.  A node describes the setting of a bit if its
  * index is within the bits described by the mask bits or the number of
@@ -964,22 +930,6 @@ void sparsebit_free(struct sparsebit **sbitp)
 	*sbitp = NULL;
 }
 
-/* Makes a copy of the sparsebit array given by s, to the sparsebit
- * array given by d.  Note, d must have already been allocated via
- * sparsebit_alloc().  It can though already have bits set, which
- * if different from src will be cleared.
- */
-void sparsebit_copy(struct sparsebit *d, const struct sparsebit *s)
-{
-	/* First clear any bits already set in the destination */
-	sparsebit_clear_all(d);
-
-	if (s->root) {
-		d->root = node_copy_subtree(s->root);
-		d->num_set = s->num_set;
-	}
-}
-
 /* Returns whether num consecutive bits starting at idx are all set.  */
 bool sparsebit_is_set_num(const struct sparsebit *s,
 	sparsebit_idx_t idx, sparsebit_num_t num)
@@ -1035,17 +985,6 @@ bool sparsebit_is_clear_num(const struct sparsebit *s,
 	return next_set == 0 || next_set - idx >= num;
 }
 
-/* Returns the total number of bits set.  Note: 0 is also returned for
- * the case of all bits set.  This is because with all bits set, there
- * is 1 additional bit set beyond what can be represented in the return
- * value.  Use sparsebit_any_set(), instead of sparsebit_num_set() > 0,
- * to determine if the sparsebit array has any bits set.
- */
-sparsebit_num_t sparsebit_num_set(const struct sparsebit *s)
-{
-	return s->num_set;
-}
-
 /* Returns whether any bit is set in the sparsebit array.  */
 bool sparsebit_any_set(const struct sparsebit *s)
 {
-- 
2.54.0


