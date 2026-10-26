Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793052393;
	b=j3QMoM/qSbsjVpQQ/5vUONXHyAcRlD3j4PRcsl6jnfQYn464rW41wyAz5CYYxFMpXIXw
	 cFrtHociqS6GNO2UvdY/8RnSuNx5qSr1NyyTRL4pRLSOiFwZrXM2Mop5OpwSRN9xAotk7
	 z3kUww2iq2Bm+Oas5RaSoyQsrWVItx9KeKWUdNo+29LQF/rPLhZzOm5/xBEqi+He/HVF8
	 jdIb453sXYqDnd5EgLrvmxKjDh92Q/NoA+u8NOrST4uHFztAvVrul5KOsihQLIzeyEECL
	 4eAeUCNj96qAgrvdwt7zZv/4KKHvFeWK2FtLQH7RtdeczUnCx/UKc9gkQge/0xubApw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793052393;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=JbeI020SnpugISxSyc+z9N6JHGvPCZP0HYKr/jk1BYM=;
	b=hgPvwZAD5NbPOkNfpDiX6cUCoS8oD3TPVoA6WhI3jzhwq7yCb3+tUG8XGARsEFrzJ9zT
	 RQ5szR7JKQJtzGvWi2G+9oJM+5fYrlCfLpwM7FoMYUH5IATnsQqXKxQMGQQJHVoQXQ+6u
	 kAm2iX2z4V+l19cjnNk3wPRM1rwc77e4Omqv5yr/0crCZLo22aVO8l9rA1ZuJvSMxpgrn
	 bfVF7v6AU9cgIWaHTGejWAZLtqW4ewqWLxxcGjkbKgq6hvVjDQ4y7af1pj7438Xzq+Qnh
	 YmE8JSRmCBVuHnE4xV9S+YUvcBbth6IKBd4KbdWZrSAfRVuBjbX2t30COOIDW4ZsTaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TPbFrQyD;
	arc=none smtp.remote-ip=209.85.210.200
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A4606A334
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:06:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E68A4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=TPbFrQyD
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88c768885b4so6047063b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793052392; x=1793657192; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JbeI020SnpugISxSyc+z9N6JHGvPCZP0HYKr/jk1BYM=;
        b=TPbFrQyDnQ3X2ODTkC5Ghf3QJey5ayVfOW9a6h/mIXdaI4wS7Zuy7Lm3Ye14m2RZIr
         W/ysoFKbYw6B010/w/3MTtieRdYsfbDLUbTd9sRVoRySVf9nuhXNUMjL8VyUSGhNyDUt
         FxdLBk6fq4BekRTUR170BUsK1G0XLlrtqliDoAu7JTbzUnCWYKSQs9hDza91b+0AEGH0
         cz76REwf49YYA/LjIZ1GnRJA0+6lAEKCfmbxkUsBNzCEkD4TcOdoVp4T4lhhR6Q6RNpl
         ++GYdo0/v+KIeLNVAQzc6JOcJ8EiAyTL7xBr3qGRdPVjSvpu9FAoqpr5seFlRHyosc7m
         sFow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793052392; x=1793657192;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JbeI020SnpugISxSyc+z9N6JHGvPCZP0HYKr/jk1BYM=;
        b=FyOpmyzyy1uBI4cREDdLbU0dXTxyXmn5PQfi40IqUQzgz2VlHZbeQpRgs9Fsm0UN47
         JRK9HDMZisMEUm3p0lYw8ClS0e2BCETslj5BA0h2lrg4EL0desQ82wMhZm/scYH7IZRW
         pf4vEswhgcmeHn/CIDWe8tdnQH54u3ejr6FpfT1CuygKVue4b5MX3dwU6v6ZC1N2GW6O
         zmEZA/AlnKRqXtVwyMb1+Jm1CASJIg5drrmZtpZoxWBgzdXHSbNXS8X+hGQBz6Rfgf5M
         G6ktUuHdNuLXJGi5UBjHH+20PD6N8qfbBGxzTjLqoQHBpd0/JgyCLdad6kiOme97fr0j
         iylg==
