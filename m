Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794161135;
	b=l3mRE0GmPtTFwzBte0b6ZAMXhiyt+NuVxyguHXOx3pCGKw7/fsH0vxCZZIXe6b4eilGs
	 ksDe56S9StM/x4S3Sl0+43ApqtPKGYmdFsB4PMRg1bQeELOZ4mGOMkH8nd4J+ALDOY3d7
	 0MkT39hRwGTjUjm/RICVNNXr+kHrl+tfbq3ipGl5sq7JU3YDQtKCN/Sslj02+M8hRAnvT
	 CONLII7kr0swD7NriD/k6L5ZVBjIgE1mt9UPdfGIvhCPyxNJQUmWdgvNi4129dYqxitvD
	 DcthfyJ2mwIbJB7aWgzO6A/PT62cV2tFQmxO1sWyWKKuq+cvJtxLLE+bPzp+615S+Qg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794161135;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ncjT9/9RrAC0tk5sletn5MFkxrROZxZqsmTLlhF1YTs=;
	b=ntBEOUvGaTfEW4FeXrknEgD8EymDYk0fjErWLEWkposbdCwKLTsCKDnZlRXbGpDi6vdX
	 pvfmeHDGTyxL2kIa8bmRqsnwHz808HWj0d+UL3axv9wKbayFlp1/QRXuyUO50RZ2qhgKh
	 QzjpHQ2Mcsb6T65PCbc3XVOgQsA+6APLmDcJCe3P2PjJOuqslSA60NbP0AUbbKrMrrj/j
	 RIQIDATAjVHmZJgs+CiLV56U6/QofYHKw1sz/J1n0dnSNRtoxT9F3gwIg48Rcet6sBZjo
	 De4T5d82A6X24UdrNu975g6fgQyBVmV7NJHLEbTijd09oJaDM+hs4uuHcwggCLziurw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ls4LMEFx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4684606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ls4LMEFx
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794161134;
	b=WWs8y36O2GMtVrLTIRpiVySoYlgJOg/wbuUm0TP3BqObMUj3wvz/Xfixc6QNK8Z9Lu3S
	 AmghgpMeJDDkecPkvF2aZU2EGHpgLcrT7oqN/Jp2s/sdfGhpAGFLxPpBC3R6wJ3N5jq3Q
	 ZTNFlsAG4bqvfCaJmAEHXdQoEUCPgjqh+0lZ85YL62SbXpuq1wysciaelkFJ//lniJYY5
	 8A25r6EpvAY8iWSxsc3m0/oBjFWGqvB7Qt+0pAvtNGsao9e2dHg0EyLd3bvLTybfdHFIg
	 M6Wwfcz+KMJqIPFZLAikqOMMrdL9a63w7R+gqZ3tsBjtQO7QHJKWJ9zTr9u0lyzu2Og==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794161134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=ncjT9/9RrAC0tk5sletn5MFkxrROZxZqsmTLlhF1YTs=;
	b=jZd3QAQZEY8JuZUwCZJEZ00NxIIgWuy7fRn3SSBK7jvXRX2tHv0R22W+OekcPl2b2y3G
	 zUTl4DVay957qgSg/x+o5FmhV06YADHPlX1hginFkmdfowkgmUhx9wbyUZKaY/9rh5aBb
	 o3xkn8R3BSYmuVJDAfkxZjACs/qCp8Nf8Pu9wMXK4oXjo3fcoyeN3UzsZ2wlht2QUfMLh
	 NQ7jLQTnTD9+FJzrj9JIGULY/nLciRL8wNGKydGaiIbDUa7r36avIG1flDtnO6NDwxoM/
	 oQj8B8HpBkjhHFjGEFxPBv84DV3RL4sIhBEvQCKWMPaG+lUckV5kEQEqPMa5R5SdX6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE5811F0089F;
	Sun,  8 Nov 2026 18:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794161134;
	bh=ncjT9/9RrAC0tk5sletn5MFkxrROZxZqsmTLlhF1YTs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=Ls4LMEFxgYm0e+eADbZWx0eu2iUpv9XYfx45feDYyLSjwPU0BsDqjiuEiL27R+AlY
	 jYGB0twbEIsSvwoNnaobjQPKzEgJekSOcEBJtTxJsVxxJ4JaYb40IEL7sqy4iD1t+b
	 ZYkpwTBkUy9qvW1K8jqa8WF10/8SWcfokxUCDMvvL4i6ekgSQi8P9Ku2i/PL1tr4Ji
	 gV85wdnvnwyaHYy+98Mik5mLNciEVHDc/acvU8rOpBo1bGzcw1M3hZnVkqq/goOJQh
	 rkTDwt4Wf4WKtGTvewM0LHvfasmZZ90vvxZah3HltJ1nTd4t/S2KXO9EAO2ttNO4nU
	 /dV/U3a+GS08g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4CE474800A;
	Sun,  8 Nov 2026 18:05:33 +0000 (UTC)
