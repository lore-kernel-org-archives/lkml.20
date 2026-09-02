Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C55A52D876A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788378439; cv=none; b=QIRA3qAF0M/aBuJiHvXdPAisBN6a/L1vhRbSLwHIdn00NpoBJa5yPvOjksPBc26BMdkKlHqjJCr2K42cZiQU6P9E2yqQHCYcEt7isiSCLXaVJJRjRN7l8/B23mBdXM02ofZOrmQzqgWSItO8CJ7Av6CVJ4S1y1VNL7Jhf5Jigug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788378439; c=relaxed/simple;
	bh=3roPg4ZfXvCu9H2QE9Rl5CyrdVkiobJpwL6O2Q76emc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ROHLYm5SbV8p+/kG1JHfQ4xJX2+IleOX/H1xShBckBKfuwdFZyvAJywJNYIC9Mo6JgWIuVjQrzcCL6TQqCkL09lKVNmKvCvl8v1beXOv6CKNdGwPTRb3GQcjqjp9/sfUnB6nRq80f6Czw01FSTyybu0TsiqkomxW9t7haL4m3pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=RqW2ef64; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="RqW2ef64"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90ce3971a86so14631026d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 12:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788378427; x=1788983227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jK2MmrU5PHerjBBjkrNgI0UI4L0yhiHtWM989h7yfSE=;
        b=RqW2ef64Dc/9ZRfrHgRDo90wDTDKIu9w78a73wauD9AG7v8UkzkHNEhej8zt2y1ben
         S34SCE/9Ww4KgV7MmtL9YljeZ/UlvtKXcMqFf8OG7uE3/Xt4Z4jKh1RfZIKHFUET11GS
         XSWsIijEmmWLnx+Ccl2AYR8XNBqzxYEQz2YkBaFqsjQOTSaQ/SRmCGZn7taedg4FVFgH
         QoW3oVS0EoawlLIGaZQHooI8lFXwao0pSSxwvbvS9mwA/bPz0JVnJ6iZ2j+bDl3wArJL
         9vANN+zk0eTfF0zh+lWRJMnfGqWXPNSlUwA8zGpqcW9ZrX4Y2rfndyJu/yFtJhVPf4I7
         SXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378427; x=1788983227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jK2MmrU5PHerjBBjkrNgI0UI4L0yhiHtWM989h7yfSE=;
        b=B9GlkR8AF7NjSja0lHa5P4bgJSIrg+Gao+cFLWeKf3ULdOpkzcxtxze9bBw4pDh9IJ
         z0q8YkhYn9k+3DBDHbzo8Y0CkqhumgTobY3+3pPuBH7w7aKXoaRWPomC9ssRBx8VZekD
         XRsbjYry+i+ut9uQ5DgMys1p/HAOhIL2OQMVYCgn/jOXL410b2fs+X5irUd5ZHVeoRrV
         IZGc/oz9f/CL/5vcmlehwQRdVBtqpi0bquwqzKjuTeoIHHnu5+utKPUiCm/bolOMOmFg
         d+8kRDuJXP84L1rc87nlaV5zrHHCoyOb9OxadNb0Q+s95xC777zM4sgxF+lP27nFvULK
         kLQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/2ILLjB2Gc2ZC6qrBPTsbCDOwjjm3xZbXdg8hq/njQaJcz0/S8lm3QQFBts6YVS17hrocGydddlRUmFA=@vger.kernel.org
X-Gm-Message-State: AFuF++nlK1KJlag47OcksZ9oSH/SIXZ3DRCH4Vi1lgdI37JMlERe09Ry
	+GZ64S2vdEutfj0QHYghTmIIfOd7B2t2e4Na0cproFVGIGhCx/SEuhc5Qhp3/u8oBGc=
X-Gm-Gg: AYBFou2/GqEUaZ61q+kncrTxVGAtD042ZhbCz1UBcdoM9emn2sVBVPYhaZq/f2BODJB
	uuVfA/n2pDH1g3KBIZtfUilD+2URCLJSBWY4zRv7dySkzmBi9YxHQoZaEo0kx9KkG73nLgXAL9t
	hEklyW3ciDEjMc+A2nuwD8alT7/7+lNyAtPGlauVQi4dvGBaPRS7GBzoZrNsAPrILKGZZDS+5Bm
	FJ2WSYqoezVuvN5MfsmI/30E8/9zeMSJ6nseTcILrBIn4DHGqHLmV+rmITBm10f88vFtRv0MUHx
	BHAA1MvWOn0ctnjJXEOu7jVrNtXAIhVRjnHy7kfUhQ1eOnlr06Sskzxy80aaOawRMLr+rGss+Er
	A5WJde+dE/DJO5gF/mxRdxe/geZ0QG3xlFWnX+1ruKNhcrKxgWyQk/O2zjGcvYJeBmhVS+FBt+t
	qxnmCVJs+PEJBvU5bUnouAEnsGkBA1BeGasZdg9uI122tWdcUWd0LHdMqRRXxpKry3p4U+WyQ5t
	SUl2A01JxgAXDJOtRA4YFp9xZs2YNkkPt1FayhGwFHA4K7AV9UvJ0euaz8r
