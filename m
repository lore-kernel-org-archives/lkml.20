Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A904779A8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461936; cv=none; b=f62TcTI3VzTsnJHUBZBQoC5deYru07uK5oJqQyUVk9+8wxVepuZsYUMO1yxRvRPHU3kgpe+1OJuuKnxQMxt4vDgsGLwHshINWIG+vfcn3XploDkE6r2CJeLQsjKGeSaNzJpMslJ0/pPXkxmV6D5P+ovKhcJ2xBqbZoB727xYyUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461936; c=relaxed/simple;
	bh=pBVQUYDEIa449zGkcGqUxCzep0SQppBBLbV02Ru7awY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JY+YlrIrBDwU3ipIUpyN7tGIHg9d/PX7zruwHMDyr7eEXwq4+SL/N14DWzARJLC9p7zvHkVuF9i2R/9WW4hQndEBULkyKG2jdc+c/t3YS6HcOnRKdd/PCcQtBKK+mNZ0PPHqeaMwVYZJCl6Iqwerck7x4uGh95fh1CGMcZ8P7z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iK82ENZw; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iK82ENZw"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e25187so2249691b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461934; x=1790066734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+zi0InBQk+d9zqvUf20Lgt1upBg3iykRVf2Yi8TjmXE=;
        b=iK82ENZw3HG1bf7WPkGF1tVcn1yqqCAjazQmDOUhF+1SIeVrlaBY+JrbHIoHqRFPzq
         C3gZkWINHxp++mqMyztuZmUAu63fS/eHQ175bTKZGshhy6FvEJ4mmTYyMvb586oORSZl
         OrCfZ3d5ekfatIeQfLrqpdy/KeDBss+vlvsNOdjyF6dVVHd7VaWJl4e4qjyJotIEsT/E
         84142cLZCsSft4F6nEjUliDQ6S9qwwbsp8vzBFFH6SzbJ8BaPBTdfLrnwPrchyAdGKPe
         GOPHHuwD7tCeIqXUNG0jSc32Huk8PqFP9P6Hh/r6DfOMYD2vX9R7GB/sgfYXOiXniO2c
         5OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461934; x=1790066734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+zi0InBQk+d9zqvUf20Lgt1upBg3iykRVf2Yi8TjmXE=;
        b=P1k9o3Pzq/MHKjNdnve6gZc0jEj94eF/XXL0UasAAdpjopWw2IPU5Flb5ke0B9lK6l
         S9Gbet9HsNkkWL7+UbRLDOfAkz/2gxuKTDAw0aHUkADO5wqjwEq1TO5YZ+wchO6j9C/x
         noril0+RdsjFulA2i/iKe3wFrbzpv2ZV5M9sb6m6LgRhr4cuIX8Pk1q0psCHqeNqcBF+
         kn/j9WcXqn7Z2sb3CqAJpn+PM8CB6aWorp6JHMQNbnuDje3jPc4NQU0rsaMrQwNoF5lT
         SGkjdqWvLnkSD3v3n5vPUab34uKJwDFiq0Mh17eE+2F1EvQpViKbOuFKIluBgUEdfYJA
         2kOA==
X-Forwarded-Encrypted: i=1; AKwUvBwgJYXZu1dOnzzX6uH0shybobPy51kZUTNo9B9dWIy71MRGg2ZqBcKBQNxRdOaYYE0WqY7+1G6yB8C6wO8=@vger.kernel.org
X-Gm-Message-State: AFuF++nvzaIQtE0m+SsjasR4mjoB8I/5w1yzQWktKregXhywLGTIRUfi
	r3KUsaJKp+Bv/EElH+IEwDJgk4pmbZ7Cpa4Y3sbT8+ReOvVdfLDHs4oS
