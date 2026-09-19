Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289992EEE63
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789779986; cv=none; b=egj1NWRJGhlNOQk/rNoaAy7jX8NpS41apKEW1VaMZTpIwEfyxOGe+AQHSDH8pPfcXImO6yq0sRxBgAWB0UOgFCFeAble1YSw0Koeu1571D4tz+D6KorIqJoqezFc+IEqpIVi7ovGoBObiiKo11Z5RXzaGPBssA/HF9U9E1bFhYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789779986; c=relaxed/simple;
	bh=UgK6zDG18uoS3J6tXdJQ0E5iNtWkMbqUJLbK7n7U0Yg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ORv1qDjOonnHlu7cSSvEDzY5XkRh7HmeZ1GJU3wy6TzvJZ3PZ0Pjd1wBKYfgpVYzOpYPzqZH7USQW+qnRjFp7E3JUSIR6jZyrFdjQBTCD15e8asIDH1nZHKamuFSKQIuswcE+FDqgIKzuL0EgAjBUwFSEAZBZXNXCjw3JCGC9ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IOzO7w+z; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IOzO7w+z"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300825so13861925ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789779976; x=1790384776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6LTqB6a9B9UKh0x9TDelgFRYjmXFU1lhcgKSzwgGYlw=;
        b=IOzO7w+zMUQPuZ6R16Syig5vMisEhJB4FDEhV3jJh+WkZ2eob5m4pOMlWeLWBZ1aDx
         mQRSjzf/mLgOOLWtyXgMmS05xH1p99gXkESLbaupFnfGa+X7qhLNaRh5VbsbE0EzQ0ch
         YttZHvEeEVI8YyH4KTKuFMLXhqzH3C1UDwn8tn+SW5gkO/Em3+fR58QkNC6vqTkkS8X2
         9XL59bHcIoo8/uhzOXRDOjazj2vq+UzN+B2iCGQsMMEp+uw1+qY9Wkm3gocL7Y1D4L0C
         aNm7fJDzW08m6bJ50KfrUUf5bgSJLTPX1w+YtUh7aO2qegr7GpOgTRLY9nB9OcUqiXUb
         eJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789779976; x=1790384776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6LTqB6a9B9UKh0x9TDelgFRYjmXFU1lhcgKSzwgGYlw=;
        b=XgQo9bBk6n2a9ZjL0KxBuXluGIRCEhjGbF9qEKwKGGN54DjGPKApa4XXnxq4WYtppb
         z3Fq3X33mW8ISQEmz6WoOOv3NXc30HqdowpfqHSrhYjDzvDcK7ynec62EXWO/iCjRs9l
         ZTnwKBqZGuf/Ij2hQ3N5aF4NDJHLm0vOp85ucCXVRspeEvDpquaC5ZS2EiOoIfMfDlc2
         3KYwqV3iZ7s6Stc0a1wGRoNSmppBi0MMxbgN8ykXfonAf1HJ6b+xTwgfbSW3PlLxPCUd
         71n8Y7KgR75mgPTnjsjmVkgTDOEoc2NBwmP/IUvZKsunBElDh4OJvRElW60lEMfSZrCv
         Ri9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxbgmKfqlwAPILNQzNNDL6F+f1Er3L9FtJ51qsa72wsnaWLglsJYX+L4qssAyW1i+2Kc/aZ150dmtTrdLs=@vger.kernel.org
X-Gm-Message-State: AFuF++meoX4Q87VzulqJa4RWdMKYb0UTO/a4Jo9w7vlMUhtFuNcZfvPW
	7ZrSsgzF9yGTuRiX8f1EMkm71zDO1QXJslU+eX+i+bcRdyt4ji4zvP1wQBR5iHPAryo=
X-Gm-Gg: AYBFou3vIdEdGL4OTvybY1ul79UtR2/chsRwy1YHb4FODq0rhIGIk2KUm/IfSVyk+Y6
	FIRzILSJGYH1QWTSk5XRjXq/e/6NCQBT4eCsUes9zf71jjUCdeReKes9jLN6eAJ9Sen0YMXsFIC
	LUJz2xfREK1j9EpA9PXPvXNxvl654ke1J2Ln+DQA/q7Aepnq4Eg6GaQdKuwfXBrC7kCwSOdFY89
	I5FQrPFLEJDI2PdgKBct1qPVfj0GcGiJGfhEOE7KNfxMWPjmag8gxEdCA6sg31efbSQluJ99P5p
	rGTRW9HA3qmodWBqsPQMexXF7JRPt7BUuWanp4yCdxkYrxbPNyYqoIPaYEhyRg48ZQ0i1Sl6o2B
	PFkXaa+fpXnAI8j48ZvjQEypwHm4DRvBHo3m199wViyptPri8uh92LgDEBUU/nOy5+rsO0PHl6j
	HarIMEEd92AOSqKbRfpR8tjJ5/xkxBmC5lKt3Z3/47G0IfIii/WLVnwEIv3eTO1BAfN8IxLVfMP
	TkOt9vPgI8wi8pm9u0kc6hQ/mqGdLfX4jXykzQUJKayBJU=
