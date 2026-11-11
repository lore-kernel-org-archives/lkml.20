Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794356651;
	b=bjbeAIVRw/482DKVn7R69hLX0TwcBCT5MKqWP141UrlTJJbHxkAukOqt+pRJM13HjuOs
	 LP17f4k2irnN20G0ks7msyMfnBzA/yE2sWWtV5N8SXg8fVgS4FxAuqqrIxh6KSHrC66qo
	 bd87tPLWxqaZZtYh9RwWk34hh9DHoaV6bxrok/WQszuMPUHI0xMNx0u75C2g+OJUQHhhm
	 t9Smb3JNyTJc6cPrxpNWafPVAfeb+fWBmInORNFGomaw2aAiI7znhuYfkd/04y09SnQvH
	 sLuOrAlReocC5AKpcYAEau/FRet00H6RrJfJ57NY5ylrUwWvVveqDRk+BoolKotMNeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dZjUvSl6GBGHQXZVz9tTXU3E7O3MILwPWQjO+iuJXZc=;
	b=W1EhtBAfFVjj1PF9zcHY9v/EBc32A3vgXOuZOzhfPn509Adzwe+rSpzTf5QnabODpHEI
	 OvWw1XvVHTCeu7YjMSVkfs3q/iwbju3UWlDX6NLo20ObZEkbTvrITj9itAkxeVPyEjjQX
	 SPTpMZoNuSACiSiiu3uWppYW5oWkCkli6/9XlGdzXsRFkj0jI3aK5x7CXTOpQfGRTK0Q2
	 0H5PEHtz+IcxQ8VdH858oERlEC1tjjri64pYTX5ma8mUcGk3trQb3lPz9a/pomHscX+8E
	 NfZC8iVfFOqK78sZ4tAukA49WYJYI2+/eBgMYFCZwxuTcTavtqXWpSalAZJr3J7vP7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZLrjYzha;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CF460A2604
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:24:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8CF460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZLrjYzha
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45e6091d8a1so1511200fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794356650; x=1794961450; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZjUvSl6GBGHQXZVz9tTXU3E7O3MILwPWQjO+iuJXZc=;
        b=ZLrjYzhataDrE4fH3ic2qzj+/+mxpttxMddhr/eS3mWRR9MEq6S1y9Ds7tcVhMjLsW
         GQdIUiOSMri96y5EdTMjOaTA/tx7Wp3MUQWXZ/FSGfOJCHhQ0W/tVFwNzwaGBCFz6mJw
         ARM6P5JHf5lyofzm8922p+FugRCwVqygr4s9jFXGeFz94gct3nZFQ6hHmQXT/yoq7syJ
         zO+ZejDyMQSdecO6OSg4XaHNOL4da+whHo7cm/My+qpWNfDoTQHoRA/5knzWMiywhzjI
         3sXNY62OrPCOf0Xn9HuxHkNGaKWShcCuZgzvZ3B+lbvZqAluNIdatfMzz/0tigskxzSj
         oAow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356650; x=1794961450;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZjUvSl6GBGHQXZVz9tTXU3E7O3MILwPWQjO+iuJXZc=;
        b=oMQrjrKv93FlXes3KDhfH2HSbU/r183MeI5ipRo8EAm0NP6qYvoZzNEXts7W6n5qFh
         j6TZLHITzsNEbwCyo0aIUcubkEnfAC+VzO2lf50e6J2R2SZa4MLQJ72un4qV8e3pd42w
         PAc9CQmbUGle/lCQHxfKbLccYmtxAHC/g/GOn8IHqRdoGe368isGmnYQ8WpyCAmPNg8P
         b5GooCaesHuQSYNJUWvBsZl81/IyY7PC8xLxGlwc0FgP7rQ8qFkQVZ4zHOrlBprMaTiF
         eZKyhib5GleLmdDP9Px08vUBbPEjuOSB9c1rJTIHAoDkUdSOqi2tO+Ahjhp+0fVkKYMv
         Xmag==