X-Forwarded-Encrypted: i=1; AKwUvBxLFzRWlub2HjdXOSB7RdF469XfQyc5EVFYrErmBMcKM1a5jz4sqvehgq6L3MmkvCYFlJ3a+xPxYtpoqt8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxeGJnDgoxeINloHz0yV62wH/afy40dP9zHGhmOAmlioLRillx
	jRYCslJU9qP1HGs+OdbKAAl/P8OsVFwV+Z7QWlOSOJw71mgSZNGIqloNG3o0U5iwzXZBZTnriWJ
	HsvVAgnjwp+ndGg==
X-Received: from pgdo1-n2.prod.google.com ([2002:a05:6a02:6201:20b0:cd6:b08a:e7cb])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4e0b:b0:3e1:8890:8400 with SMTP id adf61e73a8af0-3e7bfbdb8dcmr6859849637.15.1793052392197;
 Mon, 26 Oct 2026 15:06:32 -0700 (PDT)
Date: Mon, 26 Oct 2026 22:05:46 +0000
In-Reply-To: <20261026220546.3114241-1-skhawaja@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026220546.3114241-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261026220546.3114241-3-skhawaja@google.com>
Subject: [PATCH 2/2] selftests/memfd: add F_SEAL_PUNCH_HOLE tests
From: Samiullah Khawaja <skhawaja@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Hugh Dickins <hughd@google.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, David Hildenbrand <david@kernel.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Jeff Layton <jlayton@kernel.org>, Chuck Lever <cel@kernel.org>, 
	Alexander Aring <alex.aring@gmail.com>, Shuah Khan <shuah@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Gerd Hoffmann <kraxel@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	Jeff Xu <jeffxu@google.com>, David Matlack <dmatlack@google.com>, 
	Pasha Tatashin <tatashin@google.com>, linux-mm@kvack.org, linux-api@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Samiullah Khawaja <skhawaja@google.com>
Content-Type: text/plain; charset="UTF-8"

Add tests for the new F_SEAL_PUNCH_HOLE seal. Like the rest of
memfd_test, they run on shmem memfds by default and on hugetlbfs memfds
when memfd_test is invoked with the "hugetlbfs" argument.

mfd_assert_write() checks that the file can be written, and then also
checks that a hole can be punched into it. The second check no longer
holds once F_SEAL_PUNCH_HOLE is set. Move the write checks into
__mfd_assert_write() and the punch check into mfd_assert_punch_hole(),
and have mfd_assert_write() call both, so the existing tests keep doing
exactly what they did before.

Add mfd_fail_punch_hole(), which checks that both
fallocate(FALLOC_FL_PUNCH_HOLE) and madvise(MADV_REMOVE) fail with
EPERM, and use it in two new tests. SEAL-PUNCH-HOLE sets only the new
seal and checks that punching a hole fails, while writing, shrinking and
growing the file still work. SEAL-PUNCH-HOLE-SHRINK adds F_SEAL_SHRINK
as well and checks that the file can neither have holes punched into it
nor be shrunk, while it can still grow.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 tools/testing/selftests/memfd/memfd_test.c | 111 ++++++++++++++++++++-
 1 file changed, 110 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index cdab3a837624..095c5eb255af 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -35,6 +35,10 @@
 
 #define F_SEAL_EXEC	0x0020
 
+#ifndef F_SEAL_PUNCH_HOLE
+#define F_SEAL_PUNCH_HOLE	0x0040
+#endif
+
 #define F_WX_SEALS (F_SEAL_SHRINK | \
 		    F_SEAL_GROW | \
 		    F_SEAL_WRITE | \
@@ -455,7 +459,7 @@ static void mfd_assert_fork_private_write(int fd)
 	munmap(p, mfd_def_size);
 }
 
-static void mfd_assert_write(int fd)
+static void __mfd_assert_write(int fd)
 {
 	ssize_t l;
 	void *p;
@@ -523,6 +527,11 @@ static void mfd_assert_write(int fd)
 
 	*(char *)p = 0;
 	munmap(p, mfd_def_size);
+}
+
+static void mfd_assert_punch_hole(int fd)
+{
+	int r;
 
 	/* verify PUNCH_HOLE works */
 	r = fallocate(fd,
@@ -535,6 +544,49 @@ static void mfd_assert_write(int fd)
 	}
 }
 
