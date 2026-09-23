Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5716484882
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790203464; cv=none; b=ILW0YH7CMhY7mREl0IT9BP78yk3YgG5+t8LHJ1z1nCF0ZzqAA+/sDQxXYSau0DYJy05akO6JwkIvO3LfvFF+VL2JBfOBo5W7Le6evWzyKF9Bm+ReEkm+N/iP88awBFsS1Sgo23jFtoiliUbQddBwU4AtZeZURhBddpc4PX7WvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790203464; c=relaxed/simple;
	bh=5GEZ3ja58DI0UQj4lRPUu6xrAU32yO4Wnmquf2NfRBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d7WF1dvKoeZLagtR14GVXWPmUzQ/sgiMFyjWFvl1HL4hjIZbHnZMosJjDOv07/MljWYkjU1CJEjU8CbG9cgCjsIBfi10Bj/cK3y1Md4U9MfKTPWmZnenRSyrBikkt2FjPPZyJijqwGUC5g8kP+4Ffh5UoaFlKbHrhnR9YahVlp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLDWEyiH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLDWEyiH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117221F00893;
	Wed, 23 Sep 2026 22:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790203462;
	bh=XCYcL1R5NicLL/NhwgzYeBgYTteRbyS24vJmmzlRDaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TLDWEyiH4tsSHQ5jJ4W2INbg6NtCw24Nd55zZ1YffQlaEZPAogYwjP2a/jc2DrkPj
	 fXfbbY0AbOWflZJduor+NXDIF6D+FNeJF7fl8dSS/E5uP0Qr0d96bjebpX+f4ESMn/
	 iPGrG7bYGtfPO3T4UR+BK/3sz9bYHuMUdh/5T7cjpw4U7scGJJsTDgxf2jodSDjEoI
	 sKzZnyHAKe6jGpPk8E3MGJqmqx+C5rJILC4+9pbw+A1ID0OAaQjT1kgvaS4YzT/Y1G
	 pojgEXXMxey8NvFAyaDGkdrYwSbl0qyYLPQj7yrknb+ildxh1CLxjM3OlCEiyPkYsh
	 qIjtHZqFGtM2Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 1/6] liveupdate: luo_file: look up outgoing tokens by id
Date: Thu, 24 Sep 2026 00:44:00 +0200
Message-ID: <20260923224408.3745689-2-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923224408.3745689-1-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

liveupdate_get_token_outgoing() is used to look up tokens of
dependencies. It does the search based on struct file. LUO preserves
resources; the files are only handles to those resources.

LUO provides file handlers a ->get_id() callback that can return the
unique identifier of a resource. LUO uses it to ensure the same resource
can't be preserved twice if it can be referred to by multiple files. The
default ID is the struct file, but file handlers can implement the
callback and return something else. For example, memfd returns the inode
of the file, not the struct file itself.

Use ID to look up dependencies in liveupdate_get_token_outgoing()
instead of struct file. This allows the lookup to work with handlers
that use things other than the struct file.

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 include/linux/liveupdate.h   |  6 +++---
 kernel/liveupdate/luo_file.c | 21 ++++++++++++---------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..1cddbab50b98 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -253,9 +253,9 @@ void liveupdate_flb_put_outgoing(struct liveupdate_flb *flb);
 int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 				 struct file **filep);
 
-/* Get a token for an outgoing file, or -ENOENT if file is not preserved */
+/* Get a token for a preserved object, or -ENOENT if it is not preserved */
 int liveupdate_get_token_outgoing(struct liveupdate_session *s,
-				  struct file *file, u64 *tokenp);
+				  unsigned long id, u64 *tokenp);
 
 #else /* CONFIG_LIVEUPDATE */
 
@@ -316,7 +316,7 @@ static inline int liveupdate_get_file_incoming(struct liveupdate_session *s,
 }
 
 static inline int liveupdate_get_token_outgoing(struct liveupdate_session *s,
-						struct file *file, u64 *tokenp)
+						unsigned long id, u64 *tokenp)
 {
 	return -EOPNOTSUPP;
 }
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..51817d202ce2 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -950,29 +950,32 @@ void liveupdate_unregister_file_handler(struct liveupdate_file_handler *fh)
 }
 
 /**
- * liveupdate_get_token_outgoing - Get the token for a preserved file.
+ * liveupdate_get_token_outgoing - Get the token for a preserved object.
  * @s:      The outgoing liveupdate session.
- * @file:   The file object to search for.
+ * @id:     The identifier of the preserved object to search for, as returned
+ *          by the owning handler's ->get_id().
  * @tokenp: Output parameter for the found token.
  *
- * Searches the list of preserved files in an outgoing session for a matching
- * file object. If found, the corresponding user-provided token is returned.
+ * Searches the list of preserved files in an outgoing session for an object
+ * with a matching identifier. If found, the corresponding user-provided token
+ * is returned.
  *
- * This function is intended for in-kernel callers that need to correlate a
- * file with its liveupdate token.
+ * For handlers that do not implement ->get_id() use the 'struct file' pointer
+ * as their identifier.
  *
  * Context: It must be called with session mutex acquired.
- * Return: 0 on success, -ENOENT if the file is not preserved in this session.
+ * Return: 0 on success, -ENOENT if no such object is preserved in this
+ *         session.
  */
 int liveupdate_get_token_outgoing(struct liveupdate_session *s,
-				  struct file *file, u64 *tokenp)
+				  unsigned long id, u64 *tokenp)
 {
 	struct luo_file_set *file_set = luo_file_set_from_session_locked(s);
 	struct luo_file *luo_file;
 	int err = -ENOENT;
 
 	list_for_each_entry(luo_file, &file_set->files_list, list) {
-		if (luo_file->file == file) {
+		if (luo_get_id(luo_file->fh, luo_file->file) == id) {
 			if (tokenp)
 				*tokenp = luo_file->token;
 			err = 0;
-- 
2.56.0.rc1.310.g51773c2048-goog