X-Gm-Gg: AYBFou2YvE+Qug3XrhhP0nQ8MqHJhn10G9+xwUOccb+AhvZEemvOZPGNe/6vxsDdjrz
	CeL3KWx4zRFEiKLMkY7VpSFBWBpEOWPEDX3UiqnBgLHpmTuCYx2ckGJdxPvk6IQk0g/Nkr1wZdT
	VU9ndVVhX18v3oRTnUogB/ZsxRTK2k3UwaH9KVLNSrYUcWO0BEp/X6rtTspGIeXukT5rDgedC8y
	MNPtWEjldeXouinbD6cz4kPcCfU/wbkhgh0sAiL6icY11NYl8/vlIEgYA2wJI3splO9+1XIcd42
	AsCAbxR+OlnjyxDFFybKjCOXp3yJ3s32lfHgWiO9UEwhxcNXK9fogb8ZbE7KAFcpggAF0XQDeY2
	SaDxFfAEkymgSHXUi5RCZs/nf2QT2FzjabgZhjFSkt+MqcbCr5QehK6e/UwlcsQHVUduatjClvM
	JO3PTBvkGHba3gViojMZ1OBYcCGwt4xcPeFJJegG9pREBC0EWCMUrpWwKv+RQxhZbDpoqZUfvxO
	nDTow7YmVvrdUvNdaqWeHa4a4aivmVz9lqTABlBxWuqVfs=
X-Received: by 2002:a05:6a00:3e0c:b0:86a:881e:ea38 with SMTP id d2e1a72fcca58-86f858ee0f6mr16380664b3a.12.1789461934301;
        Tue, 15 Sep 2026 01:45:34 -0700 (PDT)
Received: from localhost.localdomain ([2605:bc80:3010:503:f816:3eff:fe99:6bb3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b292bd2fcsm5752803b3a.30.2026.09.15.01.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:33 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: paulmck@kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH] rcutorture: kvm-again.sh: Fix re-run failure on ppc64
Date: Tue, 15 Sep 2026 08:45:28 +0000
Message-Id: <20260915084528.3707627-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Discovered in the Open Source Lab of Oregon State University when running
torture.sh on a ppc64le VM.  Two bugs were exposed:

1. The kvm-transform.sh call hard-coded "bzImage" as the kernel image
   name.  On ppc64, the boot image is vmlinux, not bzImage, so the
   re-run failed to find the image.  Fix this by extracting the QEMU
   binary from the qemu-cmd file and passing it to identify_boot_image()
   to obtain the correct architecture-specific image name, the same way
   kvm.sh already does.

2. The rm -f invocation on re-run listed vmlinux among the files to
   delete.  On ppc64 vmlinux is the boot image, so deleting it broke
   the re-run on that architecture.  Drop vmlinux from the list.

Tested on a local x86_64 machine and on a PPC VM of the Open Source Lab
of Oregon State University.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
 tools/testing/selftests/rcutorture/bin/kvm-again.sh | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/kvm-again.sh b/tools/testing/selftests/rcutorture/bin/kvm-again.sh
index b5239b52cb5d..cacc9f2b230d 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-again.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-again.sh
@@ -189,7 +189,7 @@ then
 		echo "Cannot copy from $oldrun to $rundir."
 		usage
 	fi
-	rm -f "$rundir"/*/{console.log,console.log.diags,qemu_pid,qemu-pid,qemu-retval,Warnings,kvm-test-1-run.sh.out,kvm-test-1-run-qemu.sh.out,vmlinux} "$rundir"/log
+	rm -f "$rundir"/*/{console.log,console.log.diags,qemu_pid,qemu-pid,qemu-retval,Warnings,kvm-test-1-run.sh.out,kvm-test-1-run-qemu.sh.out} "$rundir"/log
 	touch "$rundir/log"
 	echo $scriptname $args | tee -a "$rundir/log"
 	echo $oldrun > "$rundir/re-run"
@@ -217,7 +217,10 @@ do
 	qemu_cmd_dir="`dirname "$i"`"
 	kernel_dir="`echo $qemu_cmd_dir | sed -e 's/\.[0-9]\+$//'`"
 	jitter_dir="`dirname "$kernel_dir"`"
-	kvm-transform.sh "$kernel_dir/bzImage" "$qemu_cmd_dir/console.log" "$jitter_dir" "$dur" "$bootargs" < $T/qemu-cmd > $i
+	qemu_binary="`grep -v '^#' $T/qemu-cmd | awk 'NF { print $1; exit }'`"
+
+	boot_image="`identify_boot_image "$qemu_binary"`"
+	kvm-transform.sh "$kernel_dir/`basename $boot_image`" "$qemu_cmd_dir/console.log" "$jitter_dir" "$dur" "$bootargs" < $T/qemu-cmd > $i
 	if test -n "$arg_remote"
 	then
 		echo "# TORTURE_KCONFIG_GDB_ARG=''" >> $i
--
2.43.0