X-Forwarded-Encrypted: i=1; AL+hErFE65HYDjOcYN9CLTuuspTMWY6/mLTT+7gKQULU/VZJGG+p+HCSmAXxiga8nK1oedhPTt0TWerD6jreYTw=@vger.kernel.org
X-Gm-Message-State: APuU4Z88EP5luMCcHvzaIwdh1EsF7wG66CPBeMmgkKoKFj81PmB8JDPK
	gL5/gkiTfhJXdGKuqASxuhYjSImYs0NppkT6k6uXpeHqkWmzgeoRFOYmlR8j6AbF82FJEuN2+7l
	Dkh7dBTXL+ZCvyQ==
X-Received: from oacjm11.prod.google.com ([2002:a05:687c:2f8b:b0:4ad:864c:9c16])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6870:1b12:b0:4ad:5c5e:5e78 with SMTP id 586e51a60fabf-4ae46c19d98mr779351fac.36.1794356649468;
 Tue, 10 Nov 2026 16:24:09 -0800 (PST)
Date: Wed, 11 Nov 2026 00:23:40 +0000
In-Reply-To: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111002358.1842967-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111002358.1842967-3-dmatlack@google.com>
Subject: [PATCH v4 02/19] liveupdate: Pass user argument to file preserve and retrieve
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Pasha Tatashin <pasha.tatashin@soleen.com>

Allow userspace to pass a file-handler-specific argument structure when
preserving or retrieving an FD via LUO. File handlers may need
additional context during preservation or retrieval, such as the file
to restore into on retrieve, or other handler-specific parameters,
without introducing separate ioctls for each file type.
Whether the argument is required, optional, or unused is defined by the
file handler.

Extend struct liveupdate_session_preserve_fd and
struct liveupdate_session_retrieve_fd with a 64-bit arg field pointing
to a handler-defined argument structure that begins with a 32-bit size
field. Because IOCTL_OP validates a minimum size up to the token field,
existing callers passing the 16-byte struct remain compatible and have
arg zero-filled by copy_struct_from_user().

Add parg and rarg (struct liveupdate_arg_spec) to
struct liveupdate_file_ops, initialized via LIVEUPDATE_ARG(_struct,
_min_last), which records the full struct size and minimum required size
while enforcing at compile time that handler argument structures begin
with a 32-bit size field. When arg is non-zero, LUO validates the
minimum size and copies the user argument via copy_struct_from_user() up
to the handler's expected size and passes the kernel copy in
struct liveupdate_file_op_args, or returns -EOPNOTSUPP if the handler
does not accept an argument.

The argument only applies to the retrieve that restores the file.
Retrieving a token that was already retrieved returns the existing file,
so fail with -EBUSY if a non-zero argument is passed then, instead of
silently ignoring it.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/linux/liveupdate.h       | 44 +++++++++++++++++++++
 include/uapi/linux/liveupdate.h  | 10 +++++
 kernel/liveupdate/luo_file.c     | 65 ++++++++++++++++++++++++++++++--
 kernel/liveupdate/luo_internal.h |  5 ++-
 kernel/liveupdate/luo_session.c  |  6 ++-
 5 files changed, 122 insertions(+), 8 deletions(-)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 6051abc0612c..7543f5d648d3 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -22,6 +22,36 @@ struct liveupdate_flb;
 struct liveupdate_session;
 struct file;
 
