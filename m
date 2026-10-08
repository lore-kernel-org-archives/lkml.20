Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A3C492E53
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791466100; cv=none; b=hoJVo5PJcFBwnouWk8HuRUih2BzsEkSSv+bfaZH74Z0sOGO4eysV3vmsezw1hnspAWFljVK8MnprEqW0516JqymRU5ag2ou5BY2WWZqEwdBzye23jTW8+rNHIV1J7qwKYs7uOlP6+fpPZpJreOgmXeurJfrayyixM9WbJXurLGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791466100; c=relaxed/simple;
	bh=3R/PP0BkijAtN5s/RgbkARHKRw+0zrd1A71c6+B2xBY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RUudluBu0E5PiXSQv3Dcwi59bqkLf631HylRc3C5kKqh+9qZt9Jz5vxiTgDzvBMLOTJyt/TYgdYUkei4LVJTY3YLUCa/rR2XVc+O/gJy01WASHgyz4YERF/OHuJrH6wFBX4qcwRJSudk1yxxdRIUFf+Q3YBiGdN66abQaxm+OzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oYh63opF; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYh63opF"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39533bb224cso6229398a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791466098; x=1792070898; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oVijSUeLpdQWnKER+UijEtgCAKGDAc7/NKc7zbp415Q=;
        b=oYh63opFo16WBrejUWo6Ub1+Zgybftzl1v+Be8vZ7r0/Da40o9ItevEjhHVUJo9XvE
         vaBF0sqD0lLjrWtpwDLVFsa+nNy5T+sokMdBW9jnObYUpN/GFbyo37ATPx/OKKi9xgfj
         +JjFaCAuYv5D0jz0gKrvQRb8zgtpAnlrue/TRzlQZiIc5JDfx8XwqEqqBvIWmsEMHii8
         5qLhrhQRSj7qrpeS9oHVWCbN+RrBE0o7ZAld40sples6HQGN6ihDVmKr9N1+SKB3C9VG
         MGBxkQWJAeSzEeRwPqBsJLvm04PYvQwRs21fm8woiuiyhVWJBBaD0u77jc0+CizHZ5y1
         UC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791466098; x=1792070898;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVijSUeLpdQWnKER+UijEtgCAKGDAc7/NKc7zbp415Q=;
        b=DJ9vG85hIWl+vM2W4ZPNa8pgY0P5slR1NH7R/lOINGIZvt3VJPpDI91M4uH6/fK8JF
         O3UczhKH+qDSqA6JKDWpc7zbug2gE/1/nqduSmdl4Kp2c2Y0xvj8uV3SZO65/OyhekMM
         36T/ipAUUrCgFylKVHbyVja2uWssrWGAGji3PXctSgSbT02/P7SooiZzQaZvg2XRnVwR
         W+57kslNQSNv1tAjZ/L785d1BHGgHZPwseHOfJHN1lyHhSNzE/wTyzuhp4ehmrYhVhZ3
         i7ylcosvprjciHND1aAEheH678QNjQ/ufk9j0m9NgYMlkHf9p0jot0CZRss7sYfCvQbl
         IHNA==
X-Forwarded-Encrypted: i=1; AKwUvBy0VwJuXEr1VGD8OSrCSQoFx/+V5FmWppaELgL9w4d+MS+RZ0PqLMJmpeEdVrBbtQpLYtC1ox8Yr+d+v/0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJb1IZe9Gv3fwX8Un6rVgSCqW0wrkUQyLZkDuwren/b1mx9IRS8
	MPDdR8KjszmUsOqAtnl4PnxzOw6CjG5X6aaK6fJX5pDx/AeoU0VApLlT8waznT0scqX1647cfCM
	l8lG0owc3AoaPTg==
X-Received: from pgbd22-n2.prod.google.com ([2002:a05:6a02:64d6:20b0:cc7:ec41:d571])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:578c:b0:39d:efa9:cd1a with SMTP id 98e67ed59e1d1-3a8a04d48a8mr4379961a91.4.1791466098010;
 Thu, 08 Oct 2026 06:28:18 -0700 (PDT)
Date: Thu,  8 Oct 2026 13:28:13 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261008132813.1966023-1-dmatlack@google.com>
Subject: [PATCH] selftests/liveupdate: Prefer KVM and HVF over TCG in vmtest.sh
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Cc: Jordan Richards <jordanrichards@google.com>, Mike Rapoport <rppt@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Pass the -accel options to QEMU in the order KVM, HVF, TCG, so that
vmtest.sh prefers to use KVM and HVF over TCG when they are available.

QEMU uses the first accelerator in the list that initializes, and TCG
always initializes, so the tests currently always run under TCG, even
though the commit that added vmtest.sh describes "automatic accelerator
detection (KVM, HVF, or TCG)".

Fixes: 89dd1421c554 ("selftests/liveupdate: add end to end test infrastructure and scripts")
Signed-off-by: David Matlack <dmatlack@google.com>
---
Tested by running run-vmtests.sh and then observed that arm64 correctly
fell back to using TCG after trying to use KVM and HVF, and that x86
reported no warnings.

arm64:
  qemu-system-aarch64: -accel kvm: invalid accelerator kvm
  qemu-system-aarch64: -accel hvf: invalid accelerator hvf
  qemu-system-aarch64: falling back to tcg

x86:
  (not warnings)

 tools/testing/selftests/liveupdate/vmtest.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/vmtest.sh b/tools/testing/selftests/liveupdate/vmtest.sh
index 64fd2ab55b76..69beda6c961d 100755
--- a/tools/testing/selftests/liveupdate/vmtest.sh
+++ b/tools/testing/selftests/liveupdate/vmtest.sh
@@ -180,7 +180,7 @@ function run_qemu() {
 	echo "# Serial Log: $serial"
 	timeout 30s \
 	$qemu_cmd -m 1G -smp 2 -no-reboot -nographic -nodefaults \
-		  -accel tcg -accel hvf -accel kvm \
+		  -accel kvm -accel hvf -accel tcg \
 		  -serial file:"$serial" \
 		  -append "$cmdline" \
 		  -kernel "$kernel_path" \

base-commit: 80cf37169daef112b6bea9ae7d9808355a045475
-- 
2.56.0.360.g66cac248cb-goog