From: Joas Antonio dos Santos via B4 Relay <devnull+joasantonio108.gmail.com@kernel.org>
Date: Sun, 08 Nov 2026 18:05:33 +0000
Subject: [PATCH] ntfs3: fix bitmap corruption in attr_allocate_clusters()
 error path
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
Message-Id: <20261108-ntfs3-alloc-undo-fix-v1-1-280fc5d06af6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOy58GoC/x2MWwqAIBAArxL73YL2EOkq0YfWWguhoRVBePekz
 xmYeSFRZEowVC9Eujlx8AVkXcG8Gb8S8lIYGtEoKYVGf7rUotn3MOPll4COHyTVWW2F02R6KOk
 Rqeh/O045f2yVh/NmAAAA
To: joasantonio108@gmail.com, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794161132; l=1878;
 i=joasantonio108@gmail.com; s=20261031; h=from:subject:message-id;
 bh=2dxHVeInvQx1GDisuSMbfr3SxQuAoN46Qasuyi4MfXo=;
 b=cJGwzp38Pd/KvngKhHz5vO1+8c9AsKo8kNE8OgpzWQupgBpZmepvkR+NQ5gFotXwsa+TB8tNG
 mX6k24MOFjKDadEbaVUEKDbP1XlADk8SEybDH05AdmK5hyukwQ5Y+r0
X-Developer-Key: i=joasantonio108@gmail.com; a=ed25519;
 pk=ZxAznJT/FcPPdzLrDDFJQm4LLjjHVGBBqDSG3TXS23w=
X-Endpoint-Received: by B4 Relay for joasantonio108@gmail.com/20261031 with
 auth_id=1371
X-Original-From: Joas Antonio dos Santos <joasantonio108@gmail.com>
Reply-To: joasantonio108@gmail.com
Content-Transfer-Encoding: 7bit

From: Joas Antonio dos Santos <joasantonio108@gmail.com>

The undo_alloc error path in attr_allocate_clusters() calls
mark_as_free_ex() with len (remaining clusters to allocate) instead
of flen (clusters actually allocated in the last iteration).

After the first loop iteration, len is decremented by flen, so on
subsequent iterations len represents only the remaining request size.
When run_add_entry() or run_remove_range() fails, the undo frees len
clusters starting at lcn, but only flen clusters at that position
were actually allocated. The excess clusters may belong to other files,
corrupting the allocation bitmap and causing silent data loss.

For example: a 100-cluster request where the first iteration allocates
60 (len becomes 40), and the second allocates 20 at a new lcn. If
run_add_entry() fails, undo frees 40 clusters at lcn when only 20 were
allocated there, marking 20 clusters of other files as free.

Fix by passing flen instead of len to mark_as_free_ex().

Found by LLM-assisted manual code review.

Fixes: be71b5cba2e6 ("fs/ntfs3: Add attrib operations")
Signed-off-by: Joas Antonio dos Santos <joasantonio108@gmail.com>
---
 fs/ntfs3/attrib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index 805acc3ed..2a75ee162 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -207,7 +207,7 @@ int attr_allocate_clusters(struct ntfs_sb_info *sbi, struct runs_tree *run,
 		if (!run_add_entry(run, vcn, lcn, flen, opt & ALLOCATE_MFT)) {
 undo_alloc:
 			/* Undo last 'ntfs_look_for_free_space' */
-			mark_as_free_ex(sbi, lcn, len, false);
+			mark_as_free_ex(sbi, lcn, flen, false);
 			err = -ENOMEM;
 			goto out;
 		}

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261108-ntfs3-alloc-undo-fix-e64b8b0f8ea5

Best regards,
-- 
Joas Antonio dos Santos <joasantonio108@gmail.com>