+/**
+ * struct liveupdate_arg_spec - Specification of a file handler user argument.
+ * @size:     Full size of the argument structure in the current kernel.
+ * @min_size: Minimum valid user-supplied size (offsetofend of the last
+ *            required field).
+ */
+struct liveupdate_arg_spec {
+	size_t size;
+	size_t min_size;
+};
+
+/**
+ * LIVEUPDATE_ARG - Validated specification of a file handler argument struct.
+ * @_struct:   The argument structure type.
+ * @_min_last: The last required member in @_struct.
+ *
+ * All file handler argument structures passed via
+ * &liveupdate_session_preserve_fd.arg or &liveupdate_session_retrieve_fd.arg
+ * must begin with a 32-bit @size field so they can be extended compatibly.
+ * Use this macro to initialize &liveupdate_file_ops.parg and
+ * &liveupdate_file_ops.rarg.
+ */
+#define LIVEUPDATE_ARG(_struct, _min_last)				\
+	{								\
+		.size = sizeof(_struct) +				\
+			BUILD_BUG_ON_ZERO(offsetof(_struct, size) != 0) + \
+			BUILD_BUG_ON_ZERO(sizeof_field(_struct, size) != sizeof(u32)), \
+		.min_size = offsetofend(_struct, _min_last),		\
+	}
+
 /**
  * struct liveupdate_file_op_args - Arguments for file operation callbacks.
  * @handler:          The file handler being called.
@@ -40,6 +70,11 @@ struct file;
  *                    is not preserved. Set by the handler's .preserve()
  *                    callback, and must be freed in the handler's
  *                    .unpreserve() callback.
+ * @arg:              Kernel copy of the user-provided argument for .preserve()
+ *                    and .retrieve(), or %NULL if none was provided. Allocated
+ *                    to the handler's expected argument size with any trailing
+ *                    bytes beyond the user-supplied size zero-filled. Valid
+ *                    only for the duration of the callback.
  *
  * This structure bundles all parameters for the file operation callbacks.
  * The 'data' and 'file' fields are used for both input and output.
@@ -51,6 +86,7 @@ struct liveupdate_file_op_args {
 	struct file *file;
 	u64 serialized_data;
 	void *private_data;
+	const void *arg;
 };
 
 /**
@@ -68,6 +104,12 @@ struct liveupdate_file_op_args {
  *                resources in the session.
  * @finish:       Required. Final cleanup in the new kernel.
  * @get_id:       Optional. Returns a unique identifier for the file.
+ * @parg:         Optional. Specification of the user argument structure
+ *                accepted by @preserve, initialized via LIVEUPDATE_ARG(). If
+ *                unset, non-zero user arguments are rejected with -EOPNOTSUPP.
+ * @rarg:         Optional. Specification of the user argument structure
+ *                accepted by @retrieve, initialized via LIVEUPDATE_ARG(). If
+ *                unset, non-zero user arguments are rejected with -EOPNOTSUPP.
  * @owner:        Module reference
  *
  * All operations (except can_preserve) receive a pointer to a
@@ -84,6 +126,8 @@ struct liveupdate_file_ops {
 	bool (*can_finish)(struct liveupdate_file_op_args *args);
 	void (*finish)(struct liveupdate_file_op_args *args);
 	unsigned long (*get_id)(struct file *file);
+	struct liveupdate_arg_spec parg;
+	struct liveupdate_arg_spec rarg;
 	struct module *owner;
 };
 
diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 4043d4038712..87e77c3bfd82 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -126,6 +126,8 @@ struct liveupdate_ioctl_retrieve_session {
  * @size:  Input; sizeof(struct liveupdate_session_preserve_fd)
  * @fd:    Input; The user-space file descriptor to be preserved.
  * @token: Input; An opaque, unique token for preserved resource.
+ * @arg:   Input; User-space pointer to a file-handler-specific argument
+ *         structure starting with a 32-bit size field, or 0 if unused.
  *
  * Holds parameters for preserving a file descriptor.
  *
@@ -149,6 +151,7 @@ struct liveupdate_session_preserve_fd {
 	__u32		size;
 	__s32		fd;
 	__aligned_u64	token;
+	__aligned_u64	arg;
 };
 
 #define LIVEUPDATE_SESSION_PRESERVE_FD					\
@@ -160,6 +163,8 @@ struct liveupdate_session_preserve_fd {
  * @fd:    Output; The new file descriptor representing the fully restored
  *         kernel resource.
  * @token: Input; An opaque, token that was used to preserve the resource.
+ * @arg:   Input; User-space pointer to a file-handler-specific argument
+ *         structure starting with a 32-bit size field, or 0 if unused.
  *
  * Retrieve a previously preserved file descriptor.
  *
@@ -173,12 +178,17 @@ struct liveupdate_session_preserve_fd {
  * attempts to retrieve the token fail with the same error code. Failed
  * retrieves are not retried.
  *
+ * Retrieving a token that was already retrieved successfully returns a new file
+ * descriptor for the same file. Passing a non-zero @arg in that case fails
+ * with -EBUSY, since @arg only applies to the retrieve that restores the file.
+ *
  * Return: 0 on success, negative error code on failure (e.g., invalid token).
  */
 struct liveupdate_session_retrieve_fd {
 	__u32		size;
 	__s32		fd;
 	__aligned_u64	token;
+	__aligned_u64	arg;
 };
 
 #define LIVEUPDATE_SESSION_RETRIEVE_FD					\
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a42b60356d52..1437630d435e 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -126,6 +126,7 @@
 #include <linux/xarray.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/uaccess.h>
 #include "luo_internal.h"
 
 static LIST_HEAD(luo_file_handler_list);
