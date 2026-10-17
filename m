Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF36E43F4C2
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 11:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792235000; cv=none; b=Wnx6OcV7AJ2pbT1uNRH8Ca3Rz7fQV1pucPq8vfLM38cntmLZXhr7WY7fs/Mo6YyZz1NvyUhpqnwvZJXmkeoRBTUvyVyfKQCyOyZwQcJm29ZULBpv8r4NhF4WgI1vWbP3DDXZ4OU4mUOLS5jG5JDx6qFBfdzP/hsR4TJGH5GtXNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792235000; c=relaxed/simple;
	bh=luspfJ1xZI4NzBO23wK7yIzNkEv+cTp75VYBXkmFvWU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oob7noasCwabaJWZMP5MAwh+qX1YW3qPWCf/bYlF2Z0IVq+j+d8LF4gD8VhrJVam6VLiBiHYdaLQRiiCuZBQAhITqOATHZOvPmT/fi0CaaNPpJWqNKtarKnc0WpqC7cr9VR8Sxlou06jY74jDOd3m5VuQkVFp3Gz059EOg4CSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFGRgl8x; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFGRgl8x"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e95bd1c14cso5454205ad.2
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792234999; x=1792839799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=HFGRgl8x2pvUeS+IOBQT6G87n9ULbCa/xyH7KUFuDGhfLgAYYUgighZzDY+sPrdEgk
         0/YHQWnuBexsNgLfQpgdAy2bXHYxJsZUzrHtI60HGefIGx2383Bq0LGjHit+ZwiC7uK2
         +IJbdFWyeFgP555ht1n5Ms9Bg6598Bmm6IMcST8xE367OU9zxmT/ySS/U4Bc4Kz+Hl2e
         KKoeSV/WpO61zXBQhYHrf+2xsQJzo6LbwUIiIBHL1/zPaasiMU4iZnIdpZ/IXSBWCZNE
         nf3Os+FbQSfcNfsE5T9prXGJq0D01/6o3ZNCkB+21BPhxYiagaenZBfAwA51cYpbmax7
         C31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792234999; x=1792839799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ny7KTMx+qld96qza0vCY0Dx/Bp+/LmW5iI7Izuhy18k=;
        b=ufPMGr9Xan2nsGN9AJKYDDD3ZB5UB5PWrdXt0blp0Y6mvwwLqWrzFa+mDtzXXOMGJf
         Lt1TI8JwnNQuQy4l+VXccd4Hs3w3jGQ1GQoVYBEwd594isV8hawHvptZFVRy/IyY/Sf9
         dJ/sMA40HUTPj8pMUkFcBpilW1tHkbiQSIcjk//ZmQ5pVB1aFLjShcichyst3Jve9li0
         MPTnUCS2wEroshUeMiipgUis14O9LFDA8NorBhAUfq8oc0lTXUdZNB2ls2AFtS/3pu+G
         lkUf5JsMGH8MyVIGqPGegNSm4lrz/l74BJvwmybmRqRtswWk1BFufbI/BL57Hq4bhdHU
         zaDw==
X-Forwarded-Encrypted: i=1; AKwUvByFVrMJwOfvbVvrEFUHLQmxdHWFyiOHCJkMAZyCXiCpvD8XSZoWD5xkCqaXceQ1ubRahnAiFzZP1yWtsvM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMsaLHMEq6W8WIQplS93Oljpn5OKn5dExLHRteMqb1WrtM9S17
	7N/ak5K9okTDPYo+vEhhXDzF4XmbxIqLbKQl0nAmB3uY3kiJBddpn39l
X-Gm-Gg: AYBFou3A6BcGVGy+QaZL3OI5VkE0ux19LtTJ2DK8LsjbEAUIqy0Iz0NFW/e3Mm3CsR+
	XsgU9ysyFL02xhHwMmWbCrHJbDpQBON8DRd9HZbDsMHebofrw7tFvP52bEAvR3W2+9KnvTS0Z8T
	+8tsj4BDFz+NHxjku8qxhydm/xHRqO85pux8b5f3UDWfy29bYFPfSHqAqwoSDhEghhO53Xp20QT
	NMfWrjK5gXdxIn+JwyygtNhj7pHqLvkVwV4JtBh1uRzXe3MZwNvzmZ08Hqsg99kMW0TAO+f/pTp
	NUEUpOYks/o9v+HG/bi0FoGNTQKO6hbbvcVJpSAjVDPpwM1kUR3uHQcf+kt3P9oH4dAfWUjaiNg
	efby1dw7rJxJrHoMwJ6Da6lTWB1Wc9Cm4ZDZRLdwd/QLSvFc719T8FPcRdhj9boL6ZxMTGNzwGO
	NQVA7XH+vptRqFdRGlRctbiriTGiOmxWdFxtKzjw6qRkpARoIjqm55sZRevX0I7Q9/lIrYbjWNY
	4T6amOLym2uUNUg7NtnNA==
