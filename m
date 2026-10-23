Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714646;
	b=b1Y9EOXjDjWDhdFZlw/xl93Fq5eNzzxDhJYDR7FkPrDdVo/BRwSJrc0GKFAm4NHEXqrh
	 Le/RYBaRoq1qQMXVObgtBVUJ3dW7c2J3BXZAYZEhYW0vmaYXSN3bv60Ag8XnJAQm3gXJw
	 fUF35F74Bw1uF4LCAJ/6ZC32Lj4mMz3gVVQHO/P1OJcqeMv/cEAIYPs9pRrQh46KGw/os
	 NJQpZWCTV73zTau73X0fpPs1anPBrZebuczMSE687JPBJq5X2bWVcXpb/Nwnk+kwkZC99
	 3W1UMkhTT7XRnCApKQow9toZikOZ9fB+Zjozile4d9lMOAZ4GmoY9we8sZdStfOKcww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
	b=maP9257AFyLK5+BI2miCRYR5r2n6RhVuPG9BwfLKihSL6RkJhbTXATt19VjDSyauLbEh
	 kLCqyO8qgINsWRe7YkGcWUbvyYNq2vWvVFmNw8CYhIDeJ+fm73LmM5+UGguEWPhv5d8Bj
	 04ii/pMEqOZbatJd+SJz59m1/UqABqu8sVSoJ5yaaCDO5H2Prq/Rxd2mC7528qnYj+a9Q
	 qFdBkOVNlv8cqunXAPl19z+3iuXy8Nql9QOHOqTnyLr+AUuYBlDd9LqL6YcE5TL6Srinf
	 up2UIMiEoMsSUgD9mD2BH3jYGktfzfd+3wfmf0ONUBC26VKjuhwYmXEgCdL6SfpdNjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Uzdjs9XQ;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E294606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E294606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Uzdjs9XQ
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso477429eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 17:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714646; x=1793319446; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
        b=Uzdjs9XQVOgnkMzwfBYWvjzVPffgDZiQPHuB7ca4I04DBEfMxl+SZG2cJaTPfFOhwN
         t+g5y1oKjg1juaBKzo9njVVZJwP1DJtyBkRQhBQXvBsLQXvF6LgBncxC7JQJr0vDXhqi
         CP+7nNAOsooUIFkJ0iptaqUyOkBz2hNfRdjSz3rpEsqCnLeLg8kxvKWrxsIoAJdogkmB
         YPBpTk4CFBJKy6jXMT3L+7yw5RplJVA6nAlT+WJPWHicaHslH4es3yLeBG+O8C+XiPme
         h0pgfg4n0lRqt+1SwqQjKxolYOTGP0Wh3MRm5Hl8ntmbsGJ7Tz94WD2BVli+bR96kugY
         DEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714646; x=1793319446;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBYxcbD5svbaTalp54IT3TgPIj7U31fwSGEAMAykp6g=;
        b=ASHjN7XNJ71tfESN5X2QguDhKIfY31b71G+8gmwYwCHshNQq4NWA5484/WvxfAHIWq
         VoQ2VLspl2rclBSuZbiL5pu9D9pj0XkpeDcNfLZQ6poGLI84nnwRezqth4qX0TcGqTZA
         XGM85jT6l1qfvoyJ/E9vIdO+JicJr5KtcE0EgRHgj0A4PrJl0BRaZYNukky5DSfuNpyZ
         khg+nu89c+LLKAftgaEpVKMQk8G23YYxPcWAdfN26ppO6V37Bl6mAg+YdBw/C7i09WxB
         5/BbUsCqHJRrLlL/IXYhl/CUcTRBnzOCQHHh6xmWfgMr+f0t01Kt8TKO7nqNOHu09Q1y
         gBrA==
X-Forwarded-Encrypted: i=1; AKwUvBwvqZ114qummnbU6KaD5k0uaaxIFV0ZSEqU74PX/bwUiHVKtZVYgQc7rND4FX968zbzEOkI/xsYZ4QSnNc=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2SEf5WfFVt7A3oFpWORHobFa6ObPP/GAWnFVP4i/JRyaQNzj9
	6r+XZcoZ7LN2vNCi6qbOFknlyvupMoLIpXjA8aengMwZHLbaOIe2FkHdBA5h4pNCoByjEr40iU5
	BU7ufCQJYcJVo0w==
X-Received: from dlbps4.prod.google.com ([2002:a05:7023:884:b0:191:327b:5758])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:4184:b0:16c:ff3a:d72e with SMTP id a92af1059eb24-195c6b29320mr1346079c88.20.1792714645130;
 Thu, 22 Oct 2026 17:17:25 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:03 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-10-wusamuel@google.com>
Subject: [PATCH bpf-next v2 2/6] tools: Copy KALLSYMS_QUERY definitions to linux/fs.h
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Copy the KALLSYMS_QUERY ioctl definitions from include/uapi/linux/fs.h
to tools/include/uapi/linux/fs.h for libbpf and the proc and bpf
selftests. Only the new definitions are copied; other differences
between the two headers are left alone.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/include/uapi/linux/fs.h | 41 +++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index f0a26309b6d5..d224516e6d6e 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -567,4 +567,45 @@ struct procmap_query {
 	__u64 build_id_addr;		/* in */
 };
 
+/* /proc/kallsyms ioctl */
+#define KALLSYMS_QUERY	_IOWR(PROCFS_IOCTL_MAGIC, 18, struct kallsyms_query)
+
+/* Exactly one query mode must be set in query_flags. */
+enum kallsyms_query_flags {
+	/*
+	 * Look up a symbol in vmlinux or loaded modules (vmlinux first; BPF
+	 * and ftrace symbols are not searched) by exact NUL-terminated name
+	 * at sym_name_addr and return sym_addr. sym_addr and sym_name_size
+	 * must be 0 on input.
+	 */
+	KALLSYMS_QUERY_BY_SYMBOL = 0x01,
+	/*
+	 * Look up the symbol covering sym_addr and write its NUL-terminated
+	 * name to the sym_name_addr buffer of sym_name_size bytes. The same
+	 * symbols as %pS are searched: vmlinux, loaded modules, BPF JIT
+	 * images, and freed module init functions still tracked by ftrace.
+	 * A buffer of KSYM_NAME_LEN (512 at the time of writing) bytes is
+	 * always enough. On success, sym_name_size is set to the number of
+	 * bytes written (including the terminating NUL).
+	 */
+	KALLSYMS_QUERY_BY_ADDR = 0x02,
+};
+
+/*
+ * Returns -ENOENT if no symbol matches, -EADDRNOTAVAIL if the name maps to
+ * more than one address, -ENAMETOOLONG if the name does not fit in
+ * KSYM_NAME_LEN (512 at the time of writing) or sym_name_size bytes, and
+ * -EPERM if kallsyms addresses are hidden from the opener of /proc/kallsyms
+ * (e.g. kptr_restrict).
+ */
+struct kallsyms_query {
+	__u64 size;		/* in - struct size for compatibility */
+	__u64 query_flags;	/* in - query mode (enum kallsyms_query_flags) */
+	__u64 sym_name_addr;	/* in - address of symbol name buffer */
+	__u64 sym_addr;		/* out (BY_SYMBOL) / in (BY_ADDR) */
+	__u64 sym_name_size;	/* in/out - name buffer size / bytes written */
+};
+
+#define KALLSYMS_QUERY_SIZE_VER0	40 /* sizeof first published struct */
+
 #endif /* _UAPI_LINUX_FS_H */
-- 
2.56.0.257.gf7497c7d27-goog