@@ -202,11 +203,43 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
 	return false;
 }
 
+static int luo_copy_user_arg(const void __user *uptr, const void **argp,
+			     const struct liveupdate_arg_spec *spec)
+{
+	void *karg __free(kfree) = NULL;
+	u32 user_size;
+	int err;
+
+	if (!uptr)
+		return 0;
+	if (!spec->size)
+		return -EOPNOTSUPP;
+
+	if (get_user(user_size, (const u32 __user *)uptr))
+		return -EFAULT;
+	if (user_size < spec->min_size)
+		return -EINVAL;
+	if (user_size > PAGE_SIZE)
+		return -E2BIG;
+
+	karg = kmalloc(spec->size, GFP_KERNEL);
+	if (!karg)
+		return -ENOMEM;
+
+	err = copy_struct_from_user(karg, spec->size, uptr, user_size);
+	if (err)
+		return err;
+
+	*argp = no_free_ptr(karg);
+	return 0;
+}
+
 /**
  * luo_preserve_file - Initiate the preservation of a file descriptor.
  * @file_set: The file_set to which the preserved file will be added.
  * @token:    A unique, user-provided identifier for the file.
  * @fd:       The file descriptor to be preserved.
+ * @arg:      User-space pointer to the handler argument structure, or NULL.
  *
  * This function orchestrates the first phase of preserving a file. Upon entry,
  * it takes a reference to the 'struct file' via fget(), effectively making LUO
@@ -227,10 +260,12 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  *         -EBADF if the file descriptor is invalid.
  *         -ENOSPC if the file_set is full.
  *         -ENOENT if no compatible handler is found.
+ *         -EOPNOTSUPP if @arg is non-NULL and the handler takes no arg.
  *         -ENOMEM on memory allocation failure.
  *         Other erros might be returned by .preserve().
  */
-int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
+int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
+		      const void __user *arg)
 {
 	struct liveupdate_file_op_args args = {0};
 	struct liveupdate_file_handler *fh;
@@ -266,10 +301,14 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto err_fput;
 
+	err = luo_copy_user_arg(arg, &args.arg, &fh->ops->parg);
+	if (err)
+		goto err_module_put;
+
 	err = xa_insert(&luo_preserved_files, luo_get_id(fh, file),
 			file, GFP_KERNEL);
 	if (err)
-		goto err_module_put;
+		goto err_free_arg;
 
 	err = luo_flb_file_preserve(fh);
 	if (err)
@@ -293,6 +332,7 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	if (err)
 		goto err_kfree;
 
+	kfree(args.arg);
 	luo_file->serialized_data = args.serialized_data;
 	luo_file->private_data = args.private_data;
 	list_add_tail(&luo_file->list, &file_set->files_list);
@@ -306,6 +346,8 @@ int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd)
 	luo_flb_file_unpreserve(fh);
 err_erase_xa:
 	xa_erase(&luo_preserved_files, luo_get_id(fh, file));
+err_free_arg:
+	kfree(args.arg);
 err_module_put:
 	module_put(fh->ops->owner);
 err_fput:
@@ -535,6 +577,7 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  * luo_retrieve_file - Restores a preserved file from a file_set by its token.
  * @file_set: The file_set from which to retrieve the file.
  * @token:    The unique token identifying the file to be restored.
+ * @arg:      User-space pointer to the handler argument structure, or NULL.
  * @filep:    Output parameter; on success, this is populated with a pointer
  *            to the newly retrieved 'struct file'.
  *