+static void mfd_fail_punch_hole(int fd)
+{
+	void *p;
+	int r;
+
+	/* verify PUNCH_HOLE fails */
+	r = fallocate(fd,
+		      FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+		      0,
+		      mfd_def_size);
+	if (r >= 0 || errno != EPERM) {
+		printf("expected EPERM on fallocate(PUNCH_HOLE), but got %d: %m\n",
+		       r);
+		abort();
+	}
+
+	/* verify MADV_REMOVE fails, it punches a hole as well */
+	p = mmap(NULL,
+		 mfd_def_size,
+		 PROT_READ | PROT_WRITE,
+		 MAP_SHARED,
+		 fd,
+		 0);
+	if (p == MAP_FAILED) {
+		printf("mmap() failed: %m\n");
+		abort();
+	}
+
+	r = madvise(p, mfd_def_size, MADV_REMOVE);
+	if (r >= 0 || errno != EPERM) {
+		printf("expected EPERM on madvise(MADV_REMOVE), but got %d: %m\n",
+		       r);
+		abort();
+	}
+	munmap(p, mfd_def_size);
+}
+
+static void mfd_assert_write(int fd)
+{
+	__mfd_assert_write(fd);
+	mfd_assert_punch_hole(fd);
+}
+
 static void mfd_fail_write(int fd)
 {
 	ssize_t l;
@@ -1117,6 +1169,61 @@ static void test_seal_resize(void)
 	close(fd);
 }
 
+/*
+ * Test SEAL_PUNCH_HOLE
+ * Test whether SEAL_PUNCH_HOLE actually prevents punching holes, but still
+ * allows writing and resizing
+ */
+static void test_seal_punch_hole(void)
+{
+	int fd;
+
+	printf("%s SEAL-PUNCH-HOLE\n", memfd_str);
+
+	fd = mfd_assert_new("kern_memfd_seal_punch_hole",
+			    mfd_def_size,
+			    MFD_CLOEXEC | MFD_ALLOW_SEALING);
+	mfd_assert_has_seals(fd, 0);
+	mfd_assert_add_seals(fd, F_SEAL_PUNCH_HOLE);
+	mfd_assert_has_seals(fd, F_SEAL_PUNCH_HOLE);
+
+	mfd_assert_read(fd);
+	__mfd_assert_write(fd);
+	mfd_fail_punch_hole(fd);
+	mfd_assert_shrink(fd);
+	mfd_assert_grow(fd);
+	mfd_assert_grow_write(fd);
+
+	close(fd);
+}
+
+/*
+ * Test SEAL_PUNCH_HOLE | SEAL_SHRINK
+ * Test whether SEAL_PUNCH_HOLE | SEAL_SHRINK prevents removing pages from
+ * the file
+ */
+static void test_seal_punch_hole_shrink(void)
+{
+	int fd;
+
+	printf("%s SEAL-PUNCH-HOLE-SHRINK\n", memfd_str);
+
+	fd = mfd_assert_new("kern_memfd_seal_punch_hole_shrink",
+			    mfd_def_size,
+			    MFD_CLOEXEC | MFD_ALLOW_SEALING);
+	mfd_assert_has_seals(fd, 0);
+	mfd_assert_add_seals(fd, F_SEAL_PUNCH_HOLE | F_SEAL_SHRINK);
+	mfd_assert_has_seals(fd, F_SEAL_PUNCH_HOLE | F_SEAL_SHRINK);
+
+	mfd_assert_read(fd);
+	__mfd_assert_write(fd);
+	mfd_fail_punch_hole(fd);
+	mfd_fail_shrink(fd);
+	mfd_assert_grow(fd);
+
+	close(fd);
+}
+
 /*
  * Test SEAL_EXEC
  * Test fd is created with exec and allow sealing.
@@ -1736,6 +1843,8 @@ int main(int argc, char **argv)
 	test_seal_shrink();
 	test_seal_grow();
 	test_seal_resize();
+	test_seal_punch_hole();
+	test_seal_punch_hole_shrink();
 
 	if (pid_ns_supported()) {
 		test_sysctl_simple();
-- 
2.56.0.307.g5fe7bd680c-goog

