Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615149;
	b=zRexJarSog2A/mxe3Jd84JqmokpZ0WEeg80mpMBN5SMRtbxXruD4oQwEylZRThRbFoH5
	 eFi/3Q30j+mSY72KcmxKlLk73o4pCKPrIvexA/CurVvnPLz7unr5l8gXbg/o5bhMWsutE
	 XiHV6EaJSWUvnNI0VvipfbeqVZuFywWpg9MqHlGcu+5r/tQZWtAjKk38DBSXkQch/TgF+
	 edcce/HJ5/bb2CSMbkyPclBM63ySgAYCaW/J0pDfYQlQMDT2AQLeUMvE3ukArWnHWJVDm
	 PtqDnTazrcfHBYqijwhFRZIwBXOO0jdeSXZJ2qI7n6SuFTrHJn/7wNfC+j4q78+gvBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615149;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Cc3tw4XUQRsg/newZjc7/GNlV33CEjPbr6NtBb7HM8M=;
	b=GisZkaNBaylbshslh0tCRK7cFBrBkihNSKqsX1ZRDnoVHs66by+3FEf555jUJfb7Ql8I
	 HaoO7aI7v3ylWUT7sG80nZCoeHlp3+k0RY/Usw1crAUzXp2DTRiV05LqixFTpyvY5DDp3
	 lisfhyu61CaqrPCg7lQ0tf1MPs0ArZ/LKcQAvbyMaaXaBFdSy4xH6zMqDsBB7CSuOVocx
	 2luoC5+RNzXOxXvtghhlZImGwUuToHPTUOyGMGNedXvzFbnieLID1mJXQ4kMqWOlJyWVR
	 QMu6xHM2t+w6kw6qv06l2udsFiOwWtwBCcSb+OK7uoQvPvxZ6Sr6bRb5psbU37X0HCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gvl0aLAQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26524606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gvl0aLAQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60B881F00919;
	Mon,  2 Nov 2026 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793615148;
	bh=Cc3tw4XUQRsg/newZjc7/GNlV33CEjPbr6NtBb7HM8M=;
	h=From:Date:Subject:To:Cc;
	b=Gvl0aLAQ/4pOp2zftBjhUVRTGuv40qRv06GquPhWfiwYvlE+VgwkJutocmwAgB1Jo
	 TUd49ygwX1LdEPBGmcoaHhByc+8bjVnz4sRgm2FjjgC42aevaR63JGxkLMRwMe+gq0
	 mdkIwJPJ9muW/1Dvna8hKAFFIicV45iCkjnuUrArj4vA620S7ZSrqbCW3NuZayKjHH
	 CevnUG7VsIXIoeHgMZ12pEmkDBTwWKsC1MlwC482hLtRFNx6GkuzNyedtdON0CSp2t
	 4+PkQ7+END0pR2NNeZImx3wyEkB6n+n7lv30tS/x/fBc+t0da/O+yHskbzyLfarV8D
	 yZ8UE8WqqgzMw==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Mon, 02 Nov 2026 10:25:20 +0000
Subject: [PATCH] mm/vma: read anon_vma carefully in validate_mm()
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
Message-Id: <20261102-fix-validate_mm-v1-1-5c309614ef15@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMj3bTMCt2yxJzMlMSS1PjcXN0kc0tjgxQTQ2MLiyQloK6ColSgErC
 J0bG1tQCfp37bYQAAAA==
X-Change-ID: 20261102-fix-validate_mm-b7930d41388b
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>, 
 "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Lance Yang <lance.yang@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, ljs@kernel.org, 
 syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com, 
 Songsen Yang <yangsongsen@insta360.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3013; i=ljs@kernel.org;
 h=from:subject:message-id; bh=u2wqNUH9bK5PpvJk2Lz+CSIl7Jc0/KdJZkkyUZ4hQ8c=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLJepCqFLwvTtmD+c3+S8x/j/1v+31k8N27LlHOpi5elT
 +y0iJxQ3VHKwiDGxSArpsjy/Iv4/iCRsHmdF/zdYOawMoEMYeDiFICJfGVl+M3SkaRz4XOEzb6u
 xM5QoVzVLa9DXzTlZolzX+Xwtfe8tYrhf9CfrnDJyNa1F33Pn2ac+Pq9jdaURYtcU5rOnG48/Cm
 8iBEA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Commit 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence
KCSAN") rather clumsily converted the read of vma->anon_vma into a
vma_has_anon_rmap() without accounting for the separation between
assignment of anon_vma and later use of it.

vma_has_anon_rmap() is intended as an optimistic check, so doesn't need to
protect against a torn read in vma->anon_vma. The caller is expected to
take care of this themselves if they then in fact access the field.

validate_mm() does indeed then reference the field, so resolve the issue
via READ_ONCE(), and simplify the code by separating this into a new
function validate_mm_anon_rmap().

Finally, add a vma_assert_stabilised() to make it clear the required state
of the VMA.

Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6ae78418.6552420f.2a0efc.005c.GAE@google.com/
Reported-by: Songsen Yang <yangsongsen@insta360.com>
Closes: https://lore.kernel.org/all/20261102074414.10902-1-yangsongsen@insta360.com/
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 mm/vma.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index d416ba58eb4c..9f02f19a7845 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -669,6 +669,28 @@ static int dup_anon_vma(struct vm_area_struct *dst,
 }
 
 #ifdef CONFIG_DEBUG_VM_MAPLE_TREE
+#ifdef CONFIG_DEBUG_VM_RB
+static void validate_mm_anon_rmap(struct vm_area_struct *vma)
+{
+	struct anon_vma *anon_vma = READ_ONCE(vma->anon_vma);
+	struct anon_vma_chain *avc;
+
+	vma_assert_stabilised(vma);
+
+	if (!anon_vma)
+		return;
+
+	anon_vma_lock_read(anon_vma);
+	list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
+		anon_rmap_tree_verify(avc);
+	anon_vma_unlock_read(anon_vma);
+}
+#else
+static void validate_mm_anon_rmap(struct vm_area_struct *vma)
+{
+}
+#endif
+
 void validate_mm(struct mm_struct *mm)
 {
 	int bug = 0;
@@ -678,10 +700,6 @@ void validate_mm(struct mm_struct *mm)
 
 	mt_validate(&mm->mm_mt);
 	for_each_vma(vmi, vma) {
-#ifdef CONFIG_DEBUG_VM_RB
-		struct anon_vma *anon_vma = vma->anon_vma;
-		struct anon_vma_chain *avc;
-#endif
 		unsigned long vmi_start, vmi_end;
 		bool warn = 0;
 
@@ -702,14 +720,8 @@ void validate_mm(struct mm_struct *mm)
 			vma_iter_dump_tree(&vmi);
 		}
 
-#ifdef CONFIG_DEBUG_VM_RB
-		if (vma_has_anon_rmap(vma)) {
-			anon_vma_lock_read(anon_vma);
-			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
-				anon_rmap_tree_verify(avc);
-			anon_vma_unlock_read(anon_vma);
-		}
-#endif
+		validate_mm_anon_rmap(vma);
+
 		/* Check for a infinite loop */
 		if (++i > mm->map_count + 10) {
 			i = -1;

---
base-commit: b61fa14ce6bcbba2cb9a96feea31b760226d6b43
change-id: 20261102-fix-validate_mm-b7930d41388b

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