X-Received: by 2002:a17:903:2acc:b0:2dd:c132:dc27 with SMTP id d9443c01a7336-2ddc132dc8bmr18159265ad.47.1789779975721;
        Fri, 18 Sep 2026 18:06:15 -0700 (PDT)
Received: from localhost.localdomain ([2605:bc80:3010:503:f816:3eff:fe99:6bb3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df3140fd2fsm1651805ad.61.2026.09.18.18.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 18:06:15 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: paulmck@kernel.org,
	rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: [PATCH v3] rcutorture: kvm-again.sh: Fix re-run failure on ppc64
Date: Sat, 19 Sep 2026 01:06:06 +0000
Message-Id: <20260919010606.2916865-1-zhouzhouyi@gmail.com>
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
   the re-run on that architecture.  Drop vmlinux from the unconditional
   list, and instead conditionally delete it only when the boot image
   basename is not vmlinux.

In addition, identify qemu_binary before the copy step so that on
non-PowerPC systems (where vmlinux is not the boot image) the vmlinux
file can be removed immediately after the run directory is copied,
saving storage before any tests run.  This also eliminates the
per-iteration re-computation of qemu_binary and boot_image inside
the qemu-cmd transform loop.

Tested on a local x86_64 machine and on a PPC VM of the Open Source Lab
of Oregon State University.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Changes in v3:
 - Identify qemu_binary and boot_image earlier, before the copy step,
   so that vmlinux can be removed right after copying the run directory
   on non-PowerPC systems, saving storage.  This also eliminates the
   per-iteration re-computation of qemu_binary and boot_image inside
   the qemu-cmd transform loop.
Suggested-by: Paul E. McKenney <paulmck@kernel.org>
---
 tools/testing/selftests/rcutorture/bin/kvm-again.sh | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/rcutorture/bin/kvm-again.sh b/tools/testing/selftests/rcutorture/bin/kvm-again.sh
index b5239b52cb5d..9060b3dc8926 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-again.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-again.sh
@@ -180,6 +180,9 @@ fi
 
 echo ---- Re-run results directory: $rundir
 
+qemu_binary="$(find "$oldrun" -maxdepth 2 -name 'qemu-cmd' -type f 2>/dev/null | head -1 | xargs -r grep -v '^#' 2>/dev/null | awk 'NF { print $1; exit }')"
+boot_image="`identify_boot_image "$qemu_binary"`"
+
 if test "$oldrun" != "$rundir"
 then
 	# Copy old run directory tree over and adjust.
@@ -189,7 +192,7 @@ then
 		echo "Cannot copy from $oldrun to $rundir."
 		usage
 	fi
-	rm -f "$rundir"/*/{console.log,console.log.diags,qemu_pid,qemu-pid,qemu-retval,Warnings,kvm-test-1-run.sh.out,kvm-test-1-run-qemu.sh.out,vmlinux} "$rundir"/log
+	rm -f "$rundir"/*/{console.log,console.log.diags,qemu_pid,qemu-pid,qemu-retval,Warnings,kvm-test-1-run.sh.out,kvm-test-1-run-qemu.sh.out} "$rundir"/log
 	touch "$rundir/log"
 	echo $scriptname $args | tee -a "$rundir/log"
 	echo $oldrun > "$rundir/re-run"
@@ -197,6 +200,10 @@ then
 	then
 		$arg_link "$oldrun/../../bin" "$rundir/../.."
 	fi
+	if test "`basename "$boot_image"`" != vmlinux
+	then
+		rm -f "$rundir"/*/vmlinux
+	fi
 else
 	# Check for a run having already happened.
 	find "$rundir" -name console.log -print > $T/oldrun-console.log
@@ -217,7 +224,7 @@ do
 	qemu_cmd_dir="`dirname "$i"`"
 	kernel_dir="`echo $qemu_cmd_dir | sed -e 's/\.[0-9]\+$//'`"
 	jitter_dir="`dirname "$kernel_dir"`"
-	kvm-transform.sh "$kernel_dir/bzImage" "$qemu_cmd_dir/console.log" "$jitter_dir" "$dur" "$bootargs" < $T/qemu-cmd > $i
+	kvm-transform.sh "$kernel_dir/`basename $boot_image`" "$qemu_cmd_dir/console.log" "$jitter_dir" "$dur" "$bootargs" < $T/qemu-cmd > $i
 	if test -n "$arg_remote"
 	then
 		echo "# TORTURE_KCONFIG_GDB_ARG=''" >> $i
-- 
2.43.0

