Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794333547;
	b=dhorAqoEUGapiba232lJ9c+YOzwjD6PP1RPV1inOXJGR2mmTvDopvNyTvGpJ+zSs9RSc
	 zt4QhhoxjZzsi8ns1X7ltGlM8BqWQCIFitnPkZ7OqzwRB2g/PTxSITpMQSlgqikCP/PaD
	 Y8hMCPPejI1Ompa30zr8uw1uAqJhIc1lcrqW8sb1yKhkqqljdaCoa2tEmAsE8VTqSdv2/
	 YsIHW+lIwZn/AVtF0QxlUQ8a6J4LP5Sdz8SVl8HSsM4irZocs4mjhQl1pPlVHW/FpgUpr
	 9j+hPMaAdno+zAbZQsQOlnLLBNflECBWYpyVM2RG3PI/xKKRpuUGAvg65dOj75oEv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794333547;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kasMDOcTvV0NYyrBnOBPw++vO4YiuCVgb2XxRtS1qvM=;
	b=Lr+AQXmyvqK3MVKPl+p6X2EZMoqfTUZX/ZtAdNpg/wr70eStbcF4Y4aEd3fApms/WAHO
	 CEywVzdchZ4ZGlwdKQp8QLjynnMvY5Oj4v5fMlSMzCSJsCEU0MNqw0UxWK+vFPPyyT6hN
	 2H962A/2Kt9HvxZtpKjIYBrTqGCAZyys71iGVNNGYZXUJrUJtzPAADMhDTFspk8AFo4U7
	 wYcV7tARzkhBRYdl5P52mSuTfyTOdQF1oFckEgpsLe7WJSMM74fo+IFAeS2onZGv8EJqI
	 idBJv/gv9vUg32dCEs0ZaMkwsBicoIucdBK4qFfmfVe1kbSaaj2Cljk6ttaYoNcod1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oFsN1e/5";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA31606A331
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oFsN1e/5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8701F008A3;
	Tue, 10 Nov 2026 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333546;
	bh=kasMDOcTvV0NYyrBnOBPw++vO4YiuCVgb2XxRtS1qvM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oFsN1e/5hDYrH56ZTnZw4RkCYmdJHwM1nMxBBY7ZSClYsmSuucVsBUlHN2IYqDlDC
	 LdzOYSbLn/HJXII+igJNAk1rTfminwVeW82CdICH/810OfiY0NlQZCtb1ptX+3C2W3
	 t72j0w8bjptIJc3yhzxsJsYGzFI/0iNEwDNQxDJ5+Ci23j1WHmyNal4r04x0nDsm9t
	 LF1gpP1E9Jhz5xSL3T+6kbsQPsV4kxVprErtVQzbYds7jC7ghYOSk6tau5rpDMCZNY
	 5KHu9jRr2PteO5L2rdG+G5EjWSYYajJ/EYO+NjTGlDpwTpl2UXSj7C3qXc9ehSnpLq
	 k1wV3z+ZPZsUw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 1/2] liveupdate: luo_file: allow keeping private_data from retrieve until finish
Date: Tue, 10 Nov 2026 18:58:52 +0100
Message-ID: <20261110175855.2437084-2-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
In-Reply-To: <20261110175855.2437084-1-pratyush@kernel.org>
References: <20261110175855.2437084-1-pratyush@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Pratyush Yadav (Google)" <pratyush@kernel.org>

The private_data field of struct liveupdate_file_op_args lets file
handlers keep runtime state that is not preserved. It is set by
.preserve() and passed to the later outgoing callbacks, up to
.unpreserve(). But in the new kernel, nothing set by .retrieve() is
kept, and .can_finish() and .finish() always get a NULL private_data.

Handlers might need to keep runtime state from retrieve until finish.
For example, memfd will need to remember the folios it holds on to
until finish so it can release them there.

Save the private_data set by a successful .retrieve() in the luo_file,
and pass it to .can_finish() and .finish(). The handler must free it in
.finish().

While at it, update a stale comment under struct
liveupdate_file_op_args. There is no 'data', but there is
'serialized_data' and 'private_data'. Refer to them instead.

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 include/linux/liveupdate.h   | 11 +++++++----
 kernel/liveupdate/luo_file.c | 11 ++++++++---
 2 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612ce..f01e9ab68d996 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -37,12 +37,15 @@ struct file;
  * @serialized_data:  The opaque u64 handle, preserve/prepare/freeze may update
  *                    this field.
  * @private_data:     Private data for the file used to hold runtime state that
- *                    is not preserved. Set by the handler's .preserve()
- *                    callback, and must be freed in the handler's
- *                    .unpreserve() callback.
+ *                    is not preserved. For outgoing, set by the handler's
+ *                    .preserve() callback, and must be freed in the handler's
+ *                    .unpreserve() callback. For incoming, set by the handler's
+ *                    .retrieve() callback on success, and must be freed in the
+ *                    handler's .finish() callback.
  *
  * This structure bundles all parameters for the file operation callbacks.
- * The 'data' and 'file' fields are used for both input and output.
+ * The 'file', 'serialized_data' and 'private_data' fields are used for both
+ * input and output.
  */
 struct liveupdate_file_op_args {
 	struct liveupdate_file_handler *handler;
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504fb..9bda37b0dc4f1 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -145,9 +145,11 @@ static DEFINE_XARRAY(luo_preserved_files);
  *                 .retrieve(), and .finish() callbacks, allowing it to track
  *                 and update its serialized state across phases.
  * @private_data:  Pointer to the private data for the file used to hold runtime
- *                 state that is not preserved. Set by the handler's .preserve()
- *                 callback, and must be freed in the handler's .unpreserve()
- *                 callback.
+ *                 state that is not preserved. For outgoing, set by the
+ *                 handler's .preserve() callback, and must be freed in the
+ *                 handler's .unpreserve() callback. For incoming, set by the
+ *                 handler's .retrieve() callback, and must be freed in the
+ *                 handler's .finish() callback.
  * @retrieve_status: Status code indicating whether a user/kernel in the new kernel has
  *                 successfully called retrieve() on this file. This prevents
  *                 multiple retrieval attempts. A value of 0 means a retrieve()
@@ -616,6 +618,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	}
 
 	luo_file->file = args.file;
+	luo_file->private_data = args.private_data;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
@@ -643,6 +646,7 @@ static int luo_file_can_finish_one(struct luo_file_set *file_set,
 		args.session = luo_session_from_file_set(file_set);
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 		args.retrieve_status = luo_file->retrieve_status;
 		can_finish = luo_file->fh->ops->can_finish(&args);
 	}
@@ -661,6 +665,7 @@ static void luo_file_finish_one(struct luo_file_set *file_set,
 	args.session = luo_session_from_file_set(file_set);
 	args.file = luo_file->file;
 	args.serialized_data = luo_file->serialized_data;
+	args.private_data = luo_file->private_data;
 	args.retrieve_status = luo_file->retrieve_status;
 
 	luo_file->fh->ops->finish(&args);
-- 
2.56.0.542.g3ef89b7020-goog