X-Received: by 2002:a17:902:d512:b0:2e9:3c24:999 with SMTP id d9443c01a7336-2e9a6c0de51mr23081545ad.40.1792234999087;
        Sat, 17 Oct 2026 04:03:19 -0700 (PDT)
Received: from x1c ([2405:9800:b670:b64b:7c65:ff3e:80ba:b06])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e804dd9sm20559955ad.16.2026.10.17.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:03:18 -0700 (PDT)
From: Tharit Tangkijwanichakul <tharitt97@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	Tharit Tangkijwanichakul <tharitt97@gmail.com>
Subject: [PATCH 4/5] KVM: selftests: Reserve memslot 1 for the ucall MMIO address
Date: Sat, 17 Oct 2026 18:02:12 +0700
Message-ID: <20261017110213.46199-5-tharitt97@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261017110213.46199-1-tharitt97@gmail.com>
References: <20261017110213.46199-1-tharitt97@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Back the ucall MMIO address with a read-only region in slot 1
when KVM_CAP_READONLY_MEM is available. Writes still exit as
MMIO, while overlapping memslot creation is rejected.

Start test memslots at slot 2, leaving slot 1 reserved by
convention even when read-only memory is unsupported.

Signed-off-by: Tharit Tangkijwanichakul <tharitt97@gmail.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  |  2 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 759d604d44ce..4dbb2ef332fc 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -30,7 +30,7 @@
 
 #define KVM_DEV_PATH "/dev/kvm"
 #define KVM_MAX_VCPUS 512
-#define TEST_MEM_SLOT_BASE 1
+#define TEST_MEM_SLOT_BASE 2
 
 #define NSEC_PER_SEC 1000000000L
 
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 9ddc047d5c27..73e28814a226 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -20,6 +20,7 @@
 #include <linux/kernel.h>
 
 #define KVM_UTIL_MIN_PFN	2
+#define KVM_UCALL_MEMSLOT	1
 
 u32 kvm_random_seed;
 struct kvm_random_state kvm_rng;
@@ -492,6 +493,7 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 	struct userspace_mem_region *slot0;
 	struct kvm_vm *vm;
 	int i, flags;
+	gpa_t mmio_gpa;
 
 	kvm_set_files_rlimit(nr_runnable_vcpus);
 
@@ -514,14 +516,19 @@ struct kvm_vm *__vm_create(struct vm_shape shape, u32 nr_runnable_vcpus,
 
 	kvm_vm_elf_load(vm, program_invocation_name);
 
-	/*
-	 * TODO: Add proper defines to protect the library's memslots, and then
-	 * carve out memslot1 for the ucall MMIO address.  KVM treats writes to
-	 * read-only memslots as MMIO, and creating a read-only memslot for the
-	 * MMIO region would prevent silently clobbering the MMIO region.
+	/* KVM treats writes to read-only memslots as MMIO, and creating
+	 * a read-only memslot for the MMIO region would prevent silently
+	 * clobbering the MMIO region.
 	 */
 	slot0 = memslot2region(vm, 0);
-	ucall_init(vm, slot0->region.guest_phys_addr + slot0->region.memory_size);
+	mmio_gpa = slot0->region.guest_phys_addr + slot0->region.memory_size;
+	ucall_init(vm, mmio_gpa);
+
+	if (vm_check_cap(vm, KVM_CAP_READONLY_MEM))
+		vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+					    mmio_gpa, KVM_UCALL_MEMSLOT,
+					    vm_adjust_num_guest_pages(vm->mode, 1),
+					    KVM_MEM_READONLY);
 
 	if (kvm_random_seed != last_kvm_seed)
 		kvm_seed_rng(kvm_random_seed);
-- 
2.53.0