X-Received: by 2002:a05:620a:3192:b0:936:ea3d:9313 with SMTP id af79cd13be357-9396ef7c45bmr114112385a.20.1788378426620;
        Wed, 02 Sep 2026 12:47:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9395f18801asm299300585a.16.2026.09.02.12.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:47:06 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	pbonzini@redhat.com,
	seanjc@google.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	shuah@kernel.org
Subject: [PATCH 4/5] selftests: KVM: guest_memfd: let the gmem_test() harness bind a node
Date: Wed,  2 Sep 2026 15:46:56 -0400
Message-ID: <20260902194657.79075-5-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194657.79075-1-gourry@gourry.net>
References: <20260902194657.79075-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To test GUEST_MEMFD_FLAG_BIND_NODE - extend create_guest_memfd() to
accept a node.

Ignore the node argument if the BIND_NODE flag is not provided.

Signed-off-by: Gregory Price <gourry@gourry.net>
Assisted-by: Claude:claude-opus-5
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 50 ++++++++++++++++---
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 2233d871a38f4..1818e0fea5690 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -25,6 +25,31 @@
 
 static size_t page_size;
 
+static int __create_guest_memfd_node(struct kvm_vm *vm, u64 size, u64 flags,
+				     u32 node, u32 pad)
+{
+	struct kvm_create_guest_memfd guest_memfd = {
+		.size = size,
+		.flags = flags,
+		.node = node,
+		.pad = pad,
+	};
+
+	return __vm_ioctl(vm, KVM_CREATE_GUEST_MEMFD, &guest_memfd);
+}
+
+static int create_guest_memfd(struct kvm_vm *vm, u64 size, u64 flags, u32 node)
+{
+	int fd;
+
+	if (!(flags & GUEST_MEMFD_FLAG_BIND_NODE))
+		return vm_create_guest_memfd(vm, size, flags);
+
+	fd = __create_guest_memfd_node(vm, size, flags, node, 0);
+	TEST_ASSERT(fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_GUEST_MEMFD, fd));
+	return fd;
+}
+
 static void test_file_read_write(int fd, size_t total_size)
 {
 	char buf[64];
@@ -418,26 +443,35 @@ static void test_guest_memfd_flags(struct kvm_vm *vm)
 	}
 }
 
-#define ____gmem_test(__test, __vm, __flags, __gmem_size, args...)	\
-do {									\
-	int fd = vm_create_guest_memfd(__vm, __gmem_size, __flags);	\
-									\
-	test_##__test(args);						\
-	close(fd);							\
+#define ____gmem_test(__test, __vm, __flags, __gmem_size, __node, args...) \
+do {									   \
+	int fd = create_guest_memfd(__vm, __gmem_size, __flags, __node);   \
+									   \
+	test_##__test(args);						   \
+	close(fd);							   \
 } while (0)
 
 #define __gmem_test(__test, __vm, __flags, __gmem_size)			\
-	____gmem_test(__test, __vm, __flags, __gmem_size, fd, __gmem_size)
+	____gmem_test(__test, __vm, __flags, __gmem_size, 0, fd, __gmem_size)
 
 #define gmem_test(__test, __vm, __flags)				\
 	__gmem_test(__test, __vm, __flags, page_size * 4)
 
 #define __gmem_test_vm(__test, __vm, __flags, __gmem_size)		\
-	____gmem_test(__test, __vm, __flags, __gmem_size, __vm, fd, __gmem_size)
+	____gmem_test(__test, __vm, __flags, __gmem_size, 0,		\
+		      __vm, fd, __gmem_size)
 
 #define gmem_test_vm(__test, __vm, __flags)				\
 	__gmem_test_vm(__test, __vm, __flags, page_size * 4)
 
+#define __gmem_test_node(__test, __vm, __flags, __gmem_size, __node)	\
+	____gmem_test(__test, __vm,					\
+		      (__flags) | GUEST_MEMFD_FLAG_BIND_NODE,		\
+		      __gmem_size, __node, fd, __gmem_size, __node)
+
+#define gmem_test_node(__test, __vm, __flags, __node)			\
+	__gmem_test_node(__test, __vm, __flags, page_size * 4, __node)
+
 static void __test_guest_memfd(struct kvm_vm *vm, u64 flags)
 {
 	test_create_guest_memfd_multiple(vm);
-- 
2.53.0-Meta

