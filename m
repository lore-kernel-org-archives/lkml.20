Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793729970;
	b=rLTejD1q9KHWdkm+Ph2ZF3A6Hqyp16jZyToI5JMKfB4ljVePpU8RO2gi0faSbUI407tZ
	 XCD+APoBg7aet3GTTHdauxPtiV20vxml7TGTuZ5VFeDvQQSFb/157H8EajVcwSyfBHjHI
	 htM0APUBF+vSikphBl4c0b9JdSt6EO5dZKr6bODd5mqbMB/s2+XI1Qo9yZt7nxSw8+vw2
	 RQhwKL4CnjxODLErwdRRF6RAZu2zpXH+HenBya8SEfGm2KX9danPUioE/a6FAnnyb7a4Q
	 dj7XzxsHsQ0SSQSRcC8hxRe7jnNYS/S5jAaqMiWmm4XcHw36xO1+Rh1YoZTDohZ/eQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793729970;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=FYHOxuzquXBIUkTOvswFznqwg+VfrAF2mXc+DGRaufk=;
	b=yetiW7oX9MW8SkGre5/3bGswxJm77FehgtK1mOtrwkKphRg4R9sqIFPsNrKuMnaVCFn9
	 yY6/QuWkCnQmddlYnIZ230+XY5kWvf+xURDLLkfhQgFxyjo6gOFMS2kKvytaPg+39TCdm
	 XAUTAW5OLOxxByChK6BLydkynZzVGDYAveGzRIj0+TVHhRfdOJYPVeWYRTg1vKlwx3MjH
	 qp84GJpvC3JC499WpkZjybt1vHFLxSd5lPHHX1MfmHIZ+O2gMo72f0KfG247TC49T0vm2
	 n7QKbRG0PZMJ8kdFKVDRJhJ8OqpHis0sPs3bSz00XP2NOhLCrkvhnQzYdPkvXvO5QBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt1+zkKF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50D16082BCE
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bt1+zkKF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245421F00A1C;
	Tue,  3 Nov 2026 18:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793729969;
	bh=FYHOxuzquXBIUkTOvswFznqwg+VfrAF2mXc+DGRaufk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bt1+zkKFo0p/VYFtoaUpCeVO3q5Cot/MAaSoDdO3JiIxqdBgddjfqGHVdU99f1yWj
	 RsT6XXcuLwdpqT7Qab6KbC+RyTnGd06cSobRJaWbAoKxvdNKnkWvxmFMjQCOqumBl8
	 takgjwM5VsjAfThX6toPDwysqGPdMju8o34WUTRroShJvepb9fCACdAZdXesrVMKJE
	 0zFf5NU8SdZRixP7e04hwd7Ic/5kKoelEmkDaAuxulY3md1Z3X9wnC/JaDAjGz1Mhx
	 5bVn2I1v8p5m/7t2COrI4myiOIdk36kvbkiHLIcGlK31qI5uR8RK+4eW7NOuA83TUs
	 uroXbiBov88PQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Samiullah Khawaja <skhawaja@google.com>
Cc: kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 1/2] liveupdate: luo_file: allow keeping private_data from retrieve until finish
Date: Tue,  3 Nov 2026 19:19:13 +0100
Message-ID: <20261103181916.2462825-2-pratyush@kernel.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103181916.2462825-1-pratyush@kernel.org>
References: <20261103181916.2462825-1-pratyush@kernel.org>
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

Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 include/linux/liveupdate.h   |  8 +++++---
 kernel/liveupdate/luo_file.c | 11 ++++++++---
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 63ea5417de849..21caff8a98a7e 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -36,9 +36,11 @@ struct file;
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
  * The 'data' and 'file' fields are used for both input and output.
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index c39f96961a85b..ca4b685d6e1ce 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -130,9 +130,11 @@ static DEFINE_XARRAY(luo_preserved_files);
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
@@ -596,6 +598,7 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	}
 
 	luo_file->file = args.file;
+	luo_file->private_data = args.private_data;
 	/* Get reference so we can keep this file in LUO until finish */
 	get_file(luo_file->file);
 
@@ -622,6 +625,7 @@ static int luo_file_can_finish_one(struct luo_file_set *file_set,
 		args.handler = luo_file->fh;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 		args.retrieve_status = luo_file->retrieve_status;
 		can_finish = luo_file->fh->ops->can_finish(&args);
 	}
@@ -639,6 +643,7 @@ static void luo_file_finish_one(struct luo_file_set *file_set,
 	args.handler = luo_file->fh;
 	args.file = luo_file->file;
 	args.serialized_data = luo_file->serialized_data;
+	args.private_data = luo_file->private_data;
 	args.retrieve_status = luo_file->retrieve_status;
 
 	luo_file->fh->ops->finish(&args);
-- 
2.56.0.385.gac671c819a-goog