@@ -554,10 +597,12 @@ void luo_file_unfreeze(struct luo_file_set *file_set,
  *          kernel.
  * Return: 0 on success. Returns a negative errno on failure:
  *         -ENOENT if no file with the matching token is found.
+ *         -EOPNOTSUPP if @arg is non-NULL and the handler takes no arg.
+ *         -EBUSY if @arg is non-NULL and the file was already retrieved.
  *         Any error code returned by the handler's .retrieve() op.
  */
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
-		      struct file **filep)
+		      const void __user *arg, struct file **filep)
 {
 	struct liveupdate_file_op_args args = {0};
 	struct luo_file *luo_file;
@@ -584,6 +629,13 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 	}
 
 	if (luo_file->retrieve_status > 0) {
+		/*
+		 * The argument only applies to the retrieve that restores the
+		 * file. Don't silently ignore it.
+		 */
+		if (arg)
+			return -EBUSY;
+
 		/*
 		 * Someone is asking for this file again, so get a reference
 		 * for them.
@@ -593,10 +645,15 @@ int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
 		return 0;
 	}
 
+	err = luo_copy_user_arg(arg, &args.arg, &luo_file->fh->ops->rarg);
+	if (err)
+		return err;
+
 	args.handler = luo_file->fh;
 	args.session = luo_session_from_file_set(file_set);
 	args.serialized_data = luo_file->serialized_data;
 	err = luo_file->fh->ops->retrieve(&args);
+	kfree(args.arg);
 	if (err) {
 		/* Keep the error code for later use. */
 		luo_file->retrieve_status = err;
@@ -995,6 +1052,6 @@ int liveupdate_get_file_incoming(struct liveupdate_session *s, u64 token,
 				 struct file **filep)
 {
 	return luo_retrieve_file(luo_file_set_from_session_locked(s),
-				 token, filep);
+				 token, 0, filep);
 }
 EXPORT_SYMBOL_GPL(liveupdate_get_file_incoming);
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dac6644bfb18..e0be84acb33b 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -101,14 +101,15 @@ int __init luo_session_setup_incoming(u64 sessions_pa);
 int luo_session_serialize(void);
 int luo_session_deserialize(void);
 
-int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd);
+int luo_preserve_file(struct luo_file_set *file_set, u64 token, int fd,
+		      const void __user *arg);
 void luo_file_unpreserve_files(struct luo_file_set *file_set);
 int luo_file_freeze(struct luo_file_set *file_set,
 		    struct luo_file_set_ser *file_set_ser);
 void luo_file_unfreeze(struct luo_file_set *file_set,
 		       struct luo_file_set_ser *file_set_ser);
 int luo_retrieve_file(struct luo_file_set *file_set, u64 token,
-		      struct file **filep);
+		      const void __user *arg, struct file **filep);
 int luo_file_finish(struct luo_file_set *file_set);
 int luo_file_deserialize(struct luo_file_set *file_set,
 			 struct luo_file_set_ser *file_set_ser);
diff --git a/kernel/liveupdate/luo_session.c b/kernel/liveupdate/luo_session.c
index 74bc66929f4b..0d7533f0bde6 100644
--- a/kernel/liveupdate/luo_session.c
+++ b/kernel/liveupdate/luo_session.c
@@ -268,7 +268,8 @@ static int luo_session_preserve_fd(struct luo_session *session,
 	int err;
 
 	guard(mutex)(&session->mutex);
-	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
+	err = luo_preserve_file(&session->file_set, argp->token, argp->fd,
+				u64_to_user_ptr(argp->arg));
 	if (err)
 		return err;
 
@@ -291,7 +292,8 @@ static int luo_session_retrieve_fd(struct luo_session *session,
 		return argp->fd;
 
 	mutex_lock(&session->mutex);
-	err = luo_retrieve_file(&session->file_set, argp->token, &file);
+	err = luo_retrieve_file(&session->file_set, argp->token,
+				u64_to_user_ptr(argp->arg), &file);
 	mutex_unlock(&session->mutex);
 	if (err < 0)
 		goto err_put_fd;
-- 
2.56.0.542.g3ef89b7020-goog

